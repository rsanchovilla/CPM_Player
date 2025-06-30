; Disassembly of the file "E:\Tmp\cpm\cpm\No Ok\BD Software C Compiler 1.1 (1979)\HELLO.COM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Thursday, 28 of December 2023 at 03:29 AM
; 
0100 2a0600    ld      hl,($0006)
0103 f9        ld      sp,hl
0104 00        nop     
0105 00        nop     
0106 00        nop     
0107 00        nop     
0108 00        nop     
0109 cdd704    call    $04d7		init execution
010c 01c321    ld      bc,$21c3		bc=first free addr after prog code
010f cdff07    call    $07ff		call main()
0112 c39305    jp      $0593		jmp to end of prog and exit back to CP/M

0115 c3211a    jp      $1a21
0118 1a        ld      a,(de)
0119 1a        ld      a,(de)
011a 1a        ld      a,(de)
011b 1a        ld      a,(de)
011c 1a        ld      a,(de)

011d 		ds 720			start of fdt table
					room for 20 FCS's * 36 bytes each = 720 bytes

03ce                                    temp room

03d4					pbase screen addr

03e3 		ds 20			start of fcbt with status of echa fcb file
03f7					start of printf copy param area

041d 1a        ld      a,(de)
041e 1a        ld      a,(de)
041f 1a        ld      a,(de)
0420 1a        ld      a,(de)
0421 1a        ld      a,(de)
0422 1a        ld      a,(de)
0423 1a        ld      a,(de)
0424 1a        ld      a,(de)
0425 1a        ld      a,(de)
0426 1a        ld      a,(de)
0427 c36107    jp      $0761		signed mult: HL=HL x DE
042a c38d07    jp      $078d		unsigned mult: HL=HL x DE
042d c3ed07    jp      $07ed		signed division HL=HL/DE	
0430 c3ab07    jp      $07ab		unsigned division HL=HL/DE
0433 c33107    jp      $0731		signed modulo HL=HL mod DE		
0436 c34b07    jp      $074b		unsigned modulo HL=HL mod DE
0439 c3af06    jp      $06af		compare HL, DE
043c c3ba06    jp      $06ba		compare HL, DE (set flags). HL=0 if equal, =1 if different
043f c38f05    jp      $058f		return HL=$FFFF=-1
0442 c3ad05    jp      $05ad		close fcb file 
0445 c39305    jp      $0593		end program and exit to cp/m
0448 c3eb05    jp      $05eb		setfcb
044b c3d105    jp      $05d1		test if fcb is open
044e c35606    jp      $0656		get fcb address
0451 c3c506    jp      $06c5		compare signed HL, DE 
0454 c3d306    jp      $06d3		compare signed HL, DE 
0457 c3e106    jp      $06e1		compare signed HL, DE 
045a c3ef06    jp      $06ef		compare signed HL, DE 
045d c3fd06    jp      $06fd		compare signed HL, DE 
0460 c30a07    jp      $070a		compare signed HL, DE 
0463 c31707    jp      $0717		compare signed HL, DE
0466 c32407    jp      $0724		compare signed HL, DE
0469 c8        ret     z

				select disk. On enter, 

046a 77        ld      (hl),a		
046b 5f        ld      e,a
046c 0e0e      ld      c,$0e	select disk
046e cd0500    call    $0005
0471 c9        ret     

0472 23        inc     hl
0473 7e        ld      a,(hl)
0474 fe20      cp      $20
0476 cab80c    jp      z,$0cb8
0479 de41      sbc     a,$41
047b c9        ret     

047c 3a3402    ld      a,($0234)
047f c9        ret     

0480 7e        ld      a,(hl)
0481 cdde0e    call    $0ede
0484 7e        ld      a,(hl)
0485 23        inc     hl
0486 fe0d      cp      $0d
0488 c2bc0c    jp      nz,$0cbc
048b 3e0a      ld      a,$0a
048d cdde0e    call    $0ede
0490 c9        ret     

