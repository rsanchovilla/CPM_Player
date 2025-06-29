; Disassembly of the file "E:\Tmp\cpm\cpm\Ok\Graphics\Dazzler\_dz\build\spacewar_0000.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Thursday, 18 of January 2024 at 11:15 PM
; 
0000 c3c00c    jp      $0cc0
0003 00        nop     
0004 00        nop     
0005 00        nop     
0006 00        nop     
0007 00        nop     
0008 cd4800    call    $0048
000b c30b00    jp      $000b
000e 00        nop     
000f 00        nop     
0010 cd4800    call    $0048
0013 c31300    jp      $0013
0016 00        nop     
0017 00        nop     
0018 cd4800    call    $0048
001b c31b00    jp      $001b
001e 00        nop     
001f 00        nop     
0020 cd4800    call    $0048
0023 c32300    jp      $0023
0026 00        nop     
0027 00        nop     
0028 cd4800    call    $0048
002b c32b00    jp      $002b
002e 00        nop     
002f 00        nop     
0030 cd4800    call    $0048
0033 c33300    jp      $0033
0036 00        nop     
0037 00        nop     
0038 cd4800    call    $0048
003b c33b00    jp      $003b
003e 08        ex      af,af'
003f 00        nop     
0040 00        nop     
0041 00        nop     
0042 00        nop     
0043 00        nop     
0044 00        nop     
0045 00        nop     
0046 e6df      and     $df
0048 224400    ld      ($0044),hl
004b 210000    ld      hl,$0000
004e 39        add     hl,sp
004f 224600    ld      ($0046),hl
0052 314400    ld      sp,$0044
0055 d5        push    de
0056 c5        push    bc
0057 f5        push    af
0058 f9        ld      sp,hl
0059 c9        ret     

005a 00        nop     
005b 00        nop     
005c 00        nop     
005d 16a4      ld      d,$a4
005f 02        ld      (bc),a
0060 00        nop     
0061 3000      jr      nc,$0063
0063 c0        ret     nz

0064 00        nop     
0065 00        nop     
0066 20f6      jr      nz,$005e
0068 55        ld      d,l
0069 c0        ret     nz

006a 4b        ld      c,e
006b b4        or      h
006c f8        ret     m

006d 18e3      jr      $0052
006f d5        push    de
0070 1e4d      ld      e,$4d
0072 10fe      djnz    $0072
0074 ef        rst     $28
0075 ff        rst     $38
0076 3e1c      ld      a,$1c
0078 02        ld      (bc),a
0079 2e1c      ld      l,$1c
007b 02        ld      (bc),a
007c 4e        ld      c,(hl)
007d 1c        inc     e
007e 02        ld      (bc),a
007f 1e1c      ld      e,$1c
0081 02        ld      (bc),a
0082 5e        ld      e,(hl)
0083 1c        inc     e
0084 02        ld      (bc),a
0085 0e1c      ld      c,$1c
0087 02        ld      (bc),a
0088 6e        ld      l,(hl)
0089 1c        inc     e
008a 204e      jr      nz,$00da
008c 1c        inc     e
008d 205e      jr      nz,$00ed
008f 1c        inc     e
0090 206e      jr      nz,$0100
0092 1c        inc     e
0093 204d      jr      nz,$00e2
0095 1c        inc     e
0096 205d      jr      nz,$00f5
0098 1c        inc     e
0099 206d      jr      nz,$0108
009b 1c        inc     e
009c ff        rst     $38
009d 59        ld      e,c
009e 1c        inc     e
009f ff        rst     $38
00a0 59        ld      e,c
00a1 1c        inc     e
00a2 2058      jr      nz,$00fc
00a4 1c        inc     e
00a5 1058      djnz    $00ff
00a7 1c        inc     e
00a8 ff        rst     $38
00a9 00        nop     
00aa 00        nop     
00ab 00        nop     
00ac 00        nop     
00ad 00        nop     
00ae 00        nop     
00af 00        nop     
00b0 00        nop     
00b1 f0        ret     p

00b2 00        nop     
00b3 87        add     a,a
00b4 00        nop     
00b5 20bc      jr      nz,$0073
00b7 02        ld      (bc),a
00b8 00        nop     
00b9 00        nop     
00ba f8        ret     m

00bb 6f        ld      l,a
00bc 93        sub     e
00bd 2d        dec     l
00be 56        ld      d,(hl)
00bf 04        inc     b
00c0 e21af8    jp      po,$f81a
00c3 ff        rst     $38
00c4 3c        inc     a
00c5 1c        inc     e
00c6 80        add     a,b
00c7 2b        dec     hl
00c8 1c        inc     e
00c9 40        ld      b,b
00ca 3c        inc     a
00cb 1c        inc     e
00cc 08        ex      af,af'
00cd 1b        dec     de
00ce 1c        inc     e
00cf 201a      jr      nz,$00eb
00d1 1c        inc     e
00d2 102c      djnz    $0100
00d4 1c        inc     e
00d5 80        add     a,b
00d6 3b        dec     sp
00d7 1c        inc     e
00d8 80        add     a,b
00d9 2c        inc     l
00da 1c        inc     e
00db 08        ex      af,af'
00dc 3d        dec     a
00dd 1c        inc     e
00de 104d      djnz    $012d
00e0 1c        inc     e
00e1 08        ex      af,af'
00e2 4c        ld      c,h
00e3 1c        inc     e
00e4 105c      djnz    $0142
00e6 1c        inc     e
00e7 04        inc     b
00e8 5d        ld      e,l
00e9 1c        inc     e
00ea ff        rst     $38
00eb 76        halt    
00ec 1b        dec     de
00ed 1076      djnz    $0165
00ef 1b        dec     de
00f0 40        ld      b,b
00f1 66        ld      h,(hl)
00f2 1b        dec     de
00f3 ff        rst     $38
00f4 56        ld      d,(hl)
00f5 1b        dec     de
00f6 ff        rst     $38
00f7 00        nop     
00f8 00        nop     
00f9 00        nop     
00fa 00        nop     
00fb 00        nop     
00fc 00        nop     
00fd 00        nop     
00fe 00        nop     
00ff f6f3      or      $f3
0101 6d        ld      l,l
0102 00        nop     
0103 207f      jr      nz,$0184
0105 02        ld      (bc),a
0106 00        nop     
0107 00        nop     
0108 d0        ret     nc

0109 012302    ld      bc,$0223
010c c8        ret     z

