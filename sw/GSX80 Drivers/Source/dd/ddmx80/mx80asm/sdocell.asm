h22974
s 00037/00000/00000
d D 1.1 83/03/17 15:57:23 tes 1 0
c date and time created 83/03/17 15:57:23 by tes
e
u
4
U
t
T
I 1
         TITLE  'DOCELL - CELL ARRAY'
 
; ****************************************************************************
; *                                                                          *
; *  DOCELL  : DRAW A CELL ARRAY         - MAIN MODULE                       *
; *                                                                          *
; *                                                                          *
; ****************************************************************************
;                                                                            *
;  Revision : Nov. 10, 1982   File "DOCELL.ASM"     Version 1.1              *
;                                                                            *
;  docell                                                                    *
;                                                                            *
;  Input    :                                                                *
;                                                                            *
;  Output   :                                                                *
;                                                                            *
;  Calls    :  DOBAR  - Display a bar                                        *
;                                                                            *
;*****************************************************************************
 
       PUBLIC  DOCELL
       EXTRN   NDFITY, DOBOX
 
DOCELL
 
       LDA      NDFITY
       PUSH     PSW           ; Push the users fill interior style
 
       MVI      A,        0   ; Need to use hollow bars
       STA      NDFITY
 
       CALL     DOBOX         ; Do the outline using a hollow bar
 
       POP      PSW           ; Reset the user's fill interior style
       STA      NDFITY
       RET
E 1
