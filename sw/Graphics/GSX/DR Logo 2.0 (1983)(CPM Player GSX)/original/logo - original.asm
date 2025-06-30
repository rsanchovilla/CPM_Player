; Disassembly of the file "E:\Tmp\cpm\pcw\logo.com"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Tuesday, 19 of March 2024 at 12:57 PM
; 
0100 c9        ret   		CP/M 3 .COM header  

0101 00b9      DW      $b900	real .COM len (from $0200 to $0200+$b900=bb00. 
                                               bb00 onwards are RSX
0103 c9        ret     		preinit code. None
0104 00        nop     
0105 00        nop     
0106 00        nop     
0107 00        nop     
0108 00        nop     
0109 00        nop     
010a 00        nop     
010b 00        nop     
010c 00        nop     
010d 00        nop   	  
010e 00        nop     
010f 01	       DB      1	Number of RSX attached to .COM

0110 00ba      DW      $ba00    RSX code starts at ba00 from file, bb00 from mem
0112 f007      DW      $07f0    code len
0113 07        
0114 00        
0115 00        
0116 4c494f53  DS      "LIOS"   name of RSX: Logo I/O System
011a 20202020      jr      nz,$013e
011e 00        nop     
011f 00        nop     

0200 c3a486    jp      $86a4
0203 cd71af    call    $af71
0206 210000    ld      hl,$0000
0209 22a38c    ld      ($8ca3),hl
020c 210000    ld      hl,$0000
020f 22bf8c    ld      ($8cbf),hl
0212 22bb8c    ld      ($8cbb),hl
0215 22b78c    ld      ($8cb7),hl
0218 216d8c    ld      hl,$8c6d
021b e5        push    hl
021c cd017c    call    $7c01
021f d1        pop     de
0220 44        ld      b,h
0221 4d        ld      c,l
0222 7c        ld      a,h
0223 b5        or      l
0224 281f      jr      z,$0245
0226 210000    ld      hl,$0000
0229 229f8c    ld      ($8c9f),hl
022c 220890    ld      ($9008),hl
022f 60        ld      h,b
0230 69        ld      l,c
0231 111700    ld      de,$0017
0234 cd3c85    call    $853c
0237 2806      jr      z,$023f
0239 cd8b3c    call    $3c8b
023c cdd53d    call    $3dd5
023f cd443c    call    $3c44
0242 cd7d3c    call    $3c7d
0245 cd8b3c    call    $3c8b
0248 cd4e01    call    $014e
024b 18b9      jr      $0206
024d c9        ret     

024e cda98b    call    $8ba9
0251 210000    ld      hl,$0000
0254 22a28f    ld      ($8fa2),hl
0257 cd6237    call    $3762
025a 21798c    ld      hl,$8c79
025d e5        push    hl
025e cd017c    call    $7c01
0261 d1        pop     de
0262 2806      jr      z,$026a
0264 cde601    call    $01e6
0267 c38453    jp      $5384
026a 213f00    ld      hl,$003f
026d e5        push    hl
026e cddc28    call    $28dc
0271 21ae01    ld      hl,$01ae
0274 e3        ex      (sp),hl
0275 cd242d    call    $2d24
0278 d1        pop     de
0279 2805      jr      z,$0280
027b cdbf33    call    $33bf
027e 182d      jr      $02ad
0280 21b101    ld      hl,$01b1
0283 e5        push    hl
0284 cd242d    call    $2d24
0287 d1        pop     de
0288 2810      jr      z,$029a
028a cd371f    call    $1f37
028d cd406c    call    $6c40
0290 210000    ld      hl,$0000
0293 e5        push    hl
0294 cd6e77    call    $776e
0297 d1        pop     de
0298 1813      jr      $02ad
029a 21b501    ld      hl,$01b5
029d e5        push    hl
029e cd242d    call    $2d24
02a1 d1        pop     de
02a2 2006      jr      nz,$02aa
02a4 210000    ld      hl,$0000
02a7 22d28c    ld      ($8cd2),hl
02aa cdff4c    call    $4cff
02ad c9        ret     

02ae 74        ld      (hl),h
02af 6f        ld      l,a
02b0 00        nop     
02b1 62        ld      h,d
02b2 79        ld      a,c
02b3 65        ld      h,l
02b4 00        nop     
02b5 65        ld      h,l
02b6 64        ld      h,h
02b7 00        nop     
02b8 cda04b    call    $4ba0
02bb c0        ret     nz

02bc 2aee8f    ld      hl,($8fee)
02bf 22aa8f    ld      ($8faa),hl
02c2 cdf886    call    $86f8
02c5 22f08f    ld      ($8ff0),hl
02c8 cd0b52    call    $520b
02cb 2ae68f    ld      hl,($8fe6)
02ce 22e48f    ld      ($8fe4),hl
02d1 cda04b    call    $4ba0
02d4 c0        ret     nz

02d5 cd834b    call    $4b83
02d8 2803      jr      z,$02dd
02da c31d51    jp      $511d
02dd 2af08f    ld      hl,($8ff0)
02e0 22f48f    ld      ($8ff4),hl
02e3 c3b654    jp      $54b6
02e6 cda98b    call    $8ba9
02e9 cdc84c    call    $4cc8
02ec 212c02    ld      hl,$022c
02ef e5        push    hl
02f0 cde06b    call    $6be0
02f3 d1        pop     de
02f4 cdb549    call    $49b5
02f7 210200    ld      hl,$0002
02fa e5        push    hl
02fb cdde41    call    $41de
02fe 2ac28f    ld      hl,($8fc2)
0301 e3        ex      (sp),hl
0302 cd6341    call    $4163
0305 d1        pop     de
0306 21698c    ld      hl,$8c69
0309 e5        push    hl
030a cd017c    call    $7c01
030d d1        pop     de
030e 200a      jr      nz,$031a
0310 cd8443    call    $4384
0313 cd4e01    call    $014e
0316 18fb      jr      $0313
0318 18ec      jr      $0306
031a 2ac28f    ld      hl,($8fc2)
031d e5        push    hl
031e cd455a    call    $5a45
0321 210300    ld      hl,$0003
0324 e3        ex      (sp),hl
0325 cdf441    call    $41f4
0328 d1        pop     de
0329 c3c549    jp      $49c5
032c 70        ld      (hl),b
032d 61        ld      h,c
032e 75        ld      (hl),l
032f 73        ld      (hl),e
0330 69        ld      l,c
0331 6e        ld      l,(hl)
0332 67        ld      h,a
0333 2e2e      ld      l,$2e
0335 2e00      ld      l,$00
0337 cda98b    call    $8ba9
033a cdcf03    call    $03cf
033d cd5c4c    call    $4c5c
0340 44        ld      b,h
0341 4d        ld      c,l
0342 110000    ld      de,$0000
0345 eb        ex      de,hl
0346 cd6c85    call    $856c
0349 2803      jr      z,$034e
034b cd3b55    call    $553b
034e cd5f4a    call    $4a5f
0351 60        ld      h,b
0352 69        ld      l,c
0353 0b        dec     bc
0354 7c        ld      a,h
0355 b5        or      l
0356 2805      jr      z,$035d
0358 cdbf50    call    $50bf
035b 18f4      jr      $0351
035d c37c4b    jp      $4b7c
0360 cd324a    call    $4a32
0363 c36602    jp      $0266
0366 2abe8f    ld      hl,($8fbe)
0369 e5        push    hl
036a cd6e4c    call    $4c6e
036d d1        pop     de
036e c9        ret     

036f cd5f4a    call    $4a5f
0372 c3e850    jp      $50e8
0375 cdf54a    call    $4af5
0378 2af48f    ld      hl,($8ff4)
037b eb        ex      de,hl
037c 2ab88f    ld      hl,($8fb8)
037f cd3c85    call    $853c
0382 2805      jr      z,$0389
0384 2aba8f    ld      hl,($8fba)
0387 1803      jr      $038c
0389 2ab88f    ld      hl,($8fb8)
038c 22f48f    ld      ($8ff4),hl
038f c9        ret     

0390 2aba8f    ld      hl,($8fba)
0393 e5        push    hl
0394 cda202    call    $02a2
0397 d1        pop     de
0398 c9        ret     

0399 2ab88f    ld      hl,($8fb8)
039c e5        push    hl
039d cda202    call    $02a2
03a0 d1        pop     de
03a1 c9        ret     

03a2 cda98b    call    $8ba9
03a5 210100    ld      hl,$0001
03a8 e5        push    hl
03a9 cdd249    call    $49d2
03ac d1        pop     de
03ad 44        ld      b,h
03ae 4d        ld      c,l
03af cdf54a    call    $4af5
03b2 cd2e43    call    $432e
03b5 210800    ld      hl,$0008
03b8 39        add     hl,sp
03b9 5e        ld      e,(hl)
03ba 23        inc     hl
03bb 56        ld      d,(hl)
03bc d5        push    de
03bd c5        push    bc
03be cdc602    call    $02c6
03c1 d1        pop     de
03c2 d1        pop     de
03c3 c33743    jp      $4337
03c6 cda98b    call    $8ba9
03c9 210800    ld      hl,$0008
03cc 39        add     hl,sp
03cd 4e        ld      c,(hl)
03ce 23        inc     hl
03cf 46        ld      b,(hl)
03d0 c5        push    bc
03d1 cdee49    call    $49ee
03d4 d1        pop     de
03d5 c0        ret     nz

03d6 cdf54a    call    $4af5
03d9 210a00    ld      hl,$000a
03dc 39        add     hl,sp
03dd 5e        ld      e,(hl)
03de 23        inc     hl
03df 56        ld      d,(hl)
03e0 eb        ex      de,hl
03e1 227690    ld      ($9076),hl
03e4 e5        push    hl
03e5 2af48f    ld      hl,($8ff4)
03e8 d1        pop     de
03e9 cd3c85    call    $853c
03ec 2808      jr      z,$03f6
03ee 2a7690    ld      hl,($9076)
03f1 e5        push    hl
03f2 cdc941    call    $41c9
03f5 d1        pop     de
03f6 cd7266    call    $6672
03f9 2a7690    ld      hl,($9076)
03fc e5        push    hl
03fd 60        ld      h,b
03fe 69        ld      l,c
03ff 2b        dec     hl
0400 e5        push    hl
0401 cdc602    call    $02c6
0404 d1        pop     de
0405 d1        pop     de
0406 c9        ret     

0407 cda04b    call    $4ba0
040a 2003      jr      nz,$040f
040c cd324a    call    $4a32
040f 2ac28f    ld      hl,($8fc2)
0412 e5        push    hl
0413 cd6e4c    call    $4c6e
0416 d1        pop     de
0417 c9        ret     

0418 cdf54a    call    $4af5
041b 2ab88f    ld      hl,($8fb8)
041e e5        push    hl
041f 2af48f    ld      hl,($8ff4)
0422 e5        push    hl
0423 cd4603    call    $0346
0426 d1        pop     de
0427 d1        pop     de
0428 c9        ret     

0429 cda98b    call    $8ba9
042c cda04b    call    $4ba0
042f 2011      jr      nz,$0442
0431 2aee8f    ld      hl,($8fee)
0434 cdf886    call    $86f8
0437 e5        push    hl
0438 cd0d45    call    $450d
043b d1        pop     de
043c 2004      jr      nz,$0442
043e 210000    ld      hl,$0000
0441 c9        ret     

0442 210100    ld      hl,$0001
0445 c9        ret     

0446 cda98b    call    $8ba9
0449 cd2903    call    $0329
044c 2803      jr      z,$0451
044e cddd57    call    $57dd
0451 cd5f4a    call    $4a5f
0454 210800    ld      hl,$0008
0457 39        add     hl,sp
0458 5e        ld      e,(hl)
0459 23        inc     hl
045a 56        ld      d,(hl)
045b 210a00    ld      hl,$000a
045e 39        add     hl,sp
045f 7e        ld      a,(hl)
0460 23        inc     hl
0461 66        ld      h,(hl)
0462 6f        ld      l,a
0463 cd3c85    call    $853c
0466 280b      jr      z,$0473
0468 cde850    call    $50e8
046b cd2903    call    $0329
046e c0        ret     nz

046f cd1d51    call    $511d
0472 c9        ret     

0473 cd7c4b    call    $4b7c
0476 cd2903    call    $0329
0479 c0        ret     nz

047a cd5f4a    call    $4a5f
047d cde850    call    $50e8
0480 c9        ret     

0481 cdbd4a    call    $4abd
0484 cda77c    call    $7ca7
0487 cd2388    call    $8823
048a cda08b    call    $8ba0
048d 218d8c    ld      hl,$8c8d
0490 cd587c    call    $7c58
0493 cd417f    call    $7f41
0496 cda77c    call    $7ca7
0499 cdb84b    call    $4bb8
049c eb        ex      de,hl
049d cda08b    call    $8ba0
04a0 c9        ret     

04a1 cdbd4a    call    $4abd
04a4 cda77c    call    $7ca7
04a7 cd697a    call    $7a69
04aa cda08b    call    $8ba0
04ad cda77c    call    $7ca7
04b0 cdb84b    call    $4bb8
04b3 eb        ex      de,hl
04b4 cda08b    call    $8ba0
04b7 c9        ret     

04b8 cdbd4a    call    $4abd
04bb cda77c    call    $7ca7
04be cd4c7a    call    $7a4c
04c1 cda08b    call    $8ba0
04c4 cda77c    call    $7ca7
04c7 cdb84b    call    $4bb8
04ca eb        ex      de,hl
04cb cda08b    call    $8ba0
04ce c9        ret     

04cf cdbd4a    call    $4abd
04d2 cda77c    call    $7ca7
04d5 cdcc05    call    $05cc
04d8 eb        ex      de,hl
04d9 cda08b    call    $8ba0
04dc c9        ret     

04dd cda98b    call    $8ba9
04e0 cd7c4a    call    $4a7c
04e3 cd6c4a    call    $4a6c
04e6 210800    ld      hl,$0008
04e9 39        add     hl,sp
04ea 5e        ld      e,(hl)
04eb 23        inc     hl
04ec 56        ld      d,(hl)
04ed eb        ex      de,hl
04ee c30485    jp      $8504
04f1 cda98b    call    $8ba9
04f4 210200    ld      hl,$0002
04f7 e5        push    hl
04f8 cdd249    call    $49d2
04fb d1        pop     de
04fc 44        ld      b,h
04fd 4d        ld      c,l
04fe cd7c4a    call    $4a7c
0501 0b        dec     bc
0502 60        ld      h,b
0503 69        ld      l,c
0504 e5        push    hl
0505 cdee49    call    $49ee
0508 d1        pop     de
0509 2013      jr      nz,$051e
050b cd6c4a    call    $4a6c
050e 210800    ld      hl,$0008
0511 39        add     hl,sp
0512 5e        ld      e,(hl)
0513 23        inc     hl
0514 56        ld      d,(hl)
0515 eb        ex      de,hl
0516 cd0485    call    $8504
0519 cd2e43    call    $432e
051c 18e3      jr      $0501
051e c33743    jp      $4337
0521 21da06    ld      hl,$06da
0524 e5        push    hl
0525 cdf103    call    $03f1
0528 d1        pop     de
0529 c9        ret     

052a cda98b    call    $8ba9
052d 210800    ld      hl,$0008
0530 39        add     hl,sp
0531 cd667c    call    $7c66
0534 21858c    ld      hl,$8c85
0537 cd587c    call    $7c58
053a cdf27f    call    $7ff2
053d 280b      jr      z,$054a
053f 210800    ld      hl,$0008
0542 39        add     hl,sp
0543 cd667c    call    $7c66
0546 cd127d    call    $7d12
0549 c9        ret     

054a 210800    ld      hl,$0008
054d 39        add     hl,sp
054e cd667c    call    $7c66
0551 c9        ret     

0552 cd0585    call    $8505
0555 f8        ret     m

0556 ff        rst     $38
0557 211000    ld      hl,$0010
055a 39        add     hl,sp
055b 4e        ld      c,(hl)
055c 23        inc     hl
055d 46        ld      b,(hl)
055e 60        ld      h,b
055f 69        ld      l,c
0560 cd667c    call    $7c66
0563 cda77c    call    $7ca7
0566 210c00    ld      hl,$000c
0569 39        add     hl,sp
056a e5        push    hl
056b 60        ld      h,b
056c 69        ld      l,c
056d cd667c    call    $7c66
0570 cde681    call    $81e6
0573 cd2880    call    $8028
0576 e1        pop     hl
0577 cd857c    call    $7c85
057a cdd87c    call    $7cd8
057d cd657d    call    $7d65
0580 cda77c    call    $7ca7
0583 cd2a04    call    $042a
0586 cda08b    call    $8ba0
0589 cd517c    call    $7c51
058c 41        ld      b,c
058d 010000    ld      bc,$0000
0590 00        nop     
0591 00        nop     
0592 00        nop     
0593 00        nop     
0594 cdf27f    call    $7ff2
0597 2807      jr      z,$05a0
0599 210400    ld      hl,$0004
059c 39        add     hl,sp
059d c3667c    jp      $7c66
05a0 c30d54    jp      $540d
05a3 cdbd4a    call    $4abd
05a6 cde681    call    $81e6
05a9 e5        push    hl
05aa cd8207    call    $0782
05ad e3        ex      (sp),hl
05ae cda64b    call    $4ba6
05b1 d1        pop     de
05b2 c9        ret     

05b3 cda98b    call    $8ba9
05b6 210800    ld      hl,$0008
05b9 39        add     hl,sp
05ba 4e        ld      c,(hl)
05bb 23        inc     hl
05bc 46        ld      b,(hl)
05bd 210a00    ld      hl,$000a
05c0 39        add     hl,sp
05c1 5e        ld      e,(hl)
05c2 23        inc     hl
05c3 56        ld      d,(hl)
05c4 d5        push    de
05c5 210c00    ld      hl,$000c
05c8 39        add     hl,sp
05c9 5e        ld      e,(hl)
05ca 23        inc     hl
05cb 56        ld      d,(hl)
05cc d5        push    de
05cd cd5204    call    $0452
05d0 d1        pop     de
05d1 e1        pop     hl
05d2 cd857c    call    $7c85
05d5 21858c    ld      hl,$8c85
05d8 cd587c    call    $7c58
05db cde07f    call    $7fe0
05de 2803      jr      z,$05e3
05e0 cd6756    call    $5667
05e3 60        ld      h,b
05e4 69        ld      l,c
05e5 e5        push    hl
05e6 c5        push    bc
05e7 cd5204    call    $0452
05ea d1        pop     de
05eb e1        pop     hl
05ec cd857c    call    $7c85
05ef 210a00    ld      hl,$000a
05f2 39        add     hl,sp
05f3 5e        ld      e,(hl)
05f4 23        inc     hl
05f5 56        ld      d,(hl)
05f6 eb        ex      de,hl
05f7 cd667c    call    $7c66
05fa cda77c    call    $7ca7
05fd 60        ld      h,b
05fe 69        ld      l,c
05ff cd667c    call    $7c66
0602 cdd87c    call    $7cd8
0605 cd417e    call    $7e41
0608 c3e681    jp      $81e6
060b 217890    ld      hl,$9078
060e e5        push    hl
060f cdbd4a    call    $4abd
0612 e1        pop     hl
0613 cd857c    call    $7c85
0616 218090    ld      hl,$9080
0619 e5        push    hl
061a cdbd4a    call    $4abd
061d e1        pop     hl
061e cd857c    call    $7c85
0621 218090    ld      hl,$9080
0624 e5        push    hl
0625 217890    ld      hl,$9078
0628 e5        push    hl
0629 cdb304    call    $04b3
062c d1        pop     de
062d d1        pop     de
062e cd2880    call    $8028
0631 cda77c    call    $7ca7
0634 cdb84b    call    $4bb8
0637 eb        ex      de,hl
0638 cda08b    call    $8ba0
063b c9        ret     

063c 217890    ld      hl,$9078
063f e5        push    hl
0640 cdbd4a    call    $4abd
0643 e1        pop     hl
0644 cd857c    call    $7c85
0647 218090    ld      hl,$9080
064a e5        push    hl
064b cdbd4a    call    $4abd
064e e1        pop     hl
064f cd857c    call    $7c85
0652 218090    ld      hl,$9080
0655 e5        push    hl
0656 217890    ld      hl,$9078
0659 e5        push    hl
065a cdb304    call    $04b3
065d d1        pop     de
065e d1        pop     de
065f cd2880    call    $8028
0662 218090    ld      hl,$9080
0665 cd587c    call    $7c58
0668 cd417f    call    $7f41
066b cda77c    call    $7ca7
066e 217890    ld      hl,$9078
0671 cd667c    call    $7c66
0674 cdd87c    call    $7cd8
0677 cd657d    call    $7d65
067a cda77c    call    $7ca7
067d cdb84b    call    $4bb8
0680 eb        ex      de,hl
0681 cda08b    call    $8ba0
0684 c9        ret     

0685 218303    ld      hl,$0383
0688 22a58c    ld      ($8ca5),hl
068b c9        ret     

068c cd6c4a    call    $4a6c
068f cd534c    call    $4c53
0692 21858c    ld      hl,$8c85
0695 cd587c    call    $7c58
0698 cdf27f    call    $7ff2
069b 280d      jr      z,$06aa
069d cd5f7c    call    $7c5f
06a0 c0        ret     nz

06a1 80        add     a,b
06a2 00        nop     
06a3 00        nop     
06a4 00        nop     
06a5 00        nop     
06a6 00        nop     
06a7 00        nop     
06a8 180b      jr      $06b5
06aa cd5f7c    call    $7c5f
06ad 40        ld      b,b
06ae 80        add     a,b
06af 00        nop     
06b0 00        nop     
06b1 00        nop     
06b2 00        nop     
06b3 00        nop     
06b4 00        nop     
06b5 cda77c    call    $7ca7
06b8 cd534c    call    $4c53
06bb cdd87c    call    $7cd8
06be cd6c7d    call    $7d6c
06c1 cda77c    call    $7ca7
06c4 cdcc05    call    $05cc
06c7 eb        ex      de,hl
06c8 cda08b    call    $8ba0
06cb c9        ret     

06cc cda98b    call    $8ba9
06cf 210800    ld      hl,$0008
06d2 39        add     hl,sp
06d3 e5        push    hl
06d4 cd5204    call    $0452
06d7 d1        pop     de
06d8 cda77c    call    $7ca7
06db cdb84b    call    $4bb8
06de eb        ex      de,hl
06df cda08b    call    $8ba0
06e2 c9        ret     

06e3 211106    ld      hl,$0611
06e6 e5        push    hl
06e7 cdf103    call    $03f1
06ea d1        pop     de
06eb c9        ret     

06ec 213006    ld      hl,$0630
06ef e5        push    hl
06f0 cddd03    call    $03dd
06f3 d1        pop     de
06f4 c9        ret     

06f5 cdde52    call    $52de
06f8 2adc8f    ld      hl,($8fdc)
06fb e5        push    hl
06fc cd2b53    call    $532b
06ff d1        pop     de
0700 cd534c    call    $4c53
0703 cd127d    call    $7d12
0706 cda77c    call    $7ca7
0709 cdb84b    call    $4bb8
070c eb        ex      de,hl
070d cda08b    call    $8ba0
0710 c9        ret     

0711 cd534c    call    $4c53
0714 cda77c    call    $7ca7
0717 cdaa41    call    $41aa
071a e5        push    hl
071b cd9f45    call    $459f
071e d1        pop     de
071f cdd87c    call    $7cd8
0722 cd6c7d    call    $7d6c
0725 cda77c    call    $7ca7
0728 cdb84b    call    $4bb8
072b eb        ex      de,hl
072c cda08b    call    $8ba0
072f c9        ret     

0730 cd534c    call    $4c53
0733 cda77c    call    $7ca7
0736 cdaa41    call    $41aa
0739 e5        push    hl
073a cd9f45    call    $459f
073d d1        pop     de
073e cdd87c    call    $7cd8
0741 cd657d    call    $7d65
0744 cda77c    call    $7ca7
0747 cdb84b    call    $4bb8
074a eb        ex      de,hl
074b cda08b    call    $8ba0
074e c9        ret     

074f cd5806    call    $0658
0752 e5        push    hl
0753 cd6353    call    $5363
0756 d1        pop     de
0757 c9        ret     

0758 cd1d07    call    $071d
075b 2816      jr      z,$0773
075d cd534c    call    $4c53
0760 cda77c    call    $7ca7
0763 cdaa41    call    $41aa
0766 e5        push    hl
0767 cd9f45    call    $459f
076a d1        pop     de
076b cdd87c    call    $7cd8
076e cdf27f    call    $7ff2
0771 eb        ex      de,hl
0772 c9        ret     

0773 cd3c07    call    $073c
0776 110000    ld      de,$0000
0779 eb        ex      de,hl
077a cd6c85    call    $856c
077d c9        ret     

077e cd1d07    call    $071d
0781 2817      jr      z,$079a
0783 cd534c    call    $4c53
0786 cda77c    call    $7ca7
0789 cdaa41    call    $41aa
078c e5        push    hl
078d cd9f45    call    $459f
0790 d1        pop     de
0791 cdd87c    call    $7cd8
0794 cd1080    call    $8010
0797 eb        ex      de,hl
0798 180a      jr      $07a4
079a cd3c07    call    $073c
079d 110000    ld      de,$0000
07a0 eb        ex      de,hl
07a1 cd6d85    call    $856d
07a4 e5        push    hl
07a5 cd6353    call    $5363
07a8 d1        pop     de
07a9 c9        ret     

07aa cd534c    call    $4c53
07ad 21858c    ld      hl,$8c85
07b0 cd587c    call    $7c58
07b3 cde07f    call    $7fe0
07b6 2803      jr      z,$07bb
07b8 cd6756    call    $5667
07bb cd534c    call    $4c53
07be cda77c    call    $7ca7
07c1 cdaa41    call    $41aa
07c4 e5        push    hl
07c5 cd9f45    call    $459f
07c8 d1        pop     de
07c9 cdd87c    call    $7cd8
07cc cd417e    call    $7e41
07cf cda77c    call    $7ca7
07d2 cdb84b    call    $4bb8
07d5 eb        ex      de,hl
07d6 cda08b    call    $8ba0
07d9 c9        ret     

07da cd534c    call    $4c53
07dd cda77c    call    $7ca7
07e0 cdaa41    call    $41aa
07e3 e5        push    hl
07e4 cd9f45    call    $459f
07e7 d1        pop     de
07e8 cdd87c    call    $7cd8
07eb cd417f    call    $7f41
07ee cda77c    call    $7ca7
07f1 cdb84b    call    $4bb8
07f4 eb        ex      de,hl
07f5 cda08b    call    $8ba0
07f8 c9        ret     

07f9 21aa06    ld      hl,$06aa
07fc e5        push    hl
07fd cddd03    call    $03dd
0800 d1        pop     de
0801 c9        ret     

0802 cd0e07    call    $070e
0805 c34f06    jp      $064f
0808 cd0e07    call    $070e
080b c37e06    jp      $067e
080e cde64a    call    $4ae6
0811 cdbb4c    call    $4cbb
0814 cde64a    call    $4ae6
0817 cdbb4c    call    $4cbb
081a c33743    jp      $4337
081d cda98b    call    $8ba9
0820 cd8d41    call    $418d
0823 e5        push    hl
0824 cd2545    call    $4525
0827 d1        pop     de
0828 280a      jr      z,$0834
082a 2af48f    ld      hl,($8ff4)
082d e5        push    hl
082e cd2545    call    $4525
0831 d1        pop     de
0832 2004      jr      nz,$0838
0834 210000    ld      hl,$0000
0837 c9        ret     

0838 210100    ld      hl,$0001
083b c9        ret     

083c 2af48f    ld      hl,($8ff4)
083f e5        push    hl
0840 cdaa41    call    $41aa
0843 e5        push    hl
0844 cd4a07    call    $074a
0847 d1        pop     de
0848 d1        pop     de
0849 c9        ret     

084a cda98b    call    $8ba9
084d cd5e10    call    $105e
0850 210800    ld      hl,$0008
0853 39        add     hl,sp
0854 5e        ld      e,(hl)
0855 23        inc     hl
0856 56        ld      d,(hl)
0857 d5        push    de
0858 cd8835    call    $3588
085b 210000    ld      hl,$0000
085e e3        ex      (sp),hl
085f cdc966    call    $66c9
0862 d1        pop     de
0863 2a728f    ld      hl,($8f72)
0866 44        ld      b,h
0867 4d        ld      c,l
0868 210a00    ld      hl,$000a
086b 39        add     hl,sp
086c 5e        ld      e,(hl)
086d 23        inc     hl
086e 56        ld      d,(hl)
086f d5        push    de
0870 cd8835    call    $3588
0873 d1        pop     de
0874 cd7410    call    $1074
0877 c5        push    bc
0878 21e68d    ld      hl,$8de6
087b e5        push    hl
087c cd4f7b    call    $7b4f
087f d1        pop     de
0880 d1        pop     de
0881 c9        ret     

0882 cda98b    call    $8ba9
0885 2aa58c    ld      hl,($8ca5)
0888 118303    ld      de,$0383
088b cdd485    call    $85d4
088e 11ff7f    ld      de,$7fff
0891 cdfc84    call    $84fc
0894 22a58c    ld      ($8ca5),hl
0897 cd2880    call    $8028
089a cda77c    call    $7ca7
089d 211000    ld      hl,$0010
08a0 39        add     hl,sp
08a1 5e        ld      e,(hl)
08a2 23        inc     hl
08a3 56        ld      d,(hl)
08a4 eb        ex      de,hl
08a5 cd2880    call    $8028
08a8 cdd87c    call    $7cd8
08ab cd417f    call    $7f41
08ae cd517c    call    $7c51
08b1 41        ld      b,c
08b2 02        ld      (bc),a
08b3 00        nop     
08b4 00        nop     
08b5 00        nop     
08b6 00        nop     
08b7 00        nop     
08b8 00        nop     
08b9 cd417f    call    $7f41
08bc cd517c    call    $7c51
08bf 42        ld      b,d
08c0 ff        rst     $38
08c1 ff        rst     $38
08c2 00        nop     
08c3 00        nop     
08c4 00        nop     
08c5 00        nop     
08c6 00        nop     
08c7 cd417e    call    $7e41
08ca c3e681    jp      $81e6
08cd cd5f4a    call    $4a5f
08d0 2af48f    ld      hl,($8ff4)
08d3 e5        push    hl
08d4 cddb07    call    $07db
08d7 d1        pop     de
08d8 c33743    jp      $4337
08db cda98b    call    $8ba9
08de 210800    ld      hl,$0008
08e1 39        add     hl,sp
08e2 4e        ld      c,(hl)
08e3 23        inc     hl
08e4 46        ld      b,(hl)
08e5 78        ld      a,b
08e6 b1        or      c
08e7 2007      jr      nz,$08f0
08e9 cd2543    call    $4325
08ec 210100    ld      hl,$0001
08ef c9        ret     

08f0 cd7266    call    $6672
08f3 60        ld      h,b
08f4 69        ld      l,c
08f5 cdff86    call    $86ff
08f8 e5        push    hl
08f9 cddb07    call    $07db
08fc 228c90    ld      ($908c),hl
08ff e3        ex      (sp),hl
0900 cd8207    call    $0782
0903 d1        pop     de
0904 228a90    ld      ($908a),hl
0907 60        ld      h,b
0908 69        ld      l,c
0909 cdf886    call    $86f8
090c 44        ld      b,h
090d 4d        ld      c,l
090e cd8d41    call    $418d
0911 228890    ld      ($9088),hl
0914 2a8a90    ld      hl,($908a)
0917 7c        ld      a,h
0918 b5        or      l
0919 2010      jr      nz,$092b
091b 2a8890    ld      hl,($9088)
091e e5        push    hl
091f c5        push    bc
0920 cd7d45    call    $457d
0923 d1        pop     de
0924 e3        ex      (sp),hl
0925 cdc941    call    $41c9
0928 d1        pop     de
0929 182c      jr      $0957
092b 2a8a90    ld      hl,($908a)
092e 2b        dec     hl
092f 228a90    ld      ($908a),hl
0932 7c        ld      a,h
0933 b5        or      l
0934 280b      jr      z,$0941
0936 2a8890    ld      hl,($9088)
0939 cdff86    call    $86ff
093c 228890    ld      ($9088),hl
093f 18ea      jr      $092b
0941 2a8890    ld      hl,($9088)
0944 cdff86    call    $86ff
0947 e5        push    hl
0948 c5        push    bc
0949 cd7d45    call    $457d
094c d1        pop     de
094d e3        ex      (sp),hl
094e 2a8890    ld      hl,($9088)
0951 e5        push    hl
0952 cd9844    call    $4498
0955 d1        pop     de
0956 d1        pop     de
0957 2a8c90    ld      hl,($908c)
095a 23        inc     hl
095b c9        ret     

095c cdc94a    call    $4ac9
095f cd3c10    call    $103c
0962 2ae68d    ld      hl,($8de6)
0965 2600      ld      h,$00
0967 e5        push    hl
0968 cda64b    call    $4ba6
096b d1        pop     de
096c c9        ret     

096d cd554a    call    $4a55
0970 e5        push    hl
0971 cdd944    call    $44d9
0974 d1        pop     de
0975 2809      jr      z,$0980
0977 210100    ld      hl,$0001
097a e5        push    hl
097b cdcc0f    call    $0fcc
097e d1        pop     de
097f c9        ret     

0980 2af48f    ld      hl,($8ff4)
0983 cdff86    call    $86ff
0986 22f48f    ld      ($8ff4),hl
0989 c9        ret     

098a cd654c    call    $4c65
098d cd534c    call    $4c53
0990 cde081    call    $81e0
0993 e5        push    hl
0994 21e68d    ld      hl,$8de6
0997 22728f    ld      ($8f72),hl
099a d1        pop     de
099b 73        ld      (hl),e
099c c3cf4b    jp      $4bcf
099f cd554a    call    $4a55
09a2 e5        push    hl
09a3 cdac08    call    $08ac
09a6 e3        ex      (sp),hl
09a7 cda64b    call    $4ba6
09aa d1        pop     de
09ab c9        ret     

09ac cda98b    call    $8ba9
09af 210800    ld      hl,$0008
09b2 39        add     hl,sp
09b3 4e        ld      c,(hl)
09b4 23        inc     hl
09b5 46        ld      b,(hl)
09b6 c5        push    bc
09b7 cd2545    call    $4525
09ba d1        pop     de
09bb 2807      jr      z,$09c4
09bd cd0110    call    $1001
09c0 2a7a8f    ld      hl,($8f7a)
09c3 c9        ret     

09c4 c5        push    bc
09c5 cd0d45    call    $450d
09c8 d1        pop     de
09c9 280e      jr      z,$09d9
09cb 60        ld      h,b
09cc 69        ld      l,c
09cd cdff86    call    $86ff
09d0 cdf886    call    $86f8
09d3 e5        push    hl
09d4 cddf08    call    $08df
09d7 d1        pop     de
09d8 c9        ret     

09d9 c5        push    bc
09da cd5609    call    $0956
09dd d1        pop     de
09de c9        ret     

09df cd0585    call    $8505
09e2 feff      cp      $ff
09e4 210a00    ld      hl,$000a
09e7 39        add     hl,sp
09e8 4e        ld      c,(hl)
09e9 23        inc     hl
09ea 46        ld      b,(hl)
09eb c5        push    bc
09ec cd212e    call    $2e21
09ef d1        pop     de
09f0 eb        ex      de,hl
09f1 210400    ld      hl,$0004
09f4 39        add     hl,sp
09f5 73        ld      (hl),e
09f6 23        inc     hl
09f7 72        ld      (hl),d
09f8 60        ld      h,b
09f9 69        ld      l,c
09fa cdff86    call    $86ff
09fd 203a      jr      nz,$0a39
09ff 210000    ld      hl,$0000
0a02 228e90    ld      ($908e),hl
0a05 1807      jr      $0a0e
0a07 2a8e90    ld      hl,($908e)
0a0a 23        inc     hl
0a0b 228e90    ld      ($908e),hl
0a0e 2a8e90    ld      hl,($908e)
0a11 110400    ld      de,$0004
0a14 eb        ex      de,hl
0a15 cd6c85    call    $856c
0a18 2810      jr      z,$0a2a
0a1a 60        ld      h,b
0a1b 69        ld      l,c
0a1c cdf886    call    $86f8
0a1f eb        ex      de,hl
0a20 2a8e90    ld      hl,($908e)
0a23 19        add     hl,de
0a24 7e        ld      a,(hl)
0a25 b7        or      a
0a26 2802      jr      z,$0a2a
0a28 18dd      jr      $0a07
0a2a 2a8e90    ld      hl,($908e)
0a2d eb        ex      de,hl
0a2e 210400    ld      hl,$0004
0a31 39        add     hl,sp
0a32 7e        ld      a,(hl)
0a33 23        inc     hl
0a34 66        ld      h,(hl)
0a35 6f        ld      l,a
0a36 c33086    jp      $8630
0a39 cd7266    call    $6672
0a3c 60        ld      h,b
0a3d 69        ld      l,c
0a3e cdff86    call    $86ff
0a41 e5        push    hl
0a42 cddf08    call    $08df
0a45 d1        pop     de
0a46 110400    ld      de,$0004
0a49 19        add     hl,de
0a4a eb        ex      de,hl
0a4b 210400    ld      hl,$0004
0a4e 39        add     hl,sp
0a4f 7e        ld      a,(hl)
0a50 23        inc     hl
0a51 66        ld      h,(hl)
0a52 6f        ld      l,a
0a53 c33086    jp      $8630
0a56 cda98b    call    $8ba9
0a59 210800    ld      hl,$0008
0a5c 39        add     hl,sp
0a5d 4e        ld      c,(hl)
0a5e 23        inc     hl
0a5f 46        ld      b,(hl)
0a60 210000    ld      hl,$0000
0a63 229090    ld      ($9090),hl
0a66 1807      jr      $0a6f
0a68 60        ld      h,b
0a69 69        ld      l,c
0a6a cdff86    call    $86ff
0a6d 44        ld      b,h
0a6e 4d        ld      c,l
0a6f 78        ld      a,b
0a70 b1        or      c
0a71 2809      jr      z,$0a7c
0a73 2a9090    ld      hl,($9090)
0a76 23        inc     hl
0a77 229090    ld      ($9090),hl
0a7a 18ec      jr      $0a68
0a7c 2a9090    ld      hl,($9090)
0a7f c9        ret     

0a80 cda98b    call    $8ba9
0a83 210a00    ld      hl,$000a
0a86 39        add     hl,sp
0a87 4e        ld      c,(hl)
0a88 23        inc     hl
0a89 46        ld      b,(hl)
0a8a 210800    ld      hl,$0008
0a8d 39        add     hl,sp
0a8e 5e        ld      e,(hl)
0a8f 23        inc     hl
0a90 56        ld      d,(hl)
0a91 eb        ex      de,hl
0a92 229290    ld      ($9092),hl
0a95 e5        push    hl
0a96 cdd944    call    $44d9
0a99 d1        pop     de
0a9a 285a      jr      z,$0af6
0a9c c5        push    bc
0a9d cdd944    call    $44d9
0aa0 d1        pop     de
0aa1 284f      jr      z,$0af2
0aa3 2a9290    ld      hl,($9092)
0aa6 e5        push    hl
0aa7 cd2545    call    $4525
0aaa d1        pop     de
0aab 281f      jr      z,$0acc
0aad c5        push    bc
0aae cd2545    call    $4525
0ab1 d1        pop     de
0ab2 2818      jr      z,$0acc
0ab4 c5        push    bc
0ab5 cd9f45    call    $459f
0ab8 d1        pop     de
0ab9 cda77c    call    $7ca7
0abc 2a9290    ld      hl,($9092)
0abf e5        push    hl
0ac0 cd9f45    call    $459f
0ac3 d1        pop     de
0ac4 cdd87c    call    $7cd8
0ac7 cde07f    call    $7fe0
0aca eb        ex      de,hl
0acb c9        ret     

0acc 2a9290    ld      hl,($9092)
0acf e5        push    hl
0ad0 cd2545    call    $4525
0ad3 d1        pop     de
0ad4 2007      jr      nz,$0add
0ad6 c5        push    bc
0ad7 cd2545    call    $4525
0ada d1        pop     de
0adb 280d      jr      z,$0aea
0add c5        push    bc
0ade 2a9290    ld      hl,($9092)
0ae1 e5        push    hl
0ae2 cd4a07    call    $074a
0ae5 d1        pop     de
0ae6 d1        pop     de
0ae7 c3f685    jp      $85f6
0aea 2a9290    ld      hl,($9092)
0aed 50        ld      d,b
0aee 59        ld      e,c
0aef c33c85    jp      $853c
0af2 210000    ld      hl,$0000
0af5 c9        ret     

0af6 cd7266    call    $6672
0af9 60        ld      h,b
0afa 69        ld      l,c
0afb cdf886    call    $86f8
0afe e5        push    hl
0aff 2a9290    ld      hl,($9092)
0b02 cdf886    call    $86f8
0b05 e5        push    hl
0b06 cd8009    call    $0980
0b09 d1        pop     de
0b0a d1        pop     de
0b0b 281b      jr      z,$0b28
0b0d 60        ld      h,b
0b0e 69        ld      l,c
0b0f cdff86    call    $86ff
0b12 e5        push    hl
0b13 210a00    ld      hl,$000a
0b16 39        add     hl,sp
0b17 5e        ld      e,(hl)
0b18 23        inc     hl
0b19 56        ld      d,(hl)
0b1a eb        ex      de,hl
0b1b 229290    ld      ($9092),hl
0b1e cdff86    call    $86ff
0b21 e5        push    hl
0b22 cd8009    call    $0980
0b25 d1        pop     de
0b26 d1        pop     de
0b27 c9        ret     

0b28 210000    ld      hl,$0000
0b2b c9        ret     

0b2c cda98b    call    $8ba9
0b2f 210800    ld      hl,$0008
0b32 39        add     hl,sp
0b33 4e        ld      c,(hl)
0b34 23        inc     hl
0b35 46        ld      b,(hl)
0b36 c5        push    bc
0b37 cd2545    call    $4525
0b3a d1        pop     de
0b3b 2804      jr      z,$0b41
0b3d 210000    ld      hl,$0000
0b40 c9        ret     

0b41 c5        push    bc
0b42 cd0d45    call    $450d
0b45 d1        pop     de
0b46 2812      jr      z,$0b5a
0b48 2af48f    ld      hl,($8ff4)
0b4b e5        push    hl
0b4c cd0f10    call    $100f
0b4f d1        pop     de
0b50 2a728f    ld      hl,($8f72)
0b53 5e        ld      e,(hl)
0b54 1600      ld      d,$00
0b56 eb        ex      de,hl
0b57 c3f685    jp      $85f6
0b5a 60        ld      h,b
0b5b 69        ld      l,c
0b5c c3f685    jp      $85f6
0b5f cd554a    call    $4a55
0b62 e5        push    hl
0b63 cd2c0a    call    $0a2c
0b66 e3        ex      (sp),hl
0b67 cd6353    call    $5363
0b6a d1        pop     de
0b6b c9        ret     

0b6c cd554a    call    $4a55
0b6f e5        push    hl
0b70 cdd944    call    $44d9
0b73 d1        pop     de
0b74 2809      jr      z,$0b7f
0b76 210000    ld      hl,$0000
0b79 e5        push    hl
0b7a cdcc0f    call    $0fcc
0b7d d1        pop     de
0b7e c9        ret     

0b7f cd850a    call    $0a85
0b82 c33743    jp      $4337
0b85 2af48f    ld      hl,($8ff4)
0b88 cdff86    call    $86ff
0b8b 2004      jr      nz,$0b91
0b8d cd2543    call    $4325
0b90 c9        ret     

0b91 2af48f    ld      hl,($8ff4)
0b94 cdf886    call    $86f8
0b97 e5        push    hl
0b98 cd6341    call    $4163
0b9b d1        pop     de
0b9c 2af48f    ld      hl,($8ff4)
0b9f cdff86    call    $86ff
0ba2 22f48f    ld      ($8ff4),hl
0ba5 cd7266    call    $6672
0ba8 cd850a    call    $0a85
0bab cd6a42    call    $426a
0bae c9        ret     

0baf cde64a    call    $4ae6
0bb2 cd0f4a    call    $4a0f
0bb5 c35153    jp      $5351
0bb8 cdde4a    call    $4ade
0bbb 2af48f    ld      hl,($8ff4)
0bbe e5        push    hl
0bbf cdd944    call    $44d9
0bc2 d1        pop     de
0bc3 2807      jr      z,$0bcc
0bc5 cd3c10    call    $103c
0bc8 cdcf4b    call    $4bcf
0bcb c9        ret     

0bcc 2af48f    ld      hl,($8ff4)
0bcf cdf886    call    $86f8
0bd2 22f48f    ld      ($8ff4),hl
0bd5 c9        ret     

0bd6 cde64a    call    $4ae6
0bd9 cd554a    call    $4a55
0bdc e5        push    hl
0bdd cd0d45    call    $450d
0be0 d1        pop     de
0be1 281b      jr      z,$0bfe
0be3 cdbb4c    call    $4cbb
0be6 cd5e10    call    $105e
0be9 cdaa41    call    $41aa
0bec e5        push    hl
0bed cd8835    call    $3588
0bf0 2af48f    ld      hl,($8ff4)
0bf3 e3        ex      (sp),hl
0bf4 cd8835    call    $3588
0bf7 d1        pop     de
0bf8 cd7410    call    $1074
0bfb c3d84b    jp      $4bd8
0bfe 2af48f    ld      hl,($8ff4)
0c01 e5        push    hl
0c02 cdaa41    call    $41aa
0c05 e5        push    hl
0c06 cd7d45    call    $457d
0c09 d1        pop     de
0c0a d1        pop     de
0c0b 22f48f    ld      ($8ff4),hl
0c0e c9        ret     

0c0f cda98b    call    $8ba9
0c12 cd530f    call    $0f53
0c15 44        ld      b,h
0c16 4d        ld      c,l
0c17 cd554a    call    $4a55
0c1a e5        push    hl
0c1b cd0d45    call    $450d
0c1e d1        pop     de
0c1f 281f      jr      z,$0c40
0c21 cdf40f    call    $0ff4
0c24 2a7a8f    ld      hl,($8f7a)
0c27 50        ld      d,b
0c28 59        ld      e,c
0c29 eb        ex      de,hl
0c2a cd6686    call    $8666
0c2d 2803      jr      z,$0c32
0c2f cde556    call    $56e5
0c32 60        ld      h,b
0c33 69        ld      l,c
0c34 2b        dec     hl
0c35 eb        ex      de,hl
0c36 2a728f    ld      hl,($8f72)
0c39 19        add     hl,de
0c3a 22728f    ld      ($8f72),hl
0c3d c3cf4b    jp      $4bcf
0c40 2af48f    ld      hl,($8ff4)
0c43 e5        push    hl
0c44 cdac08    call    $08ac
0c47 d1        pop     de
0c48 50        ld      d,b
0c49 59        ld      e,c
0c4a eb        ex      de,hl
0c4b cd6c85    call    $856c
0c4e 2803      jr      z,$0c53
0c50 cde556    call    $56e5
0c53 2af48f    ld      hl,($8ff4)
0c56 e5        push    hl
0c57 c5        push    bc
0c58 cd7346    call    $4673
0c5b d1        pop     de
0c5c d1        pop     de
0c5d 22f48f    ld      ($8ff4),hl
0c60 c9        ret     

0c61 cdde4a    call    $4ade
0c64 2af48f    ld      hl,($8ff4)
0c67 e5        push    hl
0c68 cdd944    call    $44d9
0c6b d1        pop     de
0c6c 2812      jr      z,$0c80
0c6e cdf40f    call    $0ff4
0c71 2a7a8f    ld      hl,($8f7a)
0c74 2b        dec     hl
0c75 eb        ex      de,hl
0c76 2a728f    ld      hl,($8f72)
0c79 19        add     hl,de
0c7a 22728f    ld      ($8f72),hl
0c7d c3cf4b    jp      $4bcf
0c80 2af48f    ld      hl,($8ff4)
0c83 e5        push    hl
0c84 2af48f    ld      hl,($8ff4)
0c87 e5        push    hl
0c88 cd5609    call    $0956
0c8b e3        ex      (sp),hl
0c8c cd7346    call    $4673
0c8f d1        pop     de
0c90 d1        pop     de
0c91 22f48f    ld      ($8ff4),hl
0c94 c9        ret     

0c95 210200    ld      hl,$0002
0c98 e5        push    hl
0c99 cdd249    call    $49d2
0c9c e3        ex      (sp),hl
0c9d cda40b    call    $0ba4
0ca0 d1        pop     de
0ca1 c33743    jp      $4337
0ca4 cda98b    call    $8ba9
0ca7 210800    ld      hl,$0008
0caa 39        add     hl,sp
0cab 4e        ld      c,(hl)
0cac 23        inc     hl
0cad 46        ld      b,(hl)
0cae c5        push    bc
0caf cdee49    call    $49ee
0cb2 d1        pop     de
0cb3 2803      jr      z,$0cb8
0cb5 c32543    jp      $4325
0cb8 cd554a    call    $4a55
0cbb e5        push    hl
0cbc cd6341    call    $4163
0cbf d1        pop     de
0cc0 cd7266    call    $6672
0cc3 60        ld      h,b
0cc4 69        ld      l,c
0cc5 2b        dec     hl
0cc6 e5        push    hl
0cc7 cda40b    call    $0ba4
0cca d1        pop     de
0ccb c36a42    jp      $426a
0cce cd554a    call    $4a55
0cd1 e5        push    hl
0cd2 cd0d45    call    $450d
0cd5 d1        pop     de
0cd6 cdf685    call    $85f6
0cd9 e5        push    hl
0cda cd6353    call    $5363
0cdd d1        pop     de
0cde c9        ret     

0cdf cda98b    call    $8ba9
0ce2 cde64a    call    $4ae6
0ce5 cd554a    call    $4a55
0ce8 e5        push    hl
0ce9 cd0d45    call    $450d
0cec d1        pop     de
0ced 281c      jr      z,$0d0b
0cef cdbb4c    call    $4cbb
0cf2 cd5e10    call    $105e
0cf5 2af48f    ld      hl,($8ff4)
0cf8 e5        push    hl
0cf9 cd8835    call    $3588
0cfc d1        pop     de
0cfd cdaa41    call    $41aa
0d00 e5        push    hl
0d01 cd8835    call    $3588
0d04 d1        pop     de
0d05 cd7410    call    $1074
0d08 c3d84b    jp      $4bd8
0d0b 2af48f    ld      hl,($8ff4)
0d0e 44        ld      b,h
0d0f 4d        ld      c,l
0d10 cd8d41    call    $418d
0d13 e5        push    hl
0d14 cd2c46    call    $462c
0d17 d1        pop     de
0d18 22f48f    ld      ($8ff4),hl
0d1b c5        push    bc
0d1c cd260c    call    $0c26
0d1f d1        pop     de
0d20 cd3743    call    $4337
0d23 c39641    jp      $4196
0d26 cda98b    call    $8ba9
0d29 210800    ld      hl,$0008
0d2c 39        add     hl,sp
0d2d 4e        ld      c,(hl)
0d2e 23        inc     hl
0d2f 46        ld      b,(hl)
0d30 78        ld      a,b
0d31 b1        or      c
0d32 2003      jr      nz,$0d37
0d34 c32e43    jp      $432e
0d37 60        ld      h,b
0d38 69        ld      l,c
0d39 cdf886    call    $86f8
0d3c e5        push    hl
0d3d cd6341    call    $4163
0d40 d1        pop     de
0d41 cd7266    call    $6672
0d44 60        ld      h,b
0d45 69        ld      l,c
0d46 cdff86    call    $86ff
0d49 e5        push    hl
0d4a cd260c    call    $0c26
0d4d d1        pop     de
0d4e c36a42    jp      $426a
0d51 cde64a    call    $4ae6
0d54 cd554a    call    $4a55
0d57 e5        push    hl
0d58 cd0d45    call    $450d
0d5b d1        pop     de
0d5c 2805      jr      z,$0d63
0d5e cd6c0c    call    $0c6c
0d61 1803      jr      $0d66
0d63 cdf80c    call    $0cf8
0d66 e5        push    hl
0d67 cd6353    call    $5363
0d6a d1        pop     de
0d6b c9        ret     

0d6c cda98b    call    $8ba9
0d6f cdbb4c    call    $4cbb
0d72 cd5e10    call    $105e
0d75 cdaa41    call    $41aa
0d78 e5        push    hl
0d79 cd8835    call    $3588
0d7c d1        pop     de
0d7d 2a7a8f    ld      hl,($8f7a)
0d80 229690    ld      ($9096),hl
0d83 7c        ld      a,h
0d84 b5        or      l
0d85 2007      jr      nz,$0d8e
0d87 cd7410    call    $1074
0d8a 210000    ld      hl,$0000
0d8d c9        ret     

0d8e 2a728f    ld      hl,($8f72)
0d91 44        ld      b,h
0d92 4d        ld      c,l
0d93 2af48f    ld      hl,($8ff4)
0d96 e5        push    hl
0d97 cd8835    call    $3588
0d9a d1        pop     de
0d9b cd7410    call    $1074
0d9e 2a7a8f    ld      hl,($8f7a)
0da1 eb        ex      de,hl
0da2 2a9690    ld      hl,($9096)
0da5 cd3086    call    $8630
0da8 229490    ld      ($9094),hl
0dab 210100    ld      hl,$0001
0dae 229c8f    ld      ($8f9c),hl
0db1 1807      jr      $0dba
0db3 2a9c8f    ld      hl,($8f9c)
0db6 23        inc     hl
0db7 229c8f    ld      ($8f9c),hl
0dba 2a9490    ld      hl,($9094)
0dbd 7c        ld      a,h
0dbe b5        or      l
0dbf 282d      jr      z,$0dee
0dc1 2a9490    ld      hl,($9094)
0dc4 2b        dec     hl
0dc5 229490    ld      ($9094),hl
0dc8 23        inc     hl
0dc9 e5        push    hl
0dca 2a9690    ld      hl,($9096)
0dcd d1        pop     de
0dce eb        ex      de,hl
0dcf cd6d85    call    $856d
0dd2 201a      jr      nz,$0dee
0dd4 2a9690    ld      hl,($9096)
0dd7 e5        push    hl
0dd8 60        ld      h,b
0dd9 69        ld      l,c
0dda 03        inc     bc
0ddb e5        push    hl
0ddc 2a728f    ld      hl,($8f72)
0ddf e5        push    hl
0de0 cdc67b    call    $7bc6
0de3 d1        pop     de
0de4 d1        pop     de
0de5 d1        pop     de
0de6 2004      jr      nz,$0dec
0de8 210100    ld      hl,$0001
0deb c9        ret     

0dec 18c5      jr      $0db3
0dee 210000    ld      hl,$0000
0df1 229c8f    ld      ($8f9c),hl
0df4 210000    ld      hl,$0000
0df7 c9        ret     

0df8 cda98b    call    $8ba9
0dfb cdaa41    call    $41aa
0dfe 44        ld      b,h
0dff 4d        ld      c,l
0e00 210100    ld      hl,$0001
0e03 229c8f    ld      ($8f9c),hl
0e06 1807      jr      $0e0f
0e08 2a9c8f    ld      hl,($8f9c)
0e0b 23        inc     hl
0e0c 229c8f    ld      ($8f9c),hl
0e0f 2af48f    ld      hl,($8ff4)
0e12 7c        ld      a,h
0e13 b5        or      l
0e14 281e      jr      z,$0e34
0e16 2af48f    ld      hl,($8ff4)
0e19 cdf886    call    $86f8
0e1c e5        push    hl
0e1d c5        push    bc
0e1e cd8009    call    $0980
0e21 d1        pop     de
0e22 d1        pop     de
0e23 2804      jr      z,$0e29
0e25 210100    ld      hl,$0001
0e28 c9        ret     

0e29 2af48f    ld      hl,($8ff4)
0e2c cdff86    call    $86ff
0e2f 22f48f    ld      ($8ff4),hl
0e32 18d4      jr      $0e08
0e34 210000    ld      hl,$0000
0e37 229c8f    ld      ($8f9c),hl
0e3a 210000    ld      hl,$0000
0e3d c9        ret     

0e3e cd0f4a    call    $4a0f
0e41 2af48f    ld      hl,($8ff4)
0e44 e5        push    hl
0e45 cd2545    call    $4525
0e48 d1        pop     de
0e49 200f      jr      nz,$0e5a
0e4b 2af48f    ld      hl,($8ff4)
0e4e e5        push    hl
0e4f cd824a    call    $4a82
0e52 d1        pop     de
0e53 2005      jr      nz,$0e5a
0e55 210000    ld      hl,$0000
0e58 1803      jr      $0e5d
0e5a 210100    ld      hl,$0001
0e5d e5        push    hl
0e5e cd6353    call    $5363
0e61 d1        pop     de
0e62 c9        ret     

0e63 210200    ld      hl,$0002
0e66 e5        push    hl
0e67 cdd249    call    $49d2
0e6a e3        ex      (sp),hl
0e6b cd720d    call    $0d72
0e6e d1        pop     de
0e6f c33743    jp      $4337
0e72 cda98b    call    $8ba9
0e75 210800    ld      hl,$0008
0e78 39        add     hl,sp
0e79 4e        ld      c,(hl)
0e7a 23        inc     hl
0e7b 46        ld      b,(hl)
0e7c c5        push    bc
0e7d cdee49    call    $49ee
0e80 d1        pop     de
0e81 2803      jr      z,$0e86
0e83 c32543    jp      $4325
0e86 cd7266    call    $6672
0e89 cde64a    call    $4ae6
0e8c cd8d41    call    $418d
0e8f e5        push    hl
0e90 cd0d45    call    $450d
0e93 d1        pop     de
0e94 280b      jr      z,$0ea1
0e96 60        ld      h,b
0e97 69        ld      l,c
0e98 2b        dec     hl
0e99 e5        push    hl
0e9a cd720d    call    $0d72
0e9d d1        pop     de
0e9e c36a42    jp      $426a
0ea1 2af48f    ld      hl,($8ff4)
0ea4 e5        push    hl
0ea5 60        ld      h,b
0ea6 69        ld      l,c
0ea7 2b        dec     hl
0ea8 e5        push    hl
0ea9 cdb70d    call    $0db7
0eac d1        pop     de
0ead d1        pop     de
0eae cdaa41    call    $41aa
0eb1 e5        push    hl
0eb2 cdc941    call    $41c9
0eb5 d1        pop     de
0eb6 c9        ret     

0eb7 cda98b    call    $8ba9
0eba 210a00    ld      hl,$000a
0ebd 39        add     hl,sp
0ebe 4e        ld      c,(hl)
0ebf 23        inc     hl
0ec0 46        ld      b,(hl)
0ec1 78        ld      a,b
0ec2 b1        or      c
0ec3 200d      jr      nz,$0ed2
0ec5 210800    ld      hl,$0008
0ec8 39        add     hl,sp
0ec9 5e        ld      e,(hl)
0eca 23        inc     hl
0ecb 56        ld      d,(hl)
0ecc d5        push    de
0ecd cd720d    call    $0d72
0ed0 d1        pop     de
0ed1 c9        ret     

0ed2 60        ld      h,b
0ed3 69        ld      l,c
0ed4 cdf886    call    $86f8
0ed7 e5        push    hl
0ed8 cd6341    call    $4163
0edb d1        pop     de
0edc cd7266    call    $6672
0edf 60        ld      h,b
0ee0 69        ld      l,c
0ee1 cdff86    call    $86ff
0ee4 e5        push    hl
0ee5 210a00    ld      hl,$000a
0ee8 39        add     hl,sp
0ee9 5e        ld      e,(hl)
0eea 23        inc     hl
0eeb 56        ld      d,(hl)
0eec d5        push    de
0eed cdb70d    call    $0db7
0ef0 d1        pop     de
0ef1 d1        pop     de
0ef2 c36a42    jp      $426a
0ef5 cd554a    call    $4a55
0ef8 e5        push    hl
0ef9 cd0d45    call    $450d
0efc e3        ex      (sp),hl
0efd cd6353    call    $5363
0f00 d1        pop     de
0f01 c9        ret     

0f02 cda98b    call    $8ba9
0f05 210200    ld      hl,$0002
0f08 e5        push    hl
0f09 cdd249    call    $49d2
0f0c e3        ex      (sp),hl
0f0d cd550e    call    $0e55
0f10 d1        pop     de
0f11 cd5e10    call    $105e
0f14 cdaa41    call    $41aa
0f17 44        ld      b,h
0f18 4d        ld      c,l
0f19 1807      jr      $0f22
0f1b 60        ld      h,b
0f1c 69        ld      l,c
0f1d cdff86    call    $86ff
0f20 44        ld      b,h
0f21 4d        ld      c,l
0f22 78        ld      a,b
0f23 b1        or      c
0f24 2829      jr      z,$0f4f
0f26 60        ld      h,b
0f27 69        ld      l,c
0f28 cdf886    call    $86f8
0f2b 229890    ld      ($9098),hl
0f2e e5        push    hl
0f2f cd0d45    call    $450d
0f32 d1        pop     de
0f33 2010      jr      nz,$0f45
0f35 2a9890    ld      hl,($9098)
0f38 e5        push    hl
0f39 2ae48f    ld      hl,($8fe4)
0f3c cdf886    call    $86f8
0f3f e5        push    hl
0f40 cdec54    call    $54ec
0f43 d1        pop     de
0f44 d1        pop     de
0f45 2a9890    ld      hl,($9098)
0f48 e5        push    hl
0f49 cd8835    call    $3588
0f4c d1        pop     de
0f4d 18cc      jr      $0f1b
0f4f cd7410    call    $1074
0f52 c3d84b    jp      $4bd8
0f55 cda98b    call    $8ba9
0f58 210800    ld      hl,$0008
0f5b 39        add     hl,sp
0f5c 4e        ld      c,(hl)
0f5d 23        inc     hl
0f5e 46        ld      b,(hl)
0f5f c5        push    bc
0f60 cdee49    call    $49ee
0f63 d1        pop     de
0f64 2803      jr      z,$0f69
0f66 c32543    jp      $4325
0f69 cde64a    call    $4ae6
0f6c cd7266    call    $6672
0f6f 60        ld      h,b
0f70 69        ld      l,c
0f71 2b        dec     hl
0f72 e5        push    hl
0f73 cd550e    call    $0e55
0f76 d1        pop     de
0f77 c36a42    jp      $426a
0f7a cda98b    call    $8ba9
0f7d cd530f    call    $0f53
0f80 44        ld      b,h
0f81 4d        ld      c,l
0f82 cdbd4a    call    $4abd
0f85 cde681    call    $81e6
0f88 229a90    ld      ($909a),hl
0f8b 50        ld      d,b
0f8c 59        ld      e,c
0f8d eb        ex      de,hl
0f8e cd6c85    call    $856c
0f91 2803      jr      z,$0f96
0f93 cd3b55    call    $553b
0f96 cd554a    call    $4a55
0f99 e5        push    hl
0f9a cd0d45    call    $450d
0f9d d1        pop     de
0f9e 282d      jr      z,$0fcd
0fa0 cdf40f    call    $0ff4
0fa3 2a7a8f    ld      hl,($8f7a)
0fa6 eb        ex      de,hl
0fa7 2a9a90    ld      hl,($909a)
0faa cd6686    call    $8666
0fad 2803      jr      z,$0fb2
0faf cde556    call    $56e5
0fb2 60        ld      h,b
0fb3 69        ld      l,c
0fb4 2b        dec     hl
0fb5 eb        ex      de,hl
0fb6 2a728f    ld      hl,($8f72)
0fb9 19        add     hl,de
0fba 22728f    ld      ($8f72),hl
0fbd 2a9a90    ld      hl,($909a)
0fc0 50        ld      d,b
0fc1 59        ld      e,c
0fc2 eb        ex      de,hl
0fc3 cd3086    call    $8630
0fc6 23        inc     hl
0fc7 227a8f    ld      ($8f7a),hl
0fca c3d84b    jp      $4bd8
0fcd 2af48f    ld      hl,($8ff4)
0fd0 e5        push    hl
0fd1 2a9a90    ld      hl,($909a)
0fd4 e5        push    hl
0fd5 60        ld      h,b
0fd6 69        ld      l,c
0fd7 2b        dec     hl
0fd8 e5        push    hl
0fd9 cde20e    call    $0ee2
0fdc d1        pop     de
0fdd d1        pop     de
0fde d1        pop     de
0fdf c33743    jp      $4337
0fe2 cda98b    call    $8ba9
0fe5 210c00    ld      hl,$000c
0fe8 39        add     hl,sp
0fe9 4e        ld      c,(hl)
0fea 23        inc     hl
0feb 46        ld      b,(hl)
0fec 210a00    ld      hl,$000a
0fef 39        add     hl,sp
0ff0 7e        ld      a,(hl)
0ff1 23        inc     hl
0ff2 b6        or      (hl)
0ff3 2003      jr      nz,$0ff8
0ff5 c32543    jp      $4325
0ff8 78        ld      a,b
0ff9 b1        or      c
0ffa 2003      jr      nz,$0fff
0ffc cde556    call    $56e5
0fff cd7266    call    $6672
1002 210800    ld      hl,$0008
1005 39        add     hl,sp
1006 7e        ld      a,(hl)
1007 23        inc     hl
1008 b6        or      (hl)
1009 2821      jr      z,$102c
100b 60        ld      h,b
100c 69        ld      l,c
100d cdff86    call    $86ff
1010 e5        push    hl
1011 210c00    ld      hl,$000c
1014 39        add     hl,sp
1015 5e        ld      e,(hl)
1016 23        inc     hl
1017 56        ld      d,(hl)
1018 eb        ex      de,hl
1019 2b        dec     hl
101a e5        push    hl
101b 210c00    ld      hl,$000c
101e 39        add     hl,sp
101f 5e        ld      e,(hl)
1020 23        inc     hl
1021 56        ld      d,(hl)
1022 eb        ex      de,hl
1023 2b        dec     hl
1024 e5        push    hl
1025 cde20e    call    $0ee2
1028 d1        pop     de
1029 d1        pop     de
102a d1        pop     de
102b c9        ret     

102c 60        ld      h,b
102d 69        ld      l,c
102e cdf886    call    $86f8
1031 e5        push    hl
1032 cd6341    call    $4163
1035 d1        pop     de
1036 60        ld      h,b
1037 69        ld      l,c
1038 cdff86    call    $86ff
103b e5        push    hl
103c 210c00    ld      hl,$000c
103f 39        add     hl,sp
1040 5e        ld      e,(hl)
1041 23        inc     hl
1042 56        ld      d,(hl)
1043 eb        ex      de,hl
1044 2b        dec     hl
1045 e5        push    hl
1046 210000    ld      hl,$0000
1049 e5        push    hl
104a cde20e    call    $0ee2
104d d1        pop     de
104e d1        pop     de
104f d1        pop     de
1050 c36a42    jp      $426a
1053 cda98b    call    $8ba9
1056 cdbd4a    call    $4abd
1059 cde681    call    $81e6
105c 44        ld      b,h
105d 4d        ld      c,l
105e 110000    ld      de,$0000
1061 eb        ex      de,hl
1062 cd6d85    call    $856d
1065 2803      jr      z,$106a
1067 60        ld      h,b
1068 69        ld      l,c
1069 c9        ret     

106a c33b55    jp      $553b
106d 2a9c8f    ld      hl,($8f9c)
1070 e5        push    hl
1071 cda64b    call    $4ba6
1074 d1        pop     de
1075 c9        ret     

1076 21d284    ld      hl,$84d2
1079 e5        push    hl
107a cd8c0f    call    $0f8c
107d d1        pop     de
107e c3d84b    jp      $4bd8
1081 21e784    ld      hl,$84e7
1084 e5        push    hl
1085 cd8c0f    call    $0f8c
1088 d1        pop     de
1089 c3d84b    jp      $4bd8
108c cda98b    call    $8ba9
108f cdc94a    call    $4ac9
1092 cd0110    call    $1001
1095 2a728f    ld      hl,($8f72)
1098 44        ld      b,h
1099 4d        ld      c,l
109a 1803      jr      $109f
109c 03        inc     bc
109d 60        ld      h,b
109e 69        ld      l,c
109f 2a728f    ld      hl,($8f72)
10a2 eb        ex      de,hl
10a3 2a7a8f    ld      hl,($8f7a)
10a6 19        add     hl,de
10a7 e5        push    hl
10a8 60        ld      h,b
10a9 69        ld      l,c
10aa d1        pop     de
10ab eb        ex      de,hl
10ac cd6686    call    $8666
10af 2818      jr      z,$10c9
10b1 60        ld      h,b
10b2 69        ld      l,c
10b3 5e        ld      e,(hl)
10b4 1600      ld      d,$00
10b6 d5        push    de
10b7 210a00    ld      hl,$000a
10ba 39        add     hl,sp
10bb 5e        ld      e,(hl)
10bc 23        inc     hl
10bd 56        ld      d,(hl)
10be eb        ex      de,hl
10bf cd0485    call    $8504
10c2 d1        pop     de
10c3 eb        ex      de,hl
10c4 60        ld      h,b
10c5 69        ld      l,c
10c6 73        ld      (hl),e
10c7 18d3      jr      $109c
10c9 c37410    jp      $1074
10cc cda98b    call    $8ba9
10cf 2af48f    ld      hl,($8ff4)
10d2 7c        ld      a,h
10d3 b5        or      l
10d4 2003      jr      nz,$10d9
10d6 cd3b55    call    $553b
10d9 cdf40f    call    $0ff4
10dc 2a7a8f    ld      hl,($8f7a)
10df 2b        dec     hl
10e0 227a8f    ld      ($8f7a),hl
10e3 210800    ld      hl,$0008
10e6 39        add     hl,sp
10e7 5e        ld      e,(hl)
10e8 23        inc     hl
10e9 56        ld      d,(hl)
10ea 2a728f    ld      hl,($8f72)
10ed 19        add     hl,de
10ee 22728f    ld      ($8f72),hl
10f1 c3d84b    jp      $4bd8
10f4 cd0110    call    $1001
10f7 2a7a8f    ld      hl,($8f7a)
10fa 7c        ld      a,h
10fb b5        or      l
10fc c0        ret     nz

10fd cd3b55    call    $553b
1100 c9        ret     

1101 cd5e10    call    $105e
1104 2af48f    ld      hl,($8ff4)
1107 e5        push    hl
1108 cd8835    call    $3588
110b d1        pop     de
110c c37410    jp      $1074
110f cda98b    call    $8ba9
1112 210800    ld      hl,$0008
1115 39        add     hl,sp
1116 4e        ld      c,(hl)
1117 23        inc     hl
1118 46        ld      b,(hl)
1119 60        ld      h,b
111a 69        ld      l,c
111b cdff86    call    $86ff
111e cdf886    call    $86f8
1121 44        ld      b,h
1122 4d        ld      c,l
1123 c5        push    bc
1124 cd212e    call    $2e21
1127 e3        ex      (sp),hl
1128 60        ld      h,b
1129 69        ld      l,c
112a cdf886    call    $86f8
112d d1        pop     de
112e 19        add     hl,de
112f 5e        ld      e,(hl)
1130 1600      ld      d,$00
1132 d5        push    de
1133 21e68d    ld      hl,$8de6
1136 22728f    ld      ($8f72),hl
1139 d1        pop     de
113a 73        ld      (hl),e
113b c9        ret     

113c 2af48f    ld      hl,($8ff4)
113f e5        push    hl
1140 cd2545    call    $4525
1143 d1        pop     de
1144 2805      jr      z,$114b
1146 cdf40f    call    $0ff4
1149 1812      jr      $115d
114b 2af48f    ld      hl,($8ff4)
114e e5        push    hl
114f cd0f10    call    $100f
1152 d1        pop     de
1153 2a728f    ld      hl,($8f72)
1156 7e        ld      a,(hl)
1157 b7        or      a
1158 2003      jr      nz,$115d
115a cd3b55    call    $553b
115d c9        ret     

115e 210000    ld      hl,$0000
1161 227a8f    ld      ($8f7a),hl
1164 e5        push    hl
1165 21e68d    ld      hl,$8de6
1168 22728f    ld      ($8f72),hl
116b d1        pop     de
116c 73        ld      (hl),e
116d 210100    ld      hl,$0001
1170 226c8e    ld      ($8e6c),hl
1173 c9        ret     

1174 21e68d    ld      hl,$8de6
1177 22728f    ld      ($8f72),hl
117a 210000    ld      hl,$0000
117d 226c8e    ld      ($8e6c),hl
1180 c9        ret     

1181 2a728f    ld      hl,($8f72)
1184 23        inc     hl
1185 22728f    ld      ($8f72),hl
1188 c9        ret     

1189 2a728f    ld      hl,($8f72)
118c 5e        ld      e,(hl)
118d 1600      ld      d,$00
118f d5        push    de
1190 cd932a    call    $2a93
1193 d1        pop     de
1194 c8        ret     z

1195 210600    ld      hl,$0006
1198 227c8f    ld      ($8f7c),hl
119b cd8110    call    $1081
119e 18e9      jr      $1189
11a0 c9        ret     

11a1 cda98b    call    $8ba9
11a4 cd5e10    call    $105e
11a7 210800    ld      hl,$0008
11aa 39        add     hl,sp
11ab 5e        ld      e,(hl)
11ac 23        inc     hl
11ad 56        ld      d,(hl)
11ae d5        push    de
11af cd8835    call    $3588
11b2 d1        pop     de
11b3 cd7410    call    $1074
11b6 210000    ld      hl,$0000
11b9 227c8f    ld      ($8f7c),hl
11bc 2a7a8f    ld      hl,($8f7a)
11bf 7c        ld      a,h
11c0 b5        or      l
11c1 2004      jr      nz,$11c7
11c3 210000    ld      hl,$0000
11c6 c9        ret     

11c7 2a728f    ld      hl,($8f72)
11ca 5e        ld      e,(hl)
11cb 1600      ld      d,$00
11cd 212d00    ld      hl,$002d
11d0 cd3c85    call    $853c
11d3 2803      jr      z,$11d8
11d5 cd8110    call    $1081
11d8 cd8910    call    $1089
11db 2a728f    ld      hl,($8f72)
11de 5e        ld      e,(hl)
11df 1600      ld      d,$00
11e1 212e00    ld      hl,$002e
11e4 cd3c85    call    $853c
11e7 2806      jr      z,$11ef
11e9 cd8110    call    $1081
11ec cd8910    call    $1089
11ef 2a7c8f    ld      hl,($8f7c)
11f2 7c        ld      a,h
11f3 b5        or      l
11f4 2004      jr      nz,$11fa
11f6 210000    ld      hl,$0000
11f9 c9        ret     

11fa 2a728f    ld      hl,($8f72)
11fd 5e        ld      e,(hl)
11fe 1600      ld      d,$00
1200 d5        push    de
1201 cdd284    call    $84d2
1204 d1        pop     de
1205 114500    ld      de,$0045
1208 cd3c85    call    $853c
120b 2825      jr      z,$1232
120d cd8110    call    $1081
1210 2a728f    ld      hl,($8f72)
1213 5e        ld      e,(hl)
1214 1600      ld      d,$00
1216 212b00    ld      hl,$002b
1219 cd3c85    call    $853c
121c 200e      jr      nz,$122c
121e 2a728f    ld      hl,($8f72)
1221 5e        ld      e,(hl)
1222 1600      ld      d,$00
1224 212d00    ld      hl,$002d
1227 cd3c85    call    $853c
122a 2803      jr      z,$122f
122c cd8110    call    $1081
122f cd8910    call    $1089
1232 2a7c8f    ld      hl,($8f7c)
1235 7c        ld      a,h
1236 b5        or      l
1237 2004      jr      nz,$123d
1239 210000    ld      hl,$0000
123c c9        ret     

123d 2a728f    ld      hl,($8f72)
1240 7e        ld      a,(hl)
1241 b7        or      a
1242 2804      jr      z,$1248
1244 210000    ld      hl,$0000
1247 c9        ret     

1248 217e8f    ld      hl,$8f7e
124b e5        push    hl
124c 21e68d    ld      hl,$8de6
124f e5        push    hl
1250 cd0787    call    $8707
1253 d1        pop     de
1254 e1        pop     hl
1255 cd857c    call    $7c85
1258 210100    ld      hl,$0001
125b c9        ret     

125c cda98b    call    $8ba9
125f cdc84c    call    $4cc8
1262 21798c    ld      hl,$8c79
1265 e5        push    hl
1266 cd017c    call    $7c01
1269 d1        pop     de
126a 2803      jr      z,$126f
126c c3e601    jp      $01e6
126f 210000    ld      hl,$0000
1272 e5        push    hl
1273 cddc28    call    $28dc
1276 d1        pop     de
1277 21da8c    ld      hl,$8cda
127a 22728f    ld      ($8f72),hl
127d e5        push    hl
127e cdad7b    call    $7bad
1281 d1        pop     de
1282 227a8f    ld      ($8f7a),hl
1285 c3d84b    jp      $4bd8
1288 cda98b    call    $8ba9
128b cdc84c    call    $4cc8
128e 21798c    ld      hl,$8c79
1291 e5        push    hl
1292 cd017c    call    $7c01
1295 d1        pop     de
1296 2803      jr      z,$129b
1298 c3e601    jp      $01e6
129b cd216a    call    $6a21
129e 21788f    ld      hl,$8f78
12a1 22728f    ld      ($8f72),hl
12a4 cdcf4b    call    $4bcf
12a7 c38069    jp      $6980
12aa cda98b    call    $8ba9
12ad cdc84c    call    $4cc8
12b0 21798c    ld      hl,$8c79
12b3 e5        push    hl
12b4 cd017c    call    $7c01
12b7 d1        pop     de
12b8 2803      jr      z,$12bd
12ba c3e601    jp      $01e6
12bd 210000    ld      hl,$0000
12c0 e5        push    hl
12c1 cddc28    call    $28dc
12c4 d1        pop     de
12c5 cd7c32    call    $327c
12c8 c33743    jp      $4337
12cb cd324a    call    $4a32
12ce c3d111    jp      $11d1
12d1 2af48f    ld      hl,($8ff4)
12d4 e5        push    hl
12d5 cd3936    call    $3639
12d8 d1        pop     de
12d9 cdab66    call    $66ab
12dc c37c4b    jp      $4b7c
12df cdef4a    call    $4aef
12e2 214212    ld      hl,$1242
12e5 e5        push    hl
12e6 cd8d41    call    $418d
12e9 e5        push    hl
12ea cdfa4b    call    $4bfa
12ed d1        pop     de
12ee d1        pop     de
12ef 2808      jr      z,$12f9
12f1 2ade8f    ld      hl,($8fde)
12f4 e5        push    hl
12f5 cdc941    call    $41c9
12f8 d1        pop     de
12f9 cd5f4a    call    $4a5f
12fc cd1a12    call    $121a
12ff cd0812    call    $1208
1302 cd7c4b    call    $4b7c
1305 c32d12    jp      $122d
1308 cda98b    call    $8ba9
130b 21698c    ld      hl,$8c69
130e e5        push    hl
130f cd017c    call    $7c01
1312 d1        pop     de
1313 c0        ret     nz

1314 cd8443    call    $4384
1317 c3bf50    jp      $50bf
131a cdb549    call    $49b5
131d 210200    ld      hl,$0002
1320 e5        push    hl
1321 cdde41    call    $41de
1324 2ac08f    ld      hl,($8fc0)
1327 e3        ex      (sp),hl
1328 cd6341    call    $4163
132b d1        pop     de
132c c9        ret     

132d 2ac08f    ld      hl,($8fc0)
1330 e5        push    hl
1331 cd455a    call    $5a45
1334 210300    ld      hl,$0003
1337 e3        ex      (sp),hl
1338 cdf441    call    $41f4
133b d1        pop     de
133c cdc549    call    $49c5
133f c39641    jp      $4196
1342 2ae28f    ld      hl,($8fe2)
1345 22f48f    ld      ($8ff4),hl
1348 210000    ld      hl,$0000
134b 22e28f    ld      ($8fe2),hl
134e c9        ret     

134f cdc94a    call    $4ac9
1352 2af48f    ld      hl,($8ff4)
1355 e5        push    hl
1356 cdc55a    call    $5ac5
1359 d1        pop     de
135a 281c      jr      z,$1378
135c 210000    ld      hl,$0000
135f 22ee8f    ld      ($8fee),hl
1362 22ec8f    ld      ($8fec),hl
1365 cd7c4b    call    $4b7c
1368 cdaf43    call    $43af
136b 210100    ld      hl,$0001
136e e5        push    hl
136f 21698c    ld      hl,$8c69
1372 e5        push    hl
1373 cd167c    call    $7c16
1376 d1        pop     de
1377 d1        pop     de
1378 cd3141    call    $4131
137b 2005      jr      nz,$1382
137d cd3741    call    $4137
1380 18d0      jr      $1352
1382 2af48f    ld      hl,($8ff4)
1385 eb        ex      de,hl
1386 2ad48f    ld      hl,($8fd4)
1389 cd3c85    call    $853c
138c 280d      jr      z,$139b
138e 210100    ld      hl,$0001
1391 e5        push    hl
1392 216d8c    ld      hl,$8c6d
1395 e5        push    hl
1396 cd167c    call    $7c16
1399 d1        pop     de
139a d1        pop     de
139b c36b58    jp      $586b
139e cd0b52    call    $520b
13a1 c37c4b    jp      $4b7c
13a4 cdc94a    call    $4ac9
13a7 cd1f13    call    $131f
13aa cd3141    call    $4131
13ad 206d      jr      nz,$141c
13af 2abc8f    ld      hl,($8fbc)
13b2 e5        push    hl
13b3 210500    ld      hl,$0005
13b6 e5        push    hl
13b7 cd0a42    call    $420a
13ba e3        ex      (sp),hl
13bb cd3447    call    $4734
13be d1        pop     de
13bf d1        pop     de
13c0 22ec8f    ld      ($8fec),hl
13c3 7c        ld      a,h
13c4 b5        or      l
13c5 2855      jr      z,$141c
13c7 2aec8f    ld      hl,($8fec)
13ca cdff86    call    $86ff
13cd 22ec8f    ld      ($8fec),hl
13d0 1809      jr      $13db
13d2 2aec8f    ld      hl,($8fec)
13d5 cdff86    call    $86ff
13d8 22ec8f    ld      ($8fec),hl
13db 2aec8f    ld      hl,($8fec)
13de 7c        ld      a,h
13df b5        or      l
13e0 283a      jr      z,$141c
13e2 2aec8f    ld      hl,($8fec)
13e5 cdf886    call    $86f8
13e8 22ee8f    ld      ($8fee),hl
13eb cda04b    call    $4ba0
13ee 202a      jr      nz,$141a
13f0 210000    ld      hl,$0000
13f3 22e08f    ld      ($8fe0),hl
13f6 cd3413    call    $1334
13f9 2ae08f    ld      hl,($8fe0)
13fc eb        ex      de,hl
13fd 2af48f    ld      hl,($8ff4)
1400 cd3c85    call    $853c
1403 2813      jr      z,$1418
1405 cd7c4b    call    $4b7c
1408 cdaf43    call    $43af
140b 210000    ld      hl,$0000
140e e5        push    hl
140f 21698c    ld      hl,$8c69
1412 e5        push    hl
1413 cd167c    call    $7c16
1416 d1        pop     de
1417 d1        pop     de
1418 18d1      jr      $13eb
141a 18b6      jr      $13d2
141c c39758    jp      $5897
141f cd3141    call    $4131
1422 c0        ret     nz

1423 cd8d41    call    $418d
1426 eb        ex      de,hl
1427 2abe8f    ld      hl,($8fbe)
142a cd3c85    call    $853c
142d c0        ret     nz

142e cd3741    call    $4137
1431 18ec      jr      $141f
1433 c9        ret     

1434 219e12    ld      hl,$129e
1437 e5        push    hl
1438 2aee8f    ld      hl,($8fee)
143b cdf886    call    $86f8
143e e5        push    hl
143f cdfa4b    call    $4bfa
1442 d1        pop     de
1443 d1        pop     de
1444 2847      jr      z,$148d
1446 cd1d51    call    $511d
1449 cda04b    call    $4ba0
144c c0        ret     nz

144d 2aee8f    ld      hl,($8fee)
1450 cdf886    call    $86f8
1453 e5        push    hl
1454 cd5646    call    $4656
1457 d1        pop     de
1458 2831      jr      z,$148b
145a cd5e10    call    $105e
145d 2aee8f    ld      hl,($8fee)
1460 cdf886    call    $86f8
1463 e5        push    hl
1464 cd8835    call    $3588
1467 d1        pop     de
1468 cd7410    call    $1074
146b 2a7a8f    ld      hl,($8f7a)
146e 7c        ld      a,h
146f b5        or      l
1470 2819      jr      z,$148b
1472 cdcd28    call    $28cd
1475 2ae68d    ld      hl,($8de6)
1478 2600      ld      h,$00
147a 112200    ld      de,$0022
147d cd3c85    call    $853c
1480 2809      jr      z,$148b
1482 cdf231    call    $31f2
1485 cdaa41    call    $41aa
1488 22e08f    ld      ($8fe0),hl
148b 1823      jr      $14b0
148d 2aee8f    ld      hl,($8fee)
1490 cdf886    call    $86f8
1493 eb        ex      de,hl
1494 2ada8f    ld      hl,($8fda)
1497 cd3c85    call    $853c
149a 2814      jr      z,$14b0
149c cd1d51    call    $511d
149f cda04b    call    $4ba0
14a2 c0        ret     nz

14a3 cd3413    call    $1334
14a6 cd904b    call    $4b90
14a9 2005      jr      nz,$14b0
14ab cd1d51    call    $511d
14ae 18f6      jr      $14a6
14b0 c31d51    jp      $511d
14b3 2aa98c    ld      hl,($8ca9)
14b6 e5        push    hl
14b7 cd5630    call    $3056
14ba d1        pop     de
14bb c33743    jp      $4337
14be cd2543    call    $4325
14c1 cd1c3b    call    $3b1c
14c4 cd2f3b    call    $3b2f
14c7 2813      jr      z,$14dc
14c9 cd8d41    call    $418d
14cc e5        push    hl
14cd 2aad8c    ld      hl,($8cad)
14d0 e5        push    hl
14d1 cd7d45    call    $457d
14d4 d1        pop     de
14d5 e3        ex      (sp),hl
14d6 cdc941    call    $41c9
14d9 d1        pop     de
14da 18e8      jr      $14c4
14dc c33743    jp      $4337
14df 210100    ld      hl,$0001
14e2 22a18c    ld      ($8ca1),hl
14e5 c3763c    jp      $3c76
14e8 210000    ld      hl,$0000
14eb 22a18c    ld      ($8ca1),hl
14ee c37d3c    jp      $3c7d
14f1 2af48f    ld      hl,($8ff4)
14f4 e5        push    hl
14f5 2ab28f    ld      hl,($8fb2)
14f8 e5        push    hl
14f9 cd4649    call    $4946
14fc d1        pop     de
14fd d1        pop     de
14fe 22b28f    ld      ($8fb2),hl
1501 c9        ret     

1502 2ab28f    ld      hl,($8fb2)
1505 e5        push    hl
1506 2af48f    ld      hl,($8ff4)
1509 e5        push    hl
150a cd7d45    call    $457d
150d d1        pop     de
150e d1        pop     de
150f 22b28f    ld      ($8fb2),hl
1512 c9        ret     

1513 cd904b    call    $4b90
1516 280a      jr      z,$1522
1518 2ab48f    ld      hl,($8fb4)
151b e5        push    hl
151c cd6341    call    $4163
151f d1        pop     de
1520 1803      jr      $1525
1522 cd6219    call    $1962
1525 21f113    ld      hl,$13f1
1528 e5        push    hl
1529 cd5914    call    $1459
152c d1        pop     de
152d 210214    ld      hl,$1402
1530 e5        push    hl
1531 cd5914    call    $1459
1534 d1        pop     de
1535 cd9641    call    $4196
1538 c37c4b    jp      $4b7c
153b cd904b    call    $4b90
153e 2808      jr      z,$1548
1540 210000    ld      hl,$0000
1543 22b28f    ld      ($8fb2),hl
1546 180e      jr      $1556
1548 cd6219    call    $1962
154b 21f113    ld      hl,$13f1
154e e5        push    hl
154f cd5914    call    $1459
1552 d1        pop     de
1553 cd9641    call    $4196
1556 c37c4b    jp      $4b7c
1559 cda98b    call    $8ba9
155c cd8d41    call    $418d
155f 44        ld      b,h
1560 4d        ld      c,l
1561 1807      jr      $156a
1563 60        ld      h,b
1564 69        ld      l,c
1565 cdff86    call    $86ff
1568 44        ld      b,h
1569 4d        ld      c,l
156a 78        ld      a,b
156b b1        or      c
156c c8        ret     z

156d 60        ld      h,b
156e 69        ld      l,c
156f cdf886    call    $86f8
1572 22f48f    ld      ($8ff4),hl
1575 210800    ld      hl,$0008
1578 39        add     hl,sp
1579 5e        ld      e,(hl)
157a 23        inc     hl
157b 56        ld      d,(hl)
157c eb        ex      de,hl
157d cd0485    call    $8504
1580 18e1      jr      $1563
1582 c9        ret     

1583 cdef4a    call    $4aef
1586 cd324a    call    $4a32
1589 cd8d41    call    $418d
158c e5        push    hl
158d 2af48f    ld      hl,($8ff4)
1590 e5        push    hl
1591 cd0f15    call    $150f
1594 d1        pop     de
1595 d1        pop     de
1596 c39641    jp      $4196
1599 210100    ld      hl,$0001
159c e5        push    hl
159d cdd249    call    $49d2
15a0 e3        ex      (sp),hl
15a1 cda614    call    $14a6
15a4 d1        pop     de
15a5 c9        ret     

15a6 cda98b    call    $8ba9
15a9 210800    ld      hl,$0008
15ac 39        add     hl,sp
15ad 4e        ld      c,(hl)
15ae 23        inc     hl
15af 46        ld      b,(hl)
15b0 c5        push    bc
15b1 cdee49    call    $49ee
15b4 d1        pop     de
15b5 2803      jr      z,$15ba
15b7 c37c4b    jp      $4b7c
15ba cdc94a    call    $4ac9
15bd 210000    ld      hl,$0000
15c0 e5        push    hl
15c1 2af48f    ld      hl,($8ff4)
15c4 e5        push    hl
15c5 cd8116    call    $1681
15c8 d1        pop     de
15c9 d1        pop     de
15ca cd7266    call    $6672
15cd 60        ld      h,b
15ce 69        ld      l,c
15cf 2b        dec     hl
15d0 e5        push    hl
15d1 cda614    call    $14a6
15d4 d1        pop     de
15d5 c9        ret     

15d6 cdc94a    call    $4ac9
15d9 2af48f    ld      hl,($8ff4)
15dc e5        push    hl
15dd cdaf16    call    $16af
15e0 d1        pop     de
15e1 200f      jr      nz,$15f2
15e3 2ac48f    ld      hl,($8fc4)
15e6 e5        push    hl
15e7 2af48f    ld      hl,($8ff4)
15ea e5        push    hl
15eb cd0147    call    $4701
15ee d1        pop     de
15ef d1        pop     de
15f0 2805      jr      z,$15f7
15f2 210000    ld      hl,$0000
15f5 1803      jr      $15fa
15f7 210100    ld      hl,$0001
15fa cdf685    call    $85f6
15fd e5        push    hl
15fe cd6353    call    $5363
1601 d1        pop     de
1602 c9        ret     

1603 cdc94a    call    $4ac9
1606 2af48f    ld      hl,($8ff4)
1609 e5        push    hl
160a cd6e51    call    $516e
160d d1        pop     de
160e c9        ret     

160f cda98b    call    $8ba9
1612 210800    ld      hl,$0008
1615 39        add     hl,sp
1616 4e        ld      c,(hl)
1617 23        inc     hl
1618 46        ld      b,(hl)
1619 210a00    ld      hl,$000a
161c 39        add     hl,sp
161d 5e        ld      e,(hl)
161e 23        inc     hl
161f 56        ld      d,(hl)
1620 eb        ex      de,hl
1621 229e90    ld      ($909e),hl
1624 e5        push    hl
1625 cdaf16    call    $16af
1628 d1        pop     de
1629 229c90    ld      ($909c),hl
162c 7c        ld      a,h
162d b5        or      l
162e 2023      jr      nz,$1653
1630 c5        push    bc
1631 cd6341    call    $4163
1634 2a9e90    ld      hl,($909e)
1637 e3        ex      (sp),hl
1638 cd6341    call    $4163
163b d1        pop     de
163c c5        push    bc
163d 2ac48f    ld      hl,($8fc4)
1640 e5        push    hl
1641 2a9e90    ld      hl,($909e)
1644 e5        push    hl
1645 cd5c47    call    $475c
1648 d1        pop     de
1649 d1        pop     de
164a d1        pop     de
164b cd9641    call    $4196
164e cd9641    call    $4196
1651 180a      jr      $165d
1653 c5        push    bc
1654 2a9c90    ld      hl,($909c)
1657 e5        push    hl
1658 cd9844    call    $4498
165b d1        pop     de
165c d1        pop     de
165d 2aa18c    ld      hl,($8ca1)
1660 7c        ld      a,h
1661 b5        or      l
1662 281d      jr      z,$1681
1664 cd8c53    call    $538c
1667 218415    ld      hl,$1584
166a e5        push    hl
166b cd1c67    call    $671c
166e 2a9e90    ld      hl,($909e)
1671 e3        ex      (sp),hl
1672 cd3135    call    $3531
1675 d1        pop     de
1676 cdd76b    call    $6bd7
1679 c5        push    bc
167a cd3936    call    $3639
167d d1        pop     de
167e cdab66    call    $66ab
1681 c37c4b    jp      $4b7c
1684 6d        ld      l,l
1685 61        ld      h,c
1686 6b        ld      l,e
1687 69        ld      l,c
1688 6e        ld      l,(hl)
1689 67        ld      h,a
168a 2022      jr      nz,$16ae
168c 00        nop     
168d cdef4a    call    $4aef
1690 cdc94a    call    $4ac9
1693 2af48f    ld      hl,($8ff4)
1696 e5        push    hl
1697 cdaa41    call    $41aa
169a e5        push    hl
169b cd3447    call    $4734
169e d1        pop     de
169f d1        pop     de
16a0 22f48f    ld      ($8ff4),hl
16a3 c9        ret     

16a4 cdc94a    call    $4ac9
16a7 2af48f    ld      hl,($8ff4)
16aa e5        push    hl
16ab cd5648    call    $4856
16ae d1        pop     de
16af 22f48f    ld      ($8ff4),hl
16b2 c9        ret     

16b3 cdef4a    call    $4aef
16b6 cdef4a    call    $4aef
16b9 cd554a    call    $4a55
16bc e5        push    hl
16bd cd8d41    call    $418d
16c0 e5        push    hl
16c1 210100    ld      hl,$0001
16c4 e5        push    hl
16c5 cd0a42    call    $420a
16c8 e3        ex      (sp),hl
16c9 cd5c47    call    $475c
16cc d1        pop     de
16cd d1        pop     de
16ce d1        pop     de
16cf cd9641    call    $4196
16d2 cd9641    call    $4196
16d5 c37c4b    jp      $4b7c
16d8 cda98b    call    $8ba9
16db cd2543    call    $4325
16de cd2543    call    $4325
16e1 210100    ld      hl,$0001
16e4 e5        push    hl
16e5 cdf53a    call    $3af5
16e8 d1        pop     de
16e9 cd8d41    call    $418d
16ec 44        ld      b,h
16ed 4d        ld      c,l
16ee 180c      jr      $16fc
16f0 60        ld      h,b
16f1 69        ld      l,c
16f2 cdff86    call    $86ff
16f5 44        ld      b,h
16f6 4d        ld      c,l
16f7 e5        push    hl
16f8 cdc941    call    $41c9
16fb d1        pop     de
16fc 78        ld      a,b
16fd b1        or      c
16fe 2841      jr      z,$1741
1700 60        ld      h,b
1701 69        ld      l,c
1702 cdf886    call    $86f8
1705 e5        push    hl
1706 cdd33b    call    $3bd3
1709 d1        pop     de
170a cde63b    call    $3be6
170d 2830      jr      z,$173f
170f cd183c    call    $3c18
1712 20f6      jr      nz,$170a
1714 cdab66    call    $66ab
1717 60        ld      h,b
1718 69        ld      l,c
1719 cdf886    call    $86f8
171c e5        push    hl
171d cd8835    call    $3588
1720 214716    ld      hl,$1647
1723 e3        ex      (sp),hl
1724 cd0967    call    $6709
1727 2ab38c    ld      hl,($8cb3)
172a e3        ex      (sp),hl
172b cd3936    call    $3639
172e 214b16    ld      hl,$164b
1731 e3        ex      (sp),hl
1732 cd0967    call    $6709
1735 2ab58c    ld      hl,($8cb5)
1738 e3        ex      (sp),hl
1739 cd3936    call    $3639
173c d1        pop     de
173d 18cb      jr      $170a
173f 18af      jr      $16f0
1741 cd7c4b    call    $4b7c
1744 c39641    jp      $4196
1747 27        daa     
1748 73        ld      (hl),e
1749 2000      jr      nz,$174b
174b 2069      jr      nz,$17b6
174d 73        ld      (hl),e
174e 2000      jr      nz,$1750
1750 cdef4a    call    $4aef
1753 cdc94a    call    $4ac9
1756 2af48f    ld      hl,($8ff4)
1759 e5        push    hl
175a cdaa41    call    $41aa
175d e5        push    hl
175e cdf347    call    $47f3
1761 d1        pop     de
1762 d1        pop     de
1763 c37c4b    jp      $4b7c
1766 cdef4a    call    $4aef
1769 cd2543    call    $4325
176c cd2543    call    $4325
176f 210200    ld      hl,$0002
1772 e5        push    hl
1773 cd0a42    call    $420a
1776 e3        ex      (sp),hl
1777 cdf53a    call    $3af5
177a d1        pop     de
177b cd3743    call    $4337
177e c39641    jp      $4196
1781 cda98b    call    $8ba9
1784 210a00    ld      hl,$000a
1787 39        add     hl,sp
1788 5e        ld      e,(hl)
1789 23        inc     hl
178a 56        ld      d,(hl)
178b d5        push    de
178c 210a00    ld      hl,$000a
178f 39        add     hl,sp
1790 5e        ld      e,(hl)
1791 23        inc     hl
1792 56        ld      d,(hl)
1793 d5        push    de
1794 cd7d45    call    $457d
1797 d1        pop     de
1798 e3        ex      (sp),hl
1799 cd6341    call    $4163
179c 2aea8f    ld      hl,($8fea)
179f e3        ex      (sp),hl
17a0 cd8d41    call    $418d
17a3 e5        push    hl
17a4 cd7d45    call    $457d
17a7 d1        pop     de
17a8 d1        pop     de
17a9 22ea8f    ld      ($8fea),hl
17ac c39641    jp      $4196
17af cda98b    call    $8ba9
17b2 2aea8f    ld      hl,($8fea)
17b5 44        ld      b,h
17b6 4d        ld      c,l
17b7 1807      jr      $17c0
17b9 60        ld      h,b
17ba 69        ld      l,c
17bb cdff86    call    $86ff
17be 44        ld      b,h
17bf 4d        ld      c,l
17c0 78        ld      a,b
17c1 b1        or      c
17c2 281d      jr      z,$17e1
17c4 60        ld      h,b
17c5 69        ld      l,c
17c6 cdf886    call    $86f8
17c9 cdf886    call    $86f8
17cc eb        ex      de,hl
17cd 210800    ld      hl,$0008
17d0 39        add     hl,sp
17d1 7e        ld      a,(hl)
17d2 23        inc     hl
17d3 66        ld      h,(hl)
17d4 6f        ld      l,a
17d5 cd3c85    call    $853c
17d8 2805      jr      z,$17df
17da 60        ld      h,b
17db 69        ld      l,c
17dc c3f886    jp      $86f8
17df 18d8      jr      $17b9
17e1 210000    ld      hl,$0000
17e4 c9        ret     

17e5 210200    ld      hl,$0002
17e8 e5        push    hl
17e9 cdde41    call    $41de
17ec 2ac68f    ld      hl,($8fc6)
17ef e3        ex      (sp),hl
17f0 cdf53a    call    $3af5
17f3 2ac68f    ld      hl,($8fc6)
17f6 e3        ex      (sp),hl
17f7 cd8537    call    $3785
17fa d1        pop     de
17fb c9        ret     

17fc cdd84a    call    $4ad8
17ff cd554a    call    $4a55
1802 e5        push    hl
1803 cdd944    call    $44d9
1806 d1        pop     de
1807 2803      jr      z,$180c
1809 cd3b55    call    $553b
180c 2af48f    ld      hl,($8ff4)
180f cdf886    call    $86f8
1812 e5        push    hl
1813 cd3d17    call    $173d
1816 d1        pop     de
1817 2af48f    ld      hl,($8ff4)
181a cdff86    call    $86ff
181d e5        push    hl
181e cd6a17    call    $176a
1821 d1        pop     de
1822 cd6e4b    call    $4b6e
1825 2af48f    ld      hl,($8ff4)
1828 e5        push    hl
1829 2abc8f    ld      hl,($8fbc)
182c e5        push    hl
182d cd8d41    call    $418d
1830 e5        push    hl
1831 cd5c47    call    $475c
1834 d1        pop     de
1835 d1        pop     de
1836 d1        pop     de
1837 cd9641    call    $4196
183a c37c4b    jp      $4b7c
183d cda98b    call    $8ba9
1840 210800    ld      hl,$0008
1843 39        add     hl,sp
1844 4e        ld      c,(hl)
1845 23        inc     hl
1846 46        ld      b,(hl)
1847 c5        push    bc
1848 cd0d45    call    $450d
184b d1        pop     de
184c 2803      jr      z,$1851
184e cd3b55    call    $553b
1851 1807      jr      $185a
1853 60        ld      h,b
1854 69        ld      l,c
1855 cdff86    call    $86ff
1858 44        ld      b,h
1859 4d        ld      c,l
185a 78        ld      a,b
185b b1        or      c
185c c8        ret     z

185d 60        ld      h,b
185e 69        ld      l,c
185f cdf886    call    $86f8
1862 e5        push    hl
1863 cdec4c    call    $4cec
1866 d1        pop     de
1867 18ea      jr      $1853
1869 c9        ret     

186a cda98b    call    $8ba9
186d 210800    ld      hl,$0008
1870 39        add     hl,sp
1871 4e        ld      c,(hl)
1872 23        inc     hl
1873 46        ld      b,(hl)
1874 1807      jr      $187d
1876 60        ld      h,b
1877 69        ld      l,c
1878 cdff86    call    $86ff
187b 44        ld      b,h
187c 4d        ld      c,l
187d 78        ld      a,b
187e b1        or      c
187f c8        ret     z

1880 60        ld      h,b
1881 69        ld      l,c
1882 cdf886    call    $86f8
1885 e5        push    hl
1886 cdd944    call    $44d9
1889 d1        pop     de
188a 2803      jr      z,$188f
188c cd3b55    call    $553b
188f 18e5      jr      $1876
1891 c9        ret     

1892 cdc94a    call    $4ac9
1895 2abc8f    ld      hl,($8fbc)
1898 e5        push    hl
1899 2af48f    ld      hl,($8ff4)
189c e5        push    hl
189d cd3447    call    $4734
18a0 d1        pop     de
18a1 d1        pop     de
18a2 22f48f    ld      ($8ff4),hl
18a5 c9        ret     

18a6 cd2543    call    $4325
18a9 cd1c43    call    $431c
18ac cd3538    call    $3835
18af cdb337    call    $37b3
18b2 210100    ld      hl,$0001
18b5 e5        push    hl
18b6 cdaa41    call    $41aa
18b9 e5        push    hl
18ba cdb538    call    $38b5
18bd d1        pop     de
18be d1        pop     de
18bf cdfc37    call    $37fc
18c2 210200    ld      hl,$0002
18c5 e5        push    hl
18c6 cdaa41    call    $41aa
18c9 e5        push    hl
18ca cdb538    call    $38b5
18cd d1        pop     de
18ce d1        pop     de
18cf cd6438    call    $3864
18d2 c30838    jp      $3808
18d5 cda98b    call    $8ba9
18d8 cd904b    call    $4b90
18db 2834      jr      z,$1911
18dd 2ab78c    ld      hl,($8cb7)
18e0 7c        ld      a,h
18e1 b5        or      l
18e2 2819      jr      z,$18fd
18e4 210100    ld      hl,$0001
18e7 e5        push    hl
18e8 2ab78c    ld      hl,($8cb7)
18eb e5        push    hl
18ec cd2c46    call    $462c
18ef e3        ex      (sp),hl
18f0 cd9738    call    $3897
18f3 d1        pop     de
18f4 d1        pop     de
18f5 210000    ld      hl,$0000
18f8 22b78c    ld      ($8cb7),hl
18fb 1812      jr      $190f
18fd 2ad28c    ld      hl,($8cd2)
1900 7c        ld      a,h
1901 b5        or      l
1902 2808      jr      z,$190c
1904 2acb8c    ld      hl,($8ccb)
1907 22c38c    ld      ($8cc3),hl
190a 1803      jr      $190f
190c cd9c5b    call    $5b9c
190f 1854      jr      $1965
1911 cd4a19    call    $194a
1914 cd8d41    call    $418d
1917 44        ld      b,h
1918 4d        ld      c,l
1919 1807      jr      $1922
191b 60        ld      h,b
191c 69        ld      l,c
191d cdff86    call    $86ff
1920 44        ld      b,h
1921 4d        ld      c,l
1922 78        ld      a,b
1923 b1        or      c
1924 2820      jr      z,$1946
1926 60        ld      h,b
1927 69        ld      l,c
1928 cdf886    call    $86f8
192b 22f48f    ld      ($8ff4),hl
192e e5        push    hl
192f cdec4c    call    $4cec
1932 2ac48f    ld      hl,($8fc4)
1935 e3        ex      (sp),hl
1936 2af48f    ld      hl,($8ff4)
1939 e5        push    hl
193a cd0147    call    $4701
193d d1        pop     de
193e d1        pop     de
193f 20da      jr      nz,$191b
1941 cd3b4b    call    $4b3b
1944 18d5      jr      $191b
1946 cd3538    call    $3835
1949 210100    ld      hl,$0001
194c e5        push    hl
194d cd8d41    call    $418d
1950 e5        push    hl
1951 cdb538    call    $38b5
1954 d1        pop     de
1955 210200    ld      hl,$0002
1958 e3        ex      (sp),hl
1959 cdaa41    call    $41aa
195c e5        push    hl
195d cdb538    call    $38b5
1960 d1        pop     de
1961 d1        pop     de
1962 cd6438    call    $3864
1965 c30838    jp      $3808
1968 cd763c    call    $3c76
196b cd4a19    call    $194a
196e 210000    ld      hl,$0000
1971 e5        push    hl
1972 2ac48f    ld      hl,($8fc4)
1975 e5        push    hl
1976 2abc8f    ld      hl,($8fbc)
1979 e5        push    hl
197a cd8519    call    $1985
197d d1        pop     de
197e d1        pop     de
197f 210100    ld      hl,$0001
1982 e3        ex      (sp),hl
1983 cd8d41    call    $418d
1986 e5        push    hl
1987 cdb538    call    $38b5
198a d1        pop     de
198b 210200    ld      hl,$0002
198e e3        ex      (sp),hl
198f cdaa41    call    $41aa
1992 e5        push    hl
1993 cdb538    call    $38b5
1996 d1        pop     de
1997 d1        pop     de
1998 cd7d3c    call    $3c7d
199b c37c4b    jp      $4b7c
199e cd763c    call    $3c76
19a1 cd2543    call    $4325
19a4 cd1c43    call    $431c
19a7 cdfe18    call    $18fe
19aa cdde18    call    $18de
19ad cd7d3c    call    $3c7d
19b0 c37c4b    jp      $4b7c
19b3 cd763c    call    $3c76
19b6 cd2543    call    $4325
19b9 cdb337    call    $37b3
19bc 210000    ld      hl,$0000
19bf e5        push    hl
19c0 cdaa41    call    $41aa
19c3 e5        push    hl
19c4 cdb538    call    $38b5
19c7 d1        pop     de
19c8 d1        pop     de
19c9 cd7d3c    call    $3c7d
19cc c37c4b    jp      $4b7c
19cf cd763c    call    $3c76
19d2 cd2543    call    $4325
19d5 cdde18    call    $18de
19d8 cd7d3c    call    $3c7d
19db c37c4b    jp      $4b7c
19de cdfc37    call    $37fc
19e1 210200    ld      hl,$0002
19e4 e5        push    hl
19e5 cdaa41    call    $41aa
19e8 e5        push    hl
19e9 cdb538    call    $38b5
19ec d1        pop     de
19ed d1        pop     de
19ee c9        ret     

19ef cd763c    call    $3c76
19f2 cd2543    call    $4325
19f5 cdfe18    call    $18fe
19f8 cd7d3c    call    $3c7d
19fb c37c4b    jp      $4b7c
19fe cdb337    call    $37b3
1a01 210100    ld      hl,$0001
1a04 e5        push    hl
1a05 cdaa41    call    $41aa
1a08 e5        push    hl
1a09 cdb538    call    $38b5
1a0c d1        pop     de
1a0d d1        pop     de
1a0e c9        ret     

1a0f cd2543    call    $4325
1a12 cd1c43    call    $431c
1a15 cd1c43    call    $431c
1a18 cd3e19    call    $193e
1a1b cd4419    call    $1944
1a1e cd9641    call    $4196
1a21 c37c4b    jp      $4b7c
1a24 cd6219    call    $1962
1a27 cd7237    call    $3772
1a2a c37c4b    jp      $4b7c
1a2d cd4a19    call    $194a
1a30 2ac48f    ld      hl,($8fc4)
1a33 e5        push    hl
1a34 cd6e19    call    $196e
1a37 d1        pop     de
1a38 cd6937    call    $3769
1a3b c37c4b    jp      $4b7c
1a3e cdfc37    call    $37fc
1a41 c36937    jp      $3769
1a44 cdb337    call    $37b3
1a47 c37237    jp      $3772
1a4a cd554a    call    $4a55
1a4d e5        push    hl
1a4e cdd944    call    $44d9
1a51 d1        pop     de
1a52 280b      jr      z,$1a5f
1a54 2af48f    ld      hl,($8ff4)
1a57 e5        push    hl
1a58 cd2c46    call    $462c
1a5b d1        pop     de
1a5c 22f48f    ld      ($8ff4),hl
1a5f c32e43    jp      $432e
1a62 cd4a19    call    $194a
1a65 2abc8f    ld      hl,($8fbc)
1a68 e5        push    hl
1a69 cd6e19    call    $196e
1a6c d1        pop     de
1a6d c9        ret     

1a6e cda98b    call    $8ba9
1a71 210800    ld      hl,$0008
1a74 39        add     hl,sp
1a75 4e        ld      c,(hl)
1a76 23        inc     hl
1a77 46        ld      b,(hl)
1a78 210000    ld      hl,$0000
1a7b e5        push    hl
1a7c c5        push    bc
1a7d c5        push    bc
1a7e cd8519    call    $1985
1a81 d1        pop     de
1a82 d1        pop     de
1a83 d1        pop     de
1a84 c9        ret     

1a85 cda98b    call    $8ba9
1a88 cd8d41    call    $418d
1a8b 44        ld      b,h
1a8c 4d        ld      c,l
1a8d 180a      jr      $1a99
1a8f cd9641    call    $4196
1a92 60        ld      h,b
1a93 69        ld      l,c
1a94 cdff86    call    $86ff
1a97 44        ld      b,h
1a98 4d        ld      c,l
1a99 78        ld      a,b
1a9a b1        or      c
1a9b c8        ret     z

1a9c 60        ld      h,b
1a9d 69        ld      l,c
1a9e cdf886    call    $86f8
1aa1 22f48f    ld      ($8ff4),hl
1aa4 e5        push    hl
1aa5 cdec4c    call    $4cec
1aa8 d1        pop     de
1aa9 cd2e43    call    $432e
1aac 210c00    ld      hl,$000c
1aaf 39        add     hl,sp
1ab0 7e        ld      a,(hl)
1ab1 23        inc     hl
1ab2 b6        or      (hl)
1ab3 280d      jr      z,$1ac2
1ab5 2af48f    ld      hl,($8ff4)
1ab8 e5        push    hl
1ab9 cdd33b    call    $3bd3
1abc d1        pop     de
1abd cdbc3b    call    $3bbc
1ac0 28cd      jr      z,$1a8f
1ac2 210800    ld      hl,$0008
1ac5 39        add     hl,sp
1ac6 5e        ld      e,(hl)
1ac7 23        inc     hl
1ac8 56        ld      d,(hl)
1ac9 d5        push    de
1aca cddb3a    call    $3adb
1acd d1        pop     de
1ace 2011      jr      nz,$1ae1
1ad0 210a00    ld      hl,$000a
1ad3 39        add     hl,sp
1ad4 5e        ld      e,(hl)
1ad5 23        inc     hl
1ad6 56        ld      d,(hl)
1ad7 d5        push    de
1ad8 cddb3a    call    $3adb
1adb d1        pop     de
1adc 2003      jr      nz,$1ae1
1ade cd3b55    call    $553b
1ae1 18ac      jr      $1a8f
1ae3 c9        ret     

1ae4 50        ld      d,b
1ae5 55        ld      d,l
1ae6 00        nop     
1ae7 50        ld      d,b
1ae8 44        ld      b,h
1ae9 00        nop     
1aea 50        ld      d,b
1aeb 58        ld      e,b
1aec 00        nop     
1aed 50        ld      d,b
1aee 45        ld      b,l
1aef 00        nop     
1af0 cd6c4a    call    $4a6c
1af3 cd534c    call    $4c53
1af6 c3e081    jp      $81e0
1af9 cda98b    call    $8ba9
1afc 210a00    ld      hl,$000a
1aff 39        add     hl,sp
1b00 4e        ld      c,(hl)
1b01 23        inc     hl
1b02 46        ld      b,(hl)
1b03 210800    ld      hl,$0008
1b06 39        add     hl,sp
1b07 5e        ld      e,(hl)
1b08 23        inc     hl
1b09 56        ld      d,(hl)
1b0a 60        ld      h,b
1b0b 69        ld      l,c
1b0c cd5585    call    $8555
1b0f 2803      jr      z,$1b14
1b11 60        ld      h,b
1b12 69        ld      l,c
1b13 c9        ret     

1b14 210800    ld      hl,$0008
1b17 39        add     hl,sp
1b18 5e        ld      e,(hl)
1b19 23        inc     hl
1b1a 56        ld      d,(hl)
1b1b eb        ex      de,hl
1b1c 23        inc     hl
1b1d c9        ret     

1b1e 2a498c    ld      hl,($8c49)
1b21 e5        push    hl
1b22 cd114b    call    $4b11
1b25 d1        pop     de
1b26 c9        ret     

1b27 cda98b    call    $8ba9
1b2a cd4d1f    call    $1f4d
1b2d 21a090    ld      hl,$90a0
1b30 e5        push    hl
1b31 cdbd4a    call    $4abd
1b34 e1        pop     hl
1b35 cd857c    call    $7c85
1b38 cd517c    call    $7c51
1b3b c28000    jp      nz,$0080
1b3e 00        nop     
1b3f 00        nop     
1b40 00        nop     
1b41 00        nop     
1b42 00        nop     
1b43 cd0780    call    $8007
1b46 281f      jr      z,$1b67
1b48 21a090    ld      hl,$90a0
1b4b cd667c    call    $7c66
1b4e cd517c    call    $7c51
1b51 42        ld      b,d
1b52 7f        ld      a,a
1b53 ff        rst     $38
1b54 00        nop     
1b55 00        nop     
1b56 00        nop     
1b57 00        nop     
1b58 00        nop     
1b59 cdfb7f    call    $7ffb
1b5c 2809      jr      z,$1b67
1b5e cd7c4b    call    $4b7c
1b61 21a090    ld      hl,$90a0
1b64 c3667c    jp      $7c66
1b67 c33b55    jp      $553b
1b6a cd6c4a    call    $4a6c
1b6d c35c4c    jp      $4c5c
1b70 cd5f4a    call    $4a5f
1b73 2af48f    ld      hl,($8ff4)
1b76 22f68f    ld      ($8ff6),hl
1b79 c9        ret     

1b7a 2af68f    ld      hl,($8ff6)
1b7d 7c        ld      a,h
1b7e b5        or      l
1b7f 2003      jr      nz,$1b84
1b81 cde556    call    $56e5
1b84 2af68f    ld      hl,($8ff6)
1b87 cdf886    call    $86f8
1b8a e5        push    hl
1b8b cd6341    call    $4163
1b8e d1        pop     de
1b8f c9        ret     

1b90 cd7a1a    call    $1a7a
1b93 cd8d41    call    $418d
1b96 e5        push    hl
1b97 cd2545    call    $4525
1b9a d1        pop     de
1b9b 2015      jr      nz,$1bb2
1b9d cd8d41    call    $418d
1ba0 e5        push    hl
1ba1 cd824a    call    $4a82
1ba4 d1        pop     de
1ba5 2808      jr      z,$1baf
1ba7 cd9641    call    $4196
1baa cd1831    call    $3118
1bad 1803      jr      $1bb2
1baf cd3b55    call    $553b
1bb2 2af68f    ld      hl,($8ff6)
1bb5 cdff86    call    $86ff
1bb8 22f68f    ld      ($8ff6),hl
1bbb c9        ret     

1bbc cd701a    call    $1a70
1bbf cd901a    call    $1a90
1bc2 c3901a    jp      $1a90
1bc5 cdaa41    call    $41aa
1bc8 e5        push    hl
1bc9 cd9f45    call    $459f
1bcc d1        pop     de
1bcd c9        ret     

1bce cda98b    call    $8ba9
1bd1 cd901a    call    $1a90
1bd4 cdc51a    call    $1ac5
1bd7 cde681    call    $81e6
1bda 44        ld      b,h
1bdb 4d        ld      c,l
1bdc eb        ex      de,hl
1bdd 210800    ld      hl,$0008
1be0 39        add     hl,sp
1be1 7e        ld      a,(hl)
1be2 23        inc     hl
1be3 66        ld      h,(hl)
1be4 6f        ld      l,a
1be5 cd6d85    call    $856d
1be8 200a      jr      nz,$1bf4
1bea 50        ld      d,b
1beb 59        ld      e,c
1bec 210000    ld      hl,$0000
1bef cd6c85    call    $856c
1bf2 2803      jr      z,$1bf7
1bf4 cd3b55    call    $553b
1bf7 60        ld      h,b
1bf8 69        ld      l,c
1bf9 c9        ret     

1bfa 21858c    ld      hl,$8c85
1bfd cd667c    call    $7c66
1c00 cda77c    call    $7ca7
1c03 21858c    ld      hl,$8c85
1c06 cd667c    call    $7c66
1c09 cda77c    call    $7ca7
1c0c cd656e    call    $6e65
1c0f eb        ex      de,hl
1c10 211000    ld      hl,$0010
1c13 39        add     hl,sp
1c14 f9        ld      sp,hl
1c15 21858c    ld      hl,$8c85
1c18 cd667c    call    $7c66
1c1b cda77c    call    $7ca7
1c1e cdad6e    call    $6ead
1c21 eb        ex      de,hl
1c22 cda08b    call    $8ba0
1c25 c9        ret     

1c26 cd4d1f    call    $1f4d
1c29 cdbd4a    call    $4abd
1c2c cd127d    call    $7d12
1c2f cda77c    call    $7ca7
1c32 cd056e    call    $6e05
1c35 eb        ex      de,hl
1c36 cda08b    call    $8ba0
1c39 c37c4b    jp      $4b7c
1c3c cd4d1f    call    $1f4d
1c3f c3da6e    jp      $6eda
1c42 cd3c1b    call    $1b3c
1c45 cda96d    call    $6da9
1c48 cdfa1a    call    $1afa
1c4b c39a6d    jp      $6d9a
1c4e cdbc1a    call    $1abc
1c51 cd4d1f    call    $1f4d
1c54 cdc51a    call    $1ac5
1c57 cda77c    call    $7ca7
1c5a cdc51a    call    $1ac5
1c5d cda77c    call    $7ca7
1c60 cd7a6f    call    $6f7a
1c63 eb        ex      de,hl
1c64 211000    ld      hl,$0010
1c67 39        add     hl,sp
1c68 f9        ld      sp,hl
1c69 c37c4b    jp      $4b7c
1c6c cd4d1f    call    $1f4d
1c6f cdbd4a    call    $4abd
1c72 cda77c    call    $7ca7
1c75 cd056e    call    $6e05
1c78 eb        ex      de,hl
1c79 cda08b    call    $8ba0
1c7c c37c4b    jp      $4b7c
1c7f cddb6f    call    $6fdb
1c82 cda77c    call    $7ca7
1c85 cd0331    call    $3103
1c88 eb        ex      de,hl
1c89 cda08b    call    $8ba0
1c8c cde16f    call    $6fe1
1c8f cda77c    call    $7ca7
1c92 cd0331    call    $3103
1c95 eb        ex      de,hl
1c96 cda08b    call    $8ba0
1c99 cdd46e    call    $6ed4
1c9c cda77c    call    $7ca7
1c9f cd0331    call    $3103
1ca2 eb        ex      de,hl
1ca3 cda08b    call    $8ba0
1ca6 cdcf6d    call    $6dcf
1ca9 29        add     hl,hl
1caa 11b090    ld      de,$90b0
1cad 19        add     hl,de
1cae 5e        ld      e,(hl)
1caf 23        inc     hl
1cb0 56        ld      d,(hl)
1cb1 d5        push    de
1cb2 cd4059    call    $5940
1cb5 d1        pop     de
1cb6 cdfe6d    call    $6dfe
1cb9 e5        push    hl
1cba cd5630    call    $3056
1cbd d1        pop     de
1cbe cd4070    call    $7040
1cc1 e5        push    hl
1cc2 cd6353    call    $5363
1cc5 d1        pop     de
1cc6 cd2e43    call    $432e
1cc9 210600    ld      hl,$0006
1ccc e5        push    hl
1ccd cd304c    call    $4c30
1cd0 d1        pop     de
1cd1 c9        ret     

1cd2 cd7a6d    call    $6d7a
1cd5 e5        push    hl
1cd6 cd5630    call    $3056
1cd9 d1        pop     de
1cda cd5d6d    call    $6d5d
1cdd 29        add     hl,hl
1cde 11b890    ld      de,$90b8
1ce1 19        add     hl,de
1ce2 5e        ld      e,(hl)
1ce3 23        inc     hl
1ce4 56        ld      d,(hl)
1ce5 d5        push    de
1ce6 cd4059    call    $5940
1ce9 d1        pop     de
1cea cd736d    call    $6d73
1ced e5        push    hl
1cee 2a3d8c    ld      hl,($8c3d)
1cf1 d1        pop     de
1cf2 eb        ex      de,hl
1cf3 cd3086    call    $8630
1cf6 23        inc     hl
1cf7 e5        push    hl
1cf8 cd5630    call    $3056
1cfb d1        pop     de
1cfc cd7d70    call    $707d
1cff 29        add     hl,hl
1d00 11be90    ld      de,$90be
1d03 19        add     hl,de
1d04 5e        ld      e,(hl)
1d05 23        inc     hl
1d06 56        ld      d,(hl)
1d07 d5        push    de
1d08 cd4059    call    $5940
1d0b d1        pop     de
1d0c cd9670    call    $7096
1d0f cda77c    call    $7ca7
1d12 cd0331    call    $3103
1d15 eb        ex      de,hl
1d16 cda08b    call    $8ba0
1d19 210500    ld      hl,$0005
1d1c e5        push    hl
1d1d cd304c    call    $4c30
1d20 d1        pop     de
1d21 c9        ret     

1d22 46        ld      b,(hl)
1d23 53        ld      d,e
1d24 00        nop     
1d25 53        ld      d,e
1d26 53        ld      d,e
1d27 00        nop     
1d28 54        ld      d,h
1d29 53        ld      d,e
1d2a 00        nop     
1d2b 57        ld      d,a
1d2c 49        ld      c,c
1d2d 4e        ld      c,(hl)
1d2e 44        ld      b,h
1d2f 4f        ld      c,a
1d30 57        ld      d,a
1d31 00        nop     
1d32 57        ld      d,a
1d33 52        ld      d,d
1d34 41        ld      b,c
1d35 50        ld      d,b
1d36 00        nop     
1d37 46        ld      b,(hl)
1d38 45        ld      b,l
1d39 4e        ld      c,(hl)
1d3a 43        ld      b,e
1d3b 45        ld      b,l
1d3c 00        nop     
1d3d cd4d1f    call    $1f4d
1d40 c32470    jp      $7024
1d43 cd4d1f    call    $1f4d
1d46 c3fa1a    jp      $1afa
1d49 cd271a    call    $1a27
1d4c cd127d    call    $7d12
1d4f cda77c    call    $7ca7
1d52 cd8f6e    call    $6e8f
1d55 eb        ex      de,hl
1d56 cda08b    call    $8ba0
1d59 c9        ret     

1d5a cd271a    call    $1a27
1d5d cda77c    call    $7ca7
1d60 cd8f6e    call    $6e8f
1d63 eb        ex      de,hl
1d64 cda08b    call    $8ba0
1d67 c9        ret     

1d68 cd4d1f    call    $1f4d
1d6b 2a5b8c    ld      hl,($8c5b)
1d6e e5        push    hl
1d6f cd114b    call    $4b11
1d72 e3        ex      (sp),hl
1d73 cd816d    call    $6d81
1d76 d1        pop     de
1d77 c37c4b    jp      $4b7c
1d7a cd271a    call    $1a27
1d7d cda77c    call    $7ca7
1d80 cdad6e    call    $6ead
1d83 eb        ex      de,hl
1d84 cda08b    call    $8ba0
1d87 c9        ret     

1d88 cd4d1f    call    $1f4d
1d8b cd1e1a    call    $1a1e
1d8e e5        push    hl
1d8f cdd86d    call    $6dd8
1d92 d1        pop     de
1d93 c37c4b    jp      $4b7c
1d96 cda98b    call    $8ba9
1d99 cd701a    call    $1a70
1d9c cd7a1a    call    $1a7a
1d9f 2af68f    ld      hl,($8ff6)
1da2 cdff86    call    $86ff
1da5 22f68f    ld      ($8ff6),hl
1da8 2a498c    ld      hl,($8c49)
1dab e5        push    hl
1dac cdce1a    call    $1ace
1daf d1        pop     de
1db0 44        ld      b,h
1db1 4d        ld      c,l
1db2 cd4d1f    call    $1f4d
1db5 cd5e10    call    $105e
1db8 cdaa41    call    $41aa
1dbb e5        push    hl
1dbc cd8835    call    $3588
1dbf d1        pop     de
1dc0 cd7410    call    $1074
1dc3 2ab090    ld      hl,($90b0)
1dc6 e5        push    hl
1dc7 21e68d    ld      hl,$8de6
1dca e5        push    hl
1dcb cd4f7b    call    $7b4f
1dce d1        pop     de
1dcf d1        pop     de
1dd0 2005      jr      nz,$1dd7
1dd2 cda96d    call    $6da9
1dd5 183f      jr      $1e16
1dd7 2ab290    ld      hl,($90b2)
1dda e5        push    hl
1ddb 21e68d    ld      hl,$8de6
1dde e5        push    hl
1ddf cd4f7b    call    $7b4f
1de2 d1        pop     de
1de3 d1        pop     de
1de4 2005      jr      nz,$1deb
1de6 cd9a6d    call    $6d9a
1de9 182b      jr      $1e16
1deb 2ab490    ld      hl,($90b4)
1dee e5        push    hl
1def 21e68d    ld      hl,$8de6
1df2 e5        push    hl
1df3 cd4f7b    call    $7b4f
1df6 d1        pop     de
1df7 d1        pop     de
1df8 2005      jr      nz,$1dff
1dfa cdc06d    call    $6dc0
1dfd 1817      jr      $1e16
1dff 2ab690    ld      hl,($90b6)
1e02 e5        push    hl
1e03 21e68d    ld      hl,$8de6
1e06 e5        push    hl
1e07 cd4f7b    call    $7b4f
1e0a d1        pop     de
1e0b d1        pop     de
1e0c 2005      jr      nz,$1e13
1e0e cdb16d    call    $6db1
1e11 1803      jr      $1e16
1e13 cd3b55    call    $553b
1e16 c5        push    bc
1e17 cdd86d    call    $6dd8
1e1a d1        pop     de
1e1b c37c4b    jp      $4b7c
1e1e cdbc1a    call    $1abc
1e21 cd4d1f    call    $1f4d
1e24 cdc51a    call    $1ac5
1e27 cda77c    call    $7ca7
1e2a cdc51a    call    $1ac5
1e2d cda77c    call    $7ca7
1e30 cd656e    call    $6e65
1e33 eb        ex      de,hl
1e34 211000    ld      hl,$0010
1e37 39        add     hl,sp
1e38 f9        ld      sp,hl
1e39 c37c4b    jp      $4b7c
1e3c cd4d1f    call    $1f4d
1e3f cde16f    call    $6fe1
1e42 cda77c    call    $7ca7
1e45 cdbd4a    call    $4abd
1e48 cda77c    call    $7ca7
1e4b cd656e    call    $6e65
1e4e eb        ex      de,hl
1e4f 211000    ld      hl,$0010
1e52 39        add     hl,sp
1e53 f9        ld      sp,hl
1e54 c37c4b    jp      $4b7c
1e57 cd4d1f    call    $1f4d
1e5a cdbd4a    call    $4abd
1e5d cda77c    call    $7ca7
1e60 cddb6f    call    $6fdb
1e63 cda77c    call    $7ca7
1e66 cd656e    call    $6e65
1e69 eb        ex      de,hl
1e6a 211000    ld      hl,$0010
1e6d 39        add     hl,sp
1e6e f9        ld      sp,hl
1e6f c37c4b    jp      $4b7c
1e72 cd4d1f    call    $1f4d
1e75 c33270    jp      $7032
1e78 cdbc1a    call    $1abc
1e7b 21a890    ld      hl,$90a8
1e7e e5        push    hl
1e7f cde16f    call    $6fe1
1e82 cda77c    call    $7ca7
1e85 cdc51a    call    $1ac5
1e88 cdd87c    call    $7cd8
1e8b cd657d    call    $7d65
1e8e e1        pop     hl
1e8f cd857c    call    $7c85
1e92 21a890    ld      hl,$90a8
1e95 e5        push    hl
1e96 21a090    ld      hl,$90a0
1e99 e5        push    hl
1e9a cddb6f    call    $6fdb
1e9d cda77c    call    $7ca7
1ea0 cdc51a    call    $1ac5
1ea3 cdd87c    call    $7cd8
1ea6 cd657d    call    $7d65
1ea9 e1        pop     hl
1eaa cd857c    call    $7c85
1ead cda77c    call    $7ca7
1eb0 21a890    ld      hl,$90a8
1eb3 cd667c    call    $7c66
1eb6 cdd87c    call    $7cd8
1eb9 cd417e    call    $7e41
1ebc cda77c    call    $7ca7
1ebf cd2388    call    $8823
1ec2 cda08b    call    $8ba0
1ec5 218d8c    ld      hl,$8c8d
1ec8 cd587c    call    $7c58
1ecb cd417f    call    $7f41
1ece cda77c    call    $7ca7
1ed1 cd5f7c    call    $7c5f
1ed4 41        ld      b,c
1ed5 5a        ld      e,d
1ed6 00        nop     
1ed7 00        nop     
1ed8 00        nop     
1ed9 00        nop     
1eda 00        nop     
1edb 00        nop     
1edc cdd87c    call    $7cd8
1edf cd657d    call    $7d65
1ee2 e1        pop     hl
1ee3 cd857c    call    $7c85
1ee6 21a090    ld      hl,$90a0
1ee9 cd667c    call    $7c66
1eec 21858c    ld      hl,$8c85
1eef cd587c    call    $7c58
1ef2 cdf27f    call    $7ff2
1ef5 2816      jr      z,$1f0d
1ef7 21a890    ld      hl,$90a8
1efa cd667c    call    $7c66
1efd cd517c    call    $7c51
1f00 41        ld      b,c
1f01 b4        or      h
1f02 00        nop     
1f03 00        nop     
1f04 00        nop     
1f05 00        nop     
1f06 00        nop     
1f07 00        nop     
1f08 cd6c7d    call    $7d6c
1f0b 1806      jr      $1f13
1f0d 21a890    ld      hl,$90a8
1f10 cd667c    call    $7c66
1f13 cda77c    call    $7ca7
1f16 cdb84b    call    $4bb8
1f19 eb        ex      de,hl
1f1a cda08b    call    $8ba0
1f1d c9        ret     

1f1e 2a788f    ld      hl,($8f78)
1f21 e5        push    hl
1f22 cd6353    call    $5363
1f25 d1        pop     de
1f26 c9        ret     

1f27 cd654c    call    $4c65
1f2a e5        push    hl
1f2b cd8c6c    call    $6c8c
1f2e e3        ex      (sp),hl
1f2f cda64b    call    $4ba6
1f32 d1        pop     de
1f33 c9        ret     

1f34 cda98b    call    $8ba9
1f37 cd654c    call    $4c65
1f3a 44        ld      b,h
1f3b 4d        ld      c,l
1f3c cd654c    call    $4c65
1f3f e5        push    hl
1f40 c5        push    bc
1f41 cd7f6c    call    $6c7f
1f44 d1        pop     de
1f45 d1        pop     de
1f46 c37c4b    jp      $4b7c
1f49 cdf019    call    $19f0
1f4c 5e        ld      e,(hl)
1f4d 1600      ld      d,$00
1f4f d5        push    de
1f50 cda64b    call    $4ba6
1f53 d1        pop     de
1f54 c9        ret     

1f55 cda98b    call    $8ba9
1f58 cdf019    call    $19f0
1f5b 44        ld      b,h
1f5c 4d        ld      c,l
1f5d cd654c    call    $4c65
1f60 eb        ex      de,hl
1f61 60        ld      h,b
1f62 69        ld      l,c
1f63 73        ld      (hl),e
1f64 c37c4b    jp      $4b7c
1f67 cda98b    call    $8ba9
1f6a 2a5d8c    ld      hl,($8c5d)
1f6d e5        push    hl
1f6e cd114b    call    $4b11
1f71 d1        pop     de
1f72 2003      jr      nz,$1f77
1f74 cd3b55    call    $553b
1f77 cd736d    call    $6d73
1f7a 44        ld      b,h
1f7b 4d        ld      c,l
1f7c cd5c4c    call    $4c5c
1f7f e5        push    hl
1f80 2a3d8c    ld      hl,($8c3d)
1f83 d1        pop     de
1f84 eb        ex      de,hl
1f85 cd3086    call    $8630
1f88 23        inc     hl
1f89 e5        push    hl
1f8a cd646d    call    $6d64
1f8d d1        pop     de
1f8e cd5d6d    call    $6d5d
1f91 110100    ld      de,$0001
1f94 cd3c85    call    $853c
1f97 2846      jr      z,$1fdf
1f99 cd736d    call    $6d73
1f9c e5        push    hl
1f9d 60        ld      h,b
1f9e 69        ld      l,c
1f9f d1        pop     de
1fa0 eb        ex      de,hl
1fa1 cd6c85    call    $856c
1fa4 281c      jr      z,$1fc2
1fa6 cd736d    call    $6d73
1fa9 2b        dec     hl
1faa e5        push    hl
1fab c5        push    bc
1fac cd8077    call    $7780
1faf d1        pop     de
1fb0 d1        pop     de
1fb1 cd736d    call    $6d73
1fb4 e5        push    hl
1fb5 2a8e8f    ld      hl,($8f8e)
1fb8 d1        pop     de
1fb9 eb        ex      de,hl
1fba cd6c85    call    $856c
1fbd 2803      jr      z,$1fc2
1fbf cd406c    call    $6c40
1fc2 cdd56c    call    $6cd5
1fc5 cd736d    call    $6d73
1fc8 e5        push    hl
1fc9 60        ld      h,b
1fca 69        ld      l,c
1fcb d1        pop     de
1fcc eb        ex      de,hl
1fcd cd6d85    call    $856d
1fd0 280d      jr      z,$1fdf
1fd2 60        ld      h,b
1fd3 69        ld      l,c
1fd4 2b        dec     hl
1fd5 e5        push    hl
1fd6 cd736d    call    $6d73
1fd9 e5        push    hl
1fda cd8077    call    $7780
1fdd d1        pop     de
1fde d1        pop     de
1fdf c37c4b    jp      $4b7c
1fe2 cd5d6d    call    $6d5d
1fe5 110100    ld      de,$0001
1fe8 cd3c85    call    $853c
1feb c0        ret     nz

1fec cd406c    call    $6c40
1fef cd4b6d    call    $6d4b
1ff2 2a3f8c    ld      hl,($8c3f)
1ff5 22988f    ld      ($8f98),hl
1ff8 2a3d8c    ld      hl,($8c3d)
1ffb 229a8f    ld      ($8f9a),hl
1ffe c3406c    jp      $6c40
2001 2a598c    ld      hl,($8c59)
2004 7c        ld      a,h
2005 b5        or      l
2006 2003      jr      nz,$200b
2008 cd406c    call    $6c40
200b cd546d    call    $6d54
200e c3171f    jp      $1f17
2011 cd426d    call    $6d42
2014 c3171f    jp      $1f17
2017 2a3b8c    ld      hl,($8c3b)
201a 22988f    ld      ($8f98),hl
201d 2a398c    ld      hl,($8c39)
2020 229a8f    ld      ($8f9a),hl
2023 c9        ret     

2024 cd5d6d    call    $6d5d
2027 110100    ld      de,$0001
202a cd3c85    call    $853c
202d 2804      jr      z,$2033
202f cd736d    call    $6d73
2032 c9        ret     

2033 210100    ld      hl,$0001
2036 c9        ret     

2037 cd5d6d    call    $6d5d
203a 110200    ld      de,$0002
203d cd4885    call    $8548
2040 c8        ret     z

2041 cd011f    call    $1f01
2044 c9        ret     

2045 cd5d6d    call    $6d5d
2048 c0        ret     nz

2049 cde21e    call    $1ee2
204c c9        ret     

204d cd5d6d    call    $6d5d
2050 110200    ld      de,$0002
2053 cd3c85    call    $853c
2056 c8        ret     z

2057 cde21e    call    $1ee2
205a c9        ret     

205b cd4d1f    call    $1f4d
205e c34e70    jp      $704e
2061 cd406c    call    $6c40
2064 c3451f    jp      $1f45
2067 2a8c8f    ld      hl,($8f8c)
206a 2b        dec     hl
206b e5        push    hl
206c cd5630    call    $3056
206f d1        pop     de
2070 2a8e8f    ld      hl,($8f8e)
2073 2b        dec     hl
2074 e5        push    hl
2075 cd5630    call    $3056
2078 210200    ld      hl,$0002
207b e3        ex      (sp),hl
207c cd304c    call    $4c30
207f d1        pop     de
2080 c9        ret     

2081 cda98b    call    $8ba9
2084 cdbc1a    call    $1abc
2087 cdc51a    call    $1ac5
208a cda77c    call    $7ca7
208d cd2a04    call    $042a
2090 cda08b    call    $8ba0
2093 cde681    call    $81e6
2096 44        ld      b,h
2097 4d        ld      c,l
2098 2a988f    ld      hl,($8f98)
209b 2b        dec     hl
209c e5        push    hl
209d cdc51a    call    $1ac5
20a0 cda77c    call    $7ca7
20a3 cd2a04    call    $042a
20a6 cda08b    call    $8ba0
20a9 cde681    call    $81e6
20ac e5        push    hl
20ad cdf919    call    $19f9
20b0 d1        pop     de
20b1 e3        ex      (sp),hl
20b2 2a9a8f    ld      hl,($8f9a)
20b5 e5        push    hl
20b6 c5        push    bc
20b7 cdf919    call    $19f9
20ba d1        pop     de
20bb e3        ex      (sp),hl
20bc cd506c    call    $6c50
20bf d1        pop     de
20c0 d1        pop     de
20c1 c37c4b    jp      $4b7c
20c4 cdbd4a    call    $4abd
20c7 cda77c    call    $7ca7
20ca cd5f7c    call    $7c5f
20cd 41        ld      b,c
20ce 010000    ld      bc,$0000
20d1 00        nop     
20d2 00        nop     
20d3 00        nop     
20d4 00        nop     
20d5 cdd87c    call    $7cd8
20d8 cd417e    call    $7e41
20db cde681    call    $81e6
20de eb        ex      de,hl
20df 2a578c    ld      hl,($8c57)
20e2 cd5685    call    $8556
20e5 2824      jr      z,$210b
20e7 2a578c    ld      hl,($8c57)
20ea cd2880    call    $8028
20ed cda77c    call    $7ca7
20f0 cd534c    call    $4c53
20f3 cdd87c    call    $7cd8
20f6 cdfb7f    call    $7ffb
20f9 2810      jr      z,$210b
20fb cd534c    call    $4c53
20fe cda77c    call    $7ca7
2101 cd8470    call    $7084
2104 eb        ex      de,hl
2105 cda08b    call    $8ba0
2108 c37c4b    jp      $4b7c
210b c33b55    jp      $553b
210e cda98b    call    $8ba9
2111 210800    ld      hl,$0008
2114 39        add     hl,sp
2115 5e        ld      e,(hl)
2116 23        inc     hl
2117 56        ld      d,(hl)
2118 d5        push    de
2119 211300    ld      hl,$0013
211c e5        push    hl
211d cdbc86    call    $86bc
2120 d1        pop     de
2121 d1        pop     de
2122 c9        ret     

2123 211900    ld      hl,$0019
2126 e5        push    hl
2127 cdbc86    call    $86bc
212a d1        pop     de
212b c9        ret     

212c 218000    ld      hl,$0080
212f e5        push    hl
2130 cd3520    call    $2035
2133 d1        pop     de
2134 c9        ret     

2135 cda98b    call    $8ba9
2138 210800    ld      hl,$0008
213b 39        add     hl,sp
213c 5e        ld      e,(hl)
213d 23        inc     hl
213e 56        ld      d,(hl)
213f d5        push    de
2140 211a00    ld      hl,$001a
2143 e5        push    hl
2144 cdbc86    call    $86bc
2147 d1        pop     de
2148 d1        pop     de
2149 c9        ret     

214a cda98b    call    $8ba9
214d 210800    ld      hl,$0008
2150 39        add     hl,sp
2151 5e        ld      e,(hl)
2152 23        inc     hl
2153 56        ld      d,(hl)
2154 d5        push    de
2155 211100    ld      hl,$0011
2158 e5        push    hl
2159 cdbc86    call    $86bc
215c d1        pop     de
215d d1        pop     de
215e 11ff00    ld      de,$00ff
2161 c34885    jp      $8548
2164 cda98b    call    $8ba9
2167 cd2543    call    $4325
216a cd2c20    call    $202c
216d cdb824    call    $24b8
2170 210800    ld      hl,$0008
2173 39        add     hl,sp
2174 5e        ld      e,(hl)
2175 23        inc     hl
2176 56        ld      d,(hl)
2177 d5        push    de
2178 211100    ld      hl,$0011
217b e5        push    hl
217c cdbc86    call    $86bc
217f d1        pop     de
2180 d1        pop     de
2181 44        ld      b,h
2182 4d        ld      c,l
2183 60        ld      h,b
2184 69        ld      l,c
2185 11ff00    ld      de,$00ff
2188 cd4885    call    $8548
218b c8        ret     z

218c cd5e10    call    $105e
218f 60        ld      h,b
2190 69        ld      l,c
2191 29        add     hl,hl
2192 29        add     hl,hl
2193 29        add     hl,hl
2194 29        add     hl,hl
2195 29        add     hl,hl
2196 118100    ld      de,$0081
2199 19        add     hl,de
219a e5        push    hl
219b 21e68d    ld      hl,$8de6
219e e5        push    hl
219f cd887b    call    $7b88
21a2 d1        pop     de
21a3 d1        pop     de
21a4 2a728f    ld      hl,($8f72)
21a7 23        inc     hl
21a8 22728f    ld      ($8f72),hl
21ab 2b        dec     hl
21ac 5e        ld      e,(hl)
21ad 1600      ld      d,$00
21af 212000    ld      hl,$0020
21b2 cd3c85    call    $853c
21b5 2012      jr      nz,$21c9
21b7 2a7a8f    ld      hl,($8f7a)
21ba 23        inc     hl
21bb 227a8f    ld      ($8f7a),hl
21be 110800    ld      de,$0008
21c1 eb        ex      de,hl
21c2 cd5c86    call    $865c
21c5 2002      jr      nz,$21c9
21c7 18db      jr      $21a4
21c9 cd7410    call    $1074
21cc cdd84b    call    $4bd8
21cf cd8d41    call    $418d
21d2 e5        push    hl
21d3 2af48f    ld      hl,($8ff4)
21d6 e5        push    hl
21d7 cd7d45    call    $457d
21da d1        pop     de
21db e3        ex      (sp),hl
21dc cdc941    call    $41c9
21df d1        pop     de
21e0 210800    ld      hl,$0008
21e3 39        add     hl,sp
21e4 5e        ld      e,(hl)
21e5 23        inc     hl
21e6 56        ld      d,(hl)
21e7 d5        push    de
21e8 211200    ld      hl,$0012
21eb e5        push    hl
21ec cdbc86    call    $86bc
21ef d1        pop     de
21f0 d1        pop     de
21f1 44        ld      b,h
21f2 4d        ld      c,l
21f3 188e      jr      $2183
21f5 c9        ret     

21f6 210800    ld      hl,$0008
21f9 39        add     hl,sp
21fa eb        ex      de,hl
21fb 2a2e90    ld      hl,($902e)
21fe cd3086    call    $8630
2201 1180fd    ld      de,$fd80
2204 19        add     hl,de
2205 1180ff    ld      de,$ff80
2208 cdfc84    call    $84fc
220b 220490    ld      ($9004),hl
220e 110000    ld      de,$0000
2211 eb        ex      de,hl
2212 cd5685    call    $8556
2215 2803      jr      z,$221a
2217 cd8357    call    $5783
221a 2a2e90    ld      hl,($902e)
221d 220690    ld      ($9006),hl
2220 c32321    jp      $2123
2223 210000    ld      hl,$0000
2226 220290    ld      ($9002),hl
2229 22fe8f    ld      ($8ffe),hl
222c 2a0690    ld      hl,($9006)
222f 22fc8f    ld      ($8ffc),hl
2232 c9        ret     

2233 cda98b    call    $8ba9
2236 2afe8f    ld      hl,($8ffe)
2239 eb        ex      de,hl
223a 2a0490    ld      hl,($9004)
223d cd5585    call    $8555
2240 2817      jr      z,$2259
2242 210a90    ld      hl,$900a
2245 e5        push    hl
2246 2a0490    ld      hl,($9004)
2249 118000    ld      de,$0080
224c eb        ex      de,hl
224d cd2285    call    $8522
2250 e5        push    hl
2251 cdc622    call    $22c6
2254 d1        pop     de
2255 d1        pop     de
2256 cd2321    call    $2123
2259 2afe8f    ld      hl,($8ffe)
225c 23        inc     hl
225d 22fe8f    ld      ($8ffe),hl
2260 210800    ld      hl,$0008
2263 39        add     hl,sp
2264 5e        ld      e,(hl)
2265 1600      ld      d,$00
2267 d5        push    de
2268 2afc8f    ld      hl,($8ffc)
226b 23        inc     hl
226c 22fc8f    ld      ($8ffc),hl
226f 2b        dec     hl
2270 d1        pop     de
2271 73        ld      (hl),e
2272 c9        ret     

2273 2a0290    ld      hl,($9002)
2276 7c        ld      a,h
2277 b5        or      l
2278 2804      jr      z,$227e
227a 210000    ld      hl,$0000
227d c9        ret     

227e 2afe8f    ld      hl,($8ffe)
2281 7c        ld      a,h
2282 b5        or      l
2283 201f      jr      nz,$22a4
2285 cd2321    call    $2123
2288 2a2e90    ld      hl,($902e)
228b eb        ex      de,hl
228c 2a0490    ld      hl,($9004)
228f 19        add     hl,de
2290 e5        push    hl
2291 210a90    ld      hl,$900a
2294 e5        push    hl
2295 cd7822    call    $2278
2298 d1        pop     de
2299 d1        pop     de
229a 110700    ld      de,$0007
229d eb        ex      de,hl
229e cd2086    call    $8620
22a1 22fe8f    ld      ($8ffe),hl
22a4 2afe8f    ld      hl,($8ffe)
22a7 7c        ld      a,h
22a8 b5        or      l
22a9 280e      jr      z,$22b9
22ab 2afc8f    ld      hl,($8ffc)
22ae 5e        ld      e,(hl)
22af 1600      ld      d,$00
22b1 211a00    ld      hl,$001a
22b4 cd3c85    call    $853c
22b7 280a      jr      z,$22c3
22b9 210100    ld      hl,$0001
22bc 220290    ld      ($9002),hl
22bf 210000    ld      hl,$0000
22c2 c9        ret     

22c3 2afe8f    ld      hl,($8ffe)
22c6 2b        dec     hl
22c7 22fe8f    ld      ($8ffe),hl
22ca 2afc8f    ld      hl,($8ffc)
22cd 5e        ld      e,(hl)
22ce 1600      ld      d,$00
22d0 210d00    ld      hl,$000d
22d3 cd3c85    call    $853c
22d6 280e      jr      z,$22e6
22d8 2afc8f    ld      hl,($8ffc)
22db 23        inc     hl
22dc 22fc8f    ld      ($8ffc),hl
22df cd7321    call    $2173
22e2 210a00    ld      hl,$000a
22e5 c9        ret     

22e6 2afc8f    ld      hl,($8ffc)
22e9 23        inc     hl
22ea 22fc8f    ld      ($8ffc),hl
22ed 2b        dec     hl
22ee 5e        ld      e,(hl)
22ef 1600      ld      d,$00
22f1 eb        ex      de,hl
22f2 c9        ret     

22f3 cd7321    call    $2173
22f6 e5        push    hl
22f7 2a0090    ld      hl,($9000)
22fa 11da8c    ld      de,$8cda
22fd 19        add     hl,de
22fe d1        pop     de
22ff 73        ld      (hl),e
2300 2a0090    ld      hl,($9000)
2303 23        inc     hl
2304 220090    ld      ($9000),hl
2307 118600    ld      de,$0086
230a eb        ex      de,hl
230b cd5585    call    $8555
230e 2803      jr      z,$2313
2310 cdc256    call    $56c2
2313 210000    ld      hl,$0000
2316 e5        push    hl
2317 2a0090    ld      hl,($9000)
231a 11da8c    ld      de,$8cda
231d 19        add     hl,de
231e d1        pop     de
231f 73        ld      (hl),e
2320 c9        ret     

2321 2afe8f    ld      hl,($8ffe)
2324 118000    ld      de,$0080
2327 eb        ex      de,hl
2328 cd8285    call    $8582
232b 2808      jr      z,$2335
232d 211a00    ld      hl,$001a
2330 e5        push    hl
2331 cd3321    call    $2133
2334 d1        pop     de
2335 210a90    ld      hl,$900a
2338 e5        push    hl
2339 2afe8f    ld      hl,($8ffe)
233c 117f00    ld      de,$007f
233f 19        add     hl,de
2340 118000    ld      de,$0080
2343 eb        ex      de,hl
2344 cd2285    call    $8522
2347 e5        push    hl
2348 cdc622    call    $22c6
234b d1        pop     de
234c 210a90    ld      hl,$900a
234f e3        ex      (sp),hl
2350 cd3a23    call    $233a
2353 d1        pop     de
2354 c33d3c    jp      $3c3d
2357 210200    ld      hl,$0002
235a 22f88f    ld      ($8ff8),hl
235d cdf620    call    $20f6
2360 210000    ld      hl,$0000
2363 220090    ld      ($9000),hl
2366 cdf321    call    $21f3
2369 cdf321    call    $21f3
236c c3f321    jp      $21f3
236f 210200    ld      hl,$0002
2372 22fa8f    ld      ($8ffa),hl
2375 c3f620    jp      $20f6
2378 cda98b    call    $8ba9
237b 210000    ld      hl,$0000
237e 22c490    ld      ($90c4),hl
2381 2a2e90    ld      hl,($902e)
2384 44        ld      b,h
2385 4d        ld      c,l
2386 210a00    ld      hl,$000a
2389 39        add     hl,sp
238a 5e        ld      e,(hl)
238b 23        inc     hl
238c 56        ld      d,(hl)
238d 2180ff    ld      hl,$ff80
2390 19        add     hl,de
2391 50        ld      d,b
2392 59        ld      e,c
2393 eb        ex      de,hl
2394 cd6686    call    $8666
2397 2029      jr      nz,$23c2
2399 c5        push    bc
239a cd3520    call    $2035
239d d1        pop     de
239e 210800    ld      hl,$0008
23a1 39        add     hl,sp
23a2 5e        ld      e,(hl)
23a3 23        inc     hl
23a4 56        ld      d,(hl)
23a5 d5        push    de
23a6 211400    ld      hl,$0014
23a9 e5        push    hl
23aa cdbc86    call    $86bc
23ad d1        pop     de
23ae d1        pop     de
23af 2011      jr      nz,$23c2
23b1 2ac490    ld      hl,($90c4)
23b4 23        inc     hl
23b5 22c490    ld      ($90c4),hl
23b8 218000    ld      hl,$0080
23bb 50        ld      d,b
23bc 59        ld      e,c
23bd 19        add     hl,de
23be 44        ld      b,h
23bf 4d        ld      c,l
23c0 18c4      jr      $2386
23c2 2ac490    ld      hl,($90c4)
23c5 c9        ret     

23c6 cda98b    call    $8ba9
23c9 2a0690    ld      hl,($9006)
23cc 44        ld      b,h
23cd 4d        ld      c,l
23ce 210800    ld      hl,$0008
23d1 39        add     hl,sp
23d2 e5        push    hl
23d3 7e        ld      a,(hl)
23d4 23        inc     hl
23d5 66        ld      h,(hl)
23d6 6f        ld      l,a
23d7 2b        dec     hl
23d8 eb        ex      de,hl
23d9 e1        pop     hl
23da 73        ld      (hl),e
23db 23        inc     hl
23dc 72        ld      (hl),d
23dd eb        ex      de,hl
23de 23        inc     hl
23df 7c        ld      a,h
23e0 b5        or      l
23e1 c8        ret     z

23e2 c5        push    bc
23e3 cd3520    call    $2035
23e6 d1        pop     de
23e7 210a00    ld      hl,$000a
23ea 39        add     hl,sp
23eb 5e        ld      e,(hl)
23ec 23        inc     hl
23ed 56        ld      d,(hl)
23ee d5        push    de
23ef 211500    ld      hl,$0015
23f2 e5        push    hl
23f3 cdbc86    call    $86bc
23f6 d1        pop     de
23f7 d1        pop     de
23f8 280f      jr      z,$2409
23fa 210a00    ld      hl,$000a
23fd 39        add     hl,sp
23fe 5e        ld      e,(hl)
23ff 23        inc     hl
2400 56        ld      d,(hl)
2401 d5        push    de
2402 cd3a23    call    $233a
2405 d1        pop     de
2406 cd6857    call    $5768
2409 218000    ld      hl,$0080
240c 50        ld      d,b
240d 59        ld      e,c
240e 19        add     hl,de
240f 44        ld      b,h
2410 4d        ld      c,l
2411 18bb      jr      $23ce
2413 c9        ret     

2414 cda98b    call    $8ba9
2417 210800    ld      hl,$0008
241a 39        add     hl,sp
241b 4e        ld      c,(hl)
241c 23        inc     hl
241d 46        ld      b,(hl)
241e cdb824    call    $24b8
2421 210000    ld      hl,$0000
2424 eb        ex      de,hl
2425 212000    ld      hl,$0020
2428 09        add     hl,bc
2429 73        ld      (hl),e
242a c5        push    bc
242b 210f00    ld      hl,$000f
242e e5        push    hl
242f cdbc86    call    $86bc
2432 d1        pop     de
2433 d1        pop     de
2434 11ff00    ld      de,$00ff
2437 c34885    jp      $8548
243a cda98b    call    $8ba9
243d 210800    ld      hl,$0008
2440 39        add     hl,sp
2441 5e        ld      e,(hl)
2442 23        inc     hl
2443 56        ld      d,(hl)
2444 d5        push    de
2445 211000    ld      hl,$0010
2448 e5        push    hl
2449 cdbc86    call    $86bc
244c d1        pop     de
244d d1        pop     de
244e 11ff00    ld      de,$00ff
2451 cd3c85    call    $853c
2454 c8        ret     z

2455 cd3957    call    $5739
2458 c9        ret     

2459 cda98b    call    $8ba9
245c cdb824    call    $24b8
245f 210000    ld      hl,$0000
2462 e5        push    hl
2463 210a00    ld      hl,$000a
2466 39        add     hl,sp
2467 5e        ld      e,(hl)
2468 23        inc     hl
2469 56        ld      d,(hl)
246a 212000    ld      hl,$0020
246d 19        add     hl,de
246e d1        pop     de
246f 73        ld      (hl),e
2470 210800    ld      hl,$0008
2473 39        add     hl,sp
2474 5e        ld      e,(hl)
2475 23        inc     hl
2476 56        ld      d,(hl)
2477 d5        push    de
2478 211600    ld      hl,$0016
247b e5        push    hl
247c cdbc86    call    $86bc
247f d1        pop     de
2480 d1        pop     de
2481 11ff00    ld      de,$00ff
2484 cd3c85    call    $853c
2487 c8        ret     z

2488 cd3957    call    $5739
248b c9        ret     

248c cda98b    call    $8ba9
248f 21d284    ld      hl,$84d2
2492 e5        push    hl
2493 cd8c0f    call    $0f8c
2496 d1        pop     de
2497 210a00    ld      hl,$000a
249a 39        add     hl,sp
249b 5e        ld      e,(hl)
249c 23        inc     hl
249d 56        ld      d,(hl)
249e d5        push    de
249f 210a00    ld      hl,$000a
24a2 39        add     hl,sp
24a3 5e        ld      e,(hl)
24a4 23        inc     hl
24a5 56        ld      d,(hl)
24a6 d5        push    de
24a7 cdad23    call    $23ad
24aa d1        pop     de
24ab d1        pop     de
24ac c9        ret     

24ad cda98b    call    $8ba9
24b0 210800    ld      hl,$0008
24b3 39        add     hl,sp
24b4 4e        ld      c,(hl)
24b5 23        inc     hl
24b6 46        ld      b,(hl)
24b7 210000    ld      hl,$0000
24ba 22c890    ld      ($90c8),hl
24bd eb        ex      de,hl
24be 60        ld      h,b
24bf 69        ld      l,c
24c0 73        ld      (hl),e
24c1 21e68d    ld      hl,$8de6
24c4 22c690    ld      ($90c6),hl
24c7 2a7a8f    ld      hl,($8f7a)
24ca 110100    ld      de,$0001
24cd eb        ex      de,hl
24ce cd6786    call    $8667
24d1 2856      jr      z,$2529
24d3 2ac690    ld      hl,($90c6)
24d6 23        inc     hl
24d7 5e        ld      e,(hl)
24d8 1600      ld      d,$00
24da 213a00    ld      hl,$003a
24dd cd3c85    call    $853c
24e0 2847      jr      z,$2529
24e2 2ac690    ld      hl,($90c6)
24e5 5e        ld      e,(hl)
24e6 1600      ld      d,$00
24e8 214100    ld      hl,$0041
24eb cd6c85    call    $856c
24ee 200e      jr      nz,$24fe
24f0 2ac690    ld      hl,($90c6)
24f3 5e        ld      e,(hl)
24f4 1600      ld      d,$00
24f6 215000    ld      hl,$0050
24f9 cd6d85    call    $856d
24fc 2805      jr      z,$2503
24fe cd3b55    call    $553b
2501 1826      jr      $2529
2503 2ac690    ld      hl,($90c6)
2506 5e        ld      e,(hl)
2507 1600      ld      d,$00
2509 21bfff    ld      hl,$ffbf
250c 19        add     hl,de
250d 23        inc     hl
250e eb        ex      de,hl
250f 60        ld      h,b
2510 69        ld      l,c
2511 73        ld      (hl),e
2512 2ac690    ld      hl,($90c6)
2515 110200    ld      de,$0002
2518 19        add     hl,de
2519 22c690    ld      ($90c6),hl
251c 2a7a8f    ld      hl,($8f7a)
251f 110200    ld      de,$0002
2522 eb        ex      de,hl
2523 cd3086    call    $8630
2526 227a8f    ld      ($8f7a),hl
2529 2a7a8f    ld      hl,($8f7a)
252c cdf685    call    $85f6
252f 22ca90    ld      ($90ca),hl
2532 7c        ld      a,h
2533 b5        or      l
2534 281b      jr      z,$2551
2536 2ac890    ld      hl,($90c8)
2539 23        inc     hl
253a 22c890    ld      ($90c8),hl
253d 110800    ld      de,$0008
2540 eb        ex      de,hl
2541 cd5685    call    $8556
2544 280b      jr      z,$2551
2546 213f00    ld      hl,$003f
2549 e5        push    hl
254a 03        inc     bc
254b 60        ld      h,b
254c 69        ld      l,c
254d d1        pop     de
254e 73        ld      (hl),e
254f 18e5      jr      $2536
2551 2a7a8f    ld      hl,($8f7a)
2554 2b        dec     hl
2555 227a8f    ld      ($8f7a),hl
2558 23        inc     hl
2559 7c        ld      a,h
255a b5        or      l
255b 282b      jr      z,$2588
255d 2ac690    ld      hl,($90c6)
2560 23        inc     hl
2561 22c690    ld      ($90c6),hl
2564 2b        dec     hl
2565 5e        ld      e,(hl)
2566 1600      ld      d,$00
2568 d5        push    de
2569 03        inc     bc
256a 60        ld      h,b
256b 69        ld      l,c
256c d1        pop     de
256d 73        ld      (hl),e
256e 213f00    ld      hl,$003f
2571 cd3c85    call    $853c
2574 22ca90    ld      ($90ca),hl
2577 2ac890    ld      hl,($90c8)
257a 23        inc     hl
257b 22c890    ld      ($90c8),hl
257e 110800    ld      de,$0008
2581 cd3c85    call    $853c
2584 2002      jr      nz,$2588
2586 18c9      jr      $2551
2588 2ac890    ld      hl,($90c8)
258b 23        inc     hl
258c 22c890    ld      ($90c8),hl
258f 110800    ld      de,$0008
2592 eb        ex      de,hl
2593 cd5685    call    $8556
2596 280b      jr      z,$25a3
2598 212000    ld      hl,$0020
259b e5        push    hl
259c 03        inc     bc
259d 60        ld      h,b
259e 69        ld      l,c
259f d1        pop     de
25a0 73        ld      (hl),e
25a1 18e5      jr      $2588
25a3 210a00    ld      hl,$000a
25a6 39        add     hl,sp
25a7 5e        ld      e,(hl)
25a8 23        inc     hl
25a9 56        ld      d,(hl)
25aa d5        push    de
25ab 03        inc     bc
25ac 60        ld      h,b
25ad 69        ld      l,c
25ae e5        push    hl
25af cd887b    call    $7b88
25b2 d1        pop     de
25b3 d1        pop     de
25b4 2aca90    ld      hl,($90ca)
25b7 c9        ret     

25b8 cda98b    call    $8ba9
25bb cd2320    call    $2023
25be 44        ld      b,h
25bf 4d        ld      c,l
25c0 210d00    ld      hl,$000d
25c3 e5        push    hl
25c4 cdbc86    call    $86bc
25c7 d1        pop     de
25c8 c5        push    bc
25c9 210e00    ld      hl,$000e
25cc e5        push    hl
25cd cdbc86    call    $86bc
25d0 d1        pop     de
25d1 d1        pop     de
25d2 c9        ret     

25d3 cda98b    call    $8ba9
25d6 210800    ld      hl,$0008
25d9 39        add     hl,sp
25da 4e        ld      c,(hl)
25db 23        inc     hl
25dc 46        ld      b,(hl)
25dd 210a00    ld      hl,$000a
25e0 39        add     hl,sp
25e1 5e        ld      e,(hl)
25e2 23        inc     hl
25e3 56        ld      d,(hl)
25e4 d5        push    de
25e5 c5        push    bc
25e6 cd8c23    call    $238c
25e9 d1        pop     de
25ea d1        pop     de
25eb 2803      jr      z,$25f0
25ed cd3b55    call    $553b
25f0 c5        push    bc
25f1 cd4a20    call    $204a
25f4 d1        pop     de
25f5 c0        ret     nz

25f6 cdc557    call    $57c5
25f9 c9        ret     

25fa cda98b    call    $8ba9
25fd 210800    ld      hl,$0008
2600 39        add     hl,sp
2601 4e        ld      c,(hl)
2602 23        inc     hl
2603 46        ld      b,(hl)
2604 210a00    ld      hl,$000a
2607 39        add     hl,sp
2608 5e        ld      e,(hl)
2609 23        inc     hl
260a 56        ld      d,(hl)
260b d5        push    de
260c c5        push    bc
260d cd8c23    call    $238c
2610 d1        pop     de
2611 d1        pop     de
2612 2803      jr      z,$2617
2614 cd3b55    call    $553b
2617 c5        push    bc
2618 cd4a20    call    $204a
261b d1        pop     de
261c c8        ret     z

261d cda857    call    $57a8
2620 c9        ret     

2621 cddf4c    call    $4cdf
2624 cdc84c    call    $4cc8
2627 213c90    ld      hl,$903c
262a e5        push    hl
262b 210a90    ld      hl,$900a
262e e5        push    hl
262f cd8c23    call    $238c
2632 d1        pop     de
2633 d1        pop     de
2634 2803      jr      z,$2639
2636 cd3b55    call    $553b
2639 210a90    ld      hl,$900a
263c e5        push    hl
263d cd4a20    call    $204a
2640 d1        pop     de
2641 280a      jr      z,$264d
2643 210a90    ld      hl,$900a
2646 e5        push    hl
2647 cd1423    call    $2314
264a d1        pop     de
264b 1808      jr      $2655
264d 210a90    ld      hl,$900a
2650 e5        push    hl
2651 cd5923    call    $2359
2654 d1        pop     de
2655 2a2e90    ld      hl,($902e)
2658 2b        dec     hl
2659 22cb8c    ld      ($8ccb),hl
265c cdf620    call    $20f6
265f 210000    ld      hl,$0000
2662 22ce8c    ld      ($8cce),hl
2665 1807      jr      $266e
2667 2ace8c    ld      hl,($8cce)
266a 23        inc     hl
266b 22ce8c    ld      ($8cce),hl
266e 2a0290    ld      hl,($9002)
2671 7c        ld      a,h
2672 b5        or      l
2673 201e      jr      nz,$2693
2675 cd7321    call    $2173
2678 e5        push    hl
2679 2acb8c    ld      hl,($8ccb)
267c 23        inc     hl
267d 22cb8c    ld      ($8ccb),hl
2680 d1        pop     de
2681 73        ld      (hl),e
2682 2afc8f    ld      hl,($8ffc)
2685 eb        ex      de,hl
2686 2acb8c    ld      hl,($8ccb)
2689 cd6686    call    $8666
268c 2803      jr      z,$2691
268e cd8357    call    $5783
2691 18d4      jr      $2667
2693 210a90    ld      hl,$900a
2696 e5        push    hl
2697 cd3a23    call    $233a
269a d1        pop     de
269b cd2638    call    $3826
269e cd6438    call    $3864
26a1 cd295b    call    $5b29
26a4 cd525c    call    $5c52
26a7 210a90    ld      hl,$900a
26aa e5        push    hl
26ab cd0e20    call    $200e
26ae 210a90    ld      hl,$900a
26b1 e3        ex      (sp),hl
26b2 cd5923    call    $2359
26b5 d1        pop     de
26b6 210200    ld      hl,$0002
26b9 22fa8f    ld      ($8ffa),hl
26bc 218000    ld      hl,$0080
26bf 220690    ld      ($9006),hl
26c2 218000    ld      hl,$0080
26c5 220490    ld      ($9004),hl
26c8 cd2321    call    $2123
26cb 2a2e90    ld      hl,($902e)
26ce 22cb8c    ld      ($8ccb),hl
26d1 2acb8c    ld      hl,($8ccb)
26d4 7e        ld      a,(hl)
26d5 b7        or      a
26d6 2812      jr      z,$26ea
26d8 2acb8c    ld      hl,($8ccb)
26db 23        inc     hl
26dc 22cb8c    ld      ($8ccb),hl
26df 2b        dec     hl
26e0 5e        ld      e,(hl)
26e1 1600      ld      d,$00
26e3 d5        push    de
26e4 cd3f67    call    $673f
26e7 d1        pop     de
26e8 18e7      jr      $26d1
26ea 211a00    ld      hl,$001a
26ed e5        push    hl
26ee cd3f67    call    $673f
26f1 d1        pop     de
26f2 c32122    jp      $2221
26f5 cdc84c    call    $4cc8
26f8 cddf4c    call    $4cdf
26fb cdb824    call    $24b8
26fe 213c90    ld      hl,$903c
2701 e5        push    hl
2702 210a90    ld      hl,$900a
2705 e5        push    hl
2706 cdd324    call    $24d3
2709 d1        pop     de
270a 210a90    ld      hl,$900a
270d e3        ex      (sp),hl
270e cd1423    call    $2314
2711 d1        pop     de
2712 2003      jr      nz,$2717
2714 cd3957    call    $5739
2717 cd5722    call    $2257
271a cdb549    call    $49b5
271d 210100    ld      hl,$0001
2720 220890    ld      ($9008),hl
2723 1803      jr      $2728
2725 cd4e01    call    $014e
2728 2a0890    ld      hl,($9008)
272b 7c        ld      a,h
272c b5        or      l
272d 2802      jr      z,$2731
272f 18f4      jr      $2725
2731 cdc549    call    $49c5
2734 cd443c    call    $3c44
2737 c37c4b    jp      $4b7c
273a cdc84c    call    $4cc8
273d cddf4c    call    $4cdf
2740 cdb824    call    $24b8
2743 213c90    ld      hl,$903c
2746 e5        push    hl
2747 210a90    ld      hl,$900a
274a e5        push    hl
274b cdfa24    call    $24fa
274e d1        pop     de
274f d1        pop     de
2750 cd2543    call    $4325
2753 210a90    ld      hl,$900a
2756 e5        push    hl
2757 cd5923    call    $2359
275a d1        pop     de
275b cd6f22    call    $226f
275e cd1c43    call    $431c
2761 cd1c43    call    $431c
2764 cdb337    call    $37b3
2767 210100    ld      hl,$0001
276a e5        push    hl
276b cdaa41    call    $41aa
276e e5        push    hl
276f cdb538    call    $38b5
2772 d1        pop     de
2773 d1        pop     de
2774 cdfc37    call    $37fc
2777 210200    ld      hl,$0002
277a e5        push    hl
277b cdaa41    call    $41aa
277e e5        push    hl
277f cdb538    call    $38b5
2782 d1        pop     de
2783 d1        pop     de
2784 cd2543    call    $4325
2787 210100    ld      hl,$0001
278a e5        push    hl
278b cdf53a    call    $3af5
278e 210300    ld      hl,$0003
2791 e3        ex      (sp),hl
2792 cdaa41    call    $41aa
2795 e5        push    hl
2796 cdb538    call    $38b5
2799 d1        pop     de
279a d1        pop     de
279b cd2122    call    $2221
279e c37c4b    jp      $4b7c
27a1 213c90    ld      hl,$903c
27a4 e5        push    hl
27a5 cdaa26    call    $26aa
27a8 d1        pop     de
27a9 c9        ret     

27aa cd0585    call    $8505
27ad dcffcd    call    c,$cdff
27b0 b8        cp      b
27b1 24        inc     h
27b2 cd2c20    call    $202c
27b5 212c00    ld      hl,$002c
27b8 39        add     hl,sp
27b9 5e        ld      e,(hl)
27ba 23        inc     hl
27bb 56        ld      d,(hl)
27bc d5        push    de
27bd 210600    ld      hl,$0006
27c0 39        add     hl,sp
27c1 44        ld      b,h
27c2 4d        ld      c,l
27c3 e5        push    hl
27c4 cd8c23    call    $238c
27c7 d1        pop     de
27c8 d1        pop     de
27c9 c5        push    bc
27ca cd4a20    call    $204a
27cd d1        pop     de
27ce 2808      jr      z,$27d8
27d0 c5        push    bc
27d1 cd0e20    call    $200e
27d4 d1        pop     de
27d5 c37c4b    jp      $4b7c
27d8 c3c557    jp      $57c5
27db cd0585    call    $8505
27de dcffcd    call    c,$cdff
27e1 b8        cp      b
27e2 24        inc     h
27e3 211400    ld      hl,$0014
27e6 39        add     hl,sp
27e7 44        ld      b,h
27e8 4d        ld      c,l
27e9 e5        push    hl
27ea cdfa24    call    $24fa
27ed d1        pop     de
27ee c5        push    bc
27ef cdd324    call    $24d3
27f2 d1        pop     de
27f3 211400    ld      hl,$0014
27f6 39        add     hl,sp
27f7 7e        ld      a,(hl)
27f8 b7        or      a
27f9 2816      jr      z,$2811
27fb 211400    ld      hl,$0014
27fe 39        add     hl,sp
27ff 5e        ld      e,(hl)
2800 1600      ld      d,$00
2802 210400    ld      hl,$0004
2805 39        add     hl,sp
2806 6e        ld      l,(hl)
2807 2600      ld      h,$00
2809 cd4885    call    $8548
280c 2803      jr      z,$2811
280e cd3b55    call    $553b
2811 c5        push    bc
2812 211700    ld      hl,$0017
2815 e5        push    hl
2816 cdbc86    call    $86bc
2819 d1        pop     de
281a d1        pop     de
281b c37c4b    jp      $4b7c
281e 213c90    ld      hl,$903c
2821 e5        push    hl
2822 cd2727    call    $2727
2825 d1        pop     de
2826 c9        ret     

2827 cd0585    call    $8505
282a dcff21    call    c,$21ff
282d 2c        inc     l
282e 00        nop     
282f 39        add     hl,sp
2830 4e        ld      c,(hl)
2831 23        inc     hl
2832 46        ld      b,(hl)
2833 cd904b    call    $4b90
2836 2824      jr      z,$285c
2838 210000    ld      hl,$0000
283b eb        ex      de,hl
283c 210400    ld      hl,$0004
283f 39        add     hl,sp
2840 73        ld      (hl),e
2841 217327    ld      hl,$2773
2844 e5        push    hl
2845 210700    ld      hl,$0007
2848 39        add     hl,sp
2849 e5        push    hl
284a cd887b    call    $7b88
284d d1        pop     de
284e d1        pop     de
284f c5        push    bc
2850 210f00    ld      hl,$000f
2853 39        add     hl,sp
2854 e5        push    hl
2855 cd887b    call    $7b88
2858 d1        pop     de
2859 d1        pop     de
285a 180b      jr      $2867
285c c5        push    bc
285d 210600    ld      hl,$0006
2860 39        add     hl,sp
2861 e5        push    hl
2862 cd8c23    call    $238c
2865 d1        pop     de
2866 d1        pop     de
2867 210400    ld      hl,$0004
286a 39        add     hl,sp
286b e5        push    hl
286c cd6420    call    $2064
286f d1        pop     de
2870 c33743    jp      $4337
2873 3f        ccf     
2874 3f        ccf     
2875 3f        ccf     
2876 3f        ccf     
2877 3f        ccf     
2878 3f        ccf     
2879 3f        ccf     
287a 3f        ccf     
287b 00        nop     
287c cd5e10    call    $105e
287f cd2320    call    $2023
2882 114100    ld      de,$0041
2885 19        add     hl,de
2886 e5        push    hl
2887 cdc966    call    $66c9
288a 213a00    ld      hl,$003a
288d e3        ex      (sp),hl
288e cdc966    call    $66c9
2891 d1        pop     de
2892 cd7410    call    $1074
2895 c3d84b    jp      $4bd8
2898 cd0585    call    $8505
289b dcff21    call    c,$21ff
289e 3c        inc     a
289f 90        sub     b
28a0 e5        push    hl
28a1 210600    ld      hl,$0006
28a4 39        add     hl,sp
28a5 e5        push    hl
28a6 cd8c23    call    $238c
28a9 d1        pop     de
28aa d1        pop     de
28ab 210400    ld      hl,$0004
28ae 39        add     hl,sp
28af 7c        ld      a,h
28b0 b5        or      l
28b1 2825      jr      z,$28d8
28b3 210500    ld      hl,$0005
28b6 39        add     hl,sp
28b7 5e        ld      e,(hl)
28b8 1600      ld      d,$00
28ba 213f00    ld      hl,$003f
28bd cd3c85    call    $853c
28c0 2816      jr      z,$28d8
28c2 210400    ld      hl,$0004
28c5 39        add     hl,sp
28c6 5e        ld      e,(hl)
28c7 1600      ld      d,$00
28c9 eb        ex      de,hl
28ca 2b        dec     hl
28cb e5        push    hl
28cc 210e00    ld      hl,$000e
28cf e5        push    hl
28d0 cdbc86    call    $86bc
28d3 d1        pop     de
28d4 d1        pop     de
28d5 c37c4b    jp      $4b7c
28d8 c33b55    jp      $553b
28db cde127    call    $27e1
28de c3c066    jp      $66c0
28e1 cda98b    call    $8ba9
28e4 210100    ld      hl,$0001
28e7 e5        push    hl
28e8 cdd249    call    $49d2
28eb d1        pop     de
28ec 44        ld      b,h
28ed 4d        ld      c,l
28ee e5        push    hl
28ef cdee49    call    $49ee
28f2 d1        pop     de
28f3 c0        ret     nz

28f4 cd324a    call    $4a32
28f7 cd1228    call    $2812
28fa 0b        dec     bc
28fb 60        ld      h,b
28fc 69        ld      l,c
28fd e5        push    hl
28fe cdee49    call    $49ee
2901 d1        pop     de
2902 200b      jr      nz,$290f
2904 cdd76b    call    $6bd7
2907 cd324a    call    $4a32
290a cd1228    call    $2812
290d 18eb      jr      $28fa
290f c37c4b    jp      $4b7c
2912 2af48f    ld      hl,($8ff4)
2915 7c        ld      a,h
2916 b5        or      l
2917 281c      jr      z,$2935
2919 2af48f    ld      hl,($8ff4)
291c e5        push    hl
291d cdd944    call    $44d9
2920 d1        pop     de
2921 280a      jr      z,$292d
2923 2af48f    ld      hl,($8ff4)
2926 e5        push    hl
2927 cd8835    call    $3588
292a d1        pop     de
292b 1808      jr      $2935
292d 2af48f    ld      hl,($8ff4)
2930 e5        push    hl
2931 cda835    call    $35a8
2934 d1        pop     de
2935 c9        ret     

2936 2a768f    ld      hl,($8f76)
2939 2600      ld      h,$00
293b e5        push    hl
293c cdb584    call    $84b5
293f d1        pop     de
2940 c8        ret     z

2941 cd4b28    call    $284b
2944 c0        ret     nz

2945 cd6f28    call    $286f
2948 18ec      jr      $2936
294a c9        ret     

294b 2a768f    ld      hl,($8f76)
294e 2600      ld      h,$00
2950 110a00    ld      de,$000a
2953 c33c85    jp      $853c
2956 cda98b    call    $8ba9
2959 2a768f    ld      hl,($8f76)
295c 2600      ld      h,$00
295e 7c        ld      a,h
295f b5        or      l
2960 2809      jr      z,$296b
2962 cd4b28    call    $284b
2965 2004      jr      nz,$296b
2967 210000    ld      hl,$0000
296a c9        ret     

296b 210100    ld      hl,$0001
296e c9        ret     

296f 2a768f    ld      hl,($8f76)
2972 2600      ld      h,$00
2974 7d        ld      a,l
2975 32778f    ld      ($8f77),a
2978 2af88f    ld      hl,($8ff8)
297b 110200    ld      de,$0002
297e cd3c85    call    $853c
2981 2803      jr      z,$2986
2983 cdf321    call    $21f3
2986 2a748f    ld      hl,($8f74)
2989 23        inc     hl
298a 22748f    ld      ($8f74),hl
298d 5e        ld      e,(hl)
298e 1600      ld      d,$00
2990 eb        ex      de,hl
2991 7d        ld      a,l
2992 32768f    ld      ($8f76),a
2995 c9        ret     

2996 cda98b    call    $8ba9
2999 2a748f    ld      hl,($8f74)
299c 7e        ld      a,(hl)
299d b7        or      a
299e 2025      jr      nz,$29c5
29a0 210800    ld      hl,$0008
29a3 39        add     hl,sp
29a4 5e        ld      e,(hl)
29a5 1600      ld      d,$00
29a7 213e00    ld      hl,$003e
29aa cd3c85    call    $853c
29ad 2812      jr      z,$29c1
29af 21c928    ld      hl,$28c9
29b2 e5        push    hl
29b3 21da8c    ld      hl,$8cda
29b6 22748f    ld      ($8f74),hl
29b9 e5        push    hl
29ba cd887b    call    $7b88
29bd d1        pop     de
29be d1        pop     de
29bf 1804      jr      $29c5
29c1 210100    ld      hl,$0001
29c4 c9        ret     

29c5 210000    ld      hl,$0000
29c8 c9        ret     

29c9 65        ld      h,l
29ca 6e        ld      l,(hl)
29cb 64        ld      h,h
29cc 00        nop     
29cd 2a728f    ld      hl,($8f72)
29d0 23        inc     hl
29d1 22728f    ld      ($8f72),hl
29d4 2a7a8f    ld      hl,($8f7a)
29d7 2b        dec     hl
29d8 227a8f    ld      ($8f7a),hl
29db c9        ret     

29dc cda98b    call    $8ba9
29df 210800    ld      hl,$0008
29e2 39        add     hl,sp
29e3 4e        ld      c,(hl)
29e4 23        inc     hl
29e5 46        ld      b,(hl)
29e6 50        ld      d,b
29e7 59        ld      e,c
29e8 212000    ld      hl,$0020
29eb cd6d85    call    $856d
29ee 2803      jr      z,$29f3
29f0 cdab66    call    $66ab
29f3 2af88f    ld      hl,($8ff8)
29f6 110200    ld      de,$0002
29f9 cd3c85    call    $853c
29fc 2847      jr      z,$2a45
29fe 2a0290    ld      hl,($9002)
2a01 7c        ld      a,h
2a02 b5        or      l
2a03 2833      jr      z,$2a38
2a05 210a90    ld      hl,$900a
2a08 e5        push    hl
2a09 cd3a23    call    $233a
2a0c d1        pop     de
2a0d 210000    ld      hl,$0000
2a10 220890    ld      ($9008),hl
2a13 2a9f8c    ld      hl,($8c9f)
2a16 7c        ld      a,h
2a17 b5        or      l
2a18 280b      jr      z,$2a25
2a1a cd443c    call    $3c44
2a1d 210000    ld      hl,$0000
2a20 229f8c    ld      ($8c9f),hl
2a23 180c      jr      $2a31
2a25 210000    ld      hl,$0000
2a28 e5        push    hl
2a29 21da8c    ld      hl,$8cda
2a2c 22748f    ld      ($8f74),hl
2a2f d1        pop     de
2a30 73        ld      (hl),e
2a31 c5        push    bc
2a32 cd9628    call    $2896
2a35 d1        pop     de
2a36 180d      jr      $2a45
2a38 2a0090    ld      hl,($9000)
2a3b 11da8c    ld      de,$8cda
2a3e 19        add     hl,de
2a3f 2b        dec     hl
2a40 2b        dec     hl
2a41 2b        dec     hl
2a42 22748f    ld      ($8f74),hl
2a45 2af88f    ld      hl,($8ff8)
2a48 110100    ld      de,$0001
2a4b cd3c85    call    $853c
2a4e 2812      jr      z,$2a62
2a50 cd4b28    call    $284b
2a53 2803      jr      z,$2a58
2a55 cd6f28    call    $286f
2a58 c5        push    bc
2a59 cd9628    call    $2896
2a5c d1        pop     de
2a5d 2803      jr      z,$2a62
2a5f cd443c    call    $3c44
2a62 2af88f    ld      hl,($8ff8)
2a65 7c        ld      a,h
2a66 b5        or      l
2a67 203d      jr      nz,$2aa6
2a69 60        ld      h,b
2a6a 69        ld      l,c
2a6b 113f00    ld      de,$003f
2a6e cd3c85    call    $853c
2a71 2821      jr      z,$2a94
2a73 2a9d8c    ld      hl,($8c9d)
2a76 7c        ld      a,h
2a77 b5        or      l
2a78 2805      jr      z,$2a7f
2a7a 212100    ld      hl,$0021
2a7d 44        ld      b,h
2a7e 4d        ld      c,l
2a7f cde043    call    $43e0
2a82 cd2e44    call    $442e
2a85 280d      jr      z,$2a94
2a87 cde943    call    $43e9
2a8a e5        push    hl
2a8b cd3936    call    $3639
2a8e d1        pop     de
2a8f cdd76b    call    $6bd7
2a92 18ee      jr      $2a82
2a94 78        ld      a,b
2a95 b1        or      c
2a96 2805      jr      z,$2a9d
2a98 c5        push    bc
2a99 cd3f67    call    $673f
2a9c d1        pop     de
2a9d cdc65b    call    $5bc6
2aa0 21da8c    ld      hl,$8cda
2aa3 22748f    ld      ($8f74),hl
2aa6 210000    ld      hl,$0000
2aa9 229e8f    ld      ($8f9e),hl
2aac 2a748f    ld      hl,($8f74)
2aaf 5e        ld      e,(hl)
2ab0 1600      ld      d,$00
2ab2 eb        ex      de,hl
2ab3 228a8f    ld      ($8f8a),hl
2ab6 2aa28f    ld      hl,($8fa2)
2ab9 7c        ld      a,h
2aba b5        or      l
2abb 281a      jr      z,$2ad7
2abd 2a748f    ld      hl,($8f74)
2ac0 5e        ld      e,(hl)
2ac1 1600      ld      d,$00
2ac3 212000    ld      hl,$0020
2ac6 cd3c85    call    $853c
2ac9 280c      jr      z,$2ad7
2acb cd6f28    call    $286f
2ace 2a9e8f    ld      hl,($8f9e)
2ad1 23        inc     hl
2ad2 229e8f    ld      ($8f9e),hl
2ad5 18e6      jr      $2abd
2ad7 2a748f    ld      hl,($8f74)
2ada 5e        ld      e,(hl)
2adb 1600      ld      d,$00
2add eb        ex      de,hl
2ade 7d        ld      a,l
2adf 32768f    ld      ($8f76),a
2ae2 210a00    ld      hl,$000a
2ae5 7d        ld      a,l
2ae6 32778f    ld      ($8f77),a
2ae9 c3ef2b    jp      $2bef
2aec cda98b    call    $8ba9
2aef 210a00    ld      hl,$000a
2af2 39        add     hl,sp
2af3 4e        ld      c,(hl)
2af4 23        inc     hl
2af5 46        ld      b,(hl)
2af6 60        ld      h,b
2af7 69        ld      l,c
2af8 7e        ld      a,(hl)
2af9 b7        or      a
2afa 281a      jr      z,$2b16
2afc 60        ld      h,b
2afd 69        ld      l,c
2afe 03        inc     bc
2aff 5e        ld      e,(hl)
2b00 1600      ld      d,$00
2b02 d5        push    de
2b03 210a00    ld      hl,$000a
2b06 39        add     hl,sp
2b07 5e        ld      e,(hl)
2b08 1600      ld      d,$00
2b0a e1        pop     hl
2b0b cd3c85    call    $853c
2b0e 2804      jr      z,$2b14
2b10 210100    ld      hl,$0001
2b13 c9        ret     

2b14 18e0      jr      $2af6
2b16 210000    ld      hl,$0000
2b19 c9        ret     

2b1a cda98b    call    $8ba9
2b1d 210800    ld      hl,$0008
2b20 39        add     hl,sp
2b21 4e        ld      c,(hl)
2b22 23        inc     hl
2b23 46        ld      b,(hl)
2b24 c5        push    bc
2b25 cd452a    call    $2a45
2b28 d1        pop     de
2b29 2804      jr      z,$2b2f
2b2b 210100    ld      hl,$0001
2b2e c9        ret     

2b2f 213a2a    ld      hl,$2a3a
2b32 e5        push    hl
2b33 c5        push    bc
2b34 cdec29    call    $29ec
2b37 d1        pop     de
2b38 d1        pop     de
2b39 c9        ret     

2b3a 2829      jr      z,$2b65
2b3c 3d        dec     a
2b3d 3c        inc     a
2b3e 3e2b      ld      a,$2b
2b40 2d        dec     l
2b41 2a2f3b    ld      hl,($3b2f)
2b44 00        nop     
2b45 cda98b    call    $8ba9
2b48 215a2a    ld      hl,$2a5a
2b4b e5        push    hl
2b4c 210a00    ld      hl,$000a
2b4f 39        add     hl,sp
2b50 5e        ld      e,(hl)
2b51 1600      ld      d,$00
2b53 d5        push    de
2b54 cdec29    call    $29ec
2b57 d1        pop     de
2b58 d1        pop     de
2b59 c9        ret     

2b5a 205b      jr      nz,$2bb7
2b5c 5d        ld      e,l
2b5d 09        add     hl,bc
2b5e 0a        ld      a,(bc)
2b5f 00        nop     
2b60 2a768f    ld      hl,($8f76)
2b63 2600      ld      h,$00
2b65 e5        push    hl
2b66 cd1a2a    call    $2a1a
2b69 d1        pop     de
2b6a c9        ret     

2b6b cda98b    call    $8ba9
2b6e 2a778f    ld      hl,($8f77)
2b71 2600      ld      h,$00
2b73 7c        ld      a,h
2b74 b5        or      l
2b75 280d      jr      z,$2b84
2b77 2a778f    ld      hl,($8f77)
2b7a 2600      ld      h,$00
2b7c 112900    ld      de,$0029
2b7f cd3c85    call    $853c
2b82 2804      jr      z,$2b88
2b84 210000    ld      hl,$0000
2b87 c9        ret     

2b88 2a778f    ld      hl,($8f77)
2b8b 2600      ld      h,$00
2b8d e5        push    hl
2b8e cd1a2a    call    $2a1a
2b91 d1        pop     de
2b92 c9        ret     

2b93 cda98b    call    $8ba9
2b96 210800    ld      hl,$0008
2b99 39        add     hl,sp
2b9a 4e        ld      c,(hl)
2b9b 23        inc     hl
2b9c 46        ld      b,(hl)
2b9d 50        ld      d,b
2b9e 59        ld      e,c
2b9f 213000    ld      hl,$0030
2ba2 cd5585    call    $8555
2ba5 280a      jr      z,$2bb1
2ba7 50        ld      d,b
2ba8 59        ld      e,c
2ba9 213900    ld      hl,$0039
2bac cd5685    call    $8556
2baf 2004      jr      nz,$2bb5
2bb1 210000    ld      hl,$0000
2bb4 c9        ret     

2bb5 210100    ld      hl,$0001
2bb8 c9        ret     

2bb9 cd5628    call    $2856
2bbc 2809      jr      z,$2bc7
2bbe 210000    ld      hl,$0000
2bc1 227c8f    ld      ($8f7c),hl
2bc4 c3ad2b    jp      $2bad
2bc7 2a768f    ld      hl,($8f76)
2bca 2600      ld      h,$00
2bcc 112200    ld      de,$0022
2bcf cd3c85    call    $853c
2bd2 2809      jr      z,$2bdd
2bd4 210200    ld      hl,$0002
2bd7 227c8f    ld      ($8f7c),hl
2bda c3ad2b    jp      $2bad
2bdd 2a768f    ld      hl,($8f76)
2be0 2600      ld      h,$00
2be2 113a00    ld      de,$003a
2be5 cd3c85    call    $853c
2be8 2809      jr      z,$2bf3
2bea 210400    ld      hl,$0004
2bed 227c8f    ld      ($8f7c),hl
2bf0 c3ad2b    jp      $2bad
2bf3 2a768f    ld      hl,($8f76)
2bf6 2600      ld      h,$00
2bf8 112e00    ld      de,$002e
2bfb cd3c85    call    $853c
2bfe 281c      jr      z,$2c1c
2c00 cd6b2a    call    $2a6b
2c03 2817      jr      z,$2c1c
2c05 2a748f    ld      hl,($8f74)
2c08 23        inc     hl
2c09 5e        ld      e,(hl)
2c0a 1600      ld      d,$00
2c0c d5        push    de
2c0d cd932a    call    $2a93
2c10 d1        pop     de
2c11 2809      jr      z,$2c1c
2c13 210600    ld      hl,$0006
2c16 227c8f    ld      ($8f7c),hl
2c19 c3ad2b    jp      $2bad
2c1c 2a768f    ld      hl,($8f76)
2c1f 2600      ld      h,$00
2c21 e5        push    hl
2c22 cd932a    call    $2a93
2c25 d1        pop     de
2c26 2809      jr      z,$2c31
2c28 210600    ld      hl,$0006
2c2b 227c8f    ld      ($8f7c),hl
2c2e c3ad2b    jp      $2bad
2c31 2a768f    ld      hl,($8f76)
2c34 2600      ld      h,$00
2c36 112d00    ld      de,$002d
2c39 cd3c85    call    $853c
2c3c 2869      jr      z,$2ca7
2c3e cd6b2a    call    $2a6b
2c41 2864      jr      z,$2ca7
2c43 2a748f    ld      hl,($8f74)
2c46 23        inc     hl
2c47 5e        ld      e,(hl)
2c48 1600      ld      d,$00
2c4a d5        push    de
2c4b cd932a    call    $2a93
2c4e d1        pop     de
2c4f 201e      jr      nz,$2c6f
2c51 2a748f    ld      hl,($8f74)
2c54 23        inc     hl
2c55 5e        ld      e,(hl)
2c56 1600      ld      d,$00
2c58 212e00    ld      hl,$002e
2c5b cd3c85    call    $853c
2c5e 2817      jr      z,$2c77
2c60 2a748f    ld      hl,($8f74)
2c63 23        inc     hl
2c64 23        inc     hl
2c65 5e        ld      e,(hl)
2c66 1600      ld      d,$00
2c68 d5        push    de
2c69 cd932a    call    $2a93
2c6c d1        pop     de
2c6d 2808      jr      z,$2c77
2c6f 210600    ld      hl,$0006
2c72 227c8f    ld      ($8f7c),hl
2c75 182e      jr      $2ca5
2c77 2a748f    ld      hl,($8f74)
2c7a 23        inc     hl
2c7b 5e        ld      e,(hl)
2c7c 1600      ld      d,$00
2c7e 212800    ld      hl,$0028
2c81 cd3c85    call    $853c
2c84 2013      jr      nz,$2c99
2c86 2a748f    ld      hl,($8f74)
2c89 23        inc     hl
2c8a 5e        ld      e,(hl)
2c8b 1600      ld      d,$00
2c8d d5        push    de
2c8e cd1a2a    call    $2a1a
2c91 d1        pop     de
2c92 2805      jr      z,$2c99
2c94 210000    ld      hl,$0000
2c97 1803      jr      $2c9c
2c99 210100    ld      hl,$0001
2c9c 22888f    ld      ($8f88),hl
2c9f 210800    ld      hl,$0008
2ca2 227c8f    ld      ($8f7c),hl
2ca5 1806      jr      $2cad
2ca7 210800    ld      hl,$0008
2caa 227c8f    ld      ($8f7c),hl
2cad c9        ret     

2cae cd6f28    call    $286f
2cb1 2a7a8f    ld      hl,($8f7a)
2cb4 23        inc     hl
2cb5 227a8f    ld      ($8f7a),hl
2cb8 c9        ret     

2cb9 cd602a    call    $2a60
2cbc c0        ret     nz

2cbd 2a768f    ld      hl,($8f76)
2cc0 2600      ld      h,$00
2cc2 115c00    ld      de,$005c
2cc5 cd3c85    call    $853c
2cc8 2803      jr      z,$2ccd
2cca cdae2b    call    $2bae
2ccd 2a768f    ld      hl,($8f76)
2cd0 2600      ld      h,$00
2cd2 e5        push    hl
2cd3 cd8b66    call    $668b
2cd6 d1        pop     de
2cd7 c0        ret     nz

2cd8 cdae2b    call    $2bae
2cdb 18dc      jr      $2cb9
2cdd c9        ret     

2cde 2a768f    ld      hl,($8f76)
2ce1 2600      ld      h,$00
2ce3 e5        push    hl
2ce4 cd932a    call    $2a93
2ce7 d1        pop     de
2ce8 c8        ret     z

2ce9 cdae2b    call    $2bae
2cec 18f0      jr      $2cde
2cee c9        ret     

2cef cd3628    call    $2836
2cf2 2af88f    ld      hl,($8ff8)
2cf5 110200    ld      de,$0002
2cf8 cd3c85    call    $853c
2cfb 2835      jr      z,$2d32
2cfd 2a0090    ld      hl,($9000)
2d00 11da8c    ld      de,$8cda
2d03 19        add     hl,de
2d04 2b        dec     hl
2d05 2b        dec     hl
2d06 2b        dec     hl
2d07 5e        ld      e,(hl)
2d08 1600      ld      d,$00
2d0a 210a00    ld      hl,$000a
2d0d cd3c85    call    $853c
2d10 2803      jr      z,$2d15
2d12 cdf321    call    $21f3
2d15 2a0090    ld      hl,($9000)
2d18 11da8c    ld      de,$8cda
2d1b 19        add     hl,de
2d1c 2b        dec     hl
2d1d 2b        dec     hl
2d1e 2b        dec     hl
2d1f e5        push    hl
2d20 21da8c    ld      hl,$8cda
2d23 22748f    ld      ($8f74),hl
2d26 e5        push    hl
2d27 cd887b    call    $7b88
2d2a d1        pop     de
2d2b d1        pop     de
2d2c 210300    ld      hl,$0003
2d2f 220090    ld      ($9000),hl
2d32 2a748f    ld      hl,($8f74)
2d35 22728f    ld      ($8f72),hl
2d38 210000    ld      hl,$0000
2d3b 227a8f    ld      ($8f7a),hl
2d3e 210000    ld      hl,$0000
2d41 22888f    ld      ($8f88),hl
2d44 cdb92a    call    $2ab9
2d47 2a7c8f    ld      hl,($8f7c)
2d4a c3f02c    jp      $2cf0
2d4d 210000    ld      hl,$0000
2d50 227a8f    ld      ($8f7a),hl
2d53 c9        ret     

2d54 cdae2b    call    $2bae
2d57 2a768f    ld      hl,($8f76)
2d5a 2600      ld      h,$00
2d5c e5        push    hl
2d5d cd452a    call    $2a45
2d60 d1        pop     de
2d61 c20b2d    jp      nz,$2d0b
2d64 cd602a    call    $2a60
2d67 2803      jr      z,$2d6c
2d69 cdae2b    call    $2bae
2d6c cdb92b    call    $2bb9
2d6f c30b2d    jp      $2d0b
2d72 cdb92b    call    $2bb9
2d75 c30b2d    jp      $2d0b
2d78 2a768f    ld      hl,($8f76)
2d7b 2600      ld      h,$00
2d7d 112d00    ld      de,$002d
2d80 cd3c85    call    $853c
2d83 2803      jr      z,$2d88
2d85 cdae2b    call    $2bae
2d88 cdde2b    call    $2bde
2d8b 2a768f    ld      hl,($8f76)
2d8e 2600      ld      h,$00
2d90 112e00    ld      de,$002e
2d93 cd3c85    call    $853c
2d96 2806      jr      z,$2d9e
2d98 cdae2b    call    $2bae
2d9b cdde2b    call    $2bde
2d9e 2a768f    ld      hl,($8f76)
2da1 2600      ld      h,$00
2da3 e5        push    hl
2da4 cdd284    call    $84d2
2da7 d1        pop     de
2da8 114500    ld      de,$0045
2dab cd3c85    call    $853c
2dae 2823      jr      z,$2dd3
2db0 cdae2b    call    $2bae
2db3 2a768f    ld      hl,($8f76)
2db6 2600      ld      h,$00
2db8 112b00    ld      de,$002b
2dbb cd3c85    call    $853c
2dbe 200d      jr      nz,$2dcd
2dc0 2a768f    ld      hl,($8f76)
2dc3 2600      ld      h,$00
2dc5 112d00    ld      de,$002d
2dc8 cd3c85    call    $853c
2dcb 2803      jr      z,$2dd0
2dcd cdae2b    call    $2bae
2dd0 cdde2b    call    $2bde
2dd3 217e8f    ld      hl,$8f7e
2dd6 e5        push    hl
2dd7 2a728f    ld      hl,($8f72)
2dda e5        push    hl
2ddb cd0787    call    $8707
2dde d1        pop     de
2ddf e1        pop     hl
2de0 c3857c    jp      $7c85
2de3 cd602a    call    $2a60
2de6 2803      jr      z,$2deb
2de8 c3ae2b    jp      $2bae
2deb cdb92b    call    $2bb9
2dee 181b      jr      $2e0b
2df0 cd3586    call    $8635
2df3 05        dec     b
2df4 00        nop     
2df5 00        nop     
2df6 00        nop     
2df7 4d        ld      c,l
2df8 2c        inc     l
2df9 02        ld      (bc),a
2dfa 00        nop     
2dfb 54        ld      d,h
2dfc 2c        inc     l
2dfd 04        inc     b
2dfe 00        nop     
2dff 72        ld      (hl),d
2e00 2c        inc     l
2e01 0600      ld      b,$00
2e03 78        ld      a,b
2e04 2c        inc     l
2e05 08        ex      af,af'
2e06 00        nop     
2e07 e3        ex      (sp),hl
2e08 2c        inc     l
2e09 0b        dec     bc
2e0a 2d        dec     l
2e0b 210000    ld      hl,$0000
2e0e 7d        ld      a,l
2e0f 32778f    ld      ($8f77),a
2e12 c9        ret     

2e13 cd5628    call    $2856
2e16 2005      jr      nz,$2e1d
2e18 cdae2b    call    $2bae
2e1b 18f6      jr      $2e13
2e1d 210800    ld      hl,$0008
2e20 227c8f    ld      ($8f7c),hl
2e23 c9        ret     

2e24 cda98b    call    $8ba9
2e27 210800    ld      hl,$0008
2e2a 39        add     hl,sp
2e2b 4e        ld      c,(hl)
2e2c 23        inc     hl
2e2d 46        ld      b,(hl)
2e2e 2a7c8f    ld      hl,($8f7c)
2e31 110800    ld      de,$0008
2e34 cd4885    call    $8548
2e37 2804      jr      z,$2e3d
2e39 210000    ld      hl,$0000
2e3c c9        ret     

2e3d 2a7a8f    ld      hl,($8f7a)
2e40 22cc90    ld      ($90cc),hl
2e43 2a728f    ld      hl,($8f72)
2e46 22ce90    ld      ($90ce),hl
2e49 60        ld      h,b
2e4a 69        ld      l,c
2e4b 7e        ld      a,(hl)
2e4c b7        or      a
2e4d 2833      jr      z,$2e82
2e4f 2acc90    ld      hl,($90cc)
2e52 2b        dec     hl
2e53 22cc90    ld      ($90cc),hl
2e56 23        inc     hl
2e57 7c        ld      a,h
2e58 b5        or      l
2e59 2004      jr      nz,$2e5f
2e5b 210000    ld      hl,$0000
2e5e c9        ret     

2e5f 60        ld      h,b
2e60 69        ld      l,c
2e61 03        inc     bc
2e62 5e        ld      e,(hl)
2e63 1600      ld      d,$00
2e65 d5        push    de
2e66 2ace90    ld      hl,($90ce)
2e69 23        inc     hl
2e6a 22ce90    ld      ($90ce),hl
2e6d 2b        dec     hl
2e6e 5e        ld      e,(hl)
2e6f 1600      ld      d,$00
2e71 d5        push    de
2e72 cde784    call    $84e7
2e75 d1        pop     de
2e76 d1        pop     de
2e77 cd4885    call    $8548
2e7a 2804      jr      z,$2e80
2e7c 210000    ld      hl,$0000
2e7f c9        ret     

2e80 18c7      jr      $2e49
2e82 2acc90    ld      hl,($90cc)
2e85 c3f685    jp      $85f6
2e88 cda98b    call    $8ba9
2e8b 2a7a8f    ld      hl,($8f7a)
2e8e 2b        dec     hl
2e8f 7c        ld      a,h
2e90 b5        or      l
2e91 2804      jr      z,$2e97
2e93 210000    ld      hl,$0000
2e96 c9        ret     

2e97 210800    ld      hl,$0008
2e9a 39        add     hl,sp
2e9b 5e        ld      e,(hl)
2e9c 1600      ld      d,$00
2e9e d5        push    de
2e9f cdad2d    call    $2dad
2ea2 d1        pop     de
2ea3 c9        ret     

2ea4 213b00    ld      hl,$003b
2ea7 e5        push    hl
2ea8 cdad2d    call    $2dad
2eab d1        pop     de
2eac c9        ret     

2ead cda98b    call    $8ba9
2eb0 2a7c8f    ld      hl,($8f7c)
2eb3 110800    ld      de,$0008
2eb6 cd3c85    call    $853c
2eb9 2812      jr      z,$2ecd
2ebb 2a728f    ld      hl,($8f72)
2ebe 5e        ld      e,(hl)
2ebf 1600      ld      d,$00
2ec1 210800    ld      hl,$0008
2ec4 39        add     hl,sp
2ec5 6e        ld      l,(hl)
2ec6 2600      ld      h,$00
2ec8 cd3c85    call    $853c
2ecb 2004      jr      nz,$2ed1
2ecd 210000    ld      hl,$0000
2ed0 c9        ret     

2ed1 210100    ld      hl,$0001
2ed4 c9        ret     

2ed5 cda98b    call    $8ba9
2ed8 210800    ld      hl,$0008
2edb 39        add     hl,sp
2edc 4e        ld      c,(hl)
2edd 23        inc     hl
2ede 46        ld      b,(hl)
2edf 50        ld      d,b
2ee0 59        ld      e,c
2ee1 210000    ld      hl,$0000
2ee4 cd6c85    call    $856c
2ee7 280f      jr      z,$2ef8
2ee9 212d00    ld      hl,$002d
2eec e5        push    hl
2eed cdc966    call    $66c9
2ef0 d1        pop     de
2ef1 60        ld      h,b
2ef2 69        ld      l,c
2ef3 cdec85    call    $85ec
2ef6 44        ld      b,h
2ef7 4d        ld      c,l
2ef8 50        ld      d,b
2ef9 59        ld      e,c
2efa 210a00    ld      hl,$000a
2efd cd2285    call    $8522
2f00 22d090    ld      ($90d0),hl
2f03 7c        ld      a,h
2f04 b5        or      l
2f05 2808      jr      z,$2f0f
2f07 2ad090    ld      hl,($90d0)
2f0a e5        push    hl
2f0b cdd52d    call    $2dd5
2f0e d1        pop     de
2f0f 50        ld      d,b
2f10 59        ld      e,c
2f11 210a00    ld      hl,$000a
2f14 cd8285    call    $8582
2f17 113000    ld      de,$0030
2f1a 19        add     hl,de
2f1b e5        push    hl
2f1c cdc966    call    $66c9
2f1f d1        pop     de
2f20 c9        ret     

2f21 cda98b    call    $8ba9
2f24 210800    ld      hl,$0008
2f27 39        add     hl,sp
2f28 4e        ld      c,(hl)
2f29 23        inc     hl
2f2a 46        ld      b,(hl)
2f2b 60        ld      h,b
2f2c 69        ld      l,c
2f2d cdf886    call    $86f8
2f30 5e        ld      e,(hl)
2f31 1600      ld      d,$00
2f33 217f00    ld      hl,$007f
2f36 cd3c85    call    $853c
2f39 2804      jr      z,$2f3f
2f3b 210100    ld      hl,$0001
2f3e c9        ret     

2f3f 210000    ld      hl,$0000
2f42 c9        ret     

2f43 cda98b    call    $8ba9
2f46 210800    ld      hl,$0008
2f49 39        add     hl,sp
2f4a 4e        ld      c,(hl)
2f4b 23        inc     hl
2f4c 46        ld      b,(hl)
2f4d 2a7a8f    ld      hl,($8f7a)
2f50 22d490    ld      ($90d4),hl
2f53 2a728f    ld      hl,($8f72)
2f56 22d690    ld      ($90d6),hl
2f59 60        ld      h,b
2f5a 69        ld      l,c
2f5b cdff86    call    $86ff
2f5e cdf886    call    $86f8
2f61 44        ld      b,h
2f62 4d        ld      c,l
2f63 1807      jr      $2f6c
2f65 60        ld      h,b
2f66 69        ld      l,c
2f67 cdff86    call    $86ff
2f6a 44        ld      b,h
2f6b 4d        ld      c,l
2f6c 78        ld      a,b
2f6d b1        or      c
2f6e ca002f    jp      z,$2f00
2f71 60        ld      h,b
2f72 69        ld      l,c
2f73 cdf886    call    $86f8
2f76 22da90    ld      ($90da),hl
2f79 c5        push    bc
2f7a cd212e    call    $2e21
2f7d d1        pop     de
2f7e 22d290    ld      ($90d2),hl
2f81 2ad290    ld      hl,($90d2)
2f84 110400    ld      de,$0004
2f87 eb        ex      de,hl
2f88 cd6c85    call    $856c
2f8b 2870      jr      z,$2ffd
2f8d 2ad690    ld      hl,($90d6)
2f90 5e        ld      e,(hl)
2f91 1600      ld      d,$00
2f93 215c00    ld      hl,$005c
2f96 cd3c85    call    $853c
2f99 281a      jr      z,$2fb5
2f9b 2ad490    ld      hl,($90d4)
2f9e 110100    ld      de,$0001
2fa1 eb        ex      de,hl
2fa2 cd6d85    call    $856d
2fa5 280e      jr      z,$2fb5
2fa7 2ad690    ld      hl,($90d6)
2faa 23        inc     hl
2fab 22d690    ld      ($90d6),hl
2fae 2ad490    ld      hl,($90d4)
2fb1 2b        dec     hl
2fb2 22d490    ld      ($90d4),hl
2fb5 2ad290    ld      hl,($90d2)
2fb8 23        inc     hl
2fb9 22d290    ld      ($90d2),hl
2fbc 2b        dec     hl
2fbd eb        ex      de,hl
2fbe 2ada90    ld      hl,($90da)
2fc1 19        add     hl,de
2fc2 5e        ld      e,(hl)
2fc3 1600      ld      d,$00
2fc5 eb        ex      de,hl
2fc6 22d890    ld      ($90d8),hl
2fc9 7c        ld      a,h
2fca b5        or      l
2fcb 2006      jr      nz,$2fd3
2fcd 2ad490    ld      hl,($90d4)
2fd0 c3f685    jp      $85f6
2fd3 2ad490    ld      hl,($90d4)
2fd6 2b        dec     hl
2fd7 22d490    ld      ($90d4),hl
2fda 23        inc     hl
2fdb 7c        ld      a,h
2fdc b5        or      l
2fdd 2004      jr      nz,$2fe3
2fdf 210000    ld      hl,$0000
2fe2 c9        ret     

2fe3 2ad690    ld      hl,($90d6)
2fe6 23        inc     hl
2fe7 22d690    ld      ($90d6),hl
2fea 2b        dec     hl
2feb 5e        ld      e,(hl)
2fec 1600      ld      d,$00
2fee 2ad890    ld      hl,($90d8)
2ff1 cd4885    call    $8548
2ff4 2804      jr      z,$2ffa
2ff6 210000    ld      hl,$0000
2ff9 c9        ret     

2ffa c3812e    jp      $2e81
2ffd c3652e    jp      $2e65
3000 2ad490    ld      hl,($90d4)
3003 c3f685    jp      $85f6
3006 cda98b    call    $8ba9
3009 cda93c    call    $3ca9
300c 22dc90    ld      ($90dc),hl
300f e5        push    hl
3010 cd6341    call    $4163
3013 d1        pop     de
3014 cda93c    call    $3ca9
3017 22e090    ld      ($90e0),hl
301a e5        push    hl
301b 2adc90    ld      hl,($90dc)
301e e5        push    hl
301f cd9844    call    $4498
3022 d1        pop     de
3023 d1        pop     de
3024 cda93c    call    $3ca9
3027 22de90    ld      ($90de),hl
302a e5        push    hl
302b 2ae090    ld      hl,($90e0)
302e e5        push    hl
302f cd7344    call    $4473
3032 d1        pop     de
3033 d1        pop     de
3034 cda93c    call    $3ca9
3037 e5        push    hl
3038 2ade90    ld      hl,($90de)
303b e5        push    hl
303c cd7344    call    $4473
303f d1        pop     de
3040 210800    ld      hl,$0008
3043 e3        ex      (sp),hl
3044 2adc90    ld      hl,($90dc)
3047 e5        push    hl
3048 cd7344    call    $4473
304b d1        pop     de
304c d1        pop     de
304d 2ade90    ld      hl,($90de)
3050 cdf886    call    $86f8
3053 22dc90    ld      ($90dc),hl
3056 210000    ld      hl,$0000
3059 44        ld      b,h
305a 4d        ld      c,l
305b 1803      jr      $3060
305d 03        inc     bc
305e 60        ld      h,b
305f 69        ld      l,c
3060 50        ld      d,b
3061 59        ld      e,c
3062 210400    ld      hl,$0004
3065 cd6c85    call    $856c
3068 caf02f    jp      z,$2ff0
306b 2a7a8f    ld      hl,($8f7a)
306e 7c        ld      a,h
306f b5        or      l
3070 200a      jr      nz,$307c
3072 210000    ld      hl,$0000
3075 e5        push    hl
3076 2adc90    ld      hl,($90dc)
3079 d1        pop     de
307a 73        ld      (hl),e
307b c9        ret     

307c 2a728f    ld      hl,($8f72)
307f 5e        ld      e,(hl)
3080 1600      ld      d,$00
3082 217f00    ld      hl,$007f
3085 cd5585    call    $8555
3088 280f      jr      z,$3099
308a 78        ld      a,b
308b b1        or      c
308c 200b      jr      nz,$3099
308e 217f00    ld      hl,$007f
3091 e5        push    hl
3092 2adc90    ld      hl,($90dc)
3095 d1        pop     de
3096 73        ld      (hl),e
3097 18c4      jr      $305d
3099 2a728f    ld      hl,($8f72)
309c 5e        ld      e,(hl)
309d 1600      ld      d,$00
309f 215c00    ld      hl,$005c
30a2 cd3c85    call    $853c
30a5 280f      jr      z,$30b6
30a7 2a7a8f    ld      hl,($8f7a)
30aa 110100    ld      de,$0001
30ad eb        ex      de,hl
30ae cd6786    call    $8667
30b1 2803      jr      z,$30b6
30b3 cdcd28    call    $28cd
30b6 2a728f    ld      hl,($8f72)
30b9 23        inc     hl
30ba 22728f    ld      ($8f72),hl
30bd 2b        dec     hl
30be 5e        ld      e,(hl)
30bf 1600      ld      d,$00
30c1 d5        push    de
30c2 2adc90    ld      hl,($90dc)
30c5 50        ld      d,b
30c6 59        ld      e,c
30c7 19        add     hl,de
30c8 d1        pop     de
30c9 73        ld      (hl),e
30ca 2a7a8f    ld      hl,($8f7a)
30cd 2b        dec     hl
30ce 227a8f    ld      ($8f7a),hl
30d1 7c        ld      a,h
30d2 b5        or      l
30d3 2018      jr      nz,$30ed
30d5 03        inc     bc
30d6 60        ld      h,b
30d7 69        ld      l,c
30d8 110400    ld      de,$0004
30db eb        ex      de,hl
30dc cd6c85    call    $856c
30df c8        ret     z

30e0 210000    ld      hl,$0000
30e3 e5        push    hl
30e4 2adc90    ld      hl,($90dc)
30e7 50        ld      d,b
30e8 59        ld      e,c
30e9 19        add     hl,de
30ea d1        pop     de
30eb 73        ld      (hl),e
30ec c9        ret     

30ed c35d2f    jp      $2f5d
30f0 210000    ld      hl,$0000
30f3 e5        push    hl
30f4 cd2c46    call    $462c
30f7 e3        ex      (sp),hl
30f8 cd6341    call    $4163
30fb d1        pop     de
30fc cd8d41    call    $418d
30ff e5        push    hl
3100 cd2c46    call    $462c
3103 e3        ex      (sp),hl
3104 cdc941    call    $41c9
3107 d1        pop     de
3108 cd8d41    call    $418d
310b e5        push    hl
310c 2ade90    ld      hl,($90de)
310f e5        push    hl
3110 cd9844    call    $4498
3113 d1        pop     de
3114 d1        pop     de
3115 cdaa41    call    $41aa
3118 22de90    ld      ($90de),hl
311b c34d2f    jp      $2f4d
311e c9        ret     

311f cd062f    call    $2f06
3122 210000    ld      hl,$0000
3125 e5        push    hl
3126 cd8d41    call    $418d
3129 e5        push    hl
312a cd7d45    call    $457d
312d d1        pop     de
312e e3        ex      (sp),hl
312f cd6341    call    $4163
3132 d1        pop     de
3133 2a708f    ld      hl,($8f70)
3136 29        add     hl,hl
3137 11708e    ld      de,$8e70
313a 19        add     hl,de
313b 5e        ld      e,(hl)
313c 23        inc     hl
313d 56        ld      d,(hl)
313e d5        push    de
313f cdaa41    call    $41aa
3142 e5        push    hl
3143 cd9844    call    $4498
3146 d1        pop     de
3147 d1        pop     de
3148 e5        push    hl
3149 2a708f    ld      hl,($8f70)
314c 29        add     hl,hl
314d 11708e    ld      de,$8e70
3150 19        add     hl,de
3151 d1        pop     de
3152 73        ld      (hl),e
3153 23        inc     hl
3154 72        ld      (hl),d
3155 c9        ret     

3156 cda98b    call    $8ba9
3159 210800    ld      hl,$0008
315c 39        add     hl,sp
315d 5e        ld      e,(hl)
315e 23        inc     hl
315f 56        ld      d,(hl)
3160 d5        push    de
3161 210a00    ld      hl,$000a
3164 e5        push    hl
3165 cd7d45    call    $457d
3168 d1        pop     de
3169 e3        ex      (sp),hl
316a cd6341    call    $4163
316d d1        pop     de
316e c9        ret     

316f cda98b    call    $8ba9
3172 217d8c    ld      hl,$8c7d
3175 e5        push    hl
3176 210a00    ld      hl,$000a
3179 39        add     hl,sp
317a cd667c    call    $7c66
317d e1        pop     hl
317e cd857c    call    $7c85
3181 cda93c    call    $3ca9
3184 44        ld      b,h
3185 4d        ld      c,l
3186 e5        push    hl
3187 cd6341    call    $4163
318a d1        pop     de
318b cda93c    call    $3ca9
318e 22e290    ld      ($90e2),hl
3191 e5        push    hl
3192 c5        push    bc
3193 cd9844    call    $4498
3196 d1        pop     de
3197 d1        pop     de
3198 cda93c    call    $3ca9
319b 44        ld      b,h
319c 4d        ld      c,l
319d e5        push    hl
319e 2ae290    ld      hl,($90e2)
31a1 e5        push    hl
31a2 cd7344    call    $4473
31a5 d1        pop     de
31a6 d1        pop     de
31a7 cda93c    call    $3ca9
31aa 22e490    ld      ($90e4),hl
31ad e5        push    hl
31ae c5        push    bc
31af cd7344    call    $4473
31b2 d1        pop     de
31b3 d1        pop     de
31b4 cda93c    call    $3ca9
31b7 22e690    ld      ($90e6),hl
31ba e5        push    hl
31bb 2ae490    ld      hl,($90e4)
31be e5        push    hl
31bf cd7344    call    $4473
31c2 d1        pop     de
31c3 211000    ld      hl,$0010
31c6 e3        ex      (sp),hl
31c7 cd8d41    call    $418d
31ca e5        push    hl
31cb cd7344    call    $4473
31ce d1        pop     de
31cf d1        pop     de
31d0 2a7d8c    ld      hl,($8c7d)
31d3 e5        push    hl
31d4 2ae290    ld      hl,($90e2)
31d7 23        inc     hl
31d8 23        inc     hl
31d9 d1        pop     de
31da 73        ld      (hl),e
31db 23        inc     hl
31dc 72        ld      (hl),d
31dd 2a7f8c    ld      hl,($8c7f)
31e0 eb        ex      de,hl
31e1 210200    ld      hl,$0002
31e4 09        add     hl,bc
31e5 73        ld      (hl),e
31e6 23        inc     hl
31e7 72        ld      (hl),d
31e8 2a818c    ld      hl,($8c81)
31eb e5        push    hl
31ec 2ae490    ld      hl,($90e4)
31ef 23        inc     hl
31f0 23        inc     hl
31f1 d1        pop     de
31f2 73        ld      (hl),e
31f3 23        inc     hl
31f4 72        ld      (hl),d
31f5 2a838c    ld      hl,($8c83)
31f8 e5        push    hl
31f9 2ae690    ld      hl,($90e6)
31fc 23        inc     hl
31fd 23        inc     hl
31fe d1        pop     de
31ff 73        ld      (hl),e
3200 23        inc     hl
3201 72        ld      (hl),d
3202 c9        ret     

3203 cda98b    call    $8ba9
3206 217e8f    ld      hl,$8f7e
3209 e5        push    hl
320a 210a00    ld      hl,$000a
320d 39        add     hl,sp
320e cd667c    call    $7c66
3211 e1        pop     hl
3212 cd857c    call    $7c85
3215 c31831    jp      $3118
3218 217e8f    ld      hl,$8f7e
321b cd667c    call    $7c66
321e cde681    call    $81e6
3221 cd2880    call    $8028
3224 217e8f    ld      hl,$8f7e
3227 cd587c    call    $7c58
322a cde07f    call    $7fe0
322d 200b      jr      nz,$323a
322f 217e8f    ld      hl,$8f7e
3232 cd667c    call    $7c66
3235 cd1a7d    call    $7d1a
3238 200f      jr      nz,$3249
323a 217e8f    ld      hl,$8f7e
323d cd667c    call    $7c66
3240 cde681    call    $81e6
3243 e5        push    hl
3244 cd5630    call    $3056
3247 d1        pop     de
3248 c9        ret     

3249 217e8f    ld      hl,$8f7e
324c cd667c    call    $7c66
324f cda77c    call    $7ca7
3252 cd6f30    call    $306f
3255 eb        ex      de,hl
3256 cda08b    call    $8ba0
3259 c9        ret     

325a cda98b    call    $8ba9
325d 2a888f    ld      hl,($8f88)
3260 7c        ld      a,h
3261 b5        or      l
3262 2809      jr      z,$326d
3264 2adc8f    ld      hl,($8fdc)
3267 e5        push    hl
3268 cd6341    call    $4163
326b d1        pop     de
326c c9        ret     

326d cda631    call    $31a6
3270 2a708f    ld      hl,($8f70)
3273 29        add     hl,hl
3274 11708e    ld      de,$8e70
3277 19        add     hl,de
3278 5e        ld      e,(hl)
3279 23        inc     hl
327a 56        ld      d,(hl)
327b 42        ld      b,d
327c 4b        ld      c,e
327d 1807      jr      $3286
327f 60        ld      h,b
3280 69        ld      l,c
3281 cdff86    call    $86ff
3284 44        ld      b,h
3285 4d        ld      c,l
3286 78        ld      a,b
3287 b1        or      c
3288 2819      jr      z,$32a3
328a 60        ld      h,b
328b 69        ld      l,c
328c cdf886    call    $86f8
328f e5        push    hl
3290 cd432e    call    $2e43
3293 d1        pop     de
3294 280b      jr      z,$32a1
3296 60        ld      h,b
3297 69        ld      l,c
3298 cdf886    call    $86f8
329b e5        push    hl
329c cd6341    call    $4163
329f d1        pop     de
32a0 c9        ret     

32a1 18dc      jr      $327f
32a3 c32543    jp      $4325
32a6 cda98b    call    $8ba9
32a9 210000    ld      hl,$0000
32ac 22708f    ld      ($8f70),hl
32af 2a728f    ld      hl,($8f72)
32b2 44        ld      b,h
32b3 4d        ld      c,l
32b4 60        ld      h,b
32b5 69        ld      l,c
32b6 5e        ld      e,(hl)
32b7 1600      ld      d,$00
32b9 215c00    ld      hl,$005c
32bc cd3c85    call    $853c
32bf 2803      jr      z,$32c4
32c1 03        inc     bc
32c2 60        ld      h,b
32c3 69        ld      l,c
32c4 2a728f    ld      hl,($8f72)
32c7 eb        ex      de,hl
32c8 2a7a8f    ld      hl,($8f7a)
32cb 19        add     hl,de
32cc e5        push    hl
32cd 60        ld      h,b
32ce 69        ld      l,c
32cf d1        pop     de
32d0 eb        ex      de,hl
32d1 cd5c86    call    $865c
32d4 200f      jr      nz,$32e5
32d6 60        ld      h,b
32d7 69        ld      l,c
32d8 03        inc     bc
32d9 5e        ld      e,(hl)
32da 1600      ld      d,$00
32dc 2a708f    ld      hl,($8f70)
32df 19        add     hl,de
32e0 22708f    ld      ($8f70),hl
32e3 18cf      jr      $32b4
32e5 2a708f    ld      hl,($8f70)
32e8 117f00    ld      de,$007f
32eb cdfc84    call    $84fc
32ee 22708f    ld      ($8f70),hl
32f1 c9        ret     

32f2 cd5a31    call    $315a
32f5 cd8d41    call    $418d
32f8 c0        ret     nz

32f9 cd9641    call    $4196
32fc cd1f30    call    $301f
32ff c9        ret     

3300 2a7c8f    ld      hl,($8f7c)
3303 110600    ld      de,$0006
3306 cd3c85    call    $853c
3309 2805      jr      z,$3310
330b cd1831    call    $3118
330e 1803      jr      $3313
3310 cdf231    call    $31f2
3313 cd2533    call    $3325
3316 c3ef2b    jp      $2bef
3319 cd8532    call    $3285
331c 2806      jr      z,$3324
331e cd2543    call    $4325
3321 c32533    jp      $3325
3324 215d00    ld      hl,$005d
3327 e5        push    hl
3328 cd882d    call    $2d88
332b d1        pop     de
332c 2809      jr      z,$3337
332e cdef2b    call    $2bef
3331 cd2543    call    $4325
3334 c32533    jp      $3325
3337 cd7266    call    $6672
333a cd4332    call    $3243
333d cd1932    call    $3219
3340 c36a42    jp      $426a
3343 215b00    ld      hl,$005b
3346 e5        push    hl
3347 cd882d    call    $2d88
334a d1        pop     de
334b 2809      jr      z,$3356
334d cd2533    call    $3325
3350 cdef2b    call    $2bef
3353 c31932    jp      $3219
3356 c30032    jp      $3200
3359 215d00    ld      hl,$005d
335c e5        push    hl
335d cd882d    call    $2d88
3360 d1        pop     de
3361 2805      jr      z,$3368
3363 cdef2b    call    $2bef
3366 18f1      jr      $3359
3368 cd8532    call    $3285
336b 2803      jr      z,$3370
336d c32543    jp      $4325
3370 cd7266    call    $6672
3373 cd4332    call    $3243
3376 cd5932    call    $3259
3379 c36a42    jp      $426a
337c 210000    ld      hl,$0000
337f 22a08f    ld      ($8fa0),hl
3382 c35932    jp      $3259
3385 cda98b    call    $8ba9
3388 2aa08f    ld      hl,($8fa0)
338b 7c        ld      a,h
338c b5        or      l
338d 2804      jr      z,$3393
338f 210100    ld      hl,$0001
3392 c9        ret     

3393 2a7c8f    ld      hl,($8f7c)
3396 7c        ld      a,h
3397 b5        or      l
3398 2842      jr      z,$33dc
339a 2aa28f    ld      hl,($8fa2)
339d 7c        ld      a,h
339e b5        or      l
339f 2837      jr      z,$33d8
33a1 cda42d    call    $2da4
33a4 2832      jr      z,$33d8
33a6 cd132d    call    $2d13
33a9 2aa48f    ld      hl,($8fa4)
33ac e5        push    hl
33ad cd5630    call    $3056
33b0 d1        pop     de
33b1 2a8a8f    ld      hl,($8f8a)
33b4 113b00    ld      de,$003b
33b7 cd3c85    call    $853c
33ba 2805      jr      z,$33c1
33bc 2aca8f    ld      hl,($8fca)
33bf 1803      jr      $33c4
33c1 2acc8f    ld      hl,($8fcc)
33c4 e5        push    hl
33c5 cd6341    call    $4163
33c8 d1        pop     de
33c9 cdf231    call    $31f2
33cc cd2d33    call    $332d
33cf cdef2b    call    $2bef
33d2 cd7266    call    $6672
33d5 c38532    jp      $3285
33d8 210000    ld      hl,$0000
33db c9        ret     

33dc 2aa28f    ld      hl,($8fa2)
33df 7c        ld      a,h
33e0 b5        or      l
33e1 2004      jr      nz,$33e7
33e3 210100    ld      hl,$0001
33e6 c9        ret     

33e7 213e00    ld      hl,$003e
33ea e5        push    hl
33eb cddc28    call    $28dc
33ee d1        pop     de
33ef 2a9e8f    ld      hl,($8f9e)
33f2 cdf685    call    $85f6
33f5 22a08f    ld      ($8fa0),hl
33f8 7c        ld      a,h
33f9 b5        or      l
33fa 2804      jr      z,$3400
33fc 210100    ld      hl,$0001
33ff c9        ret     

3400 2aa48f    ld      hl,($8fa4)
3403 e5        push    hl
3404 cd5630    call    $3056
3407 2ac88f    ld      hl,($8fc8)
340a e3        ex      (sp),hl
340b cd6341    call    $4163
340e 2a9e8f    ld      hl,($8f9e)
3411 e3        ex      (sp),hl
3412 cd5630    call    $3056
3415 d1        pop     de
3416 cd2d33    call    $332d
3419 210000    ld      hl,$0000
341c 229e8f    ld      ($8f9e),hl
341f cd7266    call    $6672
3422 c38532    jp      $3285
3425 2aa48f    ld      hl,($8fa4)
3428 23        inc     hl
3429 22a48f    ld      ($8fa4),hl
342c c9        ret     

342d cd6a42    call    $426a
3430 cd6a42    call    $426a
3433 2aac8f    ld      hl,($8fac)
3436 7c        ld      a,h
3437 b5        or      l
3438 2010      jr      nz,$344a
343a cd8d41    call    $418d
343d e5        push    hl
343e cd2c46    call    $462c
3441 d1        pop     de
3442 22ae8f    ld      ($8fae),hl
3445 22ac8f    ld      ($8fac),hl
3448 181a      jr      $3464
344a cd8d41    call    $418d
344d e5        push    hl
344e cd2c46    call    $462c
3451 e3        ex      (sp),hl
3452 2aae8f    ld      hl,($8fae)
3455 e5        push    hl
3456 cd9844    call    $4498
3459 d1        pop     de
345a d1        pop     de
345b 2aae8f    ld      hl,($8fae)
345e cdff86    call    $86ff
3461 22ae8f    ld      ($8fae),hl
3464 c39641    jp      $4196
3467 2a7c8f    ld      hl,($8f7c)
346a 7c        ld      a,h
346b b5        or      l
346c 2826      jr      z,$3494
346e cda42d    call    $2da4
3471 2021      jr      nz,$3494
3473 2a7c8f    ld      hl,($8f7c)
3476 110400    ld      de,$0004
3479 cd3c85    call    $853c
347c 2805      jr      z,$3483
347e cdcd28    call    $28cd
3481 1808      jr      $348b
3483 2a728f    ld      hl,($8f72)
3486 e5        push    hl
3487 cd8a55    call    $558a
348a d1        pop     de
348b cd0032    call    $3200
348e cd6733    call    $3367
3491 c36a42    jp      $426a
3494 c32543    jp      $4325
3497 21bb33    ld      hl,$33bb
349a e5        push    hl
349b cd242d    call    $2d24
349e d1        pop     de
349f 2803      jr      z,$34a4
34a1 c32543    jp      $4325
34a4 cd7c32    call    $327c
34a7 cd7266    call    $6672
34aa cd8d41    call    $418d
34ad 2006      jr      nz,$34b5
34af cd9641    call    $4196
34b2 c39733    jp      $3397
34b5 cd9733    call    $3397
34b8 c36a42    jp      $426a
34bb 65        ld      h,l
34bc 6e        ld      l,(hl)
34bd 64        ld      h,h
34be 00        nop     
34bf cda98b    call    $8ba9
34c2 cdef2b    call    $2bef
34c5 2a7c8f    ld      hl,($8f7c)
34c8 110200    ld      de,$0002
34cb cd3c85    call    $853c
34ce 2805      jr      z,$34d5
34d0 cdcd28    call    $28cd
34d3 180e      jr      $34e3
34d5 2a7c8f    ld      hl,($8f7c)
34d8 110800    ld      de,$0008
34db cd4885    call    $8548
34de 2803      jr      z,$34e3
34e0 c34b3c    jp      $3c4b
34e3 cd0032    call    $3200
34e6 cd8d41    call    $418d
34e9 44        ld      b,h
34ea 4d        ld      c,l
34eb e5        push    hl
34ec cd4146    call    $4641
34ef d1        pop     de
34f0 280f      jr      z,$3501
34f2 cd5a4b    call    $4b5a
34f5 2805      jr      z,$34fc
34f7 cd6e4b    call    $4b6e
34fa 1805      jr      $3501
34fc c5        push    bc
34fd cd2a54    call    $542a
3500 d1        pop     de
3501 cd6733    call    $3367
3504 210100    ld      hl,$0001
3507 22a28f    ld      ($8fa2),hl
350a 210000    ld      hl,$0000
350d 22a48f    ld      ($8fa4),hl
3510 cd8532    call    $3285
3513 cd9733    call    $3397
3516 cd6a42    call    $426a
3519 2aac8f    ld      hl,($8fac)
351c 7c        ld      a,h
351d b5        or      l
351e 200c      jr      nz,$352c
3520 2ac68f    ld      hl,($8fc6)
3523 e5        push    hl
3524 c5        push    bc
3525 cdf347    call    $47f3
3528 d1        pop     de
3529 d1        pop     de
352a 180f      jr      $353b
352c 2aac8f    ld      hl,($8fac)
352f e5        push    hl
3530 2ac68f    ld      hl,($8fc6)
3533 e5        push    hl
3534 c5        push    bc
3535 cd5c47    call    $475c
3538 d1        pop     de
3539 d1        pop     de
353a d1        pop     de
353b cd8d41    call    $418d
353e e5        push    hl
353f 2abc8f    ld      hl,($8fbc)
3542 e5        push    hl
3543 c5        push    bc
3544 cd5c47    call    $475c
3547 d1        pop     de
3548 d1        pop     de
3549 d1        pop     de
354a cd9641    call    $4196
354d 2a9f8c    ld      hl,($8c9f)
3550 7c        ld      a,h
3551 b5        or      l
3552 200f      jr      nz,$3563
3554 c5        push    bc
3555 cd3135    call    $3531
3558 216634    ld      hl,$3466
355b e3        ex      (sp),hl
355c cd1c67    call    $671c
355f d1        pop     de
3560 cdab66    call    $66ab
3563 c39641    jp      $4196
3566 2064      jr      nz,$35cc
3568 65        ld      h,l
3569 66        ld      h,(hl)
356a 69        ld      l,c
356b 6e        ld      l,(hl)
356c 65        ld      h,l
356d 64        ld      h,h
356e 00        nop     
356f cda98b    call    $8ba9
3572 210800    ld      hl,$0008
3575 39        add     hl,sp
3576 5e        ld      e,(hl)
3577 23        inc     hl
3578 56        ld      d,(hl)
3579 eb        ex      de,hl
357a 22e890    ld      ($90e8),hl
357d cdff86    call    $86ff
3580 cdf886    call    $86f8
3583 22e890    ld      ($90e8),hl
3586 7c        ld      a,h
3587 b5        or      l
3588 2818      jr      z,$35a2
358a 2ae890    ld      hl,($90e8)
358d e5        push    hl
358e cd212e    call    $2e21
3591 e3        ex      (sp),hl
3592 2ae890    ld      hl,($90e8)
3595 cdf886    call    $86f8
3598 d1        pop     de
3599 19        add     hl,de
359a 23        inc     hl
359b 5e        ld      e,(hl)
359c 1600      ld      d,$00
359e eb        ex      de,hl
359f 22ed90    ld      ($90ed),hl
35a2 1809      jr      $35ad
35a4 2ae890    ld      hl,($90e8)
35a7 cdff86    call    $86ff
35aa 22e890    ld      ($90e8),hl
35ad 2ae890    ld      hl,($90e8)
35b0 7c        ld      a,h
35b1 b5        or      l
35b2 c8        ret     z

35b3 2ae890    ld      hl,($90e8)
35b6 cdf886    call    $86f8
35b9 22ea90    ld      ($90ea),hl
35bc 2ae890    ld      hl,($90e8)
35bf e5        push    hl
35c0 cd212e    call    $2e21
35c3 d1        pop     de
35c4 44        ld      b,h
35c5 4d        ld      c,l
35c6 1803      jr      $35cb
35c8 03        inc     bc
35c9 60        ld      h,b
35ca 69        ld      l,c
35cb 50        ld      d,b
35cc 59        ld      e,c
35cd 210400    ld      hl,$0004
35d0 cd6c85    call    $856c
35d3 2852      jr      z,$3627
35d5 2aea90    ld      hl,($90ea)
35d8 50        ld      d,b
35d9 59        ld      e,c
35da 19        add     hl,de
35db 5e        ld      e,(hl)
35dc 1600      ld      d,$00
35de eb        ex      de,hl
35df 7d        ld      a,l
35e0 32ec90    ld      ($90ec),a
35e3 7c        ld      a,h
35e4 b5        or      l
35e5 c8        ret     z

35e6 210a00    ld      hl,$000a
35e9 39        add     hl,sp
35ea 7e        ld      a,(hl)
35eb 23        inc     hl
35ec b6        or      (hl)
35ed 282c      jr      z,$361b
35ef 212b35    ld      hl,$352b
35f2 e5        push    hl
35f3 2aec90    ld      hl,($90ec)
35f6 2600      ld      h,$00
35f8 e5        push    hl
35f9 cdec29    call    $29ec
35fc d1        pop     de
35fd d1        pop     de
35fe 2013      jr      nz,$3613
3600 2aec90    ld      hl,($90ec)
3603 2600      ld      h,$00
3605 e5        push    hl
3606 cd1a2a    call    $2a1a
3609 d1        pop     de
360a 280f      jr      z,$361b
360c 2aed90    ld      hl,($90ed)
360f 7c        ld      a,h
3610 b5        or      l
3611 2808      jr      z,$361b
3613 215c00    ld      hl,$005c
3616 e5        push    hl
3617 cdc966    call    $66c9
361a d1        pop     de
361b 2aec90    ld      hl,($90ec)
361e 2600      ld      h,$00
3620 e5        push    hl
3621 cdc966    call    $66c9
3624 d1        pop     de
3625 18a1      jr      $35c8
3627 c3a434    jp      $34a4
362a c9        ret     

362b 5c        ld      e,h
362c 5b        ld      e,e
362d 5d        ld      e,l
362e 3b        dec     sp
362f 2000      jr      nz,$3631
3631 cda98b    call    $8ba9
3634 210800    ld      hl,$0008
3637 39        add     hl,sp
3638 4e        ld      c,(hl)
3639 23        inc     hl
363a 46        ld      b,(hl)
363b 2afa8f    ld      hl,($8ffa)
363e 7c        ld      a,h
363f b5        or      l
3640 280c      jr      z,$364e
3642 c5        push    bc
3643 cd4146    call    $4641
3646 d1        pop     de
3647 2005      jr      nz,$364e
3649 210000    ld      hl,$0000
364c 1803      jr      $3651
364e 210100    ld      hl,$0001
3651 cdf685    call    $85f6
3654 e5        push    hl
3655 c5        push    bc
3656 cd6f34    call    $346f
3659 d1        pop     de
365a d1        pop     de
365b c9        ret     

365c cd0585    call    $8505
365f e8        ret     pe

3660 ff        rst     $38
3661 212000    ld      hl,$0020
3664 39        add     hl,sp
3665 4e        ld      c,(hl)
3666 23        inc     hl
3667 46        ld      b,(hl)
3668 210400    ld      hl,$0004
366b 39        add     hl,sp
366c e5        push    hl
366d c5        push    bc
366e cd9f45    call    $459f
3671 d1        pop     de
3672 cda77c    call    $7ca7
3675 cdc382    call    $82c3
3678 eb        ex      de,hl
3679 210a00    ld      hl,$000a
367c 39        add     hl,sp
367d f9        ld      sp,hl
367e 210400    ld      hl,$0004
3681 39        add     hl,sp
3682 e5        push    hl
3683 cd1c67    call    $671c
3686 d1        pop     de
3687 c9        ret     

3688 cda98b    call    $8ba9
368b 210800    ld      hl,$0008
368e 39        add     hl,sp
368f 4e        ld      c,(hl)
3690 23        inc     hl
3691 46        ld      b,(hl)
3692 cdb436    call    $36b4
3695 c5        push    bc
3696 cd2545    call    $4525
3699 d1        pop     de
369a 2806      jr      z,$36a2
369c c5        push    bc
369d cd5c35    call    $355c
36a0 d1        pop     de
36a1 c9        ret     

36a2 c5        push    bc
36a3 cd3135    call    $3531
36a6 d1        pop     de
36a7 c9        ret     

36a8 cda98b    call    $8ba9
36ab 210800    ld      hl,$0008
36ae 39        add     hl,sp
36af 4e        ld      c,(hl)
36b0 23        inc     hl
36b1 46        ld      b,(hl)
36b2 78        ld      a,b
36b3 b1        or      c
36b4 ca3236    jp      z,$3632
36b7 cdb436    call    $36b4
36ba cd343c    call    $3c34
36bd 2817      jr      z,$36d6
36bf 60        ld      h,b
36c0 69        ld      l,c
36c1 eb        ex      de,hl
36c2 2abf8c    ld      hl,($8cbf)
36c5 cd3c85    call    $853c
36c8 280c      jr      z,$36d6
36ca 2a8c8f    ld      hl,($8f8c)
36cd 22bd8c    ld      ($8cbd),hl
36d0 2a908f    ld      hl,($8f90)
36d3 22b98c    ld      ($8cb9),hl
36d6 60        ld      h,b
36d7 69        ld      l,c
36d8 cdf886    call    $86f8
36db 22ef90    ld      ($90ef),hl
36de e5        push    hl
36df cd3936    call    $3639
36e2 d1        pop     de
36e3 cd2533    call    $3325
36e6 60        ld      h,b
36e7 69        ld      l,c
36e8 cdff86    call    $86ff
36eb 44        ld      b,h
36ec 4d        ld      c,l
36ed 7c        ld      a,h
36ee b5        or      l
36ef 2841      jr      z,$3732
36f1 c5        push    bc
36f2 cdd944    call    $44d9
36f5 d1        pop     de
36f6 280e      jr      z,$3706
36f8 213536    ld      hl,$3635
36fb e5        push    hl
36fc cd1c67    call    $671c
36ff d1        pop     de
3700 c5        push    bc
3701 cd8835    call    $3588
3704 d1        pop     de
3705 c9        ret     

3706 2aef90    ld      hl,($90ef)
3709 eb        ex      de,hl
370a 2ada8f    ld      hl,($8fda)
370d cd4885    call    $8548
3710 281d      jr      z,$372f
3712 2aef90    ld      hl,($90ef)
3715 eb        ex      de,hl
3716 2adc8f    ld      hl,($8fdc)
3719 cd4885    call    $8548
371c 2811      jr      z,$372f
371e 60        ld      h,b
371f 69        ld      l,c
3720 cdf886    call    $86f8
3723 eb        ex      de,hl
3724 2ad88f    ld      hl,($8fd8)
3727 cd4885    call    $8548
372a 2803      jr      z,$372f
372c cdd76b    call    $6bd7
372f c3b235    jp      $35b2
3732 c3b436    jp      $36b4
3735 202e      jr      nz,$3765
3737 2000      jr      nz,$3739
3739 cda98b    call    $8ba9
373c 210800    ld      hl,$0008
373f 39        add     hl,sp
3740 4e        ld      c,(hl)
3741 23        inc     hl
3742 46        ld      b,(hl)
3743 78        ld      a,b
3744 b1        or      c
3745 280d      jr      z,$3754
3747 c5        push    bc
3748 cdd944    call    $44d9
374b d1        pop     de
374c 2806      jr      z,$3754
374e c5        push    bc
374f cd8835    call    $3588
3752 d1        pop     de
3753 c9        ret     

3754 215b00    ld      hl,$005b
3757 e5        push    hl
3758 cdc966    call    $66c9
375b d1        pop     de
375c cd2533    call    $3325
375f cdb436    call    $36b4
3762 cd7266    call    $6672
3765 c5        push    bc
3766 cda835    call    $35a8
3769 215d00    ld      hl,$005d
376c e3        ex      (sp),hl
376d cdc966    call    $66c9
3770 d1        pop     de
3771 c9        ret     

3772 cda98b    call    $8ba9
3775 210800    ld      hl,$0008
3778 39        add     hl,sp
3779 4e        ld      c,(hl)
377a 23        inc     hl
377b 46        ld      b,(hl)
377c cdd76b    call    $6bd7
377f c5        push    bc
3780 cd5646    call    $4656
3783 d1        pop     de
3784 280e      jr      z,$3794
3786 212200    ld      hl,$0022
3789 e5        push    hl
378a cdc966    call    $66c9
378d d1        pop     de
378e c5        push    bc
378f cd3135    call    $3531
3792 d1        pop     de
3793 c9        ret     

3794 c5        push    bc
3795 cd3936    call    $3639
3798 d1        pop     de
3799 c9        ret     

379a 210000    ld      hl,$0000
379d 22a48f    ld      ($8fa4),hl
37a0 cd0237    call    $3702
37a3 280e      jr      z,$37b3
37a5 cd2837    call    $3728
37a8 2809      jr      z,$37b3
37aa cdd76b    call    $6bd7
37ad cd4a37    call    $374a
37b0 cd5837    call    $3758
37b3 c9        ret     

37b4 cda98b    call    $8ba9
37b7 cd0237    call    $3702
37ba c8        ret     z

37bb cd3237    call    $3732
37be eb        ex      de,hl
37bf 2ac88f    ld      hl,($8fc8)
37c2 cd3c85    call    $853c
37c5 2822      jr      z,$37e9
37c7 cd3e37    call    $373e
37ca e5        push    hl
37cb cd9f45    call    $459f
37ce d1        pop     de
37cf cde681    call    $81e6
37d2 44        ld      b,h
37d3 4d        ld      c,l
37d4 cd5837    call    $3758
37d7 cdab66    call    $66ab
37da cd0237    call    $3702
37dd 2803      jr      z,$37e2
37df 0b        dec     bc
37e0 60        ld      h,b
37e1 69        ld      l,c
37e2 c5        push    bc
37e3 cdb56b    call    $6bb5
37e6 d1        pop     de
37e7 1816      jr      $37ff
37e9 cd2837    call    $3728
37ec 2805      jr      z,$37f3
37ee cdd76b    call    $6bd7
37f1 1803      jr      $37f6
37f3 cdab66    call    $66ab
37f6 cd4a37    call    $374a
37f9 cdab66    call    $66ab
37fc cd5837    call    $3758
37ff 18b6      jr      $37b7
3801 c9        ret     

3802 cda98b    call    $8ba9
3805 2aac8f    ld      hl,($8fac)
3808 7c        ld      a,h
3809 b5        or      l
380a 2004      jr      nz,$3810
380c 210000    ld      hl,$0000
380f c9        ret     

3810 2aac8f    ld      hl,($8fac)
3813 cdf886    call    $86f8
3816 cdf886    call    $86f8
3819 e5        push    hl
381a cd9f45    call    $459f
381d d1        pop     de
381e cde681    call    $81e6
3821 eb        ex      de,hl
3822 2aa48f    ld      hl,($8fa4)
3825 c33c85    jp      $853c
3828 cd3237    call    $3732
382b eb        ex      de,hl
382c 2acc8f    ld      hl,($8fcc)
382f c33c85    jp      $853c
3832 2aac8f    ld      hl,($8fac)
3835 cdf886    call    $86f8
3838 cdff86    call    $86ff
383b c3f886    jp      $86f8
383e 2aac8f    ld      hl,($8fac)
3841 cdf886    call    $86f8
3844 cdff86    call    $86ff
3847 c3ff86    jp      $86ff
384a 210000    ld      hl,$0000
384d e5        push    hl
384e cd3e37    call    $373e
3851 e5        push    hl
3852 cd6f34    call    $346f
3855 d1        pop     de
3856 d1        pop     de
3857 c9        ret     

3858 2aac8f    ld      hl,($8fac)
385b cdff86    call    $86ff
385e 22ac8f    ld      ($8fac),hl
3861 c9        ret     

3862 210000    ld      hl,$0000
3865 22ac8f    ld      ($8fac),hl
3868 c9        ret     

3869 2ac48f    ld      hl,($8fc4)
386c e5        push    hl
386d cd8537    call    $3785
3870 d1        pop     de
3871 c9        ret     

3872 cd1c43    call    $431c
3875 2abc8f    ld      hl,($8fbc)
3878 e5        push    hl
3879 cd8537    call    $3785
387c 2ac68f    ld      hl,($8fc6)
387f e3        ex      (sp),hl
3880 cd8537    call    $3785
3883 d1        pop     de
3884 c9        ret     

3885 cda98b    call    $8ba9
3888 180b      jr      $3895
388a cd8d41    call    $418d
388d cdff86    call    $86ff
3890 e5        push    hl
3891 cdc941    call    $41c9
3894 d1        pop     de
3895 cd8d41    call    $418d
3898 2816      jr      z,$38b0
389a 210800    ld      hl,$0008
389d 39        add     hl,sp
389e 5e        ld      e,(hl)
389f 23        inc     hl
38a0 56        ld      d,(hl)
38a1 d5        push    de
38a2 cd8d41    call    $418d
38a5 cdf886    call    $86f8
38a8 e5        push    hl
38a9 cdf347    call    $47f3
38ac d1        pop     de
38ad d1        pop     de
38ae 18da      jr      $388a
38b0 c39641    jp      $4196
38b3 cd2543    call    $4325
38b6 c3c237    jp      $37c2
38b9 cd1c43    call    $431c
38bc cdfc37    call    $37fc
38bf c3c237    jp      $37c2
38c2 2ab48f    ld      hl,($8fb4)
38c5 e5        push    hl
38c6 cdd337    call    $37d3
38c9 d1        pop     de
38ca cdaa41    call    $41aa
38cd e5        push    hl
38ce cdc941    call    $41c9
38d1 d1        pop     de
38d2 c9        ret     

38d3 cda98b    call    $8ba9
38d6 210800    ld      hl,$0008
38d9 39        add     hl,sp
38da 4e        ld      c,(hl)
38db 23        inc     hl
38dc 46        ld      b,(hl)
38dd 78        ld      a,b
38de b1        or      c
38df c8        ret     z

38e0 cd7266    call    $6672
38e3 60        ld      h,b
38e4 69        ld      l,c
38e5 cdff86    call    $86ff
38e8 e5        push    hl
38e9 cdd337    call    $37d3
38ec 2abc8f    ld      hl,($8fbc)
38ef e3        ex      (sp),hl
38f0 60        ld      h,b
38f1 69        ld      l,c
38f2 cdf886    call    $86f8
38f5 e5        push    hl
38f6 cd743b    call    $3b74
38f9 d1        pop     de
38fa d1        pop     de
38fb c9        ret     

38fc cd2543    call    $4325
38ff 2ac48f    ld      hl,($8fc4)
3902 e5        push    hl
3903 cdf53a    call    $3af5
3906 d1        pop     de
3907 c9        ret     

3908 cd295b    call    $5b29
390b 210000    ld      hl,$0000
390e 22d28c    ld      ($8cd2),hl
3911 210100    ld      hl,$0001
3914 22f88f    ld      ($8ff8),hl
3917 2a2e90    ld      hl,($902e)
391a 2b        dec     hl
391b 22748f    ld      ($8f74),hl
391e 210a00    ld      hl,$000a
3921 7d        ld      a,l
3922 32768f    ld      ($8f76),a
3925 c9        ret     

3926 210100    ld      hl,$0001
3929 22908f    ld      ($8f90),hl
392c 22bd8c    ld      ($8cbd),hl
392f 22b98c    ld      ($8cb9),hl
3932 c37c4b    jp      $4b7c
3935 cdab66    call    $66ab
3938 cd2638    call    $3826
393b 21758c    ld      hl,$8c75
393e e5        push    hl
393f cd017c    call    $7c01
3942 d1        pop     de
3943 2803      jr      z,$3948
3945 cd8357    call    $5783
3948 210100    ld      hl,$0001
394b 22fa8f    ld      ($8ffa),hl
394e cd9c5b    call    $5b9c
3951 cd843c    call    $3c84
3954 210000    ld      hl,$0000
3957 22ce8c    ld      ($8cce),hl
395a e5        push    hl
395b 2a2e90    ld      hl,($902e)
395e 22cb8c    ld      ($8ccb),hl
3961 d1        pop     de
3962 73        ld      (hl),e
3963 c9        ret     

3964 cd843c    call    $3c84
3967 cd3d3c    call    $3c3d
396a cd9c5b    call    $5b9c
396d 2ace8c    ld      hl,($8cce)
3970 2b        dec     hl
3971 22ce8c    ld      ($8cce),hl
3974 23        inc     hl
3975 7c        ld      a,h
3976 b5        or      l
3977 2817      jr      z,$3990
3979 2acb8c    ld      hl,($8ccb)
397c 2b        dec     hl
397d 22cb8c    ld      ($8ccb),hl
3980 23        inc     hl
3981 5e        ld      e,(hl)
3982 1600      ld      d,$00
3984 d5        push    de
3985 2ac38c    ld      hl,($8cc3)
3988 2b        dec     hl
3989 22c38c    ld      ($8cc3),hl
398c d1        pop     de
398d 73        ld      (hl),e
398e 18dd      jr      $396d
3990 2ac38c    ld      hl,($8cc3)
3993 22cb8c    ld      ($8ccb),hl
3996 c9        ret     

3997 cda98b    call    $8ba9
399a cd3538    call    $3835
399d 210a00    ld      hl,$000a
39a0 39        add     hl,sp
39a1 5e        ld      e,(hl)
39a2 23        inc     hl
39a3 56        ld      d,(hl)
39a4 d5        push    de
39a5 210a00    ld      hl,$000a
39a8 39        add     hl,sp
39a9 5e        ld      e,(hl)
39aa 23        inc     hl
39ab 56        ld      d,(hl)
39ac d5        push    de
39ad cdb538    call    $38b5
39b0 d1        pop     de
39b1 d1        pop     de
39b2 c36438    jp      $3864
39b5 cda98b    call    $8ba9
39b8 210800    ld      hl,$0008
39bb 39        add     hl,sp
39bc 4e        ld      c,(hl)
39bd 23        inc     hl
39be 46        ld      b,(hl)
39bf 1807      jr      $39c8
39c1 60        ld      h,b
39c2 69        ld      l,c
39c3 cdff86    call    $86ff
39c6 44        ld      b,h
39c7 4d        ld      c,l
39c8 78        ld      a,b
39c9 b1        or      c
39ca ca4e3a    jp      z,$3a4e
39cd cd6237    call    $3762
39d0 60        ld      h,b
39d1 69        ld      l,c
39d2 cdf886    call    $86f8
39d5 22f590    ld      ($90f5),hl
39d8 210a00    ld      hl,$000a
39db 39        add     hl,sp
39dc 5e        ld      e,(hl)
39dd 23        inc     hl
39de 56        ld      d,(hl)
39df eb        ex      de,hl
39e0 c3343a    jp      $3a34
39e3 2abc8f    ld      hl,($8fbc)
39e6 e5        push    hl
39e7 2af590    ld      hl,($90f5)
39ea e5        push    hl
39eb cd3447    call    $4734
39ee d1        pop     de
39ef d1        pop     de
39f0 22f190    ld      ($90f1),hl
39f3 7c        ld      a,h
39f4 b5        or      l
39f5 2874      jr      z,$3a6b
39f7 cd623a    call    $3a62
39fa 2af190    ld      hl,($90f1)
39fd e5        push    hl
39fe 2af590    ld      hl,($90f5)
3a01 e5        push    hl
3a02 cd813a    call    $3a81
3a05 d1        pop     de
3a06 d1        pop     de
3a07 210a00    ld      hl,$000a
3a0a 39        add     hl,sp
3a0b 5e        ld      e,(hl)
3a0c 23        inc     hl
3a0d 56        ld      d,(hl)
3a0e 210100    ld      hl,$0001
3a11 cd3c85    call    $853c
3a14 2850      jr      z,$3a66
3a16 2af190    ld      hl,($90f1)
3a19 cdff86    call    $86ff
3a1c 22f190    ld      ($90f1),hl
3a1f 1809      jr      $3a2a
3a21 2af190    ld      hl,($90f1)
3a24 cdff86    call    $86ff
3a27 22f190    ld      ($90f1),hl
3a2a 2af190    ld      hl,($90f1)
3a2d 7c        ld      a,h
3a2e b5        or      l
3a2f 2822      jr      z,$3a53
3a31 cdab66    call    $66ab
3a34 2af190    ld      hl,($90f1)
3a37 eb        ex      de,hl
3a38 2abb8c    ld      hl,($8cbb)
3a3b cd3c85    call    $853c
3a3e 2806      jr      z,$3a46
3a40 2a908f    ld      hl,($8f90)
3a43 22b98c    ld      ($8cb9),hl
3a46 2af190    ld      hl,($90f1)
3a49 cdf886    call    $86f8
3a4c e5        push    hl
3a4d cda835    call    $35a8
3a50 d1        pop     de
3a51 18ce      jr      $3a21
3a53 cdb436    call    $36b4
3a56 2abf8c    ld      hl,($8cbf)
3a59 7c        ld      a,h
3a5a b5        or      l
3a5b 2006      jr      nz,$3a63
3a5d 2a988f    ld      hl,($8f98)
3a60 22bd8c    ld      ($8cbd),hl
3a63 cd6f3a    call    $3a6f
3a66 cdab66    call    $66ab
3a69 181d      jr      $3a88
3a6b 2ac48f    ld      hl,($8fc4)
3a6e e5        push    hl
3a6f 2af590    ld      hl,($90f5)
3a72 e5        push    hl
3a73 cd0147    call    $4701
3a76 d1        pop     de
3a77 d1        pop     de
3a78 200e      jr      nz,$3a88
3a7a cd623a    call    $3a62
3a7d 2af590    ld      hl,($90f5)
3a80 e5        push    hl
3a81 cd8835    call    $3588
3a84 d1        pop     de
3a85 cd6f3a    call    $3a6f
3a88 c34b3a    jp      $3a4b
3a8b 2ac48f    ld      hl,($8fc4)
3a8e e5        push    hl
3a8f 2af590    ld      hl,($90f5)
3a92 e5        push    hl
3a93 cd0147    call    $4701
3a96 d1        pop     de
3a97 d1        pop     de
3a98 22f190    ld      ($90f1),hl
3a9b 7c        ld      a,h
3a9c b5        or      l
3a9d 285d      jr      z,$3afc
3a9f 2af190    ld      hl,($90f1)
3aa2 cdf886    call    $86f8
3aa5 22f190    ld      ($90f1),hl
3aa8 cd2b3c    call    $3c2b
3aab 2808      jr      z,$3ab5
3aad 21513a    ld      hl,$3a51
3ab0 e5        push    hl
3ab1 cd1c67    call    $671c
3ab4 d1        pop     de
3ab5 2af590    ld      hl,($90f5)
3ab8 e5        push    hl
3ab9 cd8835    call    $3588
3abc d1        pop     de
3abd cdd76b    call    $6bd7
3ac0 cd2b3c    call    $3c2b
3ac3 2825      jr      z,$3aea
3ac5 2af190    ld      hl,($90f1)
3ac8 e5        push    hl
3ac9 cd5646    call    $4656
3acc d1        pop     de
3acd 2811      jr      z,$3ae0
3acf 212200    ld      hl,$0022
3ad2 e5        push    hl
3ad3 cd3f67    call    $673f
3ad6 2af190    ld      hl,($90f1)
3ad9 e3        ex      (sp),hl
3ada cd8835    call    $3588
3add d1        pop     de
3ade 1808      jr      $3ae8
3ae0 2af190    ld      hl,($90f1)
3ae3 e5        push    hl
3ae4 cd3936    call    $3639
3ae7 d1        pop     de
3ae8 180f      jr      $3af9
3aea 21583a    ld      hl,$3a58
3aed e5        push    hl
3aee cd1c67    call    $671c
3af1 2af190    ld      hl,($90f1)
3af4 e3        ex      (sp),hl
3af5 cd3936    call    $3639
3af8 d1        pop     de
3af9 cdab66    call    $66ab
3afc 184d      jr      $3b4b
3afe 2af590    ld      hl,($90f5)
3b01 e5        push    hl
3b02 cdd33b    call    $3bd3
3b05 d1        pop     de
3b06 cde63b    call    $3be6
3b09 2827      jr      z,$3b32
3b0b cd183c    call    $3c18
3b0e 20f6      jr      nz,$3b06
3b10 215c3a    ld      hl,$3a5c
3b13 e5        push    hl
3b14 cd1c67    call    $671c
3b17 2af590    ld      hl,($90f5)
3b1a e3        ex      (sp),hl
3b1b cd7236    call    $3672
3b1e 2ab38c    ld      hl,($8cb3)
3b21 e3        ex      (sp),hl
3b22 cd7236    call    $3672
3b25 2ab58c    ld      hl,($8cb5)
3b28 e3        ex      (sp),hl
3b29 cd7236    call    $3672
3b2c d1        pop     de
3b2d cdab66    call    $66ab
3b30 18d4      jr      $3b06
3b32 1817      jr      $3b4b
3b34 cd3586    call    $8635
3b37 04        inc     b
3b38 00        nop     
3b39 00        nop     
3b3a 00        nop     
3b3b e3        ex      (sp),hl
3b3c 3801      jr      c,$3b3f
3b3e 00        nop     
3b3f e3        ex      (sp),hl
3b40 3802      jr      c,$3b44
3b42 00        nop     
3b43 8b        adc     a,e
3b44 39        add     hl,sp
3b45 03        inc     bc
3b46 00        nop     
3b47 fe39      cp      $39
3b49 4b        ld      c,e
3b4a 3ac3c1    ld      a,($c1c3)
3b4d 38c3      jr      c,$3b12
3b4f 62        ld      h,d
3b50 37        scf     
3b51 6d        ld      l,l
3b52 61        ld      h,c
3b53 6b        ld      l,e
3b54 65        ld      h,l
3b55 2022      jr      nz,$3b79
3b57 00        nop     
3b58 69        ld      l,c
3b59 73        ld      (hl),e
3b5a 2000      jr      nz,$3b5c
3b5c 70        ld      (hl),b
3b5d 70        ld      (hl),b
3b5e 72        ld      (hl),d
3b5f 6f        ld      l,a
3b60 70        ld      (hl),b
3b61 00        nop     
3b62 216b3a    ld      hl,$3a6b
3b65 e5        push    hl
3b66 cd1c67    call    $671c
3b69 d1        pop     de
3b6a c9        ret     

3b6b 74        ld      (hl),h
3b6c 6f        ld      l,a
3b6d 2000      jr      nz,$3b6f
3b6f cdab66    call    $66ab
3b72 217d3a    ld      hl,$3a7d
3b75 e5        push    hl
3b76 cd1c67    call    $671c
3b79 d1        pop     de
3b7a c3c066    jp      $66c0
3b7d 65        ld      h,l
3b7e 6e        ld      l,(hl)
3b7f 64        ld      h,h
3b80 00        nop     
3b81 cda98b    call    $8ba9
3b84 210800    ld      hl,$0008
3b87 39        add     hl,sp
3b88 4e        ld      c,(hl)
3b89 23        inc     hl
3b8a 46        ld      b,(hl)
3b8b c5        push    bc
3b8c cd8835    call    $3588
3b8f d1        pop     de
3b90 210a00    ld      hl,$000a
3b93 39        add     hl,sp
3b94 5e        ld      e,(hl)
3b95 23        inc     hl
3b96 56        ld      d,(hl)
3b97 eb        ex      de,hl
3b98 22f790    ld      ($90f7),hl
3b9b cdf886    call    $86f8
3b9e 22f790    ld      ($90f7),hl
3ba1 1809      jr      $3bac
3ba3 2af790    ld      hl,($90f7)
3ba6 cdff86    call    $86ff
3ba9 22f790    ld      ($90f7),hl
3bac 2af790    ld      hl,($90f7)
3baf 7c        ld      a,h
3bb0 b5        or      l
3bb1 2818      jr      z,$3bcb
3bb3 cdd76b    call    $6bd7
3bb6 213a00    ld      hl,$003a
3bb9 e5        push    hl
3bba cd3f67    call    $673f
3bbd d1        pop     de
3bbe 2af790    ld      hl,($90f7)
3bc1 cdf886    call    $86f8
3bc4 e5        push    hl
3bc5 cd8835    call    $3588
3bc8 d1        pop     de
3bc9 18d8      jr      $3ba3
3bcb 2ac68f    ld      hl,($8fc6)
3bce e5        push    hl
3bcf c5        push    bc
3bd0 cd3447    call    $4734
3bd3 d1        pop     de
3bd4 d1        pop     de
3bd5 22ac8f    ld      ($8fac),hl
3bd8 c39a36    jp      $369a
3bdb cda98b    call    $8ba9
3bde 210800    ld      hl,$0008
3be1 39        add     hl,sp
3be2 5e        ld      e,(hl)
3be3 23        inc     hl
3be4 56        ld      d,(hl)
3be5 d5        push    de
3be6 cd8d41    call    $418d
3be9 e5        push    hl
3bea cd0147    call    $4701
3bed d1        pop     de
3bee d1        pop     de
3bef cdf685    call    $85f6
3bf2 c3f685    jp      $85f6
3bf5 cda98b    call    $8ba9
3bf8 cd1c3b    call    $3b1c
3bfb cd2f3b    call    $3b2f
3bfe 2813      jr      z,$3c13
3c00 210800    ld      hl,$0008
3c03 39        add     hl,sp
3c04 5e        ld      e,(hl)
3c05 23        inc     hl
3c06 56        ld      d,(hl)
3c07 d5        push    de
3c08 2aad8c    ld      hl,($8cad)
3c0b e5        push    hl
3c0c cd743b    call    $3b74
3c0f d1        pop     de
3c10 d1        pop     de
3c11 18e8      jr      $3bfb
3c13 cdaa41    call    $41aa
3c16 e5        push    hl
3c17 cdc941    call    $41c9
3c1a d1        pop     de
3c1b c9        ret     

3c1c 210000    ld      hl,$0000
3c1f 22af8c    ld      ($8caf),hl
3c22 29        add     hl,hl
3c23 11708e    ld      de,$8e70
3c26 19        add     hl,de
3c27 5e        ld      e,(hl)
3c28 23        inc     hl
3c29 56        ld      d,(hl)
3c2a eb        ex      de,hl
3c2b 22ab8c    ld      ($8cab),hl
3c2e c9        ret     

3c2f cda98b    call    $8ba9
3c32 2aab8c    ld      hl,($8cab)
3c35 7c        ld      a,h
3c36 b5        or      l
3c37 2025      jr      nz,$3c5e
3c39 2aaf8c    ld      hl,($8caf)
3c3c 23        inc     hl
3c3d 22af8c    ld      ($8caf),hl
3c40 118000    ld      de,$0080
3c43 eb        ex      de,hl
3c44 cd5585    call    $8555
3c47 2804      jr      z,$3c4d
3c49 210000    ld      hl,$0000
3c4c c9        ret     

3c4d 2aaf8c    ld      hl,($8caf)
3c50 29        add     hl,hl
3c51 11708e    ld      de,$8e70
3c54 19        add     hl,de
3c55 5e        ld      e,(hl)
3c56 23        inc     hl
3c57 56        ld      d,(hl)
3c58 eb        ex      de,hl
3c59 22ab8c    ld      ($8cab),hl
3c5c 18d4      jr      $3c32
3c5e 2aab8c    ld      hl,($8cab)
3c61 cdf886    call    $86f8
3c64 22ad8c    ld      ($8cad),hl
3c67 2aab8c    ld      hl,($8cab)
3c6a cdff86    call    $86ff
3c6d 22ab8c    ld      ($8cab),hl
3c70 210100    ld      hl,$0001
3c73 c9        ret     

3c74 cda98b    call    $8ba9
3c77 210800    ld      hl,$0008
3c7a 39        add     hl,sp
3c7b 4e        ld      c,(hl)
3c7c 23        inc     hl
3c7d 46        ld      b,(hl)
3c7e c5        push    bc
3c7f cd5646    call    $4656
3c82 d1        pop     de
3c83 c8        ret     z

3c84 210a00    ld      hl,$000a
3c87 39        add     hl,sp
3c88 5e        ld      e,(hl)
3c89 23        inc     hl
3c8a 56        ld      d,(hl)
3c8b 210100    ld      hl,$0001
3c8e cd3c85    call    $853c
3c91 280b      jr      z,$3c9e
3c93 c5        push    bc
3c94 cdd33b    call    $3bd3
3c97 d1        pop     de
3c98 cdbc3b    call    $3bbc
3c9b c0        ret     nz

3c9c 180f      jr      $3cad
3c9e 210a00    ld      hl,$000a
3ca1 39        add     hl,sp
3ca2 5e        ld      e,(hl)
3ca3 23        inc     hl
3ca4 56        ld      d,(hl)
3ca5 d5        push    de
3ca6 c5        push    bc
3ca7 cd0147    call    $4701
3caa d1        pop     de
3cab d1        pop     de
3cac c8        ret     z

3cad cd8d41    call    $418d
3cb0 e5        push    hl
3cb1 c5        push    bc
3cb2 cd7d45    call    $457d
3cb5 d1        pop     de
3cb6 e3        ex      (sp),hl
3cb7 cdc941    call    $41c9
3cba d1        pop     de
3cbb c9        ret     

3cbc cda98b    call    $8ba9
3cbf cde63b    call    $3be6
3cc2 280b      jr      z,$3ccf
3cc4 cd183c    call    $3c18
3cc7 2004      jr      nz,$3ccd
3cc9 210000    ld      hl,$0000
3ccc c9        ret     

3ccd 18f0      jr      $3cbf
3ccf 210100    ld      hl,$0001
3cd2 c9        ret     

3cd3 cda98b    call    $8ba9
3cd6 210800    ld      hl,$0008
3cd9 39        add     hl,sp
3cda 5e        ld      e,(hl)
3cdb 23        inc     hl
3cdc 56        ld      d,(hl)
3cdd d5        push    de
3cde cd5648    call    $4856
3ce1 d1        pop     de
3ce2 22b18c    ld      ($8cb1),hl
3ce5 c9        ret     

3ce6 cda98b    call    $8ba9
3ce9 2ab18c    ld      hl,($8cb1)
3cec 7c        ld      a,h
3ced b5        or      l
3cee 2004      jr      nz,$3cf4
3cf0 210000    ld      hl,$0000
3cf3 c9        ret     

3cf4 2ab18c    ld      hl,($8cb1)
3cf7 cdf886    call    $86f8
3cfa 22b38c    ld      ($8cb3),hl
3cfd 2ab18c    ld      hl,($8cb1)
3d00 cdff86    call    $86ff
3d03 cdf886    call    $86f8
3d06 22b58c    ld      ($8cb5),hl
3d09 2ab18c    ld      hl,($8cb1)
3d0c e5        push    hl
3d0d cd5648    call    $4856
3d10 d1        pop     de
3d11 22b18c    ld      ($8cb1),hl
3d14 210100    ld      hl,$0001
3d17 c9        ret     

3d18 2ab38c    ld      hl,($8cb3)
3d1b e5        push    hl
3d1c cd0f10    call    $100f
3d1f d1        pop     de
3d20 2ae68d    ld      hl,($8de6)
3d23 2600      ld      h,$00
3d25 112e00    ld      de,$002e
3d28 c33c85    jp      $853c
3d2b 2afa8f    ld      hl,($8ffa)
3d2e 110000    ld      de,$0000
3d31 c34885    jp      $8548
3d34 2afa8f    ld      hl,($8ffa)
3d37 110100    ld      de,$0001
3d3a c33c85    jp      $853c
3d3d 210000    ld      hl,$0000
3d40 22fa8f    ld      ($8ffa),hl
3d43 c9        ret     

3d44 210000    ld      hl,$0000
3d47 22f88f    ld      ($8ff8),hl
3d4a c9        ret     

3d4b 2a728f    ld      hl,($8f72)
3d4e e5        push    hl
3d4f cd0967    call    $6709
3d52 215b3c    ld      hl,$3c5b
3d55 e3        ex      (sp),hl
3d56 cd0967    call    $6709
3d59 d1        pop     de
3d5a c9        ret     

3d5b 2069      jr      nz,$3dc6
3d5d 73        ld      (hl),e
3d5e 6e        ld      l,(hl)
3d5f 27        daa     
3d60 74        ld      (hl),h
3d61 2061      jr      nz,$3dc4
3d63 206e      jr      nz,$3dd3
3d65 61        ld      h,c
3d66 6d        ld      l,l
3d67 65        ld      h,l
3d68 206f      jr      nz,$3dd9
3d6a 72        ld      (hl),d
3d6b 2070      jr      nz,$3ddd
3d6d 72        ld      (hl),d
3d6e 6f        ld      l,a
3d6f 63        ld      h,e
3d70 65        ld      h,l
3d71 64        ld      h,h
3d72 75        ld      (hl),l
3d73 72        ld      (hl),d
3d74 65        ld      h,l
3d75 00        nop     
3d76 2a9a8f    ld      hl,($8f9a)
3d79 22a68f    ld      ($8fa6),hl
3d7c c9        ret     

3d7d 210000    ld      hl,$0000
3d80 22a68f    ld      ($8fa6),hl
3d83 c9        ret     

3d84 210100    ld      hl,$0001
3d87 228c8f    ld      ($8f8c),hl
3d8a c9        ret     

3d8b 210000    ld      hl,$0000
3d8e 22b68f    ld      ($8fb6),hl
3d91 22ee8f    ld      ($8fee),hl
3d94 22ec8f    ld      ($8fec),hl
3d97 22e28f    ld      ($8fe2),hl
3d9a 22ea8f    ld      ($8fea),hl
3d9d 22e88f    ld      ($8fe8),hl
3da0 22e68f    ld      ($8fe6),hl
3da3 22e48f    ld      ($8fe4),hl
3da6 c37c4b    jp      $4b7c
3da9 cda98b    call    $8ba9
3dac 2aa98c    ld      hl,($8ca9)
3daf 11c800    ld      de,$00c8
3db2 eb        ex      de,hl
3db3 cd5d86    call    $865d
3db6 2842      jr      z,$3dfa
3db8 2a9f8c    ld      hl,($8c9f)
3dbb 7c        ld      a,h
3dbc b5        or      l
3dbd 281b      jr      z,$3dda
3dbf 2a0890    ld      hl,($9008)
3dc2 7c        ld      a,h
3dc3 b5        or      l
3dc4 2014      jr      nz,$3dda
3dc6 cdab66    call    $66ab
3dc9 216d3d    ld      hl,$3d6d
3dcc e5        push    hl
3dcd cd3e69    call    $693e
3dd0 210100    ld      hl,$0001
3dd3 e3        ex      (sp),hl
3dd4 cd6e77    call    $776e
3dd7 d1        pop     de
3dd8 1820      jr      $3dfa
3dda 2a9d8c    ld      hl,($8c9d)
3ddd 7c        ld      a,h
3dde b5        or      l
3ddf 2019      jr      nz,$3dfa
3de1 210100    ld      hl,$0001
3de4 229d8c    ld      ($8c9d),hl
3de7 cdd53d    call    $3dd5
3dea 2a9d8c    ld      hl,($8c9d)
3ded 7c        ld      a,h
3dee b5        or      l
3def 2809      jr      z,$3dfa
3df1 cda93c    call    $3ca9
3df4 22998c    ld      ($8c99),hl
3df7 cdbd55    call    $55bd
3dfa 2a958c    ld      hl,($8c95)
3dfd 7c        ld      a,h
3dfe b5        or      l
3dff 204d      jr      nz,$3e4e
3e01 2a9b8c    ld      hl,($8c9b)
3e04 eb        ex      de,hl
3e05 2aa78c    ld      hl,($8ca7)
3e08 cd6686    call    $8666
3e0b 2828      jr      z,$3e35
3e0d 210000    ld      hl,$0000
3e10 e5        push    hl
3e11 2a978c    ld      hl,($8c97)
3e14 110400    ld      de,$0004
3e17 19        add     hl,de
3e18 22978c    ld      ($8c97),hl
3e1b 11fcff    ld      de,$fffc
3e1e 19        add     hl,de
3e1f 44        ld      b,h
3e20 4d        ld      c,l
3e21 e5        push    hl
3e22 cd7344    call    $4473
3e25 d1        pop     de
3e26 d1        pop     de
3e27 c5        push    bc
3e28 cd1641    call    $4116
3e2b d1        pop     de
3e2c 2a9b8c    ld      hl,($8c9b)
3e2f 23        inc     hl
3e30 229b8c    ld      ($8c9b),hl
3e33 1817      jr      $3e4c
3e35 cdba66    call    $66ba
3e38 218c3d    ld      hl,$3d8c
3e3b e5        push    hl
3e3c cd3e69    call    $693e
3e3f 211700    ld      hl,$0017
3e42 e3        ex      (sp),hl
3e43 216d8c    ld      hl,$8c6d
3e46 e5        push    hl
3e47 cd167c    call    $7c16
3e4a d1        pop     de
3e4b d1        pop     de
3e4c 180b      jr      $3e59
3e4e 2a958c    ld      hl,($8c95)
3e51 44        ld      b,h
3e52 4d        ld      c,l
3e53 cdff86    call    $86ff
3e56 22958c    ld      ($8c95),hl
3e59 210000    ld      hl,$0000
3e5c e5        push    hl
3e5d c5        push    bc
3e5e cd9844    call    $4498
3e61 d1        pop     de
3e62 d1        pop     de
3e63 2aa98c    ld      hl,($8ca9)
3e66 2b        dec     hl
3e67 22a98c    ld      ($8ca9),hl
3e6a 60        ld      h,b
3e6b 69        ld      l,c
3e6c c9        ret     

3e6d 49        ld      c,c
3e6e 206e      jr      nz,$3ede
3e70 65        ld      h,l
3e71 65        ld      h,l
3e72 64        ld      h,h
3e73 206d      jr      nz,$3ee2
3e75 6f        ld      l,a
3e76 72        ld      (hl),d
3e77 65        ld      h,l
3e78 206d      jr      nz,$3ee7
3e7a 65        ld      h,l
3e7b 6d        ld      l,l
3e7c 6f        ld      l,a
3e7d 72        ld      (hl),d
3e7e 79        ld      a,c
3e7f 2074      jr      nz,$3ef5
3e81 6f        ld      l,a
3e82 2072      jr      nz,$3ef6
3e84 75        ld      (hl),l
3e85 6e        ld      l,(hl)
3e86 204c      jr      nz,$3ed4
3e88 4f        ld      c,a
3e89 47        ld      b,a
3e8a 4f        ld      c,a
3e8b 00        nop     
3e8c 49        ld      c,c
3e8d 2064      jr      nz,$3ef3
3e8f 6f        ld      l,a
3e90 6e        ld      l,(hl)
3e91 27        daa     
3e92 74        ld      (hl),h
3e93 2068      jr      nz,$3efd
3e95 61        ld      h,c
3e96 76        halt    
3e97 65        ld      h,l
3e98 2061      jr      nz,$3efb
3e9a 6e        ld      l,(hl)
3e9b 79        ld      a,c
3e9c 204c      jr      nz,$3eea
3e9e 4f        ld      c,a
3e9f 47        ld      b,a
3ea0 4f        ld      c,a
3ea1 206e      jr      nz,$3f11
3ea3 6f        ld      l,a
3ea4 64        ld      h,h
3ea5 65        ld      h,l
3ea6 73        ld      (hl),e
3ea7 206c      jr      nz,$3f15
3ea9 65        ld      h,l
3eaa 66        ld      h,(hl)
3eab 74        ld      (hl),h
3eac 00        nop     
3ead cda98b    call    $8ba9
3eb0 210800    ld      hl,$0008
3eb3 39        add     hl,sp
3eb4 4e        ld      c,(hl)
3eb5 23        inc     hl
3eb6 46        ld      b,(hl)
3eb7 210000    ld      hl,$0000
3eba e5        push    hl
3ebb c5        push    bc
3ebc cd7344    call    $4473
3ebf d1        pop     de
3ec0 2a958c    ld      hl,($8c95)
3ec3 e3        ex      (sp),hl
3ec4 c5        push    bc
3ec5 cd9844    call    $4498
3ec8 d1        pop     de
3ec9 d1        pop     de
3eca 22958c    ld      ($8c95),hl
3ecd 2aa98c    ld      hl,($8ca9)
3ed0 23        inc     hl
3ed1 22a98c    ld      ($8ca9),hl
3ed4 c9        ret     

3ed5 210000    ld      hl,$0000
3ed8 22958c    ld      ($8c95),hl
3edb cd3e3f    call    $3f3e
3ede cd3e43    call    $433e
3ee1 2aee8f    ld      hl,($8fee)
3ee4 e5        push    hl
3ee5 cde93f    call    $3fe9
3ee8 2ab28f    ld      hl,($8fb2)
3eeb e3        ex      (sp),hl
3eec cde93f    call    $3fe9
3eef 2ab48f    ld      hl,($8fb4)
3ef2 e3        ex      (sp),hl
3ef3 cde93f    call    $3fe9
3ef6 2ab68f    ld      hl,($8fb6)
3ef9 e3        ex      (sp),hl
3efa cde93f    call    $3fe9
3efd 2aac8f    ld      hl,($8fac)
3f00 e3        ex      (sp),hl
3f01 cde93f    call    $3fe9
3f04 2ab08f    ld      hl,($8fb0)
3f07 e3        ex      (sp),hl
3f08 cde93f    call    $3fe9
3f0b 2aea8f    ld      hl,($8fea)
3f0e e3        ex      (sp),hl
3f0f cde93f    call    $3fe9
3f12 2ae28f    ld      hl,($8fe2)
3f15 e3        ex      (sp),hl
3f16 cde93f    call    $3fe9
3f19 2adc8f    ld      hl,($8fdc)
3f1c e3        ex      (sp),hl
3f1d cd9e3f    call    $3f9e
3f20 d1        pop     de
3f21 2adc8f    ld      hl,($8fdc)
3f24 cdff86    call    $86ff
3f27 cdff86    call    $86ff
3f2a e5        push    hl
3f2b cde93f    call    $3fe9
3f2e d1        pop     de
3f2f 2af48f    ld      hl,($8ff4)
3f32 110100    ld      de,$0001
3f35 cd4885    call    $8548
3f38 2808      jr      z,$3f42
3f3a 2af48f    ld      hl,($8ff4)
3f3d e5        push    hl
3f3e cde93f    call    $3fe9
3f41 d1        pop     de
3f42 2a998c    ld      hl,($8c99)
3f45 e5        push    hl
3f46 cde740    call    $40e7
3f49 d1        pop     de
3f4a cd5f3e    call    $3e5f
3f4d 2aa98c    ld      hl,($8ca9)
3f50 119001    ld      de,$0190
3f53 eb        ex      de,hl
3f54 cd5c86    call    $865c
3f57 c8        ret     z

3f58 210000    ld      hl,$0000
3f5b 229d8c    ld      ($8c9d),hl
3f5e c9        ret     

3f5f cda98b    call    $8ba9
3f62 210000    ld      hl,$0000
3f65 22fd90    ld      ($90fd),hl
3f68 1807      jr      $3f71
3f6a 2afd90    ld      hl,($90fd)
3f6d 23        inc     hl
3f6e 22fd90    ld      ($90fd),hl
3f71 2afd90    ld      hl,($90fd)
3f74 118000    ld      de,$0080
3f77 eb        ex      de,hl
3f78 cd6c85    call    $856c
3f7b caf53e    jp      z,$3ef5
3f7e 2afd90    ld      hl,($90fd)
3f81 29        add     hl,hl
3f82 11708e    ld      de,$8e70
3f85 19        add     hl,de
3f86 5e        ld      e,(hl)
3f87 23        inc     hl
3f88 56        ld      d,(hl)
3f89 42        ld      b,d
3f8a 4b        ld      c,e
3f8b 1807      jr      $3f94
3f8d 60        ld      h,b
3f8e 69        ld      l,c
3f8f cdff86    call    $86ff
3f92 44        ld      b,h
3f93 4d        ld      c,l
3f94 78        ld      a,b
3f95 b1        or      c
3f96 280e      jr      z,$3fa6
3f98 60        ld      h,b
3f99 69        ld      l,c
3f9a cdf886    call    $86f8
3f9d e5        push    hl
3f9e cd0241    call    $4102
3fa1 d1        pop     de
3fa2 2002      jr      nz,$3fa6
3fa4 18e7      jr      $3f8d
3fa6 60        ld      h,b
3fa7 69        ld      l,c
3fa8 e5        push    hl
3fa9 2afd90    ld      hl,($90fd)
3fac 29        add     hl,hl
3fad 11708e    ld      de,$8e70
3fb0 19        add     hl,de
3fb1 d1        pop     de
3fb2 73        ld      (hl),e
3fb3 23        inc     hl
3fb4 72        ld      (hl),d
3fb5 7a        ld      a,d
3fb6 b3        or      e
3fb7 2839      jr      z,$3ff2
3fb9 60        ld      h,b
3fba 69        ld      l,c
3fbb cdff86    call    $86ff
3fbe 22ff90    ld      ($90ff),hl
3fc1 7c        ld      a,h
3fc2 b5        or      l
3fc3 2828      jr      z,$3fed
3fc5 2aff90    ld      hl,($90ff)
3fc8 cdf886    call    $86f8
3fcb e5        push    hl
3fcc cd0241    call    $4102
3fcf d1        pop     de
3fd0 280c      jr      z,$3fde
3fd2 c5        push    bc
3fd3 cde740    call    $40e7
3fd6 d1        pop     de
3fd7 2aff90    ld      hl,($90ff)
3fda 44        ld      b,h
3fdb 4d        ld      c,l
3fdc 180d      jr      $3feb
3fde 2aff90    ld      hl,($90ff)
3fe1 cdff86    call    $86ff
3fe4 e5        push    hl
3fe5 c5        push    bc
3fe6 cd9844    call    $4498
3fe9 d1        pop     de
3fea d1        pop     de
3feb 18cc      jr      $3fb9
3fed c5        push    bc
3fee cde740    call    $40e7
3ff1 d1        pop     de
3ff2 c36a3e    jp      $3e6a
3ff5 2aa78c    ld      hl,($8ca7)
3ff8 eb        ex      de,hl
3ff9 2a9b8c    ld      hl,($8c9b)
3ffc cd3086    call    $8630
3fff 22a98c    ld      ($8ca9),hl
4002 210000    ld      hl,$0000
4005 22fd90    ld      ($90fd),hl
4008 1807      jr      $4011
400a 2afd90    ld      hl,($90fd)
400d 23        inc     hl
400e 22fd90    ld      ($90fd),hl
4011 2afd90    ld      hl,($90fd)
4014 eb        ex      de,hl
4015 2a9b8c    ld      hl,($8c9b)
4018 cd6c85    call    $856c
401b c8        ret     z

401c 2afd90    ld      hl,($90fd)
401f 29        add     hl,hl
4020 29        add     hl,hl
4021 eb        ex      de,hl
4022 2a3090    ld      hl,($9030)
4025 19        add     hl,de
4026 44        ld      b,h
4027 4d        ld      c,l
4028 e5        push    hl
4029 cd0241    call    $4102
402c d1        pop     de
402d 2807      jr      z,$4036
402f c5        push    bc
4030 cd1641    call    $4116
4033 d1        pop     de
4034 1805      jr      $403b
4036 c5        push    bc
4037 cdad3d    call    $3dad
403a d1        pop     de
403b 18cd      jr      $400a
403d c9        ret     

403e cda98b    call    $8ba9
4041 210000    ld      hl,$0000
4044 220591    ld      ($9105),hl
4047 1807      jr      $4050
4049 2a0591    ld      hl,($9105)
404c 23        inc     hl
404d 220591    ld      ($9105),hl
4050 2a0591    ld      hl,($9105)
4053 118000    ld      de,$0080
4056 eb        ex      de,hl
4057 cd6c85    call    $856c
405a c8        ret     z

405b 2a0591    ld      hl,($9105)
405e 29        add     hl,hl
405f 11708e    ld      de,$8e70
4062 19        add     hl,de
4063 5e        ld      e,(hl)
4064 23        inc     hl
4065 56        ld      d,(hl)
4066 42        ld      b,d
4067 4b        ld      c,e
4068 1807      jr      $4071
406a 60        ld      h,b
406b 69        ld      l,c
406c cdff86    call    $86ff
406f 44        ld      b,h
4070 4d        ld      c,l
4071 78        ld      a,b
4072 b1        or      c
4073 2826      jr      z,$409b
4075 60        ld      h,b
4076 69        ld      l,c
4077 cdf886    call    $86f8
407a 220191    ld      ($9101),hl
407d cdff86    call    $86ff
4080 cdff86    call    $86ff
4083 220391    ld      ($9103),hl
4086 7c        ld      a,h
4087 b5        or      l
4088 280f      jr      z,$4099
408a 2a0191    ld      hl,($9101)
408d e5        push    hl
408e cd9e3f    call    $3f9e
4091 2a0391    ld      hl,($9103)
4094 e3        ex      (sp),hl
4095 cde93f    call    $3fe9
4098 d1        pop     de
4099 18cf      jr      $406a
409b 18ac      jr      $4049
409d c9        ret     

409e cda98b    call    $8ba9
40a1 210800    ld      hl,$0008
40a4 39        add     hl,sp
40a5 4e        ld      c,(hl)
40a6 23        inc     hl
40a7 46        ld      b,(hl)
40a8 c5        push    bc
40a9 cd0241    call    $4102
40ac d1        pop     de
40ad c0        ret     nz

40ae c5        push    bc
40af cde740    call    $40e7
40b2 d1        pop     de
40b3 60        ld      h,b
40b4 69        ld      l,c
40b5 cdff86    call    $86ff
40b8 44        ld      b,h
40b9 4d        ld      c,l
40ba cdf886    call    $86f8
40bd 220791    ld      ($9107),hl
40c0 c5        push    bc
40c1 cde740    call    $40e7
40c4 d1        pop     de
40c5 2a0791    ld      hl,($9107)
40c8 7c        ld      a,h
40c9 b5        or      l
40ca c8        ret     z

40cb 2a0791    ld      hl,($9107)
40ce cdf886    call    $86f8
40d1 e5        push    hl
40d2 cde740    call    $40e7
40d5 2a0791    ld      hl,($9107)
40d8 e3        ex      (sp),hl
40d9 cde740    call    $40e7
40dc d1        pop     de
40dd 2a0791    ld      hl,($9107)
40e0 cdff86    call    $86ff
40e3 220791    ld      ($9107),hl
40e6 18dd      jr      $40c5
40e8 c9        ret     

40e9 cda98b    call    $8ba9
40ec 210800    ld      hl,$0008
40ef 39        add     hl,sp
40f0 4e        ld      c,(hl)
40f1 23        inc     hl
40f2 46        ld      b,(hl)
40f3 1807      jr      $40fc
40f5 60        ld      h,b
40f6 69        ld      l,c
40f7 cdff86    call    $86ff
40fa 44        ld      b,h
40fb 4d        ld      c,l
40fc 78        ld      a,b
40fd b1        or      c
40fe c8        ret     z

40ff c5        push    bc
4100 cd0241    call    $4102
4103 d1        pop     de
4104 c0        ret     nz

4105 c5        push    bc
4106 cdb344    call    $44b3
4109 d1        pop     de
410a c0        ret     nz

410b c5        push    bc
410c cdd944    call    $44d9
410f d1        pop     de
4110 284e      jr      z,$4160
4112 c5        push    bc
4113 cd2545    call    $4525
4116 d1        pop     de
4117 2841      jr      z,$415a
4119 c5        push    bc
411a cd6845    call    $4568
411d d1        pop     de
411e 2834      jr      z,$4154
4120 60        ld      h,b
4121 69        ld      l,c
4122 cdff86    call    $86ff
4125 220991    ld      ($9109),hl
4128 e5        push    hl
4129 cde740    call    $40e7
412c d1        pop     de
412d 2a0991    ld      hl,($9109)
4130 cdf886    call    $86f8
4133 220991    ld      ($9109),hl
4136 e5        push    hl
4137 cde740    call    $40e7
413a d1        pop     de
413b 2a0991    ld      hl,($9109)
413e cdf886    call    $86f8
4141 220991    ld      ($9109),hl
4144 e5        push    hl
4145 cde740    call    $40e7
4148 d1        pop     de
4149 2a0991    ld      hl,($9109)
414c cdf886    call    $86f8
414f e5        push    hl
4150 cde740    call    $40e7
4153 d1        pop     de
4154 c5        push    bc
4155 cde740    call    $40e7
4158 d1        pop     de
4159 c9        ret     

415a c5        push    bc
415b cd9e3f    call    $3f9e
415e d1        pop     de
415f c9        ret     

4160 c5        push    bc
4161 cde740    call    $40e7
4164 d1        pop     de
4165 cd876a    call    $6a87
4168 2803      jr      z,$416d
416a cd7b40    call    $407b
416d 60        ld      h,b
416e 69        ld      l,c
416f cdf886    call    $86f8
4172 e5        push    hl
4173 cde93f    call    $3fe9
4176 d1        pop     de
4177 c3f53f    jp      $3ff5
417a c9        ret     

417b cda98b    call    $8ba9
417e cdba66    call    $66ba
4181 21ba40    ld      hl,$40ba
4184 e5        push    hl
4185 cd0967    call    $6709
4188 d1        pop     de
4189 210000    ld      hl,$0000
418c 44        ld      b,h
418d 4d        ld      c,l
418e 180f      jr      $419f
4190 60        ld      h,b
4191 69        ld      l,c
4192 03        inc     bc
4193 29        add     hl,hl
4194 29        add     hl,hl
4195 eb        ex      de,hl
4196 2a3090    ld      hl,($9030)
4199 19        add     hl,de
419a e5        push    hl
419b cd1641    call    $4116
419e d1        pop     de
419f 60        ld      h,b
41a0 69        ld      l,c
41a1 eb        ex      de,hl
41a2 2a9b8c    ld      hl,($8c9b)
41a5 cd6c85    call    $856c
41a8 2802      jr      z,$41ac
41aa 18e4      jr      $4190
41ac 210100    ld      hl,$0001
41af e5        push    hl
41b0 216d8c    ld      hl,$8c6d
41b3 e5        push    hl
41b4 cd167c    call    $7c16
41b7 d1        pop     de
41b8 d1        pop     de
41b9 c9        ret     

41ba 4f        ld      c,a
41bb 75        ld      (hl),l
41bc 74        ld      (hl),h
41bd 206f      jr      nz,$422e
41bf 66        ld      h,(hl)
41c0 204c      jr      nz,$420e
41c2 4f        ld      c,a
41c3 47        ld      b,a
41c4 4f        ld      c,a
41c5 2073      jr      nz,$423a
41c7 74        ld      (hl),h
41c8 61        ld      h,c
41c9 63        ld      h,e
41ca 6b        ld      l,e
41cb 2064      jr      nz,$4231
41cd 75        ld      (hl),l
41ce 72        ld      (hl),d
41cf 69        ld      l,c
41d0 6e        ld      l,(hl)
41d1 67        ld      h,a
41d2 2067      jr      nz,$423b
41d4 61        ld      h,c
41d5 72        ld      (hl),d
41d6 62        ld      h,d
41d7 61        ld      h,c
41d8 67        ld      h,a
41d9 65        ld      h,l
41da 2063      jr      nz,$423f
41dc 6f        ld      l,a
41dd 6c        ld      l,h
41de 6c        ld      l,h
41df 65        ld      h,l
41e0 63        ld      h,e
41e1 74        ld      (hl),h
41e2 69        ld      l,c
41e3 6f        ld      l,a
41e4 6e        ld      l,(hl)
41e5 0a        ld      a,(bc)
41e6 00        nop     
41e7 cda98b    call    $8ba9
41ea 218000    ld      hl,$0080
41ed e5        push    hl
41ee 210a00    ld      hl,$000a
41f1 39        add     hl,sp
41f2 5e        ld      e,(hl)
41f3 23        inc     hl
41f4 56        ld      d,(hl)
41f5 eb        ex      de,hl
41f6 d1        pop     de
41f7 e5        push    hl
41f8 6e        ld      l,(hl)
41f9 2600      ld      h,$00
41fb cdfe85    call    $85fe
41fe eb        ex      de,hl
41ff e1        pop     hl
4200 73        ld      (hl),e
4201 c9        ret     

4202 cda98b    call    $8ba9
4205 210800    ld      hl,$0008
4208 39        add     hl,sp
4209 5e        ld      e,(hl)
420a 23        inc     hl
420b 56        ld      d,(hl)
420c eb        ex      de,hl
420d 5e        ld      e,(hl)
420e 1600      ld      d,$00
4210 218000    ld      hl,$0080
4213 c3fc84    jp      $84fc
4216 cda98b    call    $8ba9
4219 217fff    ld      hl,$ff7f
421c e5        push    hl
421d 210a00    ld      hl,$000a
4220 39        add     hl,sp
4221 5e        ld      e,(hl)
4222 23        inc     hl
4223 56        ld      d,(hl)
4224 eb        ex      de,hl
4225 d1        pop     de
4226 e5        push    hl
4227 6e        ld      l,(hl)
4228 2600      ld      h,$00
422a cdfc84    call    $84fc
422d eb        ex      de,hl
422e e1        pop     hl
422f 73        ld      (hl),e
4230 c9        ret     

4231 2ae88f    ld      hl,($8fe8)
4234 c3f685    jp      $85f6
4237 cd8d41    call    $418d
423a eb        ex      de,hl
423b 2abe8f    ld      hl,($8fbe)
423e cd3c85    call    $853c
4241 280b      jr      z,$424e
4243 210600    ld      hl,$0006
4246 e5        push    hl
4247 cd0a42    call    $420a
424a d1        pop     de
424b 22ea8f    ld      ($8fea),hl
424e 2ae88f    ld      hl,($8fe8)
4251 e5        push    hl
4252 cdbc42    call    $42bc
4255 e3        ex      (sp),hl
4256 2ae88f    ld      hl,($8fe8)
4259 e5        push    hl
425a cd9142    call    $4291
425d d1        pop     de
425e d1        pop     de
425f 22e88f    ld      ($8fe8),hl
4262 c9        ret     

4263 cda98b    call    $8ba9
4266 210800    ld      hl,$0008
4269 39        add     hl,sp
426a 5e        ld      e,(hl)
426b 23        inc     hl
426c 56        ld      d,(hl)
426d d5        push    de
426e 2a998c    ld      hl,($8c99)
4271 e5        push    hl
4272 cd9844    call    $4498
4275 d1        pop     de
4276 2ae88f    ld      hl,($8fe8)
4279 e3        ex      (sp),hl
427a 2a998c    ld      hl,($8c99)
427d e5        push    hl
427e cd7344    call    $4473
4281 d1        pop     de
4282 d1        pop     de
4283 22e88f    ld      ($8fe8),hl
4286 cda93c    call    $3ca9
4289 22998c    ld      ($8c99),hl
428c c9        ret     

428d cda98b    call    $8ba9
4290 2ae88f    ld      hl,($8fe8)
4293 c3ff86    jp      $86ff
4296 cda98b    call    $8ba9
4299 2ae88f    ld      hl,($8fe8)
429c 44        ld      b,h
429d 4d        ld      c,l
429e cdf886    call    $86f8
42a1 22e88f    ld      ($8fe8),hl
42a4 c5        push    bc
42a5 cdad3d    call    $3dad
42a8 d1        pop     de
42a9 c9        ret     

42aa cda98b    call    $8ba9
42ad cd8d41    call    $418d
42b0 44        ld      b,h
42b1 4d        ld      c,l
42b2 2ae88f    ld      hl,($8fe8)
42b5 220b91    ld      ($910b),hl
42b8 cdf886    call    $86f8
42bb 22e88f    ld      ($8fe8),hl
42be 2a0b91    ld      hl,($910b)
42c1 e5        push    hl
42c2 cdad3d    call    $3dad
42c5 d1        pop     de
42c6 60        ld      h,b
42c7 69        ld      l,c
42c8 c9        ret     

42c9 cda98b    call    $8ba9
42cc 210800    ld      hl,$0008
42cf 39        add     hl,sp
42d0 5e        ld      e,(hl)
42d1 23        inc     hl
42d2 56        ld      d,(hl)
42d3 d5        push    de
42d4 2ae88f    ld      hl,($8fe8)
42d7 e5        push    hl
42d8 cd9844    call    $4498
42db d1        pop     de
42dc d1        pop     de
42dd c9        ret     

42de cda98b    call    $8ba9
42e1 210800    ld      hl,$0008
42e4 39        add     hl,sp
42e5 4e        ld      c,(hl)
42e6 23        inc     hl
42e7 46        ld      b,(hl)
42e8 60        ld      h,b
42e9 69        ld      l,c
42ea 0b        dec     bc
42eb 7c        ld      a,h
42ec b5        or      l
42ed c8        ret     z

42ee cd2543    call    $4325
42f1 18f5      jr      $42e8
42f3 c9        ret     

42f4 cda98b    call    $8ba9
42f7 210800    ld      hl,$0008
42fa 39        add     hl,sp
42fb 4e        ld      c,(hl)
42fc 23        inc     hl
42fd 46        ld      b,(hl)
42fe 60        ld      h,b
42ff 69        ld      l,c
4300 0b        dec     bc
4301 7c        ld      a,h
4302 b5        or      l
4303 c8        ret     z

4304 cd9641    call    $4196
4307 18f5      jr      $42fe
4309 c9        ret     

430a cda98b    call    $8ba9
430d 2ae88f    ld      hl,($8fe8)
4310 44        ld      b,h
4311 4d        ld      c,l
4312 210800    ld      hl,$0008
4315 39        add     hl,sp
4316 e5        push    hl
4317 7e        ld      a,(hl)
4318 23        inc     hl
4319 66        ld      h,(hl)
431a 6f        ld      l,a
431b 2b        dec     hl
431c eb        ex      de,hl
431d e1        pop     hl
431e 73        ld      (hl),e
431f 23        inc     hl
4320 72        ld      (hl),d
4321 eb        ex      de,hl
4322 23        inc     hl
4323 7c        ld      a,h
4324 b5        or      l
4325 2809      jr      z,$4330
4327 60        ld      h,b
4328 69        ld      l,c
4329 cdf886    call    $86f8
432c 44        ld      b,h
432d 4d        ld      c,l
432e 18e2      jr      $4312
4330 60        ld      h,b
4331 69        ld      l,c
4332 c3ff86    jp      $86ff
4335 cda98b    call    $8ba9
4338 2ae88f    ld      hl,($8fe8)
433b 44        ld      b,h
433c 4d        ld      c,l
433d 210800    ld      hl,$0008
4340 39        add     hl,sp
4341 e5        push    hl
4342 7e        ld      a,(hl)
4343 23        inc     hl
4344 66        ld      h,(hl)
4345 6f        ld      l,a
4346 2b        dec     hl
4347 eb        ex      de,hl
4348 e1        pop     hl
4349 73        ld      (hl),e
434a 23        inc     hl
434b 72        ld      (hl),d
434c eb        ex      de,hl
434d 23        inc     hl
434e 7c        ld      a,h
434f b5        or      l
4350 2809      jr      z,$435b
4352 60        ld      h,b
4353 69        ld      l,c
4354 cdf886    call    $86f8
4357 44        ld      b,h
4358 4d        ld      c,l
4359 18e2      jr      $433d
435b 210a00    ld      hl,$000a
435e 39        add     hl,sp
435f 5e        ld      e,(hl)
4360 23        inc     hl
4361 56        ld      d,(hl)
4362 d5        push    de
4363 c5        push    bc
4364 cd9844    call    $4498
4367 d1        pop     de
4368 d1        pop     de
4369 c9        ret     

436a cda98b    call    $8ba9
436d 2ae88f    ld      hl,($8fe8)
4370 cdf886    call    $86f8
4373 44        ld      b,h
4374 4d        ld      c,l
4375 cdff86    call    $86ff
4378 e5        push    hl
4379 2ae88f    ld      hl,($8fe8)
437c e5        push    hl
437d cd7344    call    $4473
4380 d1        pop     de
4381 2ae88f    ld      hl,($8fe8)
4384 e3        ex      (sp),hl
4385 c5        push    bc
4386 cd9844    call    $4498
4389 d1        pop     de
438a d1        pop     de
438b 60        ld      h,b
438c 69        ld      l,c
438d 22e88f    ld      ($8fe8),hl
4390 c9        ret     

4391 cda98b    call    $8ba9
4394 210800    ld      hl,$0008
4397 39        add     hl,sp
4398 4e        ld      c,(hl)
4399 23        inc     hl
439a 46        ld      b,(hl)
439b 210a00    ld      hl,$000a
439e 39        add     hl,sp
439f e5        push    hl
43a0 7e        ld      a,(hl)
43a1 23        inc     hl
43a2 66        ld      h,(hl)
43a3 6f        ld      l,a
43a4 2b        dec     hl
43a5 eb        ex      de,hl
43a6 e1        pop     hl
43a7 73        ld      (hl),e
43a8 23        inc     hl
43a9 72        ld      (hl),d
43aa eb        ex      de,hl
43ab 23        inc     hl
43ac 7c        ld      a,h
43ad b5        or      l
43ae 2809      jr      z,$43b9
43b0 60        ld      h,b
43b1 69        ld      l,c
43b2 cdf886    call    $86f8
43b5 44        ld      b,h
43b6 4d        ld      c,l
43b7 18e2      jr      $439b
43b9 60        ld      h,b
43ba 69        ld      l,c
43bb c9        ret     

43bc cda98b    call    $8ba9
43bf 210800    ld      hl,$0008
43c2 39        add     hl,sp
43c3 4e        ld      c,(hl)
43c4 23        inc     hl
43c5 46        ld      b,(hl)
43c6 60        ld      h,b
43c7 69        ld      l,c
43c8 cdff86    call    $86ff
43cb 44        ld      b,h
43cc 4d        ld      c,l
43cd eb        ex      de,hl
43ce 2ac08f    ld      hl,($8fc0)
43d1 cd3c85    call    $853c
43d4 2804      jr      z,$43da
43d6 210600    ld      hl,$0006
43d9 c9        ret     

43da 60        ld      h,b
43db 69        ld      l,c
43dc eb        ex      de,hl
43dd 2abe8f    ld      hl,($8fbe)
43e0 cd3c85    call    $853c
43e3 2804      jr      z,$43e9
43e5 210700    ld      hl,$0007
43e8 c9        ret     

43e9 60        ld      h,b
43ea 69        ld      l,c
43eb eb        ex      de,hl
43ec 2ac28f    ld      hl,($8fc2)
43ef cd3c85    call    $853c
43f2 2804      jr      z,$43f8
43f4 210400    ld      hl,$0004
43f7 c9        ret     

43f8 210100    ld      hl,$0001
43fb c9        ret     

43fc cda98b    call    $8ba9
43ff 210800    ld      hl,$0008
4402 39        add     hl,sp
4403 4e        ld      c,(hl)
4404 23        inc     hl
4405 46        ld      b,(hl)
4406 78        ld      a,b
4407 b1        or      c
4408 280c      jr      z,$4416
440a c5        push    bc
440b 2ae88f    ld      hl,($8fe8)
440e e5        push    hl
440f cd9142    call    $4291
4412 d1        pop     de
4413 d1        pop     de
4414 1803      jr      $4419
4416 2ae88f    ld      hl,($8fe8)
4419 c3ff86    jp      $86ff
441c cd8d41    call    $418d
441f e5        push    hl
4420 cd6341    call    $4163
4423 d1        pop     de
4424 c9        ret     

4425 210000    ld      hl,$0000
4428 e5        push    hl
4429 cd6341    call    $4163
442c d1        pop     de
442d c9        ret     

442e 2af48f    ld      hl,($8ff4)
4431 e5        push    hl
4432 cd6341    call    $4163
4435 d1        pop     de
4436 c9        ret     

4437 cdaa41    call    $41aa
443a 22f48f    ld      ($8ff4),hl
443d c9        ret     

443e cda98b    call    $8ba9
4441 2ae88f    ld      hl,($8fe8)
4444 220f91    ld      ($910f),hl
4447 2a0f91    ld      hl,($910f)
444a 7c        ld      a,h
444b b5        or      l
444c c8        ret     z

444d 2a0f91    ld      hl,($910f)
4450 cdff86    call    $86ff
4453 e5        push    hl
4454 cde93f    call    $3fe9
4457 2a0f91    ld      hl,($910f)
445a e3        ex      (sp),hl
445b cdbc42    call    $42bc
445e d1        pop     de
445f 44        ld      b,h
4460 4d        ld      c,l
4461 60        ld      h,b
4462 69        ld      l,c
4463 0b        dec     bc
4464 7c        ld      a,h
4465 b5        or      l
4466 2819      jr      z,$4481
4468 2a0f91    ld      hl,($910f)
446b cdf886    call    $86f8
446e 220d91    ld      ($910d),hl
4471 2a0f91    ld      hl,($910f)
4474 e5        push    hl
4475 cde740    call    $40e7
4478 d1        pop     de
4479 2a0d91    ld      hl,($910d)
447c 220f91    ld      ($910f),hl
447f 18e0      jr      $4461
4481 18c4      jr      $4447
4483 c9        ret     

4484 cda98b    call    $8ba9
4487 210000    ld      hl,$0000
448a 44        ld      b,h
448b 4d        ld      c,l
448c 1803      jr      $4491
448e 03        inc     bc
448f 60        ld      h,b
4490 69        ld      l,c
4491 50        ld      d,b
4492 59        ld      e,c
4493 210200    ld      hl,$0002
4496 cd6c85    call    $856c
4499 c8        ret     z

449a 21698c    ld      hl,$8c69
449d 09        add     hl,bc
449e 09        add     hl,bc
449f 5e        ld      e,(hl)
44a0 23        inc     hl
44a1 56        ld      d,(hl)
44a2 d5        push    de
44a3 60        ld      h,b
44a4 69        ld      l,c
44a5 23        inc     hl
44a6 e5        push    hl
44a7 cd3542    call    $4235
44aa d1        pop     de
44ab d1        pop     de
44ac 18e0      jr      $448e
44ae c9        ret     

44af cda98b    call    $8ba9
44b2 210000    ld      hl,$0000
44b5 44        ld      b,h
44b6 4d        ld      c,l
44b7 1803      jr      $44bc
44b9 03        inc     bc
44ba 60        ld      h,b
44bb 69        ld      l,c
44bc 50        ld      d,b
44bd 59        ld      e,c
44be 210200    ld      hl,$0002
44c1 cd6c85    call    $856c
44c4 c8        ret     z

44c5 60        ld      h,b
44c6 69        ld      l,c
44c7 23        inc     hl
44c8 e5        push    hl
44c9 cdfc42    call    $42fc
44cc d1        pop     de
44cd e5        push    hl
44ce 21698c    ld      hl,$8c69
44d1 09        add     hl,bc
44d2 09        add     hl,bc
44d3 d1        pop     de
44d4 73        ld      (hl),e
44d5 23        inc     hl
44d6 72        ld      (hl),d
44d7 18e0      jr      $44b9
44d9 c9        ret     

44da cde043    call    $43e0
44dd c3e943    jp      $43e9
44e0 2ae88f    ld      hl,($8fe8)
44e3 22f28f    ld      ($8ff2),hl
44e6 c3e943    jp      $43e9
44e9 cda98b    call    $8ba9
44ec 2af28f    ld      hl,($8ff2)
44ef 7c        ld      a,h
44f0 b5        or      l
44f1 2837      jr      z,$452a
44f3 2af28f    ld      hl,($8ff2)
44f6 cdff86    call    $86ff
44f9 eb        ex      de,hl
44fa 2ac28f    ld      hl,($8fc2)
44fd cd3c85    call    $853c
4500 2804      jr      z,$4506
4502 210000    ld      hl,$0000
4505 c9        ret     

4506 2af28f    ld      hl,($8ff2)
4509 cdff86    call    $86ff
450c eb        ex      de,hl
450d 2abe8f    ld      hl,($8fbe)
4510 cd3c85    call    $853c
4513 2810      jr      z,$4525
4515 210500    ld      hl,$0005
4518 e5        push    hl
4519 2af28f    ld      hl,($8ff2)
451c e5        push    hl
451d cd9142    call    $4291
4520 d1        pop     de
4521 d1        pop     de
4522 c3ff86    jp      $86ff
4525 cd5744    call    $4457
4528 18c2      jr      $44ec
452a 210000    ld      hl,$0000
452d c9        ret     

452e cda98b    call    $8ba9
4531 2af28f    ld      hl,($8ff2)
4534 7c        ld      a,h
4535 b5        or      l
4536 281b      jr      z,$4553
4538 2af28f    ld      hl,($8ff2)
453b cdff86    call    $86ff
453e eb        ex      de,hl
453f 2ac28f    ld      hl,($8fc2)
4542 cd3c85    call    $853c
4545 2807      jr      z,$454e
4547 cd5744    call    $4457
454a 210100    ld      hl,$0001
454d c9        ret     

454e cd5744    call    $4457
4551 18de      jr      $4531
4553 210000    ld      hl,$0000
4556 c9        ret     

4557 2af28f    ld      hl,($8ff2)
455a e5        push    hl
455b cdbc42    call    $42bc
455e e3        ex      (sp),hl
455f 2af28f    ld      hl,($8ff2)
4562 e5        push    hl
4563 cd9142    call    $4291
4566 d1        pop     de
4567 d1        pop     de
4568 22f28f    ld      ($8ff2),hl
456b c9        ret     

456c d1        pop     de
456d e3        ex      (sp),hl
456e d5        push    de
456f 7c        ld      a,h
4570 65        ld      h,l
4571 6f        ld      l,a
4572 c9        ret     

4573 cda98b    call    $8ba9
4576 210800    ld      hl,$0008
4579 39        add     hl,sp
457a 4e        ld      c,(hl)
457b 23        inc     hl
457c 46        ld      b,(hl)
457d 210a00    ld      hl,$000a
4580 39        add     hl,sp
4581 5e        ld      e,(hl)
4582 23        inc     hl
4583 56        ld      d,(hl)
4584 210100    ld      hl,$0001
4587 cd6f86    call    $866f
458a e5        push    hl
458b cd6c44    call    $446c
458e d1        pop     de
458f eb        ex      de,hl
4590 60        ld      h,b
4591 69        ld      l,c
4592 73        ld      (hl),e
4593 23        inc     hl
4594 72        ld      (hl),d
4595 60        ld      h,b
4596 69        ld      l,c
4597 c9        ret     

4598 cda98b    call    $8ba9
459b 210800    ld      hl,$0008
459e 39        add     hl,sp
459f 4e        ld      c,(hl)
45a0 23        inc     hl
45a1 46        ld      b,(hl)
45a2 210a00    ld      hl,$000a
45a5 39        add     hl,sp
45a6 5e        ld      e,(hl)
45a7 23        inc     hl
45a8 56        ld      d,(hl)
45a9 210200    ld      hl,$0002
45ac 09        add     hl,bc
45ad 73        ld      (hl),e
45ae 23        inc     hl
45af 72        ld      (hl),d
45b0 60        ld      h,b
45b1 69        ld      l,c
45b2 c9        ret     

45b3 cda98b    call    $8ba9
45b6 210800    ld      hl,$0008
45b9 39        add     hl,sp
45ba 4e        ld      c,(hl)
45bb 23        inc     hl
45bc 46        ld      b,(hl)
45bd 50        ld      d,b
45be 59        ld      e,c
45bf 211200    ld      hl,$0012
45c2 cd5c86    call    $865c
45c5 280a      jr      z,$45d1
45c7 50        ld      d,b
45c8 59        ld      e,c
45c9 211800    ld      hl,$0018
45cc cd5d86    call    $865d
45cf 2004      jr      nz,$45d5
45d1 210000    ld      hl,$0000
45d4 c9        ret     

45d5 210100    ld      hl,$0001
45d8 c9        ret     

45d9 cda98b    call    $8ba9
45dc 210800    ld      hl,$0008
45df 39        add     hl,sp
45e0 4e        ld      c,(hl)
45e1 23        inc     hl
45e2 46        ld      b,(hl)
45e3 78        ld      a,b
45e4 b1        or      c
45e5 2004      jr      nz,$45eb
45e7 210100    ld      hl,$0001
45ea c9        ret     

45eb 60        ld      h,b
45ec 69        ld      l,c
45ed cdf886    call    $86f8
45f0 44        ld      b,h
45f1 4d        ld      c,l
45f2 110000    ld      de,$0000
45f5 eb        ex      de,hl
45f6 cd6786    call    $8667
45f9 280a      jr      z,$4605
45fb 50        ld      d,b
45fc 59        ld      e,c
45fd 211800    ld      hl,$0018
4600 cd5d86    call    $865d
4603 2004      jr      nz,$4609
4605 210000    ld      hl,$0000
4608 c9        ret     

4609 210100    ld      hl,$0001
460c c9        ret     

460d cda98b    call    $8ba9
4610 210800    ld      hl,$0008
4613 39        add     hl,sp
4614 4e        ld      c,(hl)
4615 23        inc     hl
4616 46        ld      b,(hl)
4617 78        ld      a,b
4618 b1        or      c
4619 2004      jr      nz,$461f
461b 210000    ld      hl,$0000
461e c9        ret     

461f c5        push    bc
4620 cdd944    call    $44d9
4623 d1        pop     de
4624 c9        ret     

4625 cda98b    call    $8ba9
4628 210800    ld      hl,$0008
462b 39        add     hl,sp
462c 4e        ld      c,(hl)
462d 23        inc     hl
462e 46        ld      b,(hl)
462f 60        ld      h,b
4630 69        ld      l,c
4631 cdf886    call    $86f8
4634 111000    ld      de,$0010
4637 eb        ex      de,hl
4638 cd5d86    call    $865d
463b 280e      jr      z,$464b
463d 60        ld      h,b
463e 69        ld      l,c
463f cdf886    call    $86f8
4642 110a00    ld      de,$000a
4645 eb        ex      de,hl
4646 cd5c86    call    $865c
4649 2004      jr      nz,$464f
464b 210000    ld      hl,$0000
464e c9        ret     

464f 210100    ld      hl,$0001
4652 c9        ret     

4653 cda98b    call    $8ba9
4656 210800    ld      hl,$0008
4659 39        add     hl,sp
465a 4e        ld      c,(hl)
465b 23        inc     hl
465c 46        ld      b,(hl)
465d 60        ld      h,b
465e 69        ld      l,c
465f cdf886    call    $86f8
4662 110a00    ld      de,$000a
4665 c33c85    jp      $853c
4668 cda98b    call    $8ba9
466b 210800    ld      hl,$0008
466e 39        add     hl,sp
466f 4e        ld      c,(hl)
4670 23        inc     hl
4671 46        ld      b,(hl)
4672 60        ld      h,b
4673 69        ld      l,c
4674 cdf886    call    $86f8
4677 111000    ld      de,$0010
467a c33c85    jp      $853c
467d cda98b    call    $8ba9
4680 210a00    ld      hl,$000a
4683 39        add     hl,sp
4684 5e        ld      e,(hl)
4685 23        inc     hl
4686 56        ld      d,(hl)
4687 d5        push    de
4688 210a00    ld      hl,$000a
468b 39        add     hl,sp
468c 5e        ld      e,(hl)
468d 23        inc     hl
468e 56        ld      d,(hl)
468f d5        push    de
4690 cda93c    call    $3ca9
4693 e5        push    hl
4694 cd7344    call    $4473
4697 d1        pop     de
4698 e3        ex      (sp),hl
4699 cd9844    call    $4498
469c d1        pop     de
469d d1        pop     de
469e c9        ret     

469f cda98b    call    $8ba9
46a2 210800    ld      hl,$0008
46a5 39        add     hl,sp
46a6 4e        ld      c,(hl)
46a7 23        inc     hl
46a8 46        ld      b,(hl)
46a9 c5        push    bc
46aa cd5345    call    $4553
46ad d1        pop     de
46ae 280b      jr      z,$46bb
46b0 210200    ld      hl,$0002
46b3 09        add     hl,bc
46b4 5e        ld      e,(hl)
46b5 23        inc     hl
46b6 56        ld      d,(hl)
46b7 eb        ex      de,hl
46b8 c32880    jp      $8028
46bb 60        ld      h,b
46bc 69        ld      l,c
46bd cdff86    call    $86ff
46c0 44        ld      b,h
46c1 4d        ld      c,l
46c2 23        inc     hl
46c3 23        inc     hl
46c4 5e        ld      e,(hl)
46c5 23        inc     hl
46c6 56        ld      d,(hl)
46c7 eb        ex      de,hl
46c8 227d8c    ld      ($8c7d),hl
46cb 60        ld      h,b
46cc 69        ld      l,c
46cd cdf886    call    $86f8
46d0 44        ld      b,h
46d1 4d        ld      c,l
46d2 23        inc     hl
46d3 23        inc     hl
46d4 5e        ld      e,(hl)
46d5 23        inc     hl
46d6 56        ld      d,(hl)
46d7 eb        ex      de,hl
46d8 227f8c    ld      ($8c7f),hl
46db 60        ld      h,b
46dc 69        ld      l,c
46dd cdf886    call    $86f8
46e0 44        ld      b,h
46e1 4d        ld      c,l
46e2 23        inc     hl
46e3 23        inc     hl
46e4 5e        ld      e,(hl)
46e5 23        inc     hl
46e6 56        ld      d,(hl)
46e7 eb        ex      de,hl
46e8 22818c    ld      ($8c81),hl
46eb 60        ld      h,b
46ec 69        ld      l,c
46ed cdf886    call    $86f8
46f0 23        inc     hl
46f1 23        inc     hl
46f2 5e        ld      e,(hl)
46f3 23        inc     hl
46f4 56        ld      d,(hl)
46f5 eb        ex      de,hl
46f6 22838c    ld      ($8c83),hl
46f9 217d8c    ld      hl,$8c7d
46fc c3667c    jp      $7c66
46ff cda98b    call    $8ba9
4702 210800    ld      hl,$0008
4705 39        add     hl,sp
4706 4e        ld      c,(hl)
4707 23        inc     hl
4708 46        ld      b,(hl)
4709 c5        push    bc
470a cdd944    call    $44d9
470d d1        pop     de
470e c0        ret     nz

470f cd6237    call    $3762
4712 60        ld      h,b
4713 69        ld      l,c
4714 cdf886    call    $86f8
4717 e5        push    hl
4718 cd3936    call    $3639
471b d1        pop     de
471c 60        ld      h,b
471d 69        ld      l,c
471e cdff86    call    $86ff
4721 44        ld      b,h
4722 4d        ld      c,l
4723 7c        ld      a,h
4724 b5        or      l
4725 c8        ret     z

4726 cdd76b    call    $6bd7
4729 18e7      jr      $4712
472b c9        ret     

472c cda98b    call    $8ba9
472f 210000    ld      hl,$0000
4732 e5        push    hl
4733 210a00    ld      hl,$000a
4736 39        add     hl,sp
4737 5e        ld      e,(hl)
4738 23        inc     hl
4739 56        ld      d,(hl)
473a d5        push    de
473b cd7d45    call    $457d
473e d1        pop     de
473f d1        pop     de
4740 c9        ret     

4741 cda98b    call    $8ba9
4744 210800    ld      hl,$0008
4747 39        add     hl,sp
4748 5e        ld      e,(hl)
4749 23        inc     hl
474a 56        ld      d,(hl)
474b d5        push    de
474c cdd046    call    $46d0
474f d1        pop     de
4750 cdf685    call    $85f6
4753 c3f685    jp      $85f6
4756 cda98b    call    $8ba9
4759 210800    ld      hl,$0008
475c 39        add     hl,sp
475d 4e        ld      c,(hl)
475e 23        inc     hl
475f 46        ld      b,(hl)
4760 78        ld      a,b
4761 b1        or      c
4762 2004      jr      nz,$4768
4764 210000    ld      hl,$0000
4767 c9        ret     

4768 60        ld      h,b
4769 69        ld      l,c
476a cdf886    call    $86f8
476d 110800    ld      de,$0008
4770 c33c85    jp      $853c
4773 cda98b    call    $8ba9
4776 210a00    ld      hl,$000a
4779 39        add     hl,sp
477a 4e        ld      c,(hl)
477b 23        inc     hl
477c 46        ld      b,(hl)
477d c5        push    bc
477e cdd944    call    $44d9
4781 d1        pop     de
4782 2804      jr      z,$4788
4784 210000    ld      hl,$0000
4787 c9        ret     

4788 210800    ld      hl,$0008
478b 39        add     hl,sp
478c e5        push    hl
478d 7e        ld      a,(hl)
478e 23        inc     hl
478f 66        ld      h,(hl)
4790 6f        ld      l,a
4791 2b        dec     hl
4792 eb        ex      de,hl
4793 e1        pop     hl
4794 73        ld      (hl),e
4795 23        inc     hl
4796 72        ld      (hl),d
4797 eb        ex      de,hl
4798 23        inc     hl
4799 110100    ld      de,$0001
479c eb        ex      de,hl
479d cd6d85    call    $856d
47a0 2811      jr      z,$47b3
47a2 78        ld      a,b
47a3 b1        or      c
47a4 2004      jr      nz,$47aa
47a6 210000    ld      hl,$0000
47a9 c9        ret     

47aa 60        ld      h,b
47ab 69        ld      l,c
47ac cdff86    call    $86ff
47af 44        ld      b,h
47b0 4d        ld      c,l
47b1 18d5      jr      $4788
47b3 60        ld      h,b
47b4 69        ld      l,c
47b5 c3f886    jp      $86f8
47b8 cda98b    call    $8ba9
47bb 210800    ld      hl,$0008
47be 39        add     hl,sp
47bf 4e        ld      c,(hl)
47c0 23        inc     hl
47c1 46        ld      b,(hl)
47c2 78        ld      a,b
47c3 b1        or      c
47c4 2004      jr      nz,$47ca
47c6 210000    ld      hl,$0000
47c9 c9        ret     

47ca 60        ld      h,b
47cb 69        ld      l,c
47cc cdf886    call    $86f8
47cf c9        ret     

47d0 cda98b    call    $8ba9
47d3 210800    ld      hl,$0008
47d6 39        add     hl,sp
47d7 4e        ld      c,(hl)
47d8 23        inc     hl
47d9 46        ld      b,(hl)
47da c5        push    bc
47db cd5648    call    $4856
47de d1        pop     de
47df 44        ld      b,h
47e0 4d        ld      c,l
47e1 7c        ld      a,h
47e2 b5        or      l
47e3 2818      jr      z,$47fd
47e5 60        ld      h,b
47e6 69        ld      l,c
47e7 cdf886    call    $86f8
47ea eb        ex      de,hl
47eb 2ace8f    ld      hl,($8fce)
47ee cd3c85    call    $853c
47f1 2808      jr      z,$47fb
47f3 60        ld      h,b
47f4 69        ld      l,c
47f5 cdff86    call    $86ff
47f8 c3f886    jp      $86f8
47fb 18dd      jr      $47da
47fd 210000    ld      hl,$0000
4800 c9        ret     

4801 cda98b    call    $8ba9
4804 210800    ld      hl,$0008
4807 39        add     hl,sp
4808 4e        ld      c,(hl)
4809 23        inc     hl
480a 46        ld      b,(hl)
480b c5        push    bc
480c cd5648    call    $4856
480f d1        pop     de
4810 44        ld      b,h
4811 4d        ld      c,l
4812 7c        ld      a,h
4813 b5        or      l
4814 281a      jr      z,$4830
4816 60        ld      h,b
4817 69        ld      l,c
4818 cdf886    call    $86f8
481b eb        ex      de,hl
481c 210a00    ld      hl,$000a
481f 39        add     hl,sp
4820 7e        ld      a,(hl)
4821 23        inc     hl
4822 66        ld      h,(hl)
4823 6f        ld      l,a
4824 cd3c85    call    $853c
4827 2805      jr      z,$482e
4829 60        ld      h,b
482a 69        ld      l,c
482b c3ff86    jp      $86ff
482e 18db      jr      $480b
4830 210000    ld      hl,$0000
4833 c9        ret     

4834 cda98b    call    $8ba9
4837 210800    ld      hl,$0008
483a 39        add     hl,sp
483b 4e        ld      c,(hl)
483c 23        inc     hl
483d 46        ld      b,(hl)
483e c5        push    bc
483f cd5646    call    $4656
4842 d1        pop     de
4843 2004      jr      nz,$4849
4845 210000    ld      hl,$0000
4848 c9        ret     

4849 210a00    ld      hl,$000a
484c 39        add     hl,sp
484d 5e        ld      e,(hl)
484e 23        inc     hl
484f 56        ld      d,(hl)
4850 d5        push    de
4851 c5        push    bc
4852 cd0147    call    $4701
4855 d1        pop     de
4856 e3        ex      (sp),hl
4857 cdb846    call    $46b8
485a d1        pop     de
485b c9        ret     

485c cda98b    call    $8ba9
485f 210800    ld      hl,$0008
4862 39        add     hl,sp
4863 4e        ld      c,(hl)
4864 23        inc     hl
4865 46        ld      b,(hl)
4866 c5        push    bc
4867 cd5646    call    $4656
486a d1        pop     de
486b 2004      jr      nz,$4871
486d 210000    ld      hl,$0000
4870 c9        ret     

4871 210a00    ld      hl,$000a
4874 39        add     hl,sp
4875 5e        ld      e,(hl)
4876 23        inc     hl
4877 56        ld      d,(hl)
4878 eb        ex      de,hl
4879 221191    ld      ($9111),hl
487c eb        ex      de,hl
487d 2abc8f    ld      hl,($8fbc)
4880 cd3c85    call    $853c
4883 2811      jr      z,$4896
4885 c5        push    bc
4886 cdce48    call    $48ce
4889 d1        pop     de
488a 200a      jr      nz,$4896
488c 210000    ld      hl,$0000
488f e5        push    hl
4890 c5        push    bc
4891 cd6848    call    $4868
4894 d1        pop     de
4895 d1        pop     de
4896 2a1191    ld      hl,($9111)
4899 e5        push    hl
489a c5        push    bc
489b cd0147    call    $4701
489e d1        pop     de
489f d1        pop     de
48a0 221391    ld      ($9113),hl
48a3 7c        ld      a,h
48a4 b5        or      l
48a5 2038      jr      nz,$48df
48a7 60        ld      h,b
48a8 69        ld      l,c
48a9 cdff86    call    $86ff
48ac 221591    ld      ($9115),hl
48af cdff86    call    $86ff
48b2 e5        push    hl
48b3 210e00    ld      hl,$000e
48b6 39        add     hl,sp
48b7 5e        ld      e,(hl)
48b8 23        inc     hl
48b9 56        ld      d,(hl)
48ba d5        push    de
48bb cd7d45    call    $457d
48be d1        pop     de
48bf e3        ex      (sp),hl
48c0 cd6341    call    $4163
48c3 d1        pop     de
48c4 cd8d41    call    $418d
48c7 e5        push    hl
48c8 2a1191    ld      hl,($9111)
48cb e5        push    hl
48cc cd7d45    call    $457d
48cf d1        pop     de
48d0 e3        ex      (sp),hl
48d1 2a1591    ld      hl,($9115)
48d4 e5        push    hl
48d5 cd9844    call    $4498
48d8 d1        pop     de
48d9 d1        pop     de
48da cd9641    call    $4196
48dd 1811      jr      $48f0
48df 210c00    ld      hl,$000c
48e2 39        add     hl,sp
48e3 5e        ld      e,(hl)
48e4 23        inc     hl
48e5 56        ld      d,(hl)
48e6 d5        push    de
48e7 2a1391    ld      hl,($9113)
48ea e5        push    hl
48eb cd7344    call    $4473
48ee d1        pop     de
48ef d1        pop     de
48f0 60        ld      h,b
48f1 69        ld      l,c
48f2 c9        ret     

48f3 cda98b    call    $8ba9
48f6 210800    ld      hl,$0008
48f9 39        add     hl,sp
48fa 4e        ld      c,(hl)
48fb 23        inc     hl
48fc 46        ld      b,(hl)
48fd 210a00    ld      hl,$000a
4900 39        add     hl,sp
4901 5e        ld      e,(hl)
4902 23        inc     hl
4903 56        ld      d,(hl)
4904 2abc8f    ld      hl,($8fbc)
4907 cd3c85    call    $853c
490a 2805      jr      z,$4911
490c c5        push    bc
490d cd2e49    call    $492e
4910 d1        pop     de
4911 60        ld      h,b
4912 69        ld      l,c
4913 cdff86    call    $86ff
4916 221791    ld      ($9117),hl
4919 2a1791    ld      hl,($9117)
491c cdff86    call    $86ff
491f 44        ld      b,h
4920 4d        ld      c,l
4921 7c        ld      a,h
4922 b5        or      l
4923 c8        ret     z

4924 60        ld      h,b
4925 69        ld      l,c
4926 cdf886    call    $86f8
4929 eb        ex      de,hl
492a 210a00    ld      hl,$000a
492d 39        add     hl,sp
492e 7e        ld      a,(hl)
492f 23        inc     hl
4930 66        ld      h,(hl)
4931 6f        ld      l,a
4932 cd3c85    call    $853c
4935 2813      jr      z,$494a
4937 60        ld      h,b
4938 69        ld      l,c
4939 cdff86    call    $86ff
493c cdff86    call    $86ff
493f e5        push    hl
4940 2a1791    ld      hl,($9117)
4943 e5        push    hl
4944 cd9844    call    $4498
4947 d1        pop     de
4948 d1        pop     de
4949 c9        ret     

494a 2a1791    ld      hl,($9117)
494d cdff86    call    $86ff
4950 221791    ld      ($9117),hl
4953 18c4      jr      $4919
4955 c9        ret     

4956 cda98b    call    $8ba9
4959 210800    ld      hl,$0008
495c 39        add     hl,sp
495d 4e        ld      c,(hl)
495e 23        inc     hl
495f 46        ld      b,(hl)
4960 60        ld      h,b
4961 69        ld      l,c
4962 cdff86    call    $86ff
4965 c3ff86    jp      $86ff
4968 cda98b    call    $8ba9
496b 210800    ld      hl,$0008
496e 39        add     hl,sp
496f 5e        ld      e,(hl)
4970 23        inc     hl
4971 56        ld      d,(hl)
4972 d5        push    de
4973 cd2c46    call    $462c
4976 e3        ex      (sp),hl
4977 cd6341    call    $4163
497a d1        pop     de
497b 2ab48f    ld      hl,($8fb4)
497e 7c        ld      a,h
497f b5        or      l
4980 2007      jr      nz,$4989
4982 cdaa41    call    $41aa
4985 22b48f    ld      ($8fb4),hl
4988 c9        ret     

4989 2ab48f    ld      hl,($8fb4)
498c 44        ld      b,h
498d 4d        ld      c,l
498e 1805      jr      $4995
4990 2a1991    ld      hl,($9119)
4993 44        ld      b,h
4994 4d        ld      c,l
4995 60        ld      h,b
4996 69        ld      l,c
4997 cdff86    call    $86ff
499a 221991    ld      ($9119),hl
499d 7c        ld      a,h
499e b5        or      l
499f 2815      jr      z,$49b6
49a1 60        ld      h,b
49a2 69        ld      l,c
49a3 cdf886    call    $86f8
49a6 eb        ex      de,hl
49a7 210a00    ld      hl,$000a
49aa 39        add     hl,sp
49ab 7e        ld      a,(hl)
49ac 23        inc     hl
49ad 66        ld      h,(hl)
49ae 6f        ld      l,a
49af cd3c85    call    $853c
49b2 2002      jr      nz,$49b6
49b4 18da      jr      $4990
49b6 2a1991    ld      hl,($9119)
49b9 e5        push    hl
49ba cd8d41    call    $418d
49bd e5        push    hl
49be cd9844    call    $4498
49c1 d1        pop     de
49c2 d1        pop     de
49c3 cdaa41    call    $41aa
49c6 e5        push    hl
49c7 c5        push    bc
49c8 cd9844    call    $4498
49cb d1        pop     de
49cc d1        pop     de
49cd c9        ret     

49ce cda98b    call    $8ba9
49d1 210800    ld      hl,$0008
49d4 39        add     hl,sp
49d5 5e        ld      e,(hl)
49d6 23        inc     hl
49d7 56        ld      d,(hl)
49d8 d5        push    de
49d9 2ab48f    ld      hl,($8fb4)
49dc e5        push    hl
49dd cdf848    call    $48f8
49e0 d1        pop     de
49e1 d1        pop     de
49e2 c9        ret     

49e3 cda98b    call    $8ba9
49e6 210800    ld      hl,$0008
49e9 39        add     hl,sp
49ea 5e        ld      e,(hl)
49eb 23        inc     hl
49ec 56        ld      d,(hl)
49ed d5        push    de
49ee 2ab28f    ld      hl,($8fb2)
49f1 e5        push    hl
49f2 cdf848    call    $48f8
49f5 d1        pop     de
49f6 d1        pop     de
49f7 c9        ret     

49f8 cda98b    call    $8ba9
49fb 210800    ld      hl,$0008
49fe 39        add     hl,sp
49ff 5e        ld      e,(hl)
4a00 23        inc     hl
4a01 56        ld      d,(hl)
4a02 42        ld      b,d
4a03 4b        ld      c,e
4a04 1807      jr      $4a0d
4a06 60        ld      h,b
4a07 69        ld      l,c
4a08 cdff86    call    $86ff
4a0b 44        ld      b,h
4a0c 4d        ld      c,l
4a0d 78        ld      a,b
4a0e b1        or      c
4a0f 2819      jr      z,$4a2a
4a11 60        ld      h,b
4a12 69        ld      l,c
4a13 cdf886    call    $86f8
4a16 eb        ex      de,hl
4a17 210a00    ld      hl,$000a
4a1a 39        add     hl,sp
4a1b 7e        ld      a,(hl)
4a1c 23        inc     hl
4a1d 66        ld      h,(hl)
4a1e 6f        ld      l,a
4a1f cd3c85    call    $853c
4a22 2804      jr      z,$4a28
4a24 210100    ld      hl,$0001
4a27 c9        ret     

4a28 18dc      jr      $4a06
4a2a 210000    ld      hl,$0000
4a2d c9        ret     

4a2e cda98b    call    $8ba9
4a31 210800    ld      hl,$0008
4a34 39        add     hl,sp
4a35 5e        ld      e,(hl)
4a36 23        inc     hl
4a37 56        ld      d,(hl)
4a38 d5        push    de
4a39 2ab48f    ld      hl,($8fb4)
4a3c e5        push    hl
4a3d cd4649    call    $4946
4a40 d1        pop     de
4a41 d1        pop     de
4a42 22b48f    ld      ($8fb4),hl
4a45 c9        ret     

4a46 cda98b    call    $8ba9
4a49 210800    ld      hl,$0008
4a4c 39        add     hl,sp
4a4d 4e        ld      c,(hl)
4a4e 23        inc     hl
4a4f 46        ld      b,(hl)
4a50 78        ld      a,b
4a51 b1        or      c
4a52 2004      jr      nz,$4a58
4a54 210000    ld      hl,$0000
4a57 c9        ret     

4a58 60        ld      h,b
4a59 69        ld      l,c
4a5a cdf886    call    $86f8
4a5d eb        ex      de,hl
4a5e 210a00    ld      hl,$000a
4a61 39        add     hl,sp
4a62 7e        ld      a,(hl)
4a63 23        inc     hl
4a64 66        ld      h,(hl)
4a65 6f        ld      l,a
4a66 cd3c85    call    $853c
4a69 2805      jr      z,$4a70
4a6b 60        ld      h,b
4a6c 69        ld      l,c
4a6d c3ff86    jp      $86ff
4a70 60        ld      h,b
4a71 69        ld      l,c
4a72 221b91    ld      ($911b),hl
4a75 1806      jr      $4a7d
4a77 2a1d91    ld      hl,($911d)
4a7a 221b91    ld      ($911b),hl
4a7d 2a1b91    ld      hl,($911b)
4a80 7c        ld      a,h
4a81 b5        or      l
4a82 282e      jr      z,$4ab2
4a84 2a1b91    ld      hl,($911b)
4a87 cdff86    call    $86ff
4a8a 221d91    ld      ($911d),hl
4a8d cdf886    call    $86f8
4a90 eb        ex      de,hl
4a91 210a00    ld      hl,$000a
4a94 39        add     hl,sp
4a95 7e        ld      a,(hl)
4a96 23        inc     hl
4a97 66        ld      h,(hl)
4a98 6f        ld      l,a
4a99 cd3c85    call    $853c
4a9c 2812      jr      z,$4ab0
4a9e 2a1d91    ld      hl,($911d)
4aa1 cdff86    call    $86ff
4aa4 e5        push    hl
4aa5 2a1b91    ld      hl,($911b)
4aa8 e5        push    hl
4aa9 cd9844    call    $4498
4aac d1        pop     de
4aad d1        pop     de
4aae 1802      jr      $4ab2
4ab0 18c5      jr      $4a77
4ab2 60        ld      h,b
4ab3 69        ld      l,c
4ab4 c9        ret     

4ab5 2aec8f    ld      hl,($8fec)
4ab8 e5        push    hl
4ab9 cd6341    call    $4163
4abc 2aee8f    ld      hl,($8fee)
4abf e3        ex      (sp),hl
4ac0 cd6341    call    $4163
4ac3 d1        pop     de
4ac4 c9        ret     

4ac5 cdaa41    call    $41aa
4ac8 22ee8f    ld      ($8fee),hl
4acb cdaa41    call    $41aa
4ace 22ec8f    ld      ($8fec),hl
4ad1 c9        ret     

4ad2 cda98b    call    $8ba9
4ad5 2aaa8f    ld      hl,($8faa)
4ad8 eb        ex      de,hl
4ad9 2ae48f    ld      hl,($8fe4)
4adc cd3c85    call    $853c
4adf 2804      jr      z,$4ae5
4ae1 21ff7f    ld      hl,$7fff
4ae4 c9        ret     

4ae5 210800    ld      hl,$0008
4ae8 39        add     hl,sp
4ae9 5e        ld      e,(hl)
4aea 23        inc     hl
4aeb 56        ld      d,(hl)
4aec eb        ex      de,hl
4aed c9        ret     

4aee cda98b    call    $8ba9
4af1 210800    ld      hl,$0008
4af4 39        add     hl,sp
4af5 4e        ld      c,(hl)
4af6 23        inc     hl
4af7 46        ld      b,(hl)
4af8 50        ld      d,b
4af9 59        ld      e,c
4afa 210200    ld      hl,$0002
4afd cd6d85    call    $856d
4b00 2804      jr      z,$4b06
4b02 cd904b    call    $4b90
4b05 c9        ret     

4b06 60        ld      h,b
4b07 69        ld      l,c
4b08 110000    ld      de,$0000
4b0b cd3c85    call    $853c
4b0e c9        ret     

4b0f cda04b    call    $4ba0
4b12 280b      jr      z,$4b1f
4b14 2ae48f    ld      hl,($8fe4)
4b17 cdf886    call    $86f8
4b1a e5        push    hl
4b1b cd5a54    call    $545a
4b1e d1        pop     de
4b1f cd6852    call    $5268
4b22 cd7b53    call    $537b
4b25 c0        ret     nz

4b26 2ae48f    ld      hl,($8fe4)
4b29 cdf886    call    $86f8
4b2c e5        push    hl
4b2d cd4c55    call    $554c
4b30 d1        pop     de
4b31 c9        ret     

4b32 cda04b    call    $4ba0
4b35 280b      jr      z,$4b42
4b37 2ae48f    ld      hl,($8fe4)
4b3a cdf886    call    $86f8
4b3d e5        push    hl
4b3e cd5a54    call    $545a
4b41 d1        pop     de
4b42 cd0b52    call    $520b
4b45 cd7b53    call    $537b
4b48 c0        ret     nz

4b49 2ae48f    ld      hl,($8fe4)
4b4c cdf886    call    $86f8
4b4f e5        push    hl
4b50 cd4c55    call    $554c
4b53 d1        pop     de
4b54 c9        ret     

4b55 cda98b    call    $8ba9
4b58 cd0f4a    call    $4a0f
4b5b 2af48f    ld      hl,($8ff4)
4b5e c9        ret     

4b5f cd554a    call    $4a55
4b62 e5        push    hl
4b63 cd0d45    call    $450d
4b66 d1        pop     de
4b67 c8        ret     z

4b68 cd3b55    call    $553b
4b6b c9        ret     

4b6c cd554a    call    $4a55
4b6f e5        push    hl
4b70 cd2545    call    $4525
4b73 d1        pop     de
4b74 c0        ret     nz

4b75 cda24a    call    $4aa2
4b78 c0        ret     nz

4b79 c33b55    jp      $553b
4b7c cd6c4a    call    $4a6c
4b7f c32e43    jp      $432e
4b82 cda98b    call    $8ba9
4b85 210800    ld      hl,$0008
4b88 39        add     hl,sp
4b89 4e        ld      c,(hl)
4b8a 23        inc     hl
4b8b 46        ld      b,(hl)
4b8c c5        push    bc
4b8d cdd944    call    $44d9
4b90 d1        pop     de
4b91 2807      jr      z,$4b9a
4b93 c5        push    bc
4b94 cda110    call    $10a1
4b97 d1        pop     de
4b98 2004      jr      nz,$4b9e
4b9a 210000    ld      hl,$0000
4b9d c9        ret     

4b9e 210100    ld      hl,$0001
4ba1 c9        ret     

4ba2 cda98b    call    $8ba9
4ba5 2af48f    ld      hl,($8ff4)
4ba8 e5        push    hl
4ba9 cd824a    call    $4a82
4bac d1        pop     de
4bad 280a      jr      z,$4bb9
4baf cd1831    call    $3118
4bb2 cd3743    call    $4337
4bb5 210100    ld      hl,$0001
4bb8 c9        ret     

4bb9 210000    ld      hl,$0000
4bbc c9        ret     

4bbd cd6c4a    call    $4a6c
4bc0 2af48f    ld      hl,($8ff4)
4bc3 e5        push    hl
4bc4 cd9f45    call    $459f
4bc7 d1        pop     de
4bc8 c9        ret     

4bc9 cd554a    call    $4a55
4bcc e5        push    hl
4bcd cdec4c    call    $4cec
4bd0 d1        pop     de
4bd1 c9        ret     

4bd2 cd0f4a    call    $4a0f
4bd5 c33b4b    jp      $4b3b
4bd8 cdd24a    call    $4ad2
4bdb c32e43    jp      $432e
4bde cd554a    call    $4a55
4be1 c0        ret     nz

4be2 cd3b55    call    $553b
4be5 c9        ret     

4be6 cd554a    call    $4a55
4be9 e5        push    hl
4bea cd6341    call    $4163
4bed d1        pop     de
4bee c9        ret     

4bef cdc94a    call    $4ac9
4bf2 c32e43    jp      $432e
4bf5 cd324a    call    $4a32
4bf8 2af48f    ld      hl,($8ff4)
4bfb eb        ex      de,hl
4bfc 2ab88f    ld      hl,($8fb8)
4bff cd3c85    call    $853c
4c02 c0        ret     nz

4c03 2af48f    ld      hl,($8ff4)
4c06 eb        ex      de,hl
4c07 2aba8f    ld      hl,($8fba)
4c0a cd3c85    call    $853c
4c0d c0        ret     nz

4c0e c30b57    jp      $570b
4c11 cda98b    call    $8ba9
4c14 cdbd4a    call    $4abd
4c17 cde681    call    $81e6
4c1a 44        ld      b,h
4c1b 4d        ld      c,l
4c1c 110000    ld      de,$0000
4c1f eb        ex      de,hl
4c20 cd5585    call    $8555
4c23 2813      jr      z,$4c38
4c25 60        ld      h,b
4c26 69        ld      l,c
4c27 eb        ex      de,hl
4c28 210800    ld      hl,$0008
4c2b 39        add     hl,sp
4c2c 7e        ld      a,(hl)
4c2d 23        inc     hl
4c2e 66        ld      h,(hl)
4c2f 6f        ld      l,a
4c30 cd5685    call    $8556
4c33 2803      jr      z,$4c38
4c35 60        ld      h,b
4c36 69        ld      l,c
4c37 c9        ret     

4c38 c33b55    jp      $553b
4c3b 2af48f    ld      hl,($8ff4)
4c3e e5        push    hl
4c3f cdec4c    call    $4cec
4c42 2af48f    ld      hl,($8ff4)
4c45 e3        ex      (sp),hl
4c46 cd4146    call    $4641
4c49 d1        pop     de
4c4a 280d      jr      z,$4c59
4c4c cd5a4b    call    $4b5a
4c4f 2008      jr      nz,$4c59
4c51 2af48f    ld      hl,($8ff4)
4c54 e5        push    hl
4c55 cd2a54    call    $542a
4c58 d1        pop     de
4c59 c9        ret     

4c5a 2ac48f    ld      hl,($8fc4)
4c5d e5        push    hl
4c5e 2ad08f    ld      hl,($8fd0)
4c61 e5        push    hl
4c62 cd3447    call    $4734
4c65 d1        pop     de
4c66 d1        pop     de
4c67 eb        ex      de,hl
4c68 2ab88f    ld      hl,($8fb8)
4c6b c33c85    jp      $853c
4c6e 2ace8f    ld      hl,($8fce)
4c71 e5        push    hl
4c72 cd8d41    call    $418d
4c75 e5        push    hl
4c76 cdf347    call    $47f3
4c79 d1        pop     de
4c7a d1        pop     de
4c7b c9        ret     

4c7c 210100    ld      hl,$0001
4c7f 22f48f    ld      ($8ff4),hl
4c82 c9        ret     

4c83 2aee8f    ld      hl,($8fee)
4c86 cdf886    call    $86f8
4c89 eb        ex      de,hl
4c8a 2ad88f    ld      hl,($8fd8)
4c8d c33c85    jp      $853c
4c90 cda98b    call    $8ba9
4c93 cda04b    call    $4ba0
4c96 2804      jr      z,$4c9c
4c98 210100    ld      hl,$0001
4c9b c9        ret     

4c9c cd834b    call    $4b83
4c9f c9        ret     

4ca0 2aee8f    ld      hl,($8fee)
4ca3 c3f685    jp      $85f6
4ca6 cda98b    call    $8ba9
4ca9 210800    ld      hl,$0008
4cac 39        add     hl,sp
4cad 5e        ld      e,(hl)
4cae 23        inc     hl
4caf 56        ld      d,(hl)
4cb0 d5        push    de
4cb1 cd5630    call    $3056
4cb4 d1        pop     de
4cb5 c33743    jp      $4337
4cb8 cda98b    call    $8ba9
4cbb 210800    ld      hl,$0008
4cbe 39        add     hl,sp
4cbf cd667c    call    $7c66
4cc2 cda77c    call    $7ca7
4cc5 cd0331    call    $3103
4cc8 eb        ex      de,hl
4cc9 cda08b    call    $8ba0
4ccc c33743    jp      $4337
4ccf 210100    ld      hl,$0001
4cd2 227a8f    ld      ($8f7a),hl
4cd5 c3d84b    jp      $4bd8
4cd8 cdf231    call    $31f2
4cdb c33743    jp      $4337
4cde cda98b    call    $8ba9
4ce1 210800    ld      hl,$0008
4ce4 39        add     hl,sp
4ce5 5e        ld      e,(hl)
4ce6 23        inc     hl
4ce7 56        ld      d,(hl)
4ce8 eb        ex      de,hl
4ce9 22728f    ld      ($8f72),hl
4cec e5        push    hl
4ced cdad7b    call    $7bad
4cf0 d1        pop     de
4cf1 227a8f    ld      ($8f7a),hl
4cf4 cdf231    call    $31f2
4cf7 c3aa41    jp      $41aa
4cfa cda98b    call    $8ba9
4cfd 210800    ld      hl,$0008
4d00 39        add     hl,sp
4d01 4e        ld      c,(hl)
4d02 23        inc     hl
4d03 46        ld      b,(hl)
4d04 c5        push    bc
4d05 cd5646    call    $4656
4d08 d1        pop     de
4d09 2004      jr      nz,$4d0f
4d0b 210000    ld      hl,$0000
4d0e c9        ret     

4d0f c5        push    bc
4d10 cdd046    call    $46d0
4d13 d1        pop     de
4d14 44        ld      b,h
4d15 4d        ld      c,l
4d16 7c        ld      a,h
4d17 b5        or      l
4d18 2004      jr      nz,$4d1e
4d1a 210000    ld      hl,$0000
4d1d c9        ret     

4d1e 210200    ld      hl,$0002
4d21 09        add     hl,bc
4d22 5e        ld      e,(hl)
4d23 23        inc     hl
4d24 56        ld      d,(hl)
4d25 210a00    ld      hl,$000a
4d28 39        add     hl,sp
4d29 7e        ld      a,(hl)
4d2a 23        inc     hl
4d2b 66        ld      h,(hl)
4d2c 6f        ld      l,a
4d2d c33c85    jp      $853c
4d30 cda98b    call    $8ba9
4d33 cd2543    call    $4325
4d36 210800    ld      hl,$0008
4d39 39        add     hl,sp
4d3a e5        push    hl
4d3b 7e        ld      a,(hl)
4d3c 23        inc     hl
4d3d 66        ld      h,(hl)
4d3e 6f        ld      l,a
4d3f 2b        dec     hl
4d40 eb        ex      de,hl
4d41 e1        pop     hl
4d42 73        ld      (hl),e
4d43 23        inc     hl
4d44 72        ld      (hl),d
4d45 eb        ex      de,hl
4d46 23        inc     hl
4d47 7c        ld      a,h
4d48 b5        or      l
4d49 2805      jr      z,$4d50
4d4b cd6a42    call    $426a
4d4e 18e6      jr      $4d36
4d50 c33743    jp      $4337
4d53 2af48f    ld      hl,($8ff4)
4d56 e5        push    hl
4d57 cd9f45    call    $459f
4d5a d1        pop     de
4d5b c9        ret     

4d5c cda98b    call    $8ba9
4d5f cd534c    call    $4c53
4d62 c3e681    jp      $81e6
4d65 21ff00    ld      hl,$00ff
4d68 e5        push    hl
4d69 cd114b    call    $4b11
4d6c d1        pop     de
4d6d c9        ret     

4d6e cda98b    call    $8ba9
4d71 210000    ld      hl,$0000
4d74 22ee8f    ld      ($8fee),hl
4d77 22ec8f    ld      ($8fec),hl
4d7a cd3141    call    $4131
4d7d 2026      jr      nz,$4da5
4d7f cd8d41    call    $418d
4d82 eb        ex      de,hl
4d83 210800    ld      hl,$0008
4d86 39        add     hl,sp
4d87 7e        ld      a,(hl)
4d88 23        inc     hl
4d89 66        ld      h,(hl)
4d8a 6f        ld      l,a
4d8b cd3c85    call    $853c
4d8e 2810      jr      z,$4da0
4d90 cdaf43    call    $43af
4d93 210100    ld      hl,$0001
4d96 e5        push    hl
4d97 21698c    ld      hl,$8c69
4d9a e5        push    hl
4d9b cd167c    call    $7c16
4d9e d1        pop     de
4d9f d1        pop     de
4da0 cd3741    call    $4137
4da3 18d5      jr      $4d7a
4da5 cd7b53    call    $537b
4da8 2803      jr      z,$4dad
4daa cdb654    call    $54b6
4dad 210100    ld      hl,$0001
4db0 e5        push    hl
4db1 216d8c    ld      hl,$8c6d
4db4 e5        push    hl
4db5 cd167c    call    $7c16
4db8 d1        pop     de
4db9 d1        pop     de
4dba c9        ret     

4dbb cd8d41    call    $418d
4dbe e5        push    hl
4dbf cd0d45    call    $450d
4dc2 d1        pop     de
4dc3 c0        ret     nz

4dc4 cd3b55    call    $553b
4dc7 c9        ret     

4dc8 2a0890    ld      hl,($9008)
4dcb 7c        ld      a,h
4dcc b5        or      l
4dcd c8        ret     z

4dce 2a0290    ld      hl,($9002)
4dd1 7c        ld      a,h
4dd2 b5        or      l
4dd3 2807      jr      z,$4ddc
4dd5 210000    ld      hl,$0000
4dd8 229f8c    ld      ($8c9f),hl
4ddb c9        ret     

4ddc c3e255    jp      $55e2
4ddf 2af88f    ld      hl,($8ff8)
4de2 110100    ld      de,$0001
4de5 cd4885    call    $8548
4de8 c0        ret     nz

4de9 c32856    jp      $5628
4dec cda98b    call    $8ba9
4def 210800    ld      hl,$0008
4df2 39        add     hl,sp
4df3 5e        ld      e,(hl)
4df4 23        inc     hl
4df5 56        ld      d,(hl)
4df6 d5        push    de
4df7 cd5646    call    $4656
4dfa d1        pop     de
4dfb c0        ret     nz

4dfc c33b55    jp      $553b
4dff cd7c32    call    $327c
4e02 cd8d41    call    $418d
4e05 22ee8f    ld      ($8fee),hl
4e08 e5        push    hl
4e09 cd2c46    call    $462c
4e0c 22ec8f    ld      ($8fec),hl
4e0f e3        ex      (sp),hl
4e10 cdc941    call    $41c9
4e13 d1        pop     de
4e14 cda04b    call    $4ba0
4e17 200d      jr      nz,$4e26
4e19 cd0b52    call    $520b
4e1c cd7b53    call    $537b
4e1f 2803      jr      z,$4e24
4e21 cdd111    call    $11d1
4e24 18ee      jr      $4e14
4e26 c39641    jp      $4196
4e29 2abc8f    ld      hl,($8fbc)
4e2c e5        push    hl
4e2d 2af08f    ld      hl,($8ff0)
4e30 e5        push    hl
4e31 cd3447    call    $4734
4e34 d1        pop     de
4e35 d1        pop     de
4e36 221f91    ld      ($911f),hl
4e39 7c        ld      a,h
4e3a b5        or      l
4e3b 2003      jr      nz,$4e40
4e3d cd0e58    call    $580e
4e40 2aea8f    ld      hl,($8fea)
4e43 e5        push    hl
4e44 cd6341    call    $4163
4e47 2af08f    ld      hl,($8ff0)
4e4a e3        ex      (sp),hl
4e4b cd6341    call    $4163
4e4e 2aec8f    ld      hl,($8fec)
4e51 e3        ex      (sp),hl
4e52 cd6341    call    $4163
4e55 d1        pop     de
4e56 2a1f91    ld      hl,($911f)
4e59 cdff86    call    $86ff
4e5c e5        push    hl
4e5d cd6341    call    $4163
4e60 210200    ld      hl,$0002
4e63 e3        ex      (sp),hl
4e64 cdde41    call    $41de
4e67 2abe8f    ld      hl,($8fbe)
4e6a e3        ex      (sp),hl
4e6b cd6341    call    $4163
4e6e d1        pop     de
4e6f cd1d51    call    $511d
4e72 2a1f91    ld      hl,($911f)
4e75 cdf886    call    $86f8
4e78 e5        push    hl
4e79 cdf94f    call    $4ff9
4e7c 2abe8f    ld      hl,($8fbe)
4e7f e3        ex      (sp),hl
4e80 cd455a    call    $5a45
4e83 210300    ld      hl,$0003
4e86 e3        ex      (sp),hl
4e87 cd0a42    call    $420a
4e8a d1        pop     de
4e8b 22ec8f    ld      ($8fec),hl
4e8e 2aee8f    ld      hl,($8fee)
4e91 e5        push    hl
4e92 210300    ld      hl,$0003
4e95 e5        push    hl
4e96 cd3542    call    $4235
4e99 d1        pop     de
4e9a d1        pop     de
4e9b cd7c4b    call    $4b7c
4e9e 2aec8f    ld      hl,($8fec)
4ea1 7c        ld      a,h
4ea2 b5        or      l
4ea3 280c      jr      z,$4eb1
4ea5 2aec8f    ld      hl,($8fec)
4ea8 cdf886    call    $86f8
4eab 22ee8f    ld      ($8fee),hl
4eae cd054e    call    $4e05
4eb1 2abe8f    ld      hl,($8fbe)
4eb4 e5        push    hl
4eb5 cd455a    call    $5a45
4eb8 d1        pop     de
4eb9 2aa18c    ld      hl,($8ca1)
4ebc 7c        ld      a,h
4ebd b5        or      l
4ebe 2821      jr      z,$4ee1
4ec0 cd7b53    call    $537b
4ec3 281c      jr      z,$4ee1
4ec5 cd8c53    call    $538c
4ec8 cde043    call    $43e0
4ecb e5        push    hl
4ecc cd3135    call    $3531
4ecf 21fb4d    ld      hl,$4dfb
4ed2 e3        ex      (sp),hl
4ed3 cd1c67    call    $671c
4ed6 2af48f    ld      hl,($8ff4)
4ed9 e3        ex      (sp),hl
4eda cd3936    call    $3639
4edd d1        pop     de
4ede cdab66    call    $66ab
4ee1 210300    ld      hl,$0003
4ee4 e5        push    hl
4ee5 cdf441    call    $41f4
4ee8 d1        pop     de
4ee9 cdc549    call    $49c5
4eec cdaa41    call    $41aa
4eef 22e68f    ld      ($8fe6),hl
4ef2 cdaa41    call    $41aa
4ef5 e5        push    hl
4ef6 cd2b51    call    $512b
4ef9 d1        pop     de
4efa c9        ret     

4efb 2072      jr      nz,$4f6f
4efd 65        ld      h,l
4efe 74        ld      (hl),h
4eff 75        ld      (hl),l
4f00 72        ld      (hl),d
4f01 6e        ld      l,(hl)
4f02 73        ld      (hl),e
4f03 2000      jr      nz,$4f05
4f05 cda98b    call    $8ba9
4f08 21698c    ld      hl,$8c69
4f0b e5        push    hl
4f0c cd017c    call    $7c01
4f0f d1        pop     de
4f10 c0        ret     nz

4f11 cd8443    call    $4384
4f14 cd8453    call    $5384
4f17 cda04b    call    $4ba0
4f1a 2814      jr      z,$4f30
4f1c cd0d51    call    $510d
4f1f 2aec8f    ld      hl,($8fec)
4f22 7c        ld      a,h
4f23 b5        or      l
4f24 c8        ret     z

4f25 2aec8f    ld      hl,($8fec)
4f28 cdf886    call    $86f8
4f2b 22ee8f    ld      ($8fee),hl
4f2e 18e7      jr      $4f17
4f30 2aec8f    ld      hl,($8fec)
4f33 cdff86    call    $86ff
4f36 2051      jr      nz,$4f89
4f38 2aee8f    ld      hl,($8fee)
4f3b cdff86    call    $86ff
4f3e 2049      jr      nz,$4f89
4f40 cde043    call    $43e0
4f43 e5        push    hl
4f44 2aee8f    ld      hl,($8fee)
4f47 cdf886    call    $86f8
4f4a d1        pop     de
4f4b cd3c85    call    $853c
4f4e 2839      jr      z,$4f89
4f50 2abc8f    ld      hl,($8fbc)
4f53 e5        push    hl
4f54 cde043    call    $43e0
4f57 e5        push    hl
4f58 cd3447    call    $4734
4f5b d1        pop     de
4f5c d1        pop     de
4f5d 22f08f    ld      ($8ff0),hl
4f60 7c        ld      a,h
4f61 b5        or      l
4f62 2825      jr      z,$4f89
4f64 2af08f    ld      hl,($8ff0)
4f67 cdf886    call    $86f8
4f6a 201d      jr      nz,$4f89
4f6c 2af08f    ld      hl,($8ff0)
4f6f cdff86    call    $86ff
4f72 2815      jr      z,$4f89
4f74 2af08f    ld      hl,($8ff0)
4f77 cdff86    call    $86ff
4f7a 22ec8f    ld      ($8fec),hl
4f7d cdf886    call    $86f8
4f80 22ee8f    ld      ($8fee),hl
4f83 cd9d69    call    $699d
4f86 c3174e    jp      $4e17
4f89 1800      jr      $4f8b
4f8b 2ab28f    ld      hl,($8fb2)
4f8e 7c        ld      a,h
4f8f b5        or      l
4f90 2875      jr      z,$5007
4f92 cde043    call    $43e0
4f95 e5        push    hl
4f96 cde348    call    $48e3
4f99 d1        pop     de
4f9a 286b      jr      z,$5007
4f9c cdb549    call    $49b5
4f9f cd8c53    call    $538c
4fa2 210e4f    ld      hl,$4f0e
4fa5 e5        push    hl
4fa6 cd1c67    call    $671c
4fa9 d1        pop     de
4faa cde043    call    $43e0
4fad e5        push    hl
4fae cd3936    call    $3639
4fb1 21124f    ld      hl,$4f12
4fb4 e3        ex      (sp),hl
4fb5 cd1c67    call    $671c
4fb8 d1        pop     de
4fb9 cd8d41    call    $418d
4fbc e5        push    hl
4fbd cdff45    call    $45ff
4fc0 21798c    ld      hl,$8c79
4fc3 e3        ex      (sp),hl
4fc4 cd017c    call    $7c01
4fc7 d1        pop     de
4fc8 2808      jr      z,$4fd2
4fca cd9577    call    $7795
4fcd cdab66    call    $66ab
4fd0 18cd      jr      $4f9f
4fd2 212000    ld      hl,$0020
4fd5 e5        push    hl
4fd6 cddc28    call    $28dc
4fd9 d1        pop     de
4fda cd8532    call    $3285
4fdd 2025      jr      nz,$5004
4fdf 2ade8f    ld      hl,($8fde)
4fe2 e5        push    hl
4fe3 cd6341    call    $4163
4fe6 d1        pop     de
4fe7 cd1a12    call    $121a
4fea 21698c    ld      hl,$8c69
4fed e5        push    hl
4fee cd017c    call    $7c01
4ff1 d1        pop     de
4ff2 2805      jr      z,$4ff9
4ff4 cd645a    call    $5a64
4ff7 1806      jr      $4fff
4ff9 cd8443    call    $4384
4ffc cdff4c    call    $4cff
4fff cd2d12    call    $122d
5002 189b      jr      $4f9f
5004 cdc549    call    $49c5
5007 cd1e4f    call    $4f1e
500a c3144e    jp      $4e14
500d c9        ret     

500e 49        ld      c,c
500f 6e        ld      l,(hl)
5010 2000      jr      nz,$5012
5012 2c        inc     l
5013 2000      jr      nz,$5015
5015 2af08f    ld      hl,($8ff0)
5018 22f48f    ld      ($8ff4),hl
501b c31d51    jp      $511d
501e cd7c4b    call    $4b7c
5021 cd9d69    call    $699d
5024 cda04b    call    $4ba0
5027 c0        ret     nz

5028 2aee8f    ld      hl,($8fee)
502b cdf886    call    $86f8
502e 22f08f    ld      ($8ff0),hl
5031 e5        push    hl
5032 cdd944    call    $44d9
5035 d1        pop     de
5036 caf24f    jp      z,$4ff2
5039 2af08f    ld      hl,($8ff0)
503c 7c        ld      a,h
503d b5        or      l
503e 200c      jr      nz,$504c
5040 210000    ld      hl,$0000
5043 22f48f    ld      ($8ff4),hl
5046 cd1d51    call    $511d
5049 c3f14f    jp      $4ff1
504c 2af08f    ld      hl,($8ff0)
504f e5        push    hl
5050 cd2545    call    $4525
5053 d1        pop     de
5054 2806      jr      z,$505c
5056 cd154f    call    $4f15
5059 c3f14f    jp      $4ff1
505c 2af08f    ld      hl,($8ff0)
505f e5        push    hl
5060 cd5646    call    $4656
5063 d1        pop     de
5064 cae94f    jp      z,$4fe9
5067 2af08f    ld      hl,($8ff0)
506a e5        push    hl
506b cda110    call    $10a1
506e d1        pop     de
506f 2803      jr      z,$5074
5071 c3154f    jp      $4f15
5074 2a7a8f    ld      hl,($8f7a)
5077 7c        ld      a,h
5078 b5        or      l
5079 2831      jr      z,$50ac
507b cdcd28    call    $28cd
507e 2ae68d    ld      hl,($8de6)
5081 2600      ld      h,$00
5083 112200    ld      de,$0022
5086 cd3c85    call    $853c
5089 2806      jr      z,$5091
508b cdd84b    call    $4bd8
508e c31d51    jp      $511d
5091 2ae68d    ld      hl,($8de6)
5094 2600      ld      h,$00
5096 113a00    ld      de,$003a
5099 cd3c85    call    $853c
509c 280e      jr      z,$50ac
509e cdd84b    call    $4bd8
50a1 2af48f    ld      hl,($8ff4)
50a4 e5        push    hl
50a5 cd6e51    call    $516e
50a8 d1        pop     de
50a9 c31d51    jp      $511d
50ac 2af08f    ld      hl,($8ff0)
50af e5        push    hl
50b0 cdd046    call    $46d0
50b3 d1        pop     de
50b4 222191    ld      ($9121),hl
50b7 7c        ld      a,h
50b8 b5        or      l
50b9 2003      jr      nz,$50be
50bb c3294d    jp      $4d29
50be 2ae48f    ld      hl,($8fe4)
50c1 e5        push    hl
50c2 cd6341    call    $4163
50c5 d1        pop     de
50c6 2aee8f    ld      hl,($8fee)
50c9 22e48f    ld      ($8fe4),hl
50cc cd1d51    call    $511d
50cf 2a2191    ld      hl,($9121)
50d2 23        inc     hl
50d3 23        inc     hl
50d4 5e        ld      e,(hl)
50d5 23        inc     hl
50d6 56        ld      d,(hl)
50d7 eb        ex      de,hl
50d8 cd0485    call    $8504
50db 2ae48f    ld      hl,($8fe4)
50de 22e68f    ld      ($8fe6),hl
50e1 cdaa41    call    $41aa
50e4 22e48f    ld      ($8fe4),hl
50e7 1808      jr      $50f1
50e9 21f64f    ld      hl,$4ff6
50ec e5        push    hl
50ed cd8a56    call    $568a
50f0 d1        pop     de
50f1 c9        ret     

50f2 cd154f    call    $4f15
50f5 c9        ret     

50f6 23        inc     hl
50f7 3100cd    ld      sp,$cd00
50fa a9        xor     c
50fb 8b        adc     a,e
50fc 21698c    ld      hl,$8c69
50ff e5        push    hl
5100 cd017c    call    $7c01
5103 d1        pop     de
5104 c0        ret     nz

5105 cd8443    call    $4384
5108 210800    ld      hl,$0008
510b 39        add     hl,sp
510c 5e        ld      e,(hl)
510d 23        inc     hl
510e 56        ld      d,(hl)
510f d5        push    de
5110 cd1e50    call    $501e
5113 d1        pop     de
5114 2aa18c    ld      hl,($8ca1)
5117 7c        ld      a,h
5118 b5        or      l
5119 c8        ret     z

511a cdab66    call    $66ab
511d c9        ret     

511e cda98b    call    $8ba9
5121 210800    ld      hl,$0008
5124 39        add     hl,sp
5125 4e        ld      c,(hl)
5126 23        inc     hl
5127 46        ld      b,(hl)
5128 78        ld      a,b
5129 b1        or      c
512a 201a      jr      nz,$5146
512c 2aa18c    ld      hl,($8ca1)
512f 7c        ld      a,h
5130 b5        or      l
5131 c8        ret     z

5132 cd8c53    call    $538c
5135 21a850    ld      hl,$50a8
5138 e5        push    hl
5139 cd1c67    call    $671c
513c d1        pop     de
513d cdda43    call    $43da
5140 e5        push    hl
5141 cd3135    call    $3531
5144 d1        pop     de
5145 c9        ret     

5146 cd904b    call    $4b90
5149 2808      jr      z,$5153
514b cdda43    call    $43da
514e e5        push    hl
514f cd5a54    call    $545a
5152 d1        pop     de
5153 cd6852    call    $5268
5156 cd7b53    call    $537b
5159 2008      jr      nz,$5163
515b cdda43    call    $43da
515e e5        push    hl
515f cd4c55    call    $554c
5162 d1        pop     de
5163 cd2e43    call    $432e
5166 cd7266    call    $6672
5169 60        ld      h,b
516a 69        ld      l,c
516b cdff86    call    $86ff
516e e5        push    hl
516f cd1e50    call    $501e
5172 d1        pop     de
5173 cd8d41    call    $418d
5176 e5        push    hl
5177 60        ld      h,b
5178 69        ld      l,c
5179 cdf886    call    $86f8
517c e5        push    hl
517d cd8116    call    $1681
5180 d1        pop     de
5181 d1        pop     de
5182 2aa18c    ld      hl,($8ca1)
5185 7c        ld      a,h
5186 b5        or      l
5187 281c      jr      z,$51a5
5189 cd8c53    call    $538c
518c 60        ld      h,b
518d 69        ld      l,c
518e cdf886    call    $86f8
5191 e5        push    hl
5192 cd3135    call    $3531
5195 21b450    ld      hl,$50b4
5198 e3        ex      (sp),hl
5199 cd1c67    call    $671c
519c d1        pop     de
519d cd8d41    call    $418d
51a0 e5        push    hl
51a1 cd3936    call    $3639
51a4 d1        pop     de
51a5 c39641    jp      $4196
51a8 45        ld      b,l
51a9 76        halt    
51aa 61        ld      h,c
51ab 6c        ld      l,h
51ac 75        ld      (hl),l
51ad 61        ld      h,c
51ae 74        ld      (hl),h
51af 69        ld      l,c
51b0 6e        ld      l,(hl)
51b1 67        ld      h,a
51b2 2000      jr      nz,$51b4
51b4 2069      jr      nz,$521f
51b6 73        ld      (hl),e
51b7 2000      jr      nz,$51b9
51b9 cd1e4f    call    $4f1e
51bc c38453    jp      $5384
51bf 2aee8f    ld      hl,($8fee)
51c2 e5        push    hl
51c3 cd6341    call    $4163
51c6 2af48f    ld      hl,($8ff4)
51c9 22ee8f    ld      ($8fee),hl
51cc e3        ex      (sp),hl
51cd cd6341    call    $4163
51d0 d1        pop     de
51d1 cd9d69    call    $699d
51d4 cda04b    call    $4ba0
51d7 2005      jr      nz,$51de
51d9 cdb950    call    $50b9
51dc 18f6      jr      $51d4
51de cd3743    call    $4337
51e1 cdaa41    call    $41aa
51e4 22ee8f    ld      ($8fee),hl
51e7 c9        ret     

51e8 2aee8f    ld      hl,($8fee)
51eb e5        push    hl
51ec cd6341    call    $4163
51ef d1        pop     de
51f0 2af48f    ld      hl,($8ff4)
51f3 22ee8f    ld      ($8fee),hl
51f6 cd7c4b    call    $4b7c
51f9 cda04b    call    $4ba0
51fc 2008      jr      nz,$5206
51fe cd8453    call    $5384
5201 cd0b52    call    $520b
5204 18f3      jr      $51f9
5206 cdaa41    call    $41aa
5209 22ee8f    ld      ($8fee),hl
520c c9        ret     

520d 2aec8f    ld      hl,($8fec)
5210 7c        ld      a,h
5211 b5        or      l
5212 c8        ret     z

5213 2aec8f    ld      hl,($8fec)
5216 cdff86    call    $86ff
5219 22ec8f    ld      ($8fec),hl
521c c9        ret     

521d cda04b    call    $4ba0
5220 c0        ret     nz

5221 2aee8f    ld      hl,($8fee)
5224 cdff86    call    $86ff
5227 22ee8f    ld      ($8fee),hl
522a c9        ret     

522b cda98b    call    $8ba9
522e 2aea8f    ld      hl,($8fea)
5231 eb        ex      de,hl
5232 210800    ld      hl,$0008
5235 39        add     hl,sp
5236 7e        ld      a,(hl)
5237 23        inc     hl
5238 66        ld      h,(hl)
5239 6f        ld      l,a
523a cd4885    call    $8548
523d c8        ret     z

523e 2aea8f    ld      hl,($8fea)
5241 7c        ld      a,h
5242 b5        or      l
5243 2008      jr      nz,$524d
5245 216b51    ld      hl,$516b
5248 e5        push    hl
5249 cd8a56    call    $568a
524c d1        pop     de
524d 2aea8f    ld      hl,($8fea)
5250 44        ld      b,h
5251 4d        ld      c,l
5252 cdf886    call    $86f8
5255 e5        push    hl
5256 cdad3d    call    $3dad
5259 d1        pop     de
525a 2aea8f    ld      hl,($8fea)
525d cdff86    call    $86ff
5260 22ea8f    ld      ($8fea),hl
5263 c5        push    bc
5264 cdad3d    call    $3dad
5267 d1        pop     de
5268 18c4      jr      $522e
526a c9        ret     

526b 23        inc     hl
526c 3200cd    ld      ($cd00),a
526f a9        xor     c
5270 8b        adc     a,e
5271 210800    ld      hl,$0008
5274 39        add     hl,sp
5275 4e        ld      c,(hl)
5276 23        inc     hl
5277 46        ld      b,(hl)
5278 c5        push    bc
5279 cdaf16    call    $16af
527c d1        pop     de
527d 222391    ld      ($9123),hl
5280 7c        ld      a,h
5281 b5        or      l
5282 2027      jr      nz,$52ab
5284 c5        push    bc
5285 cd5646    call    $4656
5288 d1        pop     de
5289 2811      jr      z,$529c
528b 2ac48f    ld      hl,($8fc4)
528e e5        push    hl
528f c5        push    bc
5290 cd0147    call    $4701
5293 d1        pop     de
5294 d1        pop     de
5295 222391    ld      ($9123),hl
5298 7c        ld      a,h
5299 b5        or      l
529a 2005      jr      nz,$52a1
529c c5        push    bc
529d cd3b58    call    $583b
52a0 d1        pop     de
52a1 2a2391    ld      hl,($9123)
52a4 cdf886    call    $86f8
52a7 22f48f    ld      ($8ff4),hl
52aa c9        ret     

52ab 2a2391    ld      hl,($9123)
52ae cdff86    call    $86ff
52b1 22f48f    ld      ($8ff4),hl
52b4 c9        ret     

52b5 cda98b    call    $8ba9
52b8 210800    ld      hl,$0008
52bb 39        add     hl,sp
52bc 5e        ld      e,(hl)
52bd 23        inc     hl
52be 56        ld      d,(hl)
52bf d5        push    de
52c0 2af08f    ld      hl,($8ff0)
52c3 44        ld      b,h
52c4 4d        ld      c,l
52c5 e5        push    hl
52c6 cdfa4b    call    $4bfa
52c9 d1        pop     de
52ca d1        pop     de
52cb 2004      jr      nz,$52d1
52cd 210000    ld      hl,$0000
52d0 c9        ret     

52d1 cd1d51    call    $511d
52d4 c5        push    bc
52d5 211000    ld      hl,$0010
52d8 39        add     hl,sp
52d9 5e        ld      e,(hl)
52da 23        inc     hl
52db 56        ld      d,(hl)
52dc eb        ex      de,hl
52dd cd0485    call    $8504
52e0 d1        pop     de
52e1 cd2e43    call    $432e
52e4 210c00    ld      hl,$000c
52e7 39        add     hl,sp
52e8 5e        ld      e,(hl)
52e9 23        inc     hl
52ea 56        ld      d,(hl)
52eb eb        ex      de,hl
52ec cd0485    call    $8504
52ef c5        push    bc
52f0 211000    ld      hl,$0010
52f3 39        add     hl,sp
52f4 5e        ld      e,(hl)
52f5 23        inc     hl
52f6 56        ld      d,(hl)
52f7 eb        ex      de,hl
52f8 cd0485    call    $8504
52fb d1        pop     de
52fc 210a00    ld      hl,$000a
52ff 39        add     hl,sp
5300 5e        ld      e,(hl)
5301 23        inc     hl
5302 56        ld      d,(hl)
5303 eb        ex      de,hl
5304 cd0485    call    $8504
5307 210100    ld      hl,$0001
530a c9        ret     

530b cd2d52    call    $522d
530e cda04b    call    $4ba0
5311 c0        ret     nz

5312 21f552    ld      hl,$52f5
5315 e5        push    hl
5316 212d52    ld      hl,$522d
5319 e5        push    hl
531a 215153    ld      hl,$5351
531d e5        push    hl
531e 21af0a    ld      hl,$0aaf
5321 e5        push    hl
5322 cdb551    call    $51b5
5325 eb        ex      de,hl
5326 cda08b    call    $8ba0
5329 c8        ret     z

532a 18e2      jr      $530e
532c c9        ret     

532d cd6852    call    $5268
5330 cda04b    call    $4ba0
5333 c0        ret     nz

5334 210953    ld      hl,$5309
5337 e5        push    hl
5338 216852    ld      hl,$5268
533b e5        push    hl
533c 214f06    ld      hl,$064f
533f e5        push    hl
5340 210207    ld      hl,$0702
5343 e5        push    hl
5344 cdb551    call    $51b5
5347 eb        ex      de,hl
5348 cda08b    call    $8ba0
534b 20e3      jr      nz,$5330
534d 210953    ld      hl,$5309
5350 e5        push    hl
5351 216852    ld      hl,$5268
5354 e5        push    hl
5355 217e06    ld      hl,$067e
5358 e5        push    hl
5359 210807    ld      hl,$0708
535c e5        push    hl
535d cdb551    call    $51b5
5360 eb        ex      de,hl
5361 cda08b    call    $8ba0
5364 20ca      jr      nz,$5330
5366 c9        ret     

5367 c9        ret     

5368 cda352    call    $52a3
536b cda04b    call    $4ba0
536e c0        ret     nz

536f 212b53    ld      hl,$532b
5372 e5        push    hl
5373 21a352    ld      hl,$52a3
5376 e5        push    hl
5377 211106    ld      hl,$0611
537a e5        push    hl
537b 21e305    ld      hl,$05e3
537e e5        push    hl
537f cdb551    call    $51b5
5382 eb        ex      de,hl
5383 cda08b    call    $8ba0
5386 20e3      jr      nz,$536b
5388 212b53    ld      hl,$532b
538b e5        push    hl
538c 21a352    ld      hl,$52a3
538f e5        push    hl
5390 213006    ld      hl,$0630
5393 e5        push    hl
5394 21ec05    ld      hl,$05ec
5397 e5        push    hl
5398 cdb551    call    $51b5
539b eb        ex      de,hl
539c cda08b    call    $8ba0
539f 20ca      jr      nz,$536b
53a1 c9        ret     

53a2 c9        ret     

53a3 cdde52    call    $52de
53a6 cda04b    call    $4ba0
53a9 c0        ret     nz

53aa 212b53    ld      hl,$532b
53ad e5        push    hl
53ae 21de52    ld      hl,$52de
53b1 e5        push    hl
53b2 21da06    ld      hl,$06da
53b5 e5        push    hl
53b6 212104    ld      hl,$0421
53b9 e5        push    hl
53ba cdb551    call    $51b5
53bd eb        ex      de,hl
53be cda08b    call    $8ba0
53c1 20e3      jr      nz,$53a6
53c3 212b53    ld      hl,$532b
53c6 e5        push    hl
53c7 21de52    ld      hl,$52de
53ca e5        push    hl
53cb 21aa06    ld      hl,$06aa
53ce e5        push    hl
53cf 21f906    ld      hl,$06f9
53d2 e5        push    hl
53d3 cdb551    call    $51b5
53d6 eb        ex      de,hl
53d7 cda08b    call    $8ba0
53da 20ca      jr      nz,$53a6
53dc c9        ret     

53dd c9        ret     

53de cd1e4f    call    $4f1e
53e1 cda04b    call    $4ba0
53e4 2805      jr      z,$53eb
53e6 210000    ld      hl,$0000
53e9 1806      jr      $53f1
53eb 2aee8f    ld      hl,($8fee)
53ee cdf886    call    $86f8
53f1 22f08f    ld      ($8ff0),hl
53f4 c9        ret     

53f5 cda98b    call    $8ba9
53f8 cd7b53    call    $537b
53fb c0        ret     nz

53fc 210800    ld      hl,$0008
53ff 39        add     hl,sp
5400 5e        ld      e,(hl)
5401 23        inc     hl
5402 56        ld      d,(hl)
5403 d5        push    de
5404 cd5a54    call    $545a
5407 d1        pop     de
5408 c9        ret     

5409 cda98b    call    $8ba9
540c 210800    ld      hl,$0008
540f 39        add     hl,sp
5410 4e        ld      c,(hl)
5411 23        inc     hl
5412 46        ld      b,(hl)
5413 c5        push    bc
5414 cdf552    call    $52f5
5417 2af48f    ld      hl,($8ff4)
541a e3        ex      (sp),hl
541b cd0d45    call    $450d
541e d1        pop     de
541f c0        ret     nz

5420 2af48f    ld      hl,($8ff4)
5423 e5        push    hl
5424 c5        push    bc
5425 cdec54    call    $54ec
5428 d1        pop     de
5429 d1        pop     de
542a c9        ret     

542b cda98b    call    $8ba9
542e 210800    ld      hl,$0008
5431 39        add     hl,sp
5432 4e        ld      c,(hl)
5433 23        inc     hl
5434 46        ld      b,(hl)
5435 c5        push    bc
5436 cdf552    call    $52f5
5439 2af48f    ld      hl,($8ff4)
543c e3        ex      (sp),hl
543d cd2545    call    $4525
5440 d1        pop     de
5441 c0        ret     nz

5442 cda24a    call    $4aa2
5445 c0        ret     nz

5446 2af48f    ld      hl,($8ff4)
5449 e5        push    hl
544a c5        push    bc
544b cdec54    call    $54ec
544e d1        pop     de
544f d1        pop     de
5450 c9        ret     

5451 2af48f    ld      hl,($8ff4)
5454 e5        push    hl
5455 cdaa41    call    $41aa
5458 e5        push    hl
5459 cd8009    call    $0980
545c d1        pop     de
545d e3        ex      (sp),hl
545e cd6353    call    $5363
5461 d1        pop     de
5462 c9        ret     

5463 cda98b    call    $8ba9
5466 210800    ld      hl,$0008
5469 39        add     hl,sp
546a 7e        ld      a,(hl)
546b 23        inc     hl
546c b6        or      (hl)
546d 2805      jr      z,$5474
546f 2ab88f    ld      hl,($8fb8)
5472 1803      jr      $5477
5474 2aba8f    ld      hl,($8fba)
5477 22f48f    ld      ($8ff4),hl
547a c9        ret     

547b 2af48f    ld      hl,($8ff4)
547e 110100    ld      de,$0001
5481 c34885    jp      $8548
5484 cd7b53    call    $537b
5487 c8        ret     z

5488 cdb654    call    $54b6
548b c9        ret     

548c cda98b    call    $8ba9
548f cdab66    call    $66ab
5492 cde043    call    $43e0
5495 cd5744    call    $4457
5498 210100    ld      hl,$0001
549b 44        ld      b,h
549c 4d        ld      c,l
549d cde943    call    $43e9
54a0 2808      jr      z,$54aa
54a2 cd5744    call    $4457
54a5 03        inc     bc
54a6 60        ld      h,b
54a7 69        ld      l,c
54a8 18f3      jr      $549d
54aa 215b00    ld      hl,$005b
54ad e5        push    hl
54ae cd3f67    call    $673f
54b1 d1        pop     de
54b2 c5        push    bc
54b3 cdd52d    call    $2dd5
54b6 21bf53    ld      hl,$53bf
54b9 e3        ex      (sp),hl
54ba cd1c67    call    $671c
54bd d1        pop     de
54be c9        ret     

54bf 5d        ld      e,l
54c0 2000      jr      nz,$54c2
54c2 21d053    ld      hl,$53d0
54c5 e5        push    hl
54c6 212200    ld      hl,$0022
54c9 e5        push    hl
54ca cd1459    call    $5914
54cd d1        pop     de
54ce d1        pop     de
54cf c9        ret     

54d0 54        ld      d,h
54d1 75        ld      (hl),l
54d2 72        ld      (hl),d
54d3 74        ld      (hl),h
54d4 6c        ld      l,h
54d5 65        ld      h,l
54d6 206f      jr      nz,$5547
54d8 75        ld      (hl),l
54d9 74        ld      (hl),h
54da 206f      jr      nz,$554b
54dc 66        ld      h,(hl)
54dd 2062      jr      nz,$5541
54df 6f        ld      l,a
54e0 75        ld      (hl),l
54e1 6e        ld      l,(hl)
54e2 64        ld      h,h
54e3 73        ld      (hl),e
54e4 00        nop     
54e5 21f353    ld      hl,$53f3
54e8 e5        push    hl
54e9 212700    ld      hl,$0027
54ec e5        push    hl
54ed cd1459    call    $5914
54f0 d1        pop     de
54f1 d1        pop     de
54f2 c9        ret     

54f3 50        ld      d,b
54f4 72        ld      (hl),d
54f5 69        ld      l,c
54f6 6d        ld      l,l
54f7 69        ld      l,c
54f8 74        ld      (hl),h
54f9 69        ld      l,c
54fa 76        halt    
54fb 65        ld      h,l
54fc 206e      jr      nz,$556c
54fe 6f        ld      l,a
54ff 74        ld      (hl),h
5500 2069      jr      nz,$556b
5502 6d        ld      l,l
5503 70        ld      (hl),b
5504 6c        ld      l,h
5505 65        ld      h,l
5506 6d        ld      l,l
5507 65        ld      h,l
5508 6e        ld      l,(hl)
5509 74        ld      (hl),h
550a 65        ld      h,l
550b 64        ld      h,h
550c 00        nop     
550d 211b54    ld      hl,$541b
5510 e5        push    hl
5511 210200    ld      hl,$0002
5514 e5        push    hl
5515 cd1459    call    $5914
5518 d1        pop     de
5519 d1        pop     de
551a c9        ret     

551b 4e        ld      c,(hl)
551c 75        ld      (hl),l
551d 6d        ld      l,l
551e 62        ld      h,d
551f 65        ld      h,l
5520 72        ld      (hl),d
5521 2074      jr      nz,$5597
5523 6f        ld      l,a
5524 6f        ld      l,a
5525 2062      jr      nz,$5589
5527 69        ld      l,c
5528 67        ld      h,a
5529 00        nop     
552a cda98b    call    $8ba9
552d 210600    ld      hl,$0006
5530 e5        push    hl
5531 cd5630    call    $3056
5534 d1        pop     de
5535 210800    ld      hl,$0008
5538 39        add     hl,sp
5539 5e        ld      e,(hl)
553a 23        inc     hl
553b 56        ld      d,(hl)
553c d5        push    de
553d cd6341    call    $4163
5540 214b54    ld      hl,$544b
5543 e3        ex      (sp),hl
5544 cd4059    call    $5940
5547 d1        pop     de
5548 c33759    jp      $5937
554b 69        ld      l,c
554c 73        ld      (hl),e
554d 2061      jr      nz,$55b0
554f 2070      jr      nz,$55c1
5551 72        ld      (hl),d
5552 69        ld      l,c
5553 6d        ld      l,l
5554 69        ld      l,c
5555 74        ld      (hl),h
5556 69        ld      l,c
5557 76        halt    
5558 65        ld      h,l
5559 00        nop     
555a cda98b    call    $8ba9
555d 211d00    ld      hl,$001d
5560 e5        push    hl
5561 cd5630    call    $3056
5564 217b54    ld      hl,$547b
5567 e3        ex      (sp),hl
5568 cd4059    call    $5940
556b d1        pop     de
556c 210800    ld      hl,$0008
556f 39        add     hl,sp
5570 5e        ld      e,(hl)
5571 23        inc     hl
5572 56        ld      d,(hl)
5573 d5        push    de
5574 cd6341    call    $4163
5577 d1        pop     de
5578 c33759    jp      $5937
557b 4e        ld      c,(hl)
557c 6f        ld      l,a
557d 74        ld      (hl),h
557e 2065      jr      nz,$55e5
5580 6e        ld      l,(hl)
5581 6f        ld      l,a
5582 75        ld      (hl),l
5583 67        ld      h,a
5584 68        ld      l,b
5585 2069      jr      nz,$55f0
5587 6e        ld      l,(hl)
5588 70        ld      (hl),b
5589 75        ld      (hl),l
558a 74        ld      (hl),h
558b 73        ld      (hl),e
558c 2074      jr      nz,$5602
558e 6f        ld      l,a
558f 00        nop     
5590 2ae48f    ld      hl,($8fe4)
5593 cdf886    call    $86f8
5596 e5        push    hl
5597 cd5a54    call    $545a
559a d1        pop     de
559b c9        ret     

559c 21aa54    ld      hl,$54aa
559f e5        push    hl
55a0 212500    ld      hl,$0025
55a3 e5        push    hl
55a4 cd1459    call    $5914
55a7 d1        pop     de
55a8 d1        pop     de
55a9 c9        ret     

55aa 29        add     hl,hl
55ab 2077      jr      nz,$5624
55ad 69        ld      l,c
55ae 74        ld      (hl),h
55af 68        ld      l,b
55b0 6f        ld      l,a
55b1 75        ld      (hl),l
55b2 74        ld      (hl),h
55b3 2028      jr      nz,$55dd
55b5 00        nop     
55b6 212600    ld      hl,$0026
55b9 e5        push    hl
55ba cd5630    call    $3056
55bd 21cf54    ld      hl,$54cf
55c0 e3        ex      (sp),hl
55c1 cd4059    call    $5940
55c4 2af48f    ld      hl,($8ff4)
55c7 e3        ex      (sp),hl
55c8 cdef58    call    $58ef
55cb d1        pop     de
55cc c33759    jp      $5937
55cf 49        ld      c,c
55d0 2064      jr      nz,$5636
55d2 6f        ld      l,a
55d3 6e        ld      l,(hl)
55d4 27        daa     
55d5 74        ld      (hl),h
55d6 206b      jr      nz,$5643
55d8 6e        ld      l,(hl)
55d9 6f        ld      l,a
55da 77        ld      (hl),a
55db 2077      jr      nz,$5654
55dd 68        ld      l,b
55de 61        ld      h,c
55df 74        ld      (hl),h
55e0 2074      jr      nz,$5656
55e2 6f        ld      l,a
55e3 2064      jr      nz,$5649
55e5 6f        ld      l,a
55e6 2077      jr      nz,$565f
55e8 69        ld      l,c
55e9 74        ld      (hl),h
55ea 68        ld      l,b
55eb 00        nop     
55ec cda98b    call    $8ba9
55ef 212900    ld      hl,$0029
55f2 e5        push    hl
55f3 cd5630    call    $3056
55f6 d1        pop     de
55f7 210800    ld      hl,$0008
55fa 39        add     hl,sp
55fb 5e        ld      e,(hl)
55fc 23        inc     hl
55fd 56        ld      d,(hl)
55fe d5        push    de
55ff cd6341    call    $4163
5602 212555    ld      hl,$5525
5605 e3        ex      (sp),hl
5606 cd4059    call    $5940
5609 d1        pop     de
560a 210a00    ld      hl,$000a
560d 39        add     hl,sp
560e 5e        ld      e,(hl)
560f 23        inc     hl
5610 56        ld      d,(hl)
5611 d5        push    de
5612 cdef58    call    $58ef
5615 213255    ld      hl,$5532
5618 e3        ex      (sp),hl
5619 cd4059    call    $5940
561c 210400    ld      hl,$0004
561f e3        ex      (sp),hl
5620 cd5459    call    $5954
5623 d1        pop     de
5624 c9        ret     

5625 64        ld      h,h
5626 6f        ld      l,a
5627 65        ld      h,l
5628 73        ld      (hl),e
5629 6e        ld      l,(hl)
562a 27        daa     
562b 74        ld      (hl),h
562c 206c      jr      nz,$569a
562e 69        ld      l,c
562f 6b        ld      l,e
5630 65        ld      h,l
5631 00        nop     
5632 61        ld      h,c
5633 73        ld      (hl),e
5634 2069      jr      nz,$569f
5636 6e        ld      l,(hl)
5637 70        ld      (hl),b
5638 75        ld      (hl),l
5639 74        ld      (hl),h
563a 00        nop     
563b 2af48f    ld      hl,($8ff4)
563e e5        push    hl
563f 2ae48f    ld      hl,($8fe4)
5642 cdf886    call    $86f8
5645 e5        push    hl
5646 cdec54    call    $54ec
5649 d1        pop     de
564a d1        pop     de
564b c9        ret     

564c cda98b    call    $8ba9
564f 212a00    ld      hl,$002a
5652 e5        push    hl
5653 cd5630    call    $3056
5656 2ae68f    ld      hl,($8fe6)
5659 e3        ex      (sp),hl
565a cd6341    call    $4163
565d 217955    ld      hl,$5579
5660 e3        ex      (sp),hl
5661 cd4059    call    $5940
5664 d1        pop     de
5665 210800    ld      hl,$0008
5668 39        add     hl,sp
5669 5e        ld      e,(hl)
566a 23        inc     hl
566b 56        ld      d,(hl)
566c d5        push    de
566d cd6341    call    $4163
5670 210300    ld      hl,$0003
5673 e3        ex      (sp),hl
5674 cd5459    call    $5954
5677 d1        pop     de
5678 c9        ret     

5679 64        ld      h,h
567a 69        ld      l,c
567b 64        ld      h,h
567c 6e        ld      l,(hl)
567d 27        daa     
567e 74        ld      (hl),h
567f 206f      jr      nz,$56f0
5681 75        ld      (hl),l
5682 74        ld      (hl),h
5683 70        ld      (hl),b
5684 75        ld      (hl),l
5685 74        ld      (hl),h
5686 2074      jr      nz,$56fc
5688 6f        ld      l,a
5689 00        nop     
568a cda98b    call    $8ba9
568d 213100    ld      hl,$0031
5690 e5        push    hl
5691 cd5630    call    $3056
5694 d1        pop     de
5695 210800    ld      hl,$0008
5698 39        add     hl,sp
5699 5e        ld      e,(hl)
569a 23        inc     hl
569b 56        ld      d,(hl)
569c d5        push    de
569d cd4059    call    $5940
56a0 21ab55    ld      hl,$55ab
56a3 e3        ex      (sp),hl
56a4 cd4059    call    $5940
56a7 d1        pop     de
56a8 c33759    jp      $5937
56ab 69        ld      l,c
56ac 73        ld      (hl),e
56ad 6e        ld      l,(hl)
56ae 27        daa     
56af 74        ld      (hl),h
56b0 2061      jr      nz,$5713
56b2 2070      jr      nz,$5724
56b4 61        ld      h,c
56b5 72        ld      (hl),d
56b6 61        ld      h,c
56b7 6d        ld      l,l
56b8 65        ld      h,l
56b9 74        ld      (hl),h
56ba 65        ld      h,l
56bb 72        ld      (hl),d
56bc 00        nop     
56bd 210100    ld      hl,$0001
56c0 229d8c    ld      ($8c9d),hl
56c3 21d155    ld      hl,$55d1
56c6 e5        push    hl
56c7 211700    ld      hl,$0017
56ca e5        push    hl
56cb cd1459    call    $5914
56ce d1        pop     de
56cf d1        pop     de
56d0 c9        ret     

56d1 49        ld      c,c
56d2 27        daa     
56d3 6d        ld      l,l
56d4 206f      jr      nz,$5745
56d6 75        ld      (hl),l
56d7 74        ld      (hl),h
56d8 206f      jr      nz,$5749
56da 66        ld      h,(hl)
56db 2073      jr      nz,$5750
56dd 70        ld      (hl),b
56de 61        ld      h,c
56df 63        ld      h,e
56e0 65        ld      h,l
56e1 00        nop     
56e2 213200    ld      hl,$0032
56e5 e5        push    hl
56e6 cd5630    call    $3056
56e9 210b56    ld      hl,$560b
56ec e3        ex      (sp),hl
56ed cd4059    call    $5940
56f0 d1        pop     de
56f1 2ae48f    ld      hl,($8fe4)
56f4 cdf886    call    $86f8
56f7 e5        push    hl
56f8 cd6341    call    $4163
56fb 211356    ld      hl,$5613
56fe e3        ex      (sp),hl
56ff cd4059    call    $5940
5702 210300    ld      hl,$0003
5705 e3        ex      (sp),hl
5706 cd5459    call    $5954
5709 d1        pop     de
570a c9        ret     

570b 49        ld      c,c
570c 2063      jr      nz,$5771
570e 61        ld      h,c
570f 6e        ld      l,(hl)
5710 27        daa     
5711 74        ld      (hl),h
5712 00        nop     
5713 77        ld      (hl),a
5714 68        ld      l,b
5715 69        ld      l,c
5716 6c        ld      l,h
5717 65        ld      h,l
5718 206c      jr      nz,$5786
571a 6f        ld      l,a
571b 61        ld      h,c
571c 64        ld      h,h
571d 69        ld      l,c
571e 6e        ld      l,(hl)
571f 67        ld      h,a
5720 2061      jr      nz,$5783
5722 2066      jr      nz,$578a
5724 69        ld      l,c
5725 6c        ld      l,h
5726 65        ld      h,l
5727 00        nop     
5728 210800    ld      hl,$0008
572b e5        push    hl
572c cd5630    call    $3056
572f 215156    ld      hl,$5651
5732 e3        ex      (sp),hl
5733 cd4059    call    $5940
5736 d1        pop     de
5737 2ae48f    ld      hl,($8fe4)
573a cdf886    call    $86f8
573d e5        push    hl
573e cd6341    call    $4163
5741 215756    ld      hl,$5657
5744 e3        ex      (sp),hl
5745 cd4059    call    $5940
5748 210300    ld      hl,$0003
574b e3        ex      (sp),hl
574c cd5459    call    $5954
574f d1        pop     de
5750 c9        ret     

5751 43        ld      b,e
5752 61        ld      h,c
5753 6e        ld      l,(hl)
5754 27        daa     
5755 74        ld      (hl),h
5756 00        nop     
5757 66        ld      h,(hl)
5758 72        ld      (hl),d
5759 6f        ld      l,a
575a 6d        ld      l,l
575b 2074      jr      nz,$57d1
575d 68        ld      l,b
575e 65        ld      h,l
575f 2065      jr      nz,$57c6
5761 64        ld      h,h
5762 69        ld      l,c
5763 74        ld      (hl),h
5764 6f        ld      l,a
5765 72        ld      (hl),d
5766 00        nop     
5767 217556    ld      hl,$5675
576a e5        push    hl
576b 210d00    ld      hl,$000d
576e e5        push    hl
576f cd1459    call    $5914
5772 d1        pop     de
5773 d1        pop     de
5774 c9        ret     

5775 43        ld      b,e
5776 61        ld      h,c
5777 6e        ld      l,(hl)
5778 27        daa     
5779 74        ld      (hl),h
577a 2064      jr      nz,$57e0
577c 69        ld      l,c
577d 76        halt    
577e 69        ld      l,c
577f 64        ld      h,h
5780 65        ld      h,l
5781 2062      jr      nz,$57e5
5783 79        ld      a,c
5784 207a      jr      nz,$5800
5786 65        ld      h,l
5787 72        ld      (hl),d
5788 6f        ld      l,a
5789 00        nop     
578a cda98b    call    $8ba9
578d cdab66    call    $66ab
5790 21ac56    ld      hl,$56ac
5793 e5        push    hl
5794 cd0967    call    $6709
5797 d1        pop     de
5798 210800    ld      hl,$0008
579b 39        add     hl,sp
579c 5e        ld      e,(hl)
579d 23        inc     hl
579e 56        ld      d,(hl)
579f d5        push    de
57a0 cd1c67    call    $671c
57a3 210300    ld      hl,$0003
57a6 e3        ex      (sp),hl
57a7 cd6e77    call    $776e
57aa d1        pop     de
57ab c9        ret     

57ac 212121    ld      hl,$2121
57af 204c      jr      nz,$57fd
57b1 4f        ld      c,a
57b2 47        ld      b,a
57b3 4f        ld      c,a
57b4 2073      jr      nz,$5829
57b6 79        ld      a,c
57b7 73        ld      (hl),e
57b8 74        ld      (hl),h
57b9 65        ld      h,l
57ba 6d        ld      l,l
57bb 2062      jr      nz,$581f
57bd 75        ld      (hl),l
57be 67        ld      h,a
57bf 3a2000    ld      a,($0020)
57c2 21d056    ld      hl,$56d0
57c5 e5        push    hl
57c6 212d00    ld      hl,$002d
57c9 e5        push    hl
57ca cd1459    call    $5914
57cd d1        pop     de
57ce d1        pop     de
57cf c9        ret     

57d0 54        ld      d,h
57d1 68        ld      l,b
57d2 65        ld      h,l
57d3 2077      jr      nz,$584c
57d5 6f        ld      l,a
57d6 72        ld      (hl),d
57d7 64        ld      h,h
57d8 2069      jr      nz,$5843
57da 73        ld      (hl),e
57db 2074      jr      nz,$5851
57dd 6f        ld      l,a
57de 6f        ld      l,a
57df 206c      jr      nz,$584d
57e1 6f        ld      l,a
57e2 6e        ld      l,(hl)
57e3 67        ld      h,a
57e4 00        nop     
57e5 212000    ld      hl,$0020
57e8 e5        push    hl
57e9 cd5630    call    $3056
57ec 21fa56    ld      hl,$56fa
57ef e3        ex      (sp),hl
57f0 cd4059    call    $5940
57f3 d1        pop     de
57f4 cd2e43    call    $432e
57f7 c33759    jp      $5937
57fa 54        ld      d,h
57fb 6f        ld      l,a
57fc 6f        ld      l,a
57fd 2066      jr      nz,$5865
57ff 65        ld      h,l
5800 77        ld      (hl),a
5801 2069      jr      nz,$586c
5803 74        ld      (hl),h
5804 65        ld      h,l
5805 6d        ld      l,l
5806 73        ld      (hl),e
5807 2069      jr      nz,$5872
5809 6e        ld      l,(hl)
580a 00        nop     
580b 211900    ld      hl,$0019
580e e5        push    hl
580f cd5630    call    $3056
5812 2af48f    ld      hl,($8ff4)
5815 e3        ex      (sp),hl
5816 cdef58    call    $58ef
5819 212457    ld      hl,$5724
581c e3        ex      (sp),hl
581d cd4059    call    $5940
5820 d1        pop     de
5821 c33759    jp      $5937
5824 69        ld      l,c
5825 73        ld      (hl),e
5826 206e      jr      nz,$5896
5828 6f        ld      l,a
5829 74        ld      (hl),h
582a 2054      jr      nz,$5880
582c 52        ld      d,d
582d 55        ld      d,l
582e 45        ld      b,l
582f 206f      jr      nz,$58a0
5831 72        ld      (hl),d
5832 2046      jr      nz,$587a
5834 41        ld      b,c
5835 4c        ld      c,h
5836 53        ld      d,e
5837 45        ld      b,l
5838 00        nop     
5839 214757    ld      hl,$5747
583c e5        push    hl
583d 210b00    ld      hl,$000b
5840 e5        push    hl
5841 cd1459    call    $5914
5844 d1        pop     de
5845 d1        pop     de
5846 c9        ret     

5847 49        ld      c,c
5848 27        daa     
5849 6d        ld      l,l
584a 2068      jr      nz,$58b4
584c 61        ld      h,c
584d 76        halt    
584e 69        ld      l,c
584f 6e        ld      l,(hl)
5850 67        ld      h,a
5851 2074      jr      nz,$58c7
5853 72        ld      (hl),d
5854 6f        ld      l,a
5855 75        ld      (hl),l
5856 62        ld      h,d
5857 6c        ld      l,h
5858 65        ld      h,l
5859 2077      jr      nz,$58d2
585b 69        ld      l,c
585c 74        ld      (hl),h
585d 68        ld      l,b
585e 2074      jr      nz,$58d4
5860 68        ld      l,b
5861 65        ld      h,l
5862 2064      jr      nz,$58c8
5864 69        ld      l,c
5865 73        ld      (hl),e
5866 6b        ld      l,e
5867 00        nop     
5868 217657    ld      hl,$5776
586b e5        push    hl
586c 210c00    ld      hl,$000c
586f e5        push    hl
5870 cd1459    call    $5914
5873 d1        pop     de
5874 d1        pop     de
5875 c9        ret     

5876 44        ld      b,h
5877 69        ld      l,c
5878 73        ld      (hl),e
5879 6b        ld      l,e
587a 2069      jr      nz,$58e5
587c 73        ld      (hl),e
587d 2066      jr      nz,$58e5
587f 75        ld      (hl),l
5880 6c        ld      l,h
5881 6c        ld      l,h
5882 00        nop     
5883 219157    ld      hl,$5791
5886 e5        push    hl
5887 212e00    ld      hl,$002e
588a e5        push    hl
588b cd1459    call    $5914
588e d1        pop     de
588f d1        pop     de
5890 c9        ret     

5891 4d        ld      c,l
5892 79        ld      a,c
5893 2065      jr      nz,$58fa
5895 64        ld      h,h
5896 69        ld      l,c
5897 74        ld      (hl),h
5898 2062      jr      nz,$58fc
589a 75        ld      (hl),l
589b 66        ld      h,(hl)
589c 66        ld      h,(hl)
589d 65        ld      h,l
589e 72        ld      (hl),d
589f 2069      jr      nz,$590a
58a1 73        ld      (hl),e
58a2 2066      jr      nz,$590a
58a4 75        ld      (hl),l
58a5 6c        ld      l,h
58a6 6c        ld      l,h
58a7 00        nop     
58a8 21b657    ld      hl,$57b6
58ab e5        push    hl
58ac 210f00    ld      hl,$000f
58af e5        push    hl
58b0 cdbd58    call    $58bd
58b3 d1        pop     de
58b4 d1        pop     de
58b5 c9        ret     

58b6 61        ld      h,c
58b7 6c        ld      l,h
58b8 72        ld      (hl),d
58b9 65        ld      h,l
58ba 61        ld      h,c
58bb 64        ld      h,h
58bc 79        ld      a,c
58bd 2065      jr      nz,$5924
58bf 78        ld      a,b
58c0 69        ld      l,c
58c1 73        ld      (hl),e
58c2 74        ld      (hl),h
58c3 73        ld      (hl),e
58c4 00        nop     
58c5 21d357    ld      hl,$57d3
58c8 e5        push    hl
58c9 211100    ld      hl,$0011
58cc e5        push    hl
58cd cdbd58    call    $58bd
58d0 d1        pop     de
58d1 d1        pop     de
58d2 c9        ret     

58d3 6e        ld      l,(hl)
58d4 6f        ld      l,a
58d5 74        ld      (hl),h
58d6 2066      jr      nz,$593e
58d8 6f        ld      l,a
58d9 75        ld      (hl),l
58da 6e        ld      l,(hl)
58db 64        ld      h,h
58dc 00        nop     
58dd 21eb57    ld      hl,$57eb
58e0 e5        push    hl
58e1 212f00    ld      hl,$002f
58e4 e5        push    hl
58e5 cd1459    call    $5914
58e8 d1        pop     de
58e9 d1        pop     de
58ea c9        ret     

58eb 49        ld      c,c
58ec 66        ld      h,(hl)
58ed 2077      jr      nz,$5966
58ef 61        ld      h,c
58f0 6e        ld      l,(hl)
58f1 74        ld      (hl),h
58f2 73        ld      (hl),e
58f3 205b      jr      nz,$5950
58f5 205d      jr      nz,$5954
58f7 27        daa     
58f8 73        ld      (hl),e
58f9 2061      jr      nz,$595c
58fb 72        ld      (hl),d
58fc 6f        ld      l,a
58fd 75        ld      (hl),l
58fe 6e        ld      l,(hl)
58ff 64        ld      h,h
5900 2069      jr      nz,$596b
5902 6e        ld      l,(hl)
5903 73        ld      (hl),e
5904 74        ld      (hl),h
5905 72        ld      (hl),d
5906 75        ld      (hl),l
5907 63        ld      h,e
5908 74        ld      (hl),h
5909 69        ld      l,c
590a 6f        ld      l,a
590b 6e        ld      l,(hl)
590c 73        ld      (hl),e
590d 00        nop     
590e 212300    ld      hl,$0023
5911 e5        push    hl
5912 cd5630    call    $3056
5915 212758    ld      hl,$5827
5918 e3        ex      (sp),hl
5919 cd4059    call    $5940
591c 2af08f    ld      hl,($8ff0)
591f e3        ex      (sp),hl
5920 cd6341    call    $4163
5923 d1        pop     de
5924 c33759    jp      $5937
5927 49        ld      c,c
5928 2064      jr      nz,$598e
592a 6f        ld      l,a
592b 6e        ld      l,(hl)
592c 27        daa     
592d 74        ld      (hl),h
592e 206b      jr      nz,$599b
5930 6e        ld      l,(hl)
5931 6f        ld      l,a
5932 77        ld      (hl),a
5933 2068      jr      nz,$599d
5935 6f        ld      l,a
5936 77        ld      (hl),a
5937 2074      jr      nz,$59ad
5939 6f        ld      l,a
593a 00        nop     
593b cd0585    call    $8505
593e feff      cp      $ff
5940 212400    ld      hl,$0024
5943 e5        push    hl
5944 cd5630    call    $3056
5947 d1        pop     de
5948 210a00    ld      hl,$000a
594b 39        add     hl,sp
594c 5e        ld      e,(hl)
594d 23        inc     hl
594e 56        ld      d,(hl)
594f d5        push    de
5950 cd6341    call    $4163
5953 215e58    ld      hl,$585e
5956 e3        ex      (sp),hl
5957 cd4059    call    $5940
595a d1        pop     de
595b c33759    jp      $5937
595e 68        ld      l,b
595f 61        ld      h,c
5960 73        ld      (hl),e
5961 206e      jr      nz,$59d1
5963 6f        ld      l,a
5964 2076      jr      nz,$59dc
5966 61        ld      h,c
5967 6c        ld      l,h
5968 75        ld      (hl),l
5969 65        ld      h,l
596a 00        nop     
596b 211500    ld      hl,$0015
596e e5        push    hl
596f cd5630    call    $3056
5972 218058    ld      hl,$5880
5975 e3        ex      (sp),hl
5976 cd4059    call    $5940
5979 d1        pop     de
597a cd2e43    call    $432e
597d c33759    jp      $5937
5980 49        ld      c,c
5981 2063      jr      nz,$59e6
5983 61        ld      h,c
5984 6e        ld      l,(hl)
5985 27        daa     
5986 74        ld      (hl),h
5987 2066      jr      nz,$59ef
5989 69        ld      l,c
598a 6e        ld      l,(hl)
598b 64        ld      h,h
598c 2063      jr      nz,$59f1
598e 61        ld      h,c
598f 74        ld      (hl),h
5990 63        ld      h,e
5991 68        ld      l,b
5992 2066      jr      nz,$59fa
5994 6f        ld      l,a
5995 72        ld      (hl),d
5996 00        nop     
5997 210700    ld      hl,$0007
599a e5        push    hl
599b cd5630    call    $3056
599e 21ac58    ld      hl,$58ac
59a1 e3        ex      (sp),hl
59a2 cd4059    call    $5940
59a5 d1        pop     de
59a6 cd2e43    call    $432e
59a9 c33759    jp      $5937
59ac 43        ld      b,e
59ad 61        ld      h,c
59ae 6e        ld      l,(hl)
59af 27        daa     
59b0 74        ld      (hl),h
59b1 2066      jr      nz,$5a19
59b3 69        ld      l,c
59b4 6e        ld      l,(hl)
59b5 64        ld      h,h
59b6 206c      jr      nz,$5a24
59b8 61        ld      h,c
59b9 62        ld      h,d
59ba 65        ld      h,l
59bb 6c        ld      l,h
59bc 00        nop     
59bd cda98b    call    $8ba9
59c0 210800    ld      hl,$0008
59c3 39        add     hl,sp
59c4 5e        ld      e,(hl)
59c5 23        inc     hl
59c6 56        ld      d,(hl)
59c7 d5        push    de
59c8 cd5630    call    $3056
59cb 21ea58    ld      hl,$58ea
59ce e3        ex      (sp),hl
59cf cd4059    call    $5940
59d2 d1        pop     de
59d3 cd2e43    call    $432e
59d6 210a00    ld      hl,$000a
59d9 39        add     hl,sp
59da 5e        ld      e,(hl)
59db 23        inc     hl
59dc 56        ld      d,(hl)
59dd d5        push    de
59de cd4059    call    $5940
59e1 210300    ld      hl,$0003
59e4 e3        ex      (sp),hl
59e5 cd5459    call    $5954
59e8 d1        pop     de
59e9 c9        ret     

59ea 46        ld      b,(hl)
59eb 69        ld      l,c
59ec 6c        ld      l,h
59ed 65        ld      h,l
59ee 00        nop     
59ef cda98b    call    $8ba9
59f2 210800    ld      hl,$0008
59f5 39        add     hl,sp
59f6 4e        ld      c,(hl)
59f7 23        inc     hl
59f8 46        ld      b,(hl)
59f9 c5        push    bc
59fa cd0d45    call    $450d
59fd d1        pop     de
59fe 280c      jr      z,$5a0c
5a00 c5        push    bc
5a01 cd2c0a    call    $0a2c
5a04 d1        pop     de
5a05 2805      jr      z,$5a0c
5a07 2ad68f    ld      hl,($8fd6)
5a0a 1802      jr      $5a0e
5a0c 60        ld      h,b
5a0d 69        ld      l,c
5a0e e5        push    hl
5a0f cd6341    call    $4163
5a12 d1        pop     de
5a13 c9        ret     

5a14 cda98b    call    $8ba9
5a17 210800    ld      hl,$0008
5a1a 39        add     hl,sp
5a1b 5e        ld      e,(hl)
5a1c 23        inc     hl
5a1d 56        ld      d,(hl)
5a1e d5        push    de
5a1f cd5630    call    $3056
5a22 d1        pop     de
5a23 210a00    ld      hl,$000a
5a26 39        add     hl,sp
5a27 5e        ld      e,(hl)
5a28 23        inc     hl
5a29 56        ld      d,(hl)
5a2a d5        push    de
5a2b cd4059    call    $5940
5a2e 210100    ld      hl,$0001
5a31 e3        ex      (sp),hl
5a32 cd5459    call    $5954
5a35 d1        pop     de
5a36 c9        ret     

5a37 210200    ld      hl,$0002
5a3a e5        push    hl
5a3b cd5459    call    $5954
5a3e d1        pop     de
5a3f c9        ret     

5a40 cda98b    call    $8ba9
5a43 210800    ld      hl,$0008
5a46 39        add     hl,sp
5a47 5e        ld      e,(hl)
5a48 23        inc     hl
5a49 56        ld      d,(hl)
5a4a d5        push    de
5a4b cdde4b    call    $4bde
5a4e e3        ex      (sp),hl
5a4f cd6341    call    $4163
5a52 d1        pop     de
5a53 c9        ret     

5a54 cda98b    call    $8ba9
5a57 cd3d3c    call    $3c3d
5a5a cd443c    call    $3c44
5a5d 210000    ld      hl,$0000
5a60 220890    ld      ($9008),hl
5a63 cd7410    call    $1074
5a66 210800    ld      hl,$0008
5a69 39        add     hl,sp
5a6a 5e        ld      e,(hl)
5a6b 23        inc     hl
5a6c 56        ld      d,(hl)
5a6d d5        push    de
5a6e cd304c    call    $4c30
5a71 d1        pop     de
5a72 cd2e43    call    $432e
5a75 cde043    call    $43e0
5a78 22b78c    ld      ($8cb7),hl
5a7b e5        push    hl
5a7c cd6341    call    $4163
5a7f 2aec8f    ld      hl,($8fec)
5a82 22bb8c    ld      ($8cbb),hl
5a85 e3        ex      (sp),hl
5a86 cdb846    call    $46b8
5a89 e3        ex      (sp),hl
5a8a cd6341    call    $4163
5a8d 2ae48f    ld      hl,($8fe4)
5a90 e3        ex      (sp),hl
5a91 cdb846    call    $46b8
5a94 e3        ex      (sp),hl
5a95 cd6341    call    $4163
5a98 2aee8f    ld      hl,($8fee)
5a9b 22bf8c    ld      ($8cbf),hl
5a9e e3        ex      (sp),hl
5a9f cdb846    call    $46b8
5aa2 e3        ex      (sp),hl
5aa3 cd2c46    call    $462c
5aa6 e3        ex      (sp),hl
5aa7 cd6341    call    $4163
5aaa d1        pop     de
5aab cd6a42    call    $426a
5aae cd6a42    call    $426a
5ab1 cd6a42    call    $426a
5ab4 cd6a42    call    $426a
5ab7 cd6a42    call    $426a
5aba cdaa41    call    $41aa
5abd 22e28f    ld      ($8fe2),hl
5ac0 2ac48f    ld      hl,($8fc4)
5ac3 e5        push    hl
5ac4 2ad28f    ld      hl,($8fd2)
5ac7 e5        push    hl
5ac8 cd3447    call    $4734
5acb d1        pop     de
5acc d1        pop     de
5acd eb        ex      de,hl
5ace 2ab88f    ld      hl,($8fb8)
5ad1 cd3c85    call    $853c
5ad4 44        ld      b,h
5ad5 4d        ld      c,l
5ad6 7c        ld      a,h
5ad7 b5        or      l
5ad8 2803      jr      z,$5add
5ada cde601    call    $01e6
5add 2ade8f    ld      hl,($8fde)
5ae0 e5        push    hl
5ae1 cdc55a    call    $5ac5
5ae4 d1        pop     de
5ae5 2812      jr      z,$5af9
5ae7 cdaf43    call    $43af
5aea 210100    ld      hl,$0001
5aed e5        push    hl
5aee 21698c    ld      hl,$8c69
5af1 e5        push    hl
5af2 cd167c    call    $7c16
5af5 d1        pop     de
5af6 d1        pop     de
5af7 1807      jr      $5b00
5af9 78        ld      a,b
5afa b1        or      c
5afb 2003      jr      nz,$5b00
5afd cd645a    call    $5a64
5b00 c3035a    jp      $5a03
5b03 cd3141    call    $4131
5b06 2824      jr      z,$5b2c
5b08 2ae28f    ld      hl,($8fe2)
5b0b 7c        ld      a,h
5b0c b5        or      l
5b0d 2005      jr      nz,$5b14
5b0f 210100    ld      hl,$0001
5b12 180e      jr      $5b22
5b14 2ae28f    ld      hl,($8fe2)
5b17 cdf886    call    $86f8
5b1a e5        push    hl
5b1b cd9f45    call    $459f
5b1e d1        pop     de
5b1f cde681    call    $81e6
5b22 e5        push    hl
5b23 216d8c    ld      hl,$8c6d
5b26 e5        push    hl
5b27 cd167c    call    $7c16
5b2a d1        pop     de
5b2b d1        pop     de
5b2c 2ac28f    ld      hl,($8fc2)
5b2f e5        push    hl
5b30 cd455a    call    $5a45
5b33 d1        pop     de
5b34 cdaf43    call    $43af
5b37 210000    ld      hl,$0000
5b3a e5        push    hl
5b3b 21698c    ld      hl,$8c69
5b3e e5        push    hl
5b3f cd167c    call    $7c16
5b42 d1        pop     de
5b43 d1        pop     de
5b44 c9        ret     

5b45 cda98b    call    $8ba9
5b48 cd8d41    call    $418d
5b4b eb        ex      de,hl
5b4c 210800    ld      hl,$0008
5b4f 39        add     hl,sp
5b50 7e        ld      a,(hl)
5b51 23        inc     hl
5b52 66        ld      h,(hl)
5b53 6f        ld      l,a
5b54 cd4885    call    $8548
5b57 c8        ret     z

5b58 21615a    ld      hl,$5a61
5b5b e5        push    hl
5b5c cd8a56    call    $568a
5b5f d1        pop     de
5b60 c9        ret     

5b61 23        inc     hl
5b62 33        inc     sp
5b63 00        nop     
5b64 cd451f    call    $1f45
5b67 cdab66    call    $66ab
5b6a 2ae28f    ld      hl,($8fe2)
5b6d e5        push    hl
5b6e 210200    ld      hl,$0002
5b71 e5        push    hl
5b72 cd7346    call    $4673
5b75 d1        pop     de
5b76 e3        ex      (sp),hl
5b77 cdff45    call    $45ff
5b7a d1        pop     de
5b7b 2ab78c    ld      hl,($8cb7)
5b7e 7c        ld      a,h
5b7f b5        or      l
5b80 2831      jr      z,$5bb3
5b82 21bd5a    ld      hl,$5abd
5b85 e5        push    hl
5b86 cd1c67    call    $671c
5b89 2ab78c    ld      hl,($8cb7)
5b8c e3        ex      (sp),hl
5b8d cd3936    call    $3639
5b90 d1        pop     de
5b91 2abb8c    ld      hl,($8cbb)
5b94 7c        ld      a,h
5b95 b5        or      l
5b96 281b      jr      z,$5bb3
5b98 2abb8c    ld      hl,($8cbb)
5b9b cdf886    call    $86f8
5b9e 2813      jr      z,$5bb3
5ba0 21c25a    ld      hl,$5ac2
5ba3 e5        push    hl
5ba4 cd1c67    call    $671c
5ba7 d1        pop     de
5ba8 2abb8c    ld      hl,($8cbb)
5bab cdf886    call    $86f8
5bae e5        push    hl
5baf cdff45    call    $45ff
5bb2 d1        pop     de
5bb3 cdab66    call    $66ab
5bb6 210000    ld      hl,$0000
5bb9 22e28f    ld      ($8fe2),hl
5bbc c9        ret     

5bbd 2069      jr      nz,$5c28
5bbf 6e        ld      l,(hl)
5bc0 2000      jr      nz,$5bc2
5bc2 3a2000    ld      a,($0020)
5bc5 cda98b    call    $8ba9
5bc8 cd3141    call    $4131
5bcb 2058      jr      nz,$5c25
5bcd cd8d41    call    $418d
5bd0 44        ld      b,h
5bd1 4d        ld      c,l
5bd2 e5        push    hl
5bd3 cdd944    call    $44d9
5bd6 d1        pop     de
5bd7 280f      jr      z,$5be8
5bd9 60        ld      h,b
5bda 69        ld      l,c
5bdb eb        ex      de,hl
5bdc 2ac28f    ld      hl,($8fc2)
5bdf cd3c85    call    $853c
5be2 2804      jr      z,$5be8
5be4 210000    ld      hl,$0000
5be7 c9        ret     

5be8 60        ld      h,b
5be9 69        ld      l,c
5bea eb        ex      de,hl
5beb 2ac08f    ld      hl,($8fc0)
5bee cd3c85    call    $853c
5bf1 282d      jr      z,$5c20
5bf3 210500    ld      hl,$0005
5bf6 e5        push    hl
5bf7 cdfc42    call    $42fc
5bfa d1        pop     de
5bfb 222591    ld      ($9125),hl
5bfe eb        ex      de,hl
5bff 210800    ld      hl,$0008
5c02 39        add     hl,sp
5c03 7e        ld      a,(hl)
5c04 23        inc     hl
5c05 66        ld      h,(hl)
5c06 6f        ld      l,a
5c07 cd3c85    call    $853c
5c0a 2804      jr      z,$5c10
5c0c 210100    ld      hl,$0001
5c0f c9        ret     

5c10 2a2591    ld      hl,($9125)
5c13 eb        ex      de,hl
5c14 2ab88f    ld      hl,($8fb8)
5c17 cd3c85    call    $853c
5c1a 2804      jr      z,$5c20
5c1c 210100    ld      hl,$0001
5c1f c9        ret     

5c20 cd3741    call    $4137
5c23 18a3      jr      $5bc8
5c25 210000    ld      hl,$0000
5c28 c9        ret     

5c29 cda98b    call    $8ba9
5c2c cdc84c    call    $4cc8
5c2f cd371f    call    $1f37
5c32 cd406c    call    $6c40
5c35 210100    ld      hl,$0001
5c38 22d48c    ld      ($8cd4),hl
5c3b 22d28c    ld      ($8cd2),hl
5c3e 2a2e90    ld      hl,($902e)
5c41 22c18c    ld      ($8cc1),hl
5c44 210100    ld      hl,$0001
5c47 e5        push    hl
5c48 2a9a8f    ld      hl,($8f9a)
5c4b 2b        dec     hl
5c4c 229a8f    ld      ($8f9a),hl
5c4f 23        inc     hl
5c50 e5        push    hl
5c51 cd506c    call    $6c50
5c54 d1        pop     de
5c55 2a658c    ld      hl,($8c65)
5c58 e3        ex      (sp),hl
5c59 cd1c67    call    $671c
5c5c 210100    ld      hl,$0001
5c5f e3        ex      (sp),hl
5c60 2a9a8f    ld      hl,($8f9a)
5c63 2b        dec     hl
5c64 229a8f    ld      ($8f9a),hl
5c67 23        inc     hl
5c68 e5        push    hl
5c69 cd506c    call    $6c50
5c6c d1        pop     de
5c6d d1        pop     de
5c6e 210000    ld      hl,$0000
5c71 44        ld      b,h
5c72 4d        ld      c,l
5c73 180b      jr      $5c80
5c75 2a678c    ld      hl,($8c67)
5c78 5e        ld      e,(hl)
5c79 1600      ld      d,$00
5c7b d5        push    de
5c7c cd7d77    call    $777d
5c7f d1        pop     de
5c80 60        ld      h,b
5c81 69        ld      l,c
5c82 03        inc     bc
5c83 eb        ex      de,hl
5c84 2a988f    ld      hl,($8f98)
5c87 cd6c85    call    $856c
5c8a 2802      jr      z,$5c8e
5c8c 18e7      jr      $5c75
5c8e cd716c    call    $6c71
5c91 2a2e90    ld      hl,($902e)
5c94 e5        push    hl
5c95 cd025c    call    $5c02
5c98 d1        pop     de
5c99 c3525c    jp      $5c52
5c9c cda98b    call    $8ba9
5c9f 2108fe    ld      hl,$fe08
5ca2 39        add     hl,sp
5ca3 22c38c    ld      ($8cc3),hl
5ca6 eb        ex      de,hl
5ca7 2a2e90    ld      hl,($902e)
5caa cd3086    call    $8630
5cad 22d88c    ld      ($8cd8),hl
5cb0 110002    ld      de,$0200
5cb3 eb        ex      de,hl
5cb4 cd6c85    call    $856c
5cb7 2803      jr      z,$5cbc
5cb9 cd8357    call    $5783
5cbc 210000    ld      hl,$0000
5cbf e5        push    hl
5cc0 2ac38c    ld      hl,($8cc3)
5cc3 d1        pop     de
5cc4 73        ld      (hl),e
5cc5 c9        ret     

5cc6 210000    ld      hl,$0000
5cc9 e5        push    hl
5cca 215f8d    ld      hl,$8d5f
5ccd 22c38c    ld      ($8cc3),hl
5cd0 d1        pop     de
5cd1 73        ld      (hl),e
5cd2 210100    ld      hl,$0001
5cd5 22d68c    ld      ($8cd6),hl
5cd8 21da8c    ld      hl,$8cda
5cdb 22c18c    ld      ($8cc1),hl
5cde e5        push    hl
5cdf cd025c    call    $5c02
5ce2 d1        pop     de
5ce3 2a6e8e    ld      hl,($8e6e)
5ce6 7c        ld      a,h
5ce7 b5        or      l
5ce8 2808      jr      z,$5cf2
5cea 21da8c    ld      hl,$8cda
5ced e5        push    hl
5cee cd0578    call    $7805
5cf1 d1        pop     de
5cf2 21da8c    ld      hl,$8cda
5cf5 e5        push    hl
5cf6 21608d    ld      hl,$8d60
5cf9 e5        push    hl
5cfa cd887b    call    $7b88
5cfd d1        pop     de
5cfe d1        pop     de
5cff c3455c    jp      $5c45
5d02 cda98b    call    $8ba9
5d05 210800    ld      hl,$0008
5d08 39        add     hl,sp
5d09 4e        ld      c,(hl)
5d0a 23        inc     hl
5d0b 46        ld      b,(hl)
5d0c 2a6e8e    ld      hl,($8e6e)
5d0f 222791    ld      ($9127),hl
5d12 210000    ld      hl,$0000
5d15 226e8e    ld      ($8e6e),hl
5d18 cd725c    call    $5c72
5d1b 2ac38c    ld      hl,($8cc3)
5d1e 23        inc     hl
5d1f 22c38c    ld      ($8cc3),hl
5d22 2b        dec     hl
5d23 5e        ld      e,(hl)
5d24 1600      ld      d,$00
5d26 d5        push    de
5d27 60        ld      h,b
5d28 69        ld      l,c
5d29 03        inc     bc
5d2a d1        pop     de
5d2b 73        ld      (hl),e
5d2c 7a        ld      a,d
5d2d b3        or      e
5d2e 2802      jr      z,$5d32
5d30 18e9      jr      $5d1b
5d32 60        ld      h,b
5d33 69        ld      l,c
5d34 22c38c    ld      ($8cc3),hl
5d37 210000    ld      hl,$0000
5d3a 7d        ld      a,l
5d3b 32608d    ld      ($8d60),a
5d3e 2a2791    ld      hl,($9127)
5d41 226e8e    ld      ($8e6e),hl
5d44 c9        ret     

5d45 21cd8c    ld      hl,$8ccd
5d48 22c18c    ld      ($8cc1),hl
5d4b 210000    ld      hl,$0000
5d4e 22d68c    ld      ($8cd6),hl
5d51 c9        ret     

5d52 2a398c    ld      hl,($8c39)
5d55 229a8f    ld      ($8f9a),hl
5d58 210000    ld      hl,$0000
5d5b 22d48c    ld      ($8cd4),hl
5d5e c3406c    jp      $6c40
5d61 cda98b    call    $8ba9
5d64 2ad68c    ld      hl,($8cd6)
5d67 7c        ld      a,h
5d68 b5        or      l
5d69 2803      jr      z,$5d6e
5d6b cd9577    call    $7795
5d6e 2ad68c    ld      hl,($8cd6)
5d71 c9        ret     

5d72 cda98b    call    $8ba9
5d75 210000    ld      hl,$0000
5d78 22d08c    ld      ($8cd0),hl
5d7b 22ce8c    ld      ($8cce),hl
5d7e 210100    ld      hl,$0001
5d81 22908f    ld      ($8f90),hl
5d84 2a8c8f    ld      hl,($8f8c)
5d87 22928f    ld      ($8f92),hl
5d8a 2ad68c    ld      hl,($8cd6)
5d8d 7c        ld      a,h
5d8e b5        or      l
5d8f 201d      jr      nz,$5dae
5d91 2ab98c    ld      hl,($8cb9)
5d94 2b        dec     hl
5d95 e5        push    hl
5d96 210000    ld      hl,$0000
5d99 e5        push    hl
5d9a cd9761    call    $6197
5d9d d1        pop     de
5d9e d1        pop     de
5d9f cdde63    call    $63de
5da2 cd1362    call    $6213
5da5 2abd8c    ld      hl,($8cbd)
5da8 2b        dec     hl
5da9 e5        push    hl
5daa cd085f    call    $5f08
5dad d1        pop     de
5dae 21758c    ld      hl,$8c75
5db1 e5        push    hl
5db2 cd017c    call    $7c01
5db5 d1        pop     de
5db6 2803      jr      z,$5dbb
5db8 cd8069    call    $6980
5dbb cdde63    call    $63de
5dbe cd216a    call    $6a21
5dc1 2a788f    ld      hl,($8f78)
5dc4 c33f5e    jp      $5e3f
5dc7 cdca5e    call    $5eca
5dca c38b5e    jp      $5e8b
5dcd cd435f    call    $5f43
5dd0 c38b5e    jp      $5e8b
5dd3 cd615c    call    $5c61
5dd6 c28b5e    jp      nz,$5e8b
5dd9 c3925e    jp      $5e92
5ddc cd4d63    call    $634d
5ddf c28b5e    jp      nz,$5e8b
5de2 2ac58c    ld      hl,($8cc5)
5de5 23        inc     hl
5de6 22c58c    ld      ($8cc5),hl
5de9 cda35f    call    $5fa3
5dec c38b5e    jp      $5e8b
5def cddf5e    call    $5edf
5df2 c38b5e    jp      $5e8b
5df5 cda65e    call    $5ea6
5df8 c38b5e    jp      $5e8b
5dfb cd3d5f    call    $5f3d
5dfe c38b5e    jp      $5e8b
5e01 cde85e    call    $5ee8
5e04 c38b5e    jp      $5e8b
5e07 21608d    ld      hl,$8d60
5e0a 44        ld      b,h
5e0b 4d        ld      c,l
5e0c 210100    ld      hl,$0001
5e0f 222991    ld      ($9129),hl
5e12 cd7863    call    $6378
5e15 2034      jr      nz,$5e4b
5e17 2a2991    ld      hl,($9129)
5e1a 23        inc     hl
5e1b 222991    ld      ($9129),hl
5e1e 2b        dec     hl
5e1f 118600    ld      de,$0086
5e22 eb        ex      de,hl
5e23 cd5585    call    $8555
5e26 2810      jr      z,$5e38
5e28 cd9577    call    $7795
5e2b 210100    ld      hl,$0001
5e2e e5        push    hl
5e2f 21758c    ld      hl,$8c75
5e32 e5        push    hl
5e33 cd167c    call    $7c16
5e36 d1        pop     de
5e37 d1        pop     de
5e38 2ac58c    ld      hl,($8cc5)
5e3b 23        inc     hl
5e3c 22c58c    ld      ($8cc5),hl
5e3f 2b        dec     hl
5e40 5e        ld      e,(hl)
5e41 1600      ld      d,$00
5e43 d5        push    de
5e44 60        ld      h,b
5e45 69        ld      l,c
5e46 03        inc     bc
5e47 d1        pop     de
5e48 73        ld      (hl),e
5e49 18c7      jr      $5e12
5e4b 210000    ld      hl,$0000
5e4e eb        ex      de,hl
5e4f 60        ld      h,b
5e50 69        ld      l,c
5e51 73        ld      (hl),e
5e52 cda35f    call    $5fa3
5e55 c38b5e    jp      $5e8b
5e58 cd615c    call    $5c61
5e5b 2003      jr      nz,$5e60
5e5d cd1362    call    $6213
5e60 c38b5e    jp      $5e8b
5e63 2ad68c    ld      hl,($8cd6)
5e66 7c        ld      a,h
5e67 b5        or      l
5e68 2803      jr      z,$5e6d
5e6a c3925e    jp      $5e92
5e6d 210a00    ld      hl,$000a
5e70 e5        push    hl
5e71 cd2060    call    $6020
5e74 d1        pop     de
5e75 c38b5e    jp      $5e8b
5e78 2a8c8f    ld      hl,($8f8c)
5e7b e5        push    hl
5e7c cda160    call    $60a1
5e7f d1        pop     de
5e80 c38b5e    jp      $5e8b
5e83 cd615c    call    $5c61
5e86 200b      jr      nz,$5e93
5e88 210a00    ld      hl,$000a
5e8b e5        push    hl
5e8c cd2060    call    $6020
5e8f d1        pop     de
5e90 cd435f    call    $5f43
5e93 c38b5e    jp      $5e8b
5e96 cd6960    call    $6069
5e99 c38b5e    jp      $5e8b
5e9c 215c00    ld      hl,$005c
5e9f e5        push    hl
5ea0 cd2060    call    $6020
5ea3 d1        pop     de
5ea4 c38b5e    jp      $5e8b
5ea7 cd615c    call    $5c61
5eaa 200d      jr      nz,$5eb9
5eac 21ffff    ld      hl,$ffff
5eaf e5        push    hl
5eb0 210000    ld      hl,$0000
5eb3 e5        push    hl
5eb4 cd2862    call    $6228
5eb7 d1        pop     de
5eb8 d1        pop     de
5eb9 c38b5e    jp      $5e8b
5ebc cd615c    call    $5c61
5ebf 200d      jr      nz,$5ece
5ec1 21ffff    ld      hl,$ffff
5ec4 e5        push    hl
5ec5 210100    ld      hl,$0001
5ec8 e5        push    hl
5ec9 cd9761    call    $6197
5ecc d1        pop     de
5ecd d1        pop     de
5ece c38b5e    jp      $5e8b
5ed1 cd615c    call    $5c61
5ed4 2014      jr      nz,$5eea
5ed6 2a9a8f    ld      hl,($8f9a)
5ed9 eb        ex      de,hl
5eda 2a8e8f    ld      hl,($8f8e)
5edd cd3086    call    $8630
5ee0 e5        push    hl
5ee1 210100    ld      hl,$0001
5ee4 e5        push    hl
5ee5 cd9761    call    $6197
5ee8 d1        pop     de
5ee9 d1        pop     de
5eea c38b5e    jp      $5e8b
5eed cd615c    call    $5c61
5ef0 2013      jr      nz,$5f05
5ef2 2a8e8f    ld      hl,($8f8e)
5ef5 eb        ex      de,hl
5ef6 2a9a8f    ld      hl,($8f9a)
5ef9 19        add     hl,de
5efa 2b        dec     hl
5efb e5        push    hl
5efc 210000    ld      hl,$0000
5eff e5        push    hl
5f00 cd2862    call    $6228
5f03 d1        pop     de
5f04 d1        pop     de
5f05 c38b5e    jp      $5e8b
5f08 21608d    ld      hl,$8d60
5f0b 44        ld      b,h
5f0c 4d        ld      c,l
5f0d 180b      jr      $5f1a
5f0f 60        ld      h,b
5f10 69        ld      l,c
5f11 03        inc     bc
5f12 5e        ld      e,(hl)
5f13 1600      ld      d,$00
5f15 d5        push    de
5f16 cd2060    call    $6020
5f19 d1        pop     de
5f1a 60        ld      h,b
5f1b 69        ld      l,c
5f1c 7e        ld      a,(hl)
5f1d b7        or      a
5f1e 2802      jr      z,$5f22
5f20 18ed      jr      $5f0f
5f22 1867      jr      $5f8b
5f24 2a788f    ld      hl,($8f78)
5f27 110000    ld      de,$0000
5f2a eb        ex      de,hl
5f2b cd6d85    call    $856d
5f2e 280a      jr      z,$5f3a
5f30 2a788f    ld      hl,($8f78)
5f33 e5        push    hl
5f34 cd2060    call    $6020
5f37 d1        pop     de
5f38 1803      jr      $5f3d
5f3a cd9577    call    $7795
5f3d 184c      jr      $5f8b
5f3f 111b00    ld      de,$001b
5f42 19        add     hl,de
5f43 eb        ex      de,hl
5f44 21e5ff    ld      hl,$ffe5
5f47 19        add     hl,de
5f48 da245e    jp      c,$5e24
5f4b 21555e    ld      hl,$5e55
5f4e 19        add     hl,de
5f4f 19        add     hl,de
5f50 5e        ld      e,(hl)
5f51 23        inc     hl
5f52 56        ld      d,(hl)
5f53 eb        ex      de,hl
5f54 e9        jp      (hl)
5f55 fb        ei      
5f56 5c        ld      e,h
5f57 24        inc     h
5f58 5e        ld      e,(hl)
5f59 08        ex      af,af'
5f5a 5e        ld      e,(hl)
5f5b bc        cp      h
5f5c 5d        ld      e,l
5f5d 24        inc     h
5f5e 5e        ld      e,(hl)
5f5f d1        pop     de
5f60 5d        ld      e,l
5f61 ed5d      ret                      ; Undocumented

5f63 24        inc     h
5f64 5e        ld      e,(hl)
5f65 24        inc     h
5f66 5e        ld      e,(hl)
5f67 a7        and     a
5f68 5d        ld      e,l
5f69 9c        sbc     a,h
5f6a 5d        ld      e,l
5f6b 96        sub     (hl)
5f6c 5d        ld      e,l
5f6d 83        add     a,e
5f6e 5d        ld      e,l
5f6f 78        ld      a,b
5f70 5d        ld      e,l
5f71 63        ld      h,e
5f72 5d        ld      e,l
5f73 58        ld      e,b
5f74 5d        ld      e,l
5f75 07        rlca    
5f76 5d        ld      e,l
5f77 24        inc     h
5f78 5e        ld      e,(hl)
5f79 015dfb    ld      bc,$fb5d
5f7c 5c        ld      e,h
5f7d 24        inc     h
5f7e 5e        ld      e,(hl)
5f7f f5        push    af
5f80 5c        ld      e,h
5f81 ef        rst     $28
5f82 5c        ld      e,h
5f83 dc5cd3    call    c,$d35c
5f86 5c        ld      e,h
5f87 cd5cc7    call    $c75c
5f8a 5c        ld      e,h
5f8b cd8069    call    $6980
5f8e c3bb5c    jp      $5cbb
5f91 c9        ret     

5f92 cd8069    call    $6980
5f95 cdbe62    call    $62be
5f98 cd8463    call    $6384
5f9b 2803      jr      z,$5fa0
5f9d c3c066    jp      $66c0
5fa0 cd3763    call    $6337
5fa3 18f0      jr      $5f95
5fa5 c9        ret     

5fa6 cd4d63    call    $634d
5fa9 c0        ret     nz

5faa cd5763    call    $6357
5fad 2005      jr      nz,$5fb4
5faf cdce63    call    $63ce
5fb2 2805      jr      z,$5fb9
5fb4 cd9860    call    $6098
5fb7 1803      jr      $5fbc
5fb9 cd1861    call    $6118
5fbc cde563    call    $63e5
5fbf 2808      jr      z,$5fc9
5fc1 cd6c63    call    $636c
5fc4 2003      jr      nz,$5fc9
5fc6 cd9860    call    $6098
5fc9 c9        ret     

5fca cdbe62    call    $62be
5fcd 210000    ld      hl,$0000
5fd0 e5        push    hl
5fd1 cdad63    call    $63ad
5fd4 e3        ex      (sp),hl
5fd5 2a8e8f    ld      hl,($8f8e)
5fd8 e5        push    hl
5fd9 cd506c    call    $6c50
5fdc d1        pop     de
5fdd d1        pop     de
5fde c9        ret     

5fdf 21ffff    ld      hl,$ffff
5fe2 e5        push    hl
5fe3 cd085f    call    $5f08
5fe6 d1        pop     de
5fe7 c9        ret     

5fe8 cda98b    call    $8ba9
5feb cd6a69    call    $696a
5fee 44        ld      b,h
5fef 4d        ld      c,l
5ff0 1808      jr      $5ffa
5ff2 212000    ld      hl,$0020
5ff5 e5        push    hl
5ff6 cd2060    call    $6020
5ff9 d1        pop     de
5ffa 60        ld      h,b
5ffb 69        ld      l,c
5ffc 0b        dec     bc
5ffd 110000    ld      de,$0000
6000 eb        ex      de,hl
6001 cd6d85    call    $856d
6004 c8        ret     z

6005 18eb      jr      $5ff2
6007 c9        ret     

6008 cda98b    call    $8ba9
600b 210800    ld      hl,$0008
600e 39        add     hl,sp
600f e5        push    hl
6010 7e        ld      a,(hl)
6011 23        inc     hl
6012 66        ld      h,(hl)
6013 6f        ld      l,a
6014 2b        dec     hl
6015 eb        ex      de,hl
6016 e1        pop     hl
6017 73        ld      (hl),e
6018 23        inc     hl
6019 72        ld      (hl),d
601a eb        ex      de,hl
601b 23        inc     hl
601c 7c        ld      a,h
601d b5        or      l
601e 280f      jr      z,$602f
6020 cd4d63    call    $634d
6023 200a      jr      nz,$602f
6025 cd5763    call    $6357
6028 2005      jr      nz,$602f
602a cd3b61    call    $613b
602d 18dc      jr      $600b
602f 2a8c8f    ld      hl,($8f8c)
6032 e5        push    hl
6033 2a8e8f    ld      hl,($8f8e)
6036 e5        push    hl
6037 cd506c    call    $6c50
603a d1        pop     de
603b d1        pop     de
603c c9        ret     

603d cd435f    call    $5f43
6040 c3a35f    jp      $5fa3
6043 2ace8c    ld      hl,($8cce)
6046 7c        ld      a,h
6047 b5        or      l
6048 c8        ret     z

6049 2ad08c    ld      hl,($8cd0)
604c 7c        ld      a,h
604d b5        or      l
604e 280c      jr      z,$605c
6050 cdca62    call    $62ca
6053 210800    ld      hl,$0008
6056 e5        push    hl
6057 cd3f67    call    $673f
605a d1        pop     de
605b c9        ret     

605c cd8a63    call    $638a
605f 2818      jr      z,$6079
6061 cd8463    call    $6384
6064 280d      jr      z,$6073
6066 210100    ld      hl,$0001
6069 e5        push    hl
606a 21758c    ld      hl,$8c75
606d e5        push    hl
606e cd167c    call    $7c16
6071 d1        pop     de
6072 d1        pop     de
6073 cd1460    call    $6014
6076 c3df5e    jp      $5edf
6079 cd3763    call    $6337
607c cdca62    call    $62ca
607f cd6c63    call    $636c
6082 280f      jr      z,$6093
6084 21ffff    ld      hl,$ffff
6087 e5        push    hl
6088 cdad63    call    $63ad
608b d1        pop     de
608c eb        ex      de,hl
608d 2ad08c    ld      hl,($8cd0)
6090 19        add     hl,de
6091 1804      jr      $6097
6093 2a988f    ld      hl,($8f98)
6096 2b        dec     hl
6097 e5        push    hl
6098 2a8e8f    ld      hl,($8f8e)
609b 2b        dec     hl
609c e5        push    hl
609d cd506c    call    $6c50
60a0 d1        pop     de
60a1 d1        pop     de
60a2 c9        ret     

60a3 cd1164    call    $6411
60a6 2ac58c    ld      hl,($8cc5)
60a9 22c38c    ld      ($8cc3),hl
60ac c3af5f    jp      $5faf
60af 2ad08c    ld      hl,($8cd0)
60b2 7c        ld      a,h
60b3 b5        or      l
60b4 c0        ret     nz

60b5 cd7863    call    $6378
60b8 2859      jr      z,$6113
60ba cd8463    call    $6384
60bd 2054      jr      nz,$6113
60bf cd3763    call    $6337
60c2 2ac18c    ld      hl,($8cc1)
60c5 2b        dec     hl
60c6 5e        ld      e,(hl)
60c7 1600      ld      d,$00
60c9 210a00    ld      hl,$000a
60cc cd3c85    call    $853c
60cf 2805      jr      z,$60d6
60d1 cd0d63    call    $630d
60d4 183d      jr      $6113
60d6 cd8a63    call    $638a
60d9 280b      jr      z,$60e6
60db cdbe62    call    $62be
60de cd0264    call    $6402
60e1 cddf5e    call    $5edf
60e4 182d      jr      $6113
60e6 2ac58c    ld      hl,($8cc5)
60e9 7e        ld      a,(hl)
60ea b7        or      a
60eb 280a      jr      z,$60f7
60ed 2ac58c    ld      hl,($8cc5)
60f0 23        inc     hl
60f1 22c58c    ld      ($8cc5),hl
60f4 cd1164    call    $6411
60f7 2a988f    ld      hl,($8f98)
60fa e5        push    hl
60fb 2a8e8f    ld      hl,($8f8e)
60fe 2b        dec     hl
60ff e5        push    hl
6100 cd506c    call    $6c50
6103 d1        pop     de
6104 212000    ld      hl,$0020
6107 e3        ex      (sp),hl
6108 cd2769    call    $6927
610b 210800    ld      hl,$0008
610e e3        ex      (sp),hl
610f cd3f67    call    $673f
6112 d1        pop     de
6113 c9        ret     

6114 cdde63    call    $63de
6117 cd3763    call    $6337
611a cdbe62    call    $62be
611d c30264    jp      $6402
6120 cda98b    call    $8ba9
6123 210800    ld      hl,$0008
6126 39        add     hl,sp
6127 4e        ld      c,(hl)
6128 23        inc     hl
6129 46        ld      b,(hl)
612a cd6e62    call    $626e
612d cdce63    call    $63ce
6130 280d      jr      z,$613f
6132 60        ld      h,b
6133 69        ld      l,c
6134 110a00    ld      de,$000a
6137 cd4885    call    $8548
613a 2803      jr      z,$613f
613c cd9860    call    $6098
613f 60        ld      h,b
6140 69        ld      l,c
6141 e5        push    hl
6142 2ac38c    ld      hl,($8cc3)
6145 2b        dec     hl
6146 22c38c    ld      ($8cc3),hl
6149 d1        pop     de
614a 73        ld      (hl),e
614b cd0264    call    $6402
614e cdde63    call    $63de
6151 cdaf5f    call    $5faf
6154 60        ld      h,b
6155 69        ld      l,c
6156 110a00    ld      de,$000a
6159 cd3c85    call    $853c
615c 2805      jr      z,$6163
615e cd9860    call    $6098
6161 1803      jr      $6166
6163 cd1861    call    $6118
6166 c3de63    jp      $63de
6169 cda98b    call    $8ba9
616c 2a8c8f    ld      hl,($8f8c)
616f 44        ld      b,h
6170 4d        ld      c,l
6171 cdca5e    call    $5eca
6174 2ace8c    ld      hl,($8cce)
6177 7c        ld      a,h
6178 b5        or      l
6179 2817      jr      z,$6192
617b cd8a63    call    $638a
617e 2805      jr      z,$6185
6180 cd1460    call    $6014
6183 180d      jr      $6192
6185 cd3763    call    $6337
6188 2a8e8f    ld      hl,($8f8e)
618b 2b        dec     hl
618c 228e8f    ld      ($8f8e),hl
618f cdca5e    call    $5eca
6192 c5        push    bc
6193 cdef60    call    $60ef
6196 d1        pop     de
6197 c9        ret     

6198 210100    ld      hl,$0001
619b e5        push    hl
619c cda160    call    $60a1
619f d1        pop     de
61a0 c9        ret     

61a1 cda98b    call    $8ba9
61a4 cd4d63    call    $634d
61a7 c0        ret     nz

61a8 cddf5e    call    $5edf
61ab cdef63    call    $63ef
61ae 2827      jr      z,$61d7
61b0 cd4d63    call    $634d
61b3 2020      jr      nz,$61d5
61b5 cd1861    call    $6118
61b8 cd6c63    call    $636c
61bb 2018      jr      nz,$61d5
61bd cde563    call    $63e5
61c0 2811      jr      z,$61d3
61c2 212100    ld      hl,$0021
61c5 e5        push    hl
61c6 cd2769    call    $6927
61c9 210800    ld      hl,$0008
61cc e3        ex      (sp),hl
61cd cd3f67    call    $673f
61d0 d1        pop     de
61d1 1802      jr      $61d5
61d3 18db      jr      $61b0
61d5 1808      jr      $61df
61d7 cd4d63    call    $634d
61da 2003      jr      nz,$61df
61dc cd1861    call    $6118
61df cdca5e    call    $5eca
61e2 210800    ld      hl,$0008
61e5 39        add     hl,sp
61e6 5e        ld      e,(hl)
61e7 23        inc     hl
61e8 56        ld      d,(hl)
61e9 d5        push    de
61ea cdef60    call    $60ef
61ed d1        pop     de
61ee c9        ret     

61ef cda98b    call    $8ba9
61f2 210800    ld      hl,$0008
61f5 39        add     hl,sp
61f6 4e        ld      c,(hl)
61f7 23        inc     hl
61f8 46        ld      b,(hl)
61f9 2a8c8f    ld      hl,($8f8c)
61fc 50        ld      d,b
61fd 59        ld      e,c
61fe eb        ex      de,hl
61ff cd6c85    call    $856c
6202 280b      jr      z,$620f
6204 60        ld      h,b
6205 69        ld      l,c
6206 eb        ex      de,hl
6207 2a8c8f    ld      hl,($8f8c)
620a cd3086    call    $8630
620d 1803      jr      $6212
620f 210000    ld      hl,$0000
6212 e5        push    hl
6213 cd085f    call    $5f08
6216 d1        pop     de
6217 c9        ret     

6218 cda98b    call    $8ba9
621b cd5763    call    $6357
621e 2803      jr      z,$6223
6220 cd6e62    call    $626e
6223 2ac38c    ld      hl,($8cc3)
6226 23        inc     hl
6227 22c38c    ld      ($8cc3),hl
622a 2b        dec     hl
622b 5e        ld      e,(hl)
622c 1600      ld      d,$00
622e 42        ld      b,d
622f 4b        ld      c,e
6230 d5        push    de
6231 cd5361    call    $6153
6234 d1        pop     de
6235 c5        push    bc
6236 cd3f67    call    $673f
6239 d1        pop     de
623a c9        ret     

623b 2ac38c    ld      hl,($8cc3)
623e 23        inc     hl
623f 22c38c    ld      ($8cc3),hl
6242 2b        dec     hl
6243 5e        ld      e,(hl)
6244 1600      ld      d,$00
6246 d5        push    de
6247 cd5361    call    $6153
624a d1        pop     de
624b 2a8c8f    ld      hl,($8f8c)
624e 23        inc     hl
624f 228c8f    ld      ($8f8c),hl
6252 c9        ret     

6253 cda98b    call    $8ba9
6256 210800    ld      hl,$0008
6259 39        add     hl,sp
625a 4e        ld      c,(hl)
625b 23        inc     hl
625c 46        ld      b,(hl)
625d 60        ld      h,b
625e 69        ld      l,c
625f 110a00    ld      de,$000a
6262 cd4885    call    $8548
6265 2808      jr      z,$626f
6267 cde563    call    $63e5
626a 2803      jr      z,$626f
626c cd0d63    call    $630d
626f 2ad08c    ld      hl,($8cd0)
6272 23        inc     hl
6273 22d08c    ld      ($8cd0),hl
6276 2ace8c    ld      hl,($8cce)
6279 23        inc     hl
627a 22ce8c    ld      ($8cce),hl
627d 60        ld      h,b
627e 69        ld      l,c
627f e5        push    hl
6280 2ac18c    ld      hl,($8cc1)
6283 23        inc     hl
6284 22c18c    ld      ($8cc1),hl
6287 2b        dec     hl
6288 d1        pop     de
6289 73        ld      (hl),e
628a 60        ld      h,b
628b 69        ld      l,c
628c 110a00    ld      de,$000a
628f cd3c85    call    $853c
6292 c8        ret     z

6293 cd0d63    call    $630d
6296 c9        ret     

6297 cda98b    call    $8ba9
629a 210a00    ld      hl,$000a
629d 39        add     hl,sp
629e 4e        ld      c,(hl)
629f 23        inc     hl
62a0 46        ld      b,(hl)
62a1 78        ld      a,b
62a2 b1        or      c
62a3 2847      jr      z,$62ec
62a5 cd4d63    call    $634d
62a8 2042      jr      nz,$62ec
62aa cd8362    call    $6283
62ad 2805      jr      z,$62b4
62af cd9577    call    $7795
62b2 1838      jr      $62ec
62b4 cd6c63    call    $636c
62b7 201c      jr      nz,$62d5
62b9 210000    ld      hl,$0000
62bc e5        push    hl
62bd cdad63    call    $63ad
62c0 d1        pop     de
62c1 eb        ex      de,hl
62c2 2ad08c    ld      hl,($8cd0)
62c5 19        add     hl,de
62c6 eb        ex      de,hl
62c7 2a988f    ld      hl,($8f98)
62ca cd5585    call    $8555
62cd 2806      jr      z,$62d5
62cf 0b        dec     bc
62d0 60        ld      h,b
62d1 69        ld      l,c
62d2 cd0d63    call    $630d
62d5 cded62    call    $62ed
62d8 cd6c63    call    $636c
62db 2806      jr      z,$62e3
62dd 0b        dec     bc
62de 60        ld      h,b
62df 69        ld      l,c
62e0 cd0d63    call    $630d
62e3 2ac38c    ld      hl,($8cc3)
62e6 23        inc     hl
62e7 22c38c    ld      ($8cc3),hl
62ea 18b5      jr      $62a1
62ec cd4d63    call    $634d
62ef 2804      jr      z,$62f5
62f1 cd8463    call    $6384
62f4 c0        ret     nz

62f5 210800    ld      hl,$0008
62f8 39        add     hl,sp
62f9 7e        ld      a,(hl)
62fa 23        inc     hl
62fb b6        or      (hl)
62fc c8        ret     z

62fd cdbe62    call    $62be
6300 cd406c    call    $6c40
6303 cdf963    call    $63f9
6306 50        ld      d,b
6307 59        ld      e,c
6308 210000    ld      hl,$0000
630b cd6c85    call    $856c
630e c8        ret     z

630f cddf5e    call    $5edf
6312 c9        ret     

6313 2a9a8f    ld      hl,($8f9a)
6316 110200    ld      de,$0002
6319 eb        ex      de,hl
631a cd2285    call    $8522
631d e5        push    hl
631e 210100    ld      hl,$0001
6321 e5        push    hl
6322 cd2862    call    $6228
6325 d1        pop     de
6326 d1        pop     de
6327 c9        ret     

6328 cda98b    call    $8ba9
632b cdbe62    call    $62be
632e 210a00    ld      hl,$000a
6331 39        add     hl,sp
6332 e5        push    hl
6333 7e        ld      a,(hl)
6334 23        inc     hl
6335 66        ld      h,(hl)
6336 6f        ld      l,a
6337 2b        dec     hl
6338 eb        ex      de,hl
6339 e1        pop     hl
633a 73        ld      (hl),e
633b 23        inc     hl
633c 72        ld      (hl),d
633d 7a        ld      a,d
633e b3        or      e
633f 280d      jr      z,$634e
6341 cd8463    call    $6384
6344 2008      jr      nz,$634e
6346 cd3763    call    $6337
6349 cdbe62    call    $62be
634c 18e0      jr      $632e
634e cd406c    call    $6c40
6351 210800    ld      hl,$0008
6354 39        add     hl,sp
6355 7e        ld      a,(hl)
6356 23        inc     hl
6357 b6        or      (hl)
6358 2811      jr      z,$636b
635a 2ac38c    ld      hl,($8cc3)
635d eb        ex      de,hl
635e 2ac58c    ld      hl,($8cc5)
6361 cd4885    call    $8548
6364 2805      jr      z,$636b
6366 cda65e    call    $5ea6
6369 18ef      jr      $635a
636b c3f963    jp      $63f9
636e cd8362    call    $6283
6371 c8        ret     z

6372 cd9577    call    $7795
6375 210100    ld      hl,$0001
6378 e5        push    hl
6379 21758c    ld      hl,$8c75
637c e5        push    hl
637d cd167c    call    $7c16
6380 d1        pop     de
6381 d1        pop     de
6382 c9        ret     

6383 cda98b    call    $8ba9
6386 2ad68c    ld      hl,($8cd6)
6389 7c        ld      a,h
638a b5        or      l
638b 2805      jr      z,$6392
638d 210600    ld      hl,$0006
6390 1803      jr      $6395
6392 216400    ld      hl,$0064
6395 eb        ex      de,hl
6396 2a908f    ld      hl,($8f90)
6399 cd3086    call    $8630
639c 44        ld      b,h
639d 4d        ld      c,l
639e 110200    ld      de,$0002
63a1 eb        ex      de,hl
63a2 cd6c85    call    $856c
63a5 2805      jr      z,$63ac
63a7 210200    ld      hl,$0002
63aa 1802      jr      $63ae
63ac 60        ld      h,b
63ad 69        ld      l,c
63ae e5        push    hl
63af 2ac38c    ld      hl,($8cc3)
63b2 eb        ex      de,hl
63b3 2ac18c    ld      hl,($8cc1)
63b6 cd3086    call    $8630
63b9 d1        pop     de
63ba eb        ex      de,hl
63bb c36c85    jp      $856c
63be 2ad08c    ld      hl,($8cd0)
63c1 7c        ld      a,h
63c2 b5        or      l
63c3 c8        ret     z

63c4 cdca62    call    $62ca
63c7 18f5      jr      $63be
63c9 c9        ret     

63ca 2ace8c    ld      hl,($8cce)
63cd 2b        dec     hl
63ce 22ce8c    ld      ($8cce),hl
63d1 2ad08c    ld      hl,($8cd0)
63d4 2b        dec     hl
63d5 22d08c    ld      ($8cd0),hl
63d8 2ac18c    ld      hl,($8cc1)
63db 2b        dec     hl
63dc 22c18c    ld      ($8cc1),hl
63df 5e        ld      e,(hl)
63e0 1600      ld      d,$00
63e2 d5        push    de
63e3 2ac38c    ld      hl,($8cc3)
63e6 2b        dec     hl
63e7 22c38c    ld      ($8cc3),hl
63ea d1        pop     de
63eb 73        ld      (hl),e
63ec c9        ret     

63ed 2ad08c    ld      hl,($8cd0)
63f0 23        inc     hl
63f1 22d08c    ld      ($8cd0),hl
63f4 2ace8c    ld      hl,($8cce)
63f7 23        inc     hl
63f8 22ce8c    ld      ($8cce),hl
63fb 2ac38c    ld      hl,($8cc3)
63fe 5e        ld      e,(hl)
63ff 1600      ld      d,$00
6401 d5        push    de
6402 2ac18c    ld      hl,($8cc1)
6405 23        inc     hl
6406 22c18c    ld      ($8cc1),hl
6409 2b        dec     hl
640a d1        pop     de
640b 73        ld      (hl),e
640c c9        ret     

640d 2ad08c    ld      hl,($8cd0)
6410 e5        push    hl
6411 2ac18c    ld      hl,($8cc1)
6414 23        inc     hl
6415 22c18c    ld      ($8cc1),hl
6418 2b        dec     hl
6419 d1        pop     de
641a 73        ld      (hl),e
641b 210000    ld      hl,$0000
641e 22d08c    ld      ($8cd0),hl
6421 2a908f    ld      hl,($8f90)
6424 23        inc     hl
6425 22908f    ld      ($8f90),hl
6428 eb        ex      de,hl
6429 2a9a8f    ld      hl,($8f9a)
642c cd6d85    call    $856d
642f c8        ret     z

6430 210100    ld      hl,$0001
6433 22928f    ld      ($8f92),hl
6436 c9        ret     

6437 2a908f    ld      hl,($8f90)
643a 2b        dec     hl
643b 22908f    ld      ($8f90),hl
643e 2ac18c    ld      hl,($8cc1)
6441 2b        dec     hl
6442 22c18c    ld      ($8cc1),hl
6445 5e        ld      e,(hl)
6446 1600      ld      d,$00
6448 eb        ex      de,hl
6449 22d08c    ld      ($8cd0),hl
644c c9        ret     

644d 2ac38c    ld      hl,($8cc3)
6450 5e        ld      e,(hl)
6451 1600      ld      d,$00
6453 eb        ex      de,hl
6454 c3f685    jp      $85f6
6457 cda98b    call    $8ba9
645a cd6c63    call    $636c
645d 2009      jr      nz,$6468
645f cde563    call    $63e5
6462 2004      jr      nz,$6468
6464 210000    ld      hl,$0000
6467 c9        ret     

6468 210100    ld      hl,$0001
646b c9        ret     

646c 2ac38c    ld      hl,($8cc3)
646f 5e        ld      e,(hl)
6470 1600      ld      d,$00
6472 210a00    ld      hl,$000a
6475 c33c85    jp      $853c
6478 2ac58c    ld      hl,($8cc5)
647b 5e        ld      e,(hl)
647c 1600      ld      d,$00
647e d5        push    de
647f cd8b66    call    $668b
6482 d1        pop     de
6483 c9        ret     

6484 2ace8c    ld      hl,($8cce)
6487 c3f685    jp      $85f6
648a cda98b    call    $8ba9
648d 2a8e8f    ld      hl,($8f8e)
6490 110100    ld      de,$0001
6493 cd3c85    call    $853c
6496 2811      jr      z,$64a9
6498 210000    ld      hl,$0000
649b e5        push    hl
649c cdad63    call    $63ad
649f d1        pop     de
64a0 e5        push    hl
64a1 2a8c8f    ld      hl,($8f8c)
64a4 d1        pop     de
64a5 cd3c85    call    $853c
64a8 c9        ret     

64a9 210000    ld      hl,$0000
64ac c9        ret     

64ad cda98b    call    $8ba9
64b0 2a908f    ld      hl,($8f90)
64b3 eb        ex      de,hl
64b4 210800    ld      hl,$0008
64b7 39        add     hl,sp
64b8 7e        ld      a,(hl)
64b9 23        inc     hl
64ba 66        ld      h,(hl)
64bb 6f        ld      l,a
64bc 19        add     hl,de
64bd 110100    ld      de,$0001
64c0 eb        ex      de,hl
64c1 cd5685    call    $8556
64c4 2804      jr      z,$64ca
64c6 2a928f    ld      hl,($8f92)
64c9 c9        ret     

64ca 210100    ld      hl,$0001
64cd c9        ret     

64ce cda98b    call    $8ba9
64d1 cdef63    call    $63ef
64d4 2804      jr      z,$64da
64d6 cde563    call    $63e5
64d9 c9        ret     

64da 210000    ld      hl,$0000
64dd c9        ret     

64de 2ac38c    ld      hl,($8cc3)
64e1 22c58c    ld      ($8cc5),hl
64e4 c9        ret     

64e5 2a8c8f    ld      hl,($8f8c)
64e8 eb        ex      de,hl
64e9 2a988f    ld      hl,($8f98)
64ec c35585    jp      $8555
64ef 2a8e8f    ld      hl,($8f8e)
64f2 eb        ex      de,hl
64f3 2a9a8f    ld      hl,($8f9a)
64f6 c35585    jp      $8555
64f9 21cd8c    ld      hl,$8ccd
64fc 22c58c    ld      ($8cc5),hl
64ff c30264    jp      $6402
6502 2ac38c    ld      hl,($8cc3)
6505 22c98c    ld      ($8cc9),hl
6508 2ac58c    ld      hl,($8cc5)
650b 22c78c    ld      ($8cc7),hl
650e c32064    jp      $6420
6511 2ac58c    ld      hl,($8cc5)
6514 22c98c    ld      ($8cc9),hl
6517 2ac38c    ld      hl,($8cc3)
651a 22c78c    ld      ($8cc7),hl
651d c32064    jp      $6420
6520 2a8e8f    ld      hl,($8f8e)
6523 222b91    ld      ($912b),hl
6526 22948f    ld      ($8f94),hl
6529 2a8c8f    ld      hl,($8f8c)
652c 222d91    ld      ($912d),hl
652f cd4064    call    $6440
6532 2a2d91    ld      hl,($912d)
6535 e5        push    hl
6536 2a2b91    ld      hl,($912b)
6539 e5        push    hl
653a cd506c    call    $6c50
653d d1        pop     de
653e d1        pop     de
653f c9        ret     

6540 21718c    ld      hl,$8c71
6543 e5        push    hl
6544 cd017c    call    $7c01
6547 d1        pop     de
6548 c0        ret     nz

6549 2ac98c    ld      hl,($8cc9)
654c 7e        ld      a,(hl)
654d b7        or      a
654e 2833      jr      z,$6583
6550 2ac98c    ld      hl,($8cc9)
6553 eb        ex      de,hl
6554 2ac78c    ld      hl,($8cc7)
6557 cd3c85    call    $853c
655a 280b      jr      z,$6567
655c 2a8e8f    ld      hl,($8f8e)
655f eb        ex      de,hl
6560 2a948f    ld      hl,($8f94)
6563 cd3c85    call    $853c
6566 c0        ret     nz

6567 2ac78c    ld      hl,($8cc7)
656a 7e        ld      a,(hl)
656b b7        or      a
656c 2805      jr      z,$6573
656e cd1565    call    $6515
6571 1803      jr      $6576
6573 cd7a65    call    $657a
6576 2ac98c    ld      hl,($8cc9)
6579 5e        ld      e,(hl)
657a 1600      ld      d,$00
657c d5        push    de
657d cdd064    call    $64d0
6580 d1        pop     de
6581 1823      jr      $65a6
6583 2ac78c    ld      hl,($8cc7)
6586 7e        ld      a,(hl)
6587 b7        or      a
6588 c8        ret     z

6589 cd3166    call    $6631
658c cd1066    call    $6610
658f 280a      jr      z,$659b
6591 cd1c66    call    $661c
6594 2ac78c    ld      hl,($8cc7)
6597 23        inc     hl
6598 22c78c    ld      ($8cc7),hl
659b 210100    ld      hl,$0001
659e e5        push    hl
659f cdd064    call    $64d0
65a2 d1        pop     de
65a3 1801      jr      $65a6
65a5 c9        ret     

65a6 2ac98c    ld      hl,($8cc9)
65a9 7e        ld      a,(hl)
65aa b7        or      a
65ab 2813      jr      z,$65c0
65ad cd1066    call    $6610
65b0 280e      jr      z,$65c0
65b2 2ac78c    ld      hl,($8cc7)
65b5 23        inc     hl
65b6 22c78c    ld      ($8cc7),hl
65b9 2a948f    ld      hl,($8f94)
65bc 23        inc     hl
65bd 22948f    ld      ($8f94),hl
65c0 cd0466    call    $6604
65c3 2807      jr      z,$65cc
65c5 2ac98c    ld      hl,($8cc9)
65c8 23        inc     hl
65c9 22c98c    ld      ($8cc9),hl
65cc c34964    jp      $6449
65cf c9        ret     

65d0 cda98b    call    $8ba9
65d3 cde563    call    $63e5
65d6 2834      jr      z,$660c
65d8 cdec65    call    $65ec
65db 2822      jr      z,$65ff
65dd 212000    ld      hl,$0020
65e0 e5        push    hl
65e1 cd2769    call    $6927
65e4 d1        pop     de
65e5 210800    ld      hl,$0008
65e8 39        add     hl,sp
65e9 7e        ld      a,(hl)
65ea 23        inc     hl
65eb b6        or      (hl)
65ec 2008      jr      nz,$65f6
65ee cd1066    call    $6610
65f1 2803      jr      z,$65f6
65f3 c3843c    jp      $3c84
65f6 2a948f    ld      hl,($8f94)
65f9 23        inc     hl
65fa 22948f    ld      ($8f94),hl
65fd 1808      jr      $6607
65ff 212100    ld      hl,$0021
6602 e5        push    hl
6603 cd2769    call    $6927
6606 d1        pop     de
6607 cd1c66    call    $661c
660a 1808      jr      $6614
660c cd0466    call    $6604
660f 2803      jr      z,$6614
6611 cd1c66    call    $661c
6614 c9        ret     

6615 cda98b    call    $8ba9
6618 cdec65    call    $65ec
661b 2803      jr      z,$6620
661d c33166    jp      $6631
6620 cdf865    call    $65f8
6623 2803      jr      z,$6628
6625 c37a65    jp      $657a
6628 cd9565    call    $6595
662b 44        ld      b,h
662c 4d        ld      c,l
662d 110400    ld      de,$0004
6630 eb        ex      de,hl
6631 cd6d85    call    $856d
6634 2826      jr      z,$665c
6636 60        ld      h,b
6637 69        ld      l,c
6638 eb        ex      de,hl
6639 2ac78c    ld      hl,($8cc7)
663c 19        add     hl,de
663d 22c78c    ld      ($8cc7),hl
6640 60        ld      h,b
6641 69        ld      l,c
6642 eb        ex      de,hl
6643 2ac98c    ld      hl,($8cc9)
6646 19        add     hl,de
6647 22c98c    ld      ($8cc9),hl
664a 2a8c8f    ld      hl,($8f8c)
664d 50        ld      d,b
664e 59        ld      e,c
664f 19        add     hl,de
6650 e5        push    hl
6651 2a8e8f    ld      hl,($8f8e)
6654 e5        push    hl
6655 cd506c    call    $6c50
6658 d1        pop     de
6659 d1        pop     de
665a 181b      jr      $6677
665c cde563    call    $63e5
665f c0        ret     nz

6660 2ac98c    ld      hl,($8cc9)
6663 23        inc     hl
6664 22c98c    ld      ($8cc9),hl
6667 2b        dec     hl
6668 5e        ld      e,(hl)
6669 1600      ld      d,$00
666b d5        push    de
666c cd4b66    call    $664b
666f d1        pop     de
6670 2ac78c    ld      hl,($8cc7)
6673 23        inc     hl
6674 22c78c    ld      ($8cc7),hl
6677 189f      jr      $6618
6679 c9        ret     

667a cdec65    call    $65ec
667d c0        ret     nz

667e cde563    call    $63e5
6681 c0        ret     nz

6682 2ac98c    ld      hl,($8cc9)
6685 23        inc     hl
6686 22c98c    ld      ($8cc9),hl
6689 2b        dec     hl
668a 5e        ld      e,(hl)
668b 1600      ld      d,$00
668d d5        push    de
668e cd4b66    call    $664b
6691 d1        pop     de
6692 18e6      jr      $667a
6694 c9        ret     

6695 cda98b    call    $8ba9
6698 2ac98c    ld      hl,($8cc9)
669b 222f91    ld      ($912f),hl
669e 2ac78c    ld      hl,($8cc7)
66a1 223191    ld      ($9131),hl
66a4 210000    ld      hl,$0000
66a7 44        ld      b,h
66a8 4d        ld      c,l
66a9 1803      jr      $66ae
66ab 03        inc     bc
66ac 60        ld      h,b
66ad 69        ld      l,c
66ae 2a3191    ld      hl,($9131)
66b1 23        inc     hl
66b2 223191    ld      ($9131),hl
66b5 2b        dec     hl
66b6 5e        ld      e,(hl)
66b7 1600      ld      d,$00
66b9 d5        push    de
66ba 2a2f91    ld      hl,($912f)
66bd 5e        ld      e,(hl)
66be 1600      ld      d,$00
66c0 e1        pop     hl
66c1 cd3c85    call    $853c
66c4 2823      jr      z,$66e9
66c6 2a8c8f    ld      hl,($8f8c)
66c9 50        ld      d,b
66ca 59        ld      e,c
66cb 19        add     hl,de
66cc eb        ex      de,hl
66cd 2a988f    ld      hl,($8f98)
66d0 cd5585    call    $8555
66d3 2014      jr      nz,$66e9
66d5 2a2f91    ld      hl,($912f)
66d8 23        inc     hl
66d9 222f91    ld      ($912f),hl
66dc 2b        dec     hl
66dd 5e        ld      e,(hl)
66de 1600      ld      d,$00
66e0 d5        push    de
66e1 cd8b66    call    $668b
66e4 d1        pop     de
66e5 2002      jr      nz,$66e9
66e7 18c2      jr      $66ab
66e9 60        ld      h,b
66ea 69        ld      l,c
66eb c9        ret     

66ec 2ac98c    ld      hl,($8cc9)
66ef 5e        ld      e,(hl)
66f0 1600      ld      d,$00
66f2 d5        push    de
66f3 cd8b66    call    $668b
66f6 d1        pop     de
66f7 c9        ret     

66f8 2ac78c    ld      hl,($8cc7)
66fb 5e        ld      e,(hl)
66fc 1600      ld      d,$00
66fe d5        push    de
66ff cd8b66    call    $668b
6702 d1        pop     de
6703 c9        ret     

6704 2ac98c    ld      hl,($8cc9)
6707 5e        ld      e,(hl)
6708 1600      ld      d,$00
670a 210a00    ld      hl,$000a
670d c33c85    jp      $853c
6710 2ac78c    ld      hl,($8cc7)
6713 5e        ld      e,(hl)
6714 1600      ld      d,$00
6716 210a00    ld      hl,$000a
6719 c33c85    jp      $853c
671c cdef63    call    $63ef
671f 280d      jr      z,$672e
6721 210100    ld      hl,$0001
6724 e5        push    hl
6725 21718c    ld      hl,$8c71
6728 e5        push    hl
6729 cd167c    call    $7c16
672c d1        pop     de
672d d1        pop     de
672e c3c066    jp      $66c0
6731 cdf865    call    $65f8
6734 c0        ret     nz

6735 cde563    call    $63e5
6738 c0        ret     nz

6739 212000    ld      hl,$0020
673c e5        push    hl
673d cd4b66    call    $664b
6740 d1        pop     de
6741 2ac78c    ld      hl,($8cc7)
6744 23        inc     hl
6745 22c78c    ld      ($8cc7),hl
6748 18e7      jr      $6731
674a c9        ret     

674b cda98b    call    $8ba9
674e cdef63    call    $63ef
6751 2812      jr      z,$6765
6753 cde563    call    $63e5
6756 280d      jr      z,$6765
6758 210100    ld      hl,$0001
675b e5        push    hl
675c 21718c    ld      hl,$8c71
675f e5        push    hl
6760 cd167c    call    $7c16
6763 d1        pop     de
6764 d1        pop     de
6765 210800    ld      hl,$0008
6768 39        add     hl,sp
6769 5e        ld      e,(hl)
676a 1600      ld      d,$00
676c d5        push    de
676d cd3f67    call    $673f
6770 d1        pop     de
6771 c9        ret     

6772 2aa38c    ld      hl,($8ca3)
6775 23        inc     hl
6776 22a38c    ld      ($8ca3),hl
6779 111000    ld      de,$0010
677c eb        ex      de,hl
677d cd6d85    call    $856d
6780 c8        ret     z

6781 210000    ld      hl,$0000
6784 22a38c    ld      ($8ca3),hl
6787 cd9d69    call    $699d
678a c9        ret     

678b cda98b    call    $8ba9
678e 210800    ld      hl,$0008
6791 39        add     hl,sp
6792 4e        ld      c,(hl)
6793 23        inc     hl
6794 46        ld      b,(hl)
6795 60        ld      h,b
6796 69        ld      l,c
6797 110a00    ld      de,$000a
679a cd3c85    call    $853c
679d 2008      jr      nz,$67a7
679f 78        ld      a,b
67a0 b1        or      c
67a1 2804      jr      z,$67a7
67a3 210000    ld      hl,$0000
67a6 c9        ret     

67a7 210100    ld      hl,$0001
67aa c9        ret     

67ab 2a8c8f    ld      hl,($8f8c)
67ae 110100    ld      de,$0001
67b1 eb        ex      de,hl
67b2 cd6d85    call    $856d
67b5 c8        ret     z

67b6 cdc066    call    $66c0
67b9 c9        ret     

67ba cd3d3c    call    $3c3d
67bd c3ab66    jp      $66ab
67c0 210a00    ld      hl,$000a
67c3 e5        push    hl
67c4 cd3f67    call    $673f
67c7 d1        pop     de
67c8 c9        ret     

67c9 cda98b    call    $8ba9
67cc 210800    ld      hl,$0008
67cf 39        add     hl,sp
67d0 4e        ld      c,(hl)
67d1 23        inc     hl
67d2 46        ld      b,(hl)
67d3 2a6c8e    ld      hl,($8e6c)
67d6 7c        ld      a,h
67d7 b5        or      l
67d8 2829      jr      z,$6803
67da 2a7a8f    ld      hl,($8f7a)
67dd 23        inc     hl
67de 227a8f    ld      ($8f7a),hl
67e1 118600    ld      de,$0086
67e4 eb        ex      de,hl
67e5 cd5c86    call    $865c
67e8 2803      jr      z,$67ed
67ea cdc256    call    $56c2
67ed 60        ld      h,b
67ee 69        ld      l,c
67ef e5        push    hl
67f0 2a728f    ld      hl,($8f72)
67f3 d1        pop     de
67f4 73        ld      (hl),e
67f5 210000    ld      hl,$0000
67f8 e5        push    hl
67f9 2a728f    ld      hl,($8f72)
67fc 23        inc     hl
67fd 22728f    ld      ($8f72),hl
6800 d1        pop     de
6801 73        ld      (hl),e
6802 c9        ret     

6803 c5        push    bc
6804 cd3f67    call    $673f
6807 d1        pop     de
6808 c9        ret     

6809 cda98b    call    $8ba9
680c cd451f    call    $1f45
680f 210800    ld      hl,$0008
6812 39        add     hl,sp
6813 5e        ld      e,(hl)
6814 23        inc     hl
6815 56        ld      d,(hl)
6816 d5        push    de
6817 cd1c67    call    $671c
681a d1        pop     de
681b c9        ret     

681c cda98b    call    $8ba9
681f 210800    ld      hl,$0008
6822 39        add     hl,sp
6823 4e        ld      c,(hl)
6824 23        inc     hl
6825 46        ld      b,(hl)
6826 60        ld      h,b
6827 69        ld      l,c
6828 5e        ld      e,(hl)
6829 1600      ld      d,$00
682b d5        push    de
682c cd8b66    call    $668b
682f d1        pop     de
6830 c0        ret     nz

6831 60        ld      h,b
6832 69        ld      l,c
6833 03        inc     bc
6834 5e        ld      e,(hl)
6835 1600      ld      d,$00
6837 d5        push    de
6838 cdc966    call    $66c9
683b d1        pop     de
683c 18e8      jr      $6826
683e c9        ret     

683f cda98b    call    $8ba9
6842 210800    ld      hl,$0008
6845 39        add     hl,sp
6846 4e        ld      c,(hl)
6847 23        inc     hl
6848 46        ld      b,(hl)
6849 2afa8f    ld      hl,($8ffa)
684c 110200    ld      de,$0002
684f cd3c85    call    $853c
6852 282d      jr      z,$6881
6854 60        ld      h,b
6855 69        ld      l,c
6856 110a00    ld      de,$000a
6859 cd3c85    call    $853c
685c 2816      jr      z,$6874
685e cd843c    call    $3c84
6861 210d00    ld      hl,$000d
6864 e5        push    hl
6865 cd3321    call    $2133
6868 210a00    ld      hl,$000a
686b e3        ex      (sp),hl
686c cd3321    call    $2133
686f d1        pop     de
6870 cd8769    call    $6987
6873 c9        ret     

6874 2a8c8f    ld      hl,($8f8c)
6877 23        inc     hl
6878 228c8f    ld      ($8f8c),hl
687b c5        push    bc
687c cd3321    call    $2133
687f d1        pop     de
6880 c9        ret     

6881 cd343c    call    $3c34
6884 2878      jr      z,$68fe
6886 2ad88c    ld      hl,($8cd8)
6889 119cff    ld      de,$ff9c
688c 19        add     hl,de
688d e5        push    hl
688e 2ace8c    ld      hl,($8cce)
6891 23        inc     hl
6892 22ce8c    ld      ($8cce),hl
6895 2b        dec     hl
6896 d1        pop     de
6897 eb        ex      de,hl
6898 cd5585    call    $8555
689b 280d      jr      z,$68aa
689d 210100    ld      hl,$0001
68a0 e5        push    hl
68a1 21758c    ld      hl,$8c75
68a4 e5        push    hl
68a5 cd167c    call    $7c16
68a8 d1        pop     de
68a9 d1        pop     de
68aa 60        ld      h,b
68ab 69        ld      l,c
68ac 110900    ld      de,$0009
68af cd3c85    call    $853c
68b2 2809      jr      z,$68bd
68b4 cd6a69    call    $696a
68b7 e5        push    hl
68b8 cdb56b    call    $6bb5
68bb d1        pop     de
68bc c9        ret     

68bd 60        ld      h,b
68be 69        ld      l,c
68bf 110a00    ld      de,$000a
68c2 cd3c85    call    $853c
68c5 280c      jr      z,$68d3
68c7 2a908f    ld      hl,($8f90)
68ca 23        inc     hl
68cb 22908f    ld      ($8f90),hl
68ce cd843c    call    $3c84
68d1 181e      jr      $68f1
68d3 2a8c8f    ld      hl,($8f8c)
68d6 23        inc     hl
68d7 228c8f    ld      ($8f8c),hl
68da 2b        dec     hl
68db eb        ex      de,hl
68dc 2a988f    ld      hl,($8f98)
68df cd5585    call    $8555
68e2 280d      jr      z,$68f1
68e4 2a908f    ld      hl,($8f90)
68e7 23        inc     hl
68e8 22908f    ld      ($8f90),hl
68eb 210200    ld      hl,$0002
68ee 228c8f    ld      ($8f8c),hl
68f1 60        ld      h,b
68f2 69        ld      l,c
68f3 e5        push    hl
68f4 2acb8c    ld      hl,($8ccb)
68f7 23        inc     hl
68f8 22cb8c    ld      ($8ccb),hl
68fb d1        pop     de
68fc 73        ld      (hl),e
68fd c9        ret     

68fe c5        push    bc
68ff cd2768    call    $6827
6902 d1        pop     de
6903 cd8769    call    $6987
6906 2a788f    ld      hl,($8f78)
6909 11e9ff    ld      de,$ffe9
690c cd3c85    call    $853c
690f 2813      jr      z,$6924
6911 2a788f    ld      hl,($8f78)
6914 11e9ff    ld      de,$ffe9
6917 cd3c85    call    $853c
691a 2805      jr      z,$6921
691c cd8f69    call    $698f
691f 18f0      jr      $6911
6921 cd8069    call    $6980
6924 c3e36a    jp      $6ae3
6927 cda98b    call    $8ba9
692a 210800    ld      hl,$0008
692d 39        add     hl,sp
692e 4e        ld      c,(hl)
692f 23        inc     hl
6930 46        ld      b,(hl)
6931 2a6e8e    ld      hl,($8e6e)
6934 7c        ld      a,h
6935 b5        or      l
6936 2805      jr      z,$693d
6938 c5        push    bc
6939 cd3178    call    $7831
693c d1        pop     de
693d 60        ld      h,b
693e 69        ld      l,c
693f 110a00    ld      de,$000a
6942 cd3c85    call    $853c
6945 2839      jr      z,$6980
6947 2aa68f    ld      hl,($8fa6)
694a 7c        ld      a,h
694b b5        or      l
694c 2827      jr      z,$6975
694e 2ad68c    ld      hl,($8cd6)
6951 7c        ld      a,h
6952 b5        or      l
6953 2020      jr      nz,$6975
6955 cdfe69    call    $69fe
6958 281b      jr      z,$6975
695a 2aa68f    ld      hl,($8fa6)
695d 2b        dec     hl
695e 22a68f    ld      ($8fa6),hl
6961 7c        ld      a,h
6962 b5        or      l
6963 2010      jr      nz,$6975
6965 2a788f    ld      hl,($8f78)
6968 7c        ld      a,h
6969 b5        or      l
696a 2003      jr      nz,$696f
696c cd8f69    call    $698f
696f cd8069    call    $6980
6972 cd763c    call    $3c76
6975 cd843c    call    $3c84
6978 210d00    ld      hl,$000d
697b e5        push    hl
697c cd8668    call    $6886
697f d1        pop     de
6980 c5        push    bc
6981 cd8668    call    $6886
6984 d1        pop     de
6985 c9        ret     

6986 cda98b    call    $8ba9
6989 210800    ld      hl,$0008
698c 39        add     hl,sp
698d 4e        ld      c,(hl)
698e 23        inc     hl
698f 46        ld      b,(hl)
6990 60        ld      h,b
6991 69        ld      l,c
6992 110a00    ld      de,$000a
6995 cd3c85    call    $853c
6998 2824      jr      z,$69be
699a cdef63    call    $63ef
699d 280f      jr      z,$69ae
699f 2a9a8f    ld      hl,($8f9a)
69a2 e5        push    hl
69a3 cd241f    call    $1f24
69a6 e5        push    hl
69a7 cd8677    call    $7786
69aa d1        pop     de
69ab d1        pop     de
69ac 180e      jr      $69bc
69ae 2a8c8f    ld      hl,($8f8c)
69b1 e5        push    hl
69b2 2a8e8f    ld      hl,($8f8e)
69b5 23        inc     hl
69b6 e5        push    hl
69b7 cd506c    call    $6c50
69ba d1        pop     de
69bb d1        pop     de
69bc 1868      jr      $6a26
69be 60        ld      h,b
69bf 69        ld      l,c
69c0 110d00    ld      de,$000d
69c3 cd3c85    call    $853c
69c6 280f      jr      z,$69d7
69c8 210100    ld      hl,$0001
69cb e5        push    hl
69cc 2a8e8f    ld      hl,($8f8e)
69cf e5        push    hl
69d0 cd506c    call    $6c50
69d3 d1        pop     de
69d4 d1        pop     de
69d5 184f      jr      $6a26
69d7 60        ld      h,b
69d8 69        ld      l,c
69d9 110800    ld      de,$0008
69dc cd3c85    call    $853c
69df 281c      jr      z,$69fd
69e1 2a8c8f    ld      hl,($8f8c)
69e4 110100    ld      de,$0001
69e7 eb        ex      de,hl
69e8 cd6d85    call    $856d
69eb 280e      jr      z,$69fb
69ed 2a8c8f    ld      hl,($8f8c)
69f0 2b        dec     hl
69f1 e5        push    hl
69f2 2a8e8f    ld      hl,($8f8e)
69f5 e5        push    hl
69f6 cd506c    call    $6c50
69f9 d1        pop     de
69fa d1        pop     de
69fb 1829      jr      $6a26
69fd 60        ld      h,b
69fe 69        ld      l,c
69ff 110900    ld      de,$0009
6a02 cd3c85    call    $853c
6a05 280a      jr      z,$6a11
6a07 cd6a69    call    $696a
6a0a e5        push    hl
6a0b cdb56b    call    $6bb5
6a0e d1        pop     de
6a0f 1815      jr      $6a26
6a11 cde563    call    $63e5
6a14 280b      jr      z,$6a21
6a16 212100    ld      hl,$0021
6a19 e5        push    hl
6a1a cd2769    call    $6927
6a1d d1        pop     de
6a1e cdab66    call    $66ab
6a21 c5        push    bc
6a22 cd2769    call    $6927
6a25 d1        pop     de
6a26 c9        ret     

6a27 cda98b    call    $8ba9
6a2a 210800    ld      hl,$0008
6a2d 39        add     hl,sp
6a2e 5e        ld      e,(hl)
6a2f 23        inc     hl
6a30 56        ld      d,(hl)
6a31 d5        push    de
6a32 cd7d77    call    $777d
6a35 d1        pop     de
6a36 2a8c8f    ld      hl,($8f8c)
6a39 23        inc     hl
6a3a 228c8f    ld      ($8f8c),hl
6a3d c9        ret     

6a3e cda98b    call    $8ba9
6a41 210800    ld      hl,$0008
6a44 39        add     hl,sp
6a45 4e        ld      c,(hl)
6a46 23        inc     hl
6a47 46        ld      b,(hl)
6a48 c5        push    bc
6a49 cdad7b    call    $7bad
6a4c d1        pop     de
6a4d e5        push    hl
6a4e 2a988f    ld      hl,($8f98)
6a51 d1        pop     de
6a52 eb        ex      de,hl
6a53 cd3086    call    $8630
6a56 110200    ld      de,$0002
6a59 eb        ex      de,hl
6a5a cd2285    call    $8522
6a5d e5        push    hl
6a5e cdb56b    call    $6bb5
6a61 d1        pop     de
6a62 c5        push    bc
6a63 cd1c67    call    $671c
6a66 d1        pop     de
6a67 c3c066    jp      $66c0
6a6a 2a478c    ld      hl,($8c47)
6a6d 2b        dec     hl
6a6e e5        push    hl
6a6f 2a8c8f    ld      hl,($8f8c)
6a72 2b        dec     hl
6a73 d1        pop     de
6a74 cdfc84    call    $84fc
6a77 e5        push    hl
6a78 2a478c    ld      hl,($8c47)
6a7b d1        pop     de
6a7c eb        ex      de,hl
6a7d c33086    jp      $8630
6a80 210000    ld      hl,$0000
6a83 22788f    ld      ($8f78),hl
6a86 c9        ret     

6a87 cd7a77    call    $777a
6a8a c8        ret     z

6a8b cd8f69    call    $698f
6a8e c9        ret     

6a8f cd7777    call    $7777
6a92 e5        push    hl
6a93 cd476a    call    $6a47
6a96 d1        pop     de
6a97 22788f    ld      ($8f78),hl
6a9a c32c6b    jp      $6b2c
6a9d cd876a    call    $6a87
6aa0 2817      jr      z,$6ab9
6aa2 cdba66    call    $66ba
6aa5 21ca69    ld      hl,$69ca
6aa8 e5        push    hl
6aa9 cd0967    call    $6709
6aac 210100    ld      hl,$0001
6aaf e3        ex      (sp),hl
6ab0 216d8c    ld      hl,$8c6d
6ab3 e5        push    hl
6ab4 cd167c    call    $7c16
6ab7 d1        pop     de
6ab8 d1        pop     de
6ab9 cd8769    call    $6987
6abc cde369    call    $69e3
6abf 2806      jr      z,$6ac7
6ac1 cd8069    call    $6980
6ac4 c3e601    jp      $01e6
6ac7 c3e36a    jp      $6ae3
6aca 4f        ld      c,a
6acb 75        ld      (hl),l
6acc 74        ld      (hl),h
6acd 206f      jr      nz,$6b3e
6acf 66        ld      h,(hl)
6ad0 204c      jr      nz,$6b1e
6ad2 4f        ld      c,a
6ad3 47        ld      b,a
6ad4 4f        ld      c,a
6ad5 2073      jr      nz,$6b4a
6ad7 74        ld      (hl),h
6ad8 61        ld      h,c
6ad9 63        ld      h,e
6ada 6b        ld      l,e
6adb 2073      jr      nz,$6b50
6add 70        ld      (hl),b
6ade 61        ld      h,c
6adf 63        ld      h,e
6ae0 65        ld      h,l
6ae1 0a        ld      a,(bc)
6ae2 00        nop     
6ae3 cda98b    call    $8ba9
6ae6 2a788f    ld      hl,($8f78)
6ae9 11e6ff    ld      de,$ffe6
6aec cd3c85    call    $853c
6aef 2805      jr      z,$6af6
6af1 cdfe69    call    $69fe
6af4 2004      jr      nz,$6afa
6af6 210000    ld      hl,$0000
6af9 c9        ret     

6afa 210100    ld      hl,$0001
6afd c9        ret     

6afe cda98b    call    $8ba9
6b01 2aa28f    ld      hl,($8fa2)
6b04 7c        ld      a,h
6b05 b5        or      l
6b06 2013      jr      nz,$6b1b
6b08 2a0890    ld      hl,($9008)
6b0b 7c        ld      a,h
6b0c b5        or      l
6b0d 200c      jr      nz,$6b1b
6b0f 2ad48c    ld      hl,($8cd4)
6b12 7c        ld      a,h
6b13 b5        or      l
6b14 2005      jr      nz,$6b1b
6b16 210000    ld      hl,$0000
6b19 1803      jr      $6b1e
6b1b 210100    ld      hl,$0001
6b1e c3f685    jp      $85f6
6b21 2a788f    ld      hl,($8f78)
6b24 7c        ld      a,h
6b25 b5        or      l
6b26 2003      jr      nz,$6b2b
6b28 cd8f69    call    $698f
6b2b cde36a    call    $6ae3
6b2e 2802      jr      z,$6b32
6b30 18ef      jr      $6b21
6b32 cde369    call    $69e3
6b35 c8        ret     z

6b36 cd8069    call    $6980
6b39 210100    ld      hl,$0001
6b3c e5        push    hl
6b3d 21798c    ld      hl,$8c79
6b40 e5        push    hl
6b41 cd167c    call    $7c16
6b44 d1        pop     de
6b45 d1        pop     de
6b46 c9        ret     

6b47 cda98b    call    $8ba9
6b4a 21ffff    ld      hl,$ffff
6b4d 223391    ld      ($9133),hl
6b50 21bd8b    ld      hl,$8bbd
6b53 44        ld      b,h
6b54 4d        ld      c,l
6b55 1807      jr      $6b5e
6b57 2a3391    ld      hl,($9133)
6b5a 2b        dec     hl
6b5b 223391    ld      ($9133),hl
6b5e 60        ld      h,b
6b5f 69        ld      l,c
6b60 7e        ld      a,(hl)
6b61 b7        or      a
6b62 281a      jr      z,$6b7e
6b64 60        ld      h,b
6b65 69        ld      l,c
6b66 03        inc     bc
6b67 5e        ld      e,(hl)
6b68 1600      ld      d,$00
6b6a d5        push    de
6b6b 210a00    ld      hl,$000a
6b6e 39        add     hl,sp
6b6f 5e        ld      e,(hl)
6b70 23        inc     hl
6b71 56        ld      d,(hl)
6b72 e1        pop     hl
6b73 cd3c85    call    $853c
6b76 2804      jr      z,$6b7c
6b78 2a3391    ld      hl,($9133)
6b7b c9        ret     

6b7c 18d9      jr      $6b57
6b7e 210800    ld      hl,$0008
6b81 39        add     hl,sp
6b82 5e        ld      e,(hl)
6b83 23        inc     hl
6b84 56        ld      d,(hl)
6b85 eb        ex      de,hl
6b86 c9        ret     

6b87 cda98b    call    $8ba9
6b8a 2af88f    ld      hl,($8ff8)
6b8d 7c        ld      a,h
6b8e b5        or      l
6b8f 200c      jr      nz,$6b9d
6b91 2afa8f    ld      hl,($8ffa)
6b94 7c        ld      a,h
6b95 b5        or      l
6b96 2005      jr      nz,$6b9d
6b98 2a978c    ld      hl,($8c97)
6b9b 1828      jr      $6bc5
6b9d 2af88f    ld      hl,($8ff8)
6ba0 110200    ld      de,$0002
6ba3 cd3c85    call    $853c
6ba6 200b      jr      nz,$6bb3
6ba8 2afa8f    ld      hl,($8ffa)
6bab 110200    ld      de,$0002
6bae cd3c85    call    $853c
6bb1 280a      jr      z,$6bbd
6bb3 2a2e90    ld      hl,($902e)
6bb6 eb        ex      de,hl
6bb7 2a0490    ld      hl,($9004)
6bba 19        add     hl,de
6bbb 1808      jr      $6bc5
6bbd 2a2e90    ld      hl,($902e)
6bc0 eb        ex      de,hl
6bc1 2ad88c    ld      hl,($8cd8)
6bc4 19        add     hl,de
6bc5 44        ld      b,h
6bc6 4d        ld      c,l
6bc7 2188fd    ld      hl,$fd88
6bca 39        add     hl,sp
6bcb 50        ld      d,b
6bcc 59        ld      e,c
6bcd eb        ex      de,hl
6bce cd6686    call    $8666
6bd1 2806      jr      z,$6bd9
6bd3 210f00    ld      hl,$000f
6bd6 22a38c    ld      ($8ca3),hl
6bd9 2164ff    ld      hl,$ff64
6bdc 39        add     hl,sp
6bdd 50        ld      d,b
6bde 59        ld      e,c
6bdf eb        ex      de,hl
6be0 c36686    jp      $8666
6be3 cda98b    call    $8ba9
6be6 2ad48c    ld      hl,($8cd4)
6be9 7c        ld      a,h
6bea b5        or      l
6beb 2804      jr      z,$6bf1
6bed 210000    ld      hl,$0000
6bf0 c9        ret     

6bf1 2a788f    ld      hl,($8f78)
6bf4 11ecff    ld      de,$ffec
6bf7 cd3c85    call    $853c
6bfa 2805      jr      z,$6c01
6bfc cd011f    call    $1f01
6bff 1824      jr      $6c25
6c01 2a788f    ld      hl,($8f78)
6c04 11f4ff    ld      de,$fff4
6c07 cd3c85    call    $853c
6c0a 2805      jr      z,$6c11
6c0c cd111f    call    $1f11
6c0f 1814      jr      $6c25
6c11 2a788f    ld      hl,($8f78)
6c14 11edff    ld      de,$ffed
6c17 cd3c85    call    $853c
6c1a 2805      jr      z,$6c21
6c1c cde21e    call    $1ee2
6c1f 1804      jr      $6c25
6c21 210000    ld      hl,$0000
6c24 c9        ret     

6c25 cd8069    call    $6980
6c28 210100    ld      hl,$0001
6c2b c9        ret     

6c2c 2a788f    ld      hl,($8f78)
6c2f 11f9ff    ld      de,$fff9
6c32 cd3c85    call    $853c
6c35 c8        ret     z

6c36 cd8069    call    $6980
6c39 2a6e8e    ld      hl,($8e6e)
6c3c 7c        ld      a,h
6c3d b5        or      l
6c3e 280b      jr      z,$6c4b
6c40 cd9e77    call    $779e
6c43 2006      jr      nz,$6c4b
6c45 210000    ld      hl,$0000
6c48 226e8e    ld      ($8e6e),hl
6c4b 2ad48c    ld      hl,($8cd4)
6c4e 7c        ld      a,h
6c4f b5        or      l
6c50 2818      jr      z,$6c6a
6c52 2a908f    ld      hl,($8f90)
6c55 22b98c    ld      ($8cb9),hl
6c58 2a8c8f    ld      hl,($8f8c)
6c5b 22bd8c    ld      ($8cbd),hl
6c5e cd925e    call    $5e92
6c61 2ac38c    ld      hl,($8cc3)
6c64 22cb8c    ld      ($8ccb),hl
6c67 cd525c    call    $5c52
6c6a cd455c    call    $5c45
6c6d cd3d3c    call    $3c3d
6c70 21ac6b    ld      hl,$6bac
6c73 e5        push    hl
6c74 cde06b    call    $6be0
6c77 d1        pop     de
6c78 cd3141    call    $4131
6c7b 2021      jr      nz,$6c9e
6c7d cd8d41    call    $418d
6c80 eb        ex      de,hl
6c81 2ac28f    ld      hl,($8fc2)
6c84 cd3c85    call    $853c
6c87 2810      jr      z,$6c99
6c89 cdaf43    call    $43af
6c8c 210000    ld      hl,$0000
6c8f e5        push    hl
6c90 21698c    ld      hl,$8c69
6c93 e5        push    hl
6c94 cd167c    call    $7c16
6c97 d1        pop     de
6c98 d1        pop     de
6c99 cd3741    call    $4137
6c9c 18da      jr      $6c78
6c9e 210100    ld      hl,$0001
6ca1 e5        push    hl
6ca2 216d8c    ld      hl,$8c6d
6ca5 e5        push    hl
6ca6 cd167c    call    $7c16
6ca9 d1        pop     de
6caa d1        pop     de
6cab c9        ret     

6cac 53        ld      d,e
6cad 74        ld      (hl),h
6cae 6f        ld      l,a
6caf 70        ld      (hl),b
6cb0 70        ld      (hl),b
6cb1 65        ld      h,l
6cb2 64        ld      h,h
6cb3 2100cd    ld      hl,$cd00
6cb6 a9        xor     c
6cb7 8b        adc     a,e
6cb8 210800    ld      hl,$0008
6cbb 39        add     hl,sp
6cbc e5        push    hl
6cbd 7e        ld      a,(hl)
6cbe 23        inc     hl
6cbf 66        ld      h,(hl)
6cc0 6f        ld      l,a
6cc1 2b        dec     hl
6cc2 eb        ex      de,hl
6cc3 e1        pop     hl
6cc4 73        ld      (hl),e
6cc5 23        inc     hl
6cc6 72        ld      (hl),d
6cc7 eb        ex      de,hl
6cc8 23        inc     hl
6cc9 110000    ld      de,$0000
6ccc eb        ex      de,hl
6ccd cd6d85    call    $856d
6cd0 c8        ret     z

6cd1 cdd76b    call    $6bd7
6cd4 18e2      jr      $6cb8
6cd6 c9        ret     

6cd7 212000    ld      hl,$0020
6cda e5        push    hl
6cdb cdc966    call    $66c9
6cde d1        pop     de
6cdf c9        ret     

6ce0 cda98b    call    $8ba9
6ce3 cdab66    call    $66ab
6ce6 210800    ld      hl,$0008
6ce9 39        add     hl,sp
6cea 5e        ld      e,(hl)
6ceb 23        inc     hl
6cec 56        ld      d,(hl)
6ced d5        push    de
6cee cd0967    call    $6709
6cf1 d1        pop     de
6cf2 cde043    call    $43e0
6cf5 44        ld      b,h
6cf6 4d        ld      c,l
6cf7 7c        ld      a,h
6cf8 b5        or      l
6cf9 283a      jr      z,$6d35
6cfb 21386c    ld      hl,$6c38
6cfe e5        push    hl
6cff cd0967    call    $6709
6d02 d1        pop     de
6d03 c5        push    bc
6d04 cd3936    call    $3639
6d07 213d6c    ld      hl,$6c3d
6d0a e3        ex      (sp),hl
6d0b cd0967    call    $6709
6d0e d1        pop     de
6d0f 2aee8f    ld      hl,($8fee)
6d12 7c        ld      a,h
6d13 b5        or      l
6d14 280d      jr      z,$6d23
6d16 2aee8f    ld      hl,($8fee)
6d19 cdf886    call    $86f8
6d1c e5        push    hl
6d1d cd3936    call    $3639
6d20 d1        pop     de
6d21 1812      jr      $6d35
6d23 2aec8f    ld      hl,($8fec)
6d26 7c        ld      a,h
6d27 b5        or      l
6d28 280b      jr      z,$6d35
6d2a 2aec8f    ld      hl,($8fec)
6d2d cdf886    call    $86f8
6d30 e5        push    hl
6d31 cd3936    call    $3639
6d34 d1        pop     de
6d35 c3ab66    jp      $66ab
6d38 2069      jr      nz,$6da3
6d3a 6e        ld      l,(hl)
6d3b 2000      jr      nz,$6d3d
6d3d 3a2000    ld      a,($0020)
6d40 2a9a8f    ld      hl,($8f9a)
6d43 e5        push    hl
6d44 cd241f    call    $1f24
6d47 e5        push    hl
6d48 cd8077    call    $7780
6d4b d1        pop     de
6d4c d1        pop     de
6d4d c3716c    jp      $6c71
6d50 cda98b    call    $8ba9
6d53 210800    ld      hl,$0008
6d56 39        add     hl,sp
6d57 5e        ld      e,(hl)
6d58 23        inc     hl
6d59 56        ld      d,(hl)
6d5a eb        ex      de,hl
6d5b 228e8f    ld      ($8f8e),hl
6d5e e5        push    hl
6d5f 210c00    ld      hl,$000c
6d62 39        add     hl,sp
6d63 5e        ld      e,(hl)
6d64 23        inc     hl
6d65 56        ld      d,(hl)
6d66 eb        ex      de,hl
6d67 228c8f    ld      ($8f8c),hl
6d6a e5        push    hl
6d6b cd8377    call    $7783
6d6e d1        pop     de
6d6f d1        pop     de
6d70 c9        ret     

6d71 210100    ld      hl,$0001
6d74 e5        push    hl
6d75 cd241f    call    $1f24
6d78 e5        push    hl
6d79 cd506c    call    $6c50
6d7c d1        pop     de
6d7d d1        pop     de
6d7e c9        ret     

6d7f c5        push    bc
6d80 210400    ld      hl,$0004
6d83 39        add     hl,sp
6d84 4e        ld      c,(hl)
6d85 23        inc     hl
6d86 23        inc     hl
6d87 7e        ld      a,(hl)
6d88 ed79      out     (c),a
6d8a c1        pop     bc
6d8b c9        ret     

6d8c c5        push    bc
6d8d 210400    ld      hl,$0004
6d90 39        add     hl,sp
6d91 4e        ld      c,(hl)
6d92 ed68      in      l,(c)
6d94 2600      ld      h,$00
6d96 c1        pop     bc
6d97 c9        ret     

6d98 210000    ld      hl,$0000
6d9b 228191    ld      ($9181),hl
6d9e 227d91    ld      ($917d),hl
6da1 2a518c    ld      hl,($8c51)
6da4 2b        dec     hl
6da5 227f91    ld      ($917f),hl
6da8 2a518c    ld      hl,($8c51)
6dab 228591    ld      ($9185),hl
6dae cdec85    call    $85ec
6db1 228791    ld      ($9187),hl
6db4 2a518c    ld      hl,($8c51)
6db7 110100    ld      de,$0001
6dba eb        ex      de,hl
6dbb cd0686    call    $8606
6dbe 228d91    ld      ($918d),hl
6dc1 2a538c    ld      hl,($8c53)
6dc4 229591    ld      ($9195),hl
6dc7 2b        dec     hl
6dc8 110100    ld      de,$0001
6dcb eb        ex      de,hl
6dcc cd0686    call    $8606
6dcf 228f91    ld      ($918f),hl
6dd2 c36b77    jp      $776b
6dd5 cd5d6d    call    $6d5d
6dd8 110100    ld      de,$0001
6ddb cd3c85    call    $853c
6dde 2805      jr      z,$6de5
6de0 cd736d    call    $6d73
6de3 1803      jr      $6de8
6de5 210000    ld      hl,$0000
6de8 e5        push    hl
6de9 cd7477    call    $7774
6dec d1        pop     de
6ded 2a598c    ld      hl,($8c59)
6df0 7c        ld      a,h
6df1 b5        or      l
6df2 2029      jr      nz,$6e1d
6df4 cdd671    call    $71d6
6df7 cd5d6d    call    $6d5d
6dfa 110100    ld      de,$0001
6dfd cd3c85    call    $853c
6e00 2815      jr      z,$6e17
6e02 2a538c    ld      hl,($8c53)
6e05 eb        ex      de,hl
6e06 2a3d8c    ld      hl,($8c3d)
6e09 cd2285    call    $8522
6e0c e5        push    hl
6e0d cd736d    call    $6d73
6e10 2b        dec     hl
6e11 d1        pop     de
6e12 cdd485    call    $85d4
6e15 1803      jr      $6e1a
6e17 2a538c    ld      hl,($8c53)
6e1a 229591    ld      ($9195),hl
6e1d 2a9591    ld      hl,($9195)
6e20 2b        dec     hl
6e21 228391    ld      ($9183),hl
6e24 2a9591    ld      hl,($9195)
6e27 228991    ld      ($9189),hl
6e2a cdec85    call    $85ec
6e2d 228b91    ld      ($918b),hl
6e30 2a598c    ld      hl,($8c59)
6e33 7c        ld      a,h
6e34 b5        or      l
6e35 c0        ret     nz

6e36 cd5c76    call    $765c
6e39 2803      jr      z,$6e3e
6e3b cd9c70    call    $709c
6e3e cdd671    call    $71d6
6e41 c9        ret     

6e42 210000    ld      hl,$0000
6e45 227b91    ld      ($917b),hl
6e48 c3d56c    jp      $6cd5
6e4b 210100    ld      hl,$0001
6e4e 227b91    ld      ($917b),hl
6e51 c3d56c    jp      $6cd5
6e54 210200    ld      hl,$0002
6e57 227b91    ld      ($917b),hl
6e5a c37177    jp      $7771
6e5d cda98b    call    $8ba9
6e60 2a7b91    ld      hl,($917b)
6e63 c9        ret     

6e64 cda98b    call    $8ba9
6e67 210800    ld      hl,$0008
6e6a 39        add     hl,sp
6e6b 5e        ld      e,(hl)
6e6c 23        inc     hl
6e6d 56        ld      d,(hl)
6e6e eb        ex      de,hl
6e6f 227991    ld      ($9179),hl
6e72 c9        ret     

6e73 cda98b    call    $8ba9
6e76 2a7991    ld      hl,($9179)
6e79 c9        ret     

6e7a cda98b    call    $8ba9
6e7d 2a7791    ld      hl,($9177)
6e80 c9        ret     

6e81 cda98b    call    $8ba9
6e84 cdd671    call    $71d6
6e87 210800    ld      hl,$0008
6e8a 39        add     hl,sp
6e8b 5e        ld      e,(hl)
6e8c 23        inc     hl
6e8d 56        ld      d,(hl)
6e8e eb        ex      de,hl
6e8f 227791    ld      ($9177),hl
6e92 e5        push    hl
6e93 cd8f77    call    $778f
6e96 d1        pop     de
6e97 c3d671    jp      $71d6
6e9a 210100    ld      hl,$0001
6e9d 7d        ld      a,l
6e9e 327491    ld      ($9174),a
6ea1 cdfe6d    call    $6dfe
6ea4 7d        ld      a,l
6ea5 327391    ld      ($9173),a
6ea8 c9        ret     

6ea9 210000    ld      hl,$0000
6eac 7d        ld      a,l
6ead 327491    ld      ($9174),a
6eb0 c9        ret     

6eb1 210300    ld      hl,$0003
6eb4 7d        ld      a,l
6eb5 327491    ld      ($9174),a
6eb8 cd7a6d    call    $6d7a
6ebb 7d        ld      a,l
6ebc 327391    ld      ($9173),a
6ebf c9        ret     

6ec0 210200    ld      hl,$0002
6ec3 7d        ld      a,l
6ec4 327491    ld      ($9174),a
6ec7 cdfe6d    call    $6dfe
6eca 7d        ld      a,l
6ecb 327391    ld      ($9173),a
6ece c9        ret     

6ecf cda98b    call    $8ba9
6ed2 2a7491    ld      hl,($9174)
6ed5 2600      ld      h,$00
6ed7 c9        ret     

6ed8 cda98b    call    $8ba9
6edb cdd671    call    $71d6
6ede 210800    ld      hl,$0008
6ee1 39        add     hl,sp
6ee2 5e        ld      e,(hl)
6ee3 23        inc     hl
6ee4 56        ld      d,(hl)
6ee5 eb        ex      de,hl
6ee6 227591    ld      ($9175),hl
6ee9 cdd671    call    $71d6
6eec cdcf6d    call    $6dcf
6eef 110300    ld      de,$0003
6ef2 cd3c85    call    $853c
6ef5 c0        ret     nz

6ef6 2a7591    ld      hl,($9175)
6ef9 7d        ld      a,l
6efa 327391    ld      ($9173),a
6efd c9        ret     

6efe cda98b    call    $8ba9
6f01 2a7591    ld      hl,($9175)
6f04 c9        ret     

6f05 cda98b    call    $8ba9
6f08 214d91    ld      hl,$914d
6f0b cd667c    call    $7c66
6f0e cda77c    call    $7ca7
6f11 cd7b8a    call    $8a7b
6f14 cda08b    call    $8ba0
6f17 216b91    ld      hl,$916b
6f1a cd587c    call    $7c58
6f1d cd417f    call    $7f41
6f20 210800    ld      hl,$0008
6f23 39        add     hl,sp
6f24 cd587c    call    $7c58
6f27 cd417f    call    $7f41
6f2a 215f91    ld      hl,$915f
6f2d cd587c    call    $7c58
6f30 cd6c7d    call    $7d6c
6f33 cda77c    call    $7ca7
6f36 214d91    ld      hl,$914d
6f39 cd667c    call    $7c66
6f3c cda77c    call    $7ca7
6f3f cd988a    call    $8a98
6f42 cda08b    call    $8ba0
6f45 211000    ld      hl,$0010
6f48 39        add     hl,sp
6f49 cd587c    call    $7c58
6f4c cd417f    call    $7f41
6f4f 215791    ld      hl,$9157
6f52 cd587c    call    $7c58
6f55 cd6c7d    call    $7d6c
6f58 cda77c    call    $7ca7
6f5b cdf072    call    $72f0
6f5e eb        ex      de,hl
6f5f 211000    ld      hl,$0010
6f62 39        add     hl,sp
6f63 f9        ld      sp,hl
6f64 c9        ret     

6f65 cda98b    call    $8ba9
6f68 216b91    ld      hl,$916b
6f6b cd667c    call    $7c66
6f6e 211000    ld      hl,$0010
6f71 39        add     hl,sp
6f72 cd587c    call    $7c58
6f75 cd417f    call    $7f41
6f78 cda77c    call    $7ca7
6f7b 211000    ld      hl,$0010
6f7e 39        add     hl,sp
6f7f cd667c    call    $7c66
6f82 cda77c    call    $7ca7
6f85 cdf072    call    $72f0
6f88 eb        ex      de,hl
6f89 211000    ld      hl,$0010
6f8c 39        add     hl,sp
6f8d f9        ld      sp,hl
6f8e c9        ret     

6f8f cda98b    call    $8ba9
6f92 214d91    ld      hl,$914d
6f95 cd667c    call    $7c66
6f98 210800    ld      hl,$0008
6f9b 39        add     hl,sp
6f9c cd587c    call    $7c58
6f9f cd6c7d    call    $7d6c
6fa2 cda77c    call    $7ca7
6fa5 cdad6e    call    $6ead
6fa8 eb        ex      de,hl
6fa9 cda08b    call    $8ba0
6fac c9        ret     

6fad cda98b    call    $8ba9
6fb0 cdd671    call    $71d6
6fb3 214d91    ld      hl,$914d
6fb6 e5        push    hl
6fb7 210a00    ld      hl,$000a
6fba 39        add     hl,sp
6fbb cd667c    call    $7c66
6fbe cda77c    call    $7ca7
6fc1 cda276    call    $76a2
6fc4 cda08b    call    $8ba0
6fc7 e1        pop     hl
6fc8 cd857c    call    $7c85
6fcb cde681    call    $81e6
6fce 225591    ld      ($9155),hl
6fd1 c3d671    jp      $71d6
6fd4 214d91    ld      hl,$914d
6fd7 c3667c    jp      $7c66
6fda 2a8391    ld      hl,($9183)
6fdd e5        push    hl
6fde 2a7791    ld      hl,($9177)
6fe1 e5        push    hl
6fe2 cd9277    call    $7792
6fe5 d1        pop     de
6fe6 d1        pop     de
6fe7 c3d671    jp      $71d6
6fea cda98b    call    $8ba9
6fed 211000    ld      hl,$0010
6ff0 39        add     hl,sp
6ff1 cd667c    call    $7c66
6ff4 216b91    ld      hl,$916b
6ff7 cd587c    call    $7c58
6ffa cd417f    call    $7f41
6ffd cda77c    call    $7ca7
7000 cd7271    call    $7172
7003 eb        ex      de,hl
7004 cda08b    call    $8ba0
7007 d5        push    de
7008 2a8f91    ld      hl,($918f)
700b d1        pop     de
700c eb        ex      de,hl
700d cd3086    call    $8630
7010 229391    ld      ($9193),hl
7013 e5        push    hl
7014 210a00    ld      hl,$000a
7017 39        add     hl,sp
7018 cd667c    call    $7c66
701b cda77c    call    $7ca7
701e cd7271    call    $7172
7021 eb        ex      de,hl
7022 cda08b    call    $8ba0
7025 2a8d91    ld      hl,($918d)
7028 19        add     hl,de
7029 229191    ld      ($9191),hl
702c e5        push    hl
702d cd7976    call    $7679
7030 d1        pop     de
7031 d1        pop     de
7032 cd5c76    call    $765c
7035 2842      jr      z,$7079
7037 2a518c    ld      hl,($8c51)
703a ed5b9191  ld      de,($9191)
703e cd8285    call    $8582
7041 229191    ld      ($9191),hl
7044 110000    ld      de,$0000
7047 eb        ex      de,hl
7048 cd6c85    call    $856c
704b 280b      jr      z,$7058
704d 2a518c    ld      hl,($8c51)
7050 eb        ex      de,hl
7051 2a9191    ld      hl,($9191)
7054 19        add     hl,de
7055 229191    ld      ($9191),hl
7058 2a9591    ld      hl,($9195)
705b ed5b9391  ld      de,($9193)
705f cd8285    call    $8582
7062 229391    ld      ($9193),hl
7065 110000    ld      de,$0000
7068 eb        ex      de,hl
7069 cd6c85    call    $856c
706c 280b      jr      z,$7079
706e 2a9591    ld      hl,($9195)
7071 eb        ex      de,hl
7072 2a9391    ld      hl,($9193)
7075 19        add     hl,de
7076 229391    ld      ($9193),hl
7079 c9        ret     

707a cda98b    call    $8ba9
707d 211000    ld      hl,$0010
7080 39        add     hl,sp
7081 cd667c    call    $7c66
7084 cda77c    call    $7ca7
7087 211000    ld      hl,$0010
708a 39        add     hl,sp
708b cd667c    call    $7c66
708e cda77c    call    $7ca7
7091 cdea6e    call    $6eea
7094 eb        ex      de,hl
7095 211000    ld      hl,$0010
7098 39        add     hl,sp
7099 f9        ld      sp,hl
709a 2a7391    ld      hl,($9173)
709d e5        push    hl
709e 2a9391    ld      hl,($9193)
70a1 e5        push    hl
70a2 2a9191    ld      hl,($9191)
70a5 e5        push    hl
70a6 cd3777    call    $7737
70a9 d1        pop     de
70aa d1        pop     de
70ab d1        pop     de
70ac c9        ret     

70ad cda98b    call    $8ba9
70b0 211000    ld      hl,$0010
70b3 39        add     hl,sp
70b4 cd667c    call    $7c66
70b7 cda77c    call    $7ca7
70ba 211000    ld      hl,$0010
70bd 39        add     hl,sp
70be cd667c    call    $7c66
70c1 cda77c    call    $7ca7
70c4 cdea6e    call    $6eea
70c7 eb        ex      de,hl
70c8 211000    ld      hl,$0010
70cb 39        add     hl,sp
70cc f9        ld      sp,hl
70cd 2a9391    ld      hl,($9193)
70d0 e5        push    hl
70d1 2a9191    ld      hl,($9191)
70d4 e5        push    hl
70d5 cd4777    call    $7747
70d8 d1        pop     de
70d9 d1        pop     de
70da c9        ret     

70db 215791    ld      hl,$9157
70de c3667c    jp      $7c66
70e1 215f91    ld      hl,$915f
70e4 cd667c    call    $7c66
70e7 216b91    ld      hl,$916b
70ea cd587c    call    $7c58
70ed c3417e    jp      $7e41
70f0 cda98b    call    $8ba9
70f3 215791    ld      hl,$9157
70f6 cd667c    call    $7c66
70f9 cda77c    call    $7ca7
70fc cd3871    call    $7138
70ff eb        ex      de,hl
7100 cda08b    call    $8ba0
7103 2a8d91    ld      hl,($918d)
7106 19        add     hl,de
7107 c9        ret     

7108 cda98b    call    $8ba9
710b 215f91    ld      hl,$915f
710e cd667c    call    $7c66
7111 cda77c    call    $7ca7
7114 cd3871    call    $7138
7117 eb        ex      de,hl
7118 cda08b    call    $8ba0
711b d5        push    de
711c 2a8f91    ld      hl,($918f)
711f d1        pop     de
7120 eb        ex      de,hl
7121 c33086    jp      $8630
7124 cd4070    call    $7040
7127 c8        ret     z

7128 cdd671    call    $71d6
712b 210000    ld      hl,$0000
712e 226791    ld      ($9167),hl
7131 c9        ret     

7132 cd4070    call    $7040
7135 c0        ret     nz

7136 210100    ld      hl,$0001
7139 226791    ld      ($9167),hl
713c cdd671    call    $71d6
713f c9        ret     

7140 cda98b    call    $8ba9
7143 2a6791    ld      hl,($9167)
7146 c9        ret     

7147 210000    ld      hl,$0000
714a 226991    ld      ($9169),hl
714d c9        ret     

714e cdd671    call    $71d6
7151 210100    ld      hl,$0001
7154 226991    ld      ($9169),hl
7157 2a9591    ld      hl,($9195)
715a 7c        ld      a,h
715b b5        or      l
715c 2803      jr      z,$7161
715e cd9c70    call    $709c
7161 c3d671    jp      $71d6
7164 cd0870    call    $7008
7167 e5        push    hl
7168 cdf06f    call    $6ff0
716b e5        push    hl
716c cd0d77    call    $770d
716f d1        pop     de
7170 d1        pop     de
7171 2803      jr      z,$7176
7173 cdc253    call    $53c2
7176 210200    ld      hl,$0002
7179 226991    ld      ($9169),hl
717c c9        ret     

717d cda98b    call    $8ba9
7180 2a6991    ld      hl,($9169)
7183 c9        ret     

7184 cda98b    call    $8ba9
7187 216b91    ld      hl,$916b
718a e5        push    hl
718b 210a00    ld      hl,$000a
718e 39        add     hl,sp
718f cd667c    call    $7c66
7192 e1        pop     hl
7193 c3857c    jp      $7c85
7196 216b91    ld      hl,$916b
7199 c3667c    jp      $7c66
719c cdf06f    call    $6ff0
719f 110000    ld      de,$0000
71a2 eb        ex      de,hl
71a3 cd6c85    call    $856c
71a6 281b      jr      z,$71c3
71a8 215791    ld      hl,$9157
71ab e5        push    hl
71ac 2a518c    ld      hl,($8c51)
71af cd2880    call    $8028
71b2 cd037d    call    $7d03
71b5 e1        pop     hl
71b6 e5        push    hl
71b7 cd667c    call    $7c66
71ba cd6c7d    call    $7d6c
71bd e1        pop     hl
71be cd857c    call    $7c85
71c1 18d9      jr      $719c
71c3 cdf06f    call    $6ff0
71c6 eb        ex      de,hl
71c7 2a518c    ld      hl,($8c51)
71ca cd5585    call    $8555
71cd 281b      jr      z,$71ea
71cf 215791    ld      hl,$9157
71d2 e5        push    hl
71d3 2a518c    ld      hl,($8c51)
71d6 cd2880    call    $8028
71d9 cd037d    call    $7d03
71dc e1        pop     hl
71dd e5        push    hl
71de cd667c    call    $7c66
71e1 cd657d    call    $7d65
71e4 e1        pop     hl
71e5 cd857c    call    $7c85
71e8 18d9      jr      $71c3
71ea cd0870    call    $7008
71ed 110000    ld      de,$0000
71f0 eb        ex      de,hl
71f1 cd6c85    call    $856c
71f4 281b      jr      z,$7211
71f6 215f91    ld      hl,$915f
71f9 e5        push    hl
71fa 2a9591    ld      hl,($9195)
71fd cd2880    call    $8028
7200 cd037d    call    $7d03
7203 e1        pop     hl
7204 e5        push    hl
7205 cd667c    call    $7c66
7208 cd657d    call    $7d65
720b e1        pop     hl
720c cd857c    call    $7c85
720f 18d9      jr      $71ea
7211 cd0870    call    $7008
7214 eb        ex      de,hl
7215 2a9591    ld      hl,($9195)
7218 cd5585    call    $8555
721b c8        ret     z

721c 215f91    ld      hl,$915f
721f e5        push    hl
7220 2a9591    ld      hl,($9195)
7223 cd2880    call    $8028
7226 cd037d    call    $7d03
7229 e1        pop     hl
722a e5        push    hl
722b cd667c    call    $7c66
722e cd6c7d    call    $7d6c
7231 e1        pop     hl
7232 cd857c    call    $7c85
7235 18da      jr      $7211
7237 c9        ret     

7238 cda98b    call    $8ba9
723b 210800    ld      hl,$0008
723e 39        add     hl,sp
723f cd667c    call    $7c66
7242 213591    ld      hl,$9135
7245 cd587c    call    $7c58
7248 cd0780    call    $8007
724b 280d      jr      z,$725a
724d cd5f7c    call    $7c5f
7250 40        ld      b,b
7251 80        add     a,b
7252 00        nop     
7253 00        nop     
7254 00        nop     
7255 00        nop     
7256 00        nop     
7257 00        nop     
7258 180b      jr      $7265
725a cd5f7c    call    $7c5f
725d c0        ret     nz

725e 7f        ld      a,a
725f ff        rst     $38
7260 ff        rst     $38
7261 ff        rst     $38
7262 ff        rst     $38
7263 ff        rst     $38
7264 b8        cp      b
7265 210800    ld      hl,$0008
7268 39        add     hl,sp
7269 cd587c    call    $7c58
726c cd6c7d    call    $7d6c
726f c3e681    jp      $81e6
7272 cda98b    call    $8ba9
7275 210800    ld      hl,$0008
7278 39        add     hl,sp
7279 cd667c    call    $7c66
727c cda77c    call    $7ca7
727f cd3871    call    $7138
7282 eb        ex      de,hl
7283 cda08b    call    $8ba0
7286 42        ld      b,d
7287 4b        ld      c,e
7288 2180c1    ld      hl,$c180
728b cd5585    call    $8555
728e 280d      jr      z,$729d
7290 50        ld      d,b
7291 59        ld      e,c
7292 21803e    ld      hl,$3e80
7295 cd5685    call    $8556
7298 2803      jr      z,$729d
729a 60        ld      h,b
729b 69        ld      l,c
729c c9        ret     

729d c3c253    jp      $53c2
72a0 cda98b    call    $8ba9
72a3 210800    ld      hl,$0008
72a6 39        add     hl,sp
72a7 4e        ld      c,(hl)
72a8 23        inc     hl
72a9 46        ld      b,(hl)
72aa 60        ld      h,b
72ab 69        ld      l,c
72ac 118000    ld      de,$0080
72af cdfc84    call    $84fc
72b2 280a      jr      z,$72be
72b4 2100ff    ld      hl,$ff00
72b7 50        ld      d,b
72b8 59        ld      e,c
72b9 cdfe85    call    $85fe
72bc 44        ld      b,h
72bd 4d        ld      c,l
72be 210a00    ld      hl,$000a
72c1 39        add     hl,sp
72c2 5e        ld      e,(hl)
72c3 23        inc     hl
72c4 56        ld      d,(hl)
72c5 210200    ld      hl,$0002
72c8 cdfc84    call    $84fc
72cb 2806      jr      z,$72d3
72cd 60        ld      h,b
72ce 69        ld      l,c
72cf cdec85    call    $85ec
72d2 c9        ret     

72d3 60        ld      h,b
72d4 69        ld      l,c
72d5 c9        ret     

72d6 cda98b    call    $8ba9
72d9 cd4070    call    $7040
72dc c8        ret     z

72dd cdfe6d    call    $6dfe
72e0 7d        ld      a,l
72e1 32bb91    ld      ($91bb),a
72e4 2a5591    ld      hl,($9155)
72e7 23        inc     hl
72e8 23        inc     hl
72e9 23        inc     hl
72ea 110600    ld      de,$0006
72ed eb        ex      de,hl
72ee cd2285    call    $8522
72f1 110f00    ld      de,$000f
72f4 eb        ex      de,hl
72f5 cd8285    call    $8582
72f8 22b991    ld      ($91b9),hl
72fb 2a5591    ld      hl,($9155)
72fe 23        inc     hl
72ff 23        inc     hl
7300 23        inc     hl
7301 115a00    ld      de,$005a
7304 eb        ex      de,hl
7305 cd2285    call    $8522
7308 22b791    ld      ($91b7),hl
730b 110100    ld      de,$0001
730e cdfc84    call    $84fc
7311 280c      jr      z,$731f
7313 2ab991    ld      hl,($91b9)
7316 110f00    ld      de,$000f
7319 cd3086    call    $8630
731c 22b991    ld      ($91b9),hl
731f 2ab991    ld      hl,($91b9)
7322 110600    ld      de,$0006
7325 cdd485    call    $85d4
7328 11d88b    ld      de,$8bd8
732b 19        add     hl,de
732c 22b591    ld      ($91b5),hl
732f cdf06f    call    $6ff0
7332 22a591    ld      ($91a5),hl
7335 cd0870    call    $7008
7338 22a791    ld      ($91a7),hl
733b 21a991    ld      hl,$91a9
733e 44        ld      b,h
733f 4d        ld      c,l
7340 1808      jr      $734a
7342 210400    ld      hl,$0004
7345 50        ld      d,b
7346 59        ld      e,c
7347 19        add     hl,de
7348 44        ld      b,h
7349 4d        ld      c,l
734a 50        ld      d,b
734b 59        ld      e,c
734c 21b591    ld      hl,$91b5
734f cd6686    call    $8666
7352 287b      jr      z,$73cf
7354 21fcff    ld      hl,$fffc
7357 09        add     hl,bc
7358 5e        ld      e,(hl)
7359 23        inc     hl
735a 56        ld      d,(hl)
735b eb        ex      de,hl
735c 229791    ld      ($9197),hl
735f 21feff    ld      hl,$fffe
7362 09        add     hl,bc
7363 5e        ld      e,(hl)
7364 23        inc     hl
7365 56        ld      d,(hl)
7366 eb        ex      de,hl
7367 229991    ld      ($9199),hl
736a 2ab791    ld      hl,($91b7)
736d e5        push    hl
736e 2ab591    ld      hl,($91b5)
7371 23        inc     hl
7372 22b591    ld      ($91b5),hl
7375 5e        ld      e,(hl)
7376 1600      ld      d,$00
7378 d5        push    de
7379 cda071    call    $71a0
737c d1        pop     de
737d d1        pop     de
737e eb        ex      de,hl
737f 2aa591    ld      hl,($91a5)
7382 19        add     hl,de
7383 eb        ex      de,hl
7384 60        ld      h,b
7385 69        ld      l,c
7386 73        ld      (hl),e
7387 23        inc     hl
7388 72        ld      (hl),d
7389 eb        ex      de,hl
738a 229b91    ld      ($919b),hl
738d 2ab791    ld      hl,($91b7)
7390 23        inc     hl
7391 e5        push    hl
7392 2ab591    ld      hl,($91b5)
7395 23        inc     hl
7396 22b591    ld      ($91b5),hl
7399 5e        ld      e,(hl)
739a 1600      ld      d,$00
739c d5        push    de
739d cda071    call    $71a0
73a0 d1        pop     de
73a1 d1        pop     de
73a2 eb        ex      de,hl
73a3 2aa791    ld      hl,($91a7)
73a6 19        add     hl,de
73a7 eb        ex      de,hl
73a8 210200    ld      hl,$0002
73ab 09        add     hl,bc
73ac 73        ld      (hl),e
73ad 23        inc     hl
73ae 72        ld      (hl),d
73af eb        ex      de,hl
73b0 229d91    ld      ($919d),hl
73b3 2abb91    ld      hl,($91bb)
73b6 e5        push    hl
73b7 2a9d91    ld      hl,($919d)
73ba e5        push    hl
73bb 2a9b91    ld      hl,($919b)
73be e5        push    hl
73bf cd3777    call    $7737
73c2 d1        pop     de
73c3 d1        pop     de
73c4 2abb91    ld      hl,($91bb)
73c7 e3        ex      (sp),hl
73c8 cd0d74    call    $740d
73cb d1        pop     de
73cc c34272    jp      $7242
73cf 2ab191    ld      hl,($91b1)
73d2 229791    ld      ($9197),hl
73d5 2ab391    ld      hl,($91b3)
73d8 229991    ld      ($9199),hl
73db 2aa591    ld      hl,($91a5)
73de 229b91    ld      ($919b),hl
73e1 2aa791    ld      hl,($91a7)
73e4 229d91    ld      ($919d),hl
73e7 2abb91    ld      hl,($91bb)
73ea e5        push    hl
73eb cd0d74    call    $740d
73ee d1        pop     de
73ef c9        ret     

73f0 cda98b    call    $8ba9
73f3 211000    ld      hl,$0010
73f6 39        add     hl,sp
73f7 cd667c    call    $7c66
73fa cda77c    call    $7ca7
73fd cd7271    call    $7172
7400 eb        ex      de,hl
7401 cda08b    call    $8ba0
7404 d5        push    de
7405 2a8f91    ld      hl,($918f)
7408 d1        pop     de
7409 eb        ex      de,hl
740a cd3086    call    $8630
740d 229391    ld      ($9193),hl
7410 e5        push    hl
7411 210a00    ld      hl,$000a
7414 39        add     hl,sp
7415 cd667c    call    $7c66
7418 cda77c    call    $7ca7
741b cd7271    call    $7172
741e eb        ex      de,hl
741f cda08b    call    $8ba0
7422 2a8d91    ld      hl,($918d)
7425 19        add     hl,de
7426 229191    ld      ($9191),hl
7429 e5        push    hl
742a cd7976    call    $7679
742d d1        pop     de
742e d1        pop     de
742f cdd671    call    $71d6
7432 cdf06f    call    $6ff0
7435 229791    ld      ($9197),hl
7438 cd0870    call    $7008
743b 229991    ld      ($9199),hl
743e 2a9191    ld      hl,($9191)
7441 229b91    ld      ($919b),hl
7444 2a9391    ld      hl,($9193)
7447 229d91    ld      ($919d),hl
744a 215791    ld      hl,$9157
744d e5        push    hl
744e 210a00    ld      hl,$000a
7451 39        add     hl,sp
7452 cd667c    call    $7c66
7455 e1        pop     hl
7456 cd857c    call    $7c85
7459 215f91    ld      hl,$915f
745c e5        push    hl
745d 211200    ld      hl,$0012
7460 39        add     hl,sp
7461 cd667c    call    $7c66
7464 e1        pop     hl
7465 cd857c    call    $7c85
7468 cd5c76    call    $765c
746b cafd73    jp      z,$73fd
746e cdcf6d    call    $6dcf
7471 caf873    jp      z,$73f8
7474 2a7391    ld      hl,($9173)
7477 e5        push    hl
7478 cd0d74    call    $740d
747b d1        pop     de
747c 22bd91    ld      ($91bd),hl
747f 110100    ld      de,$0001
7482 eb        ex      de,hl
7483 cd0686    call    $8606
7486 44        ld      b,h
7487 4d        ld      c,l
7488 2a9391    ld      hl,($9193)
748b e5        push    hl
748c 2a9191    ld      hl,($9191)
748f e5        push    hl
7490 cd0d77    call    $770d
7493 d1        pop     de
7494 d1        pop     de
7495 2861      jr      z,$74f8
7497 2a9b91    ld      hl,($919b)
749a 229791    ld      ($9197),hl
749d 2a9d91    ld      hl,($919d)
74a0 229991    ld      ($9199),hl
74a3 2abd91    ld      hl,($91bd)
74a6 29        add     hl,hl
74a7 118591    ld      de,$9185
74aa 19        add     hl,de
74ab 5e        ld      e,(hl)
74ac 23        inc     hl
74ad 56        ld      d,(hl)
74ae d5        push    de
74af 219791    ld      hl,$9197
74b2 09        add     hl,bc
74b3 09        add     hl,bc
74b4 d1        pop     de
74b5 e5        push    hl
74b6 7e        ld      a,(hl)
74b7 23        inc     hl
74b8 66        ld      h,(hl)
74b9 6f        ld      l,a
74ba 19        add     hl,de
74bb eb        ex      de,hl
74bc e1        pop     hl
74bd 73        ld      (hl),e
74be 23        inc     hl
74bf 72        ld      (hl),d
74c0 2a9191    ld      hl,($9191)
74c3 229b91    ld      ($919b),hl
74c6 2a9391    ld      hl,($9193)
74c9 229d91    ld      ($919d),hl
74cc 2abd91    ld      hl,($91bd)
74cf 29        add     hl,hl
74d0 118591    ld      de,$9185
74d3 19        add     hl,de
74d4 5e        ld      e,(hl)
74d5 23        inc     hl
74d6 56        ld      d,(hl)
74d7 d5        push    de
74d8 219b91    ld      hl,$919b
74db 09        add     hl,bc
74dc 09        add     hl,bc
74dd d1        pop     de
74de e5        push    hl
74df 7e        ld      a,(hl)
74e0 23        inc     hl
74e1 66        ld      h,(hl)
74e2 6f        ld      l,a
74e3 19        add     hl,de
74e4 eb        ex      de,hl
74e5 e1        pop     hl
74e6 73        ld      (hl),e
74e7 23        inc     hl
74e8 72        ld      (hl),d
74e9 2a9b91    ld      hl,($919b)
74ec 229191    ld      ($9191),hl
74ef 2a9d91    ld      hl,($919d)
74f2 229391    ld      ($9193),hl
74f5 c37473    jp      $7374
74f8 cd9c70    call    $709c
74fb 180d      jr      $750a
74fd cdcf6d    call    $6dcf
7500 2808      jr      z,$750a
7502 2a7391    ld      hl,($9173)
7505 e5        push    hl
7506 cd0d74    call    $740d
7509 d1        pop     de
750a c3d671    jp      $71d6
750d cda98b    call    $8ba9
7510 21ffff    ld      hl,$ffff
7513 22a391    ld      ($91a3),hl
7516 22a191    ld      ($91a1),hl
7519 22c191    ld      ($91c1),hl
751c 210000    ld      hl,$0000
751f 229f91    ld      ($919f),hl
7522 21ffff    ld      hl,$ffff
7525 22bf91    ld      ($91bf),hl
7528 2abf91    ld      hl,($91bf)
752b 23        inc     hl
752c 22bf91    ld      ($91bf),hl
752f 110200    ld      de,$0002
7532 eb        ex      de,hl
7533 cd6c85    call    $856c
7536 cab474    jp      z,$74b4
7539 21ffff    ld      hl,$ffff
753c 44        ld      b,h
753d 4d        ld      c,l
753e 03        inc     bc
753f 60        ld      h,b
7540 69        ld      l,c
7541 110200    ld      de,$0002
7544 eb        ex      de,hl
7545 cd6c85    call    $856c
7548 2867      jr      z,$75b1
754a 60        ld      h,b
754b 69        ld      l,c
754c 29        add     hl,hl
754d 29        add     hl,hl
754e 117d91    ld      de,$917d
7551 19        add     hl,de
7552 5e        ld      e,(hl)
7553 23        inc     hl
7554 56        ld      d,(hl)
7555 d5        push    de
7556 60        ld      h,b
7557 69        ld      l,c
7558 29        add     hl,hl
7559 e5        push    hl
755a 2abf91    ld      hl,($91bf)
755d 29        add     hl,hl
755e 29        add     hl,hl
755f d1        pop     de
7560 19        add     hl,de
7561 119791    ld      de,$9197
7564 19        add     hl,de
7565 5e        ld      e,(hl)
7566 23        inc     hl
7567 56        ld      d,(hl)
7568 eb        ex      de,hl
7569 22c391    ld      ($91c3),hl
756c d1        pop     de
756d eb        ex      de,hl
756e cd6c85    call    $856c
7571 2814      jr      z,$7587
7573 210000    ld      hl,$0000
7576 e5        push    hl
7577 c5        push    bc
7578 2abf91    ld      hl,($91bf)
757b e5        push    hl
757c cdfe74    call    $74fe
757f d1        pop     de
7580 d1        pop     de
7581 d1        pop     de
7582 22c191    ld      ($91c1),hl
7585 1828      jr      $75af
7587 60        ld      h,b
7588 69        ld      l,c
7589 29        add     hl,hl
758a 29        add     hl,hl
758b 117f91    ld      de,$917f
758e 19        add     hl,de
758f 5e        ld      e,(hl)
7590 23        inc     hl
7591 56        ld      d,(hl)
7592 d5        push    de
7593 2ac391    ld      hl,($91c3)
7596 d1        pop     de
7597 eb        ex      de,hl
7598 cd6d85    call    $856d
759b 2812      jr      z,$75af
759d 210100    ld      hl,$0001
75a0 e5        push    hl
75a1 c5        push    bc
75a2 2abf91    ld      hl,($91bf)
75a5 e5        push    hl
75a6 cdfe74    call    $74fe
75a9 d1        pop     de
75aa d1        pop     de
75ab d1        pop     de
75ac 22c191    ld      ($91c1),hl
75af 188d      jr      $753e
75b1 c32874    jp      $7428
75b4 2a9f91    ld      hl,($919f)
75b7 7c        ld      a,h
75b8 b5        or      l
75b9 203f      jr      nz,$75fa
75bb 2a9991    ld      hl,($9199)
75be e5        push    hl
75bf 2a9791    ld      hl,($9197)
75c2 e5        push    hl
75c3 cd0d77    call    $770d
75c6 d1        pop     de
75c7 d1        pop     de
75c8 2030      jr      nz,$75fa
75ca 2a9d91    ld      hl,($919d)
75cd e5        push    hl
75ce 2a9b91    ld      hl,($919b)
75d1 e5        push    hl
75d2 cd0d77    call    $770d
75d5 d1        pop     de
75d6 d1        pop     de
75d7 2021      jr      nz,$75fa
75d9 210800    ld      hl,$0008
75dc 39        add     hl,sp
75dd 5e        ld      e,(hl)
75de 23        inc     hl
75df 56        ld      d,(hl)
75e0 d5        push    de
75e1 2a9d91    ld      hl,($919d)
75e4 e5        push    hl
75e5 2a9b91    ld      hl,($919b)
75e8 e5        push    hl
75e9 2a9991    ld      hl,($9199)
75ec e5        push    hl
75ed 2a9791    ld      hl,($9197)
75f0 e5        push    hl
75f1 cd8c77    call    $778c
75f4 eb        ex      de,hl
75f5 210a00    ld      hl,$000a
75f8 39        add     hl,sp
75f9 f9        ld      sp,hl
75fa 2ac191    ld      hl,($91c1)
75fd c9        ret     

75fe cda98b    call    $8ba9
7601 210a00    ld      hl,$000a
7604 39        add     hl,sp
7605 4e        ld      c,(hl)
7606 23        inc     hl
7607 46        ld      b,(hl)
7608 210800    ld      hl,$0008
760b 39        add     hl,sp
760c 5e        ld      e,(hl)
760d 23        inc     hl
760e 56        ld      d,(hl)
760f eb        ex      de,hl
7610 22c791    ld      ($91c7),hl
7613 60        ld      h,b
7614 69        ld      l,c
7615 29        add     hl,hl
7616 e5        push    hl
7617 2ac791    ld      hl,($91c7)
761a 110100    ld      de,$0001
761d cd3086    call    $8630
7620 29        add     hl,hl
7621 29        add     hl,hl
7622 d1        pop     de
7623 19        add     hl,de
7624 119791    ld      de,$9197
7627 19        add     hl,de
7628 5e        ld      e,(hl)
7629 23        inc     hl
762a 56        ld      d,(hl)
762b d5        push    de
762c 60        ld      h,b
762d 69        ld      l,c
762e 29        add     hl,hl
762f e5        push    hl
7630 2ac791    ld      hl,($91c7)
7633 29        add     hl,hl
7634 29        add     hl,hl
7635 d1        pop     de
7636 19        add     hl,de
7637 119791    ld      de,$9197
763a 19        add     hl,de
763b 5e        ld      e,(hl)
763c 23        inc     hl
763d 56        ld      d,(hl)
763e e1        pop     hl
763f cd3086    call    $8630
7642 22c991    ld      ($91c9),hl
7645 7c        ld      a,h
7646 b5        or      l
7647 ca0476    jp      z,$7604
764a 2ac991    ld      hl,($91c9)
764d cd2880    call    $8028
7650 cda77c    call    $7ca7
7653 210100    ld      hl,$0001
7656 50        ld      d,b
7657 59        ld      e,c
7658 eb        ex      de,hl
7659 cd3086    call    $8630
765c 29        add     hl,hl
765d e5        push    hl
765e 2ac791    ld      hl,($91c7)
7661 29        add     hl,hl
7662 29        add     hl,hl
7663 d1        pop     de
7664 19        add     hl,de
7665 119791    ld      de,$9197
7668 19        add     hl,de
7669 5e        ld      e,(hl)
766a 23        inc     hl
766b 56        ld      d,(hl)
766c d5        push    de
766d 210100    ld      hl,$0001
7670 50        ld      d,b
7671 59        ld      e,c
7672 eb        ex      de,hl
7673 cd3086    call    $8630
7676 29        add     hl,hl
7677 e5        push    hl
7678 2ac791    ld      hl,($91c7)
767b 110100    ld      de,$0001
767e cd3086    call    $8630
7681 29        add     hl,hl
7682 29        add     hl,hl
7683 d1        pop     de
7684 19        add     hl,de
7685 119791    ld      de,$9197
7688 19        add     hl,de
7689 5e        ld      e,(hl)
768a 23        inc     hl
768b 56        ld      d,(hl)
768c e1        pop     hl
768d cd3086    call    $8630
7690 cd2880    call    $8028
7693 cda77c    call    $7ca7
7696 211c00    ld      hl,$001c
7699 39        add     hl,sp
769a 5e        ld      e,(hl)
769b 23        inc     hl
769c 56        ld      d,(hl)
769d eb        ex      de,hl
769e 29        add     hl,hl
769f e5        push    hl
76a0 60        ld      h,b
76a1 69        ld      l,c
76a2 29        add     hl,hl
76a3 29        add     hl,hl
76a4 d1        pop     de
76a5 19        add     hl,de
76a6 117d91    ld      de,$917d
76a9 19        add     hl,de
76aa 5e        ld      e,(hl)
76ab 23        inc     hl
76ac 56        ld      d,(hl)
76ad eb        ex      de,hl
76ae 22cb91    ld      ($91cb),hl
76b1 e5        push    hl
76b2 60        ld      h,b
76b3 69        ld      l,c
76b4 29        add     hl,hl
76b5 e5        push    hl
76b6 2ac791    ld      hl,($91c7)
76b9 29        add     hl,hl
76ba 29        add     hl,hl
76bb d1        pop     de
76bc 19        add     hl,de
76bd 119791    ld      de,$9197
76c0 19        add     hl,de
76c1 5e        ld      e,(hl)
76c2 23        inc     hl
76c3 56        ld      d,(hl)
76c4 e1        pop     hl
76c5 cd3086    call    $8630
76c8 cd2880    call    $8028
76cb cdd87c    call    $7cd8
76ce cd417f    call    $7f41
76d1 cdd87c    call    $7cd8
76d4 cd417e    call    $7e41
76d7 cda77c    call    $7ca7
76da cd3871    call    $7138
76dd eb        ex      de,hl
76de cda08b    call    $8ba0
76e1 d5        push    de
76e2 210100    ld      hl,$0001
76e5 50        ld      d,b
76e6 59        ld      e,c
76e7 eb        ex      de,hl
76e8 cd3086    call    $8630
76eb 29        add     hl,hl
76ec e5        push    hl
76ed 2ac791    ld      hl,($91c7)
76f0 29        add     hl,hl
76f1 29        add     hl,hl
76f2 d1        pop     de
76f3 19        add     hl,de
76f4 119791    ld      de,$9197
76f7 19        add     hl,de
76f8 d1        pop     de
76f9 e5        push    hl
76fa 7e        ld      a,(hl)
76fb 23        inc     hl
76fc 66        ld      h,(hl)
76fd 6f        ld      l,a
76fe 19        add     hl,de
76ff eb        ex      de,hl
7700 e1        pop     hl
7701 73        ld      (hl),e
7702 23        inc     hl
7703 72        ld      (hl),d
7704 2acb91    ld      hl,($91cb)
7707 e5        push    hl
7708 60        ld      h,b
7709 69        ld      l,c
770a 29        add     hl,hl
770b e5        push    hl
770c 2ac791    ld      hl,($91c7)
770f 29        add     hl,hl
7710 29        add     hl,hl
7711 d1        pop     de
7712 19        add     hl,de
7713 119791    ld      de,$9197
7716 19        add     hl,de
7717 d1        pop     de
7718 73        ld      (hl),e
7719 23        inc     hl
771a 72        ld      (hl),d
771b 60        ld      h,b
771c 69        ld      l,c
771d 29        add     hl,hl
771e eb        ex      de,hl
771f 210c00    ld      hl,$000c
7722 39        add     hl,sp
7723 7e        ld      a,(hl)
7724 23        inc     hl
7725 66        ld      h,(hl)
7726 6f        ld      l,a
7727 19        add     hl,de
7728 22c591    ld      ($91c5),hl
772b eb        ex      de,hl
772c 2aa191    ld      hl,($91a1)
772f cd3c85    call    $853c
7732 2806      jr      z,$773a
7734 210100    ld      hl,$0001
7737 229f91    ld      ($919f),hl
773a 2ac591    ld      hl,($91c5)
773d eb        ex      de,hl
773e 2aa391    ld      hl,($91a3)
7741 cd3c85    call    $853c
7744 2806      jr      z,$774c
7746 210100    ld      hl,$0001
7749 229f91    ld      ($919f),hl
774c 2aa191    ld      hl,($91a1)
774f 22a391    ld      ($91a3),hl
7752 2ac591    ld      hl,($91c5)
7755 22a191    ld      ($91a1),hl
7758 2ac591    ld      hl,($91c5)
775b c9        ret     

775c cda98b    call    $8ba9
775f 2a6991    ld      hl,($9169)
7762 110100    ld      de,$0001
7765 cd3c85    call    $853c
7768 2807      jr      z,$7771
776a 2a9591    ld      hl,($9195)
776d 7c        ld      a,h
776e b5        or      l
776f 2004      jr      nz,$7775
7771 210000    ld      hl,$0000
7774 c9        ret     

7775 210100    ld      hl,$0001
7778 c9        ret     

7779 cda98b    call    $8ba9
777c 2a6991    ld      hl,($9169)
777f 110200    ld      de,$0002
7782 cd3c85    call    $853c
7785 281a      jr      z,$77a1
7787 210a00    ld      hl,$000a
778a 39        add     hl,sp
778b 5e        ld      e,(hl)
778c 23        inc     hl
778d 56        ld      d,(hl)
778e d5        push    de
778f 210a00    ld      hl,$000a
7792 39        add     hl,sp
7793 5e        ld      e,(hl)
7794 23        inc     hl
7795 56        ld      d,(hl)
7796 d5        push    de
7797 cd0d77    call    $770d
779a d1        pop     de
779b d1        pop     de
779c 2803      jr      z,$77a1
779e cdc253    call    $53c2
77a1 c9        ret     

77a2 cda98b    call    $8ba9
77a5 210800    ld      hl,$0008
77a8 39        add     hl,sp
77a9 cd667c    call    $7c66
77ac 214591    ld      hl,$9145
77af cd587c    call    $7c58
77b2 cd0780    call    $8007
77b5 281c      jr      z,$77d3
77b7 210800    ld      hl,$0008
77ba 39        add     hl,sp
77bb e5        push    hl
77bc 214591    ld      hl,$9145
77bf cd667c    call    $7c66
77c2 cd037d    call    $7d03
77c5 e1        pop     hl
77c6 e5        push    hl
77c7 cd667c    call    $7c66
77ca cd657d    call    $7d65
77cd e1        pop     hl
77ce cd857c    call    $7c85
77d1 18d2      jr      $77a5
77d3 210800    ld      hl,$0008
77d6 39        add     hl,sp
77d7 cd667c    call    $7c66
77da cd517c    call    $7c51
77dd 00        nop     
77de 00        nop     
77df 00        nop     
77e0 00        nop     
77e1 00        nop     
77e2 00        nop     
77e3 00        nop     
77e4 00        nop     
77e5 cdf27f    call    $7ff2
77e8 281c      jr      z,$7806
77ea 210800    ld      hl,$0008
77ed 39        add     hl,sp
77ee e5        push    hl
77ef 214591    ld      hl,$9145
77f2 cd667c    call    $7c66
77f5 cd037d    call    $7d03
77f8 e1        pop     hl
77f9 e5        push    hl
77fa cd667c    call    $7c66
77fd cd6c7d    call    $7d6c
7800 e1        pop     hl
7801 cd857c    call    $7c85
7804 18cd      jr      $77d3
7806 210800    ld      hl,$0008
7809 39        add     hl,sp
780a c3667c    jp      $7c66
780d c5        push    bc
780e 210400    ld      hl,$0004
7811 39        add     hl,sp
7812 5e        ld      e,(hl)
7813 23        inc     hl
7814 56        ld      d,(hl)
7815 23        inc     hl
7816 4e        ld      c,(hl)
7817 23        inc     hl
7818 46        ld      b,(hl)
7819 2a8391    ld      hl,($9183)
781c 7c        ld      a,h
781d 17        rla     
781e 3811      jr      c,$7831
7820 ed42      sbc     hl,bc
7822 380d      jr      c,$7831
7824 2a7f91    ld      hl,($917f)
7827 ed52      sbc     hl,de
7829 3806      jr      c,$7831
782b c1        pop     bc
782c 210000    ld      hl,$0000
782f a5        and     l
7830 c9        ret     

7831 c1        pop     bc
7832 210100    ld      hl,$0001
7835 b5        or      l
7836 c9        ret     

7837 e1        pop     hl
7838 22cd91    ld      ($91cd),hl
783b cd0d77    call    $770d
783e 2003      jr      nz,$7843
7840 cd8977    call    $7789
7843 2acd91    ld      hl,($91cd)
7846 e9        jp      (hl)
7847 e1        pop     hl
7848 22cd91    ld      ($91cd),hl
784b cd0d77    call    $770d
784e 11ffff    ld      de,$ffff
7851 2004      jr      nz,$7857
7853 cd9b77    call    $779b
7856 eb        ex      de,hl
7857 2acd91    ld      hl,($91cd)
785a e5        push    hl
785b eb        ex      de,hl
785c c9        ret     

785d 0e3c      ld      c,$3c
785f 116577    ld      de,$7765
7862 c30500    jp      $0005
7865 00        nop     
7866 02        ld      (bc),a
7867 39        add     hl,sp
7868 8c        adc     a,h
7869 6b        ld      l,e
786a 77        ld      (hl),a
786b c35d77    jp      $775d
786e c30000    jp      $0000
7871 c30000    jp      $0000
7874 c30000    jp      $0000
7877 c30000    jp      $0000
787a c30000    jp      $0000
787d c30000    jp      $0000
7880 c30000    jp      $0000
7883 c30000    jp      $0000
7886 c30000    jp      $0000
7889 c30000    jp      $0000
788c c30000    jp      $0000
788f c30000    jp      $0000
7892 c30000    jp      $0000
7895 c30000    jp      $0000
7898 c30000    jp      $0000
789b c30000    jp      $0000
789e c30000    jp      $0000
78a1 c30000    jp      $0000
78a4 c30000    jp      $0000
78a7 c30000    jp      $0000
78aa c30000    jp      $0000
78ad c30000    jp      $0000
78b0 c30000    jp      $0000
78b3 c30000    jp      $0000
78b6 c30000    jp      $0000
78b9 c3e553    jp      $53e5
78bc c3e553    jp      $53e5
78bf cd9e77    call    $779e
78c2 2018      jr      nz,$78dc
78c4 cdc066    call    $66c0
78c7 21e377    ld      hl,$77e3
78ca e5        push    hl
78cb cd3e69    call    $693e
78ce d1        pop     de
78cf cd9e77    call    $779e
78d2 2005      jr      nz,$78d9
78d4 cd9d69    call    $699d
78d7 18f6      jr      $78cf
78d9 cdc066    call    $66c0
78dc 210100    ld      hl,$0001
78df 226e8e    ld      ($8e6e),hl
78e2 c9        ret     

78e3 50        ld      d,b
78e4 6c        ld      l,h
78e5 65        ld      h,l
78e6 61        ld      h,c
78e7 73        ld      (hl),e
78e8 65        ld      h,l
78e9 2074      jr      nz,$795f
78eb 75        ld      (hl),l
78ec 72        ld      (hl),d
78ed 6e        ld      l,(hl)
78ee 206f      jr      nz,$795f
78f0 6e        ld      l,(hl)
78f1 2074      jr      nz,$7967
78f3 68        ld      l,b
78f4 65        ld      h,l
78f5 2070      jr      nz,$7967
78f7 72        ld      (hl),d
78f8 69        ld      l,c
78f9 6e        ld      l,(hl)
78fa 74        ld      (hl),h
78fb 65        ld      h,l
78fc 72        ld      (hl),d
78fd 00        nop     
78fe 210000    ld      hl,$0000
7901 226e8e    ld      ($8e6e),hl
7904 c9        ret     

7905 cda98b    call    $8ba9
7908 210800    ld      hl,$0008
790b 39        add     hl,sp
790c 4e        ld      c,(hl)
790d 23        inc     hl
790e 46        ld      b,(hl)
790f 60        ld      h,b
7910 69        ld      l,c
7911 5e        ld      e,(hl)
7912 1600      ld      d,$00
7914 d5        push    de
7915 cd8b66    call    $668b
7918 d1        pop     de
7919 200d      jr      nz,$7928
791b 60        ld      h,b
791c 69        ld      l,c
791d 03        inc     bc
791e 5e        ld      e,(hl)
791f 1600      ld      d,$00
7921 d5        push    de
7922 cd3178    call    $7831
7925 d1        pop     de
7926 18e7      jr      $790f
7928 210a00    ld      hl,$000a
792b e5        push    hl
792c cd3178    call    $7831
792f d1        pop     de
7930 c9        ret     

7931 cda98b    call    $8ba9
7934 210800    ld      hl,$0008
7937 39        add     hl,sp
7938 4e        ld      c,(hl)
7939 23        inc     hl
793a 46        ld      b,(hl)
793b cd9e77    call    $779e
793e 2005      jr      nz,$7945
7940 cd8769    call    $6987
7943 18f6      jr      $793b
7945 60        ld      h,b
7946 69        ld      l,c
7947 110a00    ld      de,$000a
794a cd3c85    call    $853c
794d 2808      jr      z,$7957
794f 210d00    ld      hl,$000d
7952 e5        push    hl
7953 cda177    call    $77a1
7956 d1        pop     de
7957 c5        push    bc
7958 cda177    call    $77a1
795b d1        pop     de
795c c9        ret     

795d c3e553    jp      $53e5
7960 c3e553    jp      $53e5
7963 c3e553    jp      $53e5
7966 c3e553    jp      $53e5
7969 cd0585    call    $8505
796c 00        nop     
796d fc2104    call    m,$0421
7970 00        nop     
7971 39        add     hl,sp
7972 225a90    ld      ($905a),hl
7975 cd0870    call    $7008
7978 e5        push    hl
7979 cdf06f    call    $6ff0
797c e5        push    hl
797d cd4777    call    $7747
7980 d1        pop     de
7981 d1        pop     de
7982 225090    ld      ($9050),hl
7985 11ffff    ld      de,$ffff
7988 cd3c85    call    $853c
798b c0        ret     nz

798c cdcf6d    call    $6dcf
798f 7d        ld      a,l
7990 325d90    ld      ($905d),a
7993 7c        ld      a,h
7994 b5        or      l
7995 c8        ret     z

7996 cdfe6d    call    $6dfe
7999 7d        ld      a,l
799a 325c90    ld      ($905c),a
799d eb        ex      de,hl
799e 2a5090    ld      hl,($9050)
79a1 cd3c85    call    $853c
79a4 280a      jr      z,$79b0
79a6 cdcf6d    call    $6dcf
79a9 110100    ld      de,$0001
79ac cd3c85    call    $853c
79af c0        ret     nz

79b0 cdcf6d    call    $6dcf
79b3 110300    ld      de,$0003
79b6 cd3c85    call    $853c
79b9 280f      jr      z,$79ca
79bb cd7a6d    call    $6d7a
79be 7d        ld      a,l
79bf 325c90    ld      ($905c),a
79c2 eb        ex      de,hl
79c3 2a5090    ld      hl,($9050)
79c6 cd3c85    call    $853c
79c9 c0        ret     nz

79ca 210000    ld      hl,$0000
79cd 225490    ld      ($9054),hl
79d0 225290    ld      ($9052),hl
79d3 cd0870    call    $7008
79d6 e5        push    hl
79d7 cdf06f    call    $6ff0
79da e5        push    hl
79db cdf679    call    $79f6
79de d1        pop     de
79df d1        pop     de
79e0 2a5290    ld      hl,($9052)
79e3 eb        ex      de,hl
79e4 2a5490    ld      hl,($9054)
79e7 cd4885    call    $8548
79ea c8        ret     z

79eb cd277a    call    $7a27
79ee 2a5890    ld      hl,($9058)
79f1 e5        push    hl
79f2 2a5690    ld      hl,($9056)
79f5 e5        push    hl
79f6 cd4777    call    $7747
79f9 d1        pop     de
79fa d1        pop     de
79fb eb        ex      de,hl
79fc 2a5090    ld      hl,($9050)
79ff cd3c85    call    $853c
7a02 283a      jr      z,$7a3e
7a04 2a5c90    ld      hl,($905c)
7a07 e5        push    hl
7a08 2a5890    ld      hl,($9058)
7a0b e5        push    hl
7a0c 2a5690    ld      hl,($9056)
7a0f e5        push    hl
7a10 cd3777    call    $7737
7a13 d1        pop     de
7a14 d1        pop     de
7a15 2a5890    ld      hl,($9058)
7a18 e3        ex      (sp),hl
7a19 2a5690    ld      hl,($9056)
7a1c 2b        dec     hl
7a1d e5        push    hl
7a1e cdf679    call    $79f6
7a21 d1        pop     de
7a22 2a5890    ld      hl,($9058)
7a25 e3        ex      (sp),hl
7a26 2a5690    ld      hl,($9056)
7a29 23        inc     hl
7a2a e5        push    hl
7a2b cdf679    call    $79f6
7a2e d1        pop     de
7a2f 21ffff    ld      hl,$ffff
7a32 e3        ex      (sp),hl
7a33 cd8479    call    $7984
7a36 210100    ld      hl,$0001
7a39 e3        ex      (sp),hl
7a3a cd8479    call    $7984
7a3d d1        pop     de
7a3e 18a0      jr      $79e0
7a40 c9        ret     

7a41 cda98b    call    $8ba9
7a44 21a4fb    ld      hl,$fba4
7a47 39        add     hl,sp
7a48 eb        ex      de,hl
7a49 2a2e90    ld      hl,($902e)
7a4c cd6686    call    $8666
7a4f 2803      jr      z,$7a54
7a51 cd8357    call    $5783
7a54 cddf4c    call    $4cdf
7a57 cdc84c    call    $4cc8
7a5a cd4d1f    call    $1f4d
7a5d cdd671    call    $71d6
7a60 cd6978    call    $7869
7a63 c3d671    jp      $71d6
7a66 cdbc1a    call    $1abc
7a69 cdc51a    call    $1ac5
7a6c cda77c    call    $7ca7
7a6f cdc51a    call    $1ac5
7a72 cda77c    call    $7ca7
7a75 cdad6f    call    $6fad
7a78 eb        ex      de,hl
7a79 211000    ld      hl,$0010
7a7c 39        add     hl,sp
7a7d f9        ld      sp,hl
7a7e d5        push    de
7a7f cda64b    call    $4ba6
7a82 d1        pop     de
7a83 c9        ret     

7a84 c5        push    bc
7a85 210400    ld      hl,$0004
7a88 39        add     hl,sp
7a89 5e        ld      e,(hl)
7a8a 23        inc     hl
7a8b 56        ld      d,(hl)
7a8c ed53d191  ld      ($91d1),de
7a90 2a5890    ld      hl,($9058)
7a93 a7        and     a
7a94 ed52      sbc     hl,de
7a96 22d391    ld      ($91d3),hl
7a99 ed4b5690  ld      bc,($9056)
7a9d ed5b5c90  ld      de,($905c)
7aa1 d5        push    de
7aa2 e5        push    hl
7aa3 c5        push    bc
7aa4 cd4777    call    $7747
7aa7 3a5090    ld      a,($9050)
7aaa bd        cp      l
7aab 2044      jr      nz,$7af1
7aad cd3777    call    $7737
7ab0 ed5bd391  ld      de,($91d3)
7ab4 2ad191    ld      hl,($91d1)
7ab7 19        add     hl,de
7ab8 e5        push    hl
7ab9 03        inc     bc
7aba c5        push    bc
7abb cd4777    call    $7747
7abe d1        pop     de
7abf 3a5090    ld      a,($9050)
7ac2 bd        cp      l
7ac3 280a      jr      z,$7acf
7ac5 2ad391    ld      hl,($91d3)
7ac8 e5        push    hl
7ac9 c5        push    bc
7aca cdf679    call    $79f6
7acd d1        pop     de
7ace d1        pop     de
7acf 0b        dec     bc
7ad0 0b        dec     bc
7ad1 c5        push    bc
7ad2 cd4777    call    $7747
7ad5 d1        pop     de
7ad6 d1        pop     de
7ad7 3a5090    ld      a,($9050)
7ada bd        cp      l
7adb 2805      jr      z,$7ae2
7add e1        pop     hl
7ade c5        push    bc
7adf cdf679    call    $79f6
7ae2 d1        pop     de
7ae3 03        inc     bc
7ae4 e1        pop     hl
7ae5 ed5bd191  ld      de,($91d1)
7ae9 a7        and     a
7aea ed52      sbc     hl,de
7aec 22d391    ld      ($91d3),hl
7aef 18b1      jr      $7aa2
7af1 d1        pop     de
7af2 d1        pop     de
7af3 d1        pop     de
7af4 c1        pop     bc
7af5 c9        ret     

7af6 e1        pop     hl
7af7 22cf91    ld      ($91cf),hl
7afa cd4777    call    $7747
7afd 3a5090    ld      a,($9050)
7b00 bd        cp      l
7b01 2020      jr      nz,$7b23
7b03 2a5490    ld      hl,($9054)
7b06 29        add     hl,hl
7b07 ed5b5a90  ld      de,($905a)
7b0b 19        add     hl,de
7b0c d1        pop     de
7b0d 73        ld      (hl),e
7b0e 23        inc     hl
7b0f 72        ld      (hl),d
7b10 23        inc     hl
7b11 d1        pop     de
7b12 73        ld      (hl),e
7b13 23        inc     hl
7b14 72        ld      (hl),d
7b15 d5        push    de
7b16 d5        push    de
7b17 2a5490    ld      hl,($9054)
7b1a 23        inc     hl
7b1b 23        inc     hl
7b1c 7c        ld      a,h
7b1d e601      and     $01
7b1f 67        ld      h,a
7b20 225490    ld      ($9054),hl
7b23 2acf91    ld      hl,($91cf)
7b26 e9        jp      (hl)
7b27 2a5290    ld      hl,($9052)
7b2a 29        add     hl,hl
7b2b ed5b5a90  ld      de,($905a)
7b2f 19        add     hl,de
7b30 5e        ld      e,(hl)
7b31 23        inc     hl
7b32 56        ld      d,(hl)
7b33 23        inc     hl
7b34 ed535690  ld      ($9056),de
7b38 5e        ld      e,(hl)
7b39 23        inc     hl
7b3a 56        ld      d,(hl)
7b3b ed535890  ld      ($9058),de
7b3f 2a5290    ld      hl,($9052)
7b42 23        inc     hl
7b43 23        inc     hl
7b44 7c        ld      a,h
7b45 e601      and     $01
7b47 67        ld      h,a
7b48 225290    ld      ($9052),hl
7b4b c9        ret     

7b4c cda98b    call    $8ba9
7b4f 210800    ld      hl,$0008
7b52 39        add     hl,sp
7b53 cd667c    call    $7c66
7b56 cda77c    call    $7ca7
7b59 cda276    call    $76a2
7b5c cda08b    call    $8ba0
7b5f cda77c    call    $7ca7
7b62 cd988a    call    $8a98
7b65 cda08b    call    $8ba0
7b68 c9        ret     

7b69 cda98b    call    $8ba9
7b6c 210800    ld      hl,$0008
7b6f 39        add     hl,sp
7b70 cd667c    call    $7c66
7b73 cda77c    call    $7ca7
7b76 cda276    call    $76a2
7b79 cda08b    call    $8ba0
7b7c cda77c    call    $7ca7
7b7f cd7b8a    call    $8a7b
7b82 cda08b    call    $8ba0
7b85 c9        ret     

7b86 21d591    ld      hl,$91d5
7b89 e5        push    hl
7b8a cdaa26    call    $26aa
7b8d d1        pop     de
7b8e c9        ret     

7b8f 21d591    ld      hl,$91d5
7b92 e5        push    hl
7b93 cd2727    call    $2727
7b96 d1        pop     de
7b97 c9        ret     

7b98 cd0585    call    $8505
7b9b dcff21    call    c,$21ff
7b9e d5        push    de
7b9f 91        sub     c
7ba0 e5        push    hl
7ba1 210600    ld      hl,$0006
7ba4 39        add     hl,sp
7ba5 44        ld      b,h
7ba6 4d        ld      c,l
7ba7 e5        push    hl
7ba8 cdd324    call    $24d3
7bab d1        pop     de
7bac d1        pop     de
7bad c5        push    bc
7bae cd1423    call    $2314
7bb1 d1        pop     de
7bb2 2003      jr      nz,$7bb7
7bb4 cd3957    call    $5739
7bb7 cd4d1f    call    $1f4d
7bba cdd671    call    $71d6
7bbd 21ffff    ld      hl,$ffff
7bc0 22d991    ld      ($91d9),hl
7bc3 cd2c20    call    $202c
7bc6 c5        push    bc
7bc7 211400    ld      hl,$0014
7bca e5        push    hl
7bcb cdbc86    call    $86bc
7bce d1        pop     de
7bcf d1        pop     de
7bd0 2015      jr      nz,$7be7
7bd2 2ad991    ld      hl,($91d9)
7bd5 23        inc     hl
7bd6 22d991    ld      ($91d9),hl
7bd9 e5        push    hl
7bda 218000    ld      hl,$0080
7bdd e5        push    hl
7bde cdb677    call    $77b6
7be1 d1        pop     de
7be2 d1        pop     de
7be3 2802      jr      z,$7be7
7be5 18dc      jr      $7bc3
7be7 cdd671    call    $71d6
7bea c5        push    bc
7beb cd3a23    call    $233a
7bee d1        pop     de
7bef c37c4b    jp      $4b7c
7bf2 cd0585    call    $8505
7bf5 dcff21    call    c,$21ff
7bf8 d5        push    de
7bf9 91        sub     c
7bfa e5        push    hl
7bfb 210600    ld      hl,$0006
7bfe 39        add     hl,sp
7bff 44        ld      b,h
7c00 4d        ld      c,l
7c01 e5        push    hl
7c02 cdfa24    call    $24fa
7c05 d1        pop     de
7c06 d1        pop     de
7c07 c5        push    bc
7c08 cd5923    call    $2359
7c0b d1        pop     de
7c0c cd4d1f    call    $1f4d
7c0f cdd671    call    $71d6
7c12 21ffff    ld      hl,$ffff
7c15 22db91    ld      ($91db),hl
7c18 2adb91    ld      hl,($91db)
7c1b 23        inc     hl
7c1c 22db91    ld      ($91db),hl
7c1f e5        push    hl
7c20 218000    ld      hl,$0080
7c23 e5        push    hl
7c24 cdb377    call    $77b3
7c27 d1        pop     de
7c28 d1        pop     de
7c29 2819      jr      z,$7c44
7c2b cd2c20    call    $202c
7c2e c5        push    bc
7c2f 211500    ld      hl,$0015
7c32 e5        push    hl
7c33 cdbc86    call    $86bc
7c36 d1        pop     de
7c37 d1        pop     de
7c38 2808      jr      z,$7c42
7c3a c5        push    bc
7c3b cd3a23    call    $233a
7c3e d1        pop     de
7c3f cd6857    call    $5768
7c42 18d4      jr      $7c18
7c44 cdd671    call    $71d6
7c47 c5        push    bc
7c48 cd3a23    call    $233a
7c4b d1        pop     de
7c4c c37c4b    jp      $4b7c
7c4f 210200    ld      hl,$0002
7c52 39        add     hl,sp
7c53 c5        push    bc
7c54 01ff7f    ld      bc,$7fff
7c57 5e        ld      e,(hl)
7c58 23        inc     hl
7c59 56        ld      d,(hl)
7c5a 23        inc     hl
7c5b 7e        ld      a,(hl)
7c5c 23        inc     hl
7c5d 66        ld      h,(hl)
7c5e 6f        ld      l,a
7c5f 78        ld      a,b
7c60 b1        or      c
7c61 ca737b    jp      z,$7b73
7c64 1a        ld      a,(de)
7c65 be        cp      (hl)
7c66 c2787b    jp      nz,$7b78
7c69 b7        or      a
7c6a ca737b    jp      z,$7b73
7c6d 23        inc     hl
7c6e 13        inc     de
7c6f 0b        dec     bc
7c70 c35f7b    jp      $7b5f
7c73 c1        pop     bc
7c74 210000    ld      hl,$0000
7c77 c9        ret     

7c78 c1        pop     bc
7c79 da827b    jp      c,$7b82
7c7c 210100    ld      hl,$0001
7c7f 7d        ld      a,l
7c80 b4        or      h
7c81 c9        ret     

7c82 21ffff    ld      hl,$ffff
7c85 7d        ld      a,l
7c86 b4        or      h
7c87 c9        ret     

7c88 210200    ld      hl,$0002
7c8b 39        add     hl,sp
7c8c c5        push    bc
7c8d 01ff7f    ld      bc,$7fff
7c90 5e        ld      e,(hl)
7c91 23        inc     hl
7c92 56        ld      d,(hl)
7c93 d5        push    de
7c94 23        inc     hl
7c95 7e        ld      a,(hl)
7c96 23        inc     hl
7c97 66        ld      h,(hl)
7c98 6f        ld      l,a
7c99 78        ld      a,b
7c9a b1        or      c
7c9b caaa7b    jp      z,$7baa
7c9e 7e        ld      a,(hl)
7c9f 12        ld      (de),a
7ca0 b7        or      a
7ca1 caaa7b    jp      z,$7baa
7ca4 23        inc     hl
7ca5 13        inc     de
7ca6 0b        dec     bc
7ca7 c3997b    jp      $7b99
7caa e1        pop     hl
7cab c1        pop     bc
7cac c9        ret     

7cad 210200    ld      hl,$0002
7cb0 39        add     hl,sp
7cb1 7e        ld      a,(hl)
7cb2 23        inc     hl
7cb3 66        ld      h,(hl)
7cb4 6f        ld      l,a
7cb5 110000    ld      de,$0000
7cb8 af        xor     a
7cb9 be        cp      (hl)
7cba cac27b    jp      z,$7bc2
7cbd 13        inc     de
7cbe 23        inc     hl
7cbf c3b97b    jp      $7bb9
7cc2 eb        ex      de,hl
7cc3 7d        ld      a,l
7cc4 b4        or      h
7cc5 c9        ret     

7cc6 210200    ld      hl,$0002
7cc9 39        add     hl,sp
7cca c5        push    bc
7ccb 5e        ld      e,(hl)
7ccc 23        inc     hl
7ccd 56        ld      d,(hl)
7cce d5        push    de
7ccf 23        inc     hl
7cd0 5e        ld      e,(hl)
7cd1 23        inc     hl
7cd2 56        ld      d,(hl)
7cd3 23        inc     hl
7cd4 4e        ld      c,(hl)
7cd5 23        inc     hl
7cd6 46        ld      b,(hl)
7cd7 eb        ex      de,hl
7cd8 d1        pop     de
7cd9 c35f7b    jp      $7b5f
7cdc c5        push    bc
7cdd 01ff7f    ld      bc,$7fff
7ce0 210400    ld      hl,$0004
7ce3 39        add     hl,sp
7ce4 5e        ld      e,(hl)
7ce5 23        inc     hl
7ce6 56        ld      d,(hl)
7ce7 d5        push    de
7ce8 23        inc     hl
7ce9 7e        ld      a,(hl)
7cea 23        inc     hl
7ceb 66        ld      h,(hl)
7cec 6f        ld      l,a
7ced eb        ex      de,hl
7cee 78        ld      a,b
7cef b1        or      c
7cf0 caaa7b    jp      z,$7baa
7cf3 7e        ld      a,(hl)
7cf4 b7        or      a
7cf5 cafd7b    jp      z,$7bfd
7cf8 23        inc     hl
7cf9 0b        dec     bc
7cfa c3ee7b    jp      $7bee
7cfd eb        ex      de,hl
7cfe c3997b    jp      $7b99
7d01 d1        pop     de
7d02 e1        pop     hl
7d03 e5        push    hl
7d04 73        ld      (hl),e
7d05 23        inc     hl
7d06 72        ld      (hl),d
7d07 23        inc     hl
7d08 d5        push    de
7d09 eb        ex      de,hl
7d0a 210000    ld      hl,$0000
7d0d 39        add     hl,sp
7d0e eb        ex      de,hl
7d0f 73        ld      (hl),e
7d10 23        inc     hl
7d11 72        ld      (hl),d
7d12 af        xor     a
7d13 67        ld      h,a
7d14 6f        ld      l,a
7d15 c9        ret     

7d16 e1        pop     hl
7d17 e1        pop     hl
7d18 5e        ld      e,(hl)
7d19 23        inc     hl
7d1a 56        ld      d,(hl)
7d1b 23        inc     hl
7d1c d5        push    de
7d1d 5e        ld      e,(hl)
7d1e 23        inc     hl
7d1f 56        ld      d,(hl)
7d20 e1        pop     hl
7d21 eb        ex      de,hl
7d22 73        ld      (hl),e
7d23 23        inc     hl
7d24 72        ld      (hl),d
7d25 2b        dec     hl
7d26 d1        pop     de
7d27 f9        ld      sp,hl
7d28 eb        ex      de,hl
7d29 7c        ld      a,h
7d2a b5        or      l
7d2b c9        ret     

7d2c eb        ex      de,hl
7d2d 2a3690    ld      hl,($9036)
7d30 c5        push    bc
7d31 1a        ld      a,(de)
7d32 77        ld      (hl),a
7d33 23        inc     hl
7d34 e67f      and     $7f
7d36 d640      sub     $40
7d38 77        ld      (hl),a
7d39 23        inc     hl
7d3a 3600      ld      (hl),$00
7d3c 0603      ld      b,$03
7d3e 23        inc     hl
7d3f 13        inc     de
7d40 1a        ld      a,(de)
7d41 77        ld      (hl),a
7d42 05        dec     b
7d43 c23e7c    jp      nz,$7c3e
7d46 0605      ld      b,$05
7d48 af        xor     a
7d49 23        inc     hl
7d4a 77        ld      (hl),a
7d4b 05        dec     b
7d4c c2497c    jp      nz,$7c49
7d4f c1        pop     bc
7d50 c9        ret     

7d51 d1        pop     de
7d52 210800    ld      hl,$0008
7d55 19        add     hl,de
7d56 e5        push    hl
7d57 eb        ex      de,hl
7d58 eb        ex      de,hl
7d59 2a3890    ld      hl,($9038)
7d5c c36a7c    jp      $7c6a
7d5f d1        pop     de
7d60 210800    ld      hl,$0008
7d63 19        add     hl,de
7d64 e5        push    hl
7d65 eb        ex      de,hl
7d66 eb        ex      de,hl
7d67 2a3690    ld      hl,($9036)
7d6a c5        push    bc
7d6b 1a        ld      a,(de)
7d6c 77        ld      (hl),a
7d6d 23        inc     hl
7d6e e67f      and     $7f
7d70 d640      sub     $40
7d72 77        ld      (hl),a
7d73 23        inc     hl
7d74 3600      ld      (hl),$00
7d76 0607      ld      b,$07
7d78 23        inc     hl
7d79 13        inc     de
7d7a 1a        ld      a,(de)
7d7b 77        ld      (hl),a
7d7c 05        dec     b
7d7d c2787c    jp      nz,$7c78
7d80 23        inc     hl
7d81 3600      ld      (hl),$00
7d83 c1        pop     bc
7d84 c9        ret     

7d85 c5        push    bc
7d86 e5        push    hl
7d87 cd6a80    call    $806a
7d8a d1        pop     de
7d8b 2a3690    ld      hl,($9036)
7d8e 7e        ld      a,(hl)
7d8f e680      and     $80
7d91 47        ld      b,a
7d92 23        inc     hl
7d93 7e        ld      a,(hl)
7d94 c640      add     a,$40
7d96 e67f      and     $7f
7d98 b0        or      b
7d99 12        ld      (de),a
7d9a 23        inc     hl
7d9b 0607      ld      b,$07
7d9d 13        inc     de
7d9e 23        inc     hl
7d9f 7e        ld      a,(hl)
7da0 12        ld      (de),a
7da1 05        dec     b
7da2 c29d7c    jp      nz,$7c9d
7da5 c1        pop     bc
7da6 c9        ret     

7da7 e1        pop     hl
7da8 22dd91    ld      ($91dd),hl
7dab cd6a80    call    $806a
7dae 2a3690    ld      hl,($9036)
7db1 110900    ld      de,$0009
7db4 19        add     hl,de
7db5 56        ld      d,(hl)
7db6 2b        dec     hl
7db7 5e        ld      e,(hl)
7db8 2b        dec     hl
7db9 d5        push    de
7dba 56        ld      d,(hl)
7dbb 2b        dec     hl
7dbc 5e        ld      e,(hl)
7dbd 2b        dec     hl
7dbe d5        push    de
7dbf 56        ld      d,(hl)
7dc0 2b        dec     hl
7dc1 5e        ld      e,(hl)
7dc2 2b        dec     hl
7dc3 d5        push    de
7dc4 56        ld      d,(hl)
7dc5 2b        dec     hl
7dc6 2b        dec     hl
7dc7 7e        ld      a,(hl)
7dc8 c640      add     a,$40
7dca e67f      and     $7f
7dcc 5f        ld      e,a
7dcd 2b        dec     hl
7dce 7e        ld      a,(hl)
7dcf e680      and     $80
7dd1 b3        or      e
7dd2 5f        ld      e,a
7dd3 d5        push    de
7dd4 2add91    ld      hl,($91dd)
7dd7 e9        jp      (hl)
7dd8 e1        pop     hl
7dd9 22dd91    ld      ($91dd),hl
7ddc 2a3890    ld      hl,($9038)
7ddf d1        pop     de
7de0 73        ld      (hl),e
7de1 23        inc     hl
7de2 7b        ld      a,e
7de3 e67f      and     $7f
7de5 d640      sub     $40
7de7 77        ld      (hl),a
7de8 23        inc     hl
7de9 3600      ld      (hl),$00
7deb 23        inc     hl
7dec 72        ld      (hl),d
7ded 23        inc     hl
7dee d1        pop     de
7def 73        ld      (hl),e
7df0 23        inc     hl
7df1 72        ld      (hl),d
7df2 23        inc     hl
7df3 d1        pop     de
7df4 73        ld      (hl),e
7df5 23        inc     hl
7df6 72        ld      (hl),d
7df7 23        inc     hl
7df8 d1        pop     de
7df9 73        ld      (hl),e
7dfa 23        inc     hl
7dfb 72        ld      (hl),d
7dfc 23        inc     hl
7dfd 3600      ld      (hl),$00
7dff 2add91    ld      hl,($91dd)
7e02 e9        jp      (hl)
7e03 2a3890    ld      hl,($9038)
7e06 eb        ex      de,hl
7e07 2a3690    ld      hl,($9036)
7e0a 223890    ld      ($9038),hl
7e0d eb        ex      de,hl
7e0e 223690    ld      ($9036),hl
7e11 c9        ret     

7e12 2a3690    ld      hl,($9036)
7e15 7e        ld      a,(hl)
7e16 ee80      xor     $80
7e18 77        ld      (hl),a
7e19 c9        ret     

7e1a 2a3690    ld      hl,($9036)
7e1d 23        inc     hl
7e1e 7e        ld      a,(hl)
7e1f fec0      cp      $c0
7e21 c24d85    jp      nz,$854d
7e24 c34185    jp      $8541
7e27 af        xor     a
7e28 3d        dec     a
7e29 c1        pop     bc
7e2a c9        ret     

7e2b af        xor     a
7e2c 3c        inc     a
7e2d c1        pop     bc
7e2e c9        ret     

7e2f c5        push    bc
7e30 2a3690    ld      hl,($9036)
7e33 eb        ex      de,hl
7e34 2a3890    ld      hl,($9038)
7e37 1a        ld      a,(de)
7e38 b7        or      a
7e39 fa437d    jp      m,$7d43
7e3c ae        xor     (hl)
7e3d fa2b7d    jp      m,$7d2b
7e40 c3487d    jp      $7d48
7e43 ae        xor     (hl)
7e44 fa277d    jp      m,$7d27
7e47 eb        ex      de,hl
7e48 23        inc     hl
7e49 13        inc     de
7e4a 1a        ld      a,(de)
7e4b be        cp      (hl)
7e4c fa277d    jp      m,$7d27
7e4f c22b7d    jp      nz,$7d2b
7e52 0609      ld      b,$09
7e54 23        inc     hl
7e55 13        inc     de
7e56 1a        ld      a,(de)
7e57 be        cp      (hl)
7e58 da277d    jp      c,$7d27
7e5b c22b7d    jp      nz,$7d2b
7e5e 05        dec     b
7e5f c2547d    jp      nz,$7d54
7e62 af        xor     a
7e63 c1        pop     bc
7e64 c9        ret     

7e65 2a3890    ld      hl,($9038)
7e68 7e        ld      a,(hl)
7e69 ee80      xor     $80
7e6b 77        ld      (hl),a
7e6c c5        push    bc
7e6d 2a3690    ld      hl,($9036)
7e70 110b00    ld      de,$000b
7e73 19        add     hl,de
7e74 0607      ld      b,$07
7e76 af        xor     a
7e77 77        ld      (hl),a
7e78 23        inc     hl
7e79 05        dec     b
7e7a c2777d    jp      nz,$7d77
7e7d 2a3890    ld      hl,($9038)
7e80 110b00    ld      de,$000b
7e83 19        add     hl,de
7e84 0607      ld      b,$07
7e86 77        ld      (hl),a
7e87 23        inc     hl
7e88 05        dec     b
7e89 c2867d    jp      nz,$7d86
7e8c 2a3690    ld      hl,($9036)
7e8f eb        ex      de,hl
7e90 2a3890    ld      hl,($9038)
7e93 23        inc     hl
7e94 13        inc     de
7e95 1a        ld      a,(de)
7e96 96        sub     (hl)
7e97 f29d7d    jp      p,$7d9d
7e9a eb        ex      de,hl
7e9b 2f        cpl     
7e9c 3c        inc     a
7e9d 1b        dec     de
7e9e 2b        dec     hl
7e9f 223890    ld      ($9038),hl
7ea2 eb        ex      de,hl
7ea3 223690    ld      ($9036),hl
7ea6 fe09      cp      $09
7ea8 d29180    jp      nc,$8091
7eab 4f        ld      c,a
7eac e5        push    hl
7ead d5        push    de
7eae c609      add     a,$09
7eb0 5f        ld      e,a
7eb1 1600      ld      d,$00
7eb3 19        add     hl,de
7eb4 22df91    ld      ($91df),hl
7eb7 d1        pop     de
7eb8 210900    ld      hl,$0009
7ebb 19        add     hl,de
7ebc 22e191    ld      ($91e1),hl
7ebf e1        pop     hl
7ec0 eb        ex      de,hl
7ec1 1a        ld      a,(de)
7ec2 ae        xor     (hl)
7ec3 f2237e    jp      p,$7e23
7ec6 1a        ld      a,(de)
7ec7 b7        or      a
7ec8 faea7d    jp      m,$7dea
7ecb 0607      ld      b,$07
7ecd 2adf91    ld      hl,($91df)
7ed0 eb        ex      de,hl
7ed1 2ae191    ld      hl,($91e1)
7ed4 1a        ld      a,(de)
7ed5 9e        sbc     a,(hl)
7ed6 12        ld      (de),a
7ed7 1b        dec     de
7ed8 2b        dec     hl
7ed9 05        dec     b
7eda c2d47d    jp      nz,$7dd4
7edd 1a        ld      a,(de)
7ede de00      sbc     a,$00
7ee0 12        ld      (de),a
7ee1 1b        dec     de
7ee2 0d        dec     c
7ee3 f2dd7d    jp      p,$7ddd
7ee6 eb        ex      de,hl
7ee7 c3057e    jp      $7e05
7eea 0607      ld      b,$07
7eec 2ae191    ld      hl,($91e1)
7eef eb        ex      de,hl
7ef0 2adf91    ld      hl,($91df)
7ef3 1a        ld      a,(de)
7ef4 9e        sbc     a,(hl)
7ef5 77        ld      (hl),a
7ef6 1b        dec     de
7ef7 2b        dec     hl
7ef8 05        dec     b
7ef9 c2f37d    jp      nz,$7df3
7efc 3e00      ld      a,$00
7efe 9e        sbc     a,(hl)
7eff 77        ld      (hl),a
7f00 2b        dec     hl
7f01 0d        dec     c
7f02 f2fc7d    jp      p,$7dfc
7f05 23        inc     hl
7f06 7e        ld      a,(hl)
7f07 b7        or      a
7f08 3e01      ld      a,$01
7f0a f21c7e    jp      p,$7e1c
7f0d 110f00    ld      de,$000f
7f10 19        add     hl,de
7f11 3e00      ld      a,$00
7f13 9e        sbc     a,(hl)
7f14 77        ld      (hl),a
7f15 2b        dec     hl
7f16 1d        dec     e
7f17 f2117e    jp      p,$7e11
7f1a 3e81      ld      a,$81
7f1c 2a3690    ld      hl,($9036)
7f1f 77        ld      (hl),a
7f20 c39180    jp      $8091
7f23 0607      ld      b,$07
7f25 2adf91    ld      hl,($91df)
7f28 eb        ex      de,hl
7f29 2ae191    ld      hl,($91e1)
7f2c 1a        ld      a,(de)
7f2d 8e        adc     a,(hl)
7f2e 12        ld      (de),a
7f2f 1b        dec     de
7f30 2b        dec     hl
7f31 05        dec     b
7f32 c22c7e    jp      nz,$7e2c
7f35 1a        ld      a,(de)
7f36 ce00      adc     a,$00
7f38 12        ld      (de),a
7f39 1b        dec     de
7f3a 0d        dec     c
7f3b f2357e    jp      p,$7e35
7f3e c39180    jp      $8091
7f41 c5        push    bc
7f42 2a3690    ld      hl,($9036)
7f45 eb        ex      de,hl
7f46 2a3890    ld      hl,($9038)
7f49 1a        ld      a,(de)
7f4a ae        xor     (hl)
7f4b 12        ld      (de),a
7f4c 23        inc     hl
7f4d 13        inc     de
7f4e 1a        ld      a,(de)
7f4f 96        sub     (hl)
7f50 4f        ld      c,a
7f51 d5        push    de
7f52 e5        push    hl
7f53 7e        ld      a,(hl)
7f54 fec0      cp      $c0
7f56 c25e7e    jp      nz,$7e5e
7f59 e1        pop     hl
7f5a e1        pop     hl
7f5b c31c81    jp      $811c
7f5e 13        inc     de
7f5f 23        inc     hl
7f60 0608      ld      b,$08
7f62 13        inc     de
7f63 23        inc     hl
7f64 1a        ld      a,(de)
7f65 be        cp      (hl)
7f66 c27d7e    jp      nz,$7e7d
7f69 05        dec     b
7f6a c2627e    jp      nz,$7e62
7f6d e1        pop     hl
7f6e e1        pop     hl
7f6f 0c        inc     c
7f70 71        ld      (hl),c
7f71 23        inc     hl
7f72 3600      ld      (hl),$00
7f74 23        inc     hl
7f75 3601      ld      (hl),$01
7f77 0608      ld      b,$08
7f79 af        xor     a
7f7a c3b580    jp      $80b5
7f7d d1        pop     de
7f7e e1        pop     hl
7f7f 71        ld      (hl),c
7f80 da867e    jp      c,$7e86
7f83 0c        inc     c
7f84 71        ld      (hl),c
7f85 2b        dec     hl
7f86 d5        push    de
7f87 110900    ld      de,$0009
7f8a 19        add     hl,de
7f8b 0608      ld      b,$08
7f8d 111192    ld      de,$9211
7f90 7e        ld      a,(hl)
7f91 12        ld      (de),a
7f92 2b        dec     hl
7f93 13        inc     de
7f94 05        dec     b
7f95 c2907e    jp      nz,$7e90
7f98 e1        pop     hl
7f99 110900    ld      de,$0009
7f9c 19        add     hl,de
7f9d 0608      ld      b,$08
7f9f 111992    ld      de,$9219
7fa2 7e        ld      a,(hl)
7fa3 12        ld      (de),a
7fa4 2b        dec     hl
7fa5 13        inc     de
7fa6 05        dec     b
7fa7 c2a27e    jp      nz,$7ea2
7faa 0608      ld      b,$08
7fac 210992    ld      hl,$9209
7faf af        xor     a
7fb0 77        ld      (hl),a
7fb1 23        inc     hl
7fb2 05        dec     b
7fb3 c2b07e    jp      nz,$7eb0
7fb6 3e40      ld      a,$40
7fb8 320892    ld      ($9208),a
7fbb 210992    ld      hl,$9209
7fbe 0610      ld      b,$10
7fc0 b7        or      a
7fc1 7e        ld      a,(hl)
7fc2 8f        adc     a,a
7fc3 77        ld      (hl),a
7fc4 23        inc     hl
7fc5 05        dec     b
7fc6 c2c17e    jp      nz,$7ec1
7fc9 9f        sbc     a,a
7fca e601      and     $01
7fcc 4f        ld      c,a
7fcd 0608      ld      b,$08
7fcf 111192    ld      de,$9211
7fd2 211992    ld      hl,$9219
7fd5 b7        or      a
7fd6 1a        ld      a,(de)
7fd7 9e        sbc     a,(hl)
7fd8 12        ld      (de),a
7fd9 13        inc     de
7fda 23        inc     hl
7fdb 05        dec     b
7fdc c2d67e    jp      nz,$7ed6
7fdf 79        ld      a,c
7fe0 de00      sbc     a,$00
7fe2 c2f37e    jp      nz,$7ef3
7fe5 210992    ld      hl,$9209
7fe8 34        inc     (hl)
7fe9 210892    ld      hl,$9208
7fec 35        dec     (hl)
7fed c2bb7e    jp      nz,$7ebb
7ff0 c3257f    jp      $7f25
7ff3 210892    ld      hl,$9208
7ff6 35        dec     (hl)
7ff7 ca257f    jp      z,$7f25
7ffa 210992    ld      hl,$9209
7ffd 0610      ld      b,$10
7fff b7        or      a
8000 7e        ld      a,(hl)
8001 8f        adc     a,a
8002 77        ld      (hl),a
8003 23        inc     hl
8004 05        dec     b
8005 c2007f    jp      nz,$7f00
8008 9f        sbc     a,a
8009 4f        ld      c,a
800a 0608      ld      b,$08
800c 111192    ld      de,$9211
800f 211992    ld      hl,$9219
8012 b7        or      a
8013 1a        ld      a,(de)
8014 8e        adc     a,(hl)
8015 12        ld      (de),a
8016 13        inc     de
8017 23        inc     hl
8018 05        dec     b
8019 c2137f    jp      nz,$7f13
801c 79        ld      a,c
801d ce00      adc     a,$00
801f c2f37e    jp      nz,$7ef3
8022 c3e57e    jp      $7ee5
8025 2a3690    ld      hl,($9036)
8028 110c00    ld      de,$000c
802b 19        add     hl,de
802c 3600      ld      (hl),$00
802e 2b        dec     hl
802f 3600      ld      (hl),$00
8031 110992    ld      de,$9209
8034 0608      ld      b,$08
8036 2b        dec     hl
8037 1a        ld      a,(de)
8038 77        ld      (hl),a
8039 13        inc     de
803a 05        dec     b
803b c2367f    jp      nz,$7f36
803e c39180    jp      $8091
8041 c5        push    bc
8042 2a3690    ld      hl,($9036)
8045 eb        ex      de,hl
8046 2a3890    ld      hl,($9038)
8049 1a        ld      a,(de)
804a ae        xor     (hl)
804b 12        ld      (de),a
804c 23        inc     hl
804d 13        inc     de
804e 1a        ld      a,(de)
804f fec0      cp      $c0
8051 caab80    jp      z,$80ab
8054 86        add     a,(hl)
8055 12        ld      (de),a
8056 7e        ld      a,(hl)
8057 fec0      cp      $c0
8059 caab80    jp      z,$80ab
805c d5        push    de
805d 110900    ld      de,$0009
8060 19        add     hl,de
8061 0608      ld      b,$08
8063 111992    ld      de,$9219
8066 7e        ld      a,(hl)
8067 12        ld      (de),a
8068 2b        dec     hl
8069 13        inc     de
806a 05        dec     b
806b c2667f    jp      nz,$7f66
806e e1        pop     hl
806f 110900    ld      de,$0009
8072 19        add     hl,de
8073 0608      ld      b,$08
8075 111192    ld      de,$9211
8078 7e        ld      a,(hl)
8079 12        ld      (de),a
807a 2b        dec     hl
807b 13        inc     de
807c 05        dec     b
807d c2787f    jp      nz,$7f78
8080 0608      ld      b,$08
8082 210992    ld      hl,$9209
8085 af        xor     a
8086 77        ld      (hl),a
8087 23        inc     hl
8088 05        dec     b
8089 c2867f    jp      nz,$7f86
808c 3e40      ld      a,$40
808e 320892    ld      ($9208),a
8091 210992    ld      hl,$9209
8094 0610      ld      b,$10
8096 b7        or      a
8097 7e        ld      a,(hl)
8098 8f        adc     a,a
8099 77        ld      (hl),a
809a 23        inc     hl
809b 05        dec     b
809c c2977f    jp      nz,$7f97
809f d2c27f    jp      nc,$7fc2
80a2 0608      ld      b,$08
80a4 110992    ld      de,$9209
80a7 211992    ld      hl,$9219
80aa b7        or      a
80ab 1a        ld      a,(de)
80ac 8e        adc     a,(hl)
80ad 12        ld      (de),a
80ae 13        inc     de
80af 23        inc     hl
80b0 05        dec     b
80b1 c2ab7f    jp      nz,$7fab
80b4 0608      ld      b,$08
80b6 1a        ld      a,(de)
80b7 ce00      adc     a,$00
80b9 12        ld      (de),a
80ba d2c27f    jp      nc,$7fc2
80bd 13        inc     de
80be 05        dec     b
80bf c2b67f    jp      nz,$7fb6
80c2 210892    ld      hl,$9208
80c5 35        dec     (hl)
80c6 c2917f    jp      nz,$7f91
80c9 2a3690    ld      hl,($9036)
80cc 110c00    ld      de,$000c
80cf 19        add     hl,de
80d0 110f92    ld      de,$920f
80d3 060a      ld      b,$0a
80d5 1a        ld      a,(de)
80d6 77        ld      (hl),a
80d7 13        inc     de
80d8 2b        dec     hl
80d9 05        dec     b
80da c2d57f    jp      nz,$7fd5
80dd c39180    jp      $8091
80e0 cd2f7d    call    $7d2f
80e3 ca4d85    jp      z,$854d
80e6 c34185    jp      $8541
80e9 cd2f7d    call    $7d2f
80ec ca4185    jp      z,$8541
80ef c34d85    jp      $854d
80f2 cd2f7d    call    $7d2f
80f5 fa4d85    jp      m,$854d
80f8 c34185    jp      $8541
80fb cd2f7d    call    $7d2f
80fe fa4d85    jp      m,$854d
8101 ca4d85    jp      z,$854d
8104 c34185    jp      $8541
8107 cd2f7d    call    $7d2f
810a fa4185    jp      m,$8541
810d c34d85    jp      $854d
8110 cd2f7d    call    $7d2f
8113 fa4185    jp      m,$8541
8116 ca4185    jp      z,$8541
8119 c34d85    jp      $854d
811c c5        push    bc
811d 7c        ld      a,h
811e b5        or      l
811f caab80    jp      z,$80ab
8122 eb        ex      de,hl
8123 0600      ld      b,$00
8125 c33e80    jp      $803e
8128 c5        push    bc
8129 7c        ld      a,h
812a b5        or      l
812b caab80    jp      z,$80ab
812e eb        ex      de,hl
812f 0600      ld      b,$00
8131 7a        ld      a,d
8132 b7        or      a
8133 f23e80    jp      p,$803e
8136 2f        cpl     
8137 57        ld      d,a
8138 7b        ld      a,e
8139 2f        cpl     
813a 5f        ld      e,a
813b 13        inc     de
813c 0680      ld      b,$80
813e 2a3690    ld      hl,($9036)
8141 70        ld      (hl),b
8142 23        inc     hl
8143 7a        ld      a,d
8144 b7        or      a
8145 c25580    jp      nz,$8055
8148 3601      ld      (hl),$01
814a 23        inc     hl
814b 3600      ld      (hl),$00
814d 23        inc     hl
814e 73        ld      (hl),e
814f 0607      ld      b,$07
8151 af        xor     a
8152 c36180    jp      $8061
8155 3602      ld      (hl),$02
8157 23        inc     hl
8158 3600      ld      (hl),$00
815a 23        inc     hl
815b 72        ld      (hl),d
815c 23        inc     hl
815d 73        ld      (hl),e
815e 0606      ld      b,$06
8160 af        xor     a
8161 23        inc     hl
8162 77        ld      (hl),a
8163 05        dec     b
8164 c26180    jp      nz,$8061
8167 c3ef80    jp      $80ef
816a 2a3690    ld      hl,($9036)
816d 110a00    ld      de,$000a
8170 19        add     hl,de
8171 7e        ld      a,(hl)
8172 fe80      cp      $80
8174 d8        ret     c

8175 c27e80    jp      nz,$807e
8178 2b        dec     hl
8179 7e        ld      a,(hl)
817a f601      or      $01
817c 77        ld      (hl),a
817d c9        ret     

817e c5        push    bc
817f 010008    ld      bc,$0800
8182 37        scf     
8183 2b        dec     hl
8184 7e        ld      a,(hl)
8185 89        adc     a,c
8186 77        ld      (hl),a
8187 05        dec     b
8188 c28380    jp      nz,$8083
818b b7        or      a
818c c29180    jp      nz,$8091
818f c1        pop     bc
8190 c9        ret     

8191 2a3690    ld      hl,($9036)
8194 23        inc     hl
8195 7e        ld      a,(hl)
8196 54        ld      d,h
8197 5d        ld      e,l
8198 23        inc     hl
8199 4f        ld      c,a
819a af        xor     a
819b be        cp      (hl)
819c c2f180    jp      nz,$80f1
819f 0608      ld      b,$08
81a1 23        inc     hl
81a2 be        cp      (hl)
81a3 c2bd80    jp      nz,$80bd
81a6 0d        dec     c
81a7 05        dec     b
81a8 c2a180    jp      nz,$80a1
81ab af        xor     a
81ac 2a3690    ld      hl,($9036)
81af 060a      ld      b,$0a
81b1 77        ld      (hl),a
81b2 23        inc     hl
81b3 36c0      ld      (hl),$c0
81b5 23        inc     hl
81b6 77        ld      (hl),a
81b7 05        dec     b
81b8 c2b580    jp      nz,$80b5
81bb c1        pop     bc
81bc c9        ret     

81bd 3e08      ld      a,$08
81bf 90        sub     b
81c0 47        ld      b,a
81c1 cadd80    jp      z,$80dd
81c4 2b        dec     hl
81c5 79        ld      a,c
81c6 12        ld      (de),a
81c7 d5        push    de
81c8 13        inc     de
81c9 3e0f      ld      a,$0f
81cb 90        sub     b
81cc 4f        ld      c,a
81cd 7e        ld      a,(hl)
81ce 12        ld      (de),a
81cf 13        inc     de
81d0 23        inc     hl
81d1 0d        dec     c
81d2 c2cd80    jp      nz,$80cd
81d5 af        xor     a
81d6 12        ld      (de),a
81d7 13        inc     de
81d8 05        dec     b
81d9 c2d680    jp      nz,$80d6
81dc d1        pop     de
81dd 1a        ld      a,(de)
81de b7        or      a
81df faea80    jp      m,$80ea
81e2 fe40      cp      $40
81e4 daef80    jp      c,$80ef
81e7 c31c81    jp      $811c
81ea fec1      cp      $c1
81ec da0b81    jp      c,$810b
81ef c1        pop     bc
81f0 c9        ret     

81f1 0c        inc     c
81f2 79        ld      a,c
81f3 12        ld      (de),a
81f4 060f      ld      b,$0f
81f6 d5        push    de
81f7 211000    ld      hl,$0010
81fa 19        add     hl,de
81fb 54        ld      d,h
81fc 5d        ld      e,l
81fd 1b        dec     de
81fe 1a        ld      a,(de)
81ff 77        ld      (hl),a
8200 2b        dec     hl
8201 05        dec     b
8202 c2fd80    jp      nz,$80fd
8205 3600      ld      (hl),$00
8207 d1        pop     de
8208 c3dd80    jp      $80dd
820b af        xor     a
820c 2a3690    ld      hl,($9036)
820f 23        inc     hl
8210 36c1      ld      (hl),$c1
8212 23        inc     hl
8213 77        ld      (hl),a
8214 23        inc     hl
8215 3601      ld      (hl),$01
8217 0608      ld      b,$08
8219 c3b580    jp      $80b5
821c 2a3690    ld      hl,($9036)
821f 23        inc     hl
8220 363f      ld      (hl),$3f
8222 23        inc     hl
8223 3600      ld      (hl),$00
8225 3eff      ld      a,$ff
8227 0607      ld      b,$07
8229 23        inc     hl
822a 77        ld      (hl),a
822b 05        dec     b
822c c22981    jp      nz,$8129
822f 23        inc     hl
8230 3600      ld      (hl),$00
8232 c1        pop     bc
8233 c9        ret     

8234 c5        push    bc
8235 2a3690    ld      hl,($9036)
8238 3600      ld      (hl),$00
823a 23        inc     hl
823b 3603      ld      (hl),$03
823d 110400    ld      de,$0004
8240 19        add     hl,de
8241 5d        ld      e,l
8242 54        ld      d,h
8243 0605      ld      b,$05
8245 af        xor     a
8246 23        inc     hl
8247 77        ld      (hl),a
8248 05        dec     b
8249 c24681    jp      nz,$8146
824c 0604      ld      b,$04
824e 2a3290    ld      hl,($9032)
8251 23        inc     hl
8252 23        inc     hl
8253 23        inc     hl
8254 7e        ld      a,(hl)
8255 2a3290    ld      hl,($9032)
8258 b7        or      a
8259 f26d81    jp      p,$816d
825c 3e00      ld      a,$00
825e 9e        sbc     a,(hl)
825f 12        ld      (de),a
8260 23        inc     hl
8261 1b        dec     de
8262 05        dec     b
8263 c25c81    jp      nz,$815c
8266 1b        dec     de
8267 3e80      ld      a,$80
8269 12        ld      (de),a
826a c39180    jp      $8091
826d 7e        ld      a,(hl)
826e 12        ld      (de),a
826f 23        inc     hl
8270 1b        dec     de
8271 05        dec     b
8272 c26d81    jp      nz,$816d
8275 c39180    jp      $8091
8278 c5        push    bc
8279 2a3290    ld      hl,($9032)
827c 54        ld      d,h
827d 5d        ld      e,l
827e af        xor     a
827f 77        ld      (hl),a
8280 23        inc     hl
8281 77        ld      (hl),a
8282 23        inc     hl
8283 77        ld      (hl),a
8284 23        inc     hl
8285 77        ld      (hl),a
8286 2a3690    ld      hl,($9036)
8289 4e        ld      c,(hl)
828a 23        inc     hl
828b 7e        ld      a,(hl)
828c b7        or      a
828d caef80    jp      z,$80ef
8290 faef80    jp      m,$80ef
8293 fe05      cp      $05
8295 d2be81    jp      nc,$81be
8298 47        ld      b,a
8299 23        inc     hl
829a 85        add     a,l
829b 6f        ld      l,a
829c d2a081    jp      nc,$81a0
829f 24        inc     h
82a0 7e        ld      a,(hl)
82a1 12        ld      (de),a
82a2 13        inc     de
82a3 2b        dec     hl
82a4 05        dec     b
82a5 c2a081    jp      nz,$81a0
82a8 79        ld      a,c
82a9 b7        or      a
82aa f2ef80    jp      p,$80ef
82ad 0604      ld      b,$04
82af 2a3290    ld      hl,($9032)
82b2 3e00      ld      a,$00
82b4 9e        sbc     a,(hl)
82b5 77        ld      (hl),a
82b6 23        inc     hl
82b7 05        dec     b
82b8 c2b281    jp      nz,$81b2
82bb c3ef80    jp      $80ef
82be eb        ex      de,hl
82bf 79        ld      a,c
82c0 b7        or      a
82c1 fad281    jp      m,$81d2
82c4 367f      ld      (hl),$7f
82c6 23        inc     hl
82c7 36ff      ld      (hl),$ff
82c9 23        inc     hl
82ca 36ff      ld      (hl),$ff
82cc 23        inc     hl
82cd 36ff      ld      (hl),$ff
82cf c33982    jp      $8239
82d2 3680      ld      (hl),$80
82d4 23        inc     hl
82d5 3600      ld      (hl),$00
82d7 23        inc     hl
82d8 3600      ld      (hl),$00
82da 23        inc     hl
82db 3600      ld      (hl),$00
82dd c33982    jp      $8239
82e0 c5        push    bc
82e1 0e00      ld      c,$00
82e3 c3e981    jp      $81e9
82e6 c5        push    bc
82e7 0e01      ld      c,$01
82e9 2a3690    ld      hl,($9036)
82ec 46        ld      b,(hl)
82ed 23        inc     hl
82ee 7e        ld      a,(hl)
82ef b7        or      a
82f0 caf681    jp      z,$81f6
82f3 f2fc81    jp      p,$81fc
82f6 210000    ld      hl,$0000
82f9 c3ef80    jp      $80ef
82fc fe03      cp      $03
82fe d22082    jp      nc,$8220
8301 23        inc     hl
8302 85        add     a,l
8303 6f        ld      l,a
8304 d20882    jp      nc,$8208
8307 24        inc     h
8308 5e        ld      e,(hl)
8309 2b        dec     hl
830a 56        ld      d,(hl)
830b eb        ex      de,hl
830c 79        ld      a,c
830d b7        or      a
830e caef80    jp      z,$80ef
8311 78        ld      a,b
8312 b7        or      a
8313 f2ef80    jp      p,$80ef
8316 7c        ld      a,h
8317 2f        cpl     
8318 67        ld      h,a
8319 7d        ld      a,l
831a 2f        cpl     
831b 6f        ld      l,a
831c 23        inc     hl
831d c3ef80    jp      $80ef
8320 79        ld      a,c
8321 b7        or      a
8322 c22b82    jp      nz,$822b
8325 21ffff    ld      hl,$ffff
8328 c33982    jp      $8239
832b 78        ld      a,b
832c b7        or      a
832d fa3682    jp      m,$8236
8330 21ff7f    ld      hl,$7fff
8333 c33982    jp      $8239
8336 210080    ld      hl,$8000
8339 c1        pop     bc
833a c9        ret     

833b 40        ld      b,b
833c 80        add     a,b
833d 00        nop     
833e 00        nop     
833f 00        nop     
8340 00        nop     
8341 00        nop     
8342 00        nop     
8343 40        ld      b,b
8344 0c        inc     c
8345 cccccc    call    z,$cccc
8348 cccccd    call    z,$cdcc
834b 40        ld      b,b
834c 0147ae    ld      bc,$ae47
834f 14        inc     d
8350 7a        ld      a,d
8351 e1        pop     hl
8352 48        ld      c,b
8353 3f        ccf     
8354 20c4      jr      nz,$831a
8356 9b        sbc     a,e
8357 a5        and     l
8358 e3        ex      (sp),hl
8359 54        ld      d,h
835a 00        nop     
835b 3f        ccf     
835c 03        inc     bc
835d 46        ld      b,(hl)
835e dc5d63    call    c,$635d
8361 88        adc     a,b
8362 66        ld      h,(hl)
8363 3e53      ld      a,$53
8365 e2d623    jp      po,$23d6
8368 8d        adc     a,l
8369 a3        and     e
836a cd3e08    call    $083e
836d 63        ld      h,e
836e 7b        ld      a,e
836f d0        ret     nc

8370 5a        ld      e,d
8371 f6c8      or      $c8
8373 3d        dec     a
8374 d6bf      sub     $bf
8376 94        sub     h
8377 d5        push    de
8378 e5        push    hl
8379 7a        ld      a,d
837a 66        ld      h,(hl)
837b 3d        dec     a
837c 15        dec     d
837d 79        ld      a,c
837e 8e        adc     a,(hl)
837f e2308c    jp      po,$8c30
8382 3d        dec     a
8383 3d        dec     a
8384 02        ld      (bc),a
8385 25        dec     h
8386 c1        pop     bc
8387 7d        ld      a,l
8388 04        inc     b
8389 dad33c    jp      c,$3cd3
838c 36f9      ld      (hl),$f9
838e bf        cp      a
838f b3        or      e
8390 af        xor     a
8391 7b        ld      a,e
8392 80        add     a,b
8393 3c        inc     a
8394 05        dec     b
8395 7f        ld      a,a
8396 5f        ld      e,a
8397 f8        ret     m

8398 5e        ld      e,(hl)
8399 59        ld      e,c
839a 263b      ld      h,$3b
839c 8c        adc     a,h
839d bc        cp      h
839e cc096f    call    z,$6f09
83a1 50        ld      d,b
83a2 9a        sbc     a,d
83a3 3b        dec     sp
83a4 0e12      ld      c,$12
83a6 e1        pop     hl
83a7 34        inc     (hl)
83a8 24        inc     h
83a9 bb        cp      e
83aa 43        ld      b,e
83ab 3b        dec     sp
83ac 016849    ld      bc,$4968
83af b8        cp      b
83b0 6a        ld      l,d
83b1 12        ld      (de),a
83b2 ba        cp      d
83b3 3a2407    ld      a,($0724)
83b6 5f        ld      e,a
83b7 3d        dec     a
83b8 ceac      adc     a,$ac
83ba 33        inc     sp
83bb 3a039a    ld      a,($9a03)
83be 56        ld      d,(hl)
83bf 52        ld      d,d
83c0 fb        ei      
83c1 1138c5    ld      de,$c538
83c4 210c00    ld      hl,$000c
83c7 39        add     hl,sp
83c8 5e        ld      e,(hl)
83c9 23        inc     hl
83ca 56        ld      d,(hl)
83cb eb        ex      de,hl
83cc 222192    ld      ($9221),hl
83cf 210400    ld      hl,$0004
83d2 39        add     hl,sp
83d3 cd667c    call    $7c66
83d6 210f00    ld      hl,$000f
83d9 222392    ld      ($9223),hl
83dc 2a3690    ld      hl,($9036)
83df 7e        ld      a,(hl)
83e0 b7        or      a
83e1 f2f082    jp      p,$82f0
83e4 cd127d    call    $7d12
83e7 2a2192    ld      hl,($9221)
83ea 362d      ld      (hl),$2d
83ec 23        inc     hl
83ed 222192    ld      ($9221),hl
83f0 010000    ld      bc,$0000
83f3 cd1a7d    call    $7d1a
83f6 ca7683    jp      z,$8376
83f9 cd517c    call    $7c51
83fc 41        ld      b,c
83fd 0a        ld      a,(bc)
83fe 00        nop     
83ff 00        nop     
8400 00        nop     
8401 00        nop     
8402 00        nop     
8403 00        nop     
8404 2a3690    ld      hl,($9036)
8407 23        inc     hl
8408 7e        ld      a,(hl)
8409 fe01      cp      $01
840b fa6f83    jp      m,$836f
840e ca5683    jp      z,$8356
8411 fe02      cp      $02
8413 c21e83    jp      nz,$831e
8416 23        inc     hl
8417 23        inc     hl
8418 7e        ld      a,(hl)
8419 fe27      cp      $27
841b da5e83    jp      c,$835e
841e cd6f84    call    $846f
8421 cd517c    call    $7c51
8424 40        ld      b,b
8425 19        add     hl,de
8426 99        sbc     a,c
8427 99        sbc     a,c
8428 99        sbc     a,c
8429 99        sbc     a,c
842a 99        sbc     a,c
842b 9a        sbc     a,d
842c cd7b84    call    $847b
842f 03        inc     bc
8430 cdf27f    call    $7ff2
8433 c22c83    jp      nz,$832c
8436 cd6f84    call    $846f
8439 2a3690    ld      hl,($9036)
843c 23        inc     hl
843d 23        inc     hl
843e 23        inc     hl
843f 7e        ld      a,(hl)
8440 fe0a      cp      $0a
8442 da7683    jp      c,$8376
8445 0b        dec     bc
8446 cd7b84    call    $847b
8449 c37683    jp      $8376
844c 2a3690    ld      hl,($9036)
844f 23        inc     hl
8450 7e        ld      a,(hl)
8451 fe01      cp      $01
8453 c25e83    jp      nz,$835e
8456 23        inc     hl
8457 23        inc     hl
8458 7e        ld      a,(hl)
8459 fe0a      cp      $0a
845b da7683    jp      c,$8376
845e cd417e    call    $7e41
8461 03        inc     bc
8462 c34c83    jp      $834c
8465 2a3690    ld      hl,($9036)
8468 23        inc     hl
8469 7e        ld      a,(hl)
846a fe01      cp      $01
846c f27683    jp      p,$8376
846f cd7b84    call    $847b
8472 0b        dec     bc
8473 c36583    jp      $8365
8476 2a2392    ld      hl,($9223)
8479 2b        dec     hl
847a 29        add     hl,hl
847b 29        add     hl,hl
847c 29        add     hl,hl
847d 113b82    ld      de,$823b
8480 19        add     hl,de
8481 cd587c    call    $7c58
8484 cd6c7d    call    $7d6c
8487 cd517c    call    $7c51
848a 41        ld      b,c
848b 0a        ld      a,(bc)
848c 00        nop     
848d 00        nop     
848e 00        nop     
848f 00        nop     
8490 00        nop     
8491 00        nop     
8492 cd0780    call    $8007
8495 caa683    jp      z,$83a6
8498 210100    ld      hl,$0001
849b cd1c80    call    $801c
849e 03        inc     bc
849f 2a2392    ld      hl,($9223)
84a2 23        inc     hl
84a3 222392    ld      ($9223),hl
84a6 60        ld      h,b
84a7 69        ld      l,c
84a8 222592    ld      ($9225),hl
84ab 3eff      ld      a,$ff
84ad 322792    ld      ($9227),a
84b0 78        ld      a,b
84b1 b7        or      a
84b2 fabe83    jp      m,$83be
84b5 79        ld      a,c
84b6 fe0f      cp      $0f
84b8 d2c583    jp      nc,$83c5
84bb c3e583    jp      $83e5
84be 79        ld      a,c
84bf 2f        cpl     
84c0 fe01      cp      $01
84c2 dacc83    jp      c,$83cc
84c5 af        xor     a
84c6 322792    ld      ($9227),a
84c9 c3e583    jp      $83e5
84cc 2a2192    ld      hl,($9221)
84cf 3630      ld      (hl),$30
84d1 23        inc     hl
84d2 362e      ld      (hl),$2e
84d4 23        inc     hl
84d5 b7        or      a
84d6 cae083    jp      z,$83e0
84d9 3630      ld      (hl),$30
84db 23        inc     hl
84dc 3d        dec     a
84dd c2d983    jp      nz,$83d9
84e0 222192    ld      ($9221),hl
84e3 3eff      ld      a,$ff
84e5 4f        ld      c,a
84e6 06ff      ld      b,$ff
84e8 04        inc     b
84e9 3a2392    ld      a,($9223)
84ec b8        cp      b
84ed da1a84    jp      c,$841a
84f0 ca1a84    jp      z,$841a
84f3 2a3690    ld      hl,($9036)
84f6 23        inc     hl
84f7 7e        ld      a,(hl)
84f8 fe01      cp      $01
84fa 3e30      ld      a,$30
84fc c20484    jp      nz,$8404
84ff 23        inc     hl
8500 23        inc     hl
8501 86        add     a,(hl)
8502 3600      ld      (hl),$00
8504 2a2192    ld      hl,($9221)
8507 77        ld      (hl),a
8508 23        inc     hl
8509 78        ld      a,b
850a b9        cp      c
850b c21184    jp      nz,$8411
850e 362e      ld      (hl),$2e
8510 23        inc     hl
8511 222192    ld      ($9221),hl
8514 cd7b84    call    $847b
8517 c3e883    jp      $83e8
851a 2a2192    ld      hl,($9221)
851d 2b        dec     hl
851e 7e        ld      a,(hl)
851f fe30      cp      $30
8521 ca1d84    jp      z,$841d
8524 3a2792    ld      a,($9227)
8527 b7        or      a
8528 ca3584    jp      z,$8435
852b 7e        ld      a,(hl)
852c fe2e      cp      $2e
852e ca6b84    jp      z,$846b
8531 23        inc     hl
8532 c36b84    jp      $846b
8535 23        inc     hl
8536 3665      ld      (hl),$65
8538 23        inc     hl
8539 362b      ld      (hl),$2b
853b 3a2692    ld      a,($9226)
853e b7        or      a
853f 3a2592    ld      a,($9225)
8542 f24984    jp      p,$8449
8545 362d      ld      (hl),$2d
8547 2f        cpl     
8548 3c        inc     a
8549 23        inc     hl
854a fe64      cp      $64
854c da5484    jp      c,$8454
854f 3631      ld      (hl),$31
8551 23        inc     hl
8552 d664      sub     $64
8554 0600      ld      b,$00
8556 fe0a      cp      $0a
8558 da6184    jp      c,$8461
855b 04        inc     b
855c d60a      sub     $0a
855e c35684    jp      $8456
8561 c630      add     a,$30
8563 5f        ld      e,a
8564 3e30      ld      a,$30
8566 80        add     a,b
8567 77        ld      (hl),a
8568 23        inc     hl
8569 73        ld      (hl),e
856a 23        inc     hl
856b 3600      ld      (hl),$00
856d c1        pop     bc
856e c9        ret     

856f cd037d    call    $7d03
8572 210100    ld      hl,$0001
8575 cd1c80    call    $801c
8578 c3417e    jp      $7e41
857b c5        push    bc
857c 2a3690    ld      hl,($9036)
857f 23        inc     hl
8580 34        inc     (hl)
8581 110900    ld      de,$0009
8584 19        add     hl,de
8585 af        xor     a
8586 0608      ld      b,$08
8588 c5        push    bc
8589 5e        ld      e,(hl)
858a eb        ex      de,hl
858b 2600      ld      h,$00
858d 29        add     hl,hl
858e 44        ld      b,h
858f 4d        ld      c,l
8590 29        add     hl,hl
8591 29        add     hl,hl
8592 09        add     hl,bc
8593 eb        ex      de,hl
8594 83        add     a,e
8595 23        inc     hl
8596 77        ld      (hl),a
8597 7a        ld      a,d
8598 ce00      adc     a,$00
859a 2b        dec     hl
859b 2b        dec     hl
859c c1        pop     bc
859d 05        dec     b
859e c28884    jp      nz,$8488
85a1 23        inc     hl
85a2 77        ld      (hl),a
85a3 b7        or      a
85a4 ca9180    jp      z,$8091
85a7 2b        dec     hl
85a8 2b        dec     hl
85a9 7e        ld      a,(hl)
85aa b7        or      a
85ab fab384    jp      m,$84b3
85ae fe40      cp      $40
85b0 d21c81    jp      nc,$811c
85b3 c1        pop     bc
85b4 c9        ret     

85b5 210200    ld      hl,$0002
85b8 39        add     hl,sp
85b9 7e        ld      a,(hl)
85ba fe20      cp      $20
85bc ca4d85    jp      z,$854d
85bf fe09      cp      $09
85c1 ca4d85    jp      z,$854d
85c4 fe0a      cp      $0a
85c6 ca4d85    jp      z,$854d
85c9 c34185    jp      $8541
85cc c34d85    jp      $854d
85cf c34185    jp      $8541
85d2 210200    ld      hl,$0002
85d5 39        add     hl,sp
85d6 7e        ld      a,(hl)
85d7 fe61      cp      $61
85d9 dae384    jp      c,$84e3
85dc fe7b      cp      $7b
85de d2e384    jp      nc,$84e3
85e1 d620      sub     $20
85e3 6f        ld      l,a
85e4 2600      ld      h,$00
85e6 c9        ret     

85e7 210200    ld      hl,$0002
85ea 39        add     hl,sp
85eb 7e        ld      a,(hl)
85ec fe41      cp      $41
85ee daf884    jp      c,$84f8
85f1 fe5b      cp      $5b
85f3 d2f884    jp      nc,$84f8
85f6 c620      add     a,$20
85f8 6f        ld      l,a
85f9 2600      ld      h,$00
85fb c9        ret     

85fc 7c        ld      a,h
85fd a2        and     d
85fe 67        ld      h,a
85ff 7d        ld      a,l
8600 a3        and     e
8601 6f        ld      l,a
8602 b4        or      h
8603 c9        ret     

8604 e9        jp      (hl)
8605 e1        pop     hl
8606 c5        push    bc
8607 5e        ld      e,(hl)
8608 23        inc     hl
8609 56        ld      d,(hl)
860a 23        inc     hl
860b 44        ld      b,h
860c 4d        ld      c,l
860d 210000    ld      hl,$0000
8610 39        add     hl,sp
8611 eb        ex      de,hl
8612 39        add     hl,sp
8613 f9        ld      sp,hl
8614 d5        push    de
8615 60        ld      h,b
8616 69        ld      l,c
8617 cd0485    call    $8504
861a eb        ex      de,hl
861b e1        pop     hl
861c f9        ld      sp,hl
861d c1        pop     bc
861e eb        ex      de,hl
861f 7c        ld      a,h
8620 b5        or      l
8621 c9        ret     

8622 7a        ld      a,d
8623 ac        xor     h
8624 322992    ld      ($9229),a
8627 cd9385    call    $8593
862a eb        ex      de,hl
862b 3a2992    ld      a,($9229)
862e b7        or      a
862f faec85    jp      m,$85ec
8632 7d        ld      a,l
8633 b4        or      h
8634 c9        ret     

8635 cdac85    call    $85ac
8638 eb        ex      de,hl
8639 7d        ld      a,l
863a b4        or      h
863b c9        ret     

863c a7        and     a
863d ed52      sbc     hl,de
863f 280c      jr      z,$864d
8641 210000    ld      hl,$0000
8644 af        xor     a
8645 54        ld      d,h
8646 5d        ld      e,l
8647 c9        ret     

8648 a7        and     a
8649 ed52      sbc     hl,de
864b 28f4      jr      z,$8641
864d 210100    ld      hl,$0001
8650 7d        ld      a,l
8651 b4        or      h
8652 54        ld      d,h
8653 5d        ld      e,l
8654 c9        ret     

8655 eb        ex      de,hl
8656 7c        ld      a,h
8657 aa        xor     d
8658 fa6485    jp      m,$8564
865b af        xor     a
865c ed52      sbc     hl,de
865e 67        ld      h,a
865f 3f        ccf     
8660 ce00      adc     a,$00
8662 6f        ld      l,a
8663 c9        ret     

8664 7a        ld      a,d
8665 07        rlca    
8666 e601      and     $01
8668 6f        ld      l,a
8669 2600      ld      h,$00
866b c9        ret     

866c eb        ex      de,hl
866d 7c        ld      a,h
866e aa        xor     d
866f fa7a85    jp      m,$857a
8672 af        xor     a
8673 ed52      sbc     hl,de
8675 67        ld      h,a
8676 ce00      adc     a,$00
8678 6f        ld      l,a
8679 c9        ret     

867a 7c        ld      a,h
867b 07        rlca    
867c e601      and     $01
867e 6f        ld      l,a
867f 2600      ld      h,$00
8681 c9        ret     

8682 7a        ld      a,d
8683 322992    ld      ($9229),a
8686 cd9385    call    $8593
8689 3a2992    ld      a,($9229)
868c b7        or      a
868d faec85    jp      m,$85ec
8690 7c        ld      a,h
8691 b5        or      l
8692 c9        ret     

8693 7c        ld      a,h
8694 b7        or      a
8695 f29e85    jp      p,$859e
8698 2f        cpl     
8699 67        ld      h,a
869a 7d        ld      a,l
869b 2f        cpl     
869c 6f        ld      l,a
869d 23        inc     hl
869e 7a        ld      a,d
869f b7        or      a
86a0 f2ac85    jp      p,$85ac
86a3 2f        cpl     
86a4 57        ld      d,a
86a5 7b        ld      a,e
86a6 2f        cpl     
86a7 5f        ld      e,a
86a8 13        inc     de
86a9 c3ac85    jp      $85ac
86ac c5        push    bc
86ad 44        ld      b,h
86ae 4d        ld      c,l
86af 210000    ld      hl,$0000
86b2 3e10      ld      a,$10
86b4 29        add     hl,hl
86b5 eb        ex      de,hl
86b6 29        add     hl,hl
86b7 eb        ex      de,hl
86b8 d2bc85    jp      nc,$85bc
86bb 23        inc     hl
86bc a7        and     a
86bd ed42      sbc     hl,bc
86bf d2cb85    jp      nc,$85cb
86c2 09        add     hl,bc
86c3 3d        dec     a
86c4 c2b485    jp      nz,$85b4
86c7 c1        pop     bc
86c8 7d        ld      a,l
86c9 b4        or      h
86ca c9        ret     

86cb 13        inc     de
86cc 3d        dec     a
86cd c2b485    jp      nz,$85b4
86d0 c1        pop     bc
86d1 7d        ld      a,l
86d2 b4        or      h
86d3 c9        ret     

86d4 c5        push    bc
86d5 44        ld      b,h
86d6 4d        ld      c,l
86d7 210000    ld      hl,$0000
86da 3e10      ld      a,$10
86dc 29        add     hl,hl
86dd eb        ex      de,hl
86de 29        add     hl,hl
86df eb        ex      de,hl
86e0 d2e485    jp      nc,$85e4
86e3 09        add     hl,bc
86e4 3d        dec     a
86e5 c2dc85    jp      nz,$85dc
86e8 c1        pop     bc
86e9 7d        ld      a,l
86ea b4        or      h
86eb c9        ret     

86ec 7d        ld      a,l
86ed 2f        cpl     
86ee 6f        ld      l,a
86ef 7c        ld      a,h
86f0 2f        cpl     
86f1 67        ld      h,a
86f2 23        inc     hl
86f3 7d        ld      a,l
86f4 b4        or      h
86f5 c9        ret     

86f6 7c        ld      a,h
86f7 b5        or      l
86f8 ca4d85    jp      z,$854d
86fb c34185    jp      $8541
86fe 7c        ld      a,h
86ff b2        or      d
8700 67        ld      h,a
8701 7d        ld      a,l
8702 b3        or      e
8703 6f        ld      l,a
8704 b4        or      h
8705 c9        ret     

8706 eb        ex      de,hl
8707 7b        ld      a,e
8708 e61f      and     $1f
870a 5f        ld      e,a
870b ca2d86    jp      z,$862d
870e 7c        ld      a,h
870f b4        or      h
8710 f27786    jp      p,$8677
8713 7c        ld      a,h
8714 37        scf     
8715 1f        rra     
8716 67        ld      h,a
8717 7d        ld      a,l
8718 1f        rra     
8719 6f        ld      l,a
871a 1d        dec     e
871b c21386    jp      nz,$8613
871e b4        or      h
871f c9        ret     

8720 eb        ex      de,hl
8721 7b        ld      a,e
8722 e61f      and     $1f
8724 5f        ld      e,a
8725 ca2d86    jp      z,$862d
8728 29        add     hl,hl
8729 1d        dec     e
872a c22886    jp      nz,$8628
872d 7d        ld      a,l
872e b4        or      h
872f c9        ret     

8730 eb        ex      de,hl
8731 a7        and     a
8732 ed52      sbc     hl,de
8734 c9        ret     

8735 eb        ex      de,hl
8736 e1        pop     hl
8737 c5        push    bc
8738 42        ld      b,d
8739 4b        ld      c,e
873a 5e        ld      e,(hl)
873b 23        inc     hl
873c 56        ld      d,(hl)
873d 1b        dec     de
873e 7a        ld      a,d
873f b7        or      a
8740 fa5586    jp      m,$8655
8743 23        inc     hl
8744 79        ld      a,c
8745 be        cp      (hl)
8746 ca4f86    jp      z,$864f
8749 23        inc     hl
874a 23        inc     hl
874b 23        inc     hl
874c c33d86    jp      $863d
874f 23        inc     hl
8750 78        ld      a,b
8751 be        cp      (hl)
8752 c24a86    jp      nz,$864a
8755 23        inc     hl
8756 7e        ld      a,(hl)
8757 23        inc     hl
8758 66        ld      h,(hl)
8759 6f        ld      l,a
875a c1        pop     bc
875b e9        jp      (hl)
875c eb        ex      de,hl
875d af        xor     a
875e ed52      sbc     hl,de
8760 67        ld      h,a
8761 3f        ccf     
8762 ce00      adc     a,$00
8764 6f        ld      l,a
8765 c9        ret     

8766 eb        ex      de,hl
8767 af        xor     a
8768 ed52      sbc     hl,de
876a 67        ld      h,a
876b ce00      adc     a,$00
876d 6f        ld      l,a
876e c9        ret     

876f eb        ex      de,hl
8770 7b        ld      a,e
8771 e61f      and     $1f
8773 5f        ld      e,a
8774 ca2d86    jp      z,$862d
8777 7c        ld      a,h
8778 b7        or      a
8779 1f        rra     
877a 67        ld      h,a
877b 7d        ld      a,l
877c 1f        rra     
877d 6f        ld      l,a
877e 1d        dec     e
877f c27786    jp      nz,$8677
8782 b4        or      h
8783 c9        ret     

8784 7c        ld      a,h
8785 aa        xor     d
8786 67        ld      h,a
8787 7d        ld      a,l
8788 ab        xor     e
8789 6f        ld      l,a
878a b4        or      h
878b c9        ret     

878c d1        pop     de
878d 210200    ld      hl,$0002
8790 39        add     hl,sp
8791 c5        push    bc
8792 d5        push    de
8793 112a92    ld      de,$922a
8796 010600    ld      bc,$0006
8799 edb0      ldir    
879b 21a086    ld      hl,$86a0
879e e3        ex      (sp),hl
879f e9        jp      (hl)
87a0 c1        pop     bc
87a1 7c        ld      a,h
87a2 b5        or      l
87a3 c9        ret     

87a4 2a0600    ld      hl,($0006)
87a7 f9        ld      sp,hl
87a8 cdf586    call    $86f5
87ab 010000    ld      bc,$0000
87ae cd0500    call    $0005
87b1 c3ab86    jp      $86ab
87b4 cd8c86    call    $868c
87b7 cdbf86    call    $86bf
87ba eb        ex      de,hl
87bb c9        ret     

87bc cd8c86    call    $868c
87bf 2a2a92    ld      hl,($922a)
87c2 44        ld      b,h
87c3 4d        ld      c,l
87c4 2a2c92    ld      hl,($922c)
87c7 eb        ex      de,hl
87c8 cd0500    call    $0005
87cb eb        ex      de,hl
87cc 6f        ld      l,a
87cd 2600      ld      h,$00
87cf c9        ret     

87d0 cd8c86    call    $868c
87d3 cddd86    call    $86dd
87d6 6f        ld      l,a
87d7 2600      ld      h,$00
87d9 c9        ret     

87da cd8c86    call    $868c
87dd 2a2a92    ld      hl,($922a)
87e0 eb        ex      de,hl
87e1 2a0100    ld      hl,($0001)
87e4 2b        dec     hl
87e5 2b        dec     hl
87e6 2b        dec     hl
87e7 19        add     hl,de
87e8 19        add     hl,de
87e9 19        add     hl,de
87ea eb        ex      de,hl
87eb 2a2c92    ld      hl,($922c)
87ee 44        ld      b,h
87ef 4d        ld      c,l
87f0 2a2e92    ld      hl,($922e)
87f3 eb        ex      de,hl
87f4 e9        jp      (hl)
87f5 c30301    jp      $0103
87f8 7e        ld      a,(hl)
87f9 23        inc     hl
87fa 6e        ld      l,(hl)
87fb 67        ld      h,a
87fc 29        add     hl,hl
87fd b5        or      l
87fe c9        ret     

87ff 23        inc     hl
8800 23        inc     hl
8801 7e        ld      a,(hl)
8802 23        inc     hl
8803 66        ld      h,(hl)
8804 6f        ld      l,a
8805 b4        or      h
8806 c9        ret     

8807 c5        push    bc
8808 af        xor     a
8809 323092    ld      ($9230),a
880c 323192    ld      ($9231),a
880f 323292    ld      ($9232),a
8812 6f        ld      l,a
8813 67        ld      h,a
8814 223392    ld      ($9233),hl
8817 cd1c80    call    $801c
881a 210400    ld      hl,$0004
881d 39        add     hl,sp
881e 4e        ld      c,(hl)
881f 23        inc     hl
8820 46        ld      b,(hl)
8821 0a        ld      a,(bc)
8822 fe2d      cp      $2d
8824 c22d87    jp      nz,$872d
8827 323092    ld      ($9230),a
882a c33287    jp      $8732
882d fe2b      cp      $2b
882f c23387    jp      nz,$8733
8832 03        inc     bc
8833 0a        ld      a,(bc)
8834 fe30      cp      $30
8836 da6287    jp      c,$8762
8839 fe3a      cp      $3a
883b d26287    jp      nc,$8762
883e f5        push    af
883f cd7b84    call    $847b
8842 cd037d    call    $7d03
8845 f1        pop     af
8846 d630      sub     $30
8848 6f        ld      l,a
8849 2600      ld      h,$00
884b cd1c80    call    $801c
884e cd6c7d    call    $7d6c
8851 3a3292    ld      a,($9232)
8854 b7        or      a
8855 ca3287    jp      z,$8732
8858 2a3392    ld      hl,($9233)
885b 2b        dec     hl
885c 223392    ld      ($9233),hl
885f c33287    jp      $8732
8862 fe2e      cp      $2e
8864 c27487    jp      nz,$8774
8867 213292    ld      hl,$9232
886a 7e        ld      a,(hl)
886b b7        or      a
886c c27487    jp      nz,$8774
886f 3601      ld      (hl),$01
8871 c33287    jp      $8732
8874 210000    ld      hl,$0000
8877 f620      or      $20
8879 fe65      cp      $65
887b c2c187    jp      nz,$87c1
887e 03        inc     bc
887f 0a        ld      a,(bc)
8880 fe2d      cp      $2d
8882 c28b87    jp      nz,$878b
8885 323192    ld      ($9231),a
8888 c39087    jp      $8790
888b fe2b      cp      $2b
888d c29187    jp      nz,$8791
8890 03        inc     bc
8891 0a        ld      a,(bc)
8892 fe30      cp      $30
8894 daab87    jp      c,$87ab
8897 fe3a      cp      $3a
8899 d2ab87    jp      nc,$87ab
889c d630      sub     $30
889e 29        add     hl,hl
889f 54        ld      d,h
88a0 5d        ld      e,l
88a1 29        add     hl,hl
88a2 29        add     hl,hl
88a3 19        add     hl,de
88a4 5f        ld      e,a
88a5 1600      ld      d,$00
88a7 19        add     hl,de
88a8 c39087    jp      $8790
88ab 3a3192    ld      a,($9231)
88ae b7        or      a
88af cab987    jp      z,$87b9
88b2 7c        ld      a,h
88b3 2f        cpl     
88b4 67        ld      h,a
88b5 7d        ld      a,l
88b6 2f        cpl     
88b7 6f        ld      l,a
88b8 23        inc     hl
88b9 eb        ex      de,hl
88ba 2a3392    ld      hl,($9233)
88bd 19        add     hl,de
88be 223392    ld      ($9233),hl
88c1 2a3392    ld      hl,($9233)
88c4 7c        ld      a,h
88c5 b7        or      a
88c6 f20788    jp      p,$8807
88c9 feff      cp      $ff
88cb c22188    jp      nz,$8821
88ce 7d        ld      a,l
88cf 2f        cpl     
88d0 3c        inc     a
88d1 4f        ld      c,a
88d2 fea6      cp      $a6
88d4 d22188    jp      nc,$8821
88d7 fe96      cp      $96
88d9 daee87    jp      c,$87ee
88dc cd517c    call    $7c51
88df 47        ld      b,a
88e0 23        inc     hl
88e1 86        add     a,(hl)
88e2 f26fc1    jp      p,$c16f
88e5 00        nop     
88e6 00        nop     
88e7 cd417e    call    $7e41
88ea 79        ld      a,c
88eb d610      sub     $10
88ed 4f        ld      c,a
88ee cd037d    call    $7d03
88f1 210100    ld      hl,$0001
88f4 cd1c80    call    $801c
88f7 cd7b84    call    $847b
88fa 0d        dec     c
88fb c2f787    jp      nz,$87f7
88fe cd037d    call    $7d03
8901 cd417e    call    $7e41
8904 c31788    jp      $8817
8907 c22188    jp      nz,$8821
890a 7d        ld      a,l
890b b7        or      a
890c ca1788    jp      z,$8817
890f 4f        ld      c,a
8910 cd7b84    call    $847b
8913 0d        dec     c
8914 c21088    jp      nz,$8810
8917 3a3092    ld      a,($9230)
891a b7        or      a
891b ca2188    jp      z,$8821
891e cd127d    call    $7d12
8921 c1        pop     bc
8922 c9        ret     

8923 cd0585    call    $8505
8926 e8        ret     pe

8927 ff        rst     $38
8928 210000    ld      hl,$0000
892b 44        ld      b,h
892c 4d        ld      c,l
892d 211400    ld      hl,$0014
8930 39        add     hl,sp
8931 e5        push    hl
8932 212200    ld      hl,$0022
8935 39        add     hl,sp
8936 cd667c    call    $7c66
8939 cda77c    call    $7ca7
893c cd2a04    call    $042a
893f cda08b    call    $8ba0
8942 e1        pop     hl
8943 cd857c    call    $7c85
8946 cd517c    call    $7c51
8949 41        ld      b,c
894a 010000    ld      bc,$0000
894d 00        nop     
894e 00        nop     
894f 00        nop     
8950 00        nop     
8951 cd1080    call    $8010
8954 2823      jr      z,$8979
8956 211400    ld      hl,$0014
8959 39        add     hl,sp
895a e5        push    hl
895b cd5f7c    call    $7c5f
895e 41        ld      b,c
895f 010000    ld      bc,$0000
8962 00        nop     
8963 00        nop     
8964 00        nop     
8965 00        nop     
8966 211600    ld      hl,$0016
8969 39        add     hl,sp
896a cd587c    call    $7c58
896d cd417e    call    $7e41
8970 e1        pop     hl
8971 cd857c    call    $7c85
8974 210200    ld      hl,$0002
8977 44        ld      b,h
8978 4d        ld      c,l
8979 211400    ld      hl,$0014
897c 39        add     hl,sp
897d cd667c    call    $7c66
8980 cd517c    call    $7c51
8983 40        ld      b,b
8984 44        ld      b,h
8985 98        sbc     a,b
8986 51        ld      d,c
8987 7a        ld      a,d
8988 7b        ld      a,e
8989 35        dec     (hl)
898a 59        ld      e,c
898b cd1080    call    $8010
898e 2857      jr      z,$89e7
8990 211400    ld      hl,$0014
8993 39        add     hl,sp
8994 e5        push    hl
8995 211600    ld      hl,$0016
8998 39        add     hl,sp
8999 cd667c    call    $7c66
899c cd517c    call    $7c51
899f 41        ld      b,c
89a0 01bb67    ld      bc,$67bb
89a3 ae        xor     (hl)
89a4 85        add     a,l
89a5 84        add     a,h
89a6 cbcd      set     1,l
89a8 6c        ld      l,h
89a9 7d        ld      a,l
89aa cda77c    call    $7ca7
89ad 211e00    ld      hl,$001e
89b0 39        add     hl,sp
89b1 cd667c    call    $7c66
89b4 cd517c    call    $7c51
89b7 40        ld      b,b
89b8 bb        cp      e
89b9 67        ld      h,a
89ba ae        xor     (hl)
89bb 85        add     a,l
89bc 84        add     a,h
89bd caa7cd    jp      z,$cda7
89c0 41        ld      b,c
89c1 7f        ld      a,a
89c2 211e00    ld      hl,$001e
89c5 39        add     hl,sp
89c6 cd587c    call    $7c58
89c9 cd6c7d    call    $7d6c
89cc cd517c    call    $7c51
89cf c1        pop     bc
89d0 010000    ld      bc,$0000
89d3 00        nop     
89d4 00        nop     
89d5 00        nop     
89d6 00        nop     
89d7 cd6c7d    call    $7d6c
89da cdd87c    call    $7cd8
89dd cd417e    call    $7e41
89e0 e1        pop     hl
89e1 cd857c    call    $7c85
89e4 03        inc     bc
89e5 60        ld      h,b
89e6 69        ld      l,c
89e7 211400    ld      hl,$0014
89ea 39        add     hl,sp
89eb cd667c    call    $7c66
89ee cda77c    call    $7ca7
89f1 cd2a04    call    $042a
89f4 cda08b    call    $8ba0
89f7 cd517c    call    $7c51
89fa 3c        inc     a
89fb fce33e    call    m,$3ee3
89fe a0        and     b
89ff f404b6    call    p,$b604
8a02 cdf27f    call    $7ff2
8a05 2813      jr      z,$8a1a
8a07 210c00    ld      hl,$000c
8a0a 39        add     hl,sp
8a0b e5        push    hl
8a0c 211600    ld      hl,$0016
8a0f 39        add     hl,sp
8a10 cd667c    call    $7c66
8a13 e1        pop     hl
8a14 cd857c    call    $7c85
8a17 c3148a    jp      $8a14
8a1a 210400    ld      hl,$0004
8a1d 39        add     hl,sp
8a1e e5        push    hl
8a1f 211600    ld      hl,$0016
8a22 39        add     hl,sp
8a23 cd667c    call    $7c66
8a26 211600    ld      hl,$0016
8a29 39        add     hl,sp
8a2a cd587c    call    $7c58
8a2d cd417f    call    $7f41
8a30 e1        pop     hl
8a31 cd857c    call    $7c85
8a34 210c00    ld      hl,$000c
8a37 39        add     hl,sp
8a38 e5        push    hl
8a39 210600    ld      hl,$0006
8a3c 39        add     hl,sp
8a3d cd667c    call    $7c66
8a40 cd517c    call    $7c51
8a43 41        ld      b,c
8a44 0f        rrca    
8a45 0624      ld      b,$24
8a47 f0        ret     p

8a48 a5        and     l
8a49 63        ld      h,e
8a4a 88        adc     a,b
8a4b cd6c7d    call    $7d6c
8a4e 210600    ld      hl,$0006
8a51 39        add     hl,sp
8a52 cd587c    call    $7c58
8a55 cd417f    call    $7f41
8a58 cd517c    call    $7c51
8a5b 41        ld      b,c
8a5c 3b        dec     sp
8a5d 94        sub     h
8a5e 14        inc     d
8a5f 64        ld      h,h
8a60 1b        dec     de
8a61 47        ld      b,a
8a62 ad        xor     l
8a63 cd6c7d    call    $7d6c
8a66 210600    ld      hl,$0006
8a69 39        add     hl,sp
8a6a cd587c    call    $7c58
8a6d cd417f    call    $7f41
8a70 cd517c    call    $7c51
8a73 41        ld      b,c
8a74 56        ld      d,(hl)
8a75 2848      jr      z,$8abf
8a77 102d      djnz    $8aa6
8a79 b6        or      (hl)
8a7a 92        sub     d
8a7b cd6c7d    call    $7d6c
8a7e 210600    ld      hl,$0006
8a81 39        add     hl,sp
8a82 cd587c    call    $7c58
8a85 cd417f    call    $7f41
8a88 cd517c    call    $7c51
8a8b 41        ld      b,c
8a8c 29        add     hl,hl
8a8d 10f9      djnz    $8a88
8a8f 79        ld      a,c
8a90 89        adc     a,c
8a91 2b        dec     hl
8a92 53        ld      d,e
8a93 cd6c7d    call    $7d6c
8a96 cda77c    call    $7ca7
8a99 210e00    ld      hl,$000e
8a9c 39        add     hl,sp
8a9d cd667c    call    $7c66
8aa0 cd517c    call    $7c51
8aa3 c0        ret     nz

8aa4 d66b      sub     $6b
8aa6 d6cd      sub     $cd
8aa8 8c        adc     a,h
8aa9 3d        dec     a
8aaa e9        jp      (hl)
8aab cd417f    call    $7f41
8aae cd517c    call    $7c51
8ab1 c1        pop     bc
8ab2 08        ex      af,af'
8ab3 7e        ld      a,(hl)
8ab4 9f        sbc     a,a
8ab5 ae        xor     (hl)
8ab6 46        ld      b,(hl)
8ab7 b5        or      l
8ab8 32cd6c    ld      ($6ccd),a
8abb 7d        ld      a,l
8abc 210e00    ld      hl,$000e
8abf 39        add     hl,sp
8ac0 cd587c    call    $7c58
8ac3 cd417f    call    $7f41
8ac6 cd517c    call    $7c51
8ac9 c1        pop     bc
8aca 14        inc     d
8acb 81        add     a,c
8acc 7f        ld      a,a
8acd b9        cp      c
8ace e2bccb    jp      po,$cbbc
8ad1 cd6c7d    call    $7d6c
8ad4 210e00    ld      hl,$000e
8ad7 39        add     hl,sp
8ad8 cd587c    call    $7c58
8adb cd417f    call    $7f41
8ade cd517c    call    $7c51
8ae1 c1        pop     bc
8ae2 0d        dec     c
8ae3 b0        or      b
8ae4 53        ld      d,e
8ae5 2883      jr      z,$8a6a
8ae7 0e71      ld      c,$71
8ae9 cd6c7d    call    $7d6c
8aec 210e00    ld      hl,$000e
8aef 39        add     hl,sp
8af0 cd587c    call    $7c58
8af3 cd417f    call    $7f41
8af6 cdd87c    call    $7cd8
8af9 cd417e    call    $7e41
8afc 211600    ld      hl,$0016
8aff 39        add     hl,sp
8b00 cd587c    call    $7c58
8b03 cd417f    call    $7f41
8b06 211600    ld      hl,$0016
8b09 39        add     hl,sp
8b0a cd587c    call    $7c58
8b0d cd6c7d    call    $7d6c
8b10 e1        pop     hl
8b11 cd857c    call    $7c85
8b14 50        ld      d,b
8b15 59        ld      e,c
8b16 210100    ld      hl,$0001
8b19 cd6d85    call    $856d
8b1c 2813      jr      z,$8b31
8b1e 210c00    ld      hl,$000c
8b21 39        add     hl,sp
8b22 e5        push    hl
8b23 210e00    ld      hl,$000e
8b26 39        add     hl,sp
8b27 cd667c    call    $7c66
8b2a cd127d    call    $7d12
8b2d e1        pop     hl
8b2e cd857c    call    $7c85
8b31 210c00    ld      hl,$000c
8b34 39        add     hl,sp
8b35 e5        push    hl
8b36 60        ld      h,b
8b37 69        ld      l,c
8b38 29        add     hl,hl
8b39 29        add     hl,hl
8b3a 29        add     hl,hl
8b3b 113592    ld      de,$9235
8b3e 19        add     hl,de
8b3f cd667c    call    $7c66
8b42 cd037d    call    $7d03
8b45 e1        pop     hl
8b46 e5        push    hl
8b47 cd667c    call    $7c66
8b4a cd6c7d    call    $7d6c
8b4d e1        pop     hl
8b4e cd857c    call    $7c85
8b51 212000    ld      hl,$0020
8b54 39        add     hl,sp
8b55 cd667c    call    $7c66
8b58 cd517c    call    $7c51
8b5b 00        nop     
8b5c 00        nop     
8b5d 00        nop     
8b5e 00        nop     
8b5f 00        nop     
8b60 00        nop     
8b61 00        nop     
8b62 00        nop     
8b63 cdf27f    call    $7ff2
8b66 280b      jr      z,$8b73
8b68 210c00    ld      hl,$000c
8b6b 39        add     hl,sp
8b6c cd667c    call    $7c66
8b6f cd127d    call    $7d12
8b72 c9        ret     

8b73 210c00    ld      hl,$000c
8b76 39        add     hl,sp
8b77 cd667c    call    $7c66
8b7a c9        ret     

8b7b cda98b    call    $8ba9
8b7e 210800    ld      hl,$0008
8b81 39        add     hl,sp
8b82 cd667c    call    $7c66
8b85 215592    ld      hl,$9255
8b88 cd587c    call    $7c58
8b8b cd6c7d    call    $7d6c
8b8e cda77c    call    $7ca7
8b91 cd988a    call    $8a98
8b94 cda08b    call    $8ba0
8b97 c9        ret     

8b98 cda98b    call    $8ba9
8b9b 210000    ld      hl,$0000
8b9e 44        ld      b,h
8b9f 4d        ld      c,l
8ba0 21cb93    ld      hl,$93cb
8ba3 e5        push    hl
8ba4 210a00    ld      hl,$000a
8ba7 39        add     hl,sp
8ba8 cd667c    call    $7c66
8bab e1        pop     hl
8bac cd857c    call    $7c85
8baf 21cb93    ld      hl,$93cb
8bb2 cd667c    call    $7c66
8bb5 215592    ld      hl,$9255
8bb8 cd587c    call    $7c58
8bbb cd1080    call    $8010
8bbe 281e      jr      z,$8bde
8bc0 21cb93    ld      hl,$93cb
8bc3 e5        push    hl
8bc4 215592    ld      hl,$9255
8bc7 cd667c    call    $7c66
8bca cd037d    call    $7d03
8bcd e1        pop     hl
8bce e5        push    hl
8bcf cd667c    call    $7c66
8bd2 cd657d    call    $7d65
8bd5 e1        pop     hl
8bd6 cd857c    call    $7c85
8bd9 03        inc     bc
8bda 60        ld      h,b
8bdb 69        ld      l,c
8bdc 18d1      jr      $8baf
8bde 60        ld      h,b
8bdf 69        ld      l,c
8be0 110100    ld      de,$0001
8be3 cdfc84    call    $84fc
8be6 2817      jr      z,$8bff
8be8 21cb93    ld      hl,$93cb
8beb e5        push    hl
8bec 215592    ld      hl,$9255
8bef cd667c    call    $7c66
8bf2 21cb93    ld      hl,$93cb
8bf5 cd587c    call    $7c58
8bf8 cd657d    call    $7d65
8bfb e1        pop     hl
8bfc cd857c    call    $7c85
8bff 21cb93    ld      hl,$93cb
8c02 e5        push    hl
8c03 cd667c    call    $7c66
8c06 cde681    call    $81e6
8c09 22c993    ld      ($93c9),hl
8c0c cd2880    call    $8028
8c0f 21cb93    ld      hl,$93cb
8c12 cd587c    call    $7c58
8c15 cde07f    call    $7fe0
8c18 280e      jr      z,$8c28
8c1a 2ac993    ld      hl,($93c9)
8c1d 29        add     hl,hl
8c1e 29        add     hl,hl
8c1f 115d92    ld      de,$925d
8c22 19        add     hl,de
8c23 cd2c7c    call    $7c2c
8c26 1859      jr      $8c81
8c28 2ac993    ld      hl,($93c9)
8c2b cd2880    call    $8028
8c2e cda77c    call    $7ca7
8c31 21cb93    ld      hl,$93cb
8c34 cd667c    call    $7c66
8c37 cdd87c    call    $7cd8
8c3a cd657d    call    $7d65
8c3d cda77c    call    $7ca7
8c40 2ac993    ld      hl,($93c9)
8c43 23        inc     hl
8c44 29        add     hl,hl
8c45 29        add     hl,hl
8c46 115d92    ld      de,$925d
8c49 19        add     hl,de
8c4a cd2c7c    call    $7c2c
8c4d cdd87c    call    $7cd8
8c50 cd417f    call    $7f41
8c53 cda77c    call    $7ca7
8c56 2ac993    ld      hl,($93c9)
8c59 23        inc     hl
8c5a cd2880    call    $8028
8c5d 21cb93    ld      hl,$93cb
8c60 cd587c    call    $7c58
8c63 cd657d    call    $7d65
8c66 cda77c    call    $7ca7
8c69 2ac993    ld      hl,($93c9)
8c6c 29        add     hl,hl
8c6d 29        add     hl,hl
8c6e 115d92    ld      de,$925d
8c71 19        add     hl,de
8c72 cd2c7c    call    $7c2c
8c75 cdd87c    call    $7cd8
8c78 cd417f    call    $7f41
8c7b cdd87c    call    $7cd8
8c7e cd6c7d    call    $7d6c
8c81 e1        pop     hl
8c82 cd857c    call    $7c85
8c85 60        ld      h,b
8c86 69        ld      l,c
8c87 110200    ld      de,$0002
8c8a cdfc84    call    $84fc
8c8d 280a      jr      z,$8c99
8c8f 21cb93    ld      hl,$93cb
8c92 cd667c    call    $7c66
8c95 cd127d    call    $7d12
8c98 c9        ret     

8c99 21cb93    ld      hl,$93cb
8c9c cd667c    call    $7c66
8c9f c9        ret     

8ca0 e1        pop     hl
8ca1 d9        exx     
8ca2 210800    ld      hl,$0008
8ca5 39        add     hl,sp
8ca6 f9        ld      sp,hl
8ca7 d9        exx     
8ca8 e9        jp      (hl)
8ca9 e3        ex      (sp),hl
8caa c5        push    bc
8cab cd0485    call    $8504
8cae c1        pop     bc
8caf d1        pop     de
8cb0 7c        ld      a,h
8cb1 b5        or      l
8cb2 c9        ret     

8cb3 21d593    ld      hl,$93d5
8cb6 23        inc     hl
8cb7 7d        ld      a,l
8cb8 e6fe      and     $fe
8cba 6f        ld      l,a
8cbb b4        or      h
8cbc c9        ret     

8cbd 010203    ld      bc,$0302
8cc0 04        inc     b
8cc1 05        dec     b
8cc2 0607      ld      b,$07
8cc4 08        ex      af,af'
8cc5 09        add     hl,bc
8cc6 0a        ld      a,(bc)
8cc7 0b        dec     bc
8cc8 0c        inc     c
8cc9 0d        dec     c
8cca 0e0f      ld      c,$0f
8ccc 1011      djnz    $8cdf
8cce 12        ld      (de),a
8ccf 13        inc     de
8cd0 14        inc     d
8cd1 15        dec     d
8cd2 1617      ld      d,$17
8cd4 1819      jr      $8cef
8cd6 1a        ld      a,(de)
8cd7 7f        ld      a,a
8cd8 00        nop     
8cd9 0a        ld      a,(bc)
8cda 03        inc     bc
8cdb 00        nop     
8cdc f8        ret     m

8cdd f603      or      $03
8cdf 0a        ld      a,(bc)
8ce0 03        inc     bc
8ce1 02        ld      (bc),a
8ce2 f8        ret     m

8ce3 f603      or      $03
8ce5 08        ex      af,af'
8ce6 04        inc     b
8ce7 04        inc     b
8ce8 f8        ret     m

8ce9 f40208    call    p,$0802
8cec 04        inc     b
8ced 06f8      ld      b,$f8
8cef f40206    call    p,$0602
8cf2 04        inc     b
8cf3 08        ex      af,af'
8cf4 f9        ld      sp,hl
8cf5 f40101    call    p,$0101
8cf8 05        dec     b
8cf9 0a        ld      a,(bc)
8cfa f9        ld      sp,hl
8cfb f40101    call    p,$0101
8cfe 05        dec     b
8cff 0c        inc     c
8d00 faf400    jp      m,$00f4
8d03 02        ld      (bc),a
8d04 05        dec     b
8d05 0efa      ld      c,$fa
8d07 f40002    call    p,$0200
8d0a 05        dec     b
8d0b 10fb      djnz    $8d08
8d0d f4ff00    call    p,$00ff
8d10 05        dec     b
8d11 10fb      djnz    $8d0e
8d13 f4fffe    call    p,$feff
8d16 05        dec     b
8d17 12        ld      (de),a
8d18 fcf4fe    call    m,$fef4
8d1b fe05      cp      $05
8d1d 12        ld      (de),a
8d1e fdf4fefc  call    p,$fcfe
8d22 05        dec     b
8d23 14        inc     d
8d24 fef6      cp      $f6
8d26 fdfa0514  jp      m,$1405
8d2a fef8      cp      $f8
8d2c fdfa0414  jp      m,$1404
8d30 ff        rst     $38
8d31 f8        ret     m

8d32 fcf804    call    m,$04f8
8d35 14        inc     d
8d36 00        nop     
8d37 f8        ret     m

8d38 fc1f00    call    m,$001f
8d3b 5a        ld      e,d
8d3c 00        nop     
8d3d 1f        rra     
8d3e 00        nop     
8d3f 5a        ld      e,d
8d40 00        nop     
8d41 15        dec     d
8d42 00        nop     
8d43 010000    ld      bc,$0000
8d46 00        nop     
8d47 04        inc     b
8d48 00        nop     
8d49 010000    ld      bc,$0000
8d4c 00        nop     
8d4d 00        nop     
8d4e 00        nop     
8d4f ff        rst     $38
8d50 ff        rst     $38
8d51 d0        ret     nc

8d52 02        ld      (bc),a
8d53 f8        ret     m

8d54 00        nop     
8d55 08        ex      af,af'
8d56 00        nop     
8d57 0a        ld      a,(bc)
8d58 00        nop     
8d59 00        nop     
8d5a 00        nop     
8d5b 00        nop     
8d5c 00        nop     
8d5d 2000      jr      nz,$8d5f
8d5f 0f        rrca    
8d60 00        nop     
8d61 2000      jr      nz,$8d63
8d63 5e        ld      e,(hl)
8d64 90        sub     b
8d65 70        ld      (hl),b
8d66 90        sub     b
8d67 75        ld      (hl),l
8d68 90        sub     b
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
8d8d 41        ld      b,c
8d8e 39        add     hl,sp
8d8f 4b        ld      c,e
8d90 b8        cp      b
8d91 34        inc     (hl)
8d92 c7        rst     $00
8d93 83        add     a,e
8d94 ea0000    jp      pe,$0000
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
8db8 00        nop     
8db9 00        nop     
8dba 00        nop     
8dbb 00        nop     
8dbc 00        nop     
8dbd 00        nop     
8dbe 00        nop     
8dbf 00        nop     
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
9136 e491f6    call    po,$f691
9139 91        sub     c
913a 00        nop     
913b 00        nop     
913c 4c        ld      c,h
913d 4f        ld      c,a
913e 47        ld      b,a
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
915e 41        ld      b,c
915f 6d        ld      l,l
9160 73        ld      (hl),e
9161 74        ld      (hl),h
9162 72        ld      (hl),d
9163 61        ld      h,c
9164 64        ld      h,h
9165 204c      jr      nz,$91b3
9167 4f        ld      c,a
9168 47        ld      b,a
9169 4f        ld      c,a
916a 2056      jr      nz,$91c2
916c 322e30    ld      ($302e),a
916f 00        nop     
9170 45        ld      b,l
9171 64        ld      h,h
9172 69        ld      l,c
9173 74        ld      (hl),h
9174 00        nop     
9175 5f        ld      e,a
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
91b0 e419e7    call    po,$e719
91b3 19        add     hl,de
91b4 ea19ed    jp      pe,$ed19
91b7 19        add     hl,de
91b8 221c25    ld      ($251c),hl
91bb 1c        inc     e
91bc 281c      jr      z,$91da
91be 2b        dec     hl
91bf 1c        inc     e
91c0 321c37    ld      ($371c),a
91c3 1c        inc     e
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
923d 41        ld      b,c
923e 010000    ld      bc,$0000
9241 00        nop     
9242 00        nop     
9243 00        nop     
9244 00        nop     
9245 42        ld      b,d
9246 016800    ld      bc,$0068
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
926b 41        ld      b,c
926c 010000    ld      bc,$0000
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
92bc 02        ld      (bc),a
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
92d5 50        ld      d,b
92d6 49        ld      c,c
92d7 43        ld      b,e
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
933d 40        ld      b,b
933e 86        add     a,(hl)
933f 0a        ld      a,(bc)
9340 91        sub     c
9341 c1        pop     bc
9342 6b        ld      l,e
9343 9b        sbc     a,e
9344 2c        inc     l
9345 41        ld      b,c
9346 01921f    ld      bc,$1f92
9349 b5        or      l
934a 44        ld      b,h
934b 42        ld      b,d
934c d1        pop     de
934d 41        ld      b,c
934e 010c15    ld      bc,$150c
9351 23        inc     hl
9352 82        add     a,d
9353 d7        rst     $10
9354 3641      ld      (hl),$41
9356 5a        ld      e,d
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
9361 40        ld      b,b
9362 04        inc     b
9363 77        ld      (hl),a
9364 c24008    jp      nz,$0840
9367 ef        rst     $28
9368 2c        inc     l
9369 40        ld      b,b
936a 0d        dec     c
936b 65        ld      h,l
936c e3        ex      (sp),hl
936d 40        ld      b,b
936e 11db8f    ld      de,$8fdb
9371 40        ld      b,b
9372 164f      ld      d,$4f
9374 d640      sub     $40
9376 1a        ld      a,(de)
9377 c26040    jp      nz,$4060
937a 1f        rra     
937b 32d440    ld      ($40d4),a
937e 23        inc     hl
937f a0        and     b
9380 d9        exx     
9381 40        ld      b,b
9382 280c      jr      z,$9390
9384 1640      ld      d,$40
9386 2c        inc     l
9387 74        ld      (hl),h
9388 34        inc     (hl)
9389 40        ld      b,b
938a 30d8      jr      nc,$9364
938c db40      in      a,($40)
938e 35        dec     (hl)
938f 39        add     hl,sp
9390 b3        or      e
9391 40        ld      b,b
9392 39        add     hl,sp
9393 96        sub     (hl)
9394 64        ld      h,h
9395 40        ld      b,b
9396 3d        dec     a
9397 ee97      xor     $97
9399 40        ld      b,b
939a 42        ld      b,d
939b 41        ld      b,c
939c f7        rst     $30
939d 40        ld      b,b
939e 46        ld      b,(hl)
939f 90        sub     b
93a0 2b        dec     hl
93a1 40        ld      b,b
93a2 4a        ld      c,d
93a3 d8        ret     c

93a4 df        rst     $18
93a5 40        ld      b,b
93a6 4f        ld      c,a
93a7 1b        dec     de
93a8 bc        cp      h
93a9 40        ld      b,b
93aa 53        ld      d,e
93ab 58        ld      e,b
93ac 6f        ld      l,a
93ad 40        ld      b,b
93ae 57        ld      d,a
93af 8e        adc     a,(hl)
93b0 a1        and     c
93b1 40        ld      b,b
93b2 5b        ld      e,e
93b3 be        cp      (hl)
93b4 00        nop     
93b5 40        ld      b,b
93b6 5f        ld      e,a
93b7 e637      and     $37
93b9 40        ld      b,b
93ba 64        ld      h,h
93bb 06f4      ld      b,$f4
93bd 40        ld      b,b
93be 68        ld      l,b
93bf 1f        rra     
93c0 e4406c    call    po,$6c40
93c3 30b5      jr      nc,$937a
93c5 40        ld      b,b
93c6 70        ld      (hl),b
93c7 39        add     hl,sp
93c8 17        rla     
93c9 40        ld      b,b
93ca 74        ld      (hl),h
93cb 38b8      jr      c,$9385
93cd 40        ld      b,b
93ce 78        ld      a,b
93cf 2f        cpl     
93d0 49        ld      c,c
93d1 40        ld      b,b
93d2 7c        ld      a,h
93d3 1c        inc     e
93d4 7b        ld      a,e
93d5 40        ld      b,b
93d6 80        add     a,b
93d7 00        nop     
93d8 00        nop     
93d9 40        ld      b,b
93da 83        add     a,e
93db d9        exx     
93dc 89        adc     a,c
93dd 40        ld      b,b
93de 87        add     a,a
93df a8        xor     b
93e0 c9        ret     

93e1 40        ld      b,b
93e2 8b        adc     a,e
93e3 6d        ld      l,l
93e4 76        halt    
93e5 40        ld      b,b
93e6 8f        adc     a,a
93e7 27        daa     
93e8 44        ld      b,h
93e9 40        ld      b,b
93ea 92        sub     d
93eb d5        push    de
93ec e7        rst     $20
93ed 40        ld      b,b
93ee 96        sub     (hl)
93ef 79        ld      a,c
93f0 1840      jr      $9432
93f2 9a        sbc     a,d
93f3 108c      djnz    $9381
93f5 40        ld      b,b
93f6 9d        sbc     a,l
93f7 9b        sbc     a,e
93f8 fd40      ld      b,b
93fa a1        and     c
93fb 1b        dec     de
93fc 24        inc     h
93fd 40        ld      b,b
93fe a4        and     h
93ff 8d        adc     a,l
9400 ba        cp      d
9401 40        ld      b,b
9402 a7        and     a
9403 f3        di      
9404 7c        ld      a,h
9405 40        ld      b,b
9406 ab        xor     e
9407 4c        ld      c,h
9408 24        inc     h
9409 40        ld      b,b
940a ae        xor     (hl)
940b 97        sub     a
940c 71        ld      (hl),c
940d 40        ld      b,b
940e b1        or      c
940f d5        push    de
9410 2140b5    ld      hl,$b540
9413 04        inc     b
9414 f3        di      
9415 40        ld      b,b
9416 b8        cp      b
9417 26a7      ld      h,$a7
9419 40        ld      b,b
941a bb        cp      e
941b 39        add     hl,sp
941c ff        rst     $38
941d 40        ld      b,b
941e be        cp      (hl)
941f 3ebd      ld      a,$bd
9421 40        ld      b,b
9422 c1        pop     bc
9423 34        inc     (hl)
9424 a5        and     l
9425 40        ld      b,b
9426 c41b7d    call    nz,$7d1b
9429 40        ld      b,b
942a c6f3      add     a,$f3
942c 09        add     hl,bc
942d 40        ld      b,b
942e c9        ret     

942f bb        cp      e
9430 12        ld      (de),a
9431 40        ld      b,b
9432 cc7360    call    z,$6073
9435 40        ld      b,b
9436 cf        rst     $08
9437 1b        dec     de
9438 bc        cp      h
9439 40        ld      b,b
943a d1        pop     de
943b b3        or      e
943c f240d4    jp      p,$d440
943f 3b        dec     sp
9440 ce40      adc     a,$40
9442 d6b3      sub     $b3
9444 1d        dec     e
9445 40        ld      b,b
9446 d9        exx     
9447 19        add     hl,de
9448 ae        xor     (hl)
9449 40        ld      b,b
944a db6f      in      a,($6f)
944c 50        ld      d,b
944d 40        ld      b,b
944e ddb3      or      e
9450 d7        rst     $10
9451 40        ld      b,b
9452 df        rst     $18
9453 e7        rst     $20
9454 13        inc     de
9455 40        ld      b,b
9456 e208da    jp      po,$da08
9459 40        ld      b,b
945a e41900    call    po,$0019
945d 40        ld      b,b
945e e617      and     $17
9460 5d        ld      e,l
9461 40        ld      b,b
9462 e8        ret     pe

9463 03        inc     bc
9464 c9        ret     

9465 40        ld      b,b
9466 e9        jp      (hl)
9467 de1d      sbc     a,$1d
9469 40        ld      b,b
946a eb        ex      de,hl
946b a6        and     (hl)
946c 34        inc     (hl)
946d 40        ld      b,b
946e ed5beb40  ld      de,($40eb)
9472 eeff      xor     $ff
9474 2040      jr      nz,$94b6
9476 f0        ret     p

9477 8f        adc     a,a
9478 b2        or      d
9479 40        ld      b,b
947a f20d81    jp      p,$810d
947d 40        ld      b,b
947e f3        di      
947f 78        ld      a,b
9480 70        ld      (hl),b
9481 40        ld      b,b
9482 f4d063    call    p,$63d0
9485 40        ld      b,b
9486 f615      or      $15
9488 3f        ccf     
9489 40        ld      b,b
948a f7        rst     $30
948b 46        ld      b,(hl)
948c ea40f8    jp      pe,$f840
948f 65        ld      h,l
9490 4c        ld      c,h
9491 40        ld      b,b
9492 f9        ld      sp,hl
9493 70        ld      (hl),b
9494 51        ld      d,c
9495 40        ld      b,b
9496 fa67e1    jp      m,$e167
9499 40        ld      b,b
949a fb        ei      
949b 4b        ld      c,e
949c eb        ex      de,hl
949d 40        ld      b,b
949e fc1c5c    call    m,$5c1c
94a1 40        ld      b,b
94a2 fcd924    call    m,$24d9
94a5 40        ld      b,b
94a6 fd82      add     a,d
94a8 35        dec     (hl)
94a9 40        ld      b,b
94aa fe17      cp      $17
94ac 81        add     a,c
94ad 40        ld      b,b
94ae fe98      cp      $98
94b0 fc40ff    call    m,$ff40
94b3 069d      ld      b,$9d
94b5 40        ld      b,b
94b6 ff        rst     $38
94b7 60        ld      h,b
94b8 5b        ld      e,e
94b9 40        ld      b,b
94ba ff        rst     $38
94bb a6        and     (hl)
94bc 2f        cpl     
94bd 40        ld      b,b
94be ff        rst     $38
94bf d8        ret     c

94c0 13        inc     de
94c1 40        ld      b,b
94c2 ff        rst     $38
94c3 f604      or      $04
94c5 41        ld      b,c
94c6 010000    ld      bc,$0000
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
94d3 f9        ld      sp,hl
94d4 b9        cp      c
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
9ac4 00        nop     
9ac5 00        nop     
9ac6 00        nop     
9ac7 00        nop     
9ac8 00        nop     
9ac9 00        nop     
9aca 00        nop     
9acb 00        nop     
9acc 00        nop     
9acd 00        nop     
9ace 00        nop     
9acf 00        nop     
9ad0 00        nop     
9ad1 00        nop     
9ad2 00        nop     
9ad3 00        nop     
9ad4 00        nop     
9ad5 00        nop     
9ad6 00        nop     
9ad7 00        nop     
9ad8 00        nop     
9ad9 00        nop     
9ada 00        nop     
9adb 00        nop     
9adc 00        nop     
9add 00        nop     
9ade 00        nop     
9adf 00        nop     
9ae0 00        nop     
9ae1 00        nop     
9ae2 00        nop     
9ae3 00        nop     
9ae4 00        nop     
9ae5 00        nop     
9ae6 00        nop     
9ae7 00        nop     
9ae8 00        nop     
9ae9 00        nop     
9aea 00        nop     
9aeb 00        nop     
9aec 00        nop     
9aed 00        nop     
9aee 00        nop     
9aef 00        nop     
9af0 00        nop     
9af1 00        nop     
9af2 00        nop     
9af3 00        nop     
9af4 00        nop     
9af5 00        nop     
9af6 00        nop     
9af7 00        nop     
9af8 00        nop     
9af9 00        nop     
9afa 00        nop     
9afb 00        nop     
9afc 00        nop     
9afd 00        nop     
9afe 00        nop     
9aff 00        nop     
9b00 00        nop     
9b01 00        nop     
9b02 00        nop     
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
9b12 00        nop     
9b13 00        nop     
9b14 00        nop     
9b15 00        nop     
9b16 00        nop     
9b17 00        nop     
9b18 00        nop     
9b19 00        nop     
9b1a 00        nop     
9b1b 00        nop     
9b1c 00        nop     
9b1d 00        nop     
9b1e 00        nop     
9b1f 00        nop     
9b20 00        nop     
9b21 00        nop     
9b22 00        nop     
9b23 00        nop     
9b24 00        nop     
9b25 00        nop     
9b26 00        nop     
9b27 00        nop     
9b28 00        nop     
9b29 00        nop     
9b2a 00        nop     
9b2b 00        nop     
9b2c 00        nop     
9b2d 00        nop     
9b2e 00        nop     
9b2f 00        nop     
9b30 00        nop     
9b31 00        nop     
9b32 00        nop     
9b33 00        nop     
9b34 00        nop     
9b35 00        nop     
9b36 00        nop     
9b37 00        nop     
9b38 00        nop     
9b39 00        nop     
9b3a 00        nop     
9b3b 00        nop     
9b3c 00        nop     
9b3d 00        nop     
9b3e 00        nop     
9b3f 00        nop     
9b40 00        nop     
9b41 00        nop     
9b42 00        nop     
9b43 00        nop     
9b44 00        nop     
9b45 00        nop     
9b46 00        nop     
9b47 00        nop     
9b48 00        nop     
9b49 00        nop     
9b4a 00        nop     
9b4b 00        nop     
9b4c 00        nop     
9b4d 00        nop     
9b4e 00        nop     
9b4f 00        nop     
9b50 00        nop     
9b51 00        nop     
9b52 00        nop     
9b53 00        nop     
9b54 00        nop     
9b55 00        nop     
9b56 00        nop     
9b57 00        nop     
9b58 00        nop     
9b59 00        nop     
9b5a 00        nop     
9b5b 00        nop     
9b5c 00        nop     
9b5d 00        nop     
9b5e 00        nop     
9b5f 00        nop     
9b60 00        nop     
9b61 00        nop     
9b62 00        nop     
9b63 00        nop     
9b64 00        nop     
9b65 00        nop     
9b66 00        nop     
9b67 00        nop     
9b68 00        nop     
9b69 00        nop     
9b6a 00        nop     
9b6b 00        nop     
9b6c 00        nop     
9b6d 00        nop     
9b6e 00        nop     
9b6f 00        nop     
9b70 00        nop     
9b71 00        nop     
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
9c25 00        nop     
9c26 00        nop     
9c27 00        nop     
9c28 00        nop     
9c29 00        nop     
9c2a 00        nop     
9c2b 00        nop     
9c2c 00        nop     
9c2d 00        nop     
9c2e 00        nop     
9c2f 00        nop     
9c30 00        nop     
9c31 00        nop     
9c32 00        nop     
9c33 00        nop     
9c34 00        nop     
9c35 00        nop     
9c36 00        nop     
9c37 00        nop     
9c38 00        nop     
9c39 00        nop     
9c3a 00        nop     
9c3b 00        nop     
9c3c 00        nop     
9c3d 00        nop     
9c3e 00        nop     
9c3f 00        nop     
9c40 00        nop     
9c41 00        nop     
9c42 00        nop     
9c43 00        nop     
9c44 00        nop     
9c45 00        nop     
9c46 00        nop     
9c47 00        nop     
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
9c98 00        nop     
9c99 00        nop     
9c9a 00        nop     
9c9b 00        nop     
9c9c 00        nop     
9c9d 00        nop     
9c9e 00        nop     
9c9f 00        nop     
9ca0 00        nop     
9ca1 00        nop     
9ca2 00        nop     
9ca3 00        nop     
9ca4 00        nop     
9ca5 00        nop     
9ca6 00        nop     
9ca7 00        nop     
9ca8 00        nop     
9ca9 00        nop     
9caa 00        nop     
9cab 00        nop     
9cac 00        nop     
9cad 00        nop     
9cae 00        nop     
9caf 00        nop     
9cb0 00        nop     
9cb1 00        nop     
9cb2 00        nop     
9cb3 00        nop     
9cb4 00        nop     
9cb5 00        nop     
9cb6 00        nop     
9cb7 00        nop     
9cb8 00        nop     
9cb9 00        nop     
9cba 00        nop     
9cbb 00        nop     
9cbc 00        nop     
9cbd 00        nop     
9cbe 00        nop     
9cbf 00        nop     
9cc0 00        nop     
9cc1 00        nop     
9cc2 00        nop     
9cc3 00        nop     
9cc4 00        nop     
9cc5 00        nop     
9cc6 00        nop     
9cc7 00        nop     
9cc8 00        nop     
9cc9 00        nop     
9cca 00        nop     
9ccb 00        nop     
9ccc 00        nop     
9ccd 00        nop     
9cce 00        nop     
9ccf 00        nop     
9cd0 00        nop     
9cd1 00        nop     
9cd2 00        nop     
9cd3 00        nop     
9cd4 00        nop     
9cd5 00        nop     
9cd6 00        nop     
9cd7 00        nop     
9cd8 00        nop     
9cd9 00        nop     
9cda 00        nop     
9cdb 00        nop     
9cdc 00        nop     
9cdd 00        nop     
9cde 00        nop     
9cdf 00        nop     
9ce0 00        nop     
9ce1 00        nop     
9ce2 00        nop     
9ce3 00        nop     
9ce4 00        nop     
9ce5 00        nop     
9ce6 00        nop     
9ce7 00        nop     
9ce8 00        nop     
9ce9 00        nop     
9cea 00        nop     
9ceb 00        nop     
9cec 00        nop     
9ced 00        nop     
9cee 00        nop     
9cef 00        nop     
9cf0 00        nop     
9cf1 00        nop     
9cf2 00        nop     
9cf3 00        nop     
9cf4 00        nop     
9cf5 00        nop     
9cf6 00        nop     
9cf7 00        nop     
9cf8 00        nop     
9cf9 00        nop     
9cfa 00        nop     
9cfb 00        nop     
9cfc 00        nop     
9cfd 00        nop     
9cfe 00        nop     
9cff 00        nop     
9d00 00        nop     
9d01 00        nop     
9d02 00        nop     
9d03 00        nop     
9d04 00        nop     
9d05 00        nop     
9d06 00        nop     
9d07 00        nop     
9d08 00        nop     
9d09 00        nop     
9d0a 00        nop     
9d0b 00        nop     
9d0c 00        nop     
9d0d 00        nop     
9d0e 00        nop     
9d0f 00        nop     
9d10 00        nop     
9d11 00        nop     
9d12 00        nop     
9d13 00        nop     
9d14 00        nop     
9d15 00        nop     
9d16 00        nop     
9d17 00        nop     
9d18 00        nop     
9d19 00        nop     
9d1a 00        nop     
9d1b 00        nop     
9d1c 00        nop     
9d1d 00        nop     
9d1e 00        nop     
9d1f 00        nop     
9d20 00        nop     
9d21 00        nop     
9d22 00        nop     
9d23 00        nop     
9d24 00        nop     
9d25 00        nop     
9d26 00        nop     
9d27 00        nop     
9d28 00        nop     
9d29 00        nop     
9d2a 00        nop     
9d2b 00        nop     
9d2c 00        nop     
9d2d 00        nop     
9d2e 00        nop     
9d2f 00        nop     
9d30 00        nop     
9d31 00        nop     
9d32 00        nop     
9d33 00        nop     
9d34 00        nop     
9d35 00        nop     
9d36 00        nop     
9d37 00        nop     
9d38 00        nop     
9d39 00        nop     
9d3a 00        nop     
9d3b 00        nop     
9d3c 00        nop     
9d3d 00        nop     
9d3e 00        nop     
9d3f 00        nop     
9d40 00        nop     
9d41 00        nop     
9d42 00        nop     
9d43 00        nop     
9d44 00        nop     
9d45 00        nop     
9d46 00        nop     
9d47 00        nop     
9d48 00        nop     
9d49 00        nop     
9d4a 00        nop     
9d4b 00        nop     
9d4c 00        nop     
9d4d 00        nop     
9d4e 00        nop     
9d4f 00        nop     
9d50 00        nop     
9d51 00        nop     
9d52 00        nop     
9d53 00        nop     
9d54 00        nop     
9d55 00        nop     
9d56 00        nop     
9d57 00        nop     
9d58 00        nop     
9d59 00        nop     
9d5a 00        nop     
9d5b 00        nop     
9d5c 00        nop     
9d5d 00        nop     
9d5e 00        nop     
9d5f 00        nop     
9d60 00        nop     
9d61 00        nop     
9d62 00        nop     
9d63 00        nop     
9d64 00        nop     
9d65 00        nop     
9d66 00        nop     
9d67 00        nop     
9d68 00        nop     
9d69 00        nop     
9d6a 00        nop     
9d6b 00        nop     
9d6c 00        nop     
9d6d 00        nop     
9d6e 00        nop     
9d6f 00        nop     
9d70 00        nop     
9d71 00        nop     
9d72 00        nop     
9d73 00        nop     
9d74 00        nop     
9d75 00        nop     
9d76 00        nop     
9d77 00        nop     
9d78 00        nop     
9d79 00        nop     
9d7a 00        nop     
9d7b 00        nop     
9d7c 00        nop     
9d7d 00        nop     
9d7e 00        nop     
9d7f 00        nop     
9d80 00        nop     
9d81 00        nop     
9d82 00        nop     
9d83 00        nop     
9d84 00        nop     
9d85 00        nop     
9d86 00        nop     
9d87 00        nop     
9d88 00        nop     
9d89 00        nop     
9d8a 00        nop     
9d8b 00        nop     
9d8c 00        nop     
9d8d 00        nop     
9d8e 00        nop     
9d8f 00        nop     
9d90 00        nop     
9d91 00        nop     
9d92 00        nop     
9d93 00        nop     
9d94 00        nop     
9d95 00        nop     
9d96 00        nop     
9d97 00        nop     
9d98 00        nop     
9d99 00        nop     
9d9a 00        nop     
9d9b 00        nop     
9d9c 00        nop     
9d9d 00        nop     
9d9e 00        nop     
9d9f 00        nop     
9da0 00        nop     
9da1 00        nop     
9da2 00        nop     
9da3 00        nop     
9da4 00        nop     
9da5 00        nop     
9da6 00        nop     
9da7 00        nop     
9da8 00        nop     
9da9 00        nop     
9daa 00        nop     
9dab 00        nop     
9dac 00        nop     
9dad 00        nop     
9dae 00        nop     
9daf 00        nop     
9db0 00        nop     
9db1 00        nop     
9db2 00        nop     
9db3 00        nop     
9db4 00        nop     
9db5 00        nop     
9db6 00        nop     
9db7 00        nop     
9db8 00        nop     
9db9 00        nop     
9dba 00        nop     
9dbb 00        nop     
9dbc 00        nop     
9dbd 00        nop     
9dbe 00        nop     
9dbf 00        nop     
9dc0 00        nop     
9dc1 00        nop     
9dc2 00        nop     
9dc3 00        nop     
9dc4 00        nop     
9dc5 00        nop     
9dc6 00        nop     
9dc7 00        nop     
9dc8 00        nop     
9dc9 00        nop     
9dca 00        nop     
9dcb 00        nop     
9dcc 00        nop     
9dcd 00        nop     
9dce 00        nop     
9dcf 00        nop     
9dd0 00        nop     
9dd1 00        nop     
9dd2 00        nop     
9dd3 00        nop     
9dd4 00        nop     
9dd5 00        nop     
9dd6 00        nop     
9dd7 00        nop     
9dd8 00        nop     
9dd9 00        nop     
9dda 00        nop     
9ddb 00        nop     
9ddc 00        nop     
9ddd 00        nop     
9dde 00        nop     
9ddf 00        nop     
9de0 00        nop     
9de1 00        nop     
9de2 00        nop     
9de3 00        nop     
9de4 00        nop     
9de5 00        nop     
9de6 00        nop     
9de7 00        nop     
9de8 00        nop     
9de9 00        nop     
9dea 00        nop     
9deb 00        nop     
9dec 00        nop     
9ded 00        nop     
9dee 00        nop     
9def 00        nop     
9df0 00        nop     
9df1 00        nop     
9df2 00        nop     
9df3 00        nop     
9df4 00        nop     
9df5 00        nop     
9df6 00        nop     
9df7 00        nop     
9df8 00        nop     
9df9 00        nop     
9dfa 00        nop     
9dfb 00        nop     
9dfc 00        nop     
9dfd 00        nop     
9dfe 00        nop     
9dff 00        nop     
9e00 00        nop     
9e01 00        nop     
9e02 00        nop     
9e03 00        nop     
9e04 00        nop     
9e05 00        nop     
9e06 00        nop     
9e07 00        nop     
9e08 00        nop     
9e09 00        nop     
9e0a 00        nop     
9e0b 00        nop     
9e0c 00        nop     
9e0d 00        nop     
9e0e 00        nop     
9e0f 00        nop     
9e10 00        nop     
9e11 00        nop     
9e12 00        nop     
9e13 00        nop     
9e14 00        nop     
9e15 00        nop     
9e16 00        nop     
9e17 00        nop     
9e18 00        nop     
9e19 00        nop     
9e1a 00        nop     
9e1b 00        nop     
9e1c 00        nop     
9e1d 00        nop     
9e1e 00        nop     
9e1f 00        nop     
9e20 00        nop     
9e21 00        nop     
9e22 00        nop     
9e23 00        nop     
9e24 00        nop     
9e25 00        nop     
9e26 00        nop     
9e27 00        nop     
9e28 00        nop     
9e29 00        nop     
9e2a 00        nop     
9e2b 00        nop     
9e2c 00        nop     
9e2d 00        nop     
9e2e 00        nop     
9e2f 00        nop     
9e30 00        nop     
9e31 00        nop     
9e32 00        nop     
9e33 00        nop     
9e34 00        nop     
9e35 00        nop     
9e36 00        nop     
9e37 00        nop     
9e38 00        nop     
9e39 00        nop     
9e3a 00        nop     
9e3b 00        nop     
9e3c 00        nop     
9e3d 00        nop     
9e3e 00        nop     
9e3f 00        nop     
9e40 00        nop     
9e41 00        nop     
9e42 00        nop     
9e43 00        nop     
9e44 00        nop     
9e45 00        nop     
9e46 00        nop     
9e47 00        nop     
9e48 00        nop     
9e49 00        nop     
9e4a 00        nop     
9e4b 00        nop     
9e4c 00        nop     
9e4d 00        nop     
9e4e 00        nop     
9e4f 00        nop     
9e50 00        nop     
9e51 00        nop     
9e52 00        nop     
9e53 00        nop     
9e54 00        nop     
9e55 00        nop     
9e56 00        nop     
9e57 00        nop     
9e58 00        nop     
9e59 00        nop     
9e5a 00        nop     
9e5b 00        nop     
9e5c 00        nop     
9e5d 00        nop     
9e5e 00        nop     
9e5f 00        nop     
9e60 00        nop     
9e61 00        nop     
9e62 00        nop     
9e63 00        nop     
9e64 00        nop     
9e65 00        nop     
9e66 00        nop     
9e67 00        nop     
9e68 00        nop     
9e69 00        nop     
9e6a 00        nop     
9e6b 00        nop     
9e6c 00        nop     
9e6d 00        nop     
9e6e 00        nop     
9e6f 00        nop     
9e70 00        nop     
9e71 00        nop     
9e72 00        nop     
9e73 00        nop     
9e74 00        nop     
9e75 00        nop     
9e76 00        nop     
9e77 00        nop     
9e78 00        nop     
9e79 00        nop     
9e7a 00        nop     
9e7b 00        nop     
9e7c 00        nop     
9e7d 00        nop     
9e7e 00        nop     
9e7f 00        nop     
9e80 00        nop     
9e81 00        nop     
9e82 00        nop     
9e83 00        nop     
9e84 00        nop     
9e85 00        nop     
9e86 00        nop     
9e87 00        nop     
9e88 00        nop     
9e89 00        nop     
9e8a 00        nop     
9e8b 00        nop     
9e8c 00        nop     
9e8d 00        nop     
9e8e 00        nop     
9e8f 00        nop     
9e90 00        nop     
9e91 00        nop     
9e92 00        nop     
9e93 00        nop     
9e94 00        nop     
9e95 00        nop     
9e96 00        nop     
9e97 00        nop     
9e98 00        nop     
9e99 00        nop     
9e9a 00        nop     
9e9b 00        nop     
9e9c 00        nop     
9e9d 00        nop     
9e9e 00        nop     
9e9f 00        nop     
9ea0 00        nop     
9ea1 00        nop     
9ea2 00        nop     
9ea3 00        nop     
9ea4 00        nop     
9ea5 00        nop     
9ea6 00        nop     
9ea7 00        nop     
9ea8 00        nop     
9ea9 00        nop     
9eaa 00        nop     
9eab 00        nop     
9eac 00        nop     
9ead 00        nop     
9eae 00        nop     
9eaf 00        nop     
9eb0 00        nop     
9eb1 00        nop     
9eb2 00        nop     
9eb3 00        nop     
9eb4 00        nop     
9eb5 00        nop     
9eb6 00        nop     
9eb7 00        nop     
9eb8 00        nop     
9eb9 00        nop     
9eba 00        nop     
9ebb 00        nop     
9ebc 00        nop     
9ebd 00        nop     
9ebe 00        nop     
9ebf 00        nop     
9ec0 00        nop     
9ec1 00        nop     
9ec2 00        nop     
9ec3 00        nop     
9ec4 00        nop     
9ec5 00        nop     
9ec6 00        nop     
9ec7 00        nop     
9ec8 00        nop     
9ec9 00        nop     
9eca 00        nop     
9ecb 00        nop     
9ecc 00        nop     
9ecd 00        nop     
9ece 00        nop     
9ecf 00        nop     
9ed0 00        nop     
9ed1 00        nop     
9ed2 00        nop     
9ed3 00        nop     
9ed4 00        nop     
9ed5 00        nop     
9ed6 00        nop     
9ed7 00        nop     
9ed8 00        nop     
9ed9 00        nop     
9eda 00        nop     
9edb 00        nop     
9edc 00        nop     
9edd 00        nop     
9ede 00        nop     
9edf 00        nop     
9ee0 00        nop     
9ee1 00        nop     
9ee2 00        nop     
9ee3 00        nop     
9ee4 00        nop     
9ee5 00        nop     
9ee6 00        nop     
9ee7 00        nop     
9ee8 00        nop     
9ee9 00        nop     
9eea 00        nop     
9eeb 00        nop     
9eec 00        nop     
9eed 00        nop     
9eee 00        nop     
9eef 00        nop     
9ef0 00        nop     
9ef1 00        nop     
9ef2 00        nop     
9ef3 00        nop     
9ef4 00        nop     
9ef5 00        nop     
9ef6 00        nop     
9ef7 00        nop     
9ef8 00        nop     
9ef9 00        nop     
9efa 00        nop     
9efb 00        nop     
9efc 00        nop     
9efd 00        nop     
9efe 00        nop     
9eff 00        nop     
9f00 00        nop     
9f01 00        nop     
9f02 00        nop     
9f03 00        nop     
9f04 00        nop     
9f05 00        nop     
9f06 00        nop     
9f07 00        nop     
9f08 00        nop     
9f09 00        nop     
9f0a 00        nop     
9f0b 00        nop     
9f0c 00        nop     
9f0d 00        nop     
9f0e 00        nop     
9f0f 00        nop     
9f10 00        nop     
9f11 00        nop     
9f12 00        nop     
9f13 00        nop     
9f14 00        nop     
9f15 00        nop     
9f16 00        nop     
9f17 00        nop     
9f18 00        nop     
9f19 00        nop     
9f1a 00        nop     
9f1b 00        nop     
9f1c 00        nop     
9f1d 00        nop     
9f1e 00        nop     
9f1f 00        nop     
9f20 00        nop     
9f21 00        nop     
9f22 00        nop     
9f23 00        nop     
9f24 00        nop     
9f25 00        nop     
9f26 00        nop     
9f27 00        nop     
9f28 00        nop     
9f29 00        nop     
9f2a 00        nop     
9f2b 00        nop     
9f2c 00        nop     
9f2d 00        nop     
9f2e 00        nop     
9f2f 00        nop     
9f30 00        nop     
9f31 00        nop     
9f32 00        nop     
9f33 00        nop     
9f34 00        nop     
9f35 00        nop     
9f36 00        nop     
9f37 00        nop     
9f38 00        nop     
9f39 00        nop     
9f3a 00        nop     
9f3b 00        nop     
9f3c 00        nop     
9f3d 00        nop     
9f3e 00        nop     
9f3f 00        nop     
9f40 00        nop     
9f41 00        nop     
9f42 00        nop     
9f43 00        nop     
9f44 00        nop     
9f45 00        nop     
9f46 00        nop     
9f47 00        nop     
9f48 00        nop     
9f49 00        nop     
9f4a 00        nop     
9f4b 00        nop     
9f4c 00        nop     
9f4d 00        nop     
9f4e 00        nop     
9f4f 00        nop     
9f50 00        nop     
9f51 00        nop     
9f52 00        nop     
9f53 00        nop     
9f54 00        nop     
9f55 00        nop     
9f56 00        nop     
9f57 00        nop     
9f58 00        nop     
9f59 00        nop     
9f5a 00        nop     
9f5b 00        nop     
9f5c 00        nop     
9f5d 00        nop     
9f5e 00        nop     
9f5f 00        nop     
9f60 00        nop     
9f61 00        nop     
9f62 00        nop     
9f63 00        nop     
9f64 00        nop     
9f65 00        nop     
9f66 00        nop     
9f67 00        nop     
9f68 00        nop     
9f69 00        nop     
9f6a 00        nop     
9f6b 00        nop     
9f6c 00        nop     
9f6d 00        nop     
9f6e 00        nop     
9f6f 00        nop     
9f70 00        nop     
9f71 00        nop     
9f72 00        nop     
9f73 00        nop     
9f74 00        nop     
9f75 00        nop     
9f76 00        nop     
9f77 00        nop     
9f78 00        nop     
9f79 00        nop     
9f7a 00        nop     
9f7b 00        nop     
9f7c 00        nop     
9f7d 00        nop     
9f7e 00        nop     
9f7f 00        nop     
9f80 00        nop     
9f81 00        nop     
9f82 00        nop     
9f83 00        nop     
9f84 00        nop     
9f85 00        nop     
9f86 00        nop     
9f87 00        nop     
9f88 00        nop     
9f89 00        nop     
9f8a 00        nop     
9f8b 00        nop     
9f8c 00        nop     
9f8d 00        nop     
9f8e 00        nop     
9f8f 00        nop     
9f90 00        nop     
9f91 00        nop     
9f92 00        nop     
9f93 00        nop     
9f94 00        nop     
9f95 00        nop     
9f96 00        nop     
9f97 00        nop     
9f98 00        nop     
9f99 00        nop     
9f9a 00        nop     
9f9b 00        nop     
9f9c 00        nop     
9f9d 00        nop     
9f9e 00        nop     
9f9f 00        nop     
9fa0 00        nop     
9fa1 00        nop     
9fa2 00        nop     
9fa3 00        nop     
9fa4 00        nop     
9fa5 00        nop     
9fa6 00        nop     
9fa7 00        nop     
9fa8 00        nop     
9fa9 00        nop     
9faa 00        nop     
9fab 00        nop     
9fac 00        nop     
9fad 00        nop     
9fae 00        nop     
9faf 00        nop     
9fb0 00        nop     
9fb1 00        nop     
9fb2 00        nop     
9fb3 00        nop     
9fb4 00        nop     
9fb5 00        nop     
9fb6 00        nop     
9fb7 00        nop     
9fb8 00        nop     
9fb9 00        nop     
9fba 00        nop     
9fbb 00        nop     
9fbc 00        nop     
9fbd 00        nop     
9fbe 00        nop     
9fbf 00        nop     
9fc0 00        nop     
9fc1 00        nop     
9fc2 00        nop     
9fc3 00        nop     
9fc4 00        nop     
9fc5 00        nop     
9fc6 00        nop     
9fc7 00        nop     
9fc8 00        nop     
9fc9 00        nop     
9fca 00        nop     
9fcb 00        nop     
9fcc 00        nop     
9fcd 00        nop     
9fce 00        nop     
9fcf 00        nop     
9fd0 00        nop     
9fd1 00        nop     
9fd2 00        nop     
9fd3 00        nop     
9fd4 00        nop     
9fd5 00        nop     
9fd6 00        nop     
9fd7 00        nop     
9fd8 00        nop     
9fd9 00        nop     
9fda 00        nop     
9fdb 00        nop     
9fdc 00        nop     
9fdd 00        nop     
9fde 00        nop     
9fdf 00        nop     
9fe0 00        nop     
9fe1 00        nop     
9fe2 00        nop     
9fe3 00        nop     
9fe4 00        nop     
9fe5 00        nop     
9fe6 00        nop     
9fe7 00        nop     
9fe8 00        nop     
9fe9 00        nop     
9fea 00        nop     
9feb 00        nop     
9fec 00        nop     
9fed 00        nop     
9fee 00        nop     
9fef 00        nop     
9ff0 00        nop     
9ff1 00        nop     
9ff2 00        nop     
9ff3 00        nop     
9ff4 00        nop     
9ff5 00        nop     
9ff6 00        nop     
9ff7 00        nop     
9ff8 00        nop     
9ff9 00        nop     
9ffa 00        nop     
9ffb 00        nop     
9ffc 00        nop     
9ffd 00        nop     
9ffe 00        nop     
9fff 00        nop     
a000 00        nop     
a001 00        nop     
a002 00        nop     
a003 00        nop     
a004 00        nop     
a005 00        nop     
a006 00        nop     
a007 00        nop     
a008 00        nop     
a009 00        nop     
a00a 00        nop     
a00b 00        nop     
a00c 00        nop     
a00d 00        nop     
a00e 00        nop     
a00f 00        nop     
a010 00        nop     
a011 00        nop     
a012 00        nop     
a013 00        nop     
a014 00        nop     
a015 00        nop     
a016 00        nop     
a017 00        nop     
a018 00        nop     
a019 00        nop     
a01a 00        nop     
a01b 00        nop     
a01c 00        nop     
a01d 00        nop     
a01e 00        nop     
a01f 00        nop     
a020 00        nop     
a021 00        nop     
a022 00        nop     
a023 00        nop     
a024 00        nop     
a025 00        nop     
a026 00        nop     
a027 00        nop     
a028 00        nop     
a029 00        nop     
a02a 00        nop     
a02b 00        nop     
a02c 00        nop     
a02d 00        nop     
a02e 00        nop     
a02f 00        nop     
a030 00        nop     
a031 00        nop     
a032 00        nop     
a033 00        nop     
a034 00        nop     
a035 00        nop     
a036 00        nop     
a037 00        nop     
a038 00        nop     
a039 00        nop     
a03a 00        nop     
a03b 00        nop     
a03c 00        nop     
a03d 00        nop     
a03e 00        nop     
a03f 00        nop     
a040 00        nop     
a041 00        nop     
a042 00        nop     
a043 00        nop     
a044 00        nop     
a045 00        nop     
a046 00        nop     
a047 00        nop     
a048 00        nop     
a049 00        nop     
a04a 00        nop     
a04b 00        nop     
a04c 00        nop     
a04d 00        nop     
a04e 00        nop     
a04f 00        nop     
a050 00        nop     
a051 00        nop     
a052 00        nop     
a053 00        nop     
a054 00        nop     
a055 00        nop     
a056 00        nop     
a057 00        nop     
a058 00        nop     
a059 00        nop     
a05a 00        nop     
a05b 00        nop     
a05c 00        nop     
a05d 00        nop     
a05e 00        nop     
a05f 00        nop     
a060 00        nop     
a061 00        nop     
a062 00        nop     
a063 00        nop     
a064 00        nop     
a065 00        nop     
a066 00        nop     
a067 00        nop     
a068 00        nop     
a069 00        nop     
a06a 00        nop     
a06b 00        nop     
a06c 00        nop     
a06d 00        nop     
a06e 00        nop     
a06f 00        nop     
a070 00        nop     
a071 00        nop     
a072 00        nop     
a073 00        nop     
a074 00        nop     
a075 00        nop     
a076 00        nop     
a077 00        nop     
a078 00        nop     
a079 00        nop     
a07a 00        nop     
a07b 00        nop     
a07c 00        nop     
a07d 00        nop     
a07e 00        nop     
a07f 00        nop     
a080 00        nop     
a081 00        nop     
a082 00        nop     
a083 00        nop     
a084 00        nop     
a085 00        nop     
a086 00        nop     
a087 00        nop     
a088 00        nop     
a089 00        nop     
a08a 00        nop     
a08b 00        nop     
a08c 00        nop     
a08d 00        nop     
a08e 00        nop     
a08f 00        nop     
a090 00        nop     
a091 00        nop     
a092 00        nop     
a093 00        nop     
a094 00        nop     
a095 00        nop     
a096 00        nop     
a097 00        nop     
a098 00        nop     
a099 00        nop     
a09a 00        nop     
a09b 00        nop     
a09c 00        nop     
a09d 00        nop     
a09e 00        nop     
a09f 00        nop     
a0a0 00        nop     
a0a1 00        nop     
a0a2 00        nop     
a0a3 00        nop     
a0a4 00        nop     
a0a5 00        nop     
a0a6 00        nop     
a0a7 00        nop     
a0a8 00        nop     
a0a9 00        nop     
a0aa 00        nop     
a0ab 00        nop     
a0ac 00        nop     
a0ad 00        nop     
a0ae 00        nop     
a0af 00        nop     
a0b0 00        nop     
a0b1 00        nop     
a0b2 00        nop     
a0b3 00        nop     
a0b4 00        nop     
a0b5 00        nop     
a0b6 00        nop     
a0b7 00        nop     
a0b8 00        nop     
a0b9 00        nop     
a0ba 00        nop     
a0bb 00        nop     
a0bc 00        nop     
a0bd 00        nop     
a0be 00        nop     
a0bf 00        nop     
a0c0 00        nop     
a0c1 00        nop     
a0c2 00        nop     
a0c3 00        nop     
a0c4 00        nop     
a0c5 00        nop     
a0c6 00        nop     
a0c7 00        nop     
a0c8 00        nop     
a0c9 00        nop     
a0ca 00        nop     
a0cb 00        nop     
a0cc 00        nop     
a0cd 00        nop     
a0ce 00        nop     
a0cf 00        nop     
a0d0 00        nop     
a0d1 00        nop     
a0d2 00        nop     
a0d3 00        nop     
a0d4 00        nop     
a0d5 00        nop     
a0d6 00        nop     
a0d7 00        nop     
a0d8 00        nop     
a0d9 00        nop     
a0da 00        nop     
a0db 00        nop     
a0dc 00        nop     
a0dd 00        nop     
a0de 00        nop     
a0df 00        nop     
a0e0 00        nop     
a0e1 00        nop     
a0e2 00        nop     
a0e3 00        nop     
a0e4 00        nop     
a0e5 00        nop     
a0e6 00        nop     
a0e7 00        nop     
a0e8 00        nop     
a0e9 00        nop     
a0ea 00        nop     
a0eb 00        nop     
a0ec 00        nop     
a0ed 00        nop     
a0ee 00        nop     
a0ef 00        nop     
a0f0 00        nop     
a0f1 00        nop     
a0f2 00        nop     
a0f3 00        nop     
a0f4 00        nop     
a0f5 00        nop     
a0f6 00        nop     
a0f7 00        nop     
a0f8 00        nop     
a0f9 00        nop     
a0fa 00        nop     
a0fb 00        nop     
a0fc 00        nop     
a0fd 00        nop     
a0fe 00        nop     
a0ff 00        nop     
a100 00        nop     
a101 00        nop     
a102 00        nop     
a103 00        nop     
a104 00        nop     
a105 00        nop     
a106 00        nop     
a107 00        nop     
a108 00        nop     
a109 00        nop     
a10a 00        nop     
a10b 00        nop     
a10c 00        nop     
a10d 00        nop     
a10e 00        nop     
a10f 00        nop     
a110 00        nop     
a111 00        nop     
a112 00        nop     
a113 00        nop     
a114 00        nop     
a115 00        nop     
a116 00        nop     
a117 00        nop     
a118 00        nop     
a119 00        nop     
a11a 00        nop     
a11b 00        nop     
a11c 00        nop     
a11d 00        nop     
a11e 00        nop     
a11f 00        nop     
a120 00        nop     
a121 00        nop     
a122 00        nop     
a123 00        nop     
a124 00        nop     
a125 00        nop     
a126 00        nop     
a127 00        nop     
a128 00        nop     
a129 00        nop     
a12a 00        nop     
a12b 00        nop     
a12c 00        nop     
a12d 00        nop     
a12e 00        nop     
a12f 00        nop     
a130 00        nop     
a131 00        nop     
a132 00        nop     
a133 00        nop     
a134 00        nop     
a135 00        nop     
a136 00        nop     
a137 00        nop     
a138 00        nop     
a139 00        nop     
a13a 00        nop     
a13b 00        nop     
a13c 00        nop     
a13d 00        nop     
a13e 00        nop     
a13f 00        nop     
a140 00        nop     
a141 00        nop     
a142 00        nop     
a143 00        nop     
a144 00        nop     
a145 00        nop     
a146 00        nop     
a147 00        nop     
a148 00        nop     
a149 00        nop     
a14a 00        nop     
a14b 00        nop     
a14c 00        nop     
a14d 00        nop     
a14e 00        nop     
a14f 00        nop     
a150 00        nop     
a151 00        nop     
a152 00        nop     
a153 00        nop     
a154 00        nop     
a155 00        nop     
a156 00        nop     
a157 00        nop     
a158 00        nop     
a159 00        nop     
a15a 00        nop     
a15b 00        nop     
a15c 00        nop     
a15d 00        nop     
a15e 00        nop     
a15f 00        nop     
a160 00        nop     
a161 00        nop     
a162 00        nop     
a163 00        nop     
a164 00        nop     
a165 00        nop     
a166 00        nop     
a167 00        nop     
a168 00        nop     
a169 00        nop     
a16a 00        nop     
a16b 00        nop     
a16c 00        nop     
a16d 00        nop     
a16e 00        nop     
a16f 00        nop     
a170 00        nop     
a171 00        nop     
a172 00        nop     
a173 00        nop     
a174 00        nop     
a175 00        nop     
a176 00        nop     
a177 00        nop     
a178 00        nop     
a179 00        nop     
a17a 00        nop     
a17b 00        nop     
a17c 00        nop     
a17d 00        nop     
a17e 00        nop     
a17f 00        nop     
a180 00        nop     
a181 00        nop     
a182 00        nop     
a183 00        nop     
a184 00        nop     
a185 00        nop     
a186 00        nop     
a187 00        nop     
a188 00        nop     
a189 00        nop     
a18a 00        nop     
a18b 00        nop     
a18c 00        nop     
a18d 00        nop     
a18e 00        nop     
a18f 00        nop     
a190 00        nop     
a191 00        nop     
a192 00        nop     
a193 00        nop     
a194 00        nop     
a195 00        nop     
a196 00        nop     
a197 00        nop     
a198 00        nop     
a199 00        nop     
a19a 00        nop     
a19b 00        nop     
a19c 00        nop     
a19d 00        nop     
a19e 00        nop     
a19f 00        nop     
a1a0 00        nop     
a1a1 00        nop     
a1a2 00        nop     
a1a3 00        nop     
a1a4 00        nop     
a1a5 00        nop     
a1a6 00        nop     
a1a7 00        nop     
a1a8 00        nop     
a1a9 00        nop     
a1aa 00        nop     
a1ab 00        nop     
a1ac 00        nop     
a1ad 00        nop     
a1ae 00        nop     
a1af 00        nop     
a1b0 00        nop     
a1b1 00        nop     
a1b2 00        nop     
a1b3 00        nop     
a1b4 00        nop     
a1b5 00        nop     
a1b6 00        nop     
a1b7 00        nop     
a1b8 00        nop     
a1b9 00        nop     
a1ba 00        nop     
a1bb 00        nop     
a1bc 00        nop     
a1bd 00        nop     
a1be 00        nop     
a1bf 00        nop     
a1c0 00        nop     
a1c1 00        nop     
a1c2 00        nop     
a1c3 00        nop     
a1c4 00        nop     
a1c5 00        nop     
a1c6 00        nop     
a1c7 00        nop     
a1c8 00        nop     
a1c9 00        nop     
a1ca 00        nop     
a1cb 00        nop     
a1cc 00        nop     
a1cd 00        nop     
a1ce 00        nop     
a1cf 00        nop     
a1d0 00        nop     
a1d1 00        nop     
a1d2 00        nop     
a1d3 00        nop     
a1d4 00        nop     
a1d5 00        nop     
a1d6 00        nop     
a1d7 00        nop     
a1d8 00        nop     
a1d9 00        nop     
a1da 00        nop     
a1db 00        nop     
a1dc 00        nop     
a1dd 00        nop     
a1de 00        nop     
a1df 00        nop     
a1e0 00        nop     
a1e1 00        nop     
a1e2 00        nop     
a1e3 00        nop     
a1e4 00        nop     
a1e5 00        nop     
a1e6 00        nop     
a1e7 00        nop     
a1e8 00        nop     
a1e9 00        nop     
a1ea 00        nop     
a1eb 00        nop     
a1ec 00        nop     
a1ed 00        nop     
a1ee 00        nop     
a1ef 00        nop     
a1f0 00        nop     
a1f1 00        nop     
a1f2 00        nop     
a1f3 00        nop     
a1f4 00        nop     
a1f5 00        nop     
a1f6 00        nop     
a1f7 00        nop     
a1f8 00        nop     
a1f9 00        nop     
a1fa 00        nop     
a1fb 00        nop     
a1fc 00        nop     
a1fd 00        nop     
a1fe 00        nop     
a1ff 00        nop     
a200 00        nop     
a201 00        nop     
a202 00        nop     
a203 00        nop     
a204 00        nop     
a205 00        nop     
a206 00        nop     
a207 00        nop     
a208 00        nop     
a209 00        nop     
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
a259 00        nop     
a25a 00        nop     
a25b 00        nop     
a25c 00        nop     
a25d 00        nop     
a25e 00        nop     
a25f 00        nop     
a260 00        nop     
a261 00        nop     
a262 00        nop     
a263 00        nop     
a264 00        nop     
a265 00        nop     
a266 00        nop     
a267 00        nop     
a268 00        nop     
a269 00        nop     
a26a 00        nop     
a26b 00        nop     
a26c 00        nop     
a26d 00        nop     
a26e 00        nop     
a26f 00        nop     
a270 00        nop     
a271 00        nop     
a272 00        nop     
a273 00        nop     
a274 00        nop     
a275 00        nop     
a276 00        nop     
a277 00        nop     
a278 00        nop     
a279 00        nop     
a27a 00        nop     
a27b 00        nop     
a27c 00        nop     
a27d 00        nop     
a27e 00        nop     
a27f 00        nop     
a280 00        nop     
a281 00        nop     
a282 00        nop     
a283 00        nop     
a284 00        nop     
a285 00        nop     
a286 00        nop     
a287 00        nop     
a288 00        nop     
a289 00        nop     
a28a 00        nop     
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
a29a 00        nop     
a29b 00        nop     
a29c 00        nop     
a29d 00        nop     
a29e 00        nop     
a29f 00        nop     
a2a0 00        nop     
a2a1 00        nop     
a2a2 00        nop     
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
a2d6 00        nop     
a2d7 00        nop     
a2d8 00        nop     
a2d9 00        nop     
a2da 00        nop     
a2db 00        nop     
a2dc 00        nop     
a2dd 00        nop     
a2de 00        nop     
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
a301 00        nop     
a302 00        nop     
a303 00        nop     
a304 00        nop     
a305 00        nop     
a306 00        nop     
a307 00        nop     
a308 00        nop     
a309 00        nop     
a30a 00        nop     
a30b 00        nop     
a30c 00        nop     
a30d 00        nop     
a30e 00        nop     
a30f 00        nop     
a310 00        nop     
a311 00        nop     
a312 00        nop     
a313 00        nop     
a314 00        nop     
a315 00        nop     
a316 00        nop     
a317 00        nop     
a318 00        nop     
a319 00        nop     
a31a 00        nop     
a31b 00        nop     
a31c 00        nop     
a31d 00        nop     
a31e 00        nop     
a31f 00        nop     
a320 00        nop     
a321 00        nop     
a322 00        nop     
a323 00        nop     
a324 00        nop     
a325 00        nop     
a326 00        nop     
a327 00        nop     
a328 00        nop     
a329 00        nop     
a32a 00        nop     
a32b 00        nop     
a32c 00        nop     
a32d 00        nop     
a32e 00        nop     
a32f 00        nop     
a330 00        nop     
a331 00        nop     
a332 00        nop     
a333 00        nop     
a334 00        nop     
a335 00        nop     
a336 00        nop     
a337 00        nop     
a338 00        nop     
a339 00        nop     
a33a 00        nop     
a33b 00        nop     
a33c 00        nop     
a33d 00        nop     
a33e 00        nop     
a33f 00        nop     
a340 00        nop     
a341 00        nop     
a342 00        nop     
a343 00        nop     
a344 00        nop     
a345 00        nop     
a346 00        nop     
a347 00        nop     
a348 00        nop     
a349 00        nop     
a34a 00        nop     
a34b 00        nop     
a34c 00        nop     
a34d 00        nop     
a34e 00        nop     
a34f 00        nop     
a350 00        nop     
a351 00        nop     
a352 00        nop     
a353 00        nop     
a354 00        nop     
a355 00        nop     
a356 00        nop     
a357 00        nop     
a358 00        nop     
a359 00        nop     
a35a 00        nop     
a35b 00        nop     
a35c 00        nop     
a35d 00        nop     
a35e 00        nop     
a35f 00        nop     
a360 00        nop     
a361 00        nop     
a362 00        nop     
a363 00        nop     
a364 00        nop     
a365 00        nop     
a366 00        nop     
a367 00        nop     
a368 00        nop     
a369 00        nop     
a36a 00        nop     
a36b 00        nop     
a36c 00        nop     
a36d 00        nop     
a36e 00        nop     
a36f 00        nop     
a370 00        nop     
a371 00        nop     
a372 00        nop     
a373 00        nop     
a374 00        nop     
a375 00        nop     
a376 00        nop     
a377 00        nop     
a378 00        nop     
a379 00        nop     
a37a 00        nop     
a37b 00        nop     
a37c 00        nop     
a37d 00        nop     
a37e 00        nop     
a37f 00        nop     
a380 00        nop     
a381 00        nop     
a382 00        nop     
a383 00        nop     
a384 00        nop     
a385 00        nop     
a386 00        nop     
a387 00        nop     
a388 00        nop     
a389 00        nop     
a38a 00        nop     
a38b 00        nop     
a38c 00        nop     
a38d 00        nop     
a38e 00        nop     
a38f 00        nop     
a390 00        nop     
a391 00        nop     
a392 00        nop     
a393 00        nop     
a394 00        nop     
a395 00        nop     
a396 00        nop     
a397 00        nop     
a398 00        nop     
a399 00        nop     
a39a 00        nop     
a39b 00        nop     
a39c 00        nop     
a39d 00        nop     
a39e 00        nop     
a39f 00        nop     
a3a0 00        nop     
a3a1 00        nop     
a3a2 00        nop     
a3a3 00        nop     
a3a4 00        nop     
a3a5 00        nop     
a3a6 00        nop     
a3a7 00        nop     
a3a8 00        nop     
a3a9 00        nop     
a3aa 00        nop     
a3ab 00        nop     
a3ac 00        nop     
a3ad 00        nop     
a3ae 00        nop     
a3af 00        nop     
a3b0 00        nop     
a3b1 00        nop     
a3b2 00        nop     
a3b3 00        nop     
a3b4 00        nop     
a3b5 00        nop     
a3b6 00        nop     
a3b7 00        nop     
a3b8 00        nop     
a3b9 00        nop     
a3ba 00        nop     
a3bb 00        nop     
a3bc 00        nop     
a3bd 00        nop     
a3be 00        nop     
a3bf 00        nop     
a3c0 00        nop     
a3c1 00        nop     
a3c2 00        nop     
a3c3 00        nop     
a3c4 00        nop     
a3c5 00        nop     
a3c6 00        nop     
a3c7 00        nop     
a3c8 00        nop     
a3c9 00        nop     
a3ca 00        nop     
a3cb 00        nop     
a3cc 00        nop     
a3cd 00        nop     
a3ce 00        nop     
a3cf 00        nop     
a3d0 00        nop     
a3d1 00        nop     
a3d2 00        nop     
a3d3 00        nop     
a3d4 00        nop     
a3d5 00        nop     
a3d6 00        nop     
a3d7 00        nop     
a3d8 00        nop     
a3d9 00        nop     
a3da 00        nop     
a3db 00        nop     
a3dc 00        nop     
a3dd 00        nop     
a3de 00        nop     
a3df 00        nop     
a3e0 00        nop     
a3e1 00        nop     
a3e2 00        nop     
a3e3 00        nop     
a3e4 00        nop     
a3e5 00        nop     
a3e6 00        nop     
a3e7 00        nop     
a3e8 00        nop     
a3e9 00        nop     
a3ea 00        nop     
a3eb 00        nop     
a3ec 00        nop     
a3ed 00        nop     
a3ee 00        nop     
a3ef 00        nop     
a3f0 00        nop     
a3f1 00        nop     
a3f2 00        nop     
a3f3 00        nop     
a3f4 00        nop     
a3f5 00        nop     
a3f6 00        nop     
a3f7 00        nop     
a3f8 00        nop     
a3f9 00        nop     
a3fa 00        nop     
a3fb 00        nop     
a3fc 00        nop     
a3fd 00        nop     
a3fe 00        nop     
a3ff 00        nop     
a400 00        nop     
a401 00        nop     
a402 00        nop     
a403 00        nop     
a404 00        nop     
a405 00        nop     
a406 00        nop     
a407 00        nop     
a408 00        nop     
a409 00        nop     
a40a 00        nop     
a40b 00        nop     
a40c 00        nop     
a40d 00        nop     
a40e 00        nop     
a40f 00        nop     
a410 00        nop     
a411 00        nop     
a412 00        nop     
a413 00        nop     
a414 00        nop     
a415 00        nop     
a416 00        nop     
a417 00        nop     
a418 00        nop     
a419 00        nop     
a41a 00        nop     
a41b 00        nop     
a41c 00        nop     
a41d 00        nop     
a41e 00        nop     
a41f 00        nop     
a420 00        nop     
a421 00        nop     
a422 00        nop     
a423 00        nop     
a424 00        nop     
a425 00        nop     
a426 00        nop     
a427 00        nop     
a428 00        nop     
a429 00        nop     
a42a 00        nop     
a42b 00        nop     
a42c 00        nop     
a42d 00        nop     
a42e 00        nop     
a42f 00        nop     
a430 00        nop     
a431 00        nop     
a432 00        nop     
a433 00        nop     
a434 00        nop     
a435 00        nop     
a436 00        nop     
a437 00        nop     
a438 00        nop     
a439 00        nop     
a43a 00        nop     
a43b 00        nop     
a43c 00        nop     
a43d 00        nop     
a43e 00        nop     
a43f 00        nop     
a440 00        nop     
a441 00        nop     
a442 00        nop     
a443 00        nop     
a444 00        nop     
a445 00        nop     
a446 00        nop     
a447 00        nop     
a448 00        nop     
a449 00        nop     
a44a 00        nop     
a44b 00        nop     
a44c 00        nop     
a44d 00        nop     
a44e 00        nop     
a44f 00        nop     
a450 00        nop     
a451 00        nop     
a452 00        nop     
a453 00        nop     
a454 00        nop     
a455 00        nop     
a456 00        nop     
a457 00        nop     
a458 00        nop     
a459 00        nop     
a45a 00        nop     
a45b 00        nop     
a45c 00        nop     
a45d 00        nop     
a45e 00        nop     
a45f 00        nop     
a460 00        nop     
a461 00        nop     
a462 00        nop     
a463 00        nop     
a464 00        nop     
a465 00        nop     
a466 00        nop     
a467 00        nop     
a468 00        nop     
a469 00        nop     
a46a 00        nop     
a46b 00        nop     
a46c 00        nop     
a46d 00        nop     
a46e 00        nop     
a46f 00        nop     
a470 00        nop     
a471 00        nop     
a472 00        nop     
a473 00        nop     
a474 00        nop     
a475 00        nop     
a476 00        nop     
a477 00        nop     
a478 00        nop     
a479 00        nop     
a47a 00        nop     
a47b 00        nop     
a47c 00        nop     
a47d 00        nop     
a47e 00        nop     
a47f 00        nop     
a480 00        nop     
a481 00        nop     
a482 00        nop     
a483 00        nop     
a484 00        nop     
a485 00        nop     
a486 00        nop     
a487 00        nop     
a488 00        nop     
a489 00        nop     
a48a 00        nop     
a48b 00        nop     
a48c 00        nop     
a48d 00        nop     
a48e 00        nop     
a48f 00        nop     
a490 00        nop     
a491 00        nop     
a492 00        nop     
a493 00        nop     
a494 00        nop     
a495 00        nop     
a496 00        nop     
a497 00        nop     
a498 00        nop     
a499 00        nop     
a49a 00        nop     
a49b 00        nop     
a49c 00        nop     
a49d 00        nop     
a49e 00        nop     
a49f 00        nop     
a4a0 00        nop     
a4a1 00        nop     
a4a2 00        nop     
a4a3 00        nop     
a4a4 00        nop     
a4a5 00        nop     
a4a6 00        nop     
a4a7 00        nop     
a4a8 00        nop     
a4a9 00        nop     
a4aa 00        nop     
a4ab 00        nop     
a4ac 00        nop     
a4ad 00        nop     
a4ae 00        nop     
a4af 00        nop     
a4b0 00        nop     
a4b1 00        nop     
a4b2 00        nop     
a4b3 00        nop     
a4b4 00        nop     
a4b5 00        nop     
a4b6 00        nop     
a4b7 00        nop     
a4b8 00        nop     
a4b9 00        nop     
a4ba 00        nop     
a4bb 00        nop     
a4bc 00        nop     
a4bd 00        nop     
a4be 00        nop     
a4bf 00        nop     
a4c0 00        nop     
a4c1 00        nop     
a4c2 00        nop     
a4c3 00        nop     
a4c4 00        nop     
a4c5 00        nop     
a4c6 00        nop     
a4c7 00        nop     
a4c8 00        nop     
a4c9 00        nop     
a4ca 00        nop     
a4cb 00        nop     
a4cc 00        nop     
a4cd 00        nop     
a4ce 00        nop     
a4cf 00        nop     
a4d0 00        nop     
a4d1 00        nop     
a4d2 00        nop     
a4d3 00        nop     
a4d4 00        nop     
a4d5 00        nop     
a4d6 00        nop     
a4d7 00        nop     
a4d8 00        nop     
a4d9 00        nop     
a4da 00        nop     
a4db 00        nop     
a4dc 00        nop     
a4dd 00        nop     
a4de 00        nop     
a4df 00        nop     
a4e0 00        nop     
a4e1 00        nop     
a4e2 00        nop     
a4e3 00        nop     
a4e4 00        nop     
a4e5 00        nop     
a4e6 00        nop     
a4e7 00        nop     
a4e8 00        nop     
a4e9 00        nop     
a4ea 00        nop     
a4eb 00        nop     
a4ec 00        nop     
a4ed 00        nop     
a4ee 00        nop     
a4ef 00        nop     
a4f0 00        nop     
a4f1 00        nop     
a4f2 00        nop     
a4f3 00        nop     
a4f4 00        nop     
a4f5 00        nop     
a4f6 00        nop     
a4f7 00        nop     
a4f8 00        nop     
a4f9 00        nop     
a4fa 00        nop     
a4fb 00        nop     
a4fc 00        nop     
a4fd 00        nop     
a4fe 00        nop     
a4ff 00        nop     
a500 00        nop     
a501 00        nop     
a502 00        nop     
a503 00        nop     
a504 00        nop     
a505 00        nop     
a506 00        nop     
a507 00        nop     
a508 00        nop     
a509 00        nop     
a50a 00        nop     
a50b 00        nop     
a50c 00        nop     
a50d 00        nop     
a50e 00        nop     
a50f 00        nop     
a510 00        nop     
a511 00        nop     
a512 00        nop     
a513 00        nop     
a514 00        nop     
a515 00        nop     
a516 00        nop     
a517 00        nop     
a518 00        nop     
a519 00        nop     
a51a 00        nop     
a51b 00        nop     
a51c 00        nop     
a51d 00        nop     
a51e 00        nop     
a51f 00        nop     
a520 00        nop     
a521 00        nop     
a522 00        nop     
a523 00        nop     
a524 00        nop     
a525 00        nop     
a526 00        nop     
a527 00        nop     
a528 00        nop     
a529 00        nop     
a52a 00        nop     
a52b 00        nop     
a52c 00        nop     
a52d 00        nop     
a52e 00        nop     
a52f 00        nop     
a530 00        nop     
a531 00        nop     
a532 00        nop     
a533 00        nop     
a534 00        nop     
a535 00        nop     
a536 00        nop     
a537 00        nop     
a538 00        nop     
a539 00        nop     
a53a 00        nop     
a53b 00        nop     
a53c 00        nop     
a53d 00        nop     
a53e 00        nop     
a53f 00        nop     
a540 00        nop     
a541 00        nop     
a542 00        nop     
a543 00        nop     
a544 00        nop     
a545 00        nop     
a546 00        nop     
a547 00        nop     
a548 00        nop     
a549 00        nop     
a54a 00        nop     
a54b 00        nop     
a54c 00        nop     
a54d 00        nop     
a54e 00        nop     
a54f 00        nop     
a550 00        nop     
a551 00        nop     
a552 00        nop     
a553 00        nop     
a554 00        nop     
a555 00        nop     
a556 00        nop     
a557 00        nop     
a558 00        nop     
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
a5a8 00        nop     
a5a9 00        nop     
a5aa 00        nop     
a5ab 00        nop     
a5ac 00        nop     
a5ad 00        nop     
a5ae 00        nop     
a5af 00        nop     
a5b0 00        nop     
a5b1 00        nop     
a5b2 00        nop     
a5b3 00        nop     
a5b4 00        nop     
a5b5 00        nop     
a5b6 00        nop     
a5b7 00        nop     
a5b8 00        nop     
a5b9 00        nop     
a5ba 00        nop     
a5bb 00        nop     
a5bc 00        nop     
a5bd 00        nop     
a5be 00        nop     
a5bf 00        nop     
a5c0 00        nop     
a5c1 00        nop     
a5c2 00        nop     
a5c3 00        nop     
a5c4 00        nop     
a5c5 00        nop     
a5c6 00        nop     
a5c7 00        nop     
a5c8 00        nop     
a5c9 00        nop     
a5ca 00        nop     
a5cb 00        nop     
a5cc 00        nop     
a5cd 00        nop     
a5ce 00        nop     
a5cf 00        nop     
a5d0 00        nop     
a5d1 00        nop     
a5d2 00        nop     
a5d3 00        nop     
a5d4 00        nop     
a5d5 00        nop     
a5d6 00        nop     
a5d7 00        nop     
a5d8 00        nop     
a5d9 00        nop     
a5da 00        nop     
a5db 00        nop     
a5dc 00        nop     
a5dd 00        nop     
a5de 00        nop     
a5df 00        nop     
a5e0 00        nop     
a5e1 00        nop     
a5e2 00        nop     
a5e3 00        nop     
a5e4 00        nop     
a5e5 00        nop     
a5e6 00        nop     
a5e7 00        nop     
a5e8 00        nop     
a5e9 00        nop     
a5ea 00        nop     
a5eb 00        nop     
a5ec 00        nop     
a5ed 00        nop     
a5ee 00        nop     
a5ef 00        nop     
a5f0 00        nop     
a5f1 00        nop     
a5f2 00        nop     
a5f3 00        nop     
a5f4 00        nop     
a5f5 00        nop     
a5f6 00        nop     
a5f7 00        nop     
a5f8 00        nop     
a5f9 00        nop     
a5fa 00        nop     
a5fb 00        nop     
a5fc 00        nop     
a5fd 00        nop     
a5fe 00        nop     
a5ff 00        nop     
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
a612 00        nop     
a613 00        nop     
a614 00        nop     
a615 00        nop     
a616 00        nop     
a617 00        nop     
a618 00        nop     
a619 00        nop     
a61a 00        nop     
a61b 00        nop     
a61c 00        nop     
a61d 00        nop     
a61e 00        nop     
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
a636 00        nop     
a637 00        nop     
a638 00        nop     
a639 00        nop     
a63a 00        nop     
a63b 00        nop     
a63c 00        nop     
a63d 00        nop     
a63e 00        nop     
a63f 00        nop     
a640 00        nop     
a641 00        nop     
a642 00        nop     
a643 00        nop     
a644 00        nop     
a645 00        nop     
a646 00        nop     
a647 00        nop     
a648 00        nop     
a649 00        nop     
a64a 00        nop     
a64b 00        nop     
a64c 00        nop     
a64d 00        nop     
a64e 00        nop     
a64f 00        nop     
a650 00        nop     
a651 00        nop     
a652 00        nop     
a653 00        nop     
a654 00        nop     
a655 00        nop     
a656 00        nop     
a657 00        nop     
a658 00        nop     
a659 00        nop     
a65a 00        nop     
a65b 00        nop     
a65c 00        nop     
a65d 00        nop     
a65e 00        nop     
a65f 00        nop     
a660 00        nop     
a661 00        nop     
a662 00        nop     
a663 00        nop     
a664 00        nop     
a665 00        nop     
a666 00        nop     
a667 00        nop     
a668 00        nop     
a669 00        nop     
a66a 00        nop     
a66b 00        nop     
a66c 00        nop     
a66d 00        nop     
a66e 00        nop     
a66f 00        nop     
a670 00        nop     
a671 00        nop     
a672 00        nop     
a673 00        nop     
a674 00        nop     
a675 00        nop     
a676 00        nop     
a677 00        nop     
a678 00        nop     
a679 00        nop     
a67a 00        nop     
a67b 00        nop     
a67c 00        nop     
a67d 00        nop     
a67e 00        nop     
a67f 00        nop     
a680 00        nop     
a681 00        nop     
a682 00        nop     
a683 00        nop     
a684 00        nop     
a685 00        nop     
a686 00        nop     
a687 00        nop     
a688 00        nop     
a689 00        nop     
a68a 00        nop     
a68b 00        nop     
a68c 00        nop     
a68d 00        nop     
a68e 00        nop     
a68f 00        nop     
a690 00        nop     
a691 00        nop     
a692 00        nop     
a693 00        nop     
a694 00        nop     
a695 00        nop     
a696 00        nop     
a697 00        nop     
a698 00        nop     
a699 00        nop     
a69a 00        nop     
a69b 00        nop     
a69c 00        nop     
a69d 00        nop     
a69e 00        nop     
a69f 00        nop     
a6a0 00        nop     
a6a1 00        nop     
a6a2 00        nop     
a6a3 00        nop     
a6a4 00        nop     
a6a5 00        nop     
a6a6 00        nop     
a6a7 00        nop     
a6a8 00        nop     
a6a9 00        nop     
a6aa 00        nop     
a6ab 00        nop     
a6ac 00        nop     
a6ad 00        nop     
a6ae 00        nop     
a6af 00        nop     
a6b0 00        nop     
a6b1 00        nop     
a6b2 00        nop     
a6b3 00        nop     
a6b4 00        nop     
a6b5 00        nop     
a6b6 00        nop     
a6b7 00        nop     
a6b8 00        nop     
a6b9 00        nop     
a6ba 00        nop     
a6bb 00        nop     
a6bc 00        nop     
a6bd 00        nop     
a6be 00        nop     
a6bf 00        nop     
a6c0 00        nop     
a6c1 00        nop     
a6c2 00        nop     
a6c3 00        nop     
a6c4 00        nop     
a6c5 00        nop     
a6c6 00        nop     
a6c7 00        nop     
a6c8 00        nop     
a6c9 00        nop     
a6ca 00        nop     
a6cb 00        nop     
a6cc 00        nop     
a6cd 00        nop     
a6ce 00        nop     
a6cf 00        nop     
a6d0 00        nop     
a6d1 00        nop     
a6d2 00        nop     
a6d3 00        nop     
a6d4 00        nop     
a6d5 00        nop     
a6d6 00        nop     
a6d7 00        nop     
a6d8 00        nop     
a6d9 00        nop     
a6da 00        nop     
a6db 00        nop     
a6dc 00        nop     
a6dd 00        nop     
a6de 00        nop     
a6df 00        nop     
a6e0 00        nop     
a6e1 00        nop     
a6e2 00        nop     
a6e3 00        nop     
a6e4 00        nop     
a6e5 00        nop     
a6e6 00        nop     
a6e7 00        nop     
a6e8 00        nop     
a6e9 00        nop     
a6ea 00        nop     
a6eb 00        nop     
a6ec 00        nop     
a6ed 00        nop     
a6ee 00        nop     
a6ef 00        nop     
a6f0 00        nop     
a6f1 00        nop     
a6f2 00        nop     
a6f3 00        nop     
a6f4 00        nop     
a6f5 00        nop     
a6f6 00        nop     
a6f7 00        nop     
a6f8 00        nop     
a6f9 00        nop     
a6fa 00        nop     
a6fb 00        nop     
a6fc 00        nop     
a6fd 00        nop     
a6fe 00        nop     
a6ff 00        nop     
a700 00        nop     
a701 00        nop     
a702 00        nop     
a703 00        nop     
a704 00        nop     
a705 00        nop     
a706 00        nop     
a707 00        nop     
a708 00        nop     
a709 00        nop     
a70a 00        nop     
a70b 00        nop     
a70c 00        nop     
a70d 00        nop     
a70e 00        nop     
a70f 00        nop     
a710 00        nop     
a711 00        nop     
a712 00        nop     
a713 00        nop     
a714 00        nop     
a715 00        nop     
a716 00        nop     
a717 00        nop     
a718 00        nop     
a719 00        nop     
a71a 00        nop     
a71b 00        nop     
a71c 00        nop     
a71d 00        nop     
a71e 00        nop     
a71f 00        nop     
a720 00        nop     
a721 00        nop     
a722 00        nop     
a723 00        nop     
a724 00        nop     
a725 00        nop     
a726 00        nop     
a727 00        nop     
a728 00        nop     
a729 00        nop     
a72a 00        nop     
a72b 00        nop     
a72c 00        nop     
a72d 00        nop     
a72e 00        nop     
a72f 00        nop     
a730 00        nop     
a731 00        nop     
a732 00        nop     
a733 00        nop     
a734 00        nop     
a735 00        nop     
a736 00        nop     
a737 00        nop     
a738 00        nop     
a739 00        nop     
a73a 00        nop     
a73b 00        nop     
a73c 00        nop     
a73d 00        nop     
a73e 00        nop     
a73f 00        nop     
a740 00        nop     
a741 00        nop     
a742 00        nop     
a743 00        nop     
a744 00        nop     
a745 00        nop     
a746 00        nop     
a747 00        nop     
a748 00        nop     
a749 00        nop     
a74a 00        nop     
a74b 00        nop     
a74c 00        nop     
a74d 00        nop     
a74e 00        nop     
a74f 00        nop     
a750 00        nop     
a751 00        nop     
a752 00        nop     
a753 00        nop     
a754 00        nop     
a755 00        nop     
a756 00        nop     
a757 00        nop     
a758 00        nop     
a759 00        nop     
a75a 00        nop     
a75b 00        nop     
a75c 00        nop     
a75d 00        nop     
a75e 00        nop     
a75f 00        nop     
a760 00        nop     
a761 00        nop     
a762 00        nop     
a763 00        nop     
a764 00        nop     
a765 00        nop     
a766 00        nop     
a767 00        nop     
a768 00        nop     
a769 00        nop     
a76a 00        nop     
a76b 00        nop     
a76c 00        nop     
a76d 00        nop     
a76e 00        nop     
a76f 00        nop     
a770 00        nop     
a771 00        nop     
a772 00        nop     
a773 00        nop     
a774 00        nop     
a775 00        nop     
a776 00        nop     
a777 00        nop     
a778 00        nop     
a779 00        nop     
a77a 00        nop     
a77b 00        nop     
a77c 00        nop     
a77d 00        nop     
a77e 00        nop     
a77f 00        nop     
a780 00        nop     
a781 00        nop     
a782 00        nop     
a783 00        nop     
a784 00        nop     
a785 00        nop     
a786 00        nop     
a787 00        nop     
a788 00        nop     
a789 00        nop     
a78a 00        nop     
a78b 00        nop     
a78c 00        nop     
a78d 00        nop     
a78e 00        nop     
a78f 00        nop     
a790 00        nop     
a791 00        nop     
a792 00        nop     
a793 00        nop     
a794 00        nop     
a795 00        nop     
a796 00        nop     
a797 00        nop     
a798 00        nop     
a799 00        nop     
a79a 00        nop     
a79b 00        nop     
a79c 00        nop     
a79d 00        nop     
a79e 00        nop     
a79f 00        nop     
a7a0 00        nop     
a7a1 00        nop     
a7a2 00        nop     
a7a3 00        nop     
a7a4 00        nop     
a7a5 00        nop     
a7a6 00        nop     
a7a7 00        nop     
a7a8 00        nop     
a7a9 00        nop     
a7aa 00        nop     
a7ab 00        nop     
a7ac 00        nop     
a7ad 00        nop     
a7ae 00        nop     
a7af 00        nop     
a7b0 00        nop     
a7b1 00        nop     
a7b2 00        nop     
a7b3 00        nop     
a7b4 00        nop     
a7b5 00        nop     
a7b6 00        nop     
a7b7 00        nop     
a7b8 00        nop     
a7b9 00        nop     
a7ba 00        nop     
a7bb 00        nop     
a7bc 00        nop     
a7bd 00        nop     
a7be 00        nop     
a7bf 00        nop     
a7c0 00        nop     
a7c1 00        nop     
a7c2 00        nop     
a7c3 00        nop     
a7c4 00        nop     
a7c5 00        nop     
a7c6 00        nop     
a7c7 00        nop     
a7c8 00        nop     
a7c9 00        nop     
a7ca 00        nop     
a7cb 00        nop     
a7cc 00        nop     
a7cd 00        nop     
a7ce 00        nop     
a7cf 00        nop     
a7d0 00        nop     
a7d1 00        nop     
a7d2 00        nop     
a7d3 00        nop     
a7d4 00        nop     
a7d5 00        nop     
a7d6 00        nop     
a7d7 00        nop     
a7d8 00        nop     
a7d9 00        nop     
a7da 00        nop     
a7db 00        nop     
a7dc 00        nop     
a7dd 00        nop     
a7de 00        nop     
a7df 00        nop     
a7e0 00        nop     
a7e1 00        nop     
a7e2 00        nop     
a7e3 00        nop     
a7e4 00        nop     
a7e5 00        nop     
a7e6 00        nop     
a7e7 00        nop     
a7e8 00        nop     
a7e9 00        nop     
a7ea 00        nop     
a7eb 00        nop     
a7ec 00        nop     
a7ed 00        nop     
a7ee 00        nop     
a7ef 00        nop     
a7f0 00        nop     
a7f1 00        nop     
a7f2 00        nop     
a7f3 00        nop     
a7f4 00        nop     
a7f5 00        nop     
a7f6 00        nop     
a7f7 00        nop     
a7f8 00        nop     
a7f9 00        nop     
a7fa 00        nop     
a7fb 00        nop     
a7fc 00        nop     
a7fd 00        nop     
a7fe 00        nop     
a7ff 00        nop     
a800 00        nop     
a801 00        nop     
a802 00        nop     
a803 00        nop     
a804 00        nop     
a805 00        nop     
a806 00        nop     
a807 00        nop     
a808 00        nop     
a809 00        nop     
a80a 00        nop     
a80b 00        nop     
a80c 00        nop     
a80d 00        nop     
a80e 00        nop     
a80f 00        nop     
a810 00        nop     
a811 00        nop     
a812 00        nop     
a813 00        nop     
a814 00        nop     
a815 00        nop     
a816 00        nop     
a817 00        nop     
a818 00        nop     
a819 00        nop     
a81a 00        nop     
a81b 00        nop     
a81c 00        nop     
a81d 00        nop     
a81e 00        nop     
a81f 00        nop     
a820 00        nop     
a821 00        nop     
a822 00        nop     
a823 00        nop     
a824 00        nop     
a825 00        nop     
a826 00        nop     
a827 00        nop     
a828 00        nop     
a829 00        nop     
a82a 00        nop     
a82b 00        nop     
a82c 00        nop     
a82d 00        nop     
a82e 00        nop     
a82f 00        nop     
a830 00        nop     
a831 00        nop     
a832 00        nop     
a833 00        nop     
a834 00        nop     
a835 00        nop     
a836 00        nop     
a837 00        nop     
a838 00        nop     
a839 00        nop     
a83a 00        nop     
a83b 00        nop     
a83c 00        nop     
a83d 00        nop     
a83e 00        nop     
a83f 00        nop     
a840 00        nop     
a841 00        nop     
a842 00        nop     
a843 00        nop     
a844 00        nop     
a845 00        nop     
a846 00        nop     
a847 00        nop     
a848 00        nop     
a849 00        nop     
a84a 00        nop     
a84b 00        nop     
a84c 00        nop     
a84d 00        nop     
a84e 00        nop     
a84f 00        nop     
a850 00        nop     
a851 00        nop     
a852 00        nop     
a853 00        nop     
a854 00        nop     
a855 00        nop     
a856 00        nop     
a857 00        nop     
a858 00        nop     
a859 00        nop     
a85a 00        nop     
a85b 00        nop     
a85c 00        nop     
a85d 00        nop     
a85e 00        nop     
a85f 00        nop     
a860 00        nop     
a861 00        nop     
a862 00        nop     
a863 00        nop     
a864 00        nop     
a865 00        nop     
a866 00        nop     
a867 00        nop     
a868 00        nop     
a869 00        nop     
a86a 00        nop     
a86b 00        nop     
a86c 00        nop     
a86d 00        nop     
a86e 00        nop     
a86f 00        nop     
a870 00        nop     
a871 00        nop     
a872 00        nop     
a873 00        nop     
a874 00        nop     
a875 00        nop     
a876 00        nop     
a877 00        nop     
a878 00        nop     
a879 00        nop     
a87a 00        nop     
a87b 00        nop     
a87c 00        nop     
a87d 00        nop     
a87e 00        nop     
a87f 00        nop     
a880 00        nop     
a881 00        nop     
a882 00        nop     
a883 00        nop     
a884 00        nop     
a885 00        nop     
a886 00        nop     
a887 00        nop     
a888 00        nop     
a889 00        nop     
a88a 00        nop     
a88b 00        nop     
a88c 00        nop     
a88d 00        nop     
a88e 00        nop     
a88f 00        nop     
a890 00        nop     
a891 00        nop     
a892 00        nop     
a893 00        nop     
a894 00        nop     
a895 00        nop     
a896 00        nop     
a897 00        nop     
a898 00        nop     
a899 00        nop     
a89a 00        nop     
a89b 00        nop     
a89c 00        nop     
a89d 00        nop     
a89e 00        nop     
a89f 00        nop     
a8a0 00        nop     
a8a1 00        nop     
a8a2 00        nop     
a8a3 00        nop     
a8a4 00        nop     
a8a5 00        nop     
a8a6 00        nop     
a8a7 00        nop     
a8a8 00        nop     
a8a9 00        nop     
a8aa 00        nop     
a8ab 00        nop     
a8ac 00        nop     
a8ad 00        nop     
a8ae 00        nop     
a8af 00        nop     
a8b0 00        nop     
a8b1 00        nop     
a8b2 00        nop     
a8b3 00        nop     
a8b4 00        nop     
a8b5 00        nop     
a8b6 00        nop     
a8b7 00        nop     
a8b8 00        nop     
a8b9 00        nop     
a8ba 00        nop     
a8bb 00        nop     
a8bc 00        nop     
a8bd 00        nop     
a8be 00        nop     
a8bf 00        nop     
a8c0 00        nop     
a8c1 00        nop     
a8c2 00        nop     
a8c3 00        nop     
a8c4 00        nop     
a8c5 00        nop     
a8c6 00        nop     
a8c7 00        nop     
a8c8 00        nop     
a8c9 00        nop     
a8ca 00        nop     
a8cb 00        nop     
a8cc 00        nop     
a8cd 00        nop     
a8ce 00        nop     
a8cf 00        nop     
a8d0 00        nop     
a8d1 00        nop     
a8d2 00        nop     
a8d3 00        nop     
a8d4 00        nop     
a8d5 00        nop     
a8d6 00        nop     
a8d7 00        nop     
a8d8 00        nop     
a8d9 00        nop     
a8da 00        nop     
a8db 00        nop     
a8dc 00        nop     
a8dd 00        nop     
a8de 00        nop     
a8df 00        nop     
a8e0 00        nop     
a8e1 00        nop     
a8e2 00        nop     
a8e3 00        nop     
a8e4 00        nop     
a8e5 00        nop     
a8e6 00        nop     
a8e7 00        nop     
a8e8 00        nop     
a8e9 00        nop     
a8ea 00        nop     
a8eb 00        nop     
a8ec 00        nop     
a8ed 00        nop     
a8ee 00        nop     
a8ef 00        nop     
a8f0 00        nop     
a8f1 00        nop     
a8f2 00        nop     
a8f3 00        nop     
a8f4 00        nop     
a8f5 00        nop     
a8f6 00        nop     
a8f7 00        nop     
a8f8 00        nop     
a8f9 00        nop     
a8fa 00        nop     
a8fb 00        nop     
a8fc 00        nop     
a8fd 00        nop     
a8fe 00        nop     
a8ff 00        nop     
a900 00        nop     
a901 00        nop     
a902 00        nop     
a903 00        nop     
a904 00        nop     
a905 00        nop     
a906 00        nop     
a907 00        nop     
a908 00        nop     
a909 00        nop     
a90a 00        nop     
a90b 00        nop     
a90c 00        nop     
a90d 00        nop     
a90e 00        nop     
a90f 00        nop     
a910 00        nop     
a911 00        nop     
a912 00        nop     
a913 00        nop     
a914 00        nop     
a915 00        nop     
a916 00        nop     
a917 00        nop     
a918 00        nop     
a919 00        nop     
a91a 00        nop     
a91b 00        nop     
a91c 00        nop     
a91d 00        nop     
a91e 00        nop     
a91f 00        nop     
a920 00        nop     
a921 00        nop     
a922 00        nop     
a923 00        nop     
a924 00        nop     
a925 00        nop     
a926 00        nop     
a927 00        nop     
a928 00        nop     
a929 00        nop     
a92a 00        nop     
a92b 00        nop     
a92c 00        nop     
a92d 00        nop     
a92e 00        nop     
a92f 00        nop     
a930 00        nop     
a931 00        nop     
a932 00        nop     
a933 00        nop     
a934 00        nop     
a935 00        nop     
a936 00        nop     
a937 00        nop     
a938 00        nop     
a939 00        nop     
a93a 00        nop     
a93b 00        nop     
a93c 00        nop     
a93d 00        nop     
a93e 00        nop     
a93f 00        nop     
a940 00        nop     
a941 00        nop     
a942 00        nop     
a943 00        nop     
a944 00        nop     
a945 00        nop     
a946 00        nop     
a947 00        nop     
a948 00        nop     
a949 00        nop     
a94a 00        nop     
a94b 00        nop     
a94c 00        nop     
a94d 00        nop     
a94e 00        nop     
a94f 00        nop     
a950 00        nop     
a951 00        nop     
a952 00        nop     
a953 00        nop     
a954 00        nop     
a955 00        nop     
a956 00        nop     
a957 00        nop     
a958 00        nop     
a959 00        nop     
a95a 00        nop     
a95b 00        nop     
a95c 00        nop     
a95d 00        nop     
a95e 00        nop     
a95f 00        nop     
a960 00        nop     
a961 00        nop     
a962 00        nop     
a963 00        nop     
a964 00        nop     
a965 00        nop     
a966 00        nop     
a967 00        nop     
a968 00        nop     
a969 00        nop     
a96a 00        nop     
a96b 00        nop     
a96c 00        nop     
a96d 00        nop     
a96e 00        nop     
a96f 00        nop     
a970 00        nop     
a971 00        nop     
a972 00        nop     
a973 00        nop     
a974 00        nop     
a975 00        nop     
a976 00        nop     
a977 00        nop     
a978 00        nop     
a979 00        nop     
a97a 00        nop     
a97b 00        nop     
a97c 00        nop     
a97d 00        nop     
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
a993 00        nop     
a994 00        nop     
a995 00        nop     
a996 00        nop     
a997 00        nop     
a998 00        nop     
a999 00        nop     
a99a 00        nop     
a99b 00        nop     
a99c 00        nop     
a99d 00        nop     
a99e 00        nop     
a99f 00        nop     
a9a0 00        nop     
a9a1 00        nop     
a9a2 00        nop     
a9a3 00        nop     
a9a4 00        nop     
a9a5 00        nop     
a9a6 00        nop     
a9a7 00        nop     
a9a8 00        nop     
a9a9 00        nop     
a9aa 00        nop     
a9ab 00        nop     
a9ac 00        nop     
a9ad 00        nop     
a9ae 00        nop     
a9af 00        nop     
a9b0 00        nop     
a9b1 00        nop     
a9b2 00        nop     
a9b3 00        nop     
a9b4 00        nop     
a9b5 00        nop     
a9b6 00        nop     
a9b7 00        nop     
a9b8 00        nop     
a9b9 00        nop     
a9ba 00        nop     
a9bb 00        nop     
a9bc 00        nop     
a9bd 00        nop     
a9be 00        nop     
a9bf 00        nop     
a9c0 00        nop     
a9c1 00        nop     
a9c2 00        nop     
a9c3 00        nop     
a9c4 00        nop     
a9c5 00        nop     
a9c6 00        nop     
a9c7 00        nop     
a9c8 00        nop     
a9c9 00        nop     
a9ca 00        nop     
a9cb 00        nop     
a9cc 00        nop     
a9cd 00        nop     
a9ce 00        nop     
a9cf 00        nop     
a9d0 00        nop     
a9d1 00        nop     
a9d2 00        nop     
a9d3 00        nop     
a9d4 00        nop     
a9d5 00        nop     
a9d6 00        nop     
a9d7 00        nop     
a9d8 00        nop     
a9d9 00        nop     
a9da 00        nop     
a9db 00        nop     
a9dc 00        nop     
a9dd 00        nop     
a9de 00        nop     
a9df 00        nop     
a9e0 00        nop     
a9e1 00        nop     
a9e2 00        nop     
a9e3 00        nop     
a9e4 00        nop     
a9e5 00        nop     
a9e6 00        nop     
a9e7 00        nop     
a9e8 00        nop     
a9e9 00        nop     
a9ea 00        nop     
a9eb 00        nop     
a9ec 00        nop     
a9ed 00        nop     
a9ee 00        nop     
a9ef 00        nop     
a9f0 00        nop     
a9f1 00        nop     
a9f2 00        nop     
a9f3 00        nop     
a9f4 00        nop     
a9f5 00        nop     
a9f6 00        nop     
a9f7 00        nop     
a9f8 00        nop     
a9f9 00        nop     
a9fa 00        nop     
a9fb 00        nop     
a9fc 00        nop     
a9fd 00        nop     
a9fe 00        nop     
a9ff 00        nop     
aa00 00        nop     
aa01 00        nop     
aa02 00        nop     
aa03 00        nop     
aa04 00        nop     
aa05 00        nop     
aa06 00        nop     
aa07 00        nop     
aa08 00        nop     
aa09 00        nop     
aa0a 00        nop     
aa0b 00        nop     
aa0c 00        nop     
aa0d 00        nop     
aa0e 00        nop     
aa0f 00        nop     
aa10 00        nop     
aa11 00        nop     
aa12 00        nop     
aa13 00        nop     
aa14 00        nop     
aa15 00        nop     
aa16 00        nop     
aa17 00        nop     
aa18 00        nop     
aa19 00        nop     
aa1a 00        nop     
aa1b 00        nop     
aa1c 00        nop     
aa1d 00        nop     
aa1e 00        nop     
aa1f 00        nop     
aa20 00        nop     
aa21 00        nop     
aa22 00        nop     
aa23 00        nop     
aa24 00        nop     
aa25 00        nop     
aa26 00        nop     
aa27 00        nop     
aa28 00        nop     
aa29 00        nop     
aa2a 00        nop     
aa2b 00        nop     
aa2c 00        nop     
aa2d 00        nop     
aa2e 00        nop     
aa2f 00        nop     
aa30 00        nop     
aa31 00        nop     
aa32 00        nop     
aa33 00        nop     
aa34 00        nop     
aa35 00        nop     
aa36 00        nop     
aa37 00        nop     
aa38 00        nop     
aa39 00        nop     
aa3a 00        nop     
aa3b 00        nop     
aa3c 00        nop     
aa3d 00        nop     
aa3e 00        nop     
aa3f 00        nop     
aa40 00        nop     
aa41 00        nop     
aa42 00        nop     
aa43 00        nop     
aa44 00        nop     
aa45 00        nop     
aa46 00        nop     
aa47 00        nop     
aa48 00        nop     
aa49 00        nop     
aa4a 00        nop     
aa4b 00        nop     
aa4c 00        nop     
aa4d 00        nop     
aa4e 00        nop     
aa4f 00        nop     
aa50 00        nop     
aa51 00        nop     
aa52 00        nop     
aa53 00        nop     
aa54 00        nop     
aa55 00        nop     
aa56 00        nop     
aa57 00        nop     
aa58 00        nop     
aa59 00        nop     
aa5a 00        nop     
aa5b 00        nop     
aa5c 00        nop     
aa5d 00        nop     
aa5e 00        nop     
aa5f 00        nop     
aa60 00        nop     
aa61 00        nop     
aa62 00        nop     
aa63 00        nop     
aa64 00        nop     
aa65 00        nop     
aa66 00        nop     
aa67 00        nop     
aa68 00        nop     
aa69 00        nop     
aa6a 00        nop     
aa6b 00        nop     
aa6c 00        nop     
aa6d 00        nop     
aa6e 00        nop     
aa6f 00        nop     
aa70 00        nop     
aa71 00        nop     
aa72 00        nop     
aa73 00        nop     
aa74 00        nop     
aa75 00        nop     
aa76 00        nop     
aa77 00        nop     
aa78 00        nop     
aa79 00        nop     
aa7a 00        nop     
aa7b 00        nop     
aa7c 00        nop     
aa7d 00        nop     
aa7e 00        nop     
aa7f 00        nop     
aa80 00        nop     
aa81 00        nop     
aa82 00        nop     
aa83 00        nop     
aa84 00        nop     
aa85 00        nop     
aa86 00        nop     
aa87 00        nop     
aa88 00        nop     
aa89 00        nop     
aa8a 00        nop     
aa8b 00        nop     
aa8c 00        nop     
aa8d 00        nop     
aa8e 00        nop     
aa8f 00        nop     
aa90 00        nop     
aa91 00        nop     
aa92 00        nop     
aa93 00        nop     
aa94 00        nop     
aa95 00        nop     
aa96 00        nop     
aa97 00        nop     
aa98 00        nop     
aa99 00        nop     
aa9a 00        nop     
aa9b 00        nop     
aa9c 00        nop     
aa9d 00        nop     
aa9e 00        nop     
aa9f 00        nop     
aaa0 00        nop     
aaa1 00        nop     
aaa2 00        nop     
aaa3 00        nop     
aaa4 00        nop     
aaa5 00        nop     
aaa6 00        nop     
aaa7 00        nop     
aaa8 00        nop     
aaa9 00        nop     
aaaa 00        nop     
aaab 00        nop     
aaac 00        nop     
aaad 00        nop     
aaae 00        nop     
aaaf 00        nop     
aab0 00        nop     
aab1 00        nop     
aab2 00        nop     
aab3 00        nop     
aab4 00        nop     
aab5 00        nop     
aab6 00        nop     
aab7 00        nop     
aab8 00        nop     
aab9 00        nop     
aaba 00        nop     
aabb 00        nop     
aabc 00        nop     
aabd 00        nop     
aabe 00        nop     
aabf 00        nop     
aac0 00        nop     
aac1 00        nop     
aac2 00        nop     
aac3 00        nop     
aac4 00        nop     
aac5 00        nop     
aac6 00        nop     
aac7 00        nop     
aac8 00        nop     
aac9 00        nop     
aaca 00        nop     
aacb 00        nop     
aacc 00        nop     
aacd 00        nop     
aace 00        nop     
aacf 00        nop     
aad0 00        nop     
aad1 00        nop     
aad2 00        nop     
aad3 00        nop     
aad4 00        nop     
aad5 cda98b    call    $8ba9
aad8 210703    ld      hl,$0307
aadb e5        push    hl
aadc 21dcad    ld      hl,$addc
aadf e5        push    hl
aae0 cd6eb9    call    $b96e
aae3 d1        pop     de
aae4 d1        pop     de
aae5 211803    ld      hl,$0318
aae8 e5        push    hl
aae9 21dfad    ld      hl,$addf
aaec e5        push    hl
aaed cd6eb9    call    $b96e
aaf0 d1        pop     de
aaf1 d1        pop     de
aaf2 216002    ld      hl,$0260
aaf5 e5        push    hl
aaf6 21e2ad    ld      hl,$ade2
aaf9 e5        push    hl
aafa cd6eb9    call    $b96e
aafd d1        pop     de
aafe d1        pop     de
aaff 21e601    ld      hl,$01e6
ab02 e5        push    hl
ab03 21e5ad    ld      hl,$ade5
ab06 e5        push    hl
ab07 cd6eb9    call    $b96e
ab0a d1        pop     de
ab0b d1        pop     de
ab0c 213702    ld      hl,$0237
ab0f e5        push    hl
ab10 21ebad    ld      hl,$adeb
ab13 e5        push    hl
ab14 cd6eb9    call    $b96e
ab17 d1        pop     de
ab18 d1        pop     de
ab19 216f02    ld      hl,$026f
ab1c e5        push    hl
ab1d 21f2ad    ld      hl,$adf2
ab20 e5        push    hl
ab21 cd6eb9    call    $b96e
ab24 d1        pop     de
ab25 d1        pop     de
ab26 216602    ld      hl,$0266
ab29 e5        push    hl
ab2a 21f6ad    ld      hl,$adf6
ab2d e5        push    hl
ab2e cd6eb9    call    $b96e
ab31 d1        pop     de
ab32 d1        pop     de
ab33 219002    ld      hl,$0290
ab36 e5        push    hl
ab37 21fbad    ld      hl,$adfb
ab3a e5        push    hl
ab3b cd6eb9    call    $b96e
ab3e d1        pop     de
ab3f d1        pop     de
ab40 217502    ld      hl,$0275
ab43 e5        push    hl
ab44 21ffad    ld      hl,$adff
ab47 e5        push    hl
ab48 cd6eb9    call    $b96e
ab4b d1        pop     de
ab4c d1        pop     de
ab4d 219902    ld      hl,$0299
ab50 e5        push    hl
ab51 2103ae    ld      hl,$ae03
ab54 e5        push    hl
ab55 cd6eb9    call    $b96e
ab58 d1        pop     de
ab59 d1        pop     de
ab5a 218103    ld      hl,$0381
ab5d e5        push    hl
ab5e 2106ae    ld      hl,$ae06
ab61 e5        push    hl
ab62 cd6eb9    call    $b96e
ab65 d1        pop     de
ab66 d1        pop     de
ab67 21a103    ld      hl,$03a1
ab6a e5        push    hl
ab6b 210dae    ld      hl,$ae0d
ab6e e5        push    hl
ab6f cd6eb9    call    $b96e
ab72 d1        pop     de
ab73 d1        pop     de
ab74 21cf03    ld      hl,$03cf
ab77 e5        push    hl
ab78 2111ae    ld      hl,$ae11
ab7b e5        push    hl
ab7c cd6eb9    call    $b96e
ab7f d1        pop     de
ab80 d1        pop     de
ab81 210b05    ld      hl,$050b
ab84 e5        push    hl
ab85 2115ae    ld      hl,$ae15
ab88 e5        push    hl
ab89 cd6eb9    call    $b96e
ab8c d1        pop     de
ab8d d1        pop     de
ab8e 21a304    ld      hl,$04a3
ab91 e5        push    hl
ab92 211eae    ld      hl,$ae1e
ab95 e5        push    hl
ab96 cd6eb9    call    $b96e
ab99 d1        pop     de
ab9a d1        pop     de
ab9b 213c05    ld      hl,$053c
ab9e e5        push    hl
ab9f 2125ae    ld      hl,$ae25
aba2 e5        push    hl
aba3 cd6eb9    call    $b96e
aba6 d1        pop     de
aba7 d1        pop     de
aba8 218505    ld      hl,$0585
abab e5        push    hl
abac 212fae    ld      hl,$ae2f
abaf e5        push    hl
abb0 cd6eb9    call    $b96e
abb3 d1        pop     de
abb4 d1        pop     de
abb5 21cd07    ld      hl,$07cd
abb8 e5        push    hl
abb9 2138ae    ld      hl,$ae38
abbc e5        push    hl
abbd cd6eb9    call    $b96e
abc0 d1        pop     de
abc1 d1        pop     de
abc2 218c05    ld      hl,$058c
abc5 e5        push    hl
abc6 2140ae    ld      hl,$ae40
abc9 e5        push    hl
abca cd6eb9    call    $b96e
abcd d1        pop     de
abce d1        pop     de
abcf 21b803    ld      hl,$03b8
abd2 e5        push    hl
abd3 2146ae    ld      hl,$ae46
abd6 e5        push    hl
abd7 cd6eb9    call    $b96e
abda d1        pop     de
abdb d1        pop     de
abdc 21e305    ld      hl,$05e3
abdf e5        push    hl
abe0 214aae    ld      hl,$ae4a
abe3 e5        push    hl
abe4 cd6eb9    call    $b96e
abe7 d1        pop     de
abe8 d1        pop     de
abe9 21ec05    ld      hl,$05ec
abec e5        push    hl
abed 214cae    ld      hl,$ae4c
abf0 e5        push    hl
abf1 cd6eb9    call    $b96e
abf4 d1        pop     de
abf5 d1        pop     de
abf6 212104    ld      hl,$0421
abf9 e5        push    hl
abfa 214eae    ld      hl,$ae4e
abfd e5        push    hl
abfe cd6eb9    call    $b96e
ac01 d1        pop     de
ac02 d1        pop     de
ac03 21f906    ld      hl,$06f9
ac06 e5        push    hl
ac07 2150ae    ld      hl,$ae50
ac0a e5        push    hl
ac0b cd6eb9    call    $b96e
ac0e d1        pop     de
ac0f d1        pop     de
ac10 210207    ld      hl,$0702
ac13 e5        push    hl
ac14 2152ae    ld      hl,$ae52
ac17 e5        push    hl
ac18 cd6eb9    call    $b96e
ac1b d1        pop     de
ac1c d1        pop     de
ac1d 21af0a    ld      hl,$0aaf
ac20 e5        push    hl
ac21 2154ae    ld      hl,$ae54
ac24 e5        push    hl
ac25 cd6eb9    call    $b96e
ac28 d1        pop     de
ac29 d1        pop     de
ac2a 210807    ld      hl,$0708
ac2d e5        push    hl
ac2e 2156ae    ld      hl,$ae56
ac31 e5        push    hl
ac32 cd6eb9    call    $b96e
ac35 d1        pop     de
ac36 d1        pop     de
ac37 21261b    ld      hl,$1b26
ac3a e5        push    hl
ac3b 2158ae    ld      hl,$ae58
ac3e e5        push    hl
ac3f cd6eb9    call    $b96e
ac42 d1        pop     de
ac43 d1        pop     de
ac44 213c1b    ld      hl,$1b3c
ac47 e5        push    hl
ac48 215bae    ld      hl,$ae5b
ac4b e5        push    hl
ac4c cd6eb9    call    $b96e
ac4f d1        pop     de
ac50 d1        pop     de
ac51 21421b    ld      hl,$1b42
ac54 e5        push    hl
ac55 2161ae    ld      hl,$ae61
ac58 e5        push    hl
ac59 cd6eb9    call    $b96e
ac5c d1        pop     de
ac5d d1        pop     de
ac5e 214e1b    ld      hl,$1b4e
ac61 e5        push    hl
ac62 2164ae    ld      hl,$ae64
ac65 e5        push    hl
ac66 cd6eb9    call    $b96e
ac69 d1        pop     de
ac6a d1        pop     de
ac6b 216470    ld      hl,$7064
ac6e e5        push    hl
ac6f 2168ae    ld      hl,$ae68
ac72 e5        push    hl
ac73 cd6eb9    call    $b96e
ac76 d1        pop     de
ac77 d1        pop     de
ac78 216c1b    ld      hl,$1b6c
ac7b e5        push    hl
ac7c 216eae    ld      hl,$ae6e
ac7f e5        push    hl
ac80 cd6eb9    call    $b96e
ac83 d1        pop     de
ac84 d1        pop     de
ac85 213d1c    ld      hl,$1c3d
ac88 e5        push    hl
ac89 2171ae    ld      hl,$ae71
ac8c e5        push    hl
ac8d cd6eb9    call    $b96e
ac90 d1        pop     de
ac91 d1        pop     de
ac92 21431c    ld      hl,$1c43
ac95 e5        push    hl
ac96 2174ae    ld      hl,$ae74
ac99 e5        push    hl
ac9a cd6eb9    call    $b96e
ac9d d1        pop     de
ac9e d1        pop     de
ac9f 21491c    ld      hl,$1c49
aca2 e5        push    hl
aca3 2179ae    ld      hl,$ae79
aca6 e5        push    hl
aca7 cd6eb9    call    $b96e
acaa d1        pop     de
acab d1        pop     de
acac 219a6d    ld      hl,$6d9a
acaf e5        push    hl
acb0 217cae    ld      hl,$ae7c
acb3 e5        push    hl
acb4 cd6eb9    call    $b96e
acb7 d1        pop     de
acb8 d1        pop     de
acb9 21b16d    ld      hl,$6db1
acbc e5        push    hl
acbd 217fae    ld      hl,$ae7f
acc0 e5        push    hl
acc1 cd6eb9    call    $b96e
acc4 d1        pop     de
acc5 d1        pop     de
acc6 21c06d    ld      hl,$6dc0
acc9 e5        push    hl
acca 2182ae    ld      hl,$ae82
accd e5        push    hl
acce cd6eb9    call    $b96e
acd1 d1        pop     de
acd2 d1        pop     de
acd3 21a96d    ld      hl,$6da9
acd6 e5        push    hl
acd7 2185ae    ld      hl,$ae85
acda e5        push    hl
acdb cd6eb9    call    $b96e
acde d1        pop     de
acdf d1        pop     de
ace0 215a1c    ld      hl,$1c5a
ace3 e5        push    hl
ace4 2188ae    ld      hl,$ae88
ace7 e5        push    hl
ace8 cd6eb9    call    $b96e
aceb d1        pop     de
acec d1        pop     de
aced 21681c    ld      hl,$1c68
acf0 e5        push    hl
acf1 218bae    ld      hl,$ae8b
acf4 e5        push    hl
acf5 cd6eb9    call    $b96e
acf8 d1        pop     de
acf9 d1        pop     de
acfa 217a1c    ld      hl,$1c7a
acfd e5        push    hl
acfe 2191ae    ld      hl,$ae91
ad01 e5        push    hl
ad02 cd6eb9    call    $b96e
ad05 d1        pop     de
ad06 d1        pop     de
ad07 21881c    ld      hl,$1c88
ad0a e5        push    hl
ad0b 2196ae    ld      hl,$ae96
ad0e e5        push    hl
ad0f cd6eb9    call    $b96e
ad12 d1        pop     de
ad13 d1        pop     de
ad14 21961c    ld      hl,$1c96
ad17 e5        push    hl
ad18 219cae    ld      hl,$ae9c
ad1b e5        push    hl
ad1c cd6eb9    call    $b96e
ad1f d1        pop     de
ad20 d1        pop     de
ad21 211e1d    ld      hl,$1d1e
ad24 e5        push    hl
ad25 21a3ae    ld      hl,$aea3
ad28 e5        push    hl
ad29 cd6eb9    call    $b96e
ad2c d1        pop     de
ad2d d1        pop     de
ad2e 21c41f    ld      hl,$1fc4
ad31 e5        push    hl
ad32 21aaae    ld      hl,$aeaa
ad35 e5        push    hl
ad36 cd6eb9    call    $b96e
ad39 d1        pop     de
ad3a d1        pop     de
ad3b 213c1d    ld      hl,$1d3c
ad3e e5        push    hl
ad3f 21b5ae    ld      hl,$aeb5
ad42 e5        push    hl
ad43 cd6eb9    call    $b96e
ad46 d1        pop     de
ad47 d1        pop     de
ad48 21571d    ld      hl,$1d57
ad4b e5        push    hl
ad4c 21baae    ld      hl,$aeba
ad4f e5        push    hl
ad50 cd6eb9    call    $b96e
ad53 d1        pop     de
ad54 d1        pop     de
ad55 21721d    ld      hl,$1d72
ad58 e5        push    hl
ad59 21bfae    ld      hl,$aebf
ad5c e5        push    hl
ad5d cd6eb9    call    $b96e
ad60 d1        pop     de
ad61 d1        pop     de
ad62 21781d    ld      hl,$1d78
ad65 e5        push    hl
ad66 21c2ae    ld      hl,$aec2
ad69 e5        push    hl
ad6a cd6eb9    call    $b96e
ad6d d1        pop     de
ad6e d1        pop     de
ad6f 214770    ld      hl,$7047
ad72 e5        push    hl
ad73 21caae    ld      hl,$aeca
ad76 e5        push    hl
ad77 cd6eb9    call    $b96e
ad7a d1        pop     de
ad7b d1        pop     de
ad7c 215b1f    ld      hl,$1f5b
ad7f e5        push    hl
ad80 21d1ae    ld      hl,$aed1
ad83 e5        push    hl
ad84 cd6eb9    call    $b96e
ad87 d1        pop     de
ad88 d1        pop     de
ad89 216678    ld      hl,$7866
ad8c e5        push    hl
ad8d 21d6ae    ld      hl,$aed6
ad90 e5        push    hl
ad91 cd6eb9    call    $b96e
ad94 d1        pop     de
ad95 d1        pop     de
ad96 216378    ld      hl,$7863
ad99 e5        push    hl
ad9a 21ddae    ld      hl,$aedd
ad9d e5        push    hl
ad9e cd6eb9    call    $b96e
ada1 d1        pop     de
ada2 d1        pop     de
ada3 211e1e    ld      hl,$1e1e
ada6 e5        push    hl
ada7 21e5ae    ld      hl,$aee5
adaa e5        push    hl
adab cd6eb9    call    $b96e
adae d1        pop     de
adaf d1        pop     de
adb0 216078    ld      hl,$7860
adb3 e5        push    hl
adb4 21eaae    ld      hl,$aeea
adb7 e5        push    hl
adb8 cd6eb9    call    $b96e
adbb d1        pop     de
adbc d1        pop     de
adbd 21271e    ld      hl,$1e27
adc0 e5        push    hl
adc1 21efae    ld      hl,$aeef
adc4 e5        push    hl
adc5 cd6eb9    call    $b96e
adc8 d1        pop     de
adc9 d1        pop     de
adca 21341e    ld      hl,$1e34
adcd e5        push    hl
adce 21f3ae    ld      hl,$aef3
add1 e5        push    hl
add2 cd6eb9    call    $b96e
add5 d1        pop     de
add6 d1        pop     de
add7 21491e    ld      hl,$1e49
adda e5        push    hl
addb 21f8ae    ld      hl,$aef8
adde e5        push    hl
addf cd6eb9    call    $b96e
ade2 d1        pop     de
ade3 d1        pop     de
ade4 21551e    ld      hl,$1e55
ade7 e5        push    hl
ade8 2101af    ld      hl,$af01
adeb e5        push    hl
adec cd6eb9    call    $b96e
adef d1        pop     de
adf0 d1        pop     de
adf1 215d78    ld      hl,$785d
adf4 e5        push    hl
adf5 210aaf    ld      hl,$af0a
adf8 e5        push    hl
adf9 cd6eb9    call    $b96e
adfc d1        pop     de
adfd d1        pop     de
adfe 21111f    ld      hl,$1f11
ae01 e5        push    hl
ae02 2110af    ld      hl,$af10
ae05 e5        push    hl
ae06 cd6eb9    call    $b96e
ae09 d1        pop     de
ae0a d1        pop     de
ae0b 21011f    ld      hl,$1f01
ae0e e5        push    hl
ae0f 2113af    ld      hl,$af13
ae12 e5        push    hl
ae13 cd6eb9    call    $b96e
ae16 d1        pop     de
ae17 d1        pop     de
ae18 21671e    ld      hl,$1e67
ae1b e5        push    hl
ae1c 2116af    ld      hl,$af16
ae1f e5        push    hl
ae20 cd6eb9    call    $b96e
ae23 d1        pop     de
ae24 d1        pop     de
ae25 21e21e    ld      hl,$1ee2
ae28 e5        push    hl
ae29 211faf    ld      hl,$af1f
ae2c e5        push    hl
ae2d cd6eb9    call    $b96e
ae30 d1        pop     de
ae31 d1        pop     de
ae32 21611f    ld      hl,$1f61
ae35 e5        push    hl
ae36 2122af    ld      hl,$af22
ae39 e5        push    hl
ae3a cd6eb9    call    $b96e
ae3d d1        pop     de
ae3e d1        pop     de
ae3f 21671f    ld      hl,$1f67
ae42 e5        push    hl
ae43 2125af    ld      hl,$af25
ae46 e5        push    hl
ae47 cd6eb9    call    $b96e
ae4a d1        pop     de
ae4b d1        pop     de
ae4c 21811f    ld      hl,$1f81
ae4f e5        push    hl
ae50 212caf    ld      hl,$af2c
ae53 e5        push    hl
ae54 cd6eb9    call    $b96e
ae57 d1        pop     de
ae58 d1        pop     de
ae59 21bc77    ld      hl,$77bc
ae5c e5        push    hl
ae5d 2136af    ld      hl,$af36
ae60 e5        push    hl
ae61 cd6eb9    call    $b96e
ae64 d1        pop     de
ae65 d1        pop     de
ae66 21b977    ld      hl,$77b9
ae69 e5        push    hl
ae6a 213daf    ld      hl,$af3d
ae6d e5        push    hl
ae6e cd6eb9    call    $b96e
ae71 d1        pop     de
ae72 d1        pop     de
ae73 217f1b    ld      hl,$1b7f
ae76 e5        push    hl
ae77 2141af    ld      hl,$af41
ae7a e5        push    hl
ae7b cd6eb9    call    $b96e
ae7e d1        pop     de
ae7f d1        pop     de
ae80 21d21b    ld      hl,$1bd2
ae83 e5        push    hl
ae84 2144af    ld      hl,$af44
ae87 e5        push    hl
ae88 cd6eb9    call    $b96e
ae8b d1        pop     de
ae8c d1        pop     de
ae8d 216679    ld      hl,$7966
ae90 e5        push    hl
ae91 2147af    ld      hl,$af47
ae94 e5        push    hl
ae95 cd6eb9    call    $b96e
ae98 d1        pop     de
ae99 d1        pop     de
ae9a 214179    ld      hl,$7941
ae9d e5        push    hl
ae9e 214caf    ld      hl,$af4c
aea1 e5        push    hl
aea2 cd6eb9    call    $b96e
aea5 d1        pop     de
aea6 d1        pop     de
aea7 218f7a    ld      hl,$7a8f
aeaa e5        push    hl
aeab 2151af    ld      hl,$af51
aeae e5        push    hl
aeaf cd6eb9    call    $b96e
aeb2 d1        pop     de
aeb3 d1        pop     de
aeb4 21867a    ld      hl,$7a86
aeb7 e5        push    hl
aeb8 2158af    ld      hl,$af58
aebb e5        push    hl
aebc cd6eb9    call    $b96e
aebf d1        pop     de
aec0 d1        pop     de
aec1 21987a    ld      hl,$7a98
aec4 e5        push    hl
aec5 2161af    ld      hl,$af61
aec8 e5        push    hl
aec9 cd6eb9    call    $b96e
aecc d1        pop     de
aecd d1        pop     de
aece 21f27a    ld      hl,$7af2
aed1 e5        push    hl
aed2 2169af    ld      hl,$af69
aed5 e5        push    hl
aed6 cd6eb9    call    $b96e
aed9 d1        pop     de
aeda d1        pop     de
aedb c9        ret     

aedc 63        ld      h,e
aedd 6f        ld      l,a
aede 00        nop     
aedf 69        ld      l,c
aee0 66        ld      h,(hl)
aee1 00        nop     
aee2 6f        ld      l,a
aee3 70        ld      (hl),b
aee4 00        nop     
aee5 70        ld      (hl),b
aee6 61        ld      h,c
aee7 75        ld      (hl),l
aee8 73        ld      (hl),e
aee9 65        ld      h,l
aeea 00        nop     
aeeb 72        ld      (hl),d
aeec 65        ld      h,l
aeed 70        ld      (hl),b
aeee 65        ld      h,l
aeef 61        ld      h,c
aef0 74        ld      (hl),h
aef1 00        nop     
aef2 72        ld      (hl),d
aef3 75        ld      (hl),l
aef4 6e        ld      l,(hl)
aef5 00        nop     
aef6 73        ld      (hl),e
aef7 74        ld      (hl),h
aef8 6f        ld      l,a
aef9 70        ld      (hl),b
aefa 00        nop     
aefb 61        ld      h,c
aefc 6e        ld      l,(hl)
aefd 64        ld      h,h
aefe 00        nop     
aeff 6e        ld      l,(hl)
af00 6f        ld      l,a
af01 74        ld      (hl),h
af02 00        nop     
af03 6f        ld      l,a
af04 72        ld      (hl),d
af05 00        nop     
af06 61        ld      h,c
af07 72        ld      (hl),d
af08 63        ld      h,e
af09 74        ld      (hl),h
af0a 61        ld      h,c
af0b 6e        ld      l,(hl)
af0c 00        nop     
af0d 63        ld      h,e
af0e 6f        ld      l,a
af0f 73        ld      (hl),e
af10 00        nop     
af11 69        ld      l,c
af12 6e        ld      l,(hl)
af13 74        ld      (hl),h
af14 00        nop     
af15 71        ld      (hl),c
af16 75        ld      (hl),l
af17 6f        ld      l,a
af18 74        ld      (hl),h
af19 69        ld      l,c
af1a 65        ld      h,l
af1b 6e        ld      l,(hl)
af1c 74        ld      (hl),h
af1d 00        nop     
af1e 72        ld      (hl),d
af1f 61        ld      h,c
af20 6e        ld      l,(hl)
af21 64        ld      h,h
af22 6f        ld      l,a
af23 6d        ld      l,l
af24 00        nop     
af25 72        ld      (hl),d
af26 65        ld      h,l
af27 6d        ld      l,l
af28 61        ld      h,c
af29 69        ld      l,c
af2a 6e        ld      l,(hl)
af2b 64        ld      h,h
af2c 65        ld      h,l
af2d 72        ld      (hl),d
af2e 00        nop     
af2f 72        ld      (hl),d
af30 65        ld      h,l
af31 72        ld      (hl),d
af32 61        ld      h,c
af33 6e        ld      l,(hl)
af34 64        ld      h,h
af35 6f        ld      l,a
af36 6d        ld      l,l
af37 00        nop     
af38 73        ld      (hl),e
af39 68        ld      l,b
af3a 75        ld      (hl),l
af3b 66        ld      h,(hl)
af3c 66        ld      h,(hl)
af3d 6c        ld      l,h
af3e 65        ld      h,l
af3f 00        nop     
af40 72        ld      (hl),d
af41 6f        ld      l,a
af42 75        ld      (hl),l
af43 6e        ld      l,(hl)
af44 64        ld      h,h
af45 00        nop     
af46 73        ld      (hl),e
af47 69        ld      l,c
af48 6e        ld      l,(hl)
af49 00        nop     
af4a 2b        dec     hl
af4b 00        nop     
af4c 2d        dec     l
af4d 00        nop     
af4e 2a002f    ld      hl,($2f00)
af51 00        nop     
af52 3c        inc     a
af53 00        nop     
af54 3d        dec     a
af55 00        nop     
af56 3e00      ld      a,$00
af58 62        ld      h,d
af59 6b        ld      l,e
af5a 00        nop     
af5b 63        ld      h,e
af5c 6c        ld      l,h
af5d 65        ld      h,l
af5e 61        ld      h,c
af5f 6e        ld      l,(hl)
af60 00        nop     
af61 63        ld      h,e
af62 73        ld      (hl),e
af63 00        nop     
af64 64        ld      h,h
af65 6f        ld      l,a
af66 74        ld      (hl),h
af67 00        nop     
af68 66        ld      h,(hl)
af69 65        ld      h,l
af6a 6e        ld      l,(hl)
af6b 63        ld      h,e
af6c 65        ld      h,l
af6d 00        nop     
af6e 66        ld      h,(hl)
af6f 64        ld      h,h
af70 00        nop     
af71 68        ld      l,b
af72 74        ld      (hl),h
af73 00        nop     
af74 68        ld      l,b
af75 6f        ld      l,a
af76 6d        ld      l,l
af77 65        ld      h,l
af78 00        nop     
af79 6c        ld      l,h
af7a 74        ld      (hl),h
af7b 00        nop     
af7c 70        ld      (hl),b
af7d 64        ld      h,h
af7e 00        nop     
af7f 70        ld      (hl),b
af80 65        ld      h,l
af81 00        nop     
af82 70        ld      (hl),b
af83 78        ld      a,b
af84 00        nop     
af85 70        ld      (hl),b
af86 75        ld      (hl),l
af87 00        nop     
af88 72        ld      (hl),d
af89 74        ld      (hl),h
af8a 00        nop     
af8b 73        ld      (hl),e
af8c 65        ld      h,l
af8d 74        ld      (hl),h
af8e 62        ld      h,d
af8f 67        ld      h,a
af90 00        nop     
af91 73        ld      (hl),e
af92 65        ld      h,l
af93 74        ld      (hl),h
af94 68        ld      l,b
af95 00        nop     
af96 73        ld      (hl),e
af97 65        ld      h,l
af98 74        ld      (hl),h
af99 70        ld      (hl),b
af9a 63        ld      h,e
af9b 00        nop     
af9c 73        ld      (hl),e
af9d 65        ld      h,l
af9e 74        ld      (hl),h
af9f 70        ld      (hl),b
afa0 65        ld      h,l
afa1 6e        ld      l,(hl)
afa2 00        nop     
afa3 73        ld      (hl),e
afa4 65        ld      h,l
afa5 74        ld      (hl),h
afa6 70        ld      (hl),b
afa7 6f        ld      l,a
afa8 73        ld      (hl),e
afa9 00        nop     
afaa 73        ld      (hl),e
afab 65        ld      h,l
afac 74        ld      (hl),h
afad 73        ld      (hl),e
afae 63        ld      h,e
afaf 72        ld      (hl),d
afb0 75        ld      (hl),l
afb1 6e        ld      l,(hl)
afb2 63        ld      h,e
afb3 68        ld      l,b
afb4 00        nop     
afb5 73        ld      (hl),e
afb6 65        ld      h,l
afb7 74        ld      (hl),h
afb8 78        ld      a,b
afb9 00        nop     
afba 73        ld      (hl),e
afbb 65        ld      h,l
afbc 74        ld      (hl),h
afbd 79        ld      a,c
afbe 00        nop     
afbf 73        ld      (hl),e
afc0 74        ld      (hl),h
afc1 00        nop     
afc2 74        ld      (hl),h
afc3 6f        ld      l,a
afc4 77        ld      (hl),a
afc5 61        ld      h,c
afc6 72        ld      (hl),d
afc7 64        ld      h,h
afc8 73        ld      (hl),e
afc9 00        nop     
afca 77        ld      (hl),a
afcb 69        ld      l,c
afcc 6e        ld      l,(hl)
afcd 64        ld      h,h
afce 6f        ld      l,a
afcf 77        ld      (hl),a
afd0 00        nop     
afd1 77        ld      (hl),a
afd2 72        ld      (hl),d
afd3 61        ld      h,c
afd4 70        ld      (hl),b
afd5 00        nop     
afd6 70        ld      (hl),b
afd7 61        ld      h,c
afd8 64        ld      h,h
afd9 64        ld      h,h
afda 6c        ld      l,h
afdb 65        ld      h,l
afdc 00        nop     
afdd 62        ld      h,d
afde 75        ld      (hl),l
afdf 74        ld      (hl),h
afe0 74        ld      (hl),h
afe1 6f        ld      l,a
afe2 6e        ld      l,(hl)
afe3 70        ld      (hl),b
afe4 00        nop     
afe5 6b        ld      l,e
afe6 65        ld      h,l
afe7 79        ld      a,c
afe8 70        ld      (hl),b
afe9 00        nop     
afea 77        ld      (hl),a
afeb 61        ld      h,c
afec 69        ld      l,c
afed 74        ld      (hl),h
afee 00        nop     
afef 2e69      ld      l,$69
aff1 6e        ld      l,(hl)
aff2 00        nop     
aff3 2e6f      ld      l,$6f
aff5 75        ld      (hl),l
aff6 74        ld      (hl),h
aff7 00        nop     
aff8 2e65      ld      l,$65
affa 78        ld      a,b
affb 61        ld      h,c
affc 6d        ld      l,l
affd 69        ld      l,c
affe 6e        ld      l,(hl)
afff 65        ld      h,l
b000 00        nop     
b001 2e64      ld      l,$64
b003 65        ld      h,l
b004 70        ld      (hl),b
b005 6f        ld      l,a
b006 73        ld      (hl),e
b007 69        ld      l,c
b008 74        ld      (hl),h
b009 00        nop     
b00a 74        ld      (hl),h
b00b 6f        ld      l,a
b00c 6e        ld      l,(hl)
b00d 65        ld      h,l
b00e 73        ld      (hl),e
b00f 00        nop     
b010 66        ld      h,(hl)
b011 73        ld      (hl),e
b012 00        nop     
b013 74        ld      (hl),h
b014 73        ld      (hl),e
b015 00        nop     
b016 73        ld      (hl),e
b017 65        ld      h,l
b018 74        ld      (hl),h
b019 73        ld      (hl),e
b01a 70        ld      (hl),b
b01b 6c        ld      l,h
b01c 69        ld      l,c
b01d 74        ld      (hl),h
b01e 00        nop     
b01f 73        ld      (hl),e
b020 73        ld      (hl),e
b021 00        nop     
b022 63        ld      h,e
b023 74        ld      (hl),h
b024 00        nop     
b025 63        ld      h,e
b026 75        ld      (hl),l
b027 72        ld      (hl),d
b028 73        ld      (hl),e
b029 6f        ld      l,a
b02a 72        ld      (hl),d
b02b 00        nop     
b02c 73        ld      (hl),e
b02d 65        ld      h,l
b02e 74        ld      (hl),h
b02f 63        ld      h,e
b030 75        ld      (hl),l
b031 72        ld      (hl),d
b032 73        ld      (hl),e
b033 6f        ld      l,a
b034 72        ld      (hl),d
b035 00        nop     
b036 73        ld      (hl),e
b037 65        ld      h,l
b038 74        ld      (hl),h
b039 70        ld      (hl),b
b03a 61        ld      h,c
b03b 6c        ld      l,h
b03c 00        nop     
b03d 70        ld      (hl),b
b03e 61        ld      h,c
b03f 6c        ld      l,h
b040 00        nop     
b041 74        ld      (hl),h
b042 66        ld      h,(hl)
b043 00        nop     
b044 73        ld      (hl),e
b045 66        ld      h,(hl)
b046 00        nop     
b047 64        ld      h,h
b048 6f        ld      l,a
b049 74        ld      (hl),h
b04a 63        ld      h,e
b04b 00        nop     
b04c 66        ld      h,(hl)
b04d 69        ld      l,c
b04e 6c        ld      l,h
b04f 6c        ld      l,h
b050 00        nop     
b051 64        ld      h,h
b052 69        ld      l,c
b053 72        ld      (hl),d
b054 70        ld      (hl),b
b055 69        ld      l,c
b056 63        ld      h,e
b057 00        nop     
b058 65        ld      h,l
b059 72        ld      (hl),d
b05a 61        ld      h,c
b05b 73        ld      (hl),e
b05c 65        ld      h,l
b05d 70        ld      (hl),b
b05e 69        ld      l,c
b05f 63        ld      h,e
b060 00        nop     
b061 6c        ld      l,h
b062 6f        ld      l,a
b063 61        ld      h,c
b064 64        ld      h,h
b065 70        ld      (hl),b
b066 69        ld      l,c
b067 63        ld      h,e
b068 00        nop     
b069 73        ld      (hl),e
b06a 61        ld      h,c
b06b 76        halt    
b06c 65        ld      h,l
b06d 70        ld      (hl),b
b06e 69        ld      l,c
b06f 63        ld      h,e
b070 00        nop     
b071 cd0585    call    $8505
b074 feff      cp      $ff
b076 210100    ld      hl,$0001
b079 229f8c    ld      ($8c9f),hl
b07c cdb4b2    call    $b2b4
b07f cdbcb1    call    $b1bc
b082 210000    ld      hl,$0000
b085 226c8e    ld      ($8e6c),hl
b088 22a18c    ld      ($8ca1),hl
b08b 22d48c    ld      ($8cd4),hl
b08e 210000    ld      hl,$0000
b091 22aa8f    ld      ($8faa),hl
b094 22b28f    ld      ($8fb2),hl
b097 22b48f    ld      ($8fb4),hl
b09a 210000    ld      hl,$0000
b09d 7d        ld      a,l
b09e 32cd8c    ld      ($8ccd),a
b0a1 7d        ld      a,l
b0a2 32608d    ld      ($8d60),a
b0a5 210000    ld      hl,$0000
b0a8 7d        ld      a,l
b0a9 32768f    ld      ($8f76),a
b0ac 210000    ld      hl,$0000
b0af 229c8f    ld      ($8f9c),hl
b0b2 218303    ld      hl,$0383
b0b5 22a58c    ld      ($8ca5),hl
b0b8 cd443c    call    $3c44
b0bb cd3d3c    call    $3c3d
b0be cd455c    call    $5c45
b0c1 2a3b8c    ld      hl,($8c3b)
b0c4 22988f    ld      ($8f98),hl
b0c7 2a398c    ld      hl,($8c39)
b0ca 229a8f    ld      ($8f9a),hl
b0cd cd406c    call    $6c40
b0d0 cd8069    call    $6980
b0d3 cd7d3c    call    $3c7d
b0d6 cdc066    call    $66c0
b0d9 cdc066    call    $66c0
b0dc cdc066    call    $66c0
b0df 210cb1    ld      hl,$b10c
b0e2 e5        push    hl
b0e3 cd3e69    call    $693e
b0e6 d1        pop     de
b0e7 cdc066    call    $66c0
b0ea 2a638c    ld      hl,($8c63)
b0ed e5        push    hl
b0ee cd3e69    call    $693e
b0f1 2117b1    ld      hl,$b117
b0f4 e3        ex      (sp),hl
b0f5 cd3e69    call    $693e
b0f8 213cb1    ld      hl,$b13c
b0fb e3        ex      (sp),hl
b0fc cd3e69    call    $693e
b0ff d1        pop     de
b100 cdc066    call    $66c0
b103 cdc066    call    $66c0
b106 2156b1    ld      hl,$b156
b109 e5        push    hl
b10a cd3e69    call    $693e
b10d 2171b1    ld      hl,$b171
b110 e3        ex      (sp),hl
b111 cd3e69    call    $693e
b114 d1        pop     de
b115 cdc066    call    $66c0
b118 2182b1    ld      hl,$b182
b11b e5        push    hl
b11c cd3e69    call    $693e
b11f d1        pop     de
b120 cdc066    call    $66c0
b123 cdc066    call    $66c0
b126 cdc066    call    $66c0
b129 219fb1    ld      hl,$b19f
b12c e5        push    hl
b12d cd3e69    call    $693e
b130 d1        pop     de
b131 cdedb1    call    $b1ed
b134 2ab88f    ld      hl,($8fb8)
b137 22a88f    ld      ($8fa8),hl
b13a 210000    ld      hl,$0000
b13d eb        ex      de,hl
b13e 210400    ld      hl,$0004
b141 39        add     hl,sp
b142 73        ld      (hl),e
b143 23        inc     hl
b144 72        ld      (hl),d
b145 2a8000    ld      hl,($0080)
b148 2600      ld      h,$00
b14a 7c        ld      a,h
b14b b5        or      l
b14c cac7b0    jp      z,$b0c7
b14f 210000    ld      hl,$0000
b152 227a8f    ld      ($8f7a),hl
b155 218200    ld      hl,$0082
b158 e5        push    hl
b159 21e68d    ld      hl,$8de6
b15c 44        ld      b,h
b15d 4d        ld      c,l
b15e e5        push    hl
b15f cd887b    call    $7b88
b162 d1        pop     de
b163 d1        pop     de
b164 60        ld      h,b
b165 69        ld      l,c
b166 7e        ld      a,(hl)
b167 b7        or      a
b168 2825      jr      z,$b18f
b16a 60        ld      h,b
b16b 69        ld      l,c
b16c 5e        ld      e,(hl)
b16d 1600      ld      d,$00
b16f 212e00    ld      hl,$002e
b172 cd4885    call    $8548
b175 2818      jr      z,$b18f
b177 2a7a8f    ld      hl,($8f7a)
b17a 110a00    ld      de,$000a
b17d eb        ex      de,hl
b17e cd6686    call    $8666
b181 280c      jr      z,$b18f
b183 03        inc     bc
b184 60        ld      h,b
b185 69        ld      l,c
b186 2a7a8f    ld      hl,($8f7a)
b189 23        inc     hl
b18a 227a8f    ld      ($8f7a),hl
b18d 18d5      jr      $b164
b18f 60        ld      h,b
b190 69        ld      l,c
b191 5e        ld      e,(hl)
b192 1600      ld      d,$00
b194 212e00    ld      hl,$002e
b197 cd3c85    call    $853c
b19a 281a      jr      z,$b1b6
b19c 21abb1    ld      hl,$b1ab
b19f e5        push    hl
b1a0 c5        push    bc
b1a1 cd4f7b    call    $7b4f
b1a4 d1        pop     de
b1a5 d1        pop     de
b1a6 110000    ld      de,$0000
b1a9 cd3c85    call    $853c
b1ac eb        ex      de,hl
b1ad 210400    ld      hl,$0004
b1b0 39        add     hl,sp
b1b1 73        ld      (hl),e
b1b2 23        inc     hl
b1b3 72        ld      (hl),d
b1b4 1811      jr      $b1c7
b1b6 60        ld      h,b
b1b7 69        ld      l,c
b1b8 5e        ld      e,(hl)
b1b9 1600      ld      d,$00
b1bb eb        ex      de,hl
b1bc cdf685    call    $85f6
b1bf eb        ex      de,hl
b1c0 210400    ld      hl,$0004
b1c3 39        add     hl,sp
b1c4 73        ld      (hl),e
b1c5 23        inc     hl
b1c6 72        ld      (hl),d
b1c7 210400    ld      hl,$0004
b1ca 39        add     hl,sp
b1cb 7e        ld      a,(hl)
b1cc 23        inc     hl
b1cd b6        or      (hl)
b1ce 2013      jr      nz,$b1e3
b1d0 21b0b1    ld      hl,$b1b0
b1d3 e5        push    hl
b1d4 21e68d    ld      hl,$8de6
b1d7 e5        push    hl
b1d8 cd887b    call    $7b88
b1db d1        pop     de
b1dc d1        pop     de
b1dd 210700    ld      hl,$0007
b1e0 227a8f    ld      ($8f7a),hl
b1e3 21b8b1    ld      hl,$b1b8
b1e6 e5        push    hl
b1e7 210a90    ld      hl,$900a
b1ea e5        push    hl
b1eb cdad23    call    $23ad
b1ee d1        pop     de
b1ef 210a90    ld      hl,$900a
b1f2 e3        ex      (sp),hl
b1f3 cd1423    call    $2314
b1f6 d1        pop     de
b1f7 220890    ld      ($9008),hl
b1fa 7c        ld      a,h
b1fb b5        or      l
b1fc 2804      jr      z,$b202
b1fe cd5722    call    $2257
b201 c9        ret     

b202 210000    ld      hl,$0000
b205 229f8c    ld      ($8c9f),hl
b208 cd406c    call    $6c40
b20b c9        ret     

b20c 57        ld      d,a
b20d 65        ld      h,l
b20e 6c        ld      l,h
b20f 63        ld      h,e
b210 6f        ld      l,a
b211 6d        ld      l,l
b212 65        ld      h,l
b213 2074      jr      nz,$b289
b215 6f        ld      l,a
b216 00        nop     
b217 43        ld      b,e
b218 6f        ld      l,a
b219 70        ld      (hl),b
b21a 79        ld      a,c
b21b 72        ld      (hl),d
b21c 69        ld      l,c
b21d 67        ld      h,a
b21e 68        ld      l,b
b21f 74        ld      (hl),h
b220 2028      jr      nz,$b24a
b222 63        ld      h,e
b223 29        add     hl,hl
b224 2031      jr      nz,$b257
b226 39        add     hl,sp
b227 3833      jr      c,$b25c
b229 2c        inc     l
b22a 2044      jr      nz,$b270
b22c 69        ld      l,c
b22d 67        ld      h,a
b22e 69        ld      l,c
b22f 74        ld      (hl),h
b230 61        ld      h,c
b231 6c        ld      l,h
b232 2052      jr      nz,$b286
b234 65        ld      h,l
b235 73        ld      (hl),e
b236 65        ld      h,l
b237 61        ld      h,c
b238 72        ld      (hl),d
b239 63        ld      h,e
b23a 68        ld      l,b
b23b 00        nop     
b23c 50        ld      d,b
b23d 61        ld      h,c
b23e 63        ld      h,e
b23f 69        ld      l,c
b240 66        ld      h,(hl)
b241 69        ld      l,c
b242 63        ld      h,e
b243 2047      jr      nz,$b28c
b245 72        ld      (hl),d
b246 6f        ld      l,a
b247 76        halt    
b248 65        ld      h,l
b249 2c        inc     l
b24a 2043      jr      nz,$b28f
b24c 61        ld      h,c
b24d 6c        ld      l,h
b24e 69        ld      l,c
b24f 66        ld      h,(hl)
b250 6f        ld      l,a
b251 72        ld      (hl),d
b252 6e        ld      l,(hl)
b253 69        ld      l,c
b254 61        ld      h,c
b255 00        nop     
b256 44        ld      b,h
b257 72        ld      (hl),d
b258 2e20      ld      l,$20
b25a 4c        ld      c,h
b25b 6f        ld      l,a
b25c 67        ld      h,a
b25d 6f        ld      l,a
b25e 2069      jr      nz,$b2c9
b260 73        ld      (hl),e
b261 2061      jr      nz,$b2c4
b263 2074      jr      nz,$b2d9
b265 72        ld      (hl),d
b266 61        ld      h,c
b267 64        ld      h,h
b268 65        ld      h,l
b269 6d        ld      l,l
b26a 61        ld      h,c
b26b 72        ld      (hl),d
b26c 6b        ld      l,e
b26d 206f      jr      nz,$b2de
b26f 66        ld      h,(hl)
b270 00        nop     
b271 44        ld      b,h
b272 69        ld      l,c
b273 67        ld      h,a
b274 69        ld      l,c
b275 74        ld      (hl),h
b276 61        ld      h,c
b277 6c        ld      l,h
b278 2052      jr      nz,$b2cc
b27a 65        ld      h,l
b27b 73        ld      (hl),e
b27c 65        ld      h,l
b27d 61        ld      h,c
b27e 72        ld      (hl),d
b27f 63        ld      h,e
b280 68        ld      l,b
b281 00        nop     
b282 2020      jr      nz,$b2a4
b284 2020      jr      nz,$b2a6
b286 50        ld      d,b
b287 72        ld      (hl),d
b288 6f        ld      l,a
b289 64        ld      h,h
b28a 75        ld      (hl),l
b28b 63        ld      h,e
b28c 74        ld      (hl),h
b28d 204e      jr      nz,$b2dd
b28f 6f        ld      l,a
b290 2e20      ld      l,$20
b292 3630      ld      (hl),$30
b294 3032      jr      nc,$b2c8
b296 2d        dec     l
b297 313233    ld      sp,$3332
b29a 322020    ld      ($2020),a
b29d 2000      jr      nz,$b29f
b29f 50        ld      d,b
b2a0 6c        ld      l,h
b2a1 65        ld      h,l
b2a2 61        ld      h,c
b2a3 73        ld      (hl),e
b2a4 65        ld      h,l
b2a5 2057      jr      nz,$b2fe
b2a7 61        ld      h,c
b2a8 69        ld      l,c
b2a9 74        ld      (hl),h
b2aa 00        nop     
b2ab 2e4c      ld      l,$4c
b2ad 4f        ld      c,a
b2ae 47        ld      b,a
b2af 00        nop     
b2b0 53        ld      d,e
b2b1 54        ld      d,h
b2b2 41        ld      b,c
b2b3 52        ld      d,d
b2b4 54        ld      d,h
b2b5 55        ld      d,l
b2b6 50        ld      d,b
b2b7 00        nop     
b2b8 4c        ld      c,h
b2b9 4f        ld      c,a
b2ba 47        ld      b,a
b2bb 00        nop     
b2bc cd9877    call    $7798
b2bf 11faf8    ld      de,$f8fa
b2c2 19        add     hl,de
b2c3 222e90    ld      ($902e),hl
b2c6 cdb38b    call    $8bb3
b2c9 223090    ld      ($9030),hl
b2cc cdb38b    call    $8bb3
b2cf e5        push    hl
b2d0 cd9877    call    $7798
b2d3 d1        pop     de
b2d4 eb        ex      de,hl
b2d5 cd3086    call    $8630
b2d8 11faf8    ld      de,$f8fa
b2db 19        add     hl,de
b2dc 22a78c    ld      ($8ca7),hl
b2df 2aa78c    ld      hl,($8ca7)
b2e2 110400    ld      de,$0004
b2e5 eb        ex      de,hl
b2e6 cd3585    call    $8535
b2e9 22a78c    ld      ($8ca7),hl
b2ec c9        ret     

b2ed cda98b    call    $8ba9
b2f0 cd8069    call    $6980
b2f3 cdab66    call    $66ab
b2f6 210000    ld      hl,$0000
b2f9 44        ld      b,h
b2fa 4d        ld      c,l
b2fb 1803      jr      $b300
b2fd 03        inc     bc
b2fe 60        ld      h,b
b2ff 69        ld      l,c
b300 50        ld      d,b
b301 59        ld      e,c
b302 218000    ld      hl,$0080
b305 cd6c85    call    $856c
b308 280f      jr      z,$b319
b30a 210000    ld      hl,$0000
b30d e5        push    hl
b30e 21708e    ld      hl,$8e70
b311 09        add     hl,bc
b312 09        add     hl,bc
b313 d1        pop     de
b314 73        ld      (hl),e
b315 23        inc     hl
b316 72        ld      (hl),d
b317 18e4      jr      $b2fd
b319 210000    ld      hl,$0000
b31c 22958c    ld      ($8c95),hl
b31f 22b08f    ld      ($8fb0),hl
b322 210000    ld      hl,$0000
b325 229d8c    ld      ($8c9d),hl
b328 210000    ld      hl,$0000
b32b 229b8c    ld      ($8c9b),hl
b32e 2a3090    ld      hl,($9030)
b331 22978c    ld      ($8c97),hl
b334 2aa78c    ld      hl,($8ca7)
b337 22a98c    ld      ($8ca9),hl
b33a cda93c    call    $3ca9
b33d 22998c    ld      ($8c99),hl
b340 217bb2    ld      hl,$b27b
b343 e5        push    hl
b344 cdde4b    call    $4bde
b347 22ce8f    ld      ($8fce),hl
b34a e3        ex      (sp),hl
b34b cde1b9    call    $b9e1
b34e d1        pop     de
b34f 21b801    ld      hl,$01b8
b352 e5        push    hl
b353 2180b2    ld      hl,$b280
b356 e5        push    hl
b357 cd6eb9    call    $b96e
b35a d1        pop     de
b35b d1        pop     de
b35c 22da8f    ld      ($8fda),hl
b35f 219c54    ld      hl,$549c
b362 e5        push    hl
b363 2182b2    ld      hl,$b282
b366 e5        push    hl
b367 cd6eb9    call    $b96e
b36a d1        pop     de
b36b d1        pop     de
b36c 22d88f    ld      ($8fd8),hl
b36f cd84b2    call    $b284
b372 cdfcb2    call    $b2fc
b375 cdd5a9    call    $a9d5
b378 c35db8    jp      $b85d
b37b 2e50      ld      l,$50
b37d 52        ld      d,d
b37e 4d        ld      c,l
b37f 00        nop     
b380 2800      jr      z,$b382
b382 29        add     hl,hl
b383 00        nop     
b384 21b2b2    ld      hl,$b2b2
b387 22728f    ld      ($8f72),hl
b38a 210100    ld      hl,$0001
b38d 227a8f    ld      ($8f7a),hl
b390 cd062f    call    $2f06
b393 21f505    ld      hl,$05f5
b396 e5        push    hl
b397 210a00    ld      hl,$000a
b39a e5        push    hl
b39b cd7d45    call    $457d
b39e d1        pop     de
b39f e3        ex      (sp),hl
b3a0 2ace8f    ld      hl,($8fce)
b3a3 e5        push    hl
b3a4 cdaa41    call    $41aa
b3a7 22dc8f    ld      ($8fdc),hl
b3aa e5        push    hl
b3ab cd5c47    call    $475c
b3ae d1        pop     de
b3af d1        pop     de
b3b0 d1        pop     de
b3b1 c9        ret     

b3b2 2d        dec     l
b3b3 00        nop     
b3b4 cd986c    call    $6c98
b3b7 cd426d    call    $6d42
b3ba 2a418c    ld      hl,($8c41)
b3bd e5        push    hl
b3be cd646d    call    $6d64
b3c1 d1        pop     de
b3c2 2a618c    ld      hl,($8c61)
b3c5 cd2880    call    $8028
b3c8 cda77c    call    $7ca7
b3cb 2a5f8c    ld      hl,($8c5f)
b3ce cd2880    call    $8028
b3d1 cdd87c    call    $7cd8
b3d4 cd417e    call    $7e41
b3d7 cda77c    call    $7ca7
b3da cd8470    call    $7084
b3dd eb        ex      de,hl
b3de cda08b    call    $8ba0
b3e1 2a458c    ld      hl,($8c45)
b3e4 e5        push    hl
b3e5 cd816d    call    $6d81
b3e8 2a438c    ld      hl,($8c43)
b3eb e3        ex      (sp),hl
b3ec cdd86d    call    $6dd8
b3ef d1        pop     de
b3f0 cdda6e    call    $6eda
b3f3 cd3270    call    $7032
b3f6 cd9a6d    call    $6d9a
b3f9 c3011f    jp      $1f01
b3fc 215c08    ld      hl,$085c
b3ff e5        push    hl
b400 21bfb6    ld      hl,$b6bf
b403 e5        push    hl
b404 cd6eb9    call    $b96e
b407 d1        pop     de
b408 d1        pop     de
b409 216d08    ld      hl,$086d
b40c e5        push    hl
b40d 21c5b6    ld      hl,$b6c5
b410 e5        push    hl
b411 cd6eb9    call    $b96e
b414 d1        pop     de
b415 d1        pop     de
b416 216c0a    ld      hl,$0a6c
b419 e5        push    hl
b41a 21c8b6    ld      hl,$b6c8
b41d e5        push    hl
b41e cd6eb9    call    $b96e
b421 d1        pop     de
b422 d1        pop     de
b423 218a08    ld      hl,$088a
b426 e5        push    hl
b427 21cbb6    ld      hl,$b6cb
b42a e5        push    hl
b42b cd6eb9    call    $b96e
b42e d1        pop     de
b42f d1        pop     de
b430 219f08    ld      hl,$089f
b433 e5        push    hl
b434 21d0b6    ld      hl,$b6d0
b437 e5        push    hl
b438 cd6eb9    call    $b96e
b43b d1        pop     de
b43c d1        pop     de
b43d 215f0a    ld      hl,$0a5f
b440 e5        push    hl
b441 21d6b6    ld      hl,$b6d6
b444 e5        push    hl
b445 cd6eb9    call    $b96e
b448 d1        pop     de
b449 d1        pop     de
b44a 21af0a    ld      hl,$0aaf
b44d e5        push    hl
b44e 21ddb6    ld      hl,$b6dd
b451 e5        push    hl
b452 cd6eb9    call    $b96e
b455 d1        pop     de
b456 d1        pop     de
b457 21b80a    ld      hl,$0ab8
b45a e5        push    hl
b45b 21e4b6    ld      hl,$b6e4
b45e e5        push    hl
b45f cd6eb9    call    $b96e
b462 d1        pop     de
b463 d1        pop     de
b464 21d60a    ld      hl,$0ad6
b467 e5        push    hl
b468 21eab6    ld      hl,$b6ea
b46b e5        push    hl
b46c cd6eb9    call    $b96e
b46f d1        pop     de
b470 d1        pop     de
b471 210f0b    ld      hl,$0b0f
b474 e5        push    hl
b475 21efb6    ld      hl,$b6ef
b478 e5        push    hl
b479 cd6eb9    call    $b96e
b47c d1        pop     de
b47d d1        pop     de
b47e 21610b    ld      hl,$0b61
b481 e5        push    hl
b482 21f4b6    ld      hl,$b6f4
b485 e5        push    hl
b486 cd6eb9    call    $b96e
b489 d1        pop     de
b48a d1        pop     de
b48b 21950b    ld      hl,$0b95
b48e e5        push    hl
b48f 21f9b6    ld      hl,$b6f9
b492 e5        push    hl
b493 cd6eb9    call    $b96e
b496 d1        pop     de
b497 d1        pop     de
b498 21ce0b    ld      hl,$0bce
b49b e5        push    hl
b49c 21feb6    ld      hl,$b6fe
b49f e5        push    hl
b4a0 cd6eb9    call    $b96e
b4a3 d1        pop     de
b4a4 d1        pop     de
b4a5 21df0b    ld      hl,$0bdf
b4a8 e5        push    hl
b4a9 2104b7    ld      hl,$b704
b4ac e5        push    hl
b4ad cd6eb9    call    $b96e
b4b0 d1        pop     de
b4b1 d1        pop     de
b4b2 21510c    ld      hl,$0c51
b4b5 e5        push    hl
b4b6 2109b7    ld      hl,$b709
b4b9 e5        push    hl
b4ba cd6eb9    call    $b96e
b4bd d1        pop     de
b4be d1        pop     de
b4bf 213e0d    ld      hl,$0d3e
b4c2 e5        push    hl
b4c3 2111b7    ld      hl,$b711
b4c6 e5        push    hl
b4c7 cd6eb9    call    $b96e
b4ca d1        pop     de
b4cb d1        pop     de
b4cc 21630d    ld      hl,$0d63
b4cf e5        push    hl
b4d0 2119b7    ld      hl,$b719
b4d3 e5        push    hl
b4d4 cd6eb9    call    $b96e
b4d7 d1        pop     de
b4d8 d1        pop     de
b4d9 21f50d    ld      hl,$0df5
b4dc e5        push    hl
b4dd 211cb7    ld      hl,$b71c
b4e0 e5        push    hl
b4e1 cd6eb9    call    $b96e
b4e4 d1        pop     de
b4e5 d1        pop     de
b4e6 21020e    ld      hl,$0e02
b4e9 e5        push    hl
b4ea 2122b7    ld      hl,$b722
b4ed e5        push    hl
b4ee cd6eb9    call    $b96e
b4f1 d1        pop     de
b4f2 d1        pop     de
b4f3 217a0e    ld      hl,$0e7a
b4f6 e5        push    hl
b4f7 2127b7    ld      hl,$b727
b4fa e5        push    hl
b4fb cd6eb9    call    $b96e
b4fe d1        pop     de
b4ff d1        pop     de
b500 216d0f    ld      hl,$0f6d
b503 e5        push    hl
b504 212db7    ld      hl,$b72d
b507 e5        push    hl
b508 cd6eb9    call    $b96e
b50b d1        pop     de
b50c d1        pop     de
b50d 21760f    ld      hl,$0f76
b510 e5        push    hl
b511 2133b7    ld      hl,$b733
b514 e5        push    hl
b515 cd6eb9    call    $b96e
b518 d1        pop     de
b519 d1        pop     de
b51a 21810f    ld      hl,$0f81
b51d e5        push    hl
b51e 2136b7    ld      hl,$b736
b521 e5        push    hl
b522 cd6eb9    call    $b96e
b525 d1        pop     de
b526 d1        pop     de
b527 218314    ld      hl,$1483
b52a e5        push    hl
b52b 2139b7    ld      hl,$b739
b52e e5        push    hl
b52f cd6eb9    call    $b96e
b532 d1        pop     de
b533 d1        pop     de
b534 219914    ld      hl,$1499
b537 e5        push    hl
b538 213eb7    ld      hl,$b73e
b53b e5        push    hl
b53c cd6eb9    call    $b96e
b53f d1        pop     de
b540 d1        pop     de
b541 21d614    ld      hl,$14d6
b544 e5        push    hl
b545 2144b7    ld      hl,$b744
b548 e5        push    hl
b549 cd6eb9    call    $b96e
b54c d1        pop     de
b54d d1        pop     de
b54e 210315    ld      hl,$1503
b551 e5        push    hl
b552 214ab7    ld      hl,$b74a
b555 e5        push    hl
b556 cd6eb9    call    $b96e
b559 d1        pop     de
b55a d1        pop     de
b55b 218d15    ld      hl,$158d
b55e e5        push    hl
b55f 2150b7    ld      hl,$b750
b562 e5        push    hl
b563 cd6eb9    call    $b96e
b566 d1        pop     de
b567 d1        pop     de
b568 21a415    ld      hl,$15a4
b56b e5        push    hl
b56c 2156b7    ld      hl,$b756
b56f e5        push    hl
b570 cd6eb9    call    $b96e
b573 d1        pop     de
b574 d1        pop     de
b575 216616    ld      hl,$1666
b578 e5        push    hl
b579 215cb7    ld      hl,$b75c
b57c e5        push    hl
b57d cd6eb9    call    $b96e
b580 d1        pop     de
b581 d1        pop     de
b582 21d815    ld      hl,$15d8
b585 e5        push    hl
b586 2162b7    ld      hl,$b762
b589 e5        push    hl
b58a cd6eb9    call    $b96e
b58d d1        pop     de
b58e d1        pop     de
b58f 21b315    ld      hl,$15b3
b592 e5        push    hl
b593 2166b7    ld      hl,$b766
b596 e5        push    hl
b597 cd6eb9    call    $b96e
b59a d1        pop     de
b59b d1        pop     de
b59c 215016    ld      hl,$1650
b59f e5        push    hl
b5a0 216cb7    ld      hl,$b76c
b5a3 e5        push    hl
b5a4 cd6eb9    call    $b96e
b5a7 d1        pop     de
b5a8 d1        pop     de
b5a9 21db27    ld      hl,$27db
b5ac e5        push    hl
b5ad 2174b7    ld      hl,$b774
b5b0 e5        push    hl
b5b1 cd6eb9    call    $b96e
b5b4 d1        pop     de
b5b5 d1        pop     de
b5b6 21e127    ld      hl,$27e1
b5b9 e5        push    hl
b5ba 2177b7    ld      hl,$b777
b5bd e5        push    hl
b5be cd6eb9    call    $b96e
b5c1 d1        pop     de
b5c2 d1        pop     de
b5c3 215c11    ld      hl,$115c
b5c6 e5        push    hl
b5c7 217cb7    ld      hl,$b77c
b5ca e5        push    hl
b5cb cd6eb9    call    $b96e
b5ce d1        pop     de
b5cf d1        pop     de
b5d0 218811    ld      hl,$1188
b5d3 e5        push    hl
b5d4 217fb7    ld      hl,$b77f
b5d7 e5        push    hl
b5d8 cd6eb9    call    $b96e
b5db d1        pop     de
b5dc d1        pop     de
b5dd 21aa11    ld      hl,$11aa
b5e0 e5        push    hl
b5e1 2182b7    ld      hl,$b782
b5e4 e5        push    hl
b5e5 cd6eb9    call    $b96e
b5e8 d1        pop     de
b5e9 d1        pop     de
b5ea 21cb11    ld      hl,$11cb
b5ed e5        push    hl
b5ee 2185b7    ld      hl,$b785
b5f1 e5        push    hl
b5f2 cd6eb9    call    $b96e
b5f5 d1        pop     de
b5f6 d1        pop     de
b5f7 21a617    ld      hl,$17a6
b5fa e5        push    hl
b5fb 218ab7    ld      hl,$b78a
b5fe e5        push    hl
b5ff cd6eb9    call    $b96e
b602 d1        pop     de
b603 d1        pop     de
b604 21d517    ld      hl,$17d5
b607 e5        push    hl
b608 2190b7    ld      hl,$b790
b60b e5        push    hl
b60c cd6eb9    call    $b96e
b60f d1        pop     de
b610 d1        pop     de
b611 210f19    ld      hl,$190f
b614 e5        push    hl
b615 2193b7    ld      hl,$b793
b618 e5        push    hl
b619 cd6eb9    call    $b96e
b61c d1        pop     de
b61d d1        pop     de
b61e 212d19    ld      hl,$192d
b621 e5        push    hl
b622 2199b7    ld      hl,$b799
b625 e5        push    hl
b626 cd6eb9    call    $b96e
b629 d1        pop     de
b62a d1        pop     de
b62b 212419    ld      hl,$1924
b62e e5        push    hl
b62f 219db7    ld      hl,$b79d
b632 e5        push    hl
b633 cd6eb9    call    $b96e
b636 d1        pop     de
b637 d1        pop     de
b638 216818    ld      hl,$1868
b63b e5        push    hl
b63c 21a0b7    ld      hl,$b7a0
b63f e5        push    hl
b640 cd6eb9    call    $b96e
b643 d1        pop     de
b644 d1        pop     de
b645 219e18    ld      hl,$189e
b648 e5        push    hl
b649 21a3b7    ld      hl,$b7a3
b64c e5        push    hl
b64d cd6eb9    call    $b96e
b650 d1        pop     de
b651 d1        pop     de
b652 21b318    ld      hl,$18b3
b655 e5        push    hl
b656 21a9b7    ld      hl,$b7a9
b659 e5        push    hl
b65a cd6eb9    call    $b96e
b65d d1        pop     de
b65e d1        pop     de
b65f 21cf18    ld      hl,$18cf
b662 e5        push    hl
b663 21aeb7    ld      hl,$b7ae
b666 e5        push    hl
b667 cd6eb9    call    $b96e
b66a d1        pop     de
b66b d1        pop     de
b66c 21ef18    ld      hl,$18ef
b66f e5        push    hl
b670 21b3b7    ld      hl,$b7b3
b673 e5        push    hl
b674 cd6eb9    call    $b96e
b677 d1        pop     de
b678 d1        pop     de
b679 21fc16    ld      hl,$16fc
b67c e5        push    hl
b67d 21b8b7    ld      hl,$b7b8
b680 e5        push    hl
b681 cd6eb9    call    $b96e
b684 d1        pop     de
b685 d1        pop     de
b686 219217    ld      hl,$1792
b689 e5        push    hl
b68a 21bfb7    ld      hl,$b7bf
b68d e5        push    hl
b68e cd6eb9    call    $b96e
b691 d1        pop     de
b692 d1        pop     de
b693 21db26    ld      hl,$26db
b696 e5        push    hl
b697 21c4b7    ld      hl,$b7c4
b69a e5        push    hl
b69b cd6eb9    call    $b96e
b69e d1        pop     de
b69f d1        pop     de
b6a0 21a126    ld      hl,$26a1
b6a3 e5        push    hl
b6a4 21ccb7    ld      hl,$b7cc
b6a7 e5        push    hl
b6a8 cd6eb9    call    $b96e
b6ab d1        pop     de
b6ac d1        pop     de
b6ad 212125    ld      hl,$2521
b6b0 e5        push    hl
b6b1 21d6b7    ld      hl,$b7d6
b6b4 e5        push    hl
b6b5 cd6eb9    call    $b96e
b6b8 d1        pop     de
b6b9 d1        pop     de
b6ba 211e27    ld      hl,$271e
b6bd e5        push    hl
b6be 21dab7    ld      hl,$b7da
b6c1 e5        push    hl
b6c2 cd6eb9    call    $b96e
b6c5 d1        pop     de
b6c6 d1        pop     de
b6c7 21f525    ld      hl,$25f5
b6ca e5        push    hl
b6cb 21deb7    ld      hl,$b7de
b6ce e5        push    hl
b6cf cd6eb9    call    $b96e
b6d2 d1        pop     de
b6d3 d1        pop     de
b6d4 213a26    ld      hl,$263a
b6d7 e5        push    hl
b6d8 21e3b7    ld      hl,$b7e3
b6db e5        push    hl
b6dc cd6eb9    call    $b96e
b6df d1        pop     de
b6e0 d1        pop     de
b6e1 217c27    ld      hl,$277c
b6e4 e5        push    hl
b6e5 21e8b7    ld      hl,$b7e8
b6e8 e5        push    hl
b6e9 cd6eb9    call    $b96e
b6ec d1        pop     de
b6ed d1        pop     de
b6ee 219827    ld      hl,$2798
b6f1 e5        push    hl
b6f2 21f1b7    ld      hl,$b7f1
b6f5 e5        push    hl
b6f6 cd6eb9    call    $b96e
b6f9 d1        pop     de
b6fa d1        pop     de
b6fb 21bf77    ld      hl,$77bf
b6fe e5        push    hl
b6ff 21f6b7    ld      hl,$b7f6
b702 e5        push    hl
b703 cd6eb9    call    $b96e
b706 d1        pop     de
b707 d1        pop     de
b708 21fe77    ld      hl,$77fe
b70b e5        push    hl
b70c 21fdb7    ld      hl,$b7fd
b70f e5        push    hl
b710 cd6eb9    call    $b96e
b713 d1        pop     de
b714 d1        pop     de
b715 21df11    ld      hl,$11df
b718 e5        push    hl
b719 2105b8    ld      hl,$b805
b71c e5        push    hl
b71d cd6eb9    call    $b96e
b720 d1        pop     de
b721 d1        pop     de
b722 214212    ld      hl,$1242
b725 e5        push    hl
b726 210bb8    ld      hl,$b80b
b729 e5        push    hl
b72a cd6eb9    call    $b96e
b72d d1        pop     de
b72e d1        pop     de
b72f 214f12    ld      hl,$124f
b732 e5        push    hl
b733 2111b8    ld      hl,$b811
b736 e5        push    hl
b737 cd6eb9    call    $b96e
b73a d1        pop     de
b73b d1        pop     de
b73c 21a412    ld      hl,$12a4
b73f e5        push    hl
b740 2117b8    ld      hl,$b817
b743 e5        push    hl
b744 cd6eb9    call    $b96e
b747 d1        pop     de
b748 d1        pop     de
b749 219e12    ld      hl,$129e
b74c e5        push    hl
b74d 211ab8    ld      hl,$b81a
b750 e5        push    hl
b751 cd6eb9    call    $b96e
b754 d1        pop     de
b755 d1        pop     de
b756 21b313    ld      hl,$13b3
b759 e5        push    hl
b75a 2120b8    ld      hl,$b820
b75d e5        push    hl
b75e cd6eb9    call    $b96e
b761 d1        pop     de
b762 d1        pop     de
b763 21d53d    ld      hl,$3dd5
b766 e5        push    hl
b767 2126b8    ld      hl,$b826
b76a e5        push    hl
b76b cd6eb9    call    $b96e
b76e d1        pop     de
b76f d1        pop     de
b770 21be13    ld      hl,$13be
b773 e5        push    hl
b774 212eb8    ld      hl,$b82e
b777 e5        push    hl
b778 cd6eb9    call    $b96e
b77b d1        pop     de
b77c d1        pop     de
b77d 21df13    ld      hl,$13df
b780 e5        push    hl
b781 2138b8    ld      hl,$b838
b784 e5        push    hl
b785 cd6eb9    call    $b96e
b788 d1        pop     de
b789 d1        pop     de
b78a 21e813    ld      hl,$13e8
b78d e5        push    hl
b78e 213eb8    ld      hl,$b83e
b791 e5        push    hl
b792 cd6eb9    call    $b96e
b795 d1        pop     de
b796 d1        pop     de
b797 211314    ld      hl,$1413
b79a e5        push    hl
b79b 2146b8    ld      hl,$b846
b79e e5        push    hl
b79f cd6eb9    call    $b96e
b7a2 d1        pop     de
b7a3 d1        pop     de
b7a4 213b14    ld      hl,$143b
b7a7 e5        push    hl
b7a8 214cb8    ld      hl,$b84c
b7ab e5        push    hl
b7ac cd6eb9    call    $b96e
b7af d1        pop     de
b7b0 d1        pop     de
b7b1 21e516    ld      hl,$16e5
b7b4 e5        push    hl
b7b5 2154b8    ld      hl,$b854
b7b8 e5        push    hl
b7b9 cd6eb9    call    $b96e
b7bc d1        pop     de
b7bd d1        pop     de
b7be c9        ret     

b7bf 61        ld      h,c
b7c0 73        ld      (hl),e
b7c1 63        ld      h,e
b7c2 69        ld      l,c
b7c3 69        ld      l,c
b7c4 00        nop     
b7c5 62        ld      h,d
b7c6 66        ld      h,(hl)
b7c7 00        nop     
b7c8 62        ld      h,d
b7c9 6c        ld      l,h
b7ca 00        nop     
b7cb 63        ld      h,e
b7cc 68        ld      l,b
b7cd 61        ld      h,c
b7ce 72        ld      (hl),d
b7cf 00        nop     
b7d0 63        ld      h,e
b7d1 6f        ld      l,a
b7d2 75        ld      (hl),l
b7d3 6e        ld      l,(hl)
b7d4 74        ld      (hl),h
b7d5 00        nop     
b7d6 65        ld      h,l
b7d7 6d        ld      l,l
b7d8 70        ld      (hl),b
b7d9 74        ld      (hl),h
b7da 79        ld      a,c
b7db 70        ld      (hl),b
b7dc 00        nop     
b7dd 65        ld      h,l
b7de 71        ld      (hl),c
b7df 75        ld      (hl),l
b7e0 61        ld      h,c
b7e1 6c        ld      l,h
b7e2 70        ld      (hl),b
b7e3 00        nop     
b7e4 66        ld      h,(hl)
b7e5 69        ld      l,c
b7e6 72        ld      (hl),d
b7e7 73        ld      (hl),e
b7e8 74        ld      (hl),h
b7e9 00        nop     
b7ea 66        ld      h,(hl)
b7eb 70        ld      (hl),b
b7ec 75        ld      (hl),l
b7ed 74        ld      (hl),h
b7ee 00        nop     
b7ef 69        ld      l,c
b7f0 74        ld      (hl),h
b7f1 65        ld      h,l
b7f2 6d        ld      l,l
b7f3 00        nop     
b7f4 6c        ld      l,h
b7f5 61        ld      h,c
b7f6 73        ld      (hl),e
b7f7 74        ld      (hl),h
b7f8 00        nop     
b7f9 6c        ld      l,h
b7fa 69        ld      l,c
b7fb 73        ld      (hl),e
b7fc 74        ld      (hl),h
b7fd 00        nop     
b7fe 6c        ld      l,h
b7ff 69        ld      l,c
b800 73        ld      (hl),e
b801 74        ld      (hl),h
b802 70        ld      (hl),b
b803 00        nop     
b804 6c        ld      l,h
b805 70        ld      (hl),b
b806 75        ld      (hl),l
b807 74        ld      (hl),h
b808 00        nop     
b809 6d        ld      l,l
b80a 65        ld      h,l
b80b 6d        ld      l,l
b80c 62        ld      h,d
b80d 65        ld      h,l
b80e 72        ld      (hl),d
b80f 70        ld      (hl),b
b810 00        nop     
b811 6e        ld      l,(hl)
b812 75        ld      (hl),l
b813 6d        ld      l,l
b814 62        ld      h,d
b815 65        ld      h,l
b816 72        ld      (hl),d
b817 70        ld      (hl),b
b818 00        nop     
b819 73        ld      (hl),e
b81a 65        ld      h,l
b81b 00        nop     
b81c 77        ld      (hl),a
b81d 6f        ld      l,a
b81e 72        ld      (hl),d
b81f 64        ld      h,h
b820 70        ld      (hl),b
b821 00        nop     
b822 77        ld      (hl),a
b823 6f        ld      l,a
b824 72        ld      (hl),d
b825 64        ld      h,h
b826 00        nop     
b827 70        ld      (hl),b
b828 69        ld      l,c
b829 65        ld      h,l
b82a 63        ld      h,e
b82b 65        ld      h,l
b82c 00        nop     
b82d 77        ld      (hl),a
b82e 68        ld      l,b
b82f 65        ld      h,l
b830 72        ld      (hl),d
b831 65        ld      h,l
b832 00        nop     
b833 75        ld      (hl),l
b834 63        ld      h,e
b835 00        nop     
b836 6c        ld      l,h
b837 63        ld      h,e
b838 00        nop     
b839 6d        ld      l,l
b83a 61        ld      h,c
b83b 6b        ld      l,e
b83c 65        ld      h,l
b83d 00        nop     
b83e 6c        ld      l,h
b83f 6f        ld      l,a
b840 63        ld      h,e
b841 61        ld      h,c
b842 6c        ld      l,h
b843 00        nop     
b844 6e        ld      l,(hl)
b845 61        ld      h,c
b846 6d        ld      l,l
b847 65        ld      h,l
b848 70        ld      (hl),b
b849 00        nop     
b84a 74        ld      (hl),h
b84b 68        ld      l,b
b84c 69        ld      l,c
b84d 6e        ld      l,(hl)
b84e 67        ld      h,a
b84f 00        nop     
b850 67        ld      h,a
b851 70        ld      (hl),b
b852 72        ld      (hl),d
b853 6f        ld      l,a
b854 70        ld      (hl),b
b855 00        nop     
b856 70        ld      (hl),b
b857 6c        ld      l,h
b858 69        ld      l,c
b859 73        ld      (hl),e
b85a 74        ld      (hl),h
b85b 00        nop     
b85c 67        ld      h,a
b85d 6c        ld      l,h
b85e 69        ld      l,c
b85f 73        ld      (hl),e
b860 74        ld      (hl),h
b861 00        nop     
b862 70        ld      (hl),b
b863 70        ld      (hl),b
b864 73        ld      (hl),e
b865 00        nop     
b866 70        ld      (hl),b
b867 70        ld      (hl),b
b868 72        ld      (hl),d
b869 6f        ld      l,a
b86a 70        ld      (hl),b
b86b 00        nop     
b86c 72        ld      (hl),d
b86d 65        ld      h,l
b86e 6d        ld      l,l
b86f 70        ld      (hl),b
b870 72        ld      (hl),d
b871 6f        ld      l,a
b872 70        ld      (hl),b
b873 00        nop     
b874 70        ld      (hl),b
b875 72        ld      (hl),d
b876 00        nop     
b877 74        ld      (hl),h
b878 79        ld      a,c
b879 70        ld      (hl),b
b87a 65        ld      h,l
b87b 00        nop     
b87c 72        ld      (hl),d
b87d 71        ld      (hl),c
b87e 00        nop     
b87f 72        ld      (hl),d
b880 63        ld      h,e
b881 00        nop     
b882 72        ld      (hl),d
b883 6c        ld      l,h
b884 00        nop     
b885 73        ld      (hl),e
b886 68        ld      l,b
b887 6f        ld      l,a
b888 77        ld      (hl),a
b889 00        nop     
b88a 65        ld      h,l
b88b 64        ld      h,h
b88c 61        ld      h,c
b88d 6c        ld      l,h
b88e 6c        ld      l,h
b88f 00        nop     
b890 65        ld      h,l
b891 64        ld      h,h
b892 00        nop     
b893 65        ld      h,l
b894 72        ld      (hl),d
b895 61        ld      h,c
b896 6c        ld      l,h
b897 6c        ld      l,h
b898 00        nop     
b899 65        ld      h,l
b89a 72        ld      (hl),d
b89b 6e        ld      l,(hl)
b89c 00        nop     
b89d 65        ld      h,l
b89e 72        ld      (hl),d
b89f 00        nop     
b8a0 70        ld      (hl),b
b8a1 6f        ld      l,a
b8a2 00        nop     
b8a3 70        ld      (hl),b
b8a4 6f        ld      l,a
b8a5 61        ld      h,c
b8a6 6c        ld      l,h
b8a7 6c        ld      l,h
b8a8 00        nop     
b8a9 70        ld      (hl),b
b8aa 6f        ld      l,a
b8ab 74        ld      (hl),h
b8ac 73        ld      (hl),e
b8ad 00        nop     
b8ae 70        ld      (hl),b
b8af 6f        ld      l,a
b8b0 6e        ld      l,(hl)
b8b1 73        ld      (hl),e
b8b2 00        nop     
b8b3 70        ld      (hl),b
b8b4 6f        ld      l,a
b8b5 70        ld      (hl),b
b8b6 73        ld      (hl),e
b8b7 00        nop     
b8b8 64        ld      h,h
b8b9 65        ld      h,l
b8ba 66        ld      h,(hl)
b8bb 69        ld      l,c
b8bc 6e        ld      l,(hl)
b8bd 65        ld      h,l
b8be 00        nop     
b8bf 74        ld      (hl),h
b8c0 65        ld      h,l
b8c1 78        ld      a,b
b8c2 74        ld      (hl),h
b8c3 00        nop     
b8c4 63        ld      h,e
b8c5 68        ld      l,b
b8c6 61        ld      h,c
b8c7 6e        ld      l,(hl)
b8c8 67        ld      h,a
b8c9 65        ld      h,l
b8ca 66        ld      h,(hl)
b8cb 00        nop     
b8cc 65        ld      h,l
b8cd 72        ld      (hl),d
b8ce 61        ld      h,c
b8cf 73        ld      (hl),e
b8d0 65        ld      h,l
b8d1 66        ld      h,(hl)
b8d2 69        ld      l,c
b8d3 6c        ld      l,h
b8d4 65        ld      h,l
b8d5 00        nop     
b8d6 65        ld      h,l
b8d7 64        ld      h,h
b8d8 66        ld      h,(hl)
b8d9 00        nop     
b8da 64        ld      h,h
b8db 69        ld      l,c
b8dc 72        ld      (hl),d
b8dd 00        nop     
b8de 6c        ld      l,h
b8df 6f        ld      l,a
b8e0 61        ld      h,c
b8e1 64        ld      h,h
b8e2 00        nop     
b8e3 73        ld      (hl),e
b8e4 61        ld      h,c
b8e5 76        halt    
b8e6 65        ld      h,l
b8e7 00        nop     
b8e8 64        ld      h,h
b8e9 65        ld      h,l
b8ea 66        ld      h,(hl)
b8eb 61        ld      h,c
b8ec 75        ld      (hl),l
b8ed 6c        ld      l,h
b8ee 74        ld      (hl),h
b8ef 64        ld      h,h
b8f0 00        nop     
b8f1 73        ld      (hl),e
b8f2 65        ld      h,l
b8f3 74        ld      (hl),h
b8f4 64        ld      h,h
b8f5 00        nop     
b8f6 63        ld      h,e
b8f7 6f        ld      l,a
b8f8 70        ld      (hl),b
b8f9 79        ld      a,c
b8fa 6f        ld      l,a
b8fb 6e        ld      l,(hl)
b8fc 00        nop     
b8fd 63        ld      h,e
b8fe 6f        ld      l,a
b8ff 70        ld      (hl),b
b900 79        ld      a,c
b901 6f        ld      l,a
b902 66        ld      h,(hl)
b903 66        ld      h,(hl)
b904 00        nop     
b905 63        ld      h,e
b906 61        ld      h,c
b907 74        ld      (hl),h
b908 63        ld      h,e
b909 68        ld      l,b
b90a 00        nop     
b90b 65        ld      h,l
b90c 72        ld      (hl),d
b90d 72        ld      (hl),d
b90e 6f        ld      l,a
b90f 72        ld      (hl),d
b910 00        nop     
b911 74        ld      (hl),h
b912 68        ld      l,b
b913 72        ld      (hl),d
b914 6f        ld      l,a
b915 77        ld      (hl),a
b916 00        nop     
b917 67        ld      h,a
b918 6f        ld      l,a
b919 00        nop     
b91a 6c        ld      l,h
b91b 61        ld      h,c
b91c 62        ld      h,d
b91d 65        ld      h,l
b91e 6c        ld      l,h
b91f 00        nop     
b920 6e        ld      l,(hl)
b921 6f        ld      l,a
b922 64        ld      h,h
b923 65        ld      h,l
b924 73        ld      (hl),e
b925 00        nop     
b926 72        ld      (hl),d
b927 65        ld      h,l
b928 63        ld      h,e
b929 79        ld      a,c
b92a 63        ld      h,e
b92b 6c        ld      l,h
b92c 65        ld      h,l
b92d 00        nop     
b92e 2e63      ld      l,$63
b930 6f        ld      l,a
b931 6e        ld      l,(hl)
b932 74        ld      (hl),h
b933 65        ld      h,l
b934 6e        ld      l,(hl)
b935 74        ld      (hl),h
b936 73        ld      (hl),e
b937 00        nop     
b938 74        ld      (hl),h
b939 72        ld      (hl),d
b93a 61        ld      h,c
b93b 63        ld      h,e
b93c 65        ld      h,l
b93d 00        nop     
b93e 6e        ld      l,(hl)
b93f 6f        ld      l,a
b940 74        ld      (hl),h
b941 72        ld      (hl),d
b942 61        ld      h,c
b943 63        ld      h,e
b944 65        ld      h,l
b945 00        nop     
b946 77        ld      (hl),a
b947 61        ld      h,c
b948 74        ld      (hl),h
b949 63        ld      h,e
b94a 68        ld      l,b
b94b 00        nop     
b94c 6e        ld      l,(hl)
b94d 6f        ld      l,a
b94e 77        ld      (hl),a
b94f 61        ld      h,c
b950 74        ld      (hl),h
b951 63        ld      h,e
b952 68        ld      l,b
b953 00        nop     
b954 6e        ld      l,(hl)
b955 6f        ld      l,a
b956 66        ld      h,(hl)
b957 6f        ld      l,a
b958 72        ld      (hl),d
b959 6d        ld      l,l
b95a 61        ld      h,c
b95b 74        ld      (hl),h
b95c 00        nop     
b95d 2120b9    ld      hl,$b920
b960 e5        push    hl
b961 cdde4b    call    $4bde
b964 22b88f    ld      ($8fb8),hl
b967 e3        ex      (sp),hl
b968 cde1b9    call    $b9e1
b96b 2125b9    ld      hl,$b925
b96e e3        ex      (sp),hl
b96f cdde4b    call    $4bde
b972 22ba8f    ld      ($8fba),hl
b975 e3        ex      (sp),hl
b976 cde1b9    call    $b9e1
b979 212bb9    ld      hl,$b92b
b97c e3        ex      (sp),hl
b97d cdde4b    call    $4bde
b980 22bc8f    ld      ($8fbc),hl
b983 e3        ex      (sp),hl
b984 cde1b9    call    $b9e1
b987 d1        pop     de
b988 211200    ld      hl,$0012
b98b 22be8f    ld      ($8fbe),hl
b98e 211400    ld      hl,$0014
b991 22c08f    ld      ($8fc0),hl
b994 211600    ld      hl,$0016
b997 22c28f    ld      ($8fc2),hl
b99a 211800    ld      hl,$0018
b99d 22de8f    ld      ($8fde),hl
b9a0 2130b9    ld      hl,$b930
b9a3 e5        push    hl
b9a4 cdde4b    call    $4bde
b9a7 22c48f    ld      ($8fc4),hl
b9aa e3        ex      (sp),hl
b9ab cde1b9    call    $b9e1
b9ae 2135b9    ld      hl,$b935
b9b1 e3        ex      (sp),hl
b9b2 cdde4b    call    $4bde
b9b5 22c68f    ld      ($8fc6),hl
b9b8 e3        ex      (sp),hl
b9b9 cde1b9    call    $b9e1
b9bc 213ab9    ld      hl,$b93a
b9bf e3        ex      (sp),hl
b9c0 cdde4b    call    $4bde
b9c3 22c88f    ld      ($8fc8),hl
b9c6 e3        ex      (sp),hl
b9c7 cde1b9    call    $b9e1
b9ca 213fb9    ld      hl,$b93f
b9cd e3        ex      (sp),hl
b9ce cdde4b    call    $4bde
b9d1 22ca8f    ld      ($8fca),hl
b9d4 e3        ex      (sp),hl
b9d5 cde1b9    call    $b9e1
b9d8 2144b9    ld      hl,$b944
b9db e3        ex      (sp),hl
b9dc cdde4b    call    $4bde
b9df 22cc8f    ld      ($8fcc),hl
b9e2 e3        ex      (sp),hl
b9e3 cde1b9    call    $b9e1
b9e6 2149b9    ld      hl,$b949
b9e9 e3        ex      (sp),hl
b9ea cdde4b    call    $4bde
b9ed 22d48f    ld      ($8fd4),hl
b9f0 e3        ex      (sp),hl
b9f1 cde1b9    call    $b9e1
b9f4 2152b9    ld      hl,$b952
b9f7 e3        ex      (sp),hl
b9f8 cdde4b    call    $4bde
b9fb 22d08f    ld      ($8fd0),hl
b9fe e3        ex      (sp),hl
b9ff cde1b9    call    $b9e1
ba02 2159b9    ld      hl,$b959
ba05 e3        ex      (sp),hl
ba06 cdde4b    call    $4bde
ba09 22d28f    ld      ($8fd2),hl
ba0c e3        ex      (sp),hl
ba0d cde1b9    call    $b9e1
ba10 2160b9    ld      hl,$b960
ba13 e3        ex      (sp),hl
ba14 cdde4b    call    $4bde
ba17 22d68f    ld      ($8fd6),hl
ba1a e3        ex      (sp),hl
ba1b cde1b9    call    $b9e1
ba1e d1        pop     de
ba1f c9        ret     

ba20 54        ld      d,h
ba21 52        ld      d,d
ba22 55        ld      d,l
ba23 45        ld      b,l
ba24 00        nop     
ba25 46        ld      b,(hl)
ba26 41        ld      b,c
ba27 4c        ld      c,h
ba28 53        ld      d,e
ba29 45        ld      b,l
ba2a 00        nop     
ba2b 2e44      ld      l,$44
ba2d 45        ld      b,l
ba2e 46        ld      b,(hl)
ba2f 00        nop     
ba30 2e41      ld      l,$41
ba32 50        ld      d,b
ba33 56        ld      d,(hl)
ba34 00        nop     
ba35 2e46      ld      l,$46
ba37 4d        ld      c,l
ba38 54        ld      d,h
ba39 00        nop     
ba3a 2e53      ld      l,$53
ba3c 50        ld      d,b
ba3d 43        ld      b,e
ba3e 00        nop     
ba3f 2e52      ld      l,$52
ba41 45        ld      b,l
ba42 4d        ld      c,l
ba43 00        nop     
ba44 2e45      ld      l,$45
ba46 4e        ld      c,(hl)
ba47 4c        ld      c,h
ba48 00        nop     
ba49 54        ld      d,h
ba4a 4f        ld      c,a
ba4b 50        ld      d,b
ba4c 4c        ld      c,h
ba4d 45        ld      b,l
ba4e 56        ld      d,(hl)
ba4f 45        ld      b,l
ba50 4c        ld      c,h
ba51 00        nop     
ba52 52        ld      d,d
ba53 45        ld      b,l
ba54 44        ld      b,h
ba55 45        ld      b,l
ba56 46        ld      b,(hl)
ba57 50        ld      d,b
ba58 00        nop     
ba59 45        ld      b,l
ba5a 52        ld      d,d
ba5b 52        ld      d,d
ba5c 41        ld      b,c
ba5d 43        ld      b,e
ba5e 54        ld      d,h
ba5f 00        nop     
ba60 61        ld      h,c
ba61 6e        ld      l,(hl)
ba62 2065      jr      nz,$bac9
ba64 6d        ld      l,l
ba65 70        ld      (hl),b
ba66 74        ld      (hl),h
ba67 79        ld      a,c
ba68 2077      jr      nz,$bae1
ba6a 6f        ld      l,a
ba6b 72        ld      (hl),d
ba6c 64        ld      h,h
ba6d 00        nop     
ba6e cda98b    call    $8ba9
ba71 210800    ld      hl,$0008
ba74 39        add     hl,sp
ba75 4e        ld      c,(hl)
ba76 23        inc     hl
ba77 46        ld      b,(hl)
ba78 60        ld      h,b
ba79 69        ld      l,c
ba7a 7e        ld      a,(hl)
ba7b b7        or      a
ba7c 285f      jr      z,$badd
ba7e 60        ld      h,b
ba7f 69        ld      l,c
ba80 22728f    ld      ($8f72),hl
ba83 210000    ld      hl,$0000
ba86 227a8f    ld      ($8f7a),hl
ba89 1807      jr      $ba92
ba8b 2a7a8f    ld      hl,($8f7a)
ba8e 23        inc     hl
ba8f 227a8f    ld      ($8f7a),hl
ba92 60        ld      h,b
ba93 69        ld      l,c
ba94 7e        ld      a,(hl)
ba95 b7        or      a
ba96 2812      jr      z,$baaa
ba98 60        ld      h,b
ba99 69        ld      l,c
ba9a 5e        ld      e,(hl)
ba9b 1600      ld      d,$00
ba9d 212000    ld      hl,$0020
baa0 cd4885    call    $8548
baa3 2805      jr      z,$baaa
baa5 03        inc     bc
baa6 60        ld      h,b
baa7 69        ld      l,c
baa8 18e1      jr      $ba8b
baaa cda631    call    $31a6
baad cd1f30    call    $301f
bab0 210a00    ld      hl,$000a
bab3 39        add     hl,sp
bab4 5e        ld      e,(hl)
bab5 23        inc     hl
bab6 56        ld      d,(hl)
bab7 d5        push    de
bab8 210a00    ld      hl,$000a
babb e5        push    hl
babc cd7d45    call    $457d
babf d1        pop     de
bac0 e3        ex      (sp),hl
bac1 2ace8f    ld      hl,($8fce)
bac4 e5        push    hl
bac5 cdaa41    call    $41aa
bac8 22f48f    ld      ($8ff4),hl
bacb e5        push    hl
bacc cd5c47    call    $475c
bacf d1        pop     de
bad0 d1        pop     de
bad1 d1        pop     de
bad2 60        ld      h,b
bad3 69        ld      l,c
bad4 7e        ld      a,(hl)
bad5 b7        or      a
bad6 2803      jr      z,$badb
bad8 03        inc     bc
bad9 60        ld      h,b
bada 69        ld      l,c
badb 189b      jr      $ba78
badd 2af48f    ld      hl,($8ff4)
bae0 c9        ret     

bae1 cda98b    call    $8ba9
bae4 2ab08f    ld      hl,($8fb0)
bae7 e5        push    hl
bae8 210a00    ld      hl,$000a
baeb 39        add     hl,sp
baec 5e        ld      e,(hl)
baed 23        inc     hl
baee 56        ld      d,(hl)
baef d5        push    de
baf0 cd7d45    call    $457d
baf3 d1        pop     de
baf4 d1        pop     de
baf5 22b08f    ld      ($8fb0),hl
baf8 c9        ret     

baf9 1a        ld      a,(de)
bafa 1a        ld      a,(de)
bafb 1a        ld      a,(de)
bafc 1a        ld      a,(de)
bafd 1a        ld      a,(de)
bafe 1a        ld      a,(de)
baff 1a        ld      a,(de)



bb00 00        nop     
bb01 00        nop     
bb02 00        nop     
bb03 00        nop     
bb04 00        nop     
bb05 00        nop     
bb06 c31b01    jp      $011b
bb09 c30600    jp      $0006
bb0c 07        rlca    
bb0d 00        nop     
bb0e ff        rst     $38
bb0f 00        nop     
bb10 4a        ld      c,d
bb11 4f        ld      c,a
bb12 59        ld      e,c
bb13 4c        ld      c,h
bb14 49        ld      c,c
bb15 4f        ld      c,a
bb16 53        ld      d,e
bb17 2000      jr      nz,$bb19
bb19 00        nop     
bb1a 00        nop     
bb1b 79        ld      a,c
bb1c fe3c      cp      $3c
bb1e 20e9      jr      nz,$bb09
bb20 1a        ld      a,(de)
bb21 b7        or      a
bb22 20e5      jr      nz,$bb09
bb24 eb        ex      de,hl
bb25 23        inc     hl
bb26 23        inc     hl
bb27 5e        ld      e,(hl)
bb28 23        inc     hl
bb29 56        ld      d,(hl)
bb2a 23        inc     hl
bb2b d5        push    de
bb2c fde1      pop     iy
bb2e 5e        ld      e,(hl)
bb2f 23        inc     hl
bb30 56        ld      d,(hl)
bb31 213c01    ld      hl,$013c
bb34 014e00    ld      bc,$004e
bb37 edb0      ldir    
bb39 c39a01    jp      $019a
bb3c c32702    jp      $0227
bb3f c32802    jp      $0228
bb42 c33502    jp      $0235
bb45 c34102    jp      $0241
bb48 c39602    jp      $0296
bb4b c3a002    jp      $02a0
bb4e c3aa02    jp      $02aa
bb51 c3b802    jp      $02b8
bb54 c3e202    jp      $02e2
bb57 c30003    jp      $0300
bb5a c33f03    jp      $033f
bb5d c36c03    jp      $036c
bb60 c3a403    jp      $03a4
bb63 c3a503    jp      $03a5
bb66 c3be03    jp      $03be
bb69 c3c403    jp      $03c4
bb6c c3ca03    jp      $03ca
bb6f c3da03    jp      $03da
bb72 c3e403    jp      $03e4
bb75 c39a04    jp      $049a
bb78 c39a04    jp      $049a
bb7b c39a04    jp      $049a
bb7e c39a04    jp      $049a
bb81 c39a04    jp      $049a
bb84 c3ed03    jp      $03ed
bb87 c33104    jp      $0431
bb8a dd210200  ld      ix,$0002
bb8e dd39      add     ix,sp
bb90 e1        pop     hl
bb91 c5        push    bc
bb92 cd9901    call    $0199
bb95 c1        pop     bc
bb96 7c        ld      a,h
bb97 b5        or      l
bb98 c9        ret     

bb99 e9        jp      (hl)
bb9a cd9b04    call    $049b
bb9d cd3005    call    $0530
bba0 305d      jr      nc,$bbff
bba2 cd9805    call    $0598
bba5 e3        ex      (sp),hl
bba6 00        nop     
bba7 3d        dec     a
bba8 2055      jr      nz,$bbff
bbaa cdc304    call    $04c3
bbad 1b        dec     de
bbae 77        ld      (hl),a
bbaf ff        rst     $38
bbb0 0e2d      ld      c,$2d
bbb2 1efe      ld      e,$fe
bbb4 cd0901    call    $0109
bbb7 cd8702    call    $0287
bbba cd6e05    call    $056e
bbbd 7b        ld      a,e
bbbe 91        sub     c
bbbf 3c        inc     a
bbc0 fd7700    ld      (iy+$00),a
bbc3 fd7704    ld      (iy+$04),a
bbc6 fd7724    ld      (iy+$24),a
bbc9 1f        rra     
bbca 67        ld      h,a
bbcb b7        or      a
bbcc 1f        rra     
bbcd 84        add     a,h
bbce fd7708    ld      (iy+$08),a
bbd1 7a        ld      a,d
bbd2 90        sub     b
bbd3 3c        inc     a
bbd4 fd7702    ld      (iy+$02),a
bbd7 fd7706    ld      (iy+$06),a
bbda 2ad208    ld      hl,($08d2)
bbdd ed5bd008  ld      de,($08d0)
bbe1 b7        or      a
bbe2 ed52      sbc     hl,de
bbe4 23        inc     hl
bbe5 fd7518    ld      (iy+$18),l
bbe8 fd7419    ld      (iy+$19),h
bbeb 2ad608    ld      hl,($08d6)
bbee ed5bd408  ld      de,($08d4)
bbf2 b7        or      a
bbf3 ed52      sbc     hl,de
bbf5 23        inc     hl
bbf6 fd751a    ld      (iy+$1a),l
bbf9 fd741b    ld      (iy+$1b),h
bbfc c30001    jp      $0100
bbff cdc304    call    $04c3
bc02 0d        dec     c
bc03 0a        ld      a,(bc)
bc04 43        ld      b,e
bc05 61        ld      h,c
bc06 6e        ld      l,(hl)
bc07 206e      jr      nz,$bc77
bc09 6f        ld      l,a
bc0a 74        ld      (hl),h
bc0b 2072      jr      nz,$bc7f
bc0d 75        ld      (hl),l
bc0e 6e        ld      l,(hl)
bc0f 2069      jr      nz,$bc7a
bc11 6e        ld      l,(hl)
bc12 2074      jr      nz,$bc88
bc14 68        ld      l,b
bc15 69        ld      l,c
bc16 73        ld      (hl),e
bc17 2065      jr      nz,$bc7e
bc19 6e        ld      l,(hl)
bc1a 76        halt    
bc1b 69        ld      l,c
bc1c 72        ld      (hl),d
bc1d 6f        ld      l,a
bc1e 6e        ld      l,(hl)
bc1f 6d        ld      l,l
bc20 65        ld      h,l
bc21 6e        ld      l,(hl)
bc22 74        ld      (hl),h
bc23 0d        dec     c
bc24 0a        ld      a,(bc)
bc25 ff        rst     $38
bc26 c7        rst     $00
bc27 c9        ret     

bc28 cdc304    call    $04c3
bc2b 1b        dec     de
bc2c 45        ld      b,l
bc2d 1b        dec     de
bc2e 48        ld      c,b
bc2f 1b        dec     de
bc30 65        ld      h,l
bc31 1b        dec     de
bc32 76        halt    
bc33 ff        rst     $38
bc34 c7        rst     $00
bc35 3eff      ld      a,$ff
bc37 322005    ld      ($0520),a
bc3a cdc304    call    $04c3
bc3d 1b        dec     de
bc3e 65        ld      h,l
bc3f ff        rst     $38
bc40 c9        ret     

bc41 cd8a01    call    $018a
bc44 dd7e02    ld      a,(ix+$02)
bc47 322005    ld      ($0520),a
bc4a b7        or      a
bc4b 280f      jr      z,$bc5c
bc4d 3d        dec     a
bc4e f5        push    af
bc4f cd3a02    call    $023a
bc52 cd8702    call    $0287
bc55 f1        pop     af
bc56 81        add     a,c
bc57 3d        dec     a
bc58 5f        ld      e,a
bc59 c36e05    jp      $056e
bc5c cdc304    call    $04c3
bc5f 1b        dec     de
bc60 66        ld      h,(hl)
bc61 ff        rst     $38
bc62 cd8702    call    $0287
bc65 c36e05    jp      $056e
bc68 212020    ld      hl,$2020
bc6b 09        add     hl,bc
bc6c 228102    ld      ($0281),hl
bc6f 7b        ld      a,e
bc70 91        sub     c
bc71 c620      add     a,$20
bc73 6f        ld      l,a
bc74 7a        ld      a,d
bc75 90        sub     b
bc76 c620      add     a,$20
bc78 67        ld      h,a
bc79 228302    ld      ($0283),hl
bc7c cdc304    call    $04c3
bc7f 1b        dec     de
bc80 58        ld      e,b
bc81 00        nop     
bc82 00        nop     
bc83 00        nop     
bc84 00        nop     
bc85 ff        rst     $38
bc86 c9        ret     

bc87 e5        push    hl
bc88 cd9805    call    $0598
bc8b bf        cp      a
bc8c 00        nop     
bc8d 78        ld      a,b
bc8e 41        ld      b,c
bc8f 4f        ld      c,a
bc90 6a        ld      l,d
bc91 63        ld      h,e
bc92 09        add     hl,bc
bc93 eb        ex      de,hl
bc94 e1        pop     hl
bc95 c9        ret     

bc96 cd8a01    call    $018a
bc99 cdb704    call    $04b7
bc9c 6f        ld      l,a
bc9d 2600      ld      h,$00
bc9f c9        ret     

bca0 cd8a01    call    $018a
bca3 cdb404    call    $04b4
bca6 6f        ld      l,a
bca7 2600      ld      h,$00
bca9 c9        ret     

bcaa cd8a01    call    $018a
bcad 3a2005    ld      a,($0520)
bcb0 b7        or      a
bcb1 c8        ret     z

bcb2 dd4e02    ld      c,(ix+$02)
bcb5 c3ba04    jp      $04ba
bcb8 cd8a01    call    $018a
bcbb 3a2005    ld      a,($0520)
bcbe b7        or      a
bcbf c8        ret     z

bcc0 cd8702    call    $0287
bcc3 d5        push    de
bcc4 c5        push    bc
bcc5 79        ld      a,c
bcc6 dd8604    add     a,(ix+$04)
bcc9 3d        dec     a
bcca bb        cp      e
bccb 3001      jr      nc,$bcce
bccd 5f        ld      e,a
bcce 79        ld      a,c
bccf dd8602    add     a,(ix+$02)
bcd2 3d        dec     a
bcd3 4f        ld      c,a
bcd4 cd6802    call    $0268
bcd7 cdc304    call    $04c3
bcda 1b        dec     de
bcdb 45        ld      b,l
bcdc ff        rst     $38
bcdd c1        pop     bc
bcde d1        pop     de
bcdf c36802    jp      $0268
bce2 cd8a01    call    $018a
bce5 3a2005    ld      a,($0520)
bce8 b7        or      a
bce9 c8        ret     z

bcea dd6e04    ld      l,(ix+$04)
bced dd6602    ld      h,(ix+$02)
bcf0 111f1f    ld      de,$1f1f
bcf3 19        add     hl,de
bcf4 22fc02    ld      ($02fc),hl
bcf7 cdc304    call    $04c3
bcfa 1b        dec     de
bcfb 59        ld      e,c
bcfc 00        nop     
bcfd 00        nop     
bcfe ff        rst     $38
bcff c9        ret     

bd00 cd8a01    call    $018a
bd03 3a2005    ld      a,($0520)
bd06 b7        or      a
bd07 c8        ret     z

bd08 cdc304    call    $04c3
bd0b 1b        dec     de
bd0c 66        ld      h,(hl)
bd0d 1b        dec     de
bd0e 6a        ld      l,d
bd0f ff        rst     $38
bd10 cd8702    call    $0287
bd13 d5        push    de
bd14 c5        push    bc
bd15 79        ld      a,c
bd16 dd8604    add     a,(ix+$04)
bd19 3d        dec     a
bd1a 5f        ld      e,a
bd1b 79        ld      a,c
bd1c dd8602    add     a,(ix+$02)
bd1f 3d        dec     a
bd20 4f        ld      c,a
bd21 cd6802    call    $0268
bd24 dd6e04    ld      l,(ix+$04)
bd27 2601      ld      h,$01
bd29 cdf002    call    $02f0
bd2c 0e0a      ld      c,$0a
bd2e cdba04    call    $04ba
bd31 c1        pop     bc
bd32 d1        pop     de
bd33 cd6802    call    $0268
bd36 cdc304    call    $04c3
bd39 1b        dec     de
bd3a 6b        ld      l,e
bd3b 1b        dec     de
bd3c 65        ld      h,l
bd3d ff        rst     $38
bd3e c9        ret     

bd3f cd8a01    call    $018a
bd42 dd7e07    ld      a,(ix+$07)
bd45 cd9b03    call    $039b
bd48 dd7e06    ld      a,(ix+$06)
bd4b cda805    call    $05a8
bd4e cd5403    call    $0354
bd51 c3db05    jp      $05db
bd54 ed4bd008  ld      bc,($08d0)
bd58 dd6e02    ld      l,(ix+$02)
bd5b dd6603    ld      h,(ix+$03)
bd5e 09        add     hl,bc
bd5f eb        ex      de,hl
bd60 ed4bd408  ld      bc,($08d4)
bd64 dd6e04    ld      l,(ix+$04)
bd67 dd6605    ld      h,(ix+$05)
bd6a 09        add     hl,bc
bd6b c9        ret     

bd6c cd8a01    call    $018a
bd6f dd7e0b    ld      a,(ix+$0b)
bd72 cd9b03    call    $039b
bd75 dd7e0a    ld      a,(ix+$0a)
bd78 cda805    call    $05a8
bd7b cd5403    call    $0354
bd7e e5        push    hl
bd7f d5        push    de
bd80 dd6e08    ld      l,(ix+$08)
bd83 dd6609    ld      h,(ix+$09)
bd86 09        add     hl,bc
bd87 eb        ex      de,hl
bd88 ed4bd008  ld      bc,($08d0)
bd8c dd6e06    ld      l,(ix+$06)
bd8f dd6607    ld      h,(ix+$07)
bd92 09        add     hl,bc
bd93 eb        ex      de,hl
bd94 dde1      pop     ix
bd96 fde1      pop     iy
bd98 c3f606    jp      $06f6
bd9b fe02      cp      $02
bd9d 2801      jr      z,$bda0
bd9f af        xor     a
bda0 3c        inc     a
bda1 c3be05    jp      $05be
bda4 c9        ret     

bda5 cd8a01    call    $018a
bda8 dd6e04    ld      l,(ix+$04)
bdab dd6605    ld      h,(ix+$05)
bdae 23        inc     hl
bdaf 7c        ld      a,h
bdb0 b5        or      l
bdb1 c8        ret     z

bdb2 2b        dec     hl
bdb3 ed4bd408  ld      bc,($08d4)
bdb7 09        add     hl,bc
bdb8 dd7e02    ld      a,(ix+$02)
bdbb c34f08    jp      $084f
bdbe cdc304    call    $04c3
bdc1 07        rlca    
bdc2 ff        rst     $38
bdc3 c9        ret     

bdc4 2a0600    ld      hl,($0006)
bdc7 7c        ld      a,h
bdc8 b5        or      l
bdc9 c9        ret     

bdca cd8a01    call    $018a
bdcd cd5403    call    $0354
bdd0 cd2206    call    $0622
bdd3 a3        and     e
bdd4 210000    ld      hl,$0000
bdd7 c8        ret     z

bdd8 23        inc     hl
bdd9 c9        ret     

bdda cd8a01    call    $018a
bddd cdc004    call    $04c0
bde0 6f        ld      l,a
bde1 2600      ld      h,$00
bde3 c9        ret     

bde4 cd8a01    call    $018a
bde7 dd4e02    ld      c,(ix+$02)
bdea c3bd04    jp      $04bd
bded cd8a01    call    $018a
bdf0 cd5a04    call    $045a
bdf3 3022      jr      nc,$be17
bdf5 cd7704    call    $0477
bdf8 3019      jr      nc,$be13
bdfa 0680      ld      b,$80
bdfc c5        push    bc
bdfd e5        push    hl
bdfe d5        push    de
bdff cd2206    call    $0622
be02 d1        pop     de
be03 e1        pop     hl
be04 fd7700    ld      (iy+$00),a
be07 cd8204    call    $0482
be0a c1        pop     bc
be0b 3002      jr      nc,$be0f
be0d 10ed      djnz    $bdfc
be0f 210100    ld      hl,$0001
be12 c9        ret     

be13 210000    ld      hl,$0000
be16 c9        ret     

be17 212804    ld      hl,$0428
be1a 010900    ld      bc,$0009
be1d edb0      ldir    
be1f 62        ld      h,d
be20 6b        ld      l,e
be21 2b        dec     hl
be22 0e77      ld      c,$77
be24 edb0      ldir    
be26 18e7      jr      $be0f
be28 50        ld      d,b
be29 49        ld      c,c
be2a 43        ld      b,e
be2b 54        ld      d,h
be2c 55        ld      d,l
be2d 52        ld      d,d
be2e 45        ld      b,l
be2f 1a        ld      a,(de)
be30 00        nop     
be31 cd8a01    call    $018a
be34 cd5a04    call    $045a
be37 3f        ccf     
be38 381a      jr      c,$be54
be3a cd7704    call    $0477
be3d 3015      jr      nc,$be54
be3f 0680      ld      b,$80
be41 c5        push    bc
be42 e5        push    hl
be43 d5        push    de
be44 fd7e00    ld      a,(iy+$00)
be47 cd3a06    call    $063a
be4a d1        pop     de
be4b e1        pop     hl
be4c cd8204    call    $0482
be4f c1        pop     bc
be50 3002      jr      nc,$be54
be52 10ed      djnz    $be41
be54 210000    ld      hl,$0000
be57 d0        ret     nc

be58 23        inc     hl
be59 c9        ret     

be5a dd5e02    ld      e,(ix+$02)
be5d dd5603    ld      d,(ix+$03)
be60 d5        push    de
be61 fde1      pop     iy
be63 dd7e05    ld      a,(ix+$05)
be66 c6ff      add     a,$ff
be68 9f        sbc     a,a
be69 ddb604    or      (ix+$04)
be6c c8        ret     z

be6d 3d        dec     a
be6e 67        ld      h,a
be6f 2e00      ld      l,$00
be71 cb3c      srl     h
be73 cb1d      rr      l
be75 37        scf     
be76 c9        ret     

be77 0e5a      ld      c,$5a
be79 cdd604    call    $04d6
be7c 29        add     hl,hl
be7d 29        add     hl,hl
be7e 29        add     hl,hl
be7f eb        ex      de,hl
be80 1813      jr      $be95
be82 fd23      inc     iy
be84 010800    ld      bc,$0008
be87 eb        ex      de,hl
be88 09        add     hl,bc
be89 01d002    ld      bc,$02d0
be8c ed42      sbc     hl,bc
be8e 09        add     hl,bc
be8f eb        ex      de,hl
be90 d8        ret     c

be91 110000    ld      de,$0000
be94 23        inc     hl
be95 7c        ld      a,h
be96 b7        or      a
be97 c0        ret     nz

be98 37        scf     
be99 c9        ret     

be9a c9        ret     

be9b 2a0100    ld      hl,($0001)
be9e 23        inc     hl
be9f 23        inc     hl
bea0 23        inc     hl
bea1 11b404    ld      de,$04b4
bea4 010c00    ld      bc,$000c
bea7 edb0      ldir    
bea9 d5        push    de
beaa 111b00    ld      de,$001b
bead 19        add     hl,de
beae d1        pop     de
beaf 0e03      ld      c,$03
beb1 edb0      ldir    
beb3 c9        ret     

beb4 00        nop     
beb5 00        nop     
beb6 00        nop     
beb7 00        nop     
beb8 00        nop     
beb9 00        nop     
beba 00        nop     
bebb 00        nop     
bebc 00        nop     
bebd 00        nop     
bebe 00        nop     
bebf 00        nop     
bec0 00        nop     
bec1 00        nop     
bec2 00        nop     
bec3 e1        pop     hl
bec4 d5        push    de
bec5 c5        push    bc
bec6 4e        ld      c,(hl)
bec7 23        inc     hl
bec8 0c        inc     c
bec9 2808      jr      z,$bed3
becb 0d        dec     c
becc e5        push    hl
becd cdba04    call    $04ba
bed0 e1        pop     hl
bed1 18f3      jr      $bec6
bed3 c1        pop     bc
bed4 d1        pop     de
bed5 e9        jp      (hl)
bed6 0600      ld      b,$00
bed8 58        ld      e,b
bed9 53        ld      d,e
beda 7c        ld      a,h
bedb b9        cp      c
bedc 3804      jr      c,$bee2
bede 41        ld      b,c
bedf 4b        ld      c,e
bee0 1608      ld      d,$08
bee2 14        inc     d
bee3 7d        ld      a,l
bee4 91        sub     c
bee5 7c        ld      a,h
bee6 98        sbc     a,b
bee7 3807      jr      c,$bef0
bee9 cb21      sla     c
beeb cb10      rl      b
beed 30f3      jr      nc,$bee2
beef 3f        ccf     
bef0 3f        ccf     
bef1 7a        ld      a,d
bef2 53        ld      d,e
bef3 180e      jr      $bf03
bef5 cb18      rr      b
bef7 cb19      rr      c
bef9 ed42      sbc     hl,bc
befb 3001      jr      nc,$befe
befd 09        add     hl,bc
befe 3f        ccf     
beff cb13      rl      e
bf01 cb12      rl      d
bf03 3d        dec     a
bf04 20ef      jr      nz,$bef5
bf06 2600      ld      h,$00
bf08 c9        ret     

bf09 00        nop     
bf0a 00        nop     
bf0b 00        nop     
bf0c 00        nop     
bf0d 00        nop     
bf0e 00        nop     
bf0f 00        nop     
bf10 00        nop     
bf11 00        nop     
bf12 00        nop     
bf13 00        nop     
bf14 00        nop     
bf15 00        nop     
bf16 00        nop     
bf17 00        nop     
bf18 00        nop     
bf19 00        nop     
bf1a 00        nop     
bf1b 00        nop     
bf1c 00        nop     
bf1d 00        nop     
bf1e 00        nop     
bf1f 00        nop     
bf20 00        nop     
bf21 00        nop     
bf22 00        nop     
bf23 00        nop     
bf24 00        nop     
bf25 00        nop     
bf26 00        nop     
bf27 00        nop     
bf28 00        nop     
bf29 00        nop     
bf2a 00        nop     
bf2b 00        nop     
bf2c 00        nop     
bf2d 00        nop     
bf2e 00        nop     
bf2f 00        nop     
bf30 3ebf      ld      a,$bf
bf32 fe05      cp      $05
bf34 d0        ret     nc

bf35 2a0100    ld      hl,($0001)
bf38 115700    ld      de,$0057
bf3b 19        add     hl,de
bf3c 119805    ld      de,$0598
bf3f 010300    ld      bc,$0003
bf42 edb0      ldir    
bf44 010000    ld      bc,$0000
bf47 111f59    ld      de,$591f
bf4a cd6e05    call    $056e
bf4d af        xor     a
bf4e 47        ld      b,a
bf4f cd9b05    call    $059b
bf52 3e01      ld      a,$01
bf54 47        ld      b,a
bf55 cd9b05    call    $059b
bf58 af        xor     a
bf59 cdb305    call    $05b3
bf5c 3e01      ld      a,$01
bf5e cda805    call    $05a8
bf61 21ffff    ld      hl,$ffff
bf64 cdd705    call    $05d7
bf67 3e01      ld      a,$01
bf69 cdbe05    call    $05be
bf6c 37        scf     
bf6d c9        ret     

bf6e 68        ld      l,b
bf6f 62        ld      h,d
bf70 22d808    ld      ($08d8),hl
bf73 af        xor     a
bf74 67        ld      h,a
bf75 29        add     hl,hl
bf76 29        add     hl,hl
bf77 29        add     hl,hl
bf78 22d008    ld      ($08d0),hl
bf7b 6a        ld      l,d
bf7c 67        ld      h,a
bf7d 23        inc     hl
bf7e 29        add     hl,hl
bf7f 29        add     hl,hl
bf80 29        add     hl,hl
bf81 2b        dec     hl
bf82 22d208    ld      ($08d2),hl
bf85 69        ld      l,c
bf86 67        ld      h,a
bf87 29        add     hl,hl
bf88 29        add     hl,hl
bf89 29        add     hl,hl
bf8a 22d408    ld      ($08d4),hl
bf8d 6b        ld      l,e
bf8e 67        ld      h,a
bf8f 23        inc     hl
bf90 29        add     hl,hl
bf91 29        add     hl,hl
bf92 29        add     hl,hl
bf93 2b        dec     hl
bf94 22d608    ld      ($08d6),hl
bf97 c9        ret     

bf98 00        nop     
bf99 00        nop     
bf9a 00        nop     
bf9b 21e008    ld      hl,$08e0
bf9e b7        or      a
bf9f 2801      jr      z,$bfa2
bfa1 23        inc     hl
bfa2 78        ld      a,b
bfa3 c6ff      add     a,$ff
bfa5 9f        sbc     a,a
bfa6 77        ld      (hl),a
bfa7 c9        ret     

bfa8 21e008    ld      hl,$08e0
bfab b7        or      a
bfac 2801      jr      z,$bfaf
bfae 23        inc     hl
bfaf 22dc08    ld      ($08dc),hl
bfb2 c9        ret     

bfb3 21e008    ld      hl,$08e0
bfb6 b7        or      a
bfb7 2801      jr      z,$bfba
bfb9 23        inc     hl
bfba 22de08    ld      ($08de),hl
bfbd c9        ret     

bfbe 21f705    ld      hl,$05f7
bfc1 3d        dec     a
bfc2 280f      jr      z,$bfd3
bfc4 210b06    ld      hl,$060b
bfc7 3d        dec     a
bfc8 2809      jr      z,$bfd3
bfca 210e06    ld      hl,$060e
bfcd 3d        dec     a
bfce 2803      jr      z,$bfd3
bfd0 211b06    ld      hl,$061b
bfd3 22f505    ld      ($05f5),hl
bfd6 c9        ret     

bfd7 22da08    ld      ($08da),hl
bfda c9        ret     

bfdb cd9b07    call    $079b
bfde d0        ret     nc

bfdf 01f405    ld      bc,$05f4
bfe2 cd9805    call    $0598
bfe5 e9        jp      (hl)
bfe6 00        nop     
bfe7 c9        ret     

bfe8 e5        push    hl
bfe9 2ada08    ld      hl,($08da)
bfec 29        add     hl,hl
bfed 3001      jr      nc,$bff0
bfef 2c        inc     l
bff0 22da08    ld      ($08da),hl
bff3 e1        pop     hl
bff4 c3f705    jp      $05f7
bff7 3023      jr      nc,$c01c
bff9 ed4bdc08  ld      bc,($08dc)
bffd 0a        ld      a,(bc)
bffe f5        push    af
bfff cd5206    call    $0652
c002 f1        pop     af
c003 a0        and     b
c004 4f        ld      c,a
c005 78        ld      a,b
c006 2f        cpl     
c007 a6        and     (hl)
c008 b1        or      c
c009 77        ld      (hl),a
c00a c9        ret     

c00b 38ec      jr      c,$bff9
c00d c9        ret     

c00e d0        ret     nc

c00f cd5206    call    $0652
c012 ed5bdc08  ld      de,($08dc)
c016 1a        ld      a,(de)
c017 a0        and     b
c018 ae        xor     (hl)
c019 77        ld      (hl),a
c01a c9        ret     

c01b d0        ret     nc

c01c ed4bde08  ld      bc,($08de)
c020 18db      jr      $bffd
c022 cd9b07    call    $079b
c025 ed4bde08  ld      bc,($08de)
c029 0a        ld      a,(bc)
c02a d0        ret     nc

c02b 013406    ld      bc,$0634
c02e cd9805    call    $0598
c031 e9        jp      (hl)
c032 00        nop     
c033 c9        ret     

c034 cd5206    call    $0652
c037 7e        ld      a,(hl)
c038 58        ld      e,b
c039 c9        ret     

c03a 47        ld      b,a
c03b c5        push    bc
c03c cd9b07    call    $079b
c03f c1        pop     bc
c040 78        ld      a,b
c041 d0        ret     nc

c042 014b06    ld      bc,$064b
c045 cd9805    call    $0598
c048 e9        jp      (hl)
c049 00        nop     
c04a c9        ret     

c04b f5        push    af
c04c cd5206    call    $0652
c04f f1        pop     af
c050 77        ld      (hl),a
c051 c9        ret     

c052 0100b6    ld      bc,$b600
c055 29        add     hl,hl
c056 09        add     hl,bc
c057 7e        ld      a,(hl)
c058 23        inc     hl
c059 66        ld      h,(hl)
c05a 6f        ld      l,a
c05b e6f8      and     $f8
c05d 85        add     a,l
c05e 6f        ld      l,a
c05f cb14      rl      h
c061 4b        ld      c,e
c062 7b        ld      a,e
c063 e6f8      and     $f8
c065 5f        ld      e,a
c066 19        add     hl,de
c067 79        ld      a,c
c068 e607      and     $07
c06a c674      add     a,$74
c06c 5f        ld      e,a
c06d ce06      adc     a,$06
c06f 93        sub     e
c070 57        ld      d,a
c071 1a        ld      a,(de)
c072 47        ld      b,a
c073 c9        ret     

c074 80        add     a,b
c075 40        ld      b,b
c076 2010      jr      nz,$c088
c078 08        ex      af,af'
c079 04        inc     b
c07a 02        ld      (bc),a
c07b 01cd80    ld      bc,$80cd
c07e 06d0      ld      b,$d0
c080 fde5      push    iy
c082 dde5      push    ix
c084 cd9006    call    $0690
c087 e5        push    hl
c088 fde1      pop     iy
c08a d5        push    de
c08b dde1      pop     ix
c08d d1        pop     de
c08e e1        pop     hl
c08f c9        ret     

c090 cd9b07    call    $079b
c093 d8        ret     c

c094 cdcb07    call    $07cb
c097 d0        ret     nc

c098 44        ld      b,h
c099 4d        ld      c,l
c09a d5        push    de
c09b dde5      push    ix
c09d e1        pop     hl
c09e 19        add     hl,de
c09f cb2c      sra     h
c0a1 cb1d      rr      l
c0a3 e5        push    hl
c0a4 fde5      push    iy
c0a6 e1        pop     hl
c0a7 09        add     hl,bc
c0a8 cb2c      sra     h
c0aa cb1d      rr      l
c0ac d1        pop     de
c0ad b7        or      a
c0ae ed42      sbc     hl,bc
c0b0 09        add     hl,bc
c0b1 2007      jr      nz,$c0ba
c0b3 e3        ex      (sp),hl
c0b4 ed52      sbc     hl,de
c0b6 19        add     hl,de
c0b7 e3        ex      (sp),hl
c0b8 2813      jr      z,$c0cd
c0ba dde5      push    ix
c0bc e3        ex      (sp),hl
c0bd b7        or      a
c0be ed52      sbc     hl,de
c0c0 e1        pop     hl
c0c1 2013      jr      nz,$c0d6
c0c3 fde5      push    iy
c0c5 eb        ex      de,hl
c0c6 e3        ex      (sp),hl
c0c7 ed52      sbc     hl,de
c0c9 e1        pop     hl
c0ca eb        ex      de,hl
c0cb 2009      jr      nz,$c0d6
c0cd c1        pop     bc
c0ce dde5      push    ix
c0d0 d1        pop     de
c0d1 fde5      push    iy
c0d3 e1        pop     hl
c0d4 37        scf     
c0d5 c9        ret     

c0d6 dde3      ex      (sp),ix
c0d8 fde5      push    iy
c0da c5        push    bc
c0db fde1      pop     iy
c0dd c5        push    bc
c0de cdcb07    call    $07cb
c0e1 c1        pop     bc
c0e2 fde1      pop     iy
c0e4 dde3      ex      (sp),ix
c0e6 3803      jr      c,$c0eb
c0e8 c1        pop     bc
c0e9 18a9      jr      $c094
c0eb d5        push    de
c0ec dde1      pop     ix
c0ee e5        push    hl
c0ef fde1      pop     iy
c0f1 d1        pop     de
c0f2 60        ld      h,b
c0f3 69        ld      l,c
c0f4 189e      jr      $c094
c0f6 01ff06    ld      bc,$06ff
c0f9 cd9805    call    $0598
c0fc e9        jp      (hl)
c0fd 00        nop     
c0fe c9        ret     

c0ff cd7c06    call    $067c
c102 d0        ret     nc

c103 e5        push    hl
c104 dde5      push    ix
c106 e1        pop     hl
c107 b7        or      a
c108 ed52      sbc     hl,de
c10a cdc208    call    $08c2
c10d 06ff      ld      b,$ff
c10f f21707    jp      p,$0717
c112 0601      ld      b,$01
c114 cdab08    call    $08ab
c117 e3        ex      (sp),hl
c118 fde5      push    iy
c11a d1        pop     de
c11b b7        or      a
c11c ed52      sbc     hl,de
c11e cdc208    call    $08c2
c121 0e01      ld      c,$01
c123 f22b07    jp      p,$072b
c126 0eff      ld      c,$ff
c128 cdab08    call    $08ab
c12b d1        pop     de
c12c cdb808    call    $08b8
c12f 3e00      ld      a,$00
c131 fa4207    jp      m,$0742
c134 eb        ex      de,hl
c135 78        ld      a,b
c136 41        ld      b,c
c137 4f        ld      c,a
c138 dde5      push    ix
c13a fde5      push    iy
c13c dde1      pop     ix
c13e fde1      pop     iy
c140 3eff      ld      a,$ff
c142 32e808    ld      ($08e8),a
c145 d5        push    de
c146 29        add     hl,hl
c147 22e408    ld      ($08e4),hl
c14a ed52      sbc     hl,de
c14c e5        push    hl
c14d eb        ex      de,hl
c14e 29        add     hl,hl
c14f cdab08    call    $08ab
c152 22e208    ld      ($08e2),hl
c155 78        ld      a,b
c156 5f        ld      e,a
c157 87        add     a,a
c158 9f        sbc     a,a
c159 57        ld      d,a
c15a 79        ld      a,c
c15b 32e608    ld      ($08e6),a
c15e 87        add     a,a
c15f 9f        sbc     a,a
c160 32e708    ld      ($08e7),a
c163 e1        pop     hl
c164 c1        pop     bc
c165 03        inc     bc
c166 c5        push    bc
c167 e5        push    hl
c168 d5        push    de
c169 dde5      push    ix
c16b d1        pop     de
c16c fde5      push    iy
c16e e1        pop     hl
c16f 3ae808    ld      a,($08e8)
c172 b7        or      a
c173 2801      jr      z,$c176
c175 eb        ex      de,hl
c176 cde805    call    $05e8
c179 d1        pop     de
c17a e1        pop     hl
c17b 7c        ld      a,h
c17c 87        add     a,a
c17d 380e      jr      c,$c18d
c17f b5        or      l
c180 280b      jr      z,$c18d
c182 ed4be608  ld      bc,($08e6)
c186 fd09      add     iy,bc
c188 ed4be208  ld      bc,($08e2)
c18c 09        add     hl,bc
c18d ed4be408  ld      bc,($08e4)
c191 09        add     hl,bc
c192 dd19      add     ix,de
c194 c1        pop     bc
c195 0b        dec     bc
c196 78        ld      a,b
c197 b1        or      c
c198 20cc      jr      nz,$c166
c19a c9        ret     

c19b ed4bd408  ld      bc,($08d4)
c19f cdbe08    call    $08be
c1a2 fac907    jp      m,$07c9
c1a5 ed4bd608  ld      bc,($08d6)
c1a9 cdbe08    call    $08be
c1ac 2803      jr      z,$c1b1
c1ae f2c907    jp      p,$07c9
c1b1 ed4bd008  ld      bc,($08d0)
c1b5 cdb208    call    $08b2
c1b8 fac907    jp      m,$07c9
c1bb ed4bd208  ld      bc,($08d2)
c1bf cdb208    call    $08b2
c1c2 2803      jr      z,$c1c7
c1c4 f2c907    jp      p,$07c9
c1c7 37        scf     
c1c8 c9        ret     

c1c9 b7        or      a
c1ca c9        ret     

c1cb dde5      push    ix
c1cd e3        ex      (sp),hl
c1ce ed4bd008  ld      bc,($08d0)
c1d2 cdf307    call    $07f3
c1d5 ed4bd208  ld      bc,($08d2)
c1d9 dcfd07    call    c,$07fd
c1dc e1        pop     hl
c1dd d0        ret     nc

c1de eb        ex      de,hl
c1df fde5      push    iy
c1e1 e3        ex      (sp),hl
c1e2 ed4bd408  ld      bc,($08d4)
c1e6 cdf307    call    $07f3
c1e9 ed4bd608  ld      bc,($08d6)
c1ed dcfd07    call    c,$07fd
c1f0 e1        pop     hl
c1f1 eb        ex      de,hl
c1f2 c9        ret     

c1f3 cdbe08    call    $08be
c1f6 fcb208    call    m,$08b2
c1f9 37        scf     
c1fa f0        ret     p

c1fb b7        or      a
c1fc c9        ret     

c1fd cdbe08    call    $08be
c200 37        scf     
c201 f8        ret     m

c202 c8        ret     z

c203 cdb208    call    $08b2
c206 37        scf     
c207 f8        ret     m

c208 c8        ret     z

c209 b7        or      a
c20a c9        ret     

c20b 011408    ld      bc,$0814
c20e cd9805    call    $0598
c211 e9        jp      (hl)
c212 00        nop     
c213 c9        ret     

c214 dde5      push    ix
c216 e5        push    hl
c217 6f        ld      l,a
c218 2600      ld      h,$00
c21a 29        add     hl,hl
c21b 29        add     hl,hl
c21c 29        add     hl,hl
c21d 0100b8    ld      bc,$b800
c220 09        add     hl,bc
c221 e5        push    hl
c222 dde1      pop     ix
c224 e1        pop     hl
c225 0608      ld      b,$08
c227 d5        push    de
c228 c5        push    bc
c229 dd4e00    ld      c,(ix+$00)
c22c dd23      inc     ix
c22e 0608      ld      b,$08
c230 c5        push    bc
c231 cd9b07    call    $079b
c234 c1        pop     bc
c235 300b      jr      nc,$c242
c237 79        ld      a,c
c238 87        add     a,a
c239 e5        push    hl
c23a d5        push    de
c23b c5        push    bc
c23c cdf405    call    $05f4
c23f c1        pop     bc
c240 d1        pop     de
c241 e1        pop     hl
c242 cb21      sla     c
c244 13        inc     de
c245 10e9      djnz    $c230
c247 c1        pop     bc
c248 d1        pop     de
c249 23        inc     hl
c24a 10db      djnz    $c227
c24c dde1      pop     ix
c24e c9        ret     

c24f 015808    ld      bc,$0858
c252 cd9805    call    $0598
c255 e9        jp      (hl)
c256 00        nop     
c257 c9        ret     

c258 47        ld      b,a
c259 ed5bd408  ld      de,($08d4)
c25d af        xor     a
c25e ed52      sbc     hl,de
c260 23        inc     hl
c261 b4        or      h
c262 f8        ret     m

c263 b5        or      l
c264 c8        ret     z

c265 65        ld      h,l
c266 e5        push    hl
c267 78        ld      a,b
c268 21e008    ld      hl,$08e0
c26b b7        or      a
c26c 2801      jr      z,$c26f
c26e 23        inc     hl
c26f 4e        ld      c,(hl)
c270 2ad408    ld      hl,($08d4)
c273 29        add     hl,hl
c274 1100b6    ld      de,$b600
c277 19        add     hl,de
c278 e5        push    hl
c279 3ad908    ld      a,($08d9)
c27c 21d808    ld      hl,$08d8
c27f 96        sub     (hl)
c280 3c        inc     a
c281 47        ld      b,a
c282 6e        ld      l,(hl)
c283 2600      ld      h,$00
c285 29        add     hl,hl
c286 29        add     hl,hl
c287 29        add     hl,hl
c288 eb        ex      de,hl
c289 e1        pop     hl
c28a f1        pop     af
c28b f5        push    af
c28c c5        push    bc
c28d d5        push    de
c28e e5        push    hl
c28f 7e        ld      a,(hl)
c290 23        inc     hl
c291 66        ld      h,(hl)
c292 6f        ld      l,a
c293 e6f8      and     $f8
c295 85        add     a,l
c296 6f        ld      l,a
c297 cb14      rl      h
c299 19        add     hl,de
c29a 110800    ld      de,$0008
c29d 71        ld      (hl),c
c29e 19        add     hl,de
c29f 10fc      djnz    $c29d
c2a1 e1        pop     hl
c2a2 23        inc     hl
c2a3 23        inc     hl
c2a4 d1        pop     de
c2a5 c1        pop     bc
c2a6 f1        pop     af
c2a7 3d        dec     a
c2a8 20e1      jr      nz,$c28b
c2aa c9        ret     

c2ab af        xor     a
c2ac 95        sub     l
c2ad 6f        ld      l,a
c2ae 9c        sbc     a,h
c2af 95        sub     l
c2b0 67        ld      h,a
c2b1 c9        ret     

c2b2 eb        ex      de,hl
c2b3 cdbe08    call    $08be
c2b6 eb        ex      de,hl
c2b7 c9        ret     

c2b8 b7        or      a
c2b9 ed52      sbc     hl,de
c2bb 19        add     hl,de
c2bc 1804      jr      $c2c2
c2be b7        or      a
c2bf ed42      sbc     hl,bc
c2c1 09        add     hl,bc
c2c2 e0        ret     po

c2c3 fac908    jp      m,$08c9
c2c6 f680      or      $80
c2c8 c9        ret     

c2c9 e67f      and     $7f
c2cb c9        ret     

c2cc 00        nop     
c2cd 00        nop     
c2ce 00        nop     
c2cf 00        nop     
c2d0 00        nop     
c2d1 00        nop     
c2d2 00        nop     
c2d3 00        nop     
c2d4 00        nop     
c2d5 00        nop     
c2d6 00        nop     
c2d7 00        nop     
c2d8 00        nop     
c2d9 00        nop     
c2da 00        nop     
c2db 00        nop     
c2dc 00        nop     
c2dd 00        nop     
c2de 00        nop     
c2df 00        nop     
c2e0 00        nop     
c2e1 00        nop     
c2e2 00        nop     
c2e3 00        nop     
c2e4 00        nop     
c2e5 00        nop     
c2e6 00        nop     
c2e7 00        nop     
c2e8 00        nop     
c2e9 00        nop     
c2ea 00        nop     
c2eb 00        nop     
c2ec 00        nop     
c2ed 00        nop     
c2ee 00        nop     
c2ef 00        nop     
c2f0 00        nop     
c2f1 80        add     a,b
c2f2 00        nop     
c2f3 00        nop     
c2f4 00        nop     
c2f5 00        nop     
c2f6 1012      djnz    $c30a
c2f8 49        ld      c,c
c2f9 24        inc     h
c2fa 92        sub     d
c2fb 49        ld      c,c
c2fc 24        inc     h
c2fd 92        sub     d
c2fe 49        ld      c,c
c2ff 24        inc     h
c300 92        sub     d
c301 40        ld      b,b
c302 08        ex      af,af'
c303 09        add     hl,bc
c304 08        ex      af,af'
c305 08        ex      af,af'
c306 02        ld      (bc),a
c307 48        ld      c,b
c308 00        nop     
c309 00        nop     
c30a 00        nop     
c30b 08        ex      af,af'
c30c 80        add     a,b
c30d 04        inc     b
c30e 40        ld      b,b
c30f 00        nop     
c310 40        ld      b,b
c311 00        nop     
c312 00        nop     
c313 00        nop     
c314 00        nop     
c315 2000      jr      nz,$c317
c317 48        ld      c,b
c318 1040      djnz    $c35a
c31a 48        ld      c,b
c31b 12        ld      (de),a
c31c 09        add     hl,bc
c31d 02        ld      (bc),a
c31e 00        nop     
c31f 12        ld      (de),a
c320 00        nop     
c321 2000      jr      nz,$c323
c323 90        sub     b
c324 24        inc     h
c325 09        add     hl,bc
c326 012420    ld      bc,$2024
c329 00        nop     
c32a 02        ld      (bc),a
c32b 40        ld      b,b
c32c 49        ld      c,c
c32d 00        nop     
c32e 02        ld      (bc),a
c32f 40        ld      b,b
c330 24        inc     h
c331 2020      jr      nz,$c353
c333 00        nop     
c334 1010      djnz    $c346
c336 84        add     a,h
c337 80        add     a,b
c338 41        ld      b,c
c339 04        inc     b
c33a 91        sub     c
c33b 00        nop     
c33c 1002      djnz    $c340
c33e 08        ex      af,af'
c33f 24        inc     h
c340 00        nop     
c341 1000      djnz    $c343
c343 2011      jr      nz,$c356
c345 00        nop     
c346 02        ld      (bc),a
c347 04        inc     b
c348 80        add     a,b
c349 09        add     hl,bc
c34a 2009      jr      nz,$c355
c34c 02        ld      (bc),a
c34d 09        add     hl,bc
c34e 210040    ld      hl,$4000
c351 40        ld      b,b
c352 00        nop     
c353 40        ld      b,b
c354 00        nop     
c355 00        nop     
c356 12        ld      (de),a
c357 08        ex      af,af'
c358 00        nop     
c359 42        ld      b,d
c35a 00        nop     
c35b 00        nop     
c35c 00        nop     
c35d 00        nop     
c35e 00        nop     
c35f 1000      djnz    $c361
c361 00        nop     
c362 00        nop     
c363 00        nop     
c364 1000      djnz    $c366
c366 00        nop     
c367 00        nop     
c368 00        nop     
c369 010000    ld      bc,$0000
c36c 00        nop     
c36d 00        nop     
c36e 00        nop     
c36f 00        nop     
c370 00        nop     
c371 00        nop     
c372 00        nop     
c373 00        nop     
c374 00        nop     
c375 00        nop     
c376 1002      djnz    $c37a
c378 00        nop     
c379 08        ex      af,af'
c37a 41        ld      b,c
c37b 1082      djnz    $c2ff
c37d 1020      djnz    $c39f
c37f 2008      jr      nz,$c389
c381 08        ex      af,af'
c382 02        ld      (bc),a
c383 04        inc     b
c384 00        nop     
c385 2044      jr      nz,$c3cb
c387 08        ex      af,af'
c388 82        add     a,d
c389 08        ex      af,af'
c38a 24        inc     h
c38b 44        ld      b,h
c38c 48        ld      c,b
c38d 1022      djnz    $c3b1
c38f 08        ex      af,af'
c390 40        ld      b,b
c391 00        nop     
c392 44        ld      b,h
c393 010884    ld      bc,$8408
c396 82        add     a,d
c397 02        ld      (bc),a
c398 09        add     hl,bc
c399 02        ld      (bc),a
c39a 00        nop     
c39b 00        nop     
c39c 00        nop     
c39d 02        ld      (bc),a
c39e 00        nop     
c39f 02        ld      (bc),a
c3a0 02        ld      (bc),a
c3a1 00        nop     
c3a2 220000    ld      ($0000),hl
c3a5 00        nop     
c3a6 00        nop     
c3a7 00        nop     
c3a8 00        nop     
c3a9 00        nop     
c3aa 00        nop     
c3ab 00        nop     
c3ac 80        add     a,b
c3ad 00        nop     
c3ae 00        nop     
c3af 90        sub     b
c3b0 40        ld      b,b
c3b1 08        ex      af,af'
c3b2 42        ld      b,d
c3b3 00        nop     
c3b4 84        add     a,h
c3b5 221000    ld      ($0010),hl
c3b8 08        ex      af,af'
c3b9 40        ld      b,b
c3ba 48        ld      c,b
c3bb 04        inc     b
c3bc 2000      jr      nz,$c3be
c3be 40        ld      b,b
c3bf 80        add     a,b
c3c0 04        inc     b
c3c1 1080      djnz    $c343
c3c3 02        ld      (bc),a
c3c4 48        ld      c,b
c3c5 90        sub     b
c3c6 89        adc     a,c
c3c7 224200    ld      ($0042),hl
c3ca 48        ld      c,b
c3cb 90        sub     b
c3cc 04        inc     b
c3cd 89        adc     a,c
c3ce 04        inc     b
c3cf 81        add     a,c
c3d0 04        inc     b
c3d1 04        inc     b
c3d2 80        add     a,b
c3d3 00        nop     
c3d4 00        nop     
c3d5 00        nop     
c3d6 1002      djnz    $c3da
c3d8 00        nop     
c3d9 00        nop     
c3da 48        ld      c,b
c3db 08        ex      af,af'
c3dc 00        nop     
c3dd 2020      jr      nz,$c3ff
c3df 12        ld      (de),a
c3e0 00        nop     
c3e1 00        nop     
c3e2 00        nop     
c3e3 00        nop     
c3e4 00        nop     
c3e5 00        nop     
c3e6 04        inc     b
c3e7 00        nop     
c3e8 04        inc     b
c3e9 00        nop     
c3ea 00        nop     
c3eb 00        nop     
c3ec 00        nop     
c3ed 00        nop     
c3ee 1a        ld      a,(de)
c3ef 00        nop     
c3f0 00        nop     
c3f1 00        nop     
c3f2 00        nop     
c3f3 00        nop     
c3f4 00        nop     
c3f5 00        nop     
c3f6 00        nop     
c3f7 00        nop     
c3f8 00        nop     
c3f9 00        nop     
c3fa 00        nop     
c3fb 00        nop     
c3fc 00        nop     
c3fd 00        nop     
c3fe 00        nop     
c3ff 00        nop     
c400 00        nop     
c401 00        nop     
c402 00        nop     
c403 00        nop     
c404 00        nop     
c405 00        nop     
c406 00        nop     
c407 00        nop     
c408 00        nop     
c409 00        nop     
c40a 00        nop     
c40b 00        nop     
c40c 00        nop     
c40d 00        nop     
c40e 00        nop     
c40f 00        nop     
c410 00        nop     
c411 00        nop     
c412 00        nop     
c413 00        nop     
c414 00        nop     
c415 00        nop     
c416 00        nop     
c417 00        nop     
c418 00        nop     
c419 00        nop     
c41a 00        nop     
c41b 00        nop     
c41c 00        nop     
c41d 00        nop     
c41e 00        nop     
c41f 00        nop     
c420 00        nop     
c421 00        nop     
c422 00        nop     
c423 00        nop     
c424 00        nop     
c425 00        nop     
c426 00        nop     
c427 00        nop     
c428 00        nop     
c429 00        nop     
c42a 00        nop     
c42b 00        nop     
c42c 00        nop     
c42d 00        nop     
c42e 00        nop     
c42f 00        nop     
c430 00        nop     
c431 00        nop     
c432 00        nop     
c433 00        nop     
c434 00        nop     
c435 00        nop     
c436 00        nop     
c437 00        nop     
c438 00        nop     
c439 00        nop     
c43a 00        nop     
c43b 00        nop     
c43c 00        nop     
c43d 00        nop     
c43e 00        nop     
c43f 00        nop     
c440 00        nop     
c441 00        nop     
c442 00        nop     
c443 00        nop     
c444 00        nop     
c445 00        nop     
c446 00        nop     
c447 00        nop     
c448 00        nop     
c449 00        nop     
c44a 00        nop     
c44b 00        nop     
c44c 00        nop     
c44d 00        nop     
c44e 00        nop     
c44f 00        nop     
c450 00        nop     
c451 00        nop     
c452 00        nop     
c453 00        nop     
c454 00        nop     
c455 00        nop     
c456 00        nop     
c457 00        nop     
c458 00        nop     
c459 00        nop     
c45a 00        nop     
c45b 00        nop     
c45c 00        nop     
c45d 00        nop     
c45e 00        nop     
c45f 00        nop     
c460 00        nop     
c461 00        nop     
c462 00        nop     
c463 00        nop     
c464 00        nop     
c465 00        nop     
c466 00        nop     
c467 00        nop     
c468 00        nop     
c469 00        nop     
c46a 00        nop     
c46b 00        nop     
c46c 00        nop     
c46d 00        nop     
c46e 00        nop     
c46f 00        nop     
c470 00        nop     
c471 00        nop     
c472 00        nop     
c473 00        nop     
c474 00        nop     
c475 00        nop     
c476 00        nop     
c477 00        nop     
c478 00        nop     
c479 00        nop     
c47a 00        nop     
c47b 00        nop     
c47c 00        nop     
c47d 00        nop     
c47e 00        nop     
c47f 00        nop     
c480 00        nop     
c481 00        nop     
c482 00        nop     
c483 00        nop     
c484 00        nop     
c485 00        nop     
c486 00        nop     
c487 00        nop     
c488 00        nop     
c489 00        nop     
c48a 00        nop     
c48b 00        nop     
c48c 00        nop     
c48d 00        nop     
c48e 00        nop     
c48f 00        nop     
c490 00        nop     
c491 00        nop     
c492 00        nop     
c493 00        nop     
c494 00        nop     
c495 00        nop     
c496 00        nop     
c497 00        nop     
c498 00        nop     
c499 00        nop     
c49a 00        nop     
c49b 00        nop     
c49c 00        nop     
c49d 00        nop     
c49e 00        nop     
c49f 00        nop     
c4a0 00        nop     
c4a1 00        nop     
c4a2 00        nop     
c4a3 00        nop     
c4a4 00        nop     
c4a5 00        nop     
c4a6 00        nop     
c4a7 00        nop     
c4a8 00        nop     
c4a9 00        nop     
c4aa 00        nop     
c4ab 00        nop     
c4ac 00        nop     
c4ad 00        nop     
c4ae 00        nop     
c4af 00        nop     
c4b0 00        nop     
c4b1 00        nop     
c4b2 00        nop     
c4b3 00        nop     
c4b4 00        nop     
c4b5 00        nop     
c4b6 00        nop     
c4b7 00        nop     
c4b8 00        nop     
c4b9 00        nop     
c4ba 00        nop     
c4bb 00        nop     
c4bc 00        nop     
c4bd 00        nop     
c4be 00        nop     
c4bf 00        nop     
c4c0 00        nop     
c4c1 00        nop     
c4c2 00        nop     
c4c3 00        nop     
c4c4 00        nop     
c4c5 00        nop     
c4c6 00        nop     
c4c7 00        nop     
c4c8 00        nop     
c4c9 00        nop     
c4ca 00        nop     
c4cb 00        nop     
c4cc 00        nop     
c4cd 00        nop     
c4ce 00        nop     
c4cf 00        nop     
c4d0 00        nop     
c4d1 00        nop     
c4d2 00        nop     
c4d3 00        nop     
c4d4 00        nop     
c4d5 00        nop     
c4d6 00        nop     
c4d7 00        nop     
c4d8 00        nop     
c4d9 00        nop     
c4da 00        nop     
c4db 00        nop     
c4dc 00        nop     
c4dd 00        nop     
c4de 00        nop     
c4df 00        nop     
c4e0 00        nop     
c4e1 00        nop     
c4e2 00        nop     
c4e3 00        nop     
c4e4 00        nop     
c4e5 00        nop     
c4e6 00        nop     
c4e7 00        nop     
c4e8 00        nop     
c4e9 00        nop     
c4ea 00        nop     
c4eb 00        nop     
c4ec 00        nop     
c4ed 00        nop     
c4ee 00        nop     
c4ef 00        nop     
c4f0 00        nop     
c4f1 00        nop     
c4f2 00        nop     
c4f3 00        nop     
c4f4 00        nop     
c4f5 00        nop     
c4f6 00        nop     
c4f7 00        nop     
c4f8 00        nop     
c4f9 00        nop     
c4fa 00        nop     
c4fb 00        nop     
c4fc 00        nop     
c4fd 00        nop     
c4fe 00        nop     
c4ff 00        nop     
c500 00        nop     
c501 00        nop     
c502 00        nop     
c503 00        nop     
c504 00        nop     
c505 00        nop     
c506 00        nop     
c507 00        nop     
c508 00        nop     
c509 00        nop     
c50a 00        nop     
c50b 00        nop     
c50c 00        nop     
c50d 00        nop     
c50e 00        nop     
c50f 00        nop     
c510 00        nop     
c511 00        nop     
c512 00        nop     
c513 00        nop     
c514 00        nop     
c515 00        nop     
c516 00        nop     
c517 00        nop     
c518 00        nop     
c519 00        nop     
c51a 00        nop     
c51b 00        nop     
c51c 00        nop     
c51d 00        nop     
c51e 00        nop     
c51f 00        nop     
c520 00        nop     
c521 00        nop     
c522 00        nop     
c523 00        nop     
c524 00        nop     
c525 00        nop     
c526 00        nop     
c527 00        nop     
c528 00        nop     
c529 00        nop     
c52a 00        nop     
c52b 00        nop     
c52c 00        nop     
c52d 00        nop     
c52e 00        nop     
c52f 00        nop     
c530 00        nop     
c531 00        nop     
c532 00        nop     
c533 00        nop     
c534 00        nop     
c535 00        nop     
c536 00        nop     
c537 00        nop     
c538 00        nop     
c539 00        nop     
c53a 00        nop     
c53b 00        nop     
c53c 00        nop     
c53d 00        nop     
c53e 00        nop     
c53f 00        nop     
c540 00        nop     
c541 00        nop     
c542 00        nop     
c543 00        nop     
c544 00        nop     
c545 00        nop     
c546 00        nop     
c547 00        nop     
c548 00        nop     
c549 00        nop     
c54a 00        nop     
c54b 00        nop     
c54c 00        nop     
c54d 00        nop     
c54e 00        nop     
c54f 00        nop     
c550 00        nop     
c551 00        nop     
c552 00        nop     
c553 00        nop     
c554 00        nop     
c555 00        nop     
c556 00        nop     
c557 00        nop     
c558 00        nop     
c559 00        nop     
c55a 00        nop     
c55b 00        nop     
c55c 00        nop     
c55d 00        nop     
c55e 00        nop     
c55f 00        nop     
c560 00        nop     
c561 00        nop     
c562 00        nop     
c563 00        nop     
c564 00        nop     
c565 00        nop     
c566 00        nop     
c567 00        nop     
c568 00        nop     
c569 00        nop     
c56a 00        nop     
c56b 00        nop     
c56c 00        nop     
c56d 00        nop     
c56e 00        nop     
c56f 00        nop     
c570 00        nop     
c571 00        nop     
c572 00        nop     
c573 00        nop     
c574 00        nop     
c575 00        nop     
c576 00        nop     
c577 00        nop     
c578 00        nop     
c579 00        nop     
c57a 00        nop     
c57b 00        nop     
c57c 00        nop     
c57d 00        nop     
c57e 00        nop     
c57f 00        nop     
c580 00        nop     
c581 00        nop     
c582 00        nop     
c583 00        nop     
c584 00        nop     
c585 00        nop     
c586 00        nop     
c587 00        nop     
c588 00        nop     
c589 00        nop     
c58a 00        nop     
c58b 00        nop     
c58c 00        nop     
c58d 00        nop     
c58e 00        nop     
c58f 00        nop     
c590 00        nop     
c591 00        nop     
c592 00        nop     
c593 00        nop     
c594 00        nop     
c595 00        nop     
c596 00        nop     
c597 00        nop     
c598 00        nop     
c599 00        nop     
c59a 00        nop     
c59b 00        nop     
c59c 00        nop     
c59d 00        nop     
c59e 00        nop     
c59f 00        nop     
c5a0 00        nop     
c5a1 00        nop     
c5a2 00        nop     
c5a3 00        nop     
c5a4 00        nop     
c5a5 00        nop     
c5a6 00        nop     
c5a7 00        nop     
c5a8 00        nop     
c5a9 00        nop     
c5aa 00        nop     
c5ab 00        nop     
c5ac 00        nop     
c5ad 00        nop     
c5ae 00        nop     
c5af 00        nop     
c5b0 00        nop     
c5b1 00        nop     
c5b2 00        nop     
c5b3 00        nop     
c5b4 00        nop     
c5b5 00        nop     
c5b6 00        nop     
c5b7 00        nop     
c5b8 00        nop     
c5b9 00        nop     
c5ba 00        nop     
c5bb 00        nop     
c5bc 00        nop     
c5bd 00        nop     
c5be 00        nop     
c5bf 00        nop     
c5c0 00        nop     
c5c1 00        nop     
c5c2 00        nop     
c5c3 00        nop     
c5c4 00        nop     
c5c5 00        nop     
c5c6 00        nop     
c5c7 00        nop     
c5c8 00        nop     
c5c9 00        nop     
c5ca 00        nop     
c5cb 00        nop     
c5cc 00        nop     
c5cd 00        nop     
c5ce 00        nop     
c5cf 00        nop     
c5d0 00        nop     
c5d1 00        nop     
c5d2 00        nop     
c5d3 00        nop     
c5d4 00        nop     
c5d5 00        nop     
c5d6 00        nop     
c5d7 00        nop     
c5d8 00        nop     
c5d9 00        nop     
c5da 00        nop     
c5db 00        nop     
c5dc 00        nop     
c5dd 00        nop     
c5de 00        nop     
c5df 00        nop     
c5e0 00        nop     
c5e1 00        nop     
c5e2 00        nop     
c5e3 00        nop     
c5e4 00        nop     
c5e5 00        nop     
c5e6 00        nop     
c5e7 00        nop     
c5e8 00        nop     
c5e9 00        nop     
c5ea 00        nop     
c5eb 00        nop     
c5ec 00        nop     
c5ed 00        nop     
c5ee 00        nop     
c5ef 00        nop     
c5f0 00        nop     
c5f1 00        nop     
c5f2 00        nop     
c5f3 00        nop     
c5f4 00        nop     
c5f5 00        nop     
c5f6 00        nop     
c5f7 00        nop     
c5f8 00        nop     
c5f9 00        nop     
c5fa 00        nop     
c5fb 00        nop     
c5fc 00        nop     
c5fd 00        nop     
c5fe 00        nop     
c5ff 00        nop     
c600 00        nop     
c601 00        nop     
c602 00        nop     
c603 00        nop     
c604 00        nop     
c605 00        nop     
c606 00        nop     
c607 00        nop     
c608 00        nop     
c609 00        nop     
c60a 00        nop     
c60b 00        nop     
c60c 00        nop     
c60d 00        nop     
c60e 00        nop     
c60f 00        nop     
c610 00        nop     
c611 00        nop     
c612 00        nop     
c613 00        nop     
c614 00        nop     
c615 00        nop     
c616 00        nop     
c617 00        nop     
c618 00        nop     
c619 00        nop     
c61a 00        nop     
c61b 00        nop     
c61c 00        nop     
c61d 00        nop     
c61e 00        nop     
c61f 00        nop     
c620 00        nop     
c621 00        nop     
c622 00        nop     
c623 00        nop     
c624 00        nop     
c625 00        nop     
c626 00        nop     
c627 00        nop     
c628 00        nop     
c629 00        nop     
c62a 00        nop     
c62b 00        nop     