010d 4d        ld      c,l
010e c3006f    jp      $6f00
0111 93        sub     e
0112 2d        dec     l
0113 56        ld      d,(hl)
0114 bb        cp      e
0115 00        nop     
0116 68        ld      l,b
0117 14        inc     d
0118 ba        cp      d
0119 0a        ld      a,(bc)
011a 61        ld      h,c
011b 09        add     hl,bc
011c 00        nop     
011d 00        nop     
011e 0eaa      ld      c,$aa
0120 1010      djnz    $0132
0122 00        nop     
0123 02        ld      (bc),a
0124 60        ld      h,b
0125 00        nop     
0126 05        dec     b
0127 00        nop     
0128 00        nop     
0129 00        nop     
012a 010033    ld      bc,$3300
012d 01116d    ld      bc,$6d11
0130 00        nop     
0131 217500    ld      hl,$0075
0134 cd4402    call    $0244
0137 3ab200    ld      a,($00b2)
013a 57        ld      d,a
013b 3ab100    ld      a,($00b1)
013e 5f        ld      e,a
013f 3a6c00    ld      a,($006c)
0142 cd6a02    call    $026a
0145 326c00    ld      ($006c),a
0148 dab001    jp      c,$01b0
014b 210000    ld      hl,$0000
014e cdd502    call    $02d5
0151 62        ld      h,d
0152 6b        ld      l,e
0153 cdd502    call    $02d5
0156 cdcb02    call    $02cb
0159 7a        ld      a,d
015a 82        add     a,d
015b 67        ld      h,a
015c 7b        ld      a,e
015d 83        add     a,e
015e 6f        ld      l,a
015f cdd502    call    $02d5
0162 cdcb02    call    $02cb
0165 7a        ld      a,d
0166 84        add     a,h
0167 67        ld      h,a
0168 7b        ld      a,e
0169 85        add     a,l
016a 6f        ld      l,a
016b cdd502    call    $02d5
016e cdcb02    call    $02cb
0171 af        xor     a
0172 93        sub     e
0173 47        ld      b,a
0174 92        sub     d
0175 67        ld      h,a
0176 78        ld      a,b
0177 82        add     a,d
0178 6f        ld      l,a
0179 cdd502    call    $02d5
017c 7c        ld      a,h
017d 92        sub     d
017e 67        ld      h,a
017f 7d        ld      a,l
0180 93        sub     e
0181 6f        ld      l,a
0182 cdd502    call    $02d5
0185 7c        ld      a,h
0186 92        sub     d
0187 67        ld      h,a
0188 7d        ld      a,l
0189 93        sub     e
018a 6f        ld      l,a
018b cdd502    call    $02d5
018e 7b        ld      a,e
018f 92        sub     d
0190 67        ld      h,a
0191 af        xor     a
0192 93        sub     e
0193 92        sub     d
0194 6f        ld      l,a
0195 cdd502    call    $02d5
0198 7c        ld      a,h
0199 92        sub     d
019a 67        ld      h,a
019b 7d        ld      a,l
019c 93        sub     e
019d 6f        ld      l,a
019e cdd502    call    $02d5
01a1 7c        ld      a,h
01a2 92        sub     d
01a3 67        ld      h,a
01a4 7d        ld      a,l
01a5 93        sub     e
01a6 6f        ld      l,a
01a7 cdd502    call    $02d5
01aa 3ab800    ld      a,($00b8)
01ad cdab02    call    $02ab
01b0 2a0e01    ld      hl,($010e)
01b3 3eff      ld      a,$ff
01b5 77        ld      (hl),a
01b6 11bb00    ld      de,$00bb
01b9 21c300    ld      hl,$00c3
01bc cd4402    call    $0244
01bf 3a0001    ld      a,($0100)
01c2 57        ld      d,a
01c3 3aff00    ld      a,($00ff)
01c6 5f        ld      e,a
01c7 3aba00    ld      a,($00ba)
01ca cd6a02    call    $026a
01cd 32ba00    ld      ($00ba),a
01d0 da3d02    jp      c,$023d
01d3 210000    ld      hl,$0000
01d6 cdd502    call    $02d5
01d9 62        ld      h,d
01da 6b        ld      l,e
01db cdd502    call    $02d5
01de cdcb02    call    $02cb
01e1 7a        ld      a,d
01e2 82        add     a,d
01e3 67        ld      h,a
01e4 7b        ld      a,e
01e5 83        add     a,e
01e6 6f        ld      l,a
01e7 cdd502    call    $02d5
01ea 7a        ld      a,d
01eb 84        add     a,h
01ec 67        ld      h,a
01ed 7b        ld      a,e
01ee 85        add     a,l
01ef 6f        ld      l,a
01f0 cdd502    call    $02d5
01f3 af        xor     a
01f4 93        sub     e
01f5 67        ld      h,a
01f6 6a        ld      l,d
01f7 cdd502    call    $02d5
01fa cdcb02    call    $02cb
01fd e5        push    hl
01fe 7c        ld      a,h
01ff 92        sub     d
0200 67        ld      h,a
0201 7d        ld      a,l
0202 93        sub     e
0203 6f        ld      l,a
0204 cdd502    call    $02d5
0207 7c        ld      a,h
0208 92        sub     d
0209 67        ld      h,a
020a 7d        ld      a,l
020b 93        sub     e
020c 6f        ld      l,a
020d cdd502    call    $02d5
0210 7c        ld      a,h
0211 92        sub     d
0212 67        ld      h,a
0213 7d        ld      a,l
0214 93        sub     e
0215 6f        ld      l,a
0216 cdd502    call    $02d5
0219 e1        pop     hl
021a af        xor     a
021b 94        sub     h
021c 92        sub     d
021d 67        ld      h,a
021e af        xor     a
021f 95        sub     l
0220 93        sub     e
0221 6f        ld      l,a
0222 cdd502    call    $02d5
0225 7c        ld      a,h
0226 92        sub     d
0227 67        ld      h,a
0228 7d        ld      a,l
0229 93        sub     e
022a 6f        ld      l,a
022b cdd502    call    $02d5
022e 7c        ld      a,h
022f 92        sub     d
0230 67        ld      h,a
0231 7d        ld      a,l
0232 93        sub     e
0233 6f        ld      l,a
0234 cdd502    call    $02d5
0237 3a0601    ld      a,($0106)
023a cdab02    call    $02ab
023d 2a0e01    ld      hl,($010e)
0240 3eff      ld      a,$ff
0242 77        ld      (hl),a
0243 c9        ret     

0244 e5        push    hl
0245 220e01    ld      ($010e),hl
0248 eb        ex      de,hl
0249 5e        ld      e,(hl)
024a 23        inc     hl
024b 56        ld      d,(hl)
024c 23        inc     hl
024d eb        ex      de,hl
024e 221001    ld      ($0110),hl
0251 eb        ex      de,hl
0252 5e        ld      e,(hl)
0253 23        inc     hl
0254 56        ld      d,(hl)
0255 eb        ex      de,hl
0256 221201    ld      ($0112),hl
0259 e1        pop     hl
025a 7e        ld      a,(hl)
025b eeff      xor     $ff
025d c8        ret     z

025e 23        inc     hl
025f 5e        ld      e,(hl)
0260 23        inc     hl
0261 56        ld      d,(hl)
0262 23        inc     hl
0263 eb        ex      de,hl
0264 a6        and     (hl)
0265 77        ld      (hl),a
0266 eb        ex      de,hl
0267 c35a02    jp      $025a
026a fe01      cp      $01
026c c8        ret     z

026d fef8      cp      $f8
026f ca8202    jp      z,$0282
0272 fe80      cp      $80
0274 c28402    jp      nz,$0284
0277 3a6a00    ld      a,($006a)
027a 47        ld      b,a
027b 210000    ld      hl,$0000
027e cdd502    call    $02d5
0281 78        ld      a,b
0282 37        scf     
0283 c9        ret     

0284 fe02      cp      $02
0286 c29702    jp      nz,$0297
0289 cd8107    call    $0781
028c e607      and     $07
028e 3e02      ld      a,$02
0290 c29702    jp      nz,$0297
0293 3d        dec     a
0294 cd460b    call    $0b46
0297 3d        dec     a
0298 f27a02    jp      p,$027a
029b fef8      cp      $f8
029d da8202    jp      c,$0282
02a0 47        ld      b,a
02a1 7a        ld      a,d
02a2 17        rla     
02a3 57        ld      d,a
02a4 a7        and     a
02a5 7b        ld      a,e
02a6 17        rla     
02a7 5f        ld      e,a
02a8 a7        and     a
02a9 78        ld      a,b
02aa c9        ret     

02ab a7        and     a
02ac c8        ret     z

02ad af        xor     a
02ae 92        sub     d
02af 87        add     a,a
02b0 87        add     a,a
02b1 67        ld      h,a
02b2 af        xor     a
02b3 93        sub     e
02b4 87        add     a,a
02b5 87        add     a,a
02b6 6f        ld      l,a
02b7 3a0801    ld      a,($0108)
02ba e603      and     $03
02bc 47        ld      b,a
02bd cdd502    call    $02d5
02c0 05        dec     b
02c1 f8        ret     m

02c2 7c        ld      a,h
02c3 92        sub     d
02c4 67        ld      h,a
02c5 7d        ld      a,l
02c6 93        sub     e
02c7 6f        ld      l,a
02c8 c3bd02    jp      $02bd
02cb e5        push    hl
02cc af        xor     a
02cd 94        sub     h
02ce 67        ld      h,a
02cf af        xor     a
02d0 95        sub     l
02d1 6f        ld      l,a
02d2 c3d602    jp      $02d6
02d5 e5        push    hl
02d6 d5        push    de
02d7 c5        push    bc
02d8 7c        ld      a,h
02d9 1f        rra     
02da 1f        rra     
02db 3c        inc     a
02dc 1f        rra     
02dd e61f      and     $1f
02df fe10      cp      $10
02e1 dae602    jp      c,$02e6
02e4 f6e0      or      $e0
02e6 67        ld      h,a
02e7 3a1101    ld      a,($0111)
02ea 84        add     a,h
02eb 1f        rra     
02ec 47        ld      b,a
02ed 7d        ld      a,l
02ee 1f        rra     
02ef 1f        rra     
02f0 3c        inc     a
02f1 1f        rra     
02f2 e61f      and     $1f
02f4 fe10      cp      $10
02f6 dafb02    jp      c,$02fb
02f9 f6e0      or      $e0
02fb 6f        ld      l,a
02fc 3a1301    ld      a,($0113)
02ff 85        add     a,l
0300 1f        rra     
0301 4f        ld      c,a
0302 cd1903    call    $0319
0305 eb        ex      de,hl
0306 2a0e01    ld      hl,($010e)
0309 77        ld      (hl),a
030a 23        inc     hl
030b 73        ld      (hl),e
030c 23        inc     hl
030d 72        ld      (hl),d
030e 23        inc     hl
030f 220e01    ld      ($010e),hl
0312 eb        ex      de,hl
0313 b6        or      (hl)
0314 77        ld      (hl),a
0315 c1        pop     bc
0316 d1        pop     de
0317 e1        pop     hl
0318 c9        ret     

0319 79        ld      a,c
031a e660      and     $60
031c c640      add     a,$40
031e e6a0      and     $a0
0320 57        ld      d,a
0321 78        ld      a,b
0322 e640      and     $40
0324 82        add     a,d
0325 07        rlca    
0326 07        rlca    
0327 07        rlca    
0328 57        ld      d,a
0329 79        ld      a,c
032a e61e      and     $1e
032c 07        rlca    
032d 07        rlca    
032e 07        rlca    
032f 5f        ld      e,a
0330 78        ld      a,b
0331 e63c      and     $3c
0333 0f        rrca    
0334 0f        rrca    
0335 83        add     a,e
0336 5f        ld      e,a
0337 79        ld      a,c
0338 1f        rra     
0339 78        ld      a,b
033a 17        rla     
033b e607      and     $07
033d 4f        ld      c,a
033e 0600      ld      b,$00
0340 214a03    ld      hl,$034a
0343 09        add     hl,bc
0344 7e        ld      a,(hl)
0345 210018    ld      hl,$1800
0348 19        add     hl,de
0349 c9        ret     

034a 010402    ld      bc,$0204
034d 08        ex      af,af'
034e 1040      djnz    $0390
0350 2080      jr      nz,$02d2
0352 215014    ld      hl,$1450
0355 7e        ld      a,(hl)
0356 feff      cp      $ff
0358 c8        ret     z

