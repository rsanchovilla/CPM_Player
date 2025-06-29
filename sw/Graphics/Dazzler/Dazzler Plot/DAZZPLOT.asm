; Disassembly of the file "E:\Tmp\cpm\pcw\DAZZPLOT.COM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Saturday, 13 of January 2024 at 06:58 PM
; 
0100 c32601    jp      $0126

0103 2043      jr      nz,$0148
0105 4f        ld      c,a
0106 50        ld      d,b
0107 59        ld      e,c
0108 52        ld      d,d
0109 49        ld      c,c
010a 47        ld      b,a
010b 48        ld      c,b
010c 54        ld      d,h
010d 2028      jr      nz,$0137
010f 63        ld      h,e
0110 29        add     hl,hl
0111 2031      jr      nz,$0144
0113 39        add     hl,sp
0114 37        scf     
0115 37        scf     
0116 2c        inc     l
0117 2043      jr      nz,$015c
0119 52        ld      d,d
011a 4f        ld      c,a
011b 4d        ld      c,l
011c 45        ld      b,l
011d 4d        ld      c,l
011e 43        ld      b,e
011f 4f        ld      c,a
0120 2049      jr      nz,$016b
0122 4e        ld      c,(hl)
0123 43        ld      b,e
0124 2e20      ld      l,$20

0126 110202    ld      de,$0202		Print msg "DAZZLEPLOT version 00.04"
0129 0e09      ld      c,$09
012b cd0500    call    $0005		call BDOS
012e 2a0600    ld      hl,($0006)
0131 229a01    ld      ($019a),hl	save Top of ram
0134 ed5b0002  ld      de,($0200)	get program length
0138 af        xor     a
0139 ed52      sbc     hl,de
013b 6f        ld      l,a
013c 220600    ld      ($0006),hl	store top of ram reduced by program length 
013f e5        push    hl

0140 ed4b0002  ld      bc,($0200)	relocate program. bc=prog length
0144 210003    ld      hl,$0300		relocation bitmap at $0300+prog length
0147 09        add     hl,bc		prog start at $0300
0148 110003    ld      de,$0300
014b eb        ex      de,hl
014c 1b        dec     de
014d 13        inc     de
014e 3e08      ld      a,$08
0150 f5        push    af
0151 1a        ld      a,(de)
0152 17        rla     
0153 3007      jr      nc,$015c
0155 08        ex      af,af'
0156 3a0700    ld      a,($0007)
0159 86        add     a,(hl)
015a 77        ld      (hl),a
015b 08        ex      af,af'
015c 08        ex      af,af'
015d 23        inc     hl
015e 0b        dec     bc		decr bytes remaining to relocate
015f 78        ld      a,b
0160 b1        or      c
0161 2808      jr      z,$016b		jp when reloc done
0163 f1        pop     af
0164 3d        dec     a
0165 28e6      jr      z,$014d
0167 f5        push    af
0168 08        ex      af,af'
0169 18e7      jr      $0152

016b ed4b0002  ld      bc,($0200)	move prog to destination
016f 0b        dec     bc
0170 2a0600    ld      hl,($0006)
0173 09        add     hl,bc
0174 eb        ex      de,hl
0175 210003    ld      hl,$0300
0178 09        add     hl,bc
0179 edb8      lddr    			prog to d900
017b 2a0600    ld      hl,($0006)
017e 3ec3      ld      a,$c3
0180 77        ld      (hl),a
0181 3a9a01    ld      a,($019a)	019a=save Top of ram
0184 23        inc     hl
0185 77        ld      (hl),a
0186 3a9b01    ld      a,($019b)
0189 23        inc     hl
018a 77        ld      (hl),a
018b 23        inc     hl
018c e5        push    hl
018d 219c01    ld      hl,$019c		move picture saver
0190 110001    ld      de,$0100
0193 011c00    ld      bc,$001c
0196 edb0      ldir    
0198 e1        pop     hl
0199 e9        jp      (hl)		jump to prog (d903)

019a DW		Top of ram

019c 3aff01    ld      a,($01ff)
019f d30f      out     ($0f),a
01a1 3e81      ld      a,$81
01a3 d30e      out     ($0e),a
01a5 0e09      ld      c,$09
01a7 11b801    ld      de,$01b8
01aa cd0500    call    $0005
01ad 0e01      ld      c,$01
01af cd0500    call    $0005
01b2 af        xor     a
01b3 d30e      out     ($0e),a
01b5 c30000    jp      $0000
01b8 50        ld      d,b
01b9 72        ld      (hl),d
01ba 65        ld      h,l
01bb 73        ld      (hl),e
01bc 73        ld      (hl),e
01bd 2061      jr      nz,$0220
01bf 6e        ld      l,(hl)
01c0 79        ld      a,c
01c1 206b      jr      nz,$022e
01c3 65        ld      h,l
01c4 79        ld      a,c
01c5 2074      jr      nz,$023b
01c7 6f        ld      l,a
01c8 2061      jr      nz,$022b
01ca 62        ld      h,d
01cb 6f        ld      l,a
01cc 72        ld      (hl),d
01cd 74        ld      (hl),h
01ce 24        inc     h
01cf 00        nop     
01d0 00        nop     
01d1 00        nop     
01d2 00        nop     
01d3 00        nop     
01d4 00        nop     
01d5 00        nop     
01d6 00        nop     
01d7 00        nop     
01d8 00        nop     
01d9 00        nop     
01da 00        nop     
01db 00        nop     
01dc 00        nop     
01dd 00        nop     
01de 00        nop     
01df 00        nop     
01e0 00        nop     
01e1 00        nop     
01e2 00        nop     
01e3 00        nop     
01e4 00        nop     
01e5 00        nop     
01e6 00        nop     
01e7 00        nop     
01e8 00        nop     
01e9 00        nop     
01ea 00        nop     
01eb 00        nop     
01ec 00        nop     
01ed 00        nop     
01ee 00        nop     
01ef 00        nop     
01f0 00        nop     
01f1 00        nop     
01f2 00        nop     
01f3 00        nop     
01f4 00        nop     
01f5 00        nop     
01f6 00        nop     
01f7 00        nop     
01f8 00        nop     
01f9 00        nop     
01fa 00        nop     
01fb 00        nop     
01fc 00        nop     
01fd 00        nop     
01fe 00        nop     
01ff 00        nop     
0200 c207      DW	program lenght = $0724
0202           DS 	"DAZZLEPLOT version 00.04",13,10,'$'

