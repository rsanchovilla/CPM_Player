; Disassembly of the file "E:\Tmp\cpm\pcw\joylios.rsx"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Tuesday, 19 of March 2024 at 11:01 PM
; 
0100 00        nop     
0101 00        nop     
0102 00        nop     
0103 00        nop     
0104 00        nop     
0105 00        nop     
0106 c31b01    jp      $011b
0109 c30600    jp      $0006		call BDOS
010c 07        rlca    
010d 00        nop     
010e ff        rst     $38
010f 00        nop     
0110           db      "JOYLIOS ",0
0119 00        nop     
011a 00        nop     
					BDOS hook
011b 79        ld      a,c		compare func called in c
011c fe3c      cp      $3c		c=60?
011e 20e9      jr      nz,$0109		no, jp to 0109 back to realBDOS
0120 1a        ld      a,(de)		reg a=RSX func calles
0121 b7        or      a
0122 20e5      jr      nz,$0109		not zero -> return
0124 eb        ex      de,hl
0125 23        inc     hl		skip func and
0126 23        inc     hl		num words
0127 5e        ld      e,(hl)		get logo params addr to populate
0128 23        inc     hl
0129 56        ld      d,(hl)
012a 23        inc     hl
012b d5        push    de		push params addr to populate
012c fde1      pop     iy		iy=params addr to populate
012e 5e        ld      e,(hl)		get logo jumpblock addr to populate
012f 23        inc     hl
0130 56        ld      d,(hl)
0131 213c01    ld      hl,$013c		copy jumpblock from 013c
0134 014e00    ld      bc,$004e
0137 edb0      ldir    
0139 c39a01    jp      $019a		continue LIOS initialization

					logo jumpblock
					
013c c32702    jp      $0227	ok init		
013f c32802    jp      $0228	ok bye
0142 c33502    jp      $0235	ok txtmode
0145 c34102    jp      $0241	ok gfxmode
0148 c39602    jp      $0296	ok conin
014b c3a002    jp      $02a0	ok const
014e c3aa02    jp      $02aa	ok conout
0151 c3b802    jp      $02b8	ok clrtext
0154 c3e202    jp      $02e2	ok setcurpos
0157 c30003    jp      $0300	ok scroll
015a c33f03    jp      $033f	ok plot
015d c36c03    jp      $036c	ok draw		on PWC: 778c: jp draw = jp ed6c
0160 c3a403    jp      $03a4	ok bg_set	
0163 c3a503    jp      $03a5	ok clrgfx
0166 c3be03    jp      $03be	ok beep
0169 c3c403    jp      $03c4	ok memtop
016c c3ca03    jp      $03ca		getpix
016f c3da03    jp      $03da	ok listst
0172 c3e403    jp      $03e4	ok list
0175 c39a04    jp      $049a	ok noop		just ret
0178 c39a04    jp      $049a	ok noop
017b c39a04    jp      $049a	ok noop
017e c39a04    jp      $049a	ok noop
0181 c39a04    jp      $049a	ok noop
0184 c3ed03    jp      $03ed		savepic
0187 c33104    jp      $0431		loadpic

018a dd210200  ld      ix,$0002		push BC, pop BC on return, set Z flag if HL=0
018e dd39      add     ix,sp		pop param in HL
0190 e1        pop     hl		return param HL
0191 c5        push    bc
0192 cd9901    call    $0199
0195 c1        pop     bc
0196 7c        ld      a,h
0197 b5        or      l
0198 c9        ret     
0199 e9        jp      (hl)

					LIOS initialization (in PCW this code is at addr eb9a)
					
019a cd9b04    call    $049b		copy BIOS vector
019d cd3005    call    $0530
01a0 305d      jr      nc,$01ff		jr print cannot run, exit to cp/m
01a2 cd9805    call    $0598		call DEVTBL	;57: Address of devices table
01a5 e3        ex      (sp),hl
01a6 00        nop     
01a7 3d        dec     a
01a8 2055      jr      nz,$01ff		jr print cannot run, exit to cp/m
01aa cdc304    call    $04c3		print string
01ad 1b        db      ESC,77h		esc w -> Cancels wrapping at the end of the line
01ae 77ff
01b0 0e2d      ld      c,$2d		BDOS func 45 (F_ERRMODE) - Set action on hardware error
01b2 1efe      ld      e,$fe		set error code is returned in H, error message is printed
01b4 cd0901    call    $0109		call BDOS
01b7 cd8702    call    $0287		get text window size
01ba cd6e05    call    $056e		populate graf window coords, text window coords
01bd 7b        ld      a,e
01be 91        sub     c
01bf 3c        inc     a
01c0 fd7700    ld      (iy+$00),a	a=$1f=31	Text screen height, characters
01c3 fd7704    ld      (iy+$04),a	iy=$8C39 param area
01c6 fd7724    ld      (iy+$24),a
01c9 1f        rra     
01ca 67        ld      h,a
01cb b7        or      a
01cc 1f        rra     
01cd 84        add     a,h
01ce fd7708    ld      (iy+$08),a	a=$16=22	Standard split line
01d1 7a        ld      a,d
01d2 90        sub     b
01d3 3c        inc     a
01d4 fd7702    ld      (iy+$02),a	a=$5a=90	Text screen width, characters
01d7 fd7706    ld      (iy+$06),a
01da 2ad208    ld      hl,($08d2)	08d2=719=$2cf (=x right coord of graf windows)
01dd ed5bd008  ld      de,($08d0)	08d0=0 (=x left coord of graf windows)
01e1 b7        or      a
01e2 ed52      sbc     hl,de
01e4 23        inc     hl
01e5 fd7518    ld      (iy+$18),l	hl=$2d0=720	Graphics screen width, pixels
01e8 fd7419    ld      (iy+$19),h
01eb 2ad608    ld      hl,($08d6)	08d6=$f7=247 (=y bottom coord of graf windows)
01ee ed5bd408  ld      de,($08d4)	08d4=0 (=y top coord of graf windows)
01f2 b7        or      a
01f3 ed52      sbc     hl,de
01f5 23        inc     hl
01f6 fd751a    ld      (iy+$1a),l	hl=$f8=248	Graphics screen height, pixels
01f9 fd741b    ld      (iy+$1b),h
01fc c30001    jp      $0100

					print "cannot run", exit to cp/m
01ff cdc304    call    $04c3
0202 0d        db      13,10,"Can not run in this environment",13,10
0225 ff        db      255
0226 c7        rst     $00
0227 c9        ret     

					jump function bye
					
0228 cdc304    call    $04c3		print string
022b 1b        db      ESC,45h		esc E -> Clears the viewport. The position of the cursor is unaffected.
022c 45        
022d 1b        db      ESC,48h		esc H -> Moves the cursor to its Home position, 
022e 48        
022f 1b        db      ESC,65h		esc e -> Enables the cursor blob
0230 65        
0231 1b        db      ESC,76h		esc v -> Selects wrapping at the end of the line
0232 76ff        
0234 c7        rst     $00		jump WBOOT

					jumpblock txtmode

0235 3eff      ld      a,$ff		
0237 322005    ld      ($0520),a	Echo=$ff -> enable printing on text screen
023a cdc304    call    $04c3		print string
023d 1b        db      ESC,65h		esc e -> Enables the cursor blob
023e 65ff        
0240 c9        ret     

					jumpblock gfxmode

0241 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
0244 dd7e02    ld      a,(ix+$02)	get second param
0247 322005    ld      ($0520),a	Set echo. Echo=$ff -> enable printing on text screen, =0 -> do not output chars to screen
024a b7        or      a
024b 280f      jr      z,$025c		jp if no echo
024d 3d        dec     a
024e f5        push    af
024f cd3a02    call    $023a
0252 cd8702    call    $0287		get text window size
0255 f1        pop     af
0256 81        add     a,c
0257 3d        dec     a
0258 5f        ld      e,a
0259 c36e05    jp      $056e		populate graf window coords, text window coords
025c cdc304    call    $04c3		print string
025f 1b        db      ESC,66h		esc f -> Disables the cursor blob
0260 66ff
0262 cd8702    call    $0287		get text window size
0265 c36e05    jp      $056e		populate graf window coords, text window coords

					Set viewport to BC (b=1st col, c=1st row)
					                DE (b=last col, e=last row)

