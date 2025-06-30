                                                                                                                                                                                                                                                ; Disassembly of the file "E:\Tmp\cpm\cpm\Ok\Graphics\Dazzler\_dz\build\life_0000.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Monday, 29 of January 2024 at 05:22 PM
; 
0000 c34000    jp      $0040
0003 00        nop     
0004 00        nop     
0005 00        nop     
0006 00        nop     
0007 00        nop     
0008 00        nop     
0009 00        nop     
000a 00        nop     
000b 00        nop     
000c 00        nop     
000d 00        nop     
000e 00        nop     
000f 00        nop     
0010 00        nop     
0011 00        nop     
0012 00        nop     
0013 00        nop     
0014 00        nop     
0015 00        nop     
0016 00        nop     
0017 00        nop     
0018 00        nop     
0019 00        nop     
001a 00        nop     
001b 00        nop     
001c 00        nop     
001d 00        nop     
001e 00        nop     
001f 00        nop     
0020 00        nop     
0021 00        nop     
0022 00        nop     
0023 00        nop     
0024 00        nop     
0025 00        nop     
0026 00        nop     
0027 00        nop     
0028 00        nop     
0029 00        nop     
002a 00        nop     
002b 00        nop     
002c 00        nop     
002d 00        nop     
002e 00        nop     
002f 00        nop     
0030 00        nop     
0031 00        nop     
0032 00        nop     
0033 00        nop     
0034 00        nop     
0035 00        nop     
0036 00        nop     
0037 00        nop     
0038 00        nop     
0039 00        nop     
003a 00        nop     
003b 00        nop     
003c 00        nop     
003d 00        nop     
003e 00        nop     
003f 00        nop     
0040 310008    ld      sp,$0800
0043 cdb501    call    $01b5
0046 cddd01    call    $01dd
0049 cd7d00    call    $007d
004c cd6200    call    $0062
004f cd9200    call    $0092
0052 cd6200    call    $0062
0055 dbff      in      a,($ff)
0057 17        rla     
0058 da5500    jp      c,$0055
005b 17        rla     
005c da4600    jp      c,$0046
005f c34900    jp      $0049
0062 c9        ret     

0063 02        ld      (bc),a
0064 02        ld      (bc),a
0065 02        ld      (bc),a
0066 02        ld      (bc),a
0067 02        ld      (bc),a
0068 02        ld      (bc),a
0069 02        ld      (bc),a
006a 02        ld      (bc),a
006b 02        ld      (bc),a
006c 02        ld      (bc),a
006d 02        ld      (bc),a
006e 02        ld      (bc),a
006f 02        ld      (bc),a
0070 02        ld      (bc),a
0071 02        ld      (bc),a
0072 02        ld      (bc),a
0073 02        ld      (bc),a
0074 02        ld      (bc),a
0075 02        ld      (bc),a
0076 02        ld      (bc),a
0077 02        ld      (bc),a
0078 02        ld      (bc),a
0079 02        ld      (bc),a
007a 02        ld      (bc),a
007b 02        ld      (bc),a
007c c9        ret     

007d 010000    ld      bc,$0000
0080 cdd400    call    $00d4
0083 3e40      ld      a,$40
0085 0c        inc     c
0086 b9        cp      c
0087 c28000    jp      nz,$0080
008a 0e00      ld      c,$00
008c 04        inc     b
008d b8        cp      b
008e c28000    jp      nz,$0080
0091 c9        ret     

0092 010000    ld      bc,$0000
0095 cd3401    call    $0134
0098 fe09      cp      $09
009a c2a500    jp      nz,$00a5
009d 3e00      ld      a,$00
009f cd4501    call    $0145
00a2 c3af00    jp      $00af
00a5 fe0a      cp      $0a
00a7 c2af00    jp      nz,$00af
00aa 3e04      ld      a,$04
00ac cd4501    call    $0145
00af 3e40      ld      a,$40
00b1 0c        inc     c
00b2 b9        cp      c
00b3 c29500    jp      nz,$0095
00b6 0e00      ld      c,$00
00b8 04        inc     b
00b9 b8        cp      b
00ba c29500    jp      nz,$0095
00bd c9        ret     

00be 210008    ld      hl,$0800
00c1 1100f8    ld      de,$f800
00c4 0600      ld      b,$00
00c6 3e00      ld      a,$00
00c8 ba        cp      d
00c9 c2ce00    jp      nz,$00ce
00cc bb        cp      e
00cd c8        ret     z

