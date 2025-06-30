; Disassembly of the file "E:\Tmp\cpm\cpm sw\pte\Dazzler Programs + SDI\_dz\build\DZMATION.BIN"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Monday, 25 of March 2024 at 05:28 PM
; 
0000 c30002    jp      $0200
0003 1f        rra     
0004 1f        rra     
0005 00        nop     
0006 aa        xor     d
0007 05        dec     b
0008 08        ex      af,af'
0009 00        nop     
000a 00        nop     
000b 00        nop     
000c 00        nop     
000d 00        nop     
000e 00        nop     
000f 182e      jr      $003f
0011 00        nop     
0012 67        ld      h,a
0013 c31900    jp      $0019
0016 2600      ld      h,$00
0018 6f        ld      l,a
0019 220900    ld      ($0009),hl
001c 2a0300    ld      hl,($0003)
001f 44        ld      b,h
0020 4d        ld      c,l
0021 c3d201    jp      $01d2
0024 00        nop     
0025 00        nop     
0026 00        nop     
0027 00        nop     
0028 210100    ld      hl,$0001
002b c9        ret     

002c 00        nop     
002d 00        nop     
002e 00        nop     
002f 00        nop     
0030 3e01      ld      a,$01
0032 320d00    ld      ($000d),a
0035 c3e401    jp      $01e4
0038 c33800    jp      $0038
003b 00        nop     
003c 00        nop     
003d 00        nop     
003e 00        nop     
003f 00        nop     
0040 e5        push    hl
0041 cd8000    call    $0080
0044 e1        pop     hl
0045 c9        ret     

0046 00        nop     
0047 00        nop     
0048 00        nop     
0049 00        nop     
004a 00        nop     
004b 00        nop     
004c 00        nop     
004d 00        nop     
004e 00        nop     
004f 00        nop     
0050 00        nop     
0051 00        nop     
0052 00        nop     
0053 00        nop     
0054 00        nop     
0055 00        nop     
0056 00        nop     
0057 00        nop     
0058 c3c100    jp      $00c1
005b fe00      cp      $00
005d c26300    jp      nz,$0063
0060 cd8000    call    $0080
0063 1100c8    ld      de,$c800         patch:
0066 db00      in      a,($00)		cd0980	call 8009 console status
0068 e640      and     $40              00      nop
006a c28001    jp      nz,$0180
006d 3a0b00    ld      a,($000b)
0070 fe00      cp      $00
0072 c26600    jp      nz,$0066
0075 13        inc     de
0076 7a        ld      a,d
0077 fe00      cp      $00
0079 c26600    jp      nz,$0066
007c c35800    jp      $0058
007f 00        nop     
0080 2a0300    ld      hl,($0003)
0083 7d        ld      a,l
0084 d602      sub     $02
0086 00        nop     
0087 00        nop     
0088 00        nop     
0089 4f        ld      c,a
008a 44        ld      b,h
008b cdb800    call    $00b8
008e 79        ld      a,c
008f c604      add     a,$04
0091 00        nop     
0092 00        nop     
0093 00        nop     
0094 4f        ld      c,a
0095 cdb800    call    $00b8
0098 2a0300    ld      hl,($0003)
009b 7c        ld      a,h
009c d602      sub     $02
009e 00        nop     
009f 00        nop     
00a0 00        nop     
00a1 47        ld      b,a
00a2 4d        ld      c,l
00a3 cdb800    call    $00b8
00a6 78        ld      a,b
00a7 c604      add     a,$04
00a9 00        nop     
00aa 00        nop     
00ab 00        nop     
00ac 47        ld      b,a
00ad cdb800    call    $00b8
00b0 3a0600    ld      a,($0006)
00b3 0f        rrca    
00b4 320600    ld      ($0006),a
00b7 c9        ret     

00b8 cde800    call    $00e8
00bb ee0f      xor     $0f
00bd cd3801    call    $0138
00c0 c9        ret     

00c1 3a0d00    ld      a,($000d)
00c4 fe01      cp      $01
00c6 cab503    jp      z,$03b5
00c9 3a0c00    ld      a,($000c)
00cc c35b00    jp      $005b
00cf 00        nop     
00d0 00        nop     
00d1 00        nop     
00d2 00        nop     
00d3 00        nop     
00d4 00        nop     
00d5 00        nop     
00d6 00        nop     
00d7 00        nop     
00d8 00        nop     
00d9 00        nop     
00da 00        nop     
00db 00        nop     
00dc 00        nop     
00dd 00        nop     
00de 00        nop     
00df 00        nop     
00e0 00        nop     
00e1 00        nop     
00e2 00        nop     
00e3 00        nop     
00e4 00        nop     
00e5 00        nop     
00e6 00        nop     
00e7 00        nop     
00e8 cd0001    call    $0100
00eb 7e        ld      a,(hl)
00ec daf200    jp      c,$00f2
00ef e60f      and     $0f
00f1 c9        ret     

