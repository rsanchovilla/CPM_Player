; Disassembly of the file "E:\Tmp\cpm\pcw\PAS.COM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Thursday, 07 of April 2016 at 11:18 PM
; 
0100 c34001    jp      0140h
0103 c3800b    jp      0b80h
0106 c3a90b    jp      0ba9h
0109 c38b0b    jp      0b8bh
010c c3810b    jp      0b81h
010f c3980a    jp      0a98h
0112 c3ee02    jp      02eeh
0115 c3f103    jp      03f1h
0118 c3e903    jp      03e9h
011b c3610b    jp      0b61h
011e c37304    jp      0473h
0121 c3510a    jp      0a51h
0124 c3c002    jp      02c0h
0127 c3c40b    jp      0bc4h
012a c3bd0b    jp      0bbdh
012d c3b20b    jp      0bb2h
0130 c3d90b    jp      0bd9h	; readkey
0133 00        nop     
0134 00        nop     
0135 00        nop     
0136 00        nop     
0137 00        nop     
0138 00        nop     
0139 00        nop     
013a 00        nop     
013b 00        nop     
013c 00        nop     
013d 00        nop     
013e 00        nop     
013f 00        nop     

; start 

0140 2a0600    ld      hl,(0006h)
0143 2e00      ld      l,00h
0145 f9        ld      sp,hl		; Set SP on Top of ram
0146 cda31b    call    1ba3h		; Print CR LF
0149 218000    ld      hl,0080h		; copy cmd line to 1a7f
014c 117f1a    ld      de,1a7fh
014f 4e        ld      c,(hl)
0150 23        inc     hl
0151 0600      ld      b,00h
0153 0d        dec     c
0154 fa5f01    jp      m,015fh
0157 7e        ld      a,(hl)
0158 12        ld      (de),a
0159 23        inc     hl
015a 13        inc     de
015b 04        inc     b
015c c35301    jp      0153h
015f 3e0d      ld      a,0dh		; init vars
0161 12        ld      (de),a
0162 04        inc     b
0163 78        ld      a,b
0164 328f15    ld      (158fh),a
0167 af        xor     a
0168 32cf1a    ld      (1acfh),a
016b 32e70b    ld      (0be7h),a
016e 32d01a    ld      (1ad0h),a
0171 2a0024    ld      hl,(2400h)		; End of program addr (5f22 for compiler)
0174 22ee0b    ld      (0beeh),hl		; Save as Stack Lower allowed Addr
0177 210224    ld      hl,2402h			; start of Compiler PCODE program
017a 22e50b    ld      (0be5h),hl		; PCODE PC
017d 210000    ld      hl,0000h
0180 22e80b    ld      (0be8h),hl		; Source Code Line Numbre
0183 22f80b    ld      (0bf8h),hl
0186 22f40b    ld      (0bf4h),hl		; current stack frame
0189 39        add     hl,sp
018a 223301    ld      (0133h),hl
018d 21e2ff    ld      hl,0ffe2h
0190 39        add     hl,sp
0191 f9        ld      sp,hl
0192 eb        ex      de,hl
0193 06ff      ld      b,0ffh
0195 0e40      ld      c,40h
0197 c5        push    bc
0198 212000    ld      hl,0020h
019b e5        push    hl
019c 0e81      ld      c,81h
019e c5        push    bc
019f e5        push    hl
01a0 05        dec     b
01a1 c5        push    bc
01a2 e5        push    hl
01a3 210000    ld      hl,0000h
01a6 e5        push    hl
01a7 39        add     hl,sp
01a8 22f00b    ld      (0bf0h),hl
01ab 22f20b    ld      (0bf2h),hl	; start of current frame in stack
01ae 1b        dec     de
01af 1b        dec     de
01b0 cd9115    call    1591h
01b3 cd6c02    call    026ch
01b6 0e05      ld      c,05h
01b8 d5        push    de
01b9 1b        dec     de
01ba 1b        dec     de
01bb 1b        dec     de
01bc 1b        dec     de
01bd 0d        dec     c
01be c2b801    jp      nz,01b8h
01c1 210000    ld      hl,0000h
01c4 39        add     hl,sp
01c5 22e30b    ld      (0be3h),hl
01c8 3ea0      ld      a,0a0h
01ca 32f70b    ld      (0bf7h),a
01cd 2a3301    ld      hl,(0133h)
01d0 f9        ld      sp,hl
01d1 cdff0b    call    0bffh		
01d4 c30000    jp      0000h
01d7 c3a10c    jp      0ca1h		; Print Bad Pcode error and exit to CP/M

01da 		db "SO IR IO AI VR CE BP SV",0,0,0,"UG",0,0,"FNOR",0,"FNOW",0,"EOF"
0206 		db "File does not exist",0
021a 		db "No space in directory",0 
0230 		db "Error in writing to disk",0
0249 		db "Illegal filename", 0

025a d1        pop     de
025b 62        ld      h,d
025c 6b        ld      l,e
025d 2b        dec     hl
025e 2b        dec     hl
025f 6e        ld      l,(hl)
0260 2600      ld      h,00h
0262 e5        push    hl
0263 cd9115    call    1591h
0266 cd6c02    call    026ch
0269 c30d0c    jp      0c0dh		; exec next pcode
026c d5        push    de
026d eb        ex      de,hl
026e fe0d      cp      0dh
0270 0e00      ld      c,00h
0272 c27902    jp      nz,0279h
0275 3e20      ld      a,20h
0277 0e40      ld      c,40h
0279 47        ld      b,a
027a 7e        ld      a,(hl)
027b e6bf      and     0bfh
027d b1        or      c
027e 77        ld      (hl),a
027f 2b        dec     hl
0280 3600      ld      (hl),00h
0282 2b        dec     hl
0283 70        ld      (hl),b
0284 d1        pop     de
0285 c9        ret     

0286 d1        pop     de
0287 1a        ld      a,(de)
0288 e640      and     40h
028a 210000    ld      hl,0000h
028d ca9102    jp      z,0291h
0290 23        inc     hl
0291 e5        push    hl
0292 c30d0c    jp      0c0dh		; exec next pcode
0295 2aee0b    ld      hl,(0beeh)	; Stack Lower allowed Addr
0298 19        add     hl,de
0299 19        add     hl,de
029a 22ee0b    ld      (0beeh),hl	; Stack Lower allowed Addr
029d e5        push    hl
029e 210000    ld      hl,0000h
02a1 39        add     hl,sp
02a2 c33a10    jp      103ah
02a5 c36f0c    jp      0c6fh		; Print Error in C and exit
02a8 15        dec     d
02a9 cd9d0a    call    0a9dh
02ac fe2c      cp      2ch
02ae cafa24    jp      z,24fah
02b1 c9        ret     

02b2 78        ld      a,b
02b3 cdd315    call    15d3h
02b6 79        ld      a,c
02b7 cdf30a    call    0af3h
02ba c31125    jp      2511h
02bd cd5a19    call    195ah
02c0 cd2504    call    0425h	; Open PASERROR.MSG file
02c3 e1        pop     hl
02c4 e3        ex      (sp),hl
02c5 1180ff    ld      de,0ff80h
02c8 19        add     hl,de
02c9 eb        ex      de,hl
02ca 0e1a      ld      c,1ah	; Set DMA Addr
02cc cd0500    call    0005h	; Call BDOS
02cf e1        pop     hl
02d0 e3        ex      (sp),hl
02d1 7d        ld      a,l
02d2 327204    ld      (0472h),a
02d5 115204    ld      de,0452h	; FCB "PASERRORMSG"
02d8 0e14      ld      c,14h	; SEQ READ
02da cd0500    call    0005h	; Call BDOS
02dd 118000    ld      de,0080h
02e0 0e1a      ld      c,1ah	; Set DMA Addr
02e2 cd0500    call    0005h	; Call BDOS

; Close PASERROR.MSG file

02e5 115204    ld      de,0452h	; FCB "PASERRORMSG"
02e8 0e10      ld      c,10h	; CLOSE FILE
02ea cd0500    call    0005h	; Call BDOS
02ed c9        ret     

02ee e1        pop     hl
02ef e3        ex      (sp),hl
02f0 11f8ff    ld      de,0fff8h
02f3 19        add     hl,de
02f4 06ff      ld      b,0ffh
02f6 112603    ld      de,0326h
02f9 04        inc     b
02fa e5        push    hl
02fb 0e08      ld      c,08h
02fd 1a        ld      a,(de)
02fe be        cp      (hl)
02ff c21403    jp      nz,0314h
0302 23        inc     hl
0303 fe20      cp      20h
0305 ca0903    jp      z,0309h
0308 13        inc     de
0309 0d        dec     c
030a c2fd02    jp      nz,02fdh
030d e1        pop     hl
030e 68        ld      l,b
030f 2600      ld      h,00h
0311 e3        ex      (sp),hl
0312 e5        push    hl
0313 c9        ret     

0314 e1        pop     hl
0315 1a        ld      a,(de)
0316 13        inc     de
0317 fe20      cp      20h
0319 c21503    jp      nz,0315h
031c 1a        ld      a,(de)
031d b7        or      a
031e c2f902    jp      nz,02f9h
0321 2e27      ld      l,27h
0323 c30f03    jp      030fh

0326 		db "AND ARRAY BEGIN CASE CONST DIV DO DOWNTO "
		db "ELSE END EXTERN FILE FOR FORWARD FUNCTION "
		db "GOTO IF IN LABEL MOD NIL NOT OF OR PACKED "
		db "PROCEDUR PROGRAM RECORD REPEAT THEN TO TYPE "
		db "UNTIL VAR WITH WHILE SET ", 0

03e9 2aa802    ld      hl,(02a8h)
03ec eb        ex      de,hl
03ed e1        pop     hl
03ee c3f303    jp      03f3h
03f1 e1        pop     hl
03f2 d1        pop     de
03f3 e3        ex      (sp),hl
03f4 7a        ld      a,d
03f5 b3        or      e
03f6 ca2004    jp      z,0420h
03f9 01f8ff    ld      bc,0fff8h
03fc 09        add     hl,bc
03fd eb        ex      de,hl
03fe e5        push    hl
03ff 01f0ff    ld      bc,0fff0h
0402 09        add     hl,bc
0403 0e08      ld      c,08h
0405 d5        push    de
0406 1a        ld      a,(de)
0407 be        cp      (hl)
0408 c21504    jp      nz,0415h
040b 23        inc     hl
040c 13        inc     de
040d 0d        dec     c
040e c20604    jp      nz,0406h
0411 d1        pop     de
0412 e1        pop     hl
0413 e3        ex      (sp),hl
0414 e9        jp      (hl)
0415 d1        pop     de
0416 e1        pop     hl
0417 2b        dec     hl
0418 7e        ld      a,(hl)
0419 2b        dec     hl
041a 6e        ld      l,(hl)
041b 67        ld      h,a
041c b7        or      a
041d c2fe03    jp      nz,03feh
0420 210000    ld      hl,0000h
0423 e3        ex      (sp),hl
0424 e9        jp      (hl)

; Open PASERROR.MSG file

0425 215204    ld      hl,0452h	; FCB "PASERRORMSG"
0428 af        xor     a
0429 77        ld      (hl),a
042a 110c00    ld      de,000ch
042d 19        add     hl,de
042e 77        ld      (hl),a
042f 0e0f      ld      c,0fh	; OPEN FILE
0431 115204    ld      de,0452h	; FCB "PASERRORMSG"
0434 cd0500    call    0005h	; Call BDOS
0437 feff      cp      0ffh
0439 c0        ret     nz
043a 214304    ld      hl,0443h	; "No error file"
043d cda61b    call    1ba6h	; Print Strz at HL
0440 c30000    jp      0000h

0443 		db 4e 6f 20 65 72 72 6f 72 20 66 69 6c 65 2e 00		; "No error file"
0452 		db 00 50 41 53 45 52 52 4f 52 4d 53 47 00 00 00 00 	; FCB "PASERRORMSG"

0462 79        ld      a,c
0463 fe2c      cp      2ch
0465 cac726    jp      z,26c7h
0468 c9        ret     

0469 119638    ld      de,3896h
046c 01004f    ld      bc,4f00h
046f c30027    jp      2700h
0472 00        nop     

0473 cd2504    call    0425h	; Open PASERROR.MSG file -> error if not found
0476 cde502    call    02e5h    ; Close PASERROR.MSG file
0479 cd4d0a    call    0a4dh	; ld hl,04d9h  -> start of function table

047c 22a802    ld      (02a8h),hl
047f c1        pop     bc
0480 e1        pop     hl
0481 11110a    ld      de,0a11h
0484 2b        dec     hl
0485 72        ld      (hl),d
0486 2b        dec     hl
0487 73        ld      (hl),e
0488 e1        pop     hl
0489 11050a    ld      de,0a05h
048c 2b        dec     hl
048d 72        ld      (hl),d
048e 2b        dec     hl
048f 73        ld      (hl),e
0490 e1        pop     hl
0491 11f909    ld      de,09f9h
0494 2b        dec     hl
0495 72        ld      (hl),d
0496 2b        dec     hl
0497 73        ld      (hl),e
0498 e1        pop     hl
0499 11ed09    ld      de,09edh
049c 2b        dec     hl
049d 72        ld      (hl),d
049e 2b        dec     hl
049f 73        ld      (hl),e
04a0 e1        pop     hl
04a1 11e109    ld      de,09e1h
04a4 2b        dec     hl
04a5 72        ld      (hl),d
04a6 2b        dec     hl
04a7 73        ld      (hl),e
04a8 3af70b    ld      a,(0bf7h)
04ab 1604      ld      d,04h
04ad e1        pop     hl
04ae 2b        dec     hl
04af 3600      ld      (hl),00h
04b1 2b        dec     hl
04b2 3600      ld      (hl),00h
04b4 1f        rra     
04b5 d2b904    jp      nc,04b9h
04b8 34        inc     (hl)
04b9 15        dec     d
04ba c2ad04    jp      nz,04adh
04bd e1        pop     hl
04be 2b        dec     hl
04bf 3600      ld      (hl),00h
04c1 2b        dec     hl
04c2 3600      ld      (hl),00h
04c4 c5        push    bc
04c5 c9        ret     

04c6 c9        ret     

04c7 		db 05 00 "ORD     " 00 00  00 00 00 00 EB 04
04d9 		db 05 00 "PRED    " 00 00  01 00 00 00 FD 04
04eb 		db 05 00 "SUCC    " 00 00  02 00 00 00 0F 05

		db 05 00 "SQR ABS EOLN EOF CHR ODD INP ORIGIN
		          SHR SHL XORB ORB ANDB NOTB IOERROR
		          PEEK TRUNC RANDOM GETKEY LOGGED
		          ROUND SIN COS ARCTAN SQRT LN EXP WRITE
		          WRITELN READ READLN NEW PAGE PUT GET RESET
		          REWRITE DISPOSE PACK UNPACK DELETE RENAME
		          SEEK OPEN CHAIN RDHEX WRHEX WRHEX2 IOTRAP
		          BREAKS LOGIN POKE OUT VDU INTEGER REAL CHAR
		          BOOLEAN TEXT TRUE FALSE MAXINT INPUT OUTPUT
		          PRINTER


0a4d 21d904    ld      hl,04d9h
0a50 c9        ret     

0a51 d1        pop     de
0a52 e1        pop     hl
0a53 2b        dec     hl
0a54 2b        dec     hl
0a55 22be02    ld      (02beh),hl
0a58 e1        pop     hl
0a59 2b        dec     hl
0a5a 2b        dec     hl
0a5b 22aa02    ld      (02aah),hl
0a5e e1        pop     hl
0a5f 2b        dec     hl
0a60 2b        dec     hl
0a61 22ac02    ld      (02ach),hl
0a64 e1        pop     hl
0a65 2b        dec     hl
0a66 2b        dec     hl
0a67 22ae02    ld      (02aeh),hl
0a6a e1        pop     hl
0a6b 2b        dec     hl
0a6c 2b        dec     hl
0a6d 22b002    ld      (02b0h),hl
0a70 e1        pop     hl
0a71 2b        dec     hl
0a72 2b        dec     hl
0a73 22b202    ld      (02b2h),hl
0a76 e1        pop     hl
0a77 2b        dec     hl
0a78 2b        dec     hl
0a79 22b402    ld      (02b4h),hl
0a7c e1        pop     hl
0a7d 019cff    ld      bc,0ff9ch
0a80 09        add     hl,bc
0a81 22b602    ld      (02b6h),hl
0a84 e1        pop     hl
0a85 2b        dec     hl
0a86 2b        dec     hl
0a87 22b802    ld      (02b8h),hl
0a8a e1        pop     hl
0a8b 2b        dec     hl
0a8c 2b        dec     hl
0a8d 22ba02    ld      (02bah),hl
0a90 e1        pop     hl
0a91 2b        dec     hl
0a92 2b        dec     hl
0a93 22bc02    ld      (02bch),hl
0a96 d5        push    de
0a97 c9        ret     

0a98 2ab002    ld      hl,(02b0h)
0a9b 7e        ld      a,(hl)
0a9c b7        or      a
0a9d c8        ret     z

0a9e 2aae02    ld      hl,(02aeh)
0aa1 7e        ld      a,(hl)
0aa2 2abc02    ld      hl,(02bch)
0aa5 1f        rra     
0aa6 d2ac0a    jp      nc,0aach
0aa9 2aba02    ld      hl,(02bah)
0aac 5e        ld      e,(hl)
0aad 23        inc     hl
0aae 56        ld      d,(hl)
0aaf 1a        ld      a,(de)
0ab0 e680      and     80h
0ab2 c2460b    jp      nz,0b46h
0ab5 1b        dec     de
0ab6 1b        dec     de
0ab7 1a        ld      a,(de)
0ab8 13        inc     de
0ab9 13        inc     de
0aba 2ab002    ld      hl,(02b0h)
0abd 77        ld      (hl),a
0abe fe1a      cp      1ah
0ac0 ca460b    jp      z,0b46h
0ac3 cd9115    call    1591h
0ac6 fe0a      cp      0ah
0ac8 cac30a    jp      z,0ac3h
0acb 1b        dec     de
0acc 1b        dec     de
0acd 12        ld      (de),a
0ace 7e        ld      a,(hl)
0acf fe0d      cp      0dh
0ad1 c21b0b    jp      nz,0b1bh
0ad4 3609      ld      (hl),09h
0ad6 2aae02    ld      hl,(02aeh)
0ad9 7e        ld      a,(hl)
0ada 1f        rra     
0adb da1b0b    jp      c,0b1bh
0ade 2ab202    ld      hl,(02b2h)
0ae1 3600      ld      (hl),00h
0ae3 23        inc     hl
0ae4 3600      ld      (hl),00h
0ae6 2ab402    ld      hl,(02b4h)
0ae9 34        inc     (hl)
0aea 7e        ld      a,(hl)
0aeb b7        or      a
0aec c2f10a    jp      nz,0af1h
0aef 23        inc     hl
0af0 34        inc     (hl)
0af1 2aac02    ld      hl,(02ach)
0af4 3601      ld      (hl),01h
0af6 2abe02    ld      hl,(02beh)
0af9 7e        ld      a,(hl)
0afa 1f        rra     
0afb d21b0b    jp      nc,0b1bh
0afe 2ab802    ld      hl,(02b8h)
0b01 5e        ld      e,(hl)
0b02 23        inc     hl
0b03 56        ld      d,(hl)
0b04 0e0d      ld      c,0dh
0b06 cd3317    call    1733h		; print char
0b09 0e0a      ld      c,0ah
0b0b cd3317    call    1733h		; print char
0b0e 2ab402    ld      hl,(02b4h)
0b11 7e        ld      a,(hl)
0b12 23        inc     hl
0b13 66        ld      h,(hl)
0b14 6f        ld      l,a
0b15 010400    ld      bc,0004h
0b18 cdd11a    call    1ad1h
0b1b 2abe02    ld      hl,(02beh)
0b1e 7e        ld      a,(hl)
0b1f 1f        rra     
0b20 d0        ret     nc

0b21 2aae02    ld      hl,(02aeh)
0b24 7e        ld      a,(hl)
0b25 1f        rra     
0b26 d8        ret     c

0b27 2ab802    ld      hl,(02b8h)
0b2a 5e        ld      e,(hl)
0b2b 23        inc     hl
0b2c 56        ld      d,(hl)
0b2d 2ab002    ld      hl,(02b0h)
0b30 4e        ld      c,(hl)
0b31 cd3317    call    1733h		; print char
0b34 2ab202    ld      hl,(02b2h)
0b37 34        inc     (hl)
0b38 7e        ld      a,(hl)
0b39 fe64      cp      64h
0b3b d0        ret     nc

0b3c 5f        ld      e,a
0b3d 1600      ld      d,00h
0b3f 2ab602    ld      hl,(02b6h)
0b42 1b        dec     de
0b43 19        add     hl,de
0b44 71        ld      (hl),c
0b45 c9        ret     

0b46 2aae02    ld      hl,(02aeh)
0b49 7e        ld      a,(hl)
0b4a 1f        rra     
0b4b d2560b    jp      nc,0b56h
0b4e 3600      ld      (hl),00h
0b50 2ab002    ld      hl,(02b0h)
0b53 3620      ld      (hl),20h
0b55 c9        ret     

0b56 2ab002    ld      hl,(02b0h)
0b59 3600      ld      (hl),00h
0b5b 2aaa02    ld      hl,(02aah)
0b5e 3601      ld      (hl),01h
0b60 c9        ret     

