	.z80
	.list
	aseg
	org	100h

FCPMLOC	EQU	08000h	; location of patch routines to use regular cp/m bdos
FPROGLEN	EQU	4000h	; length of FS.BIN program (16Kb)

start:  ld	hl,mstart+1	; copy patch program to FCMPLOC address
	ld	de,FCPMLOC
	ld	bc,mend-main
	ldir
	jp	main
	
mstart: nop
	
	.phase	FCPMLOC

; these are the patches for FS1.BIN

; The patches allows to use the WaveMate Terminal-125 TV Video card that 
; has the same character set anmd block 2x3 graphics as TRS-80 Level 1
; Terminal-125 have a 64 columns x 32 lines display memory mapped at $C000 
; Sorcerer is 64 columns x 30 lines with video mem starting at $F080

main:	ld	hl,FPROG+1+FPROGLEN
	ld	de,4000h+FPROGLEN	; where the FS1.BIN prog is to be loaded
	ld 	bc,FPROGLEN		; length of FS1.BIN program
	lddr                    	; put prog at its original location
	call	patch			; patch original FS1.BIN prog to call new routines 
	call	patchHi			; patch to draw with ficcional vector generator for 3D scenary
	call 	choose			; let the user choose the scenary to fly
	jp	7500h			; start of FS1.BIN prog
	
patch:
	ld	hl,ClsMain	; call clear screen
	ld	(7502h+1),hl	; 
	
	ld	hl,0		; NOP NOP opcode
	ld	(750eh),hl	; path ldir to not copy used defined chars on exidy
	
	ld	hl,72f8h	; opcode with video ram addr reference
	call    relocvram	; relocate video ram (main screen)

	ld	hl,72feh	; opcode with video ram addr reference
	call    relocvramHi	; relocate video ram HI byte (main screen)
	ld	hl,72feh+1	; dec hi by one to not erase last line of screen
	dec	(hl)

	ld	hl,7307h	; draw main screen
	call    relocvram	; relocate video ram

	ld	hl,640ah	; clear screen
	call    relocvram	; relocate video ram


	ld	hl,5556h	; "U_" message
	call    relocvram	; relocate video ram

	ld	hl,5514h	; 
	call    relocvram2	; relocate video ram (2 opcodes)

	ld	hl,5490h	; path video ram table 5490..549e
pa1a:	push    hl
	call    relocvAddr	; relocate video ram addr
	pop 	hl
	ld	de,0003
	add	hl,de
	ld	a,(hl)		; get hi byte for next video ram addr
	cp	36h
	jp	z,pa1b		; jump if =$36 (end of table)
	dec	hl		; hl points back to lo byte of video ram addr
	jp	pa1a
pa1b:

	ld	hl,5451h	; top view plane + "RADAR" message
	call    relocvram	; relocate video ram
	ld	hl,5457h	
	call    relocvram	; relocate video ram
	ld	hl,545ch	
	call    relocvram	; relocate video ram
	ld	hl,5462h	
	call    relocvram	; relocate video ram
	ld	hl,5467h	
	call    relocvram	; relocate video ram
	ld	hl,546dh	
	call    relocvram	; relocate video ram
	ld	hl,5473h	
	call    relocvram	; relocate video ram
	ld	hl,5478h	
	call    relocvram	; relocate video ram

	ld	hl,52e9h	; "S_" message
	call    relocvram	; relocate video ram

	ld	hl,51b1h	; "WAR!" message
	call    relocvram	; relocate video ram
	ld	hl,51b7h	
	call    relocvram	; relocate video ram

	ld	hl,5179h	; "IN RANGE" message
	call    relocvram	; relocate video ram
	ld	hl,517fh	
	call    relocvram	; relocate video ram
	ld	hl,5185h	
	call    relocvram	; relocate video ram
	ld	hl,518bh	
	call    relocvram	; relocate video ram

	ld	hl,5159h	
	call    relocvram2	; relocate video ram
	ld	hl,513eh	
	call    relocvram2	; relocate video ram
	ld	hl,5131h	
	call    relocvram2	; relocate video ram
	ld	hl,5124h	
	call    relocvram2	; relocate video ram
	ld	hl,5117h	
	call    relocvram2	; relocate video ram
	ld	hl,510ah	
	call    relocvram2	; relocate video ram
	ld	hl,50f0h	
	call    relocvram2	; relocate video ram
	ld	hl,50dbh	
	call    relocvram2	; relocate video ram
	ld	hl,50c8h	
	call    relocvram2	; relocate video ram
	ld	hl,50b6h	
	call    relocvram2	; relocate video ram
	ld	hl,509dh	
	call    relocvram2	; relocate video ram

	ld	hl,5054h	
	call    relocvram	; relocate video ram
	ld	hl,4ff6h	
	call    relocvram	; relocate video ram
	ld	hl,4fa0h	
	call    relocvram	; relocate video ram
	ld	hl,4f6ah	
	call    relocvram	; relocate video ram

	ld	hl,4f17h	
	call    relocvram	; relocate video ram
	ld	hl,4f1ah	
	call    relocvram	; relocate video ram
	ld	hl,4f1dh	
	call    relocvram	; relocate video ram
	ld	hl,4f20h	
	call    relocvram	; relocate video ram
	ld	hl,4f23h	
	call    relocvram	; relocate video ram

	ld	hl,4eeeh	
	call    relocvram	; relocate video ram
	ld	hl,4eebh	
	call    relocvram	; relocate video ram
	ld	hl,4ee8h	
	call    relocvram	; relocate video ram
	ld	hl,4ee5h	
	call    relocvram	; relocate video ram
	ld	hl,4ee2h	
	call    relocvram	; relocate video ram

	ld	hl,4d11h	; "STALL" message
	call    relocvram	; relocate video ram
	ld	hl,4d17h	
	call    relocvram	; relocate video ram
	ld	hl,4d1dh	
	call    relocvram	; relocate video ram

	ld	hl,4908h	; path video ram table 4908..4994