00f2 e6f0      and     $f0
00f4 07        rlca    
00f5 07        rlca    
00f6 07        rlca    
00f7 07        rlca    
00f8 c9        ret     

00f9 010101    ld      bc,$0101
00fc 010101    ld      bc,$0101
00ff 012100    ld      bc,$0021
0102 1078      djnz    $017c
0104 17        rla     
0105 17        rla     
0106 17        rla     
0107 d20e01    jp      nc,$010e
010a 110002    ld      de,$0200
010d 19        add     hl,de
010e 79        ld      a,c
010f 17        rla     
0110 17        rla     
0111 17        rla     
0112 d21901    jp      nc,$0119
0115 110004    ld      de,$0400
0118 19        add     hl,de
0119 79        ld      a,c
011a e61f      and     $1f
011c 07        rlca    
011d 07        rlca    
011e 07        rlca    
011f 17        rla     
0120 5f        ld      e,a
0121 3e00      ld      a,$00
0123 17        rla     
0124 57        ld      d,a
0125 19        add     hl,de
0126 78        ld      a,b
0127 1f        rra     
0128 f5        push    af
0129 00        nop     
012a e60f      and     $0f
012c 5f        ld      e,a
012d 1600      ld      d,$00
012f 19        add     hl,de
0130 f1        pop     af
0131 c9        ret     

0132 00        nop     
0133 00        nop     
0134 00        nop     
0135 00        nop     
0136 00        nop     
0137 00        nop     
0138 e60f      and     $0f
013a f5        push    af
013b cd0001    call    $0100
013e d1        pop     de
013f da4801    jp      c,$0148
0142 7e        ld      a,(hl)
0143 e6f0      and     $f0
0145 82        add     a,d
0146 77        ld      (hl),a
0147 c9        ret     

0148 7a        ld      a,d
0149 07        rlca    
014a 07        rlca    
014b 07        rlca    
014c 07        rlca    
014d 57        ld      d,a
014e 7e        ld      a,(hl)
014f e60f      and     $0f
0151 82        add     a,d
0152 77        ld      (hl),a
0153 c9        ret     

0154 00        nop     
0155 00        nop     
0156 00        nop     
0157 00        nop     
0158 3e00      ld      a,$00
015a 320800    ld      ($0008),a
015d c3c001    jp      $01c0
0160 3e08      ld      a,$08
0162 320800    ld      ($0008),a
0165 c3c001    jp      $01c0
0168 210010    ld      hl,$1000
016b af        xor     a
016c 77        ld      (hl),a
016d 23        inc     hl
016e 7c        ld      a,h
016f fe18      cp      $18
0171 c27f52    jp      nz,$527f
0174 47        ld      b,a
0175 59        ld      e,c
0176 42        ld      b,d
0177 50        ld      d,b
0178 43        ld      b,e
0179 57        ld      d,a
017a ff        rst     $38
017b 00        nop     
017c 00        nop     
017d 00        nop     
017e 00        nop     
017f 00        nop     
0180 3a0600    ld      a,($0006)
0183 0f        rrca    
0184 dc8000    call    c,$0080
0187 cdd103    call    $03d1
018a 78        ld      a,b
018b fe20      cp      $20
018d cac001    jp      z,$01c0
0190 217201    ld      hl,$0172
0193 00        nop     
0194 11ffff    ld      de,$ffff
0197 1c        inc     e
0198 78        ld      a,b
0199 00        nop     
019a 00        nop     
019b 00        nop     
019c be        cp      (hl)
019d caaa01    jp      z,$01aa
01a0 7e        ld      a,(hl)
01a1 feff      cp      $ff
01a3 ca4002    jp      z,$0240
01a6 23        inc     hl
01a7 c39701    jp      $0197
01aa 7b        ld      a,e
01ab 00        nop     
01ac 00        nop     
01ad 00        nop     
01ae 00        nop     
01af 00        nop     
01b0 320700    ld      ($0007),a
01b3 00        nop     
01b4 00        nop     
01b5 00        nop     
01b6 00        nop     
01b7 00        nop     
01b8 00        nop     
01b9 00        nop     
01ba 00        nop     
01bb 00        nop     
01bc 00        nop     
01bd 00        nop     
01be 00        nop     
01bf 00        nop     
01c0 2a0300    ld      hl,($0003)
01c3 44        ld      b,h
01c4 4d        ld      c,l
01c5 00        nop     
01c6 2a0700    ld      hl,($0007)
01c9 7c        ld      a,h
01ca 85        add     a,l
01cb 00        nop     
01cc 00        nop     
01cd 00        nop     
01ce 00        nop     
01cf cd3801    call    $0138
01d2 2a0900    ld      hl,($0009)
01d5 7c        ld      a,h
01d6 80        add     a,b
01d7 67        ld      h,a
01d8 7d        ld      a,l
01d9 81        add     a,c
01da 6f        ld      l,a
01db 220300    ld      ($0003),hl
01de cdc302    call    $02c3
01e1 c35800    jp      $0058
01e4 110000    ld      de,$0000
01e7 dbff      in      a,($ff)
01e9 57        ld      d,a
01ea 13        inc     de
01eb 7a        ld      a,d
01ec feff      cp      $ff
01ee c8        ret     z