021d 43        ld      b,e
021e 4f        ld      c,a
021f 50        ld      d,b
0220 59        ld      e,c
0221 52        ld      d,d
0222 49        ld      c,c
0223 47        ld      b,a
0224 48        ld      c,b
0225 54        ld      d,h
0226 2028      jr      nz,$0250
0228 63        ld      h,e
0229 29        add     hl,hl
022a 2031      jr      nz,$025d
022c 39        add     hl,sp
022d 37        scf     
022e 382c      jr      c,$025c
0230 2043      jr      nz,$0275
0232 52        ld      d,d
0233 4f        ld      c,a
0234 4d        ld      c,l
0235 45        ld      b,l
0236 4d        ld      c,l
0237 43        ld      b,e
0238 4f        ld      c,a
0239 2c        inc     l
023a 2049      jr      nz,$0285
023c 4e        ld      c,(hl)
023d 43        ld      b,e
023e 2e00      ld      l,$00
0240 00        nop     
0241 00        nop     
0242 00        nop     
0243 00        nop     
0244 00        nop     
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
0274 00        nop     
0275 00        nop     
0276 00        nop     
0277 00        nop     
0278 00        nop     
0279 00        nop     
027a 00        nop     
027b 00        nop     
027c 00        nop     
027d 00        nop     
027e 00        nop     
027f 00        nop     
0280 00        nop     
0281 00        nop     
0282 00        nop     
0283 00        nop     
0284 00        nop     
0285 00        nop     
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

					dazzler plot prog. Moved to d900
					assembled as if it is at addr 0000

0300 c30500    jp      $0005

0303 313400    ld      sp,$0034		entry point
0306 cd3b00    call    $003b		converted to call d93b -> see routine at 033b
0309 af        xor     a
030a d30e      out     ($0e),a
030c c30000    jp      $0000
030f 2043      jr      nz,$0354
0311 4f        ld      c,a
0312 50        ld      d,b
0313 59        ld      e,c
0314 52        ld      d,d
0315 49        ld      c,c
0316 47        ld      b,a
0317 48        ld      c,b
0318 54        ld      d,h
0319 2028      jr      nz,$0343
031b 63        ld      h,e
031c 29        add     hl,hl
031d 2031      jr      nz,$0350
031f 39        add     hl,sp
0320 37        scf     
0321 382c      jr      c,$034f
0323 2043      jr      nz,$0368
0325 52        ld      d,d
0326 4f        ld      c,a
0327 4d        ld      c,l
0328 45        ld      b,l
0329 4d        ld      c,l
032a 43        ld      b,e
032b 4f        ld      c,a
032c 2c        inc     l
032d 2049      jr      nz,$0378
032f 4e        ld      c,(hl)
0330 43        ld      b,e
0331 2e20      ld      l,$20
0333 2031      jr      nz,$0366
0335 9a        sbc     a,d
0336 07        rlca    
0337 213400    ld      hl,$0034
033a e5        push    hl
033b 210000    ld      hl,$0000
033e 39        add     hl,sp
033f 22a507    ld      ($07a5),hl
0342 319807    ld      sp,$0798
0345 cd7a04    call    $047a
0348 cd6903    call    $0369
034b 010009    ld      bc,$0900
034e cd8100    call    $0081
								patched to
0351 db00      in      a,($00)		key pressed?		cd0980 call 8009
0353 e640      and     $40					00     nop	
0355 c25401    jp      nz,$0154		yes, jp 0454
0358 db18      in      a,($18)
035a 2f        cpl     
035b fe00      cp      $00
035d c23801    jp      nz,$0138
0360 1678      ld      d,$78
0362 db19      in      a,($19)
0364 67        ld      h,a
0365 db1a      in      a,($1a)
0367 6f        ld      l,a
0368 fe00      cp      $00
036a c2b000    jp      nz,$00b0
036d 7c        ld      a,h
036e fe00      cp      $00
0370 c2d900    jp      nz,$00d9
0373 0d        dec     c
0374 c25100    jp      nz,$0051
0377 05        dec     b
0378 c25100    jp      nz,$0051
037b cd4406    call    $0644
037e c34b00    jp      $004b
0381 3a9b07    ld      a,($079b)
0384 37        scf     
0385 1f        rra     
0386 d30e      out     ($0e),a
0388 21ba07    ld      hl,$07ba
038b 3620      ld      (hl),$20
038d 3a9c07    ld      a,($079c)
0390 0f        rrca    
0391 0f        rrca    
0392 b6        or      (hl)
0393 77        ld      (hl),a
0394 3a9d07    ld      a,($079d)
0397 07        rlca    
0398 07        rlca    
0399 07        rlca    
039a 07        rlca    
039b b6        or      (hl)
039c 77        ld      (hl),a
039d 3a9e07    ld      a,($079e)
03a0 e60f      and     $0f
03a2 fe00      cp      $00
03a4 c2a900    jp      nz,$00a9
03a7 3e0f      ld      a,$0f
03a9 b6        or      (hl)
03aa 32ff01    ld      ($01ff),a
03ad d30f      out     ($0f),a
03af c9        ret     

