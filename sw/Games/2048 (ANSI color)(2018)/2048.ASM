; 2048
;
; Join the numbers and get to the 2048 tile.
;
; Commands:
;
;   Use the arrow keys to move the tiles.
;   When two tiles with the same number touch, they merge into one.
;
;   w, s, a, d - Alternate keys (up, down, left, right)
;   CTRL-E, CTRL-X, CTRL-S, CTRL-D - Wordstar-compatible control keys
;
; Compile:
;
;   TASM -80 -b 2048.ASM 2048.COM
;
; Credits:
;
;   Based on 2048 created by Gabriele Cirulli.
;   Based on the console version for GNU/Linux by Maurits van der Schee
;   Ported to Z80 and CP/M by Marco Maccaferri <macca@maccasoft.com>


CTRL_A      .EQU    1
CTRL_B      .EQU    2
CTRL_C      .EQU    3
CTRL_D      .EQU    4
CTRL_E      .EQU    5
CTRL_F      .EQU    6
CTRL_G      .EQU    7
CTRL_H      .EQU    8
CTRL_I      .EQU    9
CTRL_J      .EQU    10
CTRL_K      .EQU    11
CTRL_L      .EQU    12
CTRL_M      .EQU    13
CTRL_N      .EQU    14
CTRL_O      .EQU    15
CTRL_P      .EQU    16
CTRL_Q      .EQU    17
CTRL_R      .EQU    18
CTRL_S      .EQU    19
CTRL_T      .EQU    20
CTRL_U      .EQU    21
CTRL_V      .EQU    22
CTRL_W      .EQU    23
CTRL_X      .EQU    24
CTRL_Y      .EQU    25
CTRL_Z      .EQU    26

BEL         .EQU    07H
FF          .EQU    0CH
CR          .EQU    0DH
LF          .EQU    0AH
EOS         .EQU    24H

BDOS        .EQU    0005H

BOARD_X     .EQU    25H
BOARD_Y     .EQU    06H

            .ORG    0100H
            
            LD      A,R
            LD      (RAND16+1),A
            LD      A,R
            LD      (RAND16+2),A

            LD      DE,INIT
            LD      C,09H
            CALL    BDOS

            CALL    ADDRANDOM
            CALL    ADDRANDOM

            CALL    DRAWBORDER
            CALL    DRAWBOARD

LOOP2       LD      A,BOARD_X
            LD      (XPOS),A
            LD      A,BOARD_Y
            ADD     A,13H
            DAA
            LD      (YPOS),A
            CALL    GOTOXY
            LD      DE,MSG1
            LD      C,09H
            CALL    BDOS

LOOP:
            LD      C,06H
            LD      E,0FFH
            CALL    BDOS
            CP      0
            JP      Z,LOOP
            
            CP      'a'
            JP      C,K3
            CP      '{'
            JP      NC,K3
            AND     5FH

K3          CP      CTRL_C
            JP      Z,EXIT

            CP      CTRL_E
            JP      Z,TOP
            CP      CTRL_X
            JP      Z,BOTTOM
            CP      CTRL_D
            JP      Z,RIGHT
            CP      CTRL_S
            JP      Z,LEFT

            CP      'W'
            JP      Z,TOP
            CP      'S'
            JP      Z,BOTTOM
            CP      'D'
            JP      Z,RIGHT
            CP      'A'
            JP      Z,LEFT

            CP      'Q'
            JP      Z,QUIT
            
            CP      1BH
            JP      Z,K1

            LD      C,02H
            LD      E,BEL
            CALL    BDOS

            JP      LOOP

K1          LD      C,06H
            LD      E,0FFH
            CALL    BDOS
            CP      0
            JP      Z,K1
            
            CP      'O'
            JP      NZ,K2

K4          LD      C,06H
            LD      E,0FFH
            CALL    BDOS
            CP      0
            JP      Z,K4

K2          CP      'A'
            JP      Z,TOP
            CP      'B'
            JP      Z,BOTTOM
            CP      'C'
            JP      Z,RIGHT
            CP      'D'
            JP      Z,LEFT

            LD      C,02H
            LD      E,BEL
            CALL    BDOS

            JP      LOOP

