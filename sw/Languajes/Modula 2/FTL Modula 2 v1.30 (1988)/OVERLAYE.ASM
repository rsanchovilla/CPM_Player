;
;		Overlay caller
;
;		this is the overlay caller for the Advanced Programmer's Kit
;		of FTL Modula-2
;
;		Copyright (C) Dave Moore, FTL Modula-2 November 1986
;
;		When an entry in an overlay is called, a dummy entry point in
;		the root segment is called first. That dummy entry does a:
;		
;		ld a,overlay group number 
;		ld hl,address of entry number in overlay
;		jp	overlay
;
;		the address jumped to is always the first byte of
;		code in this module - so the code must start at the
;		beginning of the module. Do not put data there or it will
;		get executed. 
;
;		this module actually loads the overlay and calls the routine
;
;		The code to be overlayed is in a file. The overlays are
;		loaded into the file by the MLLOAD program. This file has 
;		the structure:
;
;		Block 1 index. Each entry is four bytes giving extent and
;				start block within extent for each overlay,
;				followed by the length of the overlay in 
;				sectors. (The last byte is unused, so the
;				longest possible overlay is 32K)
;
;		Subsequent blocks. Data for overlays. No overlay spans
;			an extent. In fact, the last sector of each extent is
;			unused. Otherwise, CP/M opens the following extent
;			implicitly when you read it which slows things down.
;			(However, this is not true if the overlay exceeds
;			 16K bytes, which is rarely the case )
;
;		**********************
;		*setting search lists*
;		**********************
;
;		Near the end of the code is a label `Drives' which is 
;		a list of disk drives to search for the overlay file.
;		You may want to change this for your system. If you 
;		are developing a program that you will be releasing,
;		you will want to provide the end-user with a method
;		of patching this information. The program SETSEARC,
;		which is based on the program used by the compiler, is supplied
;		in source so that you may patch it if required.
;
opnfc	equ	15
rsrfc	equ	20
setdma	equ	26
cr	equ	0dh
lf	equ	0ah
extents equ	2
;
;		extents is the max number of extents that the overlay file can 
;		use. The number of extents actually required is given by the
;		MLLOAD program when it is used to load the overlays into the 
;		file. If you want to set extents=1, you will need to remove the
;		code at label 'call1' which opens the remaining fcbs
;
callovr:push	af		;save group
	push	hl		;and address
	ld	a,(opened)
	cp	0
	jp	nz,call4	
;
;	overlay file needs opening - do so and read first sector
;
	ld	de,overtab		;get dma out of road
	ld	c,setdma
	call	bdos
	ld	de,fcb1
	call	opensrch
	cp	0
	jp	z,noovr
;
;		open remaining overlay tables - remove this code if extents=1
;
	ld	b,extents-1
	ld	hl,fcbpnt+2
call1:	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	push	hl
	push	bc
	ld	a,(fcb1)
	ld	(de),a
	ld	c,opnfc
	call	bdos
	pop	bc
	pop	hl
	djnz	call1
;
;		end of extent opening code
;
;		now read in table of offsets to starts of overlays
;		this is in the first block (128 bytes) of the overlay file
;
	ld	hl,overtab
	ld	de,fcb1
	ld	b,1
	call 	read
	ld	a,1
	ld	(opened),a
;
;		overlay file now opened and index read in - jump
;		around check for overlay already in memory
;
	pop	hl		;adjust stack
	pop	af
	jp	call5		;on must be loaded
call4:	ld	a,(overlay)
	pop	hl
	pop	de
	cp	d
	jp	z,call10	;on required overlay already loaded
	ld	a,d
;
;		load the required overlay
;
call5:	push	hl
	ld	(overlay),a
	ld	l,a
	ld	h,0
	add	hl,hl
	add	hl,hl
	ld	de,overtab
	add	hl,de		;index entry for overlay
;****************************************************************
;		look up an entry in the overlay table
;		each entry is 4 bytes long
;
;		it takes the form:
;				extent number,starting record,
;				length (blocks),filler
;*****************************************************************
;
;		first, get address of fcb
;
	ld	a,(hl)		;get extent number
	add	a
	push	hl
	ld	de,fcbpnt
	ld	l,a
	ld	h,0
	add	hl,de
	ld	e,(hl)		;get pointer to fcb
	inc	hl
	ld	d,(hl)
	pop	hl
call6:	inc	hl
	ld	a,(hl)		;starting record
	push	de
	pop	iy
	ld	(iy+32),a	;set current record pointer
	inc	hl
	ld	b,(hl)		;length
	ld	hl,(ovlarea)	;start of overlay area
	call	read
;
;		if you want to be able to call modules from other 
;		overlayed modules, you need to add some code here
;
;		See the documentation for more details
;
call10:	pop	hl		;address of entry
	jp	(hl)		;call procedure
;
;	read data from the overlay file
;
;	b gives blocks to read
;	hl gives area for read
;	de gives fcb to use
;
read:	push	bc
	push	hl
;
;		first, copy fcb into work fcb
;
	ex	de,hl
	ld	de,workfcb
	ld	bc,36
	ldir			;move fcb
;
;		transfer a block at a time
;
	pop	de		;address to read into
	pop	bc		;repeat count
read1:	push	de
	push	bc
	ld	c,setdma
	call	bdos		;set dma address
	ld	de,workfcb
	ld	c,rsrfc
	call	bdos
	cp	0
	jp	nz,error
	pop	bc
	pop	hl
	ld	de,128
	add	hl,de		;move to next 128 bytes
	ex	de,hl
	djnz	read1
	ret
;
;		error handling - abort program on any errors
;
error:	ld	de,ovlior
	jr	err	
noovr:  ld	de,nofilem
err:	ld	c,9
	call	bdos
	jp	0		;abort program
;
;		call bdos - saving ix accross call
;		
bdos:	push	ix
	call	5
	pop	ix
	ret
;
;		search for a file on a list of drives
;
;		on entry, de points to fcb
;		on exit, a is 0 if not found, 1 if found
opensrch:ld	hl,drives
opens1:	ld	a,(hl)
	cp	0ffh
	jp	z,opens2
	ld	(de),a
	push	hl
	push	de
	ld	c,15
	call	bdos
	pop	de
	pop	hl
	inc	hl
	cp	0ffh
	jp	z,opens1
	xor	a
	inc	a
	ret
opens2:	xor	a
	ret
;
;		here are the data areas for the overlayer
;
;
;		data areas
;
nofilem:db	'OVERLAYE.OVR missing',13,10,'$'
ovlior:	db	'IO error loading overlay',13,10,'$'
opened:	db	0		;set to 1 if overlay file opened yet
overlay:db	0		;number of currrently loaded overlay
workfcb: ds	36
fcbpnt:	dw	fcb1		;pointer to first fcb (extent 0)
	dw	fcb2		;pointer to second fcb (extent 1)
fcb1:	db	0
	db	'OVERLAYEOVR'	;change name to whatever you prefer
	db	0 
	ds	25
fcb2:	db	0;
	db	'OVERLAYEOVR'
	DB	1		;extent number
	ds	25
;
;		drives is a list of drives to be searched for 
;		file names. It is placed last in this module to
;		make it easier to find so that you can patch it
;
drives: db	0,1,2,255,255
;
;		0=currently logged in drive
;		1,2= a,b etc
;		255=end of list (one must always be present)
;
overtab:ds	128		;table of offsets etc for overlays
;
;		the start address of the overlay area is loaded 
;		by the linker straight after the overlayer
;
ovlarea:ds	0
	end
                                                 