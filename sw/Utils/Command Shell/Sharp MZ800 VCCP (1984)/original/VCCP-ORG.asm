; Disassembly of the file "E:\Tmp\cpm\pcw\VCCP.COM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Friday, 19 of January 2024 at 03:10 PM
; 
0100 00        nop     
0101 00        nop     
0102 00        nop     
0103 00        nop     
0104 00        nop     
0105 00        nop     
0106 cdf30b    call    $0bf3		copy BIOS entry points
0109 cd6e0c    call    $0c6e		Clear Screen and Home cursor
010c 3e01      ld      a,$01		
010e 320300    ld      ($0003),a	set IOByte=01 -> WBOOT will load VCCP on MZ800
0111 c3ed0f    jp      $0fed		jmp to process VCCP.CFG

0114 46        ld      b,(hl)
0115 010815    ld      bc,$1508
0118 010c08    ld      bc,$080c
011b 5c        ld      e,h
011c 010101    ld      bc,$0101
011f 42        ld      b,d
0120 15        dec     d
0121 04        inc     b
0122 00        nop     
0123 0f        rrca    
0124 81        add     a,c
0125 80        add     a,b
0126 0a        ld      a,(bc)
0127 113404    ld      de,$0434
012a 05        dec     b
012b 05        dec     b
012c 0a        ld      a,(bc)
012d 100b      djnz    $013a
012f 03        inc     bc
0130 113a05    ld      de,$053a
0133 08        ex      af,af'
0134 1007      djnz    $013d
0136 4c        ld      c,h
0137 0b        dec     bc
0138 01014e    ld      bc,$4e01
013b 16

					Main menu keys

013c 0d        return
013d 20	       space
013e 0c        -> key
013f 08        <- key
0140 0b        up key 
0141 0a        down key
0142 08        

0143 0c        	 db 12	  number of entries in jump table
0144 731a        
0146 4118
0148 0d19
014a a219
014c a71a        
014e ca1b
0150 fc1b
0152 071c        dw 1c07
0154 6c14        dw 146c	<CR> processing
0156 1c16
0158 9c17 
015a 6817 

015c 48        db "Help      "
0164 	       db 4c,09
0166           db "Dir       "
016e 	       db 75,09
0170 44        ld      b,h
0171 72        ld      (hl),d
0172 69        ld      l,c
0173 76        halt    
0174 65        ld      h,l
0175 2020      jr      nz,$0197
0177 209d      jr      nz,$0116
0179 09        add     hl,bc
017a 55        ld      d,l
017b 73        ld      (hl),e
017c 65        ld      h,l
017d 72        ld      (hl),d
017e 2020      jr      nz,$01a0
0180 2020      jr      nz,$01a2
0182 be        cp      (hl)
0183 09        add     hl,bc
0184 52        ld      d,d
0185 75        ld      (hl),l
0186 6e        ld      l,(hl)
0187 2020      jr      nz,$01a9
0189 2020      jr      nz,$01ab
018b 20dd      jr      nz,$016a
018d 09        add     hl,bc
018e 53        ld      d,e
018f 65        ld      h,l
0190 61        ld      h,c
0191 72        ld      (hl),d
0192 63        ld      h,e
0193 68        ld      l,b
0194 2020      jr      nz,$01b6
0196 f3        di      
0197 09        add     hl,bc
0198 52        ld      d,d
0199 65        ld      h,l
019a 6e        ld      l,(hl)
019b 61        ld      h,c
019c 6d        ld      l,l
019d 65        ld      h,l
019e 2020      jr      nz,$01c0
01a0 23        inc     hl
01a1 0a        ld      a,(bc)
01a2 45        ld      b,l
01a3 72        ld      (hl),d
01a4 61        ld      h,c
01a5 73        ld      (hl),e
01a6 65        ld      h,l
01a7 2020      jr      nz,$01c9
01a9 2046      jr      nz,$01f1
01ab 0a        ld      a,(bc)
01ac 54        ld      d,h
01ad 79        ld      a,c
01ae 70        ld      (hl),b
01af 65        ld      h,l
01b0 2020      jr      nz,$01d2
01b2 2020      jr      nz,$01d4
01b4 68        ld      l,b
01b5 0a        ld      a,(bc)
01b6 50        ld      d,b
01b7 72        ld      (hl),d
01b8 69        ld      l,c
01b9 6e        ld      l,(hl)
01ba 74        ld      (hl),h
01bb 2020      jr      nz,$01dd
01bd 2089      jr      nz,$0148
01bf 0a        ld      a,(bc)
01c0 4d        ld      c,l
01c1 61        ld      h,c
01c2 6b        ld      l,e
01c3 65        ld      h,l
01c4 2020      jr      nz,$01e6
01c6 2020      jr      nz,$01e8
01c8 ab        xor     e
01c9 0a        ld      a,(bc)
01ca 51        ld      d,c
01cb 75        ld      (hl),l
01cc 69        ld      l,c
01cd 74        ld      (hl),h
01ce 2020      jr      nz,$01f0
01d0 2020      jr      nz,$01f2
01d2 c1        pop     bc
01d3 0a        ld      a,(bc)
01d4 2020      jr      nz,$01f6
01d6 2020      jr      nz,$01f8
01d8 2020      jr      nz,$01fa
01da 2020      jr      nz,$01fc
01dc d5        push    de
01dd 0a        ld      a,(bc)
01de 2020      jr      nz,$0200
01e0 2020      jr      nz,$0202
01e2 2020      jr      nz,$0204
01e4 2020      jr      nz,$0206
01e6 d5        push    de
01e7 0a        ld      a,(bc)
01e8 2020      jr      nz,$020a
01ea 2020      jr      nz,$020c
01ec 2020      jr      nz,$020e
01ee 2020      jr      nz,$0210
01f0 d5        push    de
01f1 0a        ld      a,(bc)
01f2 2020      jr      nz,$0214
01f4 2020      jr      nz,$0216
01f6 2020      jr      nz,$0218
01f8 2020      jr      nz,$021a
01fa d5        push    de
01fb 0a        ld      a,(bc)
01fc 2020      jr      nz,$021e
01fe 2020      jr      nz,$0220
0200 2020      jr      nz,$0222
0202 2020      jr      nz,$0224
0204 d5        push    de
0205 0a        ld      a,(bc)
0206 2020      jr      nz,$0228
0208 2020      jr      nz,$022a
020a 2020      jr      nz,$022c
020c 2020      jr      nz,$022e
020e d5        push    de
020f 0a        ld      a,(bc)
0210 2020      jr      nz,$0232
0212 2020      jr      nz,$0234
0214 2020      jr      nz,$0236
0216 2020      jr      nz,$0238
0218 d5        push    de
0219 0a        ld      a,(bc)
021a 2020      jr      nz,$023c
021c 2020      jr      nz,$023e
021e 2020      jr      nz,$0240
0220 2020      jr      nz,$0242
0222 d5        push    de
0223 0a        ld      a,(bc)
0224 2020      jr      nz,$0246
0226 2020      jr      nz,$0248
0228 2020      jr      nz,$024a
022a 2020      jr      nz,$024c
022c d5        push    de
022d 0a        ld      a,(bc)
022e 2020      jr      nz,$0250
0230 2020      jr      nz,$0252
0232 2020      jr      nz,$0254
0234 2020      jr      nz,$0256
0236 d5        push    de
0237 0a        ld      a,(bc)
0238 2020      jr      nz,$025a
023a 2020      jr      nz,$025c
023c 2020      jr      nz,$025e
023e 2020      jr      nz,$0260
0240 d5        push    de
0241 0a        ld      a,(bc)
0242 2020      jr      nz,$0264
0244 2020      jr      nz,$0266
0246 2020      jr      nz,$0268
0248 2020      jr      nz,$026a
024a d5        push    de
024b 0a        ld      a,(bc)
024c 2020      jr      nz,$026e
024e 2020      jr      nz,$0270
0250 2020      jr      nz,$0272
0252 2020      jr      nz,$0274
0254 d5        push    de
0255 0a        ld      a,(bc)
0256 00        nop     
0257 34        inc     (hl)
0258 04        inc     b
0259 0f        rrca    
025a 01380e    ld      bc,$0e38
025d 2020      jr      nz,$027f
025f 2020      jr      nz,$0281
0261 2020      jr      nz,$0283
0263 2056      jr      nz,$02bb
0265 49        ld      c,c
0266 53        ld      d,e
0267 55        ld      d,l
0268 41        ld      b,c
0269 4c        ld      c,h
026a 2043      jr      nz,$02af
026c 4f        ld      c,a
026d 4d        ld      c,l
026e 4d        ld      c,l
026f 41        ld      b,c
0270 4e        ld      c,(hl)
0271 44        ld      b,h
0272 2050      jr      nz,$02c4
0274 52        ld      d,d
0275 4f        ld      c,a
0276 43        ld      b,e
0277 45        ld      b,l
0278 53        ld      d,e
0279 53        ld      d,e
027a 4f        ld      c,a
027b 52        ld      d,d
027c 0d        dec     c
027d 0d        dec     c
027e 2052      jr      nz,$02d2
0280 65        ld      h,l
0281 74        ld      (hl),h
0282 75        ld      (hl),l
0283 72        ld      (hl),d
0284 6e        ld      l,(hl)
0285 2053      jr      nz,$02da
0287 65        ld      h,l
0288 6c        ld      l,h
0289 65        ld      h,l
028a 63        ld      h,e
028b 74        ld      (hl),h
028c 73        ld      (hl),e
028d 2061      jr      nz,$02f0
028f 6e        ld      l,(hl)
0290 64        ld      h,h
0291 2065      jr      nz,$02f8
0293 78        ld      a,b
0294 65        ld      h,l
0295 63        ld      h,e
0296 75        ld      (hl),l
0297 74        ld      (hl),h
0298 65        ld      h,l
0299 73        ld      (hl),e
029a 2e20      ld      l,$20
029c 2020      jr      nz,$02be
029e 2020      jr      nz,$02c0
02a0 43        ld      b,e
02a1 6f        ld      l,a
02a2 6d        ld      l,l
02a3 6d        ld      l,l
02a4 61        ld      h,c
02a5 2020      jr      nz,$02c7
02a7 53        ld      d,e
02a8 65        ld      h,l
02a9 6c        ld      l,h
02aa 65        ld      h,l
02ab 63        ld      h,e
02ac 74        ld      (hl),h
02ad 73        ld      (hl),e
02ae 2e0d      ld      l,$0d
02b0 2053      jr      nz,$0305
02b2 70        ld      (hl),b
02b3 61        ld      h,c
02b4 63        ld      h,e
02b5 65        ld      h,l
02b6 2020      jr      nz,$02d8
02b8 4d        ld      c,l
02b9 6f        ld      l,a
02ba 76        halt    
02bb 65        ld      h,l
02bc 73        ld      (hl),e
02bd 2074      jr      nz,$0333
02bf 6f        ld      l,a
02c0 206e      jr      nz,$0330
02c2 65        ld      h,l
02c3 78        ld      a,b
02c4 74        ld      (hl),h
02c5 2069      jr      nz,$0330
02c7 74        ld      (hl),h
02c8 65        ld      h,l
02c9 6d        ld      l,l
02ca 2e0d      ld      l,$0d
02cc 2041      jr      nz,$030f
02ce 72        ld      (hl),d
02cf 72        ld      (hl),d
02d0 6f        ld      l,a
02d1 77        ld      (hl),a
02d2 2020      jr      nz,$02f4
02d4 4b        ld      c,e
02d5 65        ld      h,l
02d6 79        ld      a,c
02d7 73        ld      (hl),e
02d8 206d      jr      nz,$0347
02da 6f        ld      l,a
02db 76        halt    
02dc 65        ld      h,l
02dd 2075      jr      nz,$0354
02df 70        ld      (hl),b
02e0 2c        inc     l
02e1 64        ld      h,h
02e2 77        ld      (hl),a
02e3 6e        ld      l,(hl)
02e4 2c        inc     l
02e5 6c        ld      l,h
02e6 65        ld      h,l
02e7 66        ld      h,(hl)
02e8 74        ld      (hl),h
02e9 2c        inc     l
02ea 6c        ld      l,h
02eb 69        ld      l,c
02ec 67        ld      h,a
02ed 68        ld      l,b
02ee 74        ld      (hl),h
02ef 2e0d      ld      l,$0d
02f1 2043      jr      nz,$0336
02f3 74        ld      (hl),h
02f4 72        ld      (hl),d
02f5 6c        ld      l,h
02f6 2d        dec     l
02f7 43        ld      b,e
02f8 204d      jr      nz,$0347
02fa 6f        ld      l,a
02fb 76        halt    
02fc 65        ld      h,l
02fd 2062      jr      nz,$0361
02ff 65        ld      h,l
0300 74        ld      (hl),h
0301 77        ld      (hl),a
0302 65        ld      h,l
0303 65        ld      h,l
0304 6e        ld      l,(hl)
0305 2066      jr      nz,$036d
0307 69        ld      l,c
0308 6c        ld      l,h
0309 65        ld      h,l
030a 2077      jr      nz,$0383
030c 69        ld      l,c
030d 6e        ld      l,(hl)
030e 64        ld      h,h
030f 6f        ld      l,a
0310 77        ld      (hl),a
0311 2061      jr      nz,$0374
0313 6e        ld      l,(hl)
0314 64        ld      h,h
0315 2063      jr      nz,$037a
0317 6f        ld      l,a
0318 6d        ld      l,l
0319 6d        ld      l,l
031a 61        ld      h,c
031b 6e        ld      l,(hl)
031c 64        ld      h,h
031d 2077      jr      nz,$0396
031f 69        ld      l,c
0320 6e        ld      l,(hl)
0321 64        ld      h,h
0322 6f        ld      l,a
0323 77        ld      (hl),a
0324 2e0d      ld      l,$0d
0326 2043      jr      nz,$036b
0328 74        ld      (hl),h
0329 72        ld      (hl),d
032a 6c        ld      l,h
032b 2d        dec     l
032c 44        ld      b,h
032d 2044      jr      nz,$0373
032f 69        ld      l,c
0330 73        ld      (hl),e
0331 70        ld      (hl),b
0332 6c        ld      l,h
0333 61        ld      h,c
0334 79        ld      a,c
0335 2068      jr      nz,$039f
0337 65        ld      h,l
0338 6c        ld      l,h
0339 70        ld      (hl),b
033a 2074      jr      nz,$03b0
033c 65        ld      h,l
033d 78        ld      a,b
033e 74        ld      (hl),h
033f 2e0d      ld      l,$0d
0341 2043      jr      nz,$0386
0343 74        ld      (hl),h
0344 72        ld      (hl),d
0345 6c        ld      l,h
0346 2d        dec     l
0347 51        ld      d,c
0348 2044      jr      nz,$038e
034a 65        ld      h,l
034b 73        ld      (hl),e
034c 65        ld      h,l
034d 6c        ld      l,h
034e 65        ld      h,l
034f 63        ld      h,e
0350 74        ld      (hl),h
0351 2061      jr      nz,$03b4
0353 6c        ld      l,h
0354 6c        ld      l,h
0355 2066      jr      nz,$03bd
0357 69        ld      l,c
0358 6c        ld      l,h
0359 65        ld      h,l
035a 73        ld      (hl),e
035b 2e0d      ld      l,$0d
035d 2054      jr      nz,$03b3
035f 68        ld      l,b
0360 65        ld      h,l
0361 2066      jr      nz,$03c9
0363 6f        ld      l,a
0364 6c        ld      l,h
0365 6c        ld      l,h
0366 6f        ld      l,a
0367 77        ld      (hl),a
0368 69        ld      l,c
0369 6e        ld      l,(hl)
036a 67        ld      h,a
036b 2063      jr      nz,$03d0
036d 6f        ld      l,a
036e 6d        ld      l,l
036f 6d        ld      l,l
0370 61        ld      h,c
0371 6e        ld      l,(hl)
0372 64        ld      h,h
0373 73        ld      (hl),e
0374 2061      jr      nz,$03d7
0376 72        ld      (hl),d
0377 65        ld      h,l
0378 2062      jr      nz,$03dc
037a 75        ld      (hl),l
037b 69        ld      l,c
037c 6c        ld      l,h
037d 74        ld      (hl),h
037e 2069      jr      nz,$03e9
0380 6e        ld      l,(hl)
0381 2c        inc     l
0382 0d        dec     c
0383 2020      jr      nz,$03a5
0385 6f        ld      l,a
0386 74        ld      (hl),h
0387 68        ld      l,b
0388 65        ld      h,l
0389 72        ld      (hl),d
038a 2039      jr      nz,$03c5
038c 2063      jr      nz,$03f1
038e 6f        ld      l,a
038f 6d        ld      l,l
0390 6d        ld      l,l
0391 61        ld      h,c
0392 6e        ld      l,(hl)
0393 64        ld      h,h
0394 73        ld      (hl),e
0395 2063      jr      nz,$03fa
0397 61        ld      h,c
0398 6e        ld      l,(hl)
0399 2062      jr      nz,$03fd
039b 65        ld      h,l
039c 2061      jr      nz,$03ff
039e 64        ld      h,h
039f 64        ld      h,h
03a0 65        ld      h,l
03a1 64        ld      h,h
03a2 2069      jr      nz,$040d
03a4 6e        ld      l,(hl)
03a5 2074      jr      nz,$041b
03a7 68        ld      l,b
03a8 65        ld      h,l
03a9 2056      jr      nz,$0401
03ab 43        ld      b,e
03ac 43        ld      b,e
03ad 50        ld      d,b
03ae 2e43      ld      l,$43
03b0 46        ld      b,(hl)
03b1 47        ld      b,a
03b2 2066      jr      nz,$041a
03b4 69        ld      l,c
03b5 6c        ld      l,h
03b6 65        ld      h,l
03b7 0d        dec     c
03b8 2020      jr      nz,$03da
03ba 2020      jr      nz,$03dc
03bc 2020      jr      nz,$03de
03be 2020      jr      nz,$03e0
03c0 2020      jr      nz,$03e2
03c2 48        ld      c,b
03c3 65        ld      h,l
03c4 6c        ld      l,h
03c5 70        ld      (hl),b
03c6 2c        inc     l
03c7 44        ld      b,h
03c8 69        ld      l,c
03c9 72        ld      (hl),d
03ca 2c        inc     l
03cb 44        ld      b,h
03cc 72        ld      (hl),d
03cd 69        ld      l,c
03ce 76        halt    
03cf 65        ld      h,l
03d0 2c        inc     l
03d1 55        ld      d,l
03d2 73        ld      (hl),e
03d3 65        ld      h,l
03d4 72        ld      (hl),d
03d5 2c        inc     l
03d6 52        ld      d,d
03d7 75        ld      (hl),l
03d8 6e        ld      l,(hl)
03d9 2c        inc     l
03da 53        ld      d,e
03db 65        ld      h,l
03dc 61        ld      h,c
03dd 72        ld      (hl),d
03de 63        ld      h,e
03df 68        ld      l,b
03e0 0d        dec     c
03e1 2020      jr      nz,$0403
03e3 2020      jr      nz,$0405
03e5 2020      jr      nz,$0407
03e7 2020      jr      nz,$0409
03e9 2020      jr      nz,$040b
03eb 52        ld      d,d
03ec 65        ld      h,l
03ed 6e        ld      l,(hl)
03ee 61        ld      h,c
03ef 6d        ld      l,l
03f0 65        ld      h,l
03f1 2c        inc     l
03f2 45        ld      b,l
03f3 72        ld      (hl),d
03f4 61        ld      h,c
03f5 73        ld      (hl),e
03f6 65        ld      h,l
03f7 2c        inc     l
03f8 54        ld      d,h
03f9 79        ld      a,c
03fa 70        ld      (hl),b
03fb 65        ld      h,l
03fc 2c        inc     l
03fd 50        ld      d,b
03fe 72        ld      (hl),d
03ff 69        ld      l,c
0400 6e        ld      l,(hl)
0401 74        ld      (hl),h
0402 2c        inc     l
0403 4d        ld      c,l
0404 61        ld      h,c
0405 6b        ld      l,e
0406 65        ld      h,l
0407 2c        inc     l
0408 51        ld      d,c
0409 75        ld      (hl),l
040a 69        ld      l,c
040b 74        ld      (hl),h
040c 0d        dec     c
040d 0d        dec     c
040e 2020      jr      nz,$0430
0410 2020      jr      nz,$0432
0412 2020      jr      nz,$0434
0414 3c        inc     a
0415 3c        inc     a
0416 2050      jr      nz,$0468
0418 72        ld      (hl),d
0419 65        ld      h,l
041a 73        ld      (hl),e
041b 73        ld      (hl),e
041c 2061      jr      nz,$047f
041e 6e        ld      l,(hl)
041f 79        ld      a,c
0420 206b      jr      nz,$048d
0422 65        ld      h,l
0423 79        ld      a,c
0424 2074      jr      nz,$049a
0426 6f        ld      l,a
0427 2063      jr      nz,$048c
0429 6f        ld      l,a
042a 6e        ld      l,(hl)
042b 74        ld      (hl),h
042c 69        ld      l,c
042d 6e        ld      l,(hl)
042e 75        ld      (hl),l
042f 65        ld      h,l
0430 2e3e      ld      l,$3e
0432 3e00      ld      a,$00
0434 10b6      djnz    $03ec
0436 04        inc     b
0437 14        inc     d
0438 05        dec     b
0439 2808      jr      z,$0443
043b 2044      jr      nz,$0481
043d 49        ld      c,c
043e 52        ld      d,d
043f 45        ld      b,l
0440 43        ld      b,e
0441 54        ld      d,h
0442 4f        ld      c,a
0443 52        ld      d,d
0444 59        ld      e,c
0445 2043      jr      nz,$048a
0447 4f        ld      c,a
0448 4d        ld      c,l
0449 4d        ld      c,l
044a 41        ld      b,c
044b 4e        ld      c,(hl)
044c 44        ld      b,h
044d 0d        dec     c
044e 0d        dec     c
044f 2020      jr      nz,$0471
0451 2020      jr      nz,$0473
0453 54        ld      d,h
0454 68        ld      l,b
0455 69        ld      l,c
0456 73        ld      (hl),e
0457 2063      jr      nz,$04bc
0459 6f        ld      l,a
045a 6d        ld      l,l
045b 6d        ld      l,l
045c 61        ld      h,c
045d 6e        ld      l,(hl)
045e 64        ld      h,h
045f 2061      jr      nz,$04c2
0461 6c        ld      l,h
0462 6c        ld      l,h
0463 6f        ld      l,a
0464 77        ld      (hl),a
0465 73        ld      (hl),e
0466 2079      jr      nz,$04e1
0468 6f        ld      l,a
0469 75        ld      (hl),l
046a 2074      jr      nz,$04e0
046c 6f        ld      l,a
046d 0d        dec     c
046e 2020      jr      nz,$0490
0470 2020      jr      nz,$0492
0472 2020      jr      nz,$0494
0474 63        ld      h,e
0475 68        ld      l,b
0476 61        ld      h,c
0477 6e        ld      l,(hl)
0478 67        ld      h,a
0479 65        ld      h,l
047a 2074      jr      nz,$04f0
047c 68        ld      l,b
047d 65        ld      h,l
047e 2064      jr      nz,$04e4
0480 72        ld      (hl),d
0481 69        ld      l,c
0482 76        halt    
0483 65        ld      h,l
0484 2061      jr      nz,$04e7
0486 6e        ld      l,(hl)
0487 64        ld      h,h
0488 2075      jr      nz,$04ff
048a 73        ld      (hl),e
048b 65        ld      h,l
048c 72        ld      (hl),d
048d 2e0d      ld      l,$0d
048f 0d        dec     c
0490 2020      jr      nz,$04b2
0492 2020      jr      nz,$04b4
0494 2020      jr      nz,$04b6
0496 3c        inc     a
0497 3c        inc     a
0498 2050      jr      nz,$04ea
049a 72        ld      (hl),d
049b 65        ld      h,l
049c 73        ld      (hl),e
049d 73        ld      (hl),e
049e 2061      jr      nz,$0501
04a0 6e        ld      l,(hl)
04a1 79        ld      a,c
04a2 206b      jr      nz,$050f
04a4 65        ld      h,l
04a5 79        ld      a,c
04a6 2074      jr      nz,$051c
04a8 6f        ld      l,a
04a9 2063      jr      nz,$050e
04ab 6f        ld      l,a
04ac 6e        ld      l,(hl)
04ad 74        ld      (hl),h
04ae 69        ld      l,c
04af 6e        ld      l,(hl)
04b0 75        ld      (hl),l
04b1 65        ld      h,l
04b2 2e3e      ld      l,$3e
04b4 3e00      ld      a,$00
04b6 201b      jr      nz,$04d3
04b8 05        dec     b
04b9 0a        ld      a,(bc)
04ba 05        dec     b
04bb 2d        dec     l
04bc 0620      ld      b,$20
04be 52        ld      d,d
04bf 55        ld      d,l
04c0 4e        ld      c,(hl)
04c1 2043      jr      nz,$0506
04c3 4f        ld      c,a
04c4 4d        ld      c,l
04c5 4d        ld      c,l
04c6 41        ld      b,c
04c7 4e        ld      c,(hl)
04c8 44        ld      b,h
04c9 0d        dec     c
04ca 0d        dec     c
04cb 2020      jr      nz,$04ed
04cd 54        ld      d,h
04ce 68        ld      l,b
04cf 69        ld      l,c
04d0 73        ld      (hl),e
04d1 2063      jr      nz,$0536
04d3 6f        ld      l,a
04d4 6d        ld      l,l
04d5 6d        ld      l,l
04d6 61        ld      h,c
04d7 6e        ld      l,(hl)
04d8 64        ld      h,h
04d9 2061      jr      nz,$053c
04db 6c        ld      l,h
04dc 6c        ld      l,h
04dd 6f        ld      l,a
04de 77        ld      (hl),a
04df 73        ld      (hl),e
04e0 2079      jr      nz,$055b
04e2 6f        ld      l,a
04e3 75        ld      (hl),l
04e4 2074      jr      nz,$055a
04e6 6f        ld      l,a
04e7 2072      jr      nz,$055b
04e9 75        ld      (hl),l
04ea 6e        ld      l,(hl)
04eb 2061      jr      nz,$054e
04ed 2066      jr      nz,$0555
04ef 69        ld      l,c
04f0 6c        ld      l,h
04f1 65        ld      h,l
04f2 2e0d      ld      l,$0d
04f4 0d        dec     c
04f5 2020      jr      nz,$0517
04f7 2020      jr      nz,$0519
04f9 2020      jr      nz,$051b
04fb 3c        inc     a
04fc 3c        inc     a
04fd 2050      jr      nz,$054f
04ff 72        ld      (hl),d
0500 65        ld      h,l
0501 73        ld      (hl),e
0502 73        ld      (hl),e
0503 2061      jr      nz,$0566
0505 6e        ld      l,(hl)
0506 79        ld      a,c
0507 206b      jr      nz,$0574
0509 65        ld      h,l
050a 79        ld      a,c
050b 2074      jr      nz,$0581
050d 6f        ld      l,a
050e 2063      jr      nz,$0573
0510 6f        ld      l,a
0511 6e        ld      l,(hl)
0512 74        ld      (hl),h
0513 69        ld      l,c
0514 6e        ld      l,(hl)
0515 75        ld      (hl),l
0516 65        ld      h,l
0517 2e3e      ld      l,$3e
0519 3e00      ld      a,$00
051b 301e      jr      nc,$053b
051d 05        dec     b
051e 40        ld      b,b
051f e8        ret     pe