03b0 f2c500    jp      p,$00c5
03b3 2f        cpl     
03b4 a2        and     d
03b5 6f        ld      l,a
03b6 cad300    jp      z,$00d3
03b9 3aa707    ld      a,($07a7)
03bc cd5105    call    $0551
03bf 32a707    ld      ($07a7),a
03c2 c3d300    jp      $00d3
03c5 a2        and     d
03c6 6f        ld      l,a
03c7 cad300    jp      z,$00d3
03ca 3aa707    ld      a,($07a7)
03cd cd6b05    call    $056b
03d0 32a707    ld      ($07a7),a
03d3 7c        ld      a,h
03d4 fe00      cp      $00
03d6 cafc00    jp      z,$00fc
03d9 f2ee00    jp      p,$00ee
03dc 2f        cpl     
03dd a2        and     d
03de 67        ld      h,a
03df cafc00    jp      z,$00fc
03e2 3aa807    ld      a,($07a8)
03e5 cd6b05    call    $056b
03e8 32a807    ld      ($07a8),a
03eb c3fc00    jp      $00fc
03ee a2        and     d
03ef 67        ld      h,a
03f0 cafc00    jp      z,$00fc
03f3 3aa807    ld      a,($07a8)
03f6 cd5105    call    $0551
03f9 32a807    ld      ($07a8),a
03fc 7c        ld      a,h
03fd b5        or      l
03fe ca7300    jp      z,$0073
0401 fe60      cp      $60
0403 da0801    jp      c,$0108
0406 3e60      ld      a,$60
0408 6f        ld      l,a
0409 3e70      ld      a,$70
040b 95        sub     l
040c 32a407    ld      ($07a4),a
040f cd1b01    call    $011b
0412 3aa407    ld      a,($07a4)
0415 cdc206    call    $06c2
0418 c34b00    jp      $004b
041b cd2706    call    $0627
041e cdb204    call    $04b2
0421 cd0305    call    $0503
0424 cd7306    call    $0673
0427 cd8005    call    $0580
042a 3a9f07    ld      a,($079f)
042d e681      and     $81
042f ca8100    jp      z,$0081
0432 cd0206    call    $0602
0435 c38100    jp      $0081
0438 cd4301    call    $0143
043b 3e5f      ld      a,$5f
043d cdc206    call    $06c2
0440 c34b00    jp      $004b
0443 1f        rra     
0444 da4f03    jp      c,$034f
0447 1f        rra     
0448 daa203    jp      c,$03a2
044b 1f        rra     
044c da8102    jp      c,$0281
044f 1f        rra     
0450 dab703    jp      c,$03b7
0453 c9        ret     

0454 cdd706    call    $06d7
0457 cd5d01    call    $015d
045a c34b00    jp      $004b
045d e670      and     $70
045f fe30      cp      $30
0461 ca1d02    jp      z,$021d
0464 d2c001    jp      nc,$01c0
0467 78        ld      a,b
0468 e63f      and     $3f
046a 3d        dec     a
046b ca8102    jp      z,$0281
046e 3d        dec     a
046f ca2d03    jp      z,$032d
0472 3d        dec     a
0473 ca4f03    jp      z,$034f
0476 d602      sub     $02
0478 ca3803    jp      z,$0338
047b 3d        dec     a
047c ca3903    jp      z,$0339
047f d602      sub     $02
0481 ca4003    jp      z,$0340
0484 3d        dec     a
0485 ca4803    jp      z,$0348
0488 3d        dec     a
0489 ca7a04    jp      z,$047a
048c 3d        dec     a
048d ca5503    jp      z,$0355
0490 3d        dec     a
0491 ca7e03    jp      z,$037e
0494 d602      sub     $02
0496 ca9703    jp      z,$0397
0499 3d        dec     a
049a caa203    jp      z,$03a2
049d 3d        dec     a
049e cab703    jp      z,$03b7
04a1 3d        dec     a
04a2 ca2704    jp      z,$0427
04a5 3d        dec     a
04a6 ca2c04    jp      z,$042c
04a9 3d        dec     a
04aa ca3204    jp      z,$0432
04ad d605      sub     $05
04af ca1804    jp      z,$0418
04b2 d602      sub     $02
04b4 ca1f04    jp      z,$041f
04b7 3d        dec     a
04b8 c2f703    jp      nz,$03f7
04bb 2aa507    ld      hl,($07a5)
04be f9        ld      sp,hl
04bf c9        ret     

04c0 78        ld      a,b
04c1 e61f      and     $1f
04c3 0e04      ld      c,$04
04c5 d602      sub     $02
04c7 ca0502    jp      z,$0205
04ca 0e06      ld      c,$06
04cc 3d        dec     a
04cd ca0502    jp      z,$0205
04d0 0e02      ld      c,$02
04d2 d604      sub     $04
04d4 ca0502    jp      z,$0205
04d7 0e08      ld      c,$08
04d9 3d        dec     a
04da ca1102    jp      z,$0211
04dd 0e00      ld      c,$00
04df d604      sub     $04
04e1 ca1102    jp      z,$0211
04e4 0e05      ld      c,$05
04e6 3d        dec     a
04e7 ca0502    jp      z,$0205
04ea 0e00      ld      c,$00
04ec 3d        dec     a
04ed ca0502    jp      z,$0205
04f0 0e01      ld      c,$01
04f2 d604      sub     $04
04f4 ca0502    jp      z,$0205
04f7 0e07      ld      c,$07
04f9 d605      sub     $05
04fb ca0502    jp      z,$0205
04fe 0e03      ld      c,$03
0500 d602      sub     $02
0502 c2f703    jp      nz,$03f7
0505 3a9e07    ld      a,($079e)
0508 e608      and     $08
050a b1        or      c
050b 329e07    ld      ($079e),a
050e c38100    jp      $0081
0511 3a9e07    ld      a,($079e)
0514 e607      and     $07
0516 b1        or      c
0517 329e07    ld      ($079e),a
051a c38100    jp      $0081
051d 21a807    ld      hl,$07a8
0520 78        ld      a,b
0521 e60f      and     $0f
0523 3d        dec     a
0524 ca7902    jp      z,$0279
0527 3d        dec     a
0528 ca5802    jp      z,$0258
052b 3d        dec     a
052c ca5302    jp      z,$0253
052f 3d        dec     a
0530 ca6102    jp      z,$0261
0533 3d        dec     a
0534 c8        ret     z