LOOP1       LD      A,(MOVED)
            CP      0
            JP      Z,LOOP

            CALL    DRAWBOARD

            CALL    ADDRANDOM
            CALL    DRAWBOARD

            CALL    ISOVER
            CP      1
            JP      Z,GAMEOVER

            JP      LOOP

TOP:
            CALL    ROTATE
            CALL    ROTATE
            CALL    ROTATE
            CALL    MOVEMERGE
            CALL    ROTATE
            JP      LOOP1

BOTTOM:
            CALL    ROTATE
            CALL    MOVEMERGE
            CALL    ROTATE
            CALL    ROTATE
            CALL    ROTATE
            JP      LOOP1

RIGHT:
            CALL    ROTATE
            CALL    ROTATE
            CALL    MOVEMERGE
            CALL    ROTATE
            CALL    ROTATE
            JP      LOOP1

LEFT:
            CALL    MOVEMERGE
            JP      LOOP1

QUIT:
            LD      A,BOARD_X
            LD      (XPOS),A
            LD      A,BOARD_Y
            ADD     A,13H
            DAA
            LD      (YPOS),A
            CALL    GOTOXY
            LD      DE,MSG2
            LD      C,09H
            CALL    BDOS

Q1          LD      C,06H
            LD      E,0FFH
            CALL    BDOS
            CP      0
            JP      Z,Q1

            CP      'y'
            JP      Z,EXIT
            CP      'Y'
            JP      Z,EXIT
            CP      'n'
            JP      Z,LOOP2
            CP      'N'
            JP      Z,LOOP2

            LD      C,02H
            LD      E,BEL
            CALL    BDOS
            JP      Q1

GAMEOVER:
            LD      A,BOARD_X
            LD      (XPOS),A
            LD      A,BOARD_Y+13H
            DAA
            LD      (YPOS),A
            CALL    GOTOXY
            LD      DE,MSG3
            LD      C,09H
            CALL    BDOS

EXIT:
            LD      DE,TERM
            LD      C,09H
            CALL    BDOS
            RET

ISOVER:
            LD      A,1
            LD      (RESULT),A

            LD      B,16
            LD      HL,BOARD
G1:         LD      A,(HL)
            CP      13
            JP      Z,GR
            INC     HL
            DJNZ    G1

            CALL    CANMERGE
            CP      0
            JP      Z,G2
            XOR     A
            LD      (RESULT),A

G2:         CALL    ROTATE
            CALL    CANMERGE
            CP      0
            JP      Z,G3
            XOR     A
            LD      (RESULT),A

G3:         CALL    ROTATE
            CALL    CANMERGE
            CP      0
            JP      Z,G4
            XOR     A
            LD      (RESULT),A

G4:         CALL    ROTATE
            CALL    CANMERGE
            CP      0
            JP      Z,G5
            XOR     A
            LD      (RESULT),A

G5:         CALL    ROTATE

GR:         LD      A,(RESULT)
            RET

CANMERGE:
            LD      HL,BOARD
            LD      (BOARDPTR),HL
            CALL    TESTMERGE
            CP      1
            RET     Z
            LD      HL,BOARD+4
            LD      (BOARDPTR),HL
            CALL    TESTMERGE
            CP      1
            RET     Z
            LD      HL,BOARD+8
            LD      (BOARDPTR),HL
            CALL    TESTMERGE
            CP      1
            RET     Z
            LD      HL,BOARD+12
            LD      (BOARDPTR),HL
            CALL    TESTMERGE
            RET

TESTMERGE:
            LD      DE,(BOARDPTR)
            LD      HL,(BOARDPTR)
            INC     HL

            LD      B,3
M8          LD      A,(DE)
            CP      0
            JP      Z,M7
            LD      C,(HL)
            CP      C
            JP      Z,M7
            INC     HL
            INC     DE
            DJNZ    M8
            XOR     A
            RET
M7          LD      A,1
            RET

MOVEMERGE:
            XOR     A
            LD      (MOVED),A

            LD      HL,BOARD
            LD      (BOARDPTR),HL
            CALL    MERGE
            LD      HL,BOARD+4
            LD      (BOARDPTR),HL
            CALL    MERGE
            LD      HL,BOARD+8
            LD      (BOARDPTR),HL
            CALL    MERGE
            LD      HL,BOARD+12
            LD      (BOARDPTR),HL
            CALL    MERGE

            RET