0520 05        dec     b
0521 0a        ld      a,(bc)
0522 02        ld      (bc),a
0523 2d        dec     l
0524 09        add     hl,bc
0525 2053      jr      nz,$057a
0527 45        ld      b,l
0528 41        ld      b,c
0529 52        ld      d,d
052a 43        ld      b,e
052b 48        ld      c,b
052c 2043      jr      nz,$0571
052e 4f        ld      c,a
052f 4d        ld      c,l
0530 4d        ld      c,l
0531 41        ld      b,c
0532 4e        ld      c,(hl)
0533 44        ld      b,h
0534 0d        dec     c
0535 0d        dec     c
0536 2020      jr      nz,$0558
0538 2020      jr      nz,$055a
053a 54        ld      d,h
053b 68        ld      l,b
053c 69        ld      l,c
053d 73        ld      (hl),e
053e 2063      jr      nz,$05a3
0540 6f        ld      l,a
0541 6d        ld      l,l
0542 6d        ld      l,l
0543 61        ld      h,c
0544 6e        ld      l,(hl)
0545 64        ld      h,h
0546 2061      jr      nz,$05a9
0548 6c        ld      l,h
0549 6c        ld      l,h
054a 6f        ld      l,a
054b 77        ld      (hl),a
054c 73        ld      (hl),e
054d 2079      jr      nz,$05c8
054f 6f        ld      l,a
0550 75        ld      (hl),l
0551 2074      jr      nz,$05c7
0553 6f        ld      l,a
0554 0d        dec     c
0555 2020      jr      nz,$0577
0557 2020      jr      nz,$0579
0559 2063      jr      nz,$05be
055b 68        ld      l,b
055c 61        ld      h,c
055d 6e        ld      l,(hl)
055e 67        ld      h,a
055f 65        ld      h,l
0560 2074      jr      nz,$05d6
0562 68        ld      l,b
0563 65        ld      h,l
0564 2064      jr      nz,$05ca
0566 69        ld      l,c
0567 72        ld      (hl),d
0568 65        ld      h,l
0569 63        ld      h,e
056a 74        ld      (hl),h
056b 6f        ld      l,a
056c 72        ld      (hl),d
056d 79        ld      a,c
056e 2073      jr      nz,$05e3
0570 65        ld      h,l
0571 61        ld      h,c
0572 72        ld      (hl),d
0573 63        ld      h,e
0574 68        ld      l,b
0575 2073      jr      nz,$05ea
0577 74        ld      (hl),h
0578 72        ld      (hl),d
0579 69        ld      l,c
057a 6e        ld      l,(hl)
057b 67        ld      h,a
057c 0d        dec     c
057d 2020      jr      nz,$059f
057f 2020      jr      nz,$05a1
0581 54        ld      d,h
0582 68        ld      l,b
0583 65        ld      h,l
0584 72        ld      (hl),d
0585 65        ld      h,l
0586 2062      jr      nz,$05ea
0588 79        ld      a,c
0589 2061      jr      nz,$05ec
058b 6c        ld      l,h
058c 6c        ld      l,h
058d 6f        ld      l,a
058e 77        ld      (hl),a
058f 69        ld      l,c
0590 6e        ld      l,(hl)
0591 67        ld      h,a
0592 2079      jr      nz,$060d
0594 6f        ld      l,a
0595 75        ld      (hl),l
0596 2074      jr      nz,$060c
0598 6f        ld      l,a
0599 2064      jr      nz,$05ff
059b 69        ld      l,c
059c 73        ld      (hl),e
059d 70        ld      (hl),b
059e 6c        ld      l,h
059f 61        ld      h,c
05a0 79        ld      a,c
05a1 0d        dec     c
05a2 2020      jr      nz,$05c4
05a4 2020      jr      nz,$05c6
05a6 2061      jr      nz,$0609
05a8 2073      jr      nz,$061d
05aa 75        ld      (hl),l
05ab 62        ld      h,d
05ac 73        ld      (hl),e
05ad 65        ld      h,l
05ae 74        ld      (hl),h
05af 206f      jr      nz,$0620
05b1 66        ld      h,(hl)
05b2 2074      jr      nz,$0628
05b4 68        ld      l,b
05b5 65        ld      h,l
05b6 2064      jr      nz,$061c
05b8 69        ld      l,c
05b9 72        ld      (hl),d
05ba 65        ld      h,l
05bb 63        ld      h,e
05bc 74        ld      (hl),h
05bd 6f        ld      l,a
05be 72        ld      (hl),d
05bf 79        ld      a,c
05c0 0d        dec     c
05c1 0d        dec     c
05c2 2020      jr      nz,$05e4
05c4 2020      jr      nz,$05e6
05c6 2020      jr      nz,$05e8
05c8 3c        inc     a
05c9 3c        inc     a
05ca 2050      jr      nz,$061c
05cc 72        ld      (hl),d
05cd 65        ld      h,l
05ce 73        ld      (hl),e
05cf 73        ld      (hl),e
05d0 2061      jr      nz,$0633
05d2 6e        ld      l,(hl)
05d3 79        ld      a,c
05d4 206b      jr      nz,$0641
05d6 65        ld      h,l
05d7 79        ld      a,c
05d8 2074      jr      nz,$064e
05da 6f        ld      l,a
05db 2063      jr      nz,$0640
05dd 6f        ld      l,a
05de 6e        ld      l,(hl)
05df 74        ld      (hl),h
05e0 69        ld      l,c
05e1 6e        ld      l,(hl)
05e2 75        ld      (hl),l
05e3 65        ld      h,l
05e4 2e3e      ld      l,$3e
05e6 3e00      ld      a,$00
05e8 50        ld      d,b
05e9 61        ld      h,c
05ea 0614      ld      b,$14
05ec 05        dec     b
05ed 23        inc     hl
05ee 07        rlca    
05ef 2052      jr      nz,$0643
05f1 45        ld      b,l
05f2 4e        ld      c,(hl)
05f3 41        ld      b,c
05f4 4d        ld      c,l
05f5 45        ld      b,l
05f6 2043      jr      nz,$063b
05f8 4f        ld      c,a
05f9 4d        ld      c,l
05fa 4d        ld      c,l
05fb 41        ld      b,c
05fc 4e        ld      c,(hl)
05fd 44        ld      b,h
05fe 0d        dec     c
05ff 0d        dec     c
0600 2020      jr      nz,$0622
0602 2020      jr      nz,$0624
0604 54        ld      d,h
0605 68        ld      l,b
0606 69        ld      l,c
0607 73        ld      (hl),e
0608 2063      jr      nz,$066d
060a 6f        ld      l,a
060b 6d        ld      l,l
060c 6d        ld      l,l
060d 61        ld      h,c
060e 6e        ld      l,(hl)
060f 64        ld      h,h
0610 2061      jr      nz,$0673
0612 6c        ld      l,h
0613 6c        ld      l,h
0614 6f        ld      l,a
0615 77        ld      (hl),a
0616 73        ld      (hl),e
0617 2079      jr      nz,$0692
0619 6f        ld      l,a
061a 75        ld      (hl),l
061b 2074      jr      nz,$0691
061d 6f        ld      l,a
061e 0d        dec     c
061f 2020      jr      nz,$0641
0621 2020      jr      nz,$0643
0623 2020      jr      nz,$0645
0625 72        ld      (hl),d
0626 65        ld      h,l
0627 6e        ld      l,(hl)
0628 61        ld      h,c
0629 6d        ld      l,l
062a 65        ld      h,l
062b 206f      jr      nz,$069c
062d 6e        ld      l,(hl)
062e 65        ld      h,l
062f 206f      jr      nz,$06a0
0631 72        ld      (hl),d
0632 206d      jr      nz,$06a1
0634 6f        ld      l,a
0635 72        ld      (hl),d
0636 65        ld      h,l
0637 2066      jr      nz,$069f
0639 69        ld      l,c
063a 6c        ld      l,h
063b 65        ld      h,l
063c 73        ld      (hl),e
063d 2e0d      ld      l,$0d
063f 0d        dec     c
0640 203c      jr      nz,$067e
0642 3c        inc     a
0643 2050      jr      nz,$0695
0645 72        ld      (hl),d
0646 65        ld      h,l
0647 73        ld      (hl),e
0648 73        ld      (hl),e
0649 2061      jr      nz,$06ac
064b 6e        ld      l,(hl)
064c 79        ld      a,c
064d 206b      jr      nz,$06ba
064f 65        ld      h,l
0650 79        ld      a,c
0651 2074      jr      nz,$06c7
0653 6f        ld      l,a
0654 2063      jr      nz,$06b9
0656 6f        ld      l,a
0657 6e        ld      l,(hl)
0658 74        ld      (hl),h
0659 69        ld      l,c
065a 6e        ld      l,(hl)
065b 75        ld      (hl),l
065c 65        ld      h,l
065d 2e3e      ld      l,$3e
065f 3e00      ld      a,$00
0661 60        ld      h,b
0662 d8        ret     c

0663 0614      ld      b,$14
0665 05        dec     b
0666 23        inc     hl
0667 07        rlca    
0668 2045      jr      nz,$06af
066a 52        ld      d,d
066b 41        ld      b,c
066c 53        ld      d,e
066d 45        ld      b,l
066e 2043      jr      nz,$06b3
0670 4f        ld      c,a
0671 4d        ld      c,l
0672 4d        ld      c,l
0673 41        ld      b,c
0674 4e        ld      c,(hl)
0675 44        ld      b,h
0676 0d        dec     c
0677 0d        dec     c
0678 2020      jr      nz,$069a
067a 2020      jr      nz,$069c
067c 54        ld      d,h
067d 68        ld      l,b
067e 69        ld      l,c
067f 73        ld      (hl),e
0680 2063      jr      nz,$06e5
0682 6f        ld      l,a
0683 6d        ld      l,l
0684 6d        ld      l,l
0685 61        ld      h,c
0686 6e        ld      l,(hl)
0687 64        ld      h,h
0688 2061      jr      nz,$06eb
068a 6c        ld      l,h
068b 6c        ld      l,h
068c 6f        ld      l,a
068d 77        ld      (hl),a
068e 73        ld      (hl),e
068f 2079      jr      nz,$070a
0691 6f        ld      l,a
0692 75        ld      (hl),l
0693 2074      jr      nz,$0709
0695 6f        ld      l,a
0696 0d        dec     c
0697 2020      jr      nz,$06b9
0699 2020      jr      nz,$06bb
069b 2020      jr      nz,$06bd
069d 65        ld      h,l
069e 72        ld      (hl),d
069f 61        ld      h,c
06a0 73        ld      (hl),e
06a1 65        ld      h,l
06a2 206f      jr      nz,$0713
06a4 6e        ld      l,(hl)
06a5 65        ld      h,l
06a6 206f      jr      nz,$0717
06a8 72        ld      (hl),d
06a9 206d      jr      nz,$0718
06ab 6f        ld      l,a
06ac 72        ld      (hl),d
06ad 65        ld      h,l
06ae 2066      jr      nz,$0716
06b0 69        ld      l,c
06b1 6c        ld      l,h
06b2 65        ld      h,l
06b3 73        ld      (hl),e
06b4 2e0d      ld      l,$0d
06b6 0d        dec     c
06b7 203c      jr      nz,$06f5
06b9 3c        inc     a
06ba 2050      jr      nz,$070c
06bc 72        ld      (hl),d
06bd 65        ld      h,l
06be 73        ld      (hl),e
06bf 73        ld      (hl),e
06c0 2061      jr      nz,$0723
06c2 6e        ld      l,(hl)
06c3 79        ld      a,c
06c4 206b      jr      nz,$0731
06c6 65        ld      h,l
06c7 79        ld      a,c
06c8 2074      jr      nz,$073e
06ca 6f        ld      l,a
06cb 2063      jr      nz,$0730
06cd 6f        ld      l,a
06ce 6e        ld      l,(hl)
06cf 74        ld      (hl),h
06d0 69        ld      l,c
06d1 6e        ld      l,(hl)
06d2 75        ld      (hl),l
06d3 65        ld      h,l
06d4 2e3e      ld      l,$3e
06d6 3e00      ld      a,$00
06d8 70        ld      (hl),b
06d9 4d        ld      c,l
06da 07        rlca    
06db 14        inc     d
06dc 05        dec     b
06dd 23        inc     hl
06de 07        rlca    
06df 2054      jr      nz,$0735
06e1 59        ld      e,c
06e2 50        ld      d,b
06e3 45        ld      b,l
06e4 2043      jr      nz,$0729
06e6 4f        ld      c,a
06e7 4d        ld      c,l
06e8 4d        ld      c,l
06e9 41        ld      b,c
06ea 4e        ld      c,(hl)
06eb 44        ld      b,h
06ec 0d        dec     c
06ed 0d        dec     c
06ee 2020      jr      nz,$0710
06f0 2020      jr      nz,$0712
06f2 54        ld      d,h
06f3 68        ld      l,b
06f4 69        ld      l,c
06f5 73        ld      (hl),e
06f6 2063      jr      nz,$075b
06f8 6f        ld      l,a
06f9 6d        ld      l,l
06fa 6d        ld      l,l
06fb 61        ld      h,c
06fc 6e        ld      l,(hl)
06fd 64        ld      h,h
06fe 2061      jr      nz,$0761
0700 6c        ld      l,h
0701 6c        ld      l,h
0702 6f        ld      l,a
0703 77        ld      (hl),a
0704 73        ld      (hl),e
0705 2079      jr      nz,$0780
0707 6f        ld      l,a
0708 75        ld      (hl),l
0709 2074      jr      nz,$077f
070b 6f        ld      l,a
070c 0d        dec     c
070d 2020      jr      nz,$072f
070f 2020      jr      nz,$0731
0711 2020      jr      nz,$0733
0713 74        ld      (hl),h
0714 79        ld      a,c
0715 70        ld      (hl),b
0716 65        ld      h,l
0717 206f      jr      nz,$0788
0719 6e        ld      l,(hl)
071a 65        ld      h,l
071b 206f      jr      nz,$078c
071d 72        ld      (hl),d
071e 206d      jr      nz,$078d
0720 6f        ld      l,a
0721 72        ld      (hl),d
0722 65        ld      h,l
0723 2066      jr      nz,$078b
0725 69        ld      l,c
0726 6c        ld      l,h
0727 65        ld      h,l
0728 73        ld      (hl),e
0729 2e0d      ld      l,$0d
072b 0d        dec     c
072c 203c      jr      nz,$076a
072e 3c        inc     a
072f 2050      jr      nz,$0781
0731 72        ld      (hl),d
0732 65        ld      h,l
0733 73        ld      (hl),e
0734 73        ld      (hl),e
0735 2061      jr      nz,$0798
0737 6e        ld      l,(hl)
0738 79        ld      a,c
0739 206b      jr      nz,$07a6
073b 65        ld      h,l
073c 79        ld      a,c
073d 2074      jr      nz,$07b3
073f 6f        ld      l,a
0740 2063      jr      nz,$07a5
0742 6f        ld      l,a
0743 6e        ld      l,(hl)
0744 74        ld      (hl),h
0745 69        ld      l,c
0746 6e        ld      l,(hl)
0747 75        ld      (hl),l
0748 65        ld      h,l
0749 2e3e      ld      l,$3e
074b 3e00      ld      a,$00
074d 80        add     a,b
074e c40714    call    nz,$1407
0751 05        dec     b
0752 23        inc     hl
0753 07        rlca    
0754 2050      jr      nz,$07a6
0756 52        ld      d,d
0757 49        ld      c,c
0758 4e        ld      c,(hl)
0759 54        ld      d,h
075a 2043      jr      nz,$079f
075c 4f        ld      c,a
075d 4d        ld      c,l
075e 4d        ld      c,l
075f 41        ld      b,c
0760 4e        ld      c,(hl)
0761 44        ld      b,h
0762 0d        dec     c
0763 0d        dec     c
0764 2020      jr      nz,$0786
0766 2020      jr      nz,$0788
0768 54        ld      d,h
0769 68        ld      l,b
076a 69        ld      l,c
076b 73        ld      (hl),e
076c 2063      jr      nz,$07d1
076e 6f        ld      l,a
076f 6d        ld      l,l
0770 6d        ld      l,l
0771 61        ld      h,c
0772 6e        ld      l,(hl)
0773 64        ld      h,h
0774 2061      jr      nz,$07d7
0776 6c        ld      l,h
0777 6c        ld      l,h
0778 6f        ld      l,a
0779 77        ld      (hl),a
077a 73        ld      (hl),e
077b 2079      jr      nz,$07f6
077d 6f        ld      l,a
077e 75        ld      (hl),l
077f 2074      jr      nz,$07f5
0781 6f        ld      l,a
0782 0d        dec     c
0783 2020      jr      nz,$07a5
0785 2020      jr      nz,$07a7
0787 2020      jr      nz,$07a9
0789 70        ld      (hl),b
078a 72        ld      (hl),d
078b 69        ld      l,c
078c 6e        ld      l,(hl)
078d 74        ld      (hl),h
078e 206f      jr      nz,$07ff
0790 6e        ld      l,(hl)
0791 65        ld      h,l
0792 206f      jr      nz,$0803
0794 72        ld      (hl),d
0795 206d      jr      nz,$0804
0797 6f        ld      l,a
0798 72        ld      (hl),d
0799 65        ld      h,l
079a 2066      jr      nz,$0802
079c 69        ld      l,c
079d 6c        ld      l,h
079e 65        ld      h,l
079f 73        ld      (hl),e
07a0 2e0d      ld      l,$0d
07a2 0d        dec     c
07a3 203c      jr      nz,$07e1
07a5 3c        inc     a
07a6 2050      jr      nz,$07f8
07a8 72        ld      (hl),d
07a9 65        ld      h,l
07aa 73        ld      (hl),e
07ab 73        ld      (hl),e
07ac 2061      jr      nz,$080f
07ae 6e        ld      l,(hl)
07af 79        ld      a,c
07b0 206b      jr      nz,$081d
07b2 65        ld      h,l
07b3 79        ld      a,c
07b4 2074      jr      nz,$082a
07b6 6f        ld      l,a
07b7 2063      jr      nz,$081c
07b9 6f        ld      l,a
07ba 6e        ld      l,(hl)
07bb 74        ld      (hl),h
07bc 69        ld      l,c
07bd 6e        ld      l,(hl)
07be 75        ld      (hl),l
07bf 65        ld      h,l
07c0 2e3e      ld      l,$3e
07c2 3e00      ld      a,$00
07c4 90        sub     b
07c5 35        dec     (hl)
07c6 08        ex      af,af'
07c7 14        inc     d
07c8 05        dec     b
07c9 24        inc     h
07ca 07        rlca    
07cb 204d      jr      nz,$081a
07cd 41        ld      b,c
07ce 4b        ld      c,e
07cf 45        ld      b,l
07d0 2043      jr      nz,$0815
07d2 4f        ld      c,a
07d3 4d        ld      c,l
07d4 4d        ld      c,l
07d5 41        ld      b,c
07d6 4e        ld      c,(hl)
07d7 44        ld      b,h
07d8 0d        dec     c
07d9 0d        dec     c
07da 2020      jr      nz,$07fc
07dc 2020      jr      nz,$07fe
07de 54        ld      d,h
07df 68        ld      l,b
07e0 69        ld      l,c
07e1 73        ld      (hl),e
07e2 2063      jr      nz,$0847
07e4 6f        ld      l,a
07e5 6d        ld      l,l
07e6 6d        ld      l,l
07e7 61        ld      h,c
07e8 6e        ld      l,(hl)
07e9 64        ld      h,h
07ea 2061      jr      nz,$084d
07ec 6c        ld      l,h
07ed 6c        ld      l,h
07ee 6f        ld      l,a
07ef 77        ld      (hl),a
07f0 73        ld      (hl),e
07f1 2079      jr      nz,$086c
07f3 6f        ld      l,a
07f4 75        ld      (hl),l
07f5 2074      jr      nz,$086b
07f7 6f        ld      l,a
07f8 0d        dec     c
07f9 2020      jr      nz,$081b
07fb 2020      jr      nz,$081d
07fd 2020      jr      nz,$081f
07ff 6d        ld      l,l
0800 61        ld      h,c
0801 6b        ld      l,e
0802 65        ld      h,l
0803 2061      jr      nz,$0866
0805 6e        ld      l,(hl)
0806 2065      jr      nz,$086d
0808 6d        ld      l,l
0809 70        ld      (hl),b
080a 74        ld      (hl),h
080b 79        ld      a,c
080c 2066      jr      nz,$0874
080e 69        ld      l,c
080f 6c        ld      l,h
0810 65        ld      h,l
0811 2e0d      ld      l,$0d
0813 0d        dec     c
0814 203c      jr      nz,$0852
0816 3c        inc     a
0817 2050      jr      nz,$0869
0819 72        ld      (hl),d
081a 65        ld      h,l
081b 73        ld      (hl),e
081c 73        ld      (hl),e
081d 2061      jr      nz,$0880
081f 6e        ld      l,(hl)
0820 79        ld      a,c
0821 206b      jr      nz,$088e
0823 65        ld      h,l
0824 79        ld      a,c
0825 2074      jr      nz,$089b
0827 6f        ld      l,a
0828 2063      jr      nz,$088d
082a 6f        ld      l,a
082b 6e        ld      l,(hl)
082c 74        ld      (hl),h
082d 69        ld      l,c
082e 6e        ld      l,(hl)
082f 75        ld      (hl),l
0830 65        ld      h,l
0831 2e3e      ld      l,$3e
0833 3e00      ld      a,$00
0835 a0        and     b
0836 8e        adc     a,(hl)
0837 08        ex      af,af'
0838 14        inc     d
0839 05        dec     b
083a 2606      ld      h,$06
083c 2051      jr      nz,$088f
083e 55        ld      d,l
083f 49        ld      c,c
0840 54        ld      d,h
0841 2043      jr      nz,$0886
0843 4f        ld      c,a
0844 4d        ld      c,l
0845 4d        ld      c,l
0846 41        ld      b,c
0847 4e        ld      c,(hl)
0848 44        ld      b,h
0849 0d        dec     c
084a 0d        dec     c
084b 2020      jr      nz,$086d
084d 2020      jr      nz,$086f
084f 54        ld      d,h
0850 68        ld      l,b
0851 69        ld      l,c
0852 73        ld      (hl),e
0853 2063      jr      nz,$08b8
0855 6f        ld      l,a
0856 6d        ld      l,l
0857 6d        ld      l,l
0858 61        ld      h,c
0859 6e        ld      l,(hl)
085a 64        ld      h,h
085b 2065      jr      nz,$08c2
085d 78        ld      a,b
085e 69        ld      l,c
085f 74        ld      (hl),h
0860 73        ld      (hl),e
0861 2074      jr      nz,$08d7
0863 68        ld      l,b
0864 65        ld      h,l
0865 2076      jr      nz,$08dd
0867 63        ld      h,e
0868 63        ld      h,e
0869 70        ld      (hl),b
086a 2e0d      ld      l,$0d
086c 0d        dec     c
086d 203c      jr      nz,$08ab
086f 3c        inc     a
0870 2050      jr      nz,$08c2
0872 72        ld      (hl),d
0873 65        ld      h,l
0874 73        ld      (hl),e
0875 73        ld      (hl),e
0876 2061      jr      nz,$08d9
0878 6e        ld      l,(hl)
0879 79        ld      a,c
087a 206b      jr      nz,$08e7
087c 65        ld      h,l
087d 79        ld      a,c
087e 2074      jr      nz,$08f4
0880 6f        ld      l,a
0881 2063      jr      nz,$08e6
0883 6f        ld      l,a
0884 6e        ld      l,(hl)
0885 74        ld      (hl),h
0886 69        ld      l,c
0887 6e        ld      l,(hl)
0888 75        ld      (hl),l
0889 65        ld      h,l
088a 2e3e      ld      l,$3e
088c 3e00      ld      a,$00
088e b0        or      b
088f f7        rst     $30
0890 08        ex      af,af'
0891 14        inc     d
0892 05        dec     b
0893 2607      ld      h,$07
0895 2044      jr      nz,$08db
0897 52        ld      d,d
0898 49        ld      c,c
0899 56        ld      d,(hl)
089a 45        ld      b,l
089b 0d        dec     c
089c 0d        dec     c
089d 2020      jr      nz,$08bf
089f 2020      jr      nz,$08c1
08a1 53        ld      d,e
08a2 65        ld      h,l
08a3 6c        ld      l,h
08a4 65        ld      h,l
08a5 63        ld      h,e
08a6 74        ld      (hl),h
08a7 2061      jr      nz,$090a
08a9 2064      jr      nz,$090f
08ab 72        ld      (hl),d
08ac 69        ld      l,c
08ad 76        halt    
08ae 65        ld      h,l
08af 0d        dec     c
08b0 2020      jr      nz,$08d2
08b2 2020      jr      nz,$08d4
08b4 2020      jr      nz,$08d6
08b6 66        ld      h,(hl)
08b7 72        ld      (hl),d
08b8 6f        ld      l,a
08b9 6d        ld      l,l
08ba 2041      jr      nz,$08fd
08bc 2c        inc     l
08bd 42        ld      b,d
08be 2c        inc     l
08bf 43        ld      b,e
08c0 2c        inc     l
08c1 44        ld      b,h
08c2 2c        inc     l
08c3 45        ld      b,l
08c4 284d      jr      z,$0913
08c6 65        ld      h,l
08c7 6d        ld      l,l
08c8 6f        ld      l,a
08c9 72        ld      (hl),d
08ca 79        ld      a,c
08cb 2064      jr      nz,$0931
08cd 69        ld      l,c
08ce 73        ld      (hl),e
08cf 6b        ld      l,e
08d0 29        add     hl,hl
08d1 0d        dec     c
08d2 0d        dec     c
08d3 2020      jr      nz,$08f5
08d5 2020      jr      nz,$08f7
08d7 3c        inc     a
08d8 3c        inc     a
08d9 2050      jr      nz,$092b
08db 72        ld      (hl),d
08dc 65        ld      h,l
08dd 73        ld      (hl),e
08de 73        ld      (hl),e
08df 2061      jr      nz,$0942
08e1 6e        ld      l,(hl)
08e2 79        ld      a,c
08e3 206b      jr      nz,$0950
08e5 65        ld      h,l
08e6 79        ld      a,c
08e7 2074      jr      nz,$095d
08e9 6f        ld      l,a
08ea 2063      jr      nz,$094f
08ec 6f        ld      l,a
08ed 6e        ld      l,(hl)
08ee 74        ld      (hl),h
08ef 69        ld      l,c
08f0 6e        ld      l,(hl)
08f1 75        ld      (hl),l
08f2 65        ld      h,l
08f3 2e3e      ld      l,$3e
08f5 3e00      ld      a,$00
08f7 c0        ret     nz

08f8 00        nop     
08f9 00        nop     
08fa 14        inc     d
08fb 05        dec     b
08fc 2607      ld      h,$07
08fe 2020      jr      nz,$0920
0900 2055      jr      nz,$0957
0902 53        ld      d,e
0903 45        ld      b,l
0904 52        ld      d,d
0905 0d        dec     c
0906 0d        dec     c
0907 2020      jr      nz,$0929
0909 2020      jr      nz,$092b
090b 53        ld      d,e
090c 65        ld      h,l
090d 6c        ld      l,h
090e 65        ld      h,l
090f 63        ld      h,e
0910 74        ld      (hl),h
0911 2061      jr      nz,$0974
0913 2075      jr      nz,$098a
0915 73        ld      (hl),e
0916 65        ld      h,l
0917 72        ld      (hl),d
0918 2028      jr      nz,$0942
091a 66        ld      h,(hl)
091b 72        ld      (hl),d
091c 6f        ld      l,a
091d 6d        ld      l,l
091e 2030      jr      nz,$0950
0920 2074      jr      nz,$0996
0922 6f        ld      l,a
0923 2031      jr      nz,$0956
0925 35        dec     (hl)
0926 29        add     hl,hl
0927 0d        dec     c
0928 0d        dec     c
0929 2020      jr      nz,$094b
092b 203c      jr      nz,$0969
092d 3c        inc     a
092e 2050      jr      nz,$0980
0930 72        ld      (hl),d
0931 65        ld      h,l
0932 73        ld      (hl),e
0933 73        ld      (hl),e
0934 2061      jr      nz,$0997
0936 6e        ld      l,(hl)
0937 79        ld      a,c
0938 206b      jr      nz,$09a5
093a 65        ld      h,l
093b 79        ld      a,c
093c 2074      jr      nz,$09b2
093e 6f        ld      l,a
093f 2063      jr      nz,$09a4
0941 6f        ld      l,a
0942 6e        ld      l,(hl)
0943 74        ld      (hl),h
0944 69        ld      l,c
0945 6e        ld      l,(hl)
0946 75        ld      (hl),l
0947 65        ld      h,l
0948 2e3e      ld      l,$3e
094a 3e00      ld      a,$00
094c 43        ld      b,e
094d 6f        ld      l,a
094e 6d        ld      l,l
094f 6d        ld      l,l
0950 61        ld      h,c
0951 6e        ld      l,(hl)
0952 64        ld      h,h
0953 3a2048    ld      a,($4820)
0956 65        ld      h,l
0957 6c        ld      l,h
0958 70        ld      (hl),b
0959 2c        inc     l
095a 2064      jr      nz,$09c0
095c 69        ld      l,c
095d 73        ld      (hl),e
095e 70        ld      (hl),b
095f 6c        ld      l,h
0960 61        ld      h,c
0961 79        ld      a,c
0962 2063      jr      nz,$09c7
0964 6f        ld      l,a
0965 6d        ld      l,l
0966 6d        ld      l,l
0967 61        ld      h,c
0968 6e        ld      l,(hl)
0969 64        ld      h,h
096a 2068      jr      nz,$09d4
096c 65        ld      h,l
096d 6c        ld      l,h
096e 70        ld      (hl),b
096f 2074      jr      nz,$09e5
0971 65        ld      h,l
0972 78        ld      a,b
0973 74        ld      (hl),h
0974 00        nop     
0975 43        ld      b,e
0976 6f        ld      l,a
0977 6d        ld      l,l
0978 6d        ld      l,l
0979 61        ld      h,c
097a 6e        ld      l,(hl)
097b 64        ld      h,h
097c 3a2044    ld      a,($4420)
097f 69        ld      l,c
0980 72        ld      (hl),d
0981 2c        inc     l
0982 2063      jr      nz,$09e7
0984 68        ld      l,b
0985 61        ld      h,c
0986 6e        ld      l,(hl)
0987 67        ld      h,a
0988 65        ld      h,l
0989 2074      jr      nz,$09ff
098b 68        ld      l,b
098c 65        ld      h,l
098d 2064      jr      nz,$09f3
098f 72        ld      (hl),d
0990 69        ld      l,c
0991 76        halt    
0992 65        ld      h,l
0993 2061      jr      nz,$09f6
0995 6e        ld      l,(hl)
0996 64        ld      h,h
0997 2075      jr      nz,$0a0e
0999 73        ld      (hl),e
099a 65        ld      h,l
099b 72        ld      (hl),d
099c 00        nop     
099d 43        ld      b,e
099e 6f        ld      l,a
099f 6d        ld      l,l
09a0 6d        ld      l,l
09a1 61        ld      h,c
09a2 6e        ld      l,(hl)
09a3 64        ld      h,h
09a4 3a2044    ld      a,($4420)
09a7 72        ld      (hl),d
09a8 69        ld      l,c
09a9 76        halt    
09aa 65        ld      h,l
09ab 2c        inc     l
09ac 2063      jr      nz,$0a11
09ae 68        ld      l,b
09af 61        ld      h,c
09b0 6e        ld      l,(hl)
09b1 67        ld      h,a
09b2 65        ld      h,l
09b3 2074      jr      nz,$0a29
09b5 68        ld      l,b
09b6 65        ld      h,l
09b7 2064      jr      nz,$0a1d
09b9 72        ld      (hl),d
09ba 69        ld      l,c
09bb 76        halt    
09bc 65        ld      h,l
09bd 00        nop     
09be 43        ld      b,e
09bf 6f        ld      l,a
09c0 6d        ld      l,l
09c1 6d        ld      l,l
09c2 61        ld      h,c
09c3 6e        ld      l,(hl)
09c4 64        ld      h,h
09c5 3a2055    ld      a,($5520)
09c8 73        ld      (hl),e
09c9 65        ld      h,l
09ca 72        ld      (hl),d
09cb 2c        inc     l
09cc 2063      jr      nz,$0a31
09ce 68        ld      l,b
09cf 61        ld      h,c
09d0 6e        ld      l,(hl)
09d1 67        ld      h,a
09d2 65        ld      h,l
09d3 2074      jr      nz,$0a49
09d5 68        ld      l,b
09d6 65        ld      h,l
09d7 2075      jr      nz,$0a4e
09d9 73        ld      (hl),e
09da 65        ld      h,l
09db 72        ld      (hl),d
09dc 00        nop     
09dd 43        ld      b,e
09de 6f        ld      l,a
09df 6d        ld      l,l
09e0 6d        ld      l,l
09e1 61        ld      h,c
09e2 6e        ld      l,(hl)
09e3 64        ld      h,h
09e4 3a2052    ld      a,($5220)
09e7 75        ld      (hl),l
09e8 6e        ld      l,(hl)
09e9 2c        inc     l
09ea 2061      jr      nz,$0a4d
09ec 2066      jr      nz,$0a54
09ee 69        ld      l,c
09ef 6c        ld      l,h
09f0 65        ld      h,l
09f1 00        nop     
09f2 00        nop     
09f3 43        ld      b,e
09f4 6f        ld      l,a
09f5 6d        ld      l,l
09f6 6d        ld      l,l
09f7 61        ld      h,c
09f8 6e        ld      l,(hl)
09f9 64        ld      h,h
09fa 3a2053    ld      a,($5320)
09fd 65        ld      h,l
09fe 61        ld      h,c
09ff 72        ld      (hl),d
0a00 63        ld      h,e
0a01 68        ld      l,b
0a02 2c        inc     l
0a03 2063      jr      nz,$0a68
0a05 68        ld      l,b
0a06 61        ld      h,c
0a07 6e        ld      l,(hl)
0a08 67        ld      h,a
0a09 65        ld      h,l
0a0a 2064      jr      nz,$0a70
0a0c 69        ld      l,c
0a0d 72        ld      (hl),d
0a0e 65        ld      h,l
0a0f 63        ld      h,e
0a10 74        ld      (hl),h
0a11 6f        ld      l,a
0a12 72        ld      (hl),d
0a13 79        ld      a,c
0a14 2073      jr      nz,$0a89
0a16 65        ld      h,l
0a17 61        ld      h,c
0a18 72        ld      (hl),d
0a19 63        ld      h,e
0a1a 68        ld      l,b
0a1b 2073      jr      nz,$0a90
0a1d 74        ld      (hl),h
0a1e 72        ld      (hl),d
0a1f 69        ld      l,c
0a20 6e        ld      l,(hl)
0a21 67        ld      h,a
0a22 00        nop     
0a23 43        ld      b,e
0a24 6f        ld      l,a
0a25 6d        ld      l,l
0a26 6d        ld      l,l
0a27 61        ld      h,c
0a28 6e        ld      l,(hl)
0a29 64        ld      h,h
0a2a 3a2052    ld      a,($5220)
0a2d 65        ld      h,l
0a2e 6e        ld      l,(hl)
0a2f 61        ld      h,c
0a30 6d        ld      l,l
0a31 65        ld      h,l
0a32 2c        inc     l
0a33 206f      jr      nz,$0aa4
0a35 6e        ld      l,(hl)
0a36 65        ld      h,l
0a37 206f      jr      nz,$0aa8
0a39 72        ld      (hl),d
0a3a 206d      jr      nz,$0aa9
0a3c 6f        ld      l,a
0a3d 72        ld      (hl),d
0a3e 65        ld      h,l
0a3f 2066      jr      nz,$0aa7
0a41 69        ld      l,c
0a42 6c        ld      l,h
0a43 65        ld      h,l
0a44 73        ld      (hl),e
0a45 00        nop     
0a46 43        ld      b,e
0a47 6f        ld      l,a
0a48 6d        ld      l,l
0a49 6d        ld      l,l
0a4a 61        ld      h,c
0a4b 6e        ld      l,(hl)
0a4c 64        ld      h,h
0a4d 3a2045    ld      a,($4520)
0a50 72        ld      (hl),d
0a51 61        ld      h,c
0a52 73        ld      (hl),e
0a53 65        ld      h,l
0a54 2c        inc     l
0a55 206f      jr      nz,$0ac6
0a57 6e        ld      l,(hl)
0a58 65        ld      h,l
0a59 206f      jr      nz,$0aca
0a5b 72        ld      (hl),d
0a5c 206d      jr      nz,$0acb
0a5e 6f        ld      l,a
0a5f 72        ld      (hl),d
0a60 65        ld      h,l
0a61 2066      jr      nz,$0ac9
0a63 69        ld      l,c
0a64 6c        ld      l,h
0a65 65        ld      h,l
0a66 73        ld      (hl),e
0a67 00        nop     
0a68 43        ld      b,e
0a69 6f        ld      l,a
0a6a 6d        ld      l,l
0a6b 6d        ld      l,l
0a6c 61        ld      h,c
0a6d 6e        ld      l,(hl)
0a6e 64        ld      h,h
0a6f 3a2054    ld      a,($5420)
0a72 79        ld      a,c
0a73 70        ld      (hl),b
0a74 65        ld      h,l
0a75 2c        inc     l
0a76 206f      jr      nz,$0ae7
0a78 6e        ld      l,(hl)
0a79 65        ld      h,l
0a7a 206f      jr      nz,$0aeb
0a7c 72        ld      (hl),d
0a7d 206d      jr      nz,$0aec
0a7f 6f        ld      l,a
0a80 72        ld      (hl),d
0a81 65        ld      h,l
0a82 2066      jr      nz,$0aea
0a84 69        ld      l,c
0a85 6c        ld      l,h
0a86 65        ld      h,l
0a87 73        ld      (hl),e
0a88 00        nop     
0a89 43        ld      b,e
0a8a 6f        ld      l,a
0a8b 6d        ld      l,l
0a8c 6d        ld      l,l
0a8d 61        ld      h,c
0a8e 6e        ld      l,(hl)
0a8f 64        ld      h,h
0a90 3a2050    ld      a,($5020)
0a93 72        ld      (hl),d
0a94 69        ld      l,c
0a95 6e        ld      l,(hl)
0a96 74        ld      (hl),h
0a97 2c        inc     l
0a98 206f      jr      nz,$0b09
0a9a 6e        ld      l,(hl)
0a9b 65        ld      h,l
0a9c 206f      jr      nz,$0b0d
0a9e 72        ld      (hl),d
0a9f 206d      jr      nz,$0b0e
0aa1 6f        ld      l,a
0aa2 72        ld      (hl),d
0aa3 65        ld      h,l
0aa4 2066      jr      nz,$0b0c
0aa6 69        ld      l,c
0aa7 6c        ld      l,h
0aa8 65        ld      h,l
0aa9 73        ld      (hl),e
0aaa 00        nop     
0aab 43        ld      b,e
0aac 6f        ld      l,a
0aad 6d        ld      l,l
0aae 6d        ld      l,l
0aaf 61        ld      h,c
0ab0 6e        ld      l,(hl)
0ab1 64        ld      h,h
0ab2 3a204d    ld      a,($4d20)
0ab5 61        ld      h,c
0ab6 6b        ld      l,e
0ab7 65        ld      h,l
0ab8 2c        inc     l
0ab9 2061      jr      nz,$0b1c
0abb 2066      jr      nz,$0b23
0abd 69        ld      l,c
0abe 6c        ld      l,h
0abf 65        ld      h,l
0ac0 00        nop     
0ac1 43        ld      b,e
0ac2 6f        ld      l,a
0ac3 6d        ld      l,l
0ac4 6d        ld      l,l
0ac5 61        ld      h,c
0ac6 6e        ld      l,(hl)
0ac7 64        ld      h,h
0ac8 3a2051    ld      a,($5120)
0acb 75        ld      (hl),l
0acc 69        ld      l,c
0acd 74        ld      (hl),h
0ace 2c        inc     l
0acf 2056      jr      nz,$0b27
0ad1 43        ld      b,e
0ad2 43        ld      b,e
0ad3 50        ld      d,b
0ad4 00        nop     
0ad5 41        ld      b,c
0ad6 64        ld      h,h
0ad7 64        ld      h,h
0ad8 65        ld      h,l
0ad9 64        ld      h,h
0ada 2043      jr      nz,$0b1f
0adc 6f        ld      l,a
0add 6d        ld      l,l
0ade 6d        ld      l,l
0adf 61        ld      h,c
0ae0 6e        ld      l,(hl)
0ae1 64        ld      h,h
0ae2 00        nop     
0ae3 1b        dec     de
0ae4 5b        ld      e,e
0ae5 50        ld      d,b
0ae6 314100    ld      sp,$0041
0ae9 1b        dec     de
0aea 5b        ld      e,e
0aeb 50        ld      d,b
0aec 314200    ld      sp,$0042
0aef 1b        dec     de
0af0 5b        ld      e,e
0af1 00        nop     
0af2 1b        dec     de
0af3 5b        ld      e,e
0af4 366e      ld      (hl),$6e
0af6 00        nop     
0af7 1b        dec     de
0af8 5b        ld      e,e
0af9 324a00    ld      ($004a),a
0afc 1b        dec     de
0afd 5b        ld      e,e
0afe 37        scf     
0aff 6d        ld      l,l
0b00 00        nop     
0b01 1b        dec     de
0b02 5b        ld      e,e
0b03 306d      jr      nc,$0b72
0b05 00        nop     
0b06 1b        dec     de
0b07 5b        ld      e,e
0b08 304a      jr      nc,$0b54
0b0a 00        nop     
0b0b 1b        dec     de
0b0c 5b        ld      e,e
0b0d 314400    ld      sp,$0044
0b10 41        ld      b,c
0b11 3a2020    ld      a,($2020)
0b14 2020      jr      nz,$0b36
0b16 2020      jr      nz,$0b38
0b18 2020      jr      nz,$0b3a
0b1a 00        nop     
0b1b 00        nop     
0b1c 42        ld      b,d
0b1d 3a2020    ld      a,($2020)
0b20 2020      jr      nz,$0b42
0b22 2020      jr      nz,$0b44
0b24 2020      jr      nz,$0b46
0b26 00        nop     
0b27 00        nop     
0b28 43        ld      b,e
0b29 3a2020    ld      a,($2020)
0b2c 2020      jr      nz,$0b4e
0b2e 2020      jr      nz,$0b50
0b30 2020      jr      nz,$0b52
0b32 00        nop     
0b33 00        nop     
0b34 44        ld      b,h
0b35 3a2020    ld      a,($2020)
0b38 2020      jr      nz,$0b5a
0b3a 2020      jr      nz,$0b5c
0b3c 2020      jr      nz,$0b5e
0b3e 00        nop     
0b3f 00        nop     
0b40 45        ld      b,l
0b41 3a2020    ld      a,($2020)
0b44 2020      jr      nz,$0b66
0b46 2020      jr      nz,$0b68
0b48 2020      jr      nz,$0b6a
0b4a 00        nop     
0b4b 00        nop     
0b4c 303a      jr      nc,$0b88
0b4e 2020      jr      nz,$0b70
0b50 2020      jr      nz,$0b72
0b52 2000      jr      nz,$0b54
0b54 00        nop     
0b55 313a20    ld      sp,$203a
0b58 2020      jr      nz,$0b7a
0b5a 2020      jr      nz,$0b7c
0b5c 00        nop     
0b5d 00        nop     
0b5e 323a20    ld      ($203a),a
0b61 2020      jr      nz,$0b83
0b63 2020      jr      nz,$0b85
0b65 00        nop     
0b66 00        nop     
0b67 33        inc     sp
0b68 3a2020    ld      a,($2020)
0b6b 2020      jr      nz,$0b8d
0b6d 2000      jr      nz,$0b6f
0b6f 00        nop     
0b70 34        inc     (hl)
0b71 3a2020    ld      a,($2020)
0b74 2020      jr      nz,$0b96
0b76 2000      jr      nz,$0b78
0b78 00        nop     
0b79 35        dec     (hl)
0b7a 3a2020    ld      a,($2020)
0b7d 2020      jr      nz,$0b9f
0b7f 2000      jr      nz,$0b81
0b81 00        nop     
0b82 363a      ld      (hl),$3a
0b84 2020      jr      nz,$0ba6
0b86 2020      jr      nz,$0ba8
0b88 2000      jr      nz,$0b8a
0b8a 00        nop     
0b8b 37        scf     
0b8c 3a2020    ld      a,($2020)
0b8f 2020      jr      nz,$0bb1
0b91 2000      jr      nz,$0b93
0b93 00        nop     
0b94 383a      jr      c,$0bd0
0b96 2020      jr      nz,$0bb8
0b98 2020      jr      nz,$0bba
0b9a 2000      jr      nz,$0b9c
0b9c 00        nop     
0b9d 39        add     hl,sp
0b9e 3a2020    ld      a,($2020)
0ba1 2020      jr      nz,$0bc3
0ba3 2000      jr      nz,$0ba5
0ba5 00        nop     
0ba6 31303a    ld      sp,$3a30
0ba9 2020      jr      nz,$0bcb
0bab 2020      jr      nz,$0bcd
0bad 00        nop     
0bae 00        nop     
0baf 31313a    ld      sp,$3a31
0bb2 2020      jr      nz,$0bd4
0bb4 2020      jr      nz,$0bd6
0bb6 00        nop     
0bb7 00        nop     
0bb8 31323a    ld      sp,$3a32
0bbb 2020      jr      nz,$0bdd
0bbd 2020      jr      nz,$0bdf
0bbf 00        nop     
0bc0 00        nop     
0bc1 31333a    ld      sp,$3a33
0bc4 2020      jr      nz,$0be6
0bc6 2020      jr      nz,$0be8
0bc8 00        nop     
0bc9 00        nop     
0bca 31343a    ld      sp,$3a34
0bcd 2020      jr      nz,$0bef
0bcf 2020      jr      nz,$0bf1
0bd1 00        nop     
0bd2 00        nop     
0bd3 31353a    ld      sp,$3a35
0bd6 2020      jr      nz,$0bf8
0bd8 2020      jr      nz,$0bfa
0bda 00        nop     
0bdb 00        nop     
0bdc 21f00b    ld      hl,$0bf0
0bdf 1803      jr      $0be4
0be1 21ed0b    ld      hl,$0bed
0be4 1101cd    ld      de,$cd01
0be7 010300    ld      bc,$0003
0bea edb0      ldir    
0bec c9        ret     