0535 3d        dec     a
0536 ca6902    jp      z,$0269
0539 3d        dec     a
053a ca7102    jp      z,$0271
053d 3d        dec     a
053e ca4a02    jp      z,$024a
0541 3d        dec     a
0542 c2f703    jp      nz,$03f7
0545 7e        ld      a,(hl)
0546 cd5105    call    $0551
0549 77        ld      (hl),a
054a 2b        dec     hl
054b 7e        ld      a,(hl)
054c cd6b05    call    $056b
054f 77        ld      (hl),a
0550 c31b01    jp      $011b
0553 7e        ld      a,(hl)
0554 cd5105    call    $0551
0557 77        ld      (hl),a
0558 2b        dec     hl
0559 7e        ld      a,(hl)
055a cd5105    call    $0551
055d 77        ld      (hl),a
055e c31b01    jp      $011b
0561 7e        ld      a,(hl)
0562 cd6b05    call    $056b
0565 77        ld      (hl),a
0566 c31b01    jp      $011b
0569 7e        ld      a,(hl)
056a cd5105    call    $0551
056d 77        ld      (hl),a
056e c31b01    jp      $011b
0571 7e        ld      a,(hl)
0572 cd6b05    call    $056b
0575 77        ld      (hl),a
0576 c34a02    jp      $024a
0579 7e        ld      a,(hl)
057a cd6b05    call    $056b
057d 77        ld      (hl),a
057e c35802    jp      $0258
0581 cd2706    call    $0627
0584 3a9e07    ld      a,($079e)
0587 32bd07    ld      ($07bd),a
058a 3e0f      ld      a,$0f
058c 329e07    ld      ($079e),a
058f 2aa707    ld      hl,($07a7)
0592 22be07    ld      ($07be),hl
0595 21a807    ld      hl,$07a8
0598 cdca02    call    $02ca
059b 21a707    ld      hl,$07a7
059e cdca02    call    $02ca
05a1 3aa007    ld      a,($07a0)
05a4 fe00      cp      $00
05a6 cac102    jp      z,$02c1
05a9 cdee02    call    $02ee
05ac cd0603    call    $0306
05af cdee02    call    $02ee
05b2 cd1a03    call    $031a
05b5 cdfa02    call    $02fa
05b8 cd0603    call    $0306
05bb cdfa02    call    $02fa
05be cd1a03    call    $031a
05c1 3abd07    ld      a,($07bd)
05c4 329e07    ld      ($079e),a
05c7 c32701    jp      $0127
05ca 97        sub     a
05cb 77        ld      (hl),a
05cc 22c007    ld      ($07c0),hl
05cf cde102    call    $02e1
05d2 7e        ld      a,(hl)
05d3 cd5105    call    $0551
05d6 77        ld      (hl),a
05d7 c2cf02    jp      nz,$02cf
05da 2abe07    ld      hl,($07be)
05dd 22a707    ld      ($07a7),hl
05e0 c9        ret     

05e1 cdb204    call    $04b2
05e4 cd0305    call    $0503
05e7 cd7306    call    $0673
05ea 2ac007    ld      hl,($07c0)
05ed c9        ret     

05ee 7d        ld      a,l
05ef cd6b05    call    $056b
05f2 6f        ld      l,a
05f3 22a707    ld      ($07a7),hl
05f6 21a807    ld      hl,$07a8
05f9 c9        ret     

05fa 7c        ld      a,h
05fb cd5105    call    $0551
05fe 67        ld      h,a
05ff 22a707    ld      ($07a7),hl
0602 21a707    ld      hl,$07a7
0605 c9        ret     

0606 22c007    ld      ($07c0),hl
0609 3aa007    ld      a,($07a0)
060c 86        add     a,(hl)
060d 77        ld      (hl),a
060e cd5205    call    $0552
0611 d2da02    jp      nc,$02da
0614 cde102    call    $02e1
0617 c30903    jp      $0309
061a 22c007    ld      ($07c0),hl
061d 3aa007    ld      a,($07a0)
0620 47        ld      b,a
0621 7e        ld      a,(hl)
0622 90        sub     b
0623 fada02    jp      m,$02da
0626 77        ld      (hl),a
0627 cde102    call    $02e1
062a c31d03    jp      $031d
062d cd2706    call    $0627
0630 3e01      ld      a,$01
0632 329f07    ld      ($079f),a
0635 c32701    jp      $0127
0638 c9        ret     

0639 97        sub     a
063a 329f07    ld      ($079f),a
063d c32706    jp      $0627
0640 3e01      ld      a,$01
0642 329c07    ld      ($079c),a
0645 c31b01    jp      $011b
0648 cdee06    call    $06ee
064b 32a007    ld      ($07a0),a
064e c9        ret     

064f cd2706    call    $0627
0652 c36903    jp      $0369
0655 2a9a07    ld      hl,($079a)
0658 010008    ld      bc,$0800
065b 97        sub     a
065c cd7e06    call    $067e
065f 77        ld      (hl),a
0660 23        inc     hl
0661 0d        dec     c
0662 c25f03    jp      nz,$035f
0665 05        dec     b
0666 c25f03    jp      nz,$035f
0669 3a9c07    ld      a,($079c)
066c 1f        rra     
066d 3e1f      ld      a,$1f
066f d27403    jp      nc,$0374
0672 3e3f      ld      a,$3f
0674 32a807    ld      ($07a8),a
0677 3c        inc     a
0678 32a707    ld      ($07a7),a
067b c32701    jp      $0127
067e 97        sub     a
067f 329c07    ld      ($079c),a
0682 3aa807    ld      a,($07a8)
0685 cd5205    call    $0552
0688 32a807    ld      ($07a8),a
068b 3aa707    ld      a,($07a7)
068e cd5205    call    $0552
0691 32a707    ld      ($07a7),a
0694 c31b01    jp      $011b
0697 cd2706    call    $0627
069a 3e80      ld      a,$80
069c 329f07    ld      ($079f),a
069f c32701    jp      $0127
06a2 97        sub     a
06a3 32a807    ld      ($07a8),a
06a6 3a9c07    ld      a,($079c)
06a9 1f        rra     
06aa 3e3f      ld      a,$3f
06ac d2b103    jp      nc,$03b1
06af 3e7f      ld      a,$7f
06b1 32a707    ld      ($07a7),a
06b4 c31b01    jp      $011b
06b7 21eb03    ld      hl,$03eb
06ba cde003    call    $03e0
06bd 3aa807    ld      a,($07a8)
06c0 cd8b06    call    $068b
06c3 21f203    ld      hl,$03f2
06c6 cde003    call    $03e0
06c9 3aa707    ld      a,($07a7)
06cc 47        ld      b,a
06cd 3a9c07    ld      a,($079c)
06d0 1f        rra     
06d1 3e3f      ld      a,$3f
06d3 d2d803    jp      nc,$03d8
06d6 3e7f      ld      a,$7f
06d8 90        sub     b
06d9 cd8b06    call    $068b
06dc 00        nop     
06dd 00        nop     
06de 00        nop     
06df c9        ret     