ADDRANDOM:
            LD      DE,0
            LD      B,16
            LD      HL,BOARD
N2          LD      A,(HL)
            CP      0
            JP      NZ,N1
            INC     E
N1          INC     HL
            DJNZ    N2
            
            LD      A,E
            CP      0
            RET     Z

            PUSH    DE
            CALL    RAND16
            POP     DE
            CALL    DIV16

            LD      B,L
N4:         LD      C,16
            LD      HL,BOARD
N5:         LD      A,(HL)
            CP      0
            JP      NZ,N3
            DEC     B
            JP      Z,N6
N3:         INC     HL
            DEC     C
            JP      NZ,N5
            JP      N4

N6          PUSH    HL

            CALL    RAND16
            LD      DE,10
            CALL    DIV16
            LD      DE,9
            CALL    DIV16
            LD      A,E
            INC     A
            
            POP     HL
            LD      (HL),A

            RET

MERGE:
            CALL    COLLAPSE

            ; merge tiles with same value

            LD      DE,(BOARDPTR)
            LD      HL,(BOARDPTR)
            INC     HL

            LD      B,3
M6:         LD      A,(DE)
            CP      0
            RET     Z
            LD      C,(HL)
            CP      C
            JP      NZ,M5

            INC     A
            LD      (DE),A
            CALL    ADDPOINTS
            XOR     A
            LD      (HL),A

            LD      A,(MOVED)
            INC     A
            LD      (MOVED),A

            PUSH    DE
            PUSH    HL
            CALL    COLLAPSE
            POP     HL
            POP     DE

M5:         INC     HL
            INC     DE
            DJNZ    M6

            RET

COLLAPSE:
            ; collapse all tiles

            LD      HL,(BOARDPTR)

            LD      B,4             ; find first zero
M1:         LD      A,(HL)
            CP      0
            JP      Z,M2
            INC     HL
            DJNZ    M1
            RET

M2:         LD      E,L             ; DE=fist zero position
            LD      D,H

M4:         LD      A,(HL)          ; move all non-zero tiles
            CP      0
            JP      Z,M3

            LD      (DE),A
            INC     DE
            XOR     A
            LD      (HL),A

            LD      A,(MOVED)
            INC     A
            LD      (MOVED),A

M3:         INC     HL
            DJNZ    M4

            RET

ROTATE:
            ; outer ring

            LD      B,3

R1:         LD      A,(BOARD+3)
            LD      C,A

            LD      A,(BOARD+2)
            LD      (BOARD+3),A
            LD      A,(BOARD+1)
            LD      (BOARD+2),A
            LD      A,(BOARD+0)
            LD      (BOARD+1),A

            LD      A,(BOARD+4)
            LD      (BOARD+0),A
            LD      A,(BOARD+8)
            LD      (BOARD+4),A
            LD      A,(BOARD+12)
            LD      (BOARD+8),A

            LD      A,(BOARD+13)
            LD      (BOARD+12),A
            LD      A,(BOARD+14)
            LD      (BOARD+13),A
            LD      A,(BOARD+15)
            LD      (BOARD+14),A

            LD      A,(BOARD+11)
            LD      (BOARD+15),A
            LD      A,(BOARD+7)
            LD      (BOARD+11),A
            LD      A,C
            LD      (BOARD+7),A

            DJNZ    R1

            ; inner ring

            LD      A,(BOARD+6)
            LD      C,A

            LD      A,(BOARD+5)
            LD      (BOARD+6),A
            LD      A,(BOARD+9)
            LD      (BOARD+5),A
            LD      A,(BOARD+10)
            LD      (BOARD+9),A

            LD      A,C
            LD      (BOARD+10),A

            RET