0b61 e1        pop     hl
0b62 e3        ex      (sp),hl
0b63 11b0ff    ld      de,0ffb0h
0b66 19        add     hl,de
0b67 cd1313    call    1313h
0b6a d1        pop     de
0b6b c1        pop     bc
0b6c e1        pop     hl
0b6d e3        ex      (sp),hl
0b6e 2b        dec     hl
0b6f 70        ld      (hl),b
0b70 2b        dec     hl
0b71 71        ld      (hl),c
0b72 e1        pop     hl
0b73 e3        ex      (sp),hl
0b74 2b        dec     hl
0b75 72        ld      (hl),d
0b76 2b        dec     hl
0b77 73        ld      (hl),e
0b78 3e00      ld      a,00h
0b7a 67        ld      h,a
0b7b 3f        ccf     
0b7c 17        rla     
0b7d 6f        ld      l,a
0b7e e3        ex      (sp),hl
0b7f e9        jp      (hl)
0b80 c9        ret     

0b81 e1        pop     hl
0b82 d1        pop     de
0b83 7b        ld      a,e
0b84 e601      and     01h
0b86 5f        ld      e,a
0b87 1600      ld      d,00h
0b89 d5        push    de
0b8a e9        jp      (hl)
0b8b e1        pop     hl
0b8c c1        pop     bc
0b8d d1        pop     de
0b8e 78        ld      a,b
0b8f b7        or      a
0b90 c2a40b    jp      nz,0ba4h
0b93 79        ld      a,c
0b94 fe10      cp      10h
0b96 d2a40b    jp      nc,0ba4h
0b99 b7        or      a
0b9a caa70b    jp      z,0ba7h
0b9d eb        ex      de,hl
0b9e 29        add     hl,hl
0b9f eb        ex      de,hl
0ba0 0d        dec     c
0ba1 c3930b    jp      0b93h
0ba4 110000    ld      de,0000h
0ba7 d5        push    de
0ba8 e9        jp      (hl)
0ba9 c1        pop     bc
0baa e1        pop     hl
0bab d1        pop     de
0bac c5        push    bc
0bad 0604      ld      b,04h
0baf c34c1b    jp      1b4ch
0bb2 e1        pop     hl
0bb3 d1        pop     de
0bb4 c1        pop     bc
0bb5 7a        ld      a,d
0bb6 a0        and     b
0bb7 57        ld      d,a
0bb8 7b        ld      a,e
0bb9 a1        and     c
0bba 5f        ld      e,a
0bbb d5        push    de
0bbc e9        jp      (hl)
0bbd e1        pop     hl
0bbe e3        ex      (sp),hl
0bbf 6e        ld      l,(hl)
0bc0 2600      ld      h,00h
0bc2 e3        ex      (sp),hl
0bc3 e9        jp      (hl)

0bc4 21fa0b    ld      hl,0bfah
0bc7 7e        ld      a,(hl)
0bc8 07        rlca    
0bc9 ae        xor     (hl)
0bca 0f        rrca    
0bcb 23        inc     hl
0bcc 34        inc     (hl)
0bcd 86        add     a,(hl)
0bce ead20b    jp      pe,0bd2h
0bd1 34        inc     (hl)
0bd2 2b        dec     hl
0bd3 77        ld      (hl),a
0bd4 2600      ld      h,00h
0bd6 6f        ld      l,a
0bd7 e3        ex      (sp),hl
0bd8 e9        jp      (hl)

0bd9 cdc81b    call    1bc8h	; ReadKey
0bdc 6f        ld      l,a
0bdd 2600      ld      h,00h
0bdf e3        ex      (sp),hl
0be0 e9        jp      (hl)
0be1 2b        dec     hl
0be2 cd7b0b    call    0b7bh
0be5 fe27      cp      27h
0be7 caa62e    jp      z,2ea6h
0bea fe22      cp      22h
0bec caa62e    jp      z,2ea6h
0bef fe3c      cp      3ch
0bf1 cac42e    jp      z,2ec4h
0bf4 fe3e      cp      3eh
0bf6 cacf2e    jp      z,2ecfh
0bf9 fe2c      cp      2ch
0bfb cad92e    jp      z,2ed9h
0bfe fe

; run pcode program

0bff 210000    ld      hl,0000
0c02 39        add     hl,sp
0c03 22e10b    ld      (0be1h),hl		; Save SP (=F5FE) in $0BE1
0c06 2ae30b    ld      hl,(0be3h)		
0c09 f9        ld      sp,hl			; Load new SP (=F5CA)
0c0a c3140c    jp      0c14h

; exec pcode

0c0d 21f60b    ld      hl,0bf6h
0c10 35        dec     (hl)
0c11 cca60c    call    z,0ca6h

; exec pcode


PCODE PC=2cf7 -> check colour
         42c1 -> call check colour -> PCODE=$47

0c14 2ae50b    ld      hl,(0be5h)		; PCODE PC
0c17 7e        ld      a,(hl)
0c18 23        inc     hl
0c19 22e50b    ld      (0be5h),hl		; PCODE PC
0c1c 6f        ld      l,a
0c1d 2600      ld      h,00h
0c1f 29        add     hl,hl
0c20 29        add     hl,hl
0c21 29        add     hl,hl
0c22 11f91b    ld      de,1bf9h
0c25 19        add     hl,de
0c26 e9        jp      (hl)			; exec pcode

; DE = Addr8 at PCODE_PC, inc PCODE_PC

0c27 2ae50b    ld      hl,(0be5h)		; PCODE PC
0c2a 5e        ld      e,(hl)
0c2b 1600      ld      d,00h
0c2d 23        inc     hl
0c2e 22e50b    ld      (0be5h),hl
0c31 c9        ret     

; DE = Addr16 at PCODE_PC, inc PCODE_PC

0c32 2ae50b    ld      hl,(0be5h) 
0c35 5e        ld      e,(hl)
0c36 23        inc     hl
0c37 56        ld      d,(hl)
0c38 23        inc     hl
0c39 22e50b    ld      (0be5h),hl
0c3c c9        ret     

; break -> stop pcode execution

0c3d cda31b    call    1ba3h		; Print CR LF
0c40 21520c    ld      hl,0c52h		; "Break at line"
0c43 cda61b    call    1ba6h		; Print Strz at HL
0c46 2ae80b    ld      hl,(0be8h)	; Source Code Line Numbre
0c49 cd8e1b    call    1b8eh
0c4c cda31b    call    1ba3h		; Print CR LF
0c4f c3630c    jp      0c63h

0c52 		db 42 72 65 61 6b 20 61 74 20 6c 69 6e 65 00 ; "Break at line"
  
; exit PCODE interpreter

0c60 cd321a    call    1a32h
0c63 210000    ld      hl,0000h
0c66 39        add     hl,sp
0c67 22e30b    ld      (0be3h),hl	; save current SP
0c6a 2ae10b    ld      hl,(0be1h)	; restore main SP
0c6d f9        ld      sp,hl	
0c6e c9        ret     			; exit PCODE interpreter

: print error code in BC and exit

0c6f c5        push    bc
0c70 cda31b    call    1ba3h		; Print CR LF
0c73 c1        pop     bc
0c74 21da01    ld      hl,01dah		; "SO IR IO AI VR CE BP SV",0,0,0,"UG",0,0,"FNOR",0,"FNOW" ...
0c77 0d        dec     c
0c78 ca840c    jp      z,0c84h		; Found -> print
0c7b 7e        ld      a,(hl)		; Skip error code
0c7c 23        inc     hl
0c7d b7        or      a
0c7e c27b0c    jp      nz,0c7bh
0c81 c3770c    jp      0c77h		; check next error code
0c84 cda61b    call    1ba6h		; print error code String
0c87 21990c    ld      hl,0c99h		; 
0c8a cda61b    call    1ba6h		; print ", line "
0c8d 2ae80b    ld      hl,(0be8h)	; Source Code Line Numbre
0c90 cd9d1b    call    1b9dh
0c93 cda31b    call    1ba3h		; Print CR LF
0c96 c3600c    jp      0c60h		; exit PCODE interpreter

0c99 		db 2c 20 6c 69 6e 65 20 00  ; ", line "

0ca1 0e07      ld      c,07h		; Error = 7 -> BP: Bad PCode
0ca3 c36f0c    jp      0c6fh		; Print Error in C and exit

0ca6 21fb0b    ld      hl,0bfbh
0ca9 7e        ld      a,(hl)
0caa c605      add     a,05h
0cac 77        ld      (hl),a
0cad 3af70b    ld      a,(0bf7h)
0cb0 e620      and     20h
0cb2 c8        ret     z

0cb3 cdc81b    call    1bc8h
0cb6 b7        or      a
0cb7 c8        ret     z

0cb8 fe13      cp      13h
0cba cab61b    jp      z,1bb6h
0cbd fe1b      cp      1bh
0cbf cac60c    jp      z,0cc6h
0cc2 32d01a    ld      (1ad0h),a
0cc5 c9        ret     

0cc6 3af70b    ld      a,(0bf7h)
0cc9 e620      and     20h
0ccb c8        ret     z

0ccc c33d0c    jp      0c3dh		; break -> stop pcode execution

0ccf 2af00b    ld      hl,(0bf0h)
0cd2 13        inc     de
0cd3 cd160e    call    0e16h		; DE = -DE 
0cd6 19        add     hl,de
0cd7 19        add     hl,de
0cd8 34        inc     (hl)
0cd9 c20d0c    jp      nz,0c0dh		; exec next pcode
0cdc 23        inc     hl
0cdd 34        inc     (hl)
0cde 7e        ld      a,(hl)
0cdf fe80      cp      80h
0ce1 c20d0c    jp      nz,0c0dh		; exec next pcode
0ce4 2ae50b    ld      hl,(0be5h)	; PCODE PC
0ce7 23        inc     hl
0ce8 23        inc     hl
0ce9 23        inc     hl
0cea 22e50b    ld      (0be5h),hl
0ced c30d0c    jp      0c0dh		; exec next pcode
0cf0 2af00b    ld      hl,(0bf0h)
0cf3 13        inc     de
0cf4 cd160e    call    0e16h		; DE = -DE 
0cf7 19        add     hl,de
0cf8 19        add     hl,de
0cf9 7e        ld      a,(hl)
0cfa d601      sub     01h
0cfc 77        ld      (hl),a
0cfd 23        inc     hl
0cfe 7e        ld      a,(hl)
0cff de00      sbc     a,00h
0d01 77        ld      (hl),a
0d02 c30d0c    jp      0c0dh		; exec next pcode
0d05 21a502    ld      hl,02a5h
0d08 19        add     hl,de
0d09 19        add     hl,de
0d0a 7e        ld      a,(hl)
0d0b 23        inc     hl
0d0c 66        ld      h,(hl)
0d0d 6f        ld      l,a
0d0e cd140d    call    0d14h
0d11 c30d0c    jp      0c0dh		; exec next pcode
0d14 e9        jp      (hl)
0d15 2af00b    ld      hl,(0bf0h)
0d18 f9        ld      sp,hl
0d19 d1        pop     de
0d1a e1        pop     hl
0d1b 22f00b    ld      (0bf0h),hl
0d1e e1        pop     hl
0d1f 22e50b    ld      (0be5h),hl		; PCODE PC
0d22 7b        ld      a,e
0d23 b2        or      d
0d24 c20d0c    jp      nz,0c0dh		; exec next pcode
0d27 c3600c    jp      0c60h		; exit PCODE interpreter
0d2a c1        pop     bc
0d2b 2af00b    ld      hl,(0bf0h)
0d2e f9        ld      sp,hl
0d2f d1        pop     de
0d30 e1        pop     hl
0d31 22f00b    ld      (0bf0h),hl
0d34 e1        pop     hl
0d35 22e50b    ld      (0be5h),hl		; PCODE PC
0d38 c5        push    bc
0d39 c30d0c    jp      0c0dh		; exec next pcode

; Create new stack frame

0d3c e5        push    hl
0d3d e5        push    hl
0d3e 2af40b    ld      hl,(0bf4h)	; current stack frame
0d41 e5        push    hl		; save as previous one
0d42 210000    ld      hl,0000h
0d45 39        add     hl,sp
0d46 22f40b    ld      (0bf4h),hl	; new current stack frame
0d49 c30d0c    jp      0c0dh		; exec next pcode

0d4c c1        pop     bc
0d4d d1        pop     de
0d4e 78        ld      a,b
0d4f aa        xor     d
0d50 f5        push    af
0d51 7a        ld      a,d
0d52 b7        or      a
0d53 fc160e    call    m,0e16h		; DE = -DE 
0d56 78        ld      a,b
0d57 b7        or      a
0d58 fc1e0e    call    m,0e1eh
0d5b cdbf0d    call    0dbfh
0d5e 7c        ld      a,h
0d5f b7        or      a
0d60 faba0d    jp      m,0dbah
0d63 f1        pop     af
0d64 fc0e0e    call    m,0e0eh			; HL=-HL
0d67 e5        push    hl
0d68 c30d0c    jp      0c0dh		; exec next pcode
0d6b d1        pop     de
0d6c c1        pop     bc
0d6d cd740d    call    0d74h
0d70 c5        push    bc
0d71 c30d0c    jp      0c0dh		; exec next pcode
0d74 7a        ld      a,d
0d75 b3        or      e
0d76 caba0d    jp      z,0dbah
0d79 78        ld      a,b
0d7a aa        xor     d
0d7b f5        push    af
0d7c 7a        ld      a,d
0d7d b7        or      a
0d7e fc160e    call    m,0e16h		; DE = -DE 
0d81 78        ld      a,b
0d82 b7        or      a
0d83 fc1e0e    call    m,0e1eh
0d86 210000    ld      hl,0000h
0d89 3e10      ld      a,10h
0d8b f5        push    af
0d8c b7        or      a
0d8d 79        ld      a,c
0d8e 17        rla     
0d8f 4f        ld      c,a
0d90 78        ld      a,b
0d91 17        rla     
0d92 47        ld      b,a
0d93 7d        ld      a,l
0d94 17        rla     
0d95 6f        ld      l,a
0d96 7c        ld      a,h
0d97 17        rla     
0d98 67        ld      h,a
0d99 b7        or      a
0d9a faba0d    jp      m,0dbah
0d9d e5        push    hl
0d9e 7d        ld      a,l
0d9f 93        sub     e
0da0 6f        ld      l,a
0da1 7c        ld      a,h
0da2 9a        sbc     a,d
0da3 67        ld      h,a
0da4 faac0d    jp      m,0dach
0da7 79        ld      a,c
0da8 f601      or      01h
0daa 4f        ld      c,a
0dab e3        ex      (sp),hl
0dac e1        pop     hl
0dad f1        pop     af
0dae 3d        dec     a
0daf c28b0d    jp      nz,0d8bh
0db2 f1        pop     af
0db3 f0        ret     p

0db4 cd1e0e    call    0e1eh
0db7 c30e0e    jp      0e0eh		; HL=-HL
0dba 0e03      ld      c,03h		, Error = 3 -> IO: Integer Overflow
0dbc c36f0c    jp      0c6fh		; Print Error in C and exit
0dbf 210000    ld      hl,0000h
0dc2 3e10      ld      a,10h
0dc4 f5        push    af
0dc5 78        ld      a,b
0dc6 1f        rra     
0dc7 47        ld      b,a
0dc8 79        ld      a,c
0dc9 1f        rra     
0dca 4f        ld      c,a
0dcb d2d20d    jp      nc,0dd2h
0dce 19        add     hl,de
0dcf daba0d    jp      c,0dbah
0dd2 eb        ex      de,hl
0dd3 29        add     hl,hl
0dd4 eb        ex      de,hl
0dd5 f1        pop     af
0dd6 3d        dec     a
0dd7 c2c40d    jp      nz,0dc4h
0dda c9        ret     

0ddb cdfb0d    call    0dfbh
0dde 3e00      ld      a,00h
0de0 67        ld      h,a
0de1 3f        ccf     
0de2 17        rla     
0de3 6f        ld      l,a
0de4 e5        push    hl
0de5 c30d0c    jp      0c0dh		; exec next pcode
0de8 c1        pop     bc
0de9 d1        pop     de
0dea 78        ld      a,b
0deb aa        xor     d
0dec 47        ld      b,a
0ded 79        ld      a,c
0dee ab        xor     e
0def b0        or      b
0df0 210000    ld      hl,0000h
0df3 c2f70d    jp      nz,0df7h
0df6 23        inc     hl
0df7 e5        push    hl
0df8 c30d0c    jp      0c0dh		; exec next pcode
0dfb c5        push    bc
0dfc d5        push    de
0dfd 78        ld      a,b
0dfe 17        rla     
0dff 3f        ccf     
0e00 1f        rra     
0e01 47        ld      b,a
0e02 7a        ld      a,d
0e03 17        rla     
0e04 3f        ccf     
0e05 1f        rra     
0e06 57        ld      d,a
0e07 7b        ld      a,e
0e08 91        sub     c
0e09 7a        ld      a,d
0e0a 98        sbc     a,b
0e0b d1        pop     de
0e0c c1        pop     bc
0e0d c9        ret     

0e0e af        xor     a
0e0f 95        sub     l
0e10 6f        ld      l,a
0e11 3e00      ld      a,00h
0e13 9c        sbc     a,h
0e14 67        ld      h,a
0e15 c9        ret     

; DE = -DE 

0e16 af        xor     a
0e17 93        sub     e
0e18 5f        ld      e,a
0e19 3e00      ld      a,00h
0e1b 9a        sbc     a,d
0e1c 57        ld      d,a
0e1d c9        ret     

0e1e af        xor     a
0e1f 91        sub     c
0e20 4f        ld      c,a
0e21 3e00      ld      a,00h
0e23 98        sbc     a,b
0e24 47        ld      b,a
0e25 c9        ret     

0e26 110000    ld      de,0000h
0e29 211100    ld      hl,0011h
0e2c 39        add     hl,sp
0e2d 7e        ld      a,(hl)
0e2e b7        or      a
0e2f c2540e    jp      nz,0e54h
0e32 2b        dec     hl
0e33 7e        ld      a,(hl)
0e34 b7        or      a
0e35 fa540e    jp      m,0e54h
0e38 4f        ld      c,a
0e39 1f        rra     
0e3a 1f        rra     
0e3b 1f        rra     
0e3c e60f      and     0fh
0e3e ee01      xor     01h
0e40 2b        dec     hl
0e41 3d        dec     a
0e42 f2400e    jp      p,0e40h
0e45 79        ld      a,c
0e46 e607      and     07h
0e48 4f        ld      c,a
0e49 7e        ld      a,(hl)
0e4a 0f        rrca    
0e4b 0d        dec     c
0e4c f24a0e    jp      p,0e4ah
0e4f 17        rla     
0e50 d2540e    jp      nc,0e54h
0e53 13        inc     de
0e54 e1        pop     hl
0e55 e1        pop     hl
0e56 e1        pop     hl
0e57 e1        pop     hl
0e58 e1        pop     hl
0e59 e1        pop     hl
0e5a e1        pop     hl
0e5b e1        pop     hl
0e5c e1        pop     hl
0e5d d5        push    de
0e5e c30d0c    jp      0c0dh		; exec next pcode
0e61 c1        pop     bc
0e62 e1        pop     hl
0e63 d1        pop     de
0e64 cdd11a    call    1ad1h
0e67 c30d0c    jp      0c0dh		; exec next pcode
0e6a c1        pop     bc
0e6b e1        pop     hl
0e6c d1        pop     de
0e6d 78        ld      a,b
0e6e b1        or      c
0e6f ca0d0c    jp      z,0c0dh		; exec next pcode
0e72 0601      ld      b,01h
0e74 cd671b    call    1b67h
0e77 4d        ld      c,l
0e78 cd3317    call    1733h		; print char
0e7b c30d0c    jp      0c0dh		; exec next pcode

; Print StrZ

0e7e c1        pop     bc		; str len to print
0e7f e1        pop     hl		; str addr
0e80 e5        push    hl
0e81 1eff      ld      e,0ffh		; calc strz len in RegE
0e83 7e        ld      a,(hl)
0e84 1c        inc     e
0e85 23        inc     hl
0e86 b7        or      a
0e87 c2830e    jp      nz,0e83h
0e8a 78        ld      a,b		; check if BC (Str len to print) = $FFFF
0e8b a1        and     c
0e8c eeff      xor     0ffh
0e8e c2e810    jp      nz,10e8h		; if str len <> $FFFF then goto 10e8
0e91 4b        ld      c,e
0e92 c3e810    jp      10e8h		; RegC=str len . Print regE bytes from (SP)

0e95 		db 0d, 0a, 00

0e98 210000    ld      hl,0000h
0e9b 0e08      ld      c,08h
0e9d e5        push    hl
0e9e 0d        dec     c
0e9f c29d0e    jp      nz,0e9dh
0ea2 c30d0c    jp      0c0dh		; exec next pcode

0ea5 c1        pop     bc
0ea6 d1        pop     de
0ea7 79        ld      a,c
0ea8 bb        cp      e
0ea9 da0d0c    jp      c,0c0dh		; exec next pcode
0eac cdb30e    call    0eb3h
0eaf 13        inc     de
0eb0 c3a70e    jp      0ea7h