0491 115c00    ld      de,$005c
0494 0609      ld      b,$09
0496 1a        ld      a,(de)
0497 fe3f      cp      $3f
0499 cabb0d    jp      z,$0dbb
049c 77        ld      (hl),a
049d 23        inc     hl
049e 13        inc     de
049f 05        dec     b
04a0 c2d20c    jp      nz,$0cd2
04a3 c9        ret     

04a4 21a00f    ld      hl,$0fa0
04a7 cdbc0c    call    $0cbc
04aa c33f0d    jp      $0d3f
04ad 0e0f      ld      c,$0f	open file
04af cd0500    call    $0005
04b2 feff      cp      $ff
04b4 c0        ret     nz

04b5 21b90f    ld      hl,$0fb9
04b8 cdbc0c    call    $0cbc
04bb c30000    jp      $0000	exit to cp/m
04be 0e10      ld      c,$10	close file
04c0 cd0500    call    $0005
04c3 feff      cp      $ff
04c5 c0        ret     nz

04c6 212910    ld      hl,$1029
04c9 cdbc0c    call    $0cbc
04cc c30000    jp      $0000	exit to cp/m
04cf 0e13      ld      c,$13	delete file
04d1 c30500    jp      $0005
04d4 0e16      ld      c,$16
04d6 cd

				init execution

04d7 0e0b      ld      c,$0b	console status
04d9 cd0500    call    $0005
04dc e601      and     $01
04de cae604    jp      z,$04e6	jump if no key pressed
04e1 0e01      ld      c,$01	console in (read key in A)
04e3 cd0500    call    $0005

04e6 218000    ld      hl,$0080	[$80]=length of command line
04e9 118704    ld      de,$0487 
04ec 46        ld      b,(hl)	b=length of command line
04ed 23        inc     hl
04ee 78        ld      a,b
04ef b7        or      a	is lenght=0?
04f0 c2f904    jp      nz,$04f9	jump if not zero
04f3 110100    ld      de,$0001
04f6 c35d05    jp      $055d
04f9 7e        ld      a,(hl)	copy command line $80..$FF
04fa 12        ld      (de),a 	to 0487..
04fb 23        inc     hl
04fc 13        inc     de
04fd 05        dec     b
04fe c2f904    jp      nz,$04f9
0501 af        xor     a	add a 00 char at en of command line 
0502 12        ld      (de),a
0503 216704    ld      hl,$0467
0506 22f903    ld      ($03f9),hl
0509 218704    ld      hl,$0487
050c 110100    ld      de,$0001
050f 016904    ld      bc,$0469
0512 af        xor     a
0513 32cf03    ld      ($03cf),a
0516 7e        ld      a,(hl)
0517 23        inc     hl
0518 fe20      cp      $20
051a ca1605    jp      z,$0516
051d b7        or      a
051e ca5d05    jp      z,$055d
0521 fe22      cp      $22
0523 c22c05    jp      nz,$052c
0526 32cf03    ld      ($03cf),a
0529 c32d05    jp      $052d
052c 2b        dec     hl
052d 7d        ld      a,l
052e 02        ld      (bc),a
052f 03        inc     bc
0530 7c        ld      a,h
0531 02        ld      (bc),a
0532 03        inc     bc
0533 13        inc     de
0534 7e        ld      a,(hl)
0535 23        inc     hl
0536 b7        or      a
0537 ca5d05    jp      z,$055d
053a c5        push    bc
053b 47        ld      b,a
053c 3acf03    ld      a,($03cf)
053f b7        or      a
0540 78        ld      a,b
0541 c1        pop     bc
0542 ca5105    jp      z,$0551
0545 fe22      cp      $22
0547 c23405    jp      nz,$0534
054a af        xor     a
054b 32cf03    ld      ($03cf),a
054e 2b        dec     hl
054f 77        ld      (hl),a
0550 23        inc     hl
0551 fe20      cp      $20
0553 c23405    jp      nz,$0534
0556 2b        dec     hl
0557 3600      ld      (hl),$00
0559 23        inc     hl
055a c31605    jp      $0516
055d 21f703    ld      hl,$03f7		init runtime
0560 73        ld      (hl),e
0561 23        inc     hl
0562 72        ld      (hl),d
0563 0614      ld      b,$14
0565 21e303    ld      hl,$03e3
0568 3600      ld      (hl),$00
056a 23        inc     hl
056b 05        dec     b
056c c26805    jp      nz,$0568
056f 2100cc    ld      hl,$cc00
0572 22d403    ld      ($03d4),hl
0575 214000    ld      hl,$0040
0578 22d803    ld      ($03d8),hl
057b 211000    ld      hl,$0010
057e 22d603    ld      ($03d6),hl
0581 210004    ld      hl,$0400
0584 22da03    ld      ($03da),hl
0587 af        xor     a
0588 32dc03    ld      ($03dc),a
058b 32dd03    ld      ($03dd),a
058e c9        ret     