0359 23        inc     hl
035a 23        inc     hl
035b 46        ld      b,(hl)
035c 23        inc     hl
035d 23        inc     hl
035e 4e        ld      c,(hl)
035f 110500    ld      de,$0005
0362 19        add     hl,de
0363 e5        push    hl
0364 5e        ld      e,(hl)
0365 23        inc     hl
0366 56        ld      d,(hl)
0367 23        inc     hl
0368 7e        ld      a,(hl)
0369 eb        ex      de,hl
036a 2f        cpl     
036b a6        and     (hl)
036c 77        ld      (hl),a
036d eb        ex      de,hl
036e 11f5ff    ld      de,$fff5
0371 19        add     hl,de
0372 7e        ld      a,(hl)
0373 a7        and     a
0374 ca8f03    jp      z,$038f
0377 78        ld      a,b
0378 1f        rra     
0379 47        ld      b,a
037a 79        ld      a,c
037b 1f        rra     
037c 4f        ld      c,a
037d cd1903    call    $0319
0380 eb        ex      de,hl
0381 e1        pop     hl
0382 73        ld      (hl),e
0383 23        inc     hl
0384 72        ld      (hl),d
0385 23        inc     hl
0386 77        ld      (hl),a
0387 23        inc     hl
0388 eb        ex      de,hl
0389 b6        or      (hl)
038a 77        ld      (hl),a
038b eb        ex      de,hl
038c c35503    jp      $0355
038f e1        pop     hl
0390 3600      ld      (hl),$00
0392 23        inc     hl
0393 3600      ld      (hl),$00
0395 23        inc     hl
0396 3600      ld      (hl),$00
0398 23        inc     hl
0399 c35503    jp      $0355
039c 3a6c00    ld      a,($006c)
039f fe02      cp      $02
03a1 daa903    jp      c,$03a9
03a4 fef8      cp      $f8
03a6 daaf03    jp      c,$03af
03a9 216d00    ld      hl,$006d
03ac cdde03    call    $03de
03af 3aba00    ld      a,($00ba)
03b2 fe02      cp      $02
03b4 dabc03    jp      c,$03bc
03b7 fef8      cp      $f8
03b9 dac203    jp      c,$03c2
03bc 21bb00    ld      hl,$00bb
03bf cdde03    call    $03de
03c2 215014    ld      hl,$1450
03c5 7e        ld      a,(hl)
03c6 a7        and     a
03c7 c2d103    jp      nz,$03d1
03ca 110c00    ld      de,$000c
03cd 19        add     hl,de
03ce c3c503    jp      $03c5
03d1 feff      cp      $ff
03d3 c8        ret     z

03d4 23        inc     hl
03d5 cdde03    call    $03de
03d8 110800    ld      de,$0008
03db c3cd03    jp      $03cd
03de cde603    call    $03e6
03e1 23        inc     hl
03e2 cde603    call    $03e6
03e5 c9        ret     

03e6 e5        push    hl
03e7 4e        ld      c,(hl)
03e8 23        inc     hl
03e9 46        ld      b,(hl)
03ea 23        inc     hl
03eb 23        inc     hl
03ec 23        inc     hl
03ed 7e        ld      a,(hl)
03ee 07        rlca    
03ef 07        rlca    
03f0 07        rlca    
03f1 07        rlca    
03f2 5f        ld      e,a
03f3 23        inc     hl
03f4 7e        ld      a,(hl)
03f5 07        rlca    
03f6 07        rlca    
03f7 07        rlca    
03f8 07        rlca    
03f9 57        ld      d,a
03fa ab        xor     e
03fb e6f0      and     $f0
03fd ab        xor     e
03fe 5f        ld      e,a
03ff 7a        ld      a,d
0400 e60f      and     $0f
0402 fe08      cp      $08
0404 da0904    jp      c,$0409
0407 f6f0      or      $f0
0409 57        ld      d,a
040a eb        ex      de,hl
040b 09        add     hl,bc
040c eb        ex      de,hl
040d e1        pop     hl
040e 73        ld      (hl),e
040f 23        inc     hl
0410 72        ld      (hl),d
0411 c9        ret     

0412 3a6c00    ld      a,($006c)
0415 fe01      cp      $01
0417 c22804    jp      nz,$0428
041a c30f0d    jp      $0d0f
041d 78        ld      a,b
041e 07        rlca    
041f 07        rlca    
0420 47        ld      b,a
0421 c9        ret     

0422 216d00    ld      hl,$006d
0425 cd3904    call    $0439
0428 3aba00    ld      a,($00ba)
042b fe01      cp      $01
042d c0        ret     nz

042e c3700d    jp      $0d70
0431 00        nop     
0432 21bb00    ld      hl,$00bb
0435 cd3904    call    $0439
0438 c9        ret     

0439 f5        push    af
043a 221401    ld      ($0114),hl
043d 014700    ld      bc,$0047
0440 09        add     hl,bc
0441 34        inc     (hl)
0442 fa3705    jp      m,$0537
0445 3600      ld      (hl),$00
0447 1f        rra     
0448 d23705    jp      nc,$0537
044b 010100    ld      bc,$0001
044e 09        add     hl,bc
044f 35        dec     (hl)
0450 f25804    jp      p,$0458
0453 3600      ld      (hl),$00
0455 c33705    jp      $0537
0458 215014    ld      hl,$1450
045b 163e      ld      d,$3e
045d 7e        ld      a,(hl)
045e a7        and     a
045f ca7d04    jp      z,$047d
0462 feff      cp      $ff
0464 ca6f04    jp      z,$046f
0467 010c00    ld      bc,$000c
046a 09        add     hl,bc
046b 15        dec     d
046c c35d04    jp      $045d
046f a2        and     d
0470 ca3705    jp      z,$0537
0473 010c00    ld      bc,$000c
0476 09        add     hl,bc
0477 36ff      ld      (hl),$ff
0479 01f4ff    ld      bc,$fff4
047c 09        add     hl,bc
047d 3a6800    ld      a,($0068)
0480 77        ld      (hl),a
0481 221601    ld      ($0116),hl
0484 af        xor     a
0485 010900    ld      bc,$0009
0488 09        add     hl,bc
0489 77        ld      (hl),a
048a 23        inc     hl
048b 77        ld      (hl),a
048c 23        inc     hl
048d 77        ld      (hl),a
048e 2a1401    ld      hl,($0114)
0491 014500    ld      bc,$0045
0494 09        add     hl,bc
0495 7e        ld      a,(hl)
0496 2a5c00    ld      hl,($005c)
0499 44        ld      b,h
049a 4d        ld      c,l
049b cd3507    call    $0735
049e eb        ex      de,hl
049f 2a1401    ld      hl,($0114)
04a2 d5        push    de
04a3 010400    ld      bc,$0004
04a6 09        add     hl,bc
04a7 7e        ld      a,(hl)
04a8 83        add     a,e
04a9 5f        ld      e,a
04aa 23        inc     hl
04ab 7e        ld      a,(hl)
04ac 8a        adc     a,d
04ad 2a1601    ld      hl,($0116)
04b0 010500    ld      bc,$0005
04b3 09        add     hl,bc
04b4 73        ld      (hl),e
04b5 23        inc     hl
04b6 77        ld      (hl),a
04b7 e1        pop     hl
04b8 7c        ld      a,h
04b9 a7        and     a
04ba f2be04    jp      p,$04be
04bd 37        scf     
04be 1f        rra     
04bf 67        ld      h,a
04c0 7d        ld      a,l
04c1 1f        rra     
04c2 6f        ld      l,a
04c3 eb        ex      de,hl
04c4 2a1401    ld      hl,($0114)
04c7 7e        ld      a,(hl)
04c8 83        add     a,e
04c9 5f        ld      e,a
04ca 23        inc     hl
04cb 7e        ld      a,(hl)
04cc 8a        adc     a,d
04cd 2a1601    ld      hl,($0116)
04d0 23        inc     hl
04d1 73        ld      (hl),e
04d2 23        inc     hl
04d3 77        ld      (hl),a
04d4 2a1401    ld      hl,($0114)
04d7 014400    ld      bc,$0044
04da 09        add     hl,bc
04db 7e        ld      a,(hl)
04dc 2a5c00    ld      hl,($005c)
04df 44        ld      b,h
04e0 4d        ld      c,l
04e1 cd3507    call    $0735
04e4 eb        ex      de,hl
04e5 2a1401    ld      hl,($0114)
04e8 d5        push    de
04e9 010600    ld      bc,$0006
04ec 09        add     hl,bc
04ed 7e        ld      a,(hl)
04ee 83        add     a,e
04ef 5f        ld      e,a
04f0 23        inc     hl
04f1 7e        ld      a,(hl)
04f2 8a        adc     a,d
04f3 2a1601    ld      hl,($0116)
04f6 010700    ld      bc,$0007
04f9 09        add     hl,bc
04fa 73        ld      (hl),e
04fb 23        inc     hl
04fc 77        ld      (hl),a
04fd e1        pop     hl
04fe 7c        ld      a,h
04ff a7        and     a
0500 f20405    jp      p,$0504
0503 37        scf     
0504 1f        rra     
0505 67        ld      h,a
0506 7d        ld      a,l
0507 1f        rra     
0508 6f        ld      l,a
0509 eb        ex      de,hl
050a 2a1401    ld      hl,($0114)
050d 23        inc     hl
050e 23        inc     hl
050f 7e        ld      a,(hl)
0510 83        add     a,e
0511 5f        ld      e,a
0512 23        inc     hl
0513 7e        ld      a,(hl)
0514 8a        adc     a,d
0515 2a1601    ld      hl,($0116)
0518 23        inc     hl
0519 23        inc     hl
051a 23        inc     hl
051b 73        ld      (hl),e
051c 23        inc     hl
051d 77        ld      (hl),a
051e 2a1401    ld      hl,($0114)
0521 014700    ld      bc,$0047
0524 09        add     hl,bc
0525 3a6700    ld      a,($0067)
0528 77        ld      (hl),a
0529 3ab500    ld      a,($00b5)
052c 47        ld      b,a
052d 3a0301    ld      a,($0103)
0530 b0        or      b
0531 c23705    jp      nz,$0537
0534 cd460b    call    $0b46
0537 2a1401    ld      hl,($0114)
053a 014b00    ld      bc,$004b
053d 09        add     hl,bc
053e 3600      ld      (hl),$00
0540 f1        pop     af
0541 f5        push    af
0542 e602      and     $02
0544 caba05    jp      z,$05ba
0547 01feff    ld      bc,$fffe
054a 09        add     hl,bc
054b 5e        ld      e,(hl)
054c 23        inc     hl
054d 56        ld      d,(hl)
054e 7a        ld      a,d
054f b3        or      e
0550 caba05    jp      z,$05ba
0553 1b        dec     de
0554 72        ld      (hl),d
0555 2b        dec     hl
0556 73        ld      (hl),e
0557 010200    ld      bc,$0002
055a 09        add     hl,bc
055b 34        inc     (hl)
055c 01faff    ld      bc,$fffa
055f 09        add     hl,bc
0560 7e        ld      a,(hl)
0561 2a6000    ld      hl,($0060)
0564 44        ld      b,h
0565 4d        ld      c,l
0566 cd3507    call    $0735
0569 eb        ex      de,hl
056a 5a        ld      e,d
056b 7a        ld      a,d
056c 1600      ld      d,$00
056e a7        and     a
056f f27405    jp      p,$0574
0572 16ff      ld      d,$ff
0574 2a1401    ld      hl,($0114)
0577 010400    ld      bc,$0004
057a 09        add     hl,bc
057b 7e        ld      a,(hl)
057c 23        inc     hl
057d 66        ld      h,(hl)
057e 6f        ld      l,a
057f 19        add     hl,de
0580 eb        ex      de,hl
0581 2a1401    ld      hl,($0114)
0584 010400    ld      bc,$0004
0587 09        add     hl,bc
0588 73        ld      (hl),e
0589 23        inc     hl
058a 72        ld      (hl),d
058b 013f00    ld      bc,$003f
058e 09        add     hl,bc
058f 7e        ld      a,(hl)
0590 2a6000    ld      hl,($0060)
0593 44        ld      b,h
0594 4d        ld      c,l
0595 cd3507    call    $0735
0598 eb        ex      de,hl
0599 5a        ld      e,d
059a 7a        ld      a,d
059b 1600      ld      d,$00
059d a7        and     a
059e f2a305    jp      p,$05a3
05a1 16ff      ld      d,$ff
05a3 2a1401    ld      hl,($0114)
05a6 010600    ld      bc,$0006
05a9 09        add     hl,bc
05aa 7e        ld      a,(hl)
05ab 23        inc     hl
05ac 66        ld      h,(hl)
05ad 6f        ld      l,a
05ae 19        add     hl,de
05af eb        ex      de,hl
05b0 2a1401    ld      hl,($0114)
05b3 010600    ld      bc,$0006
05b6 09        add     hl,bc
05b7 73        ld      (hl),e
05b8 23        inc     hl
05b9 72        ld      (hl),d
05ba 2a1401    ld      hl,($0114)
05bd 014c00    ld      bc,$004c
05c0 09        add     hl,bc
05c1 7e        ld      a,(hl)
05c2 a7        and     a
05c3 cac705    jp      z,$05c7
05c6 35        dec     (hl)
05c7 f1        pop     af
05c8 e60c      and     $0c
05ca c8        ret     z