0eb3 c5        push    bc
0eb4 7a        ld      a,d
0eb5 b7        or      a
0eb6 0e08      ld      c,08h		; Error = 8 -> SV: SET VALUE ERROR
0eb8 c26f0c    jp      nz,0c6fh		; Print Error in C and exit
0ebb 7b        ld      a,e
0ebc b7        or      a
0ebd fa6f0c    jp      m,0c6fh		; Print Error in C and exit
0ec0 1f        rra     
0ec1 1f        rra     
0ec2 1f        rra     
0ec3 e60f      and     0fh
0ec5 ee01      xor     01h
0ec7 4f        ld      c,a
0ec8 af        xor     a
0ec9 67        ld      h,a
0eca 3e13      ld      a,13h
0ecc 91        sub     c
0ecd 6f        ld      l,a
0ece 39        add     hl,sp
0ecf 7b        ld      a,e
0ed0 e607      and     07h
0ed2 4f        ld      c,a
0ed3 3e01      ld      a,01h
0ed5 0d        dec     c
0ed6 fadd0e    jp      m,0eddh
0ed9 87        add     a,a
0eda c3d50e    jp      0ed5h
0edd b6        or      (hl)
0ede 77        ld      (hl),a
0edf c1        pop     bc
0ee0 c9        ret     

0ee1 210000    ld      hl,0000h
0ee4 39        add     hl,sp
0ee5 eb        ex      de,hl
0ee6 211000    ld      hl,0010h
0ee9 39        add     hl,sp
0eea 0e10      ld      c,10h
0eec 1a        ld      a,(de)
0eed b6        or      (hl)
0eee 77        ld      (hl),a
0eef 23        inc     hl
0ef0 13        inc     de
0ef1 0d        dec     c
0ef2 c2ec0e    jp      nz,0eech
0ef5 eb        ex      de,hl
0ef6 f9        ld      sp,hl
0ef7 c30d0c    jp      0c0dh		; exec next pcode

0efa 211000    ld      hl,0010h		
0efd 39        add     hl,sp
0efe 7e        ld      a,(hl)
0eff 23        inc     hl
0f00 66        ld      h,(hl)
0f01 6f        ld      l,a		; HL = (SP+16)
0f02 01f8ff    ld      bc,0fff8h
0f05 09        add     hl,bc		
0f06 09        add     hl,bc		; HL = HL -16
0f07 d1        pop     de
0f08 73        ld      (hl),e
0f09 23        inc     hl
0f0a 72        ld      (hl),d
0f0b 23        inc     hl
0f0c 0c        inc     c
0f0d c2070f    jp      nz,0f07h
0f10 e1        pop     hl
0f11 c30d0c    jp      0c0dh		; exec next pcode
0f14 2af00b    ld      hl,(0bf0h)
0f17 eb        ex      de,hl
0f18 29        add     hl,hl
0f19 7b        ld      a,e
0f1a 95        sub     l
0f1b 6f        ld      l,a
0f1c 7a        ld      a,d
0f1d 9c        sbc     a,h
0f1e 67        ld      h,a
0f1f 2b        dec     hl
0f20 56        ld      d,(hl)
0f21 2b        dec     hl
0f22 5e        ld      e,(hl)
0f23 d5        push    de
0f24 c30d0c    jp      0c0dh		; exec next pcode

0f27 2af20b    ld      hl,(0bf2h)	; start of current frame in stack
0f2a c3170f    jp      0f17h

0f2d cd370f    call    0f37h
0f30 c3170f    jp      0f17h
0f33 e1        pop     hl
0f34 c3170f    jp      0f17h
0f37 2ae50b    ld      hl,(0be5h)		; PCODE PC
0f3a 7e        ld      a,(hl)
0f3b 23        inc     hl
0f3c 22e50b    ld      (0be5h),hl
0f3f 2af00b    ld      hl,(0bf0h)
0f42 b7        or      a
0f43 c8        ret     z

0f44 46        ld      b,(hl)
0f45 23        inc     hl
0f46 66        ld      h,(hl)
0f47 68        ld      l,b
0f48 3d        dec     a
0f49 c3420f    jp      0f42h

0f4c 2af00b    ld      hl,(0bf0h)
0f4f eb        ex      de,hl
0f50 29        add     hl,hl
0f51 7b        ld      a,e
0f52 95        sub     l
0f53 6f        ld      l,a
0f54 7a        ld      a,d
0f55 9c        sbc     a,h
0f56 67        ld      h,a
0f57 d1        pop     de
0f58 2b        dec     hl
0f59 72        ld      (hl),d
0f5a 2b        dec     hl
0f5b 73        ld      (hl),e
0f5c c30d0c    jp      0c0dh		; exec next pcode

0f5f 2af20b    ld      hl,(0bf2h)	; start of current frame in stack
0f62 c34f0f    jp      0f4fh

0f65 e1        pop     hl
0f66 e3        ex      (sp),hl
0f67 c34f0f    jp      0f4fh
0f6a cd370f    call    0f37h
0f6d c34f0f    jp      0f4fh
0f70 2af00b    ld      hl,(0bf0h)
0f73 eb        ex      de,hl
0f74 29        add     hl,hl
0f75 7b        ld      a,e
0f76 95        sub     l
0f77 6f        ld      l,a
0f78 7a        ld      a,d
0f79 9c        sbc     a,h
0f7a 67        ld      h,a
0f7b e5        push    hl
0f7c c30d0c    jp      0c0dh		; exec next pcode

0f7f 2af20b    ld      hl,(0bf2h)	; start of current frame in stack
0f82 c3730f    jp      0f73h		; Push HL - DE*2

0f85 cd370f    call    0f37h
0f88 c3730f    jp      0f73h
0f8b 2af00b    ld      hl,(0bf0h)
0f8e d5        push    de
0f8f eb        ex      de,hl
0f90 2af00b    ld      hl,(0bf0h)
0f93 e5        push    hl
0f94 2af40b    ld      hl,(0bf4h)	; current stack frame
0f97 22f00b    ld      (0bf0h),hl
0f9a 4e        ld      c,(hl)
0f9b 73        ld      (hl),e
0f9c 23        inc     hl
0f9d 46        ld      b,(hl)
0f9e 72        ld      (hl),d
0f9f 23        inc     hl
0fa0 d1        pop     de
0fa1 73        ld      (hl),e
0fa2 23        inc     hl
0fa3 72        ld      (hl),d
0fa4 23        inc     hl
0fa5 eb        ex      de,hl
0fa6 2ae50b    ld      hl,(0be5h)		; PCODE PC
0fa9 eb        ex      de,hl
0faa 73        ld      (hl),e
0fab 23        inc     hl
0fac 72        ld      (hl),d
0fad 60        ld      h,b
0fae 69        ld      l,c
0faf 22f40b    ld      (0bf4h),hl	; current stack frame
0fb2 e1        pop     hl
0fb3 22e50b    ld      (0be5h),hl	; PCODE PC
0fb6 c30d0c    jp      0c0dh		; exec next pcode

0fb9 2af20b    ld      hl,(0bf2h)	; start of current frame in stack
0fbc c38e0f    jp      0f8eh

0fbf cd370f    call    0f37h
0fc2 c38e0f    jp      0f8eh

; CALL (DE), then exec next opcode

0fc5 eb        ex      de,hl		; on entry: HL=PCODE_PC next instructrion, DE=param
0fc6 cdcc0f    call    0fcch
0fc9 c30d0c    jp      0c0dh		; exec next pcode
0fcc e9        jp      (hl)

; exec GOTO DE=New PCODE_PC, HL=current PCODE_PC, 

0fcd eb        ex      de,hl			
0fce 7c        ld      a,h
0fcf a5        and     l
0fd0 eeff      xor     0ffh		; if New PC (in HL) = $FFFF -> a=$00
0fd2 0e0b      ld      c,0bh		; Error = 0B -> UG: Undefined Goto
0fd4 ca6f0c    jp      z,0c6fh		; Print Error in C and exit
0fd7 22e50b    ld      (0be5h),hl	; PCODE PC = NewPC
0fda c30d0c    jp      0c0dh		; exec next pcode

; exec POP word, JUMP to DE=New PCODE_PC if bit0=0

0fdd eb        ex      de,hl		; hl=New PCODE_PC
0fde d1        pop     de
0fdf 7b        ld      a,e
0fe0 1f        rra     
0fe1 da0d0c    jp      c,0c0dh		; exec next pcode
0fe4 22e50b    ld      (0be5h),hl	; PCODE PC
0fe7 c30d0c    jp      0c0dh		; exec next pcode

0fea eb        ex      de,hl
0feb d1        pop     de
0fec d5        push    de
0fed 7b        ld      a,e
0fee 96        sub     (hl)
0fef 5f        ld      e,a
0ff0 23        inc     hl
0ff1 7a        ld      a,d
0ff2 9e        sbc     a,(hl)
0ff3 57        ld      d,a
0ff4 0e06      ld      c,06h			; Error = 6 -> CE: CASE ERROR
0ff6 fa6f0c    jp      m,0c6fh			; Print Error in C and exit
0ff9 23        inc     hl
0ffa c1        pop     bc
0ffb 0b        dec     bc
0ffc 79        ld      a,c
0ffd 96        sub     (hl)
0ffe 23        inc     hl
0fff 78        ld      a,b
1000 9e        sbc     a,(hl)
1001 23        inc     hl
1002 0e06      ld      c,06h			; error = 6 -> CE: CASE ERROR
1004 f26f0c    jp      p,0c6fh			; Print Error in C and exit
1007 19        add     hl,de
1008 19        add     hl,de
1009 7e        ld      a,(hl)
100a 23        inc     hl
100b 66        ld      h,(hl)
100c 6f        ld      l,a
100d b4        or      h
100e ca6f0c    jp      z,0c6fh			; Print Error in C and exit
1011 22e50b    ld      (0be5h),hl		; PCODE PC
1014 c30d0c    jp      0c0dh			; exec next pcode

; MOVE: pop bc, pop hl, copy (bc)->(hl) for de words (de*2 bytes), then exec next opcode

1017 c1        pop     bc	42a4
1018 e1        pop     hl	f59c, de=0004
1019 eb        ex      de,hl
101a 29        add     hl,hl
101b eb        ex      de,hl	; de=de*2
101c 2b        dec     hl	
101d 0b        dec     bc
101e 0a        ld      a,(bc)
101f 77        ld      (hl),a
1020 1b        dec     de
1021 7a        ld      a,d
1022 b3        or      e
1023 c21c10    jp      nz,101ch
1026 c30d0c    jp      0c0dh		; exec next pcode

; (SP) = (SP) - DE*2

1029 e1        pop     hl
102a cd160e    call    0e16h		; DE = -DE 
102d 19        add     hl,de		
102e 19        add     hl,de		
102f e5        push    hl
1030 c30d0c    jp      0c0dh		; exec next pcode

; Reserve DE=words de espacio en stack and exec next pcode

1033 eb        ex      de,hl
1034 29        add     hl,hl
1035 cd0e0e    call    0e0eh			; HL=-HL
1038 39        add     hl,sp
1039 f9        ld      sp,hl			; Z80 SP = SP - HL*2
103a eb        ex      de,hl
103b 2aee0b    ld      hl,(0beeh)		; Stack Lower allowed Addr
103e 012800    ld      bc,0028h
1041 09        add     hl,bc
1042 7b        ld      a,e
1043 95        sub     l
1044 7a        ld      a,d
1045 9c        sbc     a,h
1046 0e01      ld      c,01h			; Error = 1 -> SO: Stack Overflow
1048 d20d0c    jp      nc,0c0dh			; exec next pcode
104b c36f0c    jp      0c6fh			; Print Error in C and exit

104e e1        pop     hl
104f cd7b10    call    107bh
1052 0e04      ld      c,04h			; Error = 4 -> AI: Array Index error
1054 da6f0c    jp      c,0c6fh			; Print Error in C and exit
1057 e1        pop     hl
1058 19        add     hl,de
1059 19        add     hl,de
105a e5        push    hl
105b c30d0c    jp      0c0dh		; exec next pcode
105e e1        pop     hl
105f d5        push    de
1060 cd7b10    call    107bh
1063 0e04      ld      c,04h			; Error = 4 -> AI: Array Index error
1065 da6f0c    jp      c,0c6fh			; Print Error in C and exit
1068 e1        pop     hl
1069 e3        ex      (sp),hl
106a 2b        dec     hl
106b 19        add     hl,de
106c e3        ex      (sp),hl
106d 7e        ld      a,(hl)
106e 23        inc     hl
106f 23        inc     hl
1070 ae        xor     (hl)
1071 1f        rra     
1072 da0d0c    jp      c,0c0dh		; exec next pcode
1075 e3        ex      (sp),hl
1076 2b        dec     hl
1077 e3        ex      (sp),hl
1078 c30d0c    jp      0c0dh		; exec next pcode
107b eb        ex      de,hl
107c 4e        ld      c,(hl)
107d 23        inc     hl
107e 46        ld      b,(hl)
107f 23        inc     hl
1080 cdfb0d    call    0dfbh
1083 d8        ret     c

1084 4b        ld      c,e
1085 42        ld      b,d
1086 5e        ld      e,(hl)
1087 23        inc     hl
1088 56        ld      d,(hl)
1089 23        inc     hl
108a cdfb0d    call    0dfbh
108d d8        ret     c

108e 7b        ld      a,e
108f 91        sub     c
1090 5f        ld      e,a
1091 7a        ld      a,d
1092 98        sbc     a,b
1093 57        ld      d,a
1094 4e        ld      c,(hl)
1095 23        inc     hl
1096 46        ld      b,(hl)
1097 78        ld      a,b
1098 b7        or      a
1099 c2a110    jp      nz,10a1h
109c 79        ld      a,c
109d 3d        dec     a
109e caa510    jp      z,10a5h
10a1 cdbf0d    call    0dbfh
10a4 eb        ex      de,hl
10a5 cd160e    call    0e16h		; DE = -DE 
10a8 b7        or      a
10a9 c9        ret     

10aa e1        pop     hl
10ab 2b        dec     hl
10ac 46        ld      b,(hl)
10ad 2b        dec     hl
10ae 4e        ld      c,(hl)
10af c5        push    bc
10b0 1b        dec     de
10b1 7b        ld      a,e
10b2 b2        or      d
10b3 c2ab10    jp      nz,10abh
10b6 c30d0c    jp      0c0dh		; exec next pcode
10b9 e1        pop     hl
10ba c1        pop     bc
10bb 0a        ld      a,(bc)
10bc be        cp      (hl)
10bd c2d310    jp      nz,10d3h
10c0 b7        or      a
10c1 cacc10    jp      z,10cch
10c4 03        inc     bc
10c5 23        inc     hl
10c6 1b        dec     de
10c7 7a        ld      a,d
10c8 b3        or      e
10c9 c2bb10    jp      nz,10bbh
10cc 210100    ld      hl,0001h
10cf e5        push    hl
10d0 c30d0c    jp      0c0dh		; exec next pcode
10d3 210000    ld      hl,0000h
10d6 e5        push    hl
10d7 c30d0c    jp      0c0dh		; exec next pcode
10da c1        pop     bc
10db e1        pop     hl
10dc d5        push    de
10dd 13        inc     de
10de 7b        ld      a,e
10df e6fe      and     0feh
10e1 5f        ld      e,a
10e2 cd160e    call    0e16h		; DE = -DE 
10e5 19        add     hl,de
10e6 d1        pop     de
10e7 e5        push    hl

; Print regE bytes from (SP)

10e8 e1        pop     hl		; addr of str to print
10e9 e3        ex      (sp),hl
10ea 43        ld      b,e
10eb c5        push    bc
10ec eb        ex      de,hl
10ed cd671b    call    1b67h
10f0 c1        pop     bc
10f1 e1        pop     hl
10f2 79        ld      a,c
10f3 b8        cp      b
10f4 d2f810    jp      nc,10f8h
10f7 41        ld      b,c
10f8 05        dec     b
10f9 fa0d0c    jp      m,0c0dh		; exec next pcode
10fc 4e        ld      c,(hl)
10fd cd3317    call    1733h		; print char
1100 23        inc     hl
1101 c3f810    jp      10f8h

1104 e1        pop     hl
1105 d1        pop     de
1106 c1        pop     bc
1107 79        ld      a,c
1108 ee80      xor     80h
110a 4f        ld      c,a
110b c5        push    bc

110c d5        push    de
110d e9        jp      (hl)
110e 210800    ld      hl,0008h
1111 39        add     hl,sp
1112 eb        ex      de,hl
1113 210400    ld      hl,0004h
1116 39        add     hl,sp
1117 7e        ld      a,(hl)
1118 47        ld      b,a
1119 e67f      and     7fh
111b 77        ld      (hl),a
111c 1a        ld      a,(de)
111d 4f        ld      c,a
111e c5        push    bc
111f e67f      and     7fh
1121 12        ld      (de),a
1122 cd4314    call    1443h
1125 c1        pop     bc
1126 70        ld      (hl),b
1127 79        ld      a,c
1128 12        ld      (de),a
1129 13        inc     de
112a 23        inc     hl
112b da4311    jp      c,1143h
112e 0e04      ld      c,04h
1130 1a        ld      a,(de)
1131 47        ld      b,a
1132 7e        ld      a,(hl)
1133 70        ld      (hl),b
1134 12        ld      (de),a
1135 2b        dec     hl
1136 1b        dec     de
1137 0d        dec     c
1138 c23011    jp      nz,1130h
113b 23        inc     hl
113c 23        inc     hl
113d 23        inc     hl
113e 23        inc     hl
113f 13        inc     de
1140 13        inc     de
1141 13        inc     de
1142 13        inc     de
1143 2b        dec     hl
1144 7e        ld      a,(hl)
1145 f5        push    af
1146 e67f      and     7fh
1148 77        ld      (hl),a
1149 23        inc     hl
114a 1a        ld      a,(de)
114b be        cp      (hl)
114c ca6a11    jp      z,116ah
114f 34        inc     (hl)
1150 b7        or      a
1151 2b        dec     hl
1152 7e        ld      a,(hl)
1153 1f        rra     
1154 77        ld      (hl),a
1155 2b        dec     hl
1156 7e        ld      a,(hl)
1157 1f        rra     
1158 77        ld      (hl),a
1159 2b        dec     hl
115a 7e        ld      a,(hl)
115b 1f        rra     
115c 77        ld      (hl),a
115d 23        inc     hl
115e b6        or      (hl)
115f 23        inc     hl
1160 b6        or      (hl)
1161 23        inc     hl
1162 c24a11    jp      nz,114ah
1165 f1        pop     af
1166 e1        pop     hl
1167 f1        pop     af
1168 f1        pop     af
1169 e9        jp      (hl)
116a 1b        dec     de
116b 1a        ld      a,(de)
116c 47        ld      b,a
116d e67f      and     7fh
116f 12        ld      (de),a
1170 f1        pop     af
1171 a8        xor     b
1172 faae11    jp      m,11aeh
1175 2b        dec     hl
1176 2b        dec     hl
1177 2b        dec     hl
1178 1b        dec     de
1179 1b        dec     de
117a 1a        ld      a,(de)
117b 86        add     a,(hl)
117c 12        ld      (de),a
117d 23        inc     hl
117e 13        inc     de
117f 1a        ld      a,(de)
1180 8e        adc     a,(hl)
1181 12        ld      (de),a
1182 23        inc     hl
1183 13        inc     de
1184 1a        ld      a,(de)
1185 8e        adc     a,(hl)
1186 12        ld      (de),a
1187 f2a311    jp      p,11a3h
118a b7        or      a
118b 1f        rra     
118c 12        ld      (de),a
118d 1b        dec     de
118e 1a        ld      a,(de)
118f 1f        rra     
1190 12        ld      (de),a
1191 1b        dec     de
1192 1a        ld      a,(de)
1193 1f        rra     
1194 12        ld      (de),a
1195 13        inc     de
1196 13        inc     de
1197 13        inc     de
1198 1a        ld      a,(de)
1199 3c        inc     a
119a 12        ld      (de),a
119b fe80      cp      80h
119d 0e09      ld      c,09h			; Error = 9 -> Floatig Point Overflow
119f ca6f0c    jp      z,0c6fh			; Print Error in C and exit
11a2 1b        dec     de
11a3 78        ld      a,b
11a4 e680      and     80h
11a6 47        ld      b,a
11a7 1a        ld      a,(de)
11a8 b0        or      b
11a9 12        ld      (de),a
11aa e1        pop     hl
11ab f1        pop     af
11ac f1        pop     af
11ad e9        jp      (hl)
11ae 2b        dec     hl
11af 2b        dec     hl
11b0 2b        dec     hl
11b1 1b        dec     de
11b2 1b        dec     de
11b3 1a        ld      a,(de)
11b4 96        sub     (hl)
11b5 f5        push    af
11b6 23        inc     hl
11b7 13        inc     de
11b8 1a        ld      a,(de)
11b9 9e        sbc     a,(hl)
11ba 12        ld      (de),a
11bb 13        inc     de
11bc 23        inc     hl
11bd 1a        ld      a,(de)
11be 9e        sbc     a,(hl)
11bf eb        ex      de,hl
11c0 58        ld      e,b
11c1 47        ld      b,a
11c2 2b        dec     hl
11c3 4e        ld      c,(hl)
11c4 23        inc     hl
11c5 23        inc     hl
11c6 56        ld      d,(hl)
11c7 f1        pop     af
11c8 e1        pop     hl
11c9 e3        ex      (sp),hl
11ca e1        pop     hl
11cb e3        ex      (sp),hl
11cc e1        pop     hl
11cd e3        ex      (sp),hl
11ce e1        pop     hl
11cf e3        ex      (sp),hl
11d0 eb        ex      de,hl
11d1 57        ld      d,a
11d2 1e00      ld      e,00h
11d4 c3ce12    jp      12ceh
11d7 210400    ld      hl,0004h
11da 39        add     hl,sp
11db 7e        ld      a,(hl)
11dc 4f        ld      c,a
11dd e67f      and     7fh
11df 77        ld      (hl),a
11e0 23        inc     hl
11e1 46        ld      b,(hl)
11e2 23        inc     hl
11e3 23        inc     hl
11e4 23        inc     hl
11e5 7e        ld      a,(hl)
11e6 a9        xor     c
11e7 f5        push    af
11e8 7e        ld      a,(hl)
11e9 e67f      and     7fh
11eb 77        ld      (hl),a
11ec 23        inc     hl
11ed 7e        ld      a,(hl)
11ee 80        add     a,b
11ef 4f        ld      c,a
11f0 1f        rra     
11f1 ae        xor     (hl)
11f2 a8        xor     b
11f3 a9        xor     c
11f4 fa0213    jp      m,1302h
11f7 79        ld      a,c
11f8 f5        push    af
11f9 010000    ld      bc,0000h
11fc 110000    ld      de,0000h
11ff 3e17      ld      a,17h
1201 2b        dec     hl
1202 f5        push    af
1203 7e        ld      a,(hl)
1204 1f        rra     
1205 77        ld      (hl),a
1206 2b        dec     hl
1207 7e        ld      a,(hl)
1208 1f        rra     
1209 77        ld      (hl),a
120a 2b        dec     hl
120b 7e        ld      a,(hl)
120c 1f        rra     
120d 77        ld      (hl),a
120e d22212    jp      nc,1222h
1211 2b        dec     hl
1212 2b        dec     hl
1213 2b        dec     hl
1214 2b        dec     hl
1215 7e        ld      a,(hl)
1216 82        add     a,d
1217 57        ld      d,a
1218 23        inc     hl
1219 7e        ld      a,(hl)
121a 89        adc     a,c
121b 4f        ld      c,a
121c 23        inc     hl
121d 7e        ld      a,(hl)
121e 88        adc     a,b
121f 47        ld      b,a
1220 23        inc     hl
1221 23        inc     hl
1222 b7        or      a
1223 78        ld      a,b
1224 1f        rra     
1225 47        ld      b,a
1226 79        ld      a,c
1227 1f        rra     
1228 4f        ld      c,a
1229 7a        ld      a,d
122a 1f        rra     
122b 57        ld      d,a
122c 7b        ld      a,e
122d 1f        rra     
122e 5f        ld      e,a
122f 23        inc     hl
1230 23        inc     hl
1231 f1        pop     af
1232 3d        dec     a
1233 c20212    jp      nz,1202h
1236 f1        pop     af
1237 67        ld      h,a
1238 f1        pop     af
1239 17        rla     
123a 7c        ld      a,h
123b e1        pop     hl
123c e3        ex      (sp),hl
123d e1        pop     hl
123e e3        ex      (sp),hl
123f e1        pop     hl
1240 e3        ex      (sp),hl
1241 e1        pop     hl
1242 e3        ex      (sp),hl
1243 67        ld      h,a
1244 1f        rra     
1245 6f        ld      l,a
1246 c3ce12    jp      12ceh
1249 210200    ld      hl,0002h
124c 39        add     hl,sp
124d 7e        ld      a,(hl)
124e 23        inc     hl
124f b6        or      (hl)
1250 47        ld      b,a
1251 23        inc     hl
1252 7e        ld      a,(hl)
1253 e67f      and     7fh
1255 b0        or      b
1256 0e09      ld      c,09h			; Error = 9 -> Floatig Point Overflow
1258 ca6f0c    jp      z,0c6fh			; Print Error in C and exit
125b 7e        ld      a,(hl)
125c 4f        ld      c,a
125d e67f      and     7fh
125f 77        ld      (hl),a
1260 23        inc     hl
1261 af        xor     a
1262 96        sub     (hl)
1263 47        ld      b,a
1264 23        inc     hl
1265 23        inc     hl
1266 23        inc     hl
1267 7e        ld      a,(hl)
1268 a9        xor     c
1269 f5        push    af
126a 7e        ld      a,(hl)
126b e67f      and     7fh
126d 77        ld      (hl),a
126e 23        inc     hl
126f 7e        ld      a,(hl)
1270 80        add     a,b
1271 4f        ld      c,a
1272 1f        rra     
1273 ae        xor     (hl)
1274 a8        xor     b
1275 a9        xor     c
1276 fa0213    jp      m,1302h
1279 79        ld      a,c
127a 3c        inc     a
127b fe80      cp      80h
127d 0e09      ld      c,09h			; Error = 9 -> Floatig Point Overflow
127f ca6f0c    jp      z,0c6fh			; Print Error in C and exit
1282 f5        push    af
1283 0617      ld      b,17h
1285 2b        dec     hl
1286 4e        ld      c,(hl)
1287 2b        dec     hl
1288 56        ld      d,(hl)
1289 2b        dec     hl
128a 5e        ld      e,(hl)
128b 2b        dec     hl
128c 2b        dec     hl
128d 2b        dec     hl
128e 2b        dec     hl
128f 7b        ld      a,e
1290 96        sub     (hl)
1291 23        inc     hl
1292 7a        ld      a,d
1293 9e        sbc     a,(hl)
1294 23        inc     hl
1295 79        ld      a,c
1296 9e        sbc     a,(hl)
1297 daa712    jp      c,12a7h
129a 2b        dec     hl
129b 2b        dec     hl
129c 7b        ld      a,e
129d 96        sub     (hl)
129e 5f        ld      e,a
129f 23        inc     hl
12a0 7a        ld      a,d
12a1 9e        sbc     a,(hl)
12a2 57        ld      d,a
12a3 23        inc     hl
12a4 79        ld      a,c
12a5 9e        sbc     a,(hl)
12a6 4f        ld      c,a
12a7 3f        ccf     
12a8 23        inc     hl
12a9 23        inc     hl
12aa 7e        ld      a,(hl)
12ab 17        rla     
12ac 77        ld      (hl),a
12ad 23        inc     hl
12ae 7e        ld      a,(hl)
12af 17        rla     
12b0 77        ld      (hl),a
12b1 23        inc     hl
12b2 7e        ld      a,(hl)
12b3 17        rla     
12b4 77        ld      (hl),a
12b5 2b        dec     hl
12b6 2b        dec     hl
12b7 eb        ex      de,hl
12b8 29        add     hl,hl
12b9 eb        ex      de,hl
12ba 79        ld      a,c
12bb 8f        adc     a,a
12bc 4f        ld      c,a
12bd 05        dec     b
12be c28b12    jp      nz,128bh
12c1 56        ld      d,(hl)
12c2 23        inc     hl
12c3 4e        ld      c,(hl)
12c4 23        inc     hl
12c5 7e        ld      a,(hl)
12c6 e67f      and     7fh
12c8 47        ld      b,a
12c9 1e00      ld      e,00h
12cb c33612    jp      1236h
12ce 78        ld      a,b
12cf b1        or      c
12d0 b2        or      d
12d1 b3        or      e
12d2 cafb12    jp      z,12fbh
12d5 78        ld      a,b
12d6 17        rla     
12d7 17        rla     
12d8 daef12    jp      c,12efh
12db eb        ex      de,hl
12dc 29        add     hl,hl
12dd eb        ex      de,hl
12de 79        ld      a,c
12df 89        adc     a,c
12e0 4f        ld      c,a
12e1 78        ld      a,b
12e2 88        adc     a,b
12e3 47        ld      b,a
12e4 3e06      ld      a,06h
12e6 fe80      cp      80h
12e8 cafb12    jp      z,12fbh
12eb 25        dec     h
12ec c3d512    jp      12d5h
12ef 7d        ld      a,l
12f0 e680      and     80h
12f2 80        add     a,b
12f3 6f        ld      l,a
12f4 41        ld      b,c
12f5 4a        ld      c,d
12f6 d1        pop     de
12f7 e5        push    hl
12f8 c5        push    bc
12f9 eb        ex      de,hl
12fa e9        jp      (hl)
12fb e1        pop     hl
12fc 110000    ld      de,0000h
12ff d5        push    de
1300 d5        push    de
1301 e9        jp      (hl)
1302 e1        pop     hl
1303 d1        pop     de
1304 e1        pop     hl
1305 e1        pop     hl
1306 e1        pop     hl
1307 e1        pop     hl
1308 d5        push    de
1309 79        ld      a,c
130a b7        or      a
130b f2fb12    jp      p,12fbh
130e 0e09      ld      c,09h			; Error = 9 -> Floatig Point Overflow
1310 c36f0c    jp      0c6fh			; Print Error in C and exit
1313 c1        pop     bc
1314 110000    ld      de,0000h
1317 d5        push    de
1318 d5        push    de
1319 c5        push    bc
131a 7e        ld      a,(hl)
131b fe2b      cp      2bh
131d ca2713    jp      z,1327h
1320 fe2d      cp      2dh
1322 c22913    jp      nz,1329h
1325 1680      ld      d,80h
1327 23        inc     hl
1328 7e        ld      a,(hl)
1329 fe2e      cp      2eh
132b c23e13    jp      nz,133eh
132e 7a        ld      a,d
132f e660      and     60h
1331 ee20      xor     20h
1333 37        scf     
1334 c0        ret     nz

1335 7a        ld      a,d
1336 f640      or      40h
1338 ee20      xor     20h
133a 57        ld      d,a
133b c32713    jp      1327h
133e fe65      cp      65h
1340 ca9c13    jp      z,139ch
1343 fe45      cp      45h
1345 ca9c13    jp      z,139ch
1348 fe2b      cp      2bh
134a 37        scf     
134b c8        ret     z

134c fe2d      cp      2dh
134e 37        scf     
134f c8        ret     z

1350 b7        or      a
1351 cae613    jp      z,13e6h
1354 7a        ld      a,d
1355 e640      and     40h
1357 ca6313    jp      z,1363h
135a 7a        ld      a,d
135b e607      and     07h
135d fe07      cp      07h
135f ca2713    jp      z,1327h
1362 14        inc     d
1363 c1        pop     bc
1364 7a        ld      a,d
1365 d1        pop     de
1366 e3        ex      (sp),hl
1367 f5        push    af
1368 c5        push    bc
1369 e5        push    hl
136a d5        push    de
136b 215004    ld      hl,0450h
136e e5        push    hl
136f 210000    ld      hl,0000h
1372 e5        push    hl
1373 cdd711    call    11d7h
1376 210800    ld      hl,0008h
1379 39        add     hl,sp
137a 7e        ld      a,(hl)
137b 23        inc     hl
137c 66        ld      h,(hl)
137d 6f        ld      l,a
137e 7e        ld      a,(hl)
137f d630      sub     30h
1381 2607      ld      h,07h
1383 110000    ld      de,0000h
1386 4a        ld      c,d
1387 6a        ld      l,d
1388 47        ld      b,a
1389 cdce12    call    12ceh
138c cd0e11    call    110eh
138f d1        pop     de
1390 e1        pop     hl
1391 c1        pop     bc
1392 f1        pop     af
1393 e3        ex      (sp),hl
1394 d5        push    de
1395 c5        push    bc
1396 f620      or      20h
1398 57        ld      d,a
1399 c32713    jp      1327h
139c 7a        ld      a,d
139d e620      and     20h
139f 37        scf     
13a0 c8        ret     z

13a1 010000    ld      bc,0000h
13a4 23        inc     hl
13a5 7e        ld      a,(hl)
13a6 fe2b      cp      2bh
13a8 cab413    jp      z,13b4h
13ab fe2d      cp      2dh
13ad c2b613    jp      nz,13b6h
13b0 7a        ld      a,d
13b1 f610      or      10h
13b3 57        ld      d,a
13b4 23        inc     hl
13b5 7e        ld      a,(hl)
13b6 d630      sub     30h
13b8 d8        ret     c

13b9 fe0a      cp      0ah
13bb 3f        ccf     
13bc d8        ret     c

13bd 4f        ld      c,a
13be 23        inc     hl
13bf 7e        ld      a,(hl)
13c0 b7        or      a
13c1 cace13    jp      z,13ceh
13c4 d630      sub     30h
13c6 d8        ret     c

13c7 fe0a      cp      0ah
13c9 3f        ccf     
13ca d8        ret     c

13cb 41        ld      b,c
13cc 4f        ld      c,a
13cd 23        inc     hl
13ce 78        ld      a,b
13cf 87        add     a,a
13d0 87        add     a,a
13d1 87        add     a,a
13d2 80        add     a,b
13d3 80        add     a,b
13d4 81        add     a,c
13d5 4f        ld      c,a
13d6 7e        ld      a,(hl)
13d7 b7        or      a
13d8 37        scf     
13d9 c0        ret     nz

13da 7a        ld      a,d
13db e610      and     10h
13dd caed13    jp      z,13edh
13e0 af        xor     a
13e1 91        sub     c
13e2 4f        ld      c,a
13e3 c3ed13    jp      13edh
13e6 7a        ld      a,d
13e7 e620      and     20h
13e9 37        scf     
13ea c8        ret     z

13eb 0e00      ld      c,00h
13ed 7a        ld      a,d
13ee e607      and     07h
13f0 47        ld      b,a
13f1 79        ld      a,c
13f2 90        sub     b
13f3 5f        ld      e,a
13f4 c1        pop     bc
13f5 e1        pop     hl
13f6 e3        ex      (sp),hl
13f7 7a        ld      a,d
13f8 e680      and     80h
13fa ca0114    jp      z,1401h
13fd 7d        ld      a,l
13fe f680      or      80h
1400 6f        ld      l,a
1401 7b        ld      a,e
1402 d1        pop     de
1403 b7        or      a
1404 ca3f14    jp      z,143fh
1407 f22114    jp      p,1421h
140a 3c        inc     a
140b f5        push    af
140c c5        push    bc
140d e5        push    hl
140e d5        push    de
140f 215004    ld      hl,0450h
1412 e5        push    hl
1413 210000    ld      hl,0000h
1416 e5        push    hl
1417 cd4912    call    1249h
141a d1        pop     de
141b e1        pop     hl
141c c1        pop     bc
141d f1        pop     af
141e c30314    jp      1403h
1421 3d        dec     a
1422 f5        push    af
1423 f5        push    af
1424 c5        push    bc
1425 7c        ld      a,h
1426 c604      add     a,04h
1428 17        rla     
1429 d8        ret     c

142a e5        push    hl
142b d5        push    de
142c 215004    ld      hl,0450h
142f e5        push    hl
1430 210000    ld      hl,0000h
1433 e5        push    hl
1434 cdd711    call    11d7h
1437 d1        pop     de
1438 e1        pop     hl
1439 c1        pop     bc
143a f1        pop     af
143b f1        pop     af
143c c30314    jp      1403h
143f e5        push    hl
1440 d5        push    de
1441 c5        push    bc
1442 c9        ret     

1443 1a        ld      a,(de)
1444 ae        xor     (hl)
1445 f24d14    jp      p,144dh
1448 1a        ld      a,(de)
1449 b7        or      a
144a f8        ret     m

144b 37        scf     
144c c9        ret     

144d cd7e14    call    147eh
1450 37        scf     
1451 c8        ret     z

1452 eb        ex      de,hl
1453 cd7e14    call    147eh
1456 eb        ex      de,hl
1457 c8        ret     z

1458 23        inc     hl
1459 13        inc     de
145a 1a        ld      a,(de)
145b ee80      xor     80h
145d 47        ld      b,a
145e 7e        ld      a,(hl)
145f ee80      xor     80h
1461 2b        dec     hl
1462 1b        dec     de
1463 b8        cp      b
1464 ca6b14    jp      z,146bh
1467 1f        rra     
1468 ae        xor     (hl)
1469 17        rla     
146a c9        ret     

146b 2b        dec     hl
146c 2b        dec     hl
146d 1b        dec     de
146e 1b        dec     de
146f 1a        ld      a,(de)
1470 96        sub     (hl)
1471 23        inc     hl
1472 13        inc     de
1473 1a        ld      a,(de)
1474 9e        sbc     a,(hl)
1475 23        inc     hl
1476 13        inc     de
1477 1a        ld      a,(de)
1478 9e        sbc     a,(hl)
1479 3f        ccf     
147a 1f        rra     
147b ae        xor     (hl)
147c 17        rla     
147d c9        ret     

147e 7e        ld      a,(hl)
147f e67f      and     7fh
1481 2b        dec     hl
1482 b6        or      (hl)
1483 2b        dec     hl
1484 b6        or      (hl)
1485 23        inc     hl
1486 23        inc     hl
1487 c9        ret     

1488 9c        sbc     a,h
1489 7b        ld      a,e
148a 76        halt    
148b ba        cp      d
148c 77        ld      (hl),a
148d 6e        ld      l,(hl)
148e 9e        sbc     a,(hl)
148f 6d        ld      l,l
1490 e7        rst     20h
1491 79        ld      a,c
1492 bb        cp      e
1493 9c        sbc     a,h
1494 dbde      in      a,(0deh)
1496 ac        xor     h
1497 a2        and     d
1498 77        ld      (hl),a
1499 b7        or      a
149a 6e        ld      l,(hl)
149b eed9      xor     0d9h
149d 267a      ld      h,7ah
149f a7        and     a
14a0 daada9    jp      c,0a9adh
14a3 c9        ret     

14a4 b9        cp      c
14a5 9b        sbc     a,e
14a6 6b        ld      l,e
14a7 ee8d      xor     8dh
14a9 76        halt    
14aa e7        rst     20h
14ab 76        halt    
14ac dba6      in      a,(0a6h)
14ae b7        or      a
14af 7a        ld      a,d
14b0 b6        or      (hl)
14b1 76        halt    
14b2 ae        xor     (hl)
14b3 9b        sbc     a,e
14b4 a9        xor     c
14b5 9d        sbc     a,l
14b6 bd        cp      l
14b7 d8        ret     c

14b8 e6cd      and     0cdh
14ba 6b        ld      l,e
14bb cb79      bit     7,c
14bd 7a        ld      a,d
14be ceeb      adc     a,0ebh
14c0 98        sbc     a,b
14c1 b6        or      (hl)
14c2 8d        adc     a,l
14c3 a7        and     a
14c4 9c        sbc     a,h
14c5 ab        xor     e
14c6 a7        and     a
14c7 cf        rst     08h
14c8 75        ld      (hl),l
14c9 9e        sbc     a,(hl)
14ca de6e      sbc     a,6eh
14cc 7b        ld      a,e
14cd b6        or      (hl)
14ce bb        cp      e
14cf 78        ld      a,b
14d0 9a        sbc     a,d
14d1 78        ld      a,b
14d2 ea7b77    jp      pe,777bh
14d5 d6ce      sub     0ceh
14d7 6a        ld      l,d
14d8 dae676    jp      c,76e6h
14db ab        xor     e
14dc b7        or      a
14dd e8        ret     pe

14de 99        sbc     a,c
14df 6f        ld      l,a
14e0 b6        or      (hl)
14e1 ed77      db      0edh, 77h        ; Undocumented 8 T-State NOP
14e3 6b        ld      l,e
14e4 ce56      adc     a,56h
14e6 66        ld      h,(hl)
14e7 2eee      ld      l,0eeh
14e9 e5        push    hl
14ea ad        xor     l
14eb 9b        sbc     a,e
14ec ae        xor     (hl)
14ed 78        ld      a,b
14ee 7b        ld      a,e
14ef 9b        sbc     a,e
14f0 deb9      sbc     a,0b9h
14f2 a6        and     (hl)
14f3 1b        dec     de
14f4 9a        sbc     a,d
14f5 2c        inc     l
14f6 d9        exx     
14f7 a6        and     (hl)
14f8 a5        and     l
14f9 72        ld      (hl),d
14fa 63        ld      h,e
14fb 77        ld      (hl),a
14fc edb8      lddr    
14fe 7e        ld      a,(hl)
14ff b7        or      a
1500 67        ld      h,a
1501 76        halt    
1502 2e98      ld      l,98h
1504 ce9e      adc     a,9eh
1506 8b        adc     a,e
1507 a7        and     a
1508 9e        sbc     a,(hl)
1509 99        sbc     a,c
150a b9        cp      c
150b 99        sbc     a,c
150c b3        or      e
150d db28      in      a,(28h)
150f b7        or      a
1510 e5        push    hl
1511 dee9      sbc     a,0e9h
1513 eee6      xor     0e6h
1515 76        halt    
1516 2eb6      ld      l,0b6h
1518 ce6a      adc     a,6ah
151a 9e        sbc     a,(hl)
151b 79        ld      a,c
151c 9e        sbc     a,(hl)
151d 73        ld      (hl),e
151e 2c        inc     l
151f fb        ei      
1520 da9967    jp      c,6799h
1523 9e        sbc     a,(hl)
1524 77        ld      (hl),a
1525 9e        sbc     a,(hl)
1526 6d        ld      l,l
1527 6e        ld      l,(hl)
1528 d7        rst     10h
1529 89        adc     a,c
152a b7        or      a
152b ae        xor     (hl)
152c 69        ld      l,c
152d 27        daa     
152e 6a        ld      l,d
152f 26bb      ld      h,0bbh
1531 e49eee    call    po,0ee9eh
1534 69        ld      l,c
1535 9b        sbc     a,e
1536 87        add     a,a
1537 edd6      db      0edh, 0d6h       ; Undocumented 8 T-State NOP
1539 fe6e      cp      6eh
153b 9e        sbc     a,(hl)
153c 67        ld      h,a
153d b7        or      a
153e bb        cp      e
153f b2        or      d
1540 ee89      xor     89h
1542 8b        adc     a,e
1543 a7        and     a
1544 b7        or      a
1545 e7        rst     20h
1546 de9e      sbc     a,9eh
1548 a2        and     d
1549 98        sbc     a,b
154a 8b        adc     a,e
154b b7        or      a
154c e9        jp      (hl)
154d dd1a      ld      a,(de)
154f 9a        sbc     a,d
1550 66        ld      h,(hl)
1551 e3        ex      (sp),hl
1552 d8        ret     c

