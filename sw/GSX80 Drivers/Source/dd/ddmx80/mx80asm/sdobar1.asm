h54666
s 00310/00000/00000
d D 1.1 83/03/17 15:57:18 tes 1 0
c date and time created 83/03/17 15:57:18 by tes
e
u
4
U
t
T
I 1
         TITLE  'DOBAR - BAR GENERALIZED DRAWING PRIMITIVE'
 
; ****************************************************************************
; *                                                                          *
; *  DOBAR  : DRAW A FILLED BAR          - MAIN MODULE                       *
; *                                                                          *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : Nov. 10, 1982   File "DOBAR.ASM"     Version 1.4               *
;                                                                            *
;  dobar                                                                     *
;                                                                            *
;  Input    :                                                                *
;                                                                            *
;  Output   :                                                                *
;                                                                            *
;  Calls    :  GETXY - Get x,y point of the next point in the object list    *
;              CLIPIT - Clip line to printer plot strip                      *
;              DRAWXY - Raster convert vector to pixel values                *
;              ADDR
;              SETBIT
;                                                                            *
;*****************************************************************************
 
       PUBLIC  DOBAR, DOBOX
       EXTRN   GETXY, X1, X2, Y1, Y2, CLIPIT, DRAWXY, GETNXT, GETADR
       EXTRN   NDFITY, NDINTY, BOTY, TOPY, NDLNTY
       EXTRN   SUBDH, GETMAX, GETMIN, ADDRXY, SETBIT
       EXTRN   NBIT, NBYT, XW
 
X1MIN  DS      02       ; SAVE LOCATIONS FOR BAR CORNERS
X2MAX  DS      02
Y1MIN  DS      02
Y2MAX  DS      02
ROTABL DB      0, 1, 0, 1, 0, 1
PATABL DB      136, 136, 128, 128, 204, 204
ROTFLG DS      01
PATRN  DS      01
IVAL   DS      01
PATSRT DS      01
ROW    DS      02
COLUMN DS      02
MINY   DS      02
MAXY   DS      02
OLDBIT DS      01
OLDBYT DS      02
 
;  Get the lower corner x1min, y1min
 
DOBAR
       ;  Get the GDP opcode, it should be a one - a bar
       CALL     GETNXT
 
DOBOX  CALL     GETXY           ;  Get two corner points
       XCHG                     ;  Move the x point returned in DE to HL
       SHLD     X1MIN           ;  Store xmin into value
       MOV      H,        B     ;  Move the y point into HL
       MOV      L,        C
       SHLD     Y1MIN           ;  Store it away
 
       CALL     GETXY           ; Get x2, y2
       XCHG                     ; Move x point into HL
       SHLD     X2MAX
       MOV      H,        B
       MOV      L,        C
       SHLD     Y2MAX          ; Save the y point
 
       ;  Determine if any part of the bar is visible at all
       ;   by clipping the entire diagonal
 
       LHLD     X2MAX          ; Start by trying the upper right corner
       SHLD     X1
       LHLD     Y2MAX
       SHLD     Y1
       LHLD     X1MIN
       SHLD     X2
       LHLD     Y1MIN
       SHLD     Y2
       CALL     CLIPIT
       RNZ                   ; Return if flag says rejected
 
 
       ;  Draw the outline of the bar
 
       ; save the current linestyle and set to solid
       LDA      NDLNTY
       PUSH     PSW
       XRA      A        ; set to 0 for solid
       STA      NDLNTY
 
       LHLD     Y2MAX        ; Do top horizontal edge
       SHLD     Y2
       SHLD     Y1
       LHLD     X2MAX          ; Start by trying the upper right corner
       SHLD     X1
       LHLD     X1MIN
       SHLD     X2
 
       CALL     CLIPIT         ; Check to see if the line is visible
       CZ       DRAWXY
 
       LHLD     Y2MAX        ; Do top horizontal edge
       SHLD     Y1
       LHLD     X2MAX          ; Start by trying the upper right corner
       SHLD     X1
       SHLD     X2
 
       LHLD     Y1MIN
       SHLD     Y2
       CALL     CLIPIT
       CALL     DRAWXY
 
       LHLD     X1MIN          ;  Now do bottem edge
       SHLD     X1
       LHLD     X2MAX          ; Start by trying the upper right corner
       SHLD     X2
 
       LHLD     Y1MIN
       SHLD     Y2
       SHLD     Y1
       CALL     CLIPIT
       CZ       DRAWXY
 
       LHLD     X1MIN         ; Now draw the left edge
       SHLD     X2
       SHLD     X1
       LHLD     Y2MAX
       SHLD     Y2
       LHLD     Y1MIN
       SHLD     Y1
       CALL     CLIPIT
       CALL     DRAWXY
 
       POP      PSW            ; Restore the line style
       STA      NDLNTY
 
       ; Determine which pattern to use
       LDA      NDFITY
       DCR      A       ; Determine if it is Hollow fill
       RM               ; Yes, it was, return
 
       DCR      A       ; Now check for solid fill
       JNZ      BAR001
 
       ;  Set pattern and rotate flag from table of patterns
       MVI      D,  0    ; Zero the d register
       LDA      NDINTY   ; Load in the fill pattern
       MOV      E,  A    ; Put the fill pattern into e
       LXI      H,  ROTABL   ; Load address of rotation table
       DAD      D        ; Determine address of rotation to use
       MOV      A,  M    ; Load the rotation flag into A
       STA      ROTFLG   ; Save the Flag
 
       ; Now do the pattern
 
       LXI      H,  PATABL   ; Load address of pattern table
       DAD      D        ; Determine address of pattern to use
       MOV      A,  M    ; Load the pattern into A
       STA      PATRN    ; Save the pattern
 
       JMP      BAR002
 
