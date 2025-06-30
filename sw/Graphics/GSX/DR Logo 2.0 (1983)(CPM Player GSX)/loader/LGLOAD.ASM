	.z80
	.list
	aseg
	org	100h

;	Loader for GSX-80 driver for DrLogo 2.0
;	Copyright (C) 2024 by Roberto Sancho

main:	; copy PRL file from [VPROG] to top of TPA
	; Start of PRL is stored at addr [PRLstart+1]
	; adjust SP to be below this address
	; do not modify (0006) top of ram

	ld 	hl,(0006)	; get end fo TPA
	dec	hl
	ld	de,(VPROG+1)	; LGGSX.PRL length
	or	a		; force clear carry 
	sbc	hl,de
	ld	l,0		; HL=addr where to place LGGSX.PRL = PRL entry point
	ld	(PRLstart+1),hl	; save PRL entry point at its new addr
	ex	de,hl
	ld	hl,VPROG+100h	; now HL=LGGSX.PRL source addr into .COM file, DE=destination addr, where to store it
	ld	bc, (VPROG+1)	; LGGSX.PRL length
	ldir			; copy LGGSX.PRL to top of ram
	ld	hl,(PRLstart+1)	; get new top of TPA
	dec	hl
	ld	sp,hl		; set new stack, so it get not overwritten by PRL loaded on top of TPA
	
	; relocate PRL file
	
	ld	hl,VPROG+100h	; HL=LGGSX.PRL start addr
	ld	de, (VPROG+1)	; LGGSX.PRL length
	ld 	(len),de	; len=bytes remaining to be relocated
	add	hl,de		; HL=start of relocation bitmap
	ld	(relocbmp),hl	; relocbmp=addr of reloc bitmap
	ld	hl, (PRLstart+1) ; addr of prog to relocate
	ld	(relocaddr),hl
	ld	a,8
	ld	(cnt8),a	; init counter to 8
	ld	a,(PRLstart+2)	; calc relocation offset using destination addr
	sub	1
	ld	(offset),a
		
reloc1:	ld	hl,(relocbmp)	; get reloc bitmap byte
  	ld	a,(hl)		; get reloc bitmap byte
	ccf			
	sla	a		; shift left, bit7 to carry. CF=1 if byte needs to be relocated
	ld	(hl),a		; save back reloc bitmap byte
	jp	nc,relocok	; if bit7=carry=0 -> do not reloc this byte
	
reloc2:	ld	hl,(relocaddr)	; get addr of prog to be relocated
	ld	a,(hl)		; get byte to be relocated
	ld	b,a
	ld	a,(offset)
	add	a,b		; addr relocation offset
	ld	(hl),a		; save back
	
relocok:	
	ld	hl,(len)	; decr bytes remaining to be relocated
	dec	hl		; when zero, jp end reloc
	ld	a,l
	or	h
	jp	z,endreloc
	ld	(len),hl
	
	ld	hl,(relocaddr)	; incr addr of prog to be relocated
	inc 	hl
	ld	(relocaddr),hl
	
	ld	a,(cnt8)	; dect count 8
	dec	a
	ld	(cnt8),a
	or	a
	jp	nz, cnt8ok
	ld	a,8		; counter 8 reachs zero ->
	ld	(cnt8),a	; init counter back to 8
	ld	hl,(relocbmp)	; and incr reloc bitmap pointer
	inc	hl
	ld	(relocbmp),hl		
cnt8ok: jp	reloc1
endreloc:	

	; PRL file has been relocated
	; now call one-time PRL initialization
	; is PRL program task to adjust (0006) end of TPA
	
PRLstart: call	0000

	ld	hl,(0006)	; get new top of TPA
	dec	hl
	ld	sp,hl		; set new stack, according to end ot TPA set by RPL initialization code
	jp	StartUp
	