058f 21ffff    ld      hl,$ffff		HL=$FFFF
0592 c9        ret     

				exit(): end of program
				close all r/w open files

0593 0614      ld      b,$14	$14=20 decima=max number of files (fcb entries)
0595 3e08      ld      a,$08	firts file fcb (values 0..7 are special values)
0597 f5        push    af
0598 cdd105    call    $05d1	test if fcb is open
059b daa405    jp      c,$05a4	if carry set, the file is not open, so jump to process next fcb
059e 32f703    ld      ($03f7),a	save fcb number to close
05a1 cdad05    call    $05ad	close fcb file 
05a4 f1        pop     af
05a5 3c        inc     a	proceed to close next fcb
05a6 05        dec     b
05a7 c29705    jp      nz,$0597
05aa c30000    jp      $0000	return to CP/M

					close fcb file given in [$03f7]

05ad cd9706    call    $0697		set DMA addr to default $80 addr
05b0 3af703    ld      a,($03f7)	get fcb number to be closed
05b3 cdd105    call    $05d1		test if fcb is open
05b6 da8f05    jp      c,$058f		if carry set, the file is not open, goto set HL=$FFFF and return
05b9 3600      ld      (hl),$00		set file status byte to 0 as logical close
05bb 3af703    ld      a,($03f7)	get fcb number to be closed
05be c5        push    bc
05bf cd5606    call    $0656		get fcb address
05c2 eb        ex      de,hl
05c3 0e10      ld      c,$10		close file
05c5 cd0500    call    $0005
05c8 c1        pop     bc
05c9 feff      cp      $ff		if 255 comes back, we got problems
05cb 210000    ld      hl,$0000
05ce c0        ret     nz		return 0 if OK
05cf 2b        dec     hl		return -1 on error
05d0 c9        ret     		

				test if fcb is open
				on entry reg A=fcb number
				numbers 0..7 are reserved, first available fcb is number 8
				return Carry set if not open, A=fcb num, HL=addr of file status byte

05d1 cd9706    call    $0697	set DMA addr to default $80 addr
05d4 4f        ld      c,a	save fcb num
05d5 d608      sub     $08
05d7 d8        ret     c	if fcb num < 8, error
05d8 fe14      cp      $14	$14=20 decimal=max number of available fcbs
05da 3f        ccf     
05db d8        ret     c	if fcb num >= 8+20, error (fcb num too big)
05dc 5f        ld      e,a	OK, we have a value in range. Now see if the file is open or not
05dd 1600      ld      d,$00
05df 21e303    ld      hl,$03e3		table fdt at $03e3 one byte per fcb tells if it is active, r/w, etc.
05e2 19        add     hl,de
05e3 7e        ld      a,(hl)	get file status from table fdt
05e4 e601      and     $01	bit 0 is high if file is open
05e6 37        scf     
05e7 79        ld      a,c	return C set if not open
05e8 c8        ret     z
05e9 3f        ccf     		else reset C and return
05ea c9        ret     		

				setfcb: Set up a CP/M file control block at HL with the file whose
				simple null-terminated name is pointed to by DE:
				Format for filename must be: "[white space][d:]filename.ext"