1553 7e        ld      a,(hl)
1554 6e        ld      l,(hl)
1555 66        ld      h,(hl)
1556 6e        ld      l,(hl)
1557 72        ld      (hl),d
1558 bb        cp      e
1559 e7        rst     20h
155a b9        cp      c
155b 9e        sbc     a,(hl)
155c 73        ld      (hl),e
155d 9b        sbc     a,e
155e eb        ex      de,hl
155f 99        sbc     a,c
1560 73        ld      (hl),e
1561 9e        sbc     a,(hl)
1562 e6ba      and     0bah
1564 2f        cpl     
1565 7b        ld      a,e
1566 9a        sbc     a,d
1567 6e        ld      l,(hl)
1568 b6        or      (hl)
1569 dddee8    sbc     a,0e8h
156c 8c        adc     a,h
156d 27        daa     
156e d69e      sub     9eh
1570 37        scf     
1571 cb1a      rr      d
1573 b2        or      d
1574 69        ld      l,c
1575 6e        ld      l,(hl)
1576 7b        ld      a,e
1577 da6e77    jp      c,776eh
157a ab        xor     e
157b 79        ld      a,c
157c d7        rst     10h
157d ed9e      db      0edh, 9eh        ; Undocumented 8 T-State NOP
157f d9        exx     
1580 9d        sbc     a,l
1581 ae        xor     (hl)
1582 b8        cp      b
1583 29        add     hl,hl
1584 deae      sbc     a,0aeh
1586 6d        ld      l,l
1587 7b        ld      a,e
1588 b7        or      a
1589 a3        and     e
158a fa9900    jp      m,0099h
158d 00        nop     
158e 00        nop     
158f 00        nop     
1590 00        nop     
1591 c5        push    bc
1592 d5        push    de
1593 e5        push    hl
1594 cd211a    call    1a21h
1597 13        inc     de
1598 1a        ld      a,(de)
1599 1b        dec     de
159a b7        or      a
159b c2c815    jp      nz,15c8h
159e 1a        ld      a,(de)
159f e680      and     80h
15a1 0e0f      ld      c,0fh
15a3 c2da15    jp      nz,15dah
15a6 cd0919    call    1909h
15a9 0e0d      ld      c,0dh
15ab d2da15    jp      nc,15dah
15ae 1a        ld      a,(de)
15af 1f        rra     
15b0 0e0d      ld      c,0dh
15b2 dada15    jp      c,15dah
15b5 212300    ld      hl,0023h
15b8 19        add     hl,de
15b9 35        dec     (hl)
15ba fca916    call    m,16a9h
15bd 23        inc     hl
15be 34        inc     (hl)
15bf 5e        ld      e,(hl)
15c0 1600      ld      d,00h
15c2 19        add     hl,de
15c3 7e        ld      a,(hl)
15c4 e1        pop     hl
15c5 d1        pop     de
15c6 c1        pop     bc
15c7 c9        ret     

15c8 218f15    ld      hl,158fh
15cb 35        dec     (hl)
15cc fce115    call    m,15e1h
15cf 21cf1a    ld      hl,1acfh
15d2 5e        ld      e,(hl)
15d3 34        inc     (hl)
15d4 217f1a    ld      hl,1a7fh
15d7 c3c015    jp      15c0h
15da cda502    call    02a5h
15dd e1        pop     hl
15de d1        pop     de
15df c1        pop     bc
15e0 c9        ret     

15e1 0e0c      ld      c,0ch	; return CP/M version
15e3 cd0500    call    0005h	; Call BDOS
15e6 b7        or      a
15e7 c28916    jp      nz,1689h
15ea 2a0600    ld      hl,(0006h)
15ed 11ff01    ld      de,01ffh
15f0 19        add     hl,de
15f1 7e        ld      a,(hl)
15f2 329015    ld      (1590h),a
15f5 af        xor     a
15f6 32cf1a    ld      (1acfh),a
15f9 4f        ld      c,a
15fa 217f1a    ld      hl,1a7fh
15fd e5        push    hl
15fe c5        push    bc
15ff cdb61b    call    1bb6h
1602 c1        pop     bc
1603 e1        pop     hl
1604 fe7f      cp      7fh
1606 ca2616    jp      z,1626h
1609 fe15      cp      15h
160b ca6016    jp      z,1660h
160e fe1b      cp      1bh
1610 cac60c    jp      z,0cc6h
1613 77        ld      (hl),a
1614 0c        inc     c
1615 23        inc     hl
1616 fe0d      cp      0dh
1618 c2fd15    jp      nz,15fdh
161b 0d        dec     c
161c 79        ld      a,c
161d 328f15    ld      (158fh),a
1620 0e0a      ld      c,0ah		; Print $0A
1622 cdc21b    call    1bc2h		; Print Char at RegC
1625 c9        ret     

1626 0d        dec     c
1627 fae115    jp      m,15e1h
162a 110107    ld      de,0701h
162d 2b        dec     hl
162e 7e        ld      a,(hl)
162f fe09      cp      09h
1631 c23f16    jp      nz,163fh
1634 cd7216    call    1672h
1637 7a        ld      a,d
1638 e607      and     07h
163a 57        ld      d,a
163b 3e08      ld      a,08h
163d 92        sub     d
163e 5f        ld      e,a
163f e5        push    hl
1640 c5        push    bc
1641 15        dec     d
1642 fa5216    jp      m,1652h
1645 d5        push    de
1646 cdf21b    call    1bf2h
1649 0e20      ld      c,20h		; Print SPACE
164b cdc21b    call    1bc2h		; Print Char at RegC
164e d1        pop     de
164f c34116    jp      1641h
1652 d5        push    de
1653 cdf21b    call    1bf2h
1656 d1        pop     de
1657 1d        dec     e
1658 c25216    jp      nz,1652h
165b c1        pop     bc
165c e1        pop     hl
165d c3fd15    jp      15fdh
1660 0e23      ld      c,23h		; Print #
1662 cdc21b    call    1bc2h		; Print Char at RegC
1665 0e0d      ld      c,0dh		; Print CR
1667 cdc21b    call    1bc2h		; Print Char at RegC
166a 0e0a      ld      c,0ah		; print LF
166c cdc21b    call    1bc2h		; Print Char at RegC
166f c3e115    jp      15e1h
1672 217f1a    ld      hl,1a7fh
1675 41        ld      b,c
1676 3a9015    ld      a,(1590h)
1679 57        ld      d,a
167a 05        dec     b
167b f8        ret     m

167c 7e        ld      a,(hl)
167d 23        inc     hl
167e 14        inc     d
167f fe09      cp      09h
1681 c27a16    jp      nz,167ah
1684 1600      ld      d,00h
1686 c37a16    jp      167ah
1689 217d1a    ld      hl,1a7dh
168c 3650      ld      (hl),50h
168e 0e0a      ld      c,0ah	; Read Console Line
1690 eb        ex      de,hl
1691 cd0500    call    0005h	; Call BDOS
1694 217e1a    ld      hl,1a7eh
1697 7e        ld      a,(hl)
1698 328f15    ld      (158fh),a
169b 3c        inc     a
169c 5f        ld      e,a
169d 1600      ld      d,00h
169f 19        add     hl,de
16a0 360d      ld      (hl),0dh
16a2 af        xor     a
16a3 32cf1a    ld      (1acfh),a
16a6 c3a31b    jp      1ba3h		; Print CR LF
16a9 e5        push    hl
16aa d5        push    de
16ab 212500    ld      hl,0025h
16ae 19        add     hl,de
16af eb        ex      de,hl
16b0 0e1a      ld      c,1ah	; Set DMA Addr
16b2 cd0500    call    0005h	; Call BDOS
16b5 d1        pop     de
16b6 d5        push    de
16b7 13        inc     de
16b8 13        inc     de
16b9 0e14      ld      c,14h	; SEQ READ
16bb cd0500    call    0005h	; Call BDOS
16be f5        push    af
16bf 118000    ld      de,0080h
16c2 0e1a      ld      c,1ah	; Set DMA Addr
16c4 cd0500    call    0005h	; Call BDOS
16c7 f1        pop     af
16c8 d1        pop     de
16c9 b7        or      a
16ca c2ed16    jp      nz,16edh
16cd 212400    ld      hl,0024h
16d0 19        add     hl,de
16d1 3600      ld      (hl),00h
16d3 2b        dec     hl
16d4 367f      ld      (hl),7fh
16d6 1a        ld      a,(de)
16d7 e620      and     20h
16d9 c2eb16    jp      nz,16ebh
16dc 2b        dec     hl
16dd 7e        ld      a,(hl)
16de fe80      cp      80h
16e0 caf916    jp      z,16f9h
16e3 211100    ld      hl,0011h
16e6 19        add     hl,de
16e7 be        cp      (hl)
16e8 ca0917    jp      z,1709h
16eb e1        pop     hl
16ec c9        ret     

16ed 1a        ld      a,(de)
16ee e620      and     20h
16f0 e1        pop     hl
16f1 c22717    jp      nz,1727h
16f4 1a        ld      a,(de)
16f5 f680      or      80h
16f7 12        ld      (de),a
16f8 c9        ret     

16f9 e5        push    hl
16fa d5        push    de
16fb 13        inc     de
16fc 13        inc     de
16fd 0e14      ld      c,14h	; SEQ READ
16ff cd0500    call    0005h	; Call BDOS
1702 d1        pop     de
1703 e1        pop     hl
1704 35        dec     (hl)
1705 b7        or      a
1706 cae316    jp      z,16e3h
1709 d5        push    de
170a 21a400    ld      hl,00a4h
170d 19        add     hl,de
170e e5        push    hl
170f 212300    ld      hl,0023h
1712 19        add     hl,de
1713 d1        pop     de
1714 35        dec     (hl)
1715 fa2217    jp      m,1722h
1718 1a        ld      a,(de)
1719 1b        dec     de
171a fe1a      cp      1ah
171c c21417    jp      nz,1714h
171f d1        pop     de
1720 e1        pop     hl
1721 c9        ret     

1722 367f      ld      (hl),7fh
1724 d1        pop     de
1725 e1        pop     hl
1726 c9        ret     

1727 e5        push    hl
1728 d5        push    de
1729 13        inc     de
172a 13        inc     de
172b 0e15      ld      c,15h	; SEQ WRITE
172d cd0500    call    0005h	; Call BDOS
1730 d1        pop     de
1731 e1        pop     hl
1732 c9        ret     

; Print char int regC

1733 f5        push    af
1734 c5        push    bc
1735 e5        push    hl
1736 d5        push    de
1737 cd211a    call    1a21h
173a 13        inc     de
173b 1a        ld      a,(de)
173c 1b        dec     de
173d b7        or      a
173e c26517    jp      nz,1765h
1741 cd0919    call    1909h
1744 c5        push    bc
1745 0e0e      ld      c,0eh
1747 d27a17    jp      nc,177ah
174a 1a        ld      a,(de)
174b 1f        rra     
174c d27a17    jp      nc,177ah
174f c1        pop     bc
1750 212400    ld      hl,0024h
1753 19        add     hl,de
1754 34        inc     (hl)
1755 7e        ld      a,(hl)
1756 5f        ld      e,a
1757 1600      ld      d,00h
1759 19        add     hl,de
175a 71        ld      (hl),c
175b fe80      cp      80h
175d d1        pop     de
175e cc8217    call    z,1782h
1761 e1        pop     hl
1762 c1        pop     bc
1763 f1        pop     af
1764 c9        ret     
1765 1f        rra     
1766 d26f17    jp      nc,176fh
1769 cdc21b    call    1bc2h		; Print Char at RegC
176c c37217    jp      1772h
176f cdec1b    call    1bech
1772 cda60c    call    0ca6h
1775 d1        pop     de
1776 e1        pop     hl
1777 c1        pop     bc
1778 f1        pop     af
1779 c9        ret     

177a 0e0e      ld      c,0eh
177c cda502    call    02a5h
177f c37517    jp      1775h
1782 212400    ld      hl,0024h
1785 19        add     hl,de
1786 3600      ld      (hl),00h
1788 d5        push    de
1789 eb        ex      de,hl
178a 13        inc     de
178b 0e1a      ld      c,1ah	: Set DMA Addr
178d cd0500    call    0005h	; Call BDOS
1790 d1        pop     de
1791 d5        push    de
1792 0e15      ld      c,15h	; SEQ WRITE
1794 13        inc     de
1795 13        inc     de
1796 cd0500    call    0005h	; Call BDOS
1799 0e12      ld      c,12h
179b b7        or      a
179c c4a502    call    nz,02a5h
179f 118000    ld      de,0080h
17a2 0e1a      ld      c,1ah	; Set DMA Addr
17a4 cd0500    call    0005h	; Call BDOS
17a7 d1        pop     de
17a8 c9        ret     

17a9 eb        ex      de,hl
17aa 29        add     hl,hl
17ab 44        ld      b,h
17ac 4d        ld      c,l
17ad d1        pop     de
17ae cd0e0e    call    0e0eh			; HL=-HL
17b1 19        add     hl,de
17b2 78        ld      a,b
17b3 b1        or      c
17b4 c2bc17    jp      nz,17bch
17b7 2b        dec     hl
17b8 3600      ld      (hl),00h
17ba 03        inc     bc
17bb 2b        dec     hl
17bc cd9115    call    1591h
17bf 77        ld      (hl),a
17c0 23        inc     hl
17c1 fe0d      cp      0dh
17c3 c2ca17    jp      nz,17cah
17c6 1a        ld      a,(de)
17c7 f640      or      40h
17c9 12        ld      (de),a
17ca 1a        ld      a,(de)
17cb e680      and     80h
17cd c20d0c    jp      nz,0c0dh		; exec next pcode
17d0 0b        dec     bc
17d1 78        ld      a,b
17d2 b1        or      c
17d3 c2bc17    jp      nz,17bch
17d6 c30d0c    jp      0c0dh		; exec next pcode
17d9 eb        ex      de,hl
17da d1        pop     de
17db 29        add     hl,hl
17dc 44        ld      b,h
17dd 4d        ld      c,l
17de cd0e0e    call    0e0eh			; HL=-HL
17e1 19        add     hl,de
17e2 78        ld      a,b
17e3 b1        or      c
17e4 c2ec17    jp      nz,17ech
17e7 2b        dec     hl
17e8 2b        dec     hl
17e9 010100    ld      bc,0001h
17ec c5        push    bc
17ed 4e        ld      c,(hl)
17ee cd3317    call    1733h		; print char
17f1 c1        pop     bc
17f2 23        inc     hl
17f3 0b        dec     bc
17f4 78        ld      a,b
17f5 b1        or      c
17f6 c2ec17    jp      nz,17ech
17f9 c30d0c    jp      0c0dh		; exec next pcode
17fc cd211a    call    1a21h
17ff af        xor     a
1800 c1        pop     bc
1801 e1        pop     hl
1802 f5        push    af
1803 d5        push    de
1804 eb        ex      de,hl
1805 2157ff    ld      hl,0ff57h
1808 19        add     hl,de
1809 eb        ex      de,hl
180a 2b        dec     hl
180b 72        ld      (hl),d
180c 2b        dec     hl
180d 73        ld      (hl),e
180e c5        push    bc
180f 78        ld      a,b
1810 b1        or      c
1811 c22118    jp      nz,1821h
1814 cd0919    call    1909h
1817 d24318    jp      nc,1843h
181a cde018    call    18e0h
181d e1        pop     hl
181e c32b18    jp      182bh
1821 cd0919    call    1909h
1824 dcbe18    call    c,18beh
1827 e1        pop     hl
1828 cd5d19    call    195dh
182b cdae18    call    18aeh
182e d5        push    de
182f 13        inc     de
1830 13        inc     de
1831 cd2a1a    call    1a2ah
1834 ca5918    jp      z,1859h
1837 d1        pop     de
1838 cd2b19    call    192bh
183b eb        ex      de,hl
183c d1        pop     de
183d f1        pop     af
183e 77        ld      (hl),a
183f e5        push    hl
1840 c3a917    jp      17a9h
1843 e1        pop     hl
1844 cd5d19    call    195dh
1847 d5        push    de
1848 0e16      ld      c,16h	; CREATE FILE
184a 13        inc     de
184b 13        inc     de
184c cd0500    call    0005h	; Call BDOS
184f 3c        inc     a
1850 c23718    jp      nz,1837h
1853 e1        pop     hl
1854 e1        pop     hl
1855 e1        pop     hl
1856 c3a618    jp      18a6h
1859 0e10      ld      c,10h
185b cda502    call    02a5h
185e e1        pop     hl
185f e1        pop     hl
1860 e1        pop     hl
1861 c30d0c    jp      0c0dh		; exec next pcode
1864 cd211a    call    1a21h
1867 e1        pop     hl
1868 e3        ex      (sp),hl
1869 eb        ex      de,hl
186a 2157ff    ld      hl,0ff57h
186d 19        add     hl,de
186e eb        ex      de,hl
186f 2b        dec     hl
1870 72        ld      (hl),d
1871 2b        dec     hl
1872 73        ld      (hl),e
1873 e1        pop     hl
1874 cd0919    call    1909h
1877 d28218    jp      nc,1882h
187a cdbe18    call    18beh
187d 7c        ld      a,h
187e b5        or      l
187f ca8518    jp      z,1885h
1882 cd5d19    call    195dh
1885 cdae18    call    18aeh
1888 d5        push    de
1889 13        inc     de
188a 13        inc     de
188b d5        push    de
188c 0e13      ld      c,13h	; DELETE FILE
188e cd0500    call    0005h	; Call BDOS
1891 d1        pop     de
1892 0e16      ld      c,16h	; CREATE FILE
1894 cd0500    call    0005h	; Call BDOS
1897 d1        pop     de
1898 feff      cp      0ffh
189a caa618    jp      z,18a6h
189d cd2b19    call    192bh
18a0 3e81      ld      a,81h
18a2 12        ld      (de),a
18a3 c30d0c    jp      0c0dh		; exec next pcode
18a6 0e11      ld      c,11h
18a8 cda502    call    02a5h
18ab c30d0c    jp      0c0dh		; exec next pcode
18ae e5        push    hl
18af 210e00    ld      hl,000eh
18b2 19        add     hl,de
18b3 0e17      ld      c,17h
18b5 3600      ld      (hl),00h
18b7 23        inc     hl
18b8 0d        dec     c
18b9 c2b518    jp      nz,18b5h
18bc e1        pop     hl
18bd c9        ret     

18be c5        push    bc
18bf d5        push    de
18c0 e5        push    hl
18c1 210b00    ld      hl,000bh
18c4 19        add     hl,de
18c5 3e24      ld      a,24h
18c7 be        cp      (hl)
18c8 c2e318    jp      nz,18e3h
18cb 23        inc     hl
18cc be        cp      (hl)
18cd c2e318    jp      nz,18e3h
18d0 23        inc     hl
18d1 be        cp      (hl)
18d2 c2e318    jp      nz,18e3h
18d5 13        inc     de
18d6 13        inc     de
18d7 0e13      ld      c,13h	; DELETE FILE
18d9 cd0500    call    0005h	; Call BDOS
18dc e1        pop     hl
18dd d1        pop     de
18de c1        pop     bc
18df c9        ret     

18e0 c5        push    bc
18e1 d5        push    de
18e2 e5        push    hl
18e3 1a        ld      a,(de)
18e4 1f        rra     
18e5 d20519    jp      nc,1905h
18e8 0e1a      ld      c,1ah
18ea cd3317    call    1733h		; print char
18ed 212400    ld      hl,0024h
18f0 19        add     hl,de
18f1 7e        ld      a,(hl)
18f2 b7        or      a
18f3 cafe18    jp      z,18feh
18f6 0e00      ld      c,00h
18f8 cd3317    call    1733h		; print char
18fb c3ed18    jp      18edh
18fe 0e10      ld      c,10h	; CLOSE FILE
1900 13        inc     de
1901 13        inc     de
1902 cd0500    call    0005h	; Call BDOS
1905 e1        pop     hl
1906 d1        pop     de
1907 c1        pop     bc
1908 c9        ret     

1909 e5        push    hl
190a c5        push    bc
190b 2af80b    ld      hl,(0bf8h)
190e 7c        ld      a,h
190f b5        or      l
1910 c21619    jp      nz,1916h
1913 c1        pop     bc
1914 e1        pop     hl
1915 c9        ret     

