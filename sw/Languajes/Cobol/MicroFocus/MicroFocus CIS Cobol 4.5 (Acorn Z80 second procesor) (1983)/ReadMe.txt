
MicroFocus CIS Cobol 4.5 from Acorn Z80 second procesor


Escape sequences - control codes

	12		cls
	30		home
	31 x y  	cursor pos. Home is por 0,0 (31 00 00)
			second line, third column is :31 02 01	

	Execute program from CCP tu use them


Patched to work on plain CP/M

- remove read from OSWORD

		original code			patched code

2ba0 cdf1ff    call    $fff1 ; CALL OSWORD 	; 00 00 00  nop 
2ba3 e1        pop     hl			; 3e 20  ld a, $20
2ba4 7d        ld      a,l			; e1     pop hl
2ba5 c604      add     a,$04			; c1     pop bc
2ba7 5f        ld      e,a			; 00     nop
2ba8 7c        ld      a,h		...
2ba9 ce00      adc     a,$00
2bab 57        ld      d,a
2bac 7e        ld      a,(hl)
2bad c603      add     a,$03
2baf 77        ld      (hl),a
2bb0 1a        ld      a,(de)
2bb1 c1        pop     bc
2bb2 b0        or      b
2bb3 47        ld      b,a
2bb4 0d        dec     c
2bb5 c29c2b    jp      nz,$2b9c		...
2bb8 78        ld      a,b			; 00     nop
2bb9 fe20      cp      $20

- add readed program form OSWORD


2bc4 00        nop     				; 20 42      jp nz, 2c08
2bc5 00        nop     			
2bc6 00        nop     				; FF         rst $38
2bc7 00        nop     				; F2 00 20   jp $p,2000

- remove read form OSBYTE

2b55 cdf4ff    call    $fff4 ; call OSBYTE	; 00 00 00 NOP
2b65 cdf4ff    call    $fff4 ; call OSBYTE	; 00 00 00 NOP