0bed 31cd53    ld      sp,$53cd
0bf0 c30000    jp      $0000

					copy BIOS entry points 

0bf3 2a0100    ld      hl,($0001)	load BIOS entry point
0bf6 eb        ex      de,hl
0bf7 21190c    ld      hl,$0c19		copy BIOS entry points to 
0bfa 0610      ld      b,$10		0c19 ..
0bfc 23        inc     hl
0bfd 73        ld      (hl),e
0bfe 23        inc     hl
0bff 72        ld      (hl),d
0c00 23        inc     hl
0c01 13        inc     de
0c02 13        inc     de
0c03 13        inc     de
0c04 78        ld      a,b
0c05 fe0f      cp      $0f
0c07 2803      jr      z,$0c0c
0c09 10f1      djnz    $0bfc
0c0b c9        ret     

0c0c 05        dec     b
0c0d 23        inc     hl
0c0e 23        inc     hl
0c0f e5        push    hl
0c10 216c0c    ld      hl,$0c6c
0c13 73        ld      (hl),e
0c14 23        inc     hl
0c15 72        ld      (hl),d
0c16 e1        pop     hl
0c17 18e7      jr      $0c00
0c19 c30100    jp      $0001	BIOS WBOOT
0c1c c30400    jp      $0004	BIOS CONST console status -> readkey
0c1f c34a0c    jp      $0c4a	BIOS console input
0c22 c30a00    jp      $000a	BIOS console output
0c25 c30d00    jp      $000d	BIOS list to printer
0c28 c31000    jp      $0010  	BIOS punch
0c2b c31300    jp      $0013	BIOS reader
0c2e c31600    jp      $0016	BIOS home mode disc head to track 0
0c31 c31900    jp      $0019	BIOS seldsk select disk drive
0c34 c31c00    jp      $001c	BIOS settrk set track number 
0c37 c31f00    jp      $001f	BIOS setsec set sector number
0c3a c32200    jp      $0022	BIOS set DMA addr
0c3d c32500    jp      $0025	BIOS read sector
0c40 c32800    jp      $0028	BIOS write sector
0c43 c32b00    jp      $002b	BIOS status of list device
0c46 c32e00    jp      $002e	BIOS SECTRAN sector translation for skew
0c49 00        nop  
				get a command key
				read a key. If ^C (reload dir) or ^D (help) process it


0c4a cd6b0c    call    $0c6b	read key
0c4d fe03      cp      $03	^C?
0c4f ca9510    jp      z,$1095	yes, jump to 1095 -> re-read dir/reload main screen
0c52 c5        push    bc
0c53 47        ld      b,a
0c54 3a490c    ld      a,($0c49)
0c57 b7        or      a
0c58 78        ld      a,b
0c59 c1        pop     bc
0c5a 2804      jr      z,$0c60
0c5c fe11      cp      $11	^Q? -> deselect files
0c5e 2808      jr      z,$0c68
0c60 fe04      cp      $04	^D?  -> help screen
0c62 c0        ret     nz
0c63 cd791a    call    $1a79
0c66 18e2      jr      $0c4a	goto readkey again
0c68 3eff      ld      a,$ff	exit with A=FF -> deselect files
0c6a c9        ret     

0c6b c30700    jp      $0007

					Clear Screen and Home cursor

0c6e 21f70a    ld      hl,$0af7		[HL]="ESC [ 2 J" = ANSI Clear Screen and Home
0c71 cd2c0d    call    $0d2c		print zero-terminated string at [HL]
0c74 110000    ld      de,$0000		x=Y=0
0c77 1832      jr      $0cab		set cursor at XY=reg DE -> home cursor

					Clear from cursor pos to end of screen

0c79 e5        push    hl		
0c7a 21060b    ld      hl,$0b06		string ESC 0 J -> Erase from current pos to the bottom of the screen
0c7d 1829      jr      $0ca8		print string

0c7f e5        push    hl
0c80 210b0b    ld      hl,$0b0b		string ESC 1 D -> 
0c83 cd200d    call    $0d20
0c86 3a3d01    ld      a,($013d)
0c89 4f        ld      c,a
0c8a cd220c    call    $0c22	call BIOS console output
0c8d 210b0b    ld      hl,$0b0b
0c90 1816      jr      $0ca8
0c92 e5        push    hl
0c93 21e30a    ld      hl,$0ae3
0c96 1810      jr      $0ca8
0c98 e5        push    hl
0c99 21e90a    ld      hl,$0ae9
0c9c 180a      jr      $0ca8
0c9e e5        push    hl
0c9f 21fc0a    ld      hl,$0afc
0ca2 1804      jr      $0ca8
0ca4 e5        push    hl
0ca5 21010b    ld      hl,$0b01
0ca8 c3210d    jp      $0d21

				set cursor at XY=reg DE

0cab e5        push    hl
0cac d5        push    de
0cad c5        push    bc
0cae f5        push    af
0caf 21ef0a    ld      hl,$0aef	[HL]="ESC [" 
0cb2 cd2c0d    call    $0d2c	print zero-terminated string at [HL]
0cb5 7b        ld      a,e
0cb6 cdcb0c    call    $0ccb
0cb9 d5        push    de
0cba 0e3b      ld      c,$3b	';'
0cbc cd220c    call    $0c22	call BIOS console output
0cbf d1        pop     de
0cc0 7a        ld      a,d
0cc1 cdcb0c    call    $0ccb
0cc4 0e48      ld      c,$48	'H'
0cc6 cd220c    call    $0c22	call BIOS console output
0cc9 185c      jr      $0d27	pop regs then ret
0ccb 3c        inc     a
0ccc 06ff      ld      b,$ff
0cce 04        inc     b
0ccf d60a      sub     $0a
0cd1 30fb      jr      nc,$0cce
0cd3 c60a      add     a,$0a
0cd5 5f        ld      e,a
0cd6 78        ld      a,b
0cd7 cddb0c    call    $0cdb
0cda 7b        ld      a,e
0cdb c630      add     a,$30
0cdd 4f        ld      c,a
0cde d5        push    de
0cdf cd220c    call    $0c22	call BIOS console output
0ce2 d1        pop     de
0ce3 c9        ret     

				; query cursor pos
				
0ce4 f5        push    af
0ce5 c5        push    bc
0ce6 e5        push    hl
0ce7 21f20a    ld      hl,$0af2	"ESC [6n" -> request cursor pos (returns "ESC [ yy ; xx R")
0cea cd200d    call    $0d20	print string [HL], preserving registers
0ced cd1f0c    call    $0c1f	get a command key -> discard ESC
0cf0 cd1f0c    call    $0c1f	get a command key -> discard '['
0cf3 cd070d    call    $0d07	get 2 digits decimal num from console
0cf6 5f        ld      e,a
0cf7 cd1f0c    call    $0c1f	get a command key: 
0cfa cd070d    call    $0d07	get 2 digits decimal num from console
0cfd 57        ld      d,a
0cfe d5        push    de
0cff cd1f0c    call    $0c1f	get a command key
0d02 d1        pop     de
0d03 e1        pop     hl
0d04 c1        pop     bc
0d05 f1        pop     af
0d06 c9        ret     

				get 2 digits decimal num from console

0d07 cd1f0c    call    $0c1f	get a command key
0d0a d630      sub     $30
0d0c b7        or      a
0d0d 2806      jr      z,$0d15
0d0f 47        ld      b,a
0d10 af        xor     a
0d11 c60a      add     a,$0a
0d13 10fc      djnz    $0d11
0d15 57        ld      d,a
0d16 d5        push    de
0d17 cd1f0c    call    $0c1f	get a command key
0d1a d1        pop     de
0d1b d630      sub     $30
0d1d 82        add     a,d
0d1e 3d        dec     a
0d1f c9        ret     

0d20 e5        push    hl
0d21 d5        push    de
0d22 c5        push    bc
0d23 f5        push    af
0d24 cd2c0d    call    $0d2c	print zero-terminated string at [HL]
0d27 f1        pop     af
0d28 c1        pop     bc
0d29 d1        pop     de
0d2a e1        pop     hl
0d2b c9        ret     

				print zero-terminated string at [HL]

0d2c 4e        ld      c,(hl)	if [HL]==0 return
0d2d af        xor     a
0d2e b1        or      c
0d2f c8        ret     z
0d30 e5        push    hl
0d31 cd220c    call    $0c22	call BIOS console output
0d34 e1        pop     hl
0d35 23        inc     hl
0d36 18f4      jr      $0d2c	print zero-terminated string at [HL]

0d38 f3        di      
0d39 cdcf0d    call    $0dcf		save registers 
0d3c cda30d    call    $0da3		YYY
0d3f 211401    ld      hl,$0114
0d42 224f0d    ld      ($0d4f),hl
0d45 21ba0e    ld      hl,$0eba
0d48 22610d    ld      ($0d61),hl
0d4b cd8b0f    call    $0f8b 		CRTC register, read format register RF
0d4e 011401    ld      bc,$0114
0d51 cde70d    call    $0de7
0d54 cd6a0e    call    $0e6a
0d57 cd0b0e    call    $0e0b		clrrect
0d5a 21950f    ld      hl,$0f95
0d5d 22800e    ld      ($0e80),hl
0d60 cdb70e    call    $0eb7
0d63 1837      jr      $0d9c

0d65 f3        di      
0d66 cdcf0d    call    $0dcf	save registers 
0d69 cda30d    call    $0da3
0d6c 211d01    ld      hl,$011d
0d6f 224f0d    ld      ($0d4f),hl
0d72 21b70e    ld      hl,$0eb7
0d75 22610d    ld      ($0d61),hl
0d78 18d4      jr      $0d4e
0d7a f3        di      
0d7b cdcf0d    call    $0dcf	save registers 
0d7e cda30d    call    $0da3
0d81 013801    ld      bc,$0138
0d84 cde70d    call    $0de7
0d87 cd260e    call    $0e26
0d8a 2ae30d    ld      hl,($0de3)
0d8d cd6a0e    call    $0e6a
0d90 cd0b0e    call    $0e0b		clrrect
0d93 21950f    ld      hl,$0f95
0d96 22800e    ld      ($0e80),hl
0d99 cdba0e    call    $0eba
0d9c cda80d    call    $0da8
0d9f fb        ei      
0da0 c9        ret     

0da1 0a        ld      a,(bc)
0da2 09        add     hl,bc
0da3 11a10d    ld      de,$0da1
0da6 1803      jr      $0dab

0da8 11a20d    ld      de,$0da2	DE->subfun 09: cursor ON
0dab 0e71      ld      c,$71	Personal CP/M: 113 Direct Screen Function
0dad c30500    jp      $0005	call BDOS

0db0 f3        di      
0db1 cdcf0d    call    $0dcf	save registers 
0db4 11a10d    ld      de,$0da1	DE->subfun 0a: cursor OFF
0db7 0e71      ld      c,$71	Personal CP/M: 113 Direct Screen Function
0db9 cd0500    call    $0005	call BDOS
0dbc 013801    ld      bc,$0138
0dbf cde70d    call    $0de7
0dc2 cd2e0e    call    $0e2e
0dc5 11a20d    ld      de,$0da2
0dc8 0e71      ld      c,$71
0dca cd0500    call    $0005
0dcd fb        ei      
0dce c9        ret     

				Save registers in stack to be restored
				automatically on return

0dcf dde3      ex      (sp),ix
0dd1 e5        push    hl
0dd2 c5        push    bc
0dd3 d5        push    de
0dd4 f5        push    af
0dd5 e5        push    hl
0dd6 21dc0d    ld      hl,$0ddc
0dd9 e3        ex      (sp),hl
0dda dde9      jp      (ix)
0ddc f1        pop     af
0ddd d1        pop     de
0dde c1        pop     bc
0ddf e1        pop     hl
0de0 dde1      pop     ix
0de2 c9        ret     

0de3 00        nop     
0de4 00        nop     
0de5 00        nop     
0de6 00        nop     
0de7 0a        ld      a,(bc)
0de8 6f        ld      l,a
0de9 03        inc     bc
0dea 0a        ld      a,(bc)
0deb 67        ld      h,a
0dec cd560f    call    $0f56
0def 2b        dec     hl
0df0 118002    ld      de,$0280
0df3 b7        or      a
0df4 ed52      sbc     hl,de
0df6 22e30d    ld      ($0de3),hl
0df9 03        inc     bc
0dfa 0a        ld      a,(bc)
0dfb 3c        inc     a
0dfc 3c        inc     a
0dfd 32e50d    ld      ($0de5),a
0e00 03        inc     bc
0e01 0a        ld      a,(bc)
0e02 3c        inc     a
0e03 3c        inc     a
0e04 87        add     a,a
0e05 87        add     a,a
0e06 87        add     a,a
0e07 32e60d    ld      ($0de6),a
0e0a c9        ret     

				; clrrect:
				; clear a rectangle in text screen
				; starting at col0,row0, for wi columns, he rows
				; entry: HL=$8000 + 80*8*col0 + row0
				;        BC=wi*256 + he*8
				; mz800 screen is bitmaped (no text memory mapped screen)
				; each line is 80 bytes wide, 8 lines for each row

0e0b 115000    ld      de,$0050
0e0e cd900f    call    $0f90 		CRTC register, write format register WF -> $8000 is VRAM
0e11 dbe0      in      a,($e0)		memory bank control: rom Char gen at $1000-$2000
0e13 e5        push    hl                                    ram char gen at $c000-$d000
0e14 c5        push    bc
0e15 af        xor     a
0e16 77        ld      (hl),a
0e17 23        inc     hl
0e18 10fc      djnz    $0e16
0e1a c1        pop     bc
0e1b e1        pop     hl
0e1c 19        add     hl,de
0e1d 0d        dec     c
0e1e 20f3      jr      nz,$0e13
0e20 dbe1      in      a,($e1)		memory bank control
0e22 c9        ret     

0e23 00        nop     
0e24 00        nop     
0e25 00        nop     
					copy/restore vram ($8000) <-> ram ($4000)

0e26 cd8b0f    call    $0f8b 		CRTC register, read format register RF
0e29 217e0f    ld      hl,$0f7e
0e2c 1806      jr      $0e34
0e2e cd900f    call    $0f90 		CRTC register, write format register WF
0e31 21840f    ld      hl,$0f84		
0e34 22530e    ld      ($0e53),hl	xxx
0e37 3eb0      ld      a,$b0		put ldir in copy to vram routine
0e39 32870f    ld      ($0f87),a
0e3c 2ae30d    ld      hl,($0de3)
0e3f 3ae60d    ld      a,($0de6)
0e42 32230e    ld      ($0e23),a
0e45 cd720e    call    $0e72
0e48 ed53240e  ld      ($0e24),de
0e4c 3ae50d    ld      a,($0de5)
0e4f 4f        ld      c,a
0e50 0600      ld      b,$00
0e52 cd7e0f    call    $0f7e		read background
0e55 21230e    ld      hl,$0e23
0e58 35        dec     (hl)
0e59 2809      jr      z,$0e64
0e5b 2a240e    ld      hl,($0e24)
0e5e 115000    ld      de,$0050
0e61 19        add     hl,de
0e62 18e1      jr      $0e45
0e64 3ea0      ld      a,$a0
0e66 32870f    ld      ($0f87),a
0e69 c9        ret     

0e6a e5        push    hl
0e6b 2ae50d    ld      hl,($0de5)
0e6e 45        ld      b,l
0e6f 4c        ld      c,h
0e70 e1        pop     hl
0e71 c9        ret     

0e72 e5        push    hl
0e73 110080    ld      de,$8000
0e76 b7        or      a
0e77 ed52      sbc     hl,de
0e79 110040    ld      de,$4000
0e7c 19        add     hl,de
0e7d d1        pop     de
0e7e c9        ret     

0e7f 00        nop     
0e80 00        nop     
0e81 00        nop     
0e82 00        nop     
0e83 00        nop     
0e84 00        nop     
0e85 00        nop     
0e86 00        nop     
0e87 02        ld      (bc),a
0e88 1b        dec     de
0e89 3d        dec     a
0e8a 213553    ld      hl,$5335
0e8d 65        ld      h,l
0e8e 6c        ld      l,h
0e8f 65        ld      h,l
0e90 63        ld      h,e
0e91 74        ld      (hl),h
0e92 2061      jr      nz,$0ef5
0e94 2043      jr      nz,$0ed9
0e96 6f        ld      l,a
0e97 6d        ld      l,l
0e98 6d        ld      l,l
0e99 61        ld      h,c
0e9a 6e        ld      l,(hl)
0e9b 64        ld      h,h
0e9c 2020      jr      nz,$0ebe
0e9e 2020      jr      nz,$0ec0
0ea0 2020      jr      nz,$0ec2
0ea2 2020      jr      nz,$0ec4
0ea4 2020      jr      nz,$0ec6
0ea6 2020      jr      nz,$0ec8
0ea8 2020      jr      nz,$0eca
0eaa 2020      jr      nz,$0ecc
0eac 56        ld      d,(hl)
0ead 43        ld      b,e
0eae 43        ld      b,e
0eaf 50        ld      d,b
0eb0 2056      jr      nz,$0f08
0eb2 312e30    ld      sp,$302e
0eb5 41        ld      b,c
0eb6 00        nop     
0eb7 3e01      ld      a,$01
0eb9 213e00    ld      hl,$003e
0ebc 327f0e    ld      ($0e7f),a
0ebf 2a800e    ld      hl,($0e80)
0ec2 ed5be30d  ld      de,($0de3)
0ec6 cd260f    call    $0f26
0ec9 ed53820e  ld      ($0e82),de
0ecd ed5be30d  ld      de,($0de3)
0ed1 cd400f    call    $0f40
0ed4 ed53840e  ld      ($0e84),de
0ed8 ed5b820e  ld      de,($0e82)
0edc cd400f    call    $0f40
0edf ed5b840e  ld      de,($0e84)
0ee3 eb        ex      de,hl
0ee4 018002    ld      bc,$0280
0ee7 09        add     hl,bc
0ee8 eb        ex      de,hl
0ee9 cd1d0f    call    $0f1d		select next char pattern
0eec cd260f    call    $0f26
0eef 3a7f0e    ld      a,($0e7f)
0ef2 b7        or      a
0ef3 c8        ret     z

0ef4 e5        push    hl
0ef5 2a860e    ld      hl,($0e86)
0ef8 110080    ld      de,$8000
0efb 7d        ld      a,l
0efc b7        or      a
0efd 2804      jr      z,$0f03
0eff 47        ld      b,a
0f00 13        inc     de
0f01 10fd      djnz    $0f00
0f03 7c        ld      a,h
0f04 b7        or      a
0f05 2809      jr      z,$0f10
0f07 47        ld      b,a
0f08 eb        ex      de,hl
0f09 118002    ld      de,$0280
0f0c 19        add     hl,de
0f0d 10fd      djnz    $0f0c
0f0f eb        ex      de,hl
0f10 e1        pop     hl
0f11 cd1d0f    call    $0f1d	select next char pattern
0f14 cd260f    call    $0f26
0f17 21880e    ld      hl,$0e88
0f1a c32c0d    jp      $0d2c	print zero-terminated string at [HL]


0f1d 23        inc     hl	inc HL 8 times -> select next char pattern
0f1e 23        inc     hl
0f1f 23        inc     hl
0f20 23        inc     hl
0f21 23        inc     hl
0f22 23        inc     hl
0f23 23        inc     hl
0f24 23        inc     hl
0f25 c9        ret     