ADDPOINTS:
            PUSH    DE
            PUSH    HL

            LD      E,A
            LD      D,0
            LD      HL,POINTS
            ADD     HL,DE
            ADD     HL,DE
            LD      E,(HL)
            INC     HL
            LD      D,(HL)

            LD      A,(SCORE+3)
            ADD     A,E
            DAA
            LD      (SCORE+3),A

            LD      A,(SCORE+2)
            ADC     A,D
            DAA
            LD      (SCORE+2),A

            LD      A,(SCORE+1)
            ADC     A,00H
            DAA
            LD      (SCORE+1),A

            LD      A,(SCORE)
            ADC     A,00H
            DAA
            LD      (SCORE),A

            POP     HL
            POP     DE
            RET

PRINTSCORE:
            LD      HL,SCORE
            LD      DE,SCORESTR+4
            LD      B,4

P1          LD      A,(HL)
            RRA
            RRA
            RRA
            RRA
            AND     0FH
            ADD     A,30H
            LD      (DE),A
            INC     DE

            LD      A,(HL)
            AND     0FH
            ADD     A,30H
            LD      (DE),A
            INC     DE

            INC     HL
            DJNZ    P1

            LD      HL,SCORESTR+4
            LD      B,7
P3          LD      A,(HL)
            CP      30H
            JP      NZ,P2
            LD      A,20H
            LD      (HL),A
            INC     HL
            DJNZ    P3

P2          LD      A,BOARD_X
            ADD     A,16H
            DAA
            LD      (XPOS),A
            LD      A,BOARD_Y
            SUB     02H
            DAA
            LD      (YPOS),A
            CALL    GOTOXY

            LD      DE,SCORESTR
            LD      C,09H
            CALL    BDOS
            RET

DRAWBORDER:
            LD      A,BOARD_X
            LD      (XPOS),A
            LD      A,BOARD_Y
            SUB     02H
            DAA
            LD      (YPOS),A
            CALL    GOTOXY

            LD      DE,MSG4
            LD      C,09H
            CALL    BDOS


            LD      A,BOARD_X
            SUB     01H
            DAA
            LD      (XPOS),A
            LD      A,BOARD_Y
            SUB     01H
            DAA
            LD      (YPOS),A
            CALL    GOTOXY

            LD      DE,TOPBORDER
            LD      C,09H
            CALL    BDOS

            LD      B,12
L4          PUSH    BC
            LD      A,(YPOS)
            ADD     A,1
            DAA
            LD      (YPOS),A
            CALL    GOTOXY
            LD      C,02H
            LD      E,0DBH
            CALL    BDOS
            LD      DE,ADVANCE
            LD      C,09H
            CALL    BDOS
            LD      C,02H
            LD      E,0DBH
            CALL    BDOS
            POP     BC
            DEC     B
            JP      NZ,L4

            LD      A,(YPOS)
            ADD     A,1
            DAA
            LD      (YPOS),A
            CALL    GOTOXY
            LD      DE,BTMBORDER
            LD      C,09H
            CALL    BDOS

            RET

DRAWBOARD:
            CALL    PRINTSCORE

            LD      A,BOARD_X
            LD      (XPOS),A
            LD      A,BOARD_Y
            SUB     01H
            DAA
            LD      (YPOS),A

            LD      HL,BOARD
            LD      B,4
L1          PUSH    BC

            PUSH    HL
            LD      A,(YPOS)
            ADD     A,1
            DAA
            LD      (YPOS),A
            CALL    GOTOXY
            POP     HL

            PUSH    HL
            LD      E,(HL)
            CALL    PRINTSPACE
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTSPACE
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTSPACE
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTSPACE
            CALL    NEWLINE
            POP     HL

            DEC     HL
            DEC     HL
            DEC     HL

            PUSH    HL
            LD      A,(YPOS)
            ADD     A,1
            DAA
            LD      (YPOS),A
            CALL    GOTOXY
            POP     HL

            PUSH    HL
            LD      E,(HL)
            CALL    PRINTLABEL
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTLABEL
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTLABEL
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTLABEL
            CALL    NEWLINE
            POP     HL

            DEC     HL
            DEC     HL
            DEC     HL

            PUSH    HL
            LD      A,(YPOS)
            ADD     A,1
            DAA
            LD      (YPOS),A
            CALL    GOTOXY
            POP     HL

            PUSH    HL
            LD      E,(HL)
            CALL    PRINTSPACE
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTSPACE
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTSPACE
            POP     HL
            INC     HL
            PUSH    HL
            LD      E,(HL)
            CALL    PRINTSPACE
            CALL    NEWLINE
            POP     HL

            INC     HL

            POP     BC
            DEC     B
            JP      NZ,L1

            RET