pa2a:	push    hl
	call    relocvAddr	; relocate video ram addr
	pop 	hl
	ld	de,0005
	add	hl,de
	ld	a,(hl)		; get hi byte for next video ram addr
	or	a
	jp	z,pa2b		; jump if zero (end of table)
	dec	hl		; hl points back to lo byte of video ram addr
	jp	pa2a
pa2b:
	ld	hl,getkey	; call read keyboard
	ld	(4a1bh+1),hl	; 

	ld	a,'w'		; key for Declare War
	ld	(4aa9h+1),a
	ld	a,32		; key for Fire (war must be declared)
	ld	(4a20h+1),a
	ld	a,'b'		; key for Bomb drop (war must be declared)
	ld	(4a69h+1),a
	ld	a,'9'		; key for increment throttle power
	ld	(4a27h+1),a
	ld	a,'3'		; key for decrement throttle power
	ld	(4a34h+1),a
	ld	a,'m'		; key for map/radar view
	ld	(4a41h+1),a
	ld	a,'f'		; key for forward view
	ld	(4a4bh+1),a
	ld	a,'k'		; key for breaks
	ld	(4a54h+1),a
	ld	a,'6'		; key for rudder right
	ld	(4a6eh+1),a
	ld	a,'5'		; key for center rudder 
	ld	(4a8ah+1),a
	ld	a,'4'		; key for rudder left
	ld	(4a94h+1),a
	ld	a,'d'		; key for down view (delail level = airfield runway)
	ld	(4a9ch+1),a
	ld	a,'u'		; key for up view (delail level = scenary)
	ld	(4abeh+1),a
	ld	a,'2'		; key for yoke down
	ld	(4ab3h+1),a
	ld	a,'8'		; key for yoke up
	ld	(4ac9h+1),a
	ld	a,'0'		; reset flight
	ld	(4ad1h+1),a

				; setup ^C as key to exit to CP/M

	ld	a,3		; ^C to quit game
	ld	(4aa5h+1),a
	ld	a,48		; jr z exitgame
	ld	(4aa7h+1),a
	ld	a,0c3h		; exitgame: jp exitcpm
	ld	(4ad9h),a
	ld	hl,exitcpm	; exit to cpm
	ld	(4ad9h+1),hl	

	ld	hl,6000h	; path video ram table 6000..6297 (scenary -> for draw line routine)
pa3a:	push    hl
	call    relocvAddr	; relocate video ram addr
	pop 	hl
	ld	de,0004
	add	hl,de
	ld	a,(hl)		; get hi byte for next video ram addr
	add	a,10h
	jp	nc,pa3b		; jump if next addr < $f0xx (end of table)
	dec	hl		; hl points back to lo byte of video ram addr
	jp	pa3a
pa3b:
	ret


cls: 	ld	e, 01ah		; ^Z -> clear screen
	ld      c, 2		; Console output
	call    0005		; Call BDOS
	ret

getkey: push	hl
	push 	de
	push	bc
	ld	e,255
	ld      c, 6		; Direct Console input
	call    0005		; Call BDOS
	pop 	bc
	pop 	de
	pop	hl
	ret
	