05eb cd9706    call    $0697	set DMA addr to default $80 addr
05ee 0608      ld      b,$08
05f0 e5        push    hl	save new fcb addr in HL
05f1 13        inc     de
05f2 1a        ld      a,(de)	get next filename char
05f3 1b        dec     de
05f4 fe3a      cp      $3a	is a ':'?
05f6 3e00      ld      a,$00	default disk byte value is 0 for currently logged disk
05f8 c20306    jp      nz,$0603 no ':', continue processing
05fb 1a        ld      a,(de)	yes, get drive letter
05fc cd4d06    call    $064d   	al=char a..z to upper case
05ff d640      sub     $40	AL='A' -> AL=1
0601 13        inc     de	skip drive letter
0602 13        inc     de	skip ':'
0603 77        ld      (hl),a	save drive number in new fcb
0604 23        inc     hl	
0605 cd1e06    call    $061e
0608 1a        ld      a,(de)
0609 fe2e      cp      $2e
060b c20f06    jp      nz,$060f
060e 13        inc     de
060f 0603      ld      b,$03
0611 cd1e06    call    $061e
0614 3600      ld      (hl),$00
0616 111400    ld      de,$0014
0619 19        add     hl,de
061a 3600      ld      (hl),$00
061c d1        pop     de
061d c9        ret     

061e c5        push    bc
061f 1a        ld      a,(de)
0620 cd4106    call    $0641
0623 da3706    jp      c,$0637
0626 77        ld      (hl),a
0627 23        inc     hl
0628 13        inc     de
0629 05        dec     b
062a c21f06    jp      nz,$061f
062d c1        pop     bc
062e 1a        ld      a,(de)
062f cd4106    call    $0641
0632 d8        ret     c

0633 13        inc     de
0634 c32e06    jp      $062e
0637 3e20      ld      a,$20
0639 77        ld      (hl),a
063a 23        inc     hl
063b 05        dec     b
063c c23706    jp      nz,$0637
063f c1        pop     bc
0640 c9        ret     

0641 cd4d06    call    $064d	al=char a..z to upper case
0644 fe2e      cp      $2e
0646 37        scf     
0647 c8        ret     z

0648 b7        or      a
0649 37        scf     
064a c8        ret     z

064b 3f        ccf     
064c c9        ret     

					char a..z to upper case
064d fe61      cp      $61 'a'
064f d8        ret     c		return carry set if A <= 'a'
0650 fe7b      cp      $7b 'z'+1
0652 d0        ret     nc		return no carry if A > 'z'
0653 d620      sub     $20		convert a..z to A..Z
0655 c9        ret     

				compute address of internal fcb for fd in A 
				If A is zero, then it finds a free file slot (if possible), else returns C set.
				If A is non-zero, then it returns the address of the fcb in HL

0656 cd9706    call    $0697	set DMA addr to default $80 addr
0659 b7        or      a	look for free slot?
065a 4f        ld      c,a
065b c27b06    jp      nz,$067b		if not, jump
065e 0614      ld      b,$14		b=nfcbs = 20 = num of internal FCBs
0660 11e303    ld      de,$03e3		[$03e3]=start of fcb state table (fdt)
0663 211d01    ld      hl,$011d		[$011d]=start of fcb table (fcbt)
0666 0e08      ld      c,$08		start search with fcb number 8
0668 1a        ld      a,(de)		get fcb state
0669 e601      and     $01		if bit0=1 -> file open
066b 79        ld      a,c		if bit0=0 -> return fcb in reg a
066c c8        ret     z

