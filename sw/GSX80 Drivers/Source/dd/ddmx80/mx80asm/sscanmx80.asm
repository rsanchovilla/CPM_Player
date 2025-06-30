h23349
s 00245/00000/00000
d D 1.1 83/03/17 15:59:03 tes 1 0
c date and time created 83/03/17 15:59:03 by tes
e
u
4
U
t
T
I 1
 
 
         TITLE   'BITMAP SCAN AND DISPLAY OUTPUT PROCESSOR'
 
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;                                                                          ;
; ;  SCANER : SCAN AND OUTPUT one 'PLOT STRIP' from BITMAP to PRINTER        ;
; ;                                                                          ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  Revision : NOV. 14, 1982    File "SCANMX80.ASM"  Version 1.0              ;
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;      1) BITMAP BUFFER EMPTY FLAG  11/3                                     *
;      2) Check BITMAP EMPTY FLAG : If set, then Call GLF (<cr><lf>)         *
;      3) Zero the 8th bit in graphic byte for Epson                         *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            ;
;  Scaner (pline, xw)                                                        ;
;                                                                            ;
;  Function : SCAN and OUTPUT entire 'PLOT STRIP' from BITMAP to PRINTER.    ;
;                                                                            ;
;             Actually sets up the bit patterns in graphic byte              ;
;             format and output to the printer byte by byte                  ;
;                                                                            ;
;               for j = 1 to pline   ;loop to output one strip               ;
;                 {for i = 1 to xw   ;  loop to output one line              ;
;                   { call bytout }  ;      transpose and output one byte    ;
;                  output GLF }      ;  Graphic LineFeed                     ;
;                                                                            ;
;  Input   : PLINE  - No. of print lines per plot strip                      ;
;            XW     - No. of bytes per print line                            ;
;            LSIZE  - Offset to the start of next line to output in Bitmap   ;
;                                                                            ;
;  Output  : None                                                            ;
;                                                                            ;
;  Calls   : BYTOUT - Transpose and output one byte to printer               ;
;            POUT   - Output one byte to printer port (CALL BDOS)            ;
;                                                                            ;
;----------------------------------------------------------------------------;
;
;  CALL SCANER
;  RET
;
         PUBLIC SCANER
         EXTRN  POUT, GENTER, GLF
         EXTRN  ABSHL, NEGHL, SUBDH, CMPS, CMPDH, MIDH, DIDH, IMOD
 
         EXTRN  BITMAP, MAPEND, MPTY
         EXTRN  XW, NEGXW, YW, PLINE, NSTRIP, LSIZE
         EXTRN  XMAX, YMAX, XMIN, YMIN
 
;----------------------------------------------------------------------------+
;        PRINTER CONSTANTS (EPSON MX-80)
;----------------------------------------------------------------------------+
 
PIXL     EQU    7                ;7 pixels printed per graphic byte
ESC      EQU    1BH              ;Escape Code
         page
 
SCANER
         LHLD   MAPEND           ;<HL> = first byte address in bitmap
                                 ;       to start scanning bit pattern
         XCHG
         LHLD   PLINE            ;No. of Print Lines per Strip
         MOV    B,     H         ;PLINE = Outer loop count
         MOV    C,     L
 
;        for j = 1 to pline
 
JLOOP
         PUSH   B                ;Save line count
 
;        If BITMAP is EMPTY, SKIP SCANNING ENTIRE LINE
 
         LDA    MPTY
         ORA    A
         JNZ    ILOOP0
         CALL   GLF
         JMP    JLOOP9
 
ILOOP0
         CALL   GENTER           ;Tell the Printer No. of Graphic Bytes
                                 ;to Expect
         LHLD   XW               ;No. of bytes per single pixel Print Line
                                 ;XW = Inner loop count
;        for i = 1 to xw
 
ILOOP    PUSH   H                ;Save byte count
         CALL   BYTOUT           ;Invert and Print one byte, byte address in D
         POP    H
         INX    D                ;Point to next byte in BITMAP
;                                  ** BYTOUT returns DE unchanged **
         DCX    H                ;Decrement byte count
         MOV    A,     H         ;Any more bytes ?
         ORA    L
         JNZ    ILOOP            ;Yes, Do next byte
 
JLOOP9
         POP    B                ;Get Line count
         DCX    B                ;Decrement line count, Done yet?
         MOV    A,     B
         ORA    C
         RZ                      ;Yes, Return
 