0268 212020    ld      hl,$2020
026b 09        add     hl,bc
026c 228102    ld      ($0281),hl
026f 7b        ld      a,e
0270 91        sub     c
0271 c620      add     a,$20
0273 6f        ld      l,a
0274 7a        ld      a,d
0275 90        sub     b
0276 c620      add     a,$20
0278 67        ld      h,a
0279 228302    ld      ($0283),hl
027c cdc304    call    $04c3		print string
027f 1b        db      ESC,58h,0,0,0,0	esc X -> ESC X tr le h w -> Sets the text viewport. 
0280 580000        			tr is the row number of the top of the view port plus 32 (#20)
0283 0000ff        			le is the column number of the left hand edge of the viewport plus 32 (#20)
0286 c9        ret     			h is the number of rows in the viewport (ie its height) minus 1 plus 32 (#20)
					w is the number of column in the viewport (ie its width) minus 1 plus 32 (#20)
					The cursor is moved if necessary to a position within the viewport.

0287 e5        push    hl
0288 cd9805    call    $0598		call DEVTBL	;57: Address of devices table
028b bf        cp      a
028c 00        nop     
028d 78        ld      a,b
028e 41        ld      b,c
028f 4f        ld      c,a
0290 6a        ld      l,d
0291 63        ld      h,e
0292 09        add     hl,bc
0293 eb        ex      de,hl
0294 e1        pop     hl
0295 c9        ret     

					jumplock conin

0296 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
0299 cdb704    call    $04b7 		call CONIN
029c 6f        ld      l,a
029d 2600      ld      h,$00
029f c9        ret     

					jumpblock const

02a0 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
02a3 cdb404    call    $04b4		call CONST
02a6 6f        ld      l,a
02a7 2600      ld      h,$00
02a9 c9        ret     

					jumpblock conout

02aa cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
02ad 3a2005    ld      a,($0520)	if Echo=0 -> do not print chars on text screen
02b0 b7        or      a
02b1 c8        ret     z
02b2 dd4e02    ld      c,(ix+$02)
02b5 c3ba04    jp      $04ba		jp CONOUT

					jumpblock clrtext
					
02b8 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
02bb 3a2005    ld      a,($0520)	if Echo=0 -> do not print chars on text screen
02be b7        or      a
02bf c8        ret     z
02c0 cd8702    call    $0287		get text window size
02c3 d5        push    de
02c4 c5        push    bc
02c5 79        ld      a,c
02c6 dd8604    add     a,(ix+$04)
02c9 3d        dec     a
02ca bb        cp      e
02cb 3001      jr      nc,$02ce
02cd 5f        ld      e,a
02ce 79        ld      a,c
02cf dd8602    add     a,(ix+$02)
02d2 3d        dec     a
02d3 4f        ld      c,a
02d4 cd6802    call    $0268		Set viewport to BC, DE
02d7 cdc304    call    $04c3		print string
02da 1b        db      ESC,45h		esc E -> Clears the viewport. The position of the cursor is unaffected
02db 45ff      
02dd c1        pop     bc
02de d1        pop     de
02df c36802    jp      $0268		Set viewport to BC, DE

					jumpblock setcurpos

02e2 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
02e5 3a2005    ld      a,($0520)	if Echo=0 -> do not print chars on text screen
02e8 b7        or      a
02e9 c8        ret     z
02ea dd6e04    ld      l,(ix+$04)
02ed dd6602    ld      h,(ix+$02)

02f0 111f1f    ld      de,$1f1f		print ESC Y to set cursor at HL=rc
02f3 19        add     hl,de
02f4 22fc02    ld      ($02fc),hl
02f7 cdc304    call    $04c3		print string
02fa 1b        db      ESC,59h,0,0	esc Y r c -> Moves the cursor to a given position
02fb 590000ff        
02ff c9        ret     

					jumpblock scroll

0300 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
0303 3a2005    ld      a,($0520)	if Echo=0 -> do not print chars on text screen
0306 b7        or      a
0307 c8        ret     z
0308 cdc304    call    $04c3		print string
030b 1b        db      ESC,66h		esc f -> Disables the cursor blob.
030c 66        
030d 1b        db      ESC,6ah		esc j -> Saves the cursor position
030e 6aff        
0310 cd8702    call    $0287		get text window size
0313 d5        push    de
0314 c5        push    bc
0315 79        ld      a,c
0316 dd8604    add     a,(ix+$04)
0319 3d        dec     a
031a 5f        ld      e,a
031b 79        ld      a,c
031c dd8602    add     a,(ix+$02)
031f 3d        dec     a
0320 4f        ld      c,a
0321 cd6802    call    $0268		Set viewport to BC, DE
0324 dd6e04    ld      l,(ix+$04)
0327 2601      ld      h,$01
0329 cdf002    call    $02f0 		print ESC Y to set cursor at HL=rc
032c 0e0a      ld      c,$0a
032e cdba04    call    $04ba		call CONOUT
0331 c1        pop     bc
0332 d1        pop     de
0333 cd6802    call    $0268		Set viewport to BC, DE
0336 cdc304    call    $04c3		print string
0339 1b        db      ESC,6bh		esc k -> Restores the cursor position as saved by ESC j.
033a 6b        
033b 1b        db      ESC,65h		esc e -> Enables the cursor blob.
033c 65ff
033e c9        ret     

					jumpblock plot. Params x,y,pen,color

033f cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
0342 dd7e07    ld      a,(ix+$07)	a=2 (pen erase?)
0345 cd9b03    call    $039b
0348 dd7e06    ld      a,(ix+$06)	a=1 (color?)
034b cda805    call    $05a8
034e cd5403    call    $0354
0351 c3db05    jp      $05db

0354 ed4bd008  ld      bc,($08d0)	08d0=0 (=x left coord of graf windows)
0358 dd6e02    ld      l,(ix+$02)	get x coord
035b dd6603    ld      h,(ix+$03)	hl=$172=370
035e 09        add     hl,bc
035f eb        ex      de,hl
0360 ed4bd408  ld      bc,($08d4)	08d4=0 (=y top coord of graf windows)
0364 dd6e04    ld      l,(ix+$04)	get y coord
0367 dd6605    ld      h,(ix+$05)	hl=$7e=126
036a 09        add     hl,bc
036b c9        ret     

					jumpblock draw (in PCW this code is at addr ed6c)

036c cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
036f dd7e0b    ld      a,(ix+$0b)	a=2 (pen ?)
0372 cd9b03    call    $039b
0375 dd7e0a    ld      a,(ix+$0a)	a=1 (color?)
0378 cda805    call    $05a8
037b cd5403    call    $0354
037e e5        push    hl
037f d5        push    de
0380 dd6e08    ld      l,(ix+$08)
0383 dd6609    ld      h,(ix+$09)	hl=$7e=126 (=y coord)
0386 09        add     hl,bc
0387 eb        ex      de,hl
0388 ed4bd008  ld      bc,($08d0)	08d0=0 (=x left coord of graf windows)
038c dd6e06    ld      l,(ix+$06)
038f dd6607    ld      h,(ix+$07)	hl=$172=370 (=x coord)
0392 09        add     hl,bc
0393 eb        ex      de,hl
0394 dde1      pop     ix
0396 fde1      pop     iy
0398 c3f606    jp      $06f6
039b fe02      cp      $02
039d 2801      jr      z,$03a0
039f af        xor     a
03a0 3c        inc     a
03a1 c3be05    jp      $05be
03a4 c9        ret     

					jumpblock clrgfx

03a5 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
03a8 dd6e04    ld      l,(ix+$04)	HL=$f7=247: height of graf screen, in pixels
03ab dd6605    ld      h,(ix+$05)	
03ae 23        inc     hl
03af 7c        ld      a,h
03b0 b5        or      l
03b1 c8        ret     z
03b2 2b        dec     hl
03b3 ed4bd408  ld      bc,($08d4)	08d4=0 (=y top coord of graf windows)
03b7 09        add     hl,bc
03b8 dd7e02    ld      a,(ix+$02)	screen color?
03bb c34f08    jp      $084f

03be cdc304    call    $04c3		print string
03c1 07        db      7		bell
03c2 ff        
03c3 c9        ret     

					jumpblock memtop

03c4 2a0600    ld      hl,($0006)	return to of mem
03c7 7c        ld      a,h
03c8 b5        or      l
03c9 c9        ret     

03ca cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
03cd cd5403    call    $0354
03d0 cd2206    call    $0622
03d3 a3        and     e
03d4 210000    ld      hl,$0000
03d7 c8        ret     z
03d8 23        inc     hl
03d9 c9        ret     

					jumpblock listst

03da cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
03dd cdc004    call    $04c0		call PUNCH
03e0 6f        ld      l,a
03e1 2600      ld      h,$00
03e3 c9        ret     
					jumpblock list

03e4 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
03e7 dd4e02    ld      c,(ix+$02)
03ea c3bd04    jp      $04bd		jp LIST

					jumpblock savepic

03ed cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
03f0 cd5a04    call    $045a
03f3 3022      jr      nc,$0417
03f5 cd7704    call    $0477
03f8 3019      jr      nc,$0413
03fa 0680      ld      b,$80
03fc c5        push    bc
03fd e5        push    hl
03fe d5        push    de
03ff cd2206    call    $0622
0402 d1        pop     de
0403 e1        pop     hl
0404 fd7700    ld      (iy+$00),a
0407 cd8204    call    $0482
040a c1        pop     bc
040b 3002      jr      nc,$040f
040d 10ed      djnz    $03fc
040f 210100    ld      hl,$0001
0412 c9        ret     

0413 210000    ld      hl,$0000
0416 c9        ret     

0417 212804    ld      hl,$0428
041a 010900    ld      bc,$0009
041d edb0      ldir    
041f 62        ld      h,d
0420 6b        ld      l,e
0421 2b        dec     hl
0422 0e77      ld      c,$77
0424 edb0      ldir    
0426 18e7      jr      $040f
0428 50        db      "PICTURE"
0429 494354
042c 555245        
042f 1a        ld      a,(de)
0430 00        nop     

					jumpblock loadpic

0431 cd8a01    call    $018a		push BC, pop BC on return, set Z flag if HL=0
0434 cd5a04    call    $045a
0437 3f        ccf     
0438 381a      jr      c,$0454
043a cd7704    call    $0477
043d 3015      jr      nc,$0454
043f 0680      ld      b,$80
0441 c5        push    bc
0442 e5        push    hl
0443 d5        push    de
0444 fd7e00    ld      a,(iy+$00)
0447 cd3a06    call    $063a
044a d1        pop     de
044b e1        pop     hl
044c cd8204    call    $0482
044f c1        pop     bc
0450 3002      jr      nc,$0454
0452 10ed      djnz    $0441
0454 210000    ld      hl,$0000
0457 d0        ret     nc

0458 23        inc     hl
0459 c9        ret     

045a dd5e02    ld      e,(ix+$02)
045d dd5603    ld      d,(ix+$03)
0460 d5        push    de
0461 fde1      pop     iy
0463 dd7e05    ld      a,(ix+$05)
0466 c6ff      add     a,$ff
0468 9f        sbc     a,a
0469 ddb604    or      (ix+$04)
046c c8        ret     z

046d 3d        dec     a
046e 67        ld      h,a
046f 2e00      ld      l,$00
0471 cb3c      srl     h
0473 cb1d      rr      l
0475 37        scf     
0476 c9        ret     

0477 0e5a      ld      c,$5a
0479 cdd604    call    $04d6
047c 29        add     hl,hl
047d 29        add     hl,hl
047e 29        add     hl,hl
047f eb        ex      de,hl
0480 1813      jr      $0495
0482 fd23      inc     iy
0484 010800    ld      bc,$0008
0487 eb        ex      de,hl
0488 09        add     hl,bc
0489 01d002    ld      bc,$02d0
048c ed42      sbc     hl,bc
048e 09        add     hl,bc
048f eb        ex      de,hl
0490 d8        ret     c

0491 110000    ld      de,$0000
0494 23        inc     hl
0495 7c        ld      a,h
0496 b7        or      a
0497 c0        ret     nz

0498 37        scf     
0499 c9        ret     

				noop jumpblok
049a c9        ret     

049b 2a0100    ld      hl,($0001)	get bios addr for WBOOT
049e 23        inc     hl
049f 23        inc     hl
04a0 23        inc     hl
04a1 11b404    ld      de,$04b4		copy BIOS vectors CONST, CONIN, CONOUT, LIST to 04b4
04a4 010c00    ld      bc,$000c
04a7 edb0      ldir    
04a9 d5        push    de		
04aa 111b00    ld      de,$001b		copy $001b as vector for punch
04ad 19        add     hl,de
04ae d1        pop     de
04af 0e03      ld      c,$03
04b1 edb0      ldir    
04b3 c9        ret     

04b4 00        nop     			jp CONST
04b5 00        nop     
04b6 00        nop     
04b7 00        nop     			jp CONIN
04b8 00        nop     
04b9 00        nop     
04ba 00        nop     			jp CONOUT
04bb 00        nop     
04bc 00        nop     
04bd 00        nop     			jp LIST 
04be 00        nop     
04bf 00        nop     
04c0 00        nop     			jp PUNCH
04c1 00        nop     
04c2 00        nop     

04c3 e1        pop     hl		print string following call up to char 255
04c4 d5        push    de
04c5 c5        push    bc
04c6 4e        ld      c,(hl)
04c7 23        inc     hl
04c8 0c        inc     c
04c9 2808      jr      z,$04d3
04cb 0d        dec     c
04cc e5        push    hl
04cd cdba04    call    $04ba		call CONOUT
04d0 e1        pop     hl
04d1 18f3      jr      $04c6
04d3 c1        pop     bc
04d4 d1        pop     de
04d5 e9        jp      (hl)

04d6 0600      ld      b,$00
04d8 58        ld      e,b
04d9 53        ld      d,e
04da 7c        ld      a,h
04db b9        cp      c
04dc 3804      jr      c,$04e2
04de 41        ld      b,c
04df 4b        ld      c,e
04e0 1608      ld      d,$08
04e2 14        inc     d
04e3 7d        ld      a,l
04e4 91        sub     c
04e5 7c        ld      a,h
04e6 98        sbc     a,b
04e7 3807      jr      c,$04f0
04e9 cb21      sla     c
04eb cb10      rl      b
04ed 30f3      jr      nc,$04e2
04ef 3f        ccf     
04f0 3f        ccf     
04f1 7a        ld      a,d
04f2 53        ld      d,e
04f3 180e      jr      $0503
04f5 cb18      rr      b
04f7 cb19      rr      c
04f9 ed42      sbc     hl,bc
04fb 3001      jr      nc,$04fe
04fd 09        add     hl,bc
04fe 3f        ccf     
04ff cb13      rl      e
0501 cb12      rl      d
0503 3d        dec     a
0504 20ef      jr      nz,$04f5
0506 2600      ld      h,$00
0508 c9        ret     

0509 00        nop     
050a 00        nop     
050b 00        nop     
050c 00        nop     
050d 00        nop     
050e 00        nop     
050f 00        nop     
0510 00        nop     
0511 00        nop     
0512 00        nop     
0513 00        nop     
0514 00        nop     
0515 00        nop     
0516 00        nop     
0517 00        nop     
0518 00        nop     
0519 00        nop     
051a 00        nop     
051b 00        nop     
051c 00        nop     
051d 00        nop     
051e 00        nop     
051f 00        nop     
0520 00        nop     
0521 00        nop     
0522 00        nop     
0523 00        nop     
0524 00        nop     
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

0530 3ebf      ld      a,$bf
0532 fe05      cp      $05
0534 d0        ret     nc
0535 2a0100    ld      hl,($0001)	copy BIOS jp DEVTBL	;57: Address of devices table
0538 115700    ld      de,$0057
053b 19        add     hl,de
053c 119805    ld      de,$0598		to 0598
053f 010300    ld      bc,$0003
0542 edb0      ldir    
0544 010000    ld      bc,$0000
0547 111f59    ld      de,$591f
054a cd6e05    call    $056e		populate graf window coords, text window coords
054d af        xor     a
054e 47        ld      b,a
054f cd9b05    call    $059b
0552 3e01      ld      a,$01
0554 47        ld      b,a
0555 cd9b05    call    $059b
0558 af        xor     a
0559 cdb305    call    $05b3
055c 3e01      ld      a,$01
055e cda805    call    $05a8
0561 21ffff    ld      hl,$ffff
0564 cdd705    call    $05d7
0567 3e01      ld      a,$01
0569 cdbe05    call    $05be
056c 37        scf     
056d c9        ret     

					populate graf window coords, text window coords
					
056e 68        ld      l,b		b=0
056f 62        ld      h,d		d=$59=89 (leftmost col=0, rightmost col=89)
0570 22d808    ld      ($08d8),hl	08d8=0 (=first col) 08d9=89=$59 (=last col) Joyce text=90x32
0573 af        xor     a
0574 67        ld      h,a
0575 29        add     hl,hl
0576 29        add     hl,hl
0577 29        add     hl,hl
0578 22d008    ld      ($08d0),hl	08d0=0 (=x left coord of graf windows)
057b 6a        ld      l,d
057c 67        ld      h,a
057d 23        inc     hl
057e 29        add     hl,hl
057f 29        add     hl,hl
0580 29        add     hl,hl
0581 2b        dec     hl
0582 22d208    ld      ($08d2),hl	08d2=719=$2cf (=x right coord of graf windows)
0585 69        ld      l,c
0586 67        ld      h,a
0587 29        add     hl,hl
0588 29        add     hl,hl
0589 29        add     hl,hl
058a 22d408    ld      ($08d4),hl	08d4=0 (=y top coord of graf windows)
058d 6b        ld      l,e		e=$1e=30
058e 67        ld      h,a
058f 23        inc     hl
0590 29        add     hl,hl
0591 29        add     hl,hl
0592 29        add     hl,hl
0593 2b        dec     hl
0594 22d608    ld      ($08d6),hl	08d6=$f7=247 (=y bottom coord of graf windows)
0597 c9        ret     

0598 00        nop     	jp DEVTBL	;57: Address of devices table

0599 00        nop     
059a 00        nop     
059b 21e008    ld      hl,$08e0
059e b7        or      a
059f 2801      jr      z,$05a2
05a1 23        inc     hl
05a2 78        ld      a,b
05a3 c6ff      add     a,$ff
05a5 9f        sbc     a,a
05a6 77        ld      (hl),a
05a7 c9        ret     

05a8 21e008    ld      hl,$08e0
05ab b7        or      a
05ac 2801      jr      z,$05af
05ae 23        inc     hl
05af 22dc08    ld      ($08dc),hl
05b2 c9        ret     

05b3 21e008    ld      hl,$08e0
05b6 b7        or      a
05b7 2801      jr      z,$05ba
05b9 23        inc     hl
05ba 22de08    ld      ($08de),hl
05bd c9        ret     

05be 21f705    ld      hl,$05f7
05c1 3d        dec     a
05c2 280f      jr      z,$05d3
05c4 210b06    ld      hl,$060b
05c7 3d        dec     a
05c8 2809      jr      z,$05d3
05ca 210e06    ld      hl,$060e
05cd 3d        dec     a
05ce 2803      jr      z,$05d3
05d0 211b06    ld      hl,$061b
05d3 22f505    ld      ($05f5),hl
05d6 c9        ret     

05d7 22da08    ld      ($08da),hl
05da c9        ret     

05db cd9b07    call    $079b
05de d0        ret     nc
05df 01f405    ld      bc,$05f4
05e2 cd9805    call    $0598		call DEVTBL	;57: Address of devices table
05e5 e9        jp      (hl)
05e6 00        nop     
05e7 c9        ret     

05e8 e5        push    hl
05e9 2ada08    ld      hl,($08da)
05ec 29        add     hl,hl
05ed 3001      jr      nc,$05f0
05ef 2c        inc     l
05f0 22da08    ld      ($08da),hl
05f3 e1        pop     hl
05f4 c3f705    jp      $05f7
05f7 3023      jr      nc,$061c
05f9 ed4bdc08  ld      bc,($08dc)
05fd 0a        ld      a,(bc)
05fe f5        push    af
05ff cd5206    call    $0652
0602 f1        pop     af
0603 a0        and     b
0604 4f        ld      c,a
0605 78        ld      a,b
0606 2f        cpl     
0607 a6        and     (hl)
0608 b1        or      c
0609 77        ld      (hl),a
060a c9        ret     

060b 38ec      jr      c,$05f9
060d c9        ret     

060e d0        ret     nc

060f cd5206    call    $0652
0612 ed5bdc08  ld      de,($08dc)
0616 1a        ld      a,(de)
0617 a0        and     b
0618 ae        xor     (hl)
0619 77        ld      (hl),a
061a c9        ret     

061b d0        ret     nc

061c ed4bde08  ld      bc,($08de)
0620 18db      jr      $05fd
0622 cd9b07    call    $079b
0625 ed4bde08  ld      bc,($08de)
0629 0a        ld      a,(bc)
062a d0        ret     nc

062b 013406    ld      bc,$0634
062e cd9805    call    $0598		call DEVTBL	;57: Address of devices table
0631 e9        jp      (hl)
0632 00        nop     
0633 c9        ret     

0634 cd5206    call    $0652
0637 7e        ld      a,(hl)
0638 58        ld      e,b
0639 c9        ret     

063a 47        ld      b,a
063b c5        push    bc
063c cd9b07    call    $079b
063f c1        pop     bc
0640 78        ld      a,b
0641 d0        ret     nc

0642 014b06    ld      bc,$064b
0645 cd9805    call    $0598		call DEVTBL	;57: Address of devices table
0648 e9        jp      (hl)
0649 00        nop     
064a c9        ret     

064b f5        push    af
064c cd5206    call    $0652
064f f1        pop     af
0650 77        ld      (hl),a
0651 c9        ret     

0652 0100b6    ld      bc,$b600
0655 29        add     hl,hl
0656 09        add     hl,bc
0657 7e        ld      a,(hl)
0658 23        inc     hl
0659 66        ld      h,(hl)
065a 6f        ld      l,a
065b e6f8      and     $f8
065d 85        add     a,l
065e 6f        ld      l,a
065f cb14      rl      h
0661 4b        ld      c,e
0662 7b        ld      a,e
0663 e6f8      and     $f8
0665 5f        ld      e,a
0666 19        add     hl,de
0667 79        ld      a,c
0668 e607      and     $07
066a c674      add     a,$74
066c 5f        ld      e,a
066d ce06      adc     a,$06
066f 93        sub     e
0670 57        ld      d,a
0671 1a        ld      a,(de)
0672 47        ld      b,a
0673 c9        ret     

0674 80        add     a,b
0675 40        ld      b,b
0676 2010      jr      nz,$0688
0678 08        ex      af,af'
0679 04        inc     b
067a 02        ld      (bc),a
067b 01cd80    ld      bc,$80cd
067e 06d0      ld      b,$d0
0680 fde5      push    iy
0682 dde5      push    ix
0684 cd9006    call    $0690
0687 e5        push    hl
0688 fde1      pop     iy
068a d5        push    de
068b dde1      pop     ix
068d d1        pop     de
068e e1        pop     hl
068f c9        ret     

0690 cd9b07    call    $079b
0693 d8        ret     c

0694 cdcb07    call    $07cb
0697 d0        ret     nc

0698 44        ld      b,h
0699 4d        ld      c,l
069a d5        push    de
069b dde5      push    ix
069d e1        pop     hl
069e 19        add     hl,de
069f cb2c      sra     h
06a1 cb1d      rr      l
06a3 e5        push    hl
06a4 fde5      push    iy
06a6 e1        pop     hl
06a7 09        add     hl,bc
06a8 cb2c      sra     h
06aa cb1d      rr      l
06ac d1        pop     de
06ad b7        or      a
06ae ed42      sbc     hl,bc
06b0 09        add     hl,bc
06b1 2007      jr      nz,$06ba
06b3 e3        ex      (sp),hl
06b4 ed52      sbc     hl,de
06b6 19        add     hl,de
06b7 e3        ex      (sp),hl
06b8 2813      jr      z,$06cd
06ba dde5      push    ix
06bc e3        ex      (sp),hl
06bd b7        or      a
06be ed52      sbc     hl,de
06c0 e1        pop     hl
06c1 2013      jr      nz,$06d6
06c3 fde5      push    iy
06c5 eb        ex      de,hl
06c6 e3        ex      (sp),hl
06c7 ed52      sbc     hl,de
06c9 e1        pop     hl
06ca eb        ex      de,hl
06cb 2009      jr      nz,$06d6
06cd c1        pop     bc
06ce dde5      push    ix
06d0 d1        pop     de
06d1 fde5      push    iy
06d3 e1        pop     hl
06d4 37        scf     
06d5 c9        ret     

06d6 dde3      ex      (sp),ix
06d8 fde5      push    iy
06da c5        push    bc
06db fde1      pop     iy
06dd c5        push    bc
06de cdcb07    call    $07cb
06e1 c1        pop     bc
06e2 fde1      pop     iy
06e4 dde3      ex      (sp),ix
06e6 3803      jr      c,$06eb
06e8 c1        pop     bc
06e9 18a9      jr      $0694
06eb d5        push    de
06ec dde1      pop     ix
06ee e5        push    hl
06ef fde1      pop     iy
06f1 d1        pop     de
06f2 60        ld      h,b
06f3 69        ld      l,c
06f4 189e      jr      $0694
06f6 01ff06    ld      bc,$06ff
06f9 cd9805    call    $0598		call DEVTBL	;57: Address of devices table
06fc e9        jp      (hl)
06fd 00        nop     
06fe c9        ret     

06ff cd7c06    call    $067c
0702 d0        ret     nc

0703 e5        push    hl
0704 dde5      push    ix
0706 e1        pop     hl
0707 b7        or      a
0708 ed52      sbc     hl,de
070a cdc208    call    $08c2
070d 06ff      ld      b,$ff
070f f21707    jp      p,$0717
0712 0601      ld      b,$01
0714 cdab08    call    $08ab
0717 e3        ex      (sp),hl
0718 fde5      push    iy
071a d1        pop     de
071b b7        or      a
071c ed52      sbc     hl,de
071e cdc208    call    $08c2
0721 0e01      ld      c,$01
0723 f22b07    jp      p,$072b
0726 0eff      ld      c,$ff
0728 cdab08    call    $08ab
072b d1        pop     de
072c cdb808    call    $08b8
072f 3e00      ld      a,$00
0731 fa4207    jp      m,$0742
0734 eb        ex      de,hl
0735 78        ld      a,b
0736 41        ld      b,c
0737 4f        ld      c,a
0738 dde5      push    ix
073a fde5      push    iy
073c dde1      pop     ix
073e fde1      pop     iy
0740 3eff      ld      a,$ff
0742 32e808    ld      ($08e8),a
0745 d5        push    de
0746 29        add     hl,hl
0747 22e408    ld      ($08e4),hl
074a ed52      sbc     hl,de
074c e5        push    hl
074d eb        ex      de,hl
074e 29        add     hl,hl
074f cdab08    call    $08ab
0752 22e208    ld      ($08e2),hl
0755 78        ld      a,b
0756 5f        ld      e,a
0757 87        add     a,a
0758 9f        sbc     a,a
0759 57        ld      d,a
075a 79        ld      a,c
075b 32e608    ld      ($08e6),a
075e 87        add     a,a
075f 9f        sbc     a,a
0760 32e708    ld      ($08e7),a
0763 e1        pop     hl
0764 c1        pop     bc
0765 03        inc     bc
0766 c5        push    bc
0767 e5        push    hl
0768 d5        push    de
0769 dde5      push    ix
076b d1        pop     de
076c fde5      push    iy
076e e1        pop     hl
076f 3ae808    ld      a,($08e8)
0772 b7        or      a
0773 2801      jr      z,$0776
0775 eb        ex      de,hl
0776 cde805    call    $05e8
0779 d1        pop     de
077a e1        pop     hl
077b 7c        ld      a,h
077c 87        add     a,a
077d 380e      jr      c,$078d
077f b5        or      l
0780 280b      jr      z,$078d
0782 ed4be608  ld      bc,($08e6)
0786 fd09      add     iy,bc
0788 ed4be208  ld      bc,($08e2)
078c 09        add     hl,bc
078d ed4be408  ld      bc,($08e4)
0791 09        add     hl,bc
0792 dd19      add     ix,de
0794 c1        pop     bc
0795 0b        dec     bc
0796 78        ld      a,b
0797 b1        or      c
0798 20cc      jr      nz,$0766
079a c9        ret     

079b ed4bd408  ld      bc,($08d4)	08d4=0 (=y top coord of graf windows)
079f cdbe08    call    $08be
07a2 fac907    jp      m,$07c9
07a5 ed4bd608  ld      bc,($08d6)	08d6=$f7=247 (=y bottom coord of graf windows)
07a9 cdbe08    call    $08be
07ac 2803      jr      z,$07b1
07ae f2c907    jp      p,$07c9
07b1 ed4bd008  ld      bc,($08d0)	08d0=0 (=x left coord of graf windows)
07b5 cdb208    call    $08b2
07b8 fac907    jp      m,$07c9
07bb ed4bd208  ld      bc,($08d2)	08d2=719=$2cf (=x right coord of graf windows)
07bf cdb208    call    $08b2
07c2 2803      jr      z,$07c7
07c4 f2c907    jp      p,$07c9
07c7 37        scf     
07c8 c9        ret     

07c9 b7        or      a
07ca c9        ret     

07cb dde5      push    ix
07cd e3        ex      (sp),hl
07ce ed4bd008  ld      bc,($08d0)	08d0=0 (=x left coord of graf windows)
07d2 cdf307    call    $07f3
07d5 ed4bd208  ld      bc,($08d2)	08d2=719=$2cf (=x right coord of graf windows)
07d9 dcfd07    call    c,$07fd
07dc e1        pop     hl
07dd d0        ret     nc

07de eb        ex      de,hl
07df fde5      push    iy
07e1 e3        ex      (sp),hl
07e2 ed4bd408  ld      bc,($08d4)	08d4=0 (=y top coord of graf windows)
07e6 cdf307    call    $07f3
07e9 ed4bd608  ld      bc,($08d6)	08d6=$f7=247 (=y bottom coord of graf windows)
07ed dcfd07    call    c,$07fd
07f0 e1        pop     hl
07f1 eb        ex      de,hl
07f2 c9        ret     

07f3 cdbe08    call    $08be
07f6 fcb208    call    m,$08b2
07f9 37        scf     
07fa f0        ret     p

07fb b7        or      a
07fc c9        ret     

07fd cdbe08    call    $08be
0800 37        scf     
0801 f8        ret     m

0802 c8        ret     z

0803 cdb208    call    $08b2
0806 37        scf     
0807 f8        ret     m

0808 c8        ret     z

0809 b7        or      a
080a c9        ret     

080b 011408    ld      bc,$0814
080e cd9805    call    $0598		call DEVTBL	;57: Address of devices table
0811 e9        jp      (hl)
0812 00        nop     
0813 c9        ret     

0814 dde5      push    ix
0816 e5        push    hl
0817 6f        ld      l,a
0818 2600      ld      h,$00
081a 29        add     hl,hl
081b 29        add     hl,hl
081c 29        add     hl,hl
081d 0100b8    ld      bc,$b800
0820 09        add     hl,bc
0821 e5        push    hl
0822 dde1      pop     ix
0824 e1        pop     hl
0825 0608      ld      b,$08
0827 d5        push    de
0828 c5        push    bc
0829 dd4e00    ld      c,(ix+$00)
082c dd23      inc     ix
082e 0608      ld      b,$08
0830 c5        push    bc
0831 cd9b07    call    $079b
0834 c1        pop     bc
0835 300b      jr      nc,$0842
0837 79        ld      a,c
0838 87        add     a,a
0839 e5        push    hl
083a d5        push    de
083b c5        push    bc
083c cdf405    call    $05f4
083f c1        pop     bc
0840 d1        pop     de
0841 e1        pop     hl
0842 cb21      sla     c
0844 13        inc     de
0845 10e9      djnz    $0830
0847 c1        pop     bc
0848 d1        pop     de
0849 23        inc     hl
084a 10db      djnz    $0827
084c dde1      pop     ix
084e c9        ret     

084f 015808    ld      bc,$0858
0852 cd9805    call    $0598		call DEVTBL	;57: Address of devices table
0855 e9        jp      (hl)
0856 00        nop     
0857 c9        ret     

0858 47        ld      b,a
0859 ed5bd408  ld      de,($08d4)	08d4=0 (=y top coord of graf windows)
085d af        xor     a
085e ed52      sbc     hl,de
0860 23        inc     hl
0861 b4        or      h
0862 f8        ret     m

0863 b5        or      l
0864 c8        ret     z

0865 65        ld      h,l
0866 e5        push    hl
0867 78        ld      a,b
0868 21e008    ld      hl,$08e0
086b b7        or      a
086c 2801      jr      z,$086f
086e 23        inc     hl
086f 4e        ld      c,(hl)
0870 2ad408    ld      hl,($08d4)	08d4=0 (=y top coord of graf windows)
0873 29        add     hl,hl
0874 1100b6    ld      de,$b600
0877 19        add     hl,de
0878 e5        push    hl
0879 3ad908    ld      a,($08d9)	08d8=0 (=first col) 08d9=89=$59 (=last col)
087c 21d808    ld      hl,$08d8		08d8=0 (=first col) 08d9=89=$59 (=last col)
087f 96        sub     (hl)
0880 3c        inc     a
0881 47        ld      b,a
0882 6e        ld      l,(hl)
0883 2600      ld      h,$00
0885 29        add     hl,hl
0886 29        add     hl,hl
0887 29        add     hl,hl
0888 eb        ex      de,hl
0889 e1        pop     hl
088a f1        pop     af
088b f5        push    af
088c c5        push    bc
088d d5        push    de
088e e5        push    hl
088f 7e        ld      a,(hl)
0890 23        inc     hl
0891 66        ld      h,(hl)
0892 6f        ld      l,a
0893 e6f8      and     $f8
0895 85        add     a,l
0896 6f        ld      l,a
0897 cb14      rl      h
0899 19        add     hl,de
089a 110800    ld      de,$0008
089d 71        ld      (hl),c
089e 19        add     hl,de
089f 10fc      djnz    $089d
08a1 e1        pop     hl
08a2 23        inc     hl
08a3 23        inc     hl
08a4 d1        pop     de
08a5 c1        pop     bc
08a6 f1        pop     af
08a7 3d        dec     a
08a8 20e1      jr      nz,$088b
08aa c9        ret     

08ab af        xor     a
08ac 95        sub     l
08ad 6f        ld      l,a
08ae 9c        sbc     a,h
08af 95        sub     l
08b0 67        ld      h,a
08b1 c9        ret     

08b2 eb        ex      de,hl
08b3 cdbe08    call    $08be
08b6 eb        ex      de,hl
08b7 c9        ret     

08b8 b7        or      a
08b9 ed52      sbc     hl,de
08bb 19        add     hl,de
08bc 1804      jr      $08c2
08be b7        or      a
08bf ed42      sbc     hl,bc
08c1 09        add     hl,bc
08c2 e0        ret     po

08c3 fac908    jp      m,$08c9
08c6 f680      or      $80
08c8 c9        ret     

08c9 e67f      and     $7f
08cb c9        ret     

08cc 00        nop     
08cd 00        nop     
08ce 00        nop     
08cf 00        nop     
08d0 00        nop     
08d1 00        nop     
08d2 00        nop     
08d3 00        nop     
08d4 00        nop     
08d5 00        nop     
08d6 00        nop     
08d7 00        nop     
08d8 00        nop     
08d9 00        nop     
08da 00        nop     
08db 00        nop     
08dc 00        nop     
08dd 00        nop     
08de 00        nop     
08df 00        nop     
08e0 00        nop     
08e1 00        nop     
08e2 00        nop     
08e3 00        nop     
08e4 00        nop     
08e5 00        nop     
08e6 00        nop     
08e7 00        nop     
08e8 00        nop     
08e9 00        nop     
08ea 00        nop     
08eb 00        nop     
08ec 00        nop     
08ed 00        nop     
08ee 00        nop     
08ef 00        nop     
08f0 00        nop     
08f1 80        add     a,b
08f2 00        nop     
08f3 00        nop     
08f4 00        nop     
08f5 00        nop     
08f6 1012      djnz    $090a
08f8 49        ld      c,c
08f9 24        inc     h
08fa 92        sub     d
08fb 49        ld      c,c
08fc 24        inc     h
08fd 92        sub     d
08fe 49        ld      c,c
08ff 24        inc     h
0900 92        sub     d
0901 40        ld      b,b
0902 08        ex      af,af'
0903 09        add     hl,bc
0904 08        ex      af,af'
0905 08        ex      af,af'
0906 02        ld      (bc),a
0907 48        ld      c,b
0908 00        nop     
0909 00        nop     
090a 00        nop     
090b 08        ex      af,af'
090c 80        add     a,b
090d 04        inc     b
090e 40        ld      b,b
090f 00        nop     
0910 40        ld      b,b
0911 00        nop     
0912 00        nop     
0913 00        nop     
0914 00        nop     
0915 2000      jr      nz,$0917
0917 48        ld      c,b
0918 1040      djnz    $095a
091a 48        ld      c,b
091b 12        ld      (de),a
091c 09        add     hl,bc
091d 02        ld      (bc),a
091e 00        nop     
091f 12        ld      (de),a
0920 00        nop     
0921 2000      jr      nz,$0923
0923 90        sub     b
0924 24        inc     h
0925 09        add     hl,bc
0926 012420    ld      bc,$2024
0929 00        nop     
092a 02        ld      (bc),a
092b 40        ld      b,b
092c 49        ld      c,c
092d 00        nop     
092e 02        ld      (bc),a
092f 40        ld      b,b
0930 24        inc     h
0931 2020      jr      nz,$0953
0933 00        nop     
0934 1010      djnz    $0946
0936 84        add     a,h
0937 80        add     a,b
0938 41        ld      b,c
0939 04        inc     b
093a 91        sub     c
093b 00        nop     
093c 1002      djnz    $0940
093e 08        ex      af,af'
093f 24        inc     h
0940 00        nop     
0941 1000      djnz    $0943
0943 2011      jr      nz,$0956
0945 00        nop     
0946 02        ld      (bc),a
0947 04        inc     b
0948 80        add     a,b
0949 09        add     hl,bc
094a 2009      jr      nz,$0955
094c 02        ld      (bc),a
094d 09        add     hl,bc
094e 210040    ld      hl,$4000
0951 40        ld      b,b
0952 00        nop     
0953 40        ld      b,b
0954 00        nop     
0955 00        nop     
0956 12        ld      (de),a
0957 08        ex      af,af'
0958 00        nop     
0959 42        ld      b,d
095a 00        nop     
095b 00        nop     
095c 00        nop     
095d 00        nop     
095e 00        nop     
095f 1000      djnz    $0961
0961 00        nop     
0962 00        nop     
0963 00        nop     
0964 1000      djnz    $0966
0966 00        nop     
0967 00        nop     
0968 00        nop     
0969 010000    ld      bc,$0000
096c 00        nop     
096d 00        nop     
096e 00        nop     
096f 00        nop     
0970 00        nop     
0971 00        nop     
0972 00        nop     
0973 00        nop     
0974 00        nop     
0975 00        nop     
0976 1002      djnz    $097a
0978 00        nop     
0979 08        ex      af,af'
097a 41        ld      b,c
097b 1082      djnz    $08ff
097d 1020      djnz    $099f
097f 2008      jr      nz,$0989
0981 08        ex      af,af'
0982 02        ld      (bc),a
0983 04        inc     b
0984 00        nop     
0985 2044      jr      nz,$09cb
0987 08        ex      af,af'
0988 82        add     a,d
0989 08        ex      af,af'
098a 24        inc     h
098b 44        ld      b,h
098c 48        ld      c,b
098d 1022      djnz    $09b1
098f 08        ex      af,af'
0990 40        ld      b,b
0991 00        nop     
0992 44        ld      b,h
0993 010884    ld      bc,$8408
0996 82        add     a,d
0997 02        ld      (bc),a
0998 09        add     hl,bc
0999 02        ld      (bc),a
099a 00        nop     
099b 00        nop     
099c 00        nop     
099d 02        ld      (bc),a
099e 00        nop     
099f 02        ld      (bc),a
09a0 02        ld      (bc),a
09a1 00        nop     
09a2 220000    ld      ($0000),hl
09a5 00        nop     
09a6 00        nop     
09a7 00        nop     
09a8 00        nop     
09a9 00        nop     
09aa 00        nop     
09ab 00        nop     
09ac 80        add     a,b
09ad 00        nop     
09ae 00        nop     
09af 90        sub     b
09b0 40        ld      b,b
09b1 08        ex      af,af'
09b2 42        ld      b,d
09b3 00        nop     
09b4 84        add     a,h
09b5 221000    ld      ($0010),hl
09b8 08        ex      af,af'
09b9 40        ld      b,b
09ba 48        ld      c,b
09bb 04        inc     b
09bc 2000      jr      nz,$09be
09be 40        ld      b,b
09bf 80        add     a,b
09c0 04        inc     b
09c1 1080      djnz    $0943
09c3 02        ld      (bc),a
09c4 48        ld      c,b
09c5 90        sub     b
09c6 89        adc     a,c
09c7 224200    ld      ($0042),hl
09ca 48        ld      c,b
09cb 90        sub     b
09cc 04        inc     b
09cd 89        adc     a,c
09ce 04        inc     b
09cf 81        add     a,c
09d0 04        inc     b
09d1 04        inc     b
09d2 80        add     a,b
09d3 00        nop     
09d4 00        nop     
09d5 00        nop     
09d6 1002      djnz    $09da
09d8 00        nop     
09d9 00        nop     
09da 48        ld      c,b
09db 08        ex      af,af'
09dc 00        nop     
09dd 2020      jr      nz,$09ff
09df 12        ld      (de),a
09e0 00        nop     
09e1 00        nop     
09e2 00        nop     
09e3 00        nop     
09e4 00        nop     
09e5 00        nop     
09e6 04        inc     b
09e7 00        nop     
09e8 04        inc     b
09e9 00        nop     
09ea 00        nop     
09eb 00        nop     
09ec 00        nop     
09ed 00        nop     
09ee 1a        ld      a,(de)
09ef 00        nop     
09f0 00        nop     
09f1 00        nop     
09f2 00        nop     
09f3 00        nop     
09f4 00        nop     
09f5 00        nop     
09f6 00        nop     
09f7 00        nop     
09f8 00        nop     
09f9 00        nop     
09fa 00        nop     
09fb 00        nop     
09fc 00        nop     
09fd 00        nop     
09fe 00        nop     
09ff 00        nop     
0a00 00        nop     
0a01 00        nop     
0a02 00        nop     
0a03 00        nop     
0a04 00        nop     
0a05 00        nop     
0a06 00        nop     
0a07 00        nop     
0a08 00        nop     
0a09 00        nop     
0a0a 00        nop     
0a0b 00        nop     
0a0c 00        nop     
0a0d 00        nop     
0a0e 00        nop     
0a0f 00        nop     
0a10 00        nop     
0a11 00        nop     
0a12 00        nop     
0a13 00        nop     
0a14 00        nop     
0a15 00        nop     
0a16 00        nop     
0a17 00        nop     
0a18 00        nop     
0a19 00        nop     
0a1a 00        nop     
0a1b 00        nop     
0a1c 00        nop     
0a1d 00        nop     
0a1e 00        nop     
0a1f 00        nop     
0a20 00        nop     
0a21 00        nop     
0a22 00        nop     
0a23 00        nop     
0a24 00        nop     
0a25 00        nop     
0a26 00        nop     
0a27 00        nop     
0a28 00        nop     
0a29 00        nop     
0a2a 00        nop     
0a2b 00        nop     
0a2c 00        nop     
0a2d 00        nop     
0a2e 00        nop     
0a2f 00        nop     
0a30 00        nop     
0a31 00        nop     
0a32 00        nop     
0a33 00        nop     
0a34 00        nop     
0a35 00        nop     
0a36 00        nop     
0a37 00        nop     
0a38 00        nop     
0a39 00        nop     
0a3a 00        nop     
0a3b 00        nop     
0a3c 00        nop     
0a3d 00        nop     
0a3e 00        nop     
0a3f 00        nop     
0a40 00        nop     
0a41 00        nop     
0a42 00        nop     
0a43 00        nop     
0a44 00        nop     
0a45 00        nop     
0a46 00        nop     
0a47 00        nop     
0a48 00        nop     
0a49 00        nop     
0a4a 00        nop     
0a4b 00        nop     
0a4c 00        nop     
0a4d 00        nop     
0a4e 00        nop     
0a4f 00        nop     
0a50 00        nop     
0a51 00        nop     
0a52 00        nop     
0a53 00        nop     
0a54 00        nop     
0a55 00        nop     
0a56 00        nop     
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
0ac2 00        nop     
0ac3 00        nop     
0ac4 00        nop     
0ac5 00        nop     
0ac6 00        nop     
0ac7 00        nop     
0ac8 00        nop     
0ac9 00        nop     
0aca 00        nop     
0acb 00        nop     
0acc 00        nop     
0acd 00        nop     
0ace 00        nop     
0acf 00        nop     
0ad0 00        nop     
0ad1 00        nop     
0ad2 00        nop     
0ad3 00        nop     
0ad4 00        nop     
0ad5 00        nop     
0ad6 00        nop     
0ad7 00        nop     
0ad8 00        nop     
0ad9 00        nop     
0ada 00        nop     
0adb 00        nop     
0adc 00        nop     
0add 00        nop     
0ade 00        nop     
0adf 00        nop     
0ae0 00        nop     
0ae1 00        nop     
0ae2 00        nop     
0ae3 00        nop     
0ae4 00        nop     
0ae5 00        nop     
0ae6 00        nop     
0ae7 00        nop     
0ae8 00        nop     
0ae9 00        nop     
0aea 00        nop     
0aeb 00        nop     
0aec 00        nop     
0aed 00        nop     
0aee 00        nop     
0aef 00        nop     
0af0 00        nop     
0af1 00        nop     
0af2 00        nop     
0af3 00        nop     
0af4 00        nop     
0af5 00        nop     
0af6 00        nop     
0af7 00        nop     
0af8 00        nop     
0af9 00        nop     
0afa 00        nop     
0afb 00        nop     
0afc 00        nop     
0afd 00        nop     
0afe 00        nop     
0aff 00        nop     
0b00 00        nop     
0b01 00        nop     
0b02 00        nop     
0b03 00        nop     
0b04 00        nop     
0b05 00        nop     
0b06 00        nop     
0b07 00        nop     
0b08 00        nop     
0b09 00        nop     
0b0a 00        nop     
0b0b 00        nop     
0b0c 00        nop     
0b0d 00        nop     
0b0e 00        nop     
0b0f 00        nop     
0b10 00        nop     
0b11 00        nop     
0b12 00        nop     
0b13 00        nop     
0b14 00        nop     
0b15 00        nop     
0b16 00        nop     
0b17 00        nop     
0b18 00        nop     
0b19 00        nop     
0b1a 00        nop     
0b1b 00        nop     
0b1c 00        nop     
0b1d 00        nop     
0b1e 00        nop     
0b1f 00        nop     
0b20 00        nop     
0b21 00        nop     
0b22 00        nop     
0b23 00        nop     
0b24 00        nop     
0b25 00        nop     
0b26 00        nop     
0b27 00        nop     
0b28 00        nop     
0b29 00        nop     
0b2a 00        nop     
0b2b 00        nop     
0b2c 00        nop     
0b2d 00        nop     
0b2e 00        nop     
0b2f 00        nop     
0b30 00        nop     
0b31 00        nop     
0b32 00        nop     
0b33 00        nop     
0b34 00        nop     
0b35 00        nop     
0b36 00        nop     
0b37 00        nop     
0b38 00        nop     
0b39 00        nop     
0b3a 00        nop     
0b3b 00        nop     
0b3c 00        nop     
0b3d 00        nop     
0b3e 00        nop     
0b3f 00        nop     
0b40 00        nop     
0b41 00        nop     
0b42 00        nop     
0b43 00        nop     
0b44 00        nop     
0b45 00        nop     
0b46 00        nop     
0b47 00        nop     
0b48 00        nop     
0b49 00        nop     
0b4a 00        nop     
0b4b 00        nop     
0b4c 00        nop     
0b4d 00        nop     
0b4e 00        nop     
0b4f 00        nop     
0b50 00        nop     
0b51 00        nop     
0b52 00        nop     
0b53 00        nop     
0b54 00        nop     
0b55 00        nop     
0b56 00        nop     
0b57 00        nop     
0b58 00        nop     
0b59 00        nop     
0b5a 00        nop     
0b5b 00        nop     
0b5c 00        nop     
0b5d 00        nop     
0b5e 00        nop     
0b5f 00        nop     
0b60 00        nop     
0b61 00        nop     
0b62 00        nop     
0b63 00        nop     
0b64 00        nop     
0b65 00        nop     
0b66 00        nop     
0b67 00        nop     
0b68 00        nop     
0b69 00        nop     
0b6a 00        nop     
0b6b 00        nop     
0b6c 00        nop     
0b6d 00        nop     
0b6e 00        nop     
0b6f 00        nop     
0b70 00        nop     
0b71 00        nop     
0b72 00        nop     
0b73 00        nop     
0b74 00        nop     
0b75 00        nop     
0b76 00        nop     
0b77 00        nop     
0b78 00        nop     
0b79 00        nop     
0b7a 00        nop     
0b7b 00        nop     
0b7c 00        nop     
0b7d 00        nop     
0b7e 00        nop     
0b7f 00        nop     
0b80 00        nop     
0b81 00        nop     
0b82 00        nop     
0b83 00        nop     
0b84 00        nop     
0b85 00        nop     
0b86 00        nop     
0b87 00        nop     
0b88 00        nop     
0b89 00        nop     
0b8a 00        nop     
0b8b 00        nop     
0b8c 00        nop     
0b8d 00        nop     
0b8e 00        nop     
0b8f 00        nop     
0b90 00        nop     
0b91 00        nop     
0b92 00        nop     
0b93 00        nop     
0b94 00        nop     
0b95 00        nop     
0b96 00        nop     
0b97 00        nop     
0b98 00        nop     
0b99 00        nop     
0b9a 00        nop     
0b9b 00        nop     
0b9c 00        nop     
0b9d 00        nop     
0b9e 00        nop     
0b9f 00        nop     
0ba0 00        nop     
0ba1 00        nop     
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
0bba 00        nop     
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
0c2c 00        nop     
0c2d 00        nop     
0c2e 00        nop     
0c2f 00        nop     
0c30 00        nop     
0c31 00        nop     
0c32 00        nop     
0c33 00        nop     
0c34 00        nop     
0c35 00        nop     
0c36 00        nop     
0c37 00        nop     
0c38 00        nop     
0c39 00        nop     
0c3a 00        nop     
0c3b 00        nop     
0c3c 00        nop     
0c3d 00        nop     
0c3e 00        nop     
0c3f 00        nop     
0c40 00        nop     
0c41 00        nop     
0c42 00        nop     
0c43 00        nop     
0c44 00        nop     
0c45 00        nop     
0c46 00        nop     
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
0c81 00        nop     
0c82 00        nop     
0c83 00        nop     
0c84 00        nop     
0c85 00        nop     
0c86 00        nop     
0c87 00        nop     
0c88 00        nop     
0c89 00        nop     
0c8a 00        nop     
0c8b 00        nop     
0c8c 00        nop     
0c8d 00        nop     
0c8e 00        nop     
0c8f 00        nop     
0c90 00        nop     
0c91 00        nop     
0c92 00        nop     
0c93 00        nop     
0c94 00        nop     
0c95 00        nop     
0c96 00        nop     
0c97 00        nop     
0c98 00        nop     
0c99 00        nop     
0c9a 00        nop     
0c9b 00        nop     
0c9c 00        nop     
0c9d 00        nop     
0c9e 00        nop     
0c9f 00        nop     
0ca0 00        nop     
0ca1 00        nop     
0ca2 00        nop     
0ca3 00        nop     
0ca4 00        nop     
0ca5 00        nop     
0ca6 00        nop     
0ca7 00        nop     
0ca8 00        nop     
0ca9 00        nop     
0caa 00        nop     
0cab 00        nop     
0cac 00        nop     
0cad 00        nop     
0cae 00        nop     
0caf 00        nop     
0cb0 00        nop     
0cb1 00        nop     
0cb2 00        nop     
0cb3 00        nop     
0cb4 00        nop     
0cb5 00        nop     
0cb6 00        nop     
0cb7 00        nop     
0cb8 00        nop     
0cb9 00        nop     
0cba 00        nop     
0cbb 00        nop     
0cbc 00        nop     
0cbd 00        nop     
0cbe 00        nop     
0cbf 00        nop     
0cc0 00        nop     
0cc1 00        nop     
0cc2 00        nop     
0cc3 00        nop     
0cc4 00        nop     
0cc5 00        nop     
0cc6 00        nop     
0cc7 00        nop     
0cc8 00        nop     
0cc9 00        nop     
0cca 00        nop     
0ccb 00        nop     
0ccc 00        nop     
0ccd 00        nop     
0cce 00        nop     
0ccf 00        nop     
0cd0 00        nop     
0cd1 00        nop     
0cd2 00        nop     
0cd3 00        nop     
0cd4 00        nop     
0cd5 00        nop     
0cd6 00        nop     
0cd7 00        nop     
0cd8 00        nop     
0cd9 00        nop     
0cda 00        nop     
0cdb 00        nop     
0cdc 00        nop     
0cdd 00        nop     
0cde 00        nop     
0cdf 00        nop     
0ce0 00        nop     
0ce1 00        nop     
0ce2 00        nop     
0ce3 00        nop     
0ce4 00        nop     
0ce5 00        nop     
0ce6 00        nop     
0ce7 00        nop     
0ce8 00        nop     
0ce9 00        nop     
0cea 00        nop     
0ceb 00        nop     
0cec 00        nop     
0ced 00        nop     
0cee 00        nop     
0cef 00        nop     
0cf0 00        nop     
0cf1 00        nop     
0cf2 00        nop     
0cf3 00        nop     
0cf4 00        nop     
0cf5 00        nop     
0cf6 00        nop     
0cf7 00        nop     
0cf8 00        nop     
0cf9 00        nop     
0cfa 00        nop     
0cfb 00        nop     
0cfc 00        nop     
0cfd 00        nop     
0cfe 00        nop     
0cff 00        nop     
0d00 00        nop     
0d01 00        nop     
0d02 00        nop     
0d03 00        nop     
0d04 00        nop     
0d05 00        nop     
0d06 00        nop     
0d07 00        nop     
0d08 00        nop     
0d09 00        nop     
0d0a 00        nop     
0d0b 00        nop     
0d0c 00        nop     
0d0d 00        nop     
0d0e 00        nop     
0d0f 00        nop     
0d10 00        nop     
0d11 00        nop     
0d12 00        nop     
0d13 00        nop     
0d14 00        nop     
0d15 00        nop     
0d16 00        nop     
0d17 00        nop     
0d18 00        nop     
0d19 00        nop     
0d1a 00        nop     
0d1b 00        nop     
0d1c 00        nop     
0d1d 00        nop     
0d1e 00        nop     
0d1f 00        nop     
0d20 00        nop     
0d21 00        nop     
0d22 00        nop     
0d23 00        nop     
0d24 00        nop     
0d25 00        nop     
0d26 00        nop     
0d27 00        nop     
0d28 00        nop     
0d29 00        nop     
0d2a 00        nop     
0d2b 00        nop     


log Startup sequence:

202 init
203 gfxmode, param = 0, 720x248
209 bg_set
210 clrgfx, param = height of screen to clear =	247
207 plot x=370, y=126,pen=2, col=1
208 draw x=370, y=126,pen=2, col=1, x=360, y=123
207 208
207 208
208
204 clrtext echo=0
205 setcurpos c=1 l=1 (home=1,1)
204 clrtext echo=ff
205 setcurpos c=1 l=1
205 setcurpos c=1 l=2
205 setcurpos c=1 l=3