066d d5        push    de
066e 112200    ld      de,$0022		hl=hl+36 decimal (fcb size)
0671 19        add     hl,de
0672 d1        pop     de
0673 13        inc     de		points to state in table for next fcb
0674 0c        inc     c		inc fcb num
0675 05        dec     b		all possible fcb's scanned?
0676 c26806    jp      nz,$0668		no, continue search
0679 37        scf     			yes, all 20 fcbs are in use
067a c9        ret     			return C if no more free slots

067b fe08      cp      $08		get FCB addr for reg A
067d d8        ret     c		if fcb num < 8 exit with error
067e d608      sub     $08
0680 fe14      cp      $14		if fcb too big exit with error
0682 3f        ccf     
0683 d8        ret     c
0684 5f        ld      e,a
0685 1600      ld      d,$00
0687 62        ld      h,d
0688 6b        ld      l,e
0689 29        add     hl,hl
068a 29        add     hl,hl
068b 29        add     hl,hl
068c 29        add     hl,hl
068d 29        add     hl,hl
068e 19        add     hl,de
068f 19        add     hl,de
0690 eb        ex      de,hl
0691 211d01    ld      hl,$011d
0694 19        add     hl,de		HL=[$011d + 36 * fcb num]
0695 79        ld      a,c		A=fcb num
0696 c9        ret     

				set DMA addr to default $80 addr
0697 d5        push    de
0698 c5        push    bc
0699 f5        push    af
069a e5        push    hl
069b 0e1a      ld      c,$1a	set dma addr
069d 118000    ld      de,$0080
06a0 cd0500    call    $0005
06a3 e1        pop     hl
06a4 f1        pop     af
06a5 c1        pop     bc
06a6 d1        pop     de
06a7 c9        ret     

06a8 7c        ld      a,h
06a9 ba        cp      d
06aa d8        ret     c

06ab c0        ret     nz

06ac 7d        ld      a,l
06ad bb        cp      e
06ae c9        ret     

				compare HL, DE (set flags). HL=1 if equal, =0 if different

06af 7d        ld      a,l
06b0 bb        cp      e
06b1 7c        ld      a,h
06b2 210000    ld      hl,$0000
06b5 c0        ret     nz
06b6 ba        cp      d
06b7 c0        ret     nz
06b8 2c        inc     l
06b9 c9        ret     

				compare HL, DE (set flags). HL=0 if equal, =1 if different

06ba 7d        ld      a,l
06bb bb        cp      e
06bc 7c        ld      a,h
06bd 210100    ld      hl,$0001
06c0 c0        ret     nz
06c1 ba        cp      d
06c2 c0        ret     nz
06c3 2d        dec     l
06c4 c9        ret     

				compare signed HL, DE 

06c5 7c        ld      a,h
06c6 ba        cp      d
06c7 7d        ld      a,l
06c8 210100    ld      hl,$0001
06cb d8        ret     c
06cc 2b        dec     hl
06cd c0        ret     nz
06ce bb        cp      e
06cf c8        ret     z
06d0 d0        ret     nc
06d1 2c        inc     l
06d2 c9        ret     

				compare signed HL, DE 

06d3 7a        ld      a,d
06d4 bc        cp      h
06d5 7d        ld      a,l
06d6 210100    ld      hl,$0001
06d9 d8        ret     c
06da 2b        dec     hl
06db c0        ret     nz
06dc bb        cp      e
06dd c8        ret     z
06de d8        ret     c
06df 2c        inc     l
06e0 c9        ret     

				compare signed HL, DE 

06e1 7a        ld      a,d
06e2 bc        cp      h
06e3 7d        ld      a,l
06e4 210000    ld      hl,$0000
06e7 d8        ret     c
06e8 23        inc     hl
06e9 c0        ret     nz
06ea bb        cp      e
06eb c8        ret     z
06ec d8        ret     c
06ed 2d        dec     l
06ee c9        ret     

				compare signed HL, DE 