05cb fe0c      cp      $0c
05cd ca1006    jp      z,$0610
05d0 fe08      cp      $08
05d2 c2da05    jp      nz,$05da
05d5 3eff      ld      a,$ff
05d7 c3dc05    jp      $05dc
05da 3e01      ld      a,$01
05dc 2a1401    ld      hl,($0114)
05df 014600    ld      bc,$0046
05e2 09        add     hl,bc
05e3 86        add     a,(hl)
05e4 feff      cp      $ff
05e6 ca0b06    jp      z,$060b
05e9 feb4      cp      $b4
05eb c2ef05    jp      nz,$05ef
05ee af        xor     a
05ef 77        ld      (hl),a
05f0 4f        ld      c,a
05f1 0600      ld      b,$00
05f3 215406    ld      hl,$0654
05f6 09        add     hl,bc
05f7 5e        ld      e,(hl)
05f8 012d00    ld      bc,$002d
05fb 09        add     hl,bc
05fc 56        ld      d,(hl)
05fd 2a1401    ld      hl,($0114)
0600 014500    ld      bc,$0045
0603 09        add     hl,bc
0604 72        ld      (hl),d
0605 01ffff    ld      bc,$ffff
0608 09        add     hl,bc
0609 73        ld      (hl),e
060a c9        ret     

060b 3eb3      ld      a,$b3
060d c3ef05    jp      $05ef
0610 7e        ld      a,(hl)
0611 a7        and     a
0612 c0        ret     nz

0613 2a1401    ld      hl,($0114)
0616 2b        dec     hl
0617 3a6900    ld      a,($0069)
061a 77        ld      (hl),a
061b 23        inc     hl
061c 23        inc     hl
061d cd8107    call    $0781
0620 77        ld      (hl),a
0621 23        inc     hl
0622 23        inc     hl
0623 cd8107    call    $0781
0626 77        ld      (hl),a
0627 23        inc     hl
0628 cd8107    call    $0781
062b 77        ld      (hl),a
062c 23        inc     hl
062d cd8107    call    $0781
0630 e60f      and     $0f
0632 77        ld      (hl),a
0633 23        inc     hl
0634 cd8107    call    $0781
0637 77        ld      (hl),a
0638 23        inc     hl
0639 cd8107    call    $0781
063c e60f      and     $0f
063e 77        ld      (hl),a
063f 013f00    ld      bc,$003f
0642 09        add     hl,bc
0643 cd8107    call    $0781
0646 e67f      and     $7f
0648 77        ld      (hl),a
0649 010600    ld      bc,$0006
064c 09        add     hl,bc
064d 3a6b00    ld      a,($006b)
0650 77        ld      (hl),a
0651 c3da05    jp      $05da
0654 00        nop     
0655 010102    ld      bc,$0201
0658 02        ld      (bc),a
0659 03        inc     bc
065a 03        inc     bc
065b 04        inc     b
065c 04        inc     b
065d 05        dec     b
065e 05        dec     b
065f 0607      ld      b,$07
0661 07        rlca    
0662 08        ex      af,af'
0663 08        ex      af,af'
0664 08        ex      af,af'
0665 09        add     hl,bc
0666 09        add     hl,bc
0667 0a        ld      a,(bc)
0668 0a        ld      a,(bc)
0669 0b        dec     bc
066a 0b        dec     bc
066b 0c        inc     c
066c 0c        inc     c
066d 0c        inc     c
066e 0d        dec     c
066f 0d        dec     c
0670 0d        dec     c
0671 0e0e      ld      c,$0e
0673 0e0e      ld      c,$0e
0675 0f        rrca    
0676 0f        rrca    
0677 0f        rrca    
0678 0f        rrca    
0679 0f        rrca    
067a 1010      djnz    $068c
067c 1010      djnz    $068e
067e 1010      djnz    $0690
0680 1010      djnz    $0692
0682 1010      djnz    $0694
0684 1010      djnz    $0696
0686 1010      djnz    $0698
0688 100f      djnz    $0699
068a 0f        rrca    
068b 0f        rrca    
068c 0f        rrca    
068d 0f        rrca    
068e 0e0e      ld      c,$0e
0690 0e0e      ld      c,$0e
0692 0d        dec     c
0693 0d        dec     c
0694 0d        dec     c
0695 0c        inc     c
0696 0c        inc     c
0697 0c        inc     c
0698 0b        dec     bc
0699 0b        dec     bc
069a 0a        ld      a,(bc)
069b 0a        ld      a,(bc)
069c 09        add     hl,bc
069d 09        add     hl,bc
069e 08        ex      af,af'
069f 08        ex      af,af'
06a0 08        ex      af,af'
06a1 07        rlca    
06a2 07        rlca    
06a3 0605      ld      b,$05
06a5 05        dec     b
06a6 04        inc     b
06a7 04        inc     b
06a8 03        inc     bc
06a9 03        inc     bc
06aa 02        ld      (bc),a
06ab 02        ld      (bc),a
06ac 010100    ld      bc,$0001
06af ff        rst     $38
06b0 ff        rst     $38
06b1 fefe      cp      $fe
06b3 fdfdfcfcfb  call    m,$fbfc
06b8 fb        ei      
06b9 faf9f9    jp      m,$f9f9
06bc f8        ret     m

06bd f8        ret     m

06be f8        ret     m

06bf f7        rst     $30
06c0 f7        rst     $30
06c1 f6f6      or      $f6
06c3 f5        push    af
06c4 f5        push    af
06c5 f4f4f4    call    p,$f4f4
06c8 f3        di      
06c9 f3        di      
06ca f3        di      
06cb f2f2f2    jp      p,$f2f2
06ce f2f1f1    jp      p,$f1f1
06d1 f1        pop     af
06d2 f1        pop     af
06d3 f1        pop     af
06d4 f0        ret     p

06d5 f0        ret     p

06d6 f0        ret     p

06d7 f0        ret     p