VRAM	equ	0c000h		; address of Term-125 memory mapped video ram

relocvram2:			; relocate video ram 2-byte opcode
	inc 	hl		; 
relocvram:			; relocate video ram opcode
	inc 	hl		; hl points to video ram addr in opcode
relocvAddr:			; relocate video ram addr
	push	hl		; save addr to modify 
	ld	e,(hl)		; get low part
	inc 	hl
	ld	d,(hl)		; get hi part
	ex	de,hl		; now HL=sorcerer video ram addr reference
	ld	bc,0f080h	; 
	or	a		; clear carry
	sbc	hl,bc		; HL=sorcerer video ram addr reference - $f080
	ld	bc,VRAM		; + $C000 
	or	a		; clear carry
	add	hl,bc		; now HL=TERMINAL-125 video ram addr reference
	ex	de,hl		; now DE=TERMINAL-125 video ram addr reference
	pop	hl		; now HL=addr to modify
	ld	(hl),e		; set low part
	inc 	hl
	ld	(hl),d		; set hi part
	ret
	

relocvramHi:			; relocate video ram (hi byte)
	inc 	hl		; hl points to video ram addr in opcode
	ld	a,(hl)		; get hi byte
	ld	b,0f0h-(VRAM shr 8)
	sub	b		; hi byte: $F0 becomes $C0
	ld	(hl),a		; save back
	ret
	
ClsMain:
	call 	cls
	ld	c,9
	ld 	de,helptxt
	call 	0005
	ret

exitcpm:
	call	cls
	jp	00000		; exit back to cp/m

helptxt: 
	DB "     inc", 13,10
	DB "  8   9 ", 13,10
	DB "4<5>6 | ", 13,10
	DB "  2   | ", 13,10  
	DB "Yoke  3 ", 13,10
	DB "     dec", 13,10
	DB "    Thrt", 13,10
	DB "--------", 13,10
	DB "k: break", 13,10
	DB "m: map  ", 13,10
	DB "f: fwd  ", 13,10
	DB "   view ", 13,10
	DB "--------", 13,10
	DB 10,10,10,10,10
	DB 10,10,10,10,10
	DB 10,10,10,10,10
	DB 10,10,10
	DB "  w: war|b: bomb|space: fire|u/d: detail level|0: reset flight"
	DB 01eh			; home
	DB "$"


choose:
	call 	cls
	ld	c,9
	ld 	de,sctxt1	; message: sublogic FS1 for TRS-80
	call 	0005
	ld	HiRes,a
	or	a
	jp	z,ch0
	ld	c,9
	ld 	de,sctxt2	; message using 3d graphics
	call 	0005
ch0:	ld	c,9
	ld 	de,sctxt3	; scenary options
	call 	0005

	ld	bc,4000
ch1:	call	getkey
	cp	'0'
	jp	z,exitcpm
	cp	3		; ^C exits to cp/m
	jp	z,exitcpm
	cp	'1'
	jp	z,ch3		; TakeOff is the default flight
	cp	'2'
	jp	z,scLanding
	cp	'3'
	jp	z,scHiFly
	ld	de,1000		; wait a bit
ch2:	dec 	de
	ld 	a,d
	or	e
	jp	nz,ch2		; if bc counter expired and
	dec	bc		; no figth has been choosen
	ld	a,b		; then go to default take off flight
	or	c
	jp	nz, ch1
ch3:	ret

sctxt1: 
	DB 13,10
	DB "subLOGIC T80-FS1", 13,10
	DB "Flight Simulator 1 for TRS-80, cassette version (1979)", 13,10
	DB "Ported to CP/M w/WaveMate Terminal-125 TV Video Card (2024)", 13, 10, "$"
sctxt2: DB "with vector generator for High Resolution 3D scenary",13,10,"$"
sctxt3:	DB 10,10,10
	DB "Available flights:",13,10
	DB 10
	DB "   1) Take Off",13,10
	DB "   2) Landing",13,10
	DB "   3) High altitude fligh",13,10
	DB 10
	DB "   0) Return to CP/M",13,10
	DB 10,10,10
	DB "Choose flight: "
	DB "$"

scHiFly:
	ld	hl,01100h	; y pos
	ld	(442dh),hl
	ld	hl,0d800h	; x pos
	ld	(4432h),hl
	ld	hl,1300h	; altitude
	ld	(4437h),hl
	ld	hl,0		; heading 0 -> plane facing to noth mountains
	ld	(4441h),hl
	ld	a,70h
	ld 	(44c5h),a	; throttle
	ld	a,20h
	ld 	(44c7h),a	; yoke
	ld 	hl, 03DB2h     
	ld 	(441Dh),hl	; airspeed
	ld	hl,scHiKey	; patch read keyboard call to simulate up view 'U' key press to view the scenary
	ld	(4a1bh+1),hl	; 
	ld	a,5
	ld	(scHnum),a
	ret
	
