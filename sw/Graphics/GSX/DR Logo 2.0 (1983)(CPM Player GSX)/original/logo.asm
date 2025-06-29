; Disassembly of the file "E:\Tmp\cpm\pcw\logo.com"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Tuesday, 19 of March 2024 at 11:00 PM
; 
0100 c3a486    jp      $86a4
0103 cd71af    call    $af71
0106 210000    ld      hl,$0000
0109 22a38c    ld      ($8ca3),hl
010c 210000    ld      hl,$0000
010f 22bf8c    ld      ($8cbf),hl
0112 22bb8c    ld      ($8cbb),hl
0115 22b78c    ld      ($8cb7),hl
0118 216d8c    ld      hl,$8c6d
011b e5        push    hl
011c cd017c    call    $7c01
011f d1        pop     de
0120 44        ld      b,h
0121 4d        ld      c,l
0122 7c        ld      a,h
0123 b5        or      l
0124 281f      jr      z,$0145
0126 210000    ld      hl,$0000
0129 229f8c    ld      ($8c9f),hl
012c 220890    ld      ($9008),hl
012f 60        ld      h,b
0130 69        ld      l,c
0131 111700    ld      de,$0017
0134 cd3c85    call    $853c
0137 2806      jr      z,$013f
0139 cd8b3c    call    $3c8b
013c cdd53d    call    $3dd5
013f cd443c    call    $3c44
0142 cd7d3c    call    $3c7d
0145 cd8b3c    call    $3c8b
0148 cd4e01    call    $014e
014b 18b9      jr      $0106
014d c9        ret     

014e cda98b    call    $8ba9
0151 210000    ld      hl,$0000
0154 22a28f    ld      ($8fa2),hl
0157 cd6237    call    $3762
015a 21798c    ld      hl,$8c79
015d e5        push    hl
015e cd017c    call    $7c01
0161 d1        pop     de
0162 2806      jr      z,$016a
0164 cde601    call    $01e6
0167 c38453    jp      $5384
016a 213f00    ld      hl,$003f
016d e5        push    hl
016e cddc28    call    $28dc
0171 21ae01    ld      hl,$01ae
0174 e3        ex      (sp),hl
0175 cd242d    call    $2d24
0178 d1        pop     de
0179 2805      jr      z,$0180
017b cdbf33    call    $33bf
017e 182d      jr      $01ad
0180 21b101    ld      hl,$01b1
0183 e5        push    hl
0184 cd242d    call    $2d24
0187 d1        pop     de
0188 2810      jr      z,$019a
018a cd371f    call    $1f37
018d cd406c    call    $6c40
0190 210000    ld      hl,$0000
0193 e5        push    hl
0194 cd6e77    call    $776e
0197 d1        pop     de
0198 1813      jr      $01ad
019a 21b501    ld      hl,$01b5
019d e5        push    hl
019e cd242d    call    $2d24
01a1 d1        pop     de
01a2 2006      jr      nz,$01aa
01a4 210000    ld      hl,$0000
01a7 22d28c    ld      ($8cd2),hl
01aa cdff4c    call    $4cff
01ad c9        ret     

01ae 74        ld      (hl),h
01af 6f        ld      l,a
01b0 00        nop     
01b1 62        ld      h,d
01b2 79        ld      a,c
01b3 65        ld      h,l
01b4 00        nop     
01b5 65        ld      h,l
01b6 64        ld      h,h
01b7 00        nop     
01b8 cda04b    call    $4ba0
01bb c0        ret     nz

01bc 2aee8f    ld      hl,($8fee)
01bf 22aa8f    ld      ($8faa),hl
01c2 cdf886    call    $86f8
01c5 22f08f    ld      ($8ff0),hl
01c8 cd0b52    call    $520b
01cb 2ae68f    ld      hl,($8fe6)
01ce 22e48f    ld      ($8fe4),hl
01d1 cda04b    call    $4ba0
01d4 c0        ret     nz

01d5 cd834b    call    $4b83
01d8 2803      jr      z,$01dd
01da c31d51    jp      $511d
01dd 2af08f    ld      hl,($8ff0)
01e0 22f48f    ld      ($8ff4),hl
01e3 c3b654    jp      $54b6
01e6 cda98b    call    $8ba9
01e9 cdc84c    call    $4cc8
01ec 212c02    ld      hl,$022c
01ef e5        push    hl
01f0 cde06b    call    $6be0
01f3 d1        pop     de
01f4 cdb549    call    $49b5
01f7 210200    ld      hl,$0002
01fa e5        push    hl
01fb cdde41    call    $41de
01fe 2ac28f    ld      hl,($8fc2)
0201 e3        ex      (sp),hl
0202 cd6341    call    $4163
0205 d1        pop     de
0206 21698c    ld      hl,$8c69
0209 e5        push    hl
020a cd017c    call    $7c01
020d d1        pop     de
020e 200a      jr      nz,$021a
0210 cd8443    call    $4384
0213 cd4e01    call    $014e
0216 18fb      jr      $0213
0218 18ec      jr      $0206
021a 2ac28f    ld      hl,($8fc2)
021d e5        push    hl
021e cd455a    call    $5a45
0221 210300    ld      hl,$0003
0224 e3        ex      (sp),hl
0225 cdf441    call    $41f4
0228 d1        pop     de
0229 c3c549    jp      $49c5
022c 70        ld      (hl),b
022d 61        ld      h,c
022e 75        ld      (hl),l
022f 73        ld      (hl),e
0230 69        ld      l,c
0231 6e        ld      l,(hl)
0232 67        ld      h,a
0233 2e2e      ld      l,$2e
0235 2e00      ld      l,$00
0237 cda98b    call    $8ba9
023a cdcf03    call    $03cf
023d cd5c4c    call    $4c5c
0240 44        ld      b,h
0241 4d        ld      c,l
0242 110000    ld      de,$0000
0245 eb        ex      de,hl
0246 cd6c85    call    $856c
0249 2803      jr      z,$024e
024b cd3b55    call    $553b
024e cd5f4a    call    $4a5f
0251 60        ld      h,b
0252 69        ld      l,c
0253 0b        dec     bc
0254 7c        ld      a,h
0255 b5        or      l
0256 2805      jr      z,$025d
0258 cdbf50    call    $50bf
025b 18f4      jr      $0251
025d c37c4b    jp      $4b7c
0260 cd324a    call    $4a32
0263 c36602    jp      $0266
0266 2abe8f    ld      hl,($8fbe)
0269 e5        push    hl
026a cd6e4c    call    $4c6e
026d d1        pop     de
026e c9        ret     

026f cd5f4a    call    $4a5f
0272 c3e850    jp      $50e8
0275 cdf54a    call    $4af5
0278 2af48f    ld      hl,($8ff4)
027b eb        ex      de,hl
027c 2ab88f    ld      hl,($8fb8)
027f cd3c85    call    $853c
0282 2805      jr      z,$0289
0284 2aba8f    ld      hl,($8fba)
0287 1803      jr      $028c
0289 2ab88f    ld      hl,($8fb8)
028c 22f48f    ld      ($8ff4),hl
028f c9        ret     

0290 2aba8f    ld      hl,($8fba)
0293 e5        push    hl
0294 cda202    call    $02a2
0297 d1        pop     de
0298 c9        ret     

0299 2ab88f    ld      hl,($8fb8)
029c e5        push    hl
029d cda202    call    $02a2
02a0 d1        pop     de
02a1 c9        ret     

02a2 cda98b    call    $8ba9
02a5 210100    ld      hl,$0001
02a8 e5        push    hl
02a9 cdd249    call    $49d2
02ac d1        pop     de
02ad 44        ld      b,h
02ae 4d        ld      c,l
02af cdf54a    call    $4af5
02b2 cd2e43    call    $432e
02b5 210800    ld      hl,$0008
02b8 39        add     hl,sp
02b9 5e        ld      e,(hl)
02ba 23        inc     hl
02bb 56        ld      d,(hl)
02bc d5        push    de
02bd c5        push    bc
02be cdc602    call    $02c6
02c1 d1        pop     de
02c2 d1        pop     de
02c3 c33743    jp      $4337
02c6 cda98b    call    $8ba9
02c9 210800    ld      hl,$0008
02cc 39        add     hl,sp
02cd 4e        ld      c,(hl)
02ce 23        inc     hl
02cf 46        ld      b,(hl)
02d0 c5        push    bc
02d1 cdee49    call    $49ee
02d4 d1        pop     de
02d5 c0        ret     nz

02d6 cdf54a    call    $4af5
02d9 210a00    ld      hl,$000a
02dc 39        add     hl,sp
02dd 5e        ld      e,(hl)
02de 23        inc     hl
02df 56        ld      d,(hl)
02e0 eb        ex      de,hl
02e1 227690    ld      ($9076),hl
02e4 e5        push    hl
02e5 2af48f    ld      hl,($8ff4)
02e8 d1        pop     de
02e9 cd3c85    call    $853c
02ec 2808      jr      z,$02f6
02ee 2a7690    ld      hl,($9076)
02f1 e5        push    hl
02f2 cdc941    call    $41c9
02f5 d1        pop     de
02f6 cd7266    call    $6672
02f9 2a7690    ld      hl,($9076)
02fc e5        push    hl
02fd 60        ld      h,b
02fe 69        ld      l,c
02ff 2b        dec     hl
0300 e5        push    hl
0301 cdc602    call    $02c6
0304 d1        pop     de
0305 d1        pop     de
0306 c9        ret     

0307 cda04b    call    $4ba0
030a 2003      jr      nz,$030f
030c cd324a    call    $4a32
030f 2ac28f    ld      hl,($8fc2)
0312 e5        push    hl
0313 cd6e4c    call    $4c6e
0316 d1        pop     de
0317 c9        ret     

0318 cdf54a    call    $4af5
031b 2ab88f    ld      hl,($8fb8)
031e e5        push    hl
031f 2af48f    ld      hl,($8ff4)
0322 e5        push    hl
0323 cd4603    call    $0346
0326 d1        pop     de
0327 d1        pop     de
0328 c9        ret     

0329 cda98b    call    $8ba9
032c cda04b    call    $4ba0
032f 2011      jr      nz,$0342
0331 2aee8f    ld      hl,($8fee)
0334 cdf886    call    $86f8
0337 e5        push    hl
0338 cd0d45    call    $450d
033b d1        pop     de
033c 2004      jr      nz,$0342
033e 210000    ld      hl,$0000
0341 c9        ret     

0342 210100    ld      hl,$0001
0345 c9        ret     

0346 cda98b    call    $8ba9
0349 cd2903    call    $0329
034c 2803      jr      z,$0351
034e cddd57    call    $57dd
0351 cd5f4a    call    $4a5f
0354 210800    ld      hl,$0008
0357 39        add     hl,sp
0358 5e        ld      e,(hl)
0359 23        inc     hl
035a 56        ld      d,(hl)
035b 210a00    ld      hl,$000a
035e 39        add     hl,sp
035f 7e        ld      a,(hl)
0360 23        inc     hl
0361 66        ld      h,(hl)
0362 6f        ld      l,a
0363 cd3c85    call    $853c
0366 280b      jr      z,$0373
0368 cde850    call    $50e8
036b cd2903    call    $0329
036e c0        ret     nz

036f cd1d51    call    $511d
0372 c9        ret     

0373 cd7c4b    call    $4b7c
0376 cd2903    call    $0329
0379 c0        ret     nz

037a cd5f4a    call    $4a5f
037d cde850    call    $50e8
0380 c9        ret     

0381 cdbd4a    call    $4abd
0384 cda77c    call    $7ca7
0387 cd2388    call    $8823
038a cda08b    call    $8ba0
038d 218d8c    ld      hl,$8c8d
0390 cd587c    call    $7c58
0393 cd417f    call    $7f41
0396 cda77c    call    $7ca7
0399 cdb84b    call    $4bb8
039c eb        ex      de,hl
039d cda08b    call    $8ba0
03a0 c9        ret     

03a1 cdbd4a    call    $4abd
03a4 cda77c    call    $7ca7
03a7 cd697a    call    $7a69
03aa cda08b    call    $8ba0
03ad cda77c    call    $7ca7
03b0 cdb84b    call    $4bb8
03b3 eb        ex      de,hl
03b4 cda08b    call    $8ba0
03b7 c9        ret     

03b8 cdbd4a    call    $4abd
03bb cda77c    call    $7ca7
03be cd4c7a    call    $7a4c
03c1 cda08b    call    $8ba0
03c4 cda77c    call    $7ca7
03c7 cdb84b    call    $4bb8
03ca eb        ex      de,hl
03cb cda08b    call    $8ba0
03ce c9        ret     

03cf cdbd4a    call    $4abd
03d2 cda77c    call    $7ca7
03d5 cdcc05    call    $05cc
03d8 eb        ex      de,hl
03d9 cda08b    call    $8ba0
03dc c9        ret     

03dd cda98b    call    $8ba9
03e0 cd7c4a    call    $4a7c
03e3 cd6c4a    call    $4a6c
03e6 210800    ld      hl,$0008
03e9 39        add     hl,sp
03ea 5e        ld      e,(hl)
03eb 23        inc     hl
03ec 56        ld      d,(hl)
03ed eb        ex      de,hl
03ee c30485    jp      $8504
03f1 cda98b    call    $8ba9
03f4 210200    ld      hl,$0002
03f7 e5        push    hl
03f8 cdd249    call    $49d2
03fb d1        pop     de
03fc 44        ld      b,h
03fd 4d        ld      c,l
03fe cd7c4a    call    $4a7c
0401 0b        dec     bc
0402 60        ld      h,b
0403 69        ld      l,c
0404 e5        push    hl
0405 cdee49    call    $49ee
0408 d1        pop     de
0409 2013      jr      nz,$041e
040b cd6c4a    call    $4a6c
040e 210800    ld      hl,$0008
0411 39        add     hl,sp
0412 5e        ld      e,(hl)
0413 23        inc     hl
0414 56        ld      d,(hl)
0415 eb        ex      de,hl
0416 cd0485    call    $8504
0419 cd2e43    call    $432e
041c 18e3      jr      $0401
041e c33743    jp      $4337
0421 21da06    ld      hl,$06da
0424 e5        push    hl
0425 cdf103    call    $03f1
0428 d1        pop     de
0429 c9        ret     

042a cda98b    call    $8ba9
042d 210800    ld      hl,$0008
0430 39        add     hl,sp
0431 cd667c    call    $7c66
0434 21858c    ld      hl,$8c85
0437 cd587c    call    $7c58
043a cdf27f    call    $7ff2
043d 280b      jr      z,$044a
043f 210800    ld      hl,$0008
0442 39        add     hl,sp
0443 cd667c    call    $7c66
0446 cd127d    call    $7d12
0449 c9        ret     

044a 210800    ld      hl,$0008
044d 39        add     hl,sp
044e cd667c    call    $7c66
0451 c9        ret     

0452 cd0585    call    $8505
0455 f8        ret     m

0456 ff        rst     $38
0457 211000    ld      hl,$0010
045a 39        add     hl,sp
045b 4e        ld      c,(hl)
045c 23        inc     hl
045d 46        ld      b,(hl)
045e 60        ld      h,b
045f 69        ld      l,c
0460 cd667c    call    $7c66
0463 cda77c    call    $7ca7
0466 210c00    ld      hl,$000c
0469 39        add     hl,sp
046a e5        push    hl
046b 60        ld      h,b
046c 69        ld      l,c
046d cd667c    call    $7c66
0470 cde681    call    $81e6
0473 cd2880    call    $8028
0476 e1        pop     hl
0477 cd857c    call    $7c85
047a cdd87c    call    $7cd8
047d cd657d    call    $7d65
0480 cda77c    call    $7ca7
0483 cd2a04    call    $042a
0486 cda08b    call    $8ba0
0489 cd517c    call    $7c51
048c 41        ld      b,c
048d 010000    ld      bc,$0000
0490 00        nop     
0491 00        nop     
0492 00        nop     
0493 00        nop     
0494 cdf27f    call    $7ff2
0497 2807      jr      z,$04a0
0499 210400    ld      hl,$0004
049c 39        add     hl,sp
049d c3667c    jp      $7c66
04a0 c30d54    jp      $540d
04a3 cdbd4a    call    $4abd
04a6 cde681    call    $81e6
04a9 e5        push    hl
04aa cd8207    call    $0782
04ad e3        ex      (sp),hl
04ae cda64b    call    $4ba6
04b1 d1        pop     de
04b2 c9        ret     

04b3 cda98b    call    $8ba9
04b6 210800    ld      hl,$0008
04b9 39        add     hl,sp
04ba 4e        ld      c,(hl)
04bb 23        inc     hl
04bc 46        ld      b,(hl)
04bd 210a00    ld      hl,$000a
04c0 39        add     hl,sp
04c1 5e        ld      e,(hl)
04c2 23        inc     hl
04c3 56        ld      d,(hl)
04c4 d5        push    de
04c5 210c00    ld      hl,$000c
04c8 39        add     hl,sp
04c9 5e        ld      e,(hl)
04ca 23        inc     hl
04cb 56        ld      d,(hl)
04cc d5        push    de
04cd cd5204    call    $0452
04d0 d1        pop     de
04d1 e1        pop     hl
04d2 cd857c    call    $7c85
04d5 21858c    ld      hl,$8c85
04d8 cd587c    call    $7c58
04db cde07f    call    $7fe0
04de 2803      jr      z,$04e3
04e0 cd6756    call    $5667
04e3 60        ld      h,b
04e4 69        ld      l,c
04e5 e5        push    hl
04e6 c5        push    bc
04e7 cd5204    call    $0452
04ea d1        pop     de
04eb e1        pop     hl
04ec cd857c    call    $7c85
04ef 210a00    ld      hl,$000a
04f2 39        add     hl,sp
04f3 5e        ld      e,(hl)
04f4 23        inc     hl
04f5 56        ld      d,(hl)
04f6 eb        ex      de,hl
04f7 cd667c    call    $7c66
04fa cda77c    call    $7ca7
04fd 60        ld      h,b
04fe 69        ld      l,c
04ff cd667c    call    $7c66
0502 cdd87c    call    $7cd8
0505 cd417e    call    $7e41
0508 c3e681    jp      $81e6
050b 217890    ld      hl,$9078
050e e5        push    hl
050f cdbd4a    call    $4abd
0512 e1        pop     hl
0513 cd857c    call    $7c85
0516 218090    ld      hl,$9080
0519 e5        push    hl
051a cdbd4a    call    $4abd
051d e1        pop     hl
051e cd857c    call    $7c85
0521 218090    ld      hl,$9080
0524 e5        push    hl
0525 217890    ld      hl,$9078
0528 e5        push    hl
0529 cdb304    call    $04b3
052c d1        pop     de
052d d1        pop     de
052e cd2880    call    $8028
0531 cda77c    call    $7ca7
0534 cdb84b    call    $4bb8
0537 eb        ex      de,hl
0538 cda08b    call    $8ba0
053b c9        ret     

053c 217890    ld      hl,$9078
053f e5        push    hl
0540 cdbd4a    call    $4abd
0543 e1        pop     hl
0544 cd857c    call    $7c85
0547 218090    ld      hl,$9080
054a e5        push    hl
054b cdbd4a    call    $4abd
054e e1        pop     hl
054f cd857c    call    $7c85
0552 218090    ld      hl,$9080
0555 e5        push    hl
0556 217890    ld      hl,$9078
0559 e5        push    hl
055a cdb304    call    $04b3
055d d1        pop     de
055e d1        pop     de
055f cd2880    call    $8028
0562 218090    ld      hl,$9080
0565 cd587c    call    $7c58
0568 cd417f    call    $7f41
056b cda77c    call    $7ca7
056e 217890    ld      hl,$9078
0571 cd667c    call    $7c66
0574 cdd87c    call    $7cd8
0577 cd657d    call    $7d65
057a cda77c    call    $7ca7
057d cdb84b    call    $4bb8
0580 eb        ex      de,hl
0581 cda08b    call    $8ba0
0584 c9        ret     

0585 218303    ld      hl,$0383
0588 22a58c    ld      ($8ca5),hl
058b c9        ret     

058c cd6c4a    call    $4a6c
058f cd534c    call    $4c53
0592 21858c    ld      hl,$8c85
0595 cd587c    call    $7c58
0598 cdf27f    call    $7ff2
059b 280d      jr      z,$05aa
059d cd5f7c    call    $7c5f
05a0 c0        ret     nz

05a1 80        add     a,b
05a2 00        nop     
05a3 00        nop     
05a4 00        nop     
05a5 00        nop     
05a6 00        nop     
05a7 00        nop     
05a8 180b      jr      $05b5
05aa cd5f7c    call    $7c5f
05ad 40        ld      b,b
05ae 80        add     a,b
05af 00        nop     
05b0 00        nop     
05b1 00        nop     
05b2 00        nop     
05b3 00        nop     
05b4 00        nop     
05b5 cda77c    call    $7ca7
05b8 cd534c    call    $4c53
05bb cdd87c    call    $7cd8
05be cd6c7d    call    $7d6c
05c1 cda77c    call    $7ca7
05c4 cdcc05    call    $05cc
05c7 eb        ex      de,hl
05c8 cda08b    call    $8ba0
05cb c9        ret     

05cc cda98b    call    $8ba9
05cf 210800    ld      hl,$0008
05d2 39        add     hl,sp
05d3 e5        push    hl
05d4 cd5204    call    $0452
05d7 d1        pop     de
05d8 cda77c    call    $7ca7
05db cdb84b    call    $4bb8
05de eb        ex      de,hl
05df cda08b    call    $8ba0
05e2 c9        ret     

05e3 211106    ld      hl,$0611
05e6 e5        push    hl
05e7 cdf103    call    $03f1
05ea d1        pop     de
05eb c9        ret     

05ec 213006    ld      hl,$0630
05ef e5        push    hl
05f0 cddd03    call    $03dd
05f3 d1        pop     de
05f4 c9        ret     

05f5 cdde52    call    $52de
05f8 2adc8f    ld      hl,($8fdc)
05fb e5        push    hl
05fc cd2b53    call    $532b
05ff d1        pop     de
0600 cd534c    call    $4c53
0603 cd127d    call    $7d12
0606 cda77c    call    $7ca7
0609 cdb84b    call    $4bb8
060c eb        ex      de,hl
060d cda08b    call    $8ba0
0610 c9        ret     

0611 cd534c    call    $4c53
0614 cda77c    call    $7ca7
0617 cdaa41    call    $41aa
061a e5        push    hl
061b cd9f45    call    $459f
061e d1        pop     de
061f cdd87c    call    $7cd8
0622 cd6c7d    call    $7d6c
0625 cda77c    call    $7ca7
0628 cdb84b    call    $4bb8
062b eb        ex      de,hl
062c cda08b    call    $8ba0
062f c9        ret     

0630 cd534c    call    $4c53
0633 cda77c    call    $7ca7
0636 cdaa41    call    $41aa
0639 e5        push    hl
063a cd9f45    call    $459f
063d d1        pop     de
063e cdd87c    call    $7cd8
0641 cd657d    call    $7d65
0644 cda77c    call    $7ca7
0647 cdb84b    call    $4bb8
064a eb        ex      de,hl
064b cda08b    call    $8ba0
064e c9        ret     

064f cd5806    call    $0658
0652 e5        push    hl
0653 cd6353    call    $5363
0656 d1        pop     de
0657 c9        ret     

0658 cd1d07    call    $071d
065b 2816      jr      z,$0673
065d cd534c    call    $4c53
0660 cda77c    call    $7ca7
0663 cdaa41    call    $41aa
0666 e5        push    hl
0667 cd9f45    call    $459f
066a d1        pop     de
066b cdd87c    call    $7cd8
066e cdf27f    call    $7ff2
0671 eb        ex      de,hl
0672 c9        ret     

0673 cd3c07    call    $073c
0676 110000    ld      de,$0000
0679 eb        ex      de,hl
067a cd6c85    call    $856c
067d c9        ret     

067e cd1d07    call    $071d
0681 2817      jr      z,$069a
0683 cd534c    call    $4c53
0686 cda77c    call    $7ca7
0689 cdaa41    call    $41aa
068c e5        push    hl
068d cd9f45    call    $459f
0690 d1        pop     de
0691 cdd87c    call    $7cd8
0694 cd1080    call    $8010
0697 eb        ex      de,hl
0698 180a      jr      $06a4
069a cd3c07    call    $073c
069d 110000    ld      de,$0000
06a0 eb        ex      de,hl
06a1 cd6d85    call    $856d
06a4 e5        push    hl
06a5 cd6353    call    $5363
06a8 d1        pop     de
06a9 c9        ret     

06aa cd534c    call    $4c53
06ad 21858c    ld      hl,$8c85
06b0 cd587c    call    $7c58
06b3 cde07f    call    $7fe0
06b6 2803      jr      z,$06bb
06b8 cd6756    call    $5667
06bb cd534c    call    $4c53
06be cda77c    call    $7ca7
06c1 cdaa41    call    $41aa
06c4 e5        push    hl
06c5 cd9f45    call    $459f
06c8 d1        pop     de
06c9 cdd87c    call    $7cd8
06cc cd417e    call    $7e41
06cf cda77c    call    $7ca7
06d2 cdb84b    call    $4bb8
06d5 eb        ex      de,hl
06d6 cda08b    call    $8ba0
06d9 c9        ret     

06da cd534c    call    $4c53
06dd cda77c    call    $7ca7
06e0 cdaa41    call    $41aa
06e3 e5        push    hl
06e4 cd9f45    call    $459f
06e7 d1        pop     de
06e8 cdd87c    call    $7cd8
06eb cd417f    call    $7f41
06ee cda77c    call    $7ca7
06f1 cdb84b    call    $4bb8
06f4 eb        ex      de,hl
06f5 cda08b    call    $8ba0
06f8 c9        ret     

06f9 21aa06    ld      hl,$06aa
06fc e5        push    hl
06fd cddd03    call    $03dd
0700 d1        pop     de
0701 c9        ret     

0702 cd0e07    call    $070e
0705 c34f06    jp      $064f
0708 cd0e07    call    $070e
070b c37e06    jp      $067e
070e cde64a    call    $4ae6
0711 cdbb4c    call    $4cbb
0714 cde64a    call    $4ae6
0717 cdbb4c    call    $4cbb
071a c33743    jp      $4337
071d cda98b    call    $8ba9
0720 cd8d41    call    $418d
0723 e5        push    hl
0724 cd2545    call    $4525
0727 d1        pop     de
0728 280a      jr      z,$0734
072a 2af48f    ld      hl,($8ff4)
072d e5        push    hl
072e cd2545    call    $4525
0731 d1        pop     de
0732 2004      jr      nz,$0738
0734 210000    ld      hl,$0000
0737 c9        ret     

0738 210100    ld      hl,$0001
073b c9        ret     

073c 2af48f    ld      hl,($8ff4)
073f e5        push    hl
0740 cdaa41    call    $41aa
0743 e5        push    hl
0744 cd4a07    call    $074a
0747 d1        pop     de
0748 d1        pop     de
0749 c9        ret     

074a cda98b    call    $8ba9
074d cd5e10    call    $105e
0750 210800    ld      hl,$0008
0753 39        add     hl,sp
0754 5e        ld      e,(hl)
0755 23        inc     hl
0756 56        ld      d,(hl)
0757 d5        push    de
0758 cd8835    call    $3588
075b 210000    ld      hl,$0000
075e e3        ex      (sp),hl
075f cdc966    call    $66c9
0762 d1        pop     de
0763 2a728f    ld      hl,($8f72)
0766 44        ld      b,h
0767 4d        ld      c,l
0768 210a00    ld      hl,$000a
076b 39        add     hl,sp
076c 5e        ld      e,(hl)
076d 23        inc     hl
076e 56        ld      d,(hl)
076f d5        push    de
0770 cd8835    call    $3588
0773 d1        pop     de
0774 cd7410    call    $1074
0777 c5        push    bc
0778 21e68d    ld      hl,$8de6
077b e5        push    hl
077c cd4f7b    call    $7b4f
077f d1        pop     de
0780 d1        pop     de
0781 c9        ret     

0782 cda98b    call    $8ba9
0785 2aa58c    ld      hl,($8ca5)
0788 118303    ld      de,$0383
078b cdd485    call    $85d4
078e 11ff7f    ld      de,$7fff
0791 cdfc84    call    $84fc
0794 22a58c    ld      ($8ca5),hl
0797 cd2880    call    $8028
079a cda77c    call    $7ca7
079d 211000    ld      hl,$0010
07a0 39        add     hl,sp
07a1 5e        ld      e,(hl)
07a2 23        inc     hl
07a3 56        ld      d,(hl)
07a4 eb        ex      de,hl
07a5 cd2880    call    $8028
07a8 cdd87c    call    $7cd8
07ab cd417f    call    $7f41
07ae cd517c    call    $7c51
07b1 41        ld      b,c
07b2 02        ld      (bc),a
07b3 00        nop     
07b4 00        nop     
07b5 00        nop     
07b6 00        nop     
07b7 00        nop     
07b8 00        nop     
07b9 cd417f    call    $7f41
07bc cd517c    call    $7c51
07bf 42        ld      b,d
07c0 ff        rst     $38
07c1 ff        rst     $38
07c2 00        nop     
07c3 00        nop     
07c4 00        nop     
07c5 00        nop     
07c6 00        nop     
07c7 cd417e    call    $7e41
07ca c3e681    jp      $81e6
07cd cd5f4a    call    $4a5f
07d0 2af48f    ld      hl,($8ff4)
07d3 e5        push    hl
07d4 cddb07    call    $07db
07d7 d1        pop     de
07d8 c33743    jp      $4337
07db cda98b    call    $8ba9
07de 210800    ld      hl,$0008
07e1 39        add     hl,sp
07e2 4e        ld      c,(hl)
07e3 23        inc     hl
07e4 46        ld      b,(hl)
07e5 78        ld      a,b
07e6 b1        or      c
07e7 2007      jr      nz,$07f0
07e9 cd2543    call    $4325
07ec 210100    ld      hl,$0001
07ef c9        ret     

07f0 cd7266    call    $6672
07f3 60        ld      h,b
07f4 69        ld      l,c
07f5 cdff86    call    $86ff
07f8 e5        push    hl
07f9 cddb07    call    $07db
07fc 228c90    ld      ($908c),hl
07ff e3        ex      (sp),hl
0800 cd8207    call    $0782
0803 d1        pop     de
0804 228a90    ld      ($908a),hl
0807 60        ld      h,b
0808 69        ld      l,c
0809 cdf886    call    $86f8
080c 44        ld      b,h
080d 4d        ld      c,l
080e cd8d41    call    $418d
0811 228890    ld      ($9088),hl
0814 2a8a90    ld      hl,($908a)
0817 7c        ld      a,h
0818 b5        or      l
0819 2010      jr      nz,$082b
081b 2a8890    ld      hl,($9088)
081e e5        push    hl
081f c5        push    bc
0820 cd7d45    call    $457d
0823 d1        pop     de
0824 e3        ex      (sp),hl
0825 cdc941    call    $41c9
0828 d1        pop     de
0829 182c      jr      $0857
082b 2a8a90    ld      hl,($908a)
082e 2b        dec     hl
082f 228a90    ld      ($908a),hl
0832 7c        ld      a,h
0833 b5        or      l
0834 280b      jr      z,$0841
0836 2a8890    ld      hl,($9088)
0839 cdff86    call    $86ff
083c 228890    ld      ($9088),hl
083f 18ea      jr      $082b
0841 2a8890    ld      hl,($9088)
0844 cdff86    call    $86ff
0847 e5        push    hl
0848 c5        push    bc
0849 cd7d45    call    $457d
084c d1        pop     de
084d e3        ex      (sp),hl
084e 2a8890    ld      hl,($9088)
0851 e5        push    hl
0852 cd9844    call    $4498
0855 d1        pop     de
0856 d1        pop     de
0857 2a8c90    ld      hl,($908c)
085a 23        inc     hl
085b c9        ret     

085c cdc94a    call    $4ac9
085f cd3c10    call    $103c
0862 2ae68d    ld      hl,($8de6)
0865 2600      ld      h,$00
0867 e5        push    hl
0868 cda64b    call    $4ba6
086b d1        pop     de
086c c9        ret     

086d cd554a    call    $4a55
0870 e5        push    hl
0871 cdd944    call    $44d9
0874 d1        pop     de
0875 2809      jr      z,$0880
0877 210100    ld      hl,$0001
087a e5        push    hl
087b cdcc0f    call    $0fcc
087e d1        pop     de
087f c9        ret     

0880 2af48f    ld      hl,($8ff4)
0883 cdff86    call    $86ff
0886 22f48f    ld      ($8ff4),hl
0889 c9        ret     

088a cd654c    call    $4c65
088d cd534c    call    $4c53
0890 cde081    call    $81e0
0893 e5        push    hl
0894 21e68d    ld      hl,$8de6
0897 22728f    ld      ($8f72),hl
089a d1        pop     de
089b 73        ld      (hl),e
089c c3cf4b    jp      $4bcf
089f cd554a    call    $4a55
08a2 e5        push    hl
08a3 cdac08    call    $08ac
08a6 e3        ex      (sp),hl
08a7 cda64b    call    $4ba6
08aa d1        pop     de
08ab c9        ret     

08ac cda98b    call    $8ba9
08af 210800    ld      hl,$0008
08b2 39        add     hl,sp
08b3 4e        ld      c,(hl)
08b4 23        inc     hl
08b5 46        ld      b,(hl)
08b6 c5        push    bc
08b7 cd2545    call    $4525
08ba d1        pop     de
08bb 2807      jr      z,$08c4
08bd cd0110    call    $1001
08c0 2a7a8f    ld      hl,($8f7a)
08c3 c9        ret     

08c4 c5        push    bc
08c5 cd0d45    call    $450d
08c8 d1        pop     de
08c9 280e      jr      z,$08d9
08cb 60        ld      h,b
08cc 69        ld      l,c
08cd cdff86    call    $86ff
08d0 cdf886    call    $86f8
08d3 e5        push    hl
08d4 cddf08    call    $08df
08d7 d1        pop     de
08d8 c9        ret     

08d9 c5        push    bc
08da cd5609    call    $0956
08dd d1        pop     de
08de c9        ret     

08df cd0585    call    $8505
08e2 feff      cp      $ff
08e4 210a00    ld      hl,$000a
08e7 39        add     hl,sp
08e8 4e        ld      c,(hl)
08e9 23        inc     hl
08ea 46        ld      b,(hl)
08eb c5        push    bc
08ec cd212e    call    $2e21
08ef d1        pop     de
08f0 eb        ex      de,hl
08f1 210400    ld      hl,$0004
08f4 39        add     hl,sp
08f5 73        ld      (hl),e
08f6 23        inc     hl
08f7 72        ld      (hl),d
08f8 60        ld      h,b
08f9 69        ld      l,c
08fa cdff86    call    $86ff
08fd 203a      jr      nz,$0939
08ff 210000    ld      hl,$0000
0902 228e90    ld      ($908e),hl
0905 1807      jr      $090e
0907 2a8e90    ld      hl,($908e)
090a 23        inc     hl
090b 228e90    ld      ($908e),hl
090e 2a8e90    ld      hl,($908e)
0911 110400    ld      de,$0004
0914 eb        ex      de,hl
0915 cd6c85    call    $856c
0918 2810      jr      z,$092a
091a 60        ld      h,b
091b 69        ld      l,c
091c cdf886    call    $86f8
091f eb        ex      de,hl
0920 2a8e90    ld      hl,($908e)
0923 19        add     hl,de
0924 7e        ld      a,(hl)
0925 b7        or      a
0926 2802      jr      z,$092a
0928 18dd      jr      $0907
092a 2a8e90    ld      hl,($908e)
092d eb        ex      de,hl
092e 210400    ld      hl,$0004
0931 39        add     hl,sp
0932 7e        ld      a,(hl)
0933 23        inc     hl
0934 66        ld      h,(hl)
0935 6f        ld      l,a
0936 c33086    jp      $8630
0939 cd7266    call    $6672
093c 60        ld      h,b
093d 69        ld      l,c
093e cdff86    call    $86ff
0941 e5        push    hl
0942 cddf08    call    $08df
0945 d1        pop     de
0946 110400    ld      de,$0004
0949 19        add     hl,de
094a eb        ex      de,hl
094b 210400    ld      hl,$0004
094e 39        add     hl,sp
094f 7e        ld      a,(hl)
0950 23        inc     hl
0951 66        ld      h,(hl)
0952 6f        ld      l,a
0953 c33086    jp      $8630
0956 cda98b    call    $8ba9
0959 210800    ld      hl,$0008
095c 39        add     hl,sp
095d 4e        ld      c,(hl)
095e 23        inc     hl
095f 46        ld      b,(hl)
0960 210000    ld      hl,$0000
0963 229090    ld      ($9090),hl
0966 1807      jr      $096f
0968 60        ld      h,b
0969 69        ld      l,c
096a cdff86    call    $86ff
096d 44        ld      b,h
096e 4d        ld      c,l
096f 78        ld      a,b
0970 b1        or      c
0971 2809      jr      z,$097c
0973 2a9090    ld      hl,($9090)
0976 23        inc     hl
0977 229090    ld      ($9090),hl
097a 18ec      jr      $0968
097c 2a9090    ld      hl,($9090)
097f c9        ret     

0980 cda98b    call    $8ba9
0983 210a00    ld      hl,$000a
0986 39        add     hl,sp
0987 4e        ld      c,(hl)
0988 23        inc     hl
0989 46        ld      b,(hl)
098a 210800    ld      hl,$0008
098d 39        add     hl,sp
098e 5e        ld      e,(hl)
098f 23        inc     hl
0990 56        ld      d,(hl)
0991 eb        ex      de,hl
0992 229290    ld      ($9092),hl
0995 e5        push    hl
0996 cdd944    call    $44d9
0999 d1        pop     de
099a 285a      jr      z,$09f6
099c c5        push    bc
099d cdd944    call    $44d9
09a0 d1        pop     de
09a1 284f      jr      z,$09f2
09a3 2a9290    ld      hl,($9092)
09a6 e5        push    hl
09a7 cd2545    call    $4525
09aa d1        pop     de
09ab 281f      jr      z,$09cc
09ad c5        push    bc
09ae cd2545    call    $4525
09b1 d1        pop     de
09b2 2818      jr      z,$09cc
09b4 c5        push    bc
09b5 cd9f45    call    $459f
09b8 d1        pop     de
09b9 cda77c    call    $7ca7
09bc 2a9290    ld      hl,($9092)
09bf e5        push    hl
09c0 cd9f45    call    $459f
09c3 d1        pop     de
09c4 cdd87c    call    $7cd8
09c7 cde07f    call    $7fe0
09ca eb        ex      de,hl
09cb c9        ret     

09cc 2a9290    ld      hl,($9092)
09cf e5        push    hl
09d0 cd2545    call    $4525
09d3 d1        pop     de
09d4 2007      jr      nz,$09dd
09d6 c5        push    bc
09d7 cd2545    call    $4525
09da d1        pop     de
09db 280d      jr      z,$09ea
09dd c5        push    bc
09de 2a9290    ld      hl,($9092)
09e1 e5        push    hl
09e2 cd4a07    call    $074a
09e5 d1        pop     de
09e6 d1        pop     de
09e7 c3f685    jp      $85f6
09ea 2a9290    ld      hl,($9092)
09ed 50        ld      d,b
09ee 59        ld      e,c
09ef c33c85    jp      $853c
09f2 210000    ld      hl,$0000
09f5 c9        ret     

09f6 cd7266    call    $6672
09f9 60        ld      h,b
09fa 69        ld      l,c
09fb cdf886    call    $86f8
09fe e5        push    hl
09ff 2a9290    ld      hl,($9092)
0a02 cdf886    call    $86f8
0a05 e5        push    hl
0a06 cd8009    call    $0980
0a09 d1        pop     de
0a0a d1        pop     de
0a0b 281b      jr      z,$0a28
0a0d 60        ld      h,b
0a0e 69        ld      l,c
0a0f cdff86    call    $86ff
0a12 e5        push    hl
0a13 210a00    ld      hl,$000a
0a16 39        add     hl,sp
0a17 5e        ld      e,(hl)
0a18 23        inc     hl
0a19 56        ld      d,(hl)
0a1a eb        ex      de,hl
0a1b 229290    ld      ($9092),hl
0a1e cdff86    call    $86ff
0a21 e5        push    hl
0a22 cd8009    call    $0980
0a25 d1        pop     de
0a26 d1        pop     de
0a27 c9        ret     

0a28 210000    ld      hl,$0000
0a2b c9        ret     

0a2c cda98b    call    $8ba9
0a2f 210800    ld      hl,$0008
0a32 39        add     hl,sp
0a33 4e        ld      c,(hl)
0a34 23        inc     hl
0a35 46        ld      b,(hl)
0a36 c5        push    bc
0a37 cd2545    call    $4525
0a3a d1        pop     de
0a3b 2804      jr      z,$0a41
0a3d 210000    ld      hl,$0000
0a40 c9        ret     

0a41 c5        push    bc
0a42 cd0d45    call    $450d
0a45 d1        pop     de
0a46 2812      jr      z,$0a5a
0a48 2af48f    ld      hl,($8ff4)
0a4b e5        push    hl
0a4c cd0f10    call    $100f
0a4f d1        pop     de
0a50 2a728f    ld      hl,($8f72)
0a53 5e        ld      e,(hl)
0a54 1600      ld      d,$00
0a56 eb        ex      de,hl
0a57 c3f685    jp      $85f6
0a5a 60        ld      h,b
0a5b 69        ld      l,c
0a5c c3f685    jp      $85f6
0a5f cd554a    call    $4a55
0a62 e5        push    hl
0a63 cd2c0a    call    $0a2c
0a66 e3        ex      (sp),hl
0a67 cd6353    call    $5363
0a6a d1        pop     de
0a6b c9        ret     

0a6c cd554a    call    $4a55
0a6f e5        push    hl
0a70 cdd944    call    $44d9
0a73 d1        pop     de
0a74 2809      jr      z,$0a7f
0a76 210000    ld      hl,$0000
0a79 e5        push    hl
0a7a cdcc0f    call    $0fcc
0a7d d1        pop     de
0a7e c9        ret     

0a7f cd850a    call    $0a85
0a82 c33743    jp      $4337
0a85 2af48f    ld      hl,($8ff4)
0a88 cdff86    call    $86ff
0a8b 2004      jr      nz,$0a91
0a8d cd2543    call    $4325
0a90 c9        ret     

0a91 2af48f    ld      hl,($8ff4)
0a94 cdf886    call    $86f8
0a97 e5        push    hl
0a98 cd6341    call    $4163
0a9b d1        pop     de
0a9c 2af48f    ld      hl,($8ff4)
0a9f cdff86    call    $86ff
0aa2 22f48f    ld      ($8ff4),hl
0aa5 cd7266    call    $6672
0aa8 cd850a    call    $0a85
0aab cd6a42    call    $426a
0aae c9        ret     

0aaf cde64a    call    $4ae6
0ab2 cd0f4a    call    $4a0f
0ab5 c35153    jp      $5351
0ab8 cdde4a    call    $4ade
0abb 2af48f    ld      hl,($8ff4)
0abe e5        push    hl
0abf cdd944    call    $44d9
0ac2 d1        pop     de
0ac3 2807      jr      z,$0acc
0ac5 cd3c10    call    $103c
0ac8 cdcf4b    call    $4bcf
0acb c9        ret     

0acc 2af48f    ld      hl,($8ff4)
0acf cdf886    call    $86f8
0ad2 22f48f    ld      ($8ff4),hl
0ad5 c9        ret     

0ad6 cde64a    call    $4ae6
0ad9 cd554a    call    $4a55
0adc e5        push    hl
0add cd0d45    call    $450d
0ae0 d1        pop     de
0ae1 281b      jr      z,$0afe
0ae3 cdbb4c    call    $4cbb
0ae6 cd5e10    call    $105e
0ae9 cdaa41    call    $41aa
0aec e5        push    hl
0aed cd8835    call    $3588
0af0 2af48f    ld      hl,($8ff4)
0af3 e3        ex      (sp),hl
0af4 cd8835    call    $3588
0af7 d1        pop     de
0af8 cd7410    call    $1074
0afb c3d84b    jp      $4bd8
0afe 2af48f    ld      hl,($8ff4)
0b01 e5        push    hl
0b02 cdaa41    call    $41aa
0b05 e5        push    hl
0b06 cd7d45    call    $457d
0b09 d1        pop     de
0b0a d1        pop     de
0b0b 22f48f    ld      ($8ff4),hl
0b0e c9        ret     

0b0f cda98b    call    $8ba9
0b12 cd530f    call    $0f53
0b15 44        ld      b,h
0b16 4d        ld      c,l
0b17 cd554a    call    $4a55
0b1a e5        push    hl
0b1b cd0d45    call    $450d
0b1e d1        pop     de
0b1f 281f      jr      z,$0b40
0b21 cdf40f    call    $0ff4
0b24 2a7a8f    ld      hl,($8f7a)
0b27 50        ld      d,b
0b28 59        ld      e,c
0b29 eb        ex      de,hl
0b2a cd6686    call    $8666
0b2d 2803      jr      z,$0b32
0b2f cde556    call    $56e5
0b32 60        ld      h,b
0b33 69        ld      l,c
0b34 2b        dec     hl
0b35 eb        ex      de,hl
0b36 2a728f    ld      hl,($8f72)
0b39 19        add     hl,de
0b3a 22728f    ld      ($8f72),hl
0b3d c3cf4b    jp      $4bcf
0b40 2af48f    ld      hl,($8ff4)
0b43 e5        push    hl
0b44 cdac08    call    $08ac
0b47 d1        pop     de
0b48 50        ld      d,b
0b49 59        ld      e,c
0b4a eb        ex      de,hl
0b4b cd6c85    call    $856c
0b4e 2803      jr      z,$0b53
0b50 cde556    call    $56e5
0b53 2af48f    ld      hl,($8ff4)
0b56 e5        push    hl
0b57 c5        push    bc
0b58 cd7346    call    $4673
0b5b d1        pop     de
0b5c d1        pop     de
0b5d 22f48f    ld      ($8ff4),hl
0b60 c9        ret     

0b61 cdde4a    call    $4ade
0b64 2af48f    ld      hl,($8ff4)
0b67 e5        push    hl
0b68 cdd944    call    $44d9
0b6b d1        pop     de
0b6c 2812      jr      z,$0b80
0b6e cdf40f    call    $0ff4
0b71 2a7a8f    ld      hl,($8f7a)
0b74 2b        dec     hl
0b75 eb        ex      de,hl
0b76 2a728f    ld      hl,($8f72)
0b79 19        add     hl,de
0b7a 22728f    ld      ($8f72),hl
0b7d c3cf4b    jp      $4bcf
0b80 2af48f    ld      hl,($8ff4)
0b83 e5        push    hl
0b84 2af48f    ld      hl,($8ff4)
0b87 e5        push    hl
0b88 cd5609    call    $0956
0b8b e3        ex      (sp),hl
0b8c cd7346    call    $4673
0b8f d1        pop     de
0b90 d1        pop     de
0b91 22f48f    ld      ($8ff4),hl
0b94 c9        ret     

0b95 210200    ld      hl,$0002
0b98 e5        push    hl
0b99 cdd249    call    $49d2
0b9c e3        ex      (sp),hl
0b9d cda40b    call    $0ba4
0ba0 d1        pop     de
0ba1 c33743    jp      $4337
0ba4 cda98b    call    $8ba9
0ba7 210800    ld      hl,$0008
0baa 39        add     hl,sp
0bab 4e        ld      c,(hl)
0bac 23        inc     hl
0bad 46        ld      b,(hl)
0bae c5        push    bc
0baf cdee49    call    $49ee
0bb2 d1        pop     de
0bb3 2803      jr      z,$0bb8
0bb5 c32543    jp      $4325
0bb8 cd554a    call    $4a55
0bbb e5        push    hl
0bbc cd6341    call    $4163
0bbf d1        pop     de
0bc0 cd7266    call    $6672
0bc3 60        ld      h,b
0bc4 69        ld      l,c
0bc5 2b        dec     hl
0bc6 e5        push    hl
0bc7 cda40b    call    $0ba4
0bca d1        pop     de
0bcb c36a42    jp      $426a
0bce cd554a    call    $4a55
0bd1 e5        push    hl
0bd2 cd0d45    call    $450d
0bd5 d1        pop     de
0bd6 cdf685    call    $85f6
0bd9 e5        push    hl
0bda cd6353    call    $5363
0bdd d1        pop     de
0bde c9        ret     

0bdf cda98b    call    $8ba9
0be2 cde64a    call    $4ae6
0be5 cd554a    call    $4a55
0be8 e5        push    hl
0be9 cd0d45    call    $450d
0bec d1        pop     de
0bed 281c      jr      z,$0c0b
0bef cdbb4c    call    $4cbb
0bf2 cd5e10    call    $105e
0bf5 2af48f    ld      hl,($8ff4)
0bf8 e5        push    hl
0bf9 cd8835    call    $3588
0bfc d1        pop     de
0bfd cdaa41    call    $41aa
0c00 e5        push    hl
0c01 cd8835    call    $3588
0c04 d1        pop     de
0c05 cd7410    call    $1074
0c08 c3d84b    jp      $4bd8
0c0b 2af48f    ld      hl,($8ff4)
0c0e 44        ld      b,h
0c0f 4d        ld      c,l
0c10 cd8d41    call    $418d
0c13 e5        push    hl
0c14 cd2c46    call    $462c
0c17 d1        pop     de
0c18 22f48f    ld      ($8ff4),hl
0c1b c5        push    bc
0c1c cd260c    call    $0c26
0c1f d1        pop     de
0c20 cd3743    call    $4337
0c23 c39641    jp      $4196
0c26 cda98b    call    $8ba9
0c29 210800    ld      hl,$0008
0c2c 39        add     hl,sp
0c2d 4e        ld      c,(hl)
0c2e 23        inc     hl
0c2f 46        ld      b,(hl)
0c30 78        ld      a,b
0c31 b1        or      c
0c32 2003      jr      nz,$0c37
0c34 c32e43    jp      $432e
0c37 60        ld      h,b
0c38 69        ld      l,c
0c39 cdf886    call    $86f8
0c3c e5        push    hl
0c3d cd6341    call    $4163
0c40 d1        pop     de
0c41 cd7266    call    $6672
0c44 60        ld      h,b
0c45 69        ld      l,c
0c46 cdff86    call    $86ff
0c49 e5        push    hl
0c4a cd260c    call    $0c26
0c4d d1        pop     de
0c4e c36a42    jp      $426a
0c51 cde64a    call    $4ae6
0c54 cd554a    call    $4a55
0c57 e5        push    hl
0c58 cd0d45    call    $450d
0c5b d1        pop     de
0c5c 2805      jr      z,$0c63
0c5e cd6c0c    call    $0c6c
0c61 1803      jr      $0c66
0c63 cdf80c    call    $0cf8
0c66 e5        push    hl
0c67 cd6353    call    $5363
0c6a d1        pop     de
0c6b c9        ret     

0c6c cda98b    call    $8ba9
0c6f cdbb4c    call    $4cbb
0c72 cd5e10    call    $105e
0c75 cdaa41    call    $41aa
0c78 e5        push    hl
0c79 cd8835    call    $3588
0c7c d1        pop     de
0c7d 2a7a8f    ld      hl,($8f7a)
0c80 229690    ld      ($9096),hl
0c83 7c        ld      a,h
0c84 b5        or      l
0c85 2007      jr      nz,$0c8e
0c87 cd7410    call    $1074
0c8a 210000    ld      hl,$0000
0c8d c9        ret     

0c8e 2a728f    ld      hl,($8f72)
0c91 44        ld      b,h
0c92 4d        ld      c,l
0c93 2af48f    ld      hl,($8ff4)
0c96 e5        push    hl
0c97 cd8835    call    $3588
0c9a d1        pop     de
0c9b cd7410    call    $1074
0c9e 2a7a8f    ld      hl,($8f7a)
0ca1 eb        ex      de,hl
0ca2 2a9690    ld      hl,($9096)
0ca5 cd3086    call    $8630
0ca8 229490    ld      ($9094),hl
0cab 210100    ld      hl,$0001
0cae 229c8f    ld      ($8f9c),hl
0cb1 1807      jr      $0cba
0cb3 2a9c8f    ld      hl,($8f9c)
0cb6 23        inc     hl
0cb7 229c8f    ld      ($8f9c),hl
0cba 2a9490    ld      hl,($9094)
0cbd 7c        ld      a,h
0cbe b5        or      l
0cbf 282d      jr      z,$0cee
0cc1 2a9490    ld      hl,($9094)
0cc4 2b        dec     hl
0cc5 229490    ld      ($9094),hl
0cc8 23        inc     hl
0cc9 e5        push    hl
0cca 2a9690    ld      hl,($9096)
0ccd d1        pop     de
0cce eb        ex      de,hl
0ccf cd6d85    call    $856d
0cd2 201a      jr      nz,$0cee
0cd4 2a9690    ld      hl,($9096)
0cd7 e5        push    hl
0cd8 60        ld      h,b
0cd9 69        ld      l,c
0cda 03        inc     bc
0cdb e5        push    hl
0cdc 2a728f    ld      hl,($8f72)
0cdf e5        push    hl
0ce0 cdc67b    call    $7bc6
0ce3 d1        pop     de
0ce4 d1        pop     de
0ce5 d1        pop     de
0ce6 2004      jr      nz,$0cec
0ce8 210100    ld      hl,$0001
0ceb c9        ret     

0cec 18c5      jr      $0cb3
0cee 210000    ld      hl,$0000
0cf1 229c8f    ld      ($8f9c),hl
0cf4 210000    ld      hl,$0000
0cf7 c9        ret     

0cf8 cda98b    call    $8ba9
0cfb cdaa41    call    $41aa
0cfe 44        ld      b,h
0cff 4d        ld      c,l
0d00 210100    ld      hl,$0001
0d03 229c8f    ld      ($8f9c),hl
0d06 1807      jr      $0d0f
0d08 2a9c8f    ld      hl,($8f9c)
0d0b 23        inc     hl
0d0c 229c8f    ld      ($8f9c),hl
0d0f 2af48f    ld      hl,($8ff4)
0d12 7c        ld      a,h
0d13 b5        or      l
0d14 281e      jr      z,$0d34
0d16 2af48f    ld      hl,($8ff4)
0d19 cdf886    call    $86f8
0d1c e5        push    hl
0d1d c5        push    bc
0d1e cd8009    call    $0980
0d21 d1        pop     de
0d22 d1        pop     de
0d23 2804      jr      z,$0d29
0d25 210100    ld      hl,$0001
0d28 c9        ret     

0d29 2af48f    ld      hl,($8ff4)
0d2c cdff86    call    $86ff
0d2f 22f48f    ld      ($8ff4),hl
0d32 18d4      jr      $0d08
0d34 210000    ld      hl,$0000
0d37 229c8f    ld      ($8f9c),hl
0d3a 210000    ld      hl,$0000
0d3d c9        ret     

0d3e cd0f4a    call    $4a0f
0d41 2af48f    ld      hl,($8ff4)
0d44 e5        push    hl
0d45 cd2545    call    $4525
0d48 d1        pop     de
0d49 200f      jr      nz,$0d5a
0d4b 2af48f    ld      hl,($8ff4)
0d4e e5        push    hl
0d4f cd824a    call    $4a82
0d52 d1        pop     de
0d53 2005      jr      nz,$0d5a
0d55 210000    ld      hl,$0000
0d58 1803      jr      $0d5d
0d5a 210100    ld      hl,$0001
0d5d e5        push    hl
0d5e cd6353    call    $5363
0d61 d1        pop     de
0d62 c9        ret     

0d63 210200    ld      hl,$0002
0d66 e5        push    hl
0d67 cdd249    call    $49d2
0d6a e3        ex      (sp),hl
0d6b cd720d    call    $0d72
0d6e d1        pop     de
0d6f c33743    jp      $4337
0d72 cda98b    call    $8ba9
0d75 210800    ld      hl,$0008
0d78 39        add     hl,sp
0d79 4e        ld      c,(hl)
0d7a 23        inc     hl
0d7b 46        ld      b,(hl)
0d7c c5        push    bc
0d7d cdee49    call    $49ee
0d80 d1        pop     de
0d81 2803      jr      z,$0d86
0d83 c32543    jp      $4325
0d86 cd7266    call    $6672
0d89 cde64a    call    $4ae6
0d8c cd8d41    call    $418d
0d8f e5        push    hl
0d90 cd0d45    call    $450d
0d93 d1        pop     de
0d94 280b      jr      z,$0da1
0d96 60        ld      h,b
0d97 69        ld      l,c
0d98 2b        dec     hl
0d99 e5        push    hl
0d9a cd720d    call    $0d72
0d9d d1        pop     de
0d9e c36a42    jp      $426a
0da1 2af48f    ld      hl,($8ff4)
0da4 e5        push    hl
0da5 60        ld      h,b
0da6 69        ld      l,c
0da7 2b        dec     hl
0da8 e5        push    hl
0da9 cdb70d    call    $0db7
0dac d1        pop     de
0dad d1        pop     de
0dae cdaa41    call    $41aa
0db1 e5        push    hl
0db2 cdc941    call    $41c9
0db5 d1        pop     de
0db6 c9        ret     

0db7 cda98b    call    $8ba9
0dba 210a00    ld      hl,$000a
0dbd 39        add     hl,sp
0dbe 4e        ld      c,(hl)
0dbf 23        inc     hl
0dc0 46        ld      b,(hl)
0dc1 78        ld      a,b
0dc2 b1        or      c
0dc3 200d      jr      nz,$0dd2
0dc5 210800    ld      hl,$0008
0dc8 39        add     hl,sp
0dc9 5e        ld      e,(hl)
0dca 23        inc     hl
0dcb 56        ld      d,(hl)
0dcc d5        push    de
0dcd cd720d    call    $0d72
0dd0 d1        pop     de
0dd1 c9        ret     

0dd2 60        ld      h,b
0dd3 69        ld      l,c
0dd4 cdf886    call    $86f8
0dd7 e5        push    hl
0dd8 cd6341    call    $4163
0ddb d1        pop     de
0ddc cd7266    call    $6672
0ddf 60        ld      h,b
0de0 69        ld      l,c
0de1 cdff86    call    $86ff
0de4 e5        push    hl
0de5 210a00    ld      hl,$000a
0de8 39        add     hl,sp
0de9 5e        ld      e,(hl)
0dea 23        inc     hl
0deb 56        ld      d,(hl)
0dec d5        push    de
0ded cdb70d    call    $0db7
0df0 d1        pop     de
0df1 d1        pop     de
0df2 c36a42    jp      $426a
0df5 cd554a    call    $4a55
0df8 e5        push    hl
0df9 cd0d45    call    $450d
0dfc e3        ex      (sp),hl
0dfd cd6353    call    $5363
0e00 d1        pop     de
0e01 c9        ret     

0e02 cda98b    call    $8ba9
0e05 210200    ld      hl,$0002
0e08 e5        push    hl
0e09 cdd249    call    $49d2
0e0c e3        ex      (sp),hl
0e0d cd550e    call    $0e55
0e10 d1        pop     de
0e11 cd5e10    call    $105e
0e14 cdaa41    call    $41aa
0e17 44        ld      b,h
0e18 4d        ld      c,l
0e19 1807      jr      $0e22
0e1b 60        ld      h,b
0e1c 69        ld      l,c
0e1d cdff86    call    $86ff
0e20 44        ld      b,h
0e21 4d        ld      c,l
0e22 78        ld      a,b
0e23 b1        or      c
0e24 2829      jr      z,$0e4f
0e26 60        ld      h,b
0e27 69        ld      l,c
0e28 cdf886    call    $86f8
0e2b 229890    ld      ($9098),hl
0e2e e5        push    hl
0e2f cd0d45    call    $450d
0e32 d1        pop     de
0e33 2010      jr      nz,$0e45
0e35 2a9890    ld      hl,($9098)
0e38 e5        push    hl
0e39 2ae48f    ld      hl,($8fe4)
0e3c cdf886    call    $86f8
0e3f e5        push    hl
0e40 cdec54    call    $54ec
0e43 d1        pop     de
0e44 d1        pop     de
0e45 2a9890    ld      hl,($9098)
0e48 e5        push    hl
0e49 cd8835    call    $3588
0e4c d1        pop     de
0e4d 18cc      jr      $0e1b
0e4f cd7410    call    $1074
0e52 c3d84b    jp      $4bd8
0e55 cda98b    call    $8ba9
0e58 210800    ld      hl,$0008
0e5b 39        add     hl,sp
0e5c 4e        ld      c,(hl)
0e5d 23        inc     hl
0e5e 46        ld      b,(hl)
0e5f c5        push    bc
0e60 cdee49    call    $49ee
0e63 d1        pop     de
0e64 2803      jr      z,$0e69
0e66 c32543    jp      $4325
0e69 cde64a    call    $4ae6
0e6c cd7266    call    $6672
0e6f 60        ld      h,b
0e70 69        ld      l,c
0e71 2b        dec     hl
0e72 e5        push    hl
0e73 cd550e    call    $0e55
0e76 d1        pop     de
0e77 c36a42    jp      $426a
0e7a cda98b    call    $8ba9
0e7d cd530f    call    $0f53
0e80 44        ld      b,h
0e81 4d        ld      c,l
0e82 cdbd4a    call    $4abd
0e85 cde681    call    $81e6
0e88 229a90    ld      ($909a),hl
0e8b 50        ld      d,b
0e8c 59        ld      e,c
0e8d eb        ex      de,hl
0e8e cd6c85    call    $856c
0e91 2803      jr      z,$0e96
0e93 cd3b55    call    $553b
0e96 cd554a    call    $4a55
0e99 e5        push    hl
0e9a cd0d45    call    $450d
0e9d d1        pop     de
0e9e 282d      jr      z,$0ecd
0ea0 cdf40f    call    $0ff4
0ea3 2a7a8f    ld      hl,($8f7a)
0ea6 eb        ex      de,hl
0ea7 2a9a90    ld      hl,($909a)
0eaa cd6686    call    $8666
0ead 2803      jr      z,$0eb2
0eaf cde556    call    $56e5
0eb2 60        ld      h,b
0eb3 69        ld      l,c
0eb4 2b        dec     hl
0eb5 eb        ex      de,hl
0eb6 2a728f    ld      hl,($8f72)
0eb9 19        add     hl,de
0eba 22728f    ld      ($8f72),hl
0ebd 2a9a90    ld      hl,($909a)
0ec0 50        ld      d,b
0ec1 59        ld      e,c
0ec2 eb        ex      de,hl
0ec3 cd3086    call    $8630
0ec6 23        inc     hl
0ec7 227a8f    ld      ($8f7a),hl
0eca c3d84b    jp      $4bd8
0ecd 2af48f    ld      hl,($8ff4)
0ed0 e5        push    hl
0ed1 2a9a90    ld      hl,($909a)
0ed4 e5        push    hl
0ed5 60        ld      h,b
0ed6 69        ld      l,c
0ed7 2b        dec     hl
0ed8 e5        push    hl
0ed9 cde20e    call    $0ee2
0edc d1        pop     de
0edd d1        pop     de
0ede d1        pop     de
0edf c33743    jp      $4337
0ee2 cda98b    call    $8ba9
0ee5 210c00    ld      hl,$000c
0ee8 39        add     hl,sp
0ee9 4e        ld      c,(hl)
0eea 23        inc     hl
0eeb 46        ld      b,(hl)
0eec 210a00    ld      hl,$000a
0eef 39        add     hl,sp
0ef0 7e        ld      a,(hl)
0ef1 23        inc     hl
0ef2 b6        or      (hl)
0ef3 2003      jr      nz,$0ef8
0ef5 c32543    jp      $4325
0ef8 78        ld      a,b
0ef9 b1        or      c
0efa 2003      jr      nz,$0eff
0efc cde556    call    $56e5
0eff cd7266    call    $6672
0f02 210800    ld      hl,$0008
0f05 39        add     hl,sp
0f06 7e        ld      a,(hl)
0f07 23        inc     hl
0f08 b6        or      (hl)
0f09 2821      jr      z,$0f2c
0f0b 60        ld      h,b
0f0c 69        ld      l,c
0f0d cdff86    call    $86ff
0f10 e5        push    hl
0f11 210c00    ld      hl,$000c
0f14 39        add     hl,sp
0f15 5e        ld      e,(hl)
0f16 23        inc     hl
0f17 56        ld      d,(hl)
0f18 eb        ex      de,hl
0f19 2b        dec     hl
0f1a e5        push    hl
0f1b 210c00    ld      hl,$000c
0f1e 39        add     hl,sp
0f1f 5e        ld      e,(hl)
0f20 23        inc     hl
0f21 56        ld      d,(hl)
0f22 eb        ex      de,hl
0f23 2b        dec     hl
0f24 e5        push    hl
0f25 cde20e    call    $0ee2
0f28 d1        pop     de
0f29 d1        pop     de
0f2a d1        pop     de
0f2b c9        ret     

0f2c 60        ld      h,b
0f2d 69        ld      l,c
0f2e cdf886    call    $86f8
0f31 e5        push    hl
0f32 cd6341    call    $4163
0f35 d1        pop     de
0f36 60        ld      h,b
0f37 69        ld      l,c
0f38 cdff86    call    $86ff
0f3b e5        push    hl
0f3c 210c00    ld      hl,$000c
0f3f 39        add     hl,sp
0f40 5e        ld      e,(hl)
0f41 23        inc     hl
0f42 56        ld      d,(hl)
0f43 eb        ex      de,hl
0f44 2b        dec     hl
0f45 e5        push    hl
0f46 210000    ld      hl,$0000
0f49 e5        push    hl
0f4a cde20e    call    $0ee2
0f4d d1        pop     de
0f4e d1        pop     de
0f4f d1        pop     de
0f50 c36a42    jp      $426a
0f53 cda98b    call    $8ba9
0f56 cdbd4a    call    $4abd
0f59 cde681    call    $81e6
0f5c 44        ld      b,h
0f5d 4d        ld      c,l
0f5e 110000    ld      de,$0000
0f61 eb        ex      de,hl
0f62 cd6d85    call    $856d
0f65 2803      jr      z,$0f6a
0f67 60        ld      h,b
0f68 69        ld      l,c
0f69 c9        ret     

0f6a c33b55    jp      $553b
0f6d 2a9c8f    ld      hl,($8f9c)
0f70 e5        push    hl
0f71 cda64b    call    $4ba6
0f74 d1        pop     de
0f75 c9        ret     

0f76 21d284    ld      hl,$84d2
0f79 e5        push    hl
0f7a cd8c0f    call    $0f8c
0f7d d1        pop     de
0f7e c3d84b    jp      $4bd8
0f81 21e784    ld      hl,$84e7
0f84 e5        push    hl
0f85 cd8c0f    call    $0f8c
0f88 d1        pop     de
0f89 c3d84b    jp      $4bd8
0f8c cda98b    call    $8ba9
0f8f cdc94a    call    $4ac9
0f92 cd0110    call    $1001
0f95 2a728f    ld      hl,($8f72)
0f98 44        ld      b,h
0f99 4d        ld      c,l
0f9a 1803      jr      $0f9f
0f9c 03        inc     bc
0f9d 60        ld      h,b
0f9e 69        ld      l,c
0f9f 2a728f    ld      hl,($8f72)
0fa2 eb        ex      de,hl
0fa3 2a7a8f    ld      hl,($8f7a)
0fa6 19        add     hl,de
0fa7 e5        push    hl
0fa8 60        ld      h,b
0fa9 69        ld      l,c
0faa d1        pop     de
0fab eb        ex      de,hl
0fac cd6686    call    $8666
0faf 2818      jr      z,$0fc9
0fb1 60        ld      h,b
0fb2 69        ld      l,c
0fb3 5e        ld      e,(hl)
0fb4 1600      ld      d,$00
0fb6 d5        push    de
0fb7 210a00    ld      hl,$000a
0fba 39        add     hl,sp
0fbb 5e        ld      e,(hl)
0fbc 23        inc     hl
0fbd 56        ld      d,(hl)
0fbe eb        ex      de,hl
0fbf cd0485    call    $8504
0fc2 d1        pop     de
0fc3 eb        ex      de,hl
0fc4 60        ld      h,b
0fc5 69        ld      l,c
0fc6 73        ld      (hl),e
0fc7 18d3      jr      $0f9c
0fc9 c37410    jp      $1074
0fcc cda98b    call    $8ba9
0fcf 2af48f    ld      hl,($8ff4)
0fd2 7c        ld      a,h
0fd3 b5        or      l
0fd4 2003      jr      nz,$0fd9
0fd6 cd3b55    call    $553b
0fd9 cdf40f    call    $0ff4
0fdc 2a7a8f    ld      hl,($8f7a)
0fdf 2b        dec     hl
0fe0 227a8f    ld      ($8f7a),hl
0fe3 210800    ld      hl,$0008
0fe6 39        add     hl,sp
0fe7 5e        ld      e,(hl)
0fe8 23        inc     hl
0fe9 56        ld      d,(hl)
0fea 2a728f    ld      hl,($8f72)
0fed 19        add     hl,de
0fee 22728f    ld      ($8f72),hl
0ff1 c3d84b    jp      $4bd8
0ff4 cd0110    call    $1001
0ff7 2a7a8f    ld      hl,($8f7a)
0ffa 7c        ld      a,h
0ffb b5        or      l
0ffc c0        ret     nz

0ffd cd3b55    call    $553b
1000 c9        ret     

1001 cd5e10    call    $105e
1004 2af48f    ld      hl,($8ff4)
1007 e5        push    hl
1008 cd8835    call    $3588
100b d1        pop     de
100c c37410    jp      $1074
100f cda98b    call    $8ba9
1012 210800    ld      hl,$0008
1015 39        add     hl,sp
1016 4e        ld      c,(hl)
1017 23        inc     hl
1018 46        ld      b,(hl)
1019 60        ld      h,b
101a 69        ld      l,c
101b cdff86    call    $86ff
101e cdf886    call    $86f8
1021 44        ld      b,h
1022 4d        ld      c,l
1023 c5        push    bc
1024 cd212e    call    $2e21
1027 e3        ex      (sp),hl
1028 60        ld      h,b
1029 69        ld      l,c
102a cdf886    call    $86f8
102d d1        pop     de
102e 19        add     hl,de
102f 5e        ld      e,(hl)
1030 1600      ld      d,$00
1032 d5        push    de
1033 21e68d    ld      hl,$8de6
1036 22728f    ld      ($8f72),hl
1039 d1        pop     de
103a 73        ld      (hl),e
103b c9        ret     

103c 2af48f    ld      hl,($8ff4)
103f e5        push    hl
1040 cd2545    call    $4525
1043 d1        pop     de
1044 2805      jr      z,$104b
1046 cdf40f    call    $0ff4
1049 1812      jr      $105d
104b 2af48f    ld      hl,($8ff4)
104e e5        push    hl
104f cd0f10    call    $100f
1052 d1        pop     de
1053 2a728f    ld      hl,($8f72)
1056 7e        ld      a,(hl)
1057 b7        or      a
1058 2003      jr      nz,$105d
105a cd3b55    call    $553b
105d c9        ret     

105e 210000    ld      hl,$0000
1061 227a8f    ld      ($8f7a),hl
1064 e5        push    hl
1065 21e68d    ld      hl,$8de6
1068 22728f    ld      ($8f72),hl
106b d1        pop     de
106c 73        ld      (hl),e
106d 210100    ld      hl,$0001
1070 226c8e    ld      ($8e6c),hl
1073 c9        ret     

1074 21e68d    ld      hl,$8de6
1077 22728f    ld      ($8f72),hl
107a 210000    ld      hl,$0000
107d 226c8e    ld      ($8e6c),hl
1080 c9        ret     

1081 2a728f    ld      hl,($8f72)
1084 23        inc     hl
1085 22728f    ld      ($8f72),hl
1088 c9        ret     

1089 2a728f    ld      hl,($8f72)
108c 5e        ld      e,(hl)
108d 1600      ld      d,$00
108f d5        push    de
1090 cd932a    call    $2a93
1093 d1        pop     de
1094 c8        ret     z

1095 210600    ld      hl,$0006
1098 227c8f    ld      ($8f7c),hl
109b cd8110    call    $1081
109e 18e9      jr      $1089
10a0 c9        ret     

10a1 cda98b    call    $8ba9
10a4 cd5e10    call    $105e
10a7 210800    ld      hl,$0008
10aa 39        add     hl,sp
10ab 5e        ld      e,(hl)
10ac 23        inc     hl
10ad 56        ld      d,(hl)
10ae d5        push    de
10af cd8835    call    $3588
10b2 d1        pop     de
10b3 cd7410    call    $1074
10b6 210000    ld      hl,$0000
10b9 227c8f    ld      ($8f7c),hl
10bc 2a7a8f    ld      hl,($8f7a)
10bf 7c        ld      a,h
10c0 b5        or      l
10c1 2004      jr      nz,$10c7
10c3 210000    ld      hl,$0000
10c6 c9        ret     

10c7 2a728f    ld      hl,($8f72)
10ca 5e        ld      e,(hl)
10cb 1600      ld      d,$00
10cd 212d00    ld      hl,$002d
10d0 cd3c85    call    $853c
10d3 2803      jr      z,$10d8
10d5 cd8110    call    $1081
10d8 cd8910    call    $1089
10db 2a728f    ld      hl,($8f72)
10de 5e        ld      e,(hl)
10df 1600      ld      d,$00
10e1 212e00    ld      hl,$002e
10e4 cd3c85    call    $853c
10e7 2806      jr      z,$10ef
10e9 cd8110    call    $1081
10ec cd8910    call    $1089
10ef 2a7c8f    ld      hl,($8f7c)
10f2 7c        ld      a,h
10f3 b5        or      l
10f4 2004      jr      nz,$10fa
10f6 210000    ld      hl,$0000
10f9 c9        ret     

10fa 2a728f    ld      hl,($8f72)
10fd 5e        ld      e,(hl)
10fe 1600      ld      d,$00
1100 d5        push    de
1101 cdd284    call    $84d2
1104 d1        pop     de
1105 114500    ld      de,$0045
1108 cd3c85    call    $853c
110b 2825      jr      z,$1132
110d cd8110    call    $1081
1110 2a728f    ld      hl,($8f72)
1113 5e        ld      e,(hl)
1114 1600      ld      d,$00
1116 212b00    ld      hl,$002b
1119 cd3c85    call    $853c
111c 200e      jr      nz,$112c
111e 2a728f    ld      hl,($8f72)
1121 5e        ld      e,(hl)
1122 1600      ld      d,$00
1124 212d00    ld      hl,$002d
1127 cd3c85    call    $853c
112a 2803      jr      z,$112f
112c cd8110    call    $1081
112f cd8910    call    $1089
1132 2a7c8f    ld      hl,($8f7c)
1135 7c        ld      a,h
1136 b5        or      l
1137 2004      jr      nz,$113d
1139 210000    ld      hl,$0000
113c c9        ret     

113d 2a728f    ld      hl,($8f72)
1140 7e        ld      a,(hl)
1141 b7        or      a
1142 2804      jr      z,$1148
1144 210000    ld      hl,$0000
1147 c9        ret     

1148 217e8f    ld      hl,$8f7e
114b e5        push    hl
114c 21e68d    ld      hl,$8de6
114f e5        push    hl
1150 cd0787    call    $8707
1153 d1        pop     de
1154 e1        pop     hl
1155 cd857c    call    $7c85
1158 210100    ld      hl,$0001
115b c9        ret     

115c cda98b    call    $8ba9
115f cdc84c    call    $4cc8
1162 21798c    ld      hl,$8c79
1165 e5        push    hl
1166 cd017c    call    $7c01
1169 d1        pop     de
116a 2803      jr      z,$116f
116c c3e601    jp      $01e6
116f 210000    ld      hl,$0000
1172 e5        push    hl
1173 cddc28    call    $28dc
1176 d1        pop     de
1177 21da8c    ld      hl,$8cda
117a 22728f    ld      ($8f72),hl
117d e5        push    hl
117e cdad7b    call    $7bad
1181 d1        pop     de
1182 227a8f    ld      ($8f7a),hl
1185 c3d84b    jp      $4bd8
1188 cda98b    call    $8ba9
118b cdc84c    call    $4cc8
118e 21798c    ld      hl,$8c79
1191 e5        push    hl
1192 cd017c    call    $7c01
1195 d1        pop     de
1196 2803      jr      z,$119b
1198 c3e601    jp      $01e6
119b cd216a    call    $6a21
119e 21788f    ld      hl,$8f78
11a1 22728f    ld      ($8f72),hl
11a4 cdcf4b    call    $4bcf
11a7 c38069    jp      $6980
11aa cda98b    call    $8ba9
11ad cdc84c    call    $4cc8
11b0 21798c    ld      hl,$8c79
11b3 e5        push    hl
11b4 cd017c    call    $7c01
11b7 d1        pop     de
11b8 2803      jr      z,$11bd
11ba c3e601    jp      $01e6
11bd 210000    ld      hl,$0000
11c0 e5        push    hl
11c1 cddc28    call    $28dc
11c4 d1        pop     de
11c5 cd7c32    call    $327c
11c8 c33743    jp      $4337
11cb cd324a    call    $4a32
11ce c3d111    jp      $11d1
11d1 2af48f    ld      hl,($8ff4)
11d4 e5        push    hl
11d5 cd3936    call    $3639
11d8 d1        pop     de
11d9 cdab66    call    $66ab
11dc c37c4b    jp      $4b7c
11df cdef4a    call    $4aef
11e2 214212    ld      hl,$1242
11e5 e5        push    hl
11e6 cd8d41    call    $418d
11e9 e5        push    hl
11ea cdfa4b    call    $4bfa
11ed d1        pop     de
11ee d1        pop     de
11ef 2808      jr      z,$11f9
11f1 2ade8f    ld      hl,($8fde)
11f4 e5        push    hl
11f5 cdc941    call    $41c9
11f8 d1        pop     de
11f9 cd5f4a    call    $4a5f
11fc cd1a12    call    $121a
11ff cd0812    call    $1208
1202 cd7c4b    call    $4b7c
1205 c32d12    jp      $122d
1208 cda98b    call    $8ba9
120b 21698c    ld      hl,$8c69
120e e5        push    hl
120f cd017c    call    $7c01
1212 d1        pop     de
1213 c0        ret     nz

1214 cd8443    call    $4384
1217 c3bf50    jp      $50bf
121a cdb549    call    $49b5
121d 210200    ld      hl,$0002
1220 e5        push    hl
1221 cdde41    call    $41de
1224 2ac08f    ld      hl,($8fc0)
1227 e3        ex      (sp),hl
1228 cd6341    call    $4163
122b d1        pop     de
122c c9        ret     

122d 2ac08f    ld      hl,($8fc0)
1230 e5        push    hl
1231 cd455a    call    $5a45
1234 210300    ld      hl,$0003
1237 e3        ex      (sp),hl
1238 cdf441    call    $41f4
123b d1        pop     de
123c cdc549    call    $49c5
123f c39641    jp      $4196
1242 2ae28f    ld      hl,($8fe2)
1245 22f48f    ld      ($8ff4),hl
1248 210000    ld      hl,$0000
124b 22e28f    ld      ($8fe2),hl
124e c9        ret     

124f cdc94a    call    $4ac9
1252 2af48f    ld      hl,($8ff4)
1255 e5        push    hl
1256 cdc55a    call    $5ac5
1259 d1        pop     de
125a 281c      jr      z,$1278
125c 210000    ld      hl,$0000
125f 22ee8f    ld      ($8fee),hl
1262 22ec8f    ld      ($8fec),hl
1265 cd7c4b    call    $4b7c
1268 cdaf43    call    $43af
126b 210100    ld      hl,$0001
126e e5        push    hl
126f 21698c    ld      hl,$8c69
1272 e5        push    hl
1273 cd167c    call    $7c16
1276 d1        pop     de
1277 d1        pop     de
1278 cd3141    call    $4131
127b 2005      jr      nz,$1282
127d cd3741    call    $4137
1280 18d0      jr      $1252
1282 2af48f    ld      hl,($8ff4)
1285 eb        ex      de,hl
1286 2ad48f    ld      hl,($8fd4)
1289 cd3c85    call    $853c
128c 280d      jr      z,$129b
128e 210100    ld      hl,$0001
1291 e5        push    hl
1292 216d8c    ld      hl,$8c6d
1295 e5        push    hl
1296 cd167c    call    $7c16
1299 d1        pop     de
129a d1        pop     de
129b c36b58    jp      $586b
129e cd0b52    call    $520b
12a1 c37c4b    jp      $4b7c
12a4 cdc94a    call    $4ac9
12a7 cd1f13    call    $131f
12aa cd3141    call    $4131
12ad 206d      jr      nz,$131c
12af 2abc8f    ld      hl,($8fbc)
12b2 e5        push    hl
12b3 210500    ld      hl,$0005
12b6 e5        push    hl
12b7 cd0a42    call    $420a
12ba e3        ex      (sp),hl
12bb cd3447    call    $4734
12be d1        pop     de
12bf d1        pop     de
12c0 22ec8f    ld      ($8fec),hl
12c3 7c        ld      a,h
12c4 b5        or      l
12c5 2855      jr      z,$131c
12c7 2aec8f    ld      hl,($8fec)
12ca cdff86    call    $86ff
12cd 22ec8f    ld      ($8fec),hl
12d0 1809      jr      $12db
12d2 2aec8f    ld      hl,($8fec)
12d5 cdff86    call    $86ff
12d8 22ec8f    ld      ($8fec),hl
12db 2aec8f    ld      hl,($8fec)
12de 7c        ld      a,h
12df b5        or      l
12e0 283a      jr      z,$131c
12e2 2aec8f    ld      hl,($8fec)
12e5 cdf886    call    $86f8
12e8 22ee8f    ld      ($8fee),hl
12eb cda04b    call    $4ba0
12ee 202a      jr      nz,$131a
12f0 210000    ld      hl,$0000
12f3 22e08f    ld      ($8fe0),hl
12f6 cd3413    call    $1334
12f9 2ae08f    ld      hl,($8fe0)
12fc eb        ex      de,hl
12fd 2af48f    ld      hl,($8ff4)
1300 cd3c85    call    $853c
1303 2813      jr      z,$1318
1305 cd7c4b    call    $4b7c
1308 cdaf43    call    $43af
130b 210000    ld      hl,$0000
130e e5        push    hl
130f 21698c    ld      hl,$8c69
1312 e5        push    hl
1313 cd167c    call    $7c16
1316 d1        pop     de
1317 d1        pop     de
1318 18d1      jr      $12eb
131a 18b6      jr      $12d2
131c c39758    jp      $5897
131f cd3141    call    $4131
1322 c0        ret     nz

1323 cd8d41    call    $418d
1326 eb        ex      de,hl
1327 2abe8f    ld      hl,($8fbe)
132a cd3c85    call    $853c
132d c0        ret     nz

132e cd3741    call    $4137
1331 18ec      jr      $131f
1333 c9        ret     

1334 219e12    ld      hl,$129e
1337 e5        push    hl
1338 2aee8f    ld      hl,($8fee)
133b cdf886    call    $86f8
133e e5        push    hl
133f cdfa4b    call    $4bfa
1342 d1        pop     de
1343 d1        pop     de
1344 2847      jr      z,$138d
1346 cd1d51    call    $511d
1349 cda04b    call    $4ba0
134c c0        ret     nz

134d 2aee8f    ld      hl,($8fee)
1350 cdf886    call    $86f8
1353 e5        push    hl
1354 cd5646    call    $4656
1357 d1        pop     de
1358 2831      jr      z,$138b
135a cd5e10    call    $105e
135d 2aee8f    ld      hl,($8fee)
1360 cdf886    call    $86f8
1363 e5        push    hl
1364 cd8835    call    $3588
1367 d1        pop     de
1368 cd7410    call    $1074
136b 2a7a8f    ld      hl,($8f7a)
136e 7c        ld      a,h
136f b5        or      l
1370 2819      jr      z,$138b
1372 cdcd28    call    $28cd
1375 2ae68d    ld      hl,($8de6)
1378 2600      ld      h,$00
137a 112200    ld      de,$0022
137d cd3c85    call    $853c
1380 2809      jr      z,$138b
1382 cdf231    call    $31f2
1385 cdaa41    call    $41aa
1388 22e08f    ld      ($8fe0),hl
138b 1823      jr      $13b0
138d 2aee8f    ld      hl,($8fee)
1390 cdf886    call    $86f8
1393 eb        ex      de,hl
1394 2ada8f    ld      hl,($8fda)
1397 cd3c85    call    $853c
139a 2814      jr      z,$13b0
139c cd1d51    call    $511d
139f cda04b    call    $4ba0
13a2 c0        ret     nz

13a3 cd3413    call    $1334
13a6 cd904b    call    $4b90
13a9 2005      jr      nz,$13b0
13ab cd1d51    call    $511d
13ae 18f6      jr      $13a6
13b0 c31d51    jp      $511d
13b3 2aa98c    ld      hl,($8ca9)
13b6 e5        push    hl
13b7 cd5630    call    $3056
13ba d1        pop     de
13bb c33743    jp      $4337
13be cd2543    call    $4325
13c1 cd1c3b    call    $3b1c
13c4 cd2f3b    call    $3b2f
13c7 2813      jr      z,$13dc
13c9 cd8d41    call    $418d
13cc e5        push    hl
13cd 2aad8c    ld      hl,($8cad)
13d0 e5        push    hl
13d1 cd7d45    call    $457d
13d4 d1        pop     de
13d5 e3        ex      (sp),hl
13d6 cdc941    call    $41c9
13d9 d1        pop     de
13da 18e8      jr      $13c4
13dc c33743    jp      $4337
13df 210100    ld      hl,$0001
13e2 22a18c    ld      ($8ca1),hl
13e5 c3763c    jp      $3c76
13e8 210000    ld      hl,$0000
13eb 22a18c    ld      ($8ca1),hl
13ee c37d3c    jp      $3c7d
13f1 2af48f    ld      hl,($8ff4)
13f4 e5        push    hl
13f5 2ab28f    ld      hl,($8fb2)
13f8 e5        push    hl
13f9 cd4649    call    $4946
13fc d1        pop     de
13fd d1        pop     de
13fe 22b28f    ld      ($8fb2),hl
1401 c9        ret     

1402 2ab28f    ld      hl,($8fb2)
1405 e5        push    hl
1406 2af48f    ld      hl,($8ff4)
1409 e5        push    hl
140a cd7d45    call    $457d
140d d1        pop     de
140e d1        pop     de
140f 22b28f    ld      ($8fb2),hl
1412 c9        ret     

1413 cd904b    call    $4b90
1416 280a      jr      z,$1422
1418 2ab48f    ld      hl,($8fb4)
141b e5        push    hl
141c cd6341    call    $4163
141f d1        pop     de
1420 1803      jr      $1425
1422 cd6219    call    $1962
1425 21f113    ld      hl,$13f1
1428 e5        push    hl
1429 cd5914    call    $1459
142c d1        pop     de
142d 210214    ld      hl,$1402
1430 e5        push    hl
1431 cd5914    call    $1459
1434 d1        pop     de
1435 cd9641    call    $4196
1438 c37c4b    jp      $4b7c
143b cd904b    call    $4b90
143e 2808      jr      z,$1448
1440 210000    ld      hl,$0000
1443 22b28f    ld      ($8fb2),hl
1446 180e      jr      $1456
1448 cd6219    call    $1962
144b 21f113    ld      hl,$13f1
144e e5        push    hl
144f cd5914    call    $1459
1452 d1        pop     de
1453 cd9641    call    $4196
1456 c37c4b    jp      $4b7c
1459 cda98b    call    $8ba9
145c cd8d41    call    $418d
145f 44        ld      b,h
1460 4d        ld      c,l
1461 1807      jr      $146a
1463 60        ld      h,b
1464 69        ld      l,c
1465 cdff86    call    $86ff
1468 44        ld      b,h
1469 4d        ld      c,l
146a 78        ld      a,b
146b b1        or      c
146c c8        ret     z

146d 60        ld      h,b
146e 69        ld      l,c
146f cdf886    call    $86f8
1472 22f48f    ld      ($8ff4),hl
1475 210800    ld      hl,$0008
1478 39        add     hl,sp
1479 5e        ld      e,(hl)
147a 23        inc     hl
147b 56        ld      d,(hl)
147c eb        ex      de,hl
147d cd0485    call    $8504
1480 18e1      jr      $1463
1482 c9        ret     

1483 cdef4a    call    $4aef
1486 cd324a    call    $4a32
1489 cd8d41    call    $418d
148c e5        push    hl
148d 2af48f    ld      hl,($8ff4)
1490 e5        push    hl
1491 cd0f15    call    $150f
1494 d1        pop     de
1495 d1        pop     de
1496 c39641    jp      $4196
1499 210100    ld      hl,$0001
149c e5        push    hl
149d cdd249    call    $49d2
14a0 e3        ex      (sp),hl
14a1 cda614    call    $14a6
14a4 d1        pop     de
14a5 c9        ret     

14a6 cda98b    call    $8ba9
14a9 210800    ld      hl,$0008
14ac 39        add     hl,sp
14ad 4e        ld      c,(hl)
14ae 23        inc     hl
14af 46        ld      b,(hl)
14b0 c5        push    bc
14b1 cdee49    call    $49ee
14b4 d1        pop     de
14b5 2803      jr      z,$14ba
14b7 c37c4b    jp      $4b7c
14ba cdc94a    call    $4ac9
14bd 210000    ld      hl,$0000
14c0 e5        push    hl
14c1 2af48f    ld      hl,($8ff4)
14c4 e5        push    hl
14c5 cd8116    call    $1681
14c8 d1        pop     de
14c9 d1        pop     de
14ca cd7266    call    $6672
14cd 60        ld      h,b
14ce 69        ld      l,c
14cf 2b        dec     hl
14d0 e5        push    hl
14d1 cda614    call    $14a6
14d4 d1        pop     de
14d5 c9        ret     

14d6 cdc94a    call    $4ac9
14d9 2af48f    ld      hl,($8ff4)
14dc e5        push    hl
14dd cdaf16    call    $16af
14e0 d1        pop     de
14e1 200f      jr      nz,$14f2
14e3 2ac48f    ld      hl,($8fc4)
14e6 e5        push    hl
14e7 2af48f    ld      hl,($8ff4)
14ea e5        push    hl
14eb cd0147    call    $4701
14ee d1        pop     de
14ef d1        pop     de
14f0 2805      jr      z,$14f7
14f2 210000    ld      hl,$0000
14f5 1803      jr      $14fa
14f7 210100    ld      hl,$0001
14fa cdf685    call    $85f6
14fd e5        push    hl
14fe cd6353    call    $5363
1501 d1        pop     de
1502 c9        ret     

1503 cdc94a    call    $4ac9
1506 2af48f    ld      hl,($8ff4)
1509 e5        push    hl
150a cd6e51    call    $516e
150d d1        pop     de
150e c9        ret     

150f cda98b    call    $8ba9
1512 210800    ld      hl,$0008
1515 39        add     hl,sp
1516 4e        ld      c,(hl)
1517 23        inc     hl
1518 46        ld      b,(hl)
1519 210a00    ld      hl,$000a
151c 39        add     hl,sp
151d 5e        ld      e,(hl)
151e 23        inc     hl
151f 56        ld      d,(hl)
1520 eb        ex      de,hl
1521 229e90    ld      ($909e),hl
1524 e5        push    hl
1525 cdaf16    call    $16af
1528 d1        pop     de
1529 229c90    ld      ($909c),hl
152c 7c        ld      a,h
152d b5        or      l
152e 2023      jr      nz,$1553
1530 c5        push    bc
1531 cd6341    call    $4163
1534 2a9e90    ld      hl,($909e)
1537 e3        ex      (sp),hl
1538 cd6341    call    $4163
153b d1        pop     de
153c c5        push    bc
153d 2ac48f    ld      hl,($8fc4)
1540 e5        push    hl
1541 2a9e90    ld      hl,($909e)
1544 e5        push    hl
1545 cd5c47    call    $475c
1548 d1        pop     de
1549 d1        pop     de
154a d1        pop     de
154b cd9641    call    $4196
154e cd9641    call    $4196
1551 180a      jr      $155d
1553 c5        push    bc
1554 2a9c90    ld      hl,($909c)
1557 e5        push    hl
1558 cd9844    call    $4498
155b d1        pop     de
155c d1        pop     de
155d 2aa18c    ld      hl,($8ca1)
1560 7c        ld      a,h
1561 b5        or      l
1562 281d      jr      z,$1581
1564 cd8c53    call    $538c
1567 218415    ld      hl,$1584
156a e5        push    hl
156b cd1c67    call    $671c
156e 2a9e90    ld      hl,($909e)
1571 e3        ex      (sp),hl
1572 cd3135    call    $3531
1575 d1        pop     de
1576 cdd76b    call    $6bd7
1579 c5        push    bc
157a cd3936    call    $3639
157d d1        pop     de
157e cdab66    call    $66ab
1581 c37c4b    jp      $4b7c
1584 6d        ld      l,l
1585 61        ld      h,c
1586 6b        ld      l,e
1587 69        ld      l,c
1588 6e        ld      l,(hl)
1589 67        ld      h,a
158a 2022      jr      nz,$15ae
158c 00        nop     
158d cdef4a    call    $4aef
1590 cdc94a    call    $4ac9
1593 2af48f    ld      hl,($8ff4)
1596 e5        push    hl
1597 cdaa41    call    $41aa
159a e5        push    hl
159b cd3447    call    $4734
159e d1        pop     de
159f d1        pop     de
15a0 22f48f    ld      ($8ff4),hl
15a3 c9        ret     

15a4 cdc94a    call    $4ac9
15a7 2af48f    ld      hl,($8ff4)
15aa e5        push    hl
15ab cd5648    call    $4856
15ae d1        pop     de
15af 22f48f    ld      ($8ff4),hl
15b2 c9        ret     

15b3 cdef4a    call    $4aef
15b6 cdef4a    call    $4aef
15b9 cd554a    call    $4a55
15bc e5        push    hl
15bd cd8d41    call    $418d
15c0 e5        push    hl
15c1 210100    ld      hl,$0001
15c4 e5        push    hl
15c5 cd0a42    call    $420a
15c8 e3        ex      (sp),hl
15c9 cd5c47    call    $475c
15cc d1        pop     de
15cd d1        pop     de
15ce d1        pop     de
15cf cd9641    call    $4196
15d2 cd9641    call    $4196
15d5 c37c4b    jp      $4b7c
15d8 cda98b    call    $8ba9
15db cd2543    call    $4325
15de cd2543    call    $4325
15e1 210100    ld      hl,$0001
15e4 e5        push    hl
15e5 cdf53a    call    $3af5
15e8 d1        pop     de
15e9 cd8d41    call    $418d
15ec 44        ld      b,h
15ed 4d        ld      c,l
15ee 180c      jr      $15fc
15f0 60        ld      h,b
15f1 69        ld      l,c
15f2 cdff86    call    $86ff
15f5 44        ld      b,h
15f6 4d        ld      c,l
15f7 e5        push    hl
15f8 cdc941    call    $41c9
15fb d1        pop     de
15fc 78        ld      a,b
15fd b1        or      c
15fe 2841      jr      z,$1641
1600 60        ld      h,b
1601 69        ld      l,c
1602 cdf886    call    $86f8
1605 e5        push    hl
1606 cdd33b    call    $3bd3
1609 d1        pop     de
160a cde63b    call    $3be6
160d 2830      jr      z,$163f
160f cd183c    call    $3c18
1612 20f6      jr      nz,$160a
1614 cdab66    call    $66ab
1617 60        ld      h,b
1618 69        ld      l,c
1619 cdf886    call    $86f8
161c e5        push    hl
161d cd8835    call    $3588
1620 214716    ld      hl,$1647
1623 e3        ex      (sp),hl
1624 cd0967    call    $6709
1627 2ab38c    ld      hl,($8cb3)
162a e3        ex      (sp),hl
162b cd3936    call    $3639
162e 214b16    ld      hl,$164b
1631 e3        ex      (sp),hl
1632 cd0967    call    $6709
1635 2ab58c    ld      hl,($8cb5)
1638 e3        ex      (sp),hl
1639 cd3936    call    $3639
163c d1        pop     de
163d 18cb      jr      $160a
163f 18af      jr      $15f0
1641 cd7c4b    call    $4b7c
1644 c39641    jp      $4196
1647 27        daa     
1648 73        ld      (hl),e
1649 2000      jr      nz,$164b
164b 2069      jr      nz,$16b6
164d 73        ld      (hl),e
164e 2000      jr      nz,$1650
1650 cdef4a    call    $4aef
1653 cdc94a    call    $4ac9
1656 2af48f    ld      hl,($8ff4)
1659 e5        push    hl
165a cdaa41    call    $41aa
165d e5        push    hl
165e cdf347    call    $47f3
1661 d1        pop     de
1662 d1        pop     de
1663 c37c4b    jp      $4b7c
1666 cdef4a    call    $4aef
1669 cd2543    call    $4325
166c cd2543    call    $4325
166f 210200    ld      hl,$0002
1672 e5        push    hl
1673 cd0a42    call    $420a
1676 e3        ex      (sp),hl
1677 cdf53a    call    $3af5
167a d1        pop     de
167b cd3743    call    $4337
167e c39641    jp      $4196
1681 cda98b    call    $8ba9
1684 210a00    ld      hl,$000a
1687 39        add     hl,sp
1688 5e        ld      e,(hl)
1689 23        inc     hl
168a 56        ld      d,(hl)
168b d5        push    de
168c 210a00    ld      hl,$000a
168f 39        add     hl,sp
1690 5e        ld      e,(hl)
1691 23        inc     hl
1692 56        ld      d,(hl)
1693 d5        push    de
1694 cd7d45    call    $457d
1697 d1        pop     de
1698 e3        ex      (sp),hl
1699 cd6341    call    $4163
169c 2aea8f    ld      hl,($8fea)
169f e3        ex      (sp),hl
16a0 cd8d41    call    $418d
16a3 e5        push    hl
16a4 cd7d45    call    $457d
16a7 d1        pop     de
16a8 d1        pop     de
16a9 22ea8f    ld      ($8fea),hl
16ac c39641    jp      $4196
16af cda98b    call    $8ba9
16b2 2aea8f    ld      hl,($8fea)
16b5 44        ld      b,h
16b6 4d        ld      c,l
16b7 1807      jr      $16c0
16b9 60        ld      h,b
16ba 69        ld      l,c
16bb cdff86    call    $86ff
16be 44        ld      b,h
16bf 4d        ld      c,l
16c0 78        ld      a,b
16c1 b1        or      c
16c2 281d      jr      z,$16e1
16c4 60        ld      h,b
16c5 69        ld      l,c
16c6 cdf886    call    $86f8
16c9 cdf886    call    $86f8
16cc eb        ex      de,hl
16cd 210800    ld      hl,$0008
16d0 39        add     hl,sp
16d1 7e        ld      a,(hl)
16d2 23        inc     hl
16d3 66        ld      h,(hl)
16d4 6f        ld      l,a
16d5 cd3c85    call    $853c
16d8 2805      jr      z,$16df
16da 60        ld      h,b
16db 69        ld      l,c
16dc c3f886    jp      $86f8
16df 18d8      jr      $16b9
16e1 210000    ld      hl,$0000
16e4 c9        ret     

16e5 210200    ld      hl,$0002
16e8 e5        push    hl
16e9 cdde41    call    $41de
16ec 2ac68f    ld      hl,($8fc6)
16ef e3        ex      (sp),hl
16f0 cdf53a    call    $3af5
16f3 2ac68f    ld      hl,($8fc6)
16f6 e3        ex      (sp),hl
16f7 cd8537    call    $3785
16fa d1        pop     de
16fb c9        ret     

16fc cdd84a    call    $4ad8
16ff cd554a    call    $4a55
1702 e5        push    hl
1703 cdd944    call    $44d9
1706 d1        pop     de
1707 2803      jr      z,$170c
1709 cd3b55    call    $553b
170c 2af48f    ld      hl,($8ff4)
170f cdf886    call    $86f8
1712 e5        push    hl
1713 cd3d17    call    $173d
1716 d1        pop     de
1717 2af48f    ld      hl,($8ff4)
171a cdff86    call    $86ff
171d e5        push    hl
171e cd6a17    call    $176a
1721 d1        pop     de
1722 cd6e4b    call    $4b6e
1725 2af48f    ld      hl,($8ff4)
1728 e5        push    hl
1729 2abc8f    ld      hl,($8fbc)
172c e5        push    hl
172d cd8d41    call    $418d
1730 e5        push    hl
1731 cd5c47    call    $475c
1734 d1        pop     de
1735 d1        pop     de
1736 d1        pop     de
1737 cd9641    call    $4196
173a c37c4b    jp      $4b7c
173d cda98b    call    $8ba9
1740 210800    ld      hl,$0008
1743 39        add     hl,sp
1744 4e        ld      c,(hl)
1745 23        inc     hl
1746 46        ld      b,(hl)
1747 c5        push    bc
1748 cd0d45    call    $450d
174b d1        pop     de
174c 2803      jr      z,$1751
174e cd3b55    call    $553b
1751 1807      jr      $175a
1753 60        ld      h,b
1754 69        ld      l,c
1755 cdff86    call    $86ff
1758 44        ld      b,h
1759 4d        ld      c,l
175a 78        ld      a,b
175b b1        or      c
175c c8        ret     z

175d 60        ld      h,b
175e 69        ld      l,c
175f cdf886    call    $86f8
1762 e5        push    hl
1763 cdec4c    call    $4cec
1766 d1        pop     de
1767 18ea      jr      $1753
1769 c9        ret     

176a cda98b    call    $8ba9
176d 210800    ld      hl,$0008
1770 39        add     hl,sp
1771 4e        ld      c,(hl)
1772 23        inc     hl
1773 46        ld      b,(hl)
1774 1807      jr      $177d
1776 60        ld      h,b
1777 69        ld      l,c
1778 cdff86    call    $86ff
177b 44        ld      b,h
177c 4d        ld      c,l
177d 78        ld      a,b
177e b1        or      c
177f c8        ret     z

1780 60        ld      h,b
1781 69        ld      l,c
1782 cdf886    call    $86f8
1785 e5        push    hl
1786 cdd944    call    $44d9
1789 d1        pop     de
178a 2803      jr      z,$178f
178c cd3b55    call    $553b
178f 18e5      jr      $1776
1791 c9        ret     

1792 cdc94a    call    $4ac9
1795 2abc8f    ld      hl,($8fbc)
1798 e5        push    hl
1799 2af48f    ld      hl,($8ff4)
179c e5        push    hl
179d cd3447    call    $4734
17a0 d1        pop     de
17a1 d1        pop     de
17a2 22f48f    ld      ($8ff4),hl
17a5 c9        ret     

17a6 cd2543    call    $4325
17a9 cd1c43    call    $431c
17ac cd3538    call    $3835
17af cdb337    call    $37b3
17b2 210100    ld      hl,$0001
17b5 e5        push    hl
17b6 cdaa41    call    $41aa
17b9 e5        push    hl
17ba cdb538    call    $38b5
17bd d1        pop     de
17be d1        pop     de
17bf cdfc37    call    $37fc
17c2 210200    ld      hl,$0002
17c5 e5        push    hl
17c6 cdaa41    call    $41aa
17c9 e5        push    hl
17ca cdb538    call    $38b5
17cd d1        pop     de
17ce d1        pop     de
17cf cd6438    call    $3864
17d2 c30838    jp      $3808
17d5 cda98b    call    $8ba9
17d8 cd904b    call    $4b90
17db 2834      jr      z,$1811
17dd 2ab78c    ld      hl,($8cb7)
17e0 7c        ld      a,h
17e1 b5        or      l
17e2 2819      jr      z,$17fd
17e4 210100    ld      hl,$0001
17e7 e5        push    hl
17e8 2ab78c    ld      hl,($8cb7)
17eb e5        push    hl
17ec cd2c46    call    $462c
17ef e3        ex      (sp),hl
17f0 cd9738    call    $3897
17f3 d1        pop     de
17f4 d1        pop     de
17f5 210000    ld      hl,$0000
17f8 22b78c    ld      ($8cb7),hl
17fb 1812      jr      $180f
17fd 2ad28c    ld      hl,($8cd2)
1800 7c        ld      a,h
1801 b5        or      l
1802 2808      jr      z,$180c
1804 2acb8c    ld      hl,($8ccb)
1807 22c38c    ld      ($8cc3),hl
180a 1803      jr      $180f
180c cd9c5b    call    $5b9c
180f 1854      jr      $1865
1811 cd4a19    call    $194a
1814 cd8d41    call    $418d
1817 44        ld      b,h
1818 4d        ld      c,l
1819 1807      jr      $1822
181b 60        ld      h,b
181c 69        ld      l,c
181d cdff86    call    $86ff
1820 44        ld      b,h
1821 4d        ld      c,l
1822 78        ld      a,b
1823 b1        or      c
1824 2820      jr      z,$1846
1826 60        ld      h,b
1827 69        ld      l,c
1828 cdf886    call    $86f8
182b 22f48f    ld      ($8ff4),hl
182e e5        push    hl
182f cdec4c    call    $4cec
1832 2ac48f    ld      hl,($8fc4)
1835 e3        ex      (sp),hl
1836 2af48f    ld      hl,($8ff4)
1839 e5        push    hl
183a cd0147    call    $4701
183d d1        pop     de
183e d1        pop     de
183f 20da      jr      nz,$181b
1841 cd3b4b    call    $4b3b
1844 18d5      jr      $181b
1846 cd3538    call    $3835
1849 210100    ld      hl,$0001
184c e5        push    hl
184d cd8d41    call    $418d
1850 e5        push    hl
1851 cdb538    call    $38b5
1854 d1        pop     de
1855 210200    ld      hl,$0002
1858 e3        ex      (sp),hl
1859 cdaa41    call    $41aa
185c e5        push    hl
185d cdb538    call    $38b5
1860 d1        pop     de
1861 d1        pop     de
1862 cd6438    call    $3864
1865 c30838    jp      $3808
1868 cd763c    call    $3c76
186b cd4a19    call    $194a
186e 210000    ld      hl,$0000
1871 e5        push    hl
1872 2ac48f    ld      hl,($8fc4)
1875 e5        push    hl
1876 2abc8f    ld      hl,($8fbc)
1879 e5        push    hl
187a cd8519    call    $1985
187d d1        pop     de
187e d1        pop     de
187f 210100    ld      hl,$0001
1882 e3        ex      (sp),hl
1883 cd8d41    call    $418d
1886 e5        push    hl
1887 cdb538    call    $38b5
188a d1        pop     de
188b 210200    ld      hl,$0002
188e e3        ex      (sp),hl
188f cdaa41    call    $41aa
1892 e5        push    hl
1893 cdb538    call    $38b5
1896 d1        pop     de
1897 d1        pop     de
1898 cd7d3c    call    $3c7d
189b c37c4b    jp      $4b7c
189e cd763c    call    $3c76
18a1 cd2543    call    $4325
18a4 cd1c43    call    $431c
18a7 cdfe18    call    $18fe
18aa cdde18    call    $18de
18ad cd7d3c    call    $3c7d
18b0 c37c4b    jp      $4b7c
18b3 cd763c    call    $3c76
18b6 cd2543    call    $4325
18b9 cdb337    call    $37b3
18bc 210000    ld      hl,$0000
18bf e5        push    hl
18c0 cdaa41    call    $41aa
18c3 e5        push    hl
18c4 cdb538    call    $38b5
18c7 d1        pop     de
18c8 d1        pop     de
18c9 cd7d3c    call    $3c7d
18cc c37c4b    jp      $4b7c
18cf cd763c    call    $3c76
18d2 cd2543    call    $4325
18d5 cdde18    call    $18de
18d8 cd7d3c    call    $3c7d
18db c37c4b    jp      $4b7c
18de cdfc37    call    $37fc
18e1 210200    ld      hl,$0002
18e4 e5        push    hl
18e5 cdaa41    call    $41aa
18e8 e5        push    hl
18e9 cdb538    call    $38b5
18ec d1        pop     de
18ed d1        pop     de
18ee c9        ret     

18ef cd763c    call    $3c76
18f2 cd2543    call    $4325
18f5 cdfe18    call    $18fe
18f8 cd7d3c    call    $3c7d
18fb c37c4b    jp      $4b7c
18fe cdb337    call    $37b3
1901 210100    ld      hl,$0001
1904 e5        push    hl
1905 cdaa41    call    $41aa
1908 e5        push    hl
1909 cdb538    call    $38b5
190c d1        pop     de
190d d1        pop     de
190e c9        ret     

190f cd2543    call    $4325
1912 cd1c43    call    $431c
1915 cd1c43    call    $431c
1918 cd3e19    call    $193e
191b cd4419    call    $1944
191e cd9641    call    $4196
1921 c37c4b    jp      $4b7c
1924 cd6219    call    $1962
1927 cd7237    call    $3772
192a c37c4b    jp      $4b7c
192d cd4a19    call    $194a
1930 2ac48f    ld      hl,($8fc4)
1933 e5        push    hl
1934 cd6e19    call    $196e
1937 d1        pop     de
1938 cd6937    call    $3769
193b c37c4b    jp      $4b7c
193e cdfc37    call    $37fc
1941 c36937    jp      $3769
1944 cdb337    call    $37b3
1947 c37237    jp      $3772
194a cd554a    call    $4a55
194d e5        push    hl
194e cdd944    call    $44d9
1951 d1        pop     de
1952 280b      jr      z,$195f
1954 2af48f    ld      hl,($8ff4)
1957 e5        push    hl
1958 cd2c46    call    $462c
195b d1        pop     de
195c 22f48f    ld      ($8ff4),hl
195f c32e43    jp      $432e
1962 cd4a19    call    $194a
1965 2abc8f    ld      hl,($8fbc)
1968 e5        push    hl
1969 cd6e19    call    $196e
196c d1        pop     de
196d c9        ret     

196e cda98b    call    $8ba9
1971 210800    ld      hl,$0008
1974 39        add     hl,sp
1975 4e        ld      c,(hl)
1976 23        inc     hl
1977 46        ld      b,(hl)
1978 210000    ld      hl,$0000
197b e5        push    hl
197c c5        push    bc
197d c5        push    bc
197e cd8519    call    $1985
1981 d1        pop     de
1982 d1        pop     de
1983 d1        pop     de
1984 c9        ret     

1985 cda98b    call    $8ba9
1988 cd8d41    call    $418d
198b 44        ld      b,h
198c 4d        ld      c,l
198d 180a      jr      $1999
198f cd9641    call    $4196
1992 60        ld      h,b
1993 69        ld      l,c
1994 cdff86    call    $86ff
1997 44        ld      b,h
1998 4d        ld      c,l
1999 78        ld      a,b
199a b1        or      c
199b c8        ret     z

199c 60        ld      h,b
199d 69        ld      l,c
199e cdf886    call    $86f8
19a1 22f48f    ld      ($8ff4),hl
19a4 e5        push    hl
19a5 cdec4c    call    $4cec
19a8 d1        pop     de
19a9 cd2e43    call    $432e
19ac 210c00    ld      hl,$000c
19af 39        add     hl,sp
19b0 7e        ld      a,(hl)
19b1 23        inc     hl
19b2 b6        or      (hl)
19b3 280d      jr      z,$19c2
19b5 2af48f    ld      hl,($8ff4)
19b8 e5        push    hl
19b9 cdd33b    call    $3bd3
19bc d1        pop     de
19bd cdbc3b    call    $3bbc
19c0 28cd      jr      z,$198f
19c2 210800    ld      hl,$0008
19c5 39        add     hl,sp
19c6 5e        ld      e,(hl)
19c7 23        inc     hl
19c8 56        ld      d,(hl)
19c9 d5        push    de
19ca cddb3a    call    $3adb
19cd d1        pop     de
19ce 2011      jr      nz,$19e1
19d0 210a00    ld      hl,$000a
19d3 39        add     hl,sp
19d4 5e        ld      e,(hl)
19d5 23        inc     hl
19d6 56        ld      d,(hl)
19d7 d5        push    de
19d8 cddb3a    call    $3adb
19db d1        pop     de
19dc 2003      jr      nz,$19e1
19de cd3b55    call    $553b
19e1 18ac      jr      $198f
19e3 c9        ret     

19e4 50        ld      d,b
19e5 55        ld      d,l
19e6 00        nop     
19e7 50        ld      d,b
19e8 44        ld      b,h
19e9 00        nop     
19ea 50        ld      d,b
19eb 58        ld      e,b
19ec 00        nop     
19ed 50        ld      d,b
19ee 45        ld      b,l
19ef 00        nop     
19f0 cd6c4a    call    $4a6c
19f3 cd534c    call    $4c53
19f6 c3e081    jp      $81e0
19f9 cda98b    call    $8ba9
19fc 210a00    ld      hl,$000a
19ff 39        add     hl,sp
1a00 4e        ld      c,(hl)
1a01 23        inc     hl
1a02 46        ld      b,(hl)
1a03 210800    ld      hl,$0008
1a06 39        add     hl,sp
1a07 5e        ld      e,(hl)
1a08 23        inc     hl
1a09 56        ld      d,(hl)
1a0a 60        ld      h,b
1a0b 69        ld      l,c
1a0c cd5585    call    $8555
1a0f 2803      jr      z,$1a14
1a11 60        ld      h,b
1a12 69        ld      l,c
1a13 c9        ret     

1a14 210800    ld      hl,$0008
1a17 39        add     hl,sp
1a18 5e        ld      e,(hl)
1a19 23        inc     hl
1a1a 56        ld      d,(hl)
1a1b eb        ex      de,hl
1a1c 23        inc     hl
1a1d c9        ret     

1a1e 2a498c    ld      hl,($8c49)
1a21 e5        push    hl
1a22 cd114b    call    $4b11
1a25 d1        pop     de
1a26 c9        ret     

1a27 cda98b    call    $8ba9
1a2a cd4d1f    call    $1f4d
1a2d 21a090    ld      hl,$90a0
1a30 e5        push    hl
1a31 cdbd4a    call    $4abd
1a34 e1        pop     hl
1a35 cd857c    call    $7c85
1a38 cd517c    call    $7c51
1a3b c28000    jp      nz,$0080
1a3e 00        nop     
1a3f 00        nop     
1a40 00        nop     
1a41 00        nop     
1a42 00        nop     
1a43 cd0780    call    $8007
1a46 281f      jr      z,$1a67
1a48 21a090    ld      hl,$90a0
1a4b cd667c    call    $7c66
1a4e cd517c    call    $7c51
1a51 42        ld      b,d
1a52 7f        ld      a,a
1a53 ff        rst     $38
1a54 00        nop     
1a55 00        nop     
1a56 00        nop     
1a57 00        nop     
1a58 00        nop     
1a59 cdfb7f    call    $7ffb
1a5c 2809      jr      z,$1a67
1a5e cd7c4b    call    $4b7c
1a61 21a090    ld      hl,$90a0
1a64 c3667c    jp      $7c66
1a67 c33b55    jp      $553b
1a6a cd6c4a    call    $4a6c
1a6d c35c4c    jp      $4c5c
1a70 cd5f4a    call    $4a5f
1a73 2af48f    ld      hl,($8ff4)
1a76 22f68f    ld      ($8ff6),hl
1a79 c9        ret     

1a7a 2af68f    ld      hl,($8ff6)
1a7d 7c        ld      a,h
1a7e b5        or      l
1a7f 2003      jr      nz,$1a84
1a81 cde556    call    $56e5
1a84 2af68f    ld      hl,($8ff6)
1a87 cdf886    call    $86f8
1a8a e5        push    hl
1a8b cd6341    call    $4163
1a8e d1        pop     de
1a8f c9        ret     

1a90 cd7a1a    call    $1a7a
1a93 cd8d41    call    $418d
1a96 e5        push    hl
1a97 cd2545    call    $4525
1a9a d1        pop     de
1a9b 2015      jr      nz,$1ab2
1a9d cd8d41    call    $418d
1aa0 e5        push    hl
1aa1 cd824a    call    $4a82
1aa4 d1        pop     de
1aa5 2808      jr      z,$1aaf
1aa7 cd9641    call    $4196
1aaa cd1831    call    $3118
1aad 1803      jr      $1ab2
1aaf cd3b55    call    $553b
1ab2 2af68f    ld      hl,($8ff6)
1ab5 cdff86    call    $86ff
1ab8 22f68f    ld      ($8ff6),hl
1abb c9        ret     

1abc cd701a    call    $1a70
1abf cd901a    call    $1a90
1ac2 c3901a    jp      $1a90
1ac5 cdaa41    call    $41aa
1ac8 e5        push    hl
1ac9 cd9f45    call    $459f
1acc d1        pop     de
1acd c9        ret     

1ace cda98b    call    $8ba9
1ad1 cd901a    call    $1a90
1ad4 cdc51a    call    $1ac5
1ad7 cde681    call    $81e6
1ada 44        ld      b,h
1adb 4d        ld      c,l
1adc eb        ex      de,hl
1add 210800    ld      hl,$0008
1ae0 39        add     hl,sp
1ae1 7e        ld      a,(hl)
1ae2 23        inc     hl
1ae3 66        ld      h,(hl)
1ae4 6f        ld      l,a
1ae5 cd6d85    call    $856d
1ae8 200a      jr      nz,$1af4
1aea 50        ld      d,b
1aeb 59        ld      e,c
1aec 210000    ld      hl,$0000
1aef cd6c85    call    $856c
1af2 2803      jr      z,$1af7
1af4 cd3b55    call    $553b
1af7 60        ld      h,b
1af8 69        ld      l,c
1af9 c9        ret     

1afa 21858c    ld      hl,$8c85
1afd cd667c    call    $7c66
1b00 cda77c    call    $7ca7
1b03 21858c    ld      hl,$8c85
1b06 cd667c    call    $7c66
1b09 cda77c    call    $7ca7
1b0c cd656e    call    $6e65
1b0f eb        ex      de,hl
1b10 211000    ld      hl,$0010
1b13 39        add     hl,sp
1b14 f9        ld      sp,hl
1b15 21858c    ld      hl,$8c85
1b18 cd667c    call    $7c66
1b1b cda77c    call    $7ca7
1b1e cdad6e    call    $6ead
1b21 eb        ex      de,hl
1b22 cda08b    call    $8ba0
1b25 c9        ret     

1b26 cd4d1f    call    $1f4d
1b29 cdbd4a    call    $4abd
1b2c cd127d    call    $7d12
1b2f cda77c    call    $7ca7
1b32 cd056e    call    $6e05
1b35 eb        ex      de,hl
1b36 cda08b    call    $8ba0
1b39 c37c4b    jp      $4b7c
1b3c cd4d1f    call    $1f4d
1b3f c3da6e    jp      $6eda
1b42 cd3c1b    call    $1b3c
1b45 cda96d    call    $6da9
1b48 cdfa1a    call    $1afa
1b4b c39a6d    jp      $6d9a
1b4e cdbc1a    call    $1abc
1b51 cd4d1f    call    $1f4d
1b54 cdc51a    call    $1ac5
1b57 cda77c    call    $7ca7
1b5a cdc51a    call    $1ac5
1b5d cda77c    call    $7ca7
1b60 cd7a6f    call    $6f7a
1b63 eb        ex      de,hl
1b64 211000    ld      hl,$0010
1b67 39        add     hl,sp
1b68 f9        ld      sp,hl
1b69 c37c4b    jp      $4b7c
1b6c cd4d1f    call    $1f4d
1b6f cdbd4a    call    $4abd
1b72 cda77c    call    $7ca7
1b75 cd056e    call    $6e05
1b78 eb        ex      de,hl
1b79 cda08b    call    $8ba0
1b7c c37c4b    jp      $4b7c
1b7f cddb6f    call    $6fdb
1b82 cda77c    call    $7ca7
1b85 cd0331    call    $3103
1b88 eb        ex      de,hl
1b89 cda08b    call    $8ba0
1b8c cde16f    call    $6fe1
1b8f cda77c    call    $7ca7
1b92 cd0331    call    $3103
1b95 eb        ex      de,hl
1b96 cda08b    call    $8ba0
1b99 cdd46e    call    $6ed4
1b9c cda77c    call    $7ca7
1b9f cd0331    call    $3103
1ba2 eb        ex      de,hl
1ba3 cda08b    call    $8ba0
1ba6 cdcf6d    call    $6dcf
1ba9 29        add     hl,hl
1baa 11b090    ld      de,$90b0
1bad 19        add     hl,de
1bae 5e        ld      e,(hl)
1baf 23        inc     hl
1bb0 56        ld      d,(hl)
1bb1 d5        push    de
1bb2 cd4059    call    $5940
1bb5 d1        pop     de
1bb6 cdfe6d    call    $6dfe
1bb9 e5        push    hl
1bba cd5630    call    $3056
1bbd d1        pop     de
1bbe cd4070    call    $7040
1bc1 e5        push    hl
1bc2 cd6353    call    $5363
1bc5 d1        pop     de
1bc6 cd2e43    call    $432e
1bc9 210600    ld      hl,$0006
1bcc e5        push    hl
1bcd cd304c    call    $4c30
1bd0 d1        pop     de
1bd1 c9        ret     

1bd2 cd7a6d    call    $6d7a
1bd5 e5        push    hl
1bd6 cd5630    call    $3056
1bd9 d1        pop     de
1bda cd5d6d    call    $6d5d
1bdd 29        add     hl,hl
1bde 11b890    ld      de,$90b8
1be1 19        add     hl,de
1be2 5e        ld      e,(hl)
1be3 23        inc     hl
1be4 56        ld      d,(hl)
1be5 d5        push    de
1be6 cd4059    call    $5940
1be9 d1        pop     de
1bea cd736d    call    $6d73
1bed e5        push    hl
1bee 2a3d8c    ld      hl,($8c3d)
1bf1 d1        pop     de
1bf2 eb        ex      de,hl
1bf3 cd3086    call    $8630
1bf6 23        inc     hl
1bf7 e5        push    hl
1bf8 cd5630    call    $3056
1bfb d1        pop     de
1bfc cd7d70    call    $707d
1bff 29        add     hl,hl
1c00 11be90    ld      de,$90be
1c03 19        add     hl,de
1c04 5e        ld      e,(hl)
1c05 23        inc     hl
1c06 56        ld      d,(hl)
1c07 d5        push    de
1c08 cd4059    call    $5940
1c0b d1        pop     de
1c0c cd9670    call    $7096
1c0f cda77c    call    $7ca7
1c12 cd0331    call    $3103
1c15 eb        ex      de,hl
1c16 cda08b    call    $8ba0
1c19 210500    ld      hl,$0005
1c1c e5        push    hl
1c1d cd304c    call    $4c30
1c20 d1        pop     de
1c21 c9        ret     

1c22 46        ld      b,(hl)
1c23 53        ld      d,e
1c24 00        nop     
1c25 53        ld      d,e
1c26 53        ld      d,e
1c27 00        nop     
1c28 54        ld      d,h
1c29 53        ld      d,e
1c2a 00        nop     
1c2b 57        ld      d,a
1c2c 49        ld      c,c
1c2d 4e        ld      c,(hl)
1c2e 44        ld      b,h
1c2f 4f        ld      c,a
1c30 57        ld      d,a
1c31 00        nop     
1c32 57        ld      d,a
1c33 52        ld      d,d
1c34 41        ld      b,c
1c35 50        ld      d,b
1c36 00        nop     
1c37 46        ld      b,(hl)
1c38 45        ld      b,l
1c39 4e        ld      c,(hl)
1c3a 43        ld      b,e
1c3b 45        ld      b,l
1c3c 00        nop     
1c3d cd4d1f    call    $1f4d
1c40 c32470    jp      $7024
1c43 cd4d1f    call    $1f4d
1c46 c3fa1a    jp      $1afa
1c49 cd271a    call    $1a27
1c4c cd127d    call    $7d12
1c4f cda77c    call    $7ca7
1c52 cd8f6e    call    $6e8f
1c55 eb        ex      de,hl
1c56 cda08b    call    $8ba0
1c59 c9        ret     

1c5a cd271a    call    $1a27
1c5d cda77c    call    $7ca7
1c60 cd8f6e    call    $6e8f
1c63 eb        ex      de,hl
1c64 cda08b    call    $8ba0
1c67 c9        ret     

1c68 cd4d1f    call    $1f4d
1c6b 2a5b8c    ld      hl,($8c5b)
1c6e e5        push    hl
1c6f cd114b    call    $4b11
1c72 e3        ex      (sp),hl
1c73 cd816d    call    $6d81
1c76 d1        pop     de
1c77 c37c4b    jp      $4b7c
1c7a cd271a    call    $1a27
1c7d cda77c    call    $7ca7
1c80 cdad6e    call    $6ead
1c83 eb        ex      de,hl
1c84 cda08b    call    $8ba0
1c87 c9        ret     

1c88 cd4d1f    call    $1f4d
1c8b cd1e1a    call    $1a1e
1c8e e5        push    hl
1c8f cdd86d    call    $6dd8
1c92 d1        pop     de
1c93 c37c4b    jp      $4b7c
1c96 cda98b    call    $8ba9
1c99 cd701a    call    $1a70
1c9c cd7a1a    call    $1a7a
1c9f 2af68f    ld      hl,($8ff6)
1ca2 cdff86    call    $86ff
1ca5 22f68f    ld      ($8ff6),hl
1ca8 2a498c    ld      hl,($8c49)
1cab e5        push    hl
1cac cdce1a    call    $1ace
1caf d1        pop     de
1cb0 44        ld      b,h
1cb1 4d        ld      c,l
1cb2 cd4d1f    call    $1f4d
1cb5 cd5e10    call    $105e
1cb8 cdaa41    call    $41aa
1cbb e5        push    hl
1cbc cd8835    call    $3588
1cbf d1        pop     de
1cc0 cd7410    call    $1074
1cc3 2ab090    ld      hl,($90b0)
1cc6 e5        push    hl
1cc7 21e68d    ld      hl,$8de6
1cca e5        push    hl
1ccb cd4f7b    call    $7b4f
1cce d1        pop     de
1ccf d1        pop     de
1cd0 2005      jr      nz,$1cd7
1cd2 cda96d    call    $6da9
1cd5 183f      jr      $1d16
1cd7 2ab290    ld      hl,($90b2)
1cda e5        push    hl
1cdb 21e68d    ld      hl,$8de6
1cde e5        push    hl
1cdf cd4f7b    call    $7b4f
1ce2 d1        pop     de
1ce3 d1        pop     de
1ce4 2005      jr      nz,$1ceb
1ce6 cd9a6d    call    $6d9a
1ce9 182b      jr      $1d16
1ceb 2ab490    ld      hl,($90b4)
1cee e5        push    hl
1cef 21e68d    ld      hl,$8de6
1cf2 e5        push    hl
1cf3 cd4f7b    call    $7b4f
1cf6 d1        pop     de
1cf7 d1        pop     de
1cf8 2005      jr      nz,$1cff
1cfa cdc06d    call    $6dc0
1cfd 1817      jr      $1d16
1cff 2ab690    ld      hl,($90b6)
1d02 e5        push    hl
1d03 21e68d    ld      hl,$8de6
1d06 e5        push    hl
1d07 cd4f7b    call    $7b4f
1d0a d1        pop     de
1d0b d1        pop     de
1d0c 2005      jr      nz,$1d13
1d0e cdb16d    call    $6db1
1d11 1803      jr      $1d16
1d13 cd3b55    call    $553b
1d16 c5        push    bc
1d17 cdd86d    call    $6dd8
1d1a d1        pop     de
1d1b c37c4b    jp      $4b7c
1d1e cdbc1a    call    $1abc
1d21 cd4d1f    call    $1f4d
1d24 cdc51a    call    $1ac5
1d27 cda77c    call    $7ca7
1d2a cdc51a    call    $1ac5
1d2d cda77c    call    $7ca7
1d30 cd656e    call    $6e65
1d33 eb        ex      de,hl
1d34 211000    ld      hl,$0010
1d37 39        add     hl,sp
1d38 f9        ld      sp,hl
1d39 c37c4b    jp      $4b7c
1d3c cd4d1f    call    $1f4d
1d3f cde16f    call    $6fe1
1d42 cda77c    call    $7ca7
1d45 cdbd4a    call    $4abd
1d48 cda77c    call    $7ca7
1d4b cd656e    call    $6e65
1d4e eb        ex      de,hl
1d4f 211000    ld      hl,$0010
1d52 39        add     hl,sp
1d53 f9        ld      sp,hl
1d54 c37c4b    jp      $4b7c
1d57 cd4d1f    call    $1f4d
1d5a cdbd4a    call    $4abd
1d5d cda77c    call    $7ca7
1d60 cddb6f    call    $6fdb
1d63 cda77c    call    $7ca7
1d66 cd656e    call    $6e65
1d69 eb        ex      de,hl
1d6a 211000    ld      hl,$0010
1d6d 39        add     hl,sp
1d6e f9        ld      sp,hl
1d6f c37c4b    jp      $4b7c
1d72 cd4d1f    call    $1f4d
1d75 c33270    jp      $7032
1d78 cdbc1a    call    $1abc
1d7b 21a890    ld      hl,$90a8
1d7e e5        push    hl
1d7f cde16f    call    $6fe1
1d82 cda77c    call    $7ca7
1d85 cdc51a    call    $1ac5
1d88 cdd87c    call    $7cd8
1d8b cd657d    call    $7d65
1d8e e1        pop     hl
1d8f cd857c    call    $7c85
1d92 21a890    ld      hl,$90a8
1d95 e5        push    hl
1d96 21a090    ld      hl,$90a0
1d99 e5        push    hl
1d9a cddb6f    call    $6fdb
1d9d cda77c    call    $7ca7
1da0 cdc51a    call    $1ac5
1da3 cdd87c    call    $7cd8
1da6 cd657d    call    $7d65
1da9 e1        pop     hl
1daa cd857c    call    $7c85
1dad cda77c    call    $7ca7
1db0 21a890    ld      hl,$90a8
1db3 cd667c    call    $7c66
1db6 cdd87c    call    $7cd8
1db9 cd417e    call    $7e41
1dbc cda77c    call    $7ca7
1dbf cd2388    call    $8823
1dc2 cda08b    call    $8ba0
1dc5 218d8c    ld      hl,$8c8d
1dc8 cd587c    call    $7c58
1dcb cd417f    call    $7f41
1dce cda77c    call    $7ca7
1dd1 cd5f7c    call    $7c5f
1dd4 41        ld      b,c
1dd5 5a        ld      e,d
1dd6 00        nop     
1dd7 00        nop     
1dd8 00        nop     
1dd9 00        nop     
1dda 00        nop     
1ddb 00        nop     
1ddc cdd87c    call    $7cd8
1ddf cd657d    call    $7d65
1de2 e1        pop     hl
1de3 cd857c    call    $7c85
1de6 21a090    ld      hl,$90a0
1de9 cd667c    call    $7c66
1dec 21858c    ld      hl,$8c85
1def cd587c    call    $7c58
1df2 cdf27f    call    $7ff2
1df5 2816      jr      z,$1e0d
1df7 21a890    ld      hl,$90a8
1dfa cd667c    call    $7c66
1dfd cd517c    call    $7c51
1e00 41        ld      b,c
1e01 b4        or      h
1e02 00        nop     
1e03 00        nop     
1e04 00        nop     
1e05 00        nop     
1e06 00        nop     
1e07 00        nop     
1e08 cd6c7d    call    $7d6c
1e0b 1806      jr      $1e13
1e0d 21a890    ld      hl,$90a8
1e10 cd667c    call    $7c66
1e13 cda77c    call    $7ca7
1e16 cdb84b    call    $4bb8
1e19 eb        ex      de,hl
1e1a cda08b    call    $8ba0
1e1d c9        ret     

1e1e 2a788f    ld      hl,($8f78)
1e21 e5        push    hl
1e22 cd6353    call    $5363
1e25 d1        pop     de
1e26 c9        ret     

1e27 cd654c    call    $4c65
1e2a e5        push    hl
1e2b cd8c6c    call    $6c8c
1e2e e3        ex      (sp),hl
1e2f cda64b    call    $4ba6
1e32 d1        pop     de
1e33 c9        ret     

1e34 cda98b    call    $8ba9
1e37 cd654c    call    $4c65
1e3a 44        ld      b,h
1e3b 4d        ld      c,l
1e3c cd654c    call    $4c65
1e3f e5        push    hl
1e40 c5        push    bc
1e41 cd7f6c    call    $6c7f
1e44 d1        pop     de
1e45 d1        pop     de
1e46 c37c4b    jp      $4b7c
1e49 cdf019    call    $19f0
1e4c 5e        ld      e,(hl)
1e4d 1600      ld      d,$00
1e4f d5        push    de
1e50 cda64b    call    $4ba6
1e53 d1        pop     de
1e54 c9        ret     

1e55 cda98b    call    $8ba9
1e58 cdf019    call    $19f0
1e5b 44        ld      b,h
1e5c 4d        ld      c,l
1e5d cd654c    call    $4c65
1e60 eb        ex      de,hl
1e61 60        ld      h,b
1e62 69        ld      l,c
1e63 73        ld      (hl),e
1e64 c37c4b    jp      $4b7c
1e67 cda98b    call    $8ba9
1e6a 2a5d8c    ld      hl,($8c5d)
1e6d e5        push    hl
1e6e cd114b    call    $4b11
1e71 d1        pop     de
1e72 2003      jr      nz,$1e77
1e74 cd3b55    call    $553b
1e77 cd736d    call    $6d73
1e7a 44        ld      b,h
1e7b 4d        ld      c,l
1e7c cd5c4c    call    $4c5c
1e7f e5        push    hl
1e80 2a3d8c    ld      hl,($8c3d)
1e83 d1        pop     de
1e84 eb        ex      de,hl
1e85 cd3086    call    $8630
1e88 23        inc     hl
1e89 e5        push    hl
1e8a cd646d    call    $6d64
1e8d d1        pop     de
1e8e cd5d6d    call    $6d5d
1e91 110100    ld      de,$0001
1e94 cd3c85    call    $853c
1e97 2846      jr      z,$1edf
1e99 cd736d    call    $6d73
1e9c e5        push    hl
1e9d 60        ld      h,b
1e9e 69        ld      l,c
1e9f d1        pop     de
1ea0 eb        ex      de,hl
1ea1 cd6c85    call    $856c
1ea4 281c      jr      z,$1ec2
1ea6 cd736d    call    $6d73
1ea9 2b        dec     hl
1eaa e5        push    hl
1eab c5        push    bc
1eac cd8077    call    $7780
1eaf d1        pop     de
1eb0 d1        pop     de
1eb1 cd736d    call    $6d73
1eb4 e5        push    hl
1eb5 2a8e8f    ld      hl,($8f8e)
1eb8 d1        pop     de
1eb9 eb        ex      de,hl
1eba cd6c85    call    $856c
1ebd 2803      jr      z,$1ec2
1ebf cd406c    call    $6c40
1ec2 cdd56c    call    $6cd5
1ec5 cd736d    call    $6d73
1ec8 e5        push    hl
1ec9 60        ld      h,b
1eca 69        ld      l,c
1ecb d1        pop     de
1ecc eb        ex      de,hl
1ecd cd6d85    call    $856d
1ed0 280d      jr      z,$1edf
1ed2 60        ld      h,b
1ed3 69        ld      l,c
1ed4 2b        dec     hl
1ed5 e5        push    hl
1ed6 cd736d    call    $6d73
1ed9 e5        push    hl
1eda cd8077    call    $7780
1edd d1        pop     de
1ede d1        pop     de
1edf c37c4b    jp      $4b7c
1ee2 cd5d6d    call    $6d5d
1ee5 110100    ld      de,$0001
1ee8 cd3c85    call    $853c
1eeb c0        ret     nz

1eec cd406c    call    $6c40
1eef cd4b6d    call    $6d4b
1ef2 2a3f8c    ld      hl,($8c3f)
1ef5 22988f    ld      ($8f98),hl
1ef8 2a3d8c    ld      hl,($8c3d)
1efb 229a8f    ld      ($8f9a),hl
1efe c3406c    jp      $6c40
1f01 2a598c    ld      hl,($8c59)
1f04 7c        ld      a,h
1f05 b5        or      l
1f06 2003      jr      nz,$1f0b
1f08 cd406c    call    $6c40
1f0b cd546d    call    $6d54
1f0e c3171f    jp      $1f17
1f11 cd426d    call    $6d42
1f14 c3171f    jp      $1f17
1f17 2a3b8c    ld      hl,($8c3b)
1f1a 22988f    ld      ($8f98),hl
1f1d 2a398c    ld      hl,($8c39)
1f20 229a8f    ld      ($8f9a),hl
1f23 c9        ret     

1f24 cd5d6d    call    $6d5d
1f27 110100    ld      de,$0001
1f2a cd3c85    call    $853c
1f2d 2804      jr      z,$1f33
1f2f cd736d    call    $6d73
1f32 c9        ret     

1f33 210100    ld      hl,$0001
1f36 c9        ret     

1f37 cd5d6d    call    $6d5d
1f3a 110200    ld      de,$0002
1f3d cd4885    call    $8548
1f40 c8        ret     z

1f41 cd011f    call    $1f01
1f44 c9        ret     

1f45 cd5d6d    call    $6d5d
1f48 c0        ret     nz

1f49 cde21e    call    $1ee2
1f4c c9        ret     

1f4d cd5d6d    call    $6d5d
1f50 110200    ld      de,$0002
1f53 cd3c85    call    $853c
1f56 c8        ret     z

1f57 cde21e    call    $1ee2
1f5a c9        ret     

1f5b cd4d1f    call    $1f4d
1f5e c34e70    jp      $704e
1f61 cd406c    call    $6c40
1f64 c3451f    jp      $1f45
1f67 2a8c8f    ld      hl,($8f8c)
1f6a 2b        dec     hl
1f6b e5        push    hl
1f6c cd5630    call    $3056
1f6f d1        pop     de
1f70 2a8e8f    ld      hl,($8f8e)
1f73 2b        dec     hl
1f74 e5        push    hl
1f75 cd5630    call    $3056
1f78 210200    ld      hl,$0002
1f7b e3        ex      (sp),hl
1f7c cd304c    call    $4c30
1f7f d1        pop     de
1f80 c9        ret     

1f81 cda98b    call    $8ba9
1f84 cdbc1a    call    $1abc
1f87 cdc51a    call    $1ac5
1f8a cda77c    call    $7ca7
1f8d cd2a04    call    $042a
1f90 cda08b    call    $8ba0
1f93 cde681    call    $81e6
1f96 44        ld      b,h
1f97 4d        ld      c,l
1f98 2a988f    ld      hl,($8f98)
1f9b 2b        dec     hl
1f9c e5        push    hl
1f9d cdc51a    call    $1ac5
1fa0 cda77c    call    $7ca7
1fa3 cd2a04    call    $042a
1fa6 cda08b    call    $8ba0
1fa9 cde681    call    $81e6
1fac e5        push    hl
1fad cdf919    call    $19f9
1fb0 d1        pop     de
1fb1 e3        ex      (sp),hl
1fb2 2a9a8f    ld      hl,($8f9a)
1fb5 e5        push    hl
1fb6 c5        push    bc
1fb7 cdf919    call    $19f9
1fba d1        pop     de
1fbb e3        ex      (sp),hl
1fbc cd506c    call    $6c50
1fbf d1        pop     de
1fc0 d1        pop     de
1fc1 c37c4b    jp      $4b7c
1fc4 cdbd4a    call    $4abd
1fc7 cda77c    call    $7ca7
1fca cd5f7c    call    $7c5f
1fcd 41        ld      b,c
1fce 010000    ld      bc,$0000
1fd1 00        nop     
1fd2 00        nop     
1fd3 00        nop     
1fd4 00        nop     
1fd5 cdd87c    call    $7cd8
1fd8 cd417e    call    $7e41
1fdb cde681    call    $81e6
1fde eb        ex      de,hl
1fdf 2a578c    ld      hl,($8c57)
1fe2 cd5685    call    $8556
1fe5 2824      jr      z,$200b
1fe7 2a578c    ld      hl,($8c57)
1fea cd2880    call    $8028
1fed cda77c    call    $7ca7
1ff0 cd534c    call    $4c53
1ff3 cdd87c    call    $7cd8
1ff6 cdfb7f    call    $7ffb
1ff9 2810      jr      z,$200b
1ffb cd534c    call    $4c53
1ffe cda77c    call    $7ca7
2001 cd8470    call    $7084
2004 eb        ex      de,hl
2005 cda08b    call    $8ba0
2008 c37c4b    jp      $4b7c
200b c33b55    jp      $553b
200e cda98b    call    $8ba9
2011 210800    ld      hl,$0008
2014 39        add     hl,sp
2015 5e        ld      e,(hl)
2016 23        inc     hl
2017 56        ld      d,(hl)
2018 d5        push    de
2019 211300    ld      hl,$0013
201c e5        push    hl
201d cdbc86    call    $86bc
2020 d1        pop     de
2021 d1        pop     de
2022 c9        ret     

2023 211900    ld      hl,$0019
2026 e5        push    hl
2027 cdbc86    call    $86bc
202a d1        pop     de
202b c9        ret     

202c 218000    ld      hl,$0080
202f e5        push    hl
2030 cd3520    call    $2035
2033 d1        pop     de
2034 c9        ret     

2035 cda98b    call    $8ba9
2038 210800    ld      hl,$0008
203b 39        add     hl,sp
203c 5e        ld      e,(hl)
203d 23        inc     hl
203e 56        ld      d,(hl)
203f d5        push    de
2040 211a00    ld      hl,$001a
2043 e5        push    hl
2044 cdbc86    call    $86bc
2047 d1        pop     de
2048 d1        pop     de
2049 c9        ret     

204a cda98b    call    $8ba9
204d 210800    ld      hl,$0008
2050 39        add     hl,sp
2051 5e        ld      e,(hl)
2052 23        inc     hl
2053 56        ld      d,(hl)
2054 d5        push    de
2055 211100    ld      hl,$0011
2058 e5        push    hl
2059 cdbc86    call    $86bc
205c d1        pop     de
205d d1        pop     de
205e 11ff00    ld      de,$00ff
2061 c34885    jp      $8548
2064 cda98b    call    $8ba9
2067 cd2543    call    $4325
206a cd2c20    call    $202c
206d cdb824    call    $24b8
2070 210800    ld      hl,$0008
2073 39        add     hl,sp
2074 5e        ld      e,(hl)
2075 23        inc     hl
2076 56        ld      d,(hl)
2077 d5        push    de
2078 211100    ld      hl,$0011
207b e5        push    hl
207c cdbc86    call    $86bc
207f d1        pop     de
2080 d1        pop     de
2081 44        ld      b,h
2082 4d        ld      c,l
2083 60        ld      h,b
2084 69        ld      l,c
2085 11ff00    ld      de,$00ff
2088 cd4885    call    $8548
208b c8        ret     z

208c cd5e10    call    $105e
208f 60        ld      h,b
2090 69        ld      l,c
2091 29        add     hl,hl
2092 29        add     hl,hl
2093 29        add     hl,hl
2094 29        add     hl,hl
2095 29        add     hl,hl
2096 118100    ld      de,$0081
2099 19        add     hl,de
209a e5        push    hl
209b 21e68d    ld      hl,$8de6
209e e5        push    hl
209f cd887b    call    $7b88
20a2 d1        pop     de
20a3 d1        pop     de
20a4 2a728f    ld      hl,($8f72)
20a7 23        inc     hl
20a8 22728f    ld      ($8f72),hl
20ab 2b        dec     hl
20ac 5e        ld      e,(hl)
20ad 1600      ld      d,$00
20af 212000    ld      hl,$0020
20b2 cd3c85    call    $853c
20b5 2012      jr      nz,$20c9
20b7 2a7a8f    ld      hl,($8f7a)
20ba 23        inc     hl
20bb 227a8f    ld      ($8f7a),hl
20be 110800    ld      de,$0008
20c1 eb        ex      de,hl
20c2 cd5c86    call    $865c
20c5 2002      jr      nz,$20c9
20c7 18db      jr      $20a4
20c9 cd7410    call    $1074
20cc cdd84b    call    $4bd8
20cf cd8d41    call    $418d
20d2 e5        push    hl
20d3 2af48f    ld      hl,($8ff4)
20d6 e5        push    hl
20d7 cd7d45    call    $457d
20da d1        pop     de
20db e3        ex      (sp),hl
20dc cdc941    call    $41c9
20df d1        pop     de
20e0 210800    ld      hl,$0008
20e3 39        add     hl,sp
20e4 5e        ld      e,(hl)
20e5 23        inc     hl
20e6 56        ld      d,(hl)
20e7 d5        push    de
20e8 211200    ld      hl,$0012
20eb e5        push    hl
20ec cdbc86    call    $86bc
20ef d1        pop     de
20f0 d1        pop     de
20f1 44        ld      b,h
20f2 4d        ld      c,l
20f3 188e      jr      $2083
20f5 c9        ret     

20f6 210800    ld      hl,$0008
20f9 39        add     hl,sp
20fa eb        ex      de,hl
20fb 2a2e90    ld      hl,($902e)
20fe cd3086    call    $8630
2101 1180fd    ld      de,$fd80
2104 19        add     hl,de
2105 1180ff    ld      de,$ff80
2108 cdfc84    call    $84fc
210b 220490    ld      ($9004),hl
210e 110000    ld      de,$0000
2111 eb        ex      de,hl
2112 cd5685    call    $8556
2115 2803      jr      z,$211a
2117 cd8357    call    $5783
211a 2a2e90    ld      hl,($902e)
211d 220690    ld      ($9006),hl
2120 c32321    jp      $2123
2123 210000    ld      hl,$0000
2126 220290    ld      ($9002),hl
2129 22fe8f    ld      ($8ffe),hl
212c 2a0690    ld      hl,($9006)
212f 22fc8f    ld      ($8ffc),hl
2132 c9        ret     

2133 cda98b    call    $8ba9
2136 2afe8f    ld      hl,($8ffe)
2139 eb        ex      de,hl
213a 2a0490    ld      hl,($9004)
213d cd5585    call    $8555
2140 2817      jr      z,$2159
2142 210a90    ld      hl,$900a
2145 e5        push    hl
2146 2a0490    ld      hl,($9004)
2149 118000    ld      de,$0080
214c eb        ex      de,hl
214d cd2285    call    $8522
2150 e5        push    hl
2151 cdc622    call    $22c6
2154 d1        pop     de
2155 d1        pop     de
2156 cd2321    call    $2123
2159 2afe8f    ld      hl,($8ffe)
215c 23        inc     hl
215d 22fe8f    ld      ($8ffe),hl
2160 210800    ld      hl,$0008
2163 39        add     hl,sp
2164 5e        ld      e,(hl)
2165 1600      ld      d,$00
2167 d5        push    de
2168 2afc8f    ld      hl,($8ffc)
216b 23        inc     hl
216c 22fc8f    ld      ($8ffc),hl
216f 2b        dec     hl
2170 d1        pop     de
2171 73        ld      (hl),e
2172 c9        ret     

2173 2a0290    ld      hl,($9002)
2176 7c        ld      a,h
2177 b5        or      l
2178 2804      jr      z,$217e
217a 210000    ld      hl,$0000
217d c9        ret     

217e 2afe8f    ld      hl,($8ffe)
2181 7c        ld      a,h
2182 b5        or      l
2183 201f      jr      nz,$21a4
2185 cd2321    call    $2123
2188 2a2e90    ld      hl,($902e)
218b eb        ex      de,hl
218c 2a0490    ld      hl,($9004)
218f 19        add     hl,de
2190 e5        push    hl
2191 210a90    ld      hl,$900a
2194 e5        push    hl
2195 cd7822    call    $2278
2198 d1        pop     de
2199 d1        pop     de
219a 110700    ld      de,$0007
219d eb        ex      de,hl
219e cd2086    call    $8620
21a1 22fe8f    ld      ($8ffe),hl
21a4 2afe8f    ld      hl,($8ffe)
21a7 7c        ld      a,h
21a8 b5        or      l
21a9 280e      jr      z,$21b9
21ab 2afc8f    ld      hl,($8ffc)
21ae 5e        ld      e,(hl)
21af 1600      ld      d,$00
21b1 211a00    ld      hl,$001a
21b4 cd3c85    call    $853c
21b7 280a      jr      z,$21c3
21b9 210100    ld      hl,$0001
21bc 220290    ld      ($9002),hl
21bf 210000    ld      hl,$0000
21c2 c9        ret     

21c3 2afe8f    ld      hl,($8ffe)
21c6 2b        dec     hl
21c7 22fe8f    ld      ($8ffe),hl
21ca 2afc8f    ld      hl,($8ffc)
21cd 5e        ld      e,(hl)
21ce 1600      ld      d,$00
21d0 210d00    ld      hl,$000d
21d3 cd3c85    call    $853c
21d6 280e      jr      z,$21e6
21d8 2afc8f    ld      hl,($8ffc)
21db 23        inc     hl
21dc 22fc8f    ld      ($8ffc),hl
21df cd7321    call    $2173
21e2 210a00    ld      hl,$000a
21e5 c9        ret     

21e6 2afc8f    ld      hl,($8ffc)
21e9 23        inc     hl
21ea 22fc8f    ld      ($8ffc),hl
21ed 2b        dec     hl
21ee 5e        ld      e,(hl)
21ef 1600      ld      d,$00
21f1 eb        ex      de,hl
21f2 c9        ret     

21f3 cd7321    call    $2173
21f6 e5        push    hl
21f7 2a0090    ld      hl,($9000)
21fa 11da8c    ld      de,$8cda
21fd 19        add     hl,de
21fe d1        pop     de
21ff 73        ld      (hl),e
2200 2a0090    ld      hl,($9000)
2203 23        inc     hl
2204 220090    ld      ($9000),hl
2207 118600    ld      de,$0086
220a eb        ex      de,hl
220b cd5585    call    $8555
220e 2803      jr      z,$2213
2210 cdc256    call    $56c2
2213 210000    ld      hl,$0000
2216 e5        push    hl
2217 2a0090    ld      hl,($9000)
221a 11da8c    ld      de,$8cda
221d 19        add     hl,de
221e d1        pop     de
221f 73        ld      (hl),e
2220 c9        ret     

2221 2afe8f    ld      hl,($8ffe)
2224 118000    ld      de,$0080
2227 eb        ex      de,hl
2228 cd8285    call    $8582
222b 2808      jr      z,$2235
222d 211a00    ld      hl,$001a
2230 e5        push    hl
2231 cd3321    call    $2133
2234 d1        pop     de
2235 210a90    ld      hl,$900a
2238 e5        push    hl
2239 2afe8f    ld      hl,($8ffe)
223c 117f00    ld      de,$007f
223f 19        add     hl,de
2240 118000    ld      de,$0080
2243 eb        ex      de,hl
2244 cd2285    call    $8522
2247 e5        push    hl
2248 cdc622    call    $22c6
224b d1        pop     de
224c 210a90    ld      hl,$900a
224f e3        ex      (sp),hl
2250 cd3a23    call    $233a
2253 d1        pop     de
2254 c33d3c    jp      $3c3d
2257 210200    ld      hl,$0002
225a 22f88f    ld      ($8ff8),hl
225d cdf620    call    $20f6
2260 210000    ld      hl,$0000
2263 220090    ld      ($9000),hl
2266 cdf321    call    $21f3
2269 cdf321    call    $21f3
226c c3f321    jp      $21f3
226f 210200    ld      hl,$0002
2272 22fa8f    ld      ($8ffa),hl
2275 c3f620    jp      $20f6
2278 cda98b    call    $8ba9
227b 210000    ld      hl,$0000
227e 22c490    ld      ($90c4),hl
2281 2a2e90    ld      hl,($902e)
2284 44        ld      b,h
2285 4d        ld      c,l
2286 210a00    ld      hl,$000a
2289 39        add     hl,sp
228a 5e        ld      e,(hl)
228b 23        inc     hl
228c 56        ld      d,(hl)
228d 2180ff    ld      hl,$ff80
2290 19        add     hl,de
2291 50        ld      d,b
2292 59        ld      e,c
2293 eb        ex      de,hl
2294 cd6686    call    $8666
2297 2029      jr      nz,$22c2
2299 c5        push    bc
229a cd3520    call    $2035
229d d1        pop     de
229e 210800    ld      hl,$0008
22a1 39        add     hl,sp
22a2 5e        ld      e,(hl)
22a3 23        inc     hl
22a4 56        ld      d,(hl)
22a5 d5        push    de
22a6 211400    ld      hl,$0014
22a9 e5        push    hl
22aa cdbc86    call    $86bc
22ad d1        pop     de
22ae d1        pop     de
22af 2011      jr      nz,$22c2
22b1 2ac490    ld      hl,($90c4)
22b4 23        inc     hl
22b5 22c490    ld      ($90c4),hl
22b8 218000    ld      hl,$0080
22bb 50        ld      d,b
22bc 59        ld      e,c
22bd 19        add     hl,de
22be 44        ld      b,h
22bf 4d        ld      c,l
22c0 18c4      jr      $2286
22c2 2ac490    ld      hl,($90c4)
22c5 c9        ret     

22c6 cda98b    call    $8ba9
22c9 2a0690    ld      hl,($9006)
22cc 44        ld      b,h
22cd 4d        ld      c,l
22ce 210800    ld      hl,$0008
22d1 39        add     hl,sp
22d2 e5        push    hl
22d3 7e        ld      a,(hl)
22d4 23        inc     hl
22d5 66        ld      h,(hl)
22d6 6f        ld      l,a
22d7 2b        dec     hl
22d8 eb        ex      de,hl
22d9 e1        pop     hl
22da 73        ld      (hl),e
22db 23        inc     hl
22dc 72        ld      (hl),d
22dd eb        ex      de,hl
22de 23        inc     hl
22df 7c        ld      a,h
22e0 b5        or      l
22e1 c8        ret     z

22e2 c5        push    bc
22e3 cd3520    call    $2035
22e6 d1        pop     de
22e7 210a00    ld      hl,$000a
22ea 39        add     hl,sp
22eb 5e        ld      e,(hl)
22ec 23        inc     hl
22ed 56        ld      d,(hl)
22ee d5        push    de
22ef 211500    ld      hl,$0015
22f2 e5        push    hl
22f3 cdbc86    call    $86bc
22f6 d1        pop     de
22f7 d1        pop     de
22f8 280f      jr      z,$2309
22fa 210a00    ld      hl,$000a
22fd 39        add     hl,sp
22fe 5e        ld      e,(hl)
22ff 23        inc     hl
2300 56        ld      d,(hl)
2301 d5        push    de
2302 cd3a23    call    $233a
2305 d1        pop     de
2306 cd6857    call    $5768
2309 218000    ld      hl,$0080
230c 50        ld      d,b
230d 59        ld      e,c
230e 19        add     hl,de
230f 44        ld      b,h
2310 4d        ld      c,l
2311 18bb      jr      $22ce
2313 c9        ret     

2314 cda98b    call    $8ba9
2317 210800    ld      hl,$0008
231a 39        add     hl,sp
231b 4e        ld      c,(hl)
231c 23        inc     hl
231d 46        ld      b,(hl)
231e cdb824    call    $24b8
2321 210000    ld      hl,$0000
2324 eb        ex      de,hl
2325 212000    ld      hl,$0020
2328 09        add     hl,bc
2329 73        ld      (hl),e
232a c5        push    bc
232b 210f00    ld      hl,$000f
232e e5        push    hl
232f cdbc86    call    $86bc
2332 d1        pop     de
2333 d1        pop     de
2334 11ff00    ld      de,$00ff
2337 c34885    jp      $8548
233a cda98b    call    $8ba9
233d 210800    ld      hl,$0008
2340 39        add     hl,sp
2341 5e        ld      e,(hl)
2342 23        inc     hl
2343 56        ld      d,(hl)
2344 d5        push    de
2345 211000    ld      hl,$0010
2348 e5        push    hl
2349 cdbc86    call    $86bc
234c d1        pop     de
234d d1        pop     de
234e 11ff00    ld      de,$00ff
2351 cd3c85    call    $853c
2354 c8        ret     z

2355 cd3957    call    $5739
2358 c9        ret     

2359 cda98b    call    $8ba9
235c cdb824    call    $24b8
235f 210000    ld      hl,$0000
2362 e5        push    hl
2363 210a00    ld      hl,$000a
2366 39        add     hl,sp
2367 5e        ld      e,(hl)
2368 23        inc     hl
2369 56        ld      d,(hl)
236a 212000    ld      hl,$0020
236d 19        add     hl,de
236e d1        pop     de
236f 73        ld      (hl),e
2370 210800    ld      hl,$0008
2373 39        add     hl,sp
2374 5e        ld      e,(hl)
2375 23        inc     hl
2376 56        ld      d,(hl)
2377 d5        push    de
2378 211600    ld      hl,$0016
237b e5        push    hl
237c cdbc86    call    $86bc
237f d1        pop     de
2380 d1        pop     de
2381 11ff00    ld      de,$00ff
2384 cd3c85    call    $853c
2387 c8        ret     z

2388 cd3957    call    $5739
238b c9        ret     

238c cda98b    call    $8ba9
238f 21d284    ld      hl,$84d2
2392 e5        push    hl
2393 cd8c0f    call    $0f8c
2396 d1        pop     de
2397 210a00    ld      hl,$000a
239a 39        add     hl,sp
239b 5e        ld      e,(hl)
239c 23        inc     hl
239d 56        ld      d,(hl)
239e d5        push    de
239f 210a00    ld      hl,$000a
23a2 39        add     hl,sp
23a3 5e        ld      e,(hl)
23a4 23        inc     hl
23a5 56        ld      d,(hl)
23a6 d5        push    de
23a7 cdad23    call    $23ad
23aa d1        pop     de
23ab d1        pop     de
23ac c9        ret     

23ad cda98b    call    $8ba9
23b0 210800    ld      hl,$0008
23b3 39        add     hl,sp
23b4 4e        ld      c,(hl)
23b5 23        inc     hl
23b6 46        ld      b,(hl)
23b7 210000    ld      hl,$0000
23ba 22c890    ld      ($90c8),hl
23bd eb        ex      de,hl
23be 60        ld      h,b
23bf 69        ld      l,c
23c0 73        ld      (hl),e
23c1 21e68d    ld      hl,$8de6
23c4 22c690    ld      ($90c6),hl
23c7 2a7a8f    ld      hl,($8f7a)
23ca 110100    ld      de,$0001
23cd eb        ex      de,hl
23ce cd6786    call    $8667
23d1 2856      jr      z,$2429
23d3 2ac690    ld      hl,($90c6)
23d6 23        inc     hl
23d7 5e        ld      e,(hl)
23d8 1600      ld      d,$00
23da 213a00    ld      hl,$003a
23dd cd3c85    call    $853c
23e0 2847      jr      z,$2429
23e2 2ac690    ld      hl,($90c6)
23e5 5e        ld      e,(hl)
23e6 1600      ld      d,$00
23e8 214100    ld      hl,$0041
23eb cd6c85    call    $856c
23ee 200e      jr      nz,$23fe
23f0 2ac690    ld      hl,($90c6)
23f3 5e        ld      e,(hl)
23f4 1600      ld      d,$00
23f6 215000    ld      hl,$0050
23f9 cd6d85    call    $856d
23fc 2805      jr      z,$2403
23fe cd3b55    call    $553b
2401 1826      jr      $2429
2403 2ac690    ld      hl,($90c6)
2406 5e        ld      e,(hl)
2407 1600      ld      d,$00
2409 21bfff    ld      hl,$ffbf
240c 19        add     hl,de
240d 23        inc     hl
240e eb        ex      de,hl
240f 60        ld      h,b
2410 69        ld      l,c
2411 73        ld      (hl),e
2412 2ac690    ld      hl,($90c6)
2415 110200    ld      de,$0002
2418 19        add     hl,de
2419 22c690    ld      ($90c6),hl
241c 2a7a8f    ld      hl,($8f7a)
241f 110200    ld      de,$0002
2422 eb        ex      de,hl
2423 cd3086    call    $8630
2426 227a8f    ld      ($8f7a),hl
2429 2a7a8f    ld      hl,($8f7a)
242c cdf685    call    $85f6
242f 22ca90    ld      ($90ca),hl
2432 7c        ld      a,h
2433 b5        or      l
2434 281b      jr      z,$2451
2436 2ac890    ld      hl,($90c8)
2439 23        inc     hl
243a 22c890    ld      ($90c8),hl
243d 110800    ld      de,$0008
2440 eb        ex      de,hl
2441 cd5685    call    $8556
2444 280b      jr      z,$2451
2446 213f00    ld      hl,$003f
2449 e5        push    hl
244a 03        inc     bc
244b 60        ld      h,b
244c 69        ld      l,c
244d d1        pop     de
244e 73        ld      (hl),e
244f 18e5      jr      $2436
2451 2a7a8f    ld      hl,($8f7a)
2454 2b        dec     hl
2455 227a8f    ld      ($8f7a),hl
2458 23        inc     hl
2459 7c        ld      a,h
245a b5        or      l
245b 282b      jr      z,$2488
245d 2ac690    ld      hl,($90c6)
2460 23        inc     hl
2461 22c690    ld      ($90c6),hl
2464 2b        dec     hl
2465 5e        ld      e,(hl)
2466 1600      ld      d,$00
2468 d5        push    de
2469 03        inc     bc
246a 60        ld      h,b
246b 69        ld      l,c
246c d1        pop     de
246d 73        ld      (hl),e
246e 213f00    ld      hl,$003f
2471 cd3c85    call    $853c
2474 22ca90    ld      ($90ca),hl
2477 2ac890    ld      hl,($90c8)
247a 23        inc     hl
247b 22c890    ld      ($90c8),hl
247e 110800    ld      de,$0008
2481 cd3c85    call    $853c
2484 2002      jr      nz,$2488
2486 18c9      jr      $2451
2488 2ac890    ld      hl,($90c8)
248b 23        inc     hl
248c 22c890    ld      ($90c8),hl
248f 110800    ld      de,$0008
2492 eb        ex      de,hl
2493 cd5685    call    $8556
2496 280b      jr      z,$24a3
2498 212000    ld      hl,$0020
249b e5        push    hl
249c 03        inc     bc
249d 60        ld      h,b
249e 69        ld      l,c
249f d1        pop     de
24a0 73        ld      (hl),e
24a1 18e5      jr      $2488
24a3 210a00    ld      hl,$000a
24a6 39        add     hl,sp
24a7 5e        ld      e,(hl)
24a8 23        inc     hl
24a9 56        ld      d,(hl)
24aa d5        push    de
24ab 03        inc     bc
24ac 60        ld      h,b
24ad 69        ld      l,c
24ae e5        push    hl
24af cd887b    call    $7b88
24b2 d1        pop     de
24b3 d1        pop     de
24b4 2aca90    ld      hl,($90ca)
24b7 c9        ret     

24b8 cda98b    call    $8ba9
24bb cd2320    call    $2023
24be 44        ld      b,h
24bf 4d        ld      c,l
24c0 210d00    ld      hl,$000d
24c3 e5        push    hl
24c4 cdbc86    call    $86bc
24c7 d1        pop     de
24c8 c5        push    bc
24c9 210e00    ld      hl,$000e
24cc e5        push    hl
24cd cdbc86    call    $86bc
24d0 d1        pop     de
24d1 d1        pop     de
24d2 c9        ret     

24d3 cda98b    call    $8ba9
24d6 210800    ld      hl,$0008
24d9 39        add     hl,sp
24da 4e        ld      c,(hl)
24db 23        inc     hl
24dc 46        ld      b,(hl)
24dd 210a00    ld      hl,$000a
24e0 39        add     hl,sp
24e1 5e        ld      e,(hl)
24e2 23        inc     hl
24e3 56        ld      d,(hl)
24e4 d5        push    de
24e5 c5        push    bc
24e6 cd8c23    call    $238c
24e9 d1        pop     de
24ea d1        pop     de
24eb 2803      jr      z,$24f0
24ed cd3b55    call    $553b
24f0 c5        push    bc
24f1 cd4a20    call    $204a
24f4 d1        pop     de
24f5 c0        ret     nz

24f6 cdc557    call    $57c5
24f9 c9        ret     

24fa cda98b    call    $8ba9
24fd 210800    ld      hl,$0008
2500 39        add     hl,sp
2501 4e        ld      c,(hl)
2502 23        inc     hl
2503 46        ld      b,(hl)
2504 210a00    ld      hl,$000a
2507 39        add     hl,sp
2508 5e        ld      e,(hl)
2509 23        inc     hl
250a 56        ld      d,(hl)
250b d5        push    de
250c c5        push    bc
250d cd8c23    call    $238c
2510 d1        pop     de
2511 d1        pop     de
2512 2803      jr      z,$2517
2514 cd3b55    call    $553b
2517 c5        push    bc
2518 cd4a20    call    $204a
251b d1        pop     de
251c c8        ret     z

251d cda857    call    $57a8
2520 c9        ret     

2521 cddf4c    call    $4cdf
2524 cdc84c    call    $4cc8
2527 213c90    ld      hl,$903c
252a e5        push    hl
252b 210a90    ld      hl,$900a
252e e5        push    hl
252f cd8c23    call    $238c
2532 d1        pop     de
2533 d1        pop     de
2534 2803      jr      z,$2539
2536 cd3b55    call    $553b
2539 210a90    ld      hl,$900a
253c e5        push    hl
253d cd4a20    call    $204a
2540 d1        pop     de
2541 280a      jr      z,$254d
2543 210a90    ld      hl,$900a
2546 e5        push    hl
2547 cd1423    call    $2314
254a d1        pop     de
254b 1808      jr      $2555
254d 210a90    ld      hl,$900a
2550 e5        push    hl
2551 cd5923    call    $2359
2554 d1        pop     de
2555 2a2e90    ld      hl,($902e)
2558 2b        dec     hl
2559 22cb8c    ld      ($8ccb),hl
255c cdf620    call    $20f6
255f 210000    ld      hl,$0000
2562 22ce8c    ld      ($8cce),hl
2565 1807      jr      $256e
2567 2ace8c    ld      hl,($8cce)
256a 23        inc     hl
256b 22ce8c    ld      ($8cce),hl
256e 2a0290    ld      hl,($9002)
2571 7c        ld      a,h
2572 b5        or      l
2573 201e      jr      nz,$2593
2575 cd7321    call    $2173
2578 e5        push    hl
2579 2acb8c    ld      hl,($8ccb)
257c 23        inc     hl
257d 22cb8c    ld      ($8ccb),hl
2580 d1        pop     de
2581 73        ld      (hl),e
2582 2afc8f    ld      hl,($8ffc)
2585 eb        ex      de,hl
2586 2acb8c    ld      hl,($8ccb)
2589 cd6686    call    $8666
258c 2803      jr      z,$2591
258e cd8357    call    $5783
2591 18d4      jr      $2567
2593 210a90    ld      hl,$900a
2596 e5        push    hl
2597 cd3a23    call    $233a
259a d1        pop     de
259b cd2638    call    $3826
259e cd6438    call    $3864
25a1 cd295b    call    $5b29
25a4 cd525c    call    $5c52
25a7 210a90    ld      hl,$900a
25aa e5        push    hl
25ab cd0e20    call    $200e
25ae 210a90    ld      hl,$900a
25b1 e3        ex      (sp),hl
25b2 cd5923    call    $2359
25b5 d1        pop     de
25b6 210200    ld      hl,$0002
25b9 22fa8f    ld      ($8ffa),hl
25bc 218000    ld      hl,$0080
25bf 220690    ld      ($9006),hl
25c2 218000    ld      hl,$0080
25c5 220490    ld      ($9004),hl
25c8 cd2321    call    $2123
25cb 2a2e90    ld      hl,($902e)
25ce 22cb8c    ld      ($8ccb),hl
25d1 2acb8c    ld      hl,($8ccb)
25d4 7e        ld      a,(hl)
25d5 b7        or      a
25d6 2812      jr      z,$25ea
25d8 2acb8c    ld      hl,($8ccb)
25db 23        inc     hl
25dc 22cb8c    ld      ($8ccb),hl
25df 2b        dec     hl
25e0 5e        ld      e,(hl)
25e1 1600      ld      d,$00
25e3 d5        push    de
25e4 cd3f67    call    $673f
25e7 d1        pop     de
25e8 18e7      jr      $25d1
25ea 211a00    ld      hl,$001a
25ed e5        push    hl
25ee cd3f67    call    $673f
25f1 d1        pop     de
25f2 c32122    jp      $2221
25f5 cdc84c    call    $4cc8
25f8 cddf4c    call    $4cdf
25fb cdb824    call    $24b8
25fe 213c90    ld      hl,$903c
2601 e5        push    hl
2602 210a90    ld      hl,$900a
2605 e5        push    hl
2606 cdd324    call    $24d3
2609 d1        pop     de
260a 210a90    ld      hl,$900a
260d e3        ex      (sp),hl
260e cd1423    call    $2314
2611 d1        pop     de
2612 2003      jr      nz,$2617
2614 cd3957    call    $5739
2617 cd5722    call    $2257
261a cdb549    call    $49b5
261d 210100    ld      hl,$0001
2620 220890    ld      ($9008),hl
2623 1803      jr      $2628
2625 cd4e01    call    $014e
2628 2a0890    ld      hl,($9008)
262b 7c        ld      a,h
262c b5        or      l
262d 2802      jr      z,$2631
262f 18f4      jr      $2625
2631 cdc549    call    $49c5
2634 cd443c    call    $3c44
2637 c37c4b    jp      $4b7c
263a cdc84c    call    $4cc8
263d cddf4c    call    $4cdf
2640 cdb824    call    $24b8
2643 213c90    ld      hl,$903c
2646 e5        push    hl
2647 210a90    ld      hl,$900a
264a e5        push    hl
264b cdfa24    call    $24fa
264e d1        pop     de
264f d1        pop     de
2650 cd2543    call    $4325
2653 210a90    ld      hl,$900a
2656 e5        push    hl
2657 cd5923    call    $2359
265a d1        pop     de
265b cd6f22    call    $226f
265e cd1c43    call    $431c
2661 cd1c43    call    $431c
2664 cdb337    call    $37b3
2667 210100    ld      hl,$0001
266a e5        push    hl
266b cdaa41    call    $41aa
266e e5        push    hl
266f cdb538    call    $38b5
2672 d1        pop     de
2673 d1        pop     de
2674 cdfc37    call    $37fc
2677 210200    ld      hl,$0002
267a e5        push    hl
267b cdaa41    call    $41aa
267e e5        push    hl
267f cdb538    call    $38b5
2682 d1        pop     de
2683 d1        pop     de
2684 cd2543    call    $4325
2687 210100    ld      hl,$0001
268a e5        push    hl
268b cdf53a    call    $3af5
268e 210300    ld      hl,$0003
2691 e3        ex      (sp),hl
2692 cdaa41    call    $41aa
2695 e5        push    hl
2696 cdb538    call    $38b5
2699 d1        pop     de
269a d1        pop     de
269b cd2122    call    $2221
269e c37c4b    jp      $4b7c
26a1 213c90    ld      hl,$903c
26a4 e5        push    hl
26a5 cdaa26    call    $26aa
26a8 d1        pop     de
26a9 c9        ret     

26aa cd0585    call    $8505
26ad dcffcd    call    c,$cdff
26b0 b8        cp      b
26b1 24        inc     h
26b2 cd2c20    call    $202c
26b5 212c00    ld      hl,$002c
26b8 39        add     hl,sp
26b9 5e        ld      e,(hl)
26ba 23        inc     hl
26bb 56        ld      d,(hl)
26bc d5        push    de
26bd 210600    ld      hl,$0006
26c0 39        add     hl,sp
26c1 44        ld      b,h
26c2 4d        ld      c,l
26c3 e5        push    hl
26c4 cd8c23    call    $238c
26c7 d1        pop     de
26c8 d1        pop     de
26c9 c5        push    bc
26ca cd4a20    call    $204a
26cd d1        pop     de
26ce 2808      jr      z,$26d8
26d0 c5        push    bc
26d1 cd0e20    call    $200e
26d4 d1        pop     de
26d5 c37c4b    jp      $4b7c
26d8 c3c557    jp      $57c5
26db cd0585    call    $8505
26de dcffcd    call    c,$cdff
26e1 b8        cp      b
26e2 24        inc     h
26e3 211400    ld      hl,$0014
26e6 39        add     hl,sp
26e7 44        ld      b,h
26e8 4d        ld      c,l
26e9 e5        push    hl
26ea cdfa24    call    $24fa
26ed d1        pop     de
26ee c5        push    bc
26ef cdd324    call    $24d3
26f2 d1        pop     de
26f3 211400    ld      hl,$0014
26f6 39        add     hl,sp
26f7 7e        ld      a,(hl)
26f8 b7        or      a
26f9 2816      jr      z,$2711
26fb 211400    ld      hl,$0014
26fe 39        add     hl,sp
26ff 5e        ld      e,(hl)
2700 1600      ld      d,$00
2702 210400    ld      hl,$0004
2705 39        add     hl,sp
2706 6e        ld      l,(hl)
2707 2600      ld      h,$00
2709 cd4885    call    $8548
270c 2803      jr      z,$2711
270e cd3b55    call    $553b
2711 c5        push    bc
2712 211700    ld      hl,$0017
2715 e5        push    hl
2716 cdbc86    call    $86bc
2719 d1        pop     de
271a d1        pop     de
271b c37c4b    jp      $4b7c
271e 213c90    ld      hl,$903c
2721 e5        push    hl
2722 cd2727    call    $2727
2725 d1        pop     de
2726 c9        ret     

2727 cd0585    call    $8505
272a dcff21    call    c,$21ff
272d 2c        inc     l
272e 00        nop     
272f 39        add     hl,sp
2730 4e        ld      c,(hl)
2731 23        inc     hl
2732 46        ld      b,(hl)
2733 cd904b    call    $4b90
2736 2824      jr      z,$275c
2738 210000    ld      hl,$0000
273b eb        ex      de,hl
273c 210400    ld      hl,$0004
273f 39        add     hl,sp
2740 73        ld      (hl),e
2741 217327    ld      hl,$2773
2744 e5        push    hl
2745 210700    ld      hl,$0007
2748 39        add     hl,sp
2749 e5        push    hl
274a cd887b    call    $7b88
274d d1        pop     de
274e d1        pop     de
274f c5        push    bc
2750 210f00    ld      hl,$000f
2753 39        add     hl,sp
2754 e5        push    hl
2755 cd887b    call    $7b88
2758 d1        pop     de
2759 d1        pop     de
275a 180b      jr      $2767
275c c5        push    bc
275d 210600    ld      hl,$0006
2760 39        add     hl,sp
2761 e5        push    hl
2762 cd8c23    call    $238c
2765 d1        pop     de
2766 d1        pop     de
2767 210400    ld      hl,$0004
276a 39        add     hl,sp
276b e5        push    hl
276c cd6420    call    $2064
276f d1        pop     de
2770 c33743    jp      $4337
2773 3f        ccf     
2774 3f        ccf     
2775 3f        ccf     
2776 3f        ccf     
2777 3f        ccf     
2778 3f        ccf     
2779 3f        ccf     
277a 3f        ccf     
277b 00        nop     
277c cd5e10    call    $105e
277f cd2320    call    $2023
2782 114100    ld      de,$0041
2785 19        add     hl,de
2786 e5        push    hl
2787 cdc966    call    $66c9
278a 213a00    ld      hl,$003a
278d e3        ex      (sp),hl
278e cdc966    call    $66c9
2791 d1        pop     de
2792 cd7410    call    $1074
2795 c3d84b    jp      $4bd8
2798 cd0585    call    $8505
279b dcff21    call    c,$21ff
279e 3c        inc     a
279f 90        sub     b
27a0 e5        push    hl
27a1 210600    ld      hl,$0006
27a4 39        add     hl,sp
27a5 e5        push    hl
27a6 cd8c23    call    $238c
27a9 d1        pop     de
27aa d1        pop     de
27ab 210400    ld      hl,$0004
27ae 39        add     hl,sp
27af 7c        ld      a,h
27b0 b5        or      l
27b1 2825      jr      z,$27d8
27b3 210500    ld      hl,$0005
27b6 39        add     hl,sp
27b7 5e        ld      e,(hl)
27b8 1600      ld      d,$00
27ba 213f00    ld      hl,$003f
27bd cd3c85    call    $853c
27c0 2816      jr      z,$27d8
27c2 210400    ld      hl,$0004
27c5 39        add     hl,sp
27c6 5e        ld      e,(hl)
27c7 1600      ld      d,$00
27c9 eb        ex      de,hl
27ca 2b        dec     hl
27cb e5        push    hl
27cc 210e00    ld      hl,$000e
27cf e5        push    hl
27d0 cdbc86    call    $86bc
27d3 d1        pop     de
27d4 d1        pop     de
27d5 c37c4b    jp      $4b7c
27d8 c33b55    jp      $553b
27db cde127    call    $27e1
27de c3c066    jp      $66c0
27e1 cda98b    call    $8ba9
27e4 210100    ld      hl,$0001
27e7 e5        push    hl
27e8 cdd249    call    $49d2
27eb d1        pop     de
27ec 44        ld      b,h
27ed 4d        ld      c,l
27ee e5        push    hl
27ef cdee49    call    $49ee
27f2 d1        pop     de
27f3 c0        ret     nz

27f4 cd324a    call    $4a32
27f7 cd1228    call    $2812
27fa 0b        dec     bc
27fb 60        ld      h,b
27fc 69        ld      l,c
27fd e5        push    hl
27fe cdee49    call    $49ee
2801 d1        pop     de
2802 200b      jr      nz,$280f
2804 cdd76b    call    $6bd7
2807 cd324a    call    $4a32
280a cd1228    call    $2812
280d 18eb      jr      $27fa
280f c37c4b    jp      $4b7c
2812 2af48f    ld      hl,($8ff4)
2815 7c        ld      a,h
2816 b5        or      l
2817 281c      jr      z,$2835
2819 2af48f    ld      hl,($8ff4)
281c e5        push    hl
281d cdd944    call    $44d9
2820 d1        pop     de
2821 280a      jr      z,$282d
2823 2af48f    ld      hl,($8ff4)
2826 e5        push    hl
2827 cd8835    call    $3588
282a d1        pop     de
282b 1808      jr      $2835
282d 2af48f    ld      hl,($8ff4)
2830 e5        push    hl
2831 cda835    call    $35a8
2834 d1        pop     de
2835 c9        ret     

2836 2a768f    ld      hl,($8f76)
2839 2600      ld      h,$00
283b e5        push    hl
283c cdb584    call    $84b5
283f d1        pop     de
2840 c8        ret     z

2841 cd4b28    call    $284b
2844 c0        ret     nz

2845 cd6f28    call    $286f
2848 18ec      jr      $2836
284a c9        ret     

284b 2a768f    ld      hl,($8f76)
284e 2600      ld      h,$00
2850 110a00    ld      de,$000a
2853 c33c85    jp      $853c
2856 cda98b    call    $8ba9
2859 2a768f    ld      hl,($8f76)
285c 2600      ld      h,$00
285e 7c        ld      a,h
285f b5        or      l
2860 2809      jr      z,$286b
2862 cd4b28    call    $284b
2865 2004      jr      nz,$286b
2867 210000    ld      hl,$0000
286a c9        ret     

286b 210100    ld      hl,$0001
286e c9        ret     

286f 2a768f    ld      hl,($8f76)
2872 2600      ld      h,$00
2874 7d        ld      a,l
2875 32778f    ld      ($8f77),a
2878 2af88f    ld      hl,($8ff8)
287b 110200    ld      de,$0002
287e cd3c85    call    $853c
2881 2803      jr      z,$2886
2883 cdf321    call    $21f3
2886 2a748f    ld      hl,($8f74)
2889 23        inc     hl
288a 22748f    ld      ($8f74),hl
288d 5e        ld      e,(hl)
288e 1600      ld      d,$00
2890 eb        ex      de,hl
2891 7d        ld      a,l
2892 32768f    ld      ($8f76),a
2895 c9        ret     

2896 cda98b    call    $8ba9
2899 2a748f    ld      hl,($8f74)
289c 7e        ld      a,(hl)
289d b7        or      a
289e 2025      jr      nz,$28c5
28a0 210800    ld      hl,$0008
28a3 39        add     hl,sp
28a4 5e        ld      e,(hl)
28a5 1600      ld      d,$00
28a7 213e00    ld      hl,$003e
28aa cd3c85    call    $853c
28ad 2812      jr      z,$28c1
28af 21c928    ld      hl,$28c9
28b2 e5        push    hl
28b3 21da8c    ld      hl,$8cda
28b6 22748f    ld      ($8f74),hl
28b9 e5        push    hl
28ba cd887b    call    $7b88
28bd d1        pop     de
28be d1        pop     de
28bf 1804      jr      $28c5
28c1 210100    ld      hl,$0001
28c4 c9        ret     

28c5 210000    ld      hl,$0000
28c8 c9        ret     

28c9 65        ld      h,l
28ca 6e        ld      l,(hl)
28cb 64        ld      h,h
28cc 00        nop     
28cd 2a728f    ld      hl,($8f72)
28d0 23        inc     hl
28d1 22728f    ld      ($8f72),hl
28d4 2a7a8f    ld      hl,($8f7a)
28d7 2b        dec     hl
28d8 227a8f    ld      ($8f7a),hl
28db c9        ret     

28dc cda98b    call    $8ba9
28df 210800    ld      hl,$0008
28e2 39        add     hl,sp
28e3 4e        ld      c,(hl)
28e4 23        inc     hl
28e5 46        ld      b,(hl)
28e6 50        ld      d,b
28e7 59        ld      e,c
28e8 212000    ld      hl,$0020
28eb cd6d85    call    $856d
28ee 2803      jr      z,$28f3
28f0 cdab66    call    $66ab
28f3 2af88f    ld      hl,($8ff8)
28f6 110200    ld      de,$0002
28f9 cd3c85    call    $853c
28fc 2847      jr      z,$2945
28fe 2a0290    ld      hl,($9002)
2901 7c        ld      a,h
2902 b5        or      l
2903 2833      jr      z,$2938
2905 210a90    ld      hl,$900a
2908 e5        push    hl
2909 cd3a23    call    $233a
290c d1        pop     de
290d 210000    ld      hl,$0000
2910 220890    ld      ($9008),hl
2913 2a9f8c    ld      hl,($8c9f)
2916 7c        ld      a,h
2917 b5        or      l
2918 280b      jr      z,$2925
291a cd443c    call    $3c44
291d 210000    ld      hl,$0000
2920 229f8c    ld      ($8c9f),hl
2923 180c      jr      $2931
2925 210000    ld      hl,$0000
2928 e5        push    hl
2929 21da8c    ld      hl,$8cda
292c 22748f    ld      ($8f74),hl
292f d1        pop     de
2930 73        ld      (hl),e
2931 c5        push    bc
2932 cd9628    call    $2896
2935 d1        pop     de
2936 180d      jr      $2945
2938 2a0090    ld      hl,($9000)
293b 11da8c    ld      de,$8cda
293e 19        add     hl,de
293f 2b        dec     hl
2940 2b        dec     hl
2941 2b        dec     hl
2942 22748f    ld      ($8f74),hl
2945 2af88f    ld      hl,($8ff8)
2948 110100    ld      de,$0001
294b cd3c85    call    $853c
294e 2812      jr      z,$2962
2950 cd4b28    call    $284b
2953 2803      jr      z,$2958
2955 cd6f28    call    $286f
2958 c5        push    bc
2959 cd9628    call    $2896
295c d1        pop     de
295d 2803      jr      z,$2962
295f cd443c    call    $3c44
2962 2af88f    ld      hl,($8ff8)
2965 7c        ld      a,h
2966 b5        or      l
2967 203d      jr      nz,$29a6
2969 60        ld      h,b
296a 69        ld      l,c
296b 113f00    ld      de,$003f
296e cd3c85    call    $853c
2971 2821      jr      z,$2994
2973 2a9d8c    ld      hl,($8c9d)
2976 7c        ld      a,h
2977 b5        or      l
2978 2805      jr      z,$297f
297a 212100    ld      hl,$0021
297d 44        ld      b,h
297e 4d        ld      c,l
297f cde043    call    $43e0
2982 cd2e44    call    $442e
2985 280d      jr      z,$2994
2987 cde943    call    $43e9
298a e5        push    hl
298b cd3936    call    $3639
298e d1        pop     de
298f cdd76b    call    $6bd7
2992 18ee      jr      $2982
2994 78        ld      a,b
2995 b1        or      c
2996 2805      jr      z,$299d
2998 c5        push    bc
2999 cd3f67    call    $673f
299c d1        pop     de
299d cdc65b    call    $5bc6
29a0 21da8c    ld      hl,$8cda
29a3 22748f    ld      ($8f74),hl
29a6 210000    ld      hl,$0000
29a9 229e8f    ld      ($8f9e),hl
29ac 2a748f    ld      hl,($8f74)
29af 5e        ld      e,(hl)
29b0 1600      ld      d,$00
29b2 eb        ex      de,hl
29b3 228a8f    ld      ($8f8a),hl
29b6 2aa28f    ld      hl,($8fa2)
29b9 7c        ld      a,h
29ba b5        or      l
29bb 281a      jr      z,$29d7
29bd 2a748f    ld      hl,($8f74)
29c0 5e        ld      e,(hl)
29c1 1600      ld      d,$00
29c3 212000    ld      hl,$0020
29c6 cd3c85    call    $853c
29c9 280c      jr      z,$29d7
29cb cd6f28    call    $286f
29ce 2a9e8f    ld      hl,($8f9e)
29d1 23        inc     hl
29d2 229e8f    ld      ($8f9e),hl
29d5 18e6      jr      $29bd
29d7 2a748f    ld      hl,($8f74)
29da 5e        ld      e,(hl)
29db 1600      ld      d,$00
29dd eb        ex      de,hl
29de 7d        ld      a,l
29df 32768f    ld      ($8f76),a
29e2 210a00    ld      hl,$000a
29e5 7d        ld      a,l
29e6 32778f    ld      ($8f77),a
29e9 c3ef2b    jp      $2bef
29ec cda98b    call    $8ba9
29ef 210a00    ld      hl,$000a
29f2 39        add     hl,sp
29f3 4e        ld      c,(hl)
29f4 23        inc     hl
29f5 46        ld      b,(hl)
29f6 60        ld      h,b
29f7 69        ld      l,c
29f8 7e        ld      a,(hl)
29f9 b7        or      a
29fa 281a      jr      z,$2a16
29fc 60        ld      h,b
29fd 69        ld      l,c
29fe 03        inc     bc
29ff 5e        ld      e,(hl)
2a00 1600      ld      d,$00
2a02 d5        push    de
2a03 210a00    ld      hl,$000a
2a06 39        add     hl,sp
2a07 5e        ld      e,(hl)
2a08 1600      ld      d,$00
2a0a e1        pop     hl
2a0b cd3c85    call    $853c
2a0e 2804      jr      z,$2a14
2a10 210100    ld      hl,$0001
2a13 c9        ret     

2a14 18e0      jr      $29f6
2a16 210000    ld      hl,$0000
2a19 c9        ret     

2a1a cda98b    call    $8ba9
2a1d 210800    ld      hl,$0008
2a20 39        add     hl,sp
2a21 4e        ld      c,(hl)
2a22 23        inc     hl
2a23 46        ld      b,(hl)
2a24 c5        push    bc
2a25 cd452a    call    $2a45
2a28 d1        pop     de
2a29 2804      jr      z,$2a2f
2a2b 210100    ld      hl,$0001
2a2e c9        ret     

2a2f 213a2a    ld      hl,$2a3a
2a32 e5        push    hl
2a33 c5        push    bc
2a34 cdec29    call    $29ec
2a37 d1        pop     de
2a38 d1        pop     de
2a39 c9        ret     

2a3a 2829      jr      z,$2a65
2a3c 3d        dec     a
2a3d 3c        inc     a
2a3e 3e2b      ld      a,$2b
2a40 2d        dec     l
2a41 2a2f3b    ld      hl,($3b2f)
2a44 00        nop     
2a45 cda98b    call    $8ba9
2a48 215a2a    ld      hl,$2a5a
2a4b e5        push    hl
2a4c 210a00    ld      hl,$000a
2a4f 39        add     hl,sp
2a50 5e        ld      e,(hl)
2a51 1600      ld      d,$00
2a53 d5        push    de
2a54 cdec29    call    $29ec
2a57 d1        pop     de
2a58 d1        pop     de
2a59 c9        ret     

2a5a 205b      jr      nz,$2ab7
2a5c 5d        ld      e,l
2a5d 09        add     hl,bc
2a5e 0a        ld      a,(bc)
2a5f 00        nop     
2a60 2a768f    ld      hl,($8f76)
2a63 2600      ld      h,$00
2a65 e5        push    hl
2a66 cd1a2a    call    $2a1a
2a69 d1        pop     de
2a6a c9        ret     

2a6b cda98b    call    $8ba9
2a6e 2a778f    ld      hl,($8f77)
2a71 2600      ld      h,$00
2a73 7c        ld      a,h
2a74 b5        or      l
2a75 280d      jr      z,$2a84
2a77 2a778f    ld      hl,($8f77)
2a7a 2600      ld      h,$00
2a7c 112900    ld      de,$0029
2a7f cd3c85    call    $853c
2a82 2804      jr      z,$2a88
2a84 210000    ld      hl,$0000
2a87 c9        ret     

2a88 2a778f    ld      hl,($8f77)
2a8b 2600      ld      h,$00
2a8d e5        push    hl
2a8e cd1a2a    call    $2a1a
2a91 d1        pop     de
2a92 c9        ret     

2a93 cda98b    call    $8ba9
2a96 210800    ld      hl,$0008
2a99 39        add     hl,sp
2a9a 4e        ld      c,(hl)
2a9b 23        inc     hl
2a9c 46        ld      b,(hl)
2a9d 50        ld      d,b
2a9e 59        ld      e,c
2a9f 213000    ld      hl,$0030
2aa2 cd5585    call    $8555
2aa5 280a      jr      z,$2ab1
2aa7 50        ld      d,b
2aa8 59        ld      e,c
2aa9 213900    ld      hl,$0039
2aac cd5685    call    $8556
2aaf 2004      jr      nz,$2ab5
2ab1 210000    ld      hl,$0000
2ab4 c9        ret     

2ab5 210100    ld      hl,$0001
2ab8 c9        ret     

2ab9 cd5628    call    $2856
2abc 2809      jr      z,$2ac7
2abe 210000    ld      hl,$0000
2ac1 227c8f    ld      ($8f7c),hl
2ac4 c3ad2b    jp      $2bad
2ac7 2a768f    ld      hl,($8f76)
2aca 2600      ld      h,$00
2acc 112200    ld      de,$0022
2acf cd3c85    call    $853c
2ad2 2809      jr      z,$2add
2ad4 210200    ld      hl,$0002
2ad7 227c8f    ld      ($8f7c),hl
2ada c3ad2b    jp      $2bad
2add 2a768f    ld      hl,($8f76)
2ae0 2600      ld      h,$00
2ae2 113a00    ld      de,$003a
2ae5 cd3c85    call    $853c
2ae8 2809      jr      z,$2af3
2aea 210400    ld      hl,$0004
2aed 227c8f    ld      ($8f7c),hl
2af0 c3ad2b    jp      $2bad
2af3 2a768f    ld      hl,($8f76)
2af6 2600      ld      h,$00
2af8 112e00    ld      de,$002e
2afb cd3c85    call    $853c
2afe 281c      jr      z,$2b1c
2b00 cd6b2a    call    $2a6b
2b03 2817      jr      z,$2b1c
2b05 2a748f    ld      hl,($8f74)
2b08 23        inc     hl
2b09 5e        ld      e,(hl)
2b0a 1600      ld      d,$00
2b0c d5        push    de
2b0d cd932a    call    $2a93
2b10 d1        pop     de
2b11 2809      jr      z,$2b1c
2b13 210600    ld      hl,$0006
2b16 227c8f    ld      ($8f7c),hl
2b19 c3ad2b    jp      $2bad
2b1c 2a768f    ld      hl,($8f76)
2b1f 2600      ld      h,$00
2b21 e5        push    hl
2b22 cd932a    call    $2a93
2b25 d1        pop     de
2b26 2809      jr      z,$2b31
2b28 210600    ld      hl,$0006
2b2b 227c8f    ld      ($8f7c),hl
2b2e c3ad2b    jp      $2bad
2b31 2a768f    ld      hl,($8f76)
2b34 2600      ld      h,$00
2b36 112d00    ld      de,$002d
2b39 cd3c85    call    $853c
2b3c 2869      jr      z,$2ba7
2b3e cd6b2a    call    $2a6b
2b41 2864      jr      z,$2ba7
2b43 2a748f    ld      hl,($8f74)
2b46 23        inc     hl
2b47 5e        ld      e,(hl)
2b48 1600      ld      d,$00
2b4a d5        push    de
2b4b cd932a    call    $2a93
2b4e d1        pop     de
2b4f 201e      jr      nz,$2b6f
2b51 2a748f    ld      hl,($8f74)
2b54 23        inc     hl
2b55 5e        ld      e,(hl)
2b56 1600      ld      d,$00
2b58 212e00    ld      hl,$002e
2b5b cd3c85    call    $853c
2b5e 2817      jr      z,$2b77
2b60 2a748f    ld      hl,($8f74)
2b63 23        inc     hl
2b64 23        inc     hl
2b65 5e        ld      e,(hl)
2b66 1600      ld      d,$00
2b68 d5        push    de
2b69 cd932a    call    $2a93
2b6c d1        pop     de
2b6d 2808      jr      z,$2b77
2b6f 210600    ld      hl,$0006
2b72 227c8f    ld      ($8f7c),hl
2b75 182e      jr      $2ba5
2b77 2a748f    ld      hl,($8f74)
2b7a 23        inc     hl
2b7b 5e        ld      e,(hl)
2b7c 1600      ld      d,$00
2b7e 212800    ld      hl,$0028
2b81 cd3c85    call    $853c
2b84 2013      jr      nz,$2b99
2b86 2a748f    ld      hl,($8f74)
2b89 23        inc     hl
2b8a 5e        ld      e,(hl)
2b8b 1600      ld      d,$00
2b8d d5        push    de
2b8e cd1a2a    call    $2a1a
2b91 d1        pop     de
2b92 2805      jr      z,$2b99
2b94 210000    ld      hl,$0000
2b97 1803      jr      $2b9c
2b99 210100    ld      hl,$0001
2b9c 22888f    ld      ($8f88),hl
2b9f 210800    ld      hl,$0008
2ba2 227c8f    ld      ($8f7c),hl
2ba5 1806      jr      $2bad
2ba7 210800    ld      hl,$0008
2baa 227c8f    ld      ($8f7c),hl
2bad c9        ret     

2bae cd6f28    call    $286f
2bb1 2a7a8f    ld      hl,($8f7a)
2bb4 23        inc     hl
2bb5 227a8f    ld      ($8f7a),hl
2bb8 c9        ret     

2bb9 cd602a    call    $2a60
2bbc c0        ret     nz

2bbd 2a768f    ld      hl,($8f76)
2bc0 2600      ld      h,$00
2bc2 115c00    ld      de,$005c
2bc5 cd3c85    call    $853c
2bc8 2803      jr      z,$2bcd
2bca cdae2b    call    $2bae
2bcd 2a768f    ld      hl,($8f76)
2bd0 2600      ld      h,$00
2bd2 e5        push    hl
2bd3 cd8b66    call    $668b
2bd6 d1        pop     de
2bd7 c0        ret     nz

2bd8 cdae2b    call    $2bae
2bdb 18dc      jr      $2bb9
2bdd c9        ret     

2bde 2a768f    ld      hl,($8f76)
2be1 2600      ld      h,$00
2be3 e5        push    hl
2be4 cd932a    call    $2a93
2be7 d1        pop     de
2be8 c8        ret     z

2be9 cdae2b    call    $2bae
2bec 18f0      jr      $2bde
2bee c9        ret     

2bef cd3628    call    $2836
2bf2 2af88f    ld      hl,($8ff8)
2bf5 110200    ld      de,$0002
2bf8 cd3c85    call    $853c
2bfb 2835      jr      z,$2c32
2bfd 2a0090    ld      hl,($9000)
2c00 11da8c    ld      de,$8cda
2c03 19        add     hl,de
2c04 2b        dec     hl
2c05 2b        dec     hl
2c06 2b        dec     hl
2c07 5e        ld      e,(hl)
2c08 1600      ld      d,$00
2c0a 210a00    ld      hl,$000a
2c0d cd3c85    call    $853c
2c10 2803      jr      z,$2c15
2c12 cdf321    call    $21f3
2c15 2a0090    ld      hl,($9000)
2c18 11da8c    ld      de,$8cda
2c1b 19        add     hl,de
2c1c 2b        dec     hl
2c1d 2b        dec     hl
2c1e 2b        dec     hl
2c1f e5        push    hl
2c20 21da8c    ld      hl,$8cda
2c23 22748f    ld      ($8f74),hl
2c26 e5        push    hl
2c27 cd887b    call    $7b88
2c2a d1        pop     de
2c2b d1        pop     de
2c2c 210300    ld      hl,$0003
2c2f 220090    ld      ($9000),hl
2c32 2a748f    ld      hl,($8f74)
2c35 22728f    ld      ($8f72),hl
2c38 210000    ld      hl,$0000
2c3b 227a8f    ld      ($8f7a),hl
2c3e 210000    ld      hl,$0000
2c41 22888f    ld      ($8f88),hl
2c44 cdb92a    call    $2ab9
2c47 2a7c8f    ld      hl,($8f7c)
2c4a c3f02c    jp      $2cf0
2c4d 210000    ld      hl,$0000
2c50 227a8f    ld      ($8f7a),hl
2c53 c9        ret     

2c54 cdae2b    call    $2bae
2c57 2a768f    ld      hl,($8f76)
2c5a 2600      ld      h,$00
2c5c e5        push    hl
2c5d cd452a    call    $2a45
2c60 d1        pop     de
2c61 c20b2d    jp      nz,$2d0b
2c64 cd602a    call    $2a60
2c67 2803      jr      z,$2c6c
2c69 cdae2b    call    $2bae
2c6c cdb92b    call    $2bb9
2c6f c30b2d    jp      $2d0b
2c72 cdb92b    call    $2bb9
2c75 c30b2d    jp      $2d0b
2c78 2a768f    ld      hl,($8f76)
2c7b 2600      ld      h,$00
2c7d 112d00    ld      de,$002d
2c80 cd3c85    call    $853c
2c83 2803      jr      z,$2c88
2c85 cdae2b    call    $2bae
2c88 cdde2b    call    $2bde
2c8b 2a768f    ld      hl,($8f76)
2c8e 2600      ld      h,$00
2c90 112e00    ld      de,$002e
2c93 cd3c85    call    $853c
2c96 2806      jr      z,$2c9e
2c98 cdae2b    call    $2bae
2c9b cdde2b    call    $2bde
2c9e 2a768f    ld      hl,($8f76)
2ca1 2600      ld      h,$00
2ca3 e5        push    hl
2ca4 cdd284    call    $84d2
2ca7 d1        pop     de
2ca8 114500    ld      de,$0045
2cab cd3c85    call    $853c
2cae 2823      jr      z,$2cd3
2cb0 cdae2b    call    $2bae
2cb3 2a768f    ld      hl,($8f76)
2cb6 2600      ld      h,$00
2cb8 112b00    ld      de,$002b
2cbb cd3c85    call    $853c
2cbe 200d      jr      nz,$2ccd
2cc0 2a768f    ld      hl,($8f76)
2cc3 2600      ld      h,$00
2cc5 112d00    ld      de,$002d
2cc8 cd3c85    call    $853c
2ccb 2803      jr      z,$2cd0
2ccd cdae2b    call    $2bae
2cd0 cdde2b    call    $2bde
2cd3 217e8f    ld      hl,$8f7e
2cd6 e5        push    hl
2cd7 2a728f    ld      hl,($8f72)
2cda e5        push    hl
2cdb cd0787    call    $8707
2cde d1        pop     de
2cdf e1        pop     hl
2ce0 c3857c    jp      $7c85
2ce3 cd602a    call    $2a60
2ce6 2803      jr      z,$2ceb
2ce8 c3ae2b    jp      $2bae
2ceb cdb92b    call    $2bb9
2cee 181b      jr      $2d0b
2cf0 cd3586    call    $8635
2cf3 05        dec     b
2cf4 00        nop     
2cf5 00        nop     
2cf6 00        nop     
2cf7 4d        ld      c,l
2cf8 2c        inc     l
2cf9 02        ld      (bc),a
2cfa 00        nop     
2cfb 54        ld      d,h
2cfc 2c        inc     l
2cfd 04        inc     b
2cfe 00        nop     
2cff 72        ld      (hl),d
2d00 2c        inc     l
2d01 0600      ld      b,$00
2d03 78        ld      a,b
2d04 2c        inc     l
2d05 08        ex      af,af'
2d06 00        nop     
2d07 e3        ex      (sp),hl
2d08 2c        inc     l
2d09 0b        dec     bc
2d0a 2d        dec     l
2d0b 210000    ld      hl,$0000
2d0e 7d        ld      a,l
2d0f 32778f    ld      ($8f77),a
2d12 c9        ret     

2d13 cd5628    call    $2856
2d16 2005      jr      nz,$2d1d
2d18 cdae2b    call    $2bae
2d1b 18f6      jr      $2d13
2d1d 210800    ld      hl,$0008
2d20 227c8f    ld      ($8f7c),hl
2d23 c9        ret     

2d24 cda98b    call    $8ba9
2d27 210800    ld      hl,$0008
2d2a 39        add     hl,sp
2d2b 4e        ld      c,(hl)
2d2c 23        inc     hl
2d2d 46        ld      b,(hl)
2d2e 2a7c8f    ld      hl,($8f7c)
2d31 110800    ld      de,$0008
2d34 cd4885    call    $8548
2d37 2804      jr      z,$2d3d
2d39 210000    ld      hl,$0000
2d3c c9        ret     

2d3d 2a7a8f    ld      hl,($8f7a)
2d40 22cc90    ld      ($90cc),hl
2d43 2a728f    ld      hl,($8f72)
2d46 22ce90    ld      ($90ce),hl
2d49 60        ld      h,b
2d4a 69        ld      l,c
2d4b 7e        ld      a,(hl)
2d4c b7        or      a
2d4d 2833      jr      z,$2d82
2d4f 2acc90    ld      hl,($90cc)
2d52 2b        dec     hl
2d53 22cc90    ld      ($90cc),hl
2d56 23        inc     hl
2d57 7c        ld      a,h
2d58 b5        or      l
2d59 2004      jr      nz,$2d5f
2d5b 210000    ld      hl,$0000
2d5e c9        ret     

2d5f 60        ld      h,b
2d60 69        ld      l,c
2d61 03        inc     bc
2d62 5e        ld      e,(hl)
2d63 1600      ld      d,$00
2d65 d5        push    de
2d66 2ace90    ld      hl,($90ce)
2d69 23        inc     hl
2d6a 22ce90    ld      ($90ce),hl
2d6d 2b        dec     hl
2d6e 5e        ld      e,(hl)
2d6f 1600      ld      d,$00
2d71 d5        push    de
2d72 cde784    call    $84e7
2d75 d1        pop     de
2d76 d1        pop     de
2d77 cd4885    call    $8548
2d7a 2804      jr      z,$2d80
2d7c 210000    ld      hl,$0000
2d7f c9        ret     

2d80 18c7      jr      $2d49
2d82 2acc90    ld      hl,($90cc)
2d85 c3f685    jp      $85f6
2d88 cda98b    call    $8ba9
2d8b 2a7a8f    ld      hl,($8f7a)
2d8e 2b        dec     hl
2d8f 7c        ld      a,h
2d90 b5        or      l
2d91 2804      jr      z,$2d97
2d93 210000    ld      hl,$0000
2d96 c9        ret     

2d97 210800    ld      hl,$0008
2d9a 39        add     hl,sp
2d9b 5e        ld      e,(hl)
2d9c 1600      ld      d,$00
2d9e d5        push    de
2d9f cdad2d    call    $2dad
2da2 d1        pop     de
2da3 c9        ret     

2da4 213b00    ld      hl,$003b
2da7 e5        push    hl
2da8 cdad2d    call    $2dad
2dab d1        pop     de
2dac c9        ret     

2dad cda98b    call    $8ba9
2db0 2a7c8f    ld      hl,($8f7c)
2db3 110800    ld      de,$0008
2db6 cd3c85    call    $853c
2db9 2812      jr      z,$2dcd
2dbb 2a728f    ld      hl,($8f72)
2dbe 5e        ld      e,(hl)
2dbf 1600      ld      d,$00
2dc1 210800    ld      hl,$0008
2dc4 39        add     hl,sp
2dc5 6e        ld      l,(hl)
2dc6 2600      ld      h,$00
2dc8 cd3c85    call    $853c
2dcb 2004      jr      nz,$2dd1
2dcd 210000    ld      hl,$0000
2dd0 c9        ret     

2dd1 210100    ld      hl,$0001
2dd4 c9        ret     

2dd5 cda98b    call    $8ba9
2dd8 210800    ld      hl,$0008
2ddb 39        add     hl,sp
2ddc 4e        ld      c,(hl)
2ddd 23        inc     hl
2dde 46        ld      b,(hl)
2ddf 50        ld      d,b
2de0 59        ld      e,c
2de1 210000    ld      hl,$0000
2de4 cd6c85    call    $856c
2de7 280f      jr      z,$2df8
2de9 212d00    ld      hl,$002d
2dec e5        push    hl
2ded cdc966    call    $66c9
2df0 d1        pop     de
2df1 60        ld      h,b
2df2 69        ld      l,c
2df3 cdec85    call    $85ec
2df6 44        ld      b,h
2df7 4d        ld      c,l
2df8 50        ld      d,b
2df9 59        ld      e,c
2dfa 210a00    ld      hl,$000a
2dfd cd2285    call    $8522
2e00 22d090    ld      ($90d0),hl
2e03 7c        ld      a,h
2e04 b5        or      l
2e05 2808      jr      z,$2e0f
2e07 2ad090    ld      hl,($90d0)
2e0a e5        push    hl
2e0b cdd52d    call    $2dd5
2e0e d1        pop     de
2e0f 50        ld      d,b
2e10 59        ld      e,c
2e11 210a00    ld      hl,$000a
2e14 cd8285    call    $8582
2e17 113000    ld      de,$0030
2e1a 19        add     hl,de
2e1b e5        push    hl
2e1c cdc966    call    $66c9
2e1f d1        pop     de
2e20 c9        ret     

2e21 cda98b    call    $8ba9
2e24 210800    ld      hl,$0008
2e27 39        add     hl,sp
2e28 4e        ld      c,(hl)
2e29 23        inc     hl
2e2a 46        ld      b,(hl)
2e2b 60        ld      h,b
2e2c 69        ld      l,c
2e2d cdf886    call    $86f8
2e30 5e        ld      e,(hl)
2e31 1600      ld      d,$00
2e33 217f00    ld      hl,$007f
2e36 cd3c85    call    $853c
2e39 2804      jr      z,$2e3f
2e3b 210100    ld      hl,$0001
2e3e c9        ret     

2e3f 210000    ld      hl,$0000
2e42 c9        ret     

2e43 cda98b    call    $8ba9
2e46 210800    ld      hl,$0008
2e49 39        add     hl,sp
2e4a 4e        ld      c,(hl)
2e4b 23        inc     hl
2e4c 46        ld      b,(hl)
2e4d 2a7a8f    ld      hl,($8f7a)
2e50 22d490    ld      ($90d4),hl
2e53 2a728f    ld      hl,($8f72)
2e56 22d690    ld      ($90d6),hl
2e59 60        ld      h,b
2e5a 69        ld      l,c
2e5b cdff86    call    $86ff
2e5e cdf886    call    $86f8
2e61 44        ld      b,h
2e62 4d        ld      c,l
2e63 1807      jr      $2e6c
2e65 60        ld      h,b
2e66 69        ld      l,c
2e67 cdff86    call    $86ff
2e6a 44        ld      b,h
2e6b 4d        ld      c,l
2e6c 78        ld      a,b
2e6d b1        or      c
2e6e ca002f    jp      z,$2f00
2e71 60        ld      h,b
2e72 69        ld      l,c
2e73 cdf886    call    $86f8
2e76 22da90    ld      ($90da),hl
2e79 c5        push    bc
2e7a cd212e    call    $2e21
2e7d d1        pop     de
2e7e 22d290    ld      ($90d2),hl
2e81 2ad290    ld      hl,($90d2)
2e84 110400    ld      de,$0004
2e87 eb        ex      de,hl
2e88 cd6c85    call    $856c
2e8b 2870      jr      z,$2efd
2e8d 2ad690    ld      hl,($90d6)
2e90 5e        ld      e,(hl)
2e91 1600      ld      d,$00
2e93 215c00    ld      hl,$005c
2e96 cd3c85    call    $853c
2e99 281a      jr      z,$2eb5
2e9b 2ad490    ld      hl,($90d4)
2e9e 110100    ld      de,$0001
2ea1 eb        ex      de,hl
2ea2 cd6d85    call    $856d
2ea5 280e      jr      z,$2eb5
2ea7 2ad690    ld      hl,($90d6)
2eaa 23        inc     hl
2eab 22d690    ld      ($90d6),hl
2eae 2ad490    ld      hl,($90d4)
2eb1 2b        dec     hl
2eb2 22d490    ld      ($90d4),hl
2eb5 2ad290    ld      hl,($90d2)
2eb8 23        inc     hl
2eb9 22d290    ld      ($90d2),hl
2ebc 2b        dec     hl
2ebd eb        ex      de,hl
2ebe 2ada90    ld      hl,($90da)
2ec1 19        add     hl,de
2ec2 5e        ld      e,(hl)
2ec3 1600      ld      d,$00
2ec5 eb        ex      de,hl
2ec6 22d890    ld      ($90d8),hl
2ec9 7c        ld      a,h
2eca b5        or      l
2ecb 2006      jr      nz,$2ed3
2ecd 2ad490    ld      hl,($90d4)
2ed0 c3f685    jp      $85f6
2ed3 2ad490    ld      hl,($90d4)
2ed6 2b        dec     hl
2ed7 22d490    ld      ($90d4),hl
2eda 23        inc     hl
2edb 7c        ld      a,h
2edc b5        or      l
2edd 2004      jr      nz,$2ee3
2edf 210000    ld      hl,$0000
2ee2 c9        ret     

2ee3 2ad690    ld      hl,($90d6)
2ee6 23        inc     hl
2ee7 22d690    ld      ($90d6),hl
2eea 2b        dec     hl
2eeb 5e        ld      e,(hl)
2eec 1600      ld      d,$00
2eee 2ad890    ld      hl,($90d8)
2ef1 cd4885    call    $8548
2ef4 2804      jr      z,$2efa
2ef6 210000    ld      hl,$0000
2ef9 c9        ret     

2efa c3812e    jp      $2e81
2efd c3652e    jp      $2e65
2f00 2ad490    ld      hl,($90d4)
2f03 c3f685    jp      $85f6
2f06 cda98b    call    $8ba9
2f09 cda93c    call    $3ca9
2f0c 22dc90    ld      ($90dc),hl
2f0f e5        push    hl
2f10 cd6341    call    $4163
2f13 d1        pop     de
2f14 cda93c    call    $3ca9
2f17 22e090    ld      ($90e0),hl
2f1a e5        push    hl
2f1b 2adc90    ld      hl,($90dc)
2f1e e5        push    hl
2f1f cd9844    call    $4498
2f22 d1        pop     de
2f23 d1        pop     de
2f24 cda93c    call    $3ca9
2f27 22de90    ld      ($90de),hl
2f2a e5        push    hl
2f2b 2ae090    ld      hl,($90e0)
2f2e e5        push    hl
2f2f cd7344    call    $4473
2f32 d1        pop     de
2f33 d1        pop     de
2f34 cda93c    call    $3ca9
2f37 e5        push    hl
2f38 2ade90    ld      hl,($90de)
2f3b e5        push    hl
2f3c cd7344    call    $4473
2f3f d1        pop     de
2f40 210800    ld      hl,$0008
2f43 e3        ex      (sp),hl
2f44 2adc90    ld      hl,($90dc)
2f47 e5        push    hl
2f48 cd7344    call    $4473
2f4b d1        pop     de
2f4c d1        pop     de
2f4d 2ade90    ld      hl,($90de)
2f50 cdf886    call    $86f8
2f53 22dc90    ld      ($90dc),hl
2f56 210000    ld      hl,$0000
2f59 44        ld      b,h
2f5a 4d        ld      c,l
2f5b 1803      jr      $2f60
2f5d 03        inc     bc
2f5e 60        ld      h,b
2f5f 69        ld      l,c
2f60 50        ld      d,b
2f61 59        ld      e,c
2f62 210400    ld      hl,$0004
2f65 cd6c85    call    $856c
2f68 caf02f    jp      z,$2ff0
2f6b 2a7a8f    ld      hl,($8f7a)
2f6e 7c        ld      a,h
2f6f b5        or      l
2f70 200a      jr      nz,$2f7c
2f72 210000    ld      hl,$0000
2f75 e5        push    hl
2f76 2adc90    ld      hl,($90dc)
2f79 d1        pop     de
2f7a 73        ld      (hl),e
2f7b c9        ret     

2f7c 2a728f    ld      hl,($8f72)
2f7f 5e        ld      e,(hl)
2f80 1600      ld      d,$00
2f82 217f00    ld      hl,$007f
2f85 cd5585    call    $8555
2f88 280f      jr      z,$2f99
2f8a 78        ld      a,b
2f8b b1        or      c
2f8c 200b      jr      nz,$2f99
2f8e 217f00    ld      hl,$007f
2f91 e5        push    hl
2f92 2adc90    ld      hl,($90dc)
2f95 d1        pop     de
2f96 73        ld      (hl),e
2f97 18c4      jr      $2f5d
2f99 2a728f    ld      hl,($8f72)
2f9c 5e        ld      e,(hl)
2f9d 1600      ld      d,$00
2f9f 215c00    ld      hl,$005c
2fa2 cd3c85    call    $853c
2fa5 280f      jr      z,$2fb6
2fa7 2a7a8f    ld      hl,($8f7a)
2faa 110100    ld      de,$0001
2fad eb        ex      de,hl
2fae cd6786    call    $8667
2fb1 2803      jr      z,$2fb6
2fb3 cdcd28    call    $28cd
2fb6 2a728f    ld      hl,($8f72)
2fb9 23        inc     hl
2fba 22728f    ld      ($8f72),hl
2fbd 2b        dec     hl
2fbe 5e        ld      e,(hl)
2fbf 1600      ld      d,$00
2fc1 d5        push    de
2fc2 2adc90    ld      hl,($90dc)
2fc5 50        ld      d,b
2fc6 59        ld      e,c
2fc7 19        add     hl,de
2fc8 d1        pop     de
2fc9 73        ld      (hl),e
2fca 2a7a8f    ld      hl,($8f7a)
2fcd 2b        dec     hl
2fce 227a8f    ld      ($8f7a),hl
2fd1 7c        ld      a,h
2fd2 b5        or      l
2fd3 2018      jr      nz,$2fed
2fd5 03        inc     bc
2fd6 60        ld      h,b
2fd7 69        ld      l,c
2fd8 110400    ld      de,$0004
2fdb eb        ex      de,hl
2fdc cd6c85    call    $856c
2fdf c8        ret     z

2fe0 210000    ld      hl,$0000
2fe3 e5        push    hl
2fe4 2adc90    ld      hl,($90dc)
2fe7 50        ld      d,b
2fe8 59        ld      e,c
2fe9 19        add     hl,de
2fea d1        pop     de
2feb 73        ld      (hl),e
2fec c9        ret     

2fed c35d2f    jp      $2f5d
2ff0 210000    ld      hl,$0000
2ff3 e5        push    hl
2ff4 cd2c46    call    $462c
2ff7 e3        ex      (sp),hl
2ff8 cd6341    call    $4163
2ffb d1        pop     de
2ffc cd8d41    call    $418d
2fff e5        push    hl
3000 cd2c46    call    $462c
3003 e3        ex      (sp),hl
3004 cdc941    call    $41c9
3007 d1        pop     de
3008 cd8d41    call    $418d
300b e5        push    hl
300c 2ade90    ld      hl,($90de)
300f e5        push    hl
3010 cd9844    call    $4498
3013 d1        pop     de
3014 d1        pop     de
3015 cdaa41    call    $41aa
3018 22de90    ld      ($90de),hl
301b c34d2f    jp      $2f4d
301e c9        ret     

301f cd062f    call    $2f06
3022 210000    ld      hl,$0000
3025 e5        push    hl
3026 cd8d41    call    $418d
3029 e5        push    hl
302a cd7d45    call    $457d
302d d1        pop     de
302e e3        ex      (sp),hl
302f cd6341    call    $4163
3032 d1        pop     de
3033 2a708f    ld      hl,($8f70)
3036 29        add     hl,hl
3037 11708e    ld      de,$8e70
303a 19        add     hl,de
303b 5e        ld      e,(hl)
303c 23        inc     hl
303d 56        ld      d,(hl)
303e d5        push    de
303f cdaa41    call    $41aa
3042 e5        push    hl
3043 cd9844    call    $4498
3046 d1        pop     de
3047 d1        pop     de
3048 e5        push    hl
3049 2a708f    ld      hl,($8f70)
304c 29        add     hl,hl
304d 11708e    ld      de,$8e70
3050 19        add     hl,de
3051 d1        pop     de
3052 73        ld      (hl),e
3053 23        inc     hl
3054 72        ld      (hl),d
3055 c9        ret     

3056 cda98b    call    $8ba9
3059 210800    ld      hl,$0008
305c 39        add     hl,sp
305d 5e        ld      e,(hl)
305e 23        inc     hl
305f 56        ld      d,(hl)
3060 d5        push    de
3061 210a00    ld      hl,$000a
3064 e5        push    hl
3065 cd7d45    call    $457d
3068 d1        pop     de
3069 e3        ex      (sp),hl
306a cd6341    call    $4163
306d d1        pop     de
306e c9        ret     

306f cda98b    call    $8ba9
3072 217d8c    ld      hl,$8c7d
3075 e5        push    hl
3076 210a00    ld      hl,$000a
3079 39        add     hl,sp
307a cd667c    call    $7c66
307d e1        pop     hl
307e cd857c    call    $7c85
3081 cda93c    call    $3ca9
3084 44        ld      b,h
3085 4d        ld      c,l
3086 e5        push    hl
3087 cd6341    call    $4163
308a d1        pop     de
308b cda93c    call    $3ca9
308e 22e290    ld      ($90e2),hl
3091 e5        push    hl
3092 c5        push    bc
3093 cd9844    call    $4498
3096 d1        pop     de
3097 d1        pop     de
3098 cda93c    call    $3ca9
309b 44        ld      b,h
309c 4d        ld      c,l
309d e5        push    hl
309e 2ae290    ld      hl,($90e2)
30a1 e5        push    hl
30a2 cd7344    call    $4473
30a5 d1        pop     de
30a6 d1        pop     de
30a7 cda93c    call    $3ca9
30aa 22e490    ld      ($90e4),hl
30ad e5        push    hl
30ae c5        push    bc
30af cd7344    call    $4473
30b2 d1        pop     de
30b3 d1        pop     de
30b4 cda93c    call    $3ca9
30b7 22e690    ld      ($90e6),hl
30ba e5        push    hl
30bb 2ae490    ld      hl,($90e4)
30be e5        push    hl
30bf cd7344    call    $4473
30c2 d1        pop     de
30c3 211000    ld      hl,$0010
30c6 e3        ex      (sp),hl
30c7 cd8d41    call    $418d
30ca e5        push    hl
30cb cd7344    call    $4473
30ce d1        pop     de
30cf d1        pop     de
30d0 2a7d8c    ld      hl,($8c7d)
30d3 e5        push    hl
30d4 2ae290    ld      hl,($90e2)
30d7 23        inc     hl
30d8 23        inc     hl
30d9 d1        pop     de
30da 73        ld      (hl),e
30db 23        inc     hl
30dc 72        ld      (hl),d
30dd 2a7f8c    ld      hl,($8c7f)
30e0 eb        ex      de,hl
30e1 210200    ld      hl,$0002
30e4 09        add     hl,bc
30e5 73        ld      (hl),e
30e6 23        inc     hl
30e7 72        ld      (hl),d
30e8 2a818c    ld      hl,($8c81)
30eb e5        push    hl
30ec 2ae490    ld      hl,($90e4)
30ef 23        inc     hl
30f0 23        inc     hl
30f1 d1        pop     de
30f2 73        ld      (hl),e
30f3 23        inc     hl
30f4 72        ld      (hl),d
30f5 2a838c    ld      hl,($8c83)
30f8 e5        push    hl
30f9 2ae690    ld      hl,($90e6)
30fc 23        inc     hl
30fd 23        inc     hl
30fe d1        pop     de
30ff 73        ld      (hl),e
3100 23        inc     hl
3101 72        ld      (hl),d
3102 c9        ret     

3103 cda98b    call    $8ba9
3106 217e8f    ld      hl,$8f7e
3109 e5        push    hl
310a 210a00    ld      hl,$000a
310d 39        add     hl,sp
310e cd667c    call    $7c66
3111 e1        pop     hl
3112 cd857c    call    $7c85
3115 c31831    jp      $3118
3118 217e8f    ld      hl,$8f7e
311b cd667c    call    $7c66
311e cde681    call    $81e6
3121 cd2880    call    $8028
3124 217e8f    ld      hl,$8f7e
3127 cd587c    call    $7c58
312a cde07f    call    $7fe0
312d 200b      jr      nz,$313a
312f 217e8f    ld      hl,$8f7e
3132 cd667c    call    $7c66
3135 cd1a7d    call    $7d1a
3138 200f      jr      nz,$3149
313a 217e8f    ld      hl,$8f7e
313d cd667c    call    $7c66
3140 cde681    call    $81e6
3143 e5        push    hl
3144 cd5630    call    $3056
3147 d1        pop     de
3148 c9        ret     

3149 217e8f    ld      hl,$8f7e
314c cd667c    call    $7c66
314f cda77c    call    $7ca7
3152 cd6f30    call    $306f
3155 eb        ex      de,hl
3156 cda08b    call    $8ba0
3159 c9        ret     

315a cda98b    call    $8ba9
315d 2a888f    ld      hl,($8f88)
3160 7c        ld      a,h
3161 b5        or      l
3162 2809      jr      z,$316d
3164 2adc8f    ld      hl,($8fdc)
3167 e5        push    hl
3168 cd6341    call    $4163
316b d1        pop     de
316c c9        ret     

316d cda631    call    $31a6
3170 2a708f    ld      hl,($8f70)
3173 29        add     hl,hl
3174 11708e    ld      de,$8e70
3177 19        add     hl,de
3178 5e        ld      e,(hl)
3179 23        inc     hl
317a 56        ld      d,(hl)
317b 42        ld      b,d
317c 4b        ld      c,e
317d 1807      jr      $3186
317f 60        ld      h,b
3180 69        ld      l,c
3181 cdff86    call    $86ff
3184 44        ld      b,h
3185 4d        ld      c,l
3186 78        ld      a,b
3187 b1        or      c
3188 2819      jr      z,$31a3
318a 60        ld      h,b
318b 69        ld      l,c
318c cdf886    call    $86f8
318f e5        push    hl
3190 cd432e    call    $2e43
3193 d1        pop     de
3194 280b      jr      z,$31a1
3196 60        ld      h,b
3197 69        ld      l,c
3198 cdf886    call    $86f8
319b e5        push    hl
319c cd6341    call    $4163
319f d1        pop     de
31a0 c9        ret     

31a1 18dc      jr      $317f
31a3 c32543    jp      $4325
31a6 cda98b    call    $8ba9
31a9 210000    ld      hl,$0000
31ac 22708f    ld      ($8f70),hl
31af 2a728f    ld      hl,($8f72)
31b2 44        ld      b,h
31b3 4d        ld      c,l
31b4 60        ld      h,b
31b5 69        ld      l,c
31b6 5e        ld      e,(hl)
31b7 1600      ld      d,$00
31b9 215c00    ld      hl,$005c
31bc cd3c85    call    $853c
31bf 2803      jr      z,$31c4
31c1 03        inc     bc
31c2 60        ld      h,b
31c3 69        ld      l,c
31c4 2a728f    ld      hl,($8f72)
31c7 eb        ex      de,hl
31c8 2a7a8f    ld      hl,($8f7a)
31cb 19        add     hl,de
31cc e5        push    hl
31cd 60        ld      h,b
31ce 69        ld      l,c
31cf d1        pop     de
31d0 eb        ex      de,hl
31d1 cd5c86    call    $865c
31d4 200f      jr      nz,$31e5
31d6 60        ld      h,b
31d7 69        ld      l,c
31d8 03        inc     bc
31d9 5e        ld      e,(hl)
31da 1600      ld      d,$00
31dc 2a708f    ld      hl,($8f70)
31df 19        add     hl,de
31e0 22708f    ld      ($8f70),hl
31e3 18cf      jr      $31b4
31e5 2a708f    ld      hl,($8f70)
31e8 117f00    ld      de,$007f
31eb cdfc84    call    $84fc
31ee 22708f    ld      ($8f70),hl
31f1 c9        ret     

31f2 cd5a31    call    $315a
31f5 cd8d41    call    $418d
31f8 c0        ret     nz

31f9 cd9641    call    $4196
31fc cd1f30    call    $301f
31ff c9        ret     

3200 2a7c8f    ld      hl,($8f7c)
3203 110600    ld      de,$0006
3206 cd3c85    call    $853c
3209 2805      jr      z,$3210
320b cd1831    call    $3118
320e 1803      jr      $3213
3210 cdf231    call    $31f2
3213 cd2533    call    $3325
3216 c3ef2b    jp      $2bef
3219 cd8532    call    $3285
321c 2806      jr      z,$3224
321e cd2543    call    $4325
3221 c32533    jp      $3325
3224 215d00    ld      hl,$005d
3227 e5        push    hl
3228 cd882d    call    $2d88
322b d1        pop     de
322c 2809      jr      z,$3237
322e cdef2b    call    $2bef
3231 cd2543    call    $4325
3234 c32533    jp      $3325
3237 cd7266    call    $6672
323a cd4332    call    $3243
323d cd1932    call    $3219
3240 c36a42    jp      $426a
3243 215b00    ld      hl,$005b
3246 e5        push    hl
3247 cd882d    call    $2d88
324a d1        pop     de
324b 2809      jr      z,$3256
324d cd2533    call    $3325
3250 cdef2b    call    $2bef
3253 c31932    jp      $3219
3256 c30032    jp      $3200
3259 215d00    ld      hl,$005d
325c e5        push    hl
325d cd882d    call    $2d88
3260 d1        pop     de
3261 2805      jr      z,$3268
3263 cdef2b    call    $2bef
3266 18f1      jr      $3259
3268 cd8532    call    $3285
326b 2803      jr      z,$3270
326d c32543    jp      $4325
3270 cd7266    call    $6672
3273 cd4332    call    $3243
3276 cd5932    call    $3259
3279 c36a42    jp      $426a
327c 210000    ld      hl,$0000
327f 22a08f    ld      ($8fa0),hl
3282 c35932    jp      $3259
3285 cda98b    call    $8ba9
3288 2aa08f    ld      hl,($8fa0)
328b 7c        ld      a,h
328c b5        or      l
328d 2804      jr      z,$3293
328f 210100    ld      hl,$0001
3292 c9        ret     

3293 2a7c8f    ld      hl,($8f7c)
3296 7c        ld      a,h
3297 b5        or      l
3298 2842      jr      z,$32dc
329a 2aa28f    ld      hl,($8fa2)
329d 7c        ld      a,h
329e b5        or      l
329f 2837      jr      z,$32d8
32a1 cda42d    call    $2da4
32a4 2832      jr      z,$32d8
32a6 cd132d    call    $2d13
32a9 2aa48f    ld      hl,($8fa4)
32ac e5        push    hl
32ad cd5630    call    $3056
32b0 d1        pop     de
32b1 2a8a8f    ld      hl,($8f8a)
32b4 113b00    ld      de,$003b
32b7 cd3c85    call    $853c
32ba 2805      jr      z,$32c1
32bc 2aca8f    ld      hl,($8fca)
32bf 1803      jr      $32c4
32c1 2acc8f    ld      hl,($8fcc)
32c4 e5        push    hl
32c5 cd6341    call    $4163
32c8 d1        pop     de
32c9 cdf231    call    $31f2
32cc cd2d33    call    $332d
32cf cdef2b    call    $2bef
32d2 cd7266    call    $6672
32d5 c38532    jp      $3285
32d8 210000    ld      hl,$0000
32db c9        ret     

32dc 2aa28f    ld      hl,($8fa2)
32df 7c        ld      a,h
32e0 b5        or      l
32e1 2004      jr      nz,$32e7
32e3 210100    ld      hl,$0001
32e6 c9        ret     

32e7 213e00    ld      hl,$003e
32ea e5        push    hl
32eb cddc28    call    $28dc
32ee d1        pop     de
32ef 2a9e8f    ld      hl,($8f9e)
32f2 cdf685    call    $85f6
32f5 22a08f    ld      ($8fa0),hl
32f8 7c        ld      a,h
32f9 b5        or      l
32fa 2804      jr      z,$3300
32fc 210100    ld      hl,$0001
32ff c9        ret     

3300 2aa48f    ld      hl,($8fa4)
3303 e5        push    hl
3304 cd5630    call    $3056
3307 2ac88f    ld      hl,($8fc8)
330a e3        ex      (sp),hl
330b cd6341    call    $4163
330e 2a9e8f    ld      hl,($8f9e)
3311 e3        ex      (sp),hl
3312 cd5630    call    $3056
3315 d1        pop     de
3316 cd2d33    call    $332d
3319 210000    ld      hl,$0000
331c 229e8f    ld      ($8f9e),hl
331f cd7266    call    $6672
3322 c38532    jp      $3285
3325 2aa48f    ld      hl,($8fa4)
3328 23        inc     hl
3329 22a48f    ld      ($8fa4),hl
332c c9        ret     

332d cd6a42    call    $426a
3330 cd6a42    call    $426a
3333 2aac8f    ld      hl,($8fac)
3336 7c        ld      a,h
3337 b5        or      l
3338 2010      jr      nz,$334a
333a cd8d41    call    $418d
333d e5        push    hl
333e cd2c46    call    $462c
3341 d1        pop     de
3342 22ae8f    ld      ($8fae),hl
3345 22ac8f    ld      ($8fac),hl
3348 181a      jr      $3364
334a cd8d41    call    $418d
334d e5        push    hl
334e cd2c46    call    $462c
3351 e3        ex      (sp),hl
3352 2aae8f    ld      hl,($8fae)
3355 e5        push    hl
3356 cd9844    call    $4498
3359 d1        pop     de
335a d1        pop     de
335b 2aae8f    ld      hl,($8fae)
335e cdff86    call    $86ff
3361 22ae8f    ld      ($8fae),hl
3364 c39641    jp      $4196
3367 2a7c8f    ld      hl,($8f7c)
336a 7c        ld      a,h
336b b5        or      l
336c 2826      jr      z,$3394
336e cda42d    call    $2da4
3371 2021      jr      nz,$3394
3373 2a7c8f    ld      hl,($8f7c)
3376 110400    ld      de,$0004
3379 cd3c85    call    $853c
337c 2805      jr      z,$3383
337e cdcd28    call    $28cd
3381 1808      jr      $338b
3383 2a728f    ld      hl,($8f72)
3386 e5        push    hl
3387 cd8a55    call    $558a
338a d1        pop     de
338b cd0032    call    $3200
338e cd6733    call    $3367
3391 c36a42    jp      $426a
3394 c32543    jp      $4325
3397 21bb33    ld      hl,$33bb
339a e5        push    hl
339b cd242d    call    $2d24
339e d1        pop     de
339f 2803      jr      z,$33a4
33a1 c32543    jp      $4325
33a4 cd7c32    call    $327c
33a7 cd7266    call    $6672
33aa cd8d41    call    $418d
33ad 2006      jr      nz,$33b5
33af cd9641    call    $4196
33b2 c39733    jp      $3397
33b5 cd9733    call    $3397
33b8 c36a42    jp      $426a
33bb 65        ld      h,l
33bc 6e        ld      l,(hl)
33bd 64        ld      h,h
33be 00        nop     
33bf cda98b    call    $8ba9
33c2 cdef2b    call    $2bef
33c5 2a7c8f    ld      hl,($8f7c)
33c8 110200    ld      de,$0002
33cb cd3c85    call    $853c
33ce 2805      jr      z,$33d5
33d0 cdcd28    call    $28cd
33d3 180e      jr      $33e3
33d5 2a7c8f    ld      hl,($8f7c)
33d8 110800    ld      de,$0008
33db cd4885    call    $8548
33de 2803      jr      z,$33e3
33e0 c34b3c    jp      $3c4b
33e3 cd0032    call    $3200
33e6 cd8d41    call    $418d
33e9 44        ld      b,h
33ea 4d        ld      c,l
33eb e5        push    hl
33ec cd4146    call    $4641
33ef d1        pop     de
33f0 280f      jr      z,$3401
33f2 cd5a4b    call    $4b5a
33f5 2805      jr      z,$33fc
33f7 cd6e4b    call    $4b6e
33fa 1805      jr      $3401
33fc c5        push    bc
33fd cd2a54    call    $542a
3400 d1        pop     de
3401 cd6733    call    $3367
3404 210100    ld      hl,$0001
3407 22a28f    ld      ($8fa2),hl
340a 210000    ld      hl,$0000
340d 22a48f    ld      ($8fa4),hl
3410 cd8532    call    $3285
3413 cd9733    call    $3397
3416 cd6a42    call    $426a
3419 2aac8f    ld      hl,($8fac)
341c 7c        ld      a,h
341d b5        or      l
341e 200c      jr      nz,$342c
3420 2ac68f    ld      hl,($8fc6)
3423 e5        push    hl
3424 c5        push    bc
3425 cdf347    call    $47f3
3428 d1        pop     de
3429 d1        pop     de
342a 180f      jr      $343b
342c 2aac8f    ld      hl,($8fac)
342f e5        push    hl
3430 2ac68f    ld      hl,($8fc6)
3433 e5        push    hl
3434 c5        push    bc
3435 cd5c47    call    $475c
3438 d1        pop     de
3439 d1        pop     de
343a d1        pop     de
343b cd8d41    call    $418d
343e e5        push    hl
343f 2abc8f    ld      hl,($8fbc)
3442 e5        push    hl
3443 c5        push    bc
3444 cd5c47    call    $475c
3447 d1        pop     de
3448 d1        pop     de
3449 d1        pop     de
344a cd9641    call    $4196
344d 2a9f8c    ld      hl,($8c9f)
3450 7c        ld      a,h
3451 b5        or      l
3452 200f      jr      nz,$3463
3454 c5        push    bc
3455 cd3135    call    $3531
3458 216634    ld      hl,$3466
345b e3        ex      (sp),hl
345c cd1c67    call    $671c
345f d1        pop     de
3460 cdab66    call    $66ab
3463 c39641    jp      $4196
3466 2064      jr      nz,$34cc
3468 65        ld      h,l
3469 66        ld      h,(hl)
346a 69        ld      l,c
346b 6e        ld      l,(hl)
346c 65        ld      h,l
346d 64        ld      h,h
346e 00        nop     
346f cda98b    call    $8ba9
3472 210800    ld      hl,$0008
3475 39        add     hl,sp
3476 5e        ld      e,(hl)
3477 23        inc     hl
3478 56        ld      d,(hl)
3479 eb        ex      de,hl
347a 22e890    ld      ($90e8),hl
347d cdff86    call    $86ff
3480 cdf886    call    $86f8
3483 22e890    ld      ($90e8),hl
3486 7c        ld      a,h
3487 b5        or      l
3488 2818      jr      z,$34a2
348a 2ae890    ld      hl,($90e8)
348d e5        push    hl
348e cd212e    call    $2e21
3491 e3        ex      (sp),hl
3492 2ae890    ld      hl,($90e8)
3495 cdf886    call    $86f8
3498 d1        pop     de
3499 19        add     hl,de
349a 23        inc     hl
349b 5e        ld      e,(hl)
349c 1600      ld      d,$00
349e eb        ex      de,hl
349f 22ed90    ld      ($90ed),hl
34a2 1809      jr      $34ad
34a4 2ae890    ld      hl,($90e8)
34a7 cdff86    call    $86ff
34aa 22e890    ld      ($90e8),hl
34ad 2ae890    ld      hl,($90e8)
34b0 7c        ld      a,h
34b1 b5        or      l
34b2 c8        ret     z

34b3 2ae890    ld      hl,($90e8)
34b6 cdf886    call    $86f8
34b9 22ea90    ld      ($90ea),hl
34bc 2ae890    ld      hl,($90e8)
34bf e5        push    hl
34c0 cd212e    call    $2e21
34c3 d1        pop     de
34c4 44        ld      b,h
34c5 4d        ld      c,l
34c6 1803      jr      $34cb
34c8 03        inc     bc
34c9 60        ld      h,b
34ca 69        ld      l,c
34cb 50        ld      d,b
34cc 59        ld      e,c
34cd 210400    ld      hl,$0004
34d0 cd6c85    call    $856c
34d3 2852      jr      z,$3527
34d5 2aea90    ld      hl,($90ea)
34d8 50        ld      d,b
34d9 59        ld      e,c
34da 19        add     hl,de
34db 5e        ld      e,(hl)
34dc 1600      ld      d,$00
34de eb        ex      de,hl
34df 7d        ld      a,l
34e0 32ec90    ld      ($90ec),a
34e3 7c        ld      a,h
34e4 b5        or      l
34e5 c8        ret     z

34e6 210a00    ld      hl,$000a
34e9 39        add     hl,sp
34ea 7e        ld      a,(hl)
34eb 23        inc     hl
34ec b6        or      (hl)
34ed 282c      jr      z,$351b
34ef 212b35    ld      hl,$352b
34f2 e5        push    hl
34f3 2aec90    ld      hl,($90ec)
34f6 2600      ld      h,$00
34f8 e5        push    hl
34f9 cdec29    call    $29ec
34fc d1        pop     de
34fd d1        pop     de
34fe 2013      jr      nz,$3513
3500 2aec90    ld      hl,($90ec)
3503 2600      ld      h,$00
3505 e5        push    hl
3506 cd1a2a    call    $2a1a
3509 d1        pop     de
350a 280f      jr      z,$351b
350c 2aed90    ld      hl,($90ed)
350f 7c        ld      a,h
3510 b5        or      l
3511 2808      jr      z,$351b
3513 215c00    ld      hl,$005c
3516 e5        push    hl
3517 cdc966    call    $66c9
351a d1        pop     de
351b 2aec90    ld      hl,($90ec)
351e 2600      ld      h,$00
3520 e5        push    hl
3521 cdc966    call    $66c9
3524 d1        pop     de
3525 18a1      jr      $34c8
3527 c3a434    jp      $34a4
352a c9        ret     

352b 5c        ld      e,h
352c 5b        ld      e,e
352d 5d        ld      e,l
352e 3b        dec     sp
352f 2000      jr      nz,$3531
3531 cda98b    call    $8ba9
3534 210800    ld      hl,$0008
3537 39        add     hl,sp
3538 4e        ld      c,(hl)
3539 23        inc     hl
353a 46        ld      b,(hl)
353b 2afa8f    ld      hl,($8ffa)
353e 7c        ld      a,h
353f b5        or      l
3540 280c      jr      z,$354e
3542 c5        push    bc
3543 cd4146    call    $4641
3546 d1        pop     de
3547 2005      jr      nz,$354e
3549 210000    ld      hl,$0000
354c 1803      jr      $3551
354e 210100    ld      hl,$0001
3551 cdf685    call    $85f6
3554 e5        push    hl
3555 c5        push    bc
3556 cd6f34    call    $346f
3559 d1        pop     de
355a d1        pop     de
355b c9        ret     

355c cd0585    call    $8505
355f e8        ret     pe

3560 ff        rst     $38
3561 212000    ld      hl,$0020
3564 39        add     hl,sp
3565 4e        ld      c,(hl)
3566 23        inc     hl
3567 46        ld      b,(hl)
3568 210400    ld      hl,$0004
356b 39        add     hl,sp
356c e5        push    hl
356d c5        push    bc
356e cd9f45    call    $459f
3571 d1        pop     de
3572 cda77c    call    $7ca7
3575 cdc382    call    $82c3
3578 eb        ex      de,hl
3579 210a00    ld      hl,$000a
357c 39        add     hl,sp
357d f9        ld      sp,hl
357e 210400    ld      hl,$0004
3581 39        add     hl,sp
3582 e5        push    hl
3583 cd1c67    call    $671c
3586 d1        pop     de
3587 c9        ret     

3588 cda98b    call    $8ba9
358b 210800    ld      hl,$0008
358e 39        add     hl,sp
358f 4e        ld      c,(hl)
3590 23        inc     hl
3591 46        ld      b,(hl)
3592 cdb436    call    $36b4
3595 c5        push    bc
3596 cd2545    call    $4525
3599 d1        pop     de
359a 2806      jr      z,$35a2
359c c5        push    bc
359d cd5c35    call    $355c
35a0 d1        pop     de
35a1 c9        ret     

35a2 c5        push    bc
35a3 cd3135    call    $3531
35a6 d1        pop     de
35a7 c9        ret     

35a8 cda98b    call    $8ba9
35ab 210800    ld      hl,$0008
35ae 39        add     hl,sp
35af 4e        ld      c,(hl)
35b0 23        inc     hl
35b1 46        ld      b,(hl)
35b2 78        ld      a,b
35b3 b1        or      c
35b4 ca3236    jp      z,$3632
35b7 cdb436    call    $36b4
35ba cd343c    call    $3c34
35bd 2817      jr      z,$35d6
35bf 60        ld      h,b
35c0 69        ld      l,c
35c1 eb        ex      de,hl
35c2 2abf8c    ld      hl,($8cbf)
35c5 cd3c85    call    $853c
35c8 280c      jr      z,$35d6
35ca 2a8c8f    ld      hl,($8f8c)
35cd 22bd8c    ld      ($8cbd),hl
35d0 2a908f    ld      hl,($8f90)
35d3 22b98c    ld      ($8cb9),hl
35d6 60        ld      h,b
35d7 69        ld      l,c
35d8 cdf886    call    $86f8
35db 22ef90    ld      ($90ef),hl
35de e5        push    hl
35df cd3936    call    $3639
35e2 d1        pop     de
35e3 cd2533    call    $3325
35e6 60        ld      h,b
35e7 69        ld      l,c
35e8 cdff86    call    $86ff
35eb 44        ld      b,h
35ec 4d        ld      c,l
35ed 7c        ld      a,h
35ee b5        or      l
35ef 2841      jr      z,$3632
35f1 c5        push    bc
35f2 cdd944    call    $44d9
35f5 d1        pop     de
35f6 280e      jr      z,$3606
35f8 213536    ld      hl,$3635
35fb e5        push    hl
35fc cd1c67    call    $671c
35ff d1        pop     de
3600 c5        push    bc
3601 cd8835    call    $3588
3604 d1        pop     de
3605 c9        ret     

3606 2aef90    ld      hl,($90ef)
3609 eb        ex      de,hl
360a 2ada8f    ld      hl,($8fda)
360d cd4885    call    $8548
3610 281d      jr      z,$362f
3612 2aef90    ld      hl,($90ef)
3615 eb        ex      de,hl
3616 2adc8f    ld      hl,($8fdc)
3619 cd4885    call    $8548
361c 2811      jr      z,$362f
361e 60        ld      h,b
361f 69        ld      l,c
3620 cdf886    call    $86f8
3623 eb        ex      de,hl
3624 2ad88f    ld      hl,($8fd8)
3627 cd4885    call    $8548
362a 2803      jr      z,$362f
362c cdd76b    call    $6bd7
362f c3b235    jp      $35b2
3632 c3b436    jp      $36b4
3635 202e      jr      nz,$3665
3637 2000      jr      nz,$3639
3639 cda98b    call    $8ba9
363c 210800    ld      hl,$0008
363f 39        add     hl,sp
3640 4e        ld      c,(hl)
3641 23        inc     hl
3642 46        ld      b,(hl)
3643 78        ld      a,b
3644 b1        or      c
3645 280d      jr      z,$3654
3647 c5        push    bc
3648 cdd944    call    $44d9
364b d1        pop     de
364c 2806      jr      z,$3654
364e c5        push    bc
364f cd8835    call    $3588
3652 d1        pop     de
3653 c9        ret     

3654 215b00    ld      hl,$005b
3657 e5        push    hl
3658 cdc966    call    $66c9
365b d1        pop     de
365c cd2533    call    $3325
365f cdb436    call    $36b4
3662 cd7266    call    $6672
3665 c5        push    bc
3666 cda835    call    $35a8
3669 215d00    ld      hl,$005d
366c e3        ex      (sp),hl
366d cdc966    call    $66c9
3670 d1        pop     de
3671 c9        ret     

3672 cda98b    call    $8ba9
3675 210800    ld      hl,$0008
3678 39        add     hl,sp
3679 4e        ld      c,(hl)
367a 23        inc     hl
367b 46        ld      b,(hl)
367c cdd76b    call    $6bd7
367f c5        push    bc
3680 cd5646    call    $4656
3683 d1        pop     de
3684 280e      jr      z,$3694
3686 212200    ld      hl,$0022
3689 e5        push    hl
368a cdc966    call    $66c9
368d d1        pop     de
368e c5        push    bc
368f cd3135    call    $3531
3692 d1        pop     de
3693 c9        ret     

3694 c5        push    bc
3695 cd3936    call    $3639
3698 d1        pop     de
3699 c9        ret     

369a 210000    ld      hl,$0000
369d 22a48f    ld      ($8fa4),hl
36a0 cd0237    call    $3702
36a3 280e      jr      z,$36b3
36a5 cd2837    call    $3728
36a8 2809      jr      z,$36b3
36aa cdd76b    call    $6bd7
36ad cd4a37    call    $374a
36b0 cd5837    call    $3758
36b3 c9        ret     

36b4 cda98b    call    $8ba9
36b7 cd0237    call    $3702
36ba c8        ret     z

36bb cd3237    call    $3732
36be eb        ex      de,hl
36bf 2ac88f    ld      hl,($8fc8)
36c2 cd3c85    call    $853c
36c5 2822      jr      z,$36e9
36c7 cd3e37    call    $373e
36ca e5        push    hl
36cb cd9f45    call    $459f
36ce d1        pop     de
36cf cde681    call    $81e6
36d2 44        ld      b,h
36d3 4d        ld      c,l
36d4 cd5837    call    $3758
36d7 cdab66    call    $66ab
36da cd0237    call    $3702
36dd 2803      jr      z,$36e2
36df 0b        dec     bc
36e0 60        ld      h,b
36e1 69        ld      l,c
36e2 c5        push    bc
36e3 cdb56b    call    $6bb5
36e6 d1        pop     de
36e7 1816      jr      $36ff
36e9 cd2837    call    $3728
36ec 2805      jr      z,$36f3
36ee cdd76b    call    $6bd7
36f1 1803      jr      $36f6
36f3 cdab66    call    $66ab
36f6 cd4a37    call    $374a
36f9 cdab66    call    $66ab
36fc cd5837    call    $3758
36ff 18b6      jr      $36b7
3701 c9        ret     

3702 cda98b    call    $8ba9
3705 2aac8f    ld      hl,($8fac)
3708 7c        ld      a,h
3709 b5        or      l
370a 2004      jr      nz,$3710
370c 210000    ld      hl,$0000
370f c9        ret     

3710 2aac8f    ld      hl,($8fac)
3713 cdf886    call    $86f8
3716 cdf886    call    $86f8
3719 e5        push    hl
371a cd9f45    call    $459f
371d d1        pop     de
371e cde681    call    $81e6
3721 eb        ex      de,hl
3722 2aa48f    ld      hl,($8fa4)
3725 c33c85    jp      $853c
3728 cd3237    call    $3732
372b eb        ex      de,hl
372c 2acc8f    ld      hl,($8fcc)
372f c33c85    jp      $853c
3732 2aac8f    ld      hl,($8fac)
3735 cdf886    call    $86f8
3738 cdff86    call    $86ff
373b c3f886    jp      $86f8
373e 2aac8f    ld      hl,($8fac)
3741 cdf886    call    $86f8
3744 cdff86    call    $86ff
3747 c3ff86    jp      $86ff
374a 210000    ld      hl,$0000
374d e5        push    hl
374e cd3e37    call    $373e
3751 e5        push    hl
3752 cd6f34    call    $346f
3755 d1        pop     de
3756 d1        pop     de
3757 c9        ret     

3758 2aac8f    ld      hl,($8fac)
375b cdff86    call    $86ff
375e 22ac8f    ld      ($8fac),hl
3761 c9        ret     

3762 210000    ld      hl,$0000
3765 22ac8f    ld      ($8fac),hl
3768 c9        ret     

3769 2ac48f    ld      hl,($8fc4)
376c e5        push    hl
376d cd8537    call    $3785
3770 d1        pop     de
3771 c9        ret     

3772 cd1c43    call    $431c
3775 2abc8f    ld      hl,($8fbc)
3778 e5        push    hl
3779 cd8537    call    $3785
377c 2ac68f    ld      hl,($8fc6)
377f e3        ex      (sp),hl
3780 cd8537    call    $3785
3783 d1        pop     de
3784 c9        ret     

3785 cda98b    call    $8ba9
3788 180b      jr      $3795
378a cd8d41    call    $418d
378d cdff86    call    $86ff
3790 e5        push    hl
3791 cdc941    call    $41c9
3794 d1        pop     de
3795 cd8d41    call    $418d
3798 2816      jr      z,$37b0
379a 210800    ld      hl,$0008
379d 39        add     hl,sp
379e 5e        ld      e,(hl)
379f 23        inc     hl
37a0 56        ld      d,(hl)
37a1 d5        push    de
37a2 cd8d41    call    $418d
37a5 cdf886    call    $86f8
37a8 e5        push    hl
37a9 cdf347    call    $47f3
37ac d1        pop     de
37ad d1        pop     de
37ae 18da      jr      $378a
37b0 c39641    jp      $4196
37b3 cd2543    call    $4325
37b6 c3c237    jp      $37c2
37b9 cd1c43    call    $431c
37bc cdfc37    call    $37fc
37bf c3c237    jp      $37c2
37c2 2ab48f    ld      hl,($8fb4)
37c5 e5        push    hl
37c6 cdd337    call    $37d3
37c9 d1        pop     de
37ca cdaa41    call    $41aa
37cd e5        push    hl
37ce cdc941    call    $41c9
37d1 d1        pop     de
37d2 c9        ret     

37d3 cda98b    call    $8ba9
37d6 210800    ld      hl,$0008
37d9 39        add     hl,sp
37da 4e        ld      c,(hl)
37db 23        inc     hl
37dc 46        ld      b,(hl)
37dd 78        ld      a,b
37de b1        or      c
37df c8        ret     z

37e0 cd7266    call    $6672
37e3 60        ld      h,b
37e4 69        ld      l,c
37e5 cdff86    call    $86ff
37e8 e5        push    hl
37e9 cdd337    call    $37d3
37ec 2abc8f    ld      hl,($8fbc)
37ef e3        ex      (sp),hl
37f0 60        ld      h,b
37f1 69        ld      l,c
37f2 cdf886    call    $86f8
37f5 e5        push    hl
37f6 cd743b    call    $3b74
37f9 d1        pop     de
37fa d1        pop     de
37fb c9        ret     

37fc cd2543    call    $4325
37ff 2ac48f    ld      hl,($8fc4)
3802 e5        push    hl
3803 cdf53a    call    $3af5
3806 d1        pop     de
3807 c9        ret     

3808 cd295b    call    $5b29
380b 210000    ld      hl,$0000
380e 22d28c    ld      ($8cd2),hl
3811 210100    ld      hl,$0001
3814 22f88f    ld      ($8ff8),hl
3817 2a2e90    ld      hl,($902e)
381a 2b        dec     hl
381b 22748f    ld      ($8f74),hl
381e 210a00    ld      hl,$000a
3821 7d        ld      a,l
3822 32768f    ld      ($8f76),a
3825 c9        ret     

3826 210100    ld      hl,$0001
3829 22908f    ld      ($8f90),hl
382c 22bd8c    ld      ($8cbd),hl
382f 22b98c    ld      ($8cb9),hl
3832 c37c4b    jp      $4b7c
3835 cdab66    call    $66ab
3838 cd2638    call    $3826
383b 21758c    ld      hl,$8c75
383e e5        push    hl
383f cd017c    call    $7c01
3842 d1        pop     de
3843 2803      jr      z,$3848
3845 cd8357    call    $5783
3848 210100    ld      hl,$0001
384b 22fa8f    ld      ($8ffa),hl
384e cd9c5b    call    $5b9c
3851 cd843c    call    $3c84
3854 210000    ld      hl,$0000
3857 22ce8c    ld      ($8cce),hl
385a e5        push    hl
385b 2a2e90    ld      hl,($902e)
385e 22cb8c    ld      ($8ccb),hl
3861 d1        pop     de
3862 73        ld      (hl),e
3863 c9        ret     

3864 cd843c    call    $3c84
3867 cd3d3c    call    $3c3d
386a cd9c5b    call    $5b9c
386d 2ace8c    ld      hl,($8cce)
3870 2b        dec     hl
3871 22ce8c    ld      ($8cce),hl
3874 23        inc     hl
3875 7c        ld      a,h
3876 b5        or      l
3877 2817      jr      z,$3890
3879 2acb8c    ld      hl,($8ccb)
387c 2b        dec     hl
387d 22cb8c    ld      ($8ccb),hl
3880 23        inc     hl
3881 5e        ld      e,(hl)
3882 1600      ld      d,$00
3884 d5        push    de
3885 2ac38c    ld      hl,($8cc3)
3888 2b        dec     hl
3889 22c38c    ld      ($8cc3),hl
388c d1        pop     de
388d 73        ld      (hl),e
388e 18dd      jr      $386d
3890 2ac38c    ld      hl,($8cc3)
3893 22cb8c    ld      ($8ccb),hl
3896 c9        ret     

3897 cda98b    call    $8ba9
389a cd3538    call    $3835
389d 210a00    ld      hl,$000a
38a0 39        add     hl,sp
38a1 5e        ld      e,(hl)
38a2 23        inc     hl
38a3 56        ld      d,(hl)
38a4 d5        push    de
38a5 210a00    ld      hl,$000a
38a8 39        add     hl,sp
38a9 5e        ld      e,(hl)
38aa 23        inc     hl
38ab 56        ld      d,(hl)
38ac d5        push    de
38ad cdb538    call    $38b5
38b0 d1        pop     de
38b1 d1        pop     de
38b2 c36438    jp      $3864
38b5 cda98b    call    $8ba9
38b8 210800    ld      hl,$0008
38bb 39        add     hl,sp
38bc 4e        ld      c,(hl)
38bd 23        inc     hl
38be 46        ld      b,(hl)
38bf 1807      jr      $38c8
38c1 60        ld      h,b
38c2 69        ld      l,c
38c3 cdff86    call    $86ff
38c6 44        ld      b,h
38c7 4d        ld      c,l
38c8 78        ld      a,b
38c9 b1        or      c
38ca ca4e3a    jp      z,$3a4e
38cd cd6237    call    $3762
38d0 60        ld      h,b
38d1 69        ld      l,c
38d2 cdf886    call    $86f8
38d5 22f590    ld      ($90f5),hl
38d8 210a00    ld      hl,$000a
38db 39        add     hl,sp
38dc 5e        ld      e,(hl)
38dd 23        inc     hl
38de 56        ld      d,(hl)
38df eb        ex      de,hl
38e0 c3343a    jp      $3a34
38e3 2abc8f    ld      hl,($8fbc)
38e6 e5        push    hl
38e7 2af590    ld      hl,($90f5)
38ea e5        push    hl
38eb cd3447    call    $4734
38ee d1        pop     de
38ef d1        pop     de
38f0 22f190    ld      ($90f1),hl
38f3 7c        ld      a,h
38f4 b5        or      l
38f5 2874      jr      z,$396b
38f7 cd623a    call    $3a62
38fa 2af190    ld      hl,($90f1)
38fd e5        push    hl
38fe 2af590    ld      hl,($90f5)
3901 e5        push    hl
3902 cd813a    call    $3a81
3905 d1        pop     de
3906 d1        pop     de
3907 210a00    ld      hl,$000a
390a 39        add     hl,sp
390b 5e        ld      e,(hl)
390c 23        inc     hl
390d 56        ld      d,(hl)
390e 210100    ld      hl,$0001
3911 cd3c85    call    $853c
3914 2850      jr      z,$3966
3916 2af190    ld      hl,($90f1)
3919 cdff86    call    $86ff
391c 22f190    ld      ($90f1),hl
391f 1809      jr      $392a
3921 2af190    ld      hl,($90f1)
3924 cdff86    call    $86ff
3927 22f190    ld      ($90f1),hl
392a 2af190    ld      hl,($90f1)
392d 7c        ld      a,h
392e b5        or      l
392f 2822      jr      z,$3953
3931 cdab66    call    $66ab
3934 2af190    ld      hl,($90f1)
3937 eb        ex      de,hl
3938 2abb8c    ld      hl,($8cbb)
393b cd3c85    call    $853c
393e 2806      jr      z,$3946
3940 2a908f    ld      hl,($8f90)
3943 22b98c    ld      ($8cb9),hl
3946 2af190    ld      hl,($90f1)
3949 cdf886    call    $86f8
394c e5        push    hl
394d cda835    call    $35a8
3950 d1        pop     de
3951 18ce      jr      $3921
3953 cdb436    call    $36b4
3956 2abf8c    ld      hl,($8cbf)
3959 7c        ld      a,h
395a b5        or      l
395b 2006      jr      nz,$3963
395d 2a988f    ld      hl,($8f98)
3960 22bd8c    ld      ($8cbd),hl
3963 cd6f3a    call    $3a6f
3966 cdab66    call    $66ab
3969 181d      jr      $3988
396b 2ac48f    ld      hl,($8fc4)
396e e5        push    hl
396f 2af590    ld      hl,($90f5)
3972 e5        push    hl
3973 cd0147    call    $4701
3976 d1        pop     de
3977 d1        pop     de
3978 200e      jr      nz,$3988
397a cd623a    call    $3a62
397d 2af590    ld      hl,($90f5)
3980 e5        push    hl
3981 cd8835    call    $3588
3984 d1        pop     de
3985 cd6f3a    call    $3a6f
3988 c34b3a    jp      $3a4b
398b 2ac48f    ld      hl,($8fc4)
398e e5        push    hl
398f 2af590    ld      hl,($90f5)
3992 e5        push    hl
3993 cd0147    call    $4701
3996 d1        pop     de
3997 d1        pop     de
3998 22f190    ld      ($90f1),hl
399b 7c        ld      a,h
399c b5        or      l
399d 285d      jr      z,$39fc
399f 2af190    ld      hl,($90f1)
39a2 cdf886    call    $86f8
39a5 22f190    ld      ($90f1),hl
39a8 cd2b3c    call    $3c2b
39ab 2808      jr      z,$39b5
39ad 21513a    ld      hl,$3a51
39b0 e5        push    hl
39b1 cd1c67    call    $671c
39b4 d1        pop     de
39b5 2af590    ld      hl,($90f5)
39b8 e5        push    hl
39b9 cd8835    call    $3588
39bc d1        pop     de
39bd cdd76b    call    $6bd7
39c0 cd2b3c    call    $3c2b
39c3 2825      jr      z,$39ea
39c5 2af190    ld      hl,($90f1)
39c8 e5        push    hl
39c9 cd5646    call    $4656
39cc d1        pop     de
39cd 2811      jr      z,$39e0
39cf 212200    ld      hl,$0022
39d2 e5        push    hl
39d3 cd3f67    call    $673f
39d6 2af190    ld      hl,($90f1)
39d9 e3        ex      (sp),hl
39da cd8835    call    $3588
39dd d1        pop     de
39de 1808      jr      $39e8
39e0 2af190    ld      hl,($90f1)
39e3 e5        push    hl
39e4 cd3936    call    $3639
39e7 d1        pop     de
39e8 180f      jr      $39f9
39ea 21583a    ld      hl,$3a58
39ed e5        push    hl
39ee cd1c67    call    $671c
39f1 2af190    ld      hl,($90f1)
39f4 e3        ex      (sp),hl
39f5 cd3936    call    $3639
39f8 d1        pop     de
39f9 cdab66    call    $66ab
39fc 184d      jr      $3a4b
39fe 2af590    ld      hl,($90f5)
3a01 e5        push    hl
3a02 cdd33b    call    $3bd3
3a05 d1        pop     de
3a06 cde63b    call    $3be6
3a09 2827      jr      z,$3a32
3a0b cd183c    call    $3c18
3a0e 20f6      jr      nz,$3a06
3a10 215c3a    ld      hl,$3a5c
3a13 e5        push    hl
3a14 cd1c67    call    $671c
3a17 2af590    ld      hl,($90f5)
3a1a e3        ex      (sp),hl
3a1b cd7236    call    $3672
3a1e 2ab38c    ld      hl,($8cb3)
3a21 e3        ex      (sp),hl
3a22 cd7236    call    $3672
3a25 2ab58c    ld      hl,($8cb5)
3a28 e3        ex      (sp),hl
3a29 cd7236    call    $3672
3a2c d1        pop     de
3a2d cdab66    call    $66ab
3a30 18d4      jr      $3a06
3a32 1817      jr      $3a4b
3a34 cd3586    call    $8635
3a37 04        inc     b
3a38 00        nop     
3a39 00        nop     
3a3a 00        nop     
3a3b e3        ex      (sp),hl
3a3c 3801      jr      c,$3a3f
3a3e 00        nop     
3a3f e3        ex      (sp),hl
3a40 3802      jr      c,$3a44
3a42 00        nop     
3a43 8b        adc     a,e
3a44 39        add     hl,sp
3a45 03        inc     bc
3a46 00        nop     
3a47 fe39      cp      $39
3a49 4b        ld      c,e
3a4a 3ac3c1    ld      a,($c1c3)
3a4d 38c3      jr      c,$3a12
3a4f 62        ld      h,d
3a50 37        scf     
3a51 6d        ld      l,l
3a52 61        ld      h,c
3a53 6b        ld      l,e
3a54 65        ld      h,l
3a55 2022      jr      nz,$3a79
3a57 00        nop     
3a58 69        ld      l,c
3a59 73        ld      (hl),e
3a5a 2000      jr      nz,$3a5c
3a5c 70        ld      (hl),b
3a5d 70        ld      (hl),b
3a5e 72        ld      (hl),d
3a5f 6f        ld      l,a
3a60 70        ld      (hl),b
3a61 00        nop     
3a62 216b3a    ld      hl,$3a6b
3a65 e5        push    hl
3a66 cd1c67    call    $671c
3a69 d1        pop     de
3a6a c9        ret     

3a6b 74        ld      (hl),h
3a6c 6f        ld      l,a
3a6d 2000      jr      nz,$3a6f
3a6f cdab66    call    $66ab
3a72 217d3a    ld      hl,$3a7d
3a75 e5        push    hl
3a76 cd1c67    call    $671c
3a79 d1        pop     de
3a7a c3c066    jp      $66c0
3a7d 65        ld      h,l
3a7e 6e        ld      l,(hl)
3a7f 64        ld      h,h
3a80 00        nop     
3a81 cda98b    call    $8ba9
3a84 210800    ld      hl,$0008
3a87 39        add     hl,sp
3a88 4e        ld      c,(hl)
3a89 23        inc     hl
3a8a 46        ld      b,(hl)
3a8b c5        push    bc
3a8c cd8835    call    $3588
3a8f d1        pop     de
3a90 210a00    ld      hl,$000a
3a93 39        add     hl,sp
3a94 5e        ld      e,(hl)
3a95 23        inc     hl
3a96 56        ld      d,(hl)
3a97 eb        ex      de,hl
3a98 22f790    ld      ($90f7),hl
3a9b cdf886    call    $86f8
3a9e 22f790    ld      ($90f7),hl
3aa1 1809      jr      $3aac
3aa3 2af790    ld      hl,($90f7)
3aa6 cdff86    call    $86ff
3aa9 22f790    ld      ($90f7),hl
3aac 2af790    ld      hl,($90f7)
3aaf 7c        ld      a,h
3ab0 b5        or      l
3ab1 2818      jr      z,$3acb
3ab3 cdd76b    call    $6bd7
3ab6 213a00    ld      hl,$003a
3ab9 e5        push    hl
3aba cd3f67    call    $673f
3abd d1        pop     de
3abe 2af790    ld      hl,($90f7)
3ac1 cdf886    call    $86f8
3ac4 e5        push    hl
3ac5 cd8835    call    $3588
3ac8 d1        pop     de
3ac9 18d8      jr      $3aa3
3acb 2ac68f    ld      hl,($8fc6)
3ace e5        push    hl
3acf c5        push    bc
3ad0 cd3447    call    $4734
3ad3 d1        pop     de
3ad4 d1        pop     de
3ad5 22ac8f    ld      ($8fac),hl
3ad8 c39a36    jp      $369a
3adb cda98b    call    $8ba9
3ade 210800    ld      hl,$0008
3ae1 39        add     hl,sp
3ae2 5e        ld      e,(hl)
3ae3 23        inc     hl
3ae4 56        ld      d,(hl)
3ae5 d5        push    de
3ae6 cd8d41    call    $418d
3ae9 e5        push    hl
3aea cd0147    call    $4701
3aed d1        pop     de
3aee d1        pop     de
3aef cdf685    call    $85f6
3af2 c3f685    jp      $85f6
3af5 cda98b    call    $8ba9
3af8 cd1c3b    call    $3b1c
3afb cd2f3b    call    $3b2f
3afe 2813      jr      z,$3b13
3b00 210800    ld      hl,$0008
3b03 39        add     hl,sp
3b04 5e        ld      e,(hl)
3b05 23        inc     hl
3b06 56        ld      d,(hl)
3b07 d5        push    de
3b08 2aad8c    ld      hl,($8cad)
3b0b e5        push    hl
3b0c cd743b    call    $3b74
3b0f d1        pop     de
3b10 d1        pop     de
3b11 18e8      jr      $3afb
3b13 cdaa41    call    $41aa
3b16 e5        push    hl
3b17 cdc941    call    $41c9
3b1a d1        pop     de
3b1b c9        ret     

3b1c 210000    ld      hl,$0000
3b1f 22af8c    ld      ($8caf),hl
3b22 29        add     hl,hl
3b23 11708e    ld      de,$8e70
3b26 19        add     hl,de
3b27 5e        ld      e,(hl)
3b28 23        inc     hl
3b29 56        ld      d,(hl)
3b2a eb        ex      de,hl
3b2b 22ab8c    ld      ($8cab),hl
3b2e c9        ret     

3b2f cda98b    call    $8ba9
3b32 2aab8c    ld      hl,($8cab)
3b35 7c        ld      a,h
3b36 b5        or      l
3b37 2025      jr      nz,$3b5e
3b39 2aaf8c    ld      hl,($8caf)
3b3c 23        inc     hl
3b3d 22af8c    ld      ($8caf),hl
3b40 118000    ld      de,$0080
3b43 eb        ex      de,hl
3b44 cd5585    call    $8555
3b47 2804      jr      z,$3b4d
3b49 210000    ld      hl,$0000
3b4c c9        ret     

3b4d 2aaf8c    ld      hl,($8caf)
3b50 29        add     hl,hl
3b51 11708e    ld      de,$8e70
3b54 19        add     hl,de
3b55 5e        ld      e,(hl)
3b56 23        inc     hl
3b57 56        ld      d,(hl)
3b58 eb        ex      de,hl
3b59 22ab8c    ld      ($8cab),hl
3b5c 18d4      jr      $3b32
3b5e 2aab8c    ld      hl,($8cab)
3b61 cdf886    call    $86f8
3b64 22ad8c    ld      ($8cad),hl
3b67 2aab8c    ld      hl,($8cab)
3b6a cdff86    call    $86ff
3b6d 22ab8c    ld      ($8cab),hl
3b70 210100    ld      hl,$0001
3b73 c9        ret     

3b74 cda98b    call    $8ba9
3b77 210800    ld      hl,$0008
3b7a 39        add     hl,sp
3b7b 4e        ld      c,(hl)
3b7c 23        inc     hl
3b7d 46        ld      b,(hl)
3b7e c5        push    bc
3b7f cd5646    call    $4656
3b82 d1        pop     de
3b83 c8        ret     z

3b84 210a00    ld      hl,$000a
3b87 39        add     hl,sp
3b88 5e        ld      e,(hl)
3b89 23        inc     hl
3b8a 56        ld      d,(hl)
3b8b 210100    ld      hl,$0001
3b8e cd3c85    call    $853c
3b91 280b      jr      z,$3b9e
3b93 c5        push    bc
3b94 cdd33b    call    $3bd3
3b97 d1        pop     de
3b98 cdbc3b    call    $3bbc
3b9b c0        ret     nz

3b9c 180f      jr      $3bad
3b9e 210a00    ld      hl,$000a
3ba1 39        add     hl,sp
3ba2 5e        ld      e,(hl)
3ba3 23        inc     hl
3ba4 56        ld      d,(hl)
3ba5 d5        push    de
3ba6 c5        push    bc
3ba7 cd0147    call    $4701
3baa d1        pop     de
3bab d1        pop     de
3bac c8        ret     z

3bad cd8d41    call    $418d
3bb0 e5        push    hl
3bb1 c5        push    bc
3bb2 cd7d45    call    $457d
3bb5 d1        pop     de
3bb6 e3        ex      (sp),hl
3bb7 cdc941    call    $41c9
3bba d1        pop     de
3bbb c9        ret     

3bbc cda98b    call    $8ba9
3bbf cde63b    call    $3be6
3bc2 280b      jr      z,$3bcf
3bc4 cd183c    call    $3c18
3bc7 2004      jr      nz,$3bcd
3bc9 210000    ld      hl,$0000
3bcc c9        ret     

3bcd 18f0      jr      $3bbf
3bcf 210100    ld      hl,$0001
3bd2 c9        ret     

3bd3 cda98b    call    $8ba9
3bd6 210800    ld      hl,$0008
3bd9 39        add     hl,sp
3bda 5e        ld      e,(hl)
3bdb 23        inc     hl
3bdc 56        ld      d,(hl)
3bdd d5        push    de
3bde cd5648    call    $4856
3be1 d1        pop     de
3be2 22b18c    ld      ($8cb1),hl
3be5 c9        ret     

3be6 cda98b    call    $8ba9
3be9 2ab18c    ld      hl,($8cb1)
3bec 7c        ld      a,h
3bed b5        or      l
3bee 2004      jr      nz,$3bf4
3bf0 210000    ld      hl,$0000
3bf3 c9        ret     

3bf4 2ab18c    ld      hl,($8cb1)
3bf7 cdf886    call    $86f8
3bfa 22b38c    ld      ($8cb3),hl
3bfd 2ab18c    ld      hl,($8cb1)
3c00 cdff86    call    $86ff
3c03 cdf886    call    $86f8
3c06 22b58c    ld      ($8cb5),hl
3c09 2ab18c    ld      hl,($8cb1)
3c0c e5        push    hl
3c0d cd5648    call    $4856
3c10 d1        pop     de
3c11 22b18c    ld      ($8cb1),hl
3c14 210100    ld      hl,$0001
3c17 c9        ret     

3c18 2ab38c    ld      hl,($8cb3)
3c1b e5        push    hl
3c1c cd0f10    call    $100f
3c1f d1        pop     de
3c20 2ae68d    ld      hl,($8de6)
3c23 2600      ld      h,$00
3c25 112e00    ld      de,$002e
3c28 c33c85    jp      $853c
3c2b 2afa8f    ld      hl,($8ffa)
3c2e 110000    ld      de,$0000
3c31 c34885    jp      $8548
3c34 2afa8f    ld      hl,($8ffa)
3c37 110100    ld      de,$0001
3c3a c33c85    jp      $853c
3c3d 210000    ld      hl,$0000
3c40 22fa8f    ld      ($8ffa),hl
3c43 c9        ret     

3c44 210000    ld      hl,$0000
3c47 22f88f    ld      ($8ff8),hl
3c4a c9        ret     

3c4b 2a728f    ld      hl,($8f72)
3c4e e5        push    hl
3c4f cd0967    call    $6709
3c52 215b3c    ld      hl,$3c5b
3c55 e3        ex      (sp),hl
3c56 cd0967    call    $6709
3c59 d1        pop     de
3c5a c9        ret     

3c5b 2069      jr      nz,$3cc6
3c5d 73        ld      (hl),e
3c5e 6e        ld      l,(hl)
3c5f 27        daa     
3c60 74        ld      (hl),h
3c61 2061      jr      nz,$3cc4
3c63 206e      jr      nz,$3cd3
3c65 61        ld      h,c
3c66 6d        ld      l,l
3c67 65        ld      h,l
3c68 206f      jr      nz,$3cd9
3c6a 72        ld      (hl),d
3c6b 2070      jr      nz,$3cdd
3c6d 72        ld      (hl),d
3c6e 6f        ld      l,a
3c6f 63        ld      h,e
3c70 65        ld      h,l
3c71 64        ld      h,h
3c72 75        ld      (hl),l
3c73 72        ld      (hl),d
3c74 65        ld      h,l
3c75 00        nop     
3c76 2a9a8f    ld      hl,($8f9a)
3c79 22a68f    ld      ($8fa6),hl
3c7c c9        ret     

3c7d 210000    ld      hl,$0000
3c80 22a68f    ld      ($8fa6),hl
3c83 c9        ret     

3c84 210100    ld      hl,$0001
3c87 228c8f    ld      ($8f8c),hl
3c8a c9        ret     

3c8b 210000    ld      hl,$0000
3c8e 22b68f    ld      ($8fb6),hl
3c91 22ee8f    ld      ($8fee),hl
3c94 22ec8f    ld      ($8fec),hl
3c97 22e28f    ld      ($8fe2),hl
3c9a 22ea8f    ld      ($8fea),hl
3c9d 22e88f    ld      ($8fe8),hl
3ca0 22e68f    ld      ($8fe6),hl
3ca3 22e48f    ld      ($8fe4),hl
3ca6 c37c4b    jp      $4b7c
3ca9 cda98b    call    $8ba9
3cac 2aa98c    ld      hl,($8ca9)
3caf 11c800    ld      de,$00c8
3cb2 eb        ex      de,hl
3cb3 cd5d86    call    $865d
3cb6 2842      jr      z,$3cfa
3cb8 2a9f8c    ld      hl,($8c9f)
3cbb 7c        ld      a,h
3cbc b5        or      l
3cbd 281b      jr      z,$3cda
3cbf 2a0890    ld      hl,($9008)
3cc2 7c        ld      a,h
3cc3 b5        or      l
3cc4 2014      jr      nz,$3cda
3cc6 cdab66    call    $66ab
3cc9 216d3d    ld      hl,$3d6d
3ccc e5        push    hl
3ccd cd3e69    call    $693e
3cd0 210100    ld      hl,$0001
3cd3 e3        ex      (sp),hl
3cd4 cd6e77    call    $776e
3cd7 d1        pop     de
3cd8 1820      jr      $3cfa
3cda 2a9d8c    ld      hl,($8c9d)
3cdd 7c        ld      a,h
3cde b5        or      l
3cdf 2019      jr      nz,$3cfa
3ce1 210100    ld      hl,$0001
3ce4 229d8c    ld      ($8c9d),hl
3ce7 cdd53d    call    $3dd5
3cea 2a9d8c    ld      hl,($8c9d)
3ced 7c        ld      a,h
3cee b5        or      l
3cef 2809      jr      z,$3cfa
3cf1 cda93c    call    $3ca9
3cf4 22998c    ld      ($8c99),hl
3cf7 cdbd55    call    $55bd
3cfa 2a958c    ld      hl,($8c95)
3cfd 7c        ld      a,h
3cfe b5        or      l
3cff 204d      jr      nz,$3d4e
3d01 2a9b8c    ld      hl,($8c9b)
3d04 eb        ex      de,hl
3d05 2aa78c    ld      hl,($8ca7)
3d08 cd6686    call    $8666
3d0b 2828      jr      z,$3d35
3d0d 210000    ld      hl,$0000
3d10 e5        push    hl
3d11 2a978c    ld      hl,($8c97)
3d14 110400    ld      de,$0004
3d17 19        add     hl,de
3d18 22978c    ld      ($8c97),hl
3d1b 11fcff    ld      de,$fffc
3d1e 19        add     hl,de
3d1f 44        ld      b,h
3d20 4d        ld      c,l
3d21 e5        push    hl
3d22 cd7344    call    $4473
3d25 d1        pop     de
3d26 d1        pop     de
3d27 c5        push    bc
3d28 cd1641    call    $4116
3d2b d1        pop     de
3d2c 2a9b8c    ld      hl,($8c9b)
3d2f 23        inc     hl
3d30 229b8c    ld      ($8c9b),hl
3d33 1817      jr      $3d4c
3d35 cdba66    call    $66ba
3d38 218c3d    ld      hl,$3d8c
3d3b e5        push    hl
3d3c cd3e69    call    $693e
3d3f 211700    ld      hl,$0017
3d42 e3        ex      (sp),hl
3d43 216d8c    ld      hl,$8c6d
3d46 e5        push    hl
3d47 cd167c    call    $7c16
3d4a d1        pop     de
3d4b d1        pop     de
3d4c 180b      jr      $3d59
3d4e 2a958c    ld      hl,($8c95)
3d51 44        ld      b,h
3d52 4d        ld      c,l
3d53 cdff86    call    $86ff
3d56 22958c    ld      ($8c95),hl
3d59 210000    ld      hl,$0000
3d5c e5        push    hl
3d5d c5        push    bc
3d5e cd9844    call    $4498
3d61 d1        pop     de
3d62 d1        pop     de
3d63 2aa98c    ld      hl,($8ca9)
3d66 2b        dec     hl
3d67 22a98c    ld      ($8ca9),hl
3d6a 60        ld      h,b
3d6b 69        ld      l,c
3d6c c9        ret     

3d6d 49        ld      c,c
3d6e 206e      jr      nz,$3dde
3d70 65        ld      h,l
3d71 65        ld      h,l
3d72 64        ld      h,h
3d73 206d      jr      nz,$3de2
3d75 6f        ld      l,a
3d76 72        ld      (hl),d
3d77 65        ld      h,l
3d78 206d      jr      nz,$3de7
3d7a 65        ld      h,l
3d7b 6d        ld      l,l
3d7c 6f        ld      l,a
3d7d 72        ld      (hl),d
3d7e 79        ld      a,c
3d7f 2074      jr      nz,$3df5
3d81 6f        ld      l,a
3d82 2072      jr      nz,$3df6
3d84 75        ld      (hl),l
3d85 6e        ld      l,(hl)
3d86 204c      jr      nz,$3dd4
3d88 4f        ld      c,a
3d89 47        ld      b,a
3d8a 4f        ld      c,a
3d8b 00        nop     
3d8c 49        ld      c,c
3d8d 2064      jr      nz,$3df3
3d8f 6f        ld      l,a
3d90 6e        ld      l,(hl)
3d91 27        daa     
3d92 74        ld      (hl),h
3d93 2068      jr      nz,$3dfd
3d95 61        ld      h,c
3d96 76        halt    
3d97 65        ld      h,l
3d98 2061      jr      nz,$3dfb
3d9a 6e        ld      l,(hl)
3d9b 79        ld      a,c
3d9c 204c      jr      nz,$3dea
3d9e 4f        ld      c,a
3d9f 47        ld      b,a
3da0 4f        ld      c,a
3da1 206e      jr      nz,$3e11
3da3 6f        ld      l,a
3da4 64        ld      h,h
3da5 65        ld      h,l
3da6 73        ld      (hl),e
3da7 206c      jr      nz,$3e15
3da9 65        ld      h,l
3daa 66        ld      h,(hl)
3dab 74        ld      (hl),h
3dac 00        nop     
3dad cda98b    call    $8ba9
3db0 210800    ld      hl,$0008
3db3 39        add     hl,sp
3db4 4e        ld      c,(hl)
3db5 23        inc     hl
3db6 46        ld      b,(hl)
3db7 210000    ld      hl,$0000
3dba e5        push    hl
3dbb c5        push    bc
3dbc cd7344    call    $4473
3dbf d1        pop     de
3dc0 2a958c    ld      hl,($8c95)
3dc3 e3        ex      (sp),hl
3dc4 c5        push    bc
3dc5 cd9844    call    $4498
3dc8 d1        pop     de
3dc9 d1        pop     de
3dca 22958c    ld      ($8c95),hl
3dcd 2aa98c    ld      hl,($8ca9)
3dd0 23        inc     hl
3dd1 22a98c    ld      ($8ca9),hl
3dd4 c9        ret     

3dd5 210000    ld      hl,$0000
3dd8 22958c    ld      ($8c95),hl
3ddb cd3e3f    call    $3f3e
3dde cd3e43    call    $433e
3de1 2aee8f    ld      hl,($8fee)
3de4 e5        push    hl
3de5 cde93f    call    $3fe9
3de8 2ab28f    ld      hl,($8fb2)
3deb e3        ex      (sp),hl
3dec cde93f    call    $3fe9
3def 2ab48f    ld      hl,($8fb4)
3df2 e3        ex      (sp),hl
3df3 cde93f    call    $3fe9
3df6 2ab68f    ld      hl,($8fb6)
3df9 e3        ex      (sp),hl
3dfa cde93f    call    $3fe9
3dfd 2aac8f    ld      hl,($8fac)
3e00 e3        ex      (sp),hl
3e01 cde93f    call    $3fe9
3e04 2ab08f    ld      hl,($8fb0)
3e07 e3        ex      (sp),hl
3e08 cde93f    call    $3fe9
3e0b 2aea8f    ld      hl,($8fea)
3e0e e3        ex      (sp),hl
3e0f cde93f    call    $3fe9
3e12 2ae28f    ld      hl,($8fe2)
3e15 e3        ex      (sp),hl
3e16 cde93f    call    $3fe9
3e19 2adc8f    ld      hl,($8fdc)
3e1c e3        ex      (sp),hl
3e1d cd9e3f    call    $3f9e
3e20 d1        pop     de
3e21 2adc8f    ld      hl,($8fdc)
3e24 cdff86    call    $86ff
3e27 cdff86    call    $86ff
3e2a e5        push    hl
3e2b cde93f    call    $3fe9
3e2e d1        pop     de
3e2f 2af48f    ld      hl,($8ff4)
3e32 110100    ld      de,$0001
3e35 cd4885    call    $8548
3e38 2808      jr      z,$3e42
3e3a 2af48f    ld      hl,($8ff4)
3e3d e5        push    hl
3e3e cde93f    call    $3fe9
3e41 d1        pop     de
3e42 2a998c    ld      hl,($8c99)
3e45 e5        push    hl
3e46 cde740    call    $40e7
3e49 d1        pop     de
3e4a cd5f3e    call    $3e5f
3e4d 2aa98c    ld      hl,($8ca9)
3e50 119001    ld      de,$0190
3e53 eb        ex      de,hl
3e54 cd5c86    call    $865c
3e57 c8        ret     z

3e58 210000    ld      hl,$0000
3e5b 229d8c    ld      ($8c9d),hl
3e5e c9        ret     

3e5f cda98b    call    $8ba9
3e62 210000    ld      hl,$0000
3e65 22fd90    ld      ($90fd),hl
3e68 1807      jr      $3e71
3e6a 2afd90    ld      hl,($90fd)
3e6d 23        inc     hl
3e6e 22fd90    ld      ($90fd),hl
3e71 2afd90    ld      hl,($90fd)
3e74 118000    ld      de,$0080
3e77 eb        ex      de,hl
3e78 cd6c85    call    $856c
3e7b caf53e    jp      z,$3ef5
3e7e 2afd90    ld      hl,($90fd)
3e81 29        add     hl,hl
3e82 11708e    ld      de,$8e70
3e85 19        add     hl,de
3e86 5e        ld      e,(hl)
3e87 23        inc     hl
3e88 56        ld      d,(hl)
3e89 42        ld      b,d
3e8a 4b        ld      c,e
3e8b 1807      jr      $3e94
3e8d 60        ld      h,b
3e8e 69        ld      l,c
3e8f cdff86    call    $86ff
3e92 44        ld      b,h
3e93 4d        ld      c,l
3e94 78        ld      a,b
3e95 b1        or      c
3e96 280e      jr      z,$3ea6
3e98 60        ld      h,b
3e99 69        ld      l,c
3e9a cdf886    call    $86f8
3e9d e5        push    hl
3e9e cd0241    call    $4102
3ea1 d1        pop     de
3ea2 2002      jr      nz,$3ea6
3ea4 18e7      jr      $3e8d
3ea6 60        ld      h,b
3ea7 69        ld      l,c
3ea8 e5        push    hl
3ea9 2afd90    ld      hl,($90fd)
3eac 29        add     hl,hl
3ead 11708e    ld      de,$8e70
3eb0 19        add     hl,de
3eb1 d1        pop     de
3eb2 73        ld      (hl),e
3eb3 23        inc     hl
3eb4 72        ld      (hl),d
3eb5 7a        ld      a,d
3eb6 b3        or      e
3eb7 2839      jr      z,$3ef2
3eb9 60        ld      h,b
3eba 69        ld      l,c
3ebb cdff86    call    $86ff
3ebe 22ff90    ld      ($90ff),hl
3ec1 7c        ld      a,h
3ec2 b5        or      l
3ec3 2828      jr      z,$3eed
3ec5 2aff90    ld      hl,($90ff)
3ec8 cdf886    call    $86f8
3ecb e5        push    hl
3ecc cd0241    call    $4102
3ecf d1        pop     de
3ed0 280c      jr      z,$3ede
3ed2 c5        push    bc
3ed3 cde740    call    $40e7
3ed6 d1        pop     de
3ed7 2aff90    ld      hl,($90ff)
3eda 44        ld      b,h
3edb 4d        ld      c,l
3edc 180d      jr      $3eeb
3ede 2aff90    ld      hl,($90ff)
3ee1 cdff86    call    $86ff
3ee4 e5        push    hl
3ee5 c5        push    bc
3ee6 cd9844    call    $4498
3ee9 d1        pop     de
3eea d1        pop     de
3eeb 18cc      jr      $3eb9
3eed c5        push    bc
3eee cde740    call    $40e7
3ef1 d1        pop     de
3ef2 c36a3e    jp      $3e6a
3ef5 2aa78c    ld      hl,($8ca7)
3ef8 eb        ex      de,hl
3ef9 2a9b8c    ld      hl,($8c9b)
3efc cd3086    call    $8630
3eff 22a98c    ld      ($8ca9),hl
3f02 210000    ld      hl,$0000
3f05 22fd90    ld      ($90fd),hl
3f08 1807      jr      $3f11
3f0a 2afd90    ld      hl,($90fd)
3f0d 23        inc     hl
3f0e 22fd90    ld      ($90fd),hl
3f11 2afd90    ld      hl,($90fd)
3f14 eb        ex      de,hl
3f15 2a9b8c    ld      hl,($8c9b)
3f18 cd6c85    call    $856c
3f1b c8        ret     z

3f1c 2afd90    ld      hl,($90fd)
3f1f 29        add     hl,hl
3f20 29        add     hl,hl
3f21 eb        ex      de,hl
3f22 2a3090    ld      hl,($9030)
3f25 19        add     hl,de
3f26 44        ld      b,h
3f27 4d        ld      c,l
3f28 e5        push    hl
3f29 cd0241    call    $4102
3f2c d1        pop     de
3f2d 2807      jr      z,$3f36
3f2f c5        push    bc
3f30 cd1641    call    $4116
3f33 d1        pop     de
3f34 1805      jr      $3f3b
3f36 c5        push    bc
3f37 cdad3d    call    $3dad
3f3a d1        pop     de
3f3b 18cd      jr      $3f0a
3f3d c9        ret     

3f3e cda98b    call    $8ba9
3f41 210000    ld      hl,$0000
3f44 220591    ld      ($9105),hl
3f47 1807      jr      $3f50
3f49 2a0591    ld      hl,($9105)
3f4c 23        inc     hl
3f4d 220591    ld      ($9105),hl
3f50 2a0591    ld      hl,($9105)
3f53 118000    ld      de,$0080
3f56 eb        ex      de,hl
3f57 cd6c85    call    $856c
3f5a c8        ret     z

3f5b 2a0591    ld      hl,($9105)
3f5e 29        add     hl,hl
3f5f 11708e    ld      de,$8e70
3f62 19        add     hl,de
3f63 5e        ld      e,(hl)
3f64 23        inc     hl
3f65 56        ld      d,(hl)
3f66 42        ld      b,d
3f67 4b        ld      c,e
3f68 1807      jr      $3f71
3f6a 60        ld      h,b
3f6b 69        ld      l,c
3f6c cdff86    call    $86ff
3f6f 44        ld      b,h
3f70 4d        ld      c,l
3f71 78        ld      a,b
3f72 b1        or      c
3f73 2826      jr      z,$3f9b
3f75 60        ld      h,b
3f76 69        ld      l,c
3f77 cdf886    call    $86f8
3f7a 220191    ld      ($9101),hl
3f7d cdff86    call    $86ff
3f80 cdff86    call    $86ff
3f83 220391    ld      ($9103),hl
3f86 7c        ld      a,h
3f87 b5        or      l
3f88 280f      jr      z,$3f99
3f8a 2a0191    ld      hl,($9101)
3f8d e5        push    hl
3f8e cd9e3f    call    $3f9e
3f91 2a0391    ld      hl,($9103)
3f94 e3        ex      (sp),hl
3f95 cde93f    call    $3fe9
3f98 d1        pop     de
3f99 18cf      jr      $3f6a
3f9b 18ac      jr      $3f49
3f9d c9        ret     

3f9e cda98b    call    $8ba9
3fa1 210800    ld      hl,$0008
3fa4 39        add     hl,sp
3fa5 4e        ld      c,(hl)
3fa6 23        inc     hl
3fa7 46        ld      b,(hl)
3fa8 c5        push    bc
3fa9 cd0241    call    $4102
3fac d1        pop     de
3fad c0        ret     nz

3fae c5        push    bc
3faf cde740    call    $40e7
3fb2 d1        pop     de
3fb3 60        ld      h,b
3fb4 69        ld      l,c
3fb5 cdff86    call    $86ff
3fb8 44        ld      b,h
3fb9 4d        ld      c,l
3fba cdf886    call    $86f8
3fbd 220791    ld      ($9107),hl
3fc0 c5        push    bc
3fc1 cde740    call    $40e7
3fc4 d1        pop     de
3fc5 2a0791    ld      hl,($9107)
3fc8 7c        ld      a,h
3fc9 b5        or      l
3fca c8        ret     z

3fcb 2a0791    ld      hl,($9107)
3fce cdf886    call    $86f8
3fd1 e5        push    hl
3fd2 cde740    call    $40e7
3fd5 2a0791    ld      hl,($9107)
3fd8 e3        ex      (sp),hl
3fd9 cde740    call    $40e7
3fdc d1        pop     de
3fdd 2a0791    ld      hl,($9107)
3fe0 cdff86    call    $86ff
3fe3 220791    ld      ($9107),hl
3fe6 18dd      jr      $3fc5
3fe8 c9        ret     

3fe9 cda98b    call    $8ba9
3fec 210800    ld      hl,$0008
3fef 39        add     hl,sp
3ff0 4e        ld      c,(hl)
3ff1 23        inc     hl
3ff2 46        ld      b,(hl)
3ff3 1807      jr      $3ffc
3ff5 60        ld      h,b
3ff6 69        ld      l,c
3ff7 cdff86    call    $86ff
3ffa 44        ld      b,h
3ffb 4d        ld      c,l
3ffc 78        ld      a,b
3ffd b1        or      c
3ffe c8        ret     z

3fff c5        push    bc
4000 cd0241    call    $4102
4003 d1        pop     de
4004 c0        ret     nz

4005 c5        push    bc
4006 cdb344    call    $44b3
4009 d1        pop     de
400a c0        ret     nz

400b c5        push    bc
400c cdd944    call    $44d9
400f d1        pop     de
4010 284e      jr      z,$4060
4012 c5        push    bc
4013 cd2545    call    $4525
4016 d1        pop     de
4017 2841      jr      z,$405a
4019 c5        push    bc
401a cd6845    call    $4568
401d d1        pop     de
401e 2834      jr      z,$4054
4020 60        ld      h,b
4021 69        ld      l,c
4022 cdff86    call    $86ff
4025 220991    ld      ($9109),hl
4028 e5        push    hl
4029 cde740    call    $40e7
402c d1        pop     de
402d 2a0991    ld      hl,($9109)
4030 cdf886    call    $86f8
4033 220991    ld      ($9109),hl
4036 e5        push    hl
4037 cde740    call    $40e7
403a d1        pop     de
403b 2a0991    ld      hl,($9109)
403e cdf886    call    $86f8
4041 220991    ld      ($9109),hl
4044 e5        push    hl
4045 cde740    call    $40e7
4048 d1        pop     de
4049 2a0991    ld      hl,($9109)
404c cdf886    call    $86f8
404f e5        push    hl
4050 cde740    call    $40e7
4053 d1        pop     de
4054 c5        push    bc
4055 cde740    call    $40e7
4058 d1        pop     de
4059 c9        ret     

405a c5        push    bc
405b cd9e3f    call    $3f9e
405e d1        pop     de
405f c9        ret     

4060 c5        push    bc
4061 cde740    call    $40e7
4064 d1        pop     de
4065 cd876a    call    $6a87
4068 2803      jr      z,$406d
406a cd7b40    call    $407b
406d 60        ld      h,b
406e 69        ld      l,c
406f cdf886    call    $86f8
4072 e5        push    hl
4073 cde93f    call    $3fe9
4076 d1        pop     de
4077 c3f53f    jp      $3ff5
407a c9        ret     

407b cda98b    call    $8ba9
407e cdba66    call    $66ba
4081 21ba40    ld      hl,$40ba
4084 e5        push    hl
4085 cd0967    call    $6709
4088 d1        pop     de
4089 210000    ld      hl,$0000
408c 44        ld      b,h
408d 4d        ld      c,l
408e 180f      jr      $409f
4090 60        ld      h,b
4091 69        ld      l,c
4092 03        inc     bc
4093 29        add     hl,hl
4094 29        add     hl,hl
4095 eb        ex      de,hl
4096 2a3090    ld      hl,($9030)
4099 19        add     hl,de
409a e5        push    hl
409b cd1641    call    $4116
409e d1        pop     de
409f 60        ld      h,b
40a0 69        ld      l,c
40a1 eb        ex      de,hl
40a2 2a9b8c    ld      hl,($8c9b)
40a5 cd6c85    call    $856c
40a8 2802      jr      z,$40ac
40aa 18e4      jr      $4090
40ac 210100    ld      hl,$0001
40af e5        push    hl
40b0 216d8c    ld      hl,$8c6d
40b3 e5        push    hl
40b4 cd167c    call    $7c16
40b7 d1        pop     de
40b8 d1        pop     de
40b9 c9        ret     

40ba 4f        ld      c,a
40bb 75        ld      (hl),l
40bc 74        ld      (hl),h
40bd 206f      jr      nz,$412e
40bf 66        ld      h,(hl)
40c0 204c      jr      nz,$410e
40c2 4f        ld      c,a
40c3 47        ld      b,a
40c4 4f        ld      c,a
40c5 2073      jr      nz,$413a
40c7 74        ld      (hl),h
40c8 61        ld      h,c
40c9 63        ld      h,e
40ca 6b        ld      l,e
40cb 2064      jr      nz,$4131
40cd 75        ld      (hl),l
40ce 72        ld      (hl),d
40cf 69        ld      l,c
40d0 6e        ld      l,(hl)
40d1 67        ld      h,a
40d2 2067      jr      nz,$413b
40d4 61        ld      h,c
40d5 72        ld      (hl),d
40d6 62        ld      h,d
40d7 61        ld      h,c
40d8 67        ld      h,a
40d9 65        ld      h,l
40da 2063      jr      nz,$413f
40dc 6f        ld      l,a
40dd 6c        ld      l,h
40de 6c        ld      l,h
40df 65        ld      h,l
40e0 63        ld      h,e
40e1 74        ld      (hl),h
40e2 69        ld      l,c
40e3 6f        ld      l,a
40e4 6e        ld      l,(hl)
40e5 0a        ld      a,(bc)
40e6 00        nop     
40e7 cda98b    call    $8ba9
40ea 218000    ld      hl,$0080
40ed e5        push    hl
40ee 210a00    ld      hl,$000a
40f1 39        add     hl,sp
40f2 5e        ld      e,(hl)
40f3 23        inc     hl
40f4 56        ld      d,(hl)
40f5 eb        ex      de,hl
40f6 d1        pop     de
40f7 e5        push    hl
40f8 6e        ld      l,(hl)
40f9 2600      ld      h,$00
40fb cdfe85    call    $85fe
40fe eb        ex      de,hl
40ff e1        pop     hl
4100 73        ld      (hl),e
4101 c9        ret     

4102 cda98b    call    $8ba9
4105 210800    ld      hl,$0008
4108 39        add     hl,sp
4109 5e        ld      e,(hl)
410a 23        inc     hl
410b 56        ld      d,(hl)
410c eb        ex      de,hl
410d 5e        ld      e,(hl)
410e 1600      ld      d,$00
4110 218000    ld      hl,$0080
4113 c3fc84    jp      $84fc
4116 cda98b    call    $8ba9
4119 217fff    ld      hl,$ff7f
411c e5        push    hl
411d 210a00    ld      hl,$000a
4120 39        add     hl,sp
4121 5e        ld      e,(hl)
4122 23        inc     hl
4123 56        ld      d,(hl)
4124 eb        ex      de,hl
4125 d1        pop     de
4126 e5        push    hl
4127 6e        ld      l,(hl)
4128 2600      ld      h,$00
412a cdfc84    call    $84fc
412d eb        ex      de,hl
412e e1        pop     hl
412f 73        ld      (hl),e
4130 c9        ret     

4131 2ae88f    ld      hl,($8fe8)
4134 c3f685    jp      $85f6
4137 cd8d41    call    $418d
413a eb        ex      de,hl
413b 2abe8f    ld      hl,($8fbe)
413e cd3c85    call    $853c
4141 280b      jr      z,$414e
4143 210600    ld      hl,$0006
4146 e5        push    hl
4147 cd0a42    call    $420a
414a d1        pop     de
414b 22ea8f    ld      ($8fea),hl
414e 2ae88f    ld      hl,($8fe8)
4151 e5        push    hl
4152 cdbc42    call    $42bc
4155 e3        ex      (sp),hl
4156 2ae88f    ld      hl,($8fe8)
4159 e5        push    hl
415a cd9142    call    $4291
415d d1        pop     de
415e d1        pop     de
415f 22e88f    ld      ($8fe8),hl
4162 c9        ret     

4163 cda98b    call    $8ba9
4166 210800    ld      hl,$0008
4169 39        add     hl,sp
416a 5e        ld      e,(hl)
416b 23        inc     hl
416c 56        ld      d,(hl)
416d d5        push    de
416e 2a998c    ld      hl,($8c99)
4171 e5        push    hl
4172 cd9844    call    $4498
4175 d1        pop     de
4176 2ae88f    ld      hl,($8fe8)
4179 e3        ex      (sp),hl
417a 2a998c    ld      hl,($8c99)
417d e5        push    hl
417e cd7344    call    $4473
4181 d1        pop     de
4182 d1        pop     de
4183 22e88f    ld      ($8fe8),hl
4186 cda93c    call    $3ca9
4189 22998c    ld      ($8c99),hl
418c c9        ret     

418d cda98b    call    $8ba9
4190 2ae88f    ld      hl,($8fe8)
4193 c3ff86    jp      $86ff
4196 cda98b    call    $8ba9
4199 2ae88f    ld      hl,($8fe8)
419c 44        ld      b,h
419d 4d        ld      c,l
419e cdf886    call    $86f8
41a1 22e88f    ld      ($8fe8),hl
41a4 c5        push    bc
41a5 cdad3d    call    $3dad
41a8 d1        pop     de
41a9 c9        ret     

41aa cda98b    call    $8ba9
41ad cd8d41    call    $418d
41b0 44        ld      b,h
41b1 4d        ld      c,l
41b2 2ae88f    ld      hl,($8fe8)
41b5 220b91    ld      ($910b),hl
41b8 cdf886    call    $86f8
41bb 22e88f    ld      ($8fe8),hl
41be 2a0b91    ld      hl,($910b)
41c1 e5        push    hl
41c2 cdad3d    call    $3dad
41c5 d1        pop     de
41c6 60        ld      h,b
41c7 69        ld      l,c
41c8 c9        ret     

41c9 cda98b    call    $8ba9
41cc 210800    ld      hl,$0008
41cf 39        add     hl,sp
41d0 5e        ld      e,(hl)
41d1 23        inc     hl
41d2 56        ld      d,(hl)
41d3 d5        push    de
41d4 2ae88f    ld      hl,($8fe8)
41d7 e5        push    hl
41d8 cd9844    call    $4498
41db d1        pop     de
41dc d1        pop     de
41dd c9        ret     

41de cda98b    call    $8ba9
41e1 210800    ld      hl,$0008
41e4 39        add     hl,sp
41e5 4e        ld      c,(hl)
41e6 23        inc     hl
41e7 46        ld      b,(hl)
41e8 60        ld      h,b
41e9 69        ld      l,c
41ea 0b        dec     bc
41eb 7c        ld      a,h
41ec b5        or      l
41ed c8        ret     z

41ee cd2543    call    $4325
41f1 18f5      jr      $41e8
41f3 c9        ret     

41f4 cda98b    call    $8ba9
41f7 210800    ld      hl,$0008
41fa 39        add     hl,sp
41fb 4e        ld      c,(hl)
41fc 23        inc     hl
41fd 46        ld      b,(hl)
41fe 60        ld      h,b
41ff 69        ld      l,c
4200 0b        dec     bc
4201 7c        ld      a,h
4202 b5        or      l
4203 c8        ret     z

4204 cd9641    call    $4196
4207 18f5      jr      $41fe
4209 c9        ret     

420a cda98b    call    $8ba9
420d 2ae88f    ld      hl,($8fe8)
4210 44        ld      b,h
4211 4d        ld      c,l
4212 210800    ld      hl,$0008
4215 39        add     hl,sp
4216 e5        push    hl
4217 7e        ld      a,(hl)
4218 23        inc     hl
4219 66        ld      h,(hl)
421a 6f        ld      l,a
421b 2b        dec     hl
421c eb        ex      de,hl
421d e1        pop     hl
421e 73        ld      (hl),e
421f 23        inc     hl
4220 72        ld      (hl),d
4221 eb        ex      de,hl
4222 23        inc     hl
4223 7c        ld      a,h
4224 b5        or      l
4225 2809      jr      z,$4230
4227 60        ld      h,b
4228 69        ld      l,c
4229 cdf886    call    $86f8
422c 44        ld      b,h
422d 4d        ld      c,l
422e 18e2      jr      $4212
4230 60        ld      h,b
4231 69        ld      l,c
4232 c3ff86    jp      $86ff
4235 cda98b    call    $8ba9
4238 2ae88f    ld      hl,($8fe8)
423b 44        ld      b,h
423c 4d        ld      c,l
423d 210800    ld      hl,$0008
4240 39        add     hl,sp
4241 e5        push    hl
4242 7e        ld      a,(hl)
4243 23        inc     hl
4244 66        ld      h,(hl)
4245 6f        ld      l,a
4246 2b        dec     hl
4247 eb        ex      de,hl
4248 e1        pop     hl
4249 73        ld      (hl),e
424a 23        inc     hl
424b 72        ld      (hl),d
424c eb        ex      de,hl
424d 23        inc     hl
424e 7c        ld      a,h
424f b5        or      l
4250 2809      jr      z,$425b
4252 60        ld      h,b
4253 69        ld      l,c
4254 cdf886    call    $86f8
4257 44        ld      b,h
4258 4d        ld      c,l
4259 18e2      jr      $423d
425b 210a00    ld      hl,$000a
425e 39        add     hl,sp
425f 5e        ld      e,(hl)
4260 23        inc     hl
4261 56        ld      d,(hl)
4262 d5        push    de
4263 c5        push    bc
4264 cd9844    call    $4498
4267 d1        pop     de
4268 d1        pop     de
4269 c9        ret     

426a cda98b    call    $8ba9
426d 2ae88f    ld      hl,($8fe8)
4270 cdf886    call    $86f8
4273 44        ld      b,h
4274 4d        ld      c,l
4275 cdff86    call    $86ff
4278 e5        push    hl
4279 2ae88f    ld      hl,($8fe8)
427c e5        push    hl
427d cd7344    call    $4473
4280 d1        pop     de
4281 2ae88f    ld      hl,($8fe8)
4284 e3        ex      (sp),hl
4285 c5        push    bc
4286 cd9844    call    $4498
4289 d1        pop     de
428a d1        pop     de
428b 60        ld      h,b
428c 69        ld      l,c
428d 22e88f    ld      ($8fe8),hl
4290 c9        ret     

4291 cda98b    call    $8ba9
4294 210800    ld      hl,$0008
4297 39        add     hl,sp
4298 4e        ld      c,(hl)
4299 23        inc     hl
429a 46        ld      b,(hl)
429b 210a00    ld      hl,$000a
429e 39        add     hl,sp
429f e5        push    hl
42a0 7e        ld      a,(hl)
42a1 23        inc     hl
42a2 66        ld      h,(hl)
42a3 6f        ld      l,a
42a4 2b        dec     hl
42a5 eb        ex      de,hl
42a6 e1        pop     hl
42a7 73        ld      (hl),e
42a8 23        inc     hl
42a9 72        ld      (hl),d
42aa eb        ex      de,hl
42ab 23        inc     hl
42ac 7c        ld      a,h
42ad b5        or      l
42ae 2809      jr      z,$42b9
42b0 60        ld      h,b
42b1 69        ld      l,c
42b2 cdf886    call    $86f8
42b5 44        ld      b,h
42b6 4d        ld      c,l
42b7 18e2      jr      $429b
42b9 60        ld      h,b
42ba 69        ld      l,c
42bb c9        ret     

42bc cda98b    call    $8ba9
42bf 210800    ld      hl,$0008
42c2 39        add     hl,sp
42c3 4e        ld      c,(hl)
42c4 23        inc     hl
42c5 46        ld      b,(hl)
42c6 60        ld      h,b
42c7 69        ld      l,c
42c8 cdff86    call    $86ff
42cb 44        ld      b,h
42cc 4d        ld      c,l
42cd eb        ex      de,hl
42ce 2ac08f    ld      hl,($8fc0)
42d1 cd3c85    call    $853c
42d4 2804      jr      z,$42da
42d6 210600    ld      hl,$0006
42d9 c9        ret     

42da 60        ld      h,b
42db 69        ld      l,c
42dc eb        ex      de,hl
42dd 2abe8f    ld      hl,($8fbe)
42e0 cd3c85    call    $853c
42e3 2804      jr      z,$42e9
42e5 210700    ld      hl,$0007
42e8 c9        ret     

42e9 60        ld      h,b
42ea 69        ld      l,c
42eb eb        ex      de,hl
42ec 2ac28f    ld      hl,($8fc2)
42ef cd3c85    call    $853c
42f2 2804      jr      z,$42f8
42f4 210400    ld      hl,$0004
42f7 c9        ret     

42f8 210100    ld      hl,$0001
42fb c9        ret     

42fc cda98b    call    $8ba9
42ff 210800    ld      hl,$0008
4302 39        add     hl,sp
4303 4e        ld      c,(hl)
4304 23        inc     hl
4305 46        ld      b,(hl)
4306 78        ld      a,b
4307 b1        or      c
4308 280c      jr      z,$4316
430a c5        push    bc
430b 2ae88f    ld      hl,($8fe8)
430e e5        push    hl
430f cd9142    call    $4291
4312 d1        pop     de
4313 d1        pop     de
4314 1803      jr      $4319
4316 2ae88f    ld      hl,($8fe8)
4319 c3ff86    jp      $86ff
431c cd8d41    call    $418d
431f e5        push    hl
4320 cd6341    call    $4163
4323 d1        pop     de
4324 c9        ret     

4325 210000    ld      hl,$0000
4328 e5        push    hl
4329 cd6341    call    $4163
432c d1        pop     de
432d c9        ret     

432e 2af48f    ld      hl,($8ff4)
4331 e5        push    hl
4332 cd6341    call    $4163
4335 d1        pop     de
4336 c9        ret     

4337 cdaa41    call    $41aa
433a 22f48f    ld      ($8ff4),hl
433d c9        ret     

433e cda98b    call    $8ba9
4341 2ae88f    ld      hl,($8fe8)
4344 220f91    ld      ($910f),hl
4347 2a0f91    ld      hl,($910f)
434a 7c        ld      a,h
434b b5        or      l
434c c8        ret     z

434d 2a0f91    ld      hl,($910f)
4350 cdff86    call    $86ff
4353 e5        push    hl
4354 cde93f    call    $3fe9
4357 2a0f91    ld      hl,($910f)
435a e3        ex      (sp),hl
435b cdbc42    call    $42bc
435e d1        pop     de
435f 44        ld      b,h
4360 4d        ld      c,l
4361 60        ld      h,b
4362 69        ld      l,c
4363 0b        dec     bc
4364 7c        ld      a,h
4365 b5        or      l
4366 2819      jr      z,$4381
4368 2a0f91    ld      hl,($910f)
436b cdf886    call    $86f8
436e 220d91    ld      ($910d),hl
4371 2a0f91    ld      hl,($910f)
4374 e5        push    hl
4375 cde740    call    $40e7
4378 d1        pop     de
4379 2a0d91    ld      hl,($910d)
437c 220f91    ld      ($910f),hl
437f 18e0      jr      $4361
4381 18c4      jr      $4347
4383 c9        ret     

4384 cda98b    call    $8ba9
4387 210000    ld      hl,$0000
438a 44        ld      b,h
438b 4d        ld      c,l
438c 1803      jr      $4391
438e 03        inc     bc
438f 60        ld      h,b
4390 69        ld      l,c
4391 50        ld      d,b
4392 59        ld      e,c
4393 210200    ld      hl,$0002
4396 cd6c85    call    $856c
4399 c8        ret     z

439a 21698c    ld      hl,$8c69
439d 09        add     hl,bc
439e 09        add     hl,bc
439f 5e        ld      e,(hl)
43a0 23        inc     hl
43a1 56        ld      d,(hl)
43a2 d5        push    de
43a3 60        ld      h,b
43a4 69        ld      l,c
43a5 23        inc     hl
43a6 e5        push    hl
43a7 cd3542    call    $4235
43aa d1        pop     de
43ab d1        pop     de
43ac 18e0      jr      $438e
43ae c9        ret     

43af cda98b    call    $8ba9
43b2 210000    ld      hl,$0000
43b5 44        ld      b,h
43b6 4d        ld      c,l
43b7 1803      jr      $43bc
43b9 03        inc     bc
43ba 60        ld      h,b
43bb 69        ld      l,c
43bc 50        ld      d,b
43bd 59        ld      e,c
43be 210200    ld      hl,$0002
43c1 cd6c85    call    $856c
43c4 c8        ret     z

43c5 60        ld      h,b
43c6 69        ld      l,c
43c7 23        inc     hl
43c8 e5        push    hl
43c9 cdfc42    call    $42fc
43cc d1        pop     de
43cd e5        push    hl
43ce 21698c    ld      hl,$8c69
43d1 09        add     hl,bc
43d2 09        add     hl,bc
43d3 d1        pop     de
43d4 73        ld      (hl),e
43d5 23        inc     hl
43d6 72        ld      (hl),d
43d7 18e0      jr      $43b9
43d9 c9        ret     

43da cde043    call    $43e0
43dd c3e943    jp      $43e9
43e0 2ae88f    ld      hl,($8fe8)
43e3 22f28f    ld      ($8ff2),hl
43e6 c3e943    jp      $43e9
43e9 cda98b    call    $8ba9
43ec 2af28f    ld      hl,($8ff2)
43ef 7c        ld      a,h
43f0 b5        or      l
43f1 2837      jr      z,$442a
43f3 2af28f    ld      hl,($8ff2)
43f6 cdff86    call    $86ff
43f9 eb        ex      de,hl
43fa 2ac28f    ld      hl,($8fc2)
43fd cd3c85    call    $853c
4400 2804      jr      z,$4406
4402 210000    ld      hl,$0000
4405 c9        ret     

4406 2af28f    ld      hl,($8ff2)
4409 cdff86    call    $86ff
440c eb        ex      de,hl
440d 2abe8f    ld      hl,($8fbe)
4410 cd3c85    call    $853c
4413 2810      jr      z,$4425
4415 210500    ld      hl,$0005
4418 e5        push    hl
4419 2af28f    ld      hl,($8ff2)
441c e5        push    hl
441d cd9142    call    $4291
4420 d1        pop     de
4421 d1        pop     de
4422 c3ff86    jp      $86ff
4425 cd5744    call    $4457
4428 18c2      jr      $43ec
442a 210000    ld      hl,$0000
442d c9        ret     

442e cda98b    call    $8ba9
4431 2af28f    ld      hl,($8ff2)
4434 7c        ld      a,h
4435 b5        or      l
4436 281b      jr      z,$4453
4438 2af28f    ld      hl,($8ff2)
443b cdff86    call    $86ff
443e eb        ex      de,hl
443f 2ac28f    ld      hl,($8fc2)
4442 cd3c85    call    $853c
4445 2807      jr      z,$444e
4447 cd5744    call    $4457
444a 210100    ld      hl,$0001
444d c9        ret     

444e cd5744    call    $4457
4451 18de      jr      $4431
4453 210000    ld      hl,$0000
4456 c9        ret     

4457 2af28f    ld      hl,($8ff2)
445a e5        push    hl
445b cdbc42    call    $42bc
445e e3        ex      (sp),hl
445f 2af28f    ld      hl,($8ff2)
4462 e5        push    hl
4463 cd9142    call    $4291
4466 d1        pop     de
4467 d1        pop     de
4468 22f28f    ld      ($8ff2),hl
446b c9        ret     

446c d1        pop     de
446d e3        ex      (sp),hl
446e d5        push    de
446f 7c        ld      a,h
4470 65        ld      h,l
4471 6f        ld      l,a
4472 c9        ret     

4473 cda98b    call    $8ba9
4476 210800    ld      hl,$0008
4479 39        add     hl,sp
447a 4e        ld      c,(hl)
447b 23        inc     hl
447c 46        ld      b,(hl)
447d 210a00    ld      hl,$000a
4480 39        add     hl,sp
4481 5e        ld      e,(hl)
4482 23        inc     hl
4483 56        ld      d,(hl)
4484 210100    ld      hl,$0001
4487 cd6f86    call    $866f
448a e5        push    hl
448b cd6c44    call    $446c
448e d1        pop     de
448f eb        ex      de,hl
4490 60        ld      h,b
4491 69        ld      l,c
4492 73        ld      (hl),e
4493 23        inc     hl
4494 72        ld      (hl),d
4495 60        ld      h,b
4496 69        ld      l,c
4497 c9        ret     

4498 cda98b    call    $8ba9
449b 210800    ld      hl,$0008
449e 39        add     hl,sp
449f 4e        ld      c,(hl)
44a0 23        inc     hl
44a1 46        ld      b,(hl)
44a2 210a00    ld      hl,$000a
44a5 39        add     hl,sp
44a6 5e        ld      e,(hl)
44a7 23        inc     hl
44a8 56        ld      d,(hl)
44a9 210200    ld      hl,$0002
44ac 09        add     hl,bc
44ad 73        ld      (hl),e
44ae 23        inc     hl
44af 72        ld      (hl),d
44b0 60        ld      h,b
44b1 69        ld      l,c
44b2 c9        ret     

44b3 cda98b    call    $8ba9
44b6 210800    ld      hl,$0008
44b9 39        add     hl,sp
44ba 4e        ld      c,(hl)
44bb 23        inc     hl
44bc 46        ld      b,(hl)
44bd 50        ld      d,b
44be 59        ld      e,c
44bf 211200    ld      hl,$0012
44c2 cd5c86    call    $865c
44c5 280a      jr      z,$44d1
44c7 50        ld      d,b
44c8 59        ld      e,c
44c9 211800    ld      hl,$0018
44cc cd5d86    call    $865d
44cf 2004      jr      nz,$44d5
44d1 210000    ld      hl,$0000
44d4 c9        ret     

44d5 210100    ld      hl,$0001
44d8 c9        ret     

44d9 cda98b    call    $8ba9
44dc 210800    ld      hl,$0008
44df 39        add     hl,sp
44e0 4e        ld      c,(hl)
44e1 23        inc     hl
44e2 46        ld      b,(hl)
44e3 78        ld      a,b
44e4 b1        or      c
44e5 2004      jr      nz,$44eb
44e7 210100    ld      hl,$0001
44ea c9        ret     

44eb 60        ld      h,b
44ec 69        ld      l,c
44ed cdf886    call    $86f8
44f0 44        ld      b,h
44f1 4d        ld      c,l
44f2 110000    ld      de,$0000
44f5 eb        ex      de,hl
44f6 cd6786    call    $8667
44f9 280a      jr      z,$4505
44fb 50        ld      d,b
44fc 59        ld      e,c
44fd 211800    ld      hl,$0018
4500 cd5d86    call    $865d
4503 2004      jr      nz,$4509
4505 210000    ld      hl,$0000
4508 c9        ret     

4509 210100    ld      hl,$0001
450c c9        ret     

450d cda98b    call    $8ba9
4510 210800    ld      hl,$0008
4513 39        add     hl,sp
4514 4e        ld      c,(hl)
4515 23        inc     hl
4516 46        ld      b,(hl)
4517 78        ld      a,b
4518 b1        or      c
4519 2004      jr      nz,$451f
451b 210000    ld      hl,$0000
451e c9        ret     

451f c5        push    bc
4520 cdd944    call    $44d9
4523 d1        pop     de
4524 c9        ret     

4525 cda98b    call    $8ba9
4528 210800    ld      hl,$0008
452b 39        add     hl,sp
452c 4e        ld      c,(hl)
452d 23        inc     hl
452e 46        ld      b,(hl)
452f 60        ld      h,b
4530 69        ld      l,c
4531 cdf886    call    $86f8
4534 111000    ld      de,$0010
4537 eb        ex      de,hl
4538 cd5d86    call    $865d
453b 280e      jr      z,$454b
453d 60        ld      h,b
453e 69        ld      l,c
453f cdf886    call    $86f8
4542 110a00    ld      de,$000a
4545 eb        ex      de,hl
4546 cd5c86    call    $865c
4549 2004      jr      nz,$454f
454b 210000    ld      hl,$0000
454e c9        ret     

454f 210100    ld      hl,$0001
4552 c9        ret     

4553 cda98b    call    $8ba9
4556 210800    ld      hl,$0008
4559 39        add     hl,sp
455a 4e        ld      c,(hl)
455b 23        inc     hl
455c 46        ld      b,(hl)
455d 60        ld      h,b
455e 69        ld      l,c
455f cdf886    call    $86f8
4562 110a00    ld      de,$000a
4565 c33c85    jp      $853c
4568 cda98b    call    $8ba9
456b 210800    ld      hl,$0008
456e 39        add     hl,sp
456f 4e        ld      c,(hl)
4570 23        inc     hl
4571 46        ld      b,(hl)
4572 60        ld      h,b
4573 69        ld      l,c
4574 cdf886    call    $86f8
4577 111000    ld      de,$0010
457a c33c85    jp      $853c
457d cda98b    call    $8ba9
4580 210a00    ld      hl,$000a
4583 39        add     hl,sp
4584 5e        ld      e,(hl)
4585 23        inc     hl
4586 56        ld      d,(hl)
4587 d5        push    de
4588 210a00    ld      hl,$000a
458b 39        add     hl,sp
458c 5e        ld      e,(hl)
458d 23        inc     hl
458e 56        ld      d,(hl)
458f d5        push    de
4590 cda93c    call    $3ca9
4593 e5        push    hl
4594 cd7344    call    $4473
4597 d1        pop     de
4598 e3        ex      (sp),hl
4599 cd9844    call    $4498
459c d1        pop     de
459d d1        pop     de
459e c9        ret     

459f cda98b    call    $8ba9
45a2 210800    ld      hl,$0008
45a5 39        add     hl,sp
45a6 4e        ld      c,(hl)
45a7 23        inc     hl
45a8 46        ld      b,(hl)
45a9 c5        push    bc
45aa cd5345    call    $4553
45ad d1        pop     de
45ae 280b      jr      z,$45bb
45b0 210200    ld      hl,$0002
45b3 09        add     hl,bc
45b4 5e        ld      e,(hl)
45b5 23        inc     hl
45b6 56        ld      d,(hl)
45b7 eb        ex      de,hl
45b8 c32880    jp      $8028
45bb 60        ld      h,b
45bc 69        ld      l,c
45bd cdff86    call    $86ff
45c0 44        ld      b,h
45c1 4d        ld      c,l
45c2 23        inc     hl
45c3 23        inc     hl
45c4 5e        ld      e,(hl)
45c5 23        inc     hl
45c6 56        ld      d,(hl)
45c7 eb        ex      de,hl
45c8 227d8c    ld      ($8c7d),hl
45cb 60        ld      h,b
45cc 69        ld      l,c
45cd cdf886    call    $86f8
45d0 44        ld      b,h
45d1 4d        ld      c,l
45d2 23        inc     hl
45d3 23        inc     hl
45d4 5e        ld      e,(hl)
45d5 23        inc     hl
45d6 56        ld      d,(hl)
45d7 eb        ex      de,hl
45d8 227f8c    ld      ($8c7f),hl
45db 60        ld      h,b
45dc 69        ld      l,c
45dd cdf886    call    $86f8
45e0 44        ld      b,h
45e1 4d        ld      c,l
45e2 23        inc     hl
45e3 23        inc     hl
45e4 5e        ld      e,(hl)
45e5 23        inc     hl
45e6 56        ld      d,(hl)
45e7 eb        ex      de,hl
45e8 22818c    ld      ($8c81),hl
45eb 60        ld      h,b
45ec 69        ld      l,c
45ed cdf886    call    $86f8
45f0 23        inc     hl
45f1 23        inc     hl
45f2 5e        ld      e,(hl)
45f3 23        inc     hl
45f4 56        ld      d,(hl)
45f5 eb        ex      de,hl
45f6 22838c    ld      ($8c83),hl
45f9 217d8c    ld      hl,$8c7d
45fc c3667c    jp      $7c66
45ff cda98b    call    $8ba9
4602 210800    ld      hl,$0008
4605 39        add     hl,sp
4606 4e        ld      c,(hl)
4607 23        inc     hl
4608 46        ld      b,(hl)
4609 c5        push    bc
460a cdd944    call    $44d9
460d d1        pop     de
460e c0        ret     nz

460f cd6237    call    $3762
4612 60        ld      h,b
4613 69        ld      l,c
4614 cdf886    call    $86f8
4617 e5        push    hl
4618 cd3936    call    $3639
461b d1        pop     de
461c 60        ld      h,b
461d 69        ld      l,c
461e cdff86    call    $86ff
4621 44        ld      b,h
4622 4d        ld      c,l
4623 7c        ld      a,h
4624 b5        or      l
4625 c8        ret     z

4626 cdd76b    call    $6bd7
4629 18e7      jr      $4612
462b c9        ret     

462c cda98b    call    $8ba9
462f 210000    ld      hl,$0000
4632 e5        push    hl
4633 210a00    ld      hl,$000a
4636 39        add     hl,sp
4637 5e        ld      e,(hl)
4638 23        inc     hl
4639 56        ld      d,(hl)
463a d5        push    de
463b cd7d45    call    $457d
463e d1        pop     de
463f d1        pop     de
4640 c9        ret     

4641 cda98b    call    $8ba9
4644 210800    ld      hl,$0008
4647 39        add     hl,sp
4648 5e        ld      e,(hl)
4649 23        inc     hl
464a 56        ld      d,(hl)
464b d5        push    de
464c cdd046    call    $46d0
464f d1        pop     de
4650 cdf685    call    $85f6
4653 c3f685    jp      $85f6
4656 cda98b    call    $8ba9
4659 210800    ld      hl,$0008
465c 39        add     hl,sp
465d 4e        ld      c,(hl)
465e 23        inc     hl
465f 46        ld      b,(hl)
4660 78        ld      a,b
4661 b1        or      c
4662 2004      jr      nz,$4668
4664 210000    ld      hl,$0000
4667 c9        ret     

4668 60        ld      h,b
4669 69        ld      l,c
466a cdf886    call    $86f8
466d 110800    ld      de,$0008
4670 c33c85    jp      $853c
4673 cda98b    call    $8ba9
4676 210a00    ld      hl,$000a
4679 39        add     hl,sp
467a 4e        ld      c,(hl)
467b 23        inc     hl
467c 46        ld      b,(hl)
467d c5        push    bc
467e cdd944    call    $44d9
4681 d1        pop     de
4682 2804      jr      z,$4688
4684 210000    ld      hl,$0000
4687 c9        ret     

4688 210800    ld      hl,$0008
468b 39        add     hl,sp
468c e5        push    hl
468d 7e        ld      a,(hl)
468e 23        inc     hl
468f 66        ld      h,(hl)
4690 6f        ld      l,a
4691 2b        dec     hl
4692 eb        ex      de,hl
4693 e1        pop     hl
4694 73        ld      (hl),e
4695 23        inc     hl
4696 72        ld      (hl),d
4697 eb        ex      de,hl
4698 23        inc     hl
4699 110100    ld      de,$0001
469c eb        ex      de,hl
469d cd6d85    call    $856d
46a0 2811      jr      z,$46b3
46a2 78        ld      a,b
46a3 b1        or      c
46a4 2004      jr      nz,$46aa
46a6 210000    ld      hl,$0000
46a9 c9        ret     

46aa 60        ld      h,b
46ab 69        ld      l,c
46ac cdff86    call    $86ff
46af 44        ld      b,h
46b0 4d        ld      c,l
46b1 18d5      jr      $4688
46b3 60        ld      h,b
46b4 69        ld      l,c
46b5 c3f886    jp      $86f8
46b8 cda98b    call    $8ba9
46bb 210800    ld      hl,$0008
46be 39        add     hl,sp
46bf 4e        ld      c,(hl)
46c0 23        inc     hl
46c1 46        ld      b,(hl)
46c2 78        ld      a,b
46c3 b1        or      c
46c4 2004      jr      nz,$46ca
46c6 210000    ld      hl,$0000
46c9 c9        ret     

46ca 60        ld      h,b
46cb 69        ld      l,c
46cc cdf886    call    $86f8
46cf c9        ret     

46d0 cda98b    call    $8ba9
46d3 210800    ld      hl,$0008
46d6 39        add     hl,sp
46d7 4e        ld      c,(hl)
46d8 23        inc     hl
46d9 46        ld      b,(hl)
46da c5        push    bc
46db cd5648    call    $4856
46de d1        pop     de
46df 44        ld      b,h
46e0 4d        ld      c,l
46e1 7c        ld      a,h
46e2 b5        or      l
46e3 2818      jr      z,$46fd
46e5 60        ld      h,b
46e6 69        ld      l,c
46e7 cdf886    call    $86f8
46ea eb        ex      de,hl
46eb 2ace8f    ld      hl,($8fce)
46ee cd3c85    call    $853c
46f1 2808      jr      z,$46fb
46f3 60        ld      h,b
46f4 69        ld      l,c
46f5 cdff86    call    $86ff
46f8 c3f886    jp      $86f8
46fb 18dd      jr      $46da
46fd 210000    ld      hl,$0000
4700 c9        ret     

4701 cda98b    call    $8ba9
4704 210800    ld      hl,$0008
4707 39        add     hl,sp
4708 4e        ld      c,(hl)
4709 23        inc     hl
470a 46        ld      b,(hl)
470b c5        push    bc
470c cd5648    call    $4856
470f d1        pop     de
4710 44        ld      b,h
4711 4d        ld      c,l
4712 7c        ld      a,h
4713 b5        or      l
4714 281a      jr      z,$4730
4716 60        ld      h,b
4717 69        ld      l,c
4718 cdf886    call    $86f8
471b eb        ex      de,hl
471c 210a00    ld      hl,$000a
471f 39        add     hl,sp
4720 7e        ld      a,(hl)
4721 23        inc     hl
4722 66        ld      h,(hl)
4723 6f        ld      l,a
4724 cd3c85    call    $853c
4727 2805      jr      z,$472e
4729 60        ld      h,b
472a 69        ld      l,c
472b c3ff86    jp      $86ff
472e 18db      jr      $470b
4730 210000    ld      hl,$0000
4733 c9        ret     

4734 cda98b    call    $8ba9
4737 210800    ld      hl,$0008
473a 39        add     hl,sp
473b 4e        ld      c,(hl)
473c 23        inc     hl
473d 46        ld      b,(hl)
473e c5        push    bc
473f cd5646    call    $4656
4742 d1        pop     de
4743 2004      jr      nz,$4749
4745 210000    ld      hl,$0000
4748 c9        ret     

4749 210a00    ld      hl,$000a
474c 39        add     hl,sp
474d 5e        ld      e,(hl)
474e 23        inc     hl
474f 56        ld      d,(hl)
4750 d5        push    de
4751 c5        push    bc
4752 cd0147    call    $4701
4755 d1        pop     de
4756 e3        ex      (sp),hl
4757 cdb846    call    $46b8
475a d1        pop     de
475b c9        ret     

475c cda98b    call    $8ba9
475f 210800    ld      hl,$0008
4762 39        add     hl,sp
4763 4e        ld      c,(hl)
4764 23        inc     hl
4765 46        ld      b,(hl)
4766 c5        push    bc
4767 cd5646    call    $4656
476a d1        pop     de
476b 2004      jr      nz,$4771
476d 210000    ld      hl,$0000
4770 c9        ret     

4771 210a00    ld      hl,$000a
4774 39        add     hl,sp
4775 5e        ld      e,(hl)
4776 23        inc     hl
4777 56        ld      d,(hl)
4778 eb        ex      de,hl
4779 221191    ld      ($9111),hl
477c eb        ex      de,hl
477d 2abc8f    ld      hl,($8fbc)
4780 cd3c85    call    $853c
4783 2811      jr      z,$4796
4785 c5        push    bc
4786 cdce48    call    $48ce
4789 d1        pop     de
478a 200a      jr      nz,$4796
478c 210000    ld      hl,$0000
478f e5        push    hl
4790 c5        push    bc
4791 cd6848    call    $4868
4794 d1        pop     de
4795 d1        pop     de
4796 2a1191    ld      hl,($9111)
4799 e5        push    hl
479a c5        push    bc
479b cd0147    call    $4701
479e d1        pop     de
479f d1        pop     de
47a0 221391    ld      ($9113),hl
47a3 7c        ld      a,h
47a4 b5        or      l
47a5 2038      jr      nz,$47df
47a7 60        ld      h,b
47a8 69        ld      l,c
47a9 cdff86    call    $86ff
47ac 221591    ld      ($9115),hl
47af cdff86    call    $86ff
47b2 e5        push    hl
47b3 210e00    ld      hl,$000e
47b6 39        add     hl,sp
47b7 5e        ld      e,(hl)
47b8 23        inc     hl
47b9 56        ld      d,(hl)
47ba d5        push    de
47bb cd7d45    call    $457d
47be d1        pop     de
47bf e3        ex      (sp),hl
47c0 cd6341    call    $4163
47c3 d1        pop     de
47c4 cd8d41    call    $418d
47c7 e5        push    hl
47c8 2a1191    ld      hl,($9111)
47cb e5        push    hl
47cc cd7d45    call    $457d
47cf d1        pop     de
47d0 e3        ex      (sp),hl
47d1 2a1591    ld      hl,($9115)
47d4 e5        push    hl
47d5 cd9844    call    $4498
47d8 d1        pop     de
47d9 d1        pop     de
47da cd9641    call    $4196
47dd 1811      jr      $47f0
47df 210c00    ld      hl,$000c
47e2 39        add     hl,sp
47e3 5e        ld      e,(hl)
47e4 23        inc     hl
47e5 56        ld      d,(hl)
47e6 d5        push    de
47e7 2a1391    ld      hl,($9113)
47ea e5        push    hl
47eb cd7344    call    $4473
47ee d1        pop     de
47ef d1        pop     de
47f0 60        ld      h,b
47f1 69        ld      l,c
47f2 c9        ret     

47f3 cda98b    call    $8ba9
47f6 210800    ld      hl,$0008
47f9 39        add     hl,sp
47fa 4e        ld      c,(hl)
47fb 23        inc     hl
47fc 46        ld      b,(hl)
47fd 210a00    ld      hl,$000a
4800 39        add     hl,sp
4801 5e        ld      e,(hl)
4802 23        inc     hl
4803 56        ld      d,(hl)
4804 2abc8f    ld      hl,($8fbc)
4807 cd3c85    call    $853c
480a 2805      jr      z,$4811
480c c5        push    bc
480d cd2e49    call    $492e
4810 d1        pop     de
4811 60        ld      h,b
4812 69        ld      l,c
4813 cdff86    call    $86ff
4816 221791    ld      ($9117),hl
4819 2a1791    ld      hl,($9117)
481c cdff86    call    $86ff
481f 44        ld      b,h
4820 4d        ld      c,l
4821 7c        ld      a,h
4822 b5        or      l
4823 c8        ret     z

4824 60        ld      h,b
4825 69        ld      l,c
4826 cdf886    call    $86f8
4829 eb        ex      de,hl
482a 210a00    ld      hl,$000a
482d 39        add     hl,sp
482e 7e        ld      a,(hl)
482f 23        inc     hl
4830 66        ld      h,(hl)
4831 6f        ld      l,a
4832 cd3c85    call    $853c
4835 2813      jr      z,$484a
4837 60        ld      h,b
4838 69        ld      l,c
4839 cdff86    call    $86ff
483c cdff86    call    $86ff
483f e5        push    hl
4840 2a1791    ld      hl,($9117)
4843 e5        push    hl
4844 cd9844    call    $4498
4847 d1        pop     de
4848 d1        pop     de
4849 c9        ret     

484a 2a1791    ld      hl,($9117)
484d cdff86    call    $86ff
4850 221791    ld      ($9117),hl
4853 18c4      jr      $4819
4855 c9        ret     

4856 cda98b    call    $8ba9
4859 210800    ld      hl,$0008
485c 39        add     hl,sp
485d 4e        ld      c,(hl)
485e 23        inc     hl
485f 46        ld      b,(hl)
4860 60        ld      h,b
4861 69        ld      l,c
4862 cdff86    call    $86ff
4865 c3ff86    jp      $86ff
4868 cda98b    call    $8ba9
486b 210800    ld      hl,$0008
486e 39        add     hl,sp
486f 5e        ld      e,(hl)
4870 23        inc     hl
4871 56        ld      d,(hl)
4872 d5        push    de
4873 cd2c46    call    $462c
4876 e3        ex      (sp),hl
4877 cd6341    call    $4163
487a d1        pop     de
487b 2ab48f    ld      hl,($8fb4)
487e 7c        ld      a,h
487f b5        or      l
4880 2007      jr      nz,$4889
4882 cdaa41    call    $41aa
4885 22b48f    ld      ($8fb4),hl
4888 c9        ret     

4889 2ab48f    ld      hl,($8fb4)
488c 44        ld      b,h
488d 4d        ld      c,l
488e 1805      jr      $4895
4890 2a1991    ld      hl,($9119)
4893 44        ld      b,h
4894 4d        ld      c,l
4895 60        ld      h,b
4896 69        ld      l,c
4897 cdff86    call    $86ff
489a 221991    ld      ($9119),hl
489d 7c        ld      a,h
489e b5        or      l
489f 2815      jr      z,$48b6
48a1 60        ld      h,b
48a2 69        ld      l,c
48a3 cdf886    call    $86f8
48a6 eb        ex      de,hl
48a7 210a00    ld      hl,$000a
48aa 39        add     hl,sp
48ab 7e        ld      a,(hl)
48ac 23        inc     hl
48ad 66        ld      h,(hl)
48ae 6f        ld      l,a
48af cd3c85    call    $853c
48b2 2002      jr      nz,$48b6
48b4 18da      jr      $4890
48b6 2a1991    ld      hl,($9119)
48b9 e5        push    hl
48ba cd8d41    call    $418d
48bd e5        push    hl
48be cd9844    call    $4498
48c1 d1        pop     de
48c2 d1        pop     de
48c3 cdaa41    call    $41aa
48c6 e5        push    hl
48c7 c5        push    bc
48c8 cd9844    call    $4498
48cb d1        pop     de
48cc d1        pop     de
48cd c9        ret     

48ce cda98b    call    $8ba9
48d1 210800    ld      hl,$0008
48d4 39        add     hl,sp
48d5 5e        ld      e,(hl)
48d6 23        inc     hl
48d7 56        ld      d,(hl)
48d8 d5        push    de
48d9 2ab48f    ld      hl,($8fb4)
48dc e5        push    hl
48dd cdf848    call    $48f8
48e0 d1        pop     de
48e1 d1        pop     de
48e2 c9        ret     

48e3 cda98b    call    $8ba9
48e6 210800    ld      hl,$0008
48e9 39        add     hl,sp
48ea 5e        ld      e,(hl)
48eb 23        inc     hl
48ec 56        ld      d,(hl)
48ed d5        push    de
48ee 2ab28f    ld      hl,($8fb2)
48f1 e5        push    hl
48f2 cdf848    call    $48f8
48f5 d1        pop     de
48f6 d1        pop     de
48f7 c9        ret     

48f8 cda98b    call    $8ba9
48fb 210800    ld      hl,$0008
48fe 39        add     hl,sp
48ff 5e        ld      e,(hl)
4900 23        inc     hl
4901 56        ld      d,(hl)
4902 42        ld      b,d
4903 4b        ld      c,e
4904 1807      jr      $490d
4906 60        ld      h,b
4907 69        ld      l,c
4908 cdff86    call    $86ff
490b 44        ld      b,h
490c 4d        ld      c,l
490d 78        ld      a,b
490e b1        or      c
490f 2819      jr      z,$492a
4911 60        ld      h,b
4912 69        ld      l,c
4913 cdf886    call    $86f8
4916 eb        ex      de,hl
4917 210a00    ld      hl,$000a
491a 39        add     hl,sp
491b 7e        ld      a,(hl)
491c 23        inc     hl
491d 66        ld      h,(hl)
491e 6f        ld      l,a
491f cd3c85    call    $853c
4922 2804      jr      z,$4928
4924 210100    ld      hl,$0001
4927 c9        ret     

4928 18dc      jr      $4906
492a 210000    ld      hl,$0000
492d c9        ret     

492e cda98b    call    $8ba9
4931 210800    ld      hl,$0008
4934 39        add     hl,sp
4935 5e        ld      e,(hl)
4936 23        inc     hl
4937 56        ld      d,(hl)
4938 d5        push    de
4939 2ab48f    ld      hl,($8fb4)
493c e5        push    hl
493d cd4649    call    $4946
4940 d1        pop     de
4941 d1        pop     de
4942 22b48f    ld      ($8fb4),hl
4945 c9        ret     

4946 cda98b    call    $8ba9
4949 210800    ld      hl,$0008
494c 39        add     hl,sp
494d 4e        ld      c,(hl)
494e 23        inc     hl
494f 46        ld      b,(hl)
4950 78        ld      a,b
4951 b1        or      c
4952 2004      jr      nz,$4958
4954 210000    ld      hl,$0000
4957 c9        ret     

4958 60        ld      h,b
4959 69        ld      l,c
495a cdf886    call    $86f8
495d eb        ex      de,hl
495e 210a00    ld      hl,$000a
4961 39        add     hl,sp
4962 7e        ld      a,(hl)
4963 23        inc     hl
4964 66        ld      h,(hl)
4965 6f        ld      l,a
4966 cd3c85    call    $853c
4969 2805      jr      z,$4970
496b 60        ld      h,b
496c 69        ld      l,c
496d c3ff86    jp      $86ff
4970 60        ld      h,b
4971 69        ld      l,c
4972 221b91    ld      ($911b),hl
4975 1806      jr      $497d
4977 2a1d91    ld      hl,($911d)
497a 221b91    ld      ($911b),hl
497d 2a1b91    ld      hl,($911b)
4980 7c        ld      a,h
4981 b5        or      l
4982 282e      jr      z,$49b2
4984 2a1b91    ld      hl,($911b)
4987 cdff86    call    $86ff
498a 221d91    ld      ($911d),hl
498d cdf886    call    $86f8
4990 eb        ex      de,hl
4991 210a00    ld      hl,$000a
4994 39        add     hl,sp
4995 7e        ld      a,(hl)
4996 23        inc     hl
4997 66        ld      h,(hl)
4998 6f        ld      l,a
4999 cd3c85    call    $853c
499c 2812      jr      z,$49b0
499e 2a1d91    ld      hl,($911d)
49a1 cdff86    call    $86ff
49a4 e5        push    hl
49a5 2a1b91    ld      hl,($911b)
49a8 e5        push    hl
49a9 cd9844    call    $4498
49ac d1        pop     de
49ad d1        pop     de
49ae 1802      jr      $49b2
49b0 18c5      jr      $4977
49b2 60        ld      h,b
49b3 69        ld      l,c
49b4 c9        ret     

49b5 2aec8f    ld      hl,($8fec)
49b8 e5        push    hl
49b9 cd6341    call    $4163
49bc 2aee8f    ld      hl,($8fee)
49bf e3        ex      (sp),hl
49c0 cd6341    call    $4163
49c3 d1        pop     de
49c4 c9        ret     

49c5 cdaa41    call    $41aa
49c8 22ee8f    ld      ($8fee),hl
49cb cdaa41    call    $41aa
49ce 22ec8f    ld      ($8fec),hl
49d1 c9        ret     

49d2 cda98b    call    $8ba9
49d5 2aaa8f    ld      hl,($8faa)
49d8 eb        ex      de,hl
49d9 2ae48f    ld      hl,($8fe4)
49dc cd3c85    call    $853c
49df 2804      jr      z,$49e5
49e1 21ff7f    ld      hl,$7fff
49e4 c9        ret     

49e5 210800    ld      hl,$0008
49e8 39        add     hl,sp
49e9 5e        ld      e,(hl)
49ea 23        inc     hl
49eb 56        ld      d,(hl)
49ec eb        ex      de,hl
49ed c9        ret     

49ee cda98b    call    $8ba9
49f1 210800    ld      hl,$0008
49f4 39        add     hl,sp
49f5 4e        ld      c,(hl)
49f6 23        inc     hl
49f7 46        ld      b,(hl)
49f8 50        ld      d,b
49f9 59        ld      e,c
49fa 210200    ld      hl,$0002
49fd cd6d85    call    $856d
4a00 2804      jr      z,$4a06
4a02 cd904b    call    $4b90
4a05 c9        ret     

4a06 60        ld      h,b
4a07 69        ld      l,c
4a08 110000    ld      de,$0000
4a0b cd3c85    call    $853c
4a0e c9        ret     

4a0f cda04b    call    $4ba0
4a12 280b      jr      z,$4a1f
4a14 2ae48f    ld      hl,($8fe4)
4a17 cdf886    call    $86f8
4a1a e5        push    hl
4a1b cd5a54    call    $545a
4a1e d1        pop     de
4a1f cd6852    call    $5268
4a22 cd7b53    call    $537b
4a25 c0        ret     nz

4a26 2ae48f    ld      hl,($8fe4)
4a29 cdf886    call    $86f8
4a2c e5        push    hl
4a2d cd4c55    call    $554c
4a30 d1        pop     de
4a31 c9        ret     

4a32 cda04b    call    $4ba0
4a35 280b      jr      z,$4a42
4a37 2ae48f    ld      hl,($8fe4)
4a3a cdf886    call    $86f8
4a3d e5        push    hl
4a3e cd5a54    call    $545a
4a41 d1        pop     de
4a42 cd0b52    call    $520b
4a45 cd7b53    call    $537b
4a48 c0        ret     nz

4a49 2ae48f    ld      hl,($8fe4)
4a4c cdf886    call    $86f8
4a4f e5        push    hl
4a50 cd4c55    call    $554c
4a53 d1        pop     de
4a54 c9        ret     

4a55 cda98b    call    $8ba9
4a58 cd0f4a    call    $4a0f
4a5b 2af48f    ld      hl,($8ff4)
4a5e c9        ret     

4a5f cd554a    call    $4a55
4a62 e5        push    hl
4a63 cd0d45    call    $450d
4a66 d1        pop     de
4a67 c8        ret     z

4a68 cd3b55    call    $553b
4a6b c9        ret     

4a6c cd554a    call    $4a55
4a6f e5        push    hl
4a70 cd2545    call    $4525
4a73 d1        pop     de
4a74 c0        ret     nz

4a75 cda24a    call    $4aa2
4a78 c0        ret     nz

4a79 c33b55    jp      $553b
4a7c cd6c4a    call    $4a6c
4a7f c32e43    jp      $432e
4a82 cda98b    call    $8ba9
4a85 210800    ld      hl,$0008
4a88 39        add     hl,sp
4a89 4e        ld      c,(hl)
4a8a 23        inc     hl
4a8b 46        ld      b,(hl)
4a8c c5        push    bc
4a8d cdd944    call    $44d9
4a90 d1        pop     de
4a91 2807      jr      z,$4a9a
4a93 c5        push    bc
4a94 cda110    call    $10a1
4a97 d1        pop     de
4a98 2004      jr      nz,$4a9e
4a9a 210000    ld      hl,$0000
4a9d c9        ret     

4a9e 210100    ld      hl,$0001
4aa1 c9        ret     

4aa2 cda98b    call    $8ba9
4aa5 2af48f    ld      hl,($8ff4)
4aa8 e5        push    hl
4aa9 cd824a    call    $4a82
4aac d1        pop     de
4aad 280a      jr      z,$4ab9
4aaf cd1831    call    $3118
4ab2 cd3743    call    $4337
4ab5 210100    ld      hl,$0001
4ab8 c9        ret     

4ab9 210000    ld      hl,$0000
4abc c9        ret     

4abd cd6c4a    call    $4a6c
4ac0 2af48f    ld      hl,($8ff4)
4ac3 e5        push    hl
4ac4 cd9f45    call    $459f
4ac7 d1        pop     de
4ac8 c9        ret     

4ac9 cd554a    call    $4a55
4acc e5        push    hl
4acd cdec4c    call    $4cec
4ad0 d1        pop     de
4ad1 c9        ret     

4ad2 cd0f4a    call    $4a0f
4ad5 c33b4b    jp      $4b3b
4ad8 cdd24a    call    $4ad2
4adb c32e43    jp      $432e
4ade cd554a    call    $4a55
4ae1 c0        ret     nz

4ae2 cd3b55    call    $553b
4ae5 c9        ret     

4ae6 cd554a    call    $4a55
4ae9 e5        push    hl
4aea cd6341    call    $4163
4aed d1        pop     de
4aee c9        ret     

4aef cdc94a    call    $4ac9
4af2 c32e43    jp      $432e
4af5 cd324a    call    $4a32
4af8 2af48f    ld      hl,($8ff4)
4afb eb        ex      de,hl
4afc 2ab88f    ld      hl,($8fb8)
4aff cd3c85    call    $853c
4b02 c0        ret     nz

4b03 2af48f    ld      hl,($8ff4)
4b06 eb        ex      de,hl
4b07 2aba8f    ld      hl,($8fba)
4b0a cd3c85    call    $853c
4b0d c0        ret     nz

4b0e c30b57    jp      $570b
4b11 cda98b    call    $8ba9
4b14 cdbd4a    call    $4abd
4b17 cde681    call    $81e6
4b1a 44        ld      b,h
4b1b 4d        ld      c,l
4b1c 110000    ld      de,$0000
4b1f eb        ex      de,hl
4b20 cd5585    call    $8555
4b23 2813      jr      z,$4b38
4b25 60        ld      h,b
4b26 69        ld      l,c
4b27 eb        ex      de,hl
4b28 210800    ld      hl,$0008
4b2b 39        add     hl,sp
4b2c 7e        ld      a,(hl)
4b2d 23        inc     hl
4b2e 66        ld      h,(hl)
4b2f 6f        ld      l,a
4b30 cd5685    call    $8556
4b33 2803      jr      z,$4b38
4b35 60        ld      h,b
4b36 69        ld      l,c
4b37 c9        ret     

4b38 c33b55    jp      $553b
4b3b 2af48f    ld      hl,($8ff4)
4b3e e5        push    hl
4b3f cdec4c    call    $4cec
4b42 2af48f    ld      hl,($8ff4)
4b45 e3        ex      (sp),hl
4b46 cd4146    call    $4641
4b49 d1        pop     de
4b4a 280d      jr      z,$4b59
4b4c cd5a4b    call    $4b5a
4b4f 2008      jr      nz,$4b59
4b51 2af48f    ld      hl,($8ff4)
4b54 e5        push    hl
4b55 cd2a54    call    $542a
4b58 d1        pop     de
4b59 c9        ret     

4b5a 2ac48f    ld      hl,($8fc4)
4b5d e5        push    hl
4b5e 2ad08f    ld      hl,($8fd0)
4b61 e5        push    hl
4b62 cd3447    call    $4734
4b65 d1        pop     de
4b66 d1        pop     de
4b67 eb        ex      de,hl
4b68 2ab88f    ld      hl,($8fb8)
4b6b c33c85    jp      $853c
4b6e 2ace8f    ld      hl,($8fce)
4b71 e5        push    hl
4b72 cd8d41    call    $418d
4b75 e5        push    hl
4b76 cdf347    call    $47f3
4b79 d1        pop     de
4b7a d1        pop     de
4b7b c9        ret     

4b7c 210100    ld      hl,$0001
4b7f 22f48f    ld      ($8ff4),hl
4b82 c9        ret     

4b83 2aee8f    ld      hl,($8fee)
4b86 cdf886    call    $86f8
4b89 eb        ex      de,hl
4b8a 2ad88f    ld      hl,($8fd8)
4b8d c33c85    jp      $853c
4b90 cda98b    call    $8ba9
4b93 cda04b    call    $4ba0
4b96 2804      jr      z,$4b9c
4b98 210100    ld      hl,$0001
4b9b c9        ret     

4b9c cd834b    call    $4b83
4b9f c9        ret     

4ba0 2aee8f    ld      hl,($8fee)
4ba3 c3f685    jp      $85f6
4ba6 cda98b    call    $8ba9
4ba9 210800    ld      hl,$0008
4bac 39        add     hl,sp
4bad 5e        ld      e,(hl)
4bae 23        inc     hl
4baf 56        ld      d,(hl)
4bb0 d5        push    de
4bb1 cd5630    call    $3056
4bb4 d1        pop     de
4bb5 c33743    jp      $4337
4bb8 cda98b    call    $8ba9
4bbb 210800    ld      hl,$0008
4bbe 39        add     hl,sp
4bbf cd667c    call    $7c66
4bc2 cda77c    call    $7ca7
4bc5 cd0331    call    $3103
4bc8 eb        ex      de,hl
4bc9 cda08b    call    $8ba0
4bcc c33743    jp      $4337
4bcf 210100    ld      hl,$0001
4bd2 227a8f    ld      ($8f7a),hl
4bd5 c3d84b    jp      $4bd8
4bd8 cdf231    call    $31f2
4bdb c33743    jp      $4337
4bde cda98b    call    $8ba9
4be1 210800    ld      hl,$0008
4be4 39        add     hl,sp
4be5 5e        ld      e,(hl)
4be6 23        inc     hl
4be7 56        ld      d,(hl)
4be8 eb        ex      de,hl
4be9 22728f    ld      ($8f72),hl
4bec e5        push    hl
4bed cdad7b    call    $7bad
4bf0 d1        pop     de
4bf1 227a8f    ld      ($8f7a),hl
4bf4 cdf231    call    $31f2
4bf7 c3aa41    jp      $41aa
4bfa cda98b    call    $8ba9
4bfd 210800    ld      hl,$0008
4c00 39        add     hl,sp
4c01 4e        ld      c,(hl)
4c02 23        inc     hl
4c03 46        ld      b,(hl)
4c04 c5        push    bc
4c05 cd5646    call    $4656
4c08 d1        pop     de
4c09 2004      jr      nz,$4c0f
4c0b 210000    ld      hl,$0000
4c0e c9        ret     

4c0f c5        push    bc
4c10 cdd046    call    $46d0
4c13 d1        pop     de
4c14 44        ld      b,h
4c15 4d        ld      c,l
4c16 7c        ld      a,h
4c17 b5        or      l
4c18 2004      jr      nz,$4c1e
4c1a 210000    ld      hl,$0000
4c1d c9        ret     

4c1e 210200    ld      hl,$0002
4c21 09        add     hl,bc
4c22 5e        ld      e,(hl)
4c23 23        inc     hl
4c24 56        ld      d,(hl)
4c25 210a00    ld      hl,$000a
4c28 39        add     hl,sp
4c29 7e        ld      a,(hl)
4c2a 23        inc     hl
4c2b 66        ld      h,(hl)
4c2c 6f        ld      l,a
4c2d c33c85    jp      $853c
4c30 cda98b    call    $8ba9
4c33 cd2543    call    $4325
4c36 210800    ld      hl,$0008
4c39 39        add     hl,sp
4c3a e5        push    hl
4c3b 7e        ld      a,(hl)
4c3c 23        inc     hl
4c3d 66        ld      h,(hl)
4c3e 6f        ld      l,a
4c3f 2b        dec     hl
4c40 eb        ex      de,hl
4c41 e1        pop     hl
4c42 73        ld      (hl),e
4c43 23        inc     hl
4c44 72        ld      (hl),d
4c45 eb        ex      de,hl
4c46 23        inc     hl
4c47 7c        ld      a,h
4c48 b5        or      l
4c49 2805      jr      z,$4c50
4c4b cd6a42    call    $426a
4c4e 18e6      jr      $4c36
4c50 c33743    jp      $4337
4c53 2af48f    ld      hl,($8ff4)
4c56 e5        push    hl
4c57 cd9f45    call    $459f
4c5a d1        pop     de
4c5b c9        ret     

4c5c cda98b    call    $8ba9
4c5f cd534c    call    $4c53
4c62 c3e681    jp      $81e6
4c65 21ff00    ld      hl,$00ff
4c68 e5        push    hl
4c69 cd114b    call    $4b11
4c6c d1        pop     de
4c6d c9        ret     

4c6e cda98b    call    $8ba9
4c71 210000    ld      hl,$0000
4c74 22ee8f    ld      ($8fee),hl
4c77 22ec8f    ld      ($8fec),hl
4c7a cd3141    call    $4131
4c7d 2026      jr      nz,$4ca5
4c7f cd8d41    call    $418d
4c82 eb        ex      de,hl
4c83 210800    ld      hl,$0008
4c86 39        add     hl,sp
4c87 7e        ld      a,(hl)
4c88 23        inc     hl
4c89 66        ld      h,(hl)
4c8a 6f        ld      l,a
4c8b cd3c85    call    $853c
4c8e 2810      jr      z,$4ca0
4c90 cdaf43    call    $43af
4c93 210100    ld      hl,$0001
4c96 e5        push    hl
4c97 21698c    ld      hl,$8c69
4c9a e5        push    hl
4c9b cd167c    call    $7c16
4c9e d1        pop     de
4c9f d1        pop     de
4ca0 cd3741    call    $4137
4ca3 18d5      jr      $4c7a
4ca5 cd7b53    call    $537b
4ca8 2803      jr      z,$4cad
4caa cdb654    call    $54b6
4cad 210100    ld      hl,$0001
4cb0 e5        push    hl
4cb1 216d8c    ld      hl,$8c6d
4cb4 e5        push    hl
4cb5 cd167c    call    $7c16
4cb8 d1        pop     de
4cb9 d1        pop     de
4cba c9        ret     

4cbb cd8d41    call    $418d
4cbe e5        push    hl
4cbf cd0d45    call    $450d
4cc2 d1        pop     de
4cc3 c0        ret     nz

4cc4 cd3b55    call    $553b
4cc7 c9        ret     

4cc8 2a0890    ld      hl,($9008)
4ccb 7c        ld      a,h
4ccc b5        or      l
4ccd c8        ret     z

4cce 2a0290    ld      hl,($9002)
4cd1 7c        ld      a,h
4cd2 b5        or      l
4cd3 2807      jr      z,$4cdc
4cd5 210000    ld      hl,$0000
4cd8 229f8c    ld      ($8c9f),hl
4cdb c9        ret     

4cdc c3e255    jp      $55e2
4cdf 2af88f    ld      hl,($8ff8)
4ce2 110100    ld      de,$0001
4ce5 cd4885    call    $8548
4ce8 c0        ret     nz

4ce9 c32856    jp      $5628
4cec cda98b    call    $8ba9
4cef 210800    ld      hl,$0008
4cf2 39        add     hl,sp
4cf3 5e        ld      e,(hl)
4cf4 23        inc     hl
4cf5 56        ld      d,(hl)
4cf6 d5        push    de
4cf7 cd5646    call    $4656
4cfa d1        pop     de
4cfb c0        ret     nz

4cfc c33b55    jp      $553b
4cff cd7c32    call    $327c
4d02 cd8d41    call    $418d
4d05 22ee8f    ld      ($8fee),hl
4d08 e5        push    hl
4d09 cd2c46    call    $462c
4d0c 22ec8f    ld      ($8fec),hl
4d0f e3        ex      (sp),hl
4d10 cdc941    call    $41c9
4d13 d1        pop     de
4d14 cda04b    call    $4ba0
4d17 200d      jr      nz,$4d26
4d19 cd0b52    call    $520b
4d1c cd7b53    call    $537b
4d1f 2803      jr      z,$4d24
4d21 cdd111    call    $11d1
4d24 18ee      jr      $4d14
4d26 c39641    jp      $4196
4d29 2abc8f    ld      hl,($8fbc)
4d2c e5        push    hl
4d2d 2af08f    ld      hl,($8ff0)
4d30 e5        push    hl
4d31 cd3447    call    $4734
4d34 d1        pop     de
4d35 d1        pop     de
4d36 221f91    ld      ($911f),hl
4d39 7c        ld      a,h
4d3a b5        or      l
4d3b 2003      jr      nz,$4d40
4d3d cd0e58    call    $580e
4d40 2aea8f    ld      hl,($8fea)
4d43 e5        push    hl
4d44 cd6341    call    $4163
4d47 2af08f    ld      hl,($8ff0)
4d4a e3        ex      (sp),hl
4d4b cd6341    call    $4163
4d4e 2aec8f    ld      hl,($8fec)
4d51 e3        ex      (sp),hl
4d52 cd6341    call    $4163
4d55 d1        pop     de
4d56 2a1f91    ld      hl,($911f)
4d59 cdff86    call    $86ff
4d5c e5        push    hl
4d5d cd6341    call    $4163
4d60 210200    ld      hl,$0002
4d63 e3        ex      (sp),hl
4d64 cdde41    call    $41de
4d67 2abe8f    ld      hl,($8fbe)
4d6a e3        ex      (sp),hl
4d6b cd6341    call    $4163
4d6e d1        pop     de
4d6f cd1d51    call    $511d
4d72 2a1f91    ld      hl,($911f)
4d75 cdf886    call    $86f8
4d78 e5        push    hl
4d79 cdf94f    call    $4ff9
4d7c 2abe8f    ld      hl,($8fbe)
4d7f e3        ex      (sp),hl
4d80 cd455a    call    $5a45
4d83 210300    ld      hl,$0003
4d86 e3        ex      (sp),hl
4d87 cd0a42    call    $420a
4d8a d1        pop     de
4d8b 22ec8f    ld      ($8fec),hl
4d8e 2aee8f    ld      hl,($8fee)
4d91 e5        push    hl
4d92 210300    ld      hl,$0003
4d95 e5        push    hl
4d96 cd3542    call    $4235
4d99 d1        pop     de
4d9a d1        pop     de
4d9b cd7c4b    call    $4b7c
4d9e 2aec8f    ld      hl,($8fec)
4da1 7c        ld      a,h
4da2 b5        or      l
4da3 280c      jr      z,$4db1
4da5 2aec8f    ld      hl,($8fec)
4da8 cdf886    call    $86f8
4dab 22ee8f    ld      ($8fee),hl
4dae cd054e    call    $4e05
4db1 2abe8f    ld      hl,($8fbe)
4db4 e5        push    hl
4db5 cd455a    call    $5a45
4db8 d1        pop     de
4db9 2aa18c    ld      hl,($8ca1)
4dbc 7c        ld      a,h
4dbd b5        or      l
4dbe 2821      jr      z,$4de1
4dc0 cd7b53    call    $537b
4dc3 281c      jr      z,$4de1
4dc5 cd8c53    call    $538c
4dc8 cde043    call    $43e0
4dcb e5        push    hl
4dcc cd3135    call    $3531
4dcf 21fb4d    ld      hl,$4dfb
4dd2 e3        ex      (sp),hl
4dd3 cd1c67    call    $671c
4dd6 2af48f    ld      hl,($8ff4)
4dd9 e3        ex      (sp),hl
4dda cd3936    call    $3639
4ddd d1        pop     de
4dde cdab66    call    $66ab
4de1 210300    ld      hl,$0003
4de4 e5        push    hl
4de5 cdf441    call    $41f4
4de8 d1        pop     de
4de9 cdc549    call    $49c5
4dec cdaa41    call    $41aa
4def 22e68f    ld      ($8fe6),hl
4df2 cdaa41    call    $41aa
4df5 e5        push    hl
4df6 cd2b51    call    $512b
4df9 d1        pop     de
4dfa c9        ret     

4dfb 2072      jr      nz,$4e6f
4dfd 65        ld      h,l
4dfe 74        ld      (hl),h
4dff 75        ld      (hl),l
4e00 72        ld      (hl),d
4e01 6e        ld      l,(hl)
4e02 73        ld      (hl),e
4e03 2000      jr      nz,$4e05
4e05 cda98b    call    $8ba9
4e08 21698c    ld      hl,$8c69
4e0b e5        push    hl
4e0c cd017c    call    $7c01
4e0f d1        pop     de
4e10 c0        ret     nz

4e11 cd8443    call    $4384
4e14 cd8453    call    $5384
4e17 cda04b    call    $4ba0
4e1a 2814      jr      z,$4e30
4e1c cd0d51    call    $510d
4e1f 2aec8f    ld      hl,($8fec)
4e22 7c        ld      a,h
4e23 b5        or      l
4e24 c8        ret     z

4e25 2aec8f    ld      hl,($8fec)
4e28 cdf886    call    $86f8
4e2b 22ee8f    ld      ($8fee),hl
4e2e 18e7      jr      $4e17
4e30 2aec8f    ld      hl,($8fec)
4e33 cdff86    call    $86ff
4e36 2051      jr      nz,$4e89
4e38 2aee8f    ld      hl,($8fee)
4e3b cdff86    call    $86ff
4e3e 2049      jr      nz,$4e89
4e40 cde043    call    $43e0
4e43 e5        push    hl
4e44 2aee8f    ld      hl,($8fee)
4e47 cdf886    call    $86f8
4e4a d1        pop     de
4e4b cd3c85    call    $853c
4e4e 2839      jr      z,$4e89
4e50 2abc8f    ld      hl,($8fbc)
4e53 e5        push    hl
4e54 cde043    call    $43e0
4e57 e5        push    hl
4e58 cd3447    call    $4734
4e5b d1        pop     de
4e5c d1        pop     de
4e5d 22f08f    ld      ($8ff0),hl
4e60 7c        ld      a,h
4e61 b5        or      l
4e62 2825      jr      z,$4e89
4e64 2af08f    ld      hl,($8ff0)
4e67 cdf886    call    $86f8
4e6a 201d      jr      nz,$4e89
4e6c 2af08f    ld      hl,($8ff0)
4e6f cdff86    call    $86ff
4e72 2815      jr      z,$4e89
4e74 2af08f    ld      hl,($8ff0)
4e77 cdff86    call    $86ff
4e7a 22ec8f    ld      ($8fec),hl
4e7d cdf886    call    $86f8
4e80 22ee8f    ld      ($8fee),hl
4e83 cd9d69    call    $699d
4e86 c3174e    jp      $4e17
4e89 1800      jr      $4e8b
4e8b 2ab28f    ld      hl,($8fb2)
4e8e 7c        ld      a,h
4e8f b5        or      l
4e90 2875      jr      z,$4f07
4e92 cde043    call    $43e0
4e95 e5        push    hl
4e96 cde348    call    $48e3
4e99 d1        pop     de
4e9a 286b      jr      z,$4f07
4e9c cdb549    call    $49b5
4e9f cd8c53    call    $538c
4ea2 210e4f    ld      hl,$4f0e
4ea5 e5        push    hl
4ea6 cd1c67    call    $671c
4ea9 d1        pop     de
4eaa cde043    call    $43e0
4ead e5        push    hl
4eae cd3936    call    $3639
4eb1 21124f    ld      hl,$4f12
4eb4 e3        ex      (sp),hl
4eb5 cd1c67    call    $671c
4eb8 d1        pop     de
4eb9 cd8d41    call    $418d
4ebc e5        push    hl
4ebd cdff45    call    $45ff
4ec0 21798c    ld      hl,$8c79
4ec3 e3        ex      (sp),hl
4ec4 cd017c    call    $7c01
4ec7 d1        pop     de
4ec8 2808      jr      z,$4ed2
4eca cd9577    call    $7795
4ecd cdab66    call    $66ab
4ed0 18cd      jr      $4e9f
4ed2 212000    ld      hl,$0020
4ed5 e5        push    hl
4ed6 cddc28    call    $28dc
4ed9 d1        pop     de
4eda cd8532    call    $3285
4edd 2025      jr      nz,$4f04
4edf 2ade8f    ld      hl,($8fde)
4ee2 e5        push    hl
4ee3 cd6341    call    $4163
4ee6 d1        pop     de
4ee7 cd1a12    call    $121a
4eea 21698c    ld      hl,$8c69
4eed e5        push    hl
4eee cd017c    call    $7c01
4ef1 d1        pop     de
4ef2 2805      jr      z,$4ef9
4ef4 cd645a    call    $5a64
4ef7 1806      jr      $4eff
4ef9 cd8443    call    $4384
4efc cdff4c    call    $4cff
4eff cd2d12    call    $122d
4f02 189b      jr      $4e9f
4f04 cdc549    call    $49c5
4f07 cd1e4f    call    $4f1e
4f0a c3144e    jp      $4e14
4f0d c9        ret     

4f0e 49        ld      c,c
4f0f 6e        ld      l,(hl)
4f10 2000      jr      nz,$4f12
4f12 2c        inc     l
4f13 2000      jr      nz,$4f15
4f15 2af08f    ld      hl,($8ff0)
4f18 22f48f    ld      ($8ff4),hl
4f1b c31d51    jp      $511d
4f1e cd7c4b    call    $4b7c
4f21 cd9d69    call    $699d
4f24 cda04b    call    $4ba0
4f27 c0        ret     nz

4f28 2aee8f    ld      hl,($8fee)
4f2b cdf886    call    $86f8
4f2e 22f08f    ld      ($8ff0),hl
4f31 e5        push    hl
4f32 cdd944    call    $44d9
4f35 d1        pop     de
4f36 caf24f    jp      z,$4ff2
4f39 2af08f    ld      hl,($8ff0)
4f3c 7c        ld      a,h
4f3d b5        or      l
4f3e 200c      jr      nz,$4f4c
4f40 210000    ld      hl,$0000
4f43 22f48f    ld      ($8ff4),hl
4f46 cd1d51    call    $511d
4f49 c3f14f    jp      $4ff1
4f4c 2af08f    ld      hl,($8ff0)
4f4f e5        push    hl
4f50 cd2545    call    $4525
4f53 d1        pop     de
4f54 2806      jr      z,$4f5c
4f56 cd154f    call    $4f15
4f59 c3f14f    jp      $4ff1
4f5c 2af08f    ld      hl,($8ff0)
4f5f e5        push    hl
4f60 cd5646    call    $4656
4f63 d1        pop     de
4f64 cae94f    jp      z,$4fe9
4f67 2af08f    ld      hl,($8ff0)
4f6a e5        push    hl
4f6b cda110    call    $10a1
4f6e d1        pop     de
4f6f 2803      jr      z,$4f74
4f71 c3154f    jp      $4f15
4f74 2a7a8f    ld      hl,($8f7a)
4f77 7c        ld      a,h
4f78 b5        or      l
4f79 2831      jr      z,$4fac
4f7b cdcd28    call    $28cd
4f7e 2ae68d    ld      hl,($8de6)
4f81 2600      ld      h,$00
4f83 112200    ld      de,$0022
4f86 cd3c85    call    $853c
4f89 2806      jr      z,$4f91
4f8b cdd84b    call    $4bd8
4f8e c31d51    jp      $511d
4f91 2ae68d    ld      hl,($8de6)
4f94 2600      ld      h,$00
4f96 113a00    ld      de,$003a
4f99 cd3c85    call    $853c
4f9c 280e      jr      z,$4fac
4f9e cdd84b    call    $4bd8
4fa1 2af48f    ld      hl,($8ff4)
4fa4 e5        push    hl
4fa5 cd6e51    call    $516e
4fa8 d1        pop     de
4fa9 c31d51    jp      $511d
4fac 2af08f    ld      hl,($8ff0)
4faf e5        push    hl
4fb0 cdd046    call    $46d0
4fb3 d1        pop     de
4fb4 222191    ld      ($9121),hl
4fb7 7c        ld      a,h
4fb8 b5        or      l
4fb9 2003      jr      nz,$4fbe
4fbb c3294d    jp      $4d29
4fbe 2ae48f    ld      hl,($8fe4)
4fc1 e5        push    hl
4fc2 cd6341    call    $4163
4fc5 d1        pop     de
4fc6 2aee8f    ld      hl,($8fee)
4fc9 22e48f    ld      ($8fe4),hl
4fcc cd1d51    call    $511d
4fcf 2a2191    ld      hl,($9121)
4fd2 23        inc     hl
4fd3 23        inc     hl
4fd4 5e        ld      e,(hl)
4fd5 23        inc     hl
4fd6 56        ld      d,(hl)
4fd7 eb        ex      de,hl
4fd8 cd0485    call    $8504
4fdb 2ae48f    ld      hl,($8fe4)
4fde 22e68f    ld      ($8fe6),hl
4fe1 cdaa41    call    $41aa
4fe4 22e48f    ld      ($8fe4),hl
4fe7 1808      jr      $4ff1
4fe9 21f64f    ld      hl,$4ff6
4fec e5        push    hl
4fed cd8a56    call    $568a
4ff0 d1        pop     de
4ff1 c9        ret     

4ff2 cd154f    call    $4f15
4ff5 c9        ret     

4ff6 23        inc     hl
4ff7 3100cd    ld      sp,$cd00
4ffa a9        xor     c
4ffb 8b        adc     a,e
4ffc 21698c    ld      hl,$8c69
4fff e5        push    hl
5000 cd017c    call    $7c01
5003 d1        pop     de
5004 c0        ret     nz

5005 cd8443    call    $4384
5008 210800    ld      hl,$0008
500b 39        add     hl,sp
500c 5e        ld      e,(hl)
500d 23        inc     hl
500e 56        ld      d,(hl)
500f d5        push    de
5010 cd1e50    call    $501e
5013 d1        pop     de
5014 2aa18c    ld      hl,($8ca1)
5017 7c        ld      a,h
5018 b5        or      l
5019 c8        ret     z

501a cdab66    call    $66ab
501d c9        ret     

501e cda98b    call    $8ba9
5021 210800    ld      hl,$0008
5024 39        add     hl,sp
5025 4e        ld      c,(hl)
5026 23        inc     hl
5027 46        ld      b,(hl)
5028 78        ld      a,b
5029 b1        or      c
502a 201a      jr      nz,$5046
502c 2aa18c    ld      hl,($8ca1)
502f 7c        ld      a,h
5030 b5        or      l
5031 c8        ret     z

5032 cd8c53    call    $538c
5035 21a850    ld      hl,$50a8
5038 e5        push    hl
5039 cd1c67    call    $671c
503c d1        pop     de
503d cdda43    call    $43da
5040 e5        push    hl
5041 cd3135    call    $3531
5044 d1        pop     de
5045 c9        ret     

5046 cd904b    call    $4b90
5049 2808      jr      z,$5053
504b cdda43    call    $43da
504e e5        push    hl
504f cd5a54    call    $545a
5052 d1        pop     de
5053 cd6852    call    $5268
5056 cd7b53    call    $537b
5059 2008      jr      nz,$5063
505b cdda43    call    $43da
505e e5        push    hl
505f cd4c55    call    $554c
5062 d1        pop     de
5063 cd2e43    call    $432e
5066 cd7266    call    $6672
5069 60        ld      h,b
506a 69        ld      l,c
506b cdff86    call    $86ff
506e e5        push    hl
506f cd1e50    call    $501e
5072 d1        pop     de
5073 cd8d41    call    $418d
5076 e5        push    hl
5077 60        ld      h,b
5078 69        ld      l,c
5079 cdf886    call    $86f8
507c e5        push    hl
507d cd8116    call    $1681
5080 d1        pop     de
5081 d1        pop     de
5082 2aa18c    ld      hl,($8ca1)
5085 7c        ld      a,h
5086 b5        or      l
5087 281c      jr      z,$50a5
5089 cd8c53    call    $538c
508c 60        ld      h,b
508d 69        ld      l,c
508e cdf886    call    $86f8
5091 e5        push    hl
5092 cd3135    call    $3531
5095 21b450    ld      hl,$50b4
5098 e3        ex      (sp),hl
5099 cd1c67    call    $671c
509c d1        pop     de
509d cd8d41    call    $418d
50a0 e5        push    hl
50a1 cd3936    call    $3639
50a4 d1        pop     de
50a5 c39641    jp      $4196
50a8 45        ld      b,l
50a9 76        halt    
50aa 61        ld      h,c
50ab 6c        ld      l,h
50ac 75        ld      (hl),l
50ad 61        ld      h,c
50ae 74        ld      (hl),h
50af 69        ld      l,c
50b0 6e        ld      l,(hl)
50b1 67        ld      h,a
50b2 2000      jr      nz,$50b4
50b4 2069      jr      nz,$511f
50b6 73        ld      (hl),e
50b7 2000      jr      nz,$50b9
50b9 cd1e4f    call    $4f1e
50bc c38453    jp      $5384
50bf 2aee8f    ld      hl,($8fee)
50c2 e5        push    hl
50c3 cd6341    call    $4163
50c6 2af48f    ld      hl,($8ff4)
50c9 22ee8f    ld      ($8fee),hl
50cc e3        ex      (sp),hl
50cd cd6341    call    $4163
50d0 d1        pop     de
50d1 cd9d69    call    $699d
50d4 cda04b    call    $4ba0
50d7 2005      jr      nz,$50de
50d9 cdb950    call    $50b9
50dc 18f6      jr      $50d4
50de cd3743    call    $4337
50e1 cdaa41    call    $41aa
50e4 22ee8f    ld      ($8fee),hl
50e7 c9        ret     

50e8 2aee8f    ld      hl,($8fee)
50eb e5        push    hl
50ec cd6341    call    $4163
50ef d1        pop     de
50f0 2af48f    ld      hl,($8ff4)
50f3 22ee8f    ld      ($8fee),hl
50f6 cd7c4b    call    $4b7c
50f9 cda04b    call    $4ba0
50fc 2008      jr      nz,$5106
50fe cd8453    call    $5384
5101 cd0b52    call    $520b
5104 18f3      jr      $50f9
5106 cdaa41    call    $41aa
5109 22ee8f    ld      ($8fee),hl
510c c9        ret     

510d 2aec8f    ld      hl,($8fec)
5110 7c        ld      a,h
5111 b5        or      l
5112 c8        ret     z

5113 2aec8f    ld      hl,($8fec)
5116 cdff86    call    $86ff
5119 22ec8f    ld      ($8fec),hl
511c c9        ret     

511d cda04b    call    $4ba0
5120 c0        ret     nz

5121 2aee8f    ld      hl,($8fee)
5124 cdff86    call    $86ff
5127 22ee8f    ld      ($8fee),hl
512a c9        ret     

512b cda98b    call    $8ba9
512e 2aea8f    ld      hl,($8fea)
5131 eb        ex      de,hl
5132 210800    ld      hl,$0008
5135 39        add     hl,sp
5136 7e        ld      a,(hl)
5137 23        inc     hl
5138 66        ld      h,(hl)
5139 6f        ld      l,a
513a cd4885    call    $8548
513d c8        ret     z

513e 2aea8f    ld      hl,($8fea)
5141 7c        ld      a,h
5142 b5        or      l
5143 2008      jr      nz,$514d
5145 216b51    ld      hl,$516b
5148 e5        push    hl
5149 cd8a56    call    $568a
514c d1        pop     de
514d 2aea8f    ld      hl,($8fea)
5150 44        ld      b,h
5151 4d        ld      c,l
5152 cdf886    call    $86f8
5155 e5        push    hl
5156 cdad3d    call    $3dad
5159 d1        pop     de
515a 2aea8f    ld      hl,($8fea)
515d cdff86    call    $86ff
5160 22ea8f    ld      ($8fea),hl
5163 c5        push    bc
5164 cdad3d    call    $3dad
5167 d1        pop     de
5168 18c4      jr      $512e
516a c9        ret     

516b 23        inc     hl
516c 3200cd    ld      ($cd00),a
516f a9        xor     c
5170 8b        adc     a,e
5171 210800    ld      hl,$0008
5174 39        add     hl,sp
5175 4e        ld      c,(hl)
5176 23        inc     hl
5177 46        ld      b,(hl)
5178 c5        push    bc
5179 cdaf16    call    $16af
517c d1        pop     de
517d 222391    ld      ($9123),hl
5180 7c        ld      a,h
5181 b5        or      l
5182 2027      jr      nz,$51ab
5184 c5        push    bc
5185 cd5646    call    $4656
5188 d1        pop     de
5189 2811      jr      z,$519c
518b 2ac48f    ld      hl,($8fc4)
518e e5        push    hl
518f c5        push    bc
5190 cd0147    call    $4701
5193 d1        pop     de
5194 d1        pop     de
5195 222391    ld      ($9123),hl
5198 7c        ld      a,h
5199 b5        or      l
519a 2005      jr      nz,$51a1
519c c5        push    bc
519d cd3b58    call    $583b
51a0 d1        pop     de
51a1 2a2391    ld      hl,($9123)
51a4 cdf886    call    $86f8
51a7 22f48f    ld      ($8ff4),hl
51aa c9        ret     

51ab 2a2391    ld      hl,($9123)
51ae cdff86    call    $86ff
51b1 22f48f    ld      ($8ff4),hl
51b4 c9        ret     

51b5 cda98b    call    $8ba9
51b8 210800    ld      hl,$0008
51bb 39        add     hl,sp
51bc 5e        ld      e,(hl)
51bd 23        inc     hl
51be 56        ld      d,(hl)
51bf d5        push    de
51c0 2af08f    ld      hl,($8ff0)
51c3 44        ld      b,h
51c4 4d        ld      c,l
51c5 e5        push    hl
51c6 cdfa4b    call    $4bfa
51c9 d1        pop     de
51ca d1        pop     de
51cb 2004      jr      nz,$51d1
51cd 210000    ld      hl,$0000
51d0 c9        ret     

51d1 cd1d51    call    $511d
51d4 c5        push    bc
51d5 211000    ld      hl,$0010
51d8 39        add     hl,sp
51d9 5e        ld      e,(hl)
51da 23        inc     hl
51db 56        ld      d,(hl)
51dc eb        ex      de,hl
51dd cd0485    call    $8504
51e0 d1        pop     de
51e1 cd2e43    call    $432e
51e4 210c00    ld      hl,$000c
51e7 39        add     hl,sp
51e8 5e        ld      e,(hl)
51e9 23        inc     hl
51ea 56        ld      d,(hl)
51eb eb        ex      de,hl
51ec cd0485    call    $8504
51ef c5        push    bc
51f0 211000    ld      hl,$0010
51f3 39        add     hl,sp
51f4 5e        ld      e,(hl)
51f5 23        inc     hl
51f6 56        ld      d,(hl)
51f7 eb        ex      de,hl
51f8 cd0485    call    $8504
51fb d1        pop     de
51fc 210a00    ld      hl,$000a
51ff 39        add     hl,sp
5200 5e        ld      e,(hl)
5201 23        inc     hl
5202 56        ld      d,(hl)
5203 eb        ex      de,hl
5204 cd0485    call    $8504
5207 210100    ld      hl,$0001
520a c9        ret     

520b cd2d52    call    $522d
520e cda04b    call    $4ba0
5211 c0        ret     nz

5212 21f552    ld      hl,$52f5
5215 e5        push    hl
5216 212d52    ld      hl,$522d
5219 e5        push    hl
521a 215153    ld      hl,$5351
521d e5        push    hl
521e 21af0a    ld      hl,$0aaf
5221 e5        push    hl
5222 cdb551    call    $51b5
5225 eb        ex      de,hl
5226 cda08b    call    $8ba0
5229 c8        ret     z

522a 18e2      jr      $520e
522c c9        ret     

522d cd6852    call    $5268
5230 cda04b    call    $4ba0
5233 c0        ret     nz

5234 210953    ld      hl,$5309
5237 e5        push    hl
5238 216852    ld      hl,$5268
523b e5        push    hl
523c 214f06    ld      hl,$064f
523f e5        push    hl
5240 210207    ld      hl,$0702
5243 e5        push    hl
5244 cdb551    call    $51b5
5247 eb        ex      de,hl
5248 cda08b    call    $8ba0
524b 20e3      jr      nz,$5230
524d 210953    ld      hl,$5309
5250 e5        push    hl
5251 216852    ld      hl,$5268
5254 e5        push    hl
5255 217e06    ld      hl,$067e
5258 e5        push    hl
5259 210807    ld      hl,$0708
525c e5        push    hl
525d cdb551    call    $51b5
5260 eb        ex      de,hl
5261 cda08b    call    $8ba0
5264 20ca      jr      nz,$5230
5266 c9        ret     

5267 c9        ret     

5268 cda352    call    $52a3
526b cda04b    call    $4ba0
526e c0        ret     nz

526f 212b53    ld      hl,$532b
5272 e5        push    hl
5273 21a352    ld      hl,$52a3
5276 e5        push    hl
5277 211106    ld      hl,$0611
527a e5        push    hl
527b 21e305    ld      hl,$05e3
527e e5        push    hl
527f cdb551    call    $51b5
5282 eb        ex      de,hl
5283 cda08b    call    $8ba0
5286 20e3      jr      nz,$526b
5288 212b53    ld      hl,$532b
528b e5        push    hl
528c 21a352    ld      hl,$52a3
528f e5        push    hl
5290 213006    ld      hl,$0630
5293 e5        push    hl
5294 21ec05    ld      hl,$05ec
5297 e5        push    hl
5298 cdb551    call    $51b5
529b eb        ex      de,hl
529c cda08b    call    $8ba0
529f 20ca      jr      nz,$526b
52a1 c9        ret     

52a2 c9        ret     

52a3 cdde52    call    $52de
52a6 cda04b    call    $4ba0
52a9 c0        ret     nz

52aa 212b53    ld      hl,$532b
52ad e5        push    hl
52ae 21de52    ld      hl,$52de
52b1 e5        push    hl
52b2 21da06    ld      hl,$06da
52b5 e5        push    hl
52b6 212104    ld      hl,$0421
52b9 e5        push    hl
52ba cdb551    call    $51b5
52bd eb        ex      de,hl
52be cda08b    call    $8ba0
52c1 20e3      jr      nz,$52a6
52c3 212b53    ld      hl,$532b
52c6 e5        push    hl
52c7 21de52    ld      hl,$52de
52ca e5        push    hl
52cb 21aa06    ld      hl,$06aa
52ce e5        push    hl
52cf 21f906    ld      hl,$06f9
52d2 e5        push    hl
52d3 cdb551    call    $51b5
52d6 eb        ex      de,hl
52d7 cda08b    call    $8ba0
52da 20ca      jr      nz,$52a6
52dc c9        ret     

52dd c9        ret     

52de cd1e4f    call    $4f1e
52e1 cda04b    call    $4ba0
52e4 2805      jr      z,$52eb
52e6 210000    ld      hl,$0000
52e9 1806      jr      $52f1
52eb 2aee8f    ld      hl,($8fee)
52ee cdf886    call    $86f8
52f1 22f08f    ld      ($8ff0),hl
52f4 c9        ret     

52f5 cda98b    call    $8ba9
52f8 cd7b53    call    $537b
52fb c0        ret     nz

52fc 210800    ld      hl,$0008
52ff 39        add     hl,sp
5300 5e        ld      e,(hl)
5301 23        inc     hl
5302 56        ld      d,(hl)
5303 d5        push    de
5304 cd5a54    call    $545a
5307 d1        pop     de
5308 c9        ret     

5309 cda98b    call    $8ba9
530c 210800    ld      hl,$0008
530f 39        add     hl,sp
5310 4e        ld      c,(hl)
5311 23        inc     hl
5312 46        ld      b,(hl)
5313 c5        push    bc
5314 cdf552    call    $52f5
5317 2af48f    ld      hl,($8ff4)
531a e3        ex      (sp),hl
531b cd0d45    call    $450d
531e d1        pop     de
531f c0        ret     nz

5320 2af48f    ld      hl,($8ff4)
5323 e5        push    hl
5324 c5        push    bc
5325 cdec54    call    $54ec
5328 d1        pop     de
5329 d1        pop     de
532a c9        ret     

532b cda98b    call    $8ba9
532e 210800    ld      hl,$0008
5331 39        add     hl,sp
5332 4e        ld      c,(hl)
5333 23        inc     hl
5334 46        ld      b,(hl)
5335 c5        push    bc
5336 cdf552    call    $52f5
5339 2af48f    ld      hl,($8ff4)
533c e3        ex      (sp),hl
533d cd2545    call    $4525
5340 d1        pop     de
5341 c0        ret     nz

5342 cda24a    call    $4aa2
5345 c0        ret     nz

5346 2af48f    ld      hl,($8ff4)
5349 e5        push    hl
534a c5        push    bc
534b cdec54    call    $54ec
534e d1        pop     de
534f d1        pop     de
5350 c9        ret     

5351 2af48f    ld      hl,($8ff4)
5354 e5        push    hl
5355 cdaa41    call    $41aa
5358 e5        push    hl
5359 cd8009    call    $0980
535c d1        pop     de
535d e3        ex      (sp),hl
535e cd6353    call    $5363
5361 d1        pop     de
5362 c9        ret     

5363 cda98b    call    $8ba9
5366 210800    ld      hl,$0008
5369 39        add     hl,sp
536a 7e        ld      a,(hl)
536b 23        inc     hl
536c b6        or      (hl)
536d 2805      jr      z,$5374
536f 2ab88f    ld      hl,($8fb8)
5372 1803      jr      $5377
5374 2aba8f    ld      hl,($8fba)
5377 22f48f    ld      ($8ff4),hl
537a c9        ret     

537b 2af48f    ld      hl,($8ff4)
537e 110100    ld      de,$0001
5381 c34885    jp      $8548
5384 cd7b53    call    $537b
5387 c8        ret     z

5388 cdb654    call    $54b6
538b c9        ret     

538c cda98b    call    $8ba9
538f cdab66    call    $66ab
5392 cde043    call    $43e0
5395 cd5744    call    $4457
5398 210100    ld      hl,$0001
539b 44        ld      b,h
539c 4d        ld      c,l
539d cde943    call    $43e9
53a0 2808      jr      z,$53aa
53a2 cd5744    call    $4457
53a5 03        inc     bc
53a6 60        ld      h,b
53a7 69        ld      l,c
53a8 18f3      jr      $539d
53aa 215b00    ld      hl,$005b
53ad e5        push    hl
53ae cd3f67    call    $673f
53b1 d1        pop     de
53b2 c5        push    bc
53b3 cdd52d    call    $2dd5
53b6 21bf53    ld      hl,$53bf
53b9 e3        ex      (sp),hl
53ba cd1c67    call    $671c
53bd d1        pop     de
53be c9        ret     

53bf 5d        ld      e,l
53c0 2000      jr      nz,$53c2
53c2 21d053    ld      hl,$53d0
53c5 e5        push    hl
53c6 212200    ld      hl,$0022
53c9 e5        push    hl
53ca cd1459    call    $5914
53cd d1        pop     de
53ce d1        pop     de
53cf c9        ret     

53d0 54        ld      d,h
53d1 75        ld      (hl),l
53d2 72        ld      (hl),d
53d3 74        ld      (hl),h
53d4 6c        ld      l,h
53d5 65        ld      h,l
53d6 206f      jr      nz,$5447
53d8 75        ld      (hl),l
53d9 74        ld      (hl),h
53da 206f      jr      nz,$544b
53dc 66        ld      h,(hl)
53dd 2062      jr      nz,$5441
53df 6f        ld      l,a
53e0 75        ld      (hl),l
53e1 6e        ld      l,(hl)
53e2 64        ld      h,h
53e3 73        ld      (hl),e
53e4 00        nop     
53e5 21f353    ld      hl,$53f3
53e8 e5        push    hl
53e9 212700    ld      hl,$0027
53ec e5        push    hl
53ed cd1459    call    $5914
53f0 d1        pop     de
53f1 d1        pop     de
53f2 c9        ret     

53f3 50        ld      d,b
53f4 72        ld      (hl),d
53f5 69        ld      l,c
53f6 6d        ld      l,l
53f7 69        ld      l,c
53f8 74        ld      (hl),h
53f9 69        ld      l,c
53fa 76        halt    
53fb 65        ld      h,l
53fc 206e      jr      nz,$546c
53fe 6f        ld      l,a
53ff 74        ld      (hl),h
5400 2069      jr      nz,$546b
5402 6d        ld      l,l
5403 70        ld      (hl),b
5404 6c        ld      l,h
5405 65        ld      h,l
5406 6d        ld      l,l
5407 65        ld      h,l
5408 6e        ld      l,(hl)
5409 74        ld      (hl),h
540a 65        ld      h,l
540b 64        ld      h,h
540c 00        nop     
540d 211b54    ld      hl,$541b
5410 e5        push    hl
5411 210200    ld      hl,$0002
5414 e5        push    hl
5415 cd1459    call    $5914
5418 d1        pop     de
5419 d1        pop     de
541a c9        ret     

541b 4e        ld      c,(hl)
541c 75        ld      (hl),l
541d 6d        ld      l,l
541e 62        ld      h,d
541f 65        ld      h,l
5420 72        ld      (hl),d
5421 2074      jr      nz,$5497
5423 6f        ld      l,a
5424 6f        ld      l,a
5425 2062      jr      nz,$5489
5427 69        ld      l,c
5428 67        ld      h,a
5429 00        nop     
542a cda98b    call    $8ba9
542d 210600    ld      hl,$0006
5430 e5        push    hl
5431 cd5630    call    $3056
5434 d1        pop     de
5435 210800    ld      hl,$0008
5438 39        add     hl,sp
5439 5e        ld      e,(hl)
543a 23        inc     hl
543b 56        ld      d,(hl)
543c d5        push    de
543d cd6341    call    $4163
5440 214b54    ld      hl,$544b
5443 e3        ex      (sp),hl
5444 cd4059    call    $5940
5447 d1        pop     de
5448 c33759    jp      $5937
544b 69        ld      l,c
544c 73        ld      (hl),e
544d 2061      jr      nz,$54b0
544f 2070      jr      nz,$54c1
5451 72        ld      (hl),d
5452 69        ld      l,c
5453 6d        ld      l,l
5454 69        ld      l,c
5455 74        ld      (hl),h
5456 69        ld      l,c
5457 76        halt    
5458 65        ld      h,l
5459 00        nop     
545a cda98b    call    $8ba9
545d 211d00    ld      hl,$001d
5460 e5        push    hl
5461 cd5630    call    $3056
5464 217b54    ld      hl,$547b
5467 e3        ex      (sp),hl
5468 cd4059    call    $5940
546b d1        pop     de
546c 210800    ld      hl,$0008
546f 39        add     hl,sp
5470 5e        ld      e,(hl)
5471 23        inc     hl
5472 56        ld      d,(hl)
5473 d5        push    de
5474 cd6341    call    $4163
5477 d1        pop     de
5478 c33759    jp      $5937
547b 4e        ld      c,(hl)
547c 6f        ld      l,a
547d 74        ld      (hl),h
547e 2065      jr      nz,$54e5
5480 6e        ld      l,(hl)
5481 6f        ld      l,a
5482 75        ld      (hl),l
5483 67        ld      h,a
5484 68        ld      l,b
5485 2069      jr      nz,$54f0
5487 6e        ld      l,(hl)
5488 70        ld      (hl),b
5489 75        ld      (hl),l
548a 74        ld      (hl),h
548b 73        ld      (hl),e
548c 2074      jr      nz,$5502
548e 6f        ld      l,a
548f 00        nop     
5490 2ae48f    ld      hl,($8fe4)
5493 cdf886    call    $86f8
5496 e5        push    hl
5497 cd5a54    call    $545a
549a d1        pop     de
549b c9        ret     

549c 21aa54    ld      hl,$54aa
549f e5        push    hl
54a0 212500    ld      hl,$0025
54a3 e5        push    hl
54a4 cd1459    call    $5914
54a7 d1        pop     de
54a8 d1        pop     de
54a9 c9        ret     

54aa 29        add     hl,hl
54ab 2077      jr      nz,$5524
54ad 69        ld      l,c
54ae 74        ld      (hl),h
54af 68        ld      l,b
54b0 6f        ld      l,a
54b1 75        ld      (hl),l
54b2 74        ld      (hl),h
54b3 2028      jr      nz,$54dd
54b5 00        nop     
54b6 212600    ld      hl,$0026
54b9 e5        push    hl
54ba cd5630    call    $3056
54bd 21cf54    ld      hl,$54cf
54c0 e3        ex      (sp),hl
54c1 cd4059    call    $5940
54c4 2af48f    ld      hl,($8ff4)
54c7 e3        ex      (sp),hl
54c8 cdef58    call    $58ef
54cb d1        pop     de
54cc c33759    jp      $5937
54cf 49        ld      c,c
54d0 2064      jr      nz,$5536
54d2 6f        ld      l,a
54d3 6e        ld      l,(hl)
54d4 27        daa     
54d5 74        ld      (hl),h
54d6 206b      jr      nz,$5543
54d8 6e        ld      l,(hl)
54d9 6f        ld      l,a
54da 77        ld      (hl),a
54db 2077      jr      nz,$5554
54dd 68        ld      l,b
54de 61        ld      h,c
54df 74        ld      (hl),h
54e0 2074      jr      nz,$5556
54e2 6f        ld      l,a
54e3 2064      jr      nz,$5549
54e5 6f        ld      l,a
54e6 2077      jr      nz,$555f
54e8 69        ld      l,c
54e9 74        ld      (hl),h
54ea 68        ld      l,b
54eb 00        nop     
54ec cda98b    call    $8ba9
54ef 212900    ld      hl,$0029
54f2 e5        push    hl
54f3 cd5630    call    $3056
54f6 d1        pop     de
54f7 210800    ld      hl,$0008
54fa 39        add     hl,sp
54fb 5e        ld      e,(hl)
54fc 23        inc     hl
54fd 56        ld      d,(hl)
54fe d5        push    de
54ff cd6341    call    $4163
5502 212555    ld      hl,$5525
5505 e3        ex      (sp),hl
5506 cd4059    call    $5940
5509 d1        pop     de
550a 210a00    ld      hl,$000a
550d 39        add     hl,sp
550e 5e        ld      e,(hl)
550f 23        inc     hl
5510 56        ld      d,(hl)
5511 d5        push    de
5512 cdef58    call    $58ef
5515 213255    ld      hl,$5532
5518 e3        ex      (sp),hl
5519 cd4059    call    $5940
551c 210400    ld      hl,$0004
551f e3        ex      (sp),hl
5520 cd5459    call    $5954
5523 d1        pop     de
5524 c9        ret     

5525 64        ld      h,h
5526 6f        ld      l,a
5527 65        ld      h,l
5528 73        ld      (hl),e
5529 6e        ld      l,(hl)
552a 27        daa     
552b 74        ld      (hl),h
552c 206c      jr      nz,$559a
552e 69        ld      l,c
552f 6b        ld      l,e
5530 65        ld      h,l
5531 00        nop     
5532 61        ld      h,c
5533 73        ld      (hl),e
5534 2069      jr      nz,$559f
5536 6e        ld      l,(hl)
5537 70        ld      (hl),b
5538 75        ld      (hl),l
5539 74        ld      (hl),h
553a 00        nop     
553b 2af48f    ld      hl,($8ff4)
553e e5        push    hl
553f 2ae48f    ld      hl,($8fe4)
5542 cdf886    call    $86f8
5545 e5        push    hl
5546 cdec54    call    $54ec
5549 d1        pop     de
554a d1        pop     de
554b c9        ret     

554c cda98b    call    $8ba9
554f 212a00    ld      hl,$002a
5552 e5        push    hl
5553 cd5630    call    $3056
5556 2ae68f    ld      hl,($8fe6)
5559 e3        ex      (sp),hl
555a cd6341    call    $4163
555d 217955    ld      hl,$5579
5560 e3        ex      (sp),hl
5561 cd4059    call    $5940
5564 d1        pop     de
5565 210800    ld      hl,$0008
5568 39        add     hl,sp
5569 5e        ld      e,(hl)
556a 23        inc     hl
556b 56        ld      d,(hl)
556c d5        push    de
556d cd6341    call    $4163
5570 210300    ld      hl,$0003
5573 e3        ex      (sp),hl
5574 cd5459    call    $5954
5577 d1        pop     de
5578 c9        ret     

5579 64        ld      h,h
557a 69        ld      l,c
557b 64        ld      h,h
557c 6e        ld      l,(hl)
557d 27        daa     
557e 74        ld      (hl),h
557f 206f      jr      nz,$55f0
5581 75        ld      (hl),l
5582 74        ld      (hl),h
5583 70        ld      (hl),b
5584 75        ld      (hl),l
5585 74        ld      (hl),h
5586 2074      jr      nz,$55fc
5588 6f        ld      l,a
5589 00        nop     
558a cda98b    call    $8ba9
558d 213100    ld      hl,$0031
5590 e5        push    hl
5591 cd5630    call    $3056
5594 d1        pop     de
5595 210800    ld      hl,$0008
5598 39        add     hl,sp
5599 5e        ld      e,(hl)
559a 23        inc     hl
559b 56        ld      d,(hl)
559c d5        push    de
559d cd4059    call    $5940
55a0 21ab55    ld      hl,$55ab
55a3 e3        ex      (sp),hl
55a4 cd4059    call    $5940
55a7 d1        pop     de
55a8 c33759    jp      $5937
55ab 69        ld      l,c
55ac 73        ld      (hl),e
55ad 6e        ld      l,(hl)
55ae 27        daa     
55af 74        ld      (hl),h
55b0 2061      jr      nz,$5613
55b2 2070      jr      nz,$5624
55b4 61        ld      h,c
55b5 72        ld      (hl),d
55b6 61        ld      h,c
55b7 6d        ld      l,l
55b8 65        ld      h,l
55b9 74        ld      (hl),h
55ba 65        ld      h,l
55bb 72        ld      (hl),d
55bc 00        nop     
55bd 210100    ld      hl,$0001
55c0 229d8c    ld      ($8c9d),hl
55c3 21d155    ld      hl,$55d1
55c6 e5        push    hl
55c7 211700    ld      hl,$0017
55ca e5        push    hl
55cb cd1459    call    $5914
55ce d1        pop     de
55cf d1        pop     de
55d0 c9        ret     

55d1 49        ld      c,c
55d2 27        daa     
55d3 6d        ld      l,l
55d4 206f      jr      nz,$5645
55d6 75        ld      (hl),l
55d7 74        ld      (hl),h
55d8 206f      jr      nz,$5649
55da 66        ld      h,(hl)
55db 2073      jr      nz,$5650
55dd 70        ld      (hl),b
55de 61        ld      h,c
55df 63        ld      h,e
55e0 65        ld      h,l
55e1 00        nop     
55e2 213200    ld      hl,$0032
55e5 e5        push    hl
55e6 cd5630    call    $3056
55e9 210b56    ld      hl,$560b
55ec e3        ex      (sp),hl
55ed cd4059    call    $5940
55f0 d1        pop     de
55f1 2ae48f    ld      hl,($8fe4)
55f4 cdf886    call    $86f8
55f7 e5        push    hl
55f8 cd6341    call    $4163
55fb 211356    ld      hl,$5613
55fe e3        ex      (sp),hl
55ff cd4059    call    $5940
5602 210300    ld      hl,$0003
5605 e3        ex      (sp),hl
5606 cd5459    call    $5954
5609 d1        pop     de
560a c9        ret     

560b 49        ld      c,c
560c 2063      jr      nz,$5671
560e 61        ld      h,c
560f 6e        ld      l,(hl)
5610 27        daa     
5611 74        ld      (hl),h
5612 00        nop     
5613 77        ld      (hl),a
5614 68        ld      l,b
5615 69        ld      l,c
5616 6c        ld      l,h
5617 65        ld      h,l
5618 206c      jr      nz,$5686
561a 6f        ld      l,a
561b 61        ld      h,c
561c 64        ld      h,h
561d 69        ld      l,c
561e 6e        ld      l,(hl)
561f 67        ld      h,a
5620 2061      jr      nz,$5683
5622 2066      jr      nz,$568a
5624 69        ld      l,c
5625 6c        ld      l,h
5626 65        ld      h,l
5627 00        nop     
5628 210800    ld      hl,$0008
562b e5        push    hl
562c cd5630    call    $3056
562f 215156    ld      hl,$5651
5632 e3        ex      (sp),hl
5633 cd4059    call    $5940
5636 d1        pop     de
5637 2ae48f    ld      hl,($8fe4)
563a cdf886    call    $86f8
563d e5        push    hl
563e cd6341    call    $4163
5641 215756    ld      hl,$5657
5644 e3        ex      (sp),hl
5645 cd4059    call    $5940
5648 210300    ld      hl,$0003
564b e3        ex      (sp),hl
564c cd5459    call    $5954
564f d1        pop     de
5650 c9        ret     

5651 43        ld      b,e
5652 61        ld      h,c
5653 6e        ld      l,(hl)
5654 27        daa     
5655 74        ld      (hl),h
5656 00        nop     
5657 66        ld      h,(hl)
5658 72        ld      (hl),d
5659 6f        ld      l,a
565a 6d        ld      l,l
565b 2074      jr      nz,$56d1
565d 68        ld      l,b
565e 65        ld      h,l
565f 2065      jr      nz,$56c6
5661 64        ld      h,h
5662 69        ld      l,c
5663 74        ld      (hl),h
5664 6f        ld      l,a
5665 72        ld      (hl),d
5666 00        nop     
5667 217556    ld      hl,$5675
566a e5        push    hl
566b 210d00    ld      hl,$000d
566e e5        push    hl
566f cd1459    call    $5914
5672 d1        pop     de
5673 d1        pop     de
5674 c9        ret     

5675 43        ld      b,e
5676 61        ld      h,c
5677 6e        ld      l,(hl)
5678 27        daa     
5679 74        ld      (hl),h
567a 2064      jr      nz,$56e0
567c 69        ld      l,c
567d 76        halt    
567e 69        ld      l,c
567f 64        ld      h,h
5680 65        ld      h,l
5681 2062      jr      nz,$56e5
5683 79        ld      a,c
5684 207a      jr      nz,$5700
5686 65        ld      h,l
5687 72        ld      (hl),d
5688 6f        ld      l,a
5689 00        nop     
568a cda98b    call    $8ba9
568d cdab66    call    $66ab
5690 21ac56    ld      hl,$56ac
5693 e5        push    hl
5694 cd0967    call    $6709
5697 d1        pop     de
5698 210800    ld      hl,$0008
569b 39        add     hl,sp
569c 5e        ld      e,(hl)
569d 23        inc     hl
569e 56        ld      d,(hl)
569f d5        push    de
56a0 cd1c67    call    $671c
56a3 210300    ld      hl,$0003
56a6 e3        ex      (sp),hl
56a7 cd6e77    call    $776e
56aa d1        pop     de
56ab c9        ret     

56ac 212121    ld      hl,$2121
56af 204c      jr      nz,$56fd
56b1 4f        ld      c,a
56b2 47        ld      b,a
56b3 4f        ld      c,a
56b4 2073      jr      nz,$5729
56b6 79        ld      a,c
56b7 73        ld      (hl),e
56b8 74        ld      (hl),h
56b9 65        ld      h,l
56ba 6d        ld      l,l
56bb 2062      jr      nz,$571f
56bd 75        ld      (hl),l
56be 67        ld      h,a
56bf 3a2000    ld      a,($0020)
56c2 21d056    ld      hl,$56d0
56c5 e5        push    hl
56c6 212d00    ld      hl,$002d
56c9 e5        push    hl
56ca cd1459    call    $5914
56cd d1        pop     de
56ce d1        pop     de
56cf c9        ret     

56d0 54        ld      d,h
56d1 68        ld      l,b
56d2 65        ld      h,l
56d3 2077      jr      nz,$574c
56d5 6f        ld      l,a
56d6 72        ld      (hl),d
56d7 64        ld      h,h
56d8 2069      jr      nz,$5743
56da 73        ld      (hl),e
56db 2074      jr      nz,$5751
56dd 6f        ld      l,a
56de 6f        ld      l,a
56df 206c      jr      nz,$574d
56e1 6f        ld      l,a
56e2 6e        ld      l,(hl)
56e3 67        ld      h,a
56e4 00        nop     
56e5 212000    ld      hl,$0020
56e8 e5        push    hl
56e9 cd5630    call    $3056
56ec 21fa56    ld      hl,$56fa
56ef e3        ex      (sp),hl
56f0 cd4059    call    $5940
56f3 d1        pop     de
56f4 cd2e43    call    $432e
56f7 c33759    jp      $5937
56fa 54        ld      d,h
56fb 6f        ld      l,a
56fc 6f        ld      l,a
56fd 2066      jr      nz,$5765
56ff 65        ld      h,l
5700 77        ld      (hl),a
5701 2069      jr      nz,$576c
5703 74        ld      (hl),h
5704 65        ld      h,l
5705 6d        ld      l,l
5706 73        ld      (hl),e
5707 2069      jr      nz,$5772
5709 6e        ld      l,(hl)
570a 00        nop     
570b 211900    ld      hl,$0019
570e e5        push    hl
570f cd5630    call    $3056
5712 2af48f    ld      hl,($8ff4)
5715 e3        ex      (sp),hl
5716 cdef58    call    $58ef
5719 212457    ld      hl,$5724
571c e3        ex      (sp),hl
571d cd4059    call    $5940
5720 d1        pop     de
5721 c33759    jp      $5937
5724 69        ld      l,c
5725 73        ld      (hl),e
5726 206e      jr      nz,$5796
5728 6f        ld      l,a
5729 74        ld      (hl),h
572a 2054      jr      nz,$5780
572c 52        ld      d,d
572d 55        ld      d,l
572e 45        ld      b,l
572f 206f      jr      nz,$57a0
5731 72        ld      (hl),d
5732 2046      jr      nz,$577a
5734 41        ld      b,c
5735 4c        ld      c,h
5736 53        ld      d,e
5737 45        ld      b,l
5738 00        nop     
5739 214757    ld      hl,$5747
573c e5        push    hl
573d 210b00    ld      hl,$000b
5740 e5        push    hl
5741 cd1459    call    $5914
5744 d1        pop     de
5745 d1        pop     de
5746 c9        ret     

5747 49        ld      c,c
5748 27        daa     
5749 6d        ld      l,l
574a 2068      jr      nz,$57b4
574c 61        ld      h,c
574d 76        halt    
574e 69        ld      l,c
574f 6e        ld      l,(hl)
5750 67        ld      h,a
5751 2074      jr      nz,$57c7
5753 72        ld      (hl),d
5754 6f        ld      l,a
5755 75        ld      (hl),l
5756 62        ld      h,d
5757 6c        ld      l,h
5758 65        ld      h,l
5759 2077      jr      nz,$57d2
575b 69        ld      l,c
575c 74        ld      (hl),h
575d 68        ld      l,b
575e 2074      jr      nz,$57d4
5760 68        ld      l,b
5761 65        ld      h,l
5762 2064      jr      nz,$57c8
5764 69        ld      l,c
5765 73        ld      (hl),e
5766 6b        ld      l,e
5767 00        nop     
5768 217657    ld      hl,$5776
576b e5        push    hl
576c 210c00    ld      hl,$000c
576f e5        push    hl
5770 cd1459    call    $5914
5773 d1        pop     de
5774 d1        pop     de
5775 c9        ret     

5776 44        ld      b,h
5777 69        ld      l,c
5778 73        ld      (hl),e
5779 6b        ld      l,e
577a 2069      jr      nz,$57e5
577c 73        ld      (hl),e
577d 2066      jr      nz,$57e5
577f 75        ld      (hl),l
5780 6c        ld      l,h
5781 6c        ld      l,h
5782 00        nop     
5783 219157    ld      hl,$5791
5786 e5        push    hl
5787 212e00    ld      hl,$002e
578a e5        push    hl
578b cd1459    call    $5914
578e d1        pop     de
578f d1        pop     de
5790 c9        ret     

5791 4d        ld      c,l
5792 79        ld      a,c
5793 2065      jr      nz,$57fa
5795 64        ld      h,h
5796 69        ld      l,c
5797 74        ld      (hl),h
5798 2062      jr      nz,$57fc
579a 75        ld      (hl),l
579b 66        ld      h,(hl)
579c 66        ld      h,(hl)
579d 65        ld      h,l
579e 72        ld      (hl),d
579f 2069      jr      nz,$580a
57a1 73        ld      (hl),e
57a2 2066      jr      nz,$580a
57a4 75        ld      (hl),l
57a5 6c        ld      l,h
57a6 6c        ld      l,h
57a7 00        nop     
57a8 21b657    ld      hl,$57b6
57ab e5        push    hl
57ac 210f00    ld      hl,$000f
57af e5        push    hl
57b0 cdbd58    call    $58bd
57b3 d1        pop     de
57b4 d1        pop     de
57b5 c9        ret     

57b6 61        ld      h,c
57b7 6c        ld      l,h
57b8 72        ld      (hl),d
57b9 65        ld      h,l
57ba 61        ld      h,c
57bb 64        ld      h,h
57bc 79        ld      a,c
57bd 2065      jr      nz,$5824
57bf 78        ld      a,b
57c0 69        ld      l,c
57c1 73        ld      (hl),e
57c2 74        ld      (hl),h
57c3 73        ld      (hl),e
57c4 00        nop     
57c5 21d357    ld      hl,$57d3
57c8 e5        push    hl
57c9 211100    ld      hl,$0011
57cc e5        push    hl
57cd cdbd58    call    $58bd
57d0 d1        pop     de
57d1 d1        pop     de
57d2 c9        ret     

57d3 6e        ld      l,(hl)
57d4 6f        ld      l,a
57d5 74        ld      (hl),h
57d6 2066      jr      nz,$583e
57d8 6f        ld      l,a
57d9 75        ld      (hl),l
57da 6e        ld      l,(hl)
57db 64        ld      h,h
57dc 00        nop     
57dd 21eb57    ld      hl,$57eb
57e0 e5        push    hl
57e1 212f00    ld      hl,$002f
57e4 e5        push    hl
57e5 cd1459    call    $5914
57e8 d1        pop     de
57e9 d1        pop     de
57ea c9        ret     

57eb 49        ld      c,c
57ec 66        ld      h,(hl)
57ed 2077      jr      nz,$5866
57ef 61        ld      h,c
57f0 6e        ld      l,(hl)
57f1 74        ld      (hl),h
57f2 73        ld      (hl),e
57f3 205b      jr      nz,$5850
57f5 205d      jr      nz,$5854
57f7 27        daa     
57f8 73        ld      (hl),e
57f9 2061      jr      nz,$585c
57fb 72        ld      (hl),d
57fc 6f        ld      l,a
57fd 75        ld      (hl),l
57fe 6e        ld      l,(hl)
57ff 64        ld      h,h
5800 2069      jr      nz,$586b
5802 6e        ld      l,(hl)
5803 73        ld      (hl),e
5804 74        ld      (hl),h
5805 72        ld      (hl),d
5806 75        ld      (hl),l
5807 63        ld      h,e
5808 74        ld      (hl),h
5809 69        ld      l,c
580a 6f        ld      l,a
580b 6e        ld      l,(hl)
580c 73        ld      (hl),e
580d 00        nop     
580e 212300    ld      hl,$0023
5811 e5        push    hl
5812 cd5630    call    $3056
5815 212758    ld      hl,$5827
5818 e3        ex      (sp),hl
5819 cd4059    call    $5940
581c 2af08f    ld      hl,($8ff0)
581f e3        ex      (sp),hl
5820 cd6341    call    $4163
5823 d1        pop     de
5824 c33759    jp      $5937
5827 49        ld      c,c
5828 2064      jr      nz,$588e
582a 6f        ld      l,a
582b 6e        ld      l,(hl)
582c 27        daa     
582d 74        ld      (hl),h
582e 206b      jr      nz,$589b
5830 6e        ld      l,(hl)
5831 6f        ld      l,a
5832 77        ld      (hl),a
5833 2068      jr      nz,$589d
5835 6f        ld      l,a
5836 77        ld      (hl),a
5837 2074      jr      nz,$58ad
5839 6f        ld      l,a
583a 00        nop     
583b cd0585    call    $8505
583e feff      cp      $ff
5840 212400    ld      hl,$0024
5843 e5        push    hl
5844 cd5630    call    $3056
5847 d1        pop     de
5848 210a00    ld      hl,$000a
584b 39        add     hl,sp
584c 5e        ld      e,(hl)
584d 23        inc     hl
584e 56        ld      d,(hl)
584f d5        push    de
5850 cd6341    call    $4163
5853 215e58    ld      hl,$585e
5856 e3        ex      (sp),hl
5857 cd4059    call    $5940
585a d1        pop     de
585b c33759    jp      $5937
585e 68        ld      l,b
585f 61        ld      h,c
5860 73        ld      (hl),e
5861 206e      jr      nz,$58d1
5863 6f        ld      l,a
5864 2076      jr      nz,$58dc
5866 61        ld      h,c
5867 6c        ld      l,h
5868 75        ld      (hl),l
5869 65        ld      h,l
586a 00        nop     
586b 211500    ld      hl,$0015
586e e5        push    hl
586f cd5630    call    $3056
5872 218058    ld      hl,$5880
5875 e3        ex      (sp),hl
5876 cd4059    call    $5940
5879 d1        pop     de
587a cd2e43    call    $432e
587d c33759    jp      $5937
5880 49        ld      c,c
5881 2063      jr      nz,$58e6
5883 61        ld      h,c
5884 6e        ld      l,(hl)
5885 27        daa     
5886 74        ld      (hl),h
5887 2066      jr      nz,$58ef
5889 69        ld      l,c
588a 6e        ld      l,(hl)
588b 64        ld      h,h
588c 2063      jr      nz,$58f1
588e 61        ld      h,c
588f 74        ld      (hl),h
5890 63        ld      h,e
5891 68        ld      l,b
5892 2066      jr      nz,$58fa
5894 6f        ld      l,a
5895 72        ld      (hl),d
5896 00        nop     
5897 210700    ld      hl,$0007
589a e5        push    hl
589b cd5630    call    $3056
589e 21ac58    ld      hl,$58ac
58a1 e3        ex      (sp),hl
58a2 cd4059    call    $5940
58a5 d1        pop     de
58a6 cd2e43    call    $432e
58a9 c33759    jp      $5937
58ac 43        ld      b,e
58ad 61        ld      h,c
58ae 6e        ld      l,(hl)
58af 27        daa     
58b0 74        ld      (hl),h
58b1 2066      jr      nz,$5919
58b3 69        ld      l,c
58b4 6e        ld      l,(hl)
58b5 64        ld      h,h
58b6 206c      jr      nz,$5924
58b8 61        ld      h,c
58b9 62        ld      h,d
58ba 65        ld      h,l
58bb 6c        ld      l,h
58bc 00        nop     
58bd cda98b    call    $8ba9
58c0 210800    ld      hl,$0008
58c3 39        add     hl,sp
58c4 5e        ld      e,(hl)
58c5 23        inc     hl
58c6 56        ld      d,(hl)
58c7 d5        push    de
58c8 cd5630    call    $3056
58cb 21ea58    ld      hl,$58ea
58ce e3        ex      (sp),hl
58cf cd4059    call    $5940
58d2 d1        pop     de
58d3 cd2e43    call    $432e
58d6 210a00    ld      hl,$000a
58d9 39        add     hl,sp
58da 5e        ld      e,(hl)
58db 23        inc     hl
58dc 56        ld      d,(hl)
58dd d5        push    de
58de cd4059    call    $5940
58e1 210300    ld      hl,$0003
58e4 e3        ex      (sp),hl
58e5 cd5459    call    $5954
58e8 d1        pop     de
58e9 c9        ret     

58ea 46        ld      b,(hl)
58eb 69        ld      l,c
58ec 6c        ld      l,h
58ed 65        ld      h,l
58ee 00        nop     
58ef cda98b    call    $8ba9
58f2 210800    ld      hl,$0008
58f5 39        add     hl,sp
58f6 4e        ld      c,(hl)
58f7 23        inc     hl
58f8 46        ld      b,(hl)
58f9 c5        push    bc
58fa cd0d45    call    $450d
58fd d1        pop     de
58fe 280c      jr      z,$590c
5900 c5        push    bc
5901 cd2c0a    call    $0a2c
5904 d1        pop     de
5905 2805      jr      z,$590c
5907 2ad68f    ld      hl,($8fd6)
590a 1802      jr      $590e
590c 60        ld      h,b
590d 69        ld      l,c
590e e5        push    hl
590f cd6341    call    $4163
5912 d1        pop     de
5913 c9        ret     

5914 cda98b    call    $8ba9
5917 210800    ld      hl,$0008
591a 39        add     hl,sp
591b 5e        ld      e,(hl)
591c 23        inc     hl
591d 56        ld      d,(hl)
591e d5        push    de
591f cd5630    call    $3056
5922 d1        pop     de
5923 210a00    ld      hl,$000a
5926 39        add     hl,sp
5927 5e        ld      e,(hl)
5928 23        inc     hl
5929 56        ld      d,(hl)
592a d5        push    de
592b cd4059    call    $5940
592e 210100    ld      hl,$0001
5931 e3        ex      (sp),hl
5932 cd5459    call    $5954
5935 d1        pop     de
5936 c9        ret     

5937 210200    ld      hl,$0002
593a e5        push    hl
593b cd5459    call    $5954
593e d1        pop     de
593f c9        ret     

5940 cda98b    call    $8ba9
5943 210800    ld      hl,$0008
5946 39        add     hl,sp
5947 5e        ld      e,(hl)
5948 23        inc     hl
5949 56        ld      d,(hl)
594a d5        push    de
594b cdde4b    call    $4bde
594e e3        ex      (sp),hl
594f cd6341    call    $4163
5952 d1        pop     de
5953 c9        ret     

5954 cda98b    call    $8ba9
5957 cd3d3c    call    $3c3d
595a cd443c    call    $3c44
595d 210000    ld      hl,$0000
5960 220890    ld      ($9008),hl
5963 cd7410    call    $1074
5966 210800    ld      hl,$0008
5969 39        add     hl,sp
596a 5e        ld      e,(hl)
596b 23        inc     hl
596c 56        ld      d,(hl)
596d d5        push    de
596e cd304c    call    $4c30
5971 d1        pop     de
5972 cd2e43    call    $432e
5975 cde043    call    $43e0
5978 22b78c    ld      ($8cb7),hl
597b e5        push    hl
597c cd6341    call    $4163
597f 2aec8f    ld      hl,($8fec)
5982 22bb8c    ld      ($8cbb),hl
5985 e3        ex      (sp),hl
5986 cdb846    call    $46b8
5989 e3        ex      (sp),hl
598a cd6341    call    $4163
598d 2ae48f    ld      hl,($8fe4)
5990 e3        ex      (sp),hl
5991 cdb846    call    $46b8
5994 e3        ex      (sp),hl
5995 cd6341    call    $4163
5998 2aee8f    ld      hl,($8fee)
599b 22bf8c    ld      ($8cbf),hl
599e e3        ex      (sp),hl
599f cdb846    call    $46b8
59a2 e3        ex      (sp),hl
59a3 cd2c46    call    $462c
59a6 e3        ex      (sp),hl
59a7 cd6341    call    $4163
59aa d1        pop     de
59ab cd6a42    call    $426a
59ae cd6a42    call    $426a
59b1 cd6a42    call    $426a
59b4 cd6a42    call    $426a
59b7 cd6a42    call    $426a
59ba cdaa41    call    $41aa
59bd 22e28f    ld      ($8fe2),hl
59c0 2ac48f    ld      hl,($8fc4)
59c3 e5        push    hl
59c4 2ad28f    ld      hl,($8fd2)
59c7 e5        push    hl
59c8 cd3447    call    $4734
59cb d1        pop     de
59cc d1        pop     de
59cd eb        ex      de,hl
59ce 2ab88f    ld      hl,($8fb8)
59d1 cd3c85    call    $853c
59d4 44        ld      b,h
59d5 4d        ld      c,l
59d6 7c        ld      a,h
59d7 b5        or      l
59d8 2803      jr      z,$59dd
59da cde601    call    $01e6
59dd 2ade8f    ld      hl,($8fde)
59e0 e5        push    hl
59e1 cdc55a    call    $5ac5
59e4 d1        pop     de
59e5 2812      jr      z,$59f9
59e7 cdaf43    call    $43af
59ea 210100    ld      hl,$0001
59ed e5        push    hl
59ee 21698c    ld      hl,$8c69
59f1 e5        push    hl
59f2 cd167c    call    $7c16
59f5 d1        pop     de
59f6 d1        pop     de
59f7 1807      jr      $5a00
59f9 78        ld      a,b
59fa b1        or      c
59fb 2003      jr      nz,$5a00
59fd cd645a    call    $5a64
5a00 c3035a    jp      $5a03
5a03 cd3141    call    $4131
5a06 2824      jr      z,$5a2c
5a08 2ae28f    ld      hl,($8fe2)
5a0b 7c        ld      a,h
5a0c b5        or      l
5a0d 2005      jr      nz,$5a14
5a0f 210100    ld      hl,$0001
5a12 180e      jr      $5a22
5a14 2ae28f    ld      hl,($8fe2)
5a17 cdf886    call    $86f8
5a1a e5        push    hl
5a1b cd9f45    call    $459f
5a1e d1        pop     de
5a1f cde681    call    $81e6
5a22 e5        push    hl
5a23 216d8c    ld      hl,$8c6d
5a26 e5        push    hl
5a27 cd167c    call    $7c16
5a2a d1        pop     de
5a2b d1        pop     de
5a2c 2ac28f    ld      hl,($8fc2)
5a2f e5        push    hl
5a30 cd455a    call    $5a45
5a33 d1        pop     de
5a34 cdaf43    call    $43af
5a37 210000    ld      hl,$0000
5a3a e5        push    hl
5a3b 21698c    ld      hl,$8c69
5a3e e5        push    hl
5a3f cd167c    call    $7c16
5a42 d1        pop     de
5a43 d1        pop     de
5a44 c9        ret     

5a45 cda98b    call    $8ba9
5a48 cd8d41    call    $418d
5a4b eb        ex      de,hl
5a4c 210800    ld      hl,$0008
5a4f 39        add     hl,sp
5a50 7e        ld      a,(hl)
5a51 23        inc     hl
5a52 66        ld      h,(hl)
5a53 6f        ld      l,a
5a54 cd4885    call    $8548
5a57 c8        ret     z

5a58 21615a    ld      hl,$5a61
5a5b e5        push    hl
5a5c cd8a56    call    $568a
5a5f d1        pop     de
5a60 c9        ret     

5a61 23        inc     hl
5a62 33        inc     sp
5a63 00        nop     
5a64 cd451f    call    $1f45
5a67 cdab66    call    $66ab
5a6a 2ae28f    ld      hl,($8fe2)
5a6d e5        push    hl
5a6e 210200    ld      hl,$0002
5a71 e5        push    hl
5a72 cd7346    call    $4673
5a75 d1        pop     de
5a76 e3        ex      (sp),hl
5a77 cdff45    call    $45ff
5a7a d1        pop     de
5a7b 2ab78c    ld      hl,($8cb7)
5a7e 7c        ld      a,h
5a7f b5        or      l
5a80 2831      jr      z,$5ab3
5a82 21bd5a    ld      hl,$5abd
5a85 e5        push    hl
5a86 cd1c67    call    $671c
5a89 2ab78c    ld      hl,($8cb7)
5a8c e3        ex      (sp),hl
5a8d cd3936    call    $3639
5a90 d1        pop     de
5a91 2abb8c    ld      hl,($8cbb)
5a94 7c        ld      a,h
5a95 b5        or      l
5a96 281b      jr      z,$5ab3
5a98 2abb8c    ld      hl,($8cbb)
5a9b cdf886    call    $86f8
5a9e 2813      jr      z,$5ab3
5aa0 21c25a    ld      hl,$5ac2
5aa3 e5        push    hl
5aa4 cd1c67    call    $671c
5aa7 d1        pop     de
5aa8 2abb8c    ld      hl,($8cbb)
5aab cdf886    call    $86f8
5aae e5        push    hl
5aaf cdff45    call    $45ff
5ab2 d1        pop     de
5ab3 cdab66    call    $66ab
5ab6 210000    ld      hl,$0000
5ab9 22e28f    ld      ($8fe2),hl
5abc c9        ret     

5abd 2069      jr      nz,$5b28
5abf 6e        ld      l,(hl)
5ac0 2000      jr      nz,$5ac2
5ac2 3a2000    ld      a,($0020)
5ac5 cda98b    call    $8ba9
5ac8 cd3141    call    $4131
5acb 2058      jr      nz,$5b25
5acd cd8d41    call    $418d
5ad0 44        ld      b,h
5ad1 4d        ld      c,l
5ad2 e5        push    hl
5ad3 cdd944    call    $44d9
5ad6 d1        pop     de
5ad7 280f      jr      z,$5ae8
5ad9 60        ld      h,b
5ada 69        ld      l,c
5adb eb        ex      de,hl
5adc 2ac28f    ld      hl,($8fc2)
5adf cd3c85    call    $853c
5ae2 2804      jr      z,$5ae8
5ae4 210000    ld      hl,$0000
5ae7 c9        ret     

5ae8 60        ld      h,b
5ae9 69        ld      l,c
5aea eb        ex      de,hl
5aeb 2ac08f    ld      hl,($8fc0)
5aee cd3c85    call    $853c
5af1 282d      jr      z,$5b20
5af3 210500    ld      hl,$0005
5af6 e5        push    hl
5af7 cdfc42    call    $42fc
5afa d1        pop     de
5afb 222591    ld      ($9125),hl
5afe eb        ex      de,hl
5aff 210800    ld      hl,$0008
5b02 39        add     hl,sp
5b03 7e        ld      a,(hl)
5b04 23        inc     hl
5b05 66        ld      h,(hl)
5b06 6f        ld      l,a
5b07 cd3c85    call    $853c
5b0a 2804      jr      z,$5b10
5b0c 210100    ld      hl,$0001
5b0f c9        ret     

5b10 2a2591    ld      hl,($9125)
5b13 eb        ex      de,hl
5b14 2ab88f    ld      hl,($8fb8)
5b17 cd3c85    call    $853c
5b1a 2804      jr      z,$5b20
5b1c 210100    ld      hl,$0001
5b1f c9        ret     

5b20 cd3741    call    $4137
5b23 18a3      jr      $5ac8
5b25 210000    ld      hl,$0000
5b28 c9        ret     

5b29 cda98b    call    $8ba9
5b2c cdc84c    call    $4cc8
5b2f cd371f    call    $1f37
5b32 cd406c    call    $6c40
5b35 210100    ld      hl,$0001
5b38 22d48c    ld      ($8cd4),hl
5b3b 22d28c    ld      ($8cd2),hl
5b3e 2a2e90    ld      hl,($902e)
5b41 22c18c    ld      ($8cc1),hl
5b44 210100    ld      hl,$0001
5b47 e5        push    hl
5b48 2a9a8f    ld      hl,($8f9a)
5b4b 2b        dec     hl
5b4c 229a8f    ld      ($8f9a),hl
5b4f 23        inc     hl
5b50 e5        push    hl
5b51 cd506c    call    $6c50
5b54 d1        pop     de
5b55 2a658c    ld      hl,($8c65)
5b58 e3        ex      (sp),hl
5b59 cd1c67    call    $671c
5b5c 210100    ld      hl,$0001
5b5f e3        ex      (sp),hl
5b60 2a9a8f    ld      hl,($8f9a)
5b63 2b        dec     hl
5b64 229a8f    ld      ($8f9a),hl
5b67 23        inc     hl
5b68 e5        push    hl
5b69 cd506c    call    $6c50
5b6c d1        pop     de
5b6d d1        pop     de
5b6e 210000    ld      hl,$0000
5b71 44        ld      b,h
5b72 4d        ld      c,l
5b73 180b      jr      $5b80
5b75 2a678c    ld      hl,($8c67)
5b78 5e        ld      e,(hl)
5b79 1600      ld      d,$00
5b7b d5        push    de
5b7c cd7d77    call    $777d
5b7f d1        pop     de
5b80 60        ld      h,b
5b81 69        ld      l,c
5b82 03        inc     bc
5b83 eb        ex      de,hl
5b84 2a988f    ld      hl,($8f98)
5b87 cd6c85    call    $856c
5b8a 2802      jr      z,$5b8e
5b8c 18e7      jr      $5b75
5b8e cd716c    call    $6c71
5b91 2a2e90    ld      hl,($902e)
5b94 e5        push    hl
5b95 cd025c    call    $5c02
5b98 d1        pop     de
5b99 c3525c    jp      $5c52
5b9c cda98b    call    $8ba9
5b9f 2108fe    ld      hl,$fe08
5ba2 39        add     hl,sp
5ba3 22c38c    ld      ($8cc3),hl
5ba6 eb        ex      de,hl
5ba7 2a2e90    ld      hl,($902e)
5baa cd3086    call    $8630
5bad 22d88c    ld      ($8cd8),hl
5bb0 110002    ld      de,$0200
5bb3 eb        ex      de,hl
5bb4 cd6c85    call    $856c
5bb7 2803      jr      z,$5bbc
5bb9 cd8357    call    $5783
5bbc 210000    ld      hl,$0000
5bbf e5        push    hl
5bc0 2ac38c    ld      hl,($8cc3)
5bc3 d1        pop     de
5bc4 73        ld      (hl),e
5bc5 c9        ret     

5bc6 210000    ld      hl,$0000
5bc9 e5        push    hl
5bca 215f8d    ld      hl,$8d5f
5bcd 22c38c    ld      ($8cc3),hl
5bd0 d1        pop     de
5bd1 73        ld      (hl),e
5bd2 210100    ld      hl,$0001
5bd5 22d68c    ld      ($8cd6),hl
5bd8 21da8c    ld      hl,$8cda
5bdb 22c18c    ld      ($8cc1),hl
5bde e5        push    hl
5bdf cd025c    call    $5c02
5be2 d1        pop     de
5be3 2a6e8e    ld      hl,($8e6e)
5be6 7c        ld      a,h
5be7 b5        or      l
5be8 2808      jr      z,$5bf2
5bea 21da8c    ld      hl,$8cda
5bed e5        push    hl
5bee cd0578    call    $7805
5bf1 d1        pop     de
5bf2 21da8c    ld      hl,$8cda
5bf5 e5        push    hl
5bf6 21608d    ld      hl,$8d60
5bf9 e5        push    hl
5bfa cd887b    call    $7b88
5bfd d1        pop     de
5bfe d1        pop     de
5bff c3455c    jp      $5c45
5c02 cda98b    call    $8ba9
5c05 210800    ld      hl,$0008
5c08 39        add     hl,sp
5c09 4e        ld      c,(hl)
5c0a 23        inc     hl
5c0b 46        ld      b,(hl)
5c0c 2a6e8e    ld      hl,($8e6e)
5c0f 222791    ld      ($9127),hl
5c12 210000    ld      hl,$0000
5c15 226e8e    ld      ($8e6e),hl
5c18 cd725c    call    $5c72
5c1b 2ac38c    ld      hl,($8cc3)
5c1e 23        inc     hl
5c1f 22c38c    ld      ($8cc3),hl
5c22 2b        dec     hl
5c23 5e        ld      e,(hl)
5c24 1600      ld      d,$00
5c26 d5        push    de
5c27 60        ld      h,b
5c28 69        ld      l,c
5c29 03        inc     bc
5c2a d1        pop     de
5c2b 73        ld      (hl),e
5c2c 7a        ld      a,d
5c2d b3        or      e
5c2e 2802      jr      z,$5c32
5c30 18e9      jr      $5c1b
5c32 60        ld      h,b
5c33 69        ld      l,c
5c34 22c38c    ld      ($8cc3),hl
5c37 210000    ld      hl,$0000
5c3a 7d        ld      a,l
5c3b 32608d    ld      ($8d60),a
5c3e 2a2791    ld      hl,($9127)
5c41 226e8e    ld      ($8e6e),hl
5c44 c9        ret     

5c45 21cd8c    ld      hl,$8ccd
5c48 22c18c    ld      ($8cc1),hl
5c4b 210000    ld      hl,$0000
5c4e 22d68c    ld      ($8cd6),hl
5c51 c9        ret     

5c52 2a398c    ld      hl,($8c39)
5c55 229a8f    ld      ($8f9a),hl
5c58 210000    ld      hl,$0000
5c5b 22d48c    ld      ($8cd4),hl
5c5e c3406c    jp      $6c40
5c61 cda98b    call    $8ba9
5c64 2ad68c    ld      hl,($8cd6)
5c67 7c        ld      a,h
5c68 b5        or      l
5c69 2803      jr      z,$5c6e
5c6b cd9577    call    $7795
5c6e 2ad68c    ld      hl,($8cd6)
5c71 c9        ret     

5c72 cda98b    call    $8ba9
5c75 210000    ld      hl,$0000
5c78 22d08c    ld      ($8cd0),hl
5c7b 22ce8c    ld      ($8cce),hl
5c7e 210100    ld      hl,$0001
5c81 22908f    ld      ($8f90),hl
5c84 2a8c8f    ld      hl,($8f8c)
5c87 22928f    ld      ($8f92),hl
5c8a 2ad68c    ld      hl,($8cd6)
5c8d 7c        ld      a,h
5c8e b5        or      l
5c8f 201d      jr      nz,$5cae
5c91 2ab98c    ld      hl,($8cb9)
5c94 2b        dec     hl
5c95 e5        push    hl
5c96 210000    ld      hl,$0000
5c99 e5        push    hl
5c9a cd9761    call    $6197
5c9d d1        pop     de
5c9e d1        pop     de
5c9f cdde63    call    $63de
5ca2 cd1362    call    $6213
5ca5 2abd8c    ld      hl,($8cbd)
5ca8 2b        dec     hl
5ca9 e5        push    hl
5caa cd085f    call    $5f08
5cad d1        pop     de
5cae 21758c    ld      hl,$8c75
5cb1 e5        push    hl
5cb2 cd017c    call    $7c01
5cb5 d1        pop     de
5cb6 2803      jr      z,$5cbb
5cb8 cd8069    call    $6980
5cbb cdde63    call    $63de
5cbe cd216a    call    $6a21
5cc1 2a788f    ld      hl,($8f78)
5cc4 c33f5e    jp      $5e3f
5cc7 cdca5e    call    $5eca
5cca c38b5e    jp      $5e8b
5ccd cd435f    call    $5f43
5cd0 c38b5e    jp      $5e8b
5cd3 cd615c    call    $5c61
5cd6 c28b5e    jp      nz,$5e8b
5cd9 c3925e    jp      $5e92
5cdc cd4d63    call    $634d
5cdf c28b5e    jp      nz,$5e8b
5ce2 2ac58c    ld      hl,($8cc5)
5ce5 23        inc     hl
5ce6 22c58c    ld      ($8cc5),hl
5ce9 cda35f    call    $5fa3
5cec c38b5e    jp      $5e8b
5cef cddf5e    call    $5edf
5cf2 c38b5e    jp      $5e8b
5cf5 cda65e    call    $5ea6
5cf8 c38b5e    jp      $5e8b
5cfb cd3d5f    call    $5f3d
5cfe c38b5e    jp      $5e8b
5d01 cde85e    call    $5ee8
5d04 c38b5e    jp      $5e8b
5d07 21608d    ld      hl,$8d60
5d0a 44        ld      b,h
5d0b 4d        ld      c,l
5d0c 210100    ld      hl,$0001
5d0f 222991    ld      ($9129),hl
5d12 cd7863    call    $6378
5d15 2034      jr      nz,$5d4b
5d17 2a2991    ld      hl,($9129)
5d1a 23        inc     hl
5d1b 222991    ld      ($9129),hl
5d1e 2b        dec     hl
5d1f 118600    ld      de,$0086
5d22 eb        ex      de,hl
5d23 cd5585    call    $8555
5d26 2810      jr      z,$5d38
5d28 cd9577    call    $7795
5d2b 210100    ld      hl,$0001
5d2e e5        push    hl
5d2f 21758c    ld      hl,$8c75
5d32 e5        push    hl
5d33 cd167c    call    $7c16
5d36 d1        pop     de
5d37 d1        pop     de
5d38 2ac58c    ld      hl,($8cc5)
5d3b 23        inc     hl
5d3c 22c58c    ld      ($8cc5),hl
5d3f 2b        dec     hl
5d40 5e        ld      e,(hl)
5d41 1600      ld      d,$00
5d43 d5        push    de
5d44 60        ld      h,b
5d45 69        ld      l,c
5d46 03        inc     bc
5d47 d1        pop     de
5d48 73        ld      (hl),e
5d49 18c7      jr      $5d12
5d4b 210000    ld      hl,$0000
5d4e eb        ex      de,hl
5d4f 60        ld      h,b
5d50 69        ld      l,c
5d51 73        ld      (hl),e
5d52 cda35f    call    $5fa3
5d55 c38b5e    jp      $5e8b
5d58 cd615c    call    $5c61
5d5b 2003      jr      nz,$5d60
5d5d cd1362    call    $6213
5d60 c38b5e    jp      $5e8b
5d63 2ad68c    ld      hl,($8cd6)
5d66 7c        ld      a,h
5d67 b5        or      l
5d68 2803      jr      z,$5d6d
5d6a c3925e    jp      $5e92
5d6d 210a00    ld      hl,$000a
5d70 e5        push    hl
5d71 cd2060    call    $6020
5d74 d1        pop     de
5d75 c38b5e    jp      $5e8b
5d78 2a8c8f    ld      hl,($8f8c)
5d7b e5        push    hl
5d7c cda160    call    $60a1
5d7f d1        pop     de
5d80 c38b5e    jp      $5e8b
5d83 cd615c    call    $5c61
5d86 200b      jr      nz,$5d93
5d88 210a00    ld      hl,$000a
5d8b e5        push    hl
5d8c cd2060    call    $6020
5d8f d1        pop     de
5d90 cd435f    call    $5f43
5d93 c38b5e    jp      $5e8b
5d96 cd6960    call    $6069
5d99 c38b5e    jp      $5e8b
5d9c 215c00    ld      hl,$005c
5d9f e5        push    hl
5da0 cd2060    call    $6020
5da3 d1        pop     de
5da4 c38b5e    jp      $5e8b
5da7 cd615c    call    $5c61
5daa 200d      jr      nz,$5db9
5dac 21ffff    ld      hl,$ffff
5daf e5        push    hl
5db0 210000    ld      hl,$0000
5db3 e5        push    hl
5db4 cd2862    call    $6228
5db7 d1        pop     de
5db8 d1        pop     de
5db9 c38b5e    jp      $5e8b
5dbc cd615c    call    $5c61
5dbf 200d      jr      nz,$5dce
5dc1 21ffff    ld      hl,$ffff
5dc4 e5        push    hl
5dc5 210100    ld      hl,$0001
5dc8 e5        push    hl
5dc9 cd9761    call    $6197
5dcc d1        pop     de
5dcd d1        pop     de
5dce c38b5e    jp      $5e8b
5dd1 cd615c    call    $5c61
5dd4 2014      jr      nz,$5dea
5dd6 2a9a8f    ld      hl,($8f9a)
5dd9 eb        ex      de,hl
5dda 2a8e8f    ld      hl,($8f8e)
5ddd cd3086    call    $8630
5de0 e5        push    hl
5de1 210100    ld      hl,$0001
5de4 e5        push    hl
5de5 cd9761    call    $6197
5de8 d1        pop     de
5de9 d1        pop     de
5dea c38b5e    jp      $5e8b
5ded cd615c    call    $5c61
5df0 2013      jr      nz,$5e05
5df2 2a8e8f    ld      hl,($8f8e)
5df5 eb        ex      de,hl
5df6 2a9a8f    ld      hl,($8f9a)
5df9 19        add     hl,de
5dfa 2b        dec     hl
5dfb e5        push    hl
5dfc 210000    ld      hl,$0000
5dff e5        push    hl
5e00 cd2862    call    $6228
5e03 d1        pop     de
5e04 d1        pop     de
5e05 c38b5e    jp      $5e8b
5e08 21608d    ld      hl,$8d60
5e0b 44        ld      b,h
5e0c 4d        ld      c,l
5e0d 180b      jr      $5e1a
5e0f 60        ld      h,b
5e10 69        ld      l,c
5e11 03        inc     bc
5e12 5e        ld      e,(hl)
5e13 1600      ld      d,$00
5e15 d5        push    de
5e16 cd2060    call    $6020
5e19 d1        pop     de
5e1a 60        ld      h,b
5e1b 69        ld      l,c
5e1c 7e        ld      a,(hl)
5e1d b7        or      a
5e1e 2802      jr      z,$5e22
5e20 18ed      jr      $5e0f
5e22 1867      jr      $5e8b
5e24 2a788f    ld      hl,($8f78)
5e27 110000    ld      de,$0000
5e2a eb        ex      de,hl
5e2b cd6d85    call    $856d
5e2e 280a      jr      z,$5e3a
5e30 2a788f    ld      hl,($8f78)
5e33 e5        push    hl
5e34 cd2060    call    $6020
5e37 d1        pop     de
5e38 1803      jr      $5e3d
5e3a cd9577    call    $7795
5e3d 184c      jr      $5e8b
5e3f 111b00    ld      de,$001b
5e42 19        add     hl,de
5e43 eb        ex      de,hl
5e44 21e5ff    ld      hl,$ffe5
5e47 19        add     hl,de
5e48 da245e    jp      c,$5e24
5e4b 21555e    ld      hl,$5e55
5e4e 19        add     hl,de
5e4f 19        add     hl,de
5e50 5e        ld      e,(hl)
5e51 23        inc     hl
5e52 56        ld      d,(hl)
5e53 eb        ex      de,hl
5e54 e9        jp      (hl)
5e55 fb        ei      
5e56 5c        ld      e,h
5e57 24        inc     h
5e58 5e        ld      e,(hl)
5e59 08        ex      af,af'
5e5a 5e        ld      e,(hl)
5e5b bc        cp      h
5e5c 5d        ld      e,l
5e5d 24        inc     h
5e5e 5e        ld      e,(hl)
5e5f d1        pop     de
5e60 5d        ld      e,l
5e61 ed5d      ret                      ; Undocumented

5e63 24        inc     h
5e64 5e        ld      e,(hl)
5e65 24        inc     h
5e66 5e        ld      e,(hl)
5e67 a7        and     a
5e68 5d        ld      e,l
5e69 9c        sbc     a,h
5e6a 5d        ld      e,l
5e6b 96        sub     (hl)
5e6c 5d        ld      e,l
5e6d 83        add     a,e
5e6e 5d        ld      e,l
5e6f 78        ld      a,b
5e70 5d        ld      e,l
5e71 63        ld      h,e
5e72 5d        ld      e,l
5e73 58        ld      e,b
5e74 5d        ld      e,l
5e75 07        rlca    
5e76 5d        ld      e,l
5e77 24        inc     h
5e78 5e        ld      e,(hl)
5e79 015dfb    ld      bc,$fb5d
5e7c 5c        ld      e,h
5e7d 24        inc     h
5e7e 5e        ld      e,(hl)
5e7f f5        push    af
5e80 5c        ld      e,h
5e81 ef        rst     $28
5e82 5c        ld      e,h
5e83 dc5cd3    call    c,$d35c
5e86 5c        ld      e,h
5e87 cd5cc7    call    $c75c
5e8a 5c        ld      e,h
5e8b cd8069    call    $6980
5e8e c3bb5c    jp      $5cbb
5e91 c9        ret     

5e92 cd8069    call    $6980
5e95 cdbe62    call    $62be
5e98 cd8463    call    $6384
5e9b 2803      jr      z,$5ea0
5e9d c3c066    jp      $66c0
5ea0 cd3763    call    $6337
5ea3 18f0      jr      $5e95
5ea5 c9        ret     

5ea6 cd4d63    call    $634d
5ea9 c0        ret     nz

5eaa cd5763    call    $6357
5ead 2005      jr      nz,$5eb4
5eaf cdce63    call    $63ce
5eb2 2805      jr      z,$5eb9
5eb4 cd9860    call    $6098
5eb7 1803      jr      $5ebc
5eb9 cd1861    call    $6118
5ebc cde563    call    $63e5
5ebf 2808      jr      z,$5ec9
5ec1 cd6c63    call    $636c
5ec4 2003      jr      nz,$5ec9
5ec6 cd9860    call    $6098
5ec9 c9        ret     

5eca cdbe62    call    $62be
5ecd 210000    ld      hl,$0000
5ed0 e5        push    hl
5ed1 cdad63    call    $63ad
5ed4 e3        ex      (sp),hl
5ed5 2a8e8f    ld      hl,($8f8e)
5ed8 e5        push    hl
5ed9 cd506c    call    $6c50
5edc d1        pop     de
5edd d1        pop     de
5ede c9        ret     

5edf 21ffff    ld      hl,$ffff
5ee2 e5        push    hl
5ee3 cd085f    call    $5f08
5ee6 d1        pop     de
5ee7 c9        ret     

5ee8 cda98b    call    $8ba9
5eeb cd6a69    call    $696a
5eee 44        ld      b,h
5eef 4d        ld      c,l
5ef0 1808      jr      $5efa
5ef2 212000    ld      hl,$0020
5ef5 e5        push    hl
5ef6 cd2060    call    $6020
5ef9 d1        pop     de
5efa 60        ld      h,b
5efb 69        ld      l,c
5efc 0b        dec     bc
5efd 110000    ld      de,$0000
5f00 eb        ex      de,hl
5f01 cd6d85    call    $856d
5f04 c8        ret     z

5f05 18eb      jr      $5ef2
5f07 c9        ret     

5f08 cda98b    call    $8ba9
5f0b 210800    ld      hl,$0008
5f0e 39        add     hl,sp
5f0f e5        push    hl
5f10 7e        ld      a,(hl)
5f11 23        inc     hl
5f12 66        ld      h,(hl)
5f13 6f        ld      l,a
5f14 2b        dec     hl
5f15 eb        ex      de,hl
5f16 e1        pop     hl
5f17 73        ld      (hl),e
5f18 23        inc     hl
5f19 72        ld      (hl),d
5f1a eb        ex      de,hl
5f1b 23        inc     hl
5f1c 7c        ld      a,h
5f1d b5        or      l
5f1e 280f      jr      z,$5f2f
5f20 cd4d63    call    $634d
5f23 200a      jr      nz,$5f2f
5f25 cd5763    call    $6357
5f28 2005      jr      nz,$5f2f
5f2a cd3b61    call    $613b
5f2d 18dc      jr      $5f0b
5f2f 2a8c8f    ld      hl,($8f8c)
5f32 e5        push    hl
5f33 2a8e8f    ld      hl,($8f8e)
5f36 e5        push    hl
5f37 cd506c    call    $6c50
5f3a d1        pop     de
5f3b d1        pop     de
5f3c c9        ret     

5f3d cd435f    call    $5f43
5f40 c3a35f    jp      $5fa3
5f43 2ace8c    ld      hl,($8cce)
5f46 7c        ld      a,h
5f47 b5        or      l
5f48 c8        ret     z

5f49 2ad08c    ld      hl,($8cd0)
5f4c 7c        ld      a,h
5f4d b5        or      l
5f4e 280c      jr      z,$5f5c
5f50 cdca62    call    $62ca
5f53 210800    ld      hl,$0008
5f56 e5        push    hl
5f57 cd3f67    call    $673f
5f5a d1        pop     de
5f5b c9        ret     

5f5c cd8a63    call    $638a
5f5f 2818      jr      z,$5f79
5f61 cd8463    call    $6384
5f64 280d      jr      z,$5f73
5f66 210100    ld      hl,$0001
5f69 e5        push    hl
5f6a 21758c    ld      hl,$8c75
5f6d e5        push    hl
5f6e cd167c    call    $7c16
5f71 d1        pop     de
5f72 d1        pop     de
5f73 cd1460    call    $6014
5f76 c3df5e    jp      $5edf
5f79 cd3763    call    $6337
5f7c cdca62    call    $62ca
5f7f cd6c63    call    $636c
5f82 280f      jr      z,$5f93
5f84 21ffff    ld      hl,$ffff
5f87 e5        push    hl
5f88 cdad63    call    $63ad
5f8b d1        pop     de
5f8c eb        ex      de,hl
5f8d 2ad08c    ld      hl,($8cd0)
5f90 19        add     hl,de
5f91 1804      jr      $5f97
5f93 2a988f    ld      hl,($8f98)
5f96 2b        dec     hl
5f97 e5        push    hl
5f98 2a8e8f    ld      hl,($8f8e)
5f9b 2b        dec     hl
5f9c e5        push    hl
5f9d cd506c    call    $6c50
5fa0 d1        pop     de
5fa1 d1        pop     de
5fa2 c9        ret     

5fa3 cd1164    call    $6411
5fa6 2ac58c    ld      hl,($8cc5)
5fa9 22c38c    ld      ($8cc3),hl
5fac c3af5f    jp      $5faf
5faf 2ad08c    ld      hl,($8cd0)
5fb2 7c        ld      a,h
5fb3 b5        or      l
5fb4 c0        ret     nz

5fb5 cd7863    call    $6378
5fb8 2859      jr      z,$6013
5fba cd8463    call    $6384
5fbd 2054      jr      nz,$6013
5fbf cd3763    call    $6337
5fc2 2ac18c    ld      hl,($8cc1)
5fc5 2b        dec     hl
5fc6 5e        ld      e,(hl)
5fc7 1600      ld      d,$00
5fc9 210a00    ld      hl,$000a
5fcc cd3c85    call    $853c
5fcf 2805      jr      z,$5fd6
5fd1 cd0d63    call    $630d
5fd4 183d      jr      $6013
5fd6 cd8a63    call    $638a
5fd9 280b      jr      z,$5fe6
5fdb cdbe62    call    $62be
5fde cd0264    call    $6402
5fe1 cddf5e    call    $5edf
5fe4 182d      jr      $6013
5fe6 2ac58c    ld      hl,($8cc5)
5fe9 7e        ld      a,(hl)
5fea b7        or      a
5feb 280a      jr      z,$5ff7
5fed 2ac58c    ld      hl,($8cc5)
5ff0 23        inc     hl
5ff1 22c58c    ld      ($8cc5),hl
5ff4 cd1164    call    $6411
5ff7 2a988f    ld      hl,($8f98)
5ffa e5        push    hl
5ffb 2a8e8f    ld      hl,($8f8e)
5ffe 2b        dec     hl
5fff e5        push    hl
6000 cd506c    call    $6c50
6003 d1        pop     de
6004 212000    ld      hl,$0020
6007 e3        ex      (sp),hl
6008 cd2769    call    $6927
600b 210800    ld      hl,$0008
600e e3        ex      (sp),hl
600f cd3f67    call    $673f
6012 d1        pop     de
6013 c9        ret     

6014 cdde63    call    $63de
6017 cd3763    call    $6337
601a cdbe62    call    $62be
601d c30264    jp      $6402
6020 cda98b    call    $8ba9
6023 210800    ld      hl,$0008
6026 39        add     hl,sp
6027 4e        ld      c,(hl)
6028 23        inc     hl
6029 46        ld      b,(hl)
602a cd6e62    call    $626e
602d cdce63    call    $63ce
6030 280d      jr      z,$603f
6032 60        ld      h,b
6033 69        ld      l,c
6034 110a00    ld      de,$000a
6037 cd4885    call    $8548
603a 2803      jr      z,$603f
603c cd9860    call    $6098
603f 60        ld      h,b
6040 69        ld      l,c
6041 e5        push    hl
6042 2ac38c    ld      hl,($8cc3)
6045 2b        dec     hl
6046 22c38c    ld      ($8cc3),hl
6049 d1        pop     de
604a 73        ld      (hl),e
604b cd0264    call    $6402
604e cdde63    call    $63de
6051 cdaf5f    call    $5faf
6054 60        ld      h,b
6055 69        ld      l,c
6056 110a00    ld      de,$000a
6059 cd3c85    call    $853c
605c 2805      jr      z,$6063
605e cd9860    call    $6098
6061 1803      jr      $6066
6063 cd1861    call    $6118
6066 c3de63    jp      $63de
6069 cda98b    call    $8ba9
606c 2a8c8f    ld      hl,($8f8c)
606f 44        ld      b,h
6070 4d        ld      c,l
6071 cdca5e    call    $5eca
6074 2ace8c    ld      hl,($8cce)
6077 7c        ld      a,h
6078 b5        or      l
6079 2817      jr      z,$6092
607b cd8a63    call    $638a
607e 2805      jr      z,$6085
6080 cd1460    call    $6014
6083 180d      jr      $6092
6085 cd3763    call    $6337
6088 2a8e8f    ld      hl,($8f8e)
608b 2b        dec     hl
608c 228e8f    ld      ($8f8e),hl
608f cdca5e    call    $5eca
6092 c5        push    bc
6093 cdef60    call    $60ef
6096 d1        pop     de
6097 c9        ret     

6098 210100    ld      hl,$0001
609b e5        push    hl
609c cda160    call    $60a1
609f d1        pop     de
60a0 c9        ret     

60a1 cda98b    call    $8ba9
60a4 cd4d63    call    $634d
60a7 c0        ret     nz

60a8 cddf5e    call    $5edf
60ab cdef63    call    $63ef
60ae 2827      jr      z,$60d7
60b0 cd4d63    call    $634d
60b3 2020      jr      nz,$60d5
60b5 cd1861    call    $6118
60b8 cd6c63    call    $636c
60bb 2018      jr      nz,$60d5
60bd cde563    call    $63e5
60c0 2811      jr      z,$60d3
60c2 212100    ld      hl,$0021
60c5 e5        push    hl
60c6 cd2769    call    $6927
60c9 210800    ld      hl,$0008
60cc e3        ex      (sp),hl
60cd cd3f67    call    $673f
60d0 d1        pop     de
60d1 1802      jr      $60d5
60d3 18db      jr      $60b0
60d5 1808      jr      $60df
60d7 cd4d63    call    $634d
60da 2003      jr      nz,$60df
60dc cd1861    call    $6118
60df cdca5e    call    $5eca
60e2 210800    ld      hl,$0008
60e5 39        add     hl,sp
60e6 5e        ld      e,(hl)
60e7 23        inc     hl
60e8 56        ld      d,(hl)
60e9 d5        push    de
60ea cdef60    call    $60ef
60ed d1        pop     de
60ee c9        ret     

60ef cda98b    call    $8ba9
60f2 210800    ld      hl,$0008
60f5 39        add     hl,sp
60f6 4e        ld      c,(hl)
60f7 23        inc     hl
60f8 46        ld      b,(hl)
60f9 2a8c8f    ld      hl,($8f8c)
60fc 50        ld      d,b
60fd 59        ld      e,c
60fe eb        ex      de,hl
60ff cd6c85    call    $856c
6102 280b      jr      z,$610f
6104 60        ld      h,b
6105 69        ld      l,c
6106 eb        ex      de,hl
6107 2a8c8f    ld      hl,($8f8c)
610a cd3086    call    $8630
610d 1803      jr      $6112
610f 210000    ld      hl,$0000
6112 e5        push    hl
6113 cd085f    call    $5f08
6116 d1        pop     de
6117 c9        ret     

6118 cda98b    call    $8ba9
611b cd5763    call    $6357
611e 2803      jr      z,$6123
6120 cd6e62    call    $626e
6123 2ac38c    ld      hl,($8cc3)
6126 23        inc     hl
6127 22c38c    ld      ($8cc3),hl
612a 2b        dec     hl
612b 5e        ld      e,(hl)
612c 1600      ld      d,$00
612e 42        ld      b,d
612f 4b        ld      c,e
6130 d5        push    de
6131 cd5361    call    $6153
6134 d1        pop     de
6135 c5        push    bc
6136 cd3f67    call    $673f
6139 d1        pop     de
613a c9        ret     

613b 2ac38c    ld      hl,($8cc3)
613e 23        inc     hl
613f 22c38c    ld      ($8cc3),hl
6142 2b        dec     hl
6143 5e        ld      e,(hl)
6144 1600      ld      d,$00
6146 d5        push    de
6147 cd5361    call    $6153
614a d1        pop     de
614b 2a8c8f    ld      hl,($8f8c)
614e 23        inc     hl
614f 228c8f    ld      ($8f8c),hl
6152 c9        ret     

6153 cda98b    call    $8ba9
6156 210800    ld      hl,$0008
6159 39        add     hl,sp
615a 4e        ld      c,(hl)
615b 23        inc     hl
615c 46        ld      b,(hl)
615d 60        ld      h,b
615e 69        ld      l,c
615f 110a00    ld      de,$000a
6162 cd4885    call    $8548
6165 2808      jr      z,$616f
6167 cde563    call    $63e5
616a 2803      jr      z,$616f
616c cd0d63    call    $630d
616f 2ad08c    ld      hl,($8cd0)
6172 23        inc     hl
6173 22d08c    ld      ($8cd0),hl
6176 2ace8c    ld      hl,($8cce)
6179 23        inc     hl
617a 22ce8c    ld      ($8cce),hl
617d 60        ld      h,b
617e 69        ld      l,c
617f e5        push    hl
6180 2ac18c    ld      hl,($8cc1)
6183 23        inc     hl
6184 22c18c    ld      ($8cc1),hl
6187 2b        dec     hl
6188 d1        pop     de
6189 73        ld      (hl),e
618a 60        ld      h,b
618b 69        ld      l,c
618c 110a00    ld      de,$000a
618f cd3c85    call    $853c
6192 c8        ret     z

6193 cd0d63    call    $630d
6196 c9        ret     

6197 cda98b    call    $8ba9
619a 210a00    ld      hl,$000a
619d 39        add     hl,sp
619e 4e        ld      c,(hl)
619f 23        inc     hl
61a0 46        ld      b,(hl)
61a1 78        ld      a,b
61a2 b1        or      c
61a3 2847      jr      z,$61ec
61a5 cd4d63    call    $634d
61a8 2042      jr      nz,$61ec
61aa cd8362    call    $6283
61ad 2805      jr      z,$61b4
61af cd9577    call    $7795
61b2 1838      jr      $61ec
61b4 cd6c63    call    $636c
61b7 201c      jr      nz,$61d5
61b9 210000    ld      hl,$0000
61bc e5        push    hl
61bd cdad63    call    $63ad
61c0 d1        pop     de
61c1 eb        ex      de,hl
61c2 2ad08c    ld      hl,($8cd0)
61c5 19        add     hl,de
61c6 eb        ex      de,hl
61c7 2a988f    ld      hl,($8f98)
61ca cd5585    call    $8555
61cd 2806      jr      z,$61d5
61cf 0b        dec     bc
61d0 60        ld      h,b
61d1 69        ld      l,c
61d2 cd0d63    call    $630d
61d5 cded62    call    $62ed
61d8 cd6c63    call    $636c
61db 2806      jr      z,$61e3
61dd 0b        dec     bc
61de 60        ld      h,b
61df 69        ld      l,c
61e0 cd0d63    call    $630d
61e3 2ac38c    ld      hl,($8cc3)
61e6 23        inc     hl
61e7 22c38c    ld      ($8cc3),hl
61ea 18b5      jr      $61a1
61ec cd4d63    call    $634d
61ef 2804      jr      z,$61f5
61f1 cd8463    call    $6384
61f4 c0        ret     nz

61f5 210800    ld      hl,$0008
61f8 39        add     hl,sp
61f9 7e        ld      a,(hl)
61fa 23        inc     hl
61fb b6        or      (hl)
61fc c8        ret     z

61fd cdbe62    call    $62be
6200 cd406c    call    $6c40
6203 cdf963    call    $63f9
6206 50        ld      d,b
6207 59        ld      e,c
6208 210000    ld      hl,$0000
620b cd6c85    call    $856c
620e c8        ret     z

620f cddf5e    call    $5edf
6212 c9        ret     

6213 2a9a8f    ld      hl,($8f9a)
6216 110200    ld      de,$0002
6219 eb        ex      de,hl
621a cd2285    call    $8522
621d e5        push    hl
621e 210100    ld      hl,$0001
6221 e5        push    hl
6222 cd2862    call    $6228
6225 d1        pop     de
6226 d1        pop     de
6227 c9        ret     

6228 cda98b    call    $8ba9
622b cdbe62    call    $62be
622e 210a00    ld      hl,$000a
6231 39        add     hl,sp
6232 e5        push    hl
6233 7e        ld      a,(hl)
6234 23        inc     hl
6235 66        ld      h,(hl)
6236 6f        ld      l,a
6237 2b        dec     hl
6238 eb        ex      de,hl
6239 e1        pop     hl
623a 73        ld      (hl),e
623b 23        inc     hl
623c 72        ld      (hl),d
623d 7a        ld      a,d
623e b3        or      e
623f 280d      jr      z,$624e
6241 cd8463    call    $6384
6244 2008      jr      nz,$624e
6246 cd3763    call    $6337
6249 cdbe62    call    $62be
624c 18e0      jr      $622e
624e cd406c    call    $6c40
6251 210800    ld      hl,$0008
6254 39        add     hl,sp
6255 7e        ld      a,(hl)
6256 23        inc     hl
6257 b6        or      (hl)
6258 2811      jr      z,$626b
625a 2ac38c    ld      hl,($8cc3)
625d eb        ex      de,hl
625e 2ac58c    ld      hl,($8cc5)
6261 cd4885    call    $8548
6264 2805      jr      z,$626b
6266 cda65e    call    $5ea6
6269 18ef      jr      $625a
626b c3f963    jp      $63f9
626e cd8362    call    $6283
6271 c8        ret     z

6272 cd9577    call    $7795
6275 210100    ld      hl,$0001
6278 e5        push    hl
6279 21758c    ld      hl,$8c75
627c e5        push    hl
627d cd167c    call    $7c16
6280 d1        pop     de
6281 d1        pop     de
6282 c9        ret     

6283 cda98b    call    $8ba9
6286 2ad68c    ld      hl,($8cd6)
6289 7c        ld      a,h
628a b5        or      l
628b 2805      jr      z,$6292
628d 210600    ld      hl,$0006
6290 1803      jr      $6295
6292 216400    ld      hl,$0064
6295 eb        ex      de,hl
6296 2a908f    ld      hl,($8f90)
6299 cd3086    call    $8630
629c 44        ld      b,h
629d 4d        ld      c,l
629e 110200    ld      de,$0002
62a1 eb        ex      de,hl
62a2 cd6c85    call    $856c
62a5 2805      jr      z,$62ac
62a7 210200    ld      hl,$0002
62aa 1802      jr      $62ae
62ac 60        ld      h,b
62ad 69        ld      l,c
62ae e5        push    hl
62af 2ac38c    ld      hl,($8cc3)
62b2 eb        ex      de,hl
62b3 2ac18c    ld      hl,($8cc1)
62b6 cd3086    call    $8630
62b9 d1        pop     de
62ba eb        ex      de,hl
62bb c36c85    jp      $856c
62be 2ad08c    ld      hl,($8cd0)
62c1 7c        ld      a,h
62c2 b5        or      l
62c3 c8        ret     z

62c4 cdca62    call    $62ca
62c7 18f5      jr      $62be
62c9 c9        ret     

62ca 2ace8c    ld      hl,($8cce)
62cd 2b        dec     hl
62ce 22ce8c    ld      ($8cce),hl
62d1 2ad08c    ld      hl,($8cd0)
62d4 2b        dec     hl
62d5 22d08c    ld      ($8cd0),hl
62d8 2ac18c    ld      hl,($8cc1)
62db 2b        dec     hl
62dc 22c18c    ld      ($8cc1),hl
62df 5e        ld      e,(hl)
62e0 1600      ld      d,$00
62e2 d5        push    de
62e3 2ac38c    ld      hl,($8cc3)
62e6 2b        dec     hl
62e7 22c38c    ld      ($8cc3),hl
62ea d1        pop     de
62eb 73        ld      (hl),e
62ec c9        ret     

62ed 2ad08c    ld      hl,($8cd0)
62f0 23        inc     hl
62f1 22d08c    ld      ($8cd0),hl
62f4 2ace8c    ld      hl,($8cce)
62f7 23        inc     hl
62f8 22ce8c    ld      ($8cce),hl
62fb 2ac38c    ld      hl,($8cc3)
62fe 5e        ld      e,(hl)
62ff 1600      ld      d,$00
6301 d5        push    de
6302 2ac18c    ld      hl,($8cc1)
6305 23        inc     hl
6306 22c18c    ld      ($8cc1),hl
6309 2b        dec     hl
630a d1        pop     de
630b 73        ld      (hl),e
630c c9        ret     

630d 2ad08c    ld      hl,($8cd0)
6310 e5        push    hl
6311 2ac18c    ld      hl,($8cc1)
6314 23        inc     hl
6315 22c18c    ld      ($8cc1),hl
6318 2b        dec     hl
6319 d1        pop     de
631a 73        ld      (hl),e
631b 210000    ld      hl,$0000
631e 22d08c    ld      ($8cd0),hl
6321 2a908f    ld      hl,($8f90)
6324 23        inc     hl
6325 22908f    ld      ($8f90),hl
6328 eb        ex      de,hl
6329 2a9a8f    ld      hl,($8f9a)
632c cd6d85    call    $856d
632f c8        ret     z

6330 210100    ld      hl,$0001
6333 22928f    ld      ($8f92),hl
6336 c9        ret     

6337 2a908f    ld      hl,($8f90)
633a 2b        dec     hl
633b 22908f    ld      ($8f90),hl
633e 2ac18c    ld      hl,($8cc1)
6341 2b        dec     hl
6342 22c18c    ld      ($8cc1),hl
6345 5e        ld      e,(hl)
6346 1600      ld      d,$00
6348 eb        ex      de,hl
6349 22d08c    ld      ($8cd0),hl
634c c9        ret     

634d 2ac38c    ld      hl,($8cc3)
6350 5e        ld      e,(hl)
6351 1600      ld      d,$00
6353 eb        ex      de,hl
6354 c3f685    jp      $85f6
6357 cda98b    call    $8ba9
635a cd6c63    call    $636c
635d 2009      jr      nz,$6368
635f cde563    call    $63e5
6362 2004      jr      nz,$6368
6364 210000    ld      hl,$0000
6367 c9        ret     

6368 210100    ld      hl,$0001
636b c9        ret     

636c 2ac38c    ld      hl,($8cc3)
636f 5e        ld      e,(hl)
6370 1600      ld      d,$00
6372 210a00    ld      hl,$000a
6375 c33c85    jp      $853c
6378 2ac58c    ld      hl,($8cc5)
637b 5e        ld      e,(hl)
637c 1600      ld      d,$00
637e d5        push    de
637f cd8b66    call    $668b
6382 d1        pop     de
6383 c9        ret     

6384 2ace8c    ld      hl,($8cce)
6387 c3f685    jp      $85f6
638a cda98b    call    $8ba9
638d 2a8e8f    ld      hl,($8f8e)
6390 110100    ld      de,$0001
6393 cd3c85    call    $853c
6396 2811      jr      z,$63a9
6398 210000    ld      hl,$0000
639b e5        push    hl
639c cdad63    call    $63ad
639f d1        pop     de
63a0 e5        push    hl
63a1 2a8c8f    ld      hl,($8f8c)
63a4 d1        pop     de
63a5 cd3c85    call    $853c
63a8 c9        ret     

63a9 210000    ld      hl,$0000
63ac c9        ret     

63ad cda98b    call    $8ba9
63b0 2a908f    ld      hl,($8f90)
63b3 eb        ex      de,hl
63b4 210800    ld      hl,$0008
63b7 39        add     hl,sp
63b8 7e        ld      a,(hl)
63b9 23        inc     hl
63ba 66        ld      h,(hl)
63bb 6f        ld      l,a
63bc 19        add     hl,de
63bd 110100    ld      de,$0001
63c0 eb        ex      de,hl
63c1 cd5685    call    $8556
63c4 2804      jr      z,$63ca
63c6 2a928f    ld      hl,($8f92)
63c9 c9        ret     

63ca 210100    ld      hl,$0001
63cd c9        ret     

63ce cda98b    call    $8ba9
63d1 cdef63    call    $63ef
63d4 2804      jr      z,$63da
63d6 cde563    call    $63e5
63d9 c9        ret     

63da 210000    ld      hl,$0000
63dd c9        ret     

63de 2ac38c    ld      hl,($8cc3)
63e1 22c58c    ld      ($8cc5),hl
63e4 c9        ret     

63e5 2a8c8f    ld      hl,($8f8c)
63e8 eb        ex      de,hl
63e9 2a988f    ld      hl,($8f98)
63ec c35585    jp      $8555
63ef 2a8e8f    ld      hl,($8f8e)
63f2 eb        ex      de,hl
63f3 2a9a8f    ld      hl,($8f9a)
63f6 c35585    jp      $8555
63f9 21cd8c    ld      hl,$8ccd
63fc 22c58c    ld      ($8cc5),hl
63ff c30264    jp      $6402
6402 2ac38c    ld      hl,($8cc3)
6405 22c98c    ld      ($8cc9),hl
6408 2ac58c    ld      hl,($8cc5)
640b 22c78c    ld      ($8cc7),hl
640e c32064    jp      $6420
6411 2ac58c    ld      hl,($8cc5)
6414 22c98c    ld      ($8cc9),hl
6417 2ac38c    ld      hl,($8cc3)
641a 22c78c    ld      ($8cc7),hl
641d c32064    jp      $6420
6420 2a8e8f    ld      hl,($8f8e)
6423 222b91    ld      ($912b),hl
6426 22948f    ld      ($8f94),hl
6429 2a8c8f    ld      hl,($8f8c)
642c 222d91    ld      ($912d),hl
642f cd4064    call    $6440
6432 2a2d91    ld      hl,($912d)
6435 e5        push    hl
6436 2a2b91    ld      hl,($912b)
6439 e5        push    hl
643a cd506c    call    $6c50
643d d1        pop     de
643e d1        pop     de
643f c9        ret     

6440 21718c    ld      hl,$8c71
6443 e5        push    hl
6444 cd017c    call    $7c01
6447 d1        pop     de
6448 c0        ret     nz

6449 2ac98c    ld      hl,($8cc9)
644c 7e        ld      a,(hl)
644d b7        or      a
644e 2833      jr      z,$6483
6450 2ac98c    ld      hl,($8cc9)
6453 eb        ex      de,hl
6454 2ac78c    ld      hl,($8cc7)
6457 cd3c85    call    $853c
645a 280b      jr      z,$6467
645c 2a8e8f    ld      hl,($8f8e)
645f eb        ex      de,hl
6460 2a948f    ld      hl,($8f94)
6463 cd3c85    call    $853c
6466 c0        ret     nz

6467 2ac78c    ld      hl,($8cc7)
646a 7e        ld      a,(hl)
646b b7        or      a
646c 2805      jr      z,$6473
646e cd1565    call    $6515
6471 1803      jr      $6476
6473 cd7a65    call    $657a
6476 2ac98c    ld      hl,($8cc9)
6479 5e        ld      e,(hl)
647a 1600      ld      d,$00
647c d5        push    de
647d cdd064    call    $64d0
6480 d1        pop     de
6481 1823      jr      $64a6
6483 2ac78c    ld      hl,($8cc7)
6486 7e        ld      a,(hl)
6487 b7        or      a
6488 c8        ret     z

6489 cd3166    call    $6631
648c cd1066    call    $6610
648f 280a      jr      z,$649b
6491 cd1c66    call    $661c
6494 2ac78c    ld      hl,($8cc7)
6497 23        inc     hl
6498 22c78c    ld      ($8cc7),hl
649b 210100    ld      hl,$0001
649e e5        push    hl
649f cdd064    call    $64d0
64a2 d1        pop     de
64a3 1801      jr      $64a6
64a5 c9        ret     

64a6 2ac98c    ld      hl,($8cc9)
64a9 7e        ld      a,(hl)
64aa b7        or      a
64ab 2813      jr      z,$64c0
64ad cd1066    call    $6610
64b0 280e      jr      z,$64c0
64b2 2ac78c    ld      hl,($8cc7)
64b5 23        inc     hl
64b6 22c78c    ld      ($8cc7),hl
64b9 2a948f    ld      hl,($8f94)
64bc 23        inc     hl
64bd 22948f    ld      ($8f94),hl
64c0 cd0466    call    $6604
64c3 2807      jr      z,$64cc
64c5 2ac98c    ld      hl,($8cc9)
64c8 23        inc     hl
64c9 22c98c    ld      ($8cc9),hl
64cc c34964    jp      $6449
64cf c9        ret     

64d0 cda98b    call    $8ba9
64d3 cde563    call    $63e5
64d6 2834      jr      z,$650c
64d8 cdec65    call    $65ec
64db 2822      jr      z,$64ff
64dd 212000    ld      hl,$0020
64e0 e5        push    hl
64e1 cd2769    call    $6927
64e4 d1        pop     de
64e5 210800    ld      hl,$0008
64e8 39        add     hl,sp
64e9 7e        ld      a,(hl)
64ea 23        inc     hl
64eb b6        or      (hl)
64ec 2008      jr      nz,$64f6
64ee cd1066    call    $6610
64f1 2803      jr      z,$64f6
64f3 c3843c    jp      $3c84
64f6 2a948f    ld      hl,($8f94)
64f9 23        inc     hl
64fa 22948f    ld      ($8f94),hl
64fd 1808      jr      $6507
64ff 212100    ld      hl,$0021
6502 e5        push    hl
6503 cd2769    call    $6927
6506 d1        pop     de
6507 cd1c66    call    $661c
650a 1808      jr      $6514
650c cd0466    call    $6604
650f 2803      jr      z,$6514
6511 cd1c66    call    $661c
6514 c9        ret     

6515 cda98b    call    $8ba9
6518 cdec65    call    $65ec
651b 2803      jr      z,$6520
651d c33166    jp      $6631
6520 cdf865    call    $65f8
6523 2803      jr      z,$6528
6525 c37a65    jp      $657a
6528 cd9565    call    $6595
652b 44        ld      b,h
652c 4d        ld      c,l
652d 110400    ld      de,$0004
6530 eb        ex      de,hl
6531 cd6d85    call    $856d
6534 2826      jr      z,$655c
6536 60        ld      h,b
6537 69        ld      l,c
6538 eb        ex      de,hl
6539 2ac78c    ld      hl,($8cc7)
653c 19        add     hl,de
653d 22c78c    ld      ($8cc7),hl
6540 60        ld      h,b
6541 69        ld      l,c
6542 eb        ex      de,hl
6543 2ac98c    ld      hl,($8cc9)
6546 19        add     hl,de
6547 22c98c    ld      ($8cc9),hl
654a 2a8c8f    ld      hl,($8f8c)
654d 50        ld      d,b
654e 59        ld      e,c
654f 19        add     hl,de
6550 e5        push    hl
6551 2a8e8f    ld      hl,($8f8e)
6554 e5        push    hl
6555 cd506c    call    $6c50
6558 d1        pop     de
6559 d1        pop     de
655a 181b      jr      $6577
655c cde563    call    $63e5
655f c0        ret     nz

6560 2ac98c    ld      hl,($8cc9)
6563 23        inc     hl
6564 22c98c    ld      ($8cc9),hl
6567 2b        dec     hl
6568 5e        ld      e,(hl)
6569 1600      ld      d,$00
656b d5        push    de
656c cd4b66    call    $664b
656f d1        pop     de
6570 2ac78c    ld      hl,($8cc7)
6573 23        inc     hl
6574 22c78c    ld      ($8cc7),hl
6577 189f      jr      $6518
6579 c9        ret     

657a cdec65    call    $65ec
657d c0        ret     nz

657e cde563    call    $63e5
6581 c0        ret     nz

6582 2ac98c    ld      hl,($8cc9)
6585 23        inc     hl
6586 22c98c    ld      ($8cc9),hl
6589 2b        dec     hl
658a 5e        ld      e,(hl)
658b 1600      ld      d,$00
658d d5        push    de
658e cd4b66    call    $664b
6591 d1        pop     de
6592 18e6      jr      $657a
6594 c9        ret     

6595 cda98b    call    $8ba9
6598 2ac98c    ld      hl,($8cc9)
659b 222f91    ld      ($912f),hl
659e 2ac78c    ld      hl,($8cc7)
65a1 223191    ld      ($9131),hl
65a4 210000    ld      hl,$0000
65a7 44        ld      b,h
65a8 4d        ld      c,l
65a9 1803      jr      $65ae
65ab 03        inc     bc
65ac 60        ld      h,b
65ad 69        ld      l,c
65ae 2a3191    ld      hl,($9131)
65b1 23        inc     hl
65b2 223191    ld      ($9131),hl
65b5 2b        dec     hl
65b6 5e        ld      e,(hl)
65b7 1600      ld      d,$00
65b9 d5        push    de
65ba 2a2f91    ld      hl,($912f)
65bd 5e        ld      e,(hl)
65be 1600      ld      d,$00
65c0 e1        pop     hl
65c1 cd3c85    call    $853c
65c4 2823      jr      z,$65e9
65c6 2a8c8f    ld      hl,($8f8c)
65c9 50        ld      d,b
65ca 59        ld      e,c
65cb 19        add     hl,de
65cc eb        ex      de,hl
65cd 2a988f    ld      hl,($8f98)
65d0 cd5585    call    $8555
65d3 2014      jr      nz,$65e9
65d5 2a2f91    ld      hl,($912f)
65d8 23        inc     hl
65d9 222f91    ld      ($912f),hl
65dc 2b        dec     hl
65dd 5e        ld      e,(hl)
65de 1600      ld      d,$00
65e0 d5        push    de
65e1 cd8b66    call    $668b
65e4 d1        pop     de
65e5 2002      jr      nz,$65e9
65e7 18c2      jr      $65ab
65e9 60        ld      h,b
65ea 69        ld      l,c
65eb c9        ret     

65ec 2ac98c    ld      hl,($8cc9)
65ef 5e        ld      e,(hl)
65f0 1600      ld      d,$00
65f2 d5        push    de
65f3 cd8b66    call    $668b
65f6 d1        pop     de
65f7 c9        ret     

65f8 2ac78c    ld      hl,($8cc7)
65fb 5e        ld      e,(hl)
65fc 1600      ld      d,$00
65fe d5        push    de
65ff cd8b66    call    $668b
6602 d1        pop     de
6603 c9        ret     

6604 2ac98c    ld      hl,($8cc9)
6607 5e        ld      e,(hl)
6608 1600      ld      d,$00
660a 210a00    ld      hl,$000a
660d c33c85    jp      $853c
6610 2ac78c    ld      hl,($8cc7)
6613 5e        ld      e,(hl)
6614 1600      ld      d,$00
6616 210a00    ld      hl,$000a
6619 c33c85    jp      $853c
661c cdef63    call    $63ef
661f 280d      jr      z,$662e
6621 210100    ld      hl,$0001
6624 e5        push    hl
6625 21718c    ld      hl,$8c71
6628 e5        push    hl
6629 cd167c    call    $7c16
662c d1        pop     de
662d d1        pop     de
662e c3c066    jp      $66c0
6631 cdf865    call    $65f8
6634 c0        ret     nz

6635 cde563    call    $63e5
6638 c0        ret     nz

6639 212000    ld      hl,$0020
663c e5        push    hl
663d cd4b66    call    $664b
6640 d1        pop     de
6641 2ac78c    ld      hl,($8cc7)
6644 23        inc     hl
6645 22c78c    ld      ($8cc7),hl
6648 18e7      jr      $6631
664a c9        ret     

664b cda98b    call    $8ba9
664e cdef63    call    $63ef
6651 2812      jr      z,$6665
6653 cde563    call    $63e5
6656 280d      jr      z,$6665
6658 210100    ld      hl,$0001
665b e5        push    hl
665c 21718c    ld      hl,$8c71
665f e5        push    hl
6660 cd167c    call    $7c16
6663 d1        pop     de
6664 d1        pop     de
6665 210800    ld      hl,$0008
6668 39        add     hl,sp
6669 5e        ld      e,(hl)
666a 1600      ld      d,$00
666c d5        push    de
666d cd3f67    call    $673f
6670 d1        pop     de
6671 c9        ret     

6672 2aa38c    ld      hl,($8ca3)
6675 23        inc     hl
6676 22a38c    ld      ($8ca3),hl
6679 111000    ld      de,$0010
667c eb        ex      de,hl
667d cd6d85    call    $856d
6680 c8        ret     z

6681 210000    ld      hl,$0000
6684 22a38c    ld      ($8ca3),hl
6687 cd9d69    call    $699d
668a c9        ret     

668b cda98b    call    $8ba9
668e 210800    ld      hl,$0008
6691 39        add     hl,sp
6692 4e        ld      c,(hl)
6693 23        inc     hl
6694 46        ld      b,(hl)
6695 60        ld      h,b
6696 69        ld      l,c
6697 110a00    ld      de,$000a
669a cd3c85    call    $853c
669d 2008      jr      nz,$66a7
669f 78        ld      a,b
66a0 b1        or      c
66a1 2804      jr      z,$66a7
66a3 210000    ld      hl,$0000
66a6 c9        ret     

66a7 210100    ld      hl,$0001
66aa c9        ret     

66ab 2a8c8f    ld      hl,($8f8c)
66ae 110100    ld      de,$0001
66b1 eb        ex      de,hl
66b2 cd6d85    call    $856d
66b5 c8        ret     z

66b6 cdc066    call    $66c0
66b9 c9        ret     

66ba cd3d3c    call    $3c3d
66bd c3ab66    jp      $66ab
66c0 210a00    ld      hl,$000a
66c3 e5        push    hl
66c4 cd3f67    call    $673f
66c7 d1        pop     de
66c8 c9        ret     

66c9 cda98b    call    $8ba9
66cc 210800    ld      hl,$0008
66cf 39        add     hl,sp
66d0 4e        ld      c,(hl)
66d1 23        inc     hl
66d2 46        ld      b,(hl)
66d3 2a6c8e    ld      hl,($8e6c)
66d6 7c        ld      a,h
66d7 b5        or      l
66d8 2829      jr      z,$6703
66da 2a7a8f    ld      hl,($8f7a)
66dd 23        inc     hl
66de 227a8f    ld      ($8f7a),hl
66e1 118600    ld      de,$0086
66e4 eb        ex      de,hl
66e5 cd5c86    call    $865c
66e8 2803      jr      z,$66ed
66ea cdc256    call    $56c2
66ed 60        ld      h,b
66ee 69        ld      l,c
66ef e5        push    hl
66f0 2a728f    ld      hl,($8f72)
66f3 d1        pop     de
66f4 73        ld      (hl),e
66f5 210000    ld      hl,$0000
66f8 e5        push    hl
66f9 2a728f    ld      hl,($8f72)
66fc 23        inc     hl
66fd 22728f    ld      ($8f72),hl
6700 d1        pop     de
6701 73        ld      (hl),e
6702 c9        ret     

6703 c5        push    bc
6704 cd3f67    call    $673f
6707 d1        pop     de
6708 c9        ret     

6709 cda98b    call    $8ba9
670c cd451f    call    $1f45
670f 210800    ld      hl,$0008
6712 39        add     hl,sp
6713 5e        ld      e,(hl)
6714 23        inc     hl
6715 56        ld      d,(hl)
6716 d5        push    de
6717 cd1c67    call    $671c
671a d1        pop     de
671b c9        ret     

671c cda98b    call    $8ba9
671f 210800    ld      hl,$0008
6722 39        add     hl,sp
6723 4e        ld      c,(hl)
6724 23        inc     hl
6725 46        ld      b,(hl)
6726 60        ld      h,b
6727 69        ld      l,c
6728 5e        ld      e,(hl)
6729 1600      ld      d,$00
672b d5        push    de
672c cd8b66    call    $668b
672f d1        pop     de
6730 c0        ret     nz

6731 60        ld      h,b
6732 69        ld      l,c
6733 03        inc     bc
6734 5e        ld      e,(hl)
6735 1600      ld      d,$00
6737 d5        push    de
6738 cdc966    call    $66c9
673b d1        pop     de
673c 18e8      jr      $6726
673e c9        ret     

673f cda98b    call    $8ba9
6742 210800    ld      hl,$0008
6745 39        add     hl,sp
6746 4e        ld      c,(hl)
6747 23        inc     hl
6748 46        ld      b,(hl)
6749 2afa8f    ld      hl,($8ffa)
674c 110200    ld      de,$0002
674f cd3c85    call    $853c
6752 282d      jr      z,$6781
6754 60        ld      h,b
6755 69        ld      l,c
6756 110a00    ld      de,$000a
6759 cd3c85    call    $853c
675c 2816      jr      z,$6774
675e cd843c    call    $3c84
6761 210d00    ld      hl,$000d
6764 e5        push    hl
6765 cd3321    call    $2133
6768 210a00    ld      hl,$000a
676b e3        ex      (sp),hl
676c cd3321    call    $2133
676f d1        pop     de
6770 cd8769    call    $6987
6773 c9        ret     

6774 2a8c8f    ld      hl,($8f8c)
6777 23        inc     hl
6778 228c8f    ld      ($8f8c),hl
677b c5        push    bc
677c cd3321    call    $2133
677f d1        pop     de
6780 c9        ret     

6781 cd343c    call    $3c34
6784 2878      jr      z,$67fe
6786 2ad88c    ld      hl,($8cd8)
6789 119cff    ld      de,$ff9c
678c 19        add     hl,de
678d e5        push    hl
678e 2ace8c    ld      hl,($8cce)
6791 23        inc     hl
6792 22ce8c    ld      ($8cce),hl
6795 2b        dec     hl
6796 d1        pop     de
6797 eb        ex      de,hl
6798 cd5585    call    $8555
679b 280d      jr      z,$67aa
679d 210100    ld      hl,$0001
67a0 e5        push    hl
67a1 21758c    ld      hl,$8c75
67a4 e5        push    hl
67a5 cd167c    call    $7c16
67a8 d1        pop     de
67a9 d1        pop     de
67aa 60        ld      h,b
67ab 69        ld      l,c
67ac 110900    ld      de,$0009
67af cd3c85    call    $853c
67b2 2809      jr      z,$67bd
67b4 cd6a69    call    $696a
67b7 e5        push    hl
67b8 cdb56b    call    $6bb5
67bb d1        pop     de
67bc c9        ret     

67bd 60        ld      h,b
67be 69        ld      l,c
67bf 110a00    ld      de,$000a
67c2 cd3c85    call    $853c
67c5 280c      jr      z,$67d3
67c7 2a908f    ld      hl,($8f90)
67ca 23        inc     hl
67cb 22908f    ld      ($8f90),hl
67ce cd843c    call    $3c84
67d1 181e      jr      $67f1
67d3 2a8c8f    ld      hl,($8f8c)
67d6 23        inc     hl
67d7 228c8f    ld      ($8f8c),hl
67da 2b        dec     hl
67db eb        ex      de,hl
67dc 2a988f    ld      hl,($8f98)
67df cd5585    call    $8555
67e2 280d      jr      z,$67f1
67e4 2a908f    ld      hl,($8f90)
67e7 23        inc     hl
67e8 22908f    ld      ($8f90),hl
67eb 210200    ld      hl,$0002
67ee 228c8f    ld      ($8f8c),hl
67f1 60        ld      h,b
67f2 69        ld      l,c
67f3 e5        push    hl
67f4 2acb8c    ld      hl,($8ccb)
67f7 23        inc     hl
67f8 22cb8c    ld      ($8ccb),hl
67fb d1        pop     de
67fc 73        ld      (hl),e
67fd c9        ret     

67fe c5        push    bc
67ff cd2768    call    $6827
6802 d1        pop     de
6803 cd8769    call    $6987
6806 2a788f    ld      hl,($8f78)
6809 11e9ff    ld      de,$ffe9
680c cd3c85    call    $853c
680f 2813      jr      z,$6824
6811 2a788f    ld      hl,($8f78)
6814 11e9ff    ld      de,$ffe9
6817 cd3c85    call    $853c
681a 2805      jr      z,$6821
681c cd8f69    call    $698f
681f 18f0      jr      $6811
6821 cd8069    call    $6980
6824 c3e36a    jp      $6ae3
6827 cda98b    call    $8ba9
682a 210800    ld      hl,$0008
682d 39        add     hl,sp
682e 4e        ld      c,(hl)
682f 23        inc     hl
6830 46        ld      b,(hl)
6831 2a6e8e    ld      hl,($8e6e)
6834 7c        ld      a,h
6835 b5        or      l
6836 2805      jr      z,$683d
6838 c5        push    bc
6839 cd3178    call    $7831
683c d1        pop     de
683d 60        ld      h,b
683e 69        ld      l,c
683f 110a00    ld      de,$000a
6842 cd3c85    call    $853c
6845 2839      jr      z,$6880
6847 2aa68f    ld      hl,($8fa6)
684a 7c        ld      a,h
684b b5        or      l
684c 2827      jr      z,$6875
684e 2ad68c    ld      hl,($8cd6)
6851 7c        ld      a,h
6852 b5        or      l
6853 2020      jr      nz,$6875
6855 cdfe69    call    $69fe
6858 281b      jr      z,$6875
685a 2aa68f    ld      hl,($8fa6)
685d 2b        dec     hl
685e 22a68f    ld      ($8fa6),hl
6861 7c        ld      a,h
6862 b5        or      l
6863 2010      jr      nz,$6875
6865 2a788f    ld      hl,($8f78)
6868 7c        ld      a,h
6869 b5        or      l
686a 2003      jr      nz,$686f
686c cd8f69    call    $698f
686f cd8069    call    $6980
6872 cd763c    call    $3c76
6875 cd843c    call    $3c84
6878 210d00    ld      hl,$000d
687b e5        push    hl
687c cd8668    call    $6886
687f d1        pop     de
6880 c5        push    bc
6881 cd8668    call    $6886
6884 d1        pop     de
6885 c9        ret     

6886 cda98b    call    $8ba9
6889 210800    ld      hl,$0008
688c 39        add     hl,sp
688d 4e        ld      c,(hl)
688e 23        inc     hl
688f 46        ld      b,(hl)
6890 60        ld      h,b
6891 69        ld      l,c
6892 110a00    ld      de,$000a
6895 cd3c85    call    $853c
6898 2824      jr      z,$68be
689a cdef63    call    $63ef
689d 280f      jr      z,$68ae
689f 2a9a8f    ld      hl,($8f9a)
68a2 e5        push    hl
68a3 cd241f    call    $1f24
68a6 e5        push    hl
68a7 cd8677    call    $7786
68aa d1        pop     de
68ab d1        pop     de
68ac 180e      jr      $68bc
68ae 2a8c8f    ld      hl,($8f8c)
68b1 e5        push    hl
68b2 2a8e8f    ld      hl,($8f8e)
68b5 23        inc     hl
68b6 e5        push    hl
68b7 cd506c    call    $6c50
68ba d1        pop     de
68bb d1        pop     de
68bc 1868      jr      $6926
68be 60        ld      h,b
68bf 69        ld      l,c
68c0 110d00    ld      de,$000d
68c3 cd3c85    call    $853c
68c6 280f      jr      z,$68d7
68c8 210100    ld      hl,$0001
68cb e5        push    hl
68cc 2a8e8f    ld      hl,($8f8e)
68cf e5        push    hl
68d0 cd506c    call    $6c50
68d3 d1        pop     de
68d4 d1        pop     de
68d5 184f      jr      $6926
68d7 60        ld      h,b
68d8 69        ld      l,c
68d9 110800    ld      de,$0008
68dc cd3c85    call    $853c
68df 281c      jr      z,$68fd
68e1 2a8c8f    ld      hl,($8f8c)
68e4 110100    ld      de,$0001
68e7 eb        ex      de,hl
68e8 cd6d85    call    $856d
68eb 280e      jr      z,$68fb
68ed 2a8c8f    ld      hl,($8f8c)
68f0 2b        dec     hl
68f1 e5        push    hl
68f2 2a8e8f    ld      hl,($8f8e)
68f5 e5        push    hl
68f6 cd506c    call    $6c50
68f9 d1        pop     de
68fa d1        pop     de
68fb 1829      jr      $6926
68fd 60        ld      h,b
68fe 69        ld      l,c
68ff 110900    ld      de,$0009
6902 cd3c85    call    $853c
6905 280a      jr      z,$6911
6907 cd6a69    call    $696a
690a e5        push    hl
690b cdb56b    call    $6bb5
690e d1        pop     de
690f 1815      jr      $6926
6911 cde563    call    $63e5
6914 280b      jr      z,$6921
6916 212100    ld      hl,$0021
6919 e5        push    hl
691a cd2769    call    $6927
691d d1        pop     de
691e cdab66    call    $66ab
6921 c5        push    bc
6922 cd2769    call    $6927
6925 d1        pop     de
6926 c9        ret     

6927 cda98b    call    $8ba9
692a 210800    ld      hl,$0008
692d 39        add     hl,sp
692e 5e        ld      e,(hl)
692f 23        inc     hl
6930 56        ld      d,(hl)
6931 d5        push    de
6932 cd7d77    call    $777d
6935 d1        pop     de
6936 2a8c8f    ld      hl,($8f8c)
6939 23        inc     hl
693a 228c8f    ld      ($8f8c),hl
693d c9        ret     

693e cda98b    call    $8ba9
6941 210800    ld      hl,$0008
6944 39        add     hl,sp
6945 4e        ld      c,(hl)
6946 23        inc     hl
6947 46        ld      b,(hl)
6948 c5        push    bc
6949 cdad7b    call    $7bad
694c d1        pop     de
694d e5        push    hl
694e 2a988f    ld      hl,($8f98)
6951 d1        pop     de
6952 eb        ex      de,hl
6953 cd3086    call    $8630
6956 110200    ld      de,$0002
6959 eb        ex      de,hl
695a cd2285    call    $8522
695d e5        push    hl
695e cdb56b    call    $6bb5
6961 d1        pop     de
6962 c5        push    bc
6963 cd1c67    call    $671c
6966 d1        pop     de
6967 c3c066    jp      $66c0
696a 2a478c    ld      hl,($8c47)
696d 2b        dec     hl
696e e5        push    hl
696f 2a8c8f    ld      hl,($8f8c)
6972 2b        dec     hl
6973 d1        pop     de
6974 cdfc84    call    $84fc
6977 e5        push    hl
6978 2a478c    ld      hl,($8c47)
697b d1        pop     de
697c eb        ex      de,hl
697d c33086    jp      $8630
6980 210000    ld      hl,$0000
6983 22788f    ld      ($8f78),hl
6986 c9        ret     

6987 cd7a77    call    $777a
698a c8        ret     z

698b cd8f69    call    $698f
698e c9        ret     

698f cd7777    call    $7777
6992 e5        push    hl
6993 cd476a    call    $6a47
6996 d1        pop     de
6997 22788f    ld      ($8f78),hl
699a c32c6b    jp      $6b2c
699d cd876a    call    $6a87
69a0 2817      jr      z,$69b9
69a2 cdba66    call    $66ba
69a5 21ca69    ld      hl,$69ca
69a8 e5        push    hl
69a9 cd0967    call    $6709
69ac 210100    ld      hl,$0001
69af e3        ex      (sp),hl
69b0 216d8c    ld      hl,$8c6d
69b3 e5        push    hl
69b4 cd167c    call    $7c16
69b7 d1        pop     de
69b8 d1        pop     de
69b9 cd8769    call    $6987
69bc cde369    call    $69e3
69bf 2806      jr      z,$69c7
69c1 cd8069    call    $6980
69c4 c3e601    jp      $01e6
69c7 c3e36a    jp      $6ae3
69ca 4f        ld      c,a
69cb 75        ld      (hl),l
69cc 74        ld      (hl),h
69cd 206f      jr      nz,$6a3e
69cf 66        ld      h,(hl)
69d0 204c      jr      nz,$6a1e
69d2 4f        ld      c,a
69d3 47        ld      b,a
69d4 4f        ld      c,a
69d5 2073      jr      nz,$6a4a
69d7 74        ld      (hl),h
69d8 61        ld      h,c
69d9 63        ld      h,e
69da 6b        ld      l,e
69db 2073      jr      nz,$6a50
69dd 70        ld      (hl),b
69de 61        ld      h,c
69df 63        ld      h,e
69e0 65        ld      h,l
69e1 0a        ld      a,(bc)
69e2 00        nop     
69e3 cda98b    call    $8ba9
69e6 2a788f    ld      hl,($8f78)
69e9 11e6ff    ld      de,$ffe6
69ec cd3c85    call    $853c
69ef 2805      jr      z,$69f6
69f1 cdfe69    call    $69fe
69f4 2004      jr      nz,$69fa
69f6 210000    ld      hl,$0000
69f9 c9        ret     

69fa 210100    ld      hl,$0001
69fd c9        ret     

69fe cda98b    call    $8ba9
6a01 2aa28f    ld      hl,($8fa2)
6a04 7c        ld      a,h
6a05 b5        or      l
6a06 2013      jr      nz,$6a1b
6a08 2a0890    ld      hl,($9008)
6a0b 7c        ld      a,h
6a0c b5        or      l
6a0d 200c      jr      nz,$6a1b
6a0f 2ad48c    ld      hl,($8cd4)
6a12 7c        ld      a,h
6a13 b5        or      l
6a14 2005      jr      nz,$6a1b
6a16 210000    ld      hl,$0000
6a19 1803      jr      $6a1e
6a1b 210100    ld      hl,$0001
6a1e c3f685    jp      $85f6
6a21 2a788f    ld      hl,($8f78)
6a24 7c        ld      a,h
6a25 b5        or      l
6a26 2003      jr      nz,$6a2b
6a28 cd8f69    call    $698f
6a2b cde36a    call    $6ae3
6a2e 2802      jr      z,$6a32
6a30 18ef      jr      $6a21
6a32 cde369    call    $69e3
6a35 c8        ret     z

6a36 cd8069    call    $6980
6a39 210100    ld      hl,$0001
6a3c e5        push    hl
6a3d 21798c    ld      hl,$8c79
6a40 e5        push    hl
6a41 cd167c    call    $7c16
6a44 d1        pop     de
6a45 d1        pop     de
6a46 c9        ret     

6a47 cda98b    call    $8ba9
6a4a 21ffff    ld      hl,$ffff
6a4d 223391    ld      ($9133),hl
6a50 21bd8b    ld      hl,$8bbd
6a53 44        ld      b,h
6a54 4d        ld      c,l
6a55 1807      jr      $6a5e
6a57 2a3391    ld      hl,($9133)
6a5a 2b        dec     hl
6a5b 223391    ld      ($9133),hl
6a5e 60        ld      h,b
6a5f 69        ld      l,c
6a60 7e        ld      a,(hl)
6a61 b7        or      a
6a62 281a      jr      z,$6a7e
6a64 60        ld      h,b
6a65 69        ld      l,c
6a66 03        inc     bc
6a67 5e        ld      e,(hl)
6a68 1600      ld      d,$00
6a6a d5        push    de
6a6b 210a00    ld      hl,$000a
6a6e 39        add     hl,sp
6a6f 5e        ld      e,(hl)
6a70 23        inc     hl
6a71 56        ld      d,(hl)
6a72 e1        pop     hl
6a73 cd3c85    call    $853c
6a76 2804      jr      z,$6a7c
6a78 2a3391    ld      hl,($9133)
6a7b c9        ret     

6a7c 18d9      jr      $6a57
6a7e 210800    ld      hl,$0008
6a81 39        add     hl,sp
6a82 5e        ld      e,(hl)
6a83 23        inc     hl
6a84 56        ld      d,(hl)
6a85 eb        ex      de,hl
6a86 c9        ret     

6a87 cda98b    call    $8ba9
6a8a 2af88f    ld      hl,($8ff8)
6a8d 7c        ld      a,h
6a8e b5        or      l
6a8f 200c      jr      nz,$6a9d
6a91 2afa8f    ld      hl,($8ffa)
6a94 7c        ld      a,h
6a95 b5        or      l
6a96 2005      jr      nz,$6a9d
6a98 2a978c    ld      hl,($8c97)
6a9b 1828      jr      $6ac5
6a9d 2af88f    ld      hl,($8ff8)
6aa0 110200    ld      de,$0002
6aa3 cd3c85    call    $853c
6aa6 200b      jr      nz,$6ab3
6aa8 2afa8f    ld      hl,($8ffa)
6aab 110200    ld      de,$0002
6aae cd3c85    call    $853c
6ab1 280a      jr      z,$6abd
6ab3 2a2e90    ld      hl,($902e)
6ab6 eb        ex      de,hl
6ab7 2a0490    ld      hl,($9004)
6aba 19        add     hl,de
6abb 1808      jr      $6ac5
6abd 2a2e90    ld      hl,($902e)
6ac0 eb        ex      de,hl
6ac1 2ad88c    ld      hl,($8cd8)
6ac4 19        add     hl,de
6ac5 44        ld      b,h
6ac6 4d        ld      c,l
6ac7 2188fd    ld      hl,$fd88
6aca 39        add     hl,sp
6acb 50        ld      d,b
6acc 59        ld      e,c
6acd eb        ex      de,hl
6ace cd6686    call    $8666
6ad1 2806      jr      z,$6ad9
6ad3 210f00    ld      hl,$000f
6ad6 22a38c    ld      ($8ca3),hl
6ad9 2164ff    ld      hl,$ff64
6adc 39        add     hl,sp
6add 50        ld      d,b
6ade 59        ld      e,c
6adf eb        ex      de,hl
6ae0 c36686    jp      $8666
6ae3 cda98b    call    $8ba9
6ae6 2ad48c    ld      hl,($8cd4)
6ae9 7c        ld      a,h
6aea b5        or      l
6aeb 2804      jr      z,$6af1
6aed 210000    ld      hl,$0000
6af0 c9        ret     

6af1 2a788f    ld      hl,($8f78)
6af4 11ecff    ld      de,$ffec
6af7 cd3c85    call    $853c
6afa 2805      jr      z,$6b01
6afc cd011f    call    $1f01
6aff 1824      jr      $6b25
6b01 2a788f    ld      hl,($8f78)
6b04 11f4ff    ld      de,$fff4
6b07 cd3c85    call    $853c
6b0a 2805      jr      z,$6b11
6b0c cd111f    call    $1f11
6b0f 1814      jr      $6b25
6b11 2a788f    ld      hl,($8f78)
6b14 11edff    ld      de,$ffed
6b17 cd3c85    call    $853c
6b1a 2805      jr      z,$6b21
6b1c cde21e    call    $1ee2
6b1f 1804      jr      $6b25
6b21 210000    ld      hl,$0000
6b24 c9        ret     

6b25 cd8069    call    $6980
6b28 210100    ld      hl,$0001
6b2b c9        ret     

6b2c 2a788f    ld      hl,($8f78)
6b2f 11f9ff    ld      de,$fff9
6b32 cd3c85    call    $853c
6b35 c8        ret     z

6b36 cd8069    call    $6980
6b39 2a6e8e    ld      hl,($8e6e)
6b3c 7c        ld      a,h
6b3d b5        or      l
6b3e 280b      jr      z,$6b4b
6b40 cd9e77    call    $779e
6b43 2006      jr      nz,$6b4b
6b45 210000    ld      hl,$0000
6b48 226e8e    ld      ($8e6e),hl
6b4b 2ad48c    ld      hl,($8cd4)
6b4e 7c        ld      a,h
6b4f b5        or      l
6b50 2818      jr      z,$6b6a
6b52 2a908f    ld      hl,($8f90)
6b55 22b98c    ld      ($8cb9),hl
6b58 2a8c8f    ld      hl,($8f8c)
6b5b 22bd8c    ld      ($8cbd),hl
6b5e cd925e    call    $5e92
6b61 2ac38c    ld      hl,($8cc3)
6b64 22cb8c    ld      ($8ccb),hl
6b67 cd525c    call    $5c52
6b6a cd455c    call    $5c45
6b6d cd3d3c    call    $3c3d
6b70 21ac6b    ld      hl,$6bac
6b73 e5        push    hl
6b74 cde06b    call    $6be0
6b77 d1        pop     de
6b78 cd3141    call    $4131
6b7b 2021      jr      nz,$6b9e
6b7d cd8d41    call    $418d
6b80 eb        ex      de,hl
6b81 2ac28f    ld      hl,($8fc2)
6b84 cd3c85    call    $853c
6b87 2810      jr      z,$6b99
6b89 cdaf43    call    $43af
6b8c 210000    ld      hl,$0000
6b8f e5        push    hl
6b90 21698c    ld      hl,$8c69
6b93 e5        push    hl
6b94 cd167c    call    $7c16
6b97 d1        pop     de
6b98 d1        pop     de
6b99 cd3741    call    $4137
6b9c 18da      jr      $6b78
6b9e 210100    ld      hl,$0001
6ba1 e5        push    hl
6ba2 216d8c    ld      hl,$8c6d
6ba5 e5        push    hl
6ba6 cd167c    call    $7c16
6ba9 d1        pop     de
6baa d1        pop     de
6bab c9        ret     

6bac 53        ld      d,e
6bad 74        ld      (hl),h
6bae 6f        ld      l,a
6baf 70        ld      (hl),b
6bb0 70        ld      (hl),b
6bb1 65        ld      h,l
6bb2 64        ld      h,h
6bb3 2100cd    ld      hl,$cd00
6bb6 a9        xor     c
6bb7 8b        adc     a,e
6bb8 210800    ld      hl,$0008
6bbb 39        add     hl,sp
6bbc e5        push    hl
6bbd 7e        ld      a,(hl)
6bbe 23        inc     hl
6bbf 66        ld      h,(hl)
6bc0 6f        ld      l,a
6bc1 2b        dec     hl
6bc2 eb        ex      de,hl
6bc3 e1        pop     hl
6bc4 73        ld      (hl),e
6bc5 23        inc     hl
6bc6 72        ld      (hl),d
6bc7 eb        ex      de,hl
6bc8 23        inc     hl
6bc9 110000    ld      de,$0000
6bcc eb        ex      de,hl
6bcd cd6d85    call    $856d
6bd0 c8        ret     z

6bd1 cdd76b    call    $6bd7
6bd4 18e2      jr      $6bb8
6bd6 c9        ret     

6bd7 212000    ld      hl,$0020
6bda e5        push    hl
6bdb cdc966    call    $66c9
6bde d1        pop     de
6bdf c9        ret     

6be0 cda98b    call    $8ba9
6be3 cdab66    call    $66ab
6be6 210800    ld      hl,$0008
6be9 39        add     hl,sp
6bea 5e        ld      e,(hl)
6beb 23        inc     hl
6bec 56        ld      d,(hl)
6bed d5        push    de
6bee cd0967    call    $6709
6bf1 d1        pop     de
6bf2 cde043    call    $43e0
6bf5 44        ld      b,h
6bf6 4d        ld      c,l
6bf7 7c        ld      a,h
6bf8 b5        or      l
6bf9 283a      jr      z,$6c35
6bfb 21386c    ld      hl,$6c38
6bfe e5        push    hl
6bff cd0967    call    $6709
6c02 d1        pop     de
6c03 c5        push    bc
6c04 cd3936    call    $3639
6c07 213d6c    ld      hl,$6c3d
6c0a e3        ex      (sp),hl
6c0b cd0967    call    $6709
6c0e d1        pop     de
6c0f 2aee8f    ld      hl,($8fee)
6c12 7c        ld      a,h
6c13 b5        or      l
6c14 280d      jr      z,$6c23
6c16 2aee8f    ld      hl,($8fee)
6c19 cdf886    call    $86f8
6c1c e5        push    hl
6c1d cd3936    call    $3639
6c20 d1        pop     de
6c21 1812      jr      $6c35
6c23 2aec8f    ld      hl,($8fec)
6c26 7c        ld      a,h
6c27 b5        or      l
6c28 280b      jr      z,$6c35
6c2a 2aec8f    ld      hl,($8fec)
6c2d cdf886    call    $86f8
6c30 e5        push    hl
6c31 cd3936    call    $3639
6c34 d1        pop     de
6c35 c3ab66    jp      $66ab
6c38 2069      jr      nz,$6ca3
6c3a 6e        ld      l,(hl)
6c3b 2000      jr      nz,$6c3d
6c3d 3a2000    ld      a,($0020)
6c40 2a9a8f    ld      hl,($8f9a)
6c43 e5        push    hl
6c44 cd241f    call    $1f24
6c47 e5        push    hl
6c48 cd8077    call    $7780
6c4b d1        pop     de
6c4c d1        pop     de
6c4d c3716c    jp      $6c71
6c50 cda98b    call    $8ba9
6c53 210800    ld      hl,$0008
6c56 39        add     hl,sp
6c57 5e        ld      e,(hl)
6c58 23        inc     hl
6c59 56        ld      d,(hl)
6c5a eb        ex      de,hl
6c5b 228e8f    ld      ($8f8e),hl
6c5e e5        push    hl
6c5f 210c00    ld      hl,$000c
6c62 39        add     hl,sp
6c63 5e        ld      e,(hl)
6c64 23        inc     hl
6c65 56        ld      d,(hl)
6c66 eb        ex      de,hl
6c67 228c8f    ld      ($8f8c),hl
6c6a e5        push    hl
6c6b cd8377    call    $7783
6c6e d1        pop     de
6c6f d1        pop     de
6c70 c9        ret     

6c71 210100    ld      hl,$0001
6c74 e5        push    hl
6c75 cd241f    call    $1f24
6c78 e5        push    hl
6c79 cd506c    call    $6c50
6c7c d1        pop     de
6c7d d1        pop     de
6c7e c9        ret     

6c7f c5        push    bc
6c80 210400    ld      hl,$0004
6c83 39        add     hl,sp
6c84 4e        ld      c,(hl)
6c85 23        inc     hl
6c86 23        inc     hl
6c87 7e        ld      a,(hl)
6c88 ed79      out     (c),a
6c8a c1        pop     bc
6c8b c9        ret     

6c8c c5        push    bc
6c8d 210400    ld      hl,$0004
6c90 39        add     hl,sp
6c91 4e        ld      c,(hl)
6c92 ed68      in      l,(c)
6c94 2600      ld      h,$00
6c96 c1        pop     bc
6c97 c9        ret     

6c98 210000    ld      hl,$0000
6c9b 228191    ld      ($9181),hl
6c9e 227d91    ld      ($917d),hl
6ca1 2a518c    ld      hl,($8c51)
6ca4 2b        dec     hl
6ca5 227f91    ld      ($917f),hl
6ca8 2a518c    ld      hl,($8c51)
6cab 228591    ld      ($9185),hl
6cae cdec85    call    $85ec
6cb1 228791    ld      ($9187),hl
6cb4 2a518c    ld      hl,($8c51)
6cb7 110100    ld      de,$0001
6cba eb        ex      de,hl
6cbb cd0686    call    $8606
6cbe 228d91    ld      ($918d),hl
6cc1 2a538c    ld      hl,($8c53)
6cc4 229591    ld      ($9195),hl
6cc7 2b        dec     hl
6cc8 110100    ld      de,$0001
6ccb eb        ex      de,hl
6ccc cd0686    call    $8606
6ccf 228f91    ld      ($918f),hl
6cd2 c36b77    jp      $776b
6cd5 cd5d6d    call    $6d5d
6cd8 110100    ld      de,$0001
6cdb cd3c85    call    $853c
6cde 2805      jr      z,$6ce5
6ce0 cd736d    call    $6d73
6ce3 1803      jr      $6ce8
6ce5 210000    ld      hl,$0000
6ce8 e5        push    hl
6ce9 cd7477    call    $7774
6cec d1        pop     de
6ced 2a598c    ld      hl,($8c59)
6cf0 7c        ld      a,h
6cf1 b5        or      l
6cf2 2029      jr      nz,$6d1d
6cf4 cdd671    call    $71d6
6cf7 cd5d6d    call    $6d5d
6cfa 110100    ld      de,$0001
6cfd cd3c85    call    $853c
6d00 2815      jr      z,$6d17
6d02 2a538c    ld      hl,($8c53)
6d05 eb        ex      de,hl
6d06 2a3d8c    ld      hl,($8c3d)
6d09 cd2285    call    $8522
6d0c e5        push    hl
6d0d cd736d    call    $6d73
6d10 2b        dec     hl
6d11 d1        pop     de
6d12 cdd485    call    $85d4
6d15 1803      jr      $6d1a
6d17 2a538c    ld      hl,($8c53)
6d1a 229591    ld      ($9195),hl
6d1d 2a9591    ld      hl,($9195)
6d20 2b        dec     hl
6d21 228391    ld      ($9183),hl
6d24 2a9591    ld      hl,($9195)
6d27 228991    ld      ($9189),hl
6d2a cdec85    call    $85ec
6d2d 228b91    ld      ($918b),hl
6d30 2a598c    ld      hl,($8c59)
6d33 7c        ld      a,h
6d34 b5        or      l
6d35 c0        ret     nz

6d36 cd5c76    call    $765c
6d39 2803      jr      z,$6d3e
6d3b cd9c70    call    $709c
6d3e cdd671    call    $71d6
6d41 c9        ret     

6d42 210000    ld      hl,$0000
6d45 227b91    ld      ($917b),hl
6d48 c3d56c    jp      $6cd5
6d4b 210100    ld      hl,$0001
6d4e 227b91    ld      ($917b),hl
6d51 c3d56c    jp      $6cd5
6d54 210200    ld      hl,$0002
6d57 227b91    ld      ($917b),hl
6d5a c37177    jp      $7771
6d5d cda98b    call    $8ba9
6d60 2a7b91    ld      hl,($917b)
6d63 c9        ret     

6d64 cda98b    call    $8ba9
6d67 210800    ld      hl,$0008
6d6a 39        add     hl,sp
6d6b 5e        ld      e,(hl)
6d6c 23        inc     hl
6d6d 56        ld      d,(hl)
6d6e eb        ex      de,hl
6d6f 227991    ld      ($9179),hl
6d72 c9        ret     

6d73 cda98b    call    $8ba9
6d76 2a7991    ld      hl,($9179)
6d79 c9        ret     

6d7a cda98b    call    $8ba9
6d7d 2a7791    ld      hl,($9177)
6d80 c9        ret     

6d81 cda98b    call    $8ba9
6d84 cdd671    call    $71d6
6d87 210800    ld      hl,$0008
6d8a 39        add     hl,sp
6d8b 5e        ld      e,(hl)
6d8c 23        inc     hl
6d8d 56        ld      d,(hl)
6d8e eb        ex      de,hl
6d8f 227791    ld      ($9177),hl
6d92 e5        push    hl
6d93 cd8f77    call    $778f
6d96 d1        pop     de
6d97 c3d671    jp      $71d6
6d9a 210100    ld      hl,$0001
6d9d 7d        ld      a,l
6d9e 327491    ld      ($9174),a
6da1 cdfe6d    call    $6dfe
6da4 7d        ld      a,l
6da5 327391    ld      ($9173),a
6da8 c9        ret     

6da9 210000    ld      hl,$0000
6dac 7d        ld      a,l
6dad 327491    ld      ($9174),a
6db0 c9        ret     

6db1 210300    ld      hl,$0003
6db4 7d        ld      a,l
6db5 327491    ld      ($9174),a
6db8 cd7a6d    call    $6d7a
6dbb 7d        ld      a,l
6dbc 327391    ld      ($9173),a
6dbf c9        ret     

6dc0 210200    ld      hl,$0002
6dc3 7d        ld      a,l
6dc4 327491    ld      ($9174),a
6dc7 cdfe6d    call    $6dfe
6dca 7d        ld      a,l
6dcb 327391    ld      ($9173),a
6dce c9        ret     

6dcf cda98b    call    $8ba9
6dd2 2a7491    ld      hl,($9174)
6dd5 2600      ld      h,$00
6dd7 c9        ret     

6dd8 cda98b    call    $8ba9
6ddb cdd671    call    $71d6
6dde 210800    ld      hl,$0008
6de1 39        add     hl,sp
6de2 5e        ld      e,(hl)
6de3 23        inc     hl
6de4 56        ld      d,(hl)
6de5 eb        ex      de,hl
6de6 227591    ld      ($9175),hl
6de9 cdd671    call    $71d6
6dec cdcf6d    call    $6dcf
6def 110300    ld      de,$0003
6df2 cd3c85    call    $853c
6df5 c0        ret     nz

6df6 2a7591    ld      hl,($9175)
6df9 7d        ld      a,l
6dfa 327391    ld      ($9173),a
6dfd c9        ret     

6dfe cda98b    call    $8ba9
6e01 2a7591    ld      hl,($9175)
6e04 c9        ret     

6e05 cda98b    call    $8ba9
6e08 214d91    ld      hl,$914d
6e0b cd667c    call    $7c66
6e0e cda77c    call    $7ca7
6e11 cd7b8a    call    $8a7b
6e14 cda08b    call    $8ba0
6e17 216b91    ld      hl,$916b
6e1a cd587c    call    $7c58
6e1d cd417f    call    $7f41
6e20 210800    ld      hl,$0008
6e23 39        add     hl,sp
6e24 cd587c    call    $7c58
6e27 cd417f    call    $7f41
6e2a 215f91    ld      hl,$915f
6e2d cd587c    call    $7c58
6e30 cd6c7d    call    $7d6c
6e33 cda77c    call    $7ca7
6e36 214d91    ld      hl,$914d
6e39 cd667c    call    $7c66
6e3c cda77c    call    $7ca7
6e3f cd988a    call    $8a98
6e42 cda08b    call    $8ba0
6e45 211000    ld      hl,$0010
6e48 39        add     hl,sp
6e49 cd587c    call    $7c58
6e4c cd417f    call    $7f41
6e4f 215791    ld      hl,$9157
6e52 cd587c    call    $7c58
6e55 cd6c7d    call    $7d6c
6e58 cda77c    call    $7ca7
6e5b cdf072    call    $72f0
6e5e eb        ex      de,hl
6e5f 211000    ld      hl,$0010
6e62 39        add     hl,sp
6e63 f9        ld      sp,hl
6e64 c9        ret     

6e65 cda98b    call    $8ba9
6e68 216b91    ld      hl,$916b
6e6b cd667c    call    $7c66
6e6e 211000    ld      hl,$0010
6e71 39        add     hl,sp
6e72 cd587c    call    $7c58
6e75 cd417f    call    $7f41
6e78 cda77c    call    $7ca7
6e7b 211000    ld      hl,$0010
6e7e 39        add     hl,sp
6e7f cd667c    call    $7c66
6e82 cda77c    call    $7ca7
6e85 cdf072    call    $72f0
6e88 eb        ex      de,hl
6e89 211000    ld      hl,$0010
6e8c 39        add     hl,sp
6e8d f9        ld      sp,hl
6e8e c9        ret     

6e8f cda98b    call    $8ba9
6e92 214d91    ld      hl,$914d
6e95 cd667c    call    $7c66
6e98 210800    ld      hl,$0008
6e9b 39        add     hl,sp
6e9c cd587c    call    $7c58
6e9f cd6c7d    call    $7d6c
6ea2 cda77c    call    $7ca7
6ea5 cdad6e    call    $6ead
6ea8 eb        ex      de,hl
6ea9 cda08b    call    $8ba0
6eac c9        ret     

6ead cda98b    call    $8ba9
6eb0 cdd671    call    $71d6
6eb3 214d91    ld      hl,$914d
6eb6 e5        push    hl
6eb7 210a00    ld      hl,$000a
6eba 39        add     hl,sp
6ebb cd667c    call    $7c66
6ebe cda77c    call    $7ca7
6ec1 cda276    call    $76a2
6ec4 cda08b    call    $8ba0
6ec7 e1        pop     hl
6ec8 cd857c    call    $7c85
6ecb cde681    call    $81e6
6ece 225591    ld      ($9155),hl
6ed1 c3d671    jp      $71d6
6ed4 214d91    ld      hl,$914d
6ed7 c3667c    jp      $7c66
6eda 2a8391    ld      hl,($9183)
6edd e5        push    hl
6ede 2a7791    ld      hl,($9177)
6ee1 e5        push    hl
6ee2 cd9277    call    $7792
6ee5 d1        pop     de
6ee6 d1        pop     de
6ee7 c3d671    jp      $71d6
6eea cda98b    call    $8ba9
6eed 211000    ld      hl,$0010
6ef0 39        add     hl,sp
6ef1 cd667c    call    $7c66
6ef4 216b91    ld      hl,$916b
6ef7 cd587c    call    $7c58
6efa cd417f    call    $7f41
6efd cda77c    call    $7ca7
6f00 cd7271    call    $7172
6f03 eb        ex      de,hl
6f04 cda08b    call    $8ba0
6f07 d5        push    de
6f08 2a8f91    ld      hl,($918f)
6f0b d1        pop     de
6f0c eb        ex      de,hl
6f0d cd3086    call    $8630
6f10 229391    ld      ($9193),hl
6f13 e5        push    hl
6f14 210a00    ld      hl,$000a
6f17 39        add     hl,sp
6f18 cd667c    call    $7c66
6f1b cda77c    call    $7ca7
6f1e cd7271    call    $7172
6f21 eb        ex      de,hl
6f22 cda08b    call    $8ba0
6f25 2a8d91    ld      hl,($918d)
6f28 19        add     hl,de
6f29 229191    ld      ($9191),hl
6f2c e5        push    hl
6f2d cd7976    call    $7679
6f30 d1        pop     de
6f31 d1        pop     de
6f32 cd5c76    call    $765c
6f35 2842      jr      z,$6f79
6f37 2a518c    ld      hl,($8c51)
6f3a ed5b9191  ld      de,($9191)
6f3e cd8285    call    $8582
6f41 229191    ld      ($9191),hl
6f44 110000    ld      de,$0000
6f47 eb        ex      de,hl
6f48 cd6c85    call    $856c
6f4b 280b      jr      z,$6f58
6f4d 2a518c    ld      hl,($8c51)
6f50 eb        ex      de,hl
6f51 2a9191    ld      hl,($9191)
6f54 19        add     hl,de
6f55 229191    ld      ($9191),hl
6f58 2a9591    ld      hl,($9195)
6f5b ed5b9391  ld      de,($9193)
6f5f cd8285    call    $8582
6f62 229391    ld      ($9193),hl
6f65 110000    ld      de,$0000
6f68 eb        ex      de,hl
6f69 cd6c85    call    $856c
6f6c 280b      jr      z,$6f79
6f6e 2a9591    ld      hl,($9195)
6f71 eb        ex      de,hl
6f72 2a9391    ld      hl,($9193)
6f75 19        add     hl,de
6f76 229391    ld      ($9193),hl
6f79 c9        ret     

6f7a cda98b    call    $8ba9
6f7d 211000    ld      hl,$0010
6f80 39        add     hl,sp
6f81 cd667c    call    $7c66
6f84 cda77c    call    $7ca7
6f87 211000    ld      hl,$0010
6f8a 39        add     hl,sp
6f8b cd667c    call    $7c66
6f8e cda77c    call    $7ca7
6f91 cdea6e    call    $6eea
6f94 eb        ex      de,hl
6f95 211000    ld      hl,$0010
6f98 39        add     hl,sp
6f99 f9        ld      sp,hl
6f9a 2a7391    ld      hl,($9173)
6f9d e5        push    hl
6f9e 2a9391    ld      hl,($9193)
6fa1 e5        push    hl
6fa2 2a9191    ld      hl,($9191)
6fa5 e5        push    hl
6fa6 cd3777    call    $7737
6fa9 d1        pop     de
6faa d1        pop     de
6fab d1        pop     de
6fac c9        ret     

6fad cda98b    call    $8ba9
6fb0 211000    ld      hl,$0010
6fb3 39        add     hl,sp
6fb4 cd667c    call    $7c66
6fb7 cda77c    call    $7ca7
6fba 211000    ld      hl,$0010
6fbd 39        add     hl,sp
6fbe cd667c    call    $7c66
6fc1 cda77c    call    $7ca7
6fc4 cdea6e    call    $6eea
6fc7 eb        ex      de,hl
6fc8 211000    ld      hl,$0010
6fcb 39        add     hl,sp
6fcc f9        ld      sp,hl
6fcd 2a9391    ld      hl,($9193)
6fd0 e5        push    hl
6fd1 2a9191    ld      hl,($9191)
6fd4 e5        push    hl
6fd5 cd4777    call    $7747
6fd8 d1        pop     de
6fd9 d1        pop     de
6fda c9        ret     

6fdb 215791    ld      hl,$9157
6fde c3667c    jp      $7c66
6fe1 215f91    ld      hl,$915f
6fe4 cd667c    call    $7c66
6fe7 216b91    ld      hl,$916b
6fea cd587c    call    $7c58
6fed c3417e    jp      $7e41
6ff0 cda98b    call    $8ba9
6ff3 215791    ld      hl,$9157
6ff6 cd667c    call    $7c66
6ff9 cda77c    call    $7ca7
6ffc cd3871    call    $7138
6fff eb        ex      de,hl
7000 cda08b    call    $8ba0
7003 2a8d91    ld      hl,($918d)
7006 19        add     hl,de
7007 c9        ret     

7008 cda98b    call    $8ba9
700b 215f91    ld      hl,$915f
700e cd667c    call    $7c66
7011 cda77c    call    $7ca7
7014 cd3871    call    $7138
7017 eb        ex      de,hl
7018 cda08b    call    $8ba0
701b d5        push    de
701c 2a8f91    ld      hl,($918f)
701f d1        pop     de
7020 eb        ex      de,hl
7021 c33086    jp      $8630
7024 cd4070    call    $7040
7027 c8        ret     z

7028 cdd671    call    $71d6
702b 210000    ld      hl,$0000
702e 226791    ld      ($9167),hl
7031 c9        ret     

7032 cd4070    call    $7040
7035 c0        ret     nz

7036 210100    ld      hl,$0001
7039 226791    ld      ($9167),hl
703c cdd671    call    $71d6
703f c9        ret     

7040 cda98b    call    $8ba9
7043 2a6791    ld      hl,($9167)
7046 c9        ret     

7047 210000    ld      hl,$0000
704a 226991    ld      ($9169),hl
704d c9        ret     

704e cdd671    call    $71d6
7051 210100    ld      hl,$0001
7054 226991    ld      ($9169),hl
7057 2a9591    ld      hl,($9195)
705a 7c        ld      a,h
705b b5        or      l
705c 2803      jr      z,$7061
705e cd9c70    call    $709c
7061 c3d671    jp      $71d6
7064 cd0870    call    $7008
7067 e5        push    hl
7068 cdf06f    call    $6ff0
706b e5        push    hl
706c cd0d77    call    $770d
706f d1        pop     de
7070 d1        pop     de
7071 2803      jr      z,$7076
7073 cdc253    call    $53c2
7076 210200    ld      hl,$0002
7079 226991    ld      ($9169),hl
707c c9        ret     

707d cda98b    call    $8ba9
7080 2a6991    ld      hl,($9169)
7083 c9        ret     

7084 cda98b    call    $8ba9
7087 216b91    ld      hl,$916b
708a e5        push    hl
708b 210a00    ld      hl,$000a
708e 39        add     hl,sp
708f cd667c    call    $7c66
7092 e1        pop     hl
7093 c3857c    jp      $7c85
7096 216b91    ld      hl,$916b
7099 c3667c    jp      $7c66
709c cdf06f    call    $6ff0
709f 110000    ld      de,$0000
70a2 eb        ex      de,hl
70a3 cd6c85    call    $856c
70a6 281b      jr      z,$70c3
70a8 215791    ld      hl,$9157
70ab e5        push    hl
70ac 2a518c    ld      hl,($8c51)
70af cd2880    call    $8028
70b2 cd037d    call    $7d03
70b5 e1        pop     hl
70b6 e5        push    hl
70b7 cd667c    call    $7c66
70ba cd6c7d    call    $7d6c
70bd e1        pop     hl
70be cd857c    call    $7c85
70c1 18d9      jr      $709c
70c3 cdf06f    call    $6ff0
70c6 eb        ex      de,hl
70c7 2a518c    ld      hl,($8c51)
70ca cd5585    call    $8555
70cd 281b      jr      z,$70ea
70cf 215791    ld      hl,$9157
70d2 e5        push    hl
70d3 2a518c    ld      hl,($8c51)
70d6 cd2880    call    $8028
70d9 cd037d    call    $7d03
70dc e1        pop     hl
70dd e5        push    hl
70de cd667c    call    $7c66
70e1 cd657d    call    $7d65
70e4 e1        pop     hl
70e5 cd857c    call    $7c85
70e8 18d9      jr      $70c3
70ea cd0870    call    $7008
70ed 110000    ld      de,$0000
70f0 eb        ex      de,hl
70f1 cd6c85    call    $856c
70f4 281b      jr      z,$7111
70f6 215f91    ld      hl,$915f
70f9 e5        push    hl
70fa 2a9591    ld      hl,($9195)
70fd cd2880    call    $8028
7100 cd037d    call    $7d03
7103 e1        pop     hl
7104 e5        push    hl
7105 cd667c    call    $7c66
7108 cd657d    call    $7d65
710b e1        pop     hl
710c cd857c    call    $7c85
710f 18d9      jr      $70ea
7111 cd0870    call    $7008
7114 eb        ex      de,hl
7115 2a9591    ld      hl,($9195)
7118 cd5585    call    $8555
711b c8        ret     z

711c 215f91    ld      hl,$915f
711f e5        push    hl
7120 2a9591    ld      hl,($9195)
7123 cd2880    call    $8028
7126 cd037d    call    $7d03
7129 e1        pop     hl
712a e5        push    hl
712b cd667c    call    $7c66
712e cd6c7d    call    $7d6c
7131 e1        pop     hl
7132 cd857c    call    $7c85
7135 18da      jr      $7111
7137 c9        ret     

7138 cda98b    call    $8ba9
713b 210800    ld      hl,$0008
713e 39        add     hl,sp
713f cd667c    call    $7c66
7142 213591    ld      hl,$9135
7145 cd587c    call    $7c58
7148 cd0780    call    $8007
714b 280d      jr      z,$715a
714d cd5f7c    call    $7c5f
7150 40        ld      b,b
7151 80        add     a,b
7152 00        nop     
7153 00        nop     
7154 00        nop     
7155 00        nop     
7156 00        nop     
7157 00        nop     
7158 180b      jr      $7165
715a cd5f7c    call    $7c5f
715d c0        ret     nz

715e 7f        ld      a,a
715f ff        rst     $38
7160 ff        rst     $38
7161 ff        rst     $38
7162 ff        rst     $38
7163 ff        rst     $38
7164 b8        cp      b
7165 210800    ld      hl,$0008
7168 39        add     hl,sp
7169 cd587c    call    $7c58
716c cd6c7d    call    $7d6c
716f c3e681    jp      $81e6
7172 cda98b    call    $8ba9
7175 210800    ld      hl,$0008
7178 39        add     hl,sp
7179 cd667c    call    $7c66
717c cda77c    call    $7ca7
717f cd3871    call    $7138
7182 eb        ex      de,hl
7183 cda08b    call    $8ba0
7186 42        ld      b,d
7187 4b        ld      c,e
7188 2180c1    ld      hl,$c180
718b cd5585    call    $8555
718e 280d      jr      z,$719d
7190 50        ld      d,b
7191 59        ld      e,c
7192 21803e    ld      hl,$3e80
7195 cd5685    call    $8556
7198 2803      jr      z,$719d
719a 60        ld      h,b
719b 69        ld      l,c
719c c9        ret     

719d c3c253    jp      $53c2
71a0 cda98b    call    $8ba9
71a3 210800    ld      hl,$0008
71a6 39        add     hl,sp
71a7 4e        ld      c,(hl)
71a8 23        inc     hl
71a9 46        ld      b,(hl)
71aa 60        ld      h,b
71ab 69        ld      l,c
71ac 118000    ld      de,$0080
71af cdfc84    call    $84fc
71b2 280a      jr      z,$71be
71b4 2100ff    ld      hl,$ff00
71b7 50        ld      d,b
71b8 59        ld      e,c
71b9 cdfe85    call    $85fe
71bc 44        ld      b,h
71bd 4d        ld      c,l
71be 210a00    ld      hl,$000a
71c1 39        add     hl,sp
71c2 5e        ld      e,(hl)
71c3 23        inc     hl
71c4 56        ld      d,(hl)
71c5 210200    ld      hl,$0002
71c8 cdfc84    call    $84fc
71cb 2806      jr      z,$71d3
71cd 60        ld      h,b
71ce 69        ld      l,c
71cf cdec85    call    $85ec
71d2 c9        ret     

71d3 60        ld      h,b
71d4 69        ld      l,c
71d5 c9        ret     

71d6 cda98b    call    $8ba9
71d9 cd4070    call    $7040
71dc c8        ret     z

71dd cdfe6d    call    $6dfe
71e0 7d        ld      a,l
71e1 32bb91    ld      ($91bb),a
71e4 2a5591    ld      hl,($9155)
71e7 23        inc     hl
71e8 23        inc     hl
71e9 23        inc     hl
71ea 110600    ld      de,$0006
71ed eb        ex      de,hl
71ee cd2285    call    $8522
71f1 110f00    ld      de,$000f
71f4 eb        ex      de,hl
71f5 cd8285    call    $8582
71f8 22b991    ld      ($91b9),hl
71fb 2a5591    ld      hl,($9155)
71fe 23        inc     hl
71ff 23        inc     hl
7200 23        inc     hl
7201 115a00    ld      de,$005a
7204 eb        ex      de,hl
7205 cd2285    call    $8522
7208 22b791    ld      ($91b7),hl
720b 110100    ld      de,$0001
720e cdfc84    call    $84fc
7211 280c      jr      z,$721f
7213 2ab991    ld      hl,($91b9)
7216 110f00    ld      de,$000f
7219 cd3086    call    $8630
721c 22b991    ld      ($91b9),hl
721f 2ab991    ld      hl,($91b9)
7222 110600    ld      de,$0006
7225 cdd485    call    $85d4
7228 11d88b    ld      de,$8bd8
722b 19        add     hl,de
722c 22b591    ld      ($91b5),hl
722f cdf06f    call    $6ff0
7232 22a591    ld      ($91a5),hl
7235 cd0870    call    $7008
7238 22a791    ld      ($91a7),hl
723b 21a991    ld      hl,$91a9
723e 44        ld      b,h
723f 4d        ld      c,l
7240 1808      jr      $724a
7242 210400    ld      hl,$0004
7245 50        ld      d,b
7246 59        ld      e,c
7247 19        add     hl,de
7248 44        ld      b,h
7249 4d        ld      c,l
724a 50        ld      d,b
724b 59        ld      e,c
724c 21b591    ld      hl,$91b5
724f cd6686    call    $8666
7252 287b      jr      z,$72cf
7254 21fcff    ld      hl,$fffc
7257 09        add     hl,bc
7258 5e        ld      e,(hl)
7259 23        inc     hl
725a 56        ld      d,(hl)
725b eb        ex      de,hl
725c 229791    ld      ($9197),hl
725f 21feff    ld      hl,$fffe
7262 09        add     hl,bc
7263 5e        ld      e,(hl)
7264 23        inc     hl
7265 56        ld      d,(hl)
7266 eb        ex      de,hl
7267 229991    ld      ($9199),hl
726a 2ab791    ld      hl,($91b7)
726d e5        push    hl
726e 2ab591    ld      hl,($91b5)
7271 23        inc     hl
7272 22b591    ld      ($91b5),hl
7275 5e        ld      e,(hl)
7276 1600      ld      d,$00
7278 d5        push    de
7279 cda071    call    $71a0
727c d1        pop     de
727d d1        pop     de
727e eb        ex      de,hl
727f 2aa591    ld      hl,($91a5)
7282 19        add     hl,de
7283 eb        ex      de,hl
7284 60        ld      h,b
7285 69        ld      l,c
7286 73        ld      (hl),e
7287 23        inc     hl
7288 72        ld      (hl),d
7289 eb        ex      de,hl
728a 229b91    ld      ($919b),hl
728d 2ab791    ld      hl,($91b7)
7290 23        inc     hl
7291 e5        push    hl
7292 2ab591    ld      hl,($91b5)
7295 23        inc     hl
7296 22b591    ld      ($91b5),hl
7299 5e        ld      e,(hl)
729a 1600      ld      d,$00
729c d5        push    de
729d cda071    call    $71a0
72a0 d1        pop     de
72a1 d1        pop     de
72a2 eb        ex      de,hl
72a3 2aa791    ld      hl,($91a7)
72a6 19        add     hl,de
72a7 eb        ex      de,hl
72a8 210200    ld      hl,$0002
72ab 09        add     hl,bc
72ac 73        ld      (hl),e
72ad 23        inc     hl
72ae 72        ld      (hl),d
72af eb        ex      de,hl
72b0 229d91    ld      ($919d),hl
72b3 2abb91    ld      hl,($91bb)
72b6 e5        push    hl
72b7 2a9d91    ld      hl,($919d)
72ba e5        push    hl
72bb 2a9b91    ld      hl,($919b)
72be e5        push    hl
72bf cd3777    call    $7737
72c2 d1        pop     de
72c3 d1        pop     de
72c4 2abb91    ld      hl,($91bb)
72c7 e3        ex      (sp),hl
72c8 cd0d74    call    $740d
72cb d1        pop     de
72cc c34272    jp      $7242
72cf 2ab191    ld      hl,($91b1)
72d2 229791    ld      ($9197),hl
72d5 2ab391    ld      hl,($91b3)
72d8 229991    ld      ($9199),hl
72db 2aa591    ld      hl,($91a5)
72de 229b91    ld      ($919b),hl
72e1 2aa791    ld      hl,($91a7)
72e4 229d91    ld      ($919d),hl
72e7 2abb91    ld      hl,($91bb)
72ea e5        push    hl
72eb cd0d74    call    $740d
72ee d1        pop     de
72ef c9        ret     

72f0 cda98b    call    $8ba9
72f3 211000    ld      hl,$0010
72f6 39        add     hl,sp
72f7 cd667c    call    $7c66
72fa cda77c    call    $7ca7
72fd cd7271    call    $7172
7300 eb        ex      de,hl
7301 cda08b    call    $8ba0
7304 d5        push    de
7305 2a8f91    ld      hl,($918f)
7308 d1        pop     de
7309 eb        ex      de,hl
730a cd3086    call    $8630
730d 229391    ld      ($9193),hl
7310 e5        push    hl
7311 210a00    ld      hl,$000a
7314 39        add     hl,sp
7315 cd667c    call    $7c66
7318 cda77c    call    $7ca7
731b cd7271    call    $7172
731e eb        ex      de,hl
731f cda08b    call    $8ba0
7322 2a8d91    ld      hl,($918d)
7325 19        add     hl,de
7326 229191    ld      ($9191),hl
7329 e5        push    hl
732a cd7976    call    $7679
732d d1        pop     de
732e d1        pop     de
732f cdd671    call    $71d6
7332 cdf06f    call    $6ff0
7335 229791    ld      ($9197),hl
7338 cd0870    call    $7008
733b 229991    ld      ($9199),hl
733e 2a9191    ld      hl,($9191)
7341 229b91    ld      ($919b),hl
7344 2a9391    ld      hl,($9193)
7347 229d91    ld      ($919d),hl
734a 215791    ld      hl,$9157
734d e5        push    hl
734e 210a00    ld      hl,$000a
7351 39        add     hl,sp
7352 cd667c    call    $7c66
7355 e1        pop     hl
7356 cd857c    call    $7c85
7359 215f91    ld      hl,$915f
735c e5        push    hl
735d 211200    ld      hl,$0012
7360 39        add     hl,sp
7361 cd667c    call    $7c66
7364 e1        pop     hl
7365 cd857c    call    $7c85
7368 cd5c76    call    $765c
736b cafd73    jp      z,$73fd
736e cdcf6d    call    $6dcf
7371 caf873    jp      z,$73f8
7374 2a7391    ld      hl,($9173)
7377 e5        push    hl
7378 cd0d74    call    $740d
737b d1        pop     de
737c 22bd91    ld      ($91bd),hl
737f 110100    ld      de,$0001
7382 eb        ex      de,hl
7383 cd0686    call    $8606
7386 44        ld      b,h
7387 4d        ld      c,l
7388 2a9391    ld      hl,($9193)
738b e5        push    hl
738c 2a9191    ld      hl,($9191)
738f e5        push    hl
7390 cd0d77    call    $770d
7393 d1        pop     de
7394 d1        pop     de
7395 2861      jr      z,$73f8
7397 2a9b91    ld      hl,($919b)
739a 229791    ld      ($9197),hl
739d 2a9d91    ld      hl,($919d)
73a0 229991    ld      ($9199),hl
73a3 2abd91    ld      hl,($91bd)
73a6 29        add     hl,hl
73a7 118591    ld      de,$9185
73aa 19        add     hl,de
73ab 5e        ld      e,(hl)
73ac 23        inc     hl
73ad 56        ld      d,(hl)
73ae d5        push    de
73af 219791    ld      hl,$9197
73b2 09        add     hl,bc
73b3 09        add     hl,bc
73b4 d1        pop     de
73b5 e5        push    hl
73b6 7e        ld      a,(hl)
73b7 23        inc     hl
73b8 66        ld      h,(hl)
73b9 6f        ld      l,a
73ba 19        add     hl,de
73bb eb        ex      de,hl
73bc e1        pop     hl
73bd 73        ld      (hl),e
73be 23        inc     hl
73bf 72        ld      (hl),d
73c0 2a9191    ld      hl,($9191)
73c3 229b91    ld      ($919b),hl
73c6 2a9391    ld      hl,($9193)
73c9 229d91    ld      ($919d),hl
73cc 2abd91    ld      hl,($91bd)
73cf 29        add     hl,hl
73d0 118591    ld      de,$9185
73d3 19        add     hl,de
73d4 5e        ld      e,(hl)
73d5 23        inc     hl
73d6 56        ld      d,(hl)
73d7 d5        push    de
73d8 219b91    ld      hl,$919b
73db 09        add     hl,bc
73dc 09        add     hl,bc
73dd d1        pop     de
73de e5        push    hl
73df 7e        ld      a,(hl)
73e0 23        inc     hl
73e1 66        ld      h,(hl)
73e2 6f        ld      l,a
73e3 19        add     hl,de
73e4 eb        ex      de,hl
73e5 e1        pop     hl
73e6 73        ld      (hl),e
73e7 23        inc     hl
73e8 72        ld      (hl),d
73e9 2a9b91    ld      hl,($919b)
73ec 229191    ld      ($9191),hl
73ef 2a9d91    ld      hl,($919d)
73f2 229391    ld      ($9193),hl
73f5 c37473    jp      $7374
73f8 cd9c70    call    $709c
73fb 180d      jr      $740a
73fd cdcf6d    call    $6dcf
7400 2808      jr      z,$740a
7402 2a7391    ld      hl,($9173)
7405 e5        push    hl
7406 cd0d74    call    $740d
7409 d1        pop     de
740a c3d671    jp      $71d6
740d cda98b    call    $8ba9
7410 21ffff    ld      hl,$ffff
7413 22a391    ld      ($91a3),hl
7416 22a191    ld      ($91a1),hl
7419 22c191    ld      ($91c1),hl
741c 210000    ld      hl,$0000
741f 229f91    ld      ($919f),hl
7422 21ffff    ld      hl,$ffff
7425 22bf91    ld      ($91bf),hl
7428 2abf91    ld      hl,($91bf)
742b 23        inc     hl
742c 22bf91    ld      ($91bf),hl
742f 110200    ld      de,$0002
7432 eb        ex      de,hl
7433 cd6c85    call    $856c
7436 cab474    jp      z,$74b4
7439 21ffff    ld      hl,$ffff
743c 44        ld      b,h
743d 4d        ld      c,l
743e 03        inc     bc
743f 60        ld      h,b
7440 69        ld      l,c
7441 110200    ld      de,$0002
7444 eb        ex      de,hl
7445 cd6c85    call    $856c
7448 2867      jr      z,$74b1
744a 60        ld      h,b
744b 69        ld      l,c
744c 29        add     hl,hl
744d 29        add     hl,hl
744e 117d91    ld      de,$917d
7451 19        add     hl,de
7452 5e        ld      e,(hl)
7453 23        inc     hl
7454 56        ld      d,(hl)
7455 d5        push    de
7456 60        ld      h,b
7457 69        ld      l,c
7458 29        add     hl,hl
7459 e5        push    hl
745a 2abf91    ld      hl,($91bf)
745d 29        add     hl,hl
745e 29        add     hl,hl
745f d1        pop     de
7460 19        add     hl,de
7461 119791    ld      de,$9197
7464 19        add     hl,de
7465 5e        ld      e,(hl)
7466 23        inc     hl
7467 56        ld      d,(hl)
7468 eb        ex      de,hl
7469 22c391    ld      ($91c3),hl
746c d1        pop     de
746d eb        ex      de,hl
746e cd6c85    call    $856c
7471 2814      jr      z,$7487
7473 210000    ld      hl,$0000
7476 e5        push    hl
7477 c5        push    bc
7478 2abf91    ld      hl,($91bf)
747b e5        push    hl
747c cdfe74    call    $74fe
747f d1        pop     de
7480 d1        pop     de
7481 d1        pop     de
7482 22c191    ld      ($91c1),hl
7485 1828      jr      $74af
7487 60        ld      h,b
7488 69        ld      l,c
7489 29        add     hl,hl
748a 29        add     hl,hl
748b 117f91    ld      de,$917f
748e 19        add     hl,de
748f 5e        ld      e,(hl)
7490 23        inc     hl
7491 56        ld      d,(hl)
7492 d5        push    de
7493 2ac391    ld      hl,($91c3)
7496 d1        pop     de
7497 eb        ex      de,hl
7498 cd6d85    call    $856d
749b 2812      jr      z,$74af
749d 210100    ld      hl,$0001
74a0 e5        push    hl
74a1 c5        push    bc
74a2 2abf91    ld      hl,($91bf)
74a5 e5        push    hl
74a6 cdfe74    call    $74fe
74a9 d1        pop     de
74aa d1        pop     de
74ab d1        pop     de
74ac 22c191    ld      ($91c1),hl
74af 188d      jr      $743e
74b1 c32874    jp      $7428
74b4 2a9f91    ld      hl,($919f)
74b7 7c        ld      a,h
74b8 b5        or      l
74b9 203f      jr      nz,$74fa
74bb 2a9991    ld      hl,($9199)
74be e5        push    hl
74bf 2a9791    ld      hl,($9197)
74c2 e5        push    hl
74c3 cd0d77    call    $770d
74c6 d1        pop     de
74c7 d1        pop     de
74c8 2030      jr      nz,$74fa
74ca 2a9d91    ld      hl,($919d)
74cd e5        push    hl
74ce 2a9b91    ld      hl,($919b)
74d1 e5        push    hl
74d2 cd0d77    call    $770d
74d5 d1        pop     de
74d6 d1        pop     de
74d7 2021      jr      nz,$74fa
74d9 210800    ld      hl,$0008
74dc 39        add     hl,sp
74dd 5e        ld      e,(hl)
74de 23        inc     hl
74df 56        ld      d,(hl)
74e0 d5        push    de
74e1 2a9d91    ld      hl,($919d)
74e4 e5        push    hl
74e5 2a9b91    ld      hl,($919b)
74e8 e5        push    hl
74e9 2a9991    ld      hl,($9199)
74ec e5        push    hl
74ed 2a9791    ld      hl,($9197)
74f0 e5        push    hl
74f1 cd8c77    call    $778c
74f4 eb        ex      de,hl
74f5 210a00    ld      hl,$000a
74f8 39        add     hl,sp
74f9 f9        ld      sp,hl
74fa 2ac191    ld      hl,($91c1)
74fd c9        ret     

74fe cda98b    call    $8ba9
7501 210a00    ld      hl,$000a
7504 39        add     hl,sp
7505 4e        ld      c,(hl)
7506 23        inc     hl
7507 46        ld      b,(hl)
7508 210800    ld      hl,$0008
750b 39        add     hl,sp
750c 5e        ld      e,(hl)
750d 23        inc     hl
750e 56        ld      d,(hl)
750f eb        ex      de,hl
7510 22c791    ld      ($91c7),hl
7513 60        ld      h,b
7514 69        ld      l,c
7515 29        add     hl,hl
7516 e5        push    hl
7517 2ac791    ld      hl,($91c7)
751a 110100    ld      de,$0001
751d cd3086    call    $8630
7520 29        add     hl,hl
7521 29        add     hl,hl
7522 d1        pop     de
7523 19        add     hl,de
7524 119791    ld      de,$9197
7527 19        add     hl,de
7528 5e        ld      e,(hl)
7529 23        inc     hl
752a 56        ld      d,(hl)
752b d5        push    de
752c 60        ld      h,b
752d 69        ld      l,c
752e 29        add     hl,hl
752f e5        push    hl
7530 2ac791    ld      hl,($91c7)
7533 29        add     hl,hl
7534 29        add     hl,hl
7535 d1        pop     de
7536 19        add     hl,de
7537 119791    ld      de,$9197
753a 19        add     hl,de
753b 5e        ld      e,(hl)
753c 23        inc     hl
753d 56        ld      d,(hl)
753e e1        pop     hl
753f cd3086    call    $8630
7542 22c991    ld      ($91c9),hl
7545 7c        ld      a,h
7546 b5        or      l
7547 ca0476    jp      z,$7604
754a 2ac991    ld      hl,($91c9)
754d cd2880    call    $8028
7550 cda77c    call    $7ca7
7553 210100    ld      hl,$0001
7556 50        ld      d,b
7557 59        ld      e,c
7558 eb        ex      de,hl
7559 cd3086    call    $8630
755c 29        add     hl,hl
755d e5        push    hl
755e 2ac791    ld      hl,($91c7)
7561 29        add     hl,hl
7562 29        add     hl,hl
7563 d1        pop     de
7564 19        add     hl,de
7565 119791    ld      de,$9197
7568 19        add     hl,de
7569 5e        ld      e,(hl)
756a 23        inc     hl
756b 56        ld      d,(hl)
756c d5        push    de
756d 210100    ld      hl,$0001
7570 50        ld      d,b
7571 59        ld      e,c
7572 eb        ex      de,hl
7573 cd3086    call    $8630
7576 29        add     hl,hl
7577 e5        push    hl
7578 2ac791    ld      hl,($91c7)
757b 110100    ld      de,$0001
757e cd3086    call    $8630
7581 29        add     hl,hl
7582 29        add     hl,hl
7583 d1        pop     de
7584 19        add     hl,de
7585 119791    ld      de,$9197
7588 19        add     hl,de
7589 5e        ld      e,(hl)
758a 23        inc     hl
758b 56        ld      d,(hl)
758c e1        pop     hl
758d cd3086    call    $8630
7590 cd2880    call    $8028
7593 cda77c    call    $7ca7
7596 211c00    ld      hl,$001c
7599 39        add     hl,sp
759a 5e        ld      e,(hl)
759b 23        inc     hl
759c 56        ld      d,(hl)
759d eb        ex      de,hl
759e 29        add     hl,hl
759f e5        push    hl
75a0 60        ld      h,b
75a1 69        ld      l,c
75a2 29        add     hl,hl
75a3 29        add     hl,hl
75a4 d1        pop     de
75a5 19        add     hl,de
75a6 117d91    ld      de,$917d
75a9 19        add     hl,de
75aa 5e        ld      e,(hl)
75ab 23        inc     hl
75ac 56        ld      d,(hl)
75ad eb        ex      de,hl
75ae 22cb91    ld      ($91cb),hl
75b1 e5        push    hl
75b2 60        ld      h,b
75b3 69        ld      l,c
75b4 29        add     hl,hl
75b5 e5        push    hl
75b6 2ac791    ld      hl,($91c7)
75b9 29        add     hl,hl
75ba 29        add     hl,hl
75bb d1        pop     de
75bc 19        add     hl,de
75bd 119791    ld      de,$9197
75c0 19        add     hl,de
75c1 5e        ld      e,(hl)
75c2 23        inc     hl
75c3 56        ld      d,(hl)
75c4 e1        pop     hl
75c5 cd3086    call    $8630
75c8 cd2880    call    $8028
75cb cdd87c    call    $7cd8
75ce cd417f    call    $7f41
75d1 cdd87c    call    $7cd8
75d4 cd417e    call    $7e41
75d7 cda77c    call    $7ca7
75da cd3871    call    $7138
75dd eb        ex      de,hl
75de cda08b    call    $8ba0
75e1 d5        push    de
75e2 210100    ld      hl,$0001
75e5 50        ld      d,b
75e6 59        ld      e,c
75e7 eb        ex      de,hl
75e8 cd3086    call    $8630
75eb 29        add     hl,hl
75ec e5        push    hl
75ed 2ac791    ld      hl,($91c7)
75f0 29        add     hl,hl
75f1 29        add     hl,hl
75f2 d1        pop     de
75f3 19        add     hl,de
75f4 119791    ld      de,$9197
75f7 19        add     hl,de
75f8 d1        pop     de
75f9 e5        push    hl
75fa 7e        ld      a,(hl)
75fb 23        inc     hl
75fc 66        ld      h,(hl)
75fd 6f        ld      l,a
75fe 19        add     hl,de
75ff eb        ex      de,hl
7600 e1        pop     hl
7601 73        ld      (hl),e
7602 23        inc     hl
7603 72        ld      (hl),d
7604 2acb91    ld      hl,($91cb)
7607 e5        push    hl
7608 60        ld      h,b
7609 69        ld      l,c
760a 29        add     hl,hl
760b e5        push    hl
760c 2ac791    ld      hl,($91c7)
760f 29        add     hl,hl
7610 29        add     hl,hl
7611 d1        pop     de
7612 19        add     hl,de
7613 119791    ld      de,$9197
7616 19        add     hl,de
7617 d1        pop     de
7618 73        ld      (hl),e
7619 23        inc     hl
761a 72        ld      (hl),d
761b 60        ld      h,b
761c 69        ld      l,c
761d 29        add     hl,hl
761e eb        ex      de,hl
761f 210c00    ld      hl,$000c
7622 39        add     hl,sp
7623 7e        ld      a,(hl)
7624 23        inc     hl
7625 66        ld      h,(hl)
7626 6f        ld      l,a
7627 19        add     hl,de
7628 22c591    ld      ($91c5),hl
762b eb        ex      de,hl
762c 2aa191    ld      hl,($91a1)
762f cd3c85    call    $853c
7632 2806      jr      z,$763a
7634 210100    ld      hl,$0001
7637 229f91    ld      ($919f),hl
763a 2ac591    ld      hl,($91c5)
763d eb        ex      de,hl
763e 2aa391    ld      hl,($91a3)
7641 cd3c85    call    $853c
7644 2806      jr      z,$764c
7646 210100    ld      hl,$0001
7649 229f91    ld      ($919f),hl
764c 2aa191    ld      hl,($91a1)
764f 22a391    ld      ($91a3),hl
7652 2ac591    ld      hl,($91c5)
7655 22a191    ld      ($91a1),hl
7658 2ac591    ld      hl,($91c5)
765b c9        ret     

765c cda98b    call    $8ba9
765f 2a6991    ld      hl,($9169)
7662 110100    ld      de,$0001
7665 cd3c85    call    $853c
7668 2807      jr      z,$7671
766a 2a9591    ld      hl,($9195)
766d 7c        ld      a,h
766e b5        or      l
766f 2004      jr      nz,$7675
7671 210000    ld      hl,$0000
7674 c9        ret     

7675 210100    ld      hl,$0001
7678 c9        ret     

7679 cda98b    call    $8ba9
767c 2a6991    ld      hl,($9169)
767f 110200    ld      de,$0002
7682 cd3c85    call    $853c
7685 281a      jr      z,$76a1
7687 210a00    ld      hl,$000a
768a 39        add     hl,sp
768b 5e        ld      e,(hl)
768c 23        inc     hl
768d 56        ld      d,(hl)
768e d5        push    de
768f 210a00    ld      hl,$000a
7692 39        add     hl,sp
7693 5e        ld      e,(hl)
7694 23        inc     hl
7695 56        ld      d,(hl)
7696 d5        push    de
7697 cd0d77    call    $770d
769a d1        pop     de
769b d1        pop     de
769c 2803      jr      z,$76a1
769e cdc253    call    $53c2
76a1 c9        ret     

76a2 cda98b    call    $8ba9
76a5 210800    ld      hl,$0008
76a8 39        add     hl,sp
76a9 cd667c    call    $7c66
76ac 214591    ld      hl,$9145
76af cd587c    call    $7c58
76b2 cd0780    call    $8007
76b5 281c      jr      z,$76d3
76b7 210800    ld      hl,$0008
76ba 39        add     hl,sp
76bb e5        push    hl
76bc 214591    ld      hl,$9145
76bf cd667c    call    $7c66
76c2 cd037d    call    $7d03
76c5 e1        pop     hl
76c6 e5        push    hl
76c7 cd667c    call    $7c66
76ca cd657d    call    $7d65
76cd e1        pop     hl
76ce cd857c    call    $7c85
76d1 18d2      jr      $76a5
76d3 210800    ld      hl,$0008
76d6 39        add     hl,sp
76d7 cd667c    call    $7c66
76da cd517c    call    $7c51
76dd 00        nop     
76de 00        nop     
76df 00        nop     
76e0 00        nop     
76e1 00        nop     
76e2 00        nop     
76e3 00        nop     
76e4 00        nop     
76e5 cdf27f    call    $7ff2
76e8 281c      jr      z,$7706
76ea 210800    ld      hl,$0008
76ed 39        add     hl,sp
76ee e5        push    hl
76ef 214591    ld      hl,$9145
76f2 cd667c    call    $7c66
76f5 cd037d    call    $7d03
76f8 e1        pop     hl
76f9 e5        push    hl
76fa cd667c    call    $7c66
76fd cd6c7d    call    $7d6c
7700 e1        pop     hl
7701 cd857c    call    $7c85
7704 18cd      jr      $76d3
7706 210800    ld      hl,$0008
7709 39        add     hl,sp
770a c3667c    jp      $7c66
770d c5        push    bc
770e 210400    ld      hl,$0004
7711 39        add     hl,sp
7712 5e        ld      e,(hl)
7713 23        inc     hl
7714 56        ld      d,(hl)
7715 23        inc     hl
7716 4e        ld      c,(hl)
7717 23        inc     hl
7718 46        ld      b,(hl)
7719 2a8391    ld      hl,($9183)
771c 7c        ld      a,h
771d 17        rla     
771e 3811      jr      c,$7731
7720 ed42      sbc     hl,bc
7722 380d      jr      c,$7731
7724 2a7f91    ld      hl,($917f)
7727 ed52      sbc     hl,de
7729 3806      jr      c,$7731
772b c1        pop     bc
772c 210000    ld      hl,$0000
772f a5        and     l
7730 c9        ret     

7731 c1        pop     bc
7732 210100    ld      hl,$0001
7735 b5        or      l
7736 c9        ret     

7737 e1        pop     hl
7738 22cd91    ld      ($91cd),hl
773b cd0d77    call    $770d
773e 2003      jr      nz,$7743
7740 cd8977    call    $7789
7743 2acd91    ld      hl,($91cd)
7746 e9        jp      (hl)
7747 e1        pop     hl
7748 22cd91    ld      ($91cd),hl
774b cd0d77    call    $770d
774e 11ffff    ld      de,$ffff
7751 2004      jr      nz,$7757
7753 cd9b77    call    $779b
7756 eb        ex      de,hl
7757 2acd91    ld      hl,($91cd)
775a e5        push    hl
775b eb        ex      de,hl
775c c9        ret     

775d 0e3c      ld      c,$3c		c=60 Call RSX function
775f 116577    ld      de,$7765		de=RSX Param block
7762 c30500    jp      $0005		call bDOS
7765 00        nop     
7766 02        ld      (bc),a
7767 39        add     hl,sp
7768 8c        adc     a,h
7769 6b        ld      l,e
776a 77        ld      (hl),a
776b c35d77    jp      $775d

				LIOS calls

776e c30000    jp      $0000	jp init
7771 c30000    jp      $0000	jp bye
7774 c30000    jp      $0000	jp txtmode
7777 c30000    jp      $0000	jp gfxmode
777a c30000    jp      $0000	jp conin
777d c30000    jp      $0000	jp const
7780 c30000    jp      $0000	jp conout
7783 c30000    jp      $0000	jp setcurpos
7786 c30000    jp      $0000	jp scroll
7789 c30000    jp      $0000	jp plot
778c c30000    jp      $0000	jp draw
778f c30000    jp      $0000	jp bg_set
7792 c30000    jp      $0000	jp clrgfx
7795 c30000    jp      $0000	jp beep
7798 c30000    jp      $0000	jp memtop
779b c30000    jp      $0000	jp getpix
779e c30000    jp      $0000	jp listst
77a1 c30000    jp      $0000	jp list
77a4 c30000    jp      $0000
77a7 c30000    jp      $0000
77aa c30000    jp      $0000
77ad c30000    jp      $0000
77b0 c30000    jp      $0000
77b3 c30000    jp      $0000
77b6 c30000    jp      $0000
77b9 c3e553    jp      $53e5
77bc c3e553    jp      $53e5
77bf cd9e77    call    $779e
77c2 2018      jr      nz,$77dc
77c4 cdc066    call    $66c0
77c7 21e377    ld      hl,$77e3
77ca e5        push    hl
77cb cd3e69    call    $693e
77ce d1        pop     de
77cf cd9e77    call    $779e
77d2 2005      jr      nz,$77d9
77d4 cd9d69    call    $699d
77d7 18f6      jr      $77cf
77d9 cdc066    call    $66c0
77dc 210100    ld      hl,$0001
77df 226e8e    ld      ($8e6e),hl
77e2 c9        ret     

77e3 50        ld      d,b
77e4 6c        ld      l,h
77e5 65        ld      h,l
77e6 61        ld      h,c
77e7 73        ld      (hl),e
77e8 65        ld      h,l
77e9 2074      jr      nz,$785f
77eb 75        ld      (hl),l
77ec 72        ld      (hl),d
77ed 6e        ld      l,(hl)
77ee 206f      jr      nz,$785f
77f0 6e        ld      l,(hl)
77f1 2074      jr      nz,$7867
77f3 68        ld      l,b
77f4 65        ld      h,l
77f5 2070      jr      nz,$7867
77f7 72        ld      (hl),d
77f8 69        ld      l,c
77f9 6e        ld      l,(hl)
77fa 74        ld      (hl),h
77fb 65        ld      h,l
77fc 72        ld      (hl),d
77fd 00        nop     
77fe 210000    ld      hl,$0000
7801 226e8e    ld      ($8e6e),hl
7804 c9        ret     

7805 cda98b    call    $8ba9
7808 210800    ld      hl,$0008
780b 39        add     hl,sp
780c 4e        ld      c,(hl)
780d 23        inc     hl
780e 46        ld      b,(hl)
780f 60        ld      h,b
7810 69        ld      l,c
7811 5e        ld      e,(hl)
7812 1600      ld      d,$00
7814 d5        push    de
7815 cd8b66    call    $668b
7818 d1        pop     de
7819 200d      jr      nz,$7828
781b 60        ld      h,b
781c 69        ld      l,c
781d 03        inc     bc
781e 5e        ld      e,(hl)
781f 1600      ld      d,$00
7821 d5        push    de
7822 cd3178    call    $7831
7825 d1        pop     de
7826 18e7      jr      $780f
7828 210a00    ld      hl,$000a
782b e5        push    hl
782c cd3178    call    $7831
782f d1        pop     de
7830 c9        ret     

7831 cda98b    call    $8ba9
7834 210800    ld      hl,$0008
7837 39        add     hl,sp
7838 4e        ld      c,(hl)
7839 23        inc     hl
783a 46        ld      b,(hl)
783b cd9e77    call    $779e
783e 2005      jr      nz,$7845
7840 cd8769    call    $6987
7843 18f6      jr      $783b
7845 60        ld      h,b
7846 69        ld      l,c
7847 110a00    ld      de,$000a
784a cd3c85    call    $853c
784d 2808      jr      z,$7857
784f 210d00    ld      hl,$000d
7852 e5        push    hl
7853 cda177    call    $77a1
7856 d1        pop     de
7857 c5        push    bc
7858 cda177    call    $77a1
785b d1        pop     de
785c c9        ret     

785d c3e553    jp      $53e5
7860 c3e553    jp      $53e5
7863 c3e553    jp      $53e5
7866 c3e553    jp      $53e5
7869 cd0585    call    $8505
786c 00        nop     
786d fc2104    call    m,$0421
7870 00        nop     
7871 39        add     hl,sp
7872 225a90    ld      ($905a),hl
7875 cd0870    call    $7008
7878 e5        push    hl
7879 cdf06f    call    $6ff0
787c e5        push    hl
787d cd4777    call    $7747
7880 d1        pop     de
7881 d1        pop     de
7882 225090    ld      ($9050),hl
7885 11ffff    ld      de,$ffff
7888 cd3c85    call    $853c
788b c0        ret     nz

788c cdcf6d    call    $6dcf
788f 7d        ld      a,l
7890 325d90    ld      ($905d),a
7893 7c        ld      a,h
7894 b5        or      l
7895 c8        ret     z

7896 cdfe6d    call    $6dfe
7899 7d        ld      a,l
789a 325c90    ld      ($905c),a
789d eb        ex      de,hl
789e 2a5090    ld      hl,($9050)
78a1 cd3c85    call    $853c
78a4 280a      jr      z,$78b0
78a6 cdcf6d    call    $6dcf
78a9 110100    ld      de,$0001
78ac cd3c85    call    $853c
78af c0        ret     nz

78b0 cdcf6d    call    $6dcf
78b3 110300    ld      de,$0003
78b6 cd3c85    call    $853c
78b9 280f      jr      z,$78ca
78bb cd7a6d    call    $6d7a
78be 7d        ld      a,l
78bf 325c90    ld      ($905c),a
78c2 eb        ex      de,hl
78c3 2a5090    ld      hl,($9050)
78c6 cd3c85    call    $853c
78c9 c0        ret     nz

78ca 210000    ld      hl,$0000
78cd 225490    ld      ($9054),hl
78d0 225290    ld      ($9052),hl
78d3 cd0870    call    $7008
78d6 e5        push    hl
78d7 cdf06f    call    $6ff0
78da e5        push    hl
78db cdf679    call    $79f6
78de d1        pop     de
78df d1        pop     de
78e0 2a5290    ld      hl,($9052)
78e3 eb        ex      de,hl
78e4 2a5490    ld      hl,($9054)
78e7 cd4885    call    $8548
78ea c8        ret     z

78eb cd277a    call    $7a27
78ee 2a5890    ld      hl,($9058)
78f1 e5        push    hl
78f2 2a5690    ld      hl,($9056)
78f5 e5        push    hl
78f6 cd4777    call    $7747
78f9 d1        pop     de
78fa d1        pop     de
78fb eb        ex      de,hl
78fc 2a5090    ld      hl,($9050)
78ff cd3c85    call    $853c
7902 283a      jr      z,$793e
7904 2a5c90    ld      hl,($905c)
7907 e5        push    hl
7908 2a5890    ld      hl,($9058)
790b e5        push    hl
790c 2a5690    ld      hl,($9056)
790f e5        push    hl
7910 cd3777    call    $7737
7913 d1        pop     de
7914 d1        pop     de
7915 2a5890    ld      hl,($9058)
7918 e3        ex      (sp),hl
7919 2a5690    ld      hl,($9056)
791c 2b        dec     hl
791d e5        push    hl
791e cdf679    call    $79f6
7921 d1        pop     de
7922 2a5890    ld      hl,($9058)
7925 e3        ex      (sp),hl
7926 2a5690    ld      hl,($9056)
7929 23        inc     hl
792a e5        push    hl
792b cdf679    call    $79f6
792e d1        pop     de
792f 21ffff    ld      hl,$ffff
7932 e3        ex      (sp),hl
7933 cd8479    call    $7984
7936 210100    ld      hl,$0001
7939 e3        ex      (sp),hl
793a cd8479    call    $7984
793d d1        pop     de
793e 18a0      jr      $78e0
7940 c9        ret     

7941 cda98b    call    $8ba9
7944 21a4fb    ld      hl,$fba4
7947 39        add     hl,sp
7948 eb        ex      de,hl
7949 2a2e90    ld      hl,($902e)
794c cd6686    call    $8666
794f 2803      jr      z,$7954
7951 cd8357    call    $5783
7954 cddf4c    call    $4cdf
7957 cdc84c    call    $4cc8
795a cd4d1f    call    $1f4d
795d cdd671    call    $71d6
7960 cd6978    call    $7869
7963 c3d671    jp      $71d6
7966 cdbc1a    call    $1abc
7969 cdc51a    call    $1ac5
796c cda77c    call    $7ca7
796f cdc51a    call    $1ac5
7972 cda77c    call    $7ca7
7975 cdad6f    call    $6fad
7978 eb        ex      de,hl
7979 211000    ld      hl,$0010
797c 39        add     hl,sp
797d f9        ld      sp,hl
797e d5        push    de
797f cda64b    call    $4ba6
7982 d1        pop     de
7983 c9        ret     

7984 c5        push    bc
7985 210400    ld      hl,$0004
7988 39        add     hl,sp
7989 5e        ld      e,(hl)
798a 23        inc     hl
798b 56        ld      d,(hl)
798c ed53d191  ld      ($91d1),de
7990 2a5890    ld      hl,($9058)
7993 a7        and     a
7994 ed52      sbc     hl,de
7996 22d391    ld      ($91d3),hl
7999 ed4b5690  ld      bc,($9056)
799d ed5b5c90  ld      de,($905c)
79a1 d5        push    de
79a2 e5        push    hl
79a3 c5        push    bc
79a4 cd4777    call    $7747
79a7 3a5090    ld      a,($9050)
79aa bd        cp      l
79ab 2044      jr      nz,$79f1
79ad cd3777    call    $7737
79b0 ed5bd391  ld      de,($91d3)
79b4 2ad191    ld      hl,($91d1)
79b7 19        add     hl,de
79b8 e5        push    hl
79b9 03        inc     bc
79ba c5        push    bc
79bb cd4777    call    $7747
79be d1        pop     de
79bf 3a5090    ld      a,($9050)
79c2 bd        cp      l
79c3 280a      jr      z,$79cf
79c5 2ad391    ld      hl,($91d3)
79c8 e5        push    hl
79c9 c5        push    bc
79ca cdf679    call    $79f6
79cd d1        pop     de
79ce d1        pop     de
79cf 0b        dec     bc
79d0 0b        dec     bc
79d1 c5        push    bc
79d2 cd4777    call    $7747
79d5 d1        pop     de
79d6 d1        pop     de
79d7 3a5090    ld      a,($9050)
79da bd        cp      l
79db 2805      jr      z,$79e2
79dd e1        pop     hl
79de c5        push    bc
79df cdf679    call    $79f6
79e2 d1        pop     de
79e3 03        inc     bc
79e4 e1        pop     hl
79e5 ed5bd191  ld      de,($91d1)
79e9 a7        and     a
79ea ed52      sbc     hl,de
79ec 22d391    ld      ($91d3),hl
79ef 18b1      jr      $79a2
79f1 d1        pop     de
79f2 d1        pop     de
79f3 d1        pop     de
79f4 c1        pop     bc
79f5 c9        ret     

79f6 e1        pop     hl
79f7 22cf91    ld      ($91cf),hl
79fa cd4777    call    $7747
79fd 3a5090    ld      a,($9050)
7a00 bd        cp      l
7a01 2020      jr      nz,$7a23
7a03 2a5490    ld      hl,($9054)
7a06 29        add     hl,hl
7a07 ed5b5a90  ld      de,($905a)
7a0b 19        add     hl,de
7a0c d1        pop     de
7a0d 73        ld      (hl),e
7a0e 23        inc     hl
7a0f 72        ld      (hl),d
7a10 23        inc     hl
7a11 d1        pop     de
7a12 73        ld      (hl),e
7a13 23        inc     hl
7a14 72        ld      (hl),d
7a15 d5        push    de
7a16 d5        push    de
7a17 2a5490    ld      hl,($9054)
7a1a 23        inc     hl
7a1b 23        inc     hl
7a1c 7c        ld      a,h
7a1d e601      and     $01
7a1f 67        ld      h,a
7a20 225490    ld      ($9054),hl
7a23 2acf91    ld      hl,($91cf)
7a26 e9        jp      (hl)
7a27 2a5290    ld      hl,($9052)
7a2a 29        add     hl,hl
7a2b ed5b5a90  ld      de,($905a)
7a2f 19        add     hl,de
7a30 5e        ld      e,(hl)
7a31 23        inc     hl
7a32 56        ld      d,(hl)
7a33 23        inc     hl
7a34 ed535690  ld      ($9056),de
7a38 5e        ld      e,(hl)
7a39 23        inc     hl
7a3a 56        ld      d,(hl)
7a3b ed535890  ld      ($9058),de
7a3f 2a5290    ld      hl,($9052)
7a42 23        inc     hl
7a43 23        inc     hl
7a44 7c        ld      a,h
7a45 e601      and     $01
7a47 67        ld      h,a
7a48 225290    ld      ($9052),hl
7a4b c9        ret     

7a4c cda98b    call    $8ba9
7a4f 210800    ld      hl,$0008
7a52 39        add     hl,sp
7a53 cd667c    call    $7c66
7a56 cda77c    call    $7ca7
7a59 cda276    call    $76a2
7a5c cda08b    call    $8ba0
7a5f cda77c    call    $7ca7
7a62 cd988a    call    $8a98
7a65 cda08b    call    $8ba0
7a68 c9        ret     

7a69 cda98b    call    $8ba9
7a6c 210800    ld      hl,$0008
7a6f 39        add     hl,sp
7a70 cd667c    call    $7c66
7a73 cda77c    call    $7ca7
7a76 cda276    call    $76a2
7a79 cda08b    call    $8ba0
7a7c cda77c    call    $7ca7
7a7f cd7b8a    call    $8a7b
7a82 cda08b    call    $8ba0
7a85 c9        ret     

7a86 21d591    ld      hl,$91d5
7a89 e5        push    hl
7a8a cdaa26    call    $26aa
7a8d d1        pop     de
7a8e c9        ret     

7a8f 21d591    ld      hl,$91d5
7a92 e5        push    hl
7a93 cd2727    call    $2727
7a96 d1        pop     de
7a97 c9        ret     

7a98 cd0585    call    $8505
7a9b dcff21    call    c,$21ff
7a9e d5        push    de
7a9f 91        sub     c
7aa0 e5        push    hl
7aa1 210600    ld      hl,$0006
7aa4 39        add     hl,sp
7aa5 44        ld      b,h
7aa6 4d        ld      c,l
7aa7 e5        push    hl
7aa8 cdd324    call    $24d3
7aab d1        pop     de
7aac d1        pop     de
7aad c5        push    bc
7aae cd1423    call    $2314
7ab1 d1        pop     de
7ab2 2003      jr      nz,$7ab7
7ab4 cd3957    call    $5739
7ab7 cd4d1f    call    $1f4d
7aba cdd671    call    $71d6
7abd 21ffff    ld      hl,$ffff
7ac0 22d991    ld      ($91d9),hl
7ac3 cd2c20    call    $202c
7ac6 c5        push    bc
7ac7 211400    ld      hl,$0014
7aca e5        push    hl
7acb cdbc86    call    $86bc
7ace d1        pop     de
7acf d1        pop     de
7ad0 2015      jr      nz,$7ae7
7ad2 2ad991    ld      hl,($91d9)
7ad5 23        inc     hl
7ad6 22d991    ld      ($91d9),hl
7ad9 e5        push    hl
7ada 218000    ld      hl,$0080
7add e5        push    hl
7ade cdb677    call    $77b6
7ae1 d1        pop     de
7ae2 d1        pop     de
7ae3 2802      jr      z,$7ae7
7ae5 18dc      jr      $7ac3
7ae7 cdd671    call    $71d6
7aea c5        push    bc
7aeb cd3a23    call    $233a
7aee d1        pop     de
7aef c37c4b    jp      $4b7c
7af2 cd0585    call    $8505
7af5 dcff21    call    c,$21ff
7af8 d5        push    de
7af9 91        sub     c
7afa e5        push    hl
7afb 210600    ld      hl,$0006
7afe 39        add     hl,sp
7aff 44        ld      b,h
7b00 4d        ld      c,l
7b01 e5        push    hl
7b02 cdfa24    call    $24fa
7b05 d1        pop     de
7b06 d1        pop     de
7b07 c5        push    bc
7b08 cd5923    call    $2359
7b0b d1        pop     de
7b0c cd4d1f    call    $1f4d
7b0f cdd671    call    $71d6
7b12 21ffff    ld      hl,$ffff
7b15 22db91    ld      ($91db),hl
7b18 2adb91    ld      hl,($91db)
7b1b 23        inc     hl
7b1c 22db91    ld      ($91db),hl
7b1f e5        push    hl
7b20 218000    ld      hl,$0080
7b23 e5        push    hl
7b24 cdb377    call    $77b3
7b27 d1        pop     de
7b28 d1        pop     de
7b29 2819      jr      z,$7b44
7b2b cd2c20    call    $202c
7b2e c5        push    bc
7b2f 211500    ld      hl,$0015
7b32 e5        push    hl
7b33 cdbc86    call    $86bc
7b36 d1        pop     de
7b37 d1        pop     de
7b38 2808      jr      z,$7b42
7b3a c5        push    bc
7b3b cd3a23    call    $233a
7b3e d1        pop     de
7b3f cd6857    call    $5768
7b42 18d4      jr      $7b18
7b44 cdd671    call    $71d6
7b47 c5        push    bc
7b48 cd3a23    call    $233a
7b4b d1        pop     de
7b4c c37c4b    jp      $4b7c
7b4f 210200    ld      hl,$0002
7b52 39        add     hl,sp
7b53 c5        push    bc
7b54 01ff7f    ld      bc,$7fff
7b57 5e        ld      e,(hl)
7b58 23        inc     hl
7b59 56        ld      d,(hl)
7b5a 23        inc     hl
7b5b 7e        ld      a,(hl)
7b5c 23        inc     hl
7b5d 66        ld      h,(hl)
7b5e 6f        ld      l,a
7b5f 78        ld      a,b
7b60 b1        or      c
7b61 ca737b    jp      z,$7b73
7b64 1a        ld      a,(de)
7b65 be        cp      (hl)
7b66 c2787b    jp      nz,$7b78
7b69 b7        or      a
7b6a ca737b    jp      z,$7b73
7b6d 23        inc     hl
7b6e 13        inc     de
7b6f 0b        dec     bc
7b70 c35f7b    jp      $7b5f
7b73 c1        pop     bc
7b74 210000    ld      hl,$0000
7b77 c9        ret     

7b78 c1        pop     bc
7b79 da827b    jp      c,$7b82
7b7c 210100    ld      hl,$0001
7b7f 7d        ld      a,l
7b80 b4        or      h
7b81 c9        ret     

7b82 21ffff    ld      hl,$ffff
7b85 7d        ld      a,l
7b86 b4        or      h
7b87 c9        ret     

7b88 210200    ld      hl,$0002
7b8b 39        add     hl,sp
7b8c c5        push    bc
7b8d 01ff7f    ld      bc,$7fff
7b90 5e        ld      e,(hl)
7b91 23        inc     hl
7b92 56        ld      d,(hl)
7b93 d5        push    de
7b94 23        inc     hl
7b95 7e        ld      a,(hl)
7b96 23        inc     hl
7b97 66        ld      h,(hl)
7b98 6f        ld      l,a
7b99 78        ld      a,b
7b9a b1        or      c
7b9b caaa7b    jp      z,$7baa
7b9e 7e        ld      a,(hl)
7b9f 12        ld      (de),a
7ba0 b7        or      a
7ba1 caaa7b    jp      z,$7baa
7ba4 23        inc     hl
7ba5 13        inc     de
7ba6 0b        dec     bc
7ba7 c3997b    jp      $7b99
7baa e1        pop     hl
7bab c1        pop     bc
7bac c9        ret     

7bad 210200    ld      hl,$0002
7bb0 39        add     hl,sp
7bb1 7e        ld      a,(hl)
7bb2 23        inc     hl
7bb3 66        ld      h,(hl)
7bb4 6f        ld      l,a
7bb5 110000    ld      de,$0000
7bb8 af        xor     a
7bb9 be        cp      (hl)
7bba cac27b    jp      z,$7bc2
7bbd 13        inc     de
7bbe 23        inc     hl
7bbf c3b97b    jp      $7bb9
7bc2 eb        ex      de,hl
7bc3 7d        ld      a,l
7bc4 b4        or      h
7bc5 c9        ret     

7bc6 210200    ld      hl,$0002
7bc9 39        add     hl,sp
7bca c5        push    bc
7bcb 5e        ld      e,(hl)
7bcc 23        inc     hl
7bcd 56        ld      d,(hl)
7bce d5        push    de
7bcf 23        inc     hl
7bd0 5e        ld      e,(hl)
7bd1 23        inc     hl
7bd2 56        ld      d,(hl)
7bd3 23        inc     hl
7bd4 4e        ld      c,(hl)
7bd5 23        inc     hl
7bd6 46        ld      b,(hl)
7bd7 eb        ex      de,hl
7bd8 d1        pop     de
7bd9 c35f7b    jp      $7b5f
7bdc c5        push    bc
7bdd 01ff7f    ld      bc,$7fff
7be0 210400    ld      hl,$0004
7be3 39        add     hl,sp
7be4 5e        ld      e,(hl)
7be5 23        inc     hl
7be6 56        ld      d,(hl)
7be7 d5        push    de
7be8 23        inc     hl
7be9 7e        ld      a,(hl)
7bea 23        inc     hl
7beb 66        ld      h,(hl)
7bec 6f        ld      l,a
7bed eb        ex      de,hl
7bee 78        ld      a,b
7bef b1        or      c
7bf0 caaa7b    jp      z,$7baa
7bf3 7e        ld      a,(hl)
7bf4 b7        or      a
7bf5 cafd7b    jp      z,$7bfd
7bf8 23        inc     hl
7bf9 0b        dec     bc
7bfa c3ee7b    jp      $7bee
7bfd eb        ex      de,hl
7bfe c3997b    jp      $7b99
7c01 d1        pop     de
7c02 e1        pop     hl
7c03 e5        push    hl
7c04 73        ld      (hl),e
7c05 23        inc     hl
7c06 72        ld      (hl),d
7c07 23        inc     hl
7c08 d5        push    de
7c09 eb        ex      de,hl
7c0a 210000    ld      hl,$0000
7c0d 39        add     hl,sp
7c0e eb        ex      de,hl
7c0f 73        ld      (hl),e
7c10 23        inc     hl
7c11 72        ld      (hl),d
7c12 af        xor     a
7c13 67        ld      h,a
7c14 6f        ld      l,a
7c15 c9        ret     

7c16 e1        pop     hl
7c17 e1        pop     hl
7c18 5e        ld      e,(hl)
7c19 23        inc     hl
7c1a 56        ld      d,(hl)
7c1b 23        inc     hl
7c1c d5        push    de
7c1d 5e        ld      e,(hl)
7c1e 23        inc     hl
7c1f 56        ld      d,(hl)
7c20 e1        pop     hl
7c21 eb        ex      de,hl
7c22 73        ld      (hl),e
7c23 23        inc     hl
7c24 72        ld      (hl),d
7c25 2b        dec     hl
7c26 d1        pop     de
7c27 f9        ld      sp,hl
7c28 eb        ex      de,hl
7c29 7c        ld      a,h
7c2a b5        or      l
7c2b c9        ret     

7c2c eb        ex      de,hl
7c2d 2a3690    ld      hl,($9036)
7c30 c5        push    bc
7c31 1a        ld      a,(de)
7c32 77        ld      (hl),a
7c33 23        inc     hl
7c34 e67f      and     $7f
7c36 d640      sub     $40
7c38 77        ld      (hl),a
7c39 23        inc     hl
7c3a 3600      ld      (hl),$00
7c3c 0603      ld      b,$03
7c3e 23        inc     hl
7c3f 13        inc     de
7c40 1a        ld      a,(de)
7c41 77        ld      (hl),a
7c42 05        dec     b
7c43 c23e7c    jp      nz,$7c3e
7c46 0605      ld      b,$05
7c48 af        xor     a
7c49 23        inc     hl
7c4a 77        ld      (hl),a
7c4b 05        dec     b
7c4c c2497c    jp      nz,$7c49
7c4f c1        pop     bc
7c50 c9        ret     

7c51 d1        pop     de
7c52 210800    ld      hl,$0008
7c55 19        add     hl,de
7c56 e5        push    hl
7c57 eb        ex      de,hl
7c58 eb        ex      de,hl
7c59 2a3890    ld      hl,($9038)
7c5c c36a7c    jp      $7c6a
7c5f d1        pop     de
7c60 210800    ld      hl,$0008
7c63 19        add     hl,de
7c64 e5        push    hl
7c65 eb        ex      de,hl
7c66 eb        ex      de,hl
7c67 2a3690    ld      hl,($9036)
7c6a c5        push    bc
7c6b 1a        ld      a,(de)
7c6c 77        ld      (hl),a
7c6d 23        inc     hl
7c6e e67f      and     $7f
7c70 d640      sub     $40
7c72 77        ld      (hl),a
7c73 23        inc     hl
7c74 3600      ld      (hl),$00
7c76 0607      ld      b,$07
7c78 23        inc     hl
7c79 13        inc     de
7c7a 1a        ld      a,(de)
7c7b 77        ld      (hl),a
7c7c 05        dec     b
7c7d c2787c    jp      nz,$7c78
7c80 23        inc     hl
7c81 3600      ld      (hl),$00
7c83 c1        pop     bc
7c84 c9        ret     

7c85 c5        push    bc
7c86 e5        push    hl
7c87 cd6a80    call    $806a
7c8a d1        pop     de
7c8b 2a3690    ld      hl,($9036)
7c8e 7e        ld      a,(hl)
7c8f e680      and     $80
7c91 47        ld      b,a
7c92 23        inc     hl
7c93 7e        ld      a,(hl)
7c94 c640      add     a,$40
7c96 e67f      and     $7f
7c98 b0        or      b
7c99 12        ld      (de),a
7c9a 23        inc     hl
7c9b 0607      ld      b,$07
7c9d 13        inc     de
7c9e 23        inc     hl
7c9f 7e        ld      a,(hl)
7ca0 12        ld      (de),a
7ca1 05        dec     b
7ca2 c29d7c    jp      nz,$7c9d
7ca5 c1        pop     bc
7ca6 c9        ret     

7ca7 e1        pop     hl
7ca8 22dd91    ld      ($91dd),hl
7cab cd6a80    call    $806a
7cae 2a3690    ld      hl,($9036)
7cb1 110900    ld      de,$0009
7cb4 19        add     hl,de
7cb5 56        ld      d,(hl)
7cb6 2b        dec     hl
7cb7 5e        ld      e,(hl)
7cb8 2b        dec     hl
7cb9 d5        push    de
7cba 56        ld      d,(hl)
7cbb 2b        dec     hl
7cbc 5e        ld      e,(hl)
7cbd 2b        dec     hl
7cbe d5        push    de
7cbf 56        ld      d,(hl)
7cc0 2b        dec     hl
7cc1 5e        ld      e,(hl)
7cc2 2b        dec     hl
7cc3 d5        push    de
7cc4 56        ld      d,(hl)
7cc5 2b        dec     hl
7cc6 2b        dec     hl
7cc7 7e        ld      a,(hl)
7cc8 c640      add     a,$40
7cca e67f      and     $7f
7ccc 5f        ld      e,a
7ccd 2b        dec     hl
7cce 7e        ld      a,(hl)
7ccf e680      and     $80
7cd1 b3        or      e
7cd2 5f        ld      e,a
7cd3 d5        push    de
7cd4 2add91    ld      hl,($91dd)
7cd7 e9        jp      (hl)
7cd8 e1        pop     hl
7cd9 22dd91    ld      ($91dd),hl
7cdc 2a3890    ld      hl,($9038)
7cdf d1        pop     de
7ce0 73        ld      (hl),e
7ce1 23        inc     hl
7ce2 7b        ld      a,e
7ce3 e67f      and     $7f
7ce5 d640      sub     $40
7ce7 77        ld      (hl),a
7ce8 23        inc     hl
7ce9 3600      ld      (hl),$00
7ceb 23        inc     hl
7cec 72        ld      (hl),d
7ced 23        inc     hl
7cee d1        pop     de
7cef 73        ld      (hl),e
7cf0 23        inc     hl
7cf1 72        ld      (hl),d
7cf2 23        inc     hl
7cf3 d1        pop     de
7cf4 73        ld      (hl),e
7cf5 23        inc     hl
7cf6 72        ld      (hl),d
7cf7 23        inc     hl
7cf8 d1        pop     de
7cf9 73        ld      (hl),e
7cfa 23        inc     hl
7cfb 72        ld      (hl),d
7cfc 23        inc     hl
7cfd 3600      ld      (hl),$00
7cff 2add91    ld      hl,($91dd)
7d02 e9        jp      (hl)
7d03 2a3890    ld      hl,($9038)
7d06 eb        ex      de,hl
7d07 2a3690    ld      hl,($9036)
7d0a 223890    ld      ($9038),hl
7d0d eb        ex      de,hl
7d0e 223690    ld      ($9036),hl
7d11 c9        ret     

7d12 2a3690    ld      hl,($9036)
7d15 7e        ld      a,(hl)
7d16 ee80      xor     $80
7d18 77        ld      (hl),a
7d19 c9        ret     

7d1a 2a3690    ld      hl,($9036)
7d1d 23        inc     hl
7d1e 7e        ld      a,(hl)
7d1f fec0      cp      $c0
7d21 c24d85    jp      nz,$854d
7d24 c34185    jp      $8541
7d27 af        xor     a
7d28 3d        dec     a
7d29 c1        pop     bc
7d2a c9        ret     

7d2b af        xor     a
7d2c 3c        inc     a
7d2d c1        pop     bc
7d2e c9        ret     

7d2f c5        push    bc
7d30 2a3690    ld      hl,($9036)
7d33 eb        ex      de,hl
7d34 2a3890    ld      hl,($9038)
7d37 1a        ld      a,(de)
7d38 b7        or      a
7d39 fa437d    jp      m,$7d43
7d3c ae        xor     (hl)
7d3d fa2b7d    jp      m,$7d2b
7d40 c3487d    jp      $7d48
7d43 ae        xor     (hl)
7d44 fa277d    jp      m,$7d27
7d47 eb        ex      de,hl
7d48 23        inc     hl
7d49 13        inc     de
7d4a 1a        ld      a,(de)
7d4b be        cp      (hl)
7d4c fa277d    jp      m,$7d27
7d4f c22b7d    jp      nz,$7d2b
7d52 0609      ld      b,$09
7d54 23        inc     hl
7d55 13        inc     de
7d56 1a        ld      a,(de)
7d57 be        cp      (hl)
7d58 da277d    jp      c,$7d27
7d5b c22b7d    jp      nz,$7d2b
7d5e 05        dec     b
7d5f c2547d    jp      nz,$7d54
7d62 af        xor     a
7d63 c1        pop     bc
7d64 c9        ret     

7d65 2a3890    ld      hl,($9038)
7d68 7e        ld      a,(hl)
7d69 ee80      xor     $80
7d6b 77        ld      (hl),a
7d6c c5        push    bc
7d6d 2a3690    ld      hl,($9036)
7d70 110b00    ld      de,$000b
7d73 19        add     hl,de
7d74 0607      ld      b,$07
7d76 af        xor     a
7d77 77        ld      (hl),a
7d78 23        inc     hl
7d79 05        dec     b
7d7a c2777d    jp      nz,$7d77
7d7d 2a3890    ld      hl,($9038)
7d80 110b00    ld      de,$000b
7d83 19        add     hl,de
7d84 0607      ld      b,$07
7d86 77        ld      (hl),a
7d87 23        inc     hl
7d88 05        dec     b
7d89 c2867d    jp      nz,$7d86
7d8c 2a3690    ld      hl,($9036)
7d8f eb        ex      de,hl
7d90 2a3890    ld      hl,($9038)
7d93 23        inc     hl
7d94 13        inc     de
7d95 1a        ld      a,(de)
7d96 96        sub     (hl)
7d97 f29d7d    jp      p,$7d9d
7d9a eb        ex      de,hl
7d9b 2f        cpl     
7d9c 3c        inc     a
7d9d 1b        dec     de
7d9e 2b        dec     hl
7d9f 223890    ld      ($9038),hl
7da2 eb        ex      de,hl
7da3 223690    ld      ($9036),hl
7da6 fe09      cp      $09
7da8 d29180    jp      nc,$8091
7dab 4f        ld      c,a
7dac e5        push    hl
7dad d5        push    de
7dae c609      add     a,$09
7db0 5f        ld      e,a
7db1 1600      ld      d,$00
7db3 19        add     hl,de
7db4 22df91    ld      ($91df),hl
7db7 d1        pop     de
7db8 210900    ld      hl,$0009
7dbb 19        add     hl,de
7dbc 22e191    ld      ($91e1),hl
7dbf e1        pop     hl
7dc0 eb        ex      de,hl
7dc1 1a        ld      a,(de)
7dc2 ae        xor     (hl)
7dc3 f2237e    jp      p,$7e23
7dc6 1a        ld      a,(de)
7dc7 b7        or      a
7dc8 faea7d    jp      m,$7dea
7dcb 0607      ld      b,$07
7dcd 2adf91    ld      hl,($91df)
7dd0 eb        ex      de,hl
7dd1 2ae191    ld      hl,($91e1)
7dd4 1a        ld      a,(de)
7dd5 9e        sbc     a,(hl)
7dd6 12        ld      (de),a
7dd7 1b        dec     de
7dd8 2b        dec     hl
7dd9 05        dec     b
7dda c2d47d    jp      nz,$7dd4
7ddd 1a        ld      a,(de)
7dde de00      sbc     a,$00
7de0 12        ld      (de),a
7de1 1b        dec     de
7de2 0d        dec     c
7de3 f2dd7d    jp      p,$7ddd
7de6 eb        ex      de,hl
7de7 c3057e    jp      $7e05
7dea 0607      ld      b,$07
7dec 2ae191    ld      hl,($91e1)
7def eb        ex      de,hl
7df0 2adf91    ld      hl,($91df)
7df3 1a        ld      a,(de)
7df4 9e        sbc     a,(hl)
7df5 77        ld      (hl),a
7df6 1b        dec     de
7df7 2b        dec     hl
7df8 05        dec     b
7df9 c2f37d    jp      nz,$7df3
7dfc 3e00      ld      a,$00
7dfe 9e        sbc     a,(hl)
7dff 77        ld      (hl),a
7e00 2b        dec     hl
7e01 0d        dec     c
7e02 f2fc7d    jp      p,$7dfc
7e05 23        inc     hl
7e06 7e        ld      a,(hl)
7e07 b7        or      a
7e08 3e01      ld      a,$01
7e0a f21c7e    jp      p,$7e1c
7e0d 110f00    ld      de,$000f
7e10 19        add     hl,de
7e11 3e00      ld      a,$00
7e13 9e        sbc     a,(hl)
7e14 77        ld      (hl),a
7e15 2b        dec     hl
7e16 1d        dec     e
7e17 f2117e    jp      p,$7e11
7e1a 3e81      ld      a,$81
7e1c 2a3690    ld      hl,($9036)
7e1f 77        ld      (hl),a
7e20 c39180    jp      $8091
7e23 0607      ld      b,$07
7e25 2adf91    ld      hl,($91df)
7e28 eb        ex      de,hl
7e29 2ae191    ld      hl,($91e1)
7e2c 1a        ld      a,(de)
7e2d 8e        adc     a,(hl)
7e2e 12        ld      (de),a
7e2f 1b        dec     de
7e30 2b        dec     hl
7e31 05        dec     b
7e32 c22c7e    jp      nz,$7e2c
7e35 1a        ld      a,(de)
7e36 ce00      adc     a,$00
7e38 12        ld      (de),a
7e39 1b        dec     de
7e3a 0d        dec     c
7e3b f2357e    jp      p,$7e35
7e3e c39180    jp      $8091
7e41 c5        push    bc
7e42 2a3690    ld      hl,($9036)
7e45 eb        ex      de,hl
7e46 2a3890    ld      hl,($9038)
7e49 1a        ld      a,(de)
7e4a ae        xor     (hl)
7e4b 12        ld      (de),a
7e4c 23        inc     hl
7e4d 13        inc     de
7e4e 1a        ld      a,(de)
7e4f 96        sub     (hl)
7e50 4f        ld      c,a
7e51 d5        push    de
7e52 e5        push    hl
7e53 7e        ld      a,(hl)
7e54 fec0      cp      $c0
7e56 c25e7e    jp      nz,$7e5e
7e59 e1        pop     hl
7e5a e1        pop     hl
7e5b c31c81    jp      $811c
7e5e 13        inc     de
7e5f 23        inc     hl
7e60 0608      ld      b,$08
7e62 13        inc     de
7e63 23        inc     hl
7e64 1a        ld      a,(de)
7e65 be        cp      (hl)
7e66 c27d7e    jp      nz,$7e7d
7e69 05        dec     b
7e6a c2627e    jp      nz,$7e62
7e6d e1        pop     hl
7e6e e1        pop     hl
7e6f 0c        inc     c
7e70 71        ld      (hl),c
7e71 23        inc     hl
7e72 3600      ld      (hl),$00
7e74 23        inc     hl
7e75 3601      ld      (hl),$01
7e77 0608      ld      b,$08
7e79 af        xor     a
7e7a c3b580    jp      $80b5
7e7d d1        pop     de
7e7e e1        pop     hl
7e7f 71        ld      (hl),c
7e80 da867e    jp      c,$7e86
7e83 0c        inc     c
7e84 71        ld      (hl),c
7e85 2b        dec     hl
7e86 d5        push    de
7e87 110900    ld      de,$0009
7e8a 19        add     hl,de
7e8b 0608      ld      b,$08
7e8d 111192    ld      de,$9211
7e90 7e        ld      a,(hl)
7e91 12        ld      (de),a
7e92 2b        dec     hl
7e93 13        inc     de
7e94 05        dec     b
7e95 c2907e    jp      nz,$7e90
7e98 e1        pop     hl
7e99 110900    ld      de,$0009
7e9c 19        add     hl,de
7e9d 0608      ld      b,$08
7e9f 111992    ld      de,$9219
7ea2 7e        ld      a,(hl)
7ea3 12        ld      (de),a
7ea4 2b        dec     hl
7ea5 13        inc     de
7ea6 05        dec     b
7ea7 c2a27e    jp      nz,$7ea2
7eaa 0608      ld      b,$08
7eac 210992    ld      hl,$9209
7eaf af        xor     a
7eb0 77        ld      (hl),a
7eb1 23        inc     hl
7eb2 05        dec     b
7eb3 c2b07e    jp      nz,$7eb0
7eb6 3e40      ld      a,$40
7eb8 320892    ld      ($9208),a
7ebb 210992    ld      hl,$9209
7ebe 0610      ld      b,$10
7ec0 b7        or      a
7ec1 7e        ld      a,(hl)
7ec2 8f        adc     a,a
7ec3 77        ld      (hl),a
7ec4 23        inc     hl
7ec5 05        dec     b
7ec6 c2c17e    jp      nz,$7ec1
7ec9 9f        sbc     a,a
7eca e601      and     $01
7ecc 4f        ld      c,a
7ecd 0608      ld      b,$08
7ecf 111192    ld      de,$9211
7ed2 211992    ld      hl,$9219
7ed5 b7        or      a
7ed6 1a        ld      a,(de)
7ed7 9e        sbc     a,(hl)
7ed8 12        ld      (de),a
7ed9 13        inc     de
7eda 23        inc     hl
7edb 05        dec     b
7edc c2d67e    jp      nz,$7ed6
7edf 79        ld      a,c
7ee0 de00      sbc     a,$00
7ee2 c2f37e    jp      nz,$7ef3
7ee5 210992    ld      hl,$9209
7ee8 34        inc     (hl)
7ee9 210892    ld      hl,$9208
7eec 35        dec     (hl)
7eed c2bb7e    jp      nz,$7ebb
7ef0 c3257f    jp      $7f25
7ef3 210892    ld      hl,$9208
7ef6 35        dec     (hl)
7ef7 ca257f    jp      z,$7f25
7efa 210992    ld      hl,$9209
7efd 0610      ld      b,$10
7eff b7        or      a
7f00 7e        ld      a,(hl)
7f01 8f        adc     a,a
7f02 77        ld      (hl),a
7f03 23        inc     hl
7f04 05        dec     b
7f05 c2007f    jp      nz,$7f00
7f08 9f        sbc     a,a
7f09 4f        ld      c,a
7f0a 0608      ld      b,$08
7f0c 111192    ld      de,$9211
7f0f 211992    ld      hl,$9219
7f12 b7        or      a
7f13 1a        ld      a,(de)
7f14 8e        adc     a,(hl)
7f15 12        ld      (de),a
7f16 13        inc     de
7f17 23        inc     hl
7f18 05        dec     b
7f19 c2137f    jp      nz,$7f13
7f1c 79        ld      a,c
7f1d ce00      adc     a,$00
7f1f c2f37e    jp      nz,$7ef3
7f22 c3e57e    jp      $7ee5
7f25 2a3690    ld      hl,($9036)
7f28 110c00    ld      de,$000c
7f2b 19        add     hl,de
7f2c 3600      ld      (hl),$00
7f2e 2b        dec     hl
7f2f 3600      ld      (hl),$00
7f31 110992    ld      de,$9209
7f34 0608      ld      b,$08
7f36 2b        dec     hl
7f37 1a        ld      a,(de)
7f38 77        ld      (hl),a
7f39 13        inc     de
7f3a 05        dec     b
7f3b c2367f    jp      nz,$7f36
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
7f4f fec0      cp      $c0
7f51 caab80    jp      z,$80ab
7f54 86        add     a,(hl)
7f55 12        ld      (de),a
7f56 7e        ld      a,(hl)
7f57 fec0      cp      $c0
7f59 caab80    jp      z,$80ab
7f5c d5        push    de
7f5d 110900    ld      de,$0009
7f60 19        add     hl,de
7f61 0608      ld      b,$08
7f63 111992    ld      de,$9219
7f66 7e        ld      a,(hl)
7f67 12        ld      (de),a
7f68 2b        dec     hl
7f69 13        inc     de
7f6a 05        dec     b
7f6b c2667f    jp      nz,$7f66
7f6e e1        pop     hl
7f6f 110900    ld      de,$0009
7f72 19        add     hl,de
7f73 0608      ld      b,$08
7f75 111192    ld      de,$9211
7f78 7e        ld      a,(hl)
7f79 12        ld      (de),a
7f7a 2b        dec     hl
7f7b 13        inc     de
7f7c 05        dec     b
7f7d c2787f    jp      nz,$7f78
7f80 0608      ld      b,$08
7f82 210992    ld      hl,$9209
7f85 af        xor     a
7f86 77        ld      (hl),a
7f87 23        inc     hl
7f88 05        dec     b
7f89 c2867f    jp      nz,$7f86
7f8c 3e40      ld      a,$40
7f8e 320892    ld      ($9208),a
7f91 210992    ld      hl,$9209
7f94 0610      ld      b,$10
7f96 b7        or      a
7f97 7e        ld      a,(hl)
7f98 8f        adc     a,a
7f99 77        ld      (hl),a
7f9a 23        inc     hl
7f9b 05        dec     b
7f9c c2977f    jp      nz,$7f97
7f9f d2c27f    jp      nc,$7fc2
7fa2 0608      ld      b,$08
7fa4 110992    ld      de,$9209
7fa7 211992    ld      hl,$9219
7faa b7        or      a
7fab 1a        ld      a,(de)
7fac 8e        adc     a,(hl)
7fad 12        ld      (de),a
7fae 13        inc     de
7faf 23        inc     hl
7fb0 05        dec     b
7fb1 c2ab7f    jp      nz,$7fab
7fb4 0608      ld      b,$08
7fb6 1a        ld      a,(de)
7fb7 ce00      adc     a,$00
7fb9 12        ld      (de),a
7fba d2c27f    jp      nc,$7fc2
7fbd 13        inc     de
7fbe 05        dec     b
7fbf c2b67f    jp      nz,$7fb6
7fc2 210892    ld      hl,$9208
7fc5 35        dec     (hl)
7fc6 c2917f    jp      nz,$7f91
7fc9 2a3690    ld      hl,($9036)
7fcc 110c00    ld      de,$000c
7fcf 19        add     hl,de
7fd0 110f92    ld      de,$920f
7fd3 060a      ld      b,$0a
7fd5 1a        ld      a,(de)
7fd6 77        ld      (hl),a
7fd7 13        inc     de
7fd8 2b        dec     hl
7fd9 05        dec     b
7fda c2d57f    jp      nz,$7fd5
7fdd c39180    jp      $8091
7fe0 cd2f7d    call    $7d2f
7fe3 ca4d85    jp      z,$854d
7fe6 c34185    jp      $8541
7fe9 cd2f7d    call    $7d2f
7fec ca4185    jp      z,$8541
7fef c34d85    jp      $854d
7ff2 cd2f7d    call    $7d2f
7ff5 fa4d85    jp      m,$854d
7ff8 c34185    jp      $8541
7ffb cd2f7d    call    $7d2f
7ffe fa4d85    jp      m,$854d
8001 ca4d85    jp      z,$854d
8004 c34185    jp      $8541
8007 cd2f7d    call    $7d2f
800a fa4185    jp      m,$8541
800d c34d85    jp      $854d
8010 cd2f7d    call    $7d2f
8013 fa4185    jp      m,$8541
8016 ca4185    jp      z,$8541
8019 c34d85    jp      $854d
801c c5        push    bc
801d 7c        ld      a,h
801e b5        or      l
801f caab80    jp      z,$80ab
8022 eb        ex      de,hl
8023 0600      ld      b,$00
8025 c33e80    jp      $803e
8028 c5        push    bc
8029 7c        ld      a,h
802a b5        or      l
802b caab80    jp      z,$80ab
802e eb        ex      de,hl
802f 0600      ld      b,$00
8031 7a        ld      a,d
8032 b7        or      a
8033 f23e80    jp      p,$803e
8036 2f        cpl     
8037 57        ld      d,a
8038 7b        ld      a,e
8039 2f        cpl     
803a 5f        ld      e,a
803b 13        inc     de
803c 0680      ld      b,$80
803e 2a3690    ld      hl,($9036)
8041 70        ld      (hl),b
8042 23        inc     hl
8043 7a        ld      a,d
8044 b7        or      a
8045 c25580    jp      nz,$8055
8048 3601      ld      (hl),$01
804a 23        inc     hl
804b 3600      ld      (hl),$00
804d 23        inc     hl
804e 73        ld      (hl),e
804f 0607      ld      b,$07
8051 af        xor     a
8052 c36180    jp      $8061
8055 3602      ld      (hl),$02
8057 23        inc     hl
8058 3600      ld      (hl),$00
805a 23        inc     hl
805b 72        ld      (hl),d
805c 23        inc     hl
805d 73        ld      (hl),e
805e 0606      ld      b,$06
8060 af        xor     a
8061 23        inc     hl
8062 77        ld      (hl),a
8063 05        dec     b
8064 c26180    jp      nz,$8061
8067 c3ef80    jp      $80ef
806a 2a3690    ld      hl,($9036)
806d 110a00    ld      de,$000a
8070 19        add     hl,de
8071 7e        ld      a,(hl)
8072 fe80      cp      $80
8074 d8        ret     c

8075 c27e80    jp      nz,$807e
8078 2b        dec     hl
8079 7e        ld      a,(hl)
807a f601      or      $01
807c 77        ld      (hl),a
807d c9        ret     

807e c5        push    bc
807f 010008    ld      bc,$0800
8082 37        scf     
8083 2b        dec     hl
8084 7e        ld      a,(hl)
8085 89        adc     a,c
8086 77        ld      (hl),a
8087 05        dec     b
8088 c28380    jp      nz,$8083
808b b7        or      a
808c c29180    jp      nz,$8091
808f c1        pop     bc
8090 c9        ret     

8091 2a3690    ld      hl,($9036)
8094 23        inc     hl
8095 7e        ld      a,(hl)
8096 54        ld      d,h
8097 5d        ld      e,l
8098 23        inc     hl
8099 4f        ld      c,a
809a af        xor     a
809b be        cp      (hl)
809c c2f180    jp      nz,$80f1
809f 0608      ld      b,$08
80a1 23        inc     hl
80a2 be        cp      (hl)
80a3 c2bd80    jp      nz,$80bd
80a6 0d        dec     c
80a7 05        dec     b
80a8 c2a180    jp      nz,$80a1
80ab af        xor     a
80ac 2a3690    ld      hl,($9036)
80af 060a      ld      b,$0a
80b1 77        ld      (hl),a
80b2 23        inc     hl
80b3 36c0      ld      (hl),$c0
80b5 23        inc     hl
80b6 77        ld      (hl),a
80b7 05        dec     b
80b8 c2b580    jp      nz,$80b5
80bb c1        pop     bc
80bc c9        ret     

80bd 3e08      ld      a,$08
80bf 90        sub     b
80c0 47        ld      b,a
80c1 cadd80    jp      z,$80dd
80c4 2b        dec     hl
80c5 79        ld      a,c
80c6 12        ld      (de),a
80c7 d5        push    de
80c8 13        inc     de
80c9 3e0f      ld      a,$0f
80cb 90        sub     b
80cc 4f        ld      c,a
80cd 7e        ld      a,(hl)
80ce 12        ld      (de),a
80cf 13        inc     de
80d0 23        inc     hl
80d1 0d        dec     c
80d2 c2cd80    jp      nz,$80cd
80d5 af        xor     a
80d6 12        ld      (de),a
80d7 13        inc     de
80d8 05        dec     b
80d9 c2d680    jp      nz,$80d6
80dc d1        pop     de
80dd 1a        ld      a,(de)
80de b7        or      a
80df faea80    jp      m,$80ea
80e2 fe40      cp      $40
80e4 daef80    jp      c,$80ef
80e7 c31c81    jp      $811c
80ea fec1      cp      $c1
80ec da0b81    jp      c,$810b
80ef c1        pop     bc
80f0 c9        ret     

80f1 0c        inc     c
80f2 79        ld      a,c
80f3 12        ld      (de),a
80f4 060f      ld      b,$0f
80f6 d5        push    de
80f7 211000    ld      hl,$0010
80fa 19        add     hl,de
80fb 54        ld      d,h
80fc 5d        ld      e,l
80fd 1b        dec     de
80fe 1a        ld      a,(de)
80ff 77        ld      (hl),a
8100 2b        dec     hl
8101 05        dec     b
8102 c2fd80    jp      nz,$80fd
8105 3600      ld      (hl),$00
8107 d1        pop     de
8108 c3dd80    jp      $80dd
810b af        xor     a
810c 2a3690    ld      hl,($9036)
810f 23        inc     hl
8110 36c1      ld      (hl),$c1
8112 23        inc     hl
8113 77        ld      (hl),a
8114 23        inc     hl
8115 3601      ld      (hl),$01
8117 0608      ld      b,$08
8119 c3b580    jp      $80b5
811c 2a3690    ld      hl,($9036)
811f 23        inc     hl
8120 363f      ld      (hl),$3f
8122 23        inc     hl
8123 3600      ld      (hl),$00
8125 3eff      ld      a,$ff
8127 0607      ld      b,$07
8129 23        inc     hl
812a 77        ld      (hl),a
812b 05        dec     b
812c c22981    jp      nz,$8129
812f 23        inc     hl
8130 3600      ld      (hl),$00
8132 c1        pop     bc
8133 c9        ret     

8134 c5        push    bc
8135 2a3690    ld      hl,($9036)
8138 3600      ld      (hl),$00
813a 23        inc     hl
813b 3603      ld      (hl),$03
813d 110400    ld      de,$0004
8140 19        add     hl,de
8141 5d        ld      e,l
8142 54        ld      d,h
8143 0605      ld      b,$05
8145 af        xor     a
8146 23        inc     hl
8147 77        ld      (hl),a
8148 05        dec     b
8149 c24681    jp      nz,$8146
814c 0604      ld      b,$04
814e 2a3290    ld      hl,($9032)
8151 23        inc     hl
8152 23        inc     hl
8153 23        inc     hl
8154 7e        ld      a,(hl)
8155 2a3290    ld      hl,($9032)
8158 b7        or      a
8159 f26d81    jp      p,$816d
815c 3e00      ld      a,$00
815e 9e        sbc     a,(hl)
815f 12        ld      (de),a
8160 23        inc     hl
8161 1b        dec     de
8162 05        dec     b
8163 c25c81    jp      nz,$815c
8166 1b        dec     de
8167 3e80      ld      a,$80
8169 12        ld      (de),a
816a c39180    jp      $8091
816d 7e        ld      a,(hl)
816e 12        ld      (de),a
816f 23        inc     hl
8170 1b        dec     de
8171 05        dec     b
8172 c26d81    jp      nz,$816d
8175 c39180    jp      $8091
8178 c5        push    bc
8179 2a3290    ld      hl,($9032)
817c 54        ld      d,h
817d 5d        ld      e,l
817e af        xor     a
817f 77        ld      (hl),a
8180 23        inc     hl
8181 77        ld      (hl),a
8182 23        inc     hl
8183 77        ld      (hl),a
8184 23        inc     hl
8185 77        ld      (hl),a
8186 2a3690    ld      hl,($9036)
8189 4e        ld      c,(hl)
818a 23        inc     hl
818b 7e        ld      a,(hl)
818c b7        or      a
818d caef80    jp      z,$80ef
8190 faef80    jp      m,$80ef
8193 fe05      cp      $05
8195 d2be81    jp      nc,$81be
8198 47        ld      b,a
8199 23        inc     hl
819a 85        add     a,l
819b 6f        ld      l,a
819c d2a081    jp      nc,$81a0
819f 24        inc     h
81a0 7e        ld      a,(hl)
81a1 12        ld      (de),a
81a2 13        inc     de
81a3 2b        dec     hl
81a4 05        dec     b
81a5 c2a081    jp      nz,$81a0
81a8 79        ld      a,c
81a9 b7        or      a
81aa f2ef80    jp      p,$80ef
81ad 0604      ld      b,$04
81af 2a3290    ld      hl,($9032)
81b2 3e00      ld      a,$00
81b4 9e        sbc     a,(hl)
81b5 77        ld      (hl),a
81b6 23        inc     hl
81b7 05        dec     b
81b8 c2b281    jp      nz,$81b2
81bb c3ef80    jp      $80ef
81be eb        ex      de,hl
81bf 79        ld      a,c
81c0 b7        or      a
81c1 fad281    jp      m,$81d2
81c4 367f      ld      (hl),$7f
81c6 23        inc     hl
81c7 36ff      ld      (hl),$ff
81c9 23        inc     hl
81ca 36ff      ld      (hl),$ff
81cc 23        inc     hl
81cd 36ff      ld      (hl),$ff
81cf c33982    jp      $8239
81d2 3680      ld      (hl),$80
81d4 23        inc     hl
81d5 3600      ld      (hl),$00
81d7 23        inc     hl
81d8 3600      ld      (hl),$00
81da 23        inc     hl
81db 3600      ld      (hl),$00
81dd c33982    jp      $8239
81e0 c5        push    bc
81e1 0e00      ld      c,$00
81e3 c3e981    jp      $81e9
81e6 c5        push    bc
81e7 0e01      ld      c,$01
81e9 2a3690    ld      hl,($9036)
81ec 46        ld      b,(hl)
81ed 23        inc     hl
81ee 7e        ld      a,(hl)
81ef b7        or      a
81f0 caf681    jp      z,$81f6
81f3 f2fc81    jp      p,$81fc
81f6 210000    ld      hl,$0000
81f9 c3ef80    jp      $80ef
81fc fe03      cp      $03
81fe d22082    jp      nc,$8220
8201 23        inc     hl
8202 85        add     a,l
8203 6f        ld      l,a
8204 d20882    jp      nc,$8208
8207 24        inc     h
8208 5e        ld      e,(hl)
8209 2b        dec     hl
820a 56        ld      d,(hl)
820b eb        ex      de,hl
820c 79        ld      a,c
820d b7        or      a
820e caef80    jp      z,$80ef
8211 78        ld      a,b
8212 b7        or      a
8213 f2ef80    jp      p,$80ef
8216 7c        ld      a,h
8217 2f        cpl     
8218 67        ld      h,a
8219 7d        ld      a,l
821a 2f        cpl     
821b 6f        ld      l,a
821c 23        inc     hl
821d c3ef80    jp      $80ef
8220 79        ld      a,c
8221 b7        or      a
8222 c22b82    jp      nz,$822b
8225 21ffff    ld      hl,$ffff
8228 c33982    jp      $8239
822b 78        ld      a,b
822c b7        or      a
822d fa3682    jp      m,$8236
8230 21ff7f    ld      hl,$7fff
8233 c33982    jp      $8239
8236 210080    ld      hl,$8000
8239 c1        pop     bc
823a c9        ret     

823b 40        ld      b,b
823c 80        add     a,b
823d 00        nop     
823e 00        nop     
823f 00        nop     
8240 00        nop     
8241 00        nop     
8242 00        nop     
8243 40        ld      b,b
8244 0c        inc     c
8245 cccccc    call    z,$cccc
8248 cccccd    call    z,$cdcc
824b 40        ld      b,b
824c 0147ae    ld      bc,$ae47
824f 14        inc     d
8250 7a        ld      a,d
8251 e1        pop     hl
8252 48        ld      c,b
8253 3f        ccf     
8254 20c4      jr      nz,$821a
8256 9b        sbc     a,e
8257 a5        and     l
8258 e3        ex      (sp),hl
8259 54        ld      d,h
825a 00        nop     
825b 3f        ccf     
825c 03        inc     bc
825d 46        ld      b,(hl)
825e dc5d63    call    c,$635d
8261 88        adc     a,b
8262 66        ld      h,(hl)
8263 3e53      ld      a,$53
8265 e2d623    jp      po,$23d6
8268 8d        adc     a,l
8269 a3        and     e
826a cd3e08    call    $083e
826d 63        ld      h,e
826e 7b        ld      a,e
826f d0        ret     nc

8270 5a        ld      e,d
8271 f6c8      or      $c8
8273 3d        dec     a
8274 d6bf      sub     $bf
8276 94        sub     h
8277 d5        push    de
8278 e5        push    hl
8279 7a        ld      a,d
827a 66        ld      h,(hl)
827b 3d        dec     a
827c 15        dec     d
827d 79        ld      a,c
827e 8e        adc     a,(hl)
827f e2308c    jp      po,$8c30
8282 3d        dec     a
8283 3d        dec     a
8284 02        ld      (bc),a
8285 25        dec     h
8286 c1        pop     bc
8287 7d        ld      a,l
8288 04        inc     b
8289 dad33c    jp      c,$3cd3
828c 36f9      ld      (hl),$f9
828e bf        cp      a
828f b3        or      e
8290 af        xor     a
8291 7b        ld      a,e
8292 80        add     a,b
8293 3c        inc     a
8294 05        dec     b
8295 7f        ld      a,a
8296 5f        ld      e,a
8297 f8        ret     m

8298 5e        ld      e,(hl)
8299 59        ld      e,c
829a 263b      ld      h,$3b
829c 8c        adc     a,h
829d bc        cp      h
829e cc096f    call    z,$6f09
82a1 50        ld      d,b
82a2 9a        sbc     a,d
82a3 3b        dec     sp
82a4 0e12      ld      c,$12
82a6 e1        pop     hl
82a7 34        inc     (hl)
82a8 24        inc     h
82a9 bb        cp      e
82aa 43        ld      b,e
82ab 3b        dec     sp
82ac 016849    ld      bc,$4968
82af b8        cp      b
82b0 6a        ld      l,d
82b1 12        ld      (de),a
82b2 ba        cp      d
82b3 3a2407    ld      a,($0724)
82b6 5f        ld      e,a
82b7 3d        dec     a
82b8 ceac      adc     a,$ac
82ba 33        inc     sp
82bb 3a039a    ld      a,($9a03)
82be 56        ld      d,(hl)
82bf 52        ld      d,d
82c0 fb        ei      
82c1 1138c5    ld      de,$c538
82c4 210c00    ld      hl,$000c
82c7 39        add     hl,sp
82c8 5e        ld      e,(hl)
82c9 23        inc     hl
82ca 56        ld      d,(hl)
82cb eb        ex      de,hl
82cc 222192    ld      ($9221),hl
82cf 210400    ld      hl,$0004
82d2 39        add     hl,sp
82d3 cd667c    call    $7c66
82d6 210f00    ld      hl,$000f
82d9 222392    ld      ($9223),hl
82dc 2a3690    ld      hl,($9036)
82df 7e        ld      a,(hl)
82e0 b7        or      a
82e1 f2f082    jp      p,$82f0
82e4 cd127d    call    $7d12
82e7 2a2192    ld      hl,($9221)
82ea 362d      ld      (hl),$2d
82ec 23        inc     hl
82ed 222192    ld      ($9221),hl
82f0 010000    ld      bc,$0000
82f3 cd1a7d    call    $7d1a
82f6 ca7683    jp      z,$8376
82f9 cd517c    call    $7c51
82fc 41        ld      b,c
82fd 0a        ld      a,(bc)
82fe 00        nop     
82ff 00        nop     
8300 00        nop     
8301 00        nop     
8302 00        nop     
8303 00        nop     
8304 2a3690    ld      hl,($9036)
8307 23        inc     hl
8308 7e        ld      a,(hl)
8309 fe01      cp      $01
830b fa6f83    jp      m,$836f
830e ca5683    jp      z,$8356
8311 fe02      cp      $02
8313 c21e83    jp      nz,$831e
8316 23        inc     hl
8317 23        inc     hl
8318 7e        ld      a,(hl)
8319 fe27      cp      $27
831b da5e83    jp      c,$835e
831e cd6f84    call    $846f
8321 cd517c    call    $7c51
8324 40        ld      b,b
8325 19        add     hl,de
8326 99        sbc     a,c
8327 99        sbc     a,c
8328 99        sbc     a,c
8329 99        sbc     a,c
832a 99        sbc     a,c
832b 9a        sbc     a,d
832c cd7b84    call    $847b
832f 03        inc     bc
8330 cdf27f    call    $7ff2
8333 c22c83    jp      nz,$832c
8336 cd6f84    call    $846f
8339 2a3690    ld      hl,($9036)
833c 23        inc     hl
833d 23        inc     hl
833e 23        inc     hl
833f 7e        ld      a,(hl)
8340 fe0a      cp      $0a
8342 da7683    jp      c,$8376
8345 0b        dec     bc
8346 cd7b84    call    $847b
8349 c37683    jp      $8376
834c 2a3690    ld      hl,($9036)
834f 23        inc     hl
8350 7e        ld      a,(hl)
8351 fe01      cp      $01
8353 c25e83    jp      nz,$835e
8356 23        inc     hl
8357 23        inc     hl
8358 7e        ld      a,(hl)
8359 fe0a      cp      $0a
835b da7683    jp      c,$8376
835e cd417e    call    $7e41
8361 03        inc     bc
8362 c34c83    jp      $834c
8365 2a3690    ld      hl,($9036)
8368 23        inc     hl
8369 7e        ld      a,(hl)
836a fe01      cp      $01
836c f27683    jp      p,$8376
836f cd7b84    call    $847b
8372 0b        dec     bc
8373 c36583    jp      $8365
8376 2a2392    ld      hl,($9223)
8379 2b        dec     hl
837a 29        add     hl,hl
837b 29        add     hl,hl
837c 29        add     hl,hl
837d 113b82    ld      de,$823b
8380 19        add     hl,de
8381 cd587c    call    $7c58
8384 cd6c7d    call    $7d6c
8387 cd517c    call    $7c51
838a 41        ld      b,c
838b 0a        ld      a,(bc)
838c 00        nop     
838d 00        nop     
838e 00        nop     
838f 00        nop     
8390 00        nop     
8391 00        nop     
8392 cd0780    call    $8007
8395 caa683    jp      z,$83a6
8398 210100    ld      hl,$0001
839b cd1c80    call    $801c
839e 03        inc     bc
839f 2a2392    ld      hl,($9223)
83a2 23        inc     hl
83a3 222392    ld      ($9223),hl
83a6 60        ld      h,b
83a7 69        ld      l,c
83a8 222592    ld      ($9225),hl
83ab 3eff      ld      a,$ff
83ad 322792    ld      ($9227),a
83b0 78        ld      a,b
83b1 b7        or      a
83b2 fabe83    jp      m,$83be
83b5 79        ld      a,c
83b6 fe0f      cp      $0f
83b8 d2c583    jp      nc,$83c5
83bb c3e583    jp      $83e5
83be 79        ld      a,c
83bf 2f        cpl     
83c0 fe01      cp      $01
83c2 dacc83    jp      c,$83cc
83c5 af        xor     a
83c6 322792    ld      ($9227),a
83c9 c3e583    jp      $83e5
83cc 2a2192    ld      hl,($9221)
83cf 3630      ld      (hl),$30
83d1 23        inc     hl
83d2 362e      ld      (hl),$2e
83d4 23        inc     hl
83d5 b7        or      a
83d6 cae083    jp      z,$83e0
83d9 3630      ld      (hl),$30
83db 23        inc     hl
83dc 3d        dec     a
83dd c2d983    jp      nz,$83d9
83e0 222192    ld      ($9221),hl
83e3 3eff      ld      a,$ff
83e5 4f        ld      c,a
83e6 06ff      ld      b,$ff
83e8 04        inc     b
83e9 3a2392    ld      a,($9223)
83ec b8        cp      b
83ed da1a84    jp      c,$841a
83f0 ca1a84    jp      z,$841a
83f3 2a3690    ld      hl,($9036)
83f6 23        inc     hl
83f7 7e        ld      a,(hl)
83f8 fe01      cp      $01
83fa 3e30      ld      a,$30
83fc c20484    jp      nz,$8404
83ff 23        inc     hl
8400 23        inc     hl
8401 86        add     a,(hl)
8402 3600      ld      (hl),$00
8404 2a2192    ld      hl,($9221)
8407 77        ld      (hl),a
8408 23        inc     hl
8409 78        ld      a,b
840a b9        cp      c
840b c21184    jp      nz,$8411
840e 362e      ld      (hl),$2e
8410 23        inc     hl
8411 222192    ld      ($9221),hl
8414 cd7b84    call    $847b
8417 c3e883    jp      $83e8
841a 2a2192    ld      hl,($9221)
841d 2b        dec     hl
841e 7e        ld      a,(hl)
841f fe30      cp      $30
8421 ca1d84    jp      z,$841d
8424 3a2792    ld      a,($9227)
8427 b7        or      a
8428 ca3584    jp      z,$8435
842b 7e        ld      a,(hl)
842c fe2e      cp      $2e
842e ca6b84    jp      z,$846b
8431 23        inc     hl
8432 c36b84    jp      $846b
8435 23        inc     hl
8436 3665      ld      (hl),$65
8438 23        inc     hl
8439 362b      ld      (hl),$2b
843b 3a2692    ld      a,($9226)
843e b7        or      a
843f 3a2592    ld      a,($9225)
8442 f24984    jp      p,$8449
8445 362d      ld      (hl),$2d
8447 2f        cpl     
8448 3c        inc     a
8449 23        inc     hl
844a fe64      cp      $64
844c da5484    jp      c,$8454
844f 3631      ld      (hl),$31
8451 23        inc     hl
8452 d664      sub     $64
8454 0600      ld      b,$00
8456 fe0a      cp      $0a
8458 da6184    jp      c,$8461
845b 04        inc     b
845c d60a      sub     $0a
845e c35684    jp      $8456
8461 c630      add     a,$30
8463 5f        ld      e,a
8464 3e30      ld      a,$30
8466 80        add     a,b
8467 77        ld      (hl),a
8468 23        inc     hl
8469 73        ld      (hl),e
846a 23        inc     hl
846b 3600      ld      (hl),$00
846d c1        pop     bc
846e c9        ret     

846f cd037d    call    $7d03
8472 210100    ld      hl,$0001
8475 cd1c80    call    $801c
8478 c3417e    jp      $7e41
847b c5        push    bc
847c 2a3690    ld      hl,($9036)
847f 23        inc     hl
8480 34        inc     (hl)
8481 110900    ld      de,$0009
8484 19        add     hl,de
8485 af        xor     a
8486 0608      ld      b,$08
8488 c5        push    bc
8489 5e        ld      e,(hl)
848a eb        ex      de,hl
848b 2600      ld      h,$00
848d 29        add     hl,hl
848e 44        ld      b,h
848f 4d        ld      c,l
8490 29        add     hl,hl
8491 29        add     hl,hl
8492 09        add     hl,bc
8493 eb        ex      de,hl
8494 83        add     a,e
8495 23        inc     hl
8496 77        ld      (hl),a
8497 7a        ld      a,d
8498 ce00      adc     a,$00
849a 2b        dec     hl
849b 2b        dec     hl
849c c1        pop     bc
849d 05        dec     b
849e c28884    jp      nz,$8488
84a1 23        inc     hl
84a2 77        ld      (hl),a
84a3 b7        or      a
84a4 ca9180    jp      z,$8091
84a7 2b        dec     hl
84a8 2b        dec     hl
84a9 7e        ld      a,(hl)
84aa b7        or      a
84ab fab384    jp      m,$84b3
84ae fe40      cp      $40
84b0 d21c81    jp      nc,$811c
84b3 c1        pop     bc
84b4 c9        ret     

84b5 210200    ld      hl,$0002
84b8 39        add     hl,sp
84b9 7e        ld      a,(hl)
84ba fe20      cp      $20
84bc ca4d85    jp      z,$854d
84bf fe09      cp      $09
84c1 ca4d85    jp      z,$854d
84c4 fe0a      cp      $0a
84c6 ca4d85    jp      z,$854d
84c9 c34185    jp      $8541
84cc c34d85    jp      $854d
84cf c34185    jp      $8541
84d2 210200    ld      hl,$0002
84d5 39        add     hl,sp
84d6 7e        ld      a,(hl)
84d7 fe61      cp      $61
84d9 dae384    jp      c,$84e3
84dc fe7b      cp      $7b
84de d2e384    jp      nc,$84e3
84e1 d620      sub     $20
84e3 6f        ld      l,a
84e4 2600      ld      h,$00
84e6 c9        ret     

84e7 210200    ld      hl,$0002
84ea 39        add     hl,sp
84eb 7e        ld      a,(hl)
84ec fe41      cp      $41
84ee daf884    jp      c,$84f8
84f1 fe5b      cp      $5b
84f3 d2f884    jp      nc,$84f8
84f6 c620      add     a,$20
84f8 6f        ld      l,a
84f9 2600      ld      h,$00
84fb c9        ret     

84fc 7c        ld      a,h
84fd a2        and     d
84fe 67        ld      h,a
84ff 7d        ld      a,l
8500 a3        and     e
8501 6f        ld      l,a
8502 b4        or      h
8503 c9        ret     

8504 e9        jp      (hl)
8505 e1        pop     hl
8506 c5        push    bc
8507 5e        ld      e,(hl)
8508 23        inc     hl
8509 56        ld      d,(hl)
850a 23        inc     hl
850b 44        ld      b,h
850c 4d        ld      c,l
850d 210000    ld      hl,$0000
8510 39        add     hl,sp
8511 eb        ex      de,hl
8512 39        add     hl,sp
8513 f9        ld      sp,hl
8514 d5        push    de
8515 60        ld      h,b
8516 69        ld      l,c
8517 cd0485    call    $8504
851a eb        ex      de,hl
851b e1        pop     hl
851c f9        ld      sp,hl
851d c1        pop     bc
851e eb        ex      de,hl
851f 7c        ld      a,h
8520 b5        or      l
8521 c9        ret     

8522 7a        ld      a,d
8523 ac        xor     h
8524 322992    ld      ($9229),a
8527 cd9385    call    $8593
852a eb        ex      de,hl
852b 3a2992    ld      a,($9229)
852e b7        or      a
852f faec85    jp      m,$85ec
8532 7d        ld      a,l
8533 b4        or      h
8534 c9        ret     

8535 cdac85    call    $85ac
8538 eb        ex      de,hl
8539 7d        ld      a,l
853a b4        or      h
853b c9        ret     

853c a7        and     a
853d ed52      sbc     hl,de
853f 280c      jr      z,$854d
8541 210000    ld      hl,$0000
8544 af        xor     a
8545 54        ld      d,h
8546 5d        ld      e,l
8547 c9        ret     

8548 a7        and     a
8549 ed52      sbc     hl,de
854b 28f4      jr      z,$8541
854d 210100    ld      hl,$0001
8550 7d        ld      a,l
8551 b4        or      h
8552 54        ld      d,h
8553 5d        ld      e,l
8554 c9        ret     

8555 eb        ex      de,hl
8556 7c        ld      a,h
8557 aa        xor     d
8558 fa6485    jp      m,$8564
855b af        xor     a
855c ed52      sbc     hl,de
855e 67        ld      h,a
855f 3f        ccf     
8560 ce00      adc     a,$00
8562 6f        ld      l,a
8563 c9        ret     

8564 7a        ld      a,d
8565 07        rlca    
8566 e601      and     $01
8568 6f        ld      l,a
8569 2600      ld      h,$00
856b c9        ret     

856c eb        ex      de,hl
856d 7c        ld      a,h
856e aa        xor     d
856f fa7a85    jp      m,$857a
8572 af        xor     a
8573 ed52      sbc     hl,de
8575 67        ld      h,a
8576 ce00      adc     a,$00
8578 6f        ld      l,a
8579 c9        ret     

857a 7c        ld      a,h
857b 07        rlca    
857c e601      and     $01
857e 6f        ld      l,a
857f 2600      ld      h,$00
8581 c9        ret     

8582 7a        ld      a,d
8583 322992    ld      ($9229),a
8586 cd9385    call    $8593
8589 3a2992    ld      a,($9229)
858c b7        or      a
858d faec85    jp      m,$85ec
8590 7c        ld      a,h
8591 b5        or      l
8592 c9        ret     

8593 7c        ld      a,h
8594 b7        or      a
8595 f29e85    jp      p,$859e
8598 2f        cpl     
8599 67        ld      h,a
859a 7d        ld      a,l
859b 2f        cpl     
859c 6f        ld      l,a
859d 23        inc     hl
859e 7a        ld      a,d
859f b7        or      a
85a0 f2ac85    jp      p,$85ac
85a3 2f        cpl     
85a4 57        ld      d,a
85a5 7b        ld      a,e
85a6 2f        cpl     
85a7 5f        ld      e,a
85a8 13        inc     de
85a9 c3ac85    jp      $85ac
85ac c5        push    bc
85ad 44        ld      b,h
85ae 4d        ld      c,l
85af 210000    ld      hl,$0000
85b2 3e10      ld      a,$10
85b4 29        add     hl,hl
85b5 eb        ex      de,hl
85b6 29        add     hl,hl
85b7 eb        ex      de,hl
85b8 d2bc85    jp      nc,$85bc
85bb 23        inc     hl
85bc a7        and     a
85bd ed42      sbc     hl,bc
85bf d2cb85    jp      nc,$85cb
85c2 09        add     hl,bc
85c3 3d        dec     a
85c4 c2b485    jp      nz,$85b4
85c7 c1        pop     bc
85c8 7d        ld      a,l
85c9 b4        or      h
85ca c9        ret     

85cb 13        inc     de
85cc 3d        dec     a
85cd c2b485    jp      nz,$85b4
85d0 c1        pop     bc
85d1 7d        ld      a,l
85d2 b4        or      h
85d3 c9        ret     

85d4 c5        push    bc
85d5 44        ld      b,h
85d6 4d        ld      c,l
85d7 210000    ld      hl,$0000
85da 3e10      ld      a,$10
85dc 29        add     hl,hl
85dd eb        ex      de,hl
85de 29        add     hl,hl
85df eb        ex      de,hl
85e0 d2e485    jp      nc,$85e4
85e3 09        add     hl,bc
85e4 3d        dec     a
85e5 c2dc85    jp      nz,$85dc
85e8 c1        pop     bc
85e9 7d        ld      a,l
85ea b4        or      h
85eb c9        ret     

85ec 7d        ld      a,l
85ed 2f        cpl     
85ee 6f        ld      l,a
85ef 7c        ld      a,h
85f0 2f        cpl     
85f1 67        ld      h,a
85f2 23        inc     hl
85f3 7d        ld      a,l
85f4 b4        or      h
85f5 c9        ret     

85f6 7c        ld      a,h
85f7 b5        or      l
85f8 ca4d85    jp      z,$854d
85fb c34185    jp      $8541
85fe 7c        ld      a,h
85ff b2        or      d
8600 67        ld      h,a
8601 7d        ld      a,l
8602 b3        or      e
8603 6f        ld      l,a
8604 b4        or      h
8605 c9        ret     

8606 eb        ex      de,hl
8607 7b        ld      a,e
8608 e61f      and     $1f
860a 5f        ld      e,a
860b ca2d86    jp      z,$862d
860e 7c        ld      a,h
860f b4        or      h
8610 f27786    jp      p,$8677
8613 7c        ld      a,h
8614 37        scf     
8615 1f        rra     
8616 67        ld      h,a
8617 7d        ld      a,l
8618 1f        rra     
8619 6f        ld      l,a
861a 1d        dec     e
861b c21386    jp      nz,$8613
861e b4        or      h
861f c9        ret     

8620 eb        ex      de,hl
8621 7b        ld      a,e
8622 e61f      and     $1f
8624 5f        ld      e,a
8625 ca2d86    jp      z,$862d
8628 29        add     hl,hl
8629 1d        dec     e
862a c22886    jp      nz,$8628
862d 7d        ld      a,l
862e b4        or      h
862f c9        ret     

8630 eb        ex      de,hl
8631 a7        and     a
8632 ed52      sbc     hl,de
8634 c9        ret     

8635 eb        ex      de,hl
8636 e1        pop     hl
8637 c5        push    bc
8638 42        ld      b,d
8639 4b        ld      c,e
863a 5e        ld      e,(hl)
863b 23        inc     hl
863c 56        ld      d,(hl)
863d 1b        dec     de
863e 7a        ld      a,d
863f b7        or      a
8640 fa5586    jp      m,$8655
8643 23        inc     hl
8644 79        ld      a,c
8645 be        cp      (hl)
8646 ca4f86    jp      z,$864f
8649 23        inc     hl
864a 23        inc     hl
864b 23        inc     hl
864c c33d86    jp      $863d
864f 23        inc     hl
8650 78        ld      a,b
8651 be        cp      (hl)
8652 c24a86    jp      nz,$864a
8655 23        inc     hl
8656 7e        ld      a,(hl)
8657 23        inc     hl
8658 66        ld      h,(hl)
8659 6f        ld      l,a
865a c1        pop     bc
865b e9        jp      (hl)
865c eb        ex      de,hl
865d af        xor     a
865e ed52      sbc     hl,de
8660 67        ld      h,a
8661 3f        ccf     
8662 ce00      adc     a,$00
8664 6f        ld      l,a
8665 c9        ret     

8666 eb        ex      de,hl
8667 af        xor     a
8668 ed52      sbc     hl,de
866a 67        ld      h,a
866b ce00      adc     a,$00
866d 6f        ld      l,a
866e c9        ret     

866f eb        ex      de,hl
8670 7b        ld      a,e
8671 e61f      and     $1f
8673 5f        ld      e,a
8674 ca2d86    jp      z,$862d
8677 7c        ld      a,h
8678 b7        or      a
8679 1f        rra     
867a 67        ld      h,a
867b 7d        ld      a,l
867c 1f        rra     
867d 6f        ld      l,a
867e 1d        dec     e
867f c27786    jp      nz,$8677
8682 b4        or      h
8683 c9        ret     

8684 7c        ld      a,h
8685 aa        xor     d
8686 67        ld      h,a
8687 7d        ld      a,l
8688 ab        xor     e
8689 6f        ld      l,a
868a b4        or      h
868b c9        ret     

868c d1        pop     de
868d 210200    ld      hl,$0002
8690 39        add     hl,sp
8691 c5        push    bc
8692 d5        push    de
8693 112a92    ld      de,$922a
8696 010600    ld      bc,$0006
8699 edb0      ldir    
869b 21a086    ld      hl,$86a0
869e e3        ex      (sp),hl
869f e9        jp      (hl)
86a0 c1        pop     bc
86a1 7c        ld      a,h
86a2 b5        or      l
86a3 c9        ret     

86a4 2a0600    ld      hl,($0006)
86a7 f9        ld      sp,hl
86a8 cdf586    call    $86f5
86ab 010000    ld      bc,$0000
86ae cd0500    call    $0005
86b1 c3ab86    jp      $86ab
86b4 cd8c86    call    $868c
86b7 cdbf86    call    $86bf
86ba eb        ex      de,hl
86bb c9        ret     

86bc cd8c86    call    $868c
86bf 2a2a92    ld      hl,($922a)
86c2 44        ld      b,h
86c3 4d        ld      c,l
86c4 2a2c92    ld      hl,($922c)
86c7 eb        ex      de,hl
86c8 cd0500    call    $0005
86cb eb        ex      de,hl
86cc 6f        ld      l,a
86cd 2600      ld      h,$00
86cf c9        ret     

86d0 cd8c86    call    $868c
86d3 cddd86    call    $86dd
86d6 6f        ld      l,a
86d7 2600      ld      h,$00
86d9 c9        ret     

86da cd8c86    call    $868c
86dd 2a2a92    ld      hl,($922a)
86e0 eb        ex      de,hl
86e1 2a0100    ld      hl,($0001)
86e4 2b        dec     hl
86e5 2b        dec     hl
86e6 2b        dec     hl
86e7 19        add     hl,de
86e8 19        add     hl,de
86e9 19        add     hl,de
86ea eb        ex      de,hl
86eb 2a2c92    ld      hl,($922c)
86ee 44        ld      b,h
86ef 4d        ld      c,l
86f0 2a2e92    ld      hl,($922e)
86f3 eb        ex      de,hl
86f4 e9        jp      (hl)
86f5 c30301    jp      $0103
86f8 7e        ld      a,(hl)
86f9 23        inc     hl
86fa 6e        ld      l,(hl)
86fb 67        ld      h,a
86fc 29        add     hl,hl
86fd b5        or      l
86fe c9        ret     

86ff 23        inc     hl
8700 23        inc     hl
8701 7e        ld      a,(hl)
8702 23        inc     hl
8703 66        ld      h,(hl)
8704 6f        ld      l,a
8705 b4        or      h
8706 c9        ret     

8707 c5        push    bc
8708 af        xor     a
8709 323092    ld      ($9230),a
870c 323192    ld      ($9231),a
870f 323292    ld      ($9232),a
8712 6f        ld      l,a
8713 67        ld      h,a
8714 223392    ld      ($9233),hl
8717 cd1c80    call    $801c
871a 210400    ld      hl,$0004
871d 39        add     hl,sp
871e 4e        ld      c,(hl)
871f 23        inc     hl
8720 46        ld      b,(hl)
8721 0a        ld      a,(bc)
8722 fe2d      cp      $2d
8724 c22d87    jp      nz,$872d
8727 323092    ld      ($9230),a
872a c33287    jp      $8732
872d fe2b      cp      $2b
872f c23387    jp      nz,$8733
8732 03        inc     bc
8733 0a        ld      a,(bc)
8734 fe30      cp      $30
8736 da6287    jp      c,$8762
8739 fe3a      cp      $3a
873b d26287    jp      nc,$8762
873e f5        push    af
873f cd7b84    call    $847b
8742 cd037d    call    $7d03
8745 f1        pop     af
8746 d630      sub     $30
8748 6f        ld      l,a
8749 2600      ld      h,$00
874b cd1c80    call    $801c
874e cd6c7d    call    $7d6c
8751 3a3292    ld      a,($9232)
8754 b7        or      a
8755 ca3287    jp      z,$8732
8758 2a3392    ld      hl,($9233)
875b 2b        dec     hl
875c 223392    ld      ($9233),hl
875f c33287    jp      $8732
8762 fe2e      cp      $2e
8764 c27487    jp      nz,$8774
8767 213292    ld      hl,$9232
876a 7e        ld      a,(hl)
876b b7        or      a
876c c27487    jp      nz,$8774
876f 3601      ld      (hl),$01
8771 c33287    jp      $8732
8774 210000    ld      hl,$0000
8777 f620      or      $20
8779 fe65      cp      $65
877b c2c187    jp      nz,$87c1
877e 03        inc     bc
877f 0a        ld      a,(bc)
8780 fe2d      cp      $2d
8782 c28b87    jp      nz,$878b
8785 323192    ld      ($9231),a
8788 c39087    jp      $8790
878b fe2b      cp      $2b
878d c29187    jp      nz,$8791
8790 03        inc     bc
8791 0a        ld      a,(bc)
8792 fe30      cp      $30
8794 daab87    jp      c,$87ab
8797 fe3a      cp      $3a
8799 d2ab87    jp      nc,$87ab
879c d630      sub     $30
879e 29        add     hl,hl
879f 54        ld      d,h
87a0 5d        ld      e,l
87a1 29        add     hl,hl
87a2 29        add     hl,hl
87a3 19        add     hl,de
87a4 5f        ld      e,a
87a5 1600      ld      d,$00
87a7 19        add     hl,de
87a8 c39087    jp      $8790
87ab 3a3192    ld      a,($9231)
87ae b7        or      a
87af cab987    jp      z,$87b9
87b2 7c        ld      a,h
87b3 2f        cpl     
87b4 67        ld      h,a
87b5 7d        ld      a,l
87b6 2f        cpl     
87b7 6f        ld      l,a
87b8 23        inc     hl
87b9 eb        ex      de,hl
87ba 2a3392    ld      hl,($9233)
87bd 19        add     hl,de
87be 223392    ld      ($9233),hl
87c1 2a3392    ld      hl,($9233)
87c4 7c        ld      a,h
87c5 b7        or      a
87c6 f20788    jp      p,$8807
87c9 feff      cp      $ff
87cb c22188    jp      nz,$8821
87ce 7d        ld      a,l
87cf 2f        cpl     
87d0 3c        inc     a
87d1 4f        ld      c,a
87d2 fea6      cp      $a6
87d4 d22188    jp      nc,$8821
87d7 fe96      cp      $96
87d9 daee87    jp      c,$87ee
87dc cd517c    call    $7c51
87df 47        ld      b,a
87e0 23        inc     hl
87e1 86        add     a,(hl)
87e2 f26fc1    jp      p,$c16f
87e5 00        nop     
87e6 00        nop     
87e7 cd417e    call    $7e41
87ea 79        ld      a,c
87eb d610      sub     $10
87ed 4f        ld      c,a
87ee cd037d    call    $7d03
87f1 210100    ld      hl,$0001
87f4 cd1c80    call    $801c
87f7 cd7b84    call    $847b
87fa 0d        dec     c
87fb c2f787    jp      nz,$87f7
87fe cd037d    call    $7d03
8801 cd417e    call    $7e41
8804 c31788    jp      $8817
8807 c22188    jp      nz,$8821
880a 7d        ld      a,l
880b b7        or      a
880c ca1788    jp      z,$8817
880f 4f        ld      c,a
8810 cd7b84    call    $847b
8813 0d        dec     c
8814 c21088    jp      nz,$8810
8817 3a3092    ld      a,($9230)
881a b7        or      a
881b ca2188    jp      z,$8821
881e cd127d    call    $7d12
8821 c1        pop     bc
8822 c9        ret     

8823 cd0585    call    $8505
8826 e8        ret     pe

8827 ff        rst     $38
8828 210000    ld      hl,$0000
882b 44        ld      b,h
882c 4d        ld      c,l
882d 211400    ld      hl,$0014
8830 39        add     hl,sp
8831 e5        push    hl
8832 212200    ld      hl,$0022
8835 39        add     hl,sp
8836 cd667c    call    $7c66
8839 cda77c    call    $7ca7
883c cd2a04    call    $042a
883f cda08b    call    $8ba0
8842 e1        pop     hl
8843 cd857c    call    $7c85
8846 cd517c    call    $7c51
8849 41        ld      b,c
884a 010000    ld      bc,$0000
884d 00        nop     
884e 00        nop     
884f 00        nop     
8850 00        nop     
8851 cd1080    call    $8010
8854 2823      jr      z,$8879
8856 211400    ld      hl,$0014
8859 39        add     hl,sp
885a e5        push    hl
885b cd5f7c    call    $7c5f
885e 41        ld      b,c
885f 010000    ld      bc,$0000
8862 00        nop     
8863 00        nop     
8864 00        nop     
8865 00        nop     
8866 211600    ld      hl,$0016
8869 39        add     hl,sp
886a cd587c    call    $7c58
886d cd417e    call    $7e41
8870 e1        pop     hl
8871 cd857c    call    $7c85
8874 210200    ld      hl,$0002
8877 44        ld      b,h
8878 4d        ld      c,l
8879 211400    ld      hl,$0014
887c 39        add     hl,sp
887d cd667c    call    $7c66
8880 cd517c    call    $7c51
8883 40        ld      b,b
8884 44        ld      b,h
8885 98        sbc     a,b
8886 51        ld      d,c
8887 7a        ld      a,d
8888 7b        ld      a,e
8889 35        dec     (hl)
888a 59        ld      e,c
888b cd1080    call    $8010
888e 2857      jr      z,$88e7
8890 211400    ld      hl,$0014
8893 39        add     hl,sp
8894 e5        push    hl
8895 211600    ld      hl,$0016
8898 39        add     hl,sp
8899 cd667c    call    $7c66
889c cd517c    call    $7c51
889f 41        ld      b,c
88a0 01bb67    ld      bc,$67bb
88a3 ae        xor     (hl)
88a4 85        add     a,l
88a5 84        add     a,h
88a6 cbcd      set     1,l
88a8 6c        ld      l,h
88a9 7d        ld      a,l
88aa cda77c    call    $7ca7
88ad 211e00    ld      hl,$001e
88b0 39        add     hl,sp
88b1 cd667c    call    $7c66
88b4 cd517c    call    $7c51
88b7 40        ld      b,b
88b8 bb        cp      e
88b9 67        ld      h,a
88ba ae        xor     (hl)
88bb 85        add     a,l
88bc 84        add     a,h
88bd caa7cd    jp      z,$cda7
88c0 41        ld      b,c
88c1 7f        ld      a,a
88c2 211e00    ld      hl,$001e
88c5 39        add     hl,sp
88c6 cd587c    call    $7c58
88c9 cd6c7d    call    $7d6c
88cc cd517c    call    $7c51
88cf c1        pop     bc
88d0 010000    ld      bc,$0000
88d3 00        nop     
88d4 00        nop     
88d5 00        nop     
88d6 00        nop     
88d7 cd6c7d    call    $7d6c
88da cdd87c    call    $7cd8
88dd cd417e    call    $7e41
88e0 e1        pop     hl
88e1 cd857c    call    $7c85
88e4 03        inc     bc
88e5 60        ld      h,b
88e6 69        ld      l,c
88e7 211400    ld      hl,$0014
88ea 39        add     hl,sp
88eb cd667c    call    $7c66
88ee cda77c    call    $7ca7
88f1 cd2a04    call    $042a
88f4 cda08b    call    $8ba0
88f7 cd517c    call    $7c51
88fa 3c        inc     a
88fb fce33e    call    m,$3ee3
88fe a0        and     b
88ff f404b6    call    p,$b604
8902 cdf27f    call    $7ff2
8905 2813      jr      z,$891a
8907 210c00    ld      hl,$000c
890a 39        add     hl,sp
890b e5        push    hl
890c 211600    ld      hl,$0016
890f 39        add     hl,sp
8910 cd667c    call    $7c66
8913 e1        pop     hl
8914 cd857c    call    $7c85
8917 c3148a    jp      $8a14
891a 210400    ld      hl,$0004
891d 39        add     hl,sp
891e e5        push    hl
891f 211600    ld      hl,$0016
8922 39        add     hl,sp
8923 cd667c    call    $7c66
8926 211600    ld      hl,$0016
8929 39        add     hl,sp
892a cd587c    call    $7c58
892d cd417f    call    $7f41
8930 e1        pop     hl
8931 cd857c    call    $7c85
8934 210c00    ld      hl,$000c
8937 39        add     hl,sp
8938 e5        push    hl
8939 210600    ld      hl,$0006
893c 39        add     hl,sp
893d cd667c    call    $7c66
8940 cd517c    call    $7c51
8943 41        ld      b,c
8944 0f        rrca    
8945 0624      ld      b,$24
8947 f0        ret     p

8948 a5        and     l
8949 63        ld      h,e
894a 88        adc     a,b
894b cd6c7d    call    $7d6c
894e 210600    ld      hl,$0006
8951 39        add     hl,sp
8952 cd587c    call    $7c58
8955 cd417f    call    $7f41
8958 cd517c    call    $7c51
895b 41        ld      b,c
895c 3b        dec     sp
895d 94        sub     h
895e 14        inc     d
895f 64        ld      h,h
8960 1b        dec     de
8961 47        ld      b,a
8962 ad        xor     l
8963 cd6c7d    call    $7d6c
8966 210600    ld      hl,$0006
8969 39        add     hl,sp
896a cd587c    call    $7c58
896d cd417f    call    $7f41
8970 cd517c    call    $7c51
8973 41        ld      b,c
8974 56        ld      d,(hl)
8975 2848      jr      z,$89bf
8977 102d      djnz    $89a6
8979 b6        or      (hl)
897a 92        sub     d
897b cd6c7d    call    $7d6c
897e 210600    ld      hl,$0006
8981 39        add     hl,sp
8982 cd587c    call    $7c58
8985 cd417f    call    $7f41
8988 cd517c    call    $7c51
898b 41        ld      b,c
898c 29        add     hl,hl
898d 10f9      djnz    $8988
898f 79        ld      a,c
8990 89        adc     a,c
8991 2b        dec     hl
8992 53        ld      d,e
8993 cd6c7d    call    $7d6c
8996 cda77c    call    $7ca7
8999 210e00    ld      hl,$000e
899c 39        add     hl,sp
899d cd667c    call    $7c66
89a0 cd517c    call    $7c51
89a3 c0        ret     nz

89a4 d66b      sub     $6b
89a6 d6cd      sub     $cd
89a8 8c        adc     a,h
89a9 3d        dec     a
89aa e9        jp      (hl)
89ab cd417f    call    $7f41
89ae cd517c    call    $7c51
89b1 c1        pop     bc
89b2 08        ex      af,af'
89b3 7e        ld      a,(hl)
89b4 9f        sbc     a,a
89b5 ae        xor     (hl)
89b6 46        ld      b,(hl)
89b7 b5        or      l
89b8 32cd6c    ld      ($6ccd),a
89bb 7d        ld      a,l
89bc 210e00    ld      hl,$000e
89bf 39        add     hl,sp
89c0 cd587c    call    $7c58
89c3 cd417f    call    $7f41
89c6 cd517c    call    $7c51
89c9 c1        pop     bc
89ca 14        inc     d
89cb 81        add     a,c
89cc 7f        ld      a,a
89cd b9        cp      c
89ce e2bccb    jp      po,$cbbc
89d1 cd6c7d    call    $7d6c
89d4 210e00    ld      hl,$000e
89d7 39        add     hl,sp
89d8 cd587c    call    $7c58
89db cd417f    call    $7f41
89de cd517c    call    $7c51
89e1 c1        pop     bc
89e2 0d        dec     c
89e3 b0        or      b
89e4 53        ld      d,e
89e5 2883      jr      z,$896a
89e7 0e71      ld      c,$71
89e9 cd6c7d    call    $7d6c
89ec 210e00    ld      hl,$000e
89ef 39        add     hl,sp
89f0 cd587c    call    $7c58
89f3 cd417f    call    $7f41
89f6 cdd87c    call    $7cd8
89f9 cd417e    call    $7e41
89fc 211600    ld      hl,$0016
89ff 39        add     hl,sp
8a00 cd587c    call    $7c58
8a03 cd417f    call    $7f41
8a06 211600    ld      hl,$0016
8a09 39        add     hl,sp
8a0a cd587c    call    $7c58
8a0d cd6c7d    call    $7d6c
8a10 e1        pop     hl
8a11 cd857c    call    $7c85
8a14 50        ld      d,b
8a15 59        ld      e,c
8a16 210100    ld      hl,$0001
8a19 cd6d85    call    $856d
8a1c 2813      jr      z,$8a31
8a1e 210c00    ld      hl,$000c
8a21 39        add     hl,sp
8a22 e5        push    hl
8a23 210e00    ld      hl,$000e
8a26 39        add     hl,sp
8a27 cd667c    call    $7c66
8a2a cd127d    call    $7d12
8a2d e1        pop     hl
8a2e cd857c    call    $7c85
8a31 210c00    ld      hl,$000c
8a34 39        add     hl,sp
8a35 e5        push    hl
8a36 60        ld      h,b
8a37 69        ld      l,c
8a38 29        add     hl,hl
8a39 29        add     hl,hl
8a3a 29        add     hl,hl
8a3b 113592    ld      de,$9235
8a3e 19        add     hl,de
8a3f cd667c    call    $7c66
8a42 cd037d    call    $7d03
8a45 e1        pop     hl
8a46 e5        push    hl
8a47 cd667c    call    $7c66
8a4a cd6c7d    call    $7d6c
8a4d e1        pop     hl
8a4e cd857c    call    $7c85
8a51 212000    ld      hl,$0020
8a54 39        add     hl,sp
8a55 cd667c    call    $7c66
8a58 cd517c    call    $7c51
8a5b 00        nop     
8a5c 00        nop     
8a5d 00        nop     
8a5e 00        nop     
8a5f 00        nop     
8a60 00        nop     
8a61 00        nop     
8a62 00        nop     
8a63 cdf27f    call    $7ff2
8a66 280b      jr      z,$8a73
8a68 210c00    ld      hl,$000c
8a6b 39        add     hl,sp
8a6c cd667c    call    $7c66
8a6f cd127d    call    $7d12
8a72 c9        ret     

8a73 210c00    ld      hl,$000c
8a76 39        add     hl,sp
8a77 cd667c    call    $7c66
8a7a c9        ret     

8a7b cda98b    call    $8ba9
8a7e 210800    ld      hl,$0008
8a81 39        add     hl,sp
8a82 cd667c    call    $7c66
8a85 215592    ld      hl,$9255
8a88 cd587c    call    $7c58
8a8b cd6c7d    call    $7d6c
8a8e cda77c    call    $7ca7
8a91 cd988a    call    $8a98
8a94 cda08b    call    $8ba0
8a97 c9        ret     

8a98 cda98b    call    $8ba9
8a9b 210000    ld      hl,$0000
8a9e 44        ld      b,h
8a9f 4d        ld      c,l
8aa0 21cb93    ld      hl,$93cb
8aa3 e5        push    hl
8aa4 210a00    ld      hl,$000a
8aa7 39        add     hl,sp
8aa8 cd667c    call    $7c66
8aab e1        pop     hl
8aac cd857c    call    $7c85
8aaf 21cb93    ld      hl,$93cb
8ab2 cd667c    call    $7c66
8ab5 215592    ld      hl,$9255
8ab8 cd587c    call    $7c58
8abb cd1080    call    $8010
8abe 281e      jr      z,$8ade
8ac0 21cb93    ld      hl,$93cb
8ac3 e5        push    hl
8ac4 215592    ld      hl,$9255
8ac7 cd667c    call    $7c66
8aca cd037d    call    $7d03
8acd e1        pop     hl
8ace e5        push    hl
8acf cd667c    call    $7c66
8ad2 cd657d    call    $7d65
8ad5 e1        pop     hl
8ad6 cd857c    call    $7c85
8ad9 03        inc     bc
8ada 60        ld      h,b
8adb 69        ld      l,c
8adc 18d1      jr      $8aaf
8ade 60        ld      h,b
8adf 69        ld      l,c
8ae0 110100    ld      de,$0001
8ae3 cdfc84    call    $84fc
8ae6 2817      jr      z,$8aff
8ae8 21cb93    ld      hl,$93cb
8aeb e5        push    hl
8aec 215592    ld      hl,$9255
8aef cd667c    call    $7c66
8af2 21cb93    ld      hl,$93cb
8af5 cd587c    call    $7c58
8af8 cd657d    call    $7d65
8afb e1        pop     hl
8afc cd857c    call    $7c85
8aff 21cb93    ld      hl,$93cb
8b02 e5        push    hl
8b03 cd667c    call    $7c66
8b06 cde681    call    $81e6
8b09 22c993    ld      ($93c9),hl
8b0c cd2880    call    $8028
8b0f 21cb93    ld      hl,$93cb
8b12 cd587c    call    $7c58
8b15 cde07f    call    $7fe0
8b18 280e      jr      z,$8b28
8b1a 2ac993    ld      hl,($93c9)
8b1d 29        add     hl,hl
8b1e 29        add     hl,hl
8b1f 115d92    ld      de,$925d
8b22 19        add     hl,de
8b23 cd2c7c    call    $7c2c
8b26 1859      jr      $8b81
8b28 2ac993    ld      hl,($93c9)
8b2b cd2880    call    $8028
8b2e cda77c    call    $7ca7
8b31 21cb93    ld      hl,$93cb
8b34 cd667c    call    $7c66
8b37 cdd87c    call    $7cd8
8b3a cd657d    call    $7d65
8b3d cda77c    call    $7ca7
8b40 2ac993    ld      hl,($93c9)
8b43 23        inc     hl
8b44 29        add     hl,hl
8b45 29        add     hl,hl
8b46 115d92    ld      de,$925d
8b49 19        add     hl,de
8b4a cd2c7c    call    $7c2c
8b4d cdd87c    call    $7cd8
8b50 cd417f    call    $7f41
8b53 cda77c    call    $7ca7
8b56 2ac993    ld      hl,($93c9)
8b59 23        inc     hl
8b5a cd2880    call    $8028
8b5d 21cb93    ld      hl,$93cb
8b60 cd587c    call    $7c58
8b63 cd657d    call    $7d65
8b66 cda77c    call    $7ca7
8b69 2ac993    ld      hl,($93c9)
8b6c 29        add     hl,hl
8b6d 29        add     hl,hl
8b6e 115d92    ld      de,$925d
8b71 19        add     hl,de
8b72 cd2c7c    call    $7c2c
8b75 cdd87c    call    $7cd8
8b78 cd417f    call    $7f41
8b7b cdd87c    call    $7cd8
8b7e cd6c7d    call    $7d6c
8b81 e1        pop     hl
8b82 cd857c    call    $7c85
8b85 60        ld      h,b
8b86 69        ld      l,c
8b87 110200    ld      de,$0002
8b8a cdfc84    call    $84fc
8b8d 280a      jr      z,$8b99
8b8f 21cb93    ld      hl,$93cb
8b92 cd667c    call    $7c66
8b95 cd127d    call    $7d12
8b98 c9        ret     

8b99 21cb93    ld      hl,$93cb
8b9c cd667c    call    $7c66
8b9f c9        ret     

8ba0 e1        pop     hl
8ba1 d9        exx     
8ba2 210800    ld      hl,$0008
8ba5 39        add     hl,sp
8ba6 f9        ld      sp,hl
8ba7 d9        exx     
8ba8 e9        jp      (hl)
8ba9 e3        ex      (sp),hl
8baa c5        push    bc
8bab cd0485    call    $8504
8bae c1        pop     bc
8baf d1        pop     de
8bb0 7c        ld      a,h
8bb1 b5        or      l
8bb2 c9        ret     

8bb3 21d593    ld      hl,$93d5
8bb6 23        inc     hl
8bb7 7d        ld      a,l
8bb8 e6fe      and     $fe
8bba 6f        ld      l,a
8bbb b4        or      h
8bbc c9        ret     

8bbd 010203    ld      bc,$0302
8bc0 04        inc     b
8bc1 05        dec     b
8bc2 0607      ld      b,$07
8bc4 08        ex      af,af'
8bc5 09        add     hl,bc
8bc6 0a        ld      a,(bc)
8bc7 0b        dec     bc
8bc8 0c        inc     c
8bc9 0d        dec     c
8bca 0e0f      ld      c,$0f
8bcc 1011      djnz    $8bdf
8bce 12        ld      (de),a
8bcf 13        inc     de
8bd0 14        inc     d
8bd1 15        dec     d
8bd2 1617      ld      d,$17
8bd4 1819      jr      $8bef
8bd6 1a        ld      a,(de)
8bd7 7f        ld      a,a
8bd8 00        nop     
8bd9 0a        ld      a,(bc)
8bda 03        inc     bc
8bdb 00        nop     
8bdc f8        ret     m

8bdd f603      or      $03
8bdf 0a        ld      a,(bc)
8be0 03        inc     bc
8be1 02        ld      (bc),a
8be2 f8        ret     m

8be3 f603      or      $03
8be5 08        ex      af,af'
8be6 04        inc     b
8be7 04        inc     b
8be8 f8        ret     m

8be9 f40208    call    p,$0802
8bec 04        inc     b
8bed 06f8      ld      b,$f8
8bef f40206    call    p,$0602
8bf2 04        inc     b
8bf3 08        ex      af,af'
8bf4 f9        ld      sp,hl
8bf5 f40101    call    p,$0101
8bf8 05        dec     b
8bf9 0a        ld      a,(bc)
8bfa f9        ld      sp,hl
8bfb f40101    call    p,$0101
8bfe 05        dec     b
8bff 0c        inc     c
8c00 faf400    jp      m,$00f4
8c03 02        ld      (bc),a
8c04 05        dec     b
8c05 0efa      ld      c,$fa
8c07 f40002    call    p,$0200
8c0a 05        dec     b
8c0b 10fb      djnz    $8c08
8c0d f4ff00    call    p,$00ff
8c10 05        dec     b
8c11 10fb      djnz    $8c0e
8c13 f4fffe    call    p,$feff
8c16 05        dec     b
8c17 12        ld      (de),a
8c18 fcf4fe    call    m,$fef4
8c1b fe05      cp      $05
8c1d 12        ld      (de),a
8c1e fdf4fefc  call    p,$fcfe
8c22 05        dec     b
8c23 14        inc     d
8c24 fef6      cp      $f6
8c26 fdfa0514  jp      m,$1405
8c2a fef8      cp      $f8
8c2c fdfa0414  jp      m,$1404
8c30 ff        rst     $38
8c31 f8        ret     m

8c32 fcf804    call    m,$04f8
8c35 14        inc     d
8c36 00        nop     
8c37 f8        ret     m

8c38 fc

					LIOS params

8c39 1f00    			Text screen height, characters
8c3b 5a00        		Text screen width, characters
8c3d 1f00        		Text screen height, characters
8c3f 5a00        		Text screen width, characters
8c41 1500			Standard split line        
8c43 0100			Default foreground ink
8c45 0000			Default background ink
8c47 0400			Text X-coordinate mask
8c49 0100			Maximum foreground ink number 
8c4b 0000			Maximum R/G/B value for SETPAL
8c4d 0000
8c4f ffff			Maximum paddle number (-1 for none)
8c51 d002  			Graphics screen width, pixels      
8c53 f800			Graphics screen height, pixels
8c55 0800
8c57 0a00			Maximum scrunch ratio (for SETSCRUNCH)
8c59 0000			Nonzero if separate text and graphics screens
8c5b 0000
8c5d 2000			Maximum split line (usually = text screen height)
8c5f 0f00			Pixel width  (for setting initial aspect ratio)	
8c61 2000			Pixel height
8c63 5e90
8c65 7090
8c67 7590
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
8c8d 41        ld      b,c
8c8e 39        add     hl,sp
8c8f 4b        ld      c,e
8c90 b8        cp      b
8c91 34        inc     (hl)
8c92 c7        rst     $00
8c93 83        add     a,e
8c94 ea0000    jp      pe,$0000
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
8d94 00        nop     
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
9036 e491f6    call    po,$f691
9039 91        sub     c
903a 00        nop     
903b 00        nop     
903c 4c        ld      c,h
903d 4f        ld      c,a
903e 47        ld      b,a
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
905e 41        ld      b,c
905f 6d        ld      l,l
9060 73        ld      (hl),e
9061 74        ld      (hl),h
9062 72        ld      (hl),d
9063 61        ld      h,c
9064 64        ld      h,h
9065 204c      jr      nz,$90b3
9067 4f        ld      c,a
9068 47        ld      b,a
9069 4f        ld      c,a
906a 2056      jr      nz,$90c2
906c 322e30    ld      ($302e),a
906f 00        nop     
9070 45        ld      b,l
9071 64        ld      h,h
9072 69        ld      l,c
9073 74        ld      (hl),h
9074 00        nop     
9075 5f        ld      e,a
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
90b0 e419e7    call    po,$e719
90b3 19        add     hl,de
90b4 ea19ed    jp      pe,$ed19
90b7 19        add     hl,de
90b8 221c25    ld      ($251c),hl
90bb 1c        inc     e
90bc 281c      jr      z,$90da
90be 2b        dec     hl
90bf 1c        inc     e
90c0 321c37    ld      ($371c),a
90c3 1c        inc     e
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
913d 41        ld      b,c
913e 010000    ld      bc,$0000
9141 00        nop     
9142 00        nop     
9143 00        nop     
9144 00        nop     
9145 42        ld      b,d
9146 016800    ld      bc,$0068
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
916b 41        ld      b,c
916c 010000    ld      bc,$0000
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
91bc 02        ld      (bc),a
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
91d5 50        ld      d,b
91d6 49        ld      c,c
91d7 43        ld      b,e
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
923d 40        ld      b,b
923e 86        add     a,(hl)
923f 0a        ld      a,(bc)
9240 91        sub     c
9241 c1        pop     bc
9242 6b        ld      l,e
9243 9b        sbc     a,e
9244 2c        inc     l
9245 41        ld      b,c
9246 01921f    ld      bc,$1f92
9249 b5        or      l
924a 44        ld      b,h
924b 42        ld      b,d
924c d1        pop     de
924d 41        ld      b,c
924e 010c15    ld      bc,$150c
9251 23        inc     hl
9252 82        add     a,d
9253 d7        rst     $10
9254 3641      ld      (hl),$41
9256 5a        ld      e,d
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
9261 40        ld      b,b
9262 04        inc     b
9263 77        ld      (hl),a
9264 c24008    jp      nz,$0840
9267 ef        rst     $28
9268 2c        inc     l
9269 40        ld      b,b
926a 0d        dec     c
926b 65        ld      h,l
926c e3        ex      (sp),hl
926d 40        ld      b,b
926e 11db8f    ld      de,$8fdb
9271 40        ld      b,b
9272 164f      ld      d,$4f
9274 d640      sub     $40
9276 1a        ld      a,(de)
9277 c26040    jp      nz,$4060
927a 1f        rra     
927b 32d440    ld      ($40d4),a
927e 23        inc     hl
927f a0        and     b
9280 d9        exx     
9281 40        ld      b,b
9282 280c      jr      z,$9290
9284 1640      ld      d,$40
9286 2c        inc     l
9287 74        ld      (hl),h
9288 34        inc     (hl)
9289 40        ld      b,b
928a 30d8      jr      nc,$9264
928c db40      in      a,($40)
928e 35        dec     (hl)
928f 39        add     hl,sp
9290 b3        or      e
9291 40        ld      b,b
9292 39        add     hl,sp
9293 96        sub     (hl)
9294 64        ld      h,h
9295 40        ld      b,b
9296 3d        dec     a
9297 ee97      xor     $97
9299 40        ld      b,b
929a 42        ld      b,d
929b 41        ld      b,c
929c f7        rst     $30
929d 40        ld      b,b
929e 46        ld      b,(hl)
929f 90        sub     b
92a0 2b        dec     hl
92a1 40        ld      b,b
92a2 4a        ld      c,d
92a3 d8        ret     c

92a4 df        rst     $18
92a5 40        ld      b,b
92a6 4f        ld      c,a
92a7 1b        dec     de
92a8 bc        cp      h
92a9 40        ld      b,b
92aa 53        ld      d,e
92ab 58        ld      e,b
92ac 6f        ld      l,a
92ad 40        ld      b,b
92ae 57        ld      d,a
92af 8e        adc     a,(hl)
92b0 a1        and     c
92b1 40        ld      b,b
92b2 5b        ld      e,e
92b3 be        cp      (hl)
92b4 00        nop     
92b5 40        ld      b,b
92b6 5f        ld      e,a
92b7 e637      and     $37
92b9 40        ld      b,b
92ba 64        ld      h,h
92bb 06f4      ld      b,$f4
92bd 40        ld      b,b
92be 68        ld      l,b
92bf 1f        rra     
92c0 e4406c    call    po,$6c40
92c3 30b5      jr      nc,$927a
92c5 40        ld      b,b
92c6 70        ld      (hl),b
92c7 39        add     hl,sp
92c8 17        rla     
92c9 40        ld      b,b
92ca 74        ld      (hl),h
92cb 38b8      jr      c,$9285
92cd 40        ld      b,b
92ce 78        ld      a,b
92cf 2f        cpl     
92d0 49        ld      c,c
92d1 40        ld      b,b
92d2 7c        ld      a,h
92d3 1c        inc     e
92d4 7b        ld      a,e
92d5 40        ld      b,b
92d6 80        add     a,b
92d7 00        nop     
92d8 00        nop     
92d9 40        ld      b,b
92da 83        add     a,e
92db d9        exx     
92dc 89        adc     a,c
92dd 40        ld      b,b
92de 87        add     a,a
92df a8        xor     b
92e0 c9        ret     

92e1 40        ld      b,b
92e2 8b        adc     a,e
92e3 6d        ld      l,l
92e4 76        halt    
92e5 40        ld      b,b
92e6 8f        adc     a,a
92e7 27        daa     
92e8 44        ld      b,h
92e9 40        ld      b,b
92ea 92        sub     d
92eb d5        push    de
92ec e7        rst     $20
92ed 40        ld      b,b
92ee 96        sub     (hl)
92ef 79        ld      a,c
92f0 1840      jr      $9332
92f2 9a        sbc     a,d
92f3 108c      djnz    $9281
92f5 40        ld      b,b
92f6 9d        sbc     a,l
92f7 9b        sbc     a,e
92f8 fd40      ld      b,b
92fa a1        and     c
92fb 1b        dec     de
92fc 24        inc     h
92fd 40        ld      b,b
92fe a4        and     h
92ff 8d        adc     a,l
9300 ba        cp      d
9301 40        ld      b,b
9302 a7        and     a
9303 f3        di      
9304 7c        ld      a,h
9305 40        ld      b,b
9306 ab        xor     e
9307 4c        ld      c,h
9308 24        inc     h
9309 40        ld      b,b
930a ae        xor     (hl)
930b 97        sub     a
930c 71        ld      (hl),c
930d 40        ld      b,b
930e b1        or      c
930f d5        push    de
9310 2140b5    ld      hl,$b540
9313 04        inc     b
9314 f3        di      
9315 40        ld      b,b
9316 b8        cp      b
9317 26a7      ld      h,$a7
9319 40        ld      b,b
931a bb        cp      e
931b 39        add     hl,sp
931c ff        rst     $38
931d 40        ld      b,b
931e be        cp      (hl)
931f 3ebd      ld      a,$bd
9321 40        ld      b,b
9322 c1        pop     bc
9323 34        inc     (hl)
9324 a5        and     l
9325 40        ld      b,b
9326 c41b7d    call    nz,$7d1b
9329 40        ld      b,b
932a c6f3      add     a,$f3
932c 09        add     hl,bc
932d 40        ld      b,b
932e c9        ret     

932f bb        cp      e
9330 12        ld      (de),a
9331 40        ld      b,b
9332 cc7360    call    z,$6073
9335 40        ld      b,b
9336 cf        rst     $08
9337 1b        dec     de
9338 bc        cp      h
9339 40        ld      b,b
933a d1        pop     de
933b b3        or      e
933c f240d4    jp      p,$d440
933f 3b        dec     sp
9340 ce40      adc     a,$40
9342 d6b3      sub     $b3
9344 1d        dec     e
9345 40        ld      b,b
9346 d9        exx     
9347 19        add     hl,de
9348 ae        xor     (hl)
9349 40        ld      b,b
934a db6f      in      a,($6f)
934c 50        ld      d,b
934d 40        ld      b,b
934e ddb3      or      e
9350 d7        rst     $10
9351 40        ld      b,b
9352 df        rst     $18
9353 e7        rst     $20
9354 13        inc     de
9355 40        ld      b,b
9356 e208da    jp      po,$da08
9359 40        ld      b,b
935a e41900    call    po,$0019
935d 40        ld      b,b
935e e617      and     $17
9360 5d        ld      e,l
9361 40        ld      b,b
9362 e8        ret     pe

9363 03        inc     bc
9364 c9        ret     

9365 40        ld      b,b
9366 e9        jp      (hl)
9367 de1d      sbc     a,$1d
9369 40        ld      b,b
936a eb        ex      de,hl
936b a6        and     (hl)
936c 34        inc     (hl)
936d 40        ld      b,b
936e ed5beb40  ld      de,($40eb)
9372 eeff      xor     $ff
9374 2040      jr      nz,$93b6
9376 f0        ret     p

9377 8f        adc     a,a
9378 b2        or      d
9379 40        ld      b,b
937a f20d81    jp      p,$810d
937d 40        ld      b,b
937e f3        di      
937f 78        ld      a,b
9380 70        ld      (hl),b
9381 40        ld      b,b
9382 f4d063    call    p,$63d0
9385 40        ld      b,b
9386 f615      or      $15
9388 3f        ccf     
9389 40        ld      b,b
938a f7        rst     $30
938b 46        ld      b,(hl)
938c ea40f8    jp      pe,$f840
938f 65        ld      h,l
9390 4c        ld      c,h
9391 40        ld      b,b
9392 f9        ld      sp,hl
9393 70        ld      (hl),b
9394 51        ld      d,c
9395 40        ld      b,b
9396 fa67e1    jp      m,$e167
9399 40        ld      b,b
939a fb        ei      
939b 4b        ld      c,e
939c eb        ex      de,hl
939d 40        ld      b,b
939e fc1c5c    call    m,$5c1c
93a1 40        ld      b,b
93a2 fcd924    call    m,$24d9
93a5 40        ld      b,b
93a6 fd82      add     a,d
93a8 35        dec     (hl)
93a9 40        ld      b,b
93aa fe17      cp      $17
93ac 81        add     a,c
93ad 40        ld      b,b
93ae fe98      cp      $98
93b0 fc40ff    call    m,$ff40
93b3 069d      ld      b,$9d
93b5 40        ld      b,b
93b6 ff        rst     $38
93b7 60        ld      h,b
93b8 5b        ld      e,e
93b9 40        ld      b,b
93ba ff        rst     $38
93bb a6        and     (hl)
93bc 2f        cpl     
93bd 40        ld      b,b
93be ff        rst     $38
93bf d8        ret     c

93c0 13        inc     de
93c1 40        ld      b,b
93c2 ff        rst     $38
93c3 f604      or      $04
93c5 41        ld      b,c
93c6 010000    ld      bc,$0000
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
93d3 f9        ld      sp,hl
93d4 b9        cp      c
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
a9d5 cda98b    call    $8ba9
a9d8 210703    ld      hl,$0307
a9db e5        push    hl
a9dc 21dcad    ld      hl,$addc
a9df e5        push    hl
a9e0 cd6eb9    call    $b96e
a9e3 d1        pop     de
a9e4 d1        pop     de
a9e5 211803    ld      hl,$0318
a9e8 e5        push    hl
a9e9 21dfad    ld      hl,$addf
a9ec e5        push    hl
a9ed cd6eb9    call    $b96e
a9f0 d1        pop     de
a9f1 d1        pop     de
a9f2 216002    ld      hl,$0260
a9f5 e5        push    hl
a9f6 21e2ad    ld      hl,$ade2
a9f9 e5        push    hl
a9fa cd6eb9    call    $b96e
a9fd d1        pop     de
a9fe d1        pop     de
a9ff 21e601    ld      hl,$01e6
aa02 e5        push    hl
aa03 21e5ad    ld      hl,$ade5
aa06 e5        push    hl
aa07 cd6eb9    call    $b96e
aa0a d1        pop     de
aa0b d1        pop     de
aa0c 213702    ld      hl,$0237
aa0f e5        push    hl
aa10 21ebad    ld      hl,$adeb
aa13 e5        push    hl
aa14 cd6eb9    call    $b96e
aa17 d1        pop     de
aa18 d1        pop     de
aa19 216f02    ld      hl,$026f
aa1c e5        push    hl
aa1d 21f2ad    ld      hl,$adf2
aa20 e5        push    hl
aa21 cd6eb9    call    $b96e
aa24 d1        pop     de
aa25 d1        pop     de
aa26 216602    ld      hl,$0266
aa29 e5        push    hl
aa2a 21f6ad    ld      hl,$adf6
aa2d e5        push    hl
aa2e cd6eb9    call    $b96e
aa31 d1        pop     de
aa32 d1        pop     de
aa33 219002    ld      hl,$0290
aa36 e5        push    hl
aa37 21fbad    ld      hl,$adfb
aa3a e5        push    hl
aa3b cd6eb9    call    $b96e
aa3e d1        pop     de
aa3f d1        pop     de
aa40 217502    ld      hl,$0275
aa43 e5        push    hl
aa44 21ffad    ld      hl,$adff
aa47 e5        push    hl
aa48 cd6eb9    call    $b96e
aa4b d1        pop     de
aa4c d1        pop     de
aa4d 219902    ld      hl,$0299
aa50 e5        push    hl
aa51 2103ae    ld      hl,$ae03
aa54 e5        push    hl
aa55 cd6eb9    call    $b96e
aa58 d1        pop     de
aa59 d1        pop     de
aa5a 218103    ld      hl,$0381
aa5d e5        push    hl
aa5e 2106ae    ld      hl,$ae06
aa61 e5        push    hl
aa62 cd6eb9    call    $b96e
aa65 d1        pop     de
aa66 d1        pop     de
aa67 21a103    ld      hl,$03a1
aa6a e5        push    hl
aa6b 210dae    ld      hl,$ae0d
aa6e e5        push    hl
aa6f cd6eb9    call    $b96e
aa72 d1        pop     de
aa73 d1        pop     de
aa74 21cf03    ld      hl,$03cf
aa77 e5        push    hl
aa78 2111ae    ld      hl,$ae11
aa7b e5        push    hl
aa7c cd6eb9    call    $b96e
aa7f d1        pop     de
aa80 d1        pop     de
aa81 210b05    ld      hl,$050b
aa84 e5        push    hl
aa85 2115ae    ld      hl,$ae15
aa88 e5        push    hl
aa89 cd6eb9    call    $b96e
aa8c d1        pop     de
aa8d d1        pop     de
aa8e 21a304    ld      hl,$04a3
aa91 e5        push    hl
aa92 211eae    ld      hl,$ae1e
aa95 e5        push    hl
aa96 cd6eb9    call    $b96e
aa99 d1        pop     de
aa9a d1        pop     de
aa9b 213c05    ld      hl,$053c
aa9e e5        push    hl
aa9f 2125ae    ld      hl,$ae25
aaa2 e5        push    hl
aaa3 cd6eb9    call    $b96e
aaa6 d1        pop     de
aaa7 d1        pop     de
aaa8 218505    ld      hl,$0585
aaab e5        push    hl
aaac 212fae    ld      hl,$ae2f
aaaf e5        push    hl
aab0 cd6eb9    call    $b96e
aab3 d1        pop     de
aab4 d1        pop     de
aab5 21cd07    ld      hl,$07cd
aab8 e5        push    hl
aab9 2138ae    ld      hl,$ae38
aabc e5        push    hl
aabd cd6eb9    call    $b96e
aac0 d1        pop     de
aac1 d1        pop     de
aac2 218c05    ld      hl,$058c
aac5 e5        push    hl
aac6 2140ae    ld      hl,$ae40
aac9 e5        push    hl
aaca cd6eb9    call    $b96e
aacd d1        pop     de
aace d1        pop     de
aacf 21b803    ld      hl,$03b8
aad2 e5        push    hl
aad3 2146ae    ld      hl,$ae46
aad6 e5        push    hl
aad7 cd6eb9    call    $b96e
aada d1        pop     de
aadb d1        pop     de
aadc 21e305    ld      hl,$05e3
aadf e5        push    hl
aae0 214aae    ld      hl,$ae4a
aae3 e5        push    hl
aae4 cd6eb9    call    $b96e
aae7 d1        pop     de
aae8 d1        pop     de
aae9 21ec05    ld      hl,$05ec
aaec e5        push    hl
aaed 214cae    ld      hl,$ae4c
aaf0 e5        push    hl
aaf1 cd6eb9    call    $b96e
aaf4 d1        pop     de
aaf5 d1        pop     de
aaf6 212104    ld      hl,$0421
aaf9 e5        push    hl
aafa 214eae    ld      hl,$ae4e
aafd e5        push    hl
aafe cd6eb9    call    $b96e
ab01 d1        pop     de
ab02 d1        pop     de
ab03 21f906    ld      hl,$06f9
ab06 e5        push    hl
ab07 2150ae    ld      hl,$ae50
ab0a e5        push    hl
ab0b cd6eb9    call    $b96e
ab0e d1        pop     de
ab0f d1        pop     de
ab10 210207    ld      hl,$0702
ab13 e5        push    hl
ab14 2152ae    ld      hl,$ae52
ab17 e5        push    hl
ab18 cd6eb9    call    $b96e
ab1b d1        pop     de
ab1c d1        pop     de
ab1d 21af0a    ld      hl,$0aaf
ab20 e5        push    hl
ab21 2154ae    ld      hl,$ae54
ab24 e5        push    hl
ab25 cd6eb9    call    $b96e
ab28 d1        pop     de
ab29 d1        pop     de
ab2a 210807    ld      hl,$0708
ab2d e5        push    hl
ab2e 2156ae    ld      hl,$ae56
ab31 e5        push    hl
ab32 cd6eb9    call    $b96e
ab35 d1        pop     de
ab36 d1        pop     de
ab37 21261b    ld      hl,$1b26
ab3a e5        push    hl
ab3b 2158ae    ld      hl,$ae58
ab3e e5        push    hl
ab3f cd6eb9    call    $b96e
ab42 d1        pop     de
ab43 d1        pop     de
ab44 213c1b    ld      hl,$1b3c
ab47 e5        push    hl
ab48 215bae    ld      hl,$ae5b
ab4b e5        push    hl
ab4c cd6eb9    call    $b96e
ab4f d1        pop     de
ab50 d1        pop     de
ab51 21421b    ld      hl,$1b42
ab54 e5        push    hl
ab55 2161ae    ld      hl,$ae61
ab58 e5        push    hl
ab59 cd6eb9    call    $b96e
ab5c d1        pop     de
ab5d d1        pop     de
ab5e 214e1b    ld      hl,$1b4e
ab61 e5        push    hl
ab62 2164ae    ld      hl,$ae64
ab65 e5        push    hl
ab66 cd6eb9    call    $b96e
ab69 d1        pop     de
ab6a d1        pop     de
ab6b 216470    ld      hl,$7064
ab6e e5        push    hl
ab6f 2168ae    ld      hl,$ae68
ab72 e5        push    hl
ab73 cd6eb9    call    $b96e
ab76 d1        pop     de
ab77 d1        pop     de
ab78 216c1b    ld      hl,$1b6c
ab7b e5        push    hl
ab7c 216eae    ld      hl,$ae6e
ab7f e5        push    hl
ab80 cd6eb9    call    $b96e
ab83 d1        pop     de
ab84 d1        pop     de
ab85 213d1c    ld      hl,$1c3d
ab88 e5        push    hl
ab89 2171ae    ld      hl,$ae71
ab8c e5        push    hl
ab8d cd6eb9    call    $b96e
ab90 d1        pop     de
ab91 d1        pop     de
ab92 21431c    ld      hl,$1c43
ab95 e5        push    hl
ab96 2174ae    ld      hl,$ae74
ab99 e5        push    hl
ab9a cd6eb9    call    $b96e
ab9d d1        pop     de
ab9e d1        pop     de
ab9f 21491c    ld      hl,$1c49
aba2 e5        push    hl
aba3 2179ae    ld      hl,$ae79
aba6 e5        push    hl
aba7 cd6eb9    call    $b96e
abaa d1        pop     de
abab d1        pop     de
abac 219a6d    ld      hl,$6d9a
abaf e5        push    hl
abb0 217cae    ld      hl,$ae7c
abb3 e5        push    hl
abb4 cd6eb9    call    $b96e
abb7 d1        pop     de
abb8 d1        pop     de
abb9 21b16d    ld      hl,$6db1
abbc e5        push    hl
abbd 217fae    ld      hl,$ae7f
abc0 e5        push    hl
abc1 cd6eb9    call    $b96e
abc4 d1        pop     de
abc5 d1        pop     de
abc6 21c06d    ld      hl,$6dc0
abc9 e5        push    hl
abca 2182ae    ld      hl,$ae82
abcd e5        push    hl
abce cd6eb9    call    $b96e
abd1 d1        pop     de
abd2 d1        pop     de
abd3 21a96d    ld      hl,$6da9
abd6 e5        push    hl
abd7 2185ae    ld      hl,$ae85
abda e5        push    hl
abdb cd6eb9    call    $b96e
abde d1        pop     de
abdf d1        pop     de
abe0 215a1c    ld      hl,$1c5a
abe3 e5        push    hl
abe4 2188ae    ld      hl,$ae88
abe7 e5        push    hl
abe8 cd6eb9    call    $b96e
abeb d1        pop     de
abec d1        pop     de
abed 21681c    ld      hl,$1c68
abf0 e5        push    hl
abf1 218bae    ld      hl,$ae8b
abf4 e5        push    hl
abf5 cd6eb9    call    $b96e
abf8 d1        pop     de
abf9 d1        pop     de
abfa 217a1c    ld      hl,$1c7a
abfd e5        push    hl
abfe 2191ae    ld      hl,$ae91
ac01 e5        push    hl
ac02 cd6eb9    call    $b96e
ac05 d1        pop     de
ac06 d1        pop     de
ac07 21881c    ld      hl,$1c88
ac0a e5        push    hl
ac0b 2196ae    ld      hl,$ae96
ac0e e5        push    hl
ac0f cd6eb9    call    $b96e
ac12 d1        pop     de
ac13 d1        pop     de
ac14 21961c    ld      hl,$1c96
ac17 e5        push    hl
ac18 219cae    ld      hl,$ae9c
ac1b e5        push    hl
ac1c cd6eb9    call    $b96e
ac1f d1        pop     de
ac20 d1        pop     de
ac21 211e1d    ld      hl,$1d1e
ac24 e5        push    hl
ac25 21a3ae    ld      hl,$aea3
ac28 e5        push    hl
ac29 cd6eb9    call    $b96e
ac2c d1        pop     de
ac2d d1        pop     de
ac2e 21c41f    ld      hl,$1fc4
ac31 e5        push    hl
ac32 21aaae    ld      hl,$aeaa
ac35 e5        push    hl
ac36 cd6eb9    call    $b96e
ac39 d1        pop     de
ac3a d1        pop     de
ac3b 213c1d    ld      hl,$1d3c
ac3e e5        push    hl
ac3f 21b5ae    ld      hl,$aeb5
ac42 e5        push    hl
ac43 cd6eb9    call    $b96e
ac46 d1        pop     de
ac47 d1        pop     de
ac48 21571d    ld      hl,$1d57
ac4b e5        push    hl
ac4c 21baae    ld      hl,$aeba
ac4f e5        push    hl
ac50 cd6eb9    call    $b96e
ac53 d1        pop     de
ac54 d1        pop     de
ac55 21721d    ld      hl,$1d72
ac58 e5        push    hl
ac59 21bfae    ld      hl,$aebf
ac5c e5        push    hl
ac5d cd6eb9    call    $b96e
ac60 d1        pop     de
ac61 d1        pop     de
ac62 21781d    ld      hl,$1d78
ac65 e5        push    hl
ac66 21c2ae    ld      hl,$aec2
ac69 e5        push    hl
ac6a cd6eb9    call    $b96e
ac6d d1        pop     de
ac6e d1        pop     de
ac6f 214770    ld      hl,$7047
ac72 e5        push    hl
ac73 21caae    ld      hl,$aeca
ac76 e5        push    hl
ac77 cd6eb9    call    $b96e
ac7a d1        pop     de
ac7b d1        pop     de
ac7c 215b1f    ld      hl,$1f5b
ac7f e5        push    hl
ac80 21d1ae    ld      hl,$aed1
ac83 e5        push    hl
ac84 cd6eb9    call    $b96e
ac87 d1        pop     de
ac88 d1        pop     de
ac89 216678    ld      hl,$7866
ac8c e5        push    hl
ac8d 21d6ae    ld      hl,$aed6
ac90 e5        push    hl
ac91 cd6eb9    call    $b96e
ac94 d1        pop     de
ac95 d1        pop     de
ac96 216378    ld      hl,$7863
ac99 e5        push    hl
ac9a 21ddae    ld      hl,$aedd
ac9d e5        push    hl
ac9e cd6eb9    call    $b96e
aca1 d1        pop     de
aca2 d1        pop     de
aca3 211e1e    ld      hl,$1e1e
aca6 e5        push    hl
aca7 21e5ae    ld      hl,$aee5
acaa e5        push    hl
acab cd6eb9    call    $b96e
acae d1        pop     de
acaf d1        pop     de
acb0 216078    ld      hl,$7860
acb3 e5        push    hl
acb4 21eaae    ld      hl,$aeea
acb7 e5        push    hl
acb8 cd6eb9    call    $b96e
acbb d1        pop     de
acbc d1        pop     de
acbd 21271e    ld      hl,$1e27
acc0 e5        push    hl
acc1 21efae    ld      hl,$aeef
acc4 e5        push    hl
acc5 cd6eb9    call    $b96e
acc8 d1        pop     de
acc9 d1        pop     de
acca 21341e    ld      hl,$1e34
accd e5        push    hl
acce 21f3ae    ld      hl,$aef3
acd1 e5        push    hl
acd2 cd6eb9    call    $b96e
acd5 d1        pop     de
acd6 d1        pop     de
acd7 21491e    ld      hl,$1e49
acda e5        push    hl
acdb 21f8ae    ld      hl,$aef8
acde e5        push    hl
acdf cd6eb9    call    $b96e
ace2 d1        pop     de
ace3 d1        pop     de
ace4 21551e    ld      hl,$1e55
ace7 e5        push    hl
ace8 2101af    ld      hl,$af01
aceb e5        push    hl
acec cd6eb9    call    $b96e
acef d1        pop     de
acf0 d1        pop     de
acf1 215d78    ld      hl,$785d
acf4 e5        push    hl
acf5 210aaf    ld      hl,$af0a
acf8 e5        push    hl
acf9 cd6eb9    call    $b96e
acfc d1        pop     de
acfd d1        pop     de
acfe 21111f    ld      hl,$1f11
ad01 e5        push    hl
ad02 2110af    ld      hl,$af10
ad05 e5        push    hl
ad06 cd6eb9    call    $b96e
ad09 d1        pop     de
ad0a d1        pop     de
ad0b 21011f    ld      hl,$1f01
ad0e e5        push    hl
ad0f 2113af    ld      hl,$af13
ad12 e5        push    hl
ad13 cd6eb9    call    $b96e
ad16 d1        pop     de
ad17 d1        pop     de
ad18 21671e    ld      hl,$1e67
ad1b e5        push    hl
ad1c 2116af    ld      hl,$af16
ad1f e5        push    hl
ad20 cd6eb9    call    $b96e
ad23 d1        pop     de
ad24 d1        pop     de
ad25 21e21e    ld      hl,$1ee2
ad28 e5        push    hl
ad29 211faf    ld      hl,$af1f
ad2c e5        push    hl
ad2d cd6eb9    call    $b96e
ad30 d1        pop     de
ad31 d1        pop     de
ad32 21611f    ld      hl,$1f61
ad35 e5        push    hl
ad36 2122af    ld      hl,$af22
ad39 e5        push    hl
ad3a cd6eb9    call    $b96e
ad3d d1        pop     de
ad3e d1        pop     de
ad3f 21671f    ld      hl,$1f67
ad42 e5        push    hl
ad43 2125af    ld      hl,$af25
ad46 e5        push    hl
ad47 cd6eb9    call    $b96e
ad4a d1        pop     de
ad4b d1        pop     de
ad4c 21811f    ld      hl,$1f81
ad4f e5        push    hl
ad50 212caf    ld      hl,$af2c
ad53 e5        push    hl
ad54 cd6eb9    call    $b96e
ad57 d1        pop     de
ad58 d1        pop     de
ad59 21bc77    ld      hl,$77bc
ad5c e5        push    hl
ad5d 2136af    ld      hl,$af36
ad60 e5        push    hl
ad61 cd6eb9    call    $b96e
ad64 d1        pop     de
ad65 d1        pop     de
ad66 21b977    ld      hl,$77b9
ad69 e5        push    hl
ad6a 213daf    ld      hl,$af3d
ad6d e5        push    hl
ad6e cd6eb9    call    $b96e
ad71 d1        pop     de
ad72 d1        pop     de
ad73 217f1b    ld      hl,$1b7f
ad76 e5        push    hl
ad77 2141af    ld      hl,$af41
ad7a e5        push    hl
ad7b cd6eb9    call    $b96e
ad7e d1        pop     de
ad7f d1        pop     de
ad80 21d21b    ld      hl,$1bd2
ad83 e5        push    hl
ad84 2144af    ld      hl,$af44
ad87 e5        push    hl
ad88 cd6eb9    call    $b96e
ad8b d1        pop     de
ad8c d1        pop     de
ad8d 216679    ld      hl,$7966
ad90 e5        push    hl
ad91 2147af    ld      hl,$af47
ad94 e5        push    hl
ad95 cd6eb9    call    $b96e
ad98 d1        pop     de
ad99 d1        pop     de
ad9a 214179    ld      hl,$7941
ad9d e5        push    hl
ad9e 214caf    ld      hl,$af4c
ada1 e5        push    hl
ada2 cd6eb9    call    $b96e
ada5 d1        pop     de
ada6 d1        pop     de
ada7 218f7a    ld      hl,$7a8f
adaa e5        push    hl
adab 2151af    ld      hl,$af51
adae e5        push    hl
adaf cd6eb9    call    $b96e
adb2 d1        pop     de
adb3 d1        pop     de
adb4 21867a    ld      hl,$7a86
adb7 e5        push    hl
adb8 2158af    ld      hl,$af58
adbb e5        push    hl
adbc cd6eb9    call    $b96e
adbf d1        pop     de
adc0 d1        pop     de
adc1 21987a    ld      hl,$7a98
adc4 e5        push    hl
adc5 2161af    ld      hl,$af61
adc8 e5        push    hl
adc9 cd6eb9    call    $b96e
adcc d1        pop     de
adcd d1        pop     de
adce 21f27a    ld      hl,$7af2
add1 e5        push    hl
add2 2169af    ld      hl,$af69
add5 e5        push    hl
add6 cd6eb9    call    $b96e
add9 d1        pop     de
adda d1        pop     de
addb c9        ret     

addc 63        ld      h,e
addd 6f        ld      l,a
adde 00        nop     
addf 69        ld      l,c
ade0 66        ld      h,(hl)
ade1 00        nop     
ade2 6f        ld      l,a
ade3 70        ld      (hl),b
ade4 00        nop     
ade5 70        ld      (hl),b
ade6 61        ld      h,c
ade7 75        ld      (hl),l
ade8 73        ld      (hl),e
ade9 65        ld      h,l
adea 00        nop     
adeb 72        ld      (hl),d
adec 65        ld      h,l
aded 70        ld      (hl),b
adee 65        ld      h,l
adef 61        ld      h,c
adf0 74        ld      (hl),h
adf1 00        nop     
adf2 72        ld      (hl),d
adf3 75        ld      (hl),l
adf4 6e        ld      l,(hl)
adf5 00        nop     
adf6 73        ld      (hl),e
adf7 74        ld      (hl),h
adf8 6f        ld      l,a
adf9 70        ld      (hl),b
adfa 00        nop     
adfb 61        ld      h,c
adfc 6e        ld      l,(hl)
adfd 64        ld      h,h
adfe 00        nop     
adff 6e        ld      l,(hl)
ae00 6f        ld      l,a
ae01 74        ld      (hl),h
ae02 00        nop     
ae03 6f        ld      l,a
ae04 72        ld      (hl),d
ae05 00        nop     
ae06 61        ld      h,c
ae07 72        ld      (hl),d
ae08 63        ld      h,e
ae09 74        ld      (hl),h
ae0a 61        ld      h,c
ae0b 6e        ld      l,(hl)
ae0c 00        nop     
ae0d 63        ld      h,e
ae0e 6f        ld      l,a
ae0f 73        ld      (hl),e
ae10 00        nop     
ae11 69        ld      l,c
ae12 6e        ld      l,(hl)
ae13 74        ld      (hl),h
ae14 00        nop     
ae15 71        ld      (hl),c
ae16 75        ld      (hl),l
ae17 6f        ld      l,a
ae18 74        ld      (hl),h
ae19 69        ld      l,c
ae1a 65        ld      h,l
ae1b 6e        ld      l,(hl)
ae1c 74        ld      (hl),h
ae1d 00        nop     
ae1e 72        ld      (hl),d
ae1f 61        ld      h,c
ae20 6e        ld      l,(hl)
ae21 64        ld      h,h
ae22 6f        ld      l,a
ae23 6d        ld      l,l
ae24 00        nop     
ae25 72        ld      (hl),d
ae26 65        ld      h,l
ae27 6d        ld      l,l
ae28 61        ld      h,c
ae29 69        ld      l,c
ae2a 6e        ld      l,(hl)
ae2b 64        ld      h,h
ae2c 65        ld      h,l
ae2d 72        ld      (hl),d
ae2e 00        nop     
ae2f 72        ld      (hl),d
ae30 65        ld      h,l
ae31 72        ld      (hl),d
ae32 61        ld      h,c
ae33 6e        ld      l,(hl)
ae34 64        ld      h,h
ae35 6f        ld      l,a
ae36 6d        ld      l,l
ae37 00        nop     
ae38 73        ld      (hl),e
ae39 68        ld      l,b
ae3a 75        ld      (hl),l
ae3b 66        ld      h,(hl)
ae3c 66        ld      h,(hl)
ae3d 6c        ld      l,h
ae3e 65        ld      h,l
ae3f 00        nop     
ae40 72        ld      (hl),d
ae41 6f        ld      l,a
ae42 75        ld      (hl),l
ae43 6e        ld      l,(hl)
ae44 64        ld      h,h
ae45 00        nop     
ae46 73        ld      (hl),e
ae47 69        ld      l,c
ae48 6e        ld      l,(hl)
ae49 00        nop     
ae4a 2b        dec     hl
ae4b 00        nop     
ae4c 2d        dec     l
ae4d 00        nop     
ae4e 2a002f    ld      hl,($2f00)
ae51 00        nop     
ae52 3c        inc     a
ae53 00        nop     
ae54 3d        dec     a
ae55 00        nop     
ae56 3e00      ld      a,$00
ae58 62        ld      h,d
ae59 6b        ld      l,e
ae5a 00        nop     
ae5b 63        ld      h,e
ae5c 6c        ld      l,h
ae5d 65        ld      h,l
ae5e 61        ld      h,c
ae5f 6e        ld      l,(hl)
ae60 00        nop     
ae61 63        ld      h,e
ae62 73        ld      (hl),e
ae63 00        nop     
ae64 64        ld      h,h
ae65 6f        ld      l,a
ae66 74        ld      (hl),h
ae67 00        nop     
ae68 66        ld      h,(hl)
ae69 65        ld      h,l
ae6a 6e        ld      l,(hl)
ae6b 63        ld      h,e
ae6c 65        ld      h,l
ae6d 00        nop     
ae6e 66        ld      h,(hl)
ae6f 64        ld      h,h
ae70 00        nop     
ae71 68        ld      l,b
ae72 74        ld      (hl),h
ae73 00        nop     
ae74 68        ld      l,b
ae75 6f        ld      l,a
ae76 6d        ld      l,l
ae77 65        ld      h,l
ae78 00        nop     
ae79 6c        ld      l,h
ae7a 74        ld      (hl),h
ae7b 00        nop     
ae7c 70        ld      (hl),b
ae7d 64        ld      h,h
ae7e 00        nop     
ae7f 70        ld      (hl),b
ae80 65        ld      h,l
ae81 00        nop     
ae82 70        ld      (hl),b
ae83 78        ld      a,b
ae84 00        nop     
ae85 70        ld      (hl),b
ae86 75        ld      (hl),l
ae87 00        nop     
ae88 72        ld      (hl),d
ae89 74        ld      (hl),h
ae8a 00        nop     
ae8b 73        ld      (hl),e
ae8c 65        ld      h,l
ae8d 74        ld      (hl),h
ae8e 62        ld      h,d
ae8f 67        ld      h,a
ae90 00        nop     
ae91 73        ld      (hl),e
ae92 65        ld      h,l
ae93 74        ld      (hl),h
ae94 68        ld      l,b
ae95 00        nop     
ae96 73        ld      (hl),e
ae97 65        ld      h,l
ae98 74        ld      (hl),h
ae99 70        ld      (hl),b
ae9a 63        ld      h,e
ae9b 00        nop     
ae9c 73        ld      (hl),e
ae9d 65        ld      h,l
ae9e 74        ld      (hl),h
ae9f 70        ld      (hl),b
aea0 65        ld      h,l
aea1 6e        ld      l,(hl)
aea2 00        nop     
aea3 73        ld      (hl),e
aea4 65        ld      h,l
aea5 74        ld      (hl),h
aea6 70        ld      (hl),b
aea7 6f        ld      l,a
aea8 73        ld      (hl),e
aea9 00        nop     
aeaa 73        ld      (hl),e
aeab 65        ld      h,l
aeac 74        ld      (hl),h
aead 73        ld      (hl),e
aeae 63        ld      h,e
aeaf 72        ld      (hl),d
aeb0 75        ld      (hl),l
aeb1 6e        ld      l,(hl)
aeb2 63        ld      h,e
aeb3 68        ld      l,b
aeb4 00        nop     
aeb5 73        ld      (hl),e
aeb6 65        ld      h,l
aeb7 74        ld      (hl),h
aeb8 78        ld      a,b
aeb9 00        nop     
aeba 73        ld      (hl),e
aebb 65        ld      h,l
aebc 74        ld      (hl),h
aebd 79        ld      a,c
aebe 00        nop     
aebf 73        ld      (hl),e
aec0 74        ld      (hl),h
aec1 00        nop     
aec2 74        ld      (hl),h
aec3 6f        ld      l,a
aec4 77        ld      (hl),a
aec5 61        ld      h,c
aec6 72        ld      (hl),d
aec7 64        ld      h,h
aec8 73        ld      (hl),e
aec9 00        nop     
aeca 77        ld      (hl),a
aecb 69        ld      l,c
aecc 6e        ld      l,(hl)
aecd 64        ld      h,h
aece 6f        ld      l,a
aecf 77        ld      (hl),a
aed0 00        nop     
aed1 77        ld      (hl),a
aed2 72        ld      (hl),d
aed3 61        ld      h,c
aed4 70        ld      (hl),b
aed5 00        nop     
aed6 70        ld      (hl),b
aed7 61        ld      h,c
aed8 64        ld      h,h
aed9 64        ld      h,h
aeda 6c        ld      l,h
aedb 65        ld      h,l
aedc 00        nop     
aedd 62        ld      h,d
aede 75        ld      (hl),l
aedf 74        ld      (hl),h
aee0 74        ld      (hl),h
aee1 6f        ld      l,a
aee2 6e        ld      l,(hl)
aee3 70        ld      (hl),b
aee4 00        nop     
aee5 6b        ld      l,e
aee6 65        ld      h,l
aee7 79        ld      a,c
aee8 70        ld      (hl),b
aee9 00        nop     
aeea 77        ld      (hl),a
aeeb 61        ld      h,c
aeec 69        ld      l,c
aeed 74        ld      (hl),h
aeee 00        nop     
aeef 2e69      ld      l,$69
aef1 6e        ld      l,(hl)
aef2 00        nop     
aef3 2e6f      ld      l,$6f
aef5 75        ld      (hl),l
aef6 74        ld      (hl),h
aef7 00        nop     
aef8 2e65      ld      l,$65
aefa 78        ld      a,b
aefb 61        ld      h,c
aefc 6d        ld      l,l
aefd 69        ld      l,c
aefe 6e        ld      l,(hl)
aeff 65        ld      h,l
af00 00        nop     
af01 2e64      ld      l,$64
af03 65        ld      h,l
af04 70        ld      (hl),b
af05 6f        ld      l,a
af06 73        ld      (hl),e
af07 69        ld      l,c
af08 74        ld      (hl),h
af09 00        nop     
af0a 74        ld      (hl),h
af0b 6f        ld      l,a
af0c 6e        ld      l,(hl)
af0d 65        ld      h,l
af0e 73        ld      (hl),e
af0f 00        nop     
af10 66        ld      h,(hl)
af11 73        ld      (hl),e
af12 00        nop     
af13 74        ld      (hl),h
af14 73        ld      (hl),e
af15 00        nop     
af16 73        ld      (hl),e
af17 65        ld      h,l
af18 74        ld      (hl),h
af19 73        ld      (hl),e
af1a 70        ld      (hl),b
af1b 6c        ld      l,h
af1c 69        ld      l,c
af1d 74        ld      (hl),h
af1e 00        nop     
af1f 73        ld      (hl),e
af20 73        ld      (hl),e
af21 00        nop     
af22 63        ld      h,e
af23 74        ld      (hl),h
af24 00        nop     
af25 63        ld      h,e
af26 75        ld      (hl),l
af27 72        ld      (hl),d
af28 73        ld      (hl),e
af29 6f        ld      l,a
af2a 72        ld      (hl),d
af2b 00        nop     
af2c 73        ld      (hl),e
af2d 65        ld      h,l
af2e 74        ld      (hl),h
af2f 63        ld      h,e
af30 75        ld      (hl),l
af31 72        ld      (hl),d
af32 73        ld      (hl),e
af33 6f        ld      l,a
af34 72        ld      (hl),d
af35 00        nop     
af36 73        ld      (hl),e
af37 65        ld      h,l
af38 74        ld      (hl),h
af39 70        ld      (hl),b
af3a 61        ld      h,c
af3b 6c        ld      l,h
af3c 00        nop     
af3d 70        ld      (hl),b
af3e 61        ld      h,c
af3f 6c        ld      l,h
af40 00        nop     
af41 74        ld      (hl),h
af42 66        ld      h,(hl)
af43 00        nop     
af44 73        ld      (hl),e
af45 66        ld      h,(hl)
af46 00        nop     
af47 64        ld      h,h
af48 6f        ld      l,a
af49 74        ld      (hl),h
af4a 63        ld      h,e
af4b 00        nop     
af4c 66        ld      h,(hl)
af4d 69        ld      l,c
af4e 6c        ld      l,h
af4f 6c        ld      l,h
af50 00        nop     
af51 64        ld      h,h
af52 69        ld      l,c
af53 72        ld      (hl),d
af54 70        ld      (hl),b
af55 69        ld      l,c
af56 63        ld      h,e
af57 00        nop     
af58 65        ld      h,l
af59 72        ld      (hl),d
af5a 61        ld      h,c
af5b 73        ld      (hl),e
af5c 65        ld      h,l
af5d 70        ld      (hl),b
af5e 69        ld      l,c
af5f 63        ld      h,e
af60 00        nop     
af61 6c        ld      l,h
af62 6f        ld      l,a
af63 61        ld      h,c
af64 64        ld      h,h
af65 70        ld      (hl),b
af66 69        ld      l,c
af67 63        ld      h,e
af68 00        nop     
af69 73        ld      (hl),e
af6a 61        ld      h,c
af6b 76        halt    
af6c 65        ld      h,l
af6d 70        ld      (hl),b
af6e 69        ld      l,c
af6f 63        ld      h,e
af70 00        nop     
af71 cd0585    call    $8505
af74 feff      cp      $ff
af76 210100    ld      hl,$0001
af79 229f8c    ld      ($8c9f),hl
af7c cdb4b2    call    $b2b4
af7f cdbcb1    call    $b1bc
af82 210000    ld      hl,$0000
af85 226c8e    ld      ($8e6c),hl
af88 22a18c    ld      ($8ca1),hl
af8b 22d48c    ld      ($8cd4),hl
af8e 210000    ld      hl,$0000
af91 22aa8f    ld      ($8faa),hl
af94 22b28f    ld      ($8fb2),hl
af97 22b48f    ld      ($8fb4),hl
af9a 210000    ld      hl,$0000
af9d 7d        ld      a,l
af9e 32cd8c    ld      ($8ccd),a
afa1 7d        ld      a,l
afa2 32608d    ld      ($8d60),a
afa5 210000    ld      hl,$0000
afa8 7d        ld      a,l
afa9 32768f    ld      ($8f76),a
afac 210000    ld      hl,$0000
afaf 229c8f    ld      ($8f9c),hl
afb2 218303    ld      hl,$0383
afb5 22a58c    ld      ($8ca5),hl
afb8 cd443c    call    $3c44
afbb cd3d3c    call    $3c3d
afbe cd455c    call    $5c45
afc1 2a3b8c    ld      hl,($8c3b)
afc4 22988f    ld      ($8f98),hl
afc7 2a398c    ld      hl,($8c39)
afca 229a8f    ld      ($8f9a),hl
afcd cd406c    call    $6c40
afd0 cd8069    call    $6980
afd3 cd7d3c    call    $3c7d
afd6 cdc066    call    $66c0
afd9 cdc066    call    $66c0
afdc cdc066    call    $66c0
afdf 210cb1    ld      hl,$b10c
afe2 e5        push    hl
afe3 cd3e69    call    $693e
afe6 d1        pop     de
afe7 cdc066    call    $66c0
afea 2a638c    ld      hl,($8c63)
afed e5        push    hl
afee cd3e69    call    $693e
aff1 2117b1    ld      hl,$b117
aff4 e3        ex      (sp),hl
aff5 cd3e69    call    $693e
aff8 213cb1    ld      hl,$b13c
affb e3        ex      (sp),hl
affc cd3e69    call    $693e
afff d1        pop     de
b000 cdc066    call    $66c0
b003 cdc066    call    $66c0
b006 2156b1    ld      hl,$b156
b009 e5        push    hl
b00a cd3e69    call    $693e
b00d 2171b1    ld      hl,$b171
b010 e3        ex      (sp),hl
b011 cd3e69    call    $693e
b014 d1        pop     de
b015 cdc066    call    $66c0
b018 2182b1    ld      hl,$b182
b01b e5        push    hl
b01c cd3e69    call    $693e
b01f d1        pop     de
b020 cdc066    call    $66c0
b023 cdc066    call    $66c0
b026 cdc066    call    $66c0
b029 219fb1    ld      hl,$b19f
b02c e5        push    hl
b02d cd3e69    call    $693e
b030 d1        pop     de
b031 cdedb1    call    $b1ed
b034 2ab88f    ld      hl,($8fb8)
b037 22a88f    ld      ($8fa8),hl
b03a 210000    ld      hl,$0000
b03d eb        ex      de,hl
b03e 210400    ld      hl,$0004
b041 39        add     hl,sp
b042 73        ld      (hl),e
b043 23        inc     hl
b044 72        ld      (hl),d
b045 2a8000    ld      hl,($0080)
b048 2600      ld      h,$00
b04a 7c        ld      a,h
b04b b5        or      l
b04c cac7b0    jp      z,$b0c7
b04f 210000    ld      hl,$0000
b052 227a8f    ld      ($8f7a),hl
b055 218200    ld      hl,$0082
b058 e5        push    hl
b059 21e68d    ld      hl,$8de6
b05c 44        ld      b,h
b05d 4d        ld      c,l
b05e e5        push    hl
b05f cd887b    call    $7b88
b062 d1        pop     de
b063 d1        pop     de
b064 60        ld      h,b
b065 69        ld      l,c
b066 7e        ld      a,(hl)
b067 b7        or      a
b068 2825      jr      z,$b08f
b06a 60        ld      h,b
b06b 69        ld      l,c
b06c 5e        ld      e,(hl)
b06d 1600      ld      d,$00
b06f 212e00    ld      hl,$002e
b072 cd4885    call    $8548
b075 2818      jr      z,$b08f
b077 2a7a8f    ld      hl,($8f7a)
b07a 110a00    ld      de,$000a
b07d eb        ex      de,hl
b07e cd6686    call    $8666
b081 280c      jr      z,$b08f
b083 03        inc     bc
b084 60        ld      h,b
b085 69        ld      l,c
b086 2a7a8f    ld      hl,($8f7a)
b089 23        inc     hl
b08a 227a8f    ld      ($8f7a),hl
b08d 18d5      jr      $b064
b08f 60        ld      h,b
b090 69        ld      l,c
b091 5e        ld      e,(hl)
b092 1600      ld      d,$00
b094 212e00    ld      hl,$002e
b097 cd3c85    call    $853c
b09a 281a      jr      z,$b0b6
b09c 21abb1    ld      hl,$b1ab
b09f e5        push    hl
b0a0 c5        push    bc
b0a1 cd4f7b    call    $7b4f
b0a4 d1        pop     de
b0a5 d1        pop     de
b0a6 110000    ld      de,$0000
b0a9 cd3c85    call    $853c
b0ac eb        ex      de,hl
b0ad 210400    ld      hl,$0004
b0b0 39        add     hl,sp
b0b1 73        ld      (hl),e
b0b2 23        inc     hl
b0b3 72        ld      (hl),d
b0b4 1811      jr      $b0c7
b0b6 60        ld      h,b
b0b7 69        ld      l,c
b0b8 5e        ld      e,(hl)
b0b9 1600      ld      d,$00
b0bb eb        ex      de,hl
b0bc cdf685    call    $85f6
b0bf eb        ex      de,hl
b0c0 210400    ld      hl,$0004
b0c3 39        add     hl,sp
b0c4 73        ld      (hl),e
b0c5 23        inc     hl
b0c6 72        ld      (hl),d
b0c7 210400    ld      hl,$0004
b0ca 39        add     hl,sp
b0cb 7e        ld      a,(hl)
b0cc 23        inc     hl
b0cd b6        or      (hl)
b0ce 2013      jr      nz,$b0e3
b0d0 21b0b1    ld      hl,$b1b0
b0d3 e5        push    hl
b0d4 21e68d    ld      hl,$8de6
b0d7 e5        push    hl
b0d8 cd887b    call    $7b88
b0db d1        pop     de
b0dc d1        pop     de
b0dd 210700    ld      hl,$0007
b0e0 227a8f    ld      ($8f7a),hl
b0e3 21b8b1    ld      hl,$b1b8
b0e6 e5        push    hl
b0e7 210a90    ld      hl,$900a
b0ea e5        push    hl
b0eb cdad23    call    $23ad
b0ee d1        pop     de
b0ef 210a90    ld      hl,$900a
b0f2 e3        ex      (sp),hl
b0f3 cd1423    call    $2314
b0f6 d1        pop     de
b0f7 220890    ld      ($9008),hl
b0fa 7c        ld      a,h
b0fb b5        or      l
b0fc 2804      jr      z,$b102
b0fe cd5722    call    $2257
b101 c9        ret     

b102 210000    ld      hl,$0000
b105 229f8c    ld      ($8c9f),hl
b108 cd406c    call    $6c40
b10b c9        ret     

b10c 57        ld      d,a
b10d 65        ld      h,l
b10e 6c        ld      l,h
b10f 63        ld      h,e
b110 6f        ld      l,a
b111 6d        ld      l,l
b112 65        ld      h,l
b113 2074      jr      nz,$b189
b115 6f        ld      l,a
b116 00        nop     
b117 43        ld      b,e
b118 6f        ld      l,a
b119 70        ld      (hl),b
b11a 79        ld      a,c
b11b 72        ld      (hl),d
b11c 69        ld      l,c
b11d 67        ld      h,a
b11e 68        ld      l,b
b11f 74        ld      (hl),h
b120 2028      jr      nz,$b14a
b122 63        ld      h,e
b123 29        add     hl,hl
b124 2031      jr      nz,$b157
b126 39        add     hl,sp
b127 3833      jr      c,$b15c
b129 2c        inc     l
b12a 2044      jr      nz,$b170
b12c 69        ld      l,c
b12d 67        ld      h,a
b12e 69        ld      l,c
b12f 74        ld      (hl),h
b130 61        ld      h,c
b131 6c        ld      l,h
b132 2052      jr      nz,$b186
b134 65        ld      h,l
b135 73        ld      (hl),e
b136 65        ld      h,l
b137 61        ld      h,c
b138 72        ld      (hl),d
b139 63        ld      h,e
b13a 68        ld      l,b
b13b 00        nop     
b13c 50        ld      d,b
b13d 61        ld      h,c
b13e 63        ld      h,e
b13f 69        ld      l,c
b140 66        ld      h,(hl)
b141 69        ld      l,c
b142 63        ld      h,e
b143 2047      jr      nz,$b18c
b145 72        ld      (hl),d
b146 6f        ld      l,a
b147 76        halt    
b148 65        ld      h,l
b149 2c        inc     l
b14a 2043      jr      nz,$b18f
b14c 61        ld      h,c
b14d 6c        ld      l,h
b14e 69        ld      l,c
b14f 66        ld      h,(hl)
b150 6f        ld      l,a
b151 72        ld      (hl),d
b152 6e        ld      l,(hl)
b153 69        ld      l,c
b154 61        ld      h,c
b155 00        nop     
b156 44        ld      b,h
b157 72        ld      (hl),d
b158 2e20      ld      l,$20
b15a 4c        ld      c,h
b15b 6f        ld      l,a
b15c 67        ld      h,a
b15d 6f        ld      l,a
b15e 2069      jr      nz,$b1c9
b160 73        ld      (hl),e
b161 2061      jr      nz,$b1c4
b163 2074      jr      nz,$b1d9
b165 72        ld      (hl),d
b166 61        ld      h,c
b167 64        ld      h,h
b168 65        ld      h,l
b169 6d        ld      l,l
b16a 61        ld      h,c
b16b 72        ld      (hl),d
b16c 6b        ld      l,e
b16d 206f      jr      nz,$b1de
b16f 66        ld      h,(hl)
b170 00        nop     
b171 44        ld      b,h
b172 69        ld      l,c
b173 67        ld      h,a
b174 69        ld      l,c
b175 74        ld      (hl),h
b176 61        ld      h,c
b177 6c        ld      l,h
b178 2052      jr      nz,$b1cc
b17a 65        ld      h,l
b17b 73        ld      (hl),e
b17c 65        ld      h,l
b17d 61        ld      h,c
b17e 72        ld      (hl),d
b17f 63        ld      h,e
b180 68        ld      l,b
b181 00        nop     
b182 2020      jr      nz,$b1a4
b184 2020      jr      nz,$b1a6
b186 50        ld      d,b
b187 72        ld      (hl),d
b188 6f        ld      l,a
b189 64        ld      h,h
b18a 75        ld      (hl),l
b18b 63        ld      h,e
b18c 74        ld      (hl),h
b18d 204e      jr      nz,$b1dd
b18f 6f        ld      l,a
b190 2e20      ld      l,$20
b192 3630      ld      (hl),$30
b194 3032      jr      nc,$b1c8
b196 2d        dec     l
b197 313233    ld      sp,$3332
b19a 322020    ld      ($2020),a
b19d 2000      jr      nz,$b19f
b19f 50        ld      d,b
b1a0 6c        ld      l,h
b1a1 65        ld      h,l
b1a2 61        ld      h,c
b1a3 73        ld      (hl),e
b1a4 65        ld      h,l
b1a5 2057      jr      nz,$b1fe
b1a7 61        ld      h,c
b1a8 69        ld      l,c
b1a9 74        ld      (hl),h
b1aa 00        nop     
b1ab 2e4c      ld      l,$4c
b1ad 4f        ld      c,a
b1ae 47        ld      b,a
b1af 00        nop     
b1b0 53        ld      d,e
b1b1 54        ld      d,h
b1b2 41        ld      b,c
b1b3 52        ld      d,d
b1b4 54        ld      d,h
b1b5 55        ld      d,l
b1b6 50        ld      d,b
b1b7 00        nop     
b1b8 4c        ld      c,h
b1b9 4f        ld      c,a
b1ba 47        ld      b,a
b1bb 00        nop     
b1bc cd9877    call    $7798
b1bf 11faf8    ld      de,$f8fa
b1c2 19        add     hl,de
b1c3 222e90    ld      ($902e),hl
b1c6 cdb38b    call    $8bb3
b1c9 223090    ld      ($9030),hl
b1cc cdb38b    call    $8bb3
b1cf e5        push    hl
b1d0 cd9877    call    $7798
b1d3 d1        pop     de
b1d4 eb        ex      de,hl
b1d5 cd3086    call    $8630
b1d8 11faf8    ld      de,$f8fa
b1db 19        add     hl,de
b1dc 22a78c    ld      ($8ca7),hl
b1df 2aa78c    ld      hl,($8ca7)
b1e2 110400    ld      de,$0004
b1e5 eb        ex      de,hl
b1e6 cd3585    call    $8535
b1e9 22a78c    ld      ($8ca7),hl
b1ec c9        ret     

b1ed cda98b    call    $8ba9
b1f0 cd8069    call    $6980
b1f3 cdab66    call    $66ab
b1f6 210000    ld      hl,$0000
b1f9 44        ld      b,h
b1fa 4d        ld      c,l
b1fb 1803      jr      $b200
b1fd 03        inc     bc
b1fe 60        ld      h,b
b1ff 69        ld      l,c
b200 50        ld      d,b
b201 59        ld      e,c
b202 218000    ld      hl,$0080
b205 cd6c85    call    $856c
b208 280f      jr      z,$b219
b20a 210000    ld      hl,$0000
b20d e5        push    hl
b20e 21708e    ld      hl,$8e70
b211 09        add     hl,bc
b212 09        add     hl,bc
b213 d1        pop     de
b214 73        ld      (hl),e
b215 23        inc     hl
b216 72        ld      (hl),d
b217 18e4      jr      $b1fd
b219 210000    ld      hl,$0000
b21c 22958c    ld      ($8c95),hl
b21f 22b08f    ld      ($8fb0),hl
b222 210000    ld      hl,$0000
b225 229d8c    ld      ($8c9d),hl
b228 210000    ld      hl,$0000
b22b 229b8c    ld      ($8c9b),hl
b22e 2a3090    ld      hl,($9030)
b231 22978c    ld      ($8c97),hl
b234 2aa78c    ld      hl,($8ca7)
b237 22a98c    ld      ($8ca9),hl
b23a cda93c    call    $3ca9
b23d 22998c    ld      ($8c99),hl
b240 217bb2    ld      hl,$b27b
b243 e5        push    hl
b244 cdde4b    call    $4bde
b247 22ce8f    ld      ($8fce),hl
b24a e3        ex      (sp),hl
b24b cde1b9    call    $b9e1
b24e d1        pop     de
b24f 21b801    ld      hl,$01b8
b252 e5        push    hl
b253 2180b2    ld      hl,$b280
b256 e5        push    hl
b257 cd6eb9    call    $b96e
b25a d1        pop     de
b25b d1        pop     de
b25c 22da8f    ld      ($8fda),hl
b25f 219c54    ld      hl,$549c
b262 e5        push    hl
b263 2182b2    ld      hl,$b282
b266 e5        push    hl
b267 cd6eb9    call    $b96e
b26a d1        pop     de
b26b d1        pop     de
b26c 22d88f    ld      ($8fd8),hl
b26f cd84b2    call    $b284
b272 cdfcb2    call    $b2fc
b275 cdd5a9    call    $a9d5
b278 c35db8    jp      $b85d
b27b 2e50      ld      l,$50
b27d 52        ld      d,d
b27e 4d        ld      c,l
b27f 00        nop     
b280 2800      jr      z,$b282
b282 29        add     hl,hl
b283 00        nop     
b284 21b2b2    ld      hl,$b2b2
b287 22728f    ld      ($8f72),hl
b28a 210100    ld      hl,$0001
b28d 227a8f    ld      ($8f7a),hl
b290 cd062f    call    $2f06
b293 21f505    ld      hl,$05f5
b296 e5        push    hl
b297 210a00    ld      hl,$000a
b29a e5        push    hl
b29b cd7d45    call    $457d
b29e d1        pop     de
b29f e3        ex      (sp),hl
b2a0 2ace8f    ld      hl,($8fce)
b2a3 e5        push    hl
b2a4 cdaa41    call    $41aa
b2a7 22dc8f    ld      ($8fdc),hl
b2aa e5        push    hl
b2ab cd5c47    call    $475c
b2ae d1        pop     de
b2af d1        pop     de
b2b0 d1        pop     de
b2b1 c9        ret     

b2b2 2d        dec     l
b2b3 00        nop     
b2b4 cd986c    call    $6c98
b2b7 cd426d    call    $6d42
b2ba 2a418c    ld      hl,($8c41)
b2bd e5        push    hl
b2be cd646d    call    $6d64
b2c1 d1        pop     de
b2c2 2a618c    ld      hl,($8c61)
b2c5 cd2880    call    $8028
b2c8 cda77c    call    $7ca7
b2cb 2a5f8c    ld      hl,($8c5f)
b2ce cd2880    call    $8028
b2d1 cdd87c    call    $7cd8
b2d4 cd417e    call    $7e41
b2d7 cda77c    call    $7ca7
b2da cd8470    call    $7084
b2dd eb        ex      de,hl
b2de cda08b    call    $8ba0
b2e1 2a458c    ld      hl,($8c45)
b2e4 e5        push    hl
b2e5 cd816d    call    $6d81
b2e8 2a438c    ld      hl,($8c43)
b2eb e3        ex      (sp),hl
b2ec cdd86d    call    $6dd8
b2ef d1        pop     de
b2f0 cdda6e    call    $6eda
b2f3 cd3270    call    $7032
b2f6 cd9a6d    call    $6d9a
b2f9 c3011f    jp      $1f01
b2fc 215c08    ld      hl,$085c
b2ff e5        push    hl
b300 21bfb6    ld      hl,$b6bf
b303 e5        push    hl
b304 cd6eb9    call    $b96e
b307 d1        pop     de
b308 d1        pop     de
b309 216d08    ld      hl,$086d
b30c e5        push    hl
b30d 21c5b6    ld      hl,$b6c5
b310 e5        push    hl
b311 cd6eb9    call    $b96e
b314 d1        pop     de
b315 d1        pop     de
b316 216c0a    ld      hl,$0a6c
b319 e5        push    hl
b31a 21c8b6    ld      hl,$b6c8
b31d e5        push    hl
b31e cd6eb9    call    $b96e
b321 d1        pop     de
b322 d1        pop     de
b323 218a08    ld      hl,$088a
b326 e5        push    hl
b327 21cbb6    ld      hl,$b6cb
b32a e5        push    hl
b32b cd6eb9    call    $b96e
b32e d1        pop     de
b32f d1        pop     de
b330 219f08    ld      hl,$089f
b333 e5        push    hl
b334 21d0b6    ld      hl,$b6d0
b337 e5        push    hl
b338 cd6eb9    call    $b96e
b33b d1        pop     de
b33c d1        pop     de
b33d 215f0a    ld      hl,$0a5f
b340 e5        push    hl
b341 21d6b6    ld      hl,$b6d6
b344 e5        push    hl
b345 cd6eb9    call    $b96e
b348 d1        pop     de
b349 d1        pop     de
b34a 21af0a    ld      hl,$0aaf
b34d e5        push    hl
b34e 21ddb6    ld      hl,$b6dd
b351 e5        push    hl
b352 cd6eb9    call    $b96e
b355 d1        pop     de
b356 d1        pop     de
b357 21b80a    ld      hl,$0ab8
b35a e5        push    hl
b35b 21e4b6    ld      hl,$b6e4
b35e e5        push    hl
b35f cd6eb9    call    $b96e
b362 d1        pop     de
b363 d1        pop     de
b364 21d60a    ld      hl,$0ad6
b367 e5        push    hl
b368 21eab6    ld      hl,$b6ea
b36b e5        push    hl
b36c cd6eb9    call    $b96e
b36f d1        pop     de
b370 d1        pop     de
b371 210f0b    ld      hl,$0b0f
b374 e5        push    hl
b375 21efb6    ld      hl,$b6ef
b378 e5        push    hl
b379 cd6eb9    call    $b96e
b37c d1        pop     de
b37d d1        pop     de
b37e 21610b    ld      hl,$0b61
b381 e5        push    hl
b382 21f4b6    ld      hl,$b6f4
b385 e5        push    hl
b386 cd6eb9    call    $b96e
b389 d1        pop     de
b38a d1        pop     de
b38b 21950b    ld      hl,$0b95
b38e e5        push    hl
b38f 21f9b6    ld      hl,$b6f9
b392 e5        push    hl
b393 cd6eb9    call    $b96e
b396 d1        pop     de
b397 d1        pop     de
b398 21ce0b    ld      hl,$0bce
b39b e5        push    hl
b39c 21feb6    ld      hl,$b6fe
b39f e5        push    hl
b3a0 cd6eb9    call    $b96e
b3a3 d1        pop     de
b3a4 d1        pop     de
b3a5 21df0b    ld      hl,$0bdf
b3a8 e5        push    hl
b3a9 2104b7    ld      hl,$b704
b3ac e5        push    hl
b3ad cd6eb9    call    $b96e
b3b0 d1        pop     de
b3b1 d1        pop     de
b3b2 21510c    ld      hl,$0c51
b3b5 e5        push    hl
b3b6 2109b7    ld      hl,$b709
b3b9 e5        push    hl
b3ba cd6eb9    call    $b96e
b3bd d1        pop     de
b3be d1        pop     de
b3bf 213e0d    ld      hl,$0d3e
b3c2 e5        push    hl
b3c3 2111b7    ld      hl,$b711
b3c6 e5        push    hl
b3c7 cd6eb9    call    $b96e
b3ca d1        pop     de
b3cb d1        pop     de
b3cc 21630d    ld      hl,$0d63
b3cf e5        push    hl
b3d0 2119b7    ld      hl,$b719
b3d3 e5        push    hl
b3d4 cd6eb9    call    $b96e
b3d7 d1        pop     de
b3d8 d1        pop     de
b3d9 21f50d    ld      hl,$0df5
b3dc e5        push    hl
b3dd 211cb7    ld      hl,$b71c
b3e0 e5        push    hl
b3e1 cd6eb9    call    $b96e
b3e4 d1        pop     de
b3e5 d1        pop     de
b3e6 21020e    ld      hl,$0e02
b3e9 e5        push    hl
b3ea 2122b7    ld      hl,$b722
b3ed e5        push    hl
b3ee cd6eb9    call    $b96e
b3f1 d1        pop     de
b3f2 d1        pop     de
b3f3 217a0e    ld      hl,$0e7a
b3f6 e5        push    hl
b3f7 2127b7    ld      hl,$b727
b3fa e5        push    hl
b3fb cd6eb9    call    $b96e
b3fe d1        pop     de
b3ff d1        pop     de
b400 216d0f    ld      hl,$0f6d
b403 e5        push    hl
b404 212db7    ld      hl,$b72d
b407 e5        push    hl
b408 cd6eb9    call    $b96e
b40b d1        pop     de
b40c d1        pop     de
b40d 21760f    ld      hl,$0f76
b410 e5        push    hl
b411 2133b7    ld      hl,$b733
b414 e5        push    hl
b415 cd6eb9    call    $b96e
b418 d1        pop     de
b419 d1        pop     de
b41a 21810f    ld      hl,$0f81
b41d e5        push    hl
b41e 2136b7    ld      hl,$b736
b421 e5        push    hl
b422 cd6eb9    call    $b96e
b425 d1        pop     de
b426 d1        pop     de
b427 218314    ld      hl,$1483
b42a e5        push    hl
b42b 2139b7    ld      hl,$b739
b42e e5        push    hl
b42f cd6eb9    call    $b96e
b432 d1        pop     de
b433 d1        pop     de
b434 219914    ld      hl,$1499
b437 e5        push    hl
b438 213eb7    ld      hl,$b73e
b43b e5        push    hl
b43c cd6eb9    call    $b96e
b43f d1        pop     de
b440 d1        pop     de
b441 21d614    ld      hl,$14d6
b444 e5        push    hl
b445 2144b7    ld      hl,$b744
b448 e5        push    hl
b449 cd6eb9    call    $b96e
b44c d1        pop     de
b44d d1        pop     de
b44e 210315    ld      hl,$1503
b451 e5        push    hl
b452 214ab7    ld      hl,$b74a
b455 e5        push    hl
b456 cd6eb9    call    $b96e
b459 d1        pop     de
b45a d1        pop     de
b45b 218d15    ld      hl,$158d
b45e e5        push    hl
b45f 2150b7    ld      hl,$b750
b462 e5        push    hl
b463 cd6eb9    call    $b96e
b466 d1        pop     de
b467 d1        pop     de
b468 21a415    ld      hl,$15a4
b46b e5        push    hl
b46c 2156b7    ld      hl,$b756
b46f e5        push    hl
b470 cd6eb9    call    $b96e
b473 d1        pop     de
b474 d1        pop     de
b475 216616    ld      hl,$1666
b478 e5        push    hl
b479 215cb7    ld      hl,$b75c
b47c e5        push    hl
b47d cd6eb9    call    $b96e
b480 d1        pop     de
b481 d1        pop     de
b482 21d815    ld      hl,$15d8
b485 e5        push    hl
b486 2162b7    ld      hl,$b762
b489 e5        push    hl
b48a cd6eb9    call    $b96e
b48d d1        pop     de
b48e d1        pop     de
b48f 21b315    ld      hl,$15b3
b492 e5        push    hl
b493 2166b7    ld      hl,$b766
b496 e5        push    hl
b497 cd6eb9    call    $b96e
b49a d1        pop     de
b49b d1        pop     de
b49c 215016    ld      hl,$1650
b49f e5        push    hl
b4a0 216cb7    ld      hl,$b76c
b4a3 e5        push    hl
b4a4 cd6eb9    call    $b96e
b4a7 d1        pop     de
b4a8 d1        pop     de
b4a9 21db27    ld      hl,$27db
b4ac e5        push    hl
b4ad 2174b7    ld      hl,$b774
b4b0 e5        push    hl
b4b1 cd6eb9    call    $b96e
b4b4 d1        pop     de
b4b5 d1        pop     de
b4b6 21e127    ld      hl,$27e1
b4b9 e5        push    hl
b4ba 2177b7    ld      hl,$b777
b4bd e5        push    hl
b4be cd6eb9    call    $b96e
b4c1 d1        pop     de
b4c2 d1        pop     de
b4c3 215c11    ld      hl,$115c
b4c6 e5        push    hl
b4c7 217cb7    ld      hl,$b77c
b4ca e5        push    hl
b4cb cd6eb9    call    $b96e
b4ce d1        pop     de
b4cf d1        pop     de
b4d0 218811    ld      hl,$1188
b4d3 e5        push    hl
b4d4 217fb7    ld      hl,$b77f
b4d7 e5        push    hl
b4d8 cd6eb9    call    $b96e
b4db d1        pop     de
b4dc d1        pop     de
b4dd 21aa11    ld      hl,$11aa
b4e0 e5        push    hl
b4e1 2182b7    ld      hl,$b782
b4e4 e5        push    hl
b4e5 cd6eb9    call    $b96e
b4e8 d1        pop     de
b4e9 d1        pop     de
b4ea 21cb11    ld      hl,$11cb
b4ed e5        push    hl
b4ee 2185b7    ld      hl,$b785
b4f1 e5        push    hl
b4f2 cd6eb9    call    $b96e
b4f5 d1        pop     de
b4f6 d1        pop     de
b4f7 21a617    ld      hl,$17a6
b4fa e5        push    hl
b4fb 218ab7    ld      hl,$b78a
b4fe e5        push    hl
b4ff cd6eb9    call    $b96e
b502 d1        pop     de
b503 d1        pop     de
b504 21d517    ld      hl,$17d5
b507 e5        push    hl
b508 2190b7    ld      hl,$b790
b50b e5        push    hl
b50c cd6eb9    call    $b96e
b50f d1        pop     de
b510 d1        pop     de
b511 210f19    ld      hl,$190f
b514 e5        push    hl
b515 2193b7    ld      hl,$b793
b518 e5        push    hl
b519 cd6eb9    call    $b96e
b51c d1        pop     de
b51d d1        pop     de
b51e 212d19    ld      hl,$192d
b521 e5        push    hl
b522 2199b7    ld      hl,$b799
b525 e5        push    hl
b526 cd6eb9    call    $b96e
b529 d1        pop     de
b52a d1        pop     de
b52b 212419    ld      hl,$1924
b52e e5        push    hl
b52f 219db7    ld      hl,$b79d
b532 e5        push    hl
b533 cd6eb9    call    $b96e
b536 d1        pop     de
b537 d1        pop     de
b538 216818    ld      hl,$1868
b53b e5        push    hl
b53c 21a0b7    ld      hl,$b7a0
b53f e5        push    hl
b540 cd6eb9    call    $b96e
b543 d1        pop     de
b544 d1        pop     de
b545 219e18    ld      hl,$189e
b548 e5        push    hl
b549 21a3b7    ld      hl,$b7a3
b54c e5        push    hl
b54d cd6eb9    call    $b96e
b550 d1        pop     de
b551 d1        pop     de
b552 21b318    ld      hl,$18b3
b555 e5        push    hl
b556 21a9b7    ld      hl,$b7a9
b559 e5        push    hl
b55a cd6eb9    call    $b96e
b55d d1        pop     de
b55e d1        pop     de
b55f 21cf18    ld      hl,$18cf
b562 e5        push    hl
b563 21aeb7    ld      hl,$b7ae
b566 e5        push    hl
b567 cd6eb9    call    $b96e
b56a d1        pop     de
b56b d1        pop     de
b56c 21ef18    ld      hl,$18ef
b56f e5        push    hl
b570 21b3b7    ld      hl,$b7b3
b573 e5        push    hl
b574 cd6eb9    call    $b96e
b577 d1        pop     de
b578 d1        pop     de
b579 21fc16    ld      hl,$16fc
b57c e5        push    hl
b57d 21b8b7    ld      hl,$b7b8
b580 e5        push    hl
b581 cd6eb9    call    $b96e
b584 d1        pop     de
b585 d1        pop     de
b586 219217    ld      hl,$1792
b589 e5        push    hl
b58a 21bfb7    ld      hl,$b7bf
b58d e5        push    hl
b58e cd6eb9    call    $b96e
b591 d1        pop     de
b592 d1        pop     de
b593 21db26    ld      hl,$26db
b596 e5        push    hl
b597 21c4b7    ld      hl,$b7c4
b59a e5        push    hl
b59b cd6eb9    call    $b96e
b59e d1        pop     de
b59f d1        pop     de
b5a0 21a126    ld      hl,$26a1
b5a3 e5        push    hl
b5a4 21ccb7    ld      hl,$b7cc
b5a7 e5        push    hl
b5a8 cd6eb9    call    $b96e
b5ab d1        pop     de
b5ac d1        pop     de
b5ad 212125    ld      hl,$2521
b5b0 e5        push    hl
b5b1 21d6b7    ld      hl,$b7d6
b5b4 e5        push    hl
b5b5 cd6eb9    call    $b96e
b5b8 d1        pop     de
b5b9 d1        pop     de
b5ba 211e27    ld      hl,$271e
b5bd e5        push    hl
b5be 21dab7    ld      hl,$b7da
b5c1 e5        push    hl
b5c2 cd6eb9    call    $b96e
b5c5 d1        pop     de
b5c6 d1        pop     de
b5c7 21f525    ld      hl,$25f5
b5ca e5        push    hl
b5cb 21deb7    ld      hl,$b7de
b5ce e5        push    hl
b5cf cd6eb9    call    $b96e
b5d2 d1        pop     de
b5d3 d1        pop     de
b5d4 213a26    ld      hl,$263a
b5d7 e5        push    hl
b5d8 21e3b7    ld      hl,$b7e3
b5db e5        push    hl
b5dc cd6eb9    call    $b96e
b5df d1        pop     de
b5e0 d1        pop     de
b5e1 217c27    ld      hl,$277c
b5e4 e5        push    hl
b5e5 21e8b7    ld      hl,$b7e8
b5e8 e5        push    hl
b5e9 cd6eb9    call    $b96e
b5ec d1        pop     de
b5ed d1        pop     de
b5ee 219827    ld      hl,$2798
b5f1 e5        push    hl
b5f2 21f1b7    ld      hl,$b7f1
b5f5 e5        push    hl
b5f6 cd6eb9    call    $b96e
b5f9 d1        pop     de
b5fa d1        pop     de
b5fb 21bf77    ld      hl,$77bf
b5fe e5        push    hl
b5ff 21f6b7    ld      hl,$b7f6
b602 e5        push    hl
b603 cd6eb9    call    $b96e
b606 d1        pop     de
b607 d1        pop     de
b608 21fe77    ld      hl,$77fe
b60b e5        push    hl
b60c 21fdb7    ld      hl,$b7fd
b60f e5        push    hl
b610 cd6eb9    call    $b96e
b613 d1        pop     de
b614 d1        pop     de
b615 21df11    ld      hl,$11df
b618 e5        push    hl
b619 2105b8    ld      hl,$b805
b61c e5        push    hl
b61d cd6eb9    call    $b96e
b620 d1        pop     de
b621 d1        pop     de
b622 214212    ld      hl,$1242
b625 e5        push    hl
b626 210bb8    ld      hl,$b80b
b629 e5        push    hl
b62a cd6eb9    call    $b96e
b62d d1        pop     de
b62e d1        pop     de
b62f 214f12    ld      hl,$124f
b632 e5        push    hl
b633 2111b8    ld      hl,$b811
b636 e5        push    hl
b637 cd6eb9    call    $b96e
b63a d1        pop     de
b63b d1        pop     de
b63c 21a412    ld      hl,$12a4
b63f e5        push    hl
b640 2117b8    ld      hl,$b817
b643 e5        push    hl
b644 cd6eb9    call    $b96e
b647 d1        pop     de
b648 d1        pop     de
b649 219e12    ld      hl,$129e
b64c e5        push    hl
b64d 211ab8    ld      hl,$b81a
b650 e5        push    hl
b651 cd6eb9    call    $b96e
b654 d1        pop     de
b655 d1        pop     de
b656 21b313    ld      hl,$13b3
b659 e5        push    hl
b65a 2120b8    ld      hl,$b820
b65d e5        push    hl
b65e cd6eb9    call    $b96e
b661 d1        pop     de
b662 d1        pop     de
b663 21d53d    ld      hl,$3dd5
b666 e5        push    hl
b667 2126b8    ld      hl,$b826
b66a e5        push    hl
b66b cd6eb9    call    $b96e
b66e d1        pop     de
b66f d1        pop     de
b670 21be13    ld      hl,$13be
b673 e5        push    hl
b674 212eb8    ld      hl,$b82e
b677 e5        push    hl
b678 cd6eb9    call    $b96e
b67b d1        pop     de
b67c d1        pop     de
b67d 21df13    ld      hl,$13df
b680 e5        push    hl
b681 2138b8    ld      hl,$b838
b684 e5        push    hl
b685 cd6eb9    call    $b96e
b688 d1        pop     de
b689 d1        pop     de
b68a 21e813    ld      hl,$13e8
b68d e5        push    hl
b68e 213eb8    ld      hl,$b83e
b691 e5        push    hl
b692 cd6eb9    call    $b96e
b695 d1        pop     de
b696 d1        pop     de
b697 211314    ld      hl,$1413
b69a e5        push    hl
b69b 2146b8    ld      hl,$b846
b69e e5        push    hl
b69f cd6eb9    call    $b96e
b6a2 d1        pop     de
b6a3 d1        pop     de
b6a4 213b14    ld      hl,$143b
b6a7 e5        push    hl
b6a8 214cb8    ld      hl,$b84c
b6ab e5        push    hl
b6ac cd6eb9    call    $b96e
b6af d1        pop     de
b6b0 d1        pop     de
b6b1 21e516    ld      hl,$16e5
b6b4 e5        push    hl
b6b5 2154b8    ld      hl,$b854
b6b8 e5        push    hl
b6b9 cd6eb9    call    $b96e
b6bc d1        pop     de
b6bd d1        pop     de
b6be c9        ret     

b6bf 61        ld      h,c
b6c0 73        ld      (hl),e
b6c1 63        ld      h,e
b6c2 69        ld      l,c
b6c3 69        ld      l,c
b6c4 00        nop     
b6c5 62        ld      h,d
b6c6 66        ld      h,(hl)
b6c7 00        nop     
b6c8 62        ld      h,d
b6c9 6c        ld      l,h
b6ca 00        nop     
b6cb 63        ld      h,e
b6cc 68        ld      l,b
b6cd 61        ld      h,c
b6ce 72        ld      (hl),d
b6cf 00        nop     
b6d0 63        ld      h,e
b6d1 6f        ld      l,a
b6d2 75        ld      (hl),l
b6d3 6e        ld      l,(hl)
b6d4 74        ld      (hl),h
b6d5 00        nop     
b6d6 65        ld      h,l
b6d7 6d        ld      l,l
b6d8 70        ld      (hl),b
b6d9 74        ld      (hl),h
b6da 79        ld      a,c
b6db 70        ld      (hl),b
b6dc 00        nop     
b6dd 65        ld      h,l
b6de 71        ld      (hl),c
b6df 75        ld      (hl),l
b6e0 61        ld      h,c
b6e1 6c        ld      l,h
b6e2 70        ld      (hl),b
b6e3 00        nop     
b6e4 66        ld      h,(hl)
b6e5 69        ld      l,c
b6e6 72        ld      (hl),d
b6e7 73        ld      (hl),e
b6e8 74        ld      (hl),h
b6e9 00        nop     
b6ea 66        ld      h,(hl)
b6eb 70        ld      (hl),b
b6ec 75        ld      (hl),l
b6ed 74        ld      (hl),h
b6ee 00        nop     
b6ef 69        ld      l,c
b6f0 74        ld      (hl),h
b6f1 65        ld      h,l
b6f2 6d        ld      l,l
b6f3 00        nop     
b6f4 6c        ld      l,h
b6f5 61        ld      h,c
b6f6 73        ld      (hl),e
b6f7 74        ld      (hl),h
b6f8 00        nop     
b6f9 6c        ld      l,h
b6fa 69        ld      l,c
b6fb 73        ld      (hl),e
b6fc 74        ld      (hl),h
b6fd 00        nop     
b6fe 6c        ld      l,h
b6ff 69        ld      l,c
b700 73        ld      (hl),e
b701 74        ld      (hl),h
b702 70        ld      (hl),b
b703 00        nop     
b704 6c        ld      l,h
b705 70        ld      (hl),b
b706 75        ld      (hl),l
b707 74        ld      (hl),h
b708 00        nop     
b709 6d        ld      l,l
b70a 65        ld      h,l
b70b 6d        ld      l,l
b70c 62        ld      h,d
b70d 65        ld      h,l
b70e 72        ld      (hl),d
b70f 70        ld      (hl),b
b710 00        nop     
b711 6e        ld      l,(hl)
b712 75        ld      (hl),l
b713 6d        ld      l,l
b714 62        ld      h,d
b715 65        ld      h,l
b716 72        ld      (hl),d
b717 70        ld      (hl),b
b718 00        nop     
b719 73        ld      (hl),e
b71a 65        ld      h,l
b71b 00        nop     
b71c 77        ld      (hl),a
b71d 6f        ld      l,a
b71e 72        ld      (hl),d
b71f 64        ld      h,h
b720 70        ld      (hl),b
b721 00        nop     
b722 77        ld      (hl),a
b723 6f        ld      l,a
b724 72        ld      (hl),d
b725 64        ld      h,h
b726 00        nop     
b727 70        ld      (hl),b
b728 69        ld      l,c
b729 65        ld      h,l
b72a 63        ld      h,e
b72b 65        ld      h,l
b72c 00        nop     
b72d 77        ld      (hl),a
b72e 68        ld      l,b
b72f 65        ld      h,l
b730 72        ld      (hl),d
b731 65        ld      h,l
b732 00        nop     
b733 75        ld      (hl),l
b734 63        ld      h,e
b735 00        nop     
b736 6c        ld      l,h
b737 63        ld      h,e
b738 00        nop     
b739 6d        ld      l,l
b73a 61        ld      h,c
b73b 6b        ld      l,e
b73c 65        ld      h,l
b73d 00        nop     
b73e 6c        ld      l,h
b73f 6f        ld      l,a
b740 63        ld      h,e
b741 61        ld      h,c
b742 6c        ld      l,h
b743 00        nop     
b744 6e        ld      l,(hl)
b745 61        ld      h,c
b746 6d        ld      l,l
b747 65        ld      h,l
b748 70        ld      (hl),b
b749 00        nop     
b74a 74        ld      (hl),h
b74b 68        ld      l,b
b74c 69        ld      l,c
b74d 6e        ld      l,(hl)
b74e 67        ld      h,a
b74f 00        nop     
b750 67        ld      h,a
b751 70        ld      (hl),b
b752 72        ld      (hl),d
b753 6f        ld      l,a
b754 70        ld      (hl),b
b755 00        nop     
b756 70        ld      (hl),b
b757 6c        ld      l,h
b758 69        ld      l,c
b759 73        ld      (hl),e
b75a 74        ld      (hl),h
b75b 00        nop     
b75c 67        ld      h,a
b75d 6c        ld      l,h
b75e 69        ld      l,c
b75f 73        ld      (hl),e
b760 74        ld      (hl),h
b761 00        nop     
b762 70        ld      (hl),b
b763 70        ld      (hl),b
b764 73        ld      (hl),e
b765 00        nop     
b766 70        ld      (hl),b
b767 70        ld      (hl),b
b768 72        ld      (hl),d
b769 6f        ld      l,a
b76a 70        ld      (hl),b
b76b 00        nop     
b76c 72        ld      (hl),d
b76d 65        ld      h,l
b76e 6d        ld      l,l
b76f 70        ld      (hl),b
b770 72        ld      (hl),d
b771 6f        ld      l,a
b772 70        ld      (hl),b
b773 00        nop     
b774 70        ld      (hl),b
b775 72        ld      (hl),d
b776 00        nop     
b777 74        ld      (hl),h
b778 79        ld      a,c
b779 70        ld      (hl),b
b77a 65        ld      h,l
b77b 00        nop     
b77c 72        ld      (hl),d
b77d 71        ld      (hl),c
b77e 00        nop     
b77f 72        ld      (hl),d
b780 63        ld      h,e
b781 00        nop     
b782 72        ld      (hl),d
b783 6c        ld      l,h
b784 00        nop     
b785 73        ld      (hl),e
b786 68        ld      l,b
b787 6f        ld      l,a
b788 77        ld      (hl),a
b789 00        nop     
b78a 65        ld      h,l
b78b 64        ld      h,h
b78c 61        ld      h,c
b78d 6c        ld      l,h
b78e 6c        ld      l,h
b78f 00        nop     
b790 65        ld      h,l
b791 64        ld      h,h
b792 00        nop     
b793 65        ld      h,l
b794 72        ld      (hl),d
b795 61        ld      h,c
b796 6c        ld      l,h
b797 6c        ld      l,h
b798 00        nop     
b799 65        ld      h,l
b79a 72        ld      (hl),d
b79b 6e        ld      l,(hl)
b79c 00        nop     
b79d 65        ld      h,l
b79e 72        ld      (hl),d
b79f 00        nop     
b7a0 70        ld      (hl),b
b7a1 6f        ld      l,a
b7a2 00        nop     
b7a3 70        ld      (hl),b
b7a4 6f        ld      l,a
b7a5 61        ld      h,c
b7a6 6c        ld      l,h
b7a7 6c        ld      l,h
b7a8 00        nop     
b7a9 70        ld      (hl),b
b7aa 6f        ld      l,a
b7ab 74        ld      (hl),h
b7ac 73        ld      (hl),e
b7ad 00        nop     
b7ae 70        ld      (hl),b
b7af 6f        ld      l,a
b7b0 6e        ld      l,(hl)
b7b1 73        ld      (hl),e
b7b2 00        nop     
b7b3 70        ld      (hl),b
b7b4 6f        ld      l,a
b7b5 70        ld      (hl),b
b7b6 73        ld      (hl),e
b7b7 00        nop     
b7b8 64        ld      h,h
b7b9 65        ld      h,l
b7ba 66        ld      h,(hl)
b7bb 69        ld      l,c
b7bc 6e        ld      l,(hl)
b7bd 65        ld      h,l
b7be 00        nop     
b7bf 74        ld      (hl),h
b7c0 65        ld      h,l
b7c1 78        ld      a,b
b7c2 74        ld      (hl),h
b7c3 00        nop     
b7c4 63        ld      h,e
b7c5 68        ld      l,b
b7c6 61        ld      h,c
b7c7 6e        ld      l,(hl)
b7c8 67        ld      h,a
b7c9 65        ld      h,l
b7ca 66        ld      h,(hl)
b7cb 00        nop     
b7cc 65        ld      h,l
b7cd 72        ld      (hl),d
b7ce 61        ld      h,c
b7cf 73        ld      (hl),e
b7d0 65        ld      h,l
b7d1 66        ld      h,(hl)
b7d2 69        ld      l,c
b7d3 6c        ld      l,h
b7d4 65        ld      h,l
b7d5 00        nop     
b7d6 65        ld      h,l
b7d7 64        ld      h,h
b7d8 66        ld      h,(hl)
b7d9 00        nop     
b7da 64        ld      h,h
b7db 69        ld      l,c
b7dc 72        ld      (hl),d
b7dd 00        nop     
b7de 6c        ld      l,h
b7df 6f        ld      l,a
b7e0 61        ld      h,c
b7e1 64        ld      h,h
b7e2 00        nop     
b7e3 73        ld      (hl),e
b7e4 61        ld      h,c
b7e5 76        halt    
b7e6 65        ld      h,l
b7e7 00        nop     
b7e8 64        ld      h,h
b7e9 65        ld      h,l
b7ea 66        ld      h,(hl)
b7eb 61        ld      h,c
b7ec 75        ld      (hl),l
b7ed 6c        ld      l,h
b7ee 74        ld      (hl),h
b7ef 64        ld      h,h
b7f0 00        nop     
b7f1 73        ld      (hl),e
b7f2 65        ld      h,l
b7f3 74        ld      (hl),h
b7f4 64        ld      h,h
b7f5 00        nop     
b7f6 63        ld      h,e
b7f7 6f        ld      l,a
b7f8 70        ld      (hl),b
b7f9 79        ld      a,c
b7fa 6f        ld      l,a
b7fb 6e        ld      l,(hl)
b7fc 00        nop     
b7fd 63        ld      h,e
b7fe 6f        ld      l,a
b7ff 70        ld      (hl),b
b800 79        ld      a,c
b801 6f        ld      l,a
b802 66        ld      h,(hl)
b803 66        ld      h,(hl)
b804 00        nop     
b805 63        ld      h,e
b806 61        ld      h,c
b807 74        ld      (hl),h
b808 63        ld      h,e
b809 68        ld      l,b
b80a 00        nop     
b80b 65        ld      h,l
b80c 72        ld      (hl),d
b80d 72        ld      (hl),d
b80e 6f        ld      l,a
b80f 72        ld      (hl),d
b810 00        nop     
b811 74        ld      (hl),h
b812 68        ld      l,b
b813 72        ld      (hl),d
b814 6f        ld      l,a
b815 77        ld      (hl),a
b816 00        nop     
b817 67        ld      h,a
b818 6f        ld      l,a
b819 00        nop     
b81a 6c        ld      l,h
b81b 61        ld      h,c
b81c 62        ld      h,d
b81d 65        ld      h,l
b81e 6c        ld      l,h
b81f 00        nop     
b820 6e        ld      l,(hl)
b821 6f        ld      l,a
b822 64        ld      h,h
b823 65        ld      h,l
b824 73        ld      (hl),e
b825 00        nop     
b826 72        ld      (hl),d
b827 65        ld      h,l
b828 63        ld      h,e
b829 79        ld      a,c
b82a 63        ld      h,e
b82b 6c        ld      l,h
b82c 65        ld      h,l
b82d 00        nop     
b82e 2e63      ld      l,$63
b830 6f        ld      l,a
b831 6e        ld      l,(hl)
b832 74        ld      (hl),h
b833 65        ld      h,l
b834 6e        ld      l,(hl)
b835 74        ld      (hl),h
b836 73        ld      (hl),e
b837 00        nop     
b838 74        ld      (hl),h
b839 72        ld      (hl),d
b83a 61        ld      h,c
b83b 63        ld      h,e
b83c 65        ld      h,l
b83d 00        nop     
b83e 6e        ld      l,(hl)
b83f 6f        ld      l,a
b840 74        ld      (hl),h
b841 72        ld      (hl),d
b842 61        ld      h,c
b843 63        ld      h,e
b844 65        ld      h,l
b845 00        nop     
b846 77        ld      (hl),a
b847 61        ld      h,c
b848 74        ld      (hl),h
b849 63        ld      h,e
b84a 68        ld      l,b
b84b 00        nop     
b84c 6e        ld      l,(hl)
b84d 6f        ld      l,a
b84e 77        ld      (hl),a
b84f 61        ld      h,c
b850 74        ld      (hl),h
b851 63        ld      h,e
b852 68        ld      l,b
b853 00        nop     
b854 6e        ld      l,(hl)
b855 6f        ld      l,a
b856 66        ld      h,(hl)
b857 6f        ld      l,a
b858 72        ld      (hl),d
b859 6d        ld      l,l
b85a 61        ld      h,c
b85b 74        ld      (hl),h
b85c 00        nop     
b85d 2120b9    ld      hl,$b920
b860 e5        push    hl
b861 cdde4b    call    $4bde
b864 22b88f    ld      ($8fb8),hl
b867 e3        ex      (sp),hl
b868 cde1b9    call    $b9e1
b86b 2125b9    ld      hl,$b925
b86e e3        ex      (sp),hl
b86f cdde4b    call    $4bde
b872 22ba8f    ld      ($8fba),hl
b875 e3        ex      (sp),hl
b876 cde1b9    call    $b9e1
b879 212bb9    ld      hl,$b92b
b87c e3        ex      (sp),hl
b87d cdde4b    call    $4bde
b880 22bc8f    ld      ($8fbc),hl
b883 e3        ex      (sp),hl
b884 cde1b9    call    $b9e1
b887 d1        pop     de
b888 211200    ld      hl,$0012
b88b 22be8f    ld      ($8fbe),hl
b88e 211400    ld      hl,$0014
b891 22c08f    ld      ($8fc0),hl
b894 211600    ld      hl,$0016
b897 22c28f    ld      ($8fc2),hl
b89a 211800    ld      hl,$0018
b89d 22de8f    ld      ($8fde),hl
b8a0 2130b9    ld      hl,$b930
b8a3 e5        push    hl
b8a4 cdde4b    call    $4bde
b8a7 22c48f    ld      ($8fc4),hl
b8aa e3        ex      (sp),hl
b8ab cde1b9    call    $b9e1
b8ae 2135b9    ld      hl,$b935
b8b1 e3        ex      (sp),hl
b8b2 cdde4b    call    $4bde
b8b5 22c68f    ld      ($8fc6),hl
b8b8 e3        ex      (sp),hl
b8b9 cde1b9    call    $b9e1
b8bc 213ab9    ld      hl,$b93a
b8bf e3        ex      (sp),hl
b8c0 cdde4b    call    $4bde
b8c3 22c88f    ld      ($8fc8),hl
b8c6 e3        ex      (sp),hl
b8c7 cde1b9    call    $b9e1
b8ca 213fb9    ld      hl,$b93f
b8cd e3        ex      (sp),hl
b8ce cdde4b    call    $4bde
b8d1 22ca8f    ld      ($8fca),hl
b8d4 e3        ex      (sp),hl
b8d5 cde1b9    call    $b9e1
b8d8 2144b9    ld      hl,$b944
b8db e3        ex      (sp),hl
b8dc cdde4b    call    $4bde
b8df 22cc8f    ld      ($8fcc),hl
b8e2 e3        ex      (sp),hl
b8e3 cde1b9    call    $b9e1
b8e6 2149b9    ld      hl,$b949
b8e9 e3        ex      (sp),hl
b8ea cdde4b    call    $4bde
b8ed 22d48f    ld      ($8fd4),hl
b8f0 e3        ex      (sp),hl
b8f1 cde1b9    call    $b9e1
b8f4 2152b9    ld      hl,$b952
b8f7 e3        ex      (sp),hl
b8f8 cdde4b    call    $4bde
b8fb 22d08f    ld      ($8fd0),hl
b8fe e3        ex      (sp),hl
b8ff cde1b9    call    $b9e1
b902 2159b9    ld      hl,$b959
b905 e3        ex      (sp),hl
b906 cdde4b    call    $4bde
b909 22d28f    ld      ($8fd2),hl
b90c e3        ex      (sp),hl
b90d cde1b9    call    $b9e1
b910 2160b9    ld      hl,$b960
b913 e3        ex      (sp),hl
b914 cdde4b    call    $4bde
b917 22d68f    ld      ($8fd6),hl
b91a e3        ex      (sp),hl
b91b cde1b9    call    $b9e1
b91e d1        pop     de
b91f c9        ret     

b920 54        ld      d,h
b921 52        ld      d,d
b922 55        ld      d,l
b923 45        ld      b,l
b924 00        nop     
b925 46        ld      b,(hl)
b926 41        ld      b,c
b927 4c        ld      c,h
b928 53        ld      d,e
b929 45        ld      b,l
b92a 00        nop     
b92b 2e44      ld      l,$44
b92d 45        ld      b,l
b92e 46        ld      b,(hl)
b92f 00        nop     
b930 2e41      ld      l,$41
b932 50        ld      d,b
b933 56        ld      d,(hl)
b934 00        nop     
b935 2e46      ld      l,$46
b937 4d        ld      c,l
b938 54        ld      d,h
b939 00        nop     
b93a 2e53      ld      l,$53
b93c 50        ld      d,b
b93d 43        ld      b,e
b93e 00        nop     
b93f 2e52      ld      l,$52
b941 45        ld      b,l
b942 4d        ld      c,l
b943 00        nop     
b944 2e45      ld      l,$45
b946 4e        ld      c,(hl)
b947 4c        ld      c,h
b948 00        nop     
b949 54        ld      d,h
b94a 4f        ld      c,a
b94b 50        ld      d,b
b94c 4c        ld      c,h
b94d 45        ld      b,l
b94e 56        ld      d,(hl)
b94f 45        ld      b,l
b950 4c        ld      c,h
b951 00        nop     
b952 52        ld      d,d
b953 45        ld      b,l
b954 44        ld      b,h
b955 45        ld      b,l
b956 46        ld      b,(hl)
b957 50        ld      d,b
b958 00        nop     
b959 45        ld      b,l
b95a 52        ld      d,d
b95b 52        ld      d,d
b95c 41        ld      b,c
b95d 43        ld      b,e
b95e 54        ld      d,h
b95f 00        nop     
b960 61        ld      h,c
b961 6e        ld      l,(hl)
b962 2065      jr      nz,$b9c9
b964 6d        ld      l,l
b965 70        ld      (hl),b
b966 74        ld      (hl),h
b967 79        ld      a,c
b968 2077      jr      nz,$b9e1
b96a 6f        ld      l,a
b96b 72        ld      (hl),d
b96c 64        ld      h,h
b96d 00        nop     
b96e cda98b    call    $8ba9
b971 210800    ld      hl,$0008
b974 39        add     hl,sp
b975 4e        ld      c,(hl)
b976 23        inc     hl
b977 46        ld      b,(hl)
b978 60        ld      h,b
b979 69        ld      l,c
b97a 7e        ld      a,(hl)
b97b b7        or      a
b97c 285f      jr      z,$b9dd
b97e 60        ld      h,b
b97f 69        ld      l,c
b980 22728f    ld      ($8f72),hl
b983 210000    ld      hl,$0000
b986 227a8f    ld      ($8f7a),hl
b989 1807      jr      $b992
b98b 2a7a8f    ld      hl,($8f7a)
b98e 23        inc     hl
b98f 227a8f    ld      ($8f7a),hl
b992 60        ld      h,b
b993 69        ld      l,c
b994 7e        ld      a,(hl)
b995 b7        or      a
b996 2812      jr      z,$b9aa
b998 60        ld      h,b
b999 69        ld      l,c
b99a 5e        ld      e,(hl)
b99b 1600      ld      d,$00
b99d 212000    ld      hl,$0020
b9a0 cd4885    call    $8548
b9a3 2805      jr      z,$b9aa
b9a5 03        inc     bc
b9a6 60        ld      h,b
b9a7 69        ld      l,c
b9a8 18e1      jr      $b98b
b9aa cda631    call    $31a6
b9ad cd1f30    call    $301f
b9b0 210a00    ld      hl,$000a
b9b3 39        add     hl,sp
b9b4 5e        ld      e,(hl)
b9b5 23        inc     hl
b9b6 56        ld      d,(hl)
b9b7 d5        push    de
b9b8 210a00    ld      hl,$000a
b9bb e5        push    hl
b9bc cd7d45    call    $457d
b9bf d1        pop     de
b9c0 e3        ex      (sp),hl
b9c1 2ace8f    ld      hl,($8fce)
b9c4 e5        push    hl
b9c5 cdaa41    call    $41aa
b9c8 22f48f    ld      ($8ff4),hl
b9cb e5        push    hl
b9cc cd5c47    call    $475c
b9cf d1        pop     de
b9d0 d1        pop     de
b9d1 d1        pop     de
b9d2 60        ld      h,b
b9d3 69        ld      l,c
b9d4 7e        ld      a,(hl)
b9d5 b7        or      a
b9d6 2803      jr      z,$b9db
b9d8 03        inc     bc
b9d9 60        ld      h,b
b9da 69        ld      l,c
b9db 189b      jr      $b978
b9dd 2af48f    ld      hl,($8ff4)
b9e0 c9        ret     

b9e1 cda98b    call    $8ba9
b9e4 2ab08f    ld      hl,($8fb0)
b9e7 e5        push    hl
b9e8 210a00    ld      hl,$000a
b9eb 39        add     hl,sp
b9ec 5e        ld      e,(hl)
b9ed 23        inc     hl
b9ee 56        ld      d,(hl)
b9ef d5        push    de
b9f0 cd7d45    call    $457d
b9f3 d1        pop     de
b9f4 d1        pop     de
b9f5 22b08f    ld      ($8fb0),hl
b9f8 c9        ret     

b9f9 1a        ld      a,(de)
b9fa 1a        ld      a,(de)
b9fb 1a        ld      a,(de)
b9fc 1a        ld      a,(de)
b9fd 1a        ld      a,(de)
b9fe 1a        ld      a,(de)
b9ff 1a        ld      a,(de)
ba00 00        nop     
ba01 00        nop     
ba02 00        nop     
ba03 00        nop     
ba04 00        nop     
ba05 00        nop     
ba06 00        nop     
ba07 00        nop     
ba08 00        nop     
ba09 00        nop     
ba0a 00        nop     
ba0b 00        nop     
ba0c 00        nop     
ba0d 00        nop     
ba0e 00        nop     
ba0f 00        nop     
ba10 00        nop     
ba11 00        nop     
ba12 00        nop     
ba13 00        nop     
ba14 00        nop     
ba15 00        nop     
ba16 00        nop     
ba17 00        nop     
ba18 00        nop     
ba19 00        nop     
ba1a 00        nop     
ba1b 00        nop     
ba1c 00        nop     
ba1d 00        nop     
ba1e 00        nop     
ba1f 00        nop     
ba20 00        nop     
ba21 00        nop     
ba22 00        nop     
ba23 00        nop     
ba24 00        nop     
ba25 00        nop     
ba26 00        nop     
ba27 00        nop     
ba28 00        nop     
ba29 00        nop     
ba2a 00        nop     
ba2b 00        nop     