06d8 f0        ret     p

06d9 f0        ret     p

06da f0        ret     p

06db f0        ret     p

06dc f0        ret     p

06dd f0        ret     p

06de f0        ret     p

06df f0        ret     p

06e0 f0        ret     p

06e1 f0        ret     p

06e2 f0        ret     p

06e3 f1        pop     af
06e4 f1        pop     af
06e5 f1        pop     af
06e6 f1        pop     af
06e7 f1        pop     af
06e8 f2f2f2    jp      p,$f2f2
06eb f2f3f3    jp      p,$f3f3
06ee f3        di      
06ef f4f4f4    call    p,$f4f4
06f2 f5        push    af
06f3 f5        push    af
06f4 f6f6      or      $f6
06f6 f7        rst     $30
06f7 f7        rst     $30
06f8 f8        ret     m

06f9 f8        ret     m

06fa f8        ret     m

06fb f9        ld      sp,hl
06fc f9        ld      sp,hl
06fd fafbfb    jp      m,$fbfb
0700 fcfcfd    call    m,$fdfc
0703 fdfefe    cp      $fe
0706 ff        rst     $38
0707 ff        rst     $38
0708 00        nop     
0709 010102    ld      bc,$0201
070c 02        ld      (bc),a
070d 03        inc     bc
070e 03        inc     bc
070f 04        inc     b
0710 04        inc     b
0711 05        dec     b
0712 05        dec     b
0713 0607      ld      b,$07
0715 07        rlca    
0716 08        ex      af,af'
0717 08        ex      af,af'
0718 08        ex      af,af'
0719 09        add     hl,bc
071a 09        add     hl,bc
071b 0a        ld      a,(bc)
071c 0a        ld      a,(bc)
071d 0b        dec     bc
071e 0b        dec     bc
071f 0c        inc     c
0720 0c        inc     c
0721 0c        inc     c
0722 0d        dec     c
0723 0d        dec     c
0724 0d        dec     c
0725 0e0e      ld      c,$0e
0727 0e0e      ld      c,$0e
0729 0f        rrca    
072a 0f        rrca    
072b 0f        rrca    
072c 0f        rrca    
072d 0f        rrca    
072e 1010      djnz    $0740
0730 1010      djnz    $0742
0732 1010      djnz    $0744
0734 1057      djnz    $078d
0736 79        ld      a,c
0737 e6f8      and     $f8
0739 0f        rrca    
073a 0f        rrca    
073b 0f        rrca    
073c 1f        rra     
073d ce00      adc     a,$00
073f 4f        ld      c,a
0740 78        ld      a,b
0741 0f        rrca    
0742 0f        rrca    
0743 0f        rrca    
0744 0f        rrca    
0745 5f        ld      e,a
0746 e60f      and     $0f
0748 fe08      cp      $08
074a da4f07    jp      c,$074f
074d f6f0      or      $f0
074f 47        ld      b,a
0750 7b        ld      a,e
0751 e6f0      and     $f0
0753 81        add     a,c
0754 4f        ld      c,a
0755 d25907    jp      nc,$0759
0758 04        inc     b
0759 7a        ld      a,d
075a a7        and     a
075b f26907    jp      p,$0769
075e 2f        cpl     
075f 3c        inc     a
0760 57        ld      d,a
0761 af        xor     a
0762 91        sub     c
0763 4f        ld      c,a
0764 3e00      ld      a,$00
0766 98        sbc     a,b
0767 47        ld      b,a
0768 7a        ld      a,d
0769 cd6d07    call    $076d
076c c9        ret     

076d 210000    ld      hl,$0000
0770 37        scf     
0771 c37607    jp      $0776
0774 29        add     hl,hl
0775 a7        and     a
0776 17        rla     
0777 d27407    jp      nc,$0774
077a a7        and     a
077b c8        ret     z

077c 29        add     hl,hl
077d 09        add     hl,bc
077e c37507    jp      $0775
0781 e5        push    hl
0782 211e01    ld      hl,$011e
0785 3a0801    ld      a,($0108)
0788 ae        xor     (hl)
0789 07        rlca    
078a 07        rlca    
078b 07        rlca    
078c 86        add     a,(hl)
078d 77        ld      (hl),a
078e e1        pop     hl
078f c9        ret     

0790 216c00    ld      hl,$006c
0793 7e        ld      a,(hl)
0794 23        inc     hl
0795 eb        ex      de,hl
0796 fe01      cp      $01
0798 fab207    jp      m,$07b2
079b dab207    jp      c,$07b2
079e 215014    ld      hl,$1450
07a1 7e        ld      a,(hl)
07a2 a7        and     a
07a3 c2ad07    jp      nz,$07ad
07a6 010c00    ld      bc,$000c
07a9 09        add     hl,bc
07aa c3a107    jp      $07a1
07ad feff      cp      $ff
07af c2f007    jp      nz,$07f0
07b2 016d00    ld      bc,$006d
07b5 78        ld      a,b
07b6 aa        xor     d
07b7 c2c507    jp      nz,$07c5
07ba 79        ld      a,c
07bb ab        xor     e
07bc c2c507    jp      nz,$07c5
07bf 21ba00    ld      hl,$00ba
07c2 c39307    jp      $0793
07c5 01bb00    ld      bc,$00bb
07c8 78        ld      a,b
07c9 aa        xor     d
07ca c2e707    jp      nz,$07e7
07cd 79        ld      a,c
07ce ab        xor     e
07cf c2e707    jp      nz,$07e7
07d2 115014    ld      de,$1450
07d5 1a        ld      a,(de)
07d6 a7        and     a
07d7 cae807    jp      z,$07e8
07da feff      cp      $ff
07dc cafe07    jp      z,$07fe
07df 210c00    ld      hl,$000c
07e2 19        add     hl,de
07e3 13        inc     de
07e4 c3a107    jp      $07a1
07e7 1b        dec     de
07e8 210c00    ld      hl,$000c
07eb 19        add     hl,de
07ec eb        ex      de,hl
07ed c3d507    jp      $07d5
07f0 23        inc     hl
07f1 cd6108    call    $0861
07f4 da4308    jp      c,$0843
07f7 010b00    ld      bc,$000b
07fa 09        add     hl,bc
07fb c3a107    jp      $07a1
07fe 3a6c00    ld      a,($006c)
0801 fe01      cp      $01
0803 fa2d08    jp      m,$082d
0806 da2d08    jp      c,$082d
0809 3aba00    ld      a,($00ba)
080c fe01      cp      $01
080e fa2d08    jp      m,$082d
0811 da2d08    jp      c,$082d
0814 116d00    ld      de,$006d
0817 21bb00    ld      hl,$00bb
081a cd6108    call    $0861
081d d22d08    jp      nc,$082d
0820 216c00    ld      hl,$006c
0823 3600      ld      (hl),$00
0825 21ba00    ld      hl,$00ba
0828 3600      ld      (hl),$00
082a cd460b    call    $0b46
082d 215014    ld      hl,$1450
0830 7e        ld      a,(hl)
0831 a7        and     a
0832 c23c08    jp      nz,$083c
0835 010c00    ld      bc,$000c
0838 09        add     hl,bc
0839 c33008    jp      $0830
083c feff      cp      $ff
083e c8        ret     z

083f 35        dec     (hl)
0840 c33508    jp      $0835
0843 2b        dec     hl
0844 3600      ld      (hl),$00
0846 23        inc     hl
0847 eb        ex      de,hl
0848 2b        dec     hl
0849 3600      ld      (hl),$00
084b 23        inc     hl
084c eb        ex      de,hl
084d 3a6c00    ld      a,($006c)
0850 a7        and     a
0851 ca5b08    jp      z,$085b
0854 3aba00    ld      a,($00ba)
0857 a7        and     a
0858 c2f707    jp      nz,$07f7
085b cd460b    call    $0b46
085e c3f707    jp      $07f7
0861 d5        push    de
0862 e5        push    hl
0863 1a        ld      a,(de)
0864 96        sub     (hl)
0865 13        inc     de
0866 23        inc     hl
0867 1a        ld      a,(de)
0868 9e        sbc     a,(hl)
0869 f26d08    jp      p,$086d
086c 2f        cpl     
086d fe07      cp      $07
086f d28708    jp      nc,$0887
0872 47        ld      b,a
0873 13        inc     de
0874 23        inc     hl
0875 1a        ld      a,(de)
0876 96        sub     (hl)
0877 13        inc     de
0878 23        inc     hl
0879 1a        ld      a,(de)
087a 9e        sbc     a,(hl)
087b f27f08    jp      p,$087f
087e 2f        cpl     
087f fe07      cp      $07
0881 d28708    jp      nc,$0887
0884 80        add     a,b
0885 fe09      cp      $09
0887 e1        pop     hl
0888 d1        pop     de
0889 c9        ret     