06e0 7e        ld      a,(hl)
06e1 fe00      cp      $00
06e3 c8        ret     z

06e4 cde206    call    $06e2
06e7 23        inc     hl
06e8 c3e003    jp      $03e0
06eb 0d        dec     c
06ec 0a        ld      a,(bc)
06ed 7f        ld      a,a
06ee 7f        ld      a,a
06ef 58        ld      e,b
06f0 3d        dec     a
06f1 00        nop     
06f2 2020      jr      nz,$0714
06f4 59        ld      e,c
06f5 3d        dec     a
06f6 00        nop     
06f7 21fe06    ld      hl,$06fe
06fa cde003    call    $03e0
06fd 78        ld      a,b
06fe e67f      and     $7f
0700 47        ld      b,a
0701 fe20      cp      $20
0703 d20e04    jp      nc,$040e
0706 3e5e      ld      a,$5e
0708 cde206    call    $06e2
070b 78        ld      a,b
070c c640      add     a,$40
070e cde206    call    $06e2
0711 210207    ld      hl,$0702
0714 cde003    call    $03e0
0717 c9        ret     

0718 97        sub     a
0719 329d07    ld      ($079d),a
071c c38100    jp      $0081
071f 3e01      ld      a,$01
0721 329d07    ld      ($079d),a
0724 c38100    jp      $0081
0727 97        sub     a
0728 32a107    ld      ($07a1),a
072b c9        ret     

072c 3e01      ld      a,$01
072e 32a107    ld      ($07a1),a
0731 c9        ret     

0732 cdee06    call    $06ee
0735 cd7504    call    $0475
0738 4f        ld      c,a
0739 3a0700    ld      a,($0007)
073c d608      sub     $08
073e b9        cp      c
073f da4904    jp      c,$0449
0742 79        ld      a,c
0743 329b07    ld      ($079b),a
0746 c31b01    jp      $011b
0749 47        ld      b,a
074a 212007    ld      hl,$0720
074d cde003    call    $03e0
0750 78        ld      a,b
0751 d602      sub     $02
0753 1f        rra     
0754 1f        rra     
0755 1f        rra     
0756 e60f      and     $0f
0758 c600      add     a,$00
075a 27        daa     
075b 47        ld      b,a
075c e6f0      and     $f0
075e ca6604    jp      z,$0466
0761 3e31      ld      a,$31
0763 cde206    call    $06e2
0766 78        ld      a,b
0767 e60f      and     $0f
0769 f630      or      $30
076b cde206    call    $06e2
076e 213907    ld      hl,$0739
0771 cde003    call    $03e0
0774 c9        ret     

0775 07        rlca    
0776 37        scf     
0777 17        rla     
0778 07        rlca    
0779 c9        ret     

077a 210a00    ld      hl,$000a
077d 22a007    ld      ($07a0),hl
0780 210f01    ld      hl,$010f
0783 229e07    ld      ($079e),hl
0786 210101    ld      hl,$0101
0789 229c07    ld      ($079c),hl
078c af        xor     a
078d 329a07    ld      ($079a),a
0790 cd7504    call    $0475
0793 329b07    ld      ($079b),a
0796 c9        ret     

0797 7a        ld      a,d
0798 47        ld      b,a
0799 3a9c07    ld      a,($079c)
079c 1f        rra     
079d 7b        ld      a,e
079e 4f        ld      c,a
079f d8        ret     c

07a0 87        add     a,a
07a1 4f        ld      c,a
07a2 78        ld      a,b
07a3 87        add     a,a
07a4 47        ld      b,a
07a5 79        ld      a,c
07a6 c9        ret     

07a7 3aa807    ld      a,($07a8)
07aa 57        ld      d,a
07ab 47        ld      b,a
07ac 3aa707    ld      a,($07a7)
07af 5f        ld      e,a
07b0 4f        ld      c,a
07b1 c9        ret     

07b2 cda704    call    $04a7
07b5 cd9704    call    $0497
07b8 cdbf04    call    $04bf
07bb 22a207    ld      ($07a2),hl
07be c9        ret     

07bf 2a9a07    ld      hl,($079a)
07c2 79        ld      a,c
07c3 fe40      cp      $40
07c5 dae204    jp      c,$04e2
07c8 d640      sub     $40
07ca 4f        ld      c,a
07cb 78        ld      a,b
07cc fe40      cp      $40
07ce dadb04    jp      c,$04db
07d1 d640      sub     $40
07d3 47        ld      b,a
07d4 110006    ld      de,$0600
07d7 19        add     hl,de
07d8 c3ef04    jp      $04ef
07db 110004    ld      de,$0400
07de 19        add     hl,de
07df c3ef04    jp      $04ef
07e2 78        ld      a,b
07e3 fe40      cp      $40
07e5 daef04    jp      c,$04ef
07e8 d640      sub     $40
07ea 47        ld      b,a
07eb 110002    ld      de,$0200
07ee 19        add     hl,de
07ef e6fc      and     $fc
07f1 1f        rra     
07f2 1f        rra     
07f3 5f        ld      e,a
07f4 97        sub     a
07f5 57        ld      d,a
07f6 19        add     hl,de
07f7 97        sub     a
07f8 57        ld      d,a
07f9 79        ld      a,c
07fa e6fe      and     $fe
07fc 5f        ld      e,a
07fd eb        ex      de,hl
07fe 29        add     hl,hl
07ff 29        add     hl,hl
0800 29        add     hl,hl
0801 19        add     hl,de
0802 c9        ret     

0803 cda704    call    $04a7
0806 cd0d05    call    $050d
0809 32a907    ld      ($07a9),a
080c c9        ret     

