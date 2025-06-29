
/*
	These are the fuctions missing from DEFF.CRL 
	Written by Roberto Sancho, Dec 2023
	function bdos() is manualy patched to call CP/M BDOS entry point
        based on stdlib version 1.43
  
*/


/* Call to bdos routine c, with BC set to c, DE set to de..
   Returns H equal to the value returned by the BDOS in B,
   and L equal to the value returned by the BDOS in A. 
*/   

bdos(c,de)
{
   /* int c and de param are copied to [03f7]=c, [03f9]=de before       
      entering this routine so no need for local vars                   
   */

   return 0x1111;  /* Each one of the return 4660 lines are traslated to  */
   return 0xC9C9;  /*     ld hl,$1234; ret      machine code instructions */
   return 0xC9C9;  /* coded as 4-bytes hex sequence                       */
   return 0xC9C9;  /*     21 C9 C9 C9                                     */
   return 0xC9C9;  /* The asm routine is 15 bytes long. The "return 4660; */
                   /* sentences generates a 4*5=20 bytes padding space    */
   
   /* this is the assembler program that calls CP/M BDOS
      and overwrites the "return 4660" sentences
   
     3a f703    ld   a,($03f7) get first func param (int c)
     4f         ld   c,a
     2a f903    ld   hl,($03f9) second func param (int de)
     eb         ex   de,hl
     cd 0500    call $0005
     6f         ld   l,a	   ; move return value from A into HL
     26 00      ld   h,0
     c9         ret
     
     */
}
/*
bdos calls 

conin:  equ 1           ;read a character from console
conout:	equ 2		;write a character to console
lstout:	equ 5		;write a character to list device
dconio:	equ 6		;direct console I/O 
giobyt: equ 7           ;get io byte
siobyt: equ 8           ;set io byte
pstrng:	equ 9		;print string (terminated by '$')
getlin:	equ 10		;get buffered line from console
cstat:	equ 11		;get console status
select:	equ 14		;select disk
openc:	equ 15		;open a file
closec:	equ 16		;close a file
delc:	equ 19		;delete a file
reads:	equ 20		;read a sector (sequential)
;writs:	equ 21		;write a sector (sequential)
creatc:	equ 22		;make a file
renc:	equ 23		;rename file
sdma:	equ 26		;set dma
gsuser:	equ 32		;get/set user code
readr:	equ 33		;read random sector
writr:	equ 34		;write random sector
cfsizc:	equ 35		;compute file size
srrecc:	equ 36		;set random record

*/



/* call bdos conout to print char c on console. That's all */
conout(c)
{
   return 0x2222;  
   return 0xC9C9;  
   return 0xC9C9;  
   
   /* this is the assembler program that calls CP/M BDOS
      and overwrites the "return 4660" sentences
   
     3a f703    ld   a,($03f7) get first func param (int c)
     5f         ld   e,a       the char to send to console
     0e 02      ld   c,2       bdos console out
     c3 0500    jp   $0005
     
     */
}

/* close file for given file descriptor (=fcb number) */
close(fd)
{  
   return 0x3333;  
   /* 
     c3 ad05    jp   $05ad	close routine in c.ccc
                                this routine expect fd value in [03f7] wich maps to 
                                first arg of routine set by compiler prior to call
                                the function
                                                                                        
   */
}

/* close all open r/w files, exit to cp/m */
exit(n)
{
   return 0x4444;  
   /* 
     c3 9305    jp   $0593	close any open file and exit to CP/M
   */
}

/* locates a free fcb, store filename in it 
   returns -1 if error
   on success, return fcb address. returns file descriptor (fcb number) in [$03fb]
*/   
getfcb(filename)
{

   return 0x5555;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
  
   /* 
     af         xor  a
     32 fb03    ld   ($03fb),a  clear
     cd 5606    call $0656	get free fcb addr  returns fcbaddr in HL, fd in A
     da 8f05    jp c,$058f      return -1 if error (no free fcb)
     22 f903    ld   ($03f9),hl save fcbaddr     
     32 fb03    ld   ($03fb),a  save fcb num   
                
     e5         push hl
     2a f703    ld   hl,($03f7) func param (char * filename)
     eb         ex   hl,de
     e1         pop  hl         now HL=fcbaddr; DE=filename
     cd eb05    call $05eb	call setfcb to add filename
     2a f903    ld   hl,($03f9) return fcb addr
     c9         ret 
   */

}  
   
/* bios(n,c)
   Call to bios jump table routine n, with BC set to c. n=0 for boot,
   n=1 for wboot, n=2 for const, etc.
*/   
bios(n,c)
{
 
   return 0x6666;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   return 0xC9C9;  
   
   /* 
     2a 0100    ld      hl,($0001)	bios jump table addr
     2b         dec     hl		set addr first jump
     2b         dec     hl
     2b         dec     hl
     3a f703    ld      a,($03f7)	get arg 1: function number 1-85
     47         ld      b,a		mult by 3
     87         add     a,a
     80         add     a,b
     5f         ld      e,a		put into DE
     16 00      ld      d,$00
     19         add     hl,de		add to base
     e5         push    hl		save
     2a f903    ld      hl,($03f9)	get arg2: value to put in BC	
     44         ld      b,h		and put it there
     4d         ld      c,l
     21 6f26    ld      hl, $266f       store this prog at aadr 03f7..03fa (reuse mem asigned to arg 1 and 2, that are not used anymore)
     22 f703    ld      ($03f7), hl     03f7 6f    ld l,a
     21 00c9    ld      hl, $c900       03f8 2600  ld h,$00
     22 f903    ld      ($03f9), hl     03fa c9    ret
     21 f703    ld      hl, $03f7       return address from bios call
     e3         ex      (sp),hl         set the return addr in stack
     e9         jp      (hl)            call bios
   
*/      

}

/*
bios calls 

conin:  equ 1           ;read a character from console

BOOT:     equ 0		;Cold start routine
WBOOT:	  equ 1 	;Warm boot - reload command processor
CONST:	  equ 2 	;Console status
CONIN:	  equ 3 	;Console input
CONOUT:	  equ 4 	;Console output
LIST:	  equ 5 	;Printer output
PUNCH:	  equ 6 	;Paper tape punch output
READER:	  equ 7 	;Paper tape reader input
HOME:	  equ 8 	;Move disc head to track 0
SELDSK:	  equ 9 	;Select disc drive
SETTRK:	  equ 10 	;Set track number
SETSEC:	  equ 11 	;Set sector number
SETDMA:	  equ 12 	;Set DMA address
READ:	  equ 13 	;Read a sector
WRITE:	  equ 14 	;Write a sector
LISTST:	  equ 15 	;Status of list device
SECTRAN:  equ 16 	;Sector translation for skewing
CONOST:   equ 17 	;Status of console output
AUXIST:   equ 18 	;Status of auxiliary input
AUXOST:   equ 19 	;Status of auxiliary output
DEVTBL:   equ 20 	;Address of devices table
DEVINI:   equ 21 	;Initialise a device
DRVTBL:   equ 22 	;Address of discs table
MULTIO:   equ 23 	;Read/write multiple sectors
FLUSH:    equ 24 	;Flush host buffers
MOVE:     equ 25 	;Move a block of memory
TIME:     equ 26 	;Real time clock
SELMEM:   equ 27 	;Select memory bank
SETBNK:   equ 28 	;Select bank for DMA operation
XMOVE:    equ 29 	;Preload banks for MOVE