len:		DW 	0
relocbmp:	DW	0
relocaddr:	DW 	0
cnt8:		DB	0
offset:		DB 	0
	
	
StartUp:	
	; now call GSX OpenWorkStation to init GSX driver
	; and show the GSX driver welcome message
	
	ld	hl,1		; gsx func 1 = OpenWorkstation
	ld	(gsxfunc),hl
	ld	hl,0		
	ld	(Nptsin),hl	; num pts in = 0
	ld	hl,10		
	ld	(Nintin),hl	; num int in = 10
	ld	hl,1
	ld	(INTIN + 0*2),hl	; open device number = 1
	ld	hl,0
	ld	(INTIN + 1*2),hl	; line style
	ld	hl,1
	ld	(INTIN + 2*2),hl	; line color (0=black, 1=white)
	ld	hl,0
	ld	(INTIN + 3*2),hl	; marker style
	ld	hl,1
	ld	(INTIN + 4*2),hl	; marker color
	ld	hl,0
	ld	(INTIN + 5*2),hl	; text style
	ld	hl,1
	ld	(INTIN + 6*2),hl	; text color
	ld	hl,0
	ld	(INTIN + 7*2),hl	; fill style
	ld	hl,0
	ld	(INTIN + 8*2),hl	; fill index (0=solid)
	ld	hl,1
	ld	(INTIN + 9*2),hl	; fill color
	ld	de,pblock
	ld	c,115
	call	0005

	; now call GSX CloseWorkStation 
	ld	hl,2		; gsx func 2 = CloseWorkstation
	ld	(gsxfunc),hl
	ld	hl,0		
	ld	(Nptsin),hl	; num pts in = 0
	ld	hl,0		
	ld	(Nintin),hl	; num int in = 0
	ld	de,pblock
	ld	c,115
	call	0005

        jp      loader          ; now proceed to load main prog an start it


pblock:	DW	CONTRL		; Address of control array
	DW	INTIN		; Address of integer input array
	DW	PTSIN		; Address of pixel input array
	DW	INTOUT		; Address of integer output array
	DW	PTSOUT		; Address of pixel output array	
CONTRL:	
gsxfunc:	DW	0	; Input:  GSX function to call, 1-33
Nptsin:		DW   	0	; Input:  Number of points in PTSIN array.
Nptsout:	DW   	0	; Output: Number of points in PTSOUT array.
Nintin:		DW   	0	; Input:  Number of integers in INTIN array.
Nintout:	DW   	0	; Output: Number of integers in INTOUT array.	
INTIN:	DS	32		; room for 16 input words
PTSIN:	DS	32		; room for 16 input coords (8 points)
INTOUT:	DS	64		; room for 32 output words
PTSOUT:	DS	32		; room for 16 output coords (8 points)
	

COMPRG: DB      "LOGO    "      ; program name to load (must be 8 chars long)
COMLEN  equ     47360           ; length of program to load
COMFRE  equ     2048            ; program need at least this free mem

COMsize: DS     2               ; calculated minimal TPA needed by COM program

loader: ld      bc,0100h         
        ld      hl,COMLEN       ; check if TPA is big enough for COM program + GSX driver + free ram + stack
        add     hl,bc           ; prog starts at $0100
        add     hl,bc           ; add additional 256 bytes for stack. Now hl=high mem addr needed
        ld      bc,COMFRE 
        add     hl,bc           ; add min free ram needed by prog
        ld      (COMsize),hl    ; COMsize = minimal TPA needed by COM program

        ld      de,tpam1        ; print "Min required TPA size" message
	call 	PrtTxt
        ld      hl,(COMsize)    ; COMsize = minimal TPA needed by COM program
        call    PrtHL           ; print HL in hex (4 digits)
        call    PrtCR

        ld      de,tpam2        ; print "Available TPA size" message
	call 	PrtTxt
        ld      hl,(0006)       ; TPA size
        call    PrtHL           ; print HL in hex (4 digits)
        call    PrtCR

        ld      hl,(COMsize)    ; COMsize = minimal TPA needed by COM program
	ld	bc,(0006)	; get top of TPA
	or	a		; clear carry
	sbc	hl,bc    	; if >=0 -> out of mem (hl=ram needed)
        jp      nc,outofmem
        jp      load1           ; jp to load preparation