0f26 3ae50d    ld      a,($0de5)	A=0a
0f29 cd6a0f    call    $0f6a		copy char pattern to vram bitmap '+'
0f2c 3d        dec     a		-> A=09
0f2d cd1d0f    call    $0f1d		select next char pattern
0f30 3d        dec     a		-> A=08
0f31 2806      jr      z,$0f39
0f33 13        inc     de		go to next column
0f34 cd6a0f    call    $0f6a		copy char pattern to vram bitmap
0f37 18f7      jr      $0f30
0f39 cd1d0f    call    $0f1d		select next char pattern
0f3c 13        inc     de		go to next column
0f3d c36a0f    jp      $0f6a		copy char pattern to vram bitmap

0f40 cd1d0f    call    $0f1d		select next char pattern
0f43 3ae60d    ld      a,($0de6)
0f46 d610      sub     $10
0f48 eb        ex      de,hl
0f49 018002    ld      bc,$0280
0f4c 09        add     hl,bc
0f4d eb        ex      de,hl
0f4e cd6a0f    call    $0f6a		copy char pattern to vram bitmap
0f51 d608      sub     $08
0f53 c8        ret     z
0f54 18f2      jr      $0f48

0f56 c5        push    bc
0f57 7c        ld      a,h
0f58 2600      ld      h,$00
0f5a b7        or      a
0f5b 2807      jr      z,$0f64
0f5d 47        ld      b,a
0f5e 118002    ld      de,$0280
0f61 19        add     hl,de
0f62 10fa      djnz    $0f5e
0f64 110080    ld      de,$8000
0f67 c1        pop     bc
0f68 19        add     hl,de
0f69 c9        ret     

					copy char pattern to vram bitmap
					HL=addr of char pattern
					DE=$8000 + 80*8*col + row=position in VRAM 

0f6a cdcf0d    call    $0dcf	save registers 
0f6d 01ff08    ld      bc,$08ff
0f70 cd840f    call    $0f84	copy to vram
0f73 05        dec     b
0f74 c8        ret     z
0f75 e5        push    hl
0f76 214f00    ld      hl,$004f
0f79 19        add     hl,de
0f7a eb        ex      de,hl
0f7b e1        pop     hl
0f7c 18f2      jr      $0f70

0f7e eb        ex      de,hl
0f7f cd840f    call    $0f84		copy to vram
0f82 eb        ex      de,hl
0f83 c9        ret     

					; copy to vram
					; copy from Char Gen Rom to RAM

0f84 dbe0      in      a,($e0)		memory bank control: rom Char gen at $1000-$2000
0f86 eda0      ldi                                           ram char gen at $c000-$d000
0f88 dbe1      in      a,($e1)		memory bank control
0f8a c9        ret     

in a,($e0) -> mz700: 1000-1FFF CG ROM
                     C000 CFFF PCG RAM
              mz800: 1000-1FFF CG ROM
                     8000-BFFF VRAM

in a, ($e1) -> mz700: 1000-1FFF normal RAM
                      C000 CFFF normal RAM
              mz800: 1000-1FFF normal RAM
                     8000-BFFF normal RAM

mz700 mode:
RAM 2000-3000: CG area
    3000-3800: TEXT area
    3800-3FFF: ATB area


0f8b 3e01      ld      a,$01
0f8d d3cd      out     ($cd),a		CRTC register, read format register RF
0f8f c9        ret     

0f90 3e01      ld      a,$01
0f92 d3cc      out     ($cc),a		CRTC register, write format register WF
0f94 c9        ret     

0f95 00        nop     
0f96 fefe      cp      $fe
0f98 0e0e      ld      c,$0e
0f9a 0e0e      ld      c,$0e
0f9c 0e00      ld      c,$00
0f9e ff        rst     $38
0f9f ff        rst     $38
0fa0 00        nop     
0fa1 00        nop     
0fa2 00        nop     
0fa3 00        nop     
0fa4 00        nop     
0fa5 00        nop     
0fa6 0f        rrca    
0fa7 1f        rra     
0fa8 2e4e      ld      l,$4e
0faa 8e        adc     a,(hl)
0fab 8e        adc     a,(hl)
0fac 8e        adc     a,(hl)
0fad 0e0e      ld      c,$0e
0faf 0e0e      ld      c,$0e
0fb1 0e0e      ld      c,$0e
0fb3 0e0e      ld      c,$0e
0fb5 8e        adc     a,(hl)
0fb6 8e        adc     a,(hl)
0fb7 8e        adc     a,(hl)
0fb8 8e        adc     a,(hl)
0fb9 8e        adc     a,(hl)
0fba 8e        adc     a,(hl)
0fbb 8e        adc     a,(hl)
0fbc 8e        adc     a,(hl)
0fbd 0e0e      ld      c,$0e
0fbf fefe      cp      $fe
0fc1 04        inc     b
0fc2 08        ex      af,af'
0fc3 f0        ret     p

0fc4 00        nop     
0fc5 00        nop     
0fc6 00        nop     
0fc7 ff        rst     $38
0fc8 ff        rst     $38
0fc9 00        nop     
0fca 00        nop     
0fcb ff        rst     $38
0fcc 00        nop     
0fcd 8e        adc     a,(hl)
0fce 8e        adc     a,(hl)
0fcf 8f        adc     a,a
0fd0 8f        adc     a,a
0fd1 90        sub     b
0fd2 a0        and     b
0fd3 ff        rst     $38
0fd4 00        nop     
0fd5 0e0e      ld      c,$0e
0fd7 fefe      cp      $fe
0fd9 0e0e      ld      c,$0e
0fdb 0e0e      ld      c,$0e
0fdd 00        nop     
0fde 00        nop     
0fdf ff        rst     $38
0fe0 ff        rst     $38
0fe1 00        nop     
0fe2 00        nop     
0fe3 00        nop     
0fe4 00        nop     
0fe5 8e        adc     a,(hl)
0fe6 8e        adc     a,(hl)
0fe7 8f        adc     a,a
0fe8 8f        adc     a,a
0fe9 8e        adc     a,(hl)
0fea 8e        adc     a,(hl)
0feb 8e        adc     a,(hl)
0fec 8e        adc     a,(hl)

0fed cd6d13    call    $136d		HL=(TPA & FF00) - 0800
0ff0 f9        ld      sp,hl		set stack 
0ff1 215914    ld      hl,$1459		copy fname "VCCP   CFG"
0ff4 115d00    ld      de,$005d		to FCB 1
0ff7 011300    ld      bc,$0013
0ffa edb0      ldir    
0ffc 0e19      ld      c,$19		read active drive
0ffe cd0500    call    $0005		call BDOS
1001 c641      add     a,$41
1003 32b91f    ld      ($1fb9),a	save current drive letter ('A')
1006 0e0f      ld      c,$0f
1008 cdf41e    call    $1ef4		open VCCP.CFG
100b b7        or      a
100c 2809      jr      z,$1017
100e 0e0f      ld      c,$0f
1010 cdf41e    call    $1ef4		read VCCP.CFG at $3000
1013 b7        or      a		
1014 c29510    jp      nz,$1095		jump to re-read dir/reload main screen
1017 cd0613    call    $1306		process VCCP.CFG
101a 3a4301    ld      a,($0143)
101d 47        ld      b,a
101e 3a1a01    ld      a,($011a)
1021 4f        ld      c,a
1022 cd6e10    call    $106e
1025 eb        ex      de,hl
1026 0600      ld      b,$00
1028 0c        inc     c
1029 0c        inc     c
102a 210030    ld      hl,$3000
102d cd6710    call    $1067
1030 fe31      cp      $31	'1'
1032 da9510    jp      c,$1095		jump to re-read dir/reload main screen
1035 fe3a      cp      $3a	'9'+1
1037 d29510    jp      nc,$1095		jump to re-read dir/reload main screen
103a 3a4301    ld      a,($0143)
103d d630      sub     $30	'0'
103f 86        add     a,(hl)
1040 321901    ld      ($0119),a
1043 7e        ld      a,(hl)
1044 d630      sub     $30
1046 08        ex      af,af'
1047 23        inc     hl
1048 cd6710    call    $1067
104b 08        ex      af,af'
104c 08        ex      af,af'
104d c5        push    bc
104e d5        push    de
104f 3a1a01    ld      a,($011a)
1052 47        ld      b,a
1053 3e0d      ld      a,$0d
1055 cd8410    call    $1084
1058 2001      jr      nz,$105b
105a 23        inc     hl
105b d1        pop     de
105c c1        pop     bc
105d 08        ex      af,af'
105e eb        ex      de,hl
105f 09        add     hl,bc
1060 eb        ex      de,hl
1061 3d        dec     a
1062 20e8      jr      nz,$104c
1064 c39510    jp      $1095		jump to re-read dir/reload main screen
1067 7e        ld      a,(hl)
1068 fe0d      cp      $0d
106a c0        ret     nz

106b 23        inc     hl
106c 18f9      jr      $1067
106e 215c01    ld      hl,$015c
1071 d5        push    de
1072 c5        push    bc
1073 f5        push    af
1074 5f        ld      e,a
1075 78        ld      a,b
1076 b7        or      a
1077 2807      jr      z,$1080
1079 1c        inc     e
107a 1c        inc     e
107b 1600      ld      d,$00
107d 19        add     hl,de
107e 10fd      djnz    $107d
1080 f1        pop     af
1081 c1        pop     bc
1082 d1        pop     de
1083 c9        ret     

1084 c5        push    bc
1085 4f        ld      c,a
1086 7e        ld      a,(hl)
1087 feff      cp      $ff
1089 2803      jr      z,$108e
108b b9        cp      c
108c 2805      jr      z,$1093
108e 12        ld      (de),a
108f 13        inc     de
1090 23        inc     hl
1091 10f3      djnz    $1086
1093 c1        pop     bc
1094 c9        ret     

				re-read dir/reload main screen

1095 cd380d    call    $0d38	
1098 cd9e10    call    $109e
109b c34c18    jp      $184c

109e 211401    ld      hl,$0114
10a1 cd4c12    call    $124c
10a4 c3d412    jp      $12d4

10a7 cd4c18    call    $184c
10aa cd0017    call    $1700
10ad cde10b    call    $0be1
10b0 af        xor     a
10b1 32490c    ld      ($0c49),a
10b4 cd9e10    call    $109e
10b7 af        xor     a
10b8 329c0e    ld      ($0e9c),a
10bb cd6d13    call    $136d		HL=(TPA & FF00) - 0800
10be f9        ld      sp,hl
10bf 211401    ld      hl,$0114
10c2 af        xor     a
10c3 32a31a    ld      ($1aa3),a
10c6 cdf310    call    $10f3		get main menu option key
10c9 3a5514    ld      a,($1455)	entry selected in jump tabñe	
10cc 214301    ld      hl,$0143		jump table addr
10cf be        cp      (hl)		get number of entries in jump table
10d0 300c      jr      nc,$10de		jump if entry selected out of table
10d2 3c        inc     a
10d3 2b        dec     hl
10d4 23        inc     hl
10d5 23        inc     hl
10d6 3d        dec     a
10d7 20fb      jr      nz,$10d4
10d9 5e        ld      e,(hl)		de=[jump table + entry selected * 2]
10da 23        inc     hl
10db 56        ld      d,(hl)
10dc eb        ex      de,hl
10dd e9        jp      (hl)		jump to process the selected key on main menu

10de 215c01    ld      hl,$015c
10e1 47        ld      b,a
10e2 3a1a01    ld      a,($011a)
10e5 5f        ld      e,a
10e6 1c        inc     e
10e7 1c        inc     e
10e8 1600      ld      d,$00
10ea 19        add     hl,de
10eb 10fd      djnz    $10ea
10ed c3b21a    jp      $1ab2
10f0 00        nop     
10f1 00        nop     
10f2 00        nop     
10f3 af        xor     a
10f4 47        ld      b,a
10f5 32f210    ld      ($10f2),a
10f8 3a5114    ld      a,($1451)
10fb b7        or      a
10fc caaa10    jp      z,$10aa
10ff 78        ld      a,b
1100 325514    ld      ($1455),a	
1103 cd0712    call    $1207
1106 ed53f010  ld      ($10f0),de
110a cd5f12    call    $125f
110d 3a5114    ld      a,($1451)
1110 b7        or      a
1111 caaa10    jp      z,$10aa
1114 cde40c    call    $0ce4		query cursor pos
1117 15        dec     d
1118 cdab0c    call    $0cab		set cursor at XY=reg DE
111b cd7e13    call    $137e		get command key from main menu
111e 0e00      ld      c,$00		main menu entry selected
1120 213c01    ld      hl,$013c		table of keys for main menu
1123 be        cp      (hl)		is <CR>?
1124 281f      jr      z,$1145		yes, jump
1126 0c        inc     c
1127 23        inc     hl
1128 be        cp      (hl)		is space?
1129 282a      jr      z,$1155		yes, jump
112b 23        inc     hl
112c be        cp      (hl)		is -> right cursor key?
112d 2826      jr      z,$1155		yes, jump
112f 0c        inc     c
1130 23        inc     hl
1131 be        cp      (hl)		is <- left cursor key?
1132 2821      jr      z,$1155		yes, jump
1134 0c        inc     c
1135 23        inc     hl
1136 be        cp      (hl)		is up cursor ker?
1137 281c      jr      z,$1155		yes, jump
1139 0c        inc     c
113a 23        inc     hl
113b be        cp      (hl)		is down cursor key?
113c 2817      jr      z,$1155		yes, jump
113e 0c        inc     c
113f fe2c      cp      $2c		is ','
1141 2802      jr      z,$1145		yes, jump
1143 feff      cp      $ff		is $FF?
1145 cad511    jp      z,$11d5		yes, jump to <CR> processing
1148 4f        ld      c,a
1149 3af210    ld      a,($10f2)
114c b7        or      a
114d 79        ld      a,c
114e caaf11    jp      z,$11af
1151 b7        or      a
1152 28c7      jr      z,$111b
1154 c9        ret     

					main menu cursor key pressed
1155 cdd511    call    $11d5
1158 2a5014    ld      hl,($1450)
115b 44        ld      b,h
115c 7c        ld      a,h
115d 3d        dec     a
115e 26ff      ld      h,$ff
1160 24        inc     h
1161 95        sub     l
1162 30fc      jr      nc,$1160
1164 3a5514    ld      a,($1455)	
1167 0d        dec     c
1168 2007      jr      nz,$1171
116a 3c        inc     a
116b b8        cp      b
116c 2031      jr      nz,$119f
116e af        xor     a
116f 182e      jr      $119f
1171 0d        dec     c
1172 200a      jr      nz,$117e
1174 4f        ld      c,a
1175 0d        dec     c
1176 b7        or      a
1177 79        ld      a,c
1178 2025      jr      nz,$119f
117a 78        ld      a,b
117b 3d        dec     a
117c 1821      jr      $119f
117e 0d        dec     c
117f 2013      jr      nz,$1194
1181 95        sub     l
1182 301b      jr      nc,$119f
1184 5c        ld      e,h
1185 cd2712    call    $1227		Delay
1188 05        dec     b
1189 b8        cp      b
118a 3813      jr      c,$119f
118c 2811      jr      z,$119f
118e 1d        dec     e
118f cd2712    call    $1227		Delay
1192 180b      jr      $119f
1194 1c        inc     e
1195 cd2712    call    $1227		Delay
1198 b8        cp      b
1199 3804      jr      c,$119f
119b 1e00      ld      e,$00
119d 18f0      jr      $118f
119f 325514    ld      ($1455),a	
11a2 cd0712    call    $1207
11a5 ed53f010  ld      ($10f0),de
11a9 cd5f12    call    $125f
11ac c30d11    jp      $110d
11af 4f        ld      c,a
11b0 ed5b5214  ld      de,($1452)
11b4 1600      ld      d,$00
11b6 13        inc     de
11b7 13        inc     de
11b8 2a5314    ld      hl,($1453)
11bb 3a5114    ld      a,($1451)
11be 47        ld      b,a
11bf 79        ld      a,c
11c0 4a        ld      c,d
11c1 be        cp      (hl)
11c2 2809      jr      z,$11cd
11c4 19        add     hl,de
11c5 0c        inc     c
11c6 10f9      djnz    $11c1
11c8 3a5514    ld      a,($1455)	
11cb 18d5      jr      $11a2
11cd 79        ld      a,c
11ce 0e06      ld      c,$06
11d0 cdd511    call    $11d5
11d3 18ca      jr      $119f

					main menu option selected
					entry: A=key pressed

11d5 f5        push    af
11d6 c5        push    bc
11d7 2af010    ld      hl,($10f0)	
11da eb        ex      de,hl
11db d5        push    de
11dc cd2712    call    $1227		delay
11df 4f        ld      c,a
11e0 210030    ld      hl,$3000		scan VCCP.CFG
11e3 46        ld      b,(hl)
11e4 78        ld      a,b
11e5 b7        or      a
11e6 79        ld      a,c
11e7 2806      jr      z,$11ef
11e9 23        inc     hl
11ea be        cp      (hl)
11eb 2803      jr      z,$11f0
11ed 10fa      djnz    $11e9
11ef 04        inc     b
11f0 d1        pop     de
11f1 2811      jr      z,$1204
11f3 3a490c    ld      a,($0c49)
11f6 2806      jr      z,$11fe
11f8 c1        pop     bc
11f9 c5        push    bc
11fa 79        ld      a,c
11fb b7        or      a
11fc 2806      jr      z,$1204
11fe cdc412    call    $12c4
1201 cd6b12    call    $126b
1204 c1        pop     bc
1205 f1        pop     af
1206 c9        ret     

1207 c5        push    bc
1208 110000    ld      de,$0000
120b 4f        ld      c,a
120c 3a5014    ld      a,($1450)
120f 47        ld      b,a
1210 79        ld      a,c
1211 b8        cp      b
1212 3804      jr      c,$1218
1214 1c        inc     e
1215 90        sub     b
1216 18f9      jr      $1211
1218 b7        or      a
1219 280a      jr      z,$1225
121b 47        ld      b,a
121c 3a5214    ld      a,($1452)
121f 4f        ld      c,a
1220 af        xor     a
1221 81        add     a,c
1222 10fd      djnz    $1221
1224 57        ld      d,a
1225 c1        pop     bc
1226 c9        ret     

				Delay

1227 e5        push    hl
1228 d5        push    de
1229 c5        push    bc
122a 3a5014    ld      a,($1450)
122d 67        ld      h,a
122e 3a5214    ld      a,($1452)
1231 6f        ld      l,a
1232 0e00      ld      c,$00
1234 7b        ld      a,e
1235 b7        or      a
1236 2806      jr      z,$123e
1238 af        xor     a
1239 84        add     a,h
123a 1d        dec     e
123b 20fc      jr      nz,$1239
123d 4f        ld      c,a
123e 7a        ld      a,d
123f b7        or      a
1240 2805      jr      z,$1247
1242 3d        dec     a
1243 0c        inc     c
1244 95        sub     l
1245 30fc      jr      nc,$1243
1247 79        ld      a,c
1248 c1        pop     bc
1249 d1        pop     de
124a e1        pop     hl
124b c9        ret     

124c e5        push    hl
124d 010400    ld      bc,$0004		copy [HL..HL+3] to [0138]
1250 113801    ld      de,$0138
1253 edb0      ldir    
1255 e1        pop     hl		
1256 010900    ld      bc,$0009		copy [HL..HL+8] to [144c]
1259 114c14    ld      de,$144c
125c edb0      ldir    
125e c9        ret     

125f cdc412    call    $12c4
1262 cd9e0c    call    $0c9e
1265 cd6b12    call    $126b
1268 c3a40c    jp      $0ca4
126b d5        push    de
126c 3a5514    ld      a,($1455)	get the key typed by user
126f 47        ld      b,a
1270 3a5214    ld      a,($1452)
1273 2a5314    ld      hl,($1453)
1276 cd7110    call    $1071
1279 47        ld      b,a
127a cd8612    call    $1286
127d af        xor     a
127e be        cp      (hl)
127f c49512    call    nz,$1295		print string in [HL] in bottom console line
1282 23        inc     hl
1283 23        inc     hl
1284 d1        pop     de
1285 c9        ret     

1286 4e        ld      c,(hl)
1287 c5        push    bc
1288 e5        push    hl
1289 d5        push    de
128a cd220c    call    $0c22	call BIOS console output
128d d1        pop     de
128e e1        pop     hl
128f c1        pop     bc
1290 23        inc     hl
1291 10f3      djnz    $1286
1293 c9        ret     

1294 00        nop     
1295 af        xor     a

					print string in [HL] in bottom console line
					
1296 329412    ld      ($1294),a	
1299 e5        push    hl
129a 111700    ld      de,$0017
129d cdab0c    call    $0cab		set cursor at XY=reg DE (X=0, Y=23)
12a0 cd790c    call    $0c79		Clear from cursor pos to end of screen
12a3 e1        pop     hl
12a4 3a9412    ld      a,($1294)
12a7 e5        push    hl
12a8 b7        or      a
12a9 2007      jr      nz,$12b2
12ab e1        pop     hl
12ac 5e        ld      e,(hl)
12ad 23        inc     hl
12ae 56        ld      d,(hl)
12af 2b        dec     hl
12b0 eb        ex      de,hl
12b1 d5        push    de
12b2 cd2c0d    call    $0d2c		print zero-terminated string at [HL]
12b5 e1        pop     hl
12b6 3a9412    ld      a,($1294)
12b9 b7        or      a
12ba c0        ret     nz

12bb 11174f    ld      de,$4f17
12be c3ab0c    jp      $0cab	set cursor at XY=reg DE
12c1 110000    ld      de,$0000
12c4 d5        push    de
12c5 e5        push    hl
12c6 2a4c14    ld      hl,($144c)
12c9 7c        ld      a,h
12ca 65        ld      h,l
12cb 6f        ld      l,a
12cc 19        add     hl,de
12cd eb        ex      de,hl
12ce cdab0c    call    $0cab	set cursor at XY=reg DE
12d1 e1        pop     hl
12d2 d1        pop     de
12d3 c9        ret     

12d4 af        xor     a
12d5 1600      ld      d,$00
12d7 5f        ld      e,a
12d8 ed4b5014  ld      bc,($1450)
12dc 78        ld      a,b
12dd b7        or      a
12de c8        ret     z

12df 2a5314    ld      hl,($1453)
12e2 c5        push    bc
12e3 cdc412    call    $12c4
12e6 3a5214    ld      a,($1452)
12e9 47        ld      b,a
12ea f5        push    af
12eb cd8612    call    $1286
12ee 23        inc     hl
12ef 23        inc     hl
12f0 f1        pop     af
12f1 82        add     a,d
12f2 57        ld      d,a
12f3 c1        pop     bc
12f4 0d        dec     c
12f5 2007      jr      nz,$12fe
12f7 3a5014    ld      a,($1450)
12fa 4f        ld      c,a
12fb 1600      ld      d,$00
12fd 1c        inc     e
12fe 10e2      djnz    $12e2
1300 110000    ld      de,$0000
1303 c3ab0c    jp      $0cab	set cursor at XY=reg DE