080d 78        ld      a,b
080e 1f        rra     
080f da3b05    jp      c,$053b
0812 3a9c07    ld      a,($079c)
0815 1f        rra     
0816 da1f05    jp      c,$051f
0819 3a9e07    ld      a,($079e)
081c e60f      and     $0f
081e c9        ret     

081f 3a9e07    ld      a,($079e)
0822 fe00      cp      $00
0824 c8        ret     z

0825 78        ld      a,b
0826 1f        rra     
0827 1f        rra     
0828 da3305    jp      c,$0533
082b 79        ld      a,c
082c 1f        rra     
082d 3e01      ld      a,$01
082f d0        ret     nc

0830 3e04      ld      a,$04
0832 c9        ret     

0833 79        ld      a,c
0834 1f        rra     
0835 3e10      ld      a,$10
0837 d0        ret     nc

0838 3e40      ld      a,$40
083a c9        ret     

083b 3a9c07    ld      a,($079c)
083e 1f        rra     
083f da4c05    jp      c,$054c
0842 3a9e07    ld      a,($079e)
0845 e60f      and     $0f
0847 07        rlca    
0848 07        rlca    
0849 07        rlca    
084a 07        rlca    
084b c9        ret     

084c cd1f05    call    $051f
084f 07        rlca    
0850 c9        ret     

0851 3c        inc     a
0852 32ba07    ld      ($07ba),a
0855 3a9c07    ld      a,($079c)
0858 1f        rra     
0859 3aba07    ld      a,($07ba)
085c d26505    jp      nc,$0565
085f fe80      cp      $80
0861 d8        ret     c

0862 d680      sub     $80
0864 c9        ret     

0865 fe40      cp      $40
0867 d8        ret     c

0868 d640      sub     $40
086a c9        ret     

086b 3d        dec     a
086c f0        ret     p

086d 32ba07    ld      ($07ba),a
0870 3a9c07    ld      a,($079c)
0873 1f        rra     
0874 3aba07    ld      a,($07ba)
0877 d27d05    jp      nc,$057d
087a c680      add     a,$80
087c c9        ret     

087d c640      add     a,$40
087f c9        ret     

0880 3a9e07    ld      a,($079e)
0883 32bb07    ld      ($07bb),a
0886 3e0f      ld      a,$0f
0888 329e07    ld      ($079e),a
088b cda704    call    $04a7
088e 78        ld      a,b
088f cd6b05    call    $056b
0892 47        ld      b,a
0893 57        ld      d,a
0894 cd0d05    call    $050d
0897 32aa07    ld      ($07aa),a
089a cd9704    call    $0497
089d cdbf04    call    $04bf
08a0 22b207    ld      ($07b2),hl
08a3 7e        ld      a,(hl)
08a4 32ae07    ld      ($07ae),a
08a7 cda704    call    $04a7
08aa 79        ld      a,c
08ab cd6b05    call    $056b
08ae 4f        ld      c,a
08af 5f        ld      e,a
08b0 cd0d05    call    $050d
08b3 32ab07    ld      ($07ab),a
08b6 cd9704    call    $0497
08b9 cdbf04    call    $04bf
08bc 22b407    ld      ($07b4),hl
08bf 7e        ld      a,(hl)
08c0 32af07    ld      ($07af),a
08c3 cda704    call    $04a7
08c6 78        ld      a,b
08c7 cd5105    call    $0551
08ca 47        ld      b,a
08cb 57        ld      d,a
08cc cd0d05    call    $050d
08cf 32ac07    ld      ($07ac),a
08d2 cd9704    call    $0497
08d5 cdbf04    call    $04bf
08d8 22b607    ld      ($07b6),hl
08db 7e        ld      a,(hl)
08dc 32b007    ld      ($07b0),a
08df cda704    call    $04a7
08e2 79        ld      a,c
08e3 cd5105    call    $0551
08e6 4f        ld      c,a
08e7 5f        ld      e,a
08e8 cd0d05    call    $050d
08eb 32ad07    ld      ($07ad),a
08ee cd9704    call    $0497
08f1 cdbf04    call    $04bf
08f4 22b807    ld      ($07b8),hl
08f7 7e        ld      a,(hl)
08f8 32b107    ld      ($07b1),a
08fb 3abb07    ld      a,($07bb)
08fe 329e07    ld      ($079e),a
0901 c9        ret     

0902 3aaa07    ld      a,($07aa)
0905 2ab207    ld      hl,($07b2)
0908 cd7306    call    $0673
090b 3aab07    ld      a,($07ab)
090e 2ab407    ld      hl,($07b4)
0911 cd7306    call    $0673
0914 3aac07    ld      a,($07ac)
0917 2ab607    ld      hl,($07b6)
091a cd7306    call    $0673
091d 3aad07    ld      a,($07ad)
0920 2ab807    ld      hl,($07b8)
0923 cd7306    call    $0673
0926 c9        ret     

0927 2ab207    ld      hl,($07b2)
092a 3aae07    ld      a,($07ae)
092d 77        ld      (hl),a
092e 2ab407    ld      hl,($07b4)
0931 3aaf07    ld      a,($07af)
0934 77        ld      (hl),a
0935 2ab607    ld      hl,($07b6)
0938 3ab007    ld      a,($07b0)
093b 77        ld      (hl),a
093c 2ab807    ld      hl,($07b8)
093f 3ab107    ld      a,($07b1)
0942 77        ld      (hl),a
0943 c9        ret     

0944 3a9f07    ld      a,($079f)
0947 17        rla     
0948 da0206    jp      c,$0602
094b 3a9f07    ld      a,($079f)
094e 1f        rra     
094f d22706    jp      nc,$0627
0952 2ab207    ld      hl,($07b2)
0955 3aaa07    ld      a,($07aa)
0958 ae        xor     (hl)
0959 77        ld      (hl),a
095a 2ab407    ld      hl,($07b4)
095d 3aab07    ld      a,($07ab)
0960 ae        xor     (hl)
0961 77        ld      (hl),a
0962 2ab607    ld      hl,($07b6)
0965 3aac07    ld      a,($07ac)
0968 ae        xor     (hl)
0969 77        ld      (hl),a
096a 2ab807    ld      hl,($07b8)
096d 3aad07    ld      a,($07ad)
0970 ae        xor     (hl)
0971 77        ld      (hl),a
0972 c9        ret     