scHiKey:
	ld	a,(scHnum)
	dec	a
	ld	(scHnum),a
	or	a
	jp	z, scH1
	ld	a,(4abeh+1);	; get the key configured for up view (delail level = scenary)
	ret			; return it as first read key
scH1:	push	hl
	ld	hl,getkey	; restore call read keyboard
	ld	(4a1bh+1),hl	; 
	pop	hl
	jp	getkey
scHnum:	db 	0

scLanding:
	ld	hl,319Bh	; y pos
	ld	(442dh),hl
	ld	hl,2213h	; x pos
	ld	(4432h),hl
	ld	hl,0349h	; altitude
	ld	(4437h),hl
	ld	hl,0fe71h	; heading (0=North=heading 000, -400=West=heading 270, +401=East=heading 90, +800=South=heading 180
	ld	(4441h),hl
	ld	a,50h
	ld 	(44c5h),a	; throttle
	ld 	hl, 03DB2h     
	ld 	(441Dh),hl	; airspeed
	ret


			; patch to draw with ficcional vector generator for 3D scenary
			; activated then starting with an X in command line
			; 	A>FS1 X
			; not realistic but very cool, showing the simulator at its best	

patchHi:	
	xor 	a
	ld	HiRes,a
	ld	a,(80h)	; command line length
	or	a
	ret 	z	; no command line -> do not activate vector generator
	ld 	a,(82h)
	cp	'x'
	jp	z,pahi1	; yes, activate verctors
	cp	'X'
	ret	nz	; command line is not X -> do not activate vector generator
pahi1:
	ld	a,1
	ld 	(HiRes),a
	ld	hl,PointGr	; intercept draw point FS1 routine
	ld	(6474h+1),hl
	ld	hl,LineGr	; intercept drawline FS1 routine
	ld	(6484h+1),hl		
	ld	hl,ClearGr	; intercept clear screen FS1 routine
	ld	(49f6h+1),hl
	ld	hl,100		; x scale   adjust the x,y scale so the
	ld	(44aah),hl      ;           resolution of vectors drawn
	ld	hl,106		; y scale   is 200x212 pixels, instead
	ld	(44ach),hl      ;           of original TRS-80 resolution
	ld	a,136		; x offset  (98x40) or the Term-125 
	ld	(44aeh),a       ;           resolution (98x80)
	ld	a,110		; y offset 
	ld	(44afh),a
	ret

HiRes:	DB 	0		; flag =1 then using Hires 3D Vector	

ClearGr:		; clear graphic overlay and scenary text screen
	push	af
	ld	a,1
	out	(10h),a		; write 1 to port 10 -> clear graphic overlay
	pop 	af
	jp	6406h		; do return to FS1 text screen clear routine

LineGr:			; draw a vector
	push 	af
	ld	a,2
	out	(10h),a		; write 2 to port 10 -> start vector coordinates
	ld 	a,e
	out	(11h),a		; write x0 to port 11 -> vector coordinates
	ld 	a,d
	out	(11h),a		; write y0 to port 11 -> vector coordinates
	ld 	a,l
	out	(11h),a		; write x1 to port 11 -> vector coordinates
	ld 	a,h
	out	(11h),a		; write y1 to port 11 -> vector coordinates
	ld	a,3
	out	(10h),a		; write 3 to port 10 -> draw vector coordinates
	pop	af
	ret
	; jp	6297h		; do not return to FS1 draw line routine


PointGr:		; draw a point
	push 	af
	ld	a,2
	out	(10h),a		; write 2 to port 10 -> start vector coordinates
	ld 	a,l
	out	(11h),a		; write x1 to port 11 -> vector coordinates
	ld 	a,h
	out	(11h),a		; write y1 to port 11 -> vector coordinates
	ld	a,4
	out	(10h),a		; write 4 to port 10 -> draw a pointcoordinates
	pop	af
	ret
	; jp	643b		; do not return to FS1 draw point routine

mend:	nop
	.dephase
	nop 		; the addr of this instr should be < than the ORG just below
	
	ORG	06FFh	; the original FS1.BIN prog goes to addr 0600h
			; should be in a CP/M record boundary so can be handled by
			; CP/M PIP program
FPROG:		nop
   
   END 