00ce 70        ld      (hl),b
00cf 13        inc     de
00d0 23        inc     hl
00d1 c3c800    jp      $00c8
00d4 c5        push    bc
00d5 3e00      ld      a,$00
00d7 b9        cp      c
00d8 c2ec00    jp      nz,$00ec
00db 0d        dec     c
00dc cd1c01    call    $011c
00df 327402    ld      ($0274),a
00e2 c1        pop     bc
00e3 c5        push    bc
00e4 cd1c01    call    $011c
00e7 327502    ld      ($0275),a
00ea c1        pop     bc
00eb c5        push    bc
00ec 0c        inc     c
00ed cd1c01    call    $011c
00f0 217502    ld      hl,$0275
00f3 46        ld      b,(hl)
00f4 77        ld      (hl),a
00f5 80        add     a,b
00f6 2b        dec     hl
00f7 4e        ld      c,(hl)
00f8 70        ld      (hl),b
00f9 81        add     a,c
00fa 57        ld      d,a
00fb c1        pop     bc
00fc c8        ret     z

00fd d5        push    de
00fe cd3401    call    $0134
0101 d1        pop     de
0102 fe00      cp      $00
0104 ca1301    jp      z,$0113
0107 7a        ld      a,d
0108 fe03      cp      $03
010a c8        ret     z

010b fe04      cp      $04
010d c8        ret     z

010e 3e09      ld      a,$09
0110 c34501    jp      $0145
0113 7a        ld      a,d
0114 fe03      cp      $03
0116 c0        ret     nz

0117 3e0a      ld      a,$0a
0119 c34501    jp      $0145
011c 05        dec     b
011d c37e02    jp      $027e
0120 04        inc     b
0121 cd2a01    call    $012a
0124 04        inc     b
0125 cd2a01    call    $012a
0128 7a        ld      a,d
0129 c9        ret     

012a d5        push    de
012b cd3401    call    $0134
012e d1        pop     de
012f fe00      cp      $00
0131 c38602    jp      $0286
0134 cd6101    call    $0161
0137 7e        ld      a,(hl)
0138 da3e01    jp      c,$013e
013b e60f      and     $0f
013d c9        ret     

013e e6f0      and     $f0
0140 07        rlca    
0141 07        rlca    
0142 07        rlca    
0143 07        rlca    
0144 c9        ret     

0145 e60f      and     $0f
0147 f5        push    af
0148 cd6101    call    $0161
014b d1        pop     de
014c da5501    jp      c,$0155
014f 7e        ld      a,(hl)
0150 e6f0      and     $f0
0152 82        add     a,d
0153 77        ld      (hl),a
0154 c9        ret     

0155 7a        ld      a,d
0156 07        rlca    
0157 07        rlca    
0158 07        rlca    
0159 07        rlca    
015a 57        ld      d,a
015b 7e        ld      a,(hl)
015c e60f      and     $0f
015e 82        add     a,d
015f 77        ld      (hl),a
0160 c9        ret     

0161 210008    ld      hl,$0800
0164 78        ld      a,b
0165 e620      and     $20
0167 ca6e01    jp      z,$016e
016a 110002    ld      de,$0200
016d 19        add     hl,de
016e 79        ld      a,c
016f e620      and     $20
0171 ca7801    jp      z,$0178
0174 110004    ld      de,$0400
0177 19        add     hl,de
0178 79        ld      a,c
0179 e61f      and     $1f
017b 07        rlca    
017c 07        rlca    
017d 07        rlca    
017e 17        rla     
017f 5f        ld      e,a
0180 3e00      ld      a,$00
0182 17        rla     
0183 57        ld      d,a
0184 19        add     hl,de
0185 78        ld      a,b
0186 1f        rra     
0187 f5        push    af
0188 e60f      and     $0f
018a 5f        ld      e,a
018b 1600      ld      d,$00
018d 19        add     hl,de
018e f1        pop     af
018f c9        ret     

0190 db10      in      a,($10)		call 8009	get console status
0192 e601      and     $01		nop	
0194 c0        ret     nz			
0195 0c        inc     c                        
0196 c29001    jp      nz,$0190
0199 04        inc     b
019a c29001    jp      nz,$0190
019d c9        ret     

019e db10      in      a,($10)		ld a,b		78
01a0 e602      and     $02              jp 8006		c3 06 80   put char in console
01a2 ca9e01    jp      z,$019e                         
01a5 78        ld      a,b               
01a6 d311      out     ($11),a
01a8 c9        ret     

01a9 46        ld      b,(hl)
01aa 3e00      ld      a,$00
01ac b8        cp      b
01ad c8        ret     z