1306 0632      ld      b,$32
1308 110030    ld      de,$3000
130b d5        push    de
130c c5        push    bc
130d 0e1a      ld      c,$1a		Set DMA Address DE=$3000
130f cd0500    call    $0005		call BDOS
1312 0e14      ld      c,$14
1314 cdf41e    call    $1ef4
1317 c1        pop     bc
1318 e1        pop     hl
1319 b7        or      a
131a 2007      jr      nz,$1323
131c 118000    ld      de,$0080
131f 19        add     hl,de
1320 eb        ex      de,hl
1321 10e8      djnz    $130b
1323 3e32      ld      a,$32
1325 b8        cp      b
1326 ca9510    jp      z,$1095
1329 21ff2f    ld      hl,$2fff
132c 77        ld      (hl),a
132d 010010    ld      bc,$1000
1330 23        inc     hl
1331 54        ld      d,h
1332 5d        ld      e,l
1333 7e        ld      a,(hl)
1334 fe09      cp      $09
1336 2823      jr      z,$135b
1338 fe20      cp      $20
133a 281f      jr      z,$135b
133c fe0a      cp      $0a
133e 281b      jr      z,$135b
1340 fe0d      cp      $0d
1342 280e      jr      z,$1352
1344 fe3b      cp      $3b
1346 2011      jr      nz,$1359
1348 cd6813    call    $1368
134b 2813      jr      z,$1360
134d 7e        ld      a,(hl)
134e fe0d      cp      $0d
1350 20f6      jr      nz,$1348
1352 1b        dec     de
1353 eb        ex      de,hl
1354 be        cp      (hl)
1355 eb        ex      de,hl
1356 2801      jr      z,$1359
1358 13        inc     de
1359 12        ld      (de),a
135a 13        inc     de
135b cd6813    call    $1368
135e 20d3      jr      nz,$1333
1360 118000    ld      de,$0080
1363 0e1a      ld      c,$1a
1365 c30500    jp      $0005
1368 23        inc     hl
1369 0b        dec     bc
136a 78        ld      a,b
136b b1        or      c
136c c9        ret     

136d 2a0600    ld      hl,($0006)	HL=BDOS entry=end of TPA
1370 7c        ld      a,h
1371 d608      sub     $08
1373 67        ld      h,a
1374 2e00      ld      l,$00
1376 c9        ret     			HL=(TPA & FF00) - 0800

1377 cd6d13    call    $136d		HL=(TPA & FF00) - 0800
137a 23        inc     hl
137b 23        inc     hl
137c 23        inc     hl
137d c9        ret     

					get command key from main menu

137e cd1f0c    call    $0c1f		get a command key 
1381 fe61      cp      $61		'a'
1383 d8        ret     c		return if char < 'a'
1384 fe7b      cp      $7b		'z'+1
1386 d0        ret     nc		return if char >= 'z'+1
1387 d620      sub     $20		convert to uppercase
1389 c9        ret     

138a 00        nop     
138b 00        nop     
138c 203e      jr      nz,$13cc
138e 2021      jr      nz,$13b1
1390 5c        ld      e,h
1391 00        nop     
1392 0624      ld      b,$24
1394 3600      ld      (hl),$00
1396 23        inc     hl
1397 10fb      djnz    $1394
1399 215d00    ld      hl,$005d
139c 228a13    ld      ($138a),hl
139f 328c13    ld      ($138c),a
13a2 060b      ld      b,$0b
13a4 e5        push    hl
13a5 eb        ex      de,hl
13a6 cd1914    call    $1419
13a9 d1        pop     de
13aa 060c      ld      b,$0c
13ac 7e        ld      a,(hl)
13ad fe2a      cp      $2a
13af 280a      jr      z,$13bb
13b1 fe2e      cp      $2e
13b3 280f      jr      z,$13c4
13b5 cd1e14    call    $141e
13b8 10f2      djnz    $13ac
13ba c9        ret     

13bb 23        inc     hl
13bc 7e        ld      a,(hl)
13bd fe2e      cp      $2e
13bf 2803      jr      z,$13c4
13c1 10f8      djnz    $13bb
13c3 c9        ret     

13c4 05        dec     b
13c5 c8        ret     z

13c6 78        ld      a,b
13c7 0e03      ld      c,$03
13c9 b9        cp      c
13ca 3001      jr      nc,$13cd
13cc 48        ld      c,b
13cd 0603      ld      b,$03
13cf 23        inc     hl
13d0 e5        push    hl
13d1 110800    ld      de,$0008
13d4 2a8a13    ld      hl,($138a)
13d7 19        add     hl,de
13d8 eb        ex      de,hl
13d9 e1        pop     hl
13da d5        push    de
13db 3a8c13    ld      a,($138c)
13de cd1914    call    $1419
13e1 d1        pop     de
13e2 41        ld      b,c
13e3 7e        ld      a,(hl)
13e4 fe2a      cp      $2a
13e6 c8        ret     z

13e7 cd1e14    call    $141e
13ea 10f7      djnz    $13e3
13ec c9        ret     

13ed 7e        ld      a,(hl)
13ee 3a5214    ld      a,($1452)
13f1 4f        ld      c,a
13f2 0608      ld      b,$08
13f4 cd1e14    call    $141e
13f7 fe20      cp      $20
13f9 2007      jr      nz,$1402
13fb cd3e14    call    $143e
13fe 2002      jr      nz,$1402
1400 0c        inc     c
1401 1b        dec     de
1402 10f0      djnz    $13f4
1404 0d        dec     c
1405 3e2e      ld      a,$2e
1407 12        ld      (de),a
1408 13        inc     de
1409 0603      ld      b,$03
140b cd2714    call    $1427
140e 2806      jr      z,$1416
1410 41        ld      b,c
1411 3e20      ld      a,$20
1413 cd1914    call    $1419
1416 0602      ld      b,$02
1418 af        xor     a
1419 12        ld      (de),a
141a 13        inc     de
141b 10fc      djnz    $1419
141d c9        ret     

141e c5        push    bc		
141f 0601      ld      b,$01
1421 cd2714    call    $1427
1424 c1        pop     bc
1425 0d        dec     c
1426 c9        ret     

1427 7e        ld      a,(hl)
1428 fe2e      cp      $2e
142a c8        ret     z
142b cbbf      res     7,a
142d fe61      cp      $61	'a'
142f 3806      jr      c,$1437
1431 fe7b      cp      $7b	'{'
1433 3002      jr      nc,$1437
1435 d620      sub     $20
1437 12        ld      (de),a
1438 23        inc     hl
1439 13        inc     de
143a 0d        dec     c
143b 10ea      djnz    $1427
143d c9        ret     

143e e5        push    hl
143f d5        push    de
1440 c5        push    bc
1441 2b        dec     hl
1442 be        cp      (hl)
1443 2003      jr      nz,$1448
1445 23        inc     hl
1446 10fa      djnz    $1442
1448 c1        pop     bc
1449 d1        pop     de
144a e1        pop     hl
144b c9        ret     

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
1456 ff        rst     $38
1457 ff        rst     $38
1458 00        nop     
1459 56        ld      d,(hl)
145a 43        ld      b,e
145b 43        ld      b,e
145c 50        ld      d,b
145d 2020      jr      nz,$147f
145f 2020      jr      nz,$1481
1461 43        ld      b,e
1462 46        ld      b,(hl)
1463 47        ld      b,a
1464 00        nop     
1465 00        nop     
1466 00        nop     
1467 00        nop     
1468 00        nop     
1469 00        nop     
146a 00        nop     
146b 00        nop     

					<CR> processing on main menu
					
146c 3e70      ld      a,$70		
146e 32a31a    ld      ($1aa3),a
1471 cd9115    call    $1591
1474 0e14      ld      c,$14
1476 cdf41e    call    $1ef4
1479 b7        or      a
147a c24b15    jp      nz,$154b
147d 3ad615    ld      a,($15d6)
1480 b7        or      a
1481 2012      jr      nz,$1495
1483 218000    ld      hl,$0080
1486 1181a0    ld      de,$a081
1489 018000    ld      bc,$0080
148c edb0      ldir    
148e 3e01      ld      a,$01
1490 32d615    ld      ($15d6),a
1493 18df      jr      $1474
1495 3ad715    ld      a,($15d7)
1498 b7        or      a
1499 2050      jr      nz,$14eb
149b cdb715    call    $15b7
149e 2181a0    ld      hl,$a081
14a1 ed53dc15  ld      ($15dc),de
14a5 cdab0c    call    $0cab	set cursor at XY=reg DE
14a8 7e        ld      a,(hl)
14a9 fe1a      cp      $1a
14ab ca3815    jp      z,$1538
14ae fe09      cp      $09
14b0 ca6d15    jp      z,$156d
14b3 cd6415    call    $1564
14b6 ed5bdc15  ld      de,($15dc)
14ba fe0d      cp      $0d
14bc 2005      jr      nz,$14c3
14be cd0515    call    $1505
14c1 180f      jr      $14d2
14c3 fe0a      cp      $0a
14c5 2005      jr      nz,$14cc
14c7 cdfd14    call    $14fd
14ca 1806      jr      $14d2
14cc cd5515    call    $1555
14cf cdf514    call    $14f5
14d2 23        inc     hl
14d3 e5        push    hl
14d4 0181a0    ld      bc,$a081
14d7 b7        or      a
14d8 ed42      sbc     hl,bc
14da 7d        ld      a,l
14db fe80      cp      $80
14dd e1        pop     hl
14de 20c1      jr      nz,$14a1
14e0 ed53dc15  ld      ($15dc),de
14e4 3e01      ld      a,$01
14e6 32d715    ld      ($15d7),a
14e9 1898      jr      $1483
14eb af        xor     a
14ec 32d715    ld      ($15d7),a
14ef ed5bdc15  ld      de,($15dc)
14f3 18a9      jr      $149e
14f5 14        inc     d
14f6 3ada15    ld      a,($15da)
14f9 ba        cp      d
14fa 2812      jr      z,$150e
14fc c9        ret     

14fd 1c        inc     e
14fe 3adb15    ld      a,($15db)
1501 bb        cp      e
1502 2810      jr      z,$1514
1504 c9        ret     

1505 3ad915    ld      a,($15d9)
1508 57        ld      d,a
1509 af        xor     a
150a 32d815    ld      ($15d8),a
150d c9        ret     

150e 3ad915    ld      a,($15d9)
1511 57        ld      d,a
1512 18e9      jr      $14fd
1514 22de15    ld      ($15de),hl
1517 21e015    ld      hl,$15e0         string "Press return or space for next page:"
151a 3e01      ld      a,$01
151c cd9612    call    $1296		print string in [HL] in bottom console line
151f 3e01      ld      a,$01
1521 cd1f0c    call    $0c1f		get a command key
1524 fe0d      cp      $0d
1526 2809      jr      z,$1531
1528 fe2c      cp      $2c
152a 2805      jr      z,$1531
152c fe20      cp      $20
152e c2a710    jp      nz,$10a7
1531 cdb715    call    $15b7
1534 2ade15    ld      hl,($15de)
1537 c9        ret     

1538 210516    ld      hl,$1605		string "press any key to quit:·
153b 3e01      ld      a,$01
153d cd9612    call    $1296		print string in [HL] in bottom console line
1540 3e01      ld      a,$01
1542 cd1c0c    call    $0c1c
1545 b7        or      a
1546 28fa      jr      z,$1542
1548 c3a710    jp      $10a7
154b 3ad615    ld      a,($15d6)
154e b7        or      a
154f caa710    jp      z,$10a7
1552 c39514    jp      $1495
1555 3ad815    ld      a,($15d8)
1558 3c        inc     a
1559 fe08      cp      $08
155b 2804      jr      z,$1561
155d 32d815    ld      ($15d8),a
1560 c9        ret     

1561 af        xor     a
1562 18f9      jr      $155d
1564 4f        ld      c,a
1565 e5        push    hl
1566 f5        push    af
1567 cd220c    call    $0c22	call BIOS console output
156a f1        pop     af
156b e1        pop     hl
156c c9        ret     

156d 3ad815    ld      a,($15d8)
1570 d608      sub     $08
1572 2f        cpl     
1573 3c        inc     a
1574 47        ld      b,a
1575 3e20      ld      a,$20
1577 ed53dc15  ld      ($15dc),de
157b cdab0c    call    $0cab	set cursor at XY=reg DE
157e cd6415    call    $1564
1581 ed5bdc15  ld      de,($15dc)
1585 cdf514    call    $14f5
1588 10eb      djnz    $1575
158a af        xor     a
158b 32d815    ld      ($15d8),a
158e c3d214    jp      $14d2

1591 af        xor     a		
1592 32d615    ld      ($15d6),a
1595 32d715    ld      ($15d7),a
1598 32d815    ld      ($15d8),a
159b cdc216    call    $16c2
159e eb        ex      de,hl
159f 3e20      ld      a,$20
15a1 cd8f13    call    $138f
15a4 0e0f      ld      c,$0f
15a6 cdf41e    call    $1ef4
15a9 feff      cp      $ff
15ab c0        ret     nz

15ac 0e0f      ld      c,$0f
15ae cdf41e    call    $1ef4
15b1 feff      cp      $ff
15b3 caa710    jp      z,$10a7
15b6 c9        ret     

15b7 2a1d01    ld      hl,($011d)
15ba 223801    ld      ($0138),hl
15bd 55        ld      d,l
15be 5c        ld      e,h
15bf 2a1f01    ld      hl,($011f)
15c2 223a01    ld      ($013a),hl
15c5 7b        ld      a,e
15c6 32d915    ld      ($15d9),a
15c9 85        add     a,l
15ca 32da15    ld      ($15da),a
15cd 7a        ld      a,d
15ce 84        add     a,h
15cf 32db15    ld      ($15db),a
15d2 cd7a0d    call    $0d7a
15d5 c9        ret     

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
15e0 50        ld      d,b
15e1 72        ld      (hl),d
15e2 65        ld      h,l
15e3 73        ld      (hl),e
15e4 73        ld      (hl),e
15e5 2072      jr      nz,$1659
15e7 65        ld      h,l
15e8 74        ld      (hl),h
15e9 75        ld      (hl),l
15ea 72        ld      (hl),d
15eb 6e        ld      l,(hl)
15ec 206f      jr      nz,$165d
15ee 72        ld      (hl),d
15ef 2073      jr      nz,$1664
15f1 70        ld      (hl),b
15f2 61        ld      h,c
15f3 63        ld      h,e
15f4 65        ld      h,l
15f5 2066      jr      nz,$165d
15f7 6f        ld      l,a
15f8 72        ld      (hl),d
15f9 206e      jr      nz,$1669
15fb 65        ld      h,l
15fc 78        ld      a,b
15fd 74        ld      (hl),h
15fe 2070      jr      nz,$1670
1600 61        ld      h,c
1601 67        ld      h,a
1602 65        ld      h,l
1603 3a0050    ld      a,($5000)
1606 72        ld      (hl),d
1607 65        ld      h,l
1608 73        ld      (hl),e
1609 73        ld      (hl),e
160a 2061      jr      nz,$166d
160c 6e        ld      l,(hl)
160d 79        ld      a,c
160e 206b      jr      nz,$167b
1610 65        ld      h,l
1611 79        ld      a,c
1612 2074      jr      nz,$1688
1614 6f        ld      l,a
1615 2071      jr      nz,$1688
1617 75        ld      (hl),l
1618 69        ld      l,c
1619 74        ld      (hl),h
161a 3a003e    ld      a,($3e00)
161d 80        add     a,b
161e 32a31a    ld      ($1aa3),a
1621 cd9115    call    $1591
1624 cd430c    call    $0c43
1627 b7        or      a
1628 caa710    jp      z,$10a7
162b 21ab16    ld      hl,$16ab		string "Press any key to quit:"
162e 3e01      ld      a,$01
1630 cd9612    call    $1296		print string in [HL] in bottom console line
1633 0e14      ld      c,$14
1635 cdf41e    call    $1ef4
1638 b7        or      a
1639 c2a710    jp      nz,$10a7
163c 0680      ld      b,$80
163e 218000    ld      hl,$0080
1641 7e        ld      a,(hl)
1642 fe1a      cp      $1a
1644 285d      jr      z,$16a3
1646 fe09      cp      $09
1648 2842      jr      z,$168c
164a 4f        ld      c,a
164b f5        push    af
164c cd250c    call    $0c25
164f f1        pop     af
1650 fe0d      cp      $0d
1652 280e      jr      z,$1662
1654 fe0a      cp      $0a
1656 280a      jr      z,$1662
1658 cd5515    call    $1555
165b 180b      jr      $1668
165d 23        inc     hl
165e 10e1      djnz    $1641
1660 18d1      jr      $1633
1662 af        xor     a
1663 32d815    ld      ($15d8),a
1666 18f5      jr      $165d
1668 e5        push    hl
1669 cd1c0c    call    $0c1c
166c e1        pop     hl
166d b7        or      a
166e 28ed      jr      z,$165d
1670 e5        push    hl
1671 cd7e13    call    $137e		get command key from main menu
1674 e1        pop     hl
1675 fe13      cp      $13
1677 c2a710    jp      nz,$10a7
167a e5        push    hl
167b cd1c0c    call    $0c1c
167e b7        or      a
167f 28fa      jr      z,$167b
1681 cd7e13    call    $137e		get command key from main menu
1684 e1        pop     hl
1685 fe13      cp      $13
1687 28d4      jr      z,$165d
1689 c3a710    jp      $10a7
168c c5        push    bc
168d 3ad815    ld      a,($15d8)
1690 d608      sub     $08
1692 2f        cpl     
1693 3c        inc     a
1694 47        ld      b,a
1695 0e20      ld      c,$20
1697 cd250c    call    $0c25
169a 10f9      djnz    $1695
169c c1        pop     bc
169d af        xor     a
169e 32d815    ld      ($15d8),a
16a1 18ba      jr      $165d
16a3 0e0f      ld      c,$0f
16a5 cd250c    call    $0c25
16a8 c3a710    jp      $10a7
16ab 50        ld      d,b
16ac 72        ld      (hl),d
16ad 65        ld      h,l
16ae 73        ld      (hl),e
16af 73        ld      (hl),e
16b0 2061      jr      nz,$1713
16b2 6e        ld      l,(hl)
16b3 79        ld      a,c
16b4 206b      jr      nz,$1721
16b6 65        ld      h,l
16b7 79        ld      a,c
16b8 2074      jr      nz,$172e
16ba 6f        ld      l,a
16bb 2071      jr      nz,$172e
16bd 75        ld      (hl),l
16be 69        ld      l,c
16bf 74        ld      (hl),h
16c0 3a00

16c2 af        xor     a		
16c3 325514    ld      ($1455),a
16c6 3c        inc     a
16c7 21691b    ld      hl,$1b69		string "^D=Help, ^C=Commands, Space=Next file, Return=select and Execute "
16ca cd9612    call    $1296		print string in [HL] in bottom console line
16cd cde816    call    $16e8		???
16d0 cd9719    call    $1997		???
16d3 3a5514    ld      a,($1455)
16d6 47        ld      b,a
16d7 af        xor     a
16d8 cdf510    call    $10f5
16db 218180    ld      hl,$8081
16de 3a5514    ld      a,($1455)
16e1 47        ld      b,a
16e2 3a2301    ld      a,($0123)
16e5 c37110    jp      $1071

16e8 211d01    ld      hl,$011d		
16eb cd4c12    call    $124c
16ee c39719    jp      $1997

16f1 218030    ld      hl,$3080
16f4 b7        or      a
16f5 c8        ret     z

16f6 d5        push    de
16f7 110c00    ld      de,$000c
16fa 19        add     hl,de
16fb 3d        dec     a
16fc 20fc      jr      nz,$16fa
16fe d1        pop     de
16ff c9        ret     

1700 af        xor     a
1701 320030    ld      ($3000),a
1704 218030    ld      hl,$3080
1707 223f18    ld      ($183f),hl
170a c9        ret     

170b 00        nop     
170c cde816    call    $16e8
170f cd9719    call    $1997
1712 cd0017    call    $1700
1715 3c        inc     a
1716 32490c    ld      ($0c49),a
1719 320b17    ld      ($170b),a
171c af        xor     a
171d 47        ld      b,a
171e af        xor     a
171f cdf510    call    $10f5
1722 feff      cp      $ff
1724 283d      jr      z,$1763
1726 79        ld      a,c
1727 b7        or      a
1728 320b17    ld      ($170b),a
172b 2803      jr      z,$1730
172d fe05      cp      $05
172f c0        ret     nz

1730 210030    ld      hl,$3000
1733 46        ld      b,(hl)
1734 78        ld      a,b
1735 b7        or      a
1736 3a5514    ld      a,($1455)
1739 23        inc     hl
173a 2806      jr      z,$1742
173c be        cp      (hl)
173d 23        inc     hl
173e 2819      jr      z,$1759
1740 10fa      djnz    $173c
1742 77        ld      (hl),a
1743 210030    ld      hl,$3000
1746 34        inc     (hl)
1747 cddb16    call    $16db
174a ed5b3f18  ld      de,($183f)
174e 060c      ld      b,$0c
1750 3eff      ld      a,$ff
1752 cd8410    call    $1084
1755 eb        ex      de,hl
1756 223f18    ld      ($183f),hl
1759 3a0b17    ld      a,($170b)
175c b7        or      a
175d c8        ret     z

175e 3a5514    ld      a,($1455)
1761 18ba      jr      $171d
1763 cd5218    call    $1852
1766 18a4      jr      $170c
1768 3ea0      ld      a,$a0
176a 32a31a    ld      ($1aa3),a
176d 3e01      ld      a,$01
176f 218817    ld      hl,$1788		string "Quit VCCP (Y=yes)?"
1772 cd9612    call    $1296		print string in [HL] in bottom console line
1775 cd281e    call    $1e28
1778 3e59      ld      a,$59
177a be        cp      (hl)
177b c2a710    jp      nz,$10a7
177e af        xor     a
177f 320300    ld      ($0003),a
1782 cde10b    call    $0be1
1785 c3190c    jp      $0c19
1788 51        ld      d,c
1789 75        ld      (hl),l
178a 69        ld      l,c
178b 74        ld      (hl),h
178c 2056      jr      nz,$17e4
178e 43        ld      b,e
178f 43        ld      b,e
1790 50        ld      d,b
1791 2028      jr      nz,$17bb
1793 59        ld      e,c
1794 3d        dec     a
1795 79        ld      a,c
1796 65        ld      h,l
1797 73        ld      (hl),e
1798 29        add     hl,hl
1799 3f        ccf     
179a 2000      jr      nz,$179c
179c 3e90      ld      a,$90
179e 32a31a    ld      ($1aa3),a
17a1 21ea17    ld      hl,$17ea		string "Enter file name "
17a4 3e01      ld      a,$01
17a6 cd9612    call    $1296		print string in [HL] in bottom console line
17a9 af        xor     a
17aa cd281e    call    $1e28
17ad cdfb17    call    $17fb
17b0 eb        ex      de,hl
17b1 cd8d13    call    $138d
17b4 cd0c18    call    $180c
17b7 2824      jr      z,$17dd
17b9 cd3318    call    $1833
17bc 0e13      ld      c,$13
17be cdf41e    call    $1ef4
17c1 cd2718    call    $1827
17c4 215d00    ld      hl,$005d
17c7 116d00    ld      de,$006d
17ca 010800    ld      bc,$0008
17cd edb0      ldir    
17cf 0e17      ld      c,$17
17d1 217500    ld      hl,$0075
17d4 cd3618    call    $1836
17d7 cdf41e    call    $1ef4
17da cd2718    call    $1827
17dd 0e16      ld      c,$16
17df cdf41e    call    $1ef4
17e2 feff      cp      $ff
17e4 cab81c    jp      z,$1cb8
17e7 c3a710    jp      $10a7
17ea 45        ld      b,l
17eb 6e        ld      l,(hl)
17ec 74        ld      (hl),h
17ed 65        ld      h,l
17ee 72        ld      (hl),d
17ef 2066      jr      nz,$1857
17f1 69        ld      l,c
17f2 6c        ld      l,h
17f3 65        ld      h,l
17f4 206e      jr      nz,$1864
17f6 61        ld      h,c
17f7 6d        ld      l,l
17f8 65        ld      h,l
17f9 2000      jr      nz,$17fb
17fb e5        push    hl
17fc c5        push    bc
17fd f5        push    af
17fe 47        ld      b,a
17ff 3e2a      ld      a,$2a
1801 be        cp      (hl)
1802 cab81c    jp      z,$1cb8
1805 23        inc     hl
1806 10f9      djnz    $1801
1808 f1        pop     af
1809 c1        pop     bc
180a e1        pop     hl
180b c9        ret     