0973 47        ld      b,a
0974 7e        ld      a,(hl)
0975 cd7e06    call    $067e
0978 b0        or      b
0979 cd7e06    call    $067e
097c 77        ld      (hl),a
097d c9        ret     

097e 32bc07    ld      ($07bc),a
0981 3aa107    ld      a,($07a1)
0984 1f        rra     
0985 3abc07    ld      a,($07bc)
0988 d0        ret     nc

0989 2f        cpl     
098a c9        ret     

098b 21bf06    ld      hl,$06bf
098e 5f        ld      e,a
098f 0e20      ld      c,$20
0991 56        ld      d,(hl)
0992 23        inc     hl
0993 0600      ld      b,$00
0995 7a        ld      a,d
0996 fe01      cp      $01
0998 c29c06    jp      nz,$069c
099b 48        ld      c,b
099c 7b        ld      a,e
099d 92        sub     d
099e 5f        ld      e,a
099f faa606    jp      m,$06a6
09a2 04        inc     b
09a3 c39c06    jp      $069c
09a6 82        add     a,d
09a7 5f        ld      e,a
09a8 97        sub     a
09a9 b0        or      b
09aa c2b106    jp      nz,$06b1
09ad b1        or      c
09ae c2b506    jp      nz,$06b5
09b1 f630      or      $30
09b3 0e00      ld      c,$00
09b5 cde206    call    $06e2
09b8 7a        ld      a,d
09b9 fe01      cp      $01
09bb c29106    jp      nz,$0691
09be c9        ret     

09bf 64        ld      h,h
09c0 0a        ld      a,(bc)
09c1 0122be    ld      bc,$be22
09c4 07        rlca    
09c5 6f        ld      l,a
09c6 97        sub     a
09c7 cdd206    call    $06d2
09ca 2d        dec     l
09cb c2c706    jp      nz,$06c7
09ce 2abe07    ld      hl,($07be)
09d1 c9        ret     

09d2 3d        dec     a
09d3 c2d206    jp      nz,$06d2
09d6 c9        ret     
								patched to
09d7 db00      in      a,($00)		key pressed?		cd0980 call 8009
09d9 e640      and     $40					00     nop
09db cad706    jp      z,$06d7		jp if not
09de db01      in      a,($01)		read the key		cd0c80 call 800c
09e0 47        ld      b,a
09e1 c9        ret     

								patched to
09e2 f5        push    af					cd0680 call 8006 conout
09e3 db00      in      a,($00)		wait ready to send      c9     ret
09e5 e680      and     $80                                      00     nop
09e7 cae306    jp      z,$06e3
09ea f1        pop     af                                       
09eb d301      out     ($01),a		conout			
09ed c9        ret     

09ee cdd706    call    $06d7
09f1 e670      and     $70
09f3 fe30      cp      $30
09f5 d1        pop     de
09f6 c2f703    jp      nz,$03f7
09f9 d5        push    de
09fa 78        ld      a,b
09fb e60f      and     $0f
09fd c9        ret     