01ae cd9e01    call    $019e
01b1 23        inc     hl
01b2 c3a901    jp      $01a9
01b5 cdbe00    call    $00be
01b8 3e84      ld      a,$84
01ba d30e      out     ($0e),a
01bc 3eb0      ld      a,$b0
01be d30f      out     ($0f),a
01c0 217302    ld      hl,$0273
01c3 cda901    call    $01a9
01c6 cd9001    call    $0190
01c9 cac601    jp      z,$01c6					get console char
01cc db11      in      a,($11)		call 0010   cd 10 00	0010 cd 03 80 call 8003
01ce 47        ld      b,a					0013 47       ld b,a
01cf cd9e01    call    $019e 		echo char		0014 c9       ret
01d2 e67f      and     $7f
01d4 fe59      cp      $59		'Y'?
01d6 c8        ret     z
01d7 23        inc     hl
01d8 73        ld      (hl),e
01d9 02        ld      (bc),a
01da c39e01    jp      $019e		ret
01dd 23        inc     hl
01de 73        ld      (hl),e
01df 02        ld      (bc),a
01e0 cd9e01    call    $019e
01e3 c38c02    jp      $028c
01e6 cd4202    call    $0242
01e9 c37602    jp      $0276

01ec 57        ld      d,a
01ed 97        sub     a
01ee be        cp      (hl)
01ef cae601    jp      z,$01e6
01f2 7a        ld      a,d
01f3 be        cp      (hl)
01f4 cafd01    jp      z,$01fd
01f7 23        inc     hl
01f8 23        inc     hl
01f9 23        inc     hl
01fa c3ed01    jp      $01ed
01fd 23        inc     hl
01fe 5e        ld      e,(hl)
01ff 23        inc     hl
0200 56        ld      d,(hl)
0201 eb        ex      de,hl
0202 cd0802    call    $0208
0205 c3e601    jp      $01e6
0208 e9        jp      (hl)
0209 013202    ld      bc,$0232
020c 02        ld      (bc),a
020d 39        add     hl,sp
020e 02        ld      (bc),a
020f 04        inc     b
0210 2802      jr      z,$0214
0212 08        ex      af,af'
0213 40        ld      b,b
0214 02        ld      (bc),a
0215 09        add     hl,bc
0216 37        scf     
0217 02        ld      (bc),a
0218 0f        rrca    
0219 3002      jr      nc,$021d
021b 0b        dec     bc
021c 2a020d    ld      hl,($0d02)
021f 2e02      ld      l,$02
0221 0e3e      ld      c,$3e
0223 02        ld      (bc),a
0224 00        nop     
0225 00        nop     
0226 00        nop     
0227 00        nop     
0228 c1        pop     bc
0229 c9        ret     

022a 110000    ld      de,$0000
022d c9        ret     

022e 0600      ld      b,$00
0230 0c        inc     c
0231 c9        ret     

0232 3e0f      ld      a,$0f
0234 cd4501    call    $0145
0237 04        inc     b
0238 c9        ret     

0239 3e00      ld      a,$00
023b c33402    jp      $0234
023e 0d        dec     c
023f c9        ret     

0240 05        dec     b
0241 c9        ret     

0242 cd3401    call    $0134
0245 f5        push    af
0246 c5        push    bc
0247 3e0c      ld      a,$0c
0249 cd4501    call    $0145
024c 11f8f8    ld      de,$f8f8
024f cd9001    call    $0190
0252 c26f02    jp      nz,$026f
0255 c1        pop     bc
0256 c5        push    bc
0257 3e00      ld      a,$00
0259 cd4501    call    $0145
025c 11f8f8    ld      de,$f8f8
025f cd9001    call    $0190
0262 c1        pop     bc
0263 ca4602    jp      z,$0246
0266 f1        pop     af
0267 cd4501    call    $0145
026a db11      in      a,($11)		jp 0020		0020 cd 03 80 call 8003 getchar
026c d311      out     ($11),a		nop		0023 cd 06 80 call 8006 putchar
026e c9        ret                                      0026 c9       ret

026f c1        pop     bc
0270 c36602    jp      $0266
0273 00        nop     
0274 00        nop     
0275 00        nop     
0276 210902    ld      hl,$0209
0279 e67f      and     $7f
027b c3ec01    jp      $01ec
027e 1600      ld      d,$00
0280 cd2a01    call    $012a
0283 c32001    jp      $0120
0286 c8        ret     z

0287 fe0a      cp      $0a
0289 c8        ret     z

028a 14        inc     d
028b c9        ret     

028c cdbe00    call    $00be
028f 110000    ld      de,$0000
0292 c3e601    jp      $01e6
0295 00        nop     
0296 00        nop     
0297 00        nop     
0298 00        nop     
0299 00        nop     
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
02a8 00        nop     
02a9 00        nop     
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
02d1 00        nop     
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
02dc 00        nop     
02dd 00        nop     
02de 00        nop     
02df 00        nop     
02e0 00        nop     
02e1 00        nop     
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