PRINTSPACE:
            LD      D,0

            PUSH    DE
            LD      HL,COLORPTR
            ADD     HL,DE
            ADD     HL,DE
            LD      E,(HL)
            INC     HL
            LD      D,(HL)
            LD      C,09H
            CALL    BDOS
            POP     DE

            LD      DE,SPACER
            LD      C,09H
            CALL    BDOS

            RET

PRINTLABEL:
            LD      D,0

            PUSH    DE
            LD      HL,COLORPTR
            ADD     HL,DE
            ADD     HL,DE
            LD      E,(HL)
            INC     HL
            LD      D,(HL)
            LD      C,09H
            CALL    BDOS
            POP     DE

            PUSH    DE
            LD      HL,LABELPTR
            ADD     HL,DE
            ADD     HL,DE
            LD      E,(HL)
            INC     HL
            LD      D,(HL)
            LD      C,09H
            CALL    BDOS
            POP     DE

            RET

GOTOXY:
            LD      C,02H
            LD      E,1BH
            CALL    BDOS
            LD      C,02H
            LD      E,'['
            CALL    BDOS

            LD      A,(YPOS)
            CP      10H
            JP      C,L2

            RRA
            RRA
            RRA
            RRA
            AND     0FH
            ADD     A,'0'

            LD      C,02H
            LD      E,A
            CALL    BDOS

            LD      A,(YPOS)

L2          AND     0FH
            ADD     A,'0'

            LD      C,02H
            LD      E,A
            CALL    BDOS

            LD      C,02H
            LD      E,3BH
            CALL    BDOS

            LD      A,(XPOS)
            CP      10H
            JP      C,L3

            RRA
            RRA
            RRA
            RRA
            AND     0FH
            ADD     A,'0'

            LD      C,02H
            LD      E,A
            CALL    BDOS

            LD      A,(XPOS)

L3          AND     0FH
            ADD     A,'0'

            LD      C,02H
            LD      E,A
            CALL    BDOS

            LD      C,02H
            LD      E,'H'
            CALL    BDOS

            RET

NEWLINE:

            LD      C,02H
            LD      E,CR
            CALL    BDOS

            LD      C,02H
            LD      E,LF
            CALL    BDOS

            RET

RAND16      LD      DE,0
            LD      A,D
            LD      H,E
            LD      L,253
            OR      A
            SBC     HL,DE
            SBC     A,0
            SBC     HL,DE
            LD      D,0
            SBC     A,D
            LD      E,A
            SBC     HL,DE
            JR      NC,RAND
            INC     HL
RAND        LD      (RAND16+1),HL
            RET

DIV16:
            LD      A,H         ; HL = HL % DE
            LD      C,L
            LD      HL,0
            LD      B,16

DL1         SLL  C              ; Undoc. 0CBH, 31H
            RLA
            ADC     HL,HL
            SBC     HL,DE
            JR      NC,$+4
            ADD     HL,DE
            DEC     C
            DJNZ    DL1

            LD      D,A         ; DE = HL / DE
            LD      E,C
            RET

BOARD
            .DB     00, 00, 00, 00
            .DB     00, 00, 00, 00
            .DB     00, 00, 00, 00
            .DB     00, 00, 00, 00

SPACER      .DB     "       ", '$'

LABELPTR:   .DW     LABELS
            .DW     LABELS + 8
            .DW     LABELS + 16
            .DW     LABELS + 24
            .DW     LABELS + 32
            .DW     LABELS + 40
            .DW     LABELS + 48
            .DW     LABELS + 56
            .DW     LABELS + 64
            .DW     LABELS + 72
            .DW     LABELS + 80
            .DW     LABELS + 88
            .DW     LABELS + 96
            .DW     LABELS + 104