01ef c3ea01    jp      $01ea
01f2 7f        ld      a,a
01f3 52        ld      d,d
01f4 47        ld      b,a
01f5 59        ld      e,c
01f6 42        ld      b,d
01f7 50        ld      d,b
01f8 43        ld      b,e
01f9 57        ld      d,a
01fa 2e2c      ld      l,$2c
01fc 4d        ld      c,l
01fd 4e        ld      c,(hl)
01fe 2f        cpl     
01ff 1b        dec     de
0200 31ff0f    ld      sp,$0fff
0203 3e88      ld      a,$88
0205 d30e      out     ($0e),a
0207 3e30      ld      a,$30
0209 d30f      out     ($0f),a
020b 211f1f    ld      hl,$1f1f
020e 220300    ld      ($0003),hl
0211 2100aa    ld      hl,$aa00
0214 220500    ld      ($0005),hl
0217 210018    ld      hl,$1800
021a 220e00    ld      ($000e),hl
021d 210900    ld      hl,$0009
0220 af        xor     a
0221 77        ld      (hl),a
0222 23        inc     hl
0223 7d        ld      a,l
0224 fe0d      cp      $0d
0226 c22002    jp      nz,$0220
0229 cd3002    call    $0230
022c c35800    jp      $0058
022f 00        nop     
0230 210010    ld      hl,$1000
0233 af        xor     a
0234 77        ld      (hl),a
0235 23        inc     hl
0236 7c        ld      a,h
0237 fe20      cp      $20
0239 c23302    jp      nz,$0233
023c c9        ret     

023d 00        nop     
023e 00        nop     
023f 00        nop     
0240 216802    ld      hl,$0268
0243 118015    ld      de,$1580
0246 78        ld      a,b
0247 be        cp      (hl)
0248 ca5402    jp      z,$0254
024b 23        inc     hl
024c 15        dec     d
024d ca5800    jp      z,$0058
0250 1c        inc     e
0251 c34602    jp      $0246
0254 6b        ld      l,e
0255 6e        ld      l,(hl)
0256 24        inc     h
0257 e9        jp      (hl)
0258 00        nop     
0259 2a0300    ld      hl,($0003)
025c 44        ld      b,h
025d 4d        ld      c,l
025e c3d201    jp      $01d2
0261 c30001    jp      $0100
0264 00        nop     
0265 00        nop     
0266 00        nop     
0267 00        nop     
0268 2e2c      ld      l,$2c
026a 4d        ld      c,l
026b 4e        ld      c,(hl)
026c 2f        cpl     
026d 113b3e    ld      de,$3e3b
0270 3c        inc     a
0271 5d        ld      e,l
0272 5e        ld      e,(hl)
0273 4c        ld      c,h
0274 48        ld      c,b
0275 03        inc     bc
0276 02        ld      (bc),a
0277 1040      djnz    $02b9
0279 1b        dec     de
027a 12        ld      (de),a
027b 13        inc     de
027c 00        nop     
027d 00        nop     
027e 00        nop     
027f 00        nop     
0280 00        nop     
0281 05        dec     b
0282 0a        ld      a,(bc)
0283 0f        rrca    
0284 14        inc     d
0285 1d        dec     e
0286 ed23      db      $ed, $23         ; Undocumented 8 T-State NOP
0288 2b        dec     hl
0289 33        inc     sp
028a 3b        dec     sp
028b 43        ld      b,e
028c 46        ld      b,(hl)
028d 50        ld      d,b
028e 5a        ld      e,d
028f c0        ret     nz