180c 215c00    ld      hl,$005c
180f 1101a1    ld      de,$a101
1812 012400    ld      bc,$0024
1815 c5        push    bc
1816 d5        push    de
1817 e5        push    hl
1818 edb0      ldir    
181a 0e11      ld      c,$11
181c cd591f    call    $1f59
181f e1        pop     hl
1820 d1        pop     de
1821 c1        pop     bc
1822 feff      cp      $ff
1824 edb0      ldir    
1826 c9        ret     

1827 012400    ld      bc,$0024
182a 2101a1    ld      hl,$a101
182d 115c00    ld      de,$005c
1830 edb0      ldir    
1832 c9        ret     

1833 216500    ld      hl,$0065
1836 3642      ld      (hl),$42
1838 23        inc     hl
1839 3641      ld      (hl),$41
183b 23        inc     hl
183c 364b      ld      (hl),$4b
183e c9        ret     

183f 00        nop     
1840 00        nop     
1841 3e10      ld      a,$10
1843 32a31a    ld      ($1aa3),a
1846 cd1319    call    $1913
1849 cda819    call    $19a8
184c cd5218    call    $1852		rebuild screen
184f c3aa10    jp      $10aa

1852 af        xor     a
1853 322201    ld      ($0122),a
1856 218180    ld      hl,$8081
1859 223f18    ld      ($183f),hl
185c cd650d    call    $0d65		clear scren
185f cde816    call    $16e8
1862 cdc112    call    $12c1
1865 21a71f    ld      hl,$1fa7 string "            Drive=A:   User=0   Search string=*.*              "
1868 cd2c0d    call    $0d2c	print zero-terminated string at [HL]
186b cd9719    call    $1997
186e cdc112    call    $12c1
1871 af        xor     a
1872 322201    ld      ($0122),a
1875 cd9918    call    $1899
1878 c3d412    jp      $12d4
187b c5        push    bc
187c d5        push    de
187d 3e20      ld      a,$20
187f cd1914    call    $1419
1882 d1        pop     de
1883 c1        pop     bc
1884 7e        ld      a,(hl)
1885 fe2e      cp      $2e
1887 c8        ret     z

1888 fe2a      cp      $2a
188a 2806      jr      z,$1892
188c 12        ld      (de),a
188d 13        inc     de
188e 23        inc     hl
188f 10f3      djnz    $1884
1891 c9        ret     

1892 3e3f      ld      a,$3f
1894 12        ld      (de),a
1895 13        inc     de
1896 10fa      djnz    $1892
1898 c9        ret     

1899 118030    ld      de,$3080
189c d5        push    de
189d 0614      ld      b,$14
189f 3e20      ld      a,$20
18a1 cd1914    call    $1419
18a4 d1        pop     de
18a5 21d51f    ld      hl,$1fd5
18a8 0608      ld      b,$08
18aa cd7b18    call    $187b
18ad 060c      ld      b,$0c
18af 21d51f    ld      hl,$1fd5
18b2 3e2e      ld      a,$2e
18b4 be        cp      (hl)
18b5 23        inc     hl
18b6 2804      jr      z,$18bc
18b8 10f8      djnz    $18b2
18ba 180a      jr      $18c6
18bc 118830    ld      de,$3088
18bf 3e2e      ld      a,$2e
18c1 12        ld      (de),a
18c2 13        inc     de
18c3 cd7b18    call    $187b
18c6 118030    ld      de,$3080
18c9 3e20      ld      a,$20
18cb cd8f13    call    $138f
18ce 0e11      ld      c,$11
18d0 cd591f    call    $1f59
18d3 feff      cp      $ff
18d5 c8        ret     z

18d6 cded18    call    $18ed
18d9 0640      ld      b,$40
18db c5        push    bc
18dc 0e12      ld      c,$12
18de cd591f    call    $1f59
18e1 c1        pop     bc
18e2 feff      cp      $ff
18e4 c8        ret     z

18e5 c5        push    bc
18e6 cded18    call    $18ed
18e9 c1        pop     bc
18ea 10ef      djnz    $18db
18ec c9        ret     

18ed 212201    ld      hl,$0122
18f0 34        inc     (hl)
18f1 4e        ld      c,(hl)
18f2 215114    ld      hl,$1451
18f5 71        ld      (hl),c
18f6 07        rlca    
18f7 07        rlca    
18f8 07        rlca    
18f9 07        rlca    
18fa 07        rlca    
18fb c680      add     a,$80
18fd 6f        ld      l,a
18fe 2600      ld      h,$00
1900 23        inc     hl
1901 ed5b3f18  ld      de,($183f)
1905 cded13    call    $13ed
1908 ed533f18  ld      ($183f),de
190c c9        ret     

190d cd1319    call    $1913
1910 c34c18    jp      $184c
1913 3eb0      ld      a,$b0
1915 32a31a    ld      ($1aa3),a
1918 212601    ld      hl,$0126
191b e5        push    hl
191c cd231d    call    $1d23
191f e1        pop     hl
1920 cd4c12    call    $124c
1923 217b19    ld      hl,$197b
1926 af        xor     a
1927 cd571d    call    $1d57
192a cd9719    call    $1997
192d cdc112    call    $12c1
1930 cdd412    call    $12d4
1933 3ab91f    ld      a,($1fb9)	1fb9=current drive letter ('A')
1936 d641      sub     $41
1938 47        ld      b,a
1939 af        xor     a
193a cdf510    call    $10f5
193d 0e30      ld      c,$30
193f cdf41e    call    $1ef4
1942 0e18      ld      c,$18
1944 cd0500    call    $0005
1947 eb        ex      de,hl
1948 0e25      ld      c,$25
194a cd0500    call    $0005
194d 3a5514    ld      a,($1455)
1950 4f        ld      c,a
1951 cd310c    call    $0c31
1954 7c        ld      a,h
1955 b5        or      l
1956 281a      jr      z,$1972
1958 3a5514    ld      a,($1455)
195b 5f        ld      e,a
195c 210400    ld      hl,$0004
195f e60f      and     $0f
1961 4f        ld      c,a
1962 7e        ld      a,(hl)
1963 e6f0      and     $f0
1965 b1        or      c
1966 77        ld      (hl),a
1967 7b        ld      a,e
1968 c641      add     a,$41
196a 32b91f    ld      ($1fb9),a	1fb9=current drive letter ('A')
196d 0e0e      ld      c,$0e
196f cdf71e    call    $1ef7
1972 212601    ld      hl,$0126
1975 cd4c12    call    $124c
1978 c3451d    jp      $1d45
197b 2020      jr      nz,$199d
197d 2020      jr      nz,$199f
197f 2020      jr      nz,$19a1
1981 2020      jr      nz,$19a3
1983 2020      jr      nz,$19a5
1985 2020      jr      nz,$19a7
1987 2053      jr      nz,$19dc
1989 65        ld      h,l
198a 6c        ld      l,h
198b 65        ld      h,l
198c 63        ld      h,e
198d 74        ld      (hl),h
198e 2061      jr      nz,$19f1
1990 2064      jr      nz,$19f6
1992 72        ld      (hl),d
1993 69        ld      l,c
1994 76        halt    
1995 65        ld      h,l
1996 00        nop     
1997 e5        push    hl
1998 214c14    ld      hl,$144c
199b 34        inc     (hl)
199c 23        inc     hl
199d 34        inc     (hl)
199e 34        inc     (hl)
199f e1        pop     hl
19a0 c9        ret     

19a1 00        nop     
19a2 cda819    call    $19a8
19a5 c34c18    jp      $184c
19a8 3ec0      ld      a,$c0
19aa 32a31a    ld      ($1aa3),a
19ad af        xor     a
19ae 32a119    ld      ($19a1),a
19b1 212f01    ld      hl,$012f
19b4 e5        push    hl
19b5 cd231d    call    $1d23
19b8 e1        pop     hl
19b9 cd4c12    call    $124c
19bc 215b1a    ld      hl,$1a5b
19bf af        xor     a
19c0 cd571d    call    $1d57
19c3 cd9719    call    $1997
19c6 cdc112    call    $12c1
19c9 cdd412    call    $12d4
19cc cd541a    call    $1a54
19cf 47        ld      b,a
19d0 78        ld      a,b
19d1 3c        inc     a
19d2 212f01    ld      hl,$012f
19d5 cdf510    call    $10f5
19d8 3a5514    ld      a,($1455)
19db 47        ld      b,a
19dc 79        ld      a,c
19dd b7        or      a
19de 2839      jr      z,$1a19
19e0 fe05      cp      $05
19e2 2835      jr      z,$1a19
19e4 f5        push    af
19e5 c5        push    bc
19e6 3a5514    ld      a,($1455)
19e9 cd0712    call    $1207
19ec cdc412    call    $12c4
19ef cd6b12    call    $126b
19f2 c1        pop     bc
19f3 f1        pop     af
19f4 fe30      cp      $30
19f6 38d8      jr      c,$19d0
19f8 fe3a      cp      $3a
19fa 30d4      jr      nc,$19d0
19fc d630      sub     $30
19fe 47        ld      b,a
19ff 21a119    ld      hl,$19a1
1a02 af        xor     a
1a03 be        cp      (hl)
1a04 78        ld      a,b
1a05 2007      jr      nz,$1a0e
1a07 fe01      cp      $01
1a09 20c5      jr      nz,$19d0
1a0b 34        inc     (hl)
1a0c 18c2      jr      $19d0
1a0e 3600      ld      (hl),$00
1a10 fe06      cp      $06
1a12 30bc      jr      nc,$19d0
1a14 c60a      add     a,$0a
1a16 47        ld      b,a
1a17 18b7      jr      $19d0
1a19 cd541a    call    $1a54
1a1c 47        ld      b,a
1a1d 3a5514    ld      a,($1455)
1a20 b8        cp      b
1a21 c8        ret     z

1a22 5f        ld      e,a
1a23 f5        push    af
1a24 210400    ld      hl,$0004
1a27 b7        or      a
1a28 17        rla     
1a29 17        rla     
1a2a 17        rla     
1a2b 17        rla     
1a2c 4f        ld      c,a
1a2d 7e        ld      a,(hl)
1a2e e60f      and     $0f
1a30 b1        or      c
1a31 77        ld      (hl),a
1a32 7b        ld      a,e
1a33 cd561a    call    $1a56
1a36 f1        pop     af
1a37 213120    ld      hl,$2031
1a3a fe0a      cp      $0a
1a3c 3807      jr      c,$1a45
1a3e d60a      sub     $0a
1a40 c630      add     a,$30
1a42 67        ld      h,a
1a43 1803      jr      $1a48
1a45 c630      add     a,$30
1a47 6f        ld      l,a
1a48 22c31f    ld      ($1fc3),hl
1a4b 212f01    ld      hl,$012f
1a4e cd4c12    call    $124c
1a51 c3451d    jp      $1d45
1a54 1eff      ld      e,$ff
1a56 0e20      ld      c,$20
1a58 c3f71e    jp      $1ef7
1a5b 2020      jr      nz,$1a7d
1a5d 2020      jr      nz,$1a7f
1a5f 2020      jr      nz,$1a81
1a61 2020      jr      nz,$1a83
1a63 2020      jr      nz,$1a85
1a65 53        ld      d,e
1a66 65        ld      h,l
1a67 6c        ld      l,h
1a68 65        ld      h,l
1a69 63        ld      h,e
1a6a 74        ld      (hl),h
1a6b 2061      jr      nz,$1ace
1a6d 2075      jr      nz,$1ae4
1a6f 73        ld      (hl),e
1a70 65        ld      h,l
1a71 72        ld      (hl),d
1a72 00        nop     
1a73 cd791a    call    $1a79
1a76 c3a710    jp      $10a7
1a79 3aa31a    ld      a,($1aa3)
1a7c 47        ld      b,a
1a7d 215602    ld      hl,$0256
1a80 78        ld      a,b
1a81 be        cp      (hl)
1a82 23        inc     hl
1a83 5e        ld      e,(hl)
1a84 23        inc     hl
1a85 56        ld      d,(hl)
1a86 23        inc     hl
1a87 eb        ex      de,hl
1a88 2805      jr      z,$1a8f
1a8a 7c        ld      a,h
1a8b b5        or      l
1a8c c8        ret     z

1a8d 18f1      jr      $1a80
1a8f eb        ex      de,hl
1a90 e5        push    hl
1a91 cd231d    call    $1d23
1a94 e1        pop     hl
1a95 23        inc     hl
1a96 23        inc     hl
1a97 23        inc     hl
1a98 23        inc     hl
1a99 af        xor     a
1a9a cd571d    call    $1d57
1a9d cd6b0c    call    $0c6b	readkey
1aa0 c3451d    jp      $1d45
1aa3 00        nop     
1aa4 00        nop     
1aa5 88        adc     a,b
1aa6 c63e      add     a,$3e
1aa8 2032      jr      nz,$1adc
1aaa a3        and     e
1aab 1a        ld      a,(de)
1aac cdc216    call    $16c2
1aaf af        xor     a
1ab0 1802      jr      $1ab4
1ab2 3e01      ld      a,$01
1ab4 32a41a    ld      ($1aa4),a
1ab7 eb        ex      de,hl
1ab8 d5        push    de
1ab9 3e01      ld      a,$01
1abb 21ab1b    ld      hl,$1bab		string "Enter parameters -->"
1abe cd9612    call    $1296		print string in [HL] in bottom console line
1ac1 d1        pop     de
1ac2 cd8d13    call    $138d
1ac5 3aa41a    ld      a,($1aa4)
1ac8 b7        or      a
1ac9 2814      jr      z,$1adf
1acb 216500    ld      hl,$0065
1ace 3643      ld      (hl),$43
1ad0 23        inc     hl
1ad1 364f      ld      (hl),$4f
1ad3 23        inc     hl
1ad4 364d      ld      (hl),$4d
1ad6 23        inc     hl
1ad7 eb        ex      de,hl
1ad8 3e20      ld      a,$20
1ada 0618      ld      b,$18
1adc cd1914    call    $1419
1adf cd6d13    call    $136d		HL=(TPA & FF00) - 0800
1ae2 7d        ld      a,l
1ae3 c608      add     a,$08
1ae5 6f        ld      l,a
1ae6 54        ld      d,h
1ae7 c680      add     a,$80
1ae9 5f        ld      e,a
1aea eb        ex      de,hl
1aeb 22a51a    ld      ($1aa5),hl
1aee 73        ld      (hl),e
1aef 23        inc     hl
1af0 72        ld      (hl),d
1af1 2ab91f    ld      hl,($1fb9)	1fb9=current drive letter ('A')
1af4 7d        ld      a,l
1af5 12        ld      (de),a
1af6 13        inc     de
1af7 7c        ld      a,h
1af8 12        ld      (de),a
1af9 13        inc     de
1afa 215d00    ld      hl,$005d
1afd 0608      ld      b,$08
1aff 7e        ld      a,(hl)
1b00 fe20      cp      $20
1b02 2809      jr      z,$1b0d
1b04 fe2e      cp      $2e
1b06 2805      jr      z,$1b0d
1b08 12        ld      (de),a
1b09 23        inc     hl
1b0a 13        inc     de
1b0b 10f2      djnz    $1aff
1b0d d5        push    de
1b0e 21ac1b    ld      hl,$1bac		string "Enter parameters -->"
1b11 3e01      ld      a,$01
1b13 cd9612    call    $1296		print string in [HL] in bottom console line
1b16 3e19      ld      a,$19
1b18 cd281e    call    $1e28
1b1b 47        ld      b,a
1b1c d1        pop     de
1b1d 2809      jr      z,$1b28
1b1f 3e20      ld      a,$20
1b21 12        ld      (de),a
1b22 13        inc     de
1b23 3eff      ld      a,$ff
1b25 cd8410    call    $1084
1b28 af        xor     a
1b29 12        ld      (de),a
1b2a 2aa51a    ld      hl,($1aa5)
1b2d 5e        ld      e,(hl)
1b2e 23        inc     hl
1b2f 56        ld      d,(hl)
1b30 eb        ex      de,hl
1b31 06ff      ld      b,$ff
1b33 e5        push    hl
1b34 04        inc     b
1b35 be        cp      (hl)
1b36 23        inc     hl
1b37 20fb      jr      nz,$1b34
1b39 e1        pop     hl
1b3a 2b        dec     hl
1b3b 70        ld      (hl),b
1b3c 216500    ld      hl,$0065
1b3f 7e        ld      a,(hl)
1b40 fe43      cp      $43
1b42 200a      jr      nz,$1b4e
1b44 23        inc     hl
1b45 7e        ld      a,(hl)
1b46 fe4f      cp      $4f
1b48 2004      jr      nz,$1b4e
1b4a 23        inc     hl
1b4b 7e        ld      a,(hl)
1b4c fe4d      cp      $4d
1b4e c2b81c    jp      nz,$1cb8
1b51 3e02      ld      a,$02
1b53 320300    ld      ($0003),a
1b56 0e11      ld      c,$11
1b58 cdf41e    call    $1ef4
1b5b feff      cp      $ff
1b5d cab81c    jp      z,$1cb8
1b60 cddc0b    call    $0bdc
1b63 cd6e0c    call    $0c6e	Clear Screen and Home cursor
1b66 c3190c    jp      $0c19
1b69 5e        ld      e,(hl)
1b6a 44        ld      b,h
1b6b 3d        dec     a
1b6c 48        ld      c,b
1b6d 65        ld      h,l
1b6e 6c        ld      l,h
1b6f 70        ld      (hl),b
1b70 2c        inc     l
1b71 205e      jr      nz,$1bd1
1b73 43        ld      b,e
1b74 3d        dec     a
1b75 43        ld      b,e
1b76 6f        ld      l,a
1b77 6d        ld      l,l
1b78 6d        ld      l,l
1b79 61        ld      h,c
1b7a 6e        ld      l,(hl)
1b7b 64        ld      h,h
1b7c 73        ld      (hl),e
1b7d 2c        inc     l
1b7e 2053      jr      nz,$1bd3
1b80 70        ld      (hl),b
1b81 61        ld      h,c
1b82 63        ld      h,e
1b83 65        ld      h,l
1b84 3d        dec     a
1b85 4e        ld      c,(hl)
1b86 65        ld      h,l
1b87 78        ld      a,b
1b88 74        ld      (hl),h
1b89 2066      jr      nz,$1bf1
1b8b 69        ld      l,c
1b8c 6c        ld      l,h
1b8d 65        ld      h,l
1b8e 2c        inc     l
1b8f 2052      jr      nz,$1be3
1b91 65        ld      h,l
1b92 74        ld      (hl),h
1b93 75        ld      (hl),l
1b94 72        ld      (hl),d
1b95 6e        ld      l,(hl)
1b96 3d        dec     a
1b97 73        ld      (hl),e
1b98 65        ld      h,l
1b99 6c        ld      l,h
1b9a 65        ld      h,l
1b9b 63        ld      h,e
1b9c 74        ld      (hl),h
1b9d 2061      jr      nz,$1c00
1b9f 6e        ld      l,(hl)
1ba0 64        ld      h,h
1ba1 2045      jr      nz,$1be8
1ba3 78        ld      a,b
1ba4 65        ld      h,l
1ba5 63        ld      h,e
1ba6 75        ld      (hl),l
1ba7 74        ld      (hl),h
1ba8 65        ld      h,l
1ba9 2000      jr      nz,$1bab
1bab 00        nop     
1bac 45        ld      b,l
1bad 6e        ld      l,(hl)
1bae 74        ld      (hl),h
1baf 65        ld      h,l
1bb0 72        ld      (hl),d
1bb1 2070      jr      nz,$1c23
1bb3 61        ld      h,c
1bb4 72        ld      (hl),d
1bb5 61        ld      h,c
1bb6 6d        ld      l,l
1bb7 65        ld      h,l
1bb8 74        ld      (hl),h
1bb9 65        ld      h,l
1bba 72        ld      (hl),d
1bbb 73        ld      (hl),e
1bbc 202d      jr      nz,$1beb
1bbe 2d        dec     l
1bbf 3e20      ld      a,$20
1bc1 00        nop     
1bc2 3e30      ld      a,$30
1bc4 32a31a    ld      ($1aa3),a
1bc7 c3a710    jp      $10a7
1bca 3e40      ld      a,$40
1bcc 32a31a    ld      ($1aa3),a
1bcf 21e61b    ld      hl,$1be6		string "Enter search string: "
1bd2 3e01      ld      a,$01
1bd4 cd9612    call    $1296		print string in [HL] in bottom console line
1bd7 af        xor     a
1bd8 cd281e    call    $1e28
1bdb 11d51f    ld      de,$1fd5
1bde 010d00    ld      bc,$000d
1be1 edb0      ldir    
1be3 c34c18    jp      $184c
1be6 45        ld      b,l
1be7 6e        ld      l,(hl)
1be8 74        ld      (hl),h
1be9 65        ld      h,l
1bea 72        ld      (hl),d
1beb 2073      jr      nz,$1c60
1bed 65        ld      h,l
1bee 61        ld      h,c
1bef 72        ld      (hl),d
1bf0 63        ld      h,e
1bf1 68        ld      l,b
1bf2 2073      jr      nz,$1c67
1bf4 74        ld      (hl),h
1bf5 72        ld      (hl),d
1bf6 69        ld      l,c
1bf7 6e        ld      l,(hl)
1bf8 67        ld      h,a
1bf9 3a2000    ld      a,($0020)
1bfc 3e50      ld      a,$50
1bfe 32a31a    ld      ($1aa3),a
1c01 3e17      ld      a,$17
1c03 180d      jr      $1c12
1c05 00        nop     
1c06 00        nop     
1c07 af        xor     a
1c08 32051c    ld      ($1c05),a
1c0b 3e60      ld      a,$60
1c0d 32a31a    ld      ($1aa3),a
1c10 3e13      ld      a,$13
1c12 32061c    ld      ($1c06),a
1c15 cd0c17    call    $170c
1c18 3a0030    ld      a,($3000)
1c1b b7        or      a
1c1c caa710    jp      z,$10a7
1c1f 47        ld      b,a
1c20 0e00      ld      c,$00
1c22 c5        push    bc
1c23 79        ld      a,c
1c24 cdf116    call    $16f1
1c27 eb        ex      de,hl
1c28 cd8d13    call    $138d
1c2b 3a061c    ld      a,($1c06)
1c2e fe13      cp      $13
1c30 2864      jr      z,$1c96
1c32 115d00    ld      de,$005d
1c35 21d71c    ld      hl,$1cd7
1c38 060b      ld      b,$0b
1c3a 1a        ld      a,(de)
1c3b fe20      cp      $20
1c3d 2807      jr      z,$1c46
1c3f b7        or      a
1c40 2002      jr      nz,$1c44
1c42 3e20      ld      a,$20
1c44 77        ld      (hl),a
1c45 23        inc     hl
1c46 13        inc     de
1c47 78        ld      a,b
1c48 fe04      cp      $04
1c4a 2003      jr      nz,$1c4f
1c4c 362e      ld      (hl),$2e
1c4e 23        inc     hl
1c4f 10e9      djnz    $1c3a
1c51 eb        ex      de,hl
1c52 21e81c    ld      hl,$1ce8
1c55 010500    ld      bc,$0005
1c58 edb0      ldir    
1c5a 3e01      ld      a,$01
1c5c 21cf1c    ld      hl,$1ccf		string "Rename, "
1c5f cd9612    call    $1296		print string in [HL] in bottom console line
1c62 af        xor     a
1c63 cd281e    call    $1e28
1c66 cdfb17    call    $17fb
1c69 eb        ex      de,hl
1c6a 2859      jr      z,$1cc5
1c6c d5        push    de
1c6d 215c00    ld      hl,$005c
1c70 1125a1    ld      de,$a125
1c73 010c00    ld      bc,$000c
1c76 edb0      ldir    
1c78 d1        pop     de
1c79 cd8d13    call    $138d
1c7c cd0c18    call    $180c
1c7f 2037      jr      nz,$1cb8
1c81 215c00    ld      hl,$005c
1c84 116c00    ld      de,$006c
1c87 010c00    ld      bc,$000c
1c8a c5        push    bc
1c8b edb0      ldir    
1c8d c1        pop     bc
1c8e 2125a1    ld      hl,$a125
1c91 cd2d18    call    $182d
1c94 1817      jr      $1cad
1c96 21051c    ld      hl,$1c05
1c99 3e01      ld      a,$01
1c9b be        cp      (hl)
1c9c 280f      jr      z,$1cad
1c9e 77        ld      (hl),a
1c9f 21041d    ld      hl,$1d04		string "ERASE, are you sure (Y=yes) ? "
1ca2 cd9612    call    $1296		print string in [HL] in bottom console line
1ca5 cd281e    call    $1e28
1ca8 3e59      ld      a,$59
1caa be        cp      (hl)
1cab 201f      jr      nz,$1ccc
1cad 3a061c    ld      a,($1c06)
1cb0 4f        ld      c,a
1cb1 cdf41e    call    $1ef4
1cb4 feff      cp      $ff
1cb6 200d      jr      nz,$1cc5
1cb8 21ed1c    ld      hl,$1ced		string "Command can't execute "
1cbb 3e01      ld      a,$01
1cbd cd9612    call    $1296		print string in [HL] in bottom console line
1cc0 cd1f0c    call    $0c1f		get a command key
1cc3 1807      jr      $1ccc
1cc5 c1        pop     bc
1cc6 0c        inc     c
1cc7 79        ld      a,c
1cc8 b8        cp      b
1cc9 c2221c    jp      nz,$1c22
1ccc c3a710    jp      $10a7
1ccf 52        ld      d,d
1cd0 65        ld      h,l
1cd1 6e        ld      l,(hl)
1cd2 61        ld      h,c
1cd3 6d        ld      l,l
1cd4 65        ld      h,l
1cd5 2c        inc     l
1cd6 2006      jr      nz,$1cde
1cd8 aa        xor     d
1cd9 e9        jp      (hl)
1cda 29        add     hl,hl
1cdb cb0a      rrc     d
1cdd 119af0    ld      de,$f09a
1ce0 6a        ld      l,d
1ce1 ae        xor     (hl)
1ce2 92        sub     d
1ce3 9c        sbc     a,h
1ce4 b0        or      b
1ce5 af        xor     a
1ce6 1800      jr      $1ce8
1ce8 2074      jr      nz,$1d5e
1cea 6f        ld      l,a
1ceb 2000      jr      nz,$1ced
1ced 43        ld      b,e
1cee 6f        ld      l,a
1cef 6d        ld      l,l
1cf0 6d        ld      l,l
1cf1 61        ld      h,c
1cf2 6e        ld      l,(hl)
1cf3 64        ld      h,h
1cf4 2063      jr      nz,$1d59
1cf6 61        ld      h,c
1cf7 6e        ld      l,(hl)
1cf8 27        daa     
1cf9 74        ld      (hl),h
1cfa 2065      jr      nz,$1d61
1cfc 78        ld      a,b
1cfd 65        ld      h,l
1cfe 63        ld      h,e
1cff 75        ld      (hl),l
1d00 74        ld      (hl),h
1d01 65        ld      h,l
1d02 2000      jr      nz,$1d04
1d04 45        ld      b,l
1d05 52        ld      d,d
1d06 41        ld      b,c
1d07 53        ld      d,e
1d08 45        ld      b,l
1d09 2c        inc     l
1d0a 2061      jr      nz,$1d6d
1d0c 72        ld      (hl),d
1d0d 65        ld      h,l
1d0e 2079      jr      nz,$1d89
1d10 6f        ld      l,a
1d11 75        ld      (hl),l
1d12 2073      jr      nz,$1d87
1d14 75        ld      (hl),l
1d15 72        ld      (hl),d
1d16 65        ld      h,l
1d17 2028      jr      nz,$1d41
1d19 59        ld      e,c
1d1a 3d        dec     a
1d1b 79        ld      a,c
1d1c 65        ld      h,l
1d1d 73        ld      (hl),e
1d1e 29        add     hl,hl
1d1f 203f      jr      nz,$1d60
1d21 2000      jr      nz,$1d23
1d23 e5        push    hl
1d24 d5        push    de
1d25 c5        push    bc
1d26 f5        push    af
1d27 113801    ld      de,$0138
1d2a 010400    ld      bc,$0004
1d2d edb0      ldir    
1d2f cde40c    call    $0ce4	query cursor pos
1d32 ed534f1d  ld      ($1d4f),de
1d36 213801    ld      hl,$0138
1d39 56        ld      d,(hl)
1d3a 23        inc     hl
1d3b 5e        ld      e,(hl)
1d3c cdab0c    call    $0cab	set cursor at XY=reg DE
1d3f cd7a0d    call    $0d7a
1d42 c3270d    jp      $0d27
1d45 ed5b4f1d  ld      de,($1d4f)
1d49 cdab0c    call    $0cab	set cursor at XY=reg DE
1d4c c3b00d    jp      $0db0
1d4f 00        nop     
1d50 00        nop     
1d51 00        nop     
1d52 00        nop     
1d53 00        nop     
1d54 00        nop     
1d55 00        nop     
1d56 00        nop     
1d57 32511d    ld      ($1d51),a
1d5a b7        or      a
1d5b 280a      jr      z,$1d67
1d5d 3a521d    ld      a,($1d52)
1d60 b7        or      a
1d61 ed5b531d  ld      de,($1d53)
1d65 2004      jr      nz,$1d6b
1d67 ed5b3801  ld      de,($0138)
1d6b ed53531d  ld      ($1d53),de
1d6f e5        push    hl
1d70 2a3a01    ld      hl,($013a)
1d73 19        add     hl,de
1d74 22551d    ld      ($1d55),hl
1d77 d5        push    de
1d78 7a        ld      a,d
1d79 53        ld      d,e
1d7a 5f        ld      e,a
1d7b cdab0c    call    $0cab	set cursor at XY=reg DE
1d7e d1        pop     de
1d7f e1        pop     hl
1d80 3a511d    ld      a,($1d51)
1d83 be        cp      (hl)
1d84 c8        ret     z