09fe 0d        dec     c
09ff 0a        ld      a,(bc)
0a00 220022    ld      ($2200),hl
0a03 2069      jr      nz,$0a6e
0a05 73        ld      (hl),e
0a06 2069      jr      nz,$0a71
0a08 6c        ld      l,h
0a09 6c        ld      l,h
0a0a 65        ld      h,l
0a0b 67        ld      h,a
0a0c 61        ld      h,c
0a0d 6c        ld      l,h
0a0e 2063      jr      nz,$0a73
0a10 68        ld      l,b
0a11 61        ld      h,c
0a12 72        ld      (hl),d
0a13 61        ld      h,c
0a14 63        ld      h,e
0a15 74        ld      (hl),h
0a16 65        ld      h,l
0a17 72        ld      (hl),d
0a18 2068      jr      nz,$0a82
0a1a 65        ld      h,l
0a1b 72        ld      (hl),d
0a1c 65        ld      h,l
0a1d 0d        dec     c
0a1e 0a        ld      a,(bc)
0a1f 00        nop     
0a20 0d        dec     c
0a21 0a        ld      a,(bc)
0a22 44        ld      b,h
0a23 61        ld      h,c
0a24 7a        ld      a,d
0a25 7a        ld      a,d
0a26 6c        ld      l,h
0a27 65        ld      h,l
0a28 70        ld      (hl),b
0a29 6c        ld      l,h
0a2a 6f        ld      l,a
0a2b 74        ld      (hl),h
0a2c 206c      jr      nz,$0a9a
0a2e 69        ld      l,c
0a2f 6d        ld      l,l
0a30 69        ld      l,c
0a31 74        ld      (hl),h
0a32 65        ld      h,l
0a33 64        ld      h,h
0a34 2074      jr      nz,$0aaa
0a36 6f        ld      l,a
0a37 2000      jr      nz,$0a39
0a39 2062      jr      nz,$0a9d
0a3b 75        ld      (hl),l
0a3c 66        ld      h,(hl)
0a3d 66        ld      h,(hl)
0a3e 65        ld      h,l
0a3f 72        ld      (hl),d
0a40 73        ld      (hl),e
0a41 2077      jr      nz,$0aba
0a43 69        ld      l,c
0a44 74        ld      (hl),h
0a45 68        ld      l,b
0a46 2074      jr      nz,$0abc
0a48 68        ld      l,b
0a49 69        ld      l,c
0a4a 73        ld      (hl),e
0a4b 2073      jr      nz,$0ac0
0a4d 69        ld      l,c
0a4e 7a        ld      a,d
0a4f 65        ld      h,l
0a50 2043      jr      nz,$0a95
0a52 44        ld      b,h
0a53 4f        ld      c,a
0a54 53        ld      d,e
0a55 0d        dec     c
0a56 0a        ld      a,(bc)
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
0ac2 04        inc     b
0ac3 80        add     a,b
0ac4 00        nop     
0ac5 00        nop     
0ac6 00        nop     
0ac7 00        nop     
0ac8 02        ld      (bc),a
0ac9 40        ld      b,b
0aca 49        ld      c,c
0acb 2081      jr      nz,$0a4e
0acd 010008    ld      bc,$0800
0ad0 222490    ld      ($9024),hl
0ad3 210201    ld      hl,$0102
0ad6 02        ld      (bc),a
0ad7 00        nop     
0ad8 2092      jr      nz,$0a6c
0ada 48        ld      c,b
0adb 49        ld      c,c
0adc 2090      jr      nz,$0a6e
0ade 49        ld      c,c
0adf 24        inc     h
0ae0 24        inc     h
0ae1 90        sub     b
0ae2 84        add     a,h
0ae3 02        ld      (bc),a
0ae4 49        ld      c,c
0ae5 24        inc     h
0ae6 92        sub     d
0ae7 48        ld      c,b
0ae8 49        ld      c,c
0ae9 212222    ld      hl,$2222
0aec 224812    ld      ($1248),hl
0aef 04        inc     b
0af0 44        ld      b,h
0af1 221111    ld      ($1111),hl
0af4 1088      djnz    $0a7e
0af6 88        adc     a,b
0af7 88        adc     a,b
0af8 42        ld      b,d
0af9 24        inc     h
0afa 00        nop     
0afb 41        ld      b,c
0afc 02        ld      (bc),a
0afd 08        ex      af,af'
0afe 1041      djnz    $0b41
0b00 02        ld      (bc),a
0b01 04        inc     b
0b02 09        add     hl,bc
0b03 04        inc     b
0b04 90        sub     b
0b05 49        ld      c,c
0b06 02        ld      (bc),a
0b07 222088    ld      ($8820),hl
0b0a 88        adc     a,b
0b0b 82        add     a,d
0b0c 220888    ld      ($8808),hl
0b0f 88        adc     a,b
0b10 88        adc     a,b
0b11 88        adc     a,b
0b12 92        sub     d
0b13 42        ld      b,d
0b14 49        ld      c,c
0b15 24        inc     h
0b16 90        sub     b
0b17 92        sub     d
0b18 49        ld      c,c
0b19 24        inc     h
0b1a 92        sub     d
0b1b 42        ld      b,d
0b1c 44        ld      b,h
0b1d 49        ld      c,c
0b1e 12        ld      (de),a
0b1f 48        ld      c,b
0b20 44        ld      b,h
0b21 84        add     a,h
0b22 48        ld      c,b
0b23 90        sub     b
0b24 92        sub     d
0b25 49        ld      c,c
0b26 04        inc     b
0b27 49        ld      c,c
0b28 09        add     hl,bc
0b29 09        add     hl,bc
0b2a 09        add     hl,bc
0b2b 24        inc     h
0b2c 49        ld      c,c
0b2d 02        ld      (bc),a
0b2e 08        ex      af,af'
0b2f 90        sub     b
0b30 42        ld      b,d
0b31 24        inc     h
0b32 49        ld      c,c
0b33 24        inc     h
0b34 92        sub     d
0b35 42        ld      b,d
0b36 44        ld      b,h
0b37 82        add     a,d
0b38 12        ld      (de),a
0b39 49        ld      c,c
0b3a 24        inc     h
0b3b 91        sub     c
0b3c 04        inc     b
0b3d 1002      djnz    $0b41
0b3f 2000      jr      nz,$0b41
0b41 48        ld      c,b
0b42 04        inc     b
0b43 2092      jr      nz,$0ad7
0b45 12        ld      (de),a
0b46 12        ld      (de),a
0b47 2089      jr      nz,$0ad2
0b49 00        nop     
0b4a 44        ld      b,h
0b4b 89        adc     a,c
0b4c 00        nop     
0b4d 00        nop     
0b4e 84        add     a,h
0b4f 04        inc     b
0b50 90        sub     b
0b51 010411    ld      bc,$1104
0b54 24        inc     h
0b55 1000      djnz    $0b57
0b57 42        ld      b,d
0b58 09        add     hl,bc
0b59 24        inc     h
0b5a 41        ld      b,c
0b5b 00        nop     
0b5c 80        add     a,b
0b5d 2041      jr      nz,$0ba0
0b5f 00        nop     
0b60 00        nop     
0b61 00        nop     
0b62 04        inc     b
0b63 90        sub     b
0b64 48        ld      c,b
0b65 90        sub     b
0b66 40        ld      b,b
0b67 2000      jr      nz,$0b69
0b69 04        inc     b
0b6a 48        ld      c,b
0b6b 02        ld      (bc),a
0b6c 09        add     hl,bc
0b6d 12        ld      (de),a
0b6e 00        nop     
0b6f 012240    ld      bc,$4022
0b72 24        inc     h
0b73 24        inc     h
0b74 42        ld      b,d
0b75 49        ld      c,c
0b76 224424    ld      ($2444),hl
0b79 92        sub     d
0b7a 24        inc     h
0b7b 42        ld      b,d
0b7c 49        ld      c,c
0b7d 224424    ld      ($2444),hl
0b80 92        sub     d
0b81 24        inc     h
0b82 89        adc     a,c
0b83 24        inc     h
0b84 92        sub     d
0b85 49        ld      c,c
0b86 24        inc     h
0b87 48        ld      c,b
0b88 91        sub     c
0b89 224224    ld      ($2442),hl
0b8c 49        ld      c,c
0b8d 09        add     hl,bc
0b8e 09        add     hl,bc
0b8f 09        add     hl,bc
0b90 011091    ld      bc,$9110
0b93 04        inc     b
0b94 00        nop     
0b95 2044      jr      nz,$0bdb
0b97 08        ex      af,af'
0b98 81        add     a,c
0b99 04        inc     b
0b9a 08        ex      af,af'
0b9b 44        ld      b,h
0b9c 84        add     a,h
0b9d 04        inc     b
0b9e 00        nop     
0b9f 40        ld      b,b
0ba0 80        add     a,b
0ba1 80        add     a,b
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
0bba 3f        ccf     
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