1916 7c        ld      a,h
1917 aa        xor     d
1918 47        ld      b,a
1919 7d        ld      a,l
191a ab        xor     e
191b b0        or      b
191c 37        scf     
191d ca1319    jp      z,1913h
1920 01a500    ld      bc,00a5h
1923 09        add     hl,bc
1924 4e        ld      c,(hl)
1925 23        inc     hl
1926 66        ld      h,(hl)
1927 69        ld      l,c
1928 c30e19    jp      190eh
192b e5        push    hl
192c c5        push    bc
192d 21f80b    ld      hl,0bf8h
1930 4e        ld      c,(hl)
1931 23        inc     hl
1932 79        ld      a,c
1933 b6        or      (hl)
1934 ca4f19    jp      z,194fh
1937 79        ld      a,c
1938 ab        xor     e
1939 47        ld      b,a
193a 7e        ld      a,(hl)
193b aa        xor     d
193c b0        or      b
193d ca5a19    jp      z,195ah
1940 79        ld      a,c
1941 93        sub     e
1942 7e        ld      a,(hl)
1943 9a        sbc     a,d
1944 d24f19    jp      nc,194fh
1947 46        ld      b,(hl)
1948 21a500    ld      hl,00a5h
194b 09        add     hl,bc
194c c33019    jp      1930h
194f 46        ld      b,(hl)
1950 72        ld      (hl),d
1951 2b        dec     hl
1952 73        ld      (hl),e
1953 21a500    ld      hl,00a5h
1956 19        add     hl,de
1957 71        ld      (hl),c
1958 23        inc     hl
1959 70        ld      (hl),b
195a c1        pop     bc
195b e1        pop     hl
195c c9        ret     

195d d5        push    de
195e 13        inc     de
195f af        xor     a
1960 12        ld      (de),a
1961 13        inc     de
1962 12        ld      (de),a
1963 13        inc     de
1964 7c        ld      a,h
1965 b5        or      l
1966 cade19    jp      z,19deh
1969 0608      ld      b,08h
196b 7e        ld      a,(hl)
196c fe20      cp      20h
196e cac319    jp      z,19c3h
1971 fe2e      cp      2eh
1973 cac319    jp      z,19c3h
1976 23        inc     hl
1977 7e        ld      a,(hl)
1978 2b        dec     hl
1979 fe3a      cp      3ah
197b c28919    jp      nz,1989h
197e 7e        ld      a,(hl)
197f e61f      and     1fh
1981 1b        dec     de
1982 12        ld      (de),a
1983 13        inc     de
1984 23        inc     hl
1985 23        inc     hl
1986 c36919    jp      1969h
1989 05        dec     b
198a fac319    jp      m,19c3h
198d 7e        ld      a,(hl)
198e cd181a    call    1a18h
1991 12        ld      (de),a
1992 23        inc     hl
1993 13        inc     de
1994 7e        ld      a,(hl)
1995 fe21      cp      21h
1997 dacf19    jp      c,19cfh
199a fe2e      cp      2eh
199c c28919    jp      nz,1989h
199f 05        dec     b
19a0 faaa19    jp      m,19aah
19a3 3e20      ld      a,20h
19a5 12        ld      (de),a
19a6 13        inc     de
19a7 c39f19    jp      199fh
19aa 23        inc     hl
19ab 0603      ld      b,03h
19ad 7e        ld      a,(hl)
19ae fe21      cp      21h
19b0 dad219    jp      c,19d2h
19b3 cd181a    call    1a18h
19b6 12        ld      (de),a
19b7 13        inc     de
19b8 23        inc     hl
19b9 05        dec     b
19ba c2ad19    jp      nz,19adh
19bd 7e        ld      a,(hl)
19be fe21      cp      21h
19c0 dada19    jp      c,19dah
19c3 0e13      ld      c,13h
19c5 cda502    call    02a5h
19c8 d1        pop     de
19c9 210000    ld      hl,0000h
19cc c35d19    jp      195dh
19cf 04        inc     b
19d0 04        inc     b
19d1 04        inc     b
19d2 3e20      ld      a,20h
19d4 12        ld      (de),a
19d5 13        inc     de
19d6 05        dec     b
19d7 c2d219    jp      nz,19d2h
19da d1        pop     de
19db c3ae18    jp      18aeh
19de 3e50      ld      a,50h
19e0 12        ld      (de),a
19e1 13        inc     de
19e2 3e41      ld      a,41h
19e4 12        ld      (de),a
19e5 13        inc     de
19e6 3e53      ld      a,53h
19e8 12        ld      (de),a
19e9 13        inc     de
19ea 3e43      ld      a,43h
19ec 12        ld      (de),a
19ed 13        inc     de
19ee e1        pop     hl
19ef e5        push    hl
19f0 0604      ld      b,04h
19f2 29        add     hl,hl
19f3 17        rla     
19f4 29        add     hl,hl
19f5 17        rla     
19f6 29        add     hl,hl
19f7 17        rla     
19f8 29        add     hl,hl
19f9 17        rla     
19fa e60f      and     0fh
19fc fe0a      cp      0ah
19fe fa031a    jp      m,1a03h
1a01 c607      add     a,07h
1a03 c630      add     a,30h
1a05 12        ld      (de),a
1a06 13        inc     de
1a07 05        dec     b
1a08 c2f219    jp      nz,19f2h
1a0b 0603      ld      b,03h
1a0d 3e24      ld      a,24h
1a0f 12        ld      (de),a
1a10 13        inc     de
1a11 05        dec     b
1a12 c20f1a    jp      nz,1a0fh
1a15 c3da19    jp      19dah
1a18 fe61      cp      61h
1a1a d8        ret     c

1a1b fe7b      cp      7bh
1a1d d0        ret     nc

1a1e d620      sub     20h
1a20 c9        ret     

1a21 3af70b    ld      a,(0bf7h)
1a24 e6bf      and     0bfh
1a26 32f70b    ld      (0bf7h),a
1a29 c9        ret     

1a2a 0e0f      ld      c,0fh	; OPEN FILE
1a2c cd0500    call    0005h	; Call BDOS
1a2f feff      cp      0ffh
1a31 c9        ret     

1a32 21ffff    ld      hl,0ffffh
1a35 22f00b    ld      (0bf0h),hl
1a38 23        inc     hl
1a39 22ee0b    ld      (0beeh),hl	; Stack Lower allowed Addr
1a3c 2af80b    ld      hl,(0bf8h)
1a3f 7d        ld      a,l
1a40 b7        or      a
1a41 c8        ret     z

1a42 eb        ex      de,hl
1a43 2af00b    ld      hl,(0bf0h)
1a46 7b        ld      a,e
1a47 95        sub     l
1a48 7a        ld      a,d
1a49 9c        sbc     a,h
1a4a d0        ret     nc

1a4b 2aee0b    ld      hl,(0beeh)	; Stack Lower allowed Addr
1a4e 7b        ld      a,e
1a4f 95        sub     l
1a50 7a        ld      a,d
1a51 9c        sbc     a,h
1a52 da661a    jp      c,1a66h
1a55 cdbe18    call    18beh
1a58 21a500    ld      hl,00a5h
1a5b 19        add     hl,de
1a5c 7e        ld      a,(hl)
1a5d 23        inc     hl
1a5e 66        ld      h,(hl)
1a5f 6f        ld      l,a
1a60 22f80b    ld      (0bf8h),hl
1a63 c33c1a    jp      1a3ch
1a66 d5        push    de
1a67 cd581a    call    1a58h
1a6a d1        pop     de
1a6b 21a500    ld      hl,00a5h
1a6e 19        add     hl,de
1a6f 3af80b    ld      a,(0bf8h)
1a72 77        ld      (hl),a
1a73 23        inc     hl
1a74 3af90b    ld      a,(0bf9h)
1a77 77        ld      (hl),a
1a78 eb        ex      de,hl
1a79 22f80b    ld      (0bf8h),hl
1a7c c9        ret     

1a7d 00        nop     
1a7e 00        nop     
1a7f 00        nop     
1a80 00        nop     
1a81 00        nop     
1a82 00        nop     
1a83 00        nop     
1a84 00        nop     
1a85 00        nop     
1a86 00        nop     
1a87 00        nop     
1a88 00        nop     
1a89 00        nop     
1a8a 00        nop     
1a8b 00        nop     
1a8c 00        nop     
1a8d 00        nop     
1a8e 00        nop     
1a8f 00        nop     
1a90 00        nop     
1a91 00        nop     
1a92 00        nop     
1a93 00        nop     
1a94 00        nop     
1a95 00        nop     
1a96 00        nop     
1a97 00        nop     
1a98 00        nop     
1a99 00        nop     
1a9a 00        nop     
1a9b 00        nop     
1a9c 00        nop     
1a9d 00        nop     
1a9e 00        nop     
1a9f 00        nop     
1aa0 00        nop     
1aa1 00        nop     
1aa2 00        nop     
1aa3 00        nop     
1aa4 00        nop     
1aa5 00        nop     
1aa6 00        nop     
1aa7 00        nop     
1aa8 00        nop     
1aa9 00        nop     
1aaa 00        nop     
1aab 00        nop     
1aac 00        nop     
1aad 00        nop     
1aae 00        nop     
1aaf 00        nop     
1ab0 00        nop     
1ab1 00        nop     
1ab2 00        nop     
1ab3 00        nop     
1ab4 00        nop     
1ab5 00        nop     
1ab6 00        nop     
1ab7 00        nop     
1ab8 00        nop     
1ab9 00        nop     
1aba 00        nop     
1abb 00        nop     
1abc 00        nop     
1abd 00        nop     
1abe 00        nop     
1abf 00        nop     
1ac0 00        nop     
1ac1 00        nop     
1ac2 00        nop     
1ac3 00        nop     
1ac4 00        nop     
1ac5 00        nop     
1ac6 00        nop     
1ac7 00        nop     
1ac8 00        nop     
1ac9 00        nop     
1aca 00        nop     
1acb 00        nop     
1acc 00        nop     
1acd 00        nop     
1ace 00        nop     
1acf 00        nop     
1ad0 00        nop     
1ad1 eb        ex      de,hl
1ad2 e5        push    hl
1ad3 0600      ld      b,00h
1ad5 7a        ld      a,d
1ad6 b7        or      a
1ad7 f5        push    af
1ad8 f2df1a    jp      p,1adfh
1adb 04        inc     b
1adc cd160e    call    0e16h		; DE = -DE 
1adf 21421b    ld      hl,1b42h
1ae2 04        inc     b
1ae3 7b        ld      a,e
1ae4 96        sub     (hl)
1ae5 23        inc     hl
1ae6 7a        ld      a,d
1ae7 9e        sbc     a,(hl)
1ae8 23        inc     hl
1ae9 d2e21a    jp      nc,1ae2h
1aec e1        pop     hl
1aed e3        ex      (sp),hl
1aee eb        ex      de,hl
1aef cd671b    call    1b67h
1af2 f1        pop     af
1af3 0e2d      ld      c,2dh
1af5 fc3317    call    m,1733h		; print char
1af8 4d        ld      c,l
1af9 44        ld      b,h
1afa 37        scf     
1afb f5        push    af
1afc 21481b    ld      hl,1b48h
1aff 3e2f      ld      a,2fh
1b01 f5        push    af
1b02 f1        pop     af
1b03 3c        inc     a
1b04 f5        push    af
1b05 79        ld      a,c
1b06 96        sub     (hl)
1b07 4f        ld      c,a
1b08 78        ld      a,b
1b09 23        inc     hl
1b0a 9e        sbc     a,(hl)
1b0b 47        ld      b,a
1b0c 2b        dec     hl
1b0d d2021b    jp      nc,1b02h
1b10 f1        pop     af
1b11 fe30      cp      30h
1b13 c21d1b    jp      nz,1b1dh
1b16 f1        pop     af
1b17 da251b    jp      c,1b25h
1b1a f5        push    af
1b1b 3e30      ld      a,30h
1b1d c5        push    bc
1b1e 4f        ld      c,a
1b1f cd3317    call    1733h		; print char
1b22 c1        pop     bc
1b23 f1        pop     af
1b24 b7        or      a
1b25 f5        push    af
1b26 7e        ld      a,(hl)
1b27 81        add     a,c
1b28 4f        ld      c,a
1b29 23        inc     hl
1b2a 7e        ld      a,(hl)
1b2b 88        adc     a,b
1b2c 47        ld      b,a
1b2d 2b        dec     hl
1b2e 2b        dec     hl
1b2f 2b        dec     hl
1b30 7d        ld      a,l
1b31 e5        push    hl
1b32 21401b    ld      hl,1b40h
1b35 bd        cp      l
1b36 e1        pop     hl
1b37 c2ff1a    jp      nz,1affh
1b3a f1        pop     af
1b3b 79        ld      a,c
1b3c c630      add     a,30h
1b3e 4f        ld      c,a
1b3f c33317    jp      1733h		; print char
1b42 0a        ld      a,(bc)
1b43 00        nop     
1b44 64        ld      h,h
1b45 00        nop     
1b46 e8        ret     pe

1b47 03        inc     bc
1b48 1027      djnz    1b71h
1b4a 40        ld      b,b
1b4b 9c        sbc     a,h
1b4c af        xor     a
1b4d 29        add     hl,hl
1b4e 17        rla     
1b4f 29        add     hl,hl
1b50 17        rla     
1b51 29        add     hl,hl
1b52 17        rla     
1b53 29        add     hl,hl
1b54 17        rla     
1b55 fe0a      cp      0ah
1b57 fa5c1b    jp      m,1b5ch
1b5a c607      add     a,07h
1b5c c630      add     a,30h
1b5e 4f        ld      c,a
1b5f cd3317    call    1733h		; print char
1b62 05        dec     b
1b63 c24c1b    jp      nz,1b4ch
1b66 c9        ret     

1b67 79        ld      a,c
1b68 90        sub     b
1b69 0e20      ld      c,20h
1b6b 3d        dec     a
1b6c f8        ret     m

1b6d cd3317    call    1733h		; print char
1b70 c36b1b    jp      1b6bh

; Print char in C

1b73 d5        push    de
1b74 11b41b    ld      de,1bb4h
1b77 cd3317    call    1733h		; print char
1b7a d1        pop     de
1b7b c9        ret     

1b7c d5        push    de
1b7d e5        push    hl
1b7e 0e24      ld      c,24h
1b80 cd731b    call    1b73h	; Print char in C
1b83 0604      ld      b,04h
1b85 11b41b    ld      de,1bb4h
1b88 cd4c1b    call    1b4ch
1b8b e1        pop     hl
1b8c d1        pop     de
1b8d c9        ret     

1b8e c5        push    bc
1b8f 0e07      ld      c,07h
1b91 d5        push    de
1b92 e5        push    hl
1b93 11b41b    ld      de,1bb4h
1b96 cdd11a    call    1ad1h
1b99 e1        pop     hl
1b9a d1        pop     de
1b9b c1        pop     bc
1b9c c9        ret     

1b9d c5        push    bc
1b9e 0e00      ld      c,00h
1ba0 c3911b    jp      1b91h

; Print CR LF

1ba3 21b11b    ld      hl,1bb1h

; Print StrZ at HL

1ba6 4e        ld      c,(hl)
1ba7 79        ld      a,c
1ba8 b7        or      a
1ba9 c8        ret     z
1baa cd731b    call    1b73h	; Print char in C
1bad 23        inc     hl
1bae c3a61b    jp      1ba6h

1bb1 		db 0d, 0a, 00

1bb4 01ffcd    ld      bc,0cdffh
1bb7 c8        ret     z

1bb8 1b        dec     de
1bb9 b7        or      a
1bba c0        ret     nz

1bbb 21fa0b    ld      hl,0bfah
1bbe 34        inc     (hl)
1bbf c3b61b    jp      1bb6h

; Print Char at RegC

1bc2 59        ld      e,c
1bc3 0e02      ld      c,02h	; PRINT CHAR
1bc5 c30500    jp      0005h	; Call BDOS
1bc8 21d01a    ld      hl,1ad0h
1bcb 7e        ld      a,(hl)
1bcc 3600      ld      (hl),00h
1bce b7        or      a
1bcf c0        ret     nz
1bd0 0e0b      ld      c,0bh	; CONSOLE STATUS
1bd2 cd0500    call    0005h	; Call BDOS
1bd5 1f        rra     
1bd6 3e00      ld      a,00h
1bd8 d0        ret     nc	; ret if no pending chars
1bd9 0e01      ld      c,01h	; Read char from console (blocking, echo)
1bdb cd0500    call    0005h	; Call BDOS
1bde fe03      cp      03h
1be0 c0        ret     nz	; pending char is not ^C
1be1 3af70b    ld      a,(0bf7h)
1be4 e620      and     20h
1be6 3e03      ld      a,03h
1be8 c8        ret     z	; no not break on ^C
1be9 c30000    jp      0000h	; else return o CP/M

1bec 59        ld      e,c
1bed 0e05      ld      c,05h	; Printer Output
1bef c30500    jp      0005h	; Call BDOS
1bf2 1e08      ld      e,08h	
1bf4 0e02      ld      c,02h	; PRINT CHAR
1bf6 c30500    jp      0005h	; Call BDOS

; PCODE - Convert top of stack 16b to 8b - Es el primer PCODE

1bf9 e1        pop     hl
1bfa 6e        ld      l,(hl)
1bfb 2600      ld      h,00h
1bfd e5        push    hl
1bfe c30d0c    jp      0c0dh		; exec next pcode

1c01 d1        pop     de
1c02 e1        pop     hl
1c03 73        ld      (hl),e
1c04 c30d0c    jp      0c0dh		; exec next pcode
1c07 e5        push    hl
1c08 e5        push    hl
1c09 cd3c1a    call    1a3ch
1c0c c3150d    jp      0d15h
1c0f 68        ld      l,b
1c10 2c        inc     l
1c11 cd3c1a    call    1a3ch
1c14 c32a0d    jp      0d2ah
1c17 39        add     hl,sp
1c18 42        ld      b,d

; PCODE $04 - Create new stack frame

1c19 c33c0d    jp      0d3ch	; Create new stack frame

1c1c 45        ld      b,l
1c1d 42        ld      b,d
1c1e 68        ld      l,b
1c1f 2c        inc     l
1c20 30

; PCODE $05   ; pop A pop B push result byte = A+B

1c21 d1        pop     de
1c22 e1        pop     hl
1c23 19        add     hl,de
1c24 e5        push    hl
1c25 c30d0c    jp      0c0dh		; exec next pcode

1c28 68        ld      l,b

; PCODE $06   ; pop A pop B push result byte = B-A

1c29 d1        pop     de
1c2a e1        pop     hl
1c2b cd160e    call    0e16h		; DE = -DE 
1c2e c3231c    jp      1c23h

1c31 c34c0d    jp      0d4ch
1c34 3042      jr      nc,1c78h
1c36 41        ld      b,c
1c37 68        ld      l,b
1c38 0d        dec     c
1c39 c36b0d    jp      0d6bh
1c3c 2030      jr      nz,1c6eh
1c3e 324668    ld      (6846h),a

; PCODE $09   ; pop A pop B push result byte

1c41 d1        pop     de
1c42 c1        pop     bc
1c43 cd740d    call    0d74h
1c46 c34d1c    jp      1c4dh

1c49 e1        pop     hl
1c4a cd0e0e    call    0e0eh			; HL=-HL
1c4d e5        push    hl
1c4e c30d0c    jp      0c0dh		; exec next pcode
1c51 e1        pop     hl
1c52 d1        pop     de
1c53 7d        ld      a,l
1c54 a3        and     e
1c55 6f        ld      l,a
1c56 c34d1c    jp      1c4dh
1c59 e1        pop     hl
1c5a d1        pop     de
1c5b 7d        ld      a,l
1c5c b3        or      e
1c5d 6f        ld      l,a
1c5e c34d1c    jp      1c4dh
1c61 c3d701    jp      01d7h
1c64 2c        inc     l
1c65 3038      jr      nc,1c9fh
1c67 43        ld      b,e
1c68 68        ld      l,b
1c69 e1        pop     hl
1c6a 7d        ld      a,l
1c6b ee01      xor     01h
1c6d 6f        ld      l,a
1c6e c34d1c    jp      1c4dh

; PCODE $0F  ; Compare "A>?B" pop A pop B push result true/false

1c71 d1        pop     de
1c72 c1        pop     bc
1c73 c3db0d    jp      0ddbh

1c76 68        ld      l,b
1c77 2c        inc     l
1c78 30c1      jr      nc,1c3bh
1c7a d1        pop     de
1c7b c3db0d    jp      0ddbh
1c7e 33        inc     sp
1c7f 37        scf     
1c80 68        ld      l,b

; PCODE $11 ; Compare "A=B" pop A pop B push result true/false

1c81 c3e80d    jp      0de8h
1c84 42        ld      b,d
1c85 68        ld      l,b
1c86 2c        inc     l
1c87 3031      jr      nc,1cbah
1c89 e1        pop     hl
1c8a e5        push    hl
1c8b e5        push    hl
1c8c c30d0c    jp      0c0dh		; exec next pcode
1c8f 68        ld      l,b
1c90 2c        inc     l
1c91 c3260e    jp      0e26h
1c94 68        ld      l,b
1c95 2c        inc     l
1c96 3036      jr      nc,1cceh
1c98 45        ld      b,l
1c99 c3a10c    jp      0ca1h		; Print Bad Pcode error and exit to CP/M
1c9c 37        scf     
1c9d 42        ld      b,d
1c9e 68        ld      l,b
1c9f 2c        inc     l
1ca0 30c3      jr      nc,1c65h
1ca2 61        ld      h,c
1ca3 0e0d      ld      c,0dh
1ca5 0a        ld      a,(bc)
1ca6 64        ld      h,h
1ca7 62        ld      h,d
1ca8 20c3      jr      nz,1c6dh
1caa 6a        ld      l,d
1cab 0e68      ld      c,68h
1cad 2c        inc     l
1cae 3037      jr      nc,1ce7h
1cb0 37        scf     

; PCODE $17 - Print StrZ