088a 3a1c01    ld      a,($011c)
088d e601      and     $01
088f c2db08    jp      nz,$08db
0892 2a1801    ld      hl,($0118)
0895 7e        ld      a,(hl)
0896 fefe      cp      $fe
0898 caad08    jp      z,$08ad
089b feff      cp      $ff
089d cab308    jp      z,$08b3
08a0 23        inc     hl
08a1 5e        ld      e,(hl)
08a2 23        inc     hl
08a3 56        ld      d,(hl)
08a4 23        inc     hl
08a5 eb        ex      de,hl
08a6 2f        cpl     
08a7 a6        and     (hl)
08a8 77        ld      (hl),a
08a9 eb        ex      de,hl
08aa c39508    jp      $0895
08ad 21ba0a    ld      hl,$0aba
08b0 c3b408    jp      $08b4
08b3 23        inc     hl
08b4 221801    ld      ($0118),hl
08b7 7e        ld      a,(hl)
08b8 fefe      cp      $fe
08ba cace08    jp      z,$08ce
08bd feff      cp      $ff
08bf cace08    jp      z,$08ce
08c2 23        inc     hl
08c3 5e        ld      e,(hl)
08c4 23        inc     hl
08c5 56        ld      d,(hl)
08c6 23        inc     hl
08c7 eb        ex      de,hl
08c8 b6        or      (hl)
08c9 77        ld      (hl),a
08ca eb        ex      de,hl
08cb c3b708    jp      $08b7
08ce 216c00    ld      hl,$006c
08d1 cde608    call    $08e6
08d4 21ba00    ld      hl,$00ba
08d7 cde608    call    $08e6
08da c9        ret     

08db 2a1a01    ld      hl,($011a)
08de 016009    ld      bc,$0960
08e1 09        add     hl,bc
08e2 221a01    ld      ($011a),hl
08e5 c9        ret     

08e6 7e        ld      a,(hl)
08e7 fe01      cp      $01
08e9 c20c0a    jp      nz,$0a0c
08ec 23        inc     hl
08ed 23        inc     hl
08ee 221401    ld      ($0114),hl
08f1 7e        ld      a,(hl)
08f2 ee80      xor     $80
08f4 f2f908    jp      p,$08f9
08f7 2f        cpl     
08f8 3c        inc     a
08f9 322001    ld      ($0120),a
08fc 4f        ld      c,a
08fd 0600      ld      b,$00
08ff cd6d07    call    $076d
0902 e5        push    hl
0903 2a1401    ld      hl,($0114)
0906 23        inc     hl
0907 23        inc     hl
0908 7e        ld      a,(hl)
0909 ee80      xor     $80
090b f21009    jp      p,$0910
090e 2f        cpl     
090f 3c        inc     a
0910 322101    ld      ($0121),a
0913 4f        ld      c,a
0914 0600      ld      b,$00
0916 cd6d07    call    $076d
0919 c1        pop     bc
091a 09        add     hl,bc
091b 7c        ld      a,h
091c a7        and     a
091d ca2909    jp      z,$0929
0920 f22f09    jp      p,$092f
0923 21ff7f    ld      hl,$7fff
0926 c32f09    jp      $092f
0929 7d        ld      a,l
092a fe21      cp      $21
092c dae209    jp      c,$09e2
092f 222201    ld      ($0122),hl
0932 0608      ld      b,$08
0934 29        add     hl,hl
0935 da3d09    jp      c,$093d
0938 05        dec     b
0939 29        add     hl,hl
093a d23409    jp      nc,$0934
093d 2a2201    ld      hl,($0122)
0940 05        dec     b
0941 fa4e09    jp      m,$094e
0944 7c        ld      a,h
0945 a7        and     a
0946 1f        rra     
0947 67        ld      h,a
0948 7d        ld      a,l
0949 1f        rra     
094a 6f        ld      l,a
094b c34009    jp      $0940
094e 23        inc     hl
094f 1602      ld      d,$02
0951 44        ld      b,h
0952 4d        ld      c,l
0953 c5        push    bc
0954 2a2201    ld      hl,($0122)
0957 cd170a    call    $0a17
095a 6f        ld      l,a
095b 2600      ld      h,$00
095d c1        pop     bc
095e 09        add     hl,bc
095f 23        inc     hl
0960 7c        ld      a,h
0961 a7        and     a
0962 1f        rra     
0963 67        ld      h,a
0964 7d        ld      a,l
0965 1f        rra     
0966 6f        ld      l,a
0967 15        dec     d
0968 c25109    jp      nz,$0951
096b 222601    ld      ($0126),hl
096e 2a2201    ld      hl,($0122)
0971 44        ld      b,h
0972 4d        ld      c,l
0973 2a6200    ld      hl,($0062)
0976 eb        ex      de,hl
0977 2a6400    ld      hl,($0064)
097a cd350a    call    $0a35
097d 222401    ld      ($0124),hl
0980 3a2001    ld      a,($0120)
0983 4f        ld      c,a
0984 0600      ld      b,$00
0986 cd7b0a    call    $0a7b
0989 3a2601    ld      a,($0126)
098c 4f        ld      c,a
098d 3a2701    ld      a,($0127)
0990 47        ld      b,a
0991 cd350a    call    $0a35
0994 eb        ex      de,hl
0995 2a1401    ld      hl,($0114)
0998 7e        ld      a,(hl)
0999 a7        and     a
099a f2a409    jp      p,$09a4
099d af        xor     a
099e 93        sub     e
099f 5f        ld      e,a
09a0 3e00      ld      a,$00
09a2 9a        sbc     a,d
09a3 57        ld      d,a
09a4 23        inc     hl
09a5 23        inc     hl
09a6 23        inc     hl
09a7 7e        ld      a,(hl)
09a8 83        add     a,e
09a9 77        ld      (hl),a
09aa 23        inc     hl
09ab 7e        ld      a,(hl)
09ac 8a        adc     a,d
09ad 77        ld      (hl),a
09ae 2a2401    ld      hl,($0124)
09b1 3a2101    ld      a,($0121)
09b4 4f        ld      c,a
09b5 0600      ld      b,$00
09b7 cd7b0a    call    $0a7b
09ba 3a2601    ld      a,($0126)
09bd 4f        ld      c,a
09be 3a2701    ld      a,($0127)
09c1 47        ld      b,a
09c2 cd350a    call    $0a35
09c5 eb        ex      de,hl
09c6 2a1401    ld      hl,($0114)
09c9 23        inc     hl
09ca 23        inc     hl
09cb 7e        ld      a,(hl)
09cc a7        and     a
09cd f2d709    jp      p,$09d7
09d0 af        xor     a
09d1 93        sub     e
09d2 5f        ld      e,a
09d3 3e00      ld      a,$00
09d5 9a        sbc     a,d
09d6 57        ld      d,a
09d7 23        inc     hl
09d8 23        inc     hl
09d9 23        inc     hl
09da 7e        ld      a,(hl)
09db 83        add     a,e
09dc 77        ld      (hl),a
09dd 23        inc     hl
09de 7e        ld      a,(hl)
09df 8a        adc     a,d
09e0 77        ld      (hl),a
09e1 c9        ret     

09e2 3a1c01    ld      a,($011c)
09e5 e602      and     $02
09e7 c2010a    jp      nz,$0a01
09ea 2a1401    ld      hl,($0114)
09ed 2b        dec     hl
09ee 3eff      ld      a,$ff
09f0 77        ld      (hl),a
09f1 23        inc     hl
09f2 77        ld      (hl),a
09f3 23        inc     hl
09f4 77        ld      (hl),a
09f5 23        inc     hl
09f6 77        ld      (hl),a
09f7 23        inc     hl
09f8 af        xor     a
09f9 77        ld      (hl),a
09fa 23        inc     hl
09fb 77        ld      (hl),a
09fc 23        inc     hl
09fd 77        ld      (hl),a
09fe 23        inc     hl
09ff 77        ld      (hl),a
0a00 c9        ret     

0a01 2a1401    ld      hl,($0114)
0a04 2b        dec     hl
0a05 2b        dec     hl
0a06 3600      ld      (hl),$00
0a08 cd460b    call    $0b46
0a0b c9        ret     

0a0c 2a1a01    ld      hl,($011a)
0a0f 01b004    ld      bc,$04b0
0a12 09        add     hl,bc
0a13 221a01    ld      ($011a),hl
0a16 c9        ret     

0a17 d5        push    de
0a18 af        xor     a
0a19 90        sub     b
0a1a 47        ld      b,a
0a1b 3e00      ld      a,$00
0a1d 99        sbc     a,c
0a1e 4f        ld      c,a
0a1f 3e01      ld      a,$01
0a21 54        ld      d,h
0a22 5d        ld      e,l
0a23 09        add     hl,bc
0a24 da2f0a    jp      c,$0a2f
0a27 62        ld      h,d
0a28 6b        ld      l,e
0a29 17        rla     
0a2a d2230a    jp      nc,$0a23
0a2d d1        pop     de
0a2e c9        ret     

0a2f 17        rla     
0a30 d2210a    jp      nc,$0a21
0a33 d1        pop     de
0a34 c9        ret     

0a35 222a01    ld      ($012a),hl
0a38 eb        ex      de,hl
0a39 222801    ld      ($0128),hl
0a3c af        xor     a
0a3d 91        sub     c
0a3e 4f        ld      c,a
0a3f 3e00      ld      a,$00
0a41 98        sbc     a,b
0a42 47        ld      b,a
0a43 210100    ld      hl,$0001
0a46 222c01    ld      ($012c),hl
0a49 a7        and     a
0a4a 212801    ld      hl,$0128
0a4d 7e        ld      a,(hl)
0a4e 17        rla     
0a4f 77        ld      (hl),a
0a50 23        inc     hl
0a51 7e        ld      a,(hl)
0a52 17        rla     
0a53 77        ld      (hl),a
0a54 23        inc     hl
0a55 7e        ld      a,(hl)
0a56 17        rla     
0a57 77        ld      (hl),a
0a58 23        inc     hl
0a59 7e        ld      a,(hl)
0a5a 17        rla     
0a5b 77        ld      (hl),a
0a5c 2a2a01    ld      hl,($012a)
0a5f 09        add     hl,bc
0a60 d2660a    jp      nc,$0a66
0a63 222a01    ld      ($012a),hl
0a66 212c01    ld      hl,$012c
0a69 7e        ld      a,(hl)
0a6a 17        rla     
0a6b 77        ld      (hl),a
0a6c 23        inc     hl
0a6d 7e        ld      a,(hl)
0a6e 17        rla     
0a6f 77        ld      (hl),a
0a70 d2490a    jp      nc,$0a49
0a73 2a2a01    ld      hl,($012a)
0a76 eb        ex      de,hl
0a77 2a2c01    ld      hl,($012c)
0a7a c9        ret     