0290 8b        adc     a,e
0291 98        sbc     a,b
0292 af        xor     a
0293 a8        xor     b
0294 a5        and     l
0295 00        nop     
0296 00        nop     
0297 00        nop     
0298 00        nop     
0299 07        rlca    
029a 00        nop     
029b 00        nop     
029c 00        nop     
029d 00        nop     
029e 00        nop     
029f 00        nop     
02a0 00        nop     
02a1 00        nop     
02a2 00        nop     
02a3 00        nop     
02a4 00        nop     
02a5 00        nop     
02a6 00        nop     
02a7 00        nop     
02a8 70        ld      (hl),b
02a9 015000    ld      bc,$0050
02ac 50        ld      d,b
02ad 00        nop     
02ae 3001      jr      nc,$02b1
02b0 08        ex      af,af'
02b1 00        nop     
02b2 90        sub     b
02b3 00        nop     
02b4 00        nop     
02b5 09        add     hl,bc
02b6 00        nop     
02b7 00        nop     
02b8 3005      jr      nc,$02bf
02ba 00        nop     
02bb 05        dec     b
02bc 00        nop     
02bd 05        dec     b
02be 3001      jr      nc,$02c1
02c0 00        nop     
02c1 00        nop     
02c2 60        ld      h,b
02c3 2a0300    ld      hl,($0003)
02c6 7c        ld      a,h
02c7 e6c0      and     $c0
02c9 cadc02    jp      z,$02dc
02cc 17        rla     
02cd d2d602    jp      nc,$02d6
02d0 263f      ld      h,$3f
02d2 2d        dec     l
02d3 c3dc02    jp      $02dc
02d6 2600      ld      h,$00
02d8 2c        inc     l
02d9 00        nop     
02da 00        nop     
02db 00        nop     
02dc 7d        ld      a,l
02dd e6c0      and     $c0
02df caf202    jp      z,$02f2
02e2 17        rla     
02e3 d2ec02    jp      nc,$02ec
02e6 2e3f      ld      l,$3f
02e8 25        dec     h
02e9 c3c602    jp      $02c6
02ec 2e00      ld      l,$00
02ee 24        inc     h
02ef c3c602    jp      $02c6
02f2 220300    ld      ($0003),hl
02f5 c9        ret     

02f6 c602      add     a,$02
02f8 2e3f      ld      l,$3f
02fa 25        dec     h
02fb c3c602    jp      $02c6
02fe 00        nop     
02ff 00        nop     
0300 3e01      ld      a,$01
0302 c31000    jp      $0010
0305 3eff      ld      a,$ff
0307 c31000    jp      $0010
030a 3e01      ld      a,$01
030c c31600    jp      $0016
030f 3eff      ld      a,$ff
0311 c31600    jp      $0016
0314 210000    ld      hl,$0000
0317 220900    ld      ($0009),hl
031a c3c001    jp      $01c0
031d c30000    jp      $0000
0320 00        nop     
0321 00        nop     
0322 00        nop     
0323 3e01      ld      a,$01
0325 320a00    ld      ($000a),a
0328 c35800    jp      $0058
032b 3eff      ld      a,$ff
032d 320a00    ld      ($000a),a
0330 c35800    jp      $0058
0333 3e01      ld      a,$01
0335 320900    ld      ($0009),a
0338 c35800    jp      $0058
033b 3eff      ld      a,$ff
033d 320900    ld      ($0009),a
0340 c35800    jp      $0058
0343 c35801    jp      $0158
0346 c36001    jp      $0160
0349 00        nop     
034a 00        nop     
034b 00        nop     
034c 00        nop     
034d 00        nop     
034e 00        nop     
034f 00        nop     
0350 3a0c00    ld      a,($000c)
0353 2f        cpl     
0354 320c00    ld      ($000c),a
0357 c35800    jp      $0058
035a 3a0b00    ld      a,($000b)
035d 2f        cpl     
035e 320b00    ld      ($000b),a
0361 c35800    jp      $0058
0364 1620      ld      d,$20
0366 ef        rst     $28
0367 cd8003    call    $0380
036a 15        dec     d
036b c26703    jp      nz,$0367
036e 00        nop     
036f c9        ret     