;        No, Update the BITMAP address pointer to start of next Print Line
 
         LHLD   LSIZE            ;Get the offset to start of next line
         DAD    D                ;addr = addr - XW*(PIXL+1)
         XCHG                    ;Address pointer in DE
         JMP    JLOOP            ;Go do another line
 
         page
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;                                                                          ;
; ;  BYTOUT : SCAN OUTPUT one BYTE from BITMAP to PRINTER                    ;
; ;                                                                          ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  bytout (nbyt)                                                             ;
;                                                                            ;
;  Function : SCAN and OUTPUT one BYTE from BITMAP to PRINTER                ;
;                                                                            ;
;             Mask out PIXL bytes of bit pattern from BITMAP (starting       ;
;             at NBYT) into graphic byte format befor output to printer      ;
;                                                                            ;
;             PIXL = No. of bits printed in each graphic byte                ;
;                    Datasouth = 6, Prism = 7                                ;
;               for i= 1 to 8 {                                              ;
;                   set mask                                                 ;
;                   call mskout(mask,byte)                                   ;
;                   output byte }                                            ;
;                                                                            ;
;  Input    : NBYT  - Starting byte position in BITMAP buffer                ;
;                                                                            ;
;  Calls    : MSKOUT - Get the desired bits from BITMAP                      ;
;             POUT   - Output one byte to printer port (BDOS function)       ;
;                                                                            ;
;----------------------------------------------------------------------------;
;
;  CALL BYTOUT
;    DE = NBYT, start address in BITMAP
;  RET
;    DE = Unchanged
;
BYTOUT
          LXI  H,   0801H     ;H=loop count, L=shift count
                              ;  shift count used by MSKOUT to rotate
                              ;  the result to printer print wire position
 
          MVI  B,   80H       ;Initialize the bit mask
 
REPEAT    MVI  C,   PIXL      ;No. of bits to Mask out
 
          PUSH D              ;Save BITMAP start address pointer NBYT
          PUSH H              ;Save counters
          CALL MSKOUT         ;Get the desired bits from BITMAP
          CALL POUT           ;Output the byte to printer
          POP  H
          POP  D              ;Restore the address pointer for MSKOUT
 
          MOV  A,   B         ;Update the bit mask to next bit position
          RRC
          MOV  B,   A
          INR  L              ;Update the shift correction count
          DCR  H              ;One more byte moved
          JNZ  REPEAT         ;Done yet ?
          RET                 ;Yes
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  Mskout (nbyt, nbit, result)                                               ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  Function : Mask out PIXL bits from BITMAP Buffer into one                 ;
;             printer output byte (RESULT)                                   ;
;             one bit is masked out of bytes BITMAP(nbyt), BITMAP(nbyt-      ;
;             XW*1),..., BITMAP(nbyt-XW*PIXL)                                ;
;             PIXL = No. of bits printed in each graphic byte                ;
;                   Datasouth = 6, Prism = 7                                 ;
;               for i = 1 to pixl {                                          ;
;                 bit = bitmap(nbyt) ^ mask                                  ;
;                 byte = (byte v bit)                                        ;
;                 shift byte left to make room for next bit                  ;
;                 nbyt = nbyt - (xw * pixl)  }                               ;
;                                                                            ;
;  Input    : NBYT   - Byte position to start transposing                    ;
;             NBIT   - Bit position to transpose from BITMAP                 ;
;             XW     - No. of bytes per print line (row order in buffer)     ;
;                      used to calculate offset to the same byte in next line;
;             PIXL   - No. of bits to transpose until final result           ;
;                                                                            ;
;  Output   : RESULT - Printer graphic byte with bit pattern transposed      ;
;                      from BITMAP                                           ;
;                                                                            ;
;  Calls    : None                                                           ;
;                                                                            ;
;----------------------------------------------------------------------------;
;
;  CALL MSKOUT
;    DE = NBYT, start address
;    B  = NBIT, mask
;    C  = PIXL, loop count
;    L  = Count to shift bits into correct print wire position
;  RET
;    A  = RESULT, on 'RETURN'
;    B  = unchanged mask
;    All other reg clubbered
;
;
MSKOUT
          PUSH H              ;Save away shift counter
          XCHG                ;HL points to NBYT address
          XRA  A              ;Clear work reg
 
AGAIN     RLC                 ;Make room for next bit
          MOV  E,   A         ;Save temp result
 
          MOV  A,   M         ;Get next byte from BITMAP
          ANA  B              ;Leave only the desired bit
          ORA  E              ;Combine with temp result
          XCHG                ;Current NBYT address pointer in DE
 
          LHLD NEGXW          ;Get Offset to same byte in next line
          DAD  D              ;HL Points to next byte
          DCR  C              ;Done yet ?
          JNZ  AGAIN          ;No, continue
;
;  The resulting bit pattern still needs to be rotated into correct
;  Printer wire position : LSB bits
;
          POP  H              ;Get the shift count
ROTA      RLC                 ;Rotate bits until correct position
          DCR  L
          JNZ  ROTA           ;Done yet ?
          ani  7fh            ;Zero 8th Bit
 
          RET                 ;Return with result in A
 
          END
 
E 1