0a7b 222c01    ld      ($012c),hl
0a7e 210000    ld      hl,$0000
0a81 222a01    ld      ($012a),hl
0a84 2680      ld      h,$80
0a86 222801    ld      ($0128),hl
0a89 212d01    ld      hl,$012d
0a8c 7e        ld      a,(hl)
0a8d 1f        rra     
0a8e 77        ld      (hl),a
0a8f 2b        dec     hl
0a90 7e        ld      a,(hl)
0a91 1f        rra     
0a92 77        ld      (hl),a
0a93 d29d0a    jp      nc,$0a9d
0a96 2a2a01    ld      hl,($012a)
0a99 09        add     hl,bc
0a9a 222a01    ld      ($012a),hl
0a9d 212b01    ld      hl,$012b
0aa0 7e        ld      a,(hl)
0aa1 1f        rra     
0aa2 77        ld      (hl),a
0aa3 2b        dec     hl
0aa4 7e        ld      a,(hl)
0aa5 1f        rra     
0aa6 77        ld      (hl),a
0aa7 2b        dec     hl
0aa8 7e        ld      a,(hl)
0aa9 1f        rra     
0aaa 77        ld      (hl),a
0aab 2b        dec     hl
0aac 7e        ld      a,(hl)
0aad 1f        rra     
0aae 77        ld      (hl),a
0aaf d2890a    jp      nc,$0a89
0ab2 2a2801    ld      hl,($0128)
0ab5 eb        ex      de,hl
0ab6 2a2a01    ld      hl,($012a)
0ab9 c9        ret     

0aba a8        xor     b
0abb ff        rst     $38
0abc 19        add     hl,de
0abd 04        inc     b
0abe e0        ret     po

0abf 1b        dec     de
0ac0 08        ex      af,af'
0ac1 f0        ret     p

0ac2 1b        dec     de
0ac3 100f      djnz    $0ad4
0ac5 1c        inc     e
0ac6 201f      jr      nz,$0ae7
0ac8 1c        inc     e
0ac9 15        dec     d
0aca 00        nop     
0acb 1eff      ld      e,$ff
0acd 80        add     a,b
0ace ef        rst     $28
0acf 19        add     hl,de
0ad0 60        ld      h,b
0ad1 ff        rst     $38
0ad2 19        add     hl,de
0ad3 4d        ld      c,l
0ad4 f0        ret     p

0ad5 1b        dec     de
0ad6 b2        or      d
0ad7 0f        rrca    
0ad8 1c        inc     e
0ad9 03        inc     bc
0ada 00        nop     
0adb 1e01      ld      e,$01
0add 101e      djnz    $0afd
0adf ff        rst     $38
0ae0 d0        ret     nc

0ae1 ff        rst     $38
0ae2 19        add     hl,de
0ae3 07        rlca    
0ae4 f0        ret     p

0ae5 1b        dec     de
0ae6 e0        ret     po

0ae7 0f        rrca    
0ae8 1c        inc     e
0ae9 0b        dec     bc
0aea 00        nop     
0aeb 1efe      ld      e,$fe
0aed 3a1c01    ld      a,($011c)
0af0 e604      and     $04
0af2 c0        ret     nz

0af3 2a0c01    ld      hl,($010c)
0af6 010400    ld      bc,$0004
0af9 09        add     hl,bc
0afa 220c01    ld      ($010c),hl
0afd 219f0f    ld      hl,$0f9f
0b00 7e        ld      a,(hl)
0b01 feff      cp      $ff
0b03 c8        ret     z

0b04 e5        push    hl
0b05 23        inc     hl
0b06 5e        ld      e,(hl)
0b07 23        inc     hl
0b08 56        ld      d,(hl)
0b09 23        inc     hl
0b0a eb        ex      de,hl
0b0b 2f        cpl     
0b0c a6        and     (hl)
0b0d 77        ld      (hl),a
0b0e eb        ex      de,hl
0b0f 5e        ld      e,(hl)
0b10 23        inc     hl
0b11 56        ld      d,(hl)
0b12 23        inc     hl
0b13 4e        ld      c,(hl)
0b14 2a0c01    ld      hl,($010c)
0b17 19        add     hl,de
0b18 7c        ld      a,h
0b19 07        rlca    
0b1a 57        ld      d,a
0b1b e681      and     $81
0b1d c23c0b    jp      nz,$0b3c
0b20 7d        ld      a,l
0b21 07        rlca    
0b22 e601      and     $01
0b24 b2        or      d
0b25 2f        cpl     
0b26 47        ld      b,a
0b27 cd1903    call    $0319
0b2a eb        ex      de,hl
0b2b e1        pop     hl
0b2c 77        ld      (hl),a
0b2d 23        inc     hl
0b2e 73        ld      (hl),e
0b2f 23        inc     hl
0b30 72        ld      (hl),d
0b31 23        inc     hl
0b32 eb        ex      de,hl
0b33 b6        or      (hl)
0b34 77        ld      (hl),a
0b35 eb        ex      de,hl
0b36 23        inc     hl
0b37 23        inc     hl
0b38 23        inc     hl
0b39 c3000b    jp      $0b00
0b3c e1        pop     hl
0b3d 3600      ld      (hl),$00
0b3f 010600    ld      bc,$0006
0b42 09        add     hl,bc
0b43 c3000b    jp      $0b00
0b46 e5        push    hl
0b47 2a0801    ld      hl,($0108)
0b4a 01c800    ld      bc,$00c8
0b4d 09        add     hl,bc
0b4e 220a01    ld      ($010a),hl
0b51 e1        pop     hl
0b52 c9        ret     

0b53 3a6c00    ld      a,($006c)
0b56 fe01      cp      $01
0b58 c2710b    jp      nz,$0b71
0b5b 3aba00    ld      a,($00ba)
0b5e fe01      cp      $01
0b60 ca800b    jp      z,$0b80
0b63 3a1d01    ld      a,($011d)
0b66 c610      add     a,$10
0b68 321d01    ld      ($011d),a
0b6b 2f        cpl     
0b6c d3ff      out     ($ff),a
0b6e c3800b    jp      $0b80
0b71 3aba00    ld      a,($00ba)
0b74 fe01      cp      $01
0b76 c2800b    jp      nz,$0b80
0b79 3a1d01    ld      a,($011d)
0b7c 3c        inc     a
0b7d c3680b    jp      $0b68
0b80 2100c0    ld      hl,$c000
0b83 22bb00    ld      ($00bb),hl
0b86 226f00    ld      ($006f),hl
0b89 210040    ld      hl,$4000
0b8c 226d00    ld      ($006d),hl
0b8f 22bd00    ld      ($00bd),hl
0b92 210000    ld      hl,$0000
0b95 227100    ld      ($0071),hl
0b98 22bf00    ld      ($00bf),hl
0b9b 227300    ld      ($0073),hl
0b9e 22c100    ld      ($00c1),hl
0ba1 3e01      ld      a,$01
0ba3 326c00    ld      ($006c),a
0ba6 32ba00    ld      ($00ba),a
0ba9 3e00      ld      a,$00
0bab 32b400    ld      ($00b4),a
0bae 320201    ld      ($0102),a
0bb1 32b200    ld      ($00b2),a
0bb4 320001    ld      ($0100),a
0bb7 32b900    ld      ($00b9),a
0bba 320701    ld      ($0107),a
0bbd 32b800    ld      ($00b8),a
0bc0 320601    ld      ($0106),a
0bc3 3eff      ld      a,$ff
0bc5 325014    ld      ($1450),a
0bc8 327500    ld      ($0075),a
0bcb 32c300    ld      ($00c3),a
0bce 3a6600    ld      a,($0066)
0bd1 32b500    ld      ($00b5),a
0bd4 320301    ld      ($0103),a
0bd7 2a5e00    ld      hl,($005e)
0bda 22b600    ld      ($00b6),hl
0bdd 220401    ld      ($0104),hl
0be0 3e87      ld      a,$87
0be2 32b300    ld      ($00b3),a
0be5 3e2d      ld      a,$2d
0be7 320101    ld      ($0101),a
0bea 3e10      ld      a,$10
0bec 32ff00    ld      ($00ff),a
0bef 3ef0      ld      a,$f0
0bf1 32b100    ld      ($00b1),a
0bf4 cda80c    call    $0ca8
0bf7 21ec0a    ld      hl,$0aec
0bfa 221801    ld      ($0118),hl
0bfd c9        ret     

0bfe fee0      cp      $e0
0c00 d0        ret     nc

0c01 78        ld      a,b
0c02 f60c      or      $0c
0c04 47        ld      b,a
0c05 e3        ex      (sp),hl
0c06 19        add     hl,de
0c07 e3        ex      (sp),hl
0c08 c9        ret     

					game start