PrtCR:  ld      de,crlfm        ; print CR LF
PrtTxt: ld      c,9             ; print text message pinted by in DE ('$' terminated)
        jp      0005

PrtHL:  push    hl
        ld      c,h
        call    PrtH8
        pop     hl
        ld      c,l
PrtH8:  push    bc
        ld      a,c
        rra
        rra
        rra
        rra
        call    PrtH4
        pop     bc
        ld      a,c
PrtH4:  and     0fh
        add     a,90h
        daa
        adc     a,40h
        daa
        ld      c,2
        ld      e,a
        jp      0005            ; BDOS: print char in E

tpam1:  DB      "Min required TPA: 0x"
        DB      "$"
tpam2:  DB      "Current TPA     : 0x"
        DB      "$"


outofmem: 
	ld 	de,oommsg	; print out of mem message
	call 	PrtTxt
	jp      0000            ; reset system, cold start, back to CP/M

oommsg: DB      "TPA too small"
crlfm:  DB      13,10
        DB      "$"


load1:                          ; load preparation
        ld      hl,load2org+1   ; copy load2 to its destination address
        ld      de,load2
        ld      b,load2end-load2
ld1loop:
        ld      a,(hl)
        ld      (de),a
        inc     hl
        inc     de
        djnz    ld1loop

        ld      hl,(COMPRG+0)   ; copy filename to FCB
        ld      (FCB+1),hl
        ld      hl,(COMPRG+2)     
        ld      (FCB+3),hl
        ld      hl,(COMPRG+4)     
        ld      (FCB+5),hl
        ld      hl,(COMPRG+6)     
        ld      (FCB+7),hl
	ld	de,FCB
	ld	c,15
        call    0005            ; open file
        cp      255
        jp      z,openerr
        jp      load2           ; jp to load prog to mem

openerr:
	ld 	de,opnerm	; print open error message
	call 	PrtTxt
        ld      a,'$'
        ld      (FCB+12),a
	ld 	de,FCB+1	; print FCB filename
	call 	PrtTxt
	jp      0000            ; reset system, cold start, back to CP/M

opnerm: DB      "Cannot open "
        DB      "$"


load2org:       nop

	.phase	(COMLEN or 255) + 260

load2:                          ; load prog to mem

	ld	hl,0100h	; store the COM program starting at $0100.
ldloop:	push	hl
	ex	de,hl
	call	dmaset		; set DMA transfer address.
	ld	de,FCB		; and read the next record.
	ld      c,20
	call    0005            ; BDOS read record
        or      a
	jp	nz,ldend	; end of file or read error?
	pop	hl		; nope, bump pointer for next sector.
	ld	de,128
	add	hl,de
	jp	ldloop
ldend:	pop	hl              ; finished reading
	dec	a		; normal end of file?
	jp	nz,rderr
	call	stddma		; set standard transfer address.
                                ; on cp/m there is not necessary to close files only being read
	jp      0100h		; and execute the program.

stddma:	ld	de,80h          ; set the standard dma addr
dmaset:	ld	c,26            ; Routine to set the dma address to (DE).
	JP	0005

rderr: 
	ld	c,9
	ld 	de,rderrm	; print text message
	call 	0005
	jp      0000            ; reset system, cold start, back to CP/M

rderrm: DB      "Read error",13,10
        DB      "$"

                                ; FCB Layout
                                ; DR F1 F2 F3 F4 F5 F6 F7 F8 T1 T2 T3 EX S1 S2 RC  .FILENAMETYP....
                                ; AL AL AL AL AL AL AL AL AL AL AL AL AL AL AL AL  ................
                                ; CR R0 R1 R2                                      ....

FCB:    DB      0,  0,0,0,0,0,0,0,0, "COM",0,0,0,0 
        DB      0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0
        DB      0,0,0,0
  
load2end:       nop

	.dephase

		org 	($ or 255)
EndOfLoader:	nop

VPROG		equ	EndOfLoader + 1

		; here comes the PRL prog to be relocated
   
   END 