1cb1 c37e0e    jp      0e7eh	; Print StrZ
1cb4 41        ld      b,c
1cb5 42        ld      b,d
1cb6 68        ld      l,b
1cb7 2c        inc     l
1cb8 30c3      jr      nc,1c7dh
1cba d7        rst     10h
1cbb 012c30    ld      bc,302ch
1cbe 44        ld      b,h
1cbf 37        scf     
1cc0 68        ld      l,b

; PCODE $19 - Print CrLf

1cc1 0e02      ld      c,02h
1cc3 21950e    ld      hl,0e95h		; CR Lf 00
1cc6 c3800e    jp      0e80h		; Print StrZ

1cc9 c3d701    jp      01d7h
1ccc 3044      jr      nc,1d12h
1cce 39        add     hl,sp
1ccf 68        ld      l,b
1cd0 2c        inc     l
1cd1 c35a02    jp      025ah
1cd4 68        ld      l,b
1cd5 2c        inc     l
1cd6 3041      jr      nc,1d19h
1cd8 45        ld      b,l
1cd9 c3d701    jp      01d7h
1cdc 64        ld      h,h
1cdd 62        ld      h,d
1cde 2030      jr      nz,1d10h
1ce0 42        ld      b,d
1ce1 c3d701    jp      01d7h
1ce4 3032      jr      nc,1d18h
1ce6 39        add     hl,sp
1ce7 68        ld      l,b
1ce8 2c        inc     l
1ce9 c3d701    jp      01d7h
1cec 68        ld      l,b
1ced 2c        inc     l
1cee 3041      jr      nc,1d31h
1cf0 45        ld      b,l
1cf1 c3d701    jp      01d7h
1cf4 3644      ld      (hl),44h
1cf6 68        ld      l,b
1cf7 2c        inc     l
1cf8 30c3      jr      nc,1cbdh
1cfa d7        rst     10h
1cfb 012c30    ld      bc,302ch
1cfe 42        ld      b,d
1cff 37        scf     
1d00 68        ld      l,b
1d01 c3d701    jp      01d7h
1d04 33        inc     sp
1d05 68        ld      l,b
1d06 2c        inc     l
1d07 3046      jr      nc,1d4fh
1d09 cd0e11    call    110eh
1d0c c30d0c    jp      0c0dh		; exec next pcode
1d0f 68        ld      l,b
1d10 0d        dec     c
1d11 cd0411    call    1104h
1d14 c3091d    jp      1d09h
1d17 0d        dec     c
1d18 0a        ld      a,(bc)
1d19 cdd711    call    11d7h
1d1c c30d0c    jp      0c0dh		; exec next pcode
1d1f 2c        inc     l
1d20 30cd      jr      nc,1cefh
1d22 49        ld      c,c
1d23 12        ld      (de),a
1d24 c30d0c    jp      0c0dh		; exec next pcode
1d27 62        ld      h,d
1d28 20c3      jr      nz,1cedh
1d2a d7        rst     10h
1d2b 01682c    ld      bc,2c68h
1d2e 3037      jr      nc,1d67h
1d30 37        scf     
1d31 c3d701    jp      01d7h
1d34 41        ld      b,c
1d35 42        ld      b,d
1d36 68        ld      l,b
1d37 2c        inc     l
1d38 30c3      jr      nc,1cfdh
1d3a d7        rst     10h
1d3b 012c30    ld      bc,302ch
1d3e 44        ld      b,h
1d3f 37        scf     
1d40 68        ld      l,b
1d41 cd0411    call    1104h
1d44 c30d0c    jp      0c0dh		; exec next pcode
1d47 3039      jr      nc,1d82h
1d49 c38602    jp      0286h
1d4c 3044      jr      nc,1d92h
1d4e 39        add     hl,sp
1d4f 68        ld      l,b
1d50 2c        inc     l
1d51 e1        pop     hl
1d52 d1        pop     de
1d53 d5        push    de
1d54 e5        push    hl
1d55 d5        push    de
1d56 c34d1c    jp      1c4dh
1d59 110200    ld      de,0002h
1d5c c3aa10    jp      10aah
1d5f 3042      jr      nc,1da3h
1d61 c3d701    jp      01d7h
1d64 3032      jr      nc,1d98h
1d66 39        add     hl,sp
1d67 68        ld      l,b
1d68 2c        inc     l

; PCODE $2E - push 8 words=0

1d69 c3980e    jp      0e98h

1d6c 68        ld      l,b
1d6d 2c        inc     l
1d6e 3041      jr      nc,1db1h
1d70 45        ld      b,l

; PCODE $2F	- pop DE y algo de los sets

1d71 d1        pop     de
1d72 cdb30e    call    0eb3h
1d75 c30d0c    jp      0c0dh		; exec next pcode
1d78 		db 30

; PCODE $30

1d79 c3a50e    jp 0ea5h

1d7b 2c        inc     l
1d7d 3042      jr      nc,1dc1h
1d7f 37        scf     
1d80 68        ld      l,b

; PCODE $31 - or 16 bytes de stack

1d81 c3e10e    jp      0ee1h

1d84 33        inc     sp
1d85 68        ld      l,b
1d86 2c        inc     l
1d87 3046      jr      nc,1dcfh
1d89 c3d701    jp      01d7h
1d8c 0b        dec     bc
1d8d 42        ld      b,d
1d8e 3a3d42    ld      a,(423dh)
1d91 c3d701    jp      01d7h
1d94 54        ld      d,h
1d95 4d        ld      c,l
1d96 41        ld      b,c
1d97 50        ld      d,b
1d98 0d        dec     c
1d99 c3d701    jp      01d7h
1d9c 00        nop     
1d9d 00        nop     
1d9e 00        nop     
1d9f 00        nop     
1da0 00        nop     
1da1 c3d701    jp      01d7h
1da4 00        nop     
1da5 00        nop     
1da6 00        nop     
1da7 00        nop     
1da8 00        nop     
1da9 c3d701    jp      01d7h
1dac 00        nop     
1dad 00        nop     
1dae 00        nop     
1daf 00        nop     
1db0 00        nop     
1db1 110800    ld      de,0008h
1db4 c3aa10    jp      10aah
1db7 00        nop     
1db8 00        nop     

; PCODE $38 - POP 16 words del stack y los almacena en (SP+16)

1db9 c3fa0e    jp      0efah
1dbc 00        nop     
1dbd 00        nop     
1dbe 00        nop     
1dbf 00        nop     
1dc0 00        nop     
1dc1 cd3c1a    call    1a3ch
1dc4 c3d701    jp      01d7h
1dc7 00        nop     
1dc8 00        nop     
1dc9 c3d701    jp      01d7h
1dcc 00        nop     
1dcd 00        nop     
1dce 00        nop     
1dcf 00        nop     
1dd0 00        nop     
1dd1 c36418    jp      1864h
1dd4 00        nop     
1dd5 00        nop     
1dd6 00        nop     
1dd7 00        nop     
1dd8 00        nop     
1dd9 c3d701    jp      01d7h
1ddc 00        nop     
1ddd 21403f    ld      hl,3f40h
1de0 43        ld      b,e
1de1 c3d701    jp      01d7h
1de4 61        ld      h,c
1de5 6e        ld      l,(hl)
1de6 64        ld      h,h
1de7 2065      jr      nz,1e4eh
1de9 c3d701    jp      01d7h
1dec 72        ld      (hl),d
1ded 00        nop     
1dee 3f        ccf     
1def 46        ld      b,(hl)
1df0 69        ld      l,c
1df1 c3d701    jp      01d7h
1df4 6e        ld      l,(hl)
1df5 6f        ld      l,a
1df6 74        ld      (hl),h
1df7 2066      jr      nz,1e5fh

; PCODE $40 LL HH	GOTO

1df9 cd320c    call    0c32h	; DE = Addr16 at PCODE_PC, inc PCODE_PC
1dfc c3cd0f    jp      0fcdh	; exec GOTO

1dff 43        ld      b,e
1e00 61        ld      h,c

; PCODE $41 LL HH	POP word, JUMP to HHLL if bit0=0

1e01 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e04 c3dd0f    jp      0fddh

1e07 74        ld      (hl),h
1e08 65        ld      h,l

1e09 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e0c c3ea0f    jp      0feah
1e0f 00        nop     
1e10 7e        ld      a,(hl)

1e11 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e14 c34e10    jp      104eh
1e17 23        inc     hl
1e18 c3cd32    jp      32cdh
1e1b 0c        inc     c
1e1c c35e10    jp      105eh
1e1f b1        or      c
1e20 40        ld      b,b
1e21 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e24 c3d701    jp      01d7h
1e27 2185cd    ld      hl,0cd85h
1e2a 320cc3    ld      (0c30ch),a
1e2d bf        cp      a
1e2e 0f        rrca    
1e2f 40        ld      b,b
1e30 22cd32    ld      (32cdh),hl

; PCODE $47 LL HH - 

1e31 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e34 c3b90f    jp      0fb9h

1e37 f9        ld      sp,hl
1e38 2b        dec     hl
1e39 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e3c c38b0f    jp      0f8bh
1e3f 3ae5cd    ld      a,(0cde5h)
1e42 320cc3    ld      (0c30ch),a
1e45 d7        rst     10h
1e46 010032    ld      bc,3200h

; PCODE $4A LL HH - ; CALL (HHLL) z80 machine code, then exec next opcode

1e49 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e4c c3c50f    jp      0fc5h	; call (DE) then exec next opcode

1e4f cd9fcd    call    0cd9fh
1e52 320cc3    ld      (0c30ch),a
1e55 d7        rst     10h
1e56 01cad2    ld      bc,0d2cah
1e59 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e5c c3d701    jp      01d7h
1e5f 55        ld      d,l
1e60 3a

; PCODE $4D LL HH - Push DE	

1e61 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e64 d5        push    de
1e65 c30d0c    jp      0c0dh		; exec next pcode

1e68 58        ld      e,b
1e69 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e6c c3f00c    jp      0cf0h
1e6f 3a3cc3    ld      a,(0c33ch)
1e72 a1        and     c
1e73 0c        inc     c
1e74 32543a    ld      (3a54h),a
1e77 01a2cd    ld      bc,0cda2h
1e7a 320cc3    ld      (0c30ch),a
1e7d d7        rst     10h
1e7e 01cd42    ld      bc,42cdh
1e81 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1e84 c3d701    jp      01d7h
1e87 25        dec     h
1e88 42        ld      b,d
1e89 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1e8c c3850f    jp      0f85h
1e8f c21ecd    jp      nz,0cd1eh
1e92 27        daa     
1e93 0c        inc     c
1e94 c3850f    jp      0f85h
1e97 e5        push    hl
1e98 21cd32    ld      hl,32cdh
1e9b 0c        inc     c
1e9c c36a0f    jp      0f6ah
1e9f 3e20      ld      a,20h
1ea1 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1ea4 c36a0f    jp      0f6ah
1ea7 af        xor     a
1ea8 32cd32    ld      (32cdh),a
1eab 0c        inc     c
1eac c32d0f    jp      0f2dh
1eaf 3257cd    ld      (0cd57h),a
1eb2 27        daa     
1eb3 0c        inc     c
1eb4 c32d0f    jp      0f2dh
1eb7 3aee

; PCODE $58 LL HH - Push in stack start of current frame - HH * 2

1eb9 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1ebc c37f0f    jp      0f7fh

1ebf 42        ld      b,d
1ec0 d8        ret     c

; PCODE $59 HH - Push in stack start of current frame - HH * 2

1ec1 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1ec4 c37f0f    jp      0f7fh

1ec7 b7        or      a
1ec8 cacd32    jp      z,32cdh
1ecb 0c        inc     c
1ecc c39502    jp      0295h
1ecf 25        dec     h
1ed0 42        ld      b,d
1ed1 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1ed4 c39502    jp      0295h
1ed7 3253cd    ld      (0cd53h),a
1eda 320cc3    ld      (0c30ch),a
1edd d7        rst     10h
1ede 013ac2    ld      bc,0c23ah
1ee1 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1ee4 c3d701    jp      01d7h
1ee7 40        ld      b,b
1ee8 32cd32    ld      (32cdh),a
1eeb 0c        inc     c
1eec c31710    jp      1017h	; MOVE: pop bc, pop hl, copy (bc)->(hl) for de words (de*2 bytes), then exec next opcode
1eef cd19

; PCODE $59 HH - MOVE HH words from (SP-2) to (SP)

1ef1 cd270c    call    0c27	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1ef4 c31710    jp      1017h	; MOVE: pop bc, pop hl, copy (bc)->(hl) for de words (de*2 bytes), then exec next opcode

1ef7 c0        ret     nz
1ef8 cdcd32    call    32cdh


; PCODE $60 LL HH - reserve HHLL words in stack

1ef9 cd320c    call    0c32h		; DE = Addr16 at PCODE_PC, inc PCODE_PC
1efc c33310    jp      1033h		; Reserve DE=words de espacio en stack and exec next pcode

1eff 1106cd    ld      de,0cd06h
1f02 27        daa     
1f03 0c        inc     c
1f04 c33310    jp      1033h		; Reserve DE=words de espacio en stack and exec next pcode
1f07 3a1a

; PCODE $62 LL HH - (SP) = (SP) - HHLL*2

1f09 cd320c    call    0c32h		; DE = Addr16 at PCODE_PC, inc PCODE_PC
1f0c c32910    jp      1029h		; (SP) = (SP) - DE*2
1f0f fe20      cp      20

1f11 cd270c    call    0c27		; DE = Addr8 at PCODE_PC, inc PCODE_PC
1f14 c32910    jp      1029h		; (SP) = (SP) - DE*2

1f17 cd19cd    call    0cd19h
1f1a 320cc3    ld      (0c30ch),a
1f1d b9        cp      c
1f1e 1021      djnz    1f41h
1f20 5e        ld      e,(hl)
1f21 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1f24 c3b910    jp      10b9h
1f27 7f        ld      a,a
1f28 3acd32    ld      a,(32cdh)
1f2b 0c        inc     c
1f2c c3d701    jp      01d7h
1f2f ca41cd    jp      z,0cd41h
1f32 27        daa     
1f33 0c        inc     c
1f34 c3d701    jp      01d7h
1f37 3e03      ld      a,03h
1f39 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1f3c c3d701    jp      01d7h
1f3f 3d        dec     a
1f40 c2cd27    jp      nz,27cdh
1f43 0c        inc     c
1f44 c3d701    jp      01d7h
1f47 3a55cd    ld      a,(0cd55h)
1f4a 320cc3    ld      (0c30ch),a
1f4d aa        xor     d
1f4e 1052      djnz    1fa2h
1f50 3acd27    ld      a,(27cdh)
1f53 0c        inc     c
1f54 c3aa10    jp      10aah
1f57 3a32cd    ld      a,(0cd32h)
1f5a 320cc3    ld      (0c30ch),a
1f5d fc1756    call    m,5617h
1f60 44        ld      b,h
1f61 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1f64 c3fc17    jp      17fch
1f67 3a23cd    ld      a,(0cd23h)
1f6a 320cc3    ld      (0c30ch),a
1f6d d9        exx     
1f6e 17        rla     
1f6f 3a47cd    ld      a,(0cd47h)
1f72 27        daa     
1f73 0c        inc     c
1f74 c3d917    jp      17d9h
1f77 09        add     hl,bc
1f78 7e        ld      a,(hl)
1f79 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1f7c c3a917    jp      17a9h
1f7f fa13cd    jp      m,0cd13h
1f82 27        daa     
1f83 0c        inc     c
1f84 c3a917    jp      17a9h
1f87 c209cd    jp      nz,0cd09h
1f8a 320cc3    ld      (0c30ch),a
1f8d da10c3    jp      c,0c310h
1f90 09        add     hl,bc
1f91 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1f94 c3da10    jp      10dah
1f97 23        inc     hl
1f98 13        inc     de
1f99 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1f9c c3d701    jp      01d7h
1f9f 50        ld      d,b
1fa0 3acd27    ld      a,(27cdh)
1fa3 0c        inc     c
1fa4 c3d701    jp      01d7h
1fa7 7e        ld      a,(hl)
1fa8 fecd      cp      0cdh
1faa 320cc3    ld      (0c30ch),a
1fad d7        rst     10h
1fae 011ae6    ld      bc,0e61ah
1fb1 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1fb4 c3d701    jp      01d7h
1fb7 3642      ld      (hl),42h
1fb9 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1fbc c3d701    jp      01d7h
1fbf 3a37cd    ld      a,(0cd37h)
1fc2 27        daa     
1fc3 0c        inc     c
1fc4 c3d701    jp      01d7h
1fc7 b7        or      a
1fc8 cacd32    jp      z,32cdh
1fcb 0c        inc     c
1fcc c3d701    jp      01d7h
1fcf 4f        ld      c,a
1fd0 78        ld      a,b
1fd1 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
1fd4 c3d701    jp      01d7h
1fd7 5b        ld      e,e
1fd8 d0        ret     nc

1fd9 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
1fdc c3050d    jp      0d05h
1fdf 32f7cd    ld      (0cdf7h),a
1fe2 27        daa     
1fe3 0c        inc     c
1fe4 c3050d    jp      0d05h
1fe7 0b        dec     bc
1fe8 dacd32    jp      c,32cdh
1feb 0c        inc     c
1fec c3cf0c    jp      0ccfh
1fef d5        push    de
1ff0 11cd27    ld      de,27cdh
1ff3 0c        inc     c
1ff4 c3cf0c    jp      0ccfh
1ff7 42        ld      b,d
1ff8 cd1100    call    0011h
1ffb 00        nop     
1ffc c3700f    jp      0f70h
1fff 42        ld      b,d
2000 fe11      cp      11h
2002 0100c3    ld      bc,0c300h
2005 70        ld      (hl),b
2006 0f        rrca    
2007 44        ld      b,h
2008 fe11      cp      11h
200a 02        ld      (bc),a
200b 00        nop     
200c c3700f    jp      0f70h
200f fe59      cp      59h
2011 110300    ld      de,0003h
2014 c3700f    jp      0f70h
2017 66        ld      h,(hl)
2018 42        ld      b,d
2019 110400    ld      de,0004h
201c c3700f    jp      0f70h
201f 08        ex      af,af'
2020 44        ld      b,h
2021 110500    ld      de,0005h
2024 c3700f    jp      0f70h
2027 44        ld      b,h
2028 fe11      cp      11h
202a 0600      ld      b,00h
202c c3700f    jp      0f70h
202f b7        or      a
2030 c31107    jp      0711h
2033 00        nop     
2034 c3700f    jp      0f70h
2037 cd0811    call    1108h
203a 08        ex      af,af'
203b 00        nop     
203c c3700f    jp      0f70h
203f 52        ld      d,d
2040 37        scf     
2041 110900    ld      de,0009h
2044 c3700f    jp      0f70h
2047 66        ld      h,(hl)
2048 42        ld      b,d
2049 110a00    ld      de,000ah
204c c3700f    jp      0f70h
204f e1        pop     hl
2050 42        ld      b,d
2051 110b00    ld      de,000bh
2054 c3700f    jp      0f70h
2057 d9        exx     
2058 42        ld      b,d
2059 110c00    ld      de,000ch
205c c3700f    jp      0f70h
205f 325011    ld      (1150h),a
2062 0d        dec     c
2063 00        nop     
2064 c3700f    jp      0f70h
2067 1100cd    ld      de,0cd00h
206a 27        daa     
206b 0c        inc     c
206c c3700f    jp      0f70h
206f 42        ld      b,d
2070 06cd      ld      b,0cdh
2072 320cc3    ld      (0c30ch),a
2075 70        ld      (hl),b
2076 0f        rrca    
2077 cd0811    call    1108h
207a 00        nop     
207b 00        nop     
207c c3140f    jp      0f14h
207f e1        pop     hl
2080 79        ld      a,c

; PCODE $91 ; Load -> push to stack

2081 110100    ld      de,0001h
2084 c3140f    jp      0f14h
2087 08        ex      af,af'
2088 44        ld      b,h
2089 110200    ld      de,0002h
208c c3140f    jp      0f14h
208f 55        ld      d,l
2090 3a1103    ld      a,(0311h)
2093 00        nop     
2094 c3140f    jp      0f14h
2097 43        ld      b,e
2098 fe11      cp      11h
209a 04        inc     b
209b 00        nop     
209c c3140f    jp      0f14h
209f 3ac3

; PCODE $95; Load -> push to stack

20a1 110500    ld      de,0005h
20a4 c3140f    jp      0f14h
20a7 43        ld      b,e
20a8 32

; PCODE $96 ; Load -> push to stack

20a9 110600    ld      de,0006h
20ac c3140f    jp      0f14h
20af 52        ld      d,d
20b0 c21107    jp      nz,0711h
20b3 00        nop     
20b4 c3140f    jp      0f14h
20b7 1843      jr      20fch
20b9 110800    ld      de,0008h
20bc c3140f    jp      0f14h
20bf 58        ld      e,b
20c0 3a1109    ld      a,(0911h)
20c3 00        nop     
20c4 c3140f    jp      0f14h
20c7 fe4d      cp      4dh
20c9 110a00    ld      de,000ah
20cc c3140f    jp      0f14h
20cf c31811    jp      1118h
20d2 0b        dec     bc
20d3 00        nop     
20d4 c3140f    jp      0f14h
20d7 325411    ld      (1154h),a
20da 0c        inc     c
20db 00        nop     
20dc c3140f    jp      0f14h
20df c27011    jp      nz,1170h
20e2 0d        dec     c
20e3 00        nop     
20e4 c3140f    jp      0f14h
20e7 1843      jr      212ch
20e9 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
20ec c3140f    jp      0f14h
20ef 3a3ccd    ld      a,(0cd3ch)
20f2 320cc3    ld      (0c30ch),a
20f5 14        inc     d
20f6 0f        rrca    
20f7 0600      ld      b,00h