0c09 310018    ld      sp,$1800		init stack
0c0c 210100    ld      hl,$0001
0c0f 221a01    ld      ($011a),hl
0c12 210000    ld      hl,$0000
0c15 220801    ld      ($0108),hl
0c18 06c8      ld      b,$c8
0c1a 219f0f    ld      hl,$0f9f
0c1d af        xor     a
0c1e 77        ld      (hl),a
0c1f 23        inc     hl
0c20 77        ld      (hl),a
0c21 23        inc     hl
0c22 77        ld      (hl),a
0c23 23        inc     hl
0c24 cd8107    call    $0781		
0c27 77        ld      (hl),a
0c28 23        inc     hl
0c29 cd8107    call    $0781
0c2c 77        ld      (hl),a
0c2d 23        inc     hl
0c2e cd8107    call    $0781
0c31 77        ld      (hl),a
0c32 23        inc     hl
0c33 3a0801    ld      a,($0108)
0c36 3c        inc     a
0c37 320801    ld      ($0108),a
0c3a 05        dec     b
0c3b c21d0c    jp      nz,$0c1d

0c3e 36ff      ld      (hl),$ff
0c40 cd530b    call    $0b53
0c43 3e8c      ld      a,$8c
0c45 d30e      out     ($0e),a		Turn On Dazzler, frame buffer at $1800
0c47 3e6c      ld      a,$6c
0c49 d30f      out     ($0f),a		Dazzler Mode: 	resolution x4=1
0c4b af        xor     a				framebuffer 2k=1
0c4c 321d01    ld      ($011d),a			color=0
0c4f 2f        cpl     
0c50 d3ff      out     ($ff),a		out $FF to cromenco control panel lights
0c52 c3a20c    jp      $0ca2

0c55 cd1204    call    $0412
0c58 cd9c03    call    $039c
0c5b cd9007    call    $0790
0c5e cd2e01    call    $012e
0c61 cd5203    call    $0352
0c64 cd8a08    call    $088a
0c67 2a1a01    ld      hl,($011a)
0c6a 2b        dec     hl
0c6b 7c        ld      a,h
0c6c b5        or      l
0c6d c26a0c    jp      nz,$0c6a
0c70 210100    ld      hl,$0001
0c73 221a01    ld      ($011a),hl
0c76 2a0801    ld      hl,($0108)
0c79 23        inc     hl
0c7a 220801    ld      ($0108),hl
0c7d 3a0801    ld      a,($0108)
0c80 07        rlca    
0c81 07        rlca    
0c82 07        rlca    
0c83 07        rlca    
0c84 e601      and     $01
0c86 3a0018    ld      a,($1800)
0c89 3a0a01    ld      a,($010a)
0c8c bd        cp      l
0c8d c29a0c    jp      nz,$0c9a
0c90 3a0b01    ld      a,($010b)
0c93 bc        cp      h
0c94 c29a0c    jp      nz,$0c9a
0c97 cd530b    call    $0b53
0c9a 3a0801    ld      a,($0108)
0c9d e607      and     $07
0c9f c2a50c    jp      nz,$0ca5
0ca2 cded0a    call    $0aed
0ca5 c3550c    jp      $0c55

0ca8 210018    ld      hl,$1800		1800=frame buffer
0cab 110020    ld      de,$2000
0cae af        xor     a
0caf 77        ld      (hl),a
0cb0 23        inc     hl
0cb1 7b        ld      a,e
0cb2 bd        cp      l
0cb3 c2ae0c    jp      nz,$0cae
0cb6 7a        ld      a,d
0cb7 bc        cp      h
0cb8 c2ae0c    jp      nz,$0cae
0cbb c9        ret     

0cbc ff        rst     $38
0cbd ff        rst     $38
0cbe ff        rst     $38
0cbf ff        rst     $38

					prog start

0cc0 db1a      in      a,($1a)		in joy1 y-axis 0=centered, 127=up, -127=down
0cc2 07        rlca    
0cc3 0f        rrca    
0cc4 1f        rra     
0cc5 32d10d    ld      ($0dd1),a	
0cc8 db19      in      a,($19)		in joy1 x-axis 0=centered, -127=left, 127=right
0cca 07        rlca    
0ccb 0f        rrca    
0ccc 1f        rra     
0ccd 32d20d    ld      ($0dd2),a	in joy2 y-axis
0cd0 db1c      in      a,($1c)
0cd2 07        rlca    
0cd3 0f        rrca    
0cd4 1f        rra     
0cd5 32d30d    ld      ($0dd3),a	in joy2 x-axis
0cd8 db1b      in      a,($1b)
0cda 07        rlca    
0cdb 0f        rrca    
0cdc 1f        rra     
0cdd 32d40d    ld      ($0dd4),a
0ce0 af        xor     a
0ce1 321c01    ld      ($011c),a	init [011c] = 0
0ce4 db18      in      a,($18)		in joy 1 buttons
0ce6 e606      and     $06
0ce8 c2f40c    jp      nz,$0cf4		jump if button 2 or 3 pressed
0ceb db18      in      a,($18)		in joy 1 buttons again
0ced 07        rlca    
0cee 07        rlca    
0cef 07        rlca    
0cf0 2f        cpl     
0cf1 321c01    ld      ($011c),a	[011c] = ff
0cf4 db18      in      a,($18)		in joy 2 buttons
0cf6 e660      and     $60
0cf8 c2050d    jp      nz,$0d05 	jump if button 2 or 3 pressed
0cfb db18      in      a,($18)
0cfd 0f        rrca    
0cfe 2f        cpl     
0cff 321c01    ld      ($011c),a	[011c] = ff
0d02 c3e40c    jp      $0ce4		jmp read buttons again
0d05 db18      in      a,($18)		check joy 1 buttons still pressed
0d07 e606      and     $06
0d09 caeb0c    jp      z,$0ceb
0d0c c3090c    jp      $0c09		jmp start game

0d0f c5        push    bc
0d10 0600      ld      b,$00
0d12 3ad10d    ld      a,($0dd1)
0d15 4f        ld      c,a
0d16 db1a      in      a,($1a)
0d18 07        rlca    
0d19 0f        rrca    
0d1a 1f        rra     
0d1b 91        sub     c
0d1c fa2b0d    jp      m,$0d2b
0d1f fe0a      cp      $0a
0d21 da370d    jp      c,$0d37
0d24 78        ld      a,b
0d25 f602      or      $02
0d27 47        ld      b,a
0d28 c3370d    jp      $0d37
0d2b fee0      cp      $e0
0d2d d2370d    jp      nc,$0d37
0d30 78        ld      a,b
0d31 f60c      or      $0c
0d33 47        ld      b,a
0d34 c3640d    jp      $0d64
0d37 3ad20d    ld      a,($0dd2)
0d3a 4f        ld      c,a
0d3b db19      in      a,($19)
0d3d 07        rlca    
0d3e 0f        rrca    
0d3f 1f        rra     
0d40 91        sub     c
0d41 fa500d    jp      m,$0d50
0d44 fe06      cp      $06
0d46 da590d    jp      c,$0d59
0d49 78        ld      a,b
0d4a f604      or      $04
0d4c 47        ld      b,a
0d4d c3590d    jp      $0d59
0d50 fefa      cp      $fa
0d52 d2590d    jp      nc,$0d59
0d55 78        ld      a,b
0d56 f608      or      $08
0d58 47        ld      b,a
0d59 db18      in      a,($18)		read joy buttons
0d5b e601      and     $01		button 1 pressed?
0d5d c2640d    jp      nz,$0d64		yes -> skip
0d60 78        ld      a,b		bit0=1 if joy1 button1 released
0d61 f601      or      $01
0d63 47        ld      b,a
0d64 db18      in      a,($18)		read joy buttons
0d66 e606      and     $06
0d68 78        ld      a,b
0d69 c1        pop     bc
0d6a cac00c    jp      z,$0cc0
0d6d c32204    jp      $0422
0d70 c5        push    bc
0d71 0600      ld      b,$00
0d73 3ad30d    ld      a,($0dd3)
0d76 4f        ld      c,a
0d77 db1c      in      a,($1c)
0d79 07        rlca    
0d7a 0f        rrca    
0d7b 1f        rra     
0d7c 91        sub     c
0d7d fa8c0d    jp      m,$0d8c
0d80 fe0a      cp      $0a
0d82 da980d    jp      c,$0d98
0d85 78        ld      a,b
0d86 f602      or      $02
0d88 47        ld      b,a
0d89 c3980d    jp      $0d98
0d8c fee0      cp      $e0
0d8e d2980d    jp      nc,$0d98
0d91 78        ld      a,b
0d92 f60c      or      $0c
0d94 47        ld      b,a
0d95 c3c50d    jp      $0dc5
0d98 3ad40d    ld      a,($0dd4)
0d9b 4f        ld      c,a
0d9c db1b      in      a,($1b)
0d9e 07        rlca    
0d9f 0f        rrca    
0da0 1f        rra     
0da1 91        sub     c
0da2 fab10d    jp      m,$0db1
0da5 fe06      cp      $06
0da7 daba0d    jp      c,$0dba
0daa 78        ld      a,b
0dab f604      or      $04
0dad 47        ld      b,a
0dae c3ba0d    jp      $0dba
0db1 fefa      cp      $fa
0db3 d2ba0d    jp      nc,$0dba
0db6 78        ld      a,b
0db7 f608      or      $08
0db9 47        ld      b,a
0dba db18      in      a,($18)
0dbc e610      and     $10
0dbe c2c50d    jp      nz,$0dc5
0dc1 78        ld      a,b
0dc2 f601      or      $01
0dc4 47        ld      b,a
0dc5 db18      in      a,($18)
0dc7 e660      and     $60
0dc9 78        ld      a,b
0dca c1        pop     bc
0dcb cac00c    jp      z,$0cc0
0dce c33204    jp      $0432
0dd1 010203    ld      bc,$0302
0dd4 04        inc     b
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