06ef 7c        ld      a,h
06f0 ba        cp      d
06f1 7d        ld      a,l
06f2 210000    ld      hl,$0000
06f5 d8        ret     c
06f6 23        inc     hl
06f7 c0        ret     nz
06f8 bb        cp      e
06f9 c8        ret     z
06fa d0        ret     nc
06fb 2d        dec     l
06fc c9        ret     

				compare signed HL, DE 

06fd 7c        ld      a,h
06fe aa        xor     d
06ff f2c506    jp      p,$06c5
0702 7a        ld      a,d
0703 210100    ld      hl,$0001
0706 b7        or      a
0707 f0        ret     p
0708 2d        dec     l
0709 c9        ret     

				compare signed HL, DE 

070a 7c        ld      a,h
070b aa        xor     d
070c f2d306    jp      p,$06d3
070f 7a        ld      a,d
0710 210100    ld      hl,$0001
0713 b7        or      a
0714 f8        ret     m
0715 2d        dec     l
0716 c9        ret     

				compare signed HL, DE 

0717 7c        ld      a,h
0718 aa        xor     d
0719 f2e106    jp      p,$06e1
071c 7a        ld      a,d
071d 210100    ld      hl,$0001
0720 b7        or      a
0721 f0        ret     p
0722 2d        dec     l
0723 c9        ret     

				compare signed HL, DE 

0724 7c        ld      a,h
0725 aa        xor     d
0726 f2ef06    jp      p,$06ef
0729 7a        ld      a,d
072a 210100    ld      hl,$0001
072d b7        or      a
072e f8        ret     m

072f 2d        dec     l
0730 c9        ret     

					signed modulo HL=HL mod DE

0731 af        xor     a		
0732 32ce03    ld      ($03ce),a	[03ce]=0 = sign
0735 cd7c07    call    $077c		get HL sign in 03ce, HL=abs(HL)
0738 eb        ex      de,hl
0739 cd7c07    call    $077c		get HL sign in 03ce, HL=abs(HL)
073c eb        ex      de,hl
073d cd4b07    call    $074b		unsigned modulo HL=HL mod DE
0740 7a        ld      a,d
0741 b7        or      a
0742 f0        ret     p

0743 7c        ld      a,h
0744 2f        cpl     
0745 67        ld      h,a
0746 7d        ld      a,l
0747 2f        cpl     
0748 6f        ld      l,a
0749 23        inc     hl
074a c9        ret     

074b 7c        ld      a,h		unsigned modulo HL=HL mod DE
074c b5        or      l
074d c8        ret     z
074e d5        push    de
074f e5        push    hl
0750 cdab07    call    $07ab		unsigned division HL=HL/DE
0753 d1        pop     de
0754 cd8d07    call    $078d		unsigned mult: HL=HL x DE
0757 7c        ld      a,h
0758 2f        cpl     
0759 67        ld      h,a
075a 7d        ld      a,l
075b 2f        cpl     
075c 6f        ld      l,a
075d 23        inc     hl
075e d1        pop     de
075f 19        add     hl,de
0760 c9        ret     

					signed mult: HL=HL x DE

0761 af        xor     a		a=0
0762 32ce03    ld      ($03ce),a	[03ce]=0 = sign
0765 cd7c07    call    $077c		get HL sign in 03ce, HL=abs(HL)
0768 eb        ex      de,hl
0769 cd7c07    call    $077c		get HL sign in 03ce, HL=abs(HL)
076c cd8d07    call    $078d		unsigned mult: HL=HL x DE
076f 3ace03    ld      a,($03ce)	get sign
0772 1f        rra     			rotate a right (carry -> bit7, bit0 -> carry)
0773 d0        ret     nc		return if no carry 
0774 7c        ld      a,h              HL=not HL
0775 2f        cpl     
0776 67        ld      h,a
0777 7d        ld      a,l
0778 2f        cpl     
0779 6f        ld      l,a
077a 23        inc     hl               inc HL -> HL= -HL
077b c9        ret     

					get HL sign in 03ce, HL=abs(HL)

