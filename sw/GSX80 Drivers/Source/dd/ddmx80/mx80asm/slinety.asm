h65423
s 00031/00000/00000
d D 1.1 83/03/17 15:58:23 tes 1 0
c date and time created 83/03/17 15:58:23 by tes
e
u
4
U
t
T
I 1
 
         TITLE ' LINE STYLE PATTERN SUPPORT'
 
;*****************************************************************************
;                                                                            *
;      LINETY : GET CURRENT PATTERN FROM PATTERN WORD : LSTYLE               *
;               ROTATE NEXT BIT : ON/OFF, RETURN SET BIT FLAG ACCORDINGLY    *
;                                                                            *
;*****************************************************************************
;                                                                            *
;        REVISION : NOV. 08, 1982    FILE "LINETY.ASM"    Version 1.0        *
;                                                                            *
;*****************************************************************************
 
 
         PUBLIC LINETY
         EXTRN  NDLNTY, SPECIL
 
LINETY
         PUSH   H
         PUSH   B
         LHLD   SPECIL           ;Get the Pattern
         DAD    H                ;Rotate out next bit
         JNC    LSTY09           ;bit not set : carry off
         INX    H
         STC                     ;set bit flaga
LSTY09
         SHLD   SPECIL
         POP    B
         POP    H
         RET
E 1
