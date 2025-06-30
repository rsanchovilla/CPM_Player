	.z80
	.list
	aseg
	org	100h

VCPMLOC	EQU	0B000h	; location of patch routines to use regular cp/m bdos
vPROGLEN	EQU	2400h	; length of VCCP program 

start:  ld	hl,mstart+1	; copy prog to 4000
	ld	de,VCPMLOC
	ld	bc,mend-main
	ldir
	jp	main
	
mstart: nop
	
	.phase	VCPMLOC

; these are the patches for VCCP.COM from Personal CP/M system disk for Sharp MZ-800.
; MZ-800 has no character mode, only hi res scren 640x200 at $8000
; in/out pagen in/out VRAM in main memory. 

; The patches allows to send the windows frames as ascii chars + - | \ instead of
; drawind them as bitmap. Also the windows are cleared overwritting spaces al required
; positions instead of zeroing the vram bitmap.
; Help screen windows 'saves' the bitmap olverlaped by window, and then restores it.
; on a regular text terminal this is not possible. So help screens returns to main 
; menu once closed (instead of resuming menu command execution)

; the only dependance on Personal-CP/M is the use of BDOS function 113 to turno on/off
; the cursor. 

main:	ld	hl,VPROG+1
	ld	de,0100h	; where the VCCP prog is to be loaded
	ld 	bc,VPROGLEN	; length of VCCP program
	ldir                    ; put VCCP prog at its original location
	call	patch		; patch original VCCP prog to call new routines 
	jp	0100h		; start of VCCP prog
	
patch:
	ld	hl,rebuild	; after "<< press a key to continue >>" message
	ld	(1aa0h+1),hl	; go to rebuild screen
	
	ld 	hl,prtvl	; patch 
	ld	(0f4eh+1),hl	; print '|'

	ld 	hl,prtpl	; patch 
	ld	(0f29h+1),hl	; print '+'

	ld 	hl,prthl	; patch 
	ld	(0f34h+1),hl	; print '-'

	ld 	hl,prtvl2	; patch 
	ld	(0f3dh+1),hl	; print '\'

	ld	a,0c3h		; JP opcode
	ld	(0e0bh),a	; patch 
	ld 	hl,clrrect	; clear rectangle
	ld	(0e0bh+1),hl
	
	ld	a,0c9h		; RET opcode
	ld	(0e2eh),a	; patch copy VRAM to RAM
	ld	(0e26h),a	; patch copy RAM to VRAM
	
	ld	hl, 0000	; NOP NOP opcode
	ld	(0f8dh),hl	; patch out ($cd),a
	ld	(0f92h),hl	; patch out ($cc),a

	ret


vramtorc:			; convert vram address
				; HL=$8000 + 80*8*col0 + row0
				; to col0 row0
				; uses regs DE, BC, A

	xor 	a		; clear carry
	ld 	de,8000h	; remove bit 15 from hl
	sbc	hl,de	
	ld 	de,640		; 80*8	
	ld	b,0
clr1:	xor	a		; decrement 80*8 until negative
	sbc	hl,de		; count how many times in b
	jp 	c,clr2		; b is the row number
	inc	b
	jp	clr1
clr2:	add	hl,de		; restore hl to last non-negative value
	ld	a,b
	ld 	(row0),a
	ld	a,l
	ld	(col0),a 	; save params
	ret


clrrect:			; clear a rectangle in text screen
				; starting at col0,row0, for wi columns, he rows
				; entry: HL=$8000 + 80*8*col0 + row0
				;        BC=wi*256 + he*8
	; get parameters
	ld 	a,b
	ld 	(wi),a		; save wi columns to clear
	ld 	a,c
	srl 	a		; shift right 3 times -> div by 8
	srl 	a
	srl 	a
	ld 	(he),a		; save he lines to clear
	call	vramtorc
	; save cursor pos
	ld	hl,cur_save	
	call	0d2ch		; print on console zero-terminated string at [HL]
	; locate cursor at col0,row2
	ld	a,(col0)	; put col0 in cursor location esc sequence
	add	a,32
	ld	(cur_loc+3),a	
clr3:	ld	a,(row0)	; put row0 in cursor location esc sequence
	add	a,32
	ld	(cur_loc+2),a	
	ld	hl,cur_loc	; ESC = y+32 x+32 to set the cursor location
	call	0d2ch		; print on console zero-terminated string at [HL]
	; clear one row for wi columns
	ld	a,(he)	
	ld	c,a		; c=number of rows to clear
 	ld	a,(wi)
	ld	b,a		; b=number of columns to clear
clr4:	push 	bc
	ld	hl, space
	call	0d2ch		; print on console zero-terminated string at [HL]
	pop	bc
	djnz	clr4
	; advance to next row
	ld 	a,(row0)
	inc	a
	ld 	(row0),a
	dec	c
	ld	a,c
	ld 	(he),a
	jp	nz,clr3
	; restore cursor pos
	ld	hl,cur_restore
	call	0d2ch		; print on console zero-terminated string at [HL]
	ret

				; print at DE=vram position the char '+'
prtpl:	call    0dcfh		; save registers
	ex	de,hl		; convert position in vram bitmap (from DE)
	ld	a,'+'
	jp	prtchr

prtvl:	call    0dcfh		; save registers
	ex	de,hl		; convert position in vram bitmap (from DE)
	ld	a,'|'
	jp	prtchr

				; print at DE=vram position the char '-'
prthl:	call    0dcfh		; save registers
	ld	a,'-'
	ld	(prtchar),a	; save char to print
	jp	prt2

prtvl2:	call    0dcfh		; save registers
	ld	a,'\'
	ld	(prtchar),a	; save char to print
	jp	prt2

prtchr:	ld	(prtchar),a	; save char to print
	call	vramtorc	; to row0 col0
	ld	a,(col0)	; put col0 in cursor location esc sequence
	add	a,32
	ld	(cur_loc+3),a	
	ld	a,(row0)	; put row0 in cursor location esc sequence
	add	a,32
	ld	(cur_loc+2),a	
prtcxy:	ld	hl,cur_loc	; ESC = y+32 x+32 to set the cursor location
	call	0d2ch		; print on console zero-terminated string at [HL]
prt2:	ld	hl,prtchar
	call	0d2ch		; print on console zero-terminated string at [HL]
	ret	
	
cur_loc:	DB 27,'=',32,32,0
space:		DB 32,0
prtchar:        DB 0,0
cur_save:	DB 27,'[','s',0 
cur_restore:	DB 27,'[','u',0 
col0:		DB 0
row0:		DB 0
wi:		DB 0
he:		DB 0		

		
rebuild:			; rebuild main screen		
	ld	a,' ';
	ld	(prtchar),a	; save char to print
	ld	a,32+68		; cursor at colum 68
	ld 	(cur_loc+3),a	
	ld	a,32+0		; cursor at row 0
	ld 	(cur_loc+2),a	
	call	prtcxy		; prt char at given pos 
	ld	a,32+15		; cursor at row 15
	ld 	(cur_loc+2),a	
	call	prtcxy		; prt char at given pos 
	jp	1095h		; rebuild screen

mend:	nop
	.dephase
	nop 		; the addr of this instr should be < than the ORG just below
	ORG	03FFh	; the origial VCCP prog .com goes to addr 0400h
VPROG:		nop
   
   END 