077c 7c        ld      a,h
077d b7        or      a
077e f0        ret     p		return if HL is positive
077f 2f        cpl     			HL=-HL
0780 67        ld      h,a
0781 7d        ld      a,l
0782 2f        cpl     
0783 6f        ld      l,a
0784 23        inc     hl
0785 3ace03    ld      a,($03ce)  	mark as negative
0788 3c        inc     a
0789 32ce03    ld      ($03ce),a
078c c9        ret     

078d c5        push    bc		unsigned mult: HL=HL x DE
078e cd9307    call    $0793
0791 c1        pop     bc
0792 c9        ret     
0793 44        ld      b,h
0794 4d        ld      c,l
0795 210000    ld      hl,$0000
0798 78        ld      a,b
0799 b1        or      c
079a c8        ret     z		ret HL=0 
079b 78        ld      a,b
079c 1f        rra     
079d 47        ld      b,a
079e 79        ld      a,c
079f 1f        rra     
07a0 4f        ld      c,a
07a1 d2a507    jp      nc,$07a5
07a4 19        add     hl,de
07a5 eb        ex      de,hl
07a6 29        add     hl,hl
07a7 eb        ex      de,hl
07a8 c39807    jp      $0798

					unsigned division HL=HL/DE
07ab 7c        ld      a,h
07ac b5        or      l
07ad c8        ret     z
07ae c5        push    bc
07af cdb607    call    $07b6
07b2 60        ld      h,b
07b3 69        ld      l,c
07b4 c1        pop     bc
07b5 c9        ret     
07b6 0601      ld      b,$01
07b8 7c        ld      a,h
07b9 b7        or      a
07ba fac207    jp      m,$07c2
07bd 29        add     hl,hl
07be 04        inc     b
07bf c3b807    jp      $07b8
07c2 eb        ex      de,hl
07c3 78        ld      a,b
07c4 010000    ld      bc,$0000
07c7 f5        push    af
07c8 cda806    call    $06a8
07cb dad907    jp      c,$07d9
07ce 03        inc     bc
07cf d5        push    de
07d0 7a        ld      a,d
07d1 2f        cpl     
07d2 57        ld      d,a
07d3 7b        ld      a,e
07d4 2f        cpl     
07d5 5f        ld      e,a
07d6 13        inc     de
07d7 19        add     hl,de
07d8 d1        pop     de
07d9 af        xor     a
07da 7a        ld      a,d
07db 1f        rra     
07dc 57        ld      d,a
07dd 7b        ld      a,e
07de 1f        rra     
07df 5f        ld      e,a
07e0 f1        pop     af
07e1 3d        dec     a
07e2 c8        ret     z
07e3 f5        push    af
07e4 79        ld      a,c
07e5 17        rla     
07e6 4f        ld      c,a
07e7 78        ld      a,b
07e8 17        rla     
07e9 47        ld      b,a
07ea c3c807    jp      $07c8

					signed division HL=HL/DE
07ed af        xor     a
07ee 32ce03    ld      ($03ce),a	[03ce]=0 = sign
07f1 cd7c07    call    $077c		get HL sign in 03ce, HL=abs(HL)
07f4 eb        ex      de,hl
07f5 cd7c07    call    $077c		get HL sign in 03ce, HL=abs(HL)
07f8 eb        ex      de,hl
07f9 cdab07    call    $07ab		unsigned division HL=HL/DE	
07fc c36f07    jp      $076f		jump to adjust sign of result based on 03ce, the exit
07ff c32908    jp      $0829	jmp to main()