0370 210018    ld      hl,$1800
0373 00        nop     
0374 cd8003    call    $0380
0377 fe13      cp      $13
0379 ca9103    jp      z,$0391
037c 23        inc     hl
037d c37303    jp      $0373		patched to:
0380 db00      in      a,($00)		7e     ld a,(hl)
0382 e680      and     $80		cd0680 call 8006	conout
0384 ca8003    jp      z,$0380          000000
0387 7e        ld      a,(hl)           00
0388 d301      out     ($01),a          0000
038a c9        ret     

038b cd6403    call    $0364
038e c37003    jp      $0370
0391 cd6403    call    $0364
0394 c35800    jp      $0058
0397 00        nop     
0398 3e18      ld      a,$18
039a 323802    ld      ($0238),a
039d cd3002    call    $0230
03a0 3e20      ld      a,$20
03a2 323802    ld      ($0238),a
03a5 c35800    jp      $0058
03a8 af        xor     a
03a9 320d00    ld      ($000d),a
03ac c33204    jp      $0432
03af 21ff17    ld      hl,$17ff
03b2 220e00    ld      ($000e),hl
03b5 f7        rst     $30
03b6 00        nop     
03b7 00        nop     
03b8 c30604    jp      $0406
03bb 23        inc     hl
03bc 46        ld      b,(hl)
03bd c30004    jp      $0400
03c0 210000    ld      hl,$0000		patched to:
03c3 db00      in      a,($00)		7e     ld a,(hl)
03c5 e680      and     $80		cd0680 call 8006	conout
03c7 cac303    jp      z,$03c3          000000
03ca 7e        ld      a,(hl)           00
03cb d301      out     ($01),a          0000
03cd 23        inc     hl
03ce c3c303    jp      $03c3
03d1 21ef03    ld      hl,$03ef
03d4 db01      in      a,($01)		cd0380 call 8003	conin
03d6 e67f      and     $7f              00     nop
03d8 47        ld      b,a
03d9 23        inc     hl
03da 78        ld      a,b
03db be        cp      (hl)
03dc c8        ret     z

03dd 7e        ld      a,(hl)
03de feff      cp      $ff
03e0 c2d903    jp      nz,$03d9
03e3 78        ld      a,b
03e4 2a0e00    ld      hl,($000e)
03e7 77        ld      (hl),a
03e8 23        inc     hl
03e9 220e00    ld      ($000e),hl
03ec c9        ret     

03ed c31c00    jp      $001c
03f0 03        inc     bc
03f1 02        ld      (bc),a
03f2 1040      djnz    $0434
03f4 1100ff    ld      de,$ff00
03f7 00        nop     
03f8 00        nop     
03f9 00        nop     
03fa 00        nop     
03fb 00        nop     
03fc 00        nop     
03fd 00        nop     
03fe 00        nop     
03ff 00        nop     
0400 220e00    ld      ($000e),hl
0403 c38a01    jp      $018a
0406 2a0e00    ld      hl,($000e)	path to
0409 db01      in      a,($01)		3e00 ld a,0
040b fe11      cp      $11
040d c21804    jp      nz,$0418
0410 3e00      ld      a,$00
0412 320d00    ld      ($000d),a
0415 c30000    jp      $0000
0418 fe9a      cp      $9a
041a c22504    jp      nz,$0425
041d 3e00      ld      a,$00
041f 320d00    ld      ($000d),a
0422 c35800    jp      $0058
0425 fe18      cp      $18
0427 c2bb03    jp      nz,$03bb
042a 3ea8      ld      a,$a8
042c 329202    ld      ($0292),a
042f c3bb03    jp      $03bb
0432 3eaf      ld      a,$af
0434 329202    ld      ($0292),a
0437 c35800    jp      $0058
043a 07        rlca    
043b 07        rlca    
043c 07        rlca    
043d 07        rlca    
043e 07        rlca    
043f 07        rlca    
0440 00        nop     
0441 00        nop     
0442 00        nop     
0443 00        nop     
0444 00        nop     
0445 00        nop     
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
0455 0d        dec     c
0456 0d        dec     c
0457 0d        dec     c
0458 0d        dec     c
0459 0d        dec     c
045a 0d        dec     c
045b 0d        dec     c
045c 0d        dec     c
045d 0d        dec     c
045e 0d        dec     c
045f 0d        dec     c
0460 0d        dec     c
0461 0d        dec     c
0462 0d        dec     c
0463 0d        dec     c
0464 0d        dec     c
0465 210301    ld      hl,$0103
0468 110000    ld      de,$0000
046b 016504    ld      bc,$0465
046e edb0      ldir    
0470 c30000    jp      $0000