; PCODE $A0 ; pop -> Store

20f9 110000    ld      de,0000h
20fc c34c0f    jp      0f4ch

20ff d29c11    jp      nc,119ch
2102 0100c3    ld      bc,0c300h
2105 4c        ld      c,h
2106 0f        rrca    
2107 fe41      cp      41h
2109 110200    ld      de,0002h
210c c34c0f    jp      0f4ch
210f 9c        sbc     a,h
2110 43        ld      b,e
2111 110300    ld      de,0003h
2114 c34c0f    jp      0f4ch
2117 c9        ret     

2118 c5        push    bc
2119 110400    ld      de,0004h
211c c34c0f    jp      0f4ch
211f 00        nop     
2120 b7        or      a

; PCODE $A5 ; pop -> Store

2121 110500    ld      de,0005h
2124 c34c0f    jp      0f4ch

2127 fe20      cp      20h
2129 110600    ld      de,0006h
212c c34c0f    jp      0f4ch
212f 43        ld      b,e
2130 111107    ld      de,0711h
2133 00        nop     
2134 c34c0f    jp      0f4ch
2137 13        inc     de
2138 23        inc     hl
2139 110800    ld      de,0008h
213c c34c0f    jp      0f4ch
213f bd        cp      l
2140 43        ld      b,e
2141 110900    ld      de,0009h
2144 c34c0f    jp      0f4ch
2147 af        xor     a
2148 32110a    ld      (0a11h),a
214b 00        nop     
214c c34c0f    jp      0f4ch
214f c2e111    jp      nz,11e1h
2152 0b        dec     bc
2153 00        nop     
2154 c34c0f    jp      0f4ch
2157 cd1f11    call    111fh
215a 0c        inc     c
215b 00        nop     
215c c34c0f    jp      0f4ch
215f cd0511    call    1105h
2162 0d        dec     c
2163 00        nop     
2164 c34c0f    jp      0f4ch
2167 d1        pop     de
2168 c1        pop     bc
2169 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
216c c34c0f    jp      0f4ch
216f e5        push    hl
2170 22cd32    ld      (32cdh),hl
2173 0c        inc     c
2174 c34c0f    jp      0f4ch
2177 8c        adc     a,h
2178 67        ld      h,a

; PCODE $B0 	PUSH 0

2179 110000    ld      de,0000h
217c d5        push    de
217d c30d0c    jp      0c0dh		; exec next pcode
2180 c9        ret     

; PCODE $B1 	PUSH 1

2181 110100    ld      de,0001h
2184 d5        push    de
2185 c30d0c    jp      0c0dh		; exec next pcode
2188 fe

; PCODE $B2 	PUSH 2

2189 110200    ld      de,0002h
218c d5        push    de
218d c30d0c    jp      0c0dh		; exec next pcode
2190 46        ld      b,(hl)

; PCODE $B3 	PUSH 3

2191 110300    ld      de,0003h
2194 d5        push    de
2195 c30d0c    jp      0c0dh		; exec next pcode
2198 e5        push    hl
2199 110400    ld      de,0004h
219c d5        push    de
219d c30d0c    jp      0c0dh		; exec next pcode
21a0 5f        ld      e,a
21a1 110500    ld      de,0005h
21a4 d5        push    de
21a5 c30d0c    jp      0c0dh		; exec next pcode
21a8 b7        or      a
21a9 110600    ld      de,0006h
21ac d5        push    de
21ad c30d0c    jp      0c0dh		; exec next pcode
21b0 e611      and     11h
21b2 07        rlca    
21b3 00        nop     
21b4 d5        push    de
21b5 c30d0c    jp      0c0dh		; exec next pcode
21b8 23        inc     hl
21b9 110800    ld      de,0008h
21bc d5        push    de
21bd c30d0c    jp      0c0dh		; exec next pcode
21c0 1a        ld      a,(de)

; PCODE $B9	- Push 9

21c1 110900    ld      de,0009h
21c4 d5        push    de
21c5 c30d0c    jp      0c0dh		; exec next pcode

21c8 1f        rra     
21c9 110a00    ld      de,000ah
21cc d5        push    de
21cd c30d0c    jp      0c0dh		; exec next pcode
21d0 c5        push    bc
21d1 110b00    ld      de,000bh
21d4 d5        push    de
21d5 c30d0c    jp      0c0dh		; exec next pcode
21d8 00        nop     

; PCODE $BC	- Push 12

21d9 110c00    ld      de,000ch
21dc d5        push    de
21dd c30d0c    jp      0c0dh		; exec next pcode

21e0 55        ld      d,l
21e1 110d00    ld      de,000dh
21e4 d5        push    de
21e5 c30d0c    jp      0c0dh		; exec next pcode
21e8 e5        push    hl

; PCODE $BE HH - Push HH

21e9 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
21ec d5        push    de
21ed c30d0c    jp      0c0dh		; exec next pcode
21f0 0c        inc     c

; PCODE $BF LL HH  - Push LL HH

21f1 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
21f4 d5        push    de
21f5 c30d0c    jp      0c0dh		; exec next pcode
21f8 b7        or      a
21f9 110000    ld      de,0000h
21fc e1        pop     hl
21fd c3170f    jp      0f17h
2200 05        dec     b
2201 110100    ld      de,0001h
2204 e1        pop     hl
2205 c3170f    jp      0f17h
2208 cd1102    call    0211h
220b 00        nop     
220c e1        pop     hl
220d c3170f    jp      0f17h
2210 00        nop     
2211 110300    ld      de,0003h
2214 e1        pop     hl
2215 c3170f    jp      0f17h
2218 3c        inc     a
2219 110400    ld      de,0004h
221c e1        pop     hl
221d c3170f    jp      0f17h
2220 0e11      ld      c,11h
2222 05        dec     b
2223 00        nop     
2224 e1        pop     hl
2225 c3170f    jp      0f17h
2228 40        ld      b,b
2229 110600    ld      de,0006h
222c e1        pop     hl
222d c3170f    jp      0f17h
2230 d5        push    de
2231 110700    ld      de,0007h
2234 e1        pop     hl
2235 c3170f    jp      0f17h
2238 111108    ld      de,0811h
223b 00        nop     
223c e1        pop     hl
223d c3170f    jp      0f17h
2240 211109    ld      hl,0911h
2243 00        nop     
2244 e1        pop     hl
2245 c3170f    jp      0f17h
2248 c3110a    jp      0a11h
224b 00        nop     
224c e1        pop     hl
224d c3170f    jp      0f17h
2250 19        add     hl,de
2251 110b00    ld      de,000bh
2254 e1        pop     hl
2255 c3170f    jp      0f17h
2258 db11      in      a,(11h)
225a 0c        inc     c
225b 00        nop     
225c e1        pop     hl
225d c3170f    jp      0f17h
2260 d1        pop     de
2261 110d00    ld      de,000dh
2264 e1        pop     hl
2265 c3170f    jp      0f17h
2268 b7        or      a
2269 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
226c e1        pop     hl
226d c3170f    jp      0f17h
2270 12        ld      (de),a
2271 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
2274 e1        pop     hl
2275 c3170f    jp      0f17h
2278 011100    ld      bc,0011h
227b 00        nop     
227c e1        pop     hl
227d e3        ex      (sp),hl
227e c34f0f    jp      0f4fh
2281 110100    ld      de,0001h
2284 e1        pop     hl
2285 e3        ex      (sp),hl
2286 c34f0f    jp      0f4fh
2289 110200    ld      de,0002h
228c e1        pop     hl
228d e3        ex      (sp),hl
228e c34f0f    jp      0f4fh
2291 110300    ld      de,0003h
2294 e1        pop     hl
2295 e3        ex      (sp),hl
2296 c34f0f    jp      0f4fh
2299 110400    ld      de,0004h
229c e1        pop     hl
229d e3        ex      (sp),hl
229e c34f0f    jp      0f4fh
22a1 110500    ld      de,0005h
22a4 e1        pop     hl
22a5 e3        ex      (sp),hl
22a6 c34f0f    jp      0f4fh
22a9 110600    ld      de,0006h
22ac e1        pop     hl
22ad e3        ex      (sp),hl
22ae c34f0f    jp      0f4fh
22b1 110700    ld      de,0007h
22b4 e1        pop     hl
22b5 e3        ex      (sp),hl
22b6 c34f0f    jp      0f4fh
22b9 110800    ld      de,0008h
22bc e1        pop     hl
22bd e3        ex      (sp),hl
22be c34f0f    jp      0f4fh
22c1 110900    ld      de,0009h
22c4 e1        pop     hl
22c5 e3        ex      (sp),hl
22c6 c34f0f    jp      0f4fh
22c9 110a00    ld      de,000ah
22cc e1        pop     hl
22cd e3        ex      (sp),hl
22ce c34f0f    jp      0f4fh
22d1 110b00    ld      de,000bh
22d4 e1        pop     hl
22d5 e3        ex      (sp),hl
22d6 c34f0f    jp      0f4fh
22d9 110c00    ld      de,000ch
22dc e1        pop     hl
22dd e3        ex      (sp),hl
22de c34f0f    jp      0f4fh
22e1 110d00    ld      de,000dh
22e4 e1        pop     hl
22e5 e3        ex      (sp),hl
22e6 c34f0f    jp      0f4fh
22e9 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
22ec e1        pop     hl
22ed e3        ex      (sp),hl
22ee c34f0f    jp      0f4fh
22f1 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
22f4 e1        pop     hl
22f5 e3        ex      (sp),hl
22f6 c34f0f    jp      0f4fh
22f9 110000    ld      de,0000h
22fc c3270f    jp      0f27h
22ff 8a        adc     a,d
2300 45        ld      b,l

; PCODE $E1

2301 110100    ld      de,0001h
2304 c3270f    jp      0f27h

2307 29        add     hl,hl
2308 84        add     a,h
2309 110200    ld      de,0002h
230c c3270f    jp      0f27h
230f 0d        dec     c
2310 cd

2311 110300    ld      de,0003h
2314 c3270f    jp      0f27h
2317 45        ld      b,l
2318 3e11      ld      a,11h
231a 04        inc     b
231b 00        nop     
231c c3270f    jp      0f27h
231f c9        ret     

2320 f5        push    af
2321 110500    ld      de,0005h
2324 c3270f    jp      0f27h
2327 42        ld      b,d
2328 3a1106    ld      a,(0611h)
232b 00        nop     
232c c3270f    jp      0f27h
232f fa8611    jp      m,1186h
2332 07        rlca    
2333 00        nop     
2334 c3270f    jp      0f27h
2337 3c        inc     a
2338 7c        ld      a,h
2339 110800    ld      de,0008h
233c c3270f    jp      0f27h
233f 220e11    ld      (110eh),hl
2342 09        add     hl,bc
2343 00        nop     
2344 c3270f    jp      0f27h
2347 f1        pop     af
2348 f5        push    af
2349 110a00    ld      de,000ah
234c c3270f    jp      0f27h
234f 111011    ld      de,1110h
2352 0b        dec     bc
2353 00        nop     
2354 c3270f    jp      0f27h
2357 f5        push    af
2358 c5        push    bc
2359 110c00    ld      de,000ch
235c c3270f    jp      0f27h
235f 00        nop     
2360 d1        pop     de
2361 110d00    ld      de,000dh
2364 c3270f    jp      0f27h
2367 b7        or      a
2368 c2cd27    jp      nz,27cdh

; PCODE $EE HH	

2369 cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
236c c3270f    jp      0f27h

236f 00        nop     
2370 09        add     hl,bc
2371 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
2374 c3270f    jp      0f27h
2377 45        ld      b,l
2378 211100    ld      hl,0011h
237b 00        nop     
237c c35f0f    jp      0f5fh
237f 3e02      ld      a,02h
2381 110100    ld      de,0001h
2384 c35f0f    jp      0f5fh
2387 f5        push    af
2388 3a1102    ld      a,(0211h)
238b 00        nop     
238c c35f0f    jp      0f5fh
238f 3a5e11    ld      a,(115eh)
2392 03        inc     bc
2393 00        nop     
2394 c35f0f    jp      0f5fh
2397 e5        push    hl
2398 d5        push    de
2399 110400    ld      de,0004h
239c c35f0f    jp      0f5fh
239f 03        inc     bc
23a0 46        ld      b,(hl)
23a1 110500    ld      de,0005h
23a4 c35f0f    jp      0f5fh
23a7 3b        dec     sp
23a8 19        add     hl,de

; PCODE $F6   - equivalente a FF 06 00

23a9 110600    ld      de,0006h
23ac c35f0f    jp      0f5fh

23af a0        and     b
23b0 3a1107    ld      a,(0711h)
23b3 00        nop     
23b4 c35f0f    jp      0f5fh
23b7 46        ld      b,(hl)
23b8 e5        push    hl

; PCODE $F8   - equivalente a FF 08 00

23b9 110800    ld      de,0008h
23bc c35f0f    jp      0f5fh

23bf 02        ld      (bc),a
23c0 cc

; PCODE $F9   - equivalente a FF 09 00

23c1 110900    ld      de,0009h
23c4 c35f0f    jp      0f5fh

23c7 111111    ld      de,1111h
23ca 0a        ld      a,(bc)
23cb 00        nop     
23cc c35f0f    jp      0f5fh
23cf 111211    ld      de,1112h
23d2 0b        dec     bc
23d3 00        nop     
23d4 c35f0f    jp      0f5fh
23d7 0e1a      ld      c,1ah
23d9 110c00    ld      de,000ch
23dc c35f0f    jp      0f5fh
23df 0e14      ld      c,14h
23e1 110d00    ld      de,000dh
23e4 c35f0f    jp      0f5fh
23e7 ca7f

; PCODE $FE HH	

23ea cd270c    call    0c27h	; DE = Addr8 at PCODE_PC, inc PCODE_PC
23ec c35f0f    jp      0f5fh

23ef f1        pop     af
23f0 3d        dec     a

; PCODE $FF LL HH	

23f1 cd320c    call    0c32h	; DE = Addr at PCODE_PC, inc PCODE_PC
23f4 c35f0f    jp      0f5fh
23f7 c9        ret     

23f8 f1        pop     af
23f9 110000    ld      de,0000h
23fc c35f0f    jp      0f5fh
23ff 3e

2400 		db 225f	; Pcode Program length

; Compiler

2402 		db 40 7e 41	; GOTO 417E

417E		db 60 74 04 	; reserve 0474 words in stack
4181		db 59 14	; Push in stack start of current frame - HH * 2
4183		db 59 16
4185		db 59 15
4187		db 59 18
4189		db 59 19  
418B		db 59 0A
418D		db 59 0B
418F		db 59 0C
4191		db 59 0D
4193		db 59 0E
4195		db 4A 1E 01	; CALL 011E z80 machine code
4198		db 59 C9
419A		db 58 CA 01	; Push in stack start of current frame - 01ca * 2
419D		db 58 1F 01
41A0 		db 59 52
41A2		db 59 13
41A4 		db 59 51
41A6		db 59 48
41A8		db 58 20 02
41AB		db 58 21 02
41AE		db 58 22 02
41B1		db 59 15
41B3 		db 4A 21 01 	; CALL 0121 z80 machine code
41B6		db B0		; PUSH 0
41B7		db FF 20 02
41BA		db B1		; PUSH 1
41BB		db FF 21 02
41BE		db B0
41BF		db FF 22 02
41C2		db B0
41C3		db F8		
41c4		db 59 85
41c6		db 2e		; push 8 words=0
41c7		db BE 30	; Push 30
41c9		db BE 39
41cb		db 30
41cc		db 38  
41cd		db 59 8d
		db 2e 
		db be 41
		db be 5a
		db 30
		db be 61
		db be 7a
		db 30
		db be 5f
41dc		db 2f		; pop DE y algo de los sets
41dd		db 38
		db 59 95
		db 59 85
41e2 		db 37		; Convert top of stack 16b to 8b 
		db 2e
		db be 61 
		db be 66
		db 30
		db be 41 
		db be 46
		db 30
41ee		db 31		; or 16 bytes de stack
		db 38
		db 59 ad
		db 2e 
		db be 20
		db 2f
41f6		db b9 		; push 9
		db 2f
		db 38
		db 59 a5
		db 2e
		db be 61 
		db be 7a
		db 30
		db 38
		db 59 9d
		db 2e
		db be 5c
		db 2f
		...
4241		db be 27
		db 2f
		db 38
		db 59 b5
		db 2e
		db be 3c 
		db 2f
		db be 34 
		db 2f
		db b9
		db 2f
		db be 20 
		db 2f
		db be 25
		db 2f
		db 38
		db 59 bd
		db 2e
		db b2
		db 2f
		db be 27
		db 2f
		db ..
		db be 23
		db 2f
4268		db bc		; Push 12
		db 2f
		db b3
		db 2f
		db be 0f
		db 2f
		db be 22
		db 2f
		db 38
		db b0
4274		db fe 74
		db b0
		db fe 51
4279		db ee 15
417b		db 41 96 42		; POP word, JUMP to 4296 if bit0=0 (taken)

4296		db 59 1c
		db 40 a5 42		: JMP to 42a5
42a5		db 4d 9c 42		; push 429c
42a8		db 62 fc ff		; (SP) = (SP) - (-4)*2
42ab		db 5f 04
		db B0
		db fe 0f
		db b1
		db fe 13
		db b0
42b4		db f6			
		db b0
		db fe 1a
		db b0
		db fe 1b
		db b0
		db fe 14
		db b0
42bf 		db f9 
42c0            db 04			; Create new stack frame
42c1		db 47 f7 2c		; JSR?

42c1 -> call check colour -> PCODE=$47

2cf7		db 40 FA 2C		: GOTO 2CFA
2cfa		db 60 07 00	 	; reserve 7 words in stack
	; A0=1
		db b1			; push 1
		db a0			; pop -> Store
	; Write('Colour protection -Hit return");
2cff		db e1
2d00		db 40 22 2d		; GOTO 2d22
		db 00, 
2d04		db "Colour protection -Hit return", 00
2d22		db 4d 04 2d		; Push 2d04 ; Addr(StrZ)
2d25		db bf ff ff		; Push  -1
2d28		db 17			; Print StrZ
	; Writeln;
		db e1
2d2a		db 19			; Print CrLf
	; C=0
		db b0 			; push 0
		db a5 			; pop -> Store5
	; WHILE C=0 DO C=readKey
2d2d Label	db 95			; Load5 -> push to stack
		db b0 			; push 0
2d2f 		db 11			; Compare "A=B" pop A pop B push result true/false
2d30		db 41 3a 2d		; POP word, JUMP to 2d3a if bit0=0 (not taken, taken when keypressed)
2d33		db 2d
2d34		db 4a 30 01 		; CALL (HHLL) z80 machine code, then exec next opcode. ReadKey, push key en stack
					;   breakpoint en 1bde para interceptar tecla pulsada
					;   luego breakpoint en 0c18 para interceptar exec pcode
		db a5			; pop -> Store5
2d37		db 40 2d 2d		, GOTO 2D2D Label
	; FOR A1=0 TO 3 DO BEGIN 
2d3a		db b0			; push 0
		db b3			; push 3
		db a6			; pop -> Store6
		db a1			; pop -> Store1
2d3e		db 91			; Load1 -> push to stack 
		db 96			; Load6 -> push to stack
		db 0f			; ; Compare "A>?B" pop A pop B push result true/false
		db 41 fe 2e		; POP word, JUMP to 2efe if bit0=0 (not taken)
	;    A2 = random mod $1a
2D44		db 4a 27 01		; CALL (HHLL) z80 machine code, then exec next opcode. Push byte random?
		db be 1a		; push 1a
		db 09			; pop A pop B push result byte
		db a2 			; pop -> Store2
	;    A3 = random mod $28
		db 4a 27 01		; CALL (HHLL) z80 machine code, then exec next opcode. Push byte random?
		db be 28		; push 28
		db 09			; pop A pop B push result byte
		db a3 			; pop -> Store3
	;    Write('Enter colour (r/w/g/y) in square ');
		db e1			; push addr(Store1) ?
2d53		db 40 78 2d		; GOTO 2D78
2d56		db "Enter colour (r/w/g/y) in square ",0
2d78		db 4d 56 2d		; Push 2d56 ; Addr(StrZ)
		db bf ff ff		; push -1
		db 17			; Print StrZ 
		db e1
		db 92			; push var a2 on stack 
		db be 41		; push 41
		db 05 			; +
		db 4a 03 01		; CALL (HHLL) z80 machine code, print char?
		db b1			; push 1
		
2db0       	db 4a 30 01 		; CALL (HHLL) z80 machine code, then exec next opcode. ReadKey, push key en stack
2db3		db a5			; pop char typed -> store var a5				

	; END {FOR}
2efe



patch to skip colour question
=============================

2cff 40 3a 2d ; goto 2d3a
salta pregunta proteccion color y hit return

2d44 b1 a2 b1 a3 be 67 40 b3 2d ; Push 1, Sto a2, push 1, sto a3, push 67, goto 2db3
pregunta siempre por b2 da respuesta automatica green -> ch=$67

2e03 40 a0 2e; goto 2e40
salta mostrar "green" contestado
