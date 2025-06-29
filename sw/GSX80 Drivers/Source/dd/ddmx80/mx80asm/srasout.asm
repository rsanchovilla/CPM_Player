h43247
s 00174/00000/00000
d D 1.1 83/03/17 15:58:30 tes 1 0
c date and time created 83/03/17 15:58:30 by tes
e
u
4
U
t
T
I 1
 
         TITLE 'PHASE II : RASTER CONVERT, SCAN OUTPUT MAIN MODULE'
 
; ****************************************************************************
; *                                                                          *
; *  RASOUT : Phase II Main Module                                           *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : Nov. 14, 1982 File "RASOUT.ASM"     Version 1.0                *
;                                                                            *
;***** MODE NOTES :  *********************************************************
;                                                                            *
;                                                                            *
;  Rasout (objcnt, object list buffer)                                       *
;                                                                            *
;  Description :                                                             *
;                                                                            *
;     Initialize Bitmap Variables for Raster ans Scaner Routines;            *
;     do n = 1 to nstrip;                                                    *
;        do n = 1 to objcnt;                                                 *
;           Get next entry from Object List;                                 *
;           Call Raster to Process the Opcode;                               *
;        end;                                                                *
;                                                                            *
;        Call Scaner to Output the Plot Strip;                               *
;        Clear Bitmap;                                                       *
;     end;                                                                   *
;                                                                            *
;     Exit Graphic Mode;                                                     *
;                                                                            *
;----------------------------------------------------------------------------+
 
         PUBLIC RASOUT, POUT
         PUBLIC TOPY, BOTY, BOTTY
 
         EXTRN  SETUPS, RASTER, SCANER, CLRBUF, GEXIT
         EXTRN  NSTRIP, XMAX, YMAX, YSIZE
         dseg
;----------------------------------------------------------------------------+
;        CURRENT PLOT STRIP START AND END COORDINATE (TOP-Y, BOTTOM-Y)       +
;----------------------------------------------------------------------------+
 
TOPY     DS     02               ;Plot strip Top clip edge
BOTY     DS     02               ;Plot strip Bottom clip edge
BOTTY    DS     02               ;Plot strip Bottom map edge
         cseg
 
RASOUT
;        XMAX and YMAX passed to RASOUT by PHASE I MODULES
START
 
;----------------------------------------------------------------------------+
;        Enter Graphic Mode                                                  +
;               MVI    A,     GMODE                                          +
;               CALL   POUT                                                  +
;                                                                            +
;        Compute BITMAP buffer row/column variables using the buffer size    +
;        BSIZE, the current Plot extents XMAX & YMAX and Printer dependent   +
;        value, No. of print wires per byte : PIXL                           +
;----------------------------------------------------------------------------+
 
         CALL   SETUPS           ;Setup parameters used by RASTER & SCANNER
                                 ;Modules : xw, pline, nstrip, and lsize
 
;----------------------------------------------------------------------------+
;        Initialize Outer Loop Count : No. of Plot Strips to Raster-Scan     +
;----------------------------------------------------------------------------+
 
         LDA    NSTRIP           ;No. of Plot Strips to Process for this plot
         MOV    B,     A         ;This is the outer loop count
 
;----------------------------------------------------------------------------+
;        Initialize Plot Strip Clipping parameters, TOPY and BOTY            +
;----------------------------------------------------------------------------+
 
;        TOPY = YMAX
 
         LHLD   YMAX             ;Start Raster Scanning from YMAX
 
;----------------------------------------------------------------------------+
;        For n = 1 to nstrip                                                 +
;----------------------------------------------------------------------------+
 
NLOOP    PUSH   B                ;Loop to Raster and Scan output the plot
         SHLD   TOPY             ;TOP Y-coord. of the First Plot Strip
 
;        BOTY = TOPY - No. of vertical pixels per Strip (Y-axis) + 1
 
         XCHG
         LHLD   YSIZE            ;Vertical pixels per Strip = PLINE * PIXL
         DAD    D
         SHLD   BOTTY            ;Bottom edge Coordinate
 
         MOV    A,      H        ;Making sure BOTY >= 0
         ORA    A
         JP     RSOJ01
         LXI    H,      0
 
RSOJ01   SHLD   BOTY             ;BOTTOM Y-coord. of the first Plot Strip
 
         CALL   RASTER           ;Rasterize next Plot Strip into BITMAP
 
         CALL   SCANER           ;Scan and Output this Plot Strip to Printer
 
;----------------------------------------------------------------------------+
;        Clear the BITMAP buffer                                             +
;        Update TOPY and BOTY to process next Plot Strip                     +
;----------------------------------------------------------------------------+
 
         CALL   CLRBUF
 
         LHLD   BOTY             ;Update TOPY = BOTY - 1, Start Y-coord of
                                 ;next Plot Strip
         DCX    H
         MOV    A,      H        ;Making sure TOPY is > 0
         ORA    A
         POP    B                ;Un-stack Strip count
         JM     EXIT
 
;----------------------------------------------------------------------------+
;        Decrement Strip count, All done ?                                   +
;----------------------------------------------------------------------------+
 
	 DCR	B
         JNZ    NLOOP            ;Go do next Strip
 
;----------------------------------------------------------------------------+
;        Exit Graphic Mode                                                   +
;----------------------------------------------------------------------------+
 
EXIT     CALL   GEXIT            ;MVI    A,     PMODE
                                 ;CALL   POUT
         RET
 
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  BDOS Function Codes                                                       ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
CCP0     EQU    0000H            ;CP/M Command Processor entry point
BDOS     EQU    0005H            ;BDOS Entry Point
LIST     EQU    5                ;LST char Output
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                            ;
;  POUT, Output a byte to the Printer                                        ;
;                                                                            ;
;  Input :  A = Data byte                                                    ;
;  Output:  Printer Port                                                     ;
;          *All registers Preserved                                          ;
;                                                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
POUT     PUSH   PSW              ;Save registers
         PUSH   B
         PUSH   D
         PUSH   H
         MVI    C,     LIST      ;BDOS Print Function
         MOV    E,     A         ;Print the character
         CALL   BDOS
         POP    H
         POP    D
         POP    B
         POP    PSW
         RET
 
 
         END
 
 
E 1