LABELS      .DB     "   ", 0F9H, "   ", EOS
            .DB     "   2   ", EOS
            .DB     "   4   ", EOS
            .DB     "   8   ", EOS
            .DB     "   16  ", EOS
            .DB     "   32  ", EOS
            .DB     "   64  ", EOS
            .DB     "  128  ", EOS
            .DB     "  256  ", EOS
            .DB     "  512  ", EOS
            .DB     " 1024  ", EOS
            .DB     " 2048  ", EOS
            .DB     " 4096  ", EOS
            .DB     " 8192  ", EOS

COLORPTR:   .DW     COLORS
            .DW     COLORS + 9
            .DW     COLORS + 18
            .DW     COLORS + 27
            .DW     COLORS + 36
            .DW     COLORS + 45
            .DW     COLORS + 54
            .DW     COLORS + 63
            .DW     COLORS + 72
            .DW     COLORS + 81
            .DW     COLORS + 90
            .DW     COLORS + 99
            .DW     COLORS + 108
            .DW     COLORS + 117

COLORS      .DB     1BH, "[40;37m", EOS  ; 0
            .DB     1BH, "[44;37m", EOS  ; 2
            .DB     1BH, "[46;37m", EOS  ; 4
            .DB     1BH, "[42;37m", EOS  ; 8
            .DB     1BH, "[43;30m", EOS  ; 16
            .DB     1BH, "[45;37m", EOS  ; 32
            .DB     1BH, "[41;37m", EOS  ; 64
            .DB     1BH, "[47;30m", EOS  ; 128
            .DB     1BH, "[44;37m", EOS  ; 256
            .DB     1BH, "[46;37m", EOS  ; 512
            .DB     1BH, "[42;37m", EOS  ; 1024
            .DB     1BH, "[43;30m", EOS  ; 2048
            .DB     1BH, "[45;37m", EOS  ; 4096
            .DB     1BH, "[41;37m", EOS  ; 8192

POINTS      .DW     0000H
            .DW     0000H
            .DW     0004H
            .DW     0008H
            .DW     0016H
            .DW     0032H
            .DW     0064H
            .DW     0128H
            .DW     0256H
            .DW     0512H
            .DW     1024H
            .DW     2048H
            .DW     4096H
            .DW     8192H

INIT:       .DB     12, 1BH, "[?25l", EOS
TERM:       .DB     1BH, "[?25h"
RESET:      .DB     1BH, "[0m", EOS

ADVANCE:    .DB     1BH, "[28C", EOS

TOPBORDER   .DB     0DCH
            .DB     0DCH, 0DCH, 0DCH, 0DCH, 0DCH, 0DCH, 0DCH
            .DB     0DCH, 0DCH, 0DCH, 0DCH, 0DCH, 0DCH, 0DCH
            .DB     0DCH, 0DCH, 0DCH, 0DCH, 0DCH, 0DCH, 0DCH
            .DB     0DCH, 0DCH, 0DCH, 0DCH, 0DCH, 0DCH, 0DCH
            .DB     0DCH, EOS

BTMBORDER   .DB     0DFH
            .DB     0DFH, 0DFH, 0DFH, 0DFH, 0DFH, 0DFH, 0DFH
            .DB     0DFH, 0DFH, 0DFH, 0DFH, 0DFH, 0DFH, 0DFH
            .DB     0DFH, 0DFH, 0DFH, 0DFH, 0DFH, 0DFH, 0DFH
            .DB     0DFH, 0DFH, 0DFH, 0DFH, 0DFH, 0DFH, 0DFH
            .DB     0DFH, EOS

MSG1:       .DB     1BH, "[0m",
            .DB     "        ", 11H, ",", 1EH, ",", 10H, ",", 1FH, " or q        "
            .DB     EOS
MSG2:       .DB     1BH, "[0m"
            .DB     "        QUIT? (y/n)         ",
            .DB     EOS
MSG3:       .DB     1BH, "[0m",
            .DB     "         GAME OVER!         "
            .DB     BEL, CR, LF, EOS
MSG4:       .DB     1BH, "[0m",
            .DB     "2048                     pts"
            .DB     EOS

; variables

XPOS:       .DB     0
YPOS:       .DB     0
BOARDPTR:   .DW     0
MOVED:      .DB     0
RESULT:     .DB     0
SCORE       .DB     00H, 00H, 00H, 00H
SCORESTR    .DB     1BH, "[0m        $"

            .END