BAR001 MVI      A, 0     ; Rotation for solid fill
       STA      ROTFLG
       MVI      A, 255   ; Pattern for solid fill
       STA      PATRN
 
BAR002                   ; all done figuring out the pattern and rotation
 
       ; Now determine what the pattern should be for the current buffer
       STA      IVAL    ; Working copy of what the pattern is
       LDA      ROTFLG
       DCR      A       ; Determine if there is a rotation
       JNZ      BAR003
 
       ; Determine where the bottem of the bar is compared
       ; to the bottem of the scan buffer
       LHLD     Y1MIN
       XCHG
       LHLD     BOTY
       CALL     SUBDH
       INX      H
 
       ; Determine if the subtraction produced a negative result
       MOV      A,  H
       ORA      H
       JP       BAR003    ; Count is positive, do not rotate pattern
 
       ; Need to modify the pattern by rotating it
       MOV      B,  L  ; Get the count into B, a negative value
       LDA      IVAL   ; Get the pattern
BAR005 RLC             ; Rotate the pattern
       INR      B      ; Increment the count register
       JNZ      BAR005
 
       STA      IVAL
BAR003
       ;  Now start filling the bar since the pattern has been fixed up
       LDA      IVAL
       STA      PATSRT  ; Save the pattern that the edge started with
 
       ; Determine exactly which rows of the bar that will be filled
       LHLD     Y1MIN
       INX      H
       XCHG
       LHLD     BOTY
       CALL     GETMAX
       SHLD     MINY   ; The bottem row
       SHLD     ROW    ; this is the row to start with
 
       ; The Top limit row
       LHLD     Y2MAX
       DCX      H
       XCHG
       LHLD     TOPY
       CALL     GETMIN
       SHLD     MAXY
 
       ; Check to make sure that there is some of the bar to display
       LHLD      MAXY
       XCHG
       LHLD      MINY
       CALL      SUBDH
       MOV       A,   H
       ORA       H
       RM        ;  If the result is negative then min is greater than max
 
;      COMPUTE BITMAP ADDRESS FOR X1MIN, Y1MIN
 
       LHLD     ROW
       XCHG
       LHLD     X1MIN
       SHLD     COLUMN     ; Column to start with
       CALL     GETADR
       MOV      A,   B
       STA      OLDBIT
       SHLD     OLDBYT
       LDA      IVAL       ; The starting patter
       PUSH     PSW        ; Push it to keep things even
 
BAR008 POP      PSW
       RLC                 ; Rotate the pattern
       PUSH     PSW
       JNC      BAR006     ; Bit is not on
       LHLD     NBYT
       LDA      NBIT
       MOV      B,   A
       CALL     SETBIT
 
BAR006 ;  increment x pointer and compare to see if done
       LDA      NBIT     ;INCREMENT BITMAP ADDRESS POINTERS
       INR      A
       MVI      B,  07H
       ANA      B
       JNZ      BAR012
       LHLD     NBYT
       INX      H
       SHLD     NBYT
BAR012 STA      NBIT
 
       LHLD     X2MAX
       XCHG
       LHLD     COLUMN
       INX      H        ; Increment to next column
       SHLD     COLUMN   ; Put the new column back
       CALL     SUBDH    ; Subtract to determine if done with the row
       MOV      A,  H
       ORA      L
       JZ       BAR007   ; Done with that row
       JMP      BAR008   ; Do the next pixel in the row
 
BAR007  ; Get to a new row
       LHLD     OLDBYT
       XCHG
       LHLD     XW
       DAD      D
       SHLD     NBYT     ; Y = Y + 1
       SHLD     OLDBYT
 
       LHLD     MAXY     ; Get the upper limit
       XCHG
       LHLD     ROW
       INX      H        ; Increment to next row
       SHLD     ROW
       CALL     SUBDH    ; Determine if done with current pass
       MOV      A,  H
       ORA      H
       JP       BAR011   ; All done with the Bar for this pass
       POP      B        ; Clean house
       RET
 
BAR011
       LHLD     X1MIN
       SHLD     COLUMN
       LDA      OLDBIT
       STA      NBIT
 
       ; Determine if there is a rotation, need to fix the start pattern
       LDA      ROTFLG
       DCR      A
       JNZ      BAR010   ; No rotation, do not rotate pattern
       LDA      PATSRT
       RLC
       STA      PATSRT
BAR010 POP      PSW
       LDA      PATSRT
       PUSH     PSW    ; Reset the pattern to use for the start of the line
       JMP      BAR008
       END
E 1