1d85 3e0d      ld      a,$0d
1d87 be        cp      (hl)
1d88 281c      jr      z,$1da6
1d8a 4e        ld      c,(hl)
1d8b e5        push    hl
1d8c d5        push    de
1d8d c5        push    bc
1d8e cd220c    call    $0c22	call BIOS console output
1d91 c1        pop     bc
1d92 d1        pop     de
1d93 e1        pop     hl
1d94 1c        inc     e
1d95 3a551d    ld      a,($1d55)
1d98 bb        cp      e
1d99 280b      jr      z,$1da6
1d9b 23        inc     hl
1d9c 3a511d    ld      a,($1d51)
1d9f b7        or      a
1da0 28de      jr      z,$1d80
1da2 10dc      djnz    $1d80
1da4 1849      jr      $1def
1da6 23        inc     hl
1da7 3a511d    ld      a,($1d51)
1daa b7        or      a
1dab 2803      jr      z,$1db0
1dad 05        dec     b
1dae 283f      jr      z,$1def
1db0 3a531d    ld      a,($1d53)
1db3 5f        ld      e,a
1db4 14        inc     d
1db5 3a561d    ld      a,($1d56)
1db8 ba        cp      d
1db9 20b0      jr      nz,$1d6b
1dbb e5        push    hl
1dbc c5        push    bc
1dbd 3e01      ld      a,$01
1dbf 21d31d    ld      hl,$1dd3
1dc2 cdfc1d    call    $1dfc
1dc5 af        xor     a
1dc6 32521d    ld      ($1d52),a
1dc9 cdb00d    call    $0db0
1dcc cd7a0d    call    $0d7a
1dcf c1        pop     bc
1dd0 e1        pop     hl
1dd1 1884      jr      $1d57
1dd3 50        ld      d,b
1dd4 72        ld      (hl),d
1dd5 65        ld      h,l
1dd6 73        ld      (hl),e
1dd7 73        ld      (hl),e
1dd8 2072      jr      nz,$1e4c
1dda 65        ld      h,l
1ddb 74        ld      (hl),h
1ddc 75        ld      (hl),l
1ddd 72        ld      (hl),d
1dde 6e        ld      l,(hl)
1ddf 2066      jr      nz,$1e47
1de1 6f        ld      l,a
1de2 72        ld      (hl),d
1de3 206e      jr      nz,$1e53
1de5 65        ld      h,l
1de6 78        ld      a,b
1de7 74        ld      (hl),h
1de8 2070      jr      nz,$1e5a
1dea 61        ld      h,c
1deb 67        ld      h,a
1dec 65        ld      h,l
1ded 2000      jr      nz,$1def
1def ed53531d  ld      ($1d53),de
1df3 3e01      ld      a,$01
1df5 32521d    ld      ($1d52),a
1df8 c9        ret     

1df9 21051e    ld      hl,$1e05		string "Command end, Press return to quit"
1dfc 3e01      ld      a,$01
1dfe cd9612    call    $1296		print string in [HL] in bottom console line
1e01 af        xor     a
1e02 c3281e    jp      $1e28
1e05 43        ld      b,e
1e06 6f        ld      l,a
1e07 6d        ld      l,l
1e08 6d        ld      l,l
1e09 61        ld      h,c
1e0a 6e        ld      l,(hl)
1e0b 64        ld      h,h
1e0c 2065      jr      nz,$1e73
1e0e 6e        ld      l,(hl)
1e0f 64        ld      h,h
1e10 2c        inc     l
1e11 2050      jr      nz,$1e63
1e13 72        ld      (hl),d
1e14 65        ld      h,l
1e15 73        ld      (hl),e
1e16 73        ld      (hl),e
1e17 2072      jr      nz,$1e8b
1e19 65        ld      h,l
1e1a 74        ld      (hl),h
1e1b 75        ld      (hl),l
1e1c 72        ld      (hl),d
1e1d 6e        ld      l,(hl)
1e1e 2074      jr      nz,$1e94
1e20 6f        ld      l,a
1e21 2071      jr      nz,$1e94
1e23 75        ld      (hl),l
1e24 69        ld      l,c
1e25 74        ld      (hl),h
1e26 2000      jr      nz,$1e28
1e28 110180    ld      de,$8001
1e2b d5        push    de
1e2c f5        push    af
1e2d 3e20      ld      a,$20
1e2f 0680      ld      b,$80
1e31 cd1914    call    $1419
1e34 f1        pop     af
1e35 d1        pop     de
1e36 060d      ld      b,$0d
1e38 b7        or      a
1e39 2801      jr      z,$1e3c
1e3b 47        ld      b,a
1e3c 04        inc     b
1e3d 78        ld      a,b
1e3e 320080    ld      ($8000),a
1e41 48        ld      c,b
1e42 c5        push    bc
1e43 d5        push    de
1e44 cd7e13    call    $137e		get command key from main menu
1e47 fe1b      cp      $1b
1e49 28f9      jr      z,$1e44
1e4b fe09      cp      $09
1e4d 28f5      jr      z,$1e44
1e4f fe0a      cp      $0a
1e51 28f1      jr      z,$1e44
1e53 d1        pop     de
1e54 c1        pop     bc
1e55 213c01    ld      hl,$013c
1e58 be        cp      (hl)
1e59 2862      jr      z,$1ebd
1e5b 23        inc     hl
1e5c be        cp      (hl)
1e5d 200b      jr      nz,$1e6a
1e5f c5        push    bc
1e60 4f        ld      c,a
1e61 3a0080    ld      a,($8000)
1e64 fe0d      cp      $0d
1e66 79        ld      a,c
1e67 c1        pop     bc
1e68 28d8      jr      z,$1e42
1e6a 23        inc     hl
1e6b be        cp      (hl)
1e6c 2855      jr      z,$1ec3
1e6e 23        inc     hl
1e6f be        cp      (hl)
1e70 2827      jr      z,$1e99
1e72 23        inc     hl
1e73 be        cp      (hl)
1e74 284d      jr      z,$1ec3
1e76 23        inc     hl
1e77 be        cp      (hl)
1e78 2849      jr      z,$1ec3
1e7a fe03      cp      $03
1e7c 2845      jr      z,$1ec3
1e7e c5        push    bc
1e7f d5        push    de
1e80 12        ld      (de),a
1e81 fe20      cp      $20
1e83 3009      jr      nc,$1e8e
1e85 f5        push    af
1e86 0e5e      ld      c,$5e
1e88 cd220c    call    $0c22	call BIOS console output
1e8b f1        pop     af
1e8c c640      add     a,$40
1e8e 4f        ld      c,a
1e8f cd220c    call    $0c22	call BIOS console output
1e92 d1        pop     de
1e93 c1        pop     bc
1e94 13        inc     de
1e95 10ab      djnz    $1e42
1e97 0600      ld      b,$00
1e99 79        ld      a,c
1e9a b8        cp      b
1e9b 28a5      jr      z,$1e42
1e9d 04        inc     b
1e9e 1b        dec     de
1e9f c5        push    bc
1ea0 d5        push    de
1ea1 cd7f0c    call    $0c7f
1ea4 d1        pop     de
1ea5 d5        push    de
1ea6 1a        ld      a,(de)
1ea7 fe20      cp      $20
1ea9 3e20      ld      a,$20
1eab 12        ld      (de),a
1eac 13        inc     de
1ead 12        ld      (de),a
1eae 1b        dec     de
1eaf 3003      jr      nc,$1eb4
1eb1 cd7f0c    call    $0c7f
1eb4 c3441e    jp      $1e44
1eb7 3a0080    ld      a,($8000)
1eba c3281e    jp      $1e28
1ebd 79        ld      a,c
1ebe 90        sub     b
1ebf 210180    ld      hl,$8001
1ec2 c9        ret     

1ec3 c3a710    jp      $10a7
1ec6 f5        push    af
1ec7 c5        push    bc
1ec8 d5        push    de
1ec9 e5        push    hl
1eca 0e00      ld      c,$00
1ecc c5        push    bc
1ecd cd1c0c    call    $0c1c
1ed0 c1        pop     bc
1ed1 b7        or      a
1ed2 2814      jr      z,$1ee8
1ed4 213c01    ld      hl,$013c
1ed7 be        cp      (hl)
1ed8 280e      jr      z,$1ee8
1eda 23        inc     hl
1edb be        cp      (hl)
1edc 2804      jr      z,$1ee2
1ede fe13      cp      $13
1ee0 2006      jr      nz,$1ee8
1ee2 4f        ld      c,a
1ee3 0c        inc     c
1ee4 fe01      cp      $01
1ee6 28e4      jr      z,$1ecc
1ee8 e1        pop     hl
1ee9 d1        pop     de
1eea c1        pop     bc
1eeb f1        pop     af
1eec c9        ret     

1eed c5        push    bc
1eee 0e1a      ld      c,$1a
1ef0 cd0500    call    $0005
1ef3 c1        pop     bc
1ef4 115c00    ld      de,$005c
1ef7 d5        push    de
1ef8 1eff      ld      e,$ff
1efa cd2f1f    call    $1f2f
1efd d1        pop     de
1efe cd0500    call    $0005
1f01 feff      cp      $ff
1f03 2022      jr      nz,$1f27
1f05 7c        ld      a,h
1f06 b7        or      a
1f07 3eff      ld      a,$ff
1f09 281c      jr      z,$1f27
1f0b c5        push    bc
1f0c 4f        ld      c,a
1f0d 7c        ld      a,h
1f0e 215f1f    ld      hl,$1f5f
1f11 3d        dec     a
1f12 2827      jr      z,$1f3b
1f14 216f1f    ld      hl,$1f6f
1f17 3d        dec     a
1f18 2821      jr      z,$1f3b
1f1a 217f1f    ld      hl,$1f7f
1f1d 3d        dec     a
1f1e 281b      jr      z,$1f3b
1f20 218f1f    ld      hl,$1f8f
1f23 3d        dec     a
1f24 2815      jr      z,$1f3b
1f26 c1        pop     bc
1f27 d5        push    de
1f28 1e00      ld      e,$00
1f2a cd2f1f    call    $1f2f
1f2d d1        pop     de
1f2e c9        ret     

1f2f f5        push    af
1f30 c5        push    bc
1f31 e5        push    hl
1f32 0e2d      ld      c,$2d
1f34 cd0500    call    $0005
1f37 e1        pop     hl
1f38 c1        pop     bc
1f39 f1        pop     af
1f3a c9        ret     

1f3b cd271f    call    $1f27
1f3e 3e01      ld      a,$01
1f40 cd9612    call    $1296		print string in [HL] in bottom console line
1f43 cd281e    call    $1e28
1f46 0e30      ld      c,$30
1f48 cd0500    call    $0005
1f4b 0e18      ld      c,$18
1f4d cd0500    call    $0005
1f50 0e25      ld      c,$25
1f52 eb        ex      de,hl
1f53 cd0500    call    $0005
1f56 c3a710    jp      $10a7
1f59 115c00    ld      de,$005c
1f5c c30500    jp      $0005
1f5f 44        ld      b,h
1f60 69        ld      l,c
1f61 73        ld      (hl),e
1f62 6b        ld      l,e
1f63 2049      jr      nz,$1fae
1f65 2f        cpl     
1f66 4f        ld      c,a
1f67 2065      jr      nz,$1fce
1f69 72        ld      (hl),d
1f6a 72        ld      (hl),d
1f6b 6f        ld      l,a
1f6c 72        ld      (hl),d
1f6d 2000      jr      nz,$1f6f
1f6f 52        ld      d,d
1f70 65        ld      h,l
1f71 61        ld      h,c
1f72 64        ld      h,h
1f73 2f        cpl     
1f74 4f        ld      c,a
1f75 6e        ld      l,(hl)
1f76 6c        ld      l,h
1f77 79        ld      a,c
1f78 2064      jr      nz,$1fde
1f7a 69        ld      l,c
1f7b 73        ld      (hl),e
1f7c 6b        ld      l,e
1f7d 2000      jr      nz,$1f7f
1f7f 52        ld      d,d
1f80 65        ld      h,l
1f81 61        ld      h,c
1f82 64        ld      h,h
1f83 2f        cpl     
1f84 4f        ld      c,a
1f85 6e        ld      l,(hl)
1f86 6c        ld      l,h
1f87 79        ld      a,c
1f88 2066      jr      nz,$1ff0
1f8a 69        ld      l,c
1f8b 6c        ld      l,h
1f8c 65        ld      h,l
1f8d 2000      jr      nz,$1f8f
1f8f 49        ld      c,c
1f90 6e        ld      l,(hl)
1f91 76        halt    
1f92 61        ld      h,c
1f93 6c        ld      l,h
1f94 69        ld      l,c
1f95 64        ld      h,h
1f96 2064      jr      nz,$1ffc
1f98 72        ld      (hl),d
1f99 69        ld      l,c
1f9a 76        halt    
1f9b 65        ld      h,l
1f9c 2065      jr      nz,$2003
1f9e 72        ld      (hl),d
1f9f 72        ld      (hl),d
1fa0 6f        ld      l,a
1fa1 72        ld      (hl),d
1fa2 2000      jr      nz,$1fa4
1fa4 218180    ld      hl,$8081
1fa7 2020      jr      nz,$1fc9
1fa9 2020      jr      nz,$1fcb
1fab 2020      jr      nz,$1fcd
1fad 2020      jr      nz,$1fcf
1faf 2020      jr      nz,$1fd1
1fb1 2020      jr      nz,$1fd3
1fb3 44        ld      b,h
1fb4 72        ld      (hl),d
1fb5 69        ld      l,c
1fb6 76        halt    
1fb7 65        ld      h,l
1fb8 3d        dec     a
1fb9 41        ld      b,c
1fba 3a2020    ld      a,($2020)
1fbd 2055      jr      nz,$2014
1fbf 73        ld      (hl),e
1fc0 65        ld      h,l
1fc1 72        ld      (hl),d
1fc2 3d        dec     a
1fc3 3020      jr      nc,$1fe5
1fc5 2020      jr      nz,$1fe7
1fc7 53        ld      d,e
1fc8 65        ld      h,l
1fc9 61        ld      h,c
1fca 72        ld      (hl),d
1fcb 63        ld      h,e
1fcc 68        ld      l,b
1fcd 2073      jr      nz,$2042
1fcf 74        ld      (hl),h
1fd0 72        ld      (hl),d
1fd1 69        ld      l,c
1fd2 6e        ld      l,(hl)
1fd3 67        ld      h,a
1fd4 3d        dec     a
1fd5 2a2e2a    ld      hl,($2a2e)
1fd8 2020      jr      nz,$1ffa
1fda 2020      jr      nz,$1ffc
1fdc 2020      jr      nz,$1ffe
1fde 2020      jr      nz,$2000
1fe0 2020      jr      nz,$2002
1fe2 2020      jr      nz,$2004
1fe4 2020      jr      nz,$2006
1fe6 00        nop     
1fe7 2065      jr      nz,$204e
1fe9 72        ld      (hl),d
1fea 72        ld      (hl),d
1feb 6f        ld      l,a
1fec 72        ld      (hl),d
1fed 2000      jr      nz,$1fef
1fef 52        ld      d,d
1ff0 65        ld      h,l
1ff1 61        ld      h,c
1ff2 64        ld      h,h
1ff3 2f        cpl     
1ff4 4f        ld      c,a
1ff5 6e        ld      l,(hl)
1ff6 6c        ld      l,h
1ff7 79        ld      a,c
1ff8 2064      jr      nz,$205e
1ffa 69        ld      l,c
1ffb 73        ld      (hl),e
1ffc 6b        ld      l,e
1ffd 2000      jr      nz,$1fff
1fff 52        ld      d,d
2000 00        nop     
2001 00        nop     
2002 00        nop     
2003 00        nop     
2004 00        nop     
2005 00        nop     
2006 00        nop     
2007 00        nop     
2008 00        nop     




 BDOS Function 124: Byte BLT Copy
 Entry parameters:
 Register C: 7CH
 Register DE: BCB address
 Returned value:
 Register A: 00H if implemented, or
 0FFH if not implemented
ROCHE> BCB = Byte Copy Block. That's all I know...


 BDOS Function 125: Byte BLT Alter
 Entry parameters:
 Register C: 7DH
 Register DE: BCB address
 Returned value:
 Register A: 00H if implemented, or
 0FFH if not implemented
ROCHE> BCB = Byte Copy Block. That's all I know..