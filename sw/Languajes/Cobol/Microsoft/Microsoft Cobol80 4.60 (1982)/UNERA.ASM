;       PROGRAM TO RECOVER ERASED FILE

BOOT    EQU     0       ;CP/M WARM BOOT JUMP VECTOR
BDOS    EQU     5       ;CP/M BDOS CALL JUMP VECTOR
FCB     EQU     BOOT+5CH ;DEFAULT FILE CONTROL BLOCK

        ORG     100H    ;START AT BASE OF TPA
        JMP     STACK   ;GET AROUND THE STACK

BLN     DB      48      ;48 IF CP/M 2.2, 42 IF CP/M 1.4

HMSG    DB      04
        DT      'UNERASE VERSION 1.0 (1/1/82) (CP/M VERSION $'
MSG22   DT      '2.2)'
        DB      13,10,'$'
MSG14   DT      '1.4)'
        DB      13,10,'$'

        ORG     200H
STACK:  LXI     SP,STACK        ;GET STACK POINTER
        CALL    HELLO           ;SIGN ON MESSAGE
        CALL    PCHECK          ;CHECK PARAMETERS
        LXI     D,WARN
        CALL    PRINT
        CALL    AMBIG           ;AMBIGUOUS FILE NAMES?
        CALL    TRYFIX          ;DO THE RECOVERY
        CALL    BYE             ;SIGN OFF MESSAGE
        JMP     BOOT            ;RETURN TO CP/M

;  SAY WHO WE ARE
HELLO:  LXI     D,HMSG          ;POINT TO HELLO MESSAGE
        CALL    PRINT
        RET

;  CHECK FOR VALID PARAMETERS AND SAY WHICH CP/M VERSION
PCHECK: CALL    FCBCHK          ;MAKE SURE FILE SPECIFIED
        CALL    CPMCHK          ;ESTABLISH CP/M VERSION
        RET

;  LOOKS THROUGH THE DIRECTORY TRYING TO MATCH FCB FILENAME
TRYFIX: CALL    NXTSECT         ;GET A DIRECTORY SECTOR
        RZ                      ;RETURNS ZERO FLAG IF NO MORE
        CALL    CHKENT          ;CHECK IT OUT AND MAYBE FIX
        JMP     TRYFIX          ;KEEP IT UP TILL DONE

;  SIGN OFF AND RESET SYSTEM
BYE:    MVI     C,13            ;SYSTEM RESET
        CALL    BDOS
        LDA     FIXCNT          ;CHECK FOR ACTIVITY
        ORA     A
        JZ      NOFIND          ;SAY NONE FOUND
        LXI     D,BMSG          ;WARN FOUND
        CALL    PRINT
        RET
NOFIND: LXI     D,NFMSG
        CALL    PRINT
        RET

;  MAKES SURE A LEGAL FILENAME IS SPECIFIED
FCBCHK: LDA     FCB             ;GET DRIVE SPECIFICATION
        ORA     A               ;SEE IF DEFAULT
        JNZ     FCBCK1          ;NO, GO CHECK FILENAME
        MVI     C,25            ;ASK FOR CURRENT DRIVE
        CALL    BDOS
        INR     A               ;OFFSET FOR NEXT INSTR
FCBCK1: DCR     A               ;CURRENT DRIVE NUMBER
        STA     FCB             ;SAVE IT
        LDA     FCB+1           ;GET 1ST BYTE OF FILENAME
        CPI     ' '             ;MAKE SURE IT IS NON-BLANK
        RNC                     ;OK - KEEP GOING
;  IF NO FILE NAME IS SPECIFIED, ABORT WITH NOTICE
        LXI     D,NOFMSG
        CALL    PRINT
        JMP     BOOT            ;ABORT

;  CHECKS FOR CP/M VERSION AND SETS THINGS
CPMCHK: LXI     D,80H           ;SET DMA TO TBUFF
        MVI     C,26
        CALL    BDOS
        MVI     C,12            ;VERSION NUMBER REQUEST
        CALL    BDOS
        CPI     20H             ;EARLIER THAN 2.2?
        MVI     A,42            ;ASSUME 1.4
        LXI     D,MSG14         ;POINT TO 1.4 MSG
        CNC     CPM22           ;IF 2.2 GO SET THINGS
        STA     BLN             ;SET THE MOVE LENGTH
        CALL    PRINT
        CALL    GETBIOS         ;ESTABLISH BIOS JUMP VECTOR
;  SELECT DISK AND SETUP DISK PARAM HEADER
        LDA     FCB             ;GET THE DISK
        MOV     C,A
        MVI     B,0
        CALL    SELDSK          ;MAKE SURE DRIVE IS
        MOV     A,H             ;SELECTED
        ORA     L
        JZ      ILDISK
        LDA     BLN
        CPI     48              ;IF CP/M 1.4 SKIP REST
        RC
        MOV     E,M             ;GET THE ADDRESS
        INX     H               ; OF THE XLT0
        MOV     D,M
        XCHG
        SHLD    DPH             ;SAVE THE ADDRESS
        RET

;  IF CP/M 2.2 DETERMINE NUMBER OF DIRECTORY ENTRIES ALSO
CPM22:  MVI     C,31            ;GET DISK PARMS ADDRESS
        CALL    BDOS            ;DPB ADDR IN HL ON RET
        LXI     D,7             ;OFFSET TO DRM
        DAD     D
        MOV     E,M             ;GET NUMBER OF
        INX     H               ; DIRECTORY ENTRIES
        MOV     D,M
        XCHG
        INX     H               ;ACCOUNT FOR - 1
        CALL    SHFTHL2         ;SHIFT HL RIGHT 2
        MOV     A,L             ;GET NUMBER OF SECTORS
        STA     DIRMAX          ;SAVE NUMB DIR SECS
        LXI     H,5             ;NOW POINT TO SYSTEM
        DAD     D               ; TRACK OFFSET
        MOV     A,M             ;PICK UP NUMBER OF
        STA     TRACK           ;SAVE TRACK OFFSET
        MVI     A,48            SET MOVE LENGTH
        LXI     D,MSG22         ;POINT TO 2.2 MSG
        RET

;  GET BIOS JUMP VECTOR FOR EASY REFERENCE
GETBIOS:LHLD    BOOT+1          ;POINTS TO BIOS JUMP TABLE+3
        LXI     D,WBOOT         ;WHERE WE WILL KEEP A COPY
        LDA     BLN             ;NUMBER OF BYTES TO MOVE
        MOV     B,A             ;MOVE LIKES IT IN REG B
        CALL    MOVE            ;MOVE THE TABLE
        RET

;  READS NEXT SECTOR (GROUP OF 4 DIRECTORY ENTRIES)
;  RETURNS WITH ZERO FLAG SET IF NO MORE
NXTSECT:LDA     DIRMAX          ;SEE IF MORE SECTORS
        ORA     A
        RZ                      ;RETURNS ZERO FLAG IF NO MORE
        LDA     TRACK           ;SET TRACK
        MOV     C,A
        MVI     B,0
        CALL    SETTRK
        LDA     SECTOR          ;SET SECTOR
        MOV     C,A
        CALL    TRANSLT
        MVI     B,0
        CALL    SETSEC
        CALL    READ            ;READ A SECTOR
        ANI     1
        XRI     1               ;REVERSE SENSE OF ERROR FLAG
        RET                     ;RETURNS WITH ZERO FLAG SET
                                ;  IF BAD READ

;  CHECKS THE CURRENT 4 DIRECTORY ENTRIES AGAINST ARGUMENT
;  IF MATCH, REWRITES SECTOR WITH REACTIVATED FIRST BYTES
CHKENT: XRA     A               ;ASSUME NO REWRITE
        STA     REWRT
        MVI     B,4             ;NUMBER OF ENTRIES PER SECTOR
        LXI     H,80H           ;BEGINNING OF BUFFER
CKLUP:  MOV     A,M
        CPI     0E5H            ;CHECK FOR UNUSED
        JNZ     CKINC
        PUSH    H               ;SAVE BEGINNING ADDR
        CALL    COMPAR          ;COMPARE WITH ARGUMENT
        POP     H
        JNZ     CKINC           ;NO MATCH
        MVI     M,0             ;RESET FLAG FOR ACTIVE
        MVI     A,0FH           ;SAY NEEDS REWRITE
        STA     REWRT
        LDA     FIXCNT

        INR     A               ;BUMP COUNT OF CHANGES
        STA     FIXCNT
CKINC:  LXI     D,32            ;LENGTH OF ENTRY
        DAD     D
        DCR     B
        JNZ     CKLUP
        LDA     REWRT           ;SEE IF NEED REWRITE
        ORA     A
        JZ      CKDONE          ;NO - DONE
;  WRITE THE DIRECTORY SECORT BACK TO THE DISK
        LDA     TRACK           ;SET TRACK
        MOV     C,A
        MVI     B,0
        CALL    SETTRK
        LDA     SECTOR          ;SET SECTOR
        MOV     C,A
        CALL    TRANSLT
        MVI     B,0
        CALL    SETSEC
        CALL    WRITE           ;WRITE THE SECTOR BACK
        ORA     A               ;ABORT IF ERROR
        JNZ     ERRWRT
CKDONE  LDA     DIRMAX
        DCR     A               ;REDUCE SECTORS LEFT
        STA     DIRMAX
        LDA     SECTOR          ;POINT TO NEXT SECTOR
        INR     A
        STA     SECTOR
        RET

;  COMPARE 11 BYTES OF DIRECTORY ENTRY AGAINST ARGUMENT
COMPAR: INX     H
        LXI     D,FCB+1
        XCHG
        MVI     C,11
CMPR1:  MOV     A,M             ;SEE IF ANY
        CPI     '?'             ;WILD CARD (?)
        JZ      CMPR2
        LDAX    D               ;GET DIR ENT CHAR
        ANI     7FH             ;STRIP ANY FLAGS
        CMP     M
        RNZ                     ;DONE IF NO MATCH
CMPR2:  INX     D
        INX     H               ;BUMP TO NEXT CHAR
        DCR     C
        JNZ     CMPR1           ;LOOP FOR 11 CHAR
        RET                     ;RETURNS ZERO FLAG SET FOR MATCH

;  SET UP FOR AMBIGUOUS FILE NAMES ?
AMBIG:  LXI     H,FCB+1         ;SET FOR
        MVI     C,8             ;PRIMARY
        MVI     B,2             ;FILE NAME
AMBG1:  LDA     AFN
        ORA     A
        JNZ     AMBG2
        MOV     A,M             ;SEE IF AN
        CPI     '*'             ;ASTERISK
        JNZ     AMBG3
AMBG2:  LDA     AFN
        INR     A
        STA     AFN
        MVI     A,'?'
        MVI     M,A
AMBG3:  INX     H
        DCR     C
        JNZ     AMBG1
        DCR     B
        RZ
        MVI     C,3             ;SET UP FOR
        MVI     A,0             ;SECONDARY
        STA     AFN             ;FILE NAME
        JMP     AMBG1

;  GENERAL PURPOSE MOVE ROUTINE
;   FROM (HL) TO (DE) FOR COUNT OF B
MOVE:   MOV     A,M             ;GET A BYTE
        STAX    D               ;PUT A BYTE
        INX     D               ;INCREMENT TO NEXT
        INX     H
        DCR     B               ;COUNT DOWN
        JNZ     MOVE
        RET

;  SHIFT REGS HL RIGHT 2 BITS LOGICAL
SHFTHL2:CALL    SHFTHL
SHFTHL: XRA     A               ;CLEAR CARRY
        MOV     A,H
        RAR                     ;SHIFTED BIT IN CARRY
        MOV     H,A
        MOV     A,L
        RAR
        MOV     L,A
        RET

;  GENERAL PRINT ROUTINE ENTER WITH REG DE POINTING TO MSG
;   RETURNS TO CALLER FROM BDOS
PRINT:  MVI     C,9             ;BDOS PRINT STRING COMMAND
        JMP     BDOS            ;GO DO THE PRINT

;  SPECIFIED AN ILLEGAL DISK DRIVE - ABORT
ILDISK: LXI     D,ILMSG
        CALL    PRINT
        JMP     BOOT            ;ABORT

;  ERROR OCCURED DURING DISK WRITE - ABORT
ERRWRT: LXI     D,WMSG
        CALL    PRINT
        JMP     BOOT            ;ABORT

;  TRANSLATE REG C FROM LOGICAL TO PHYSICAL SECTOR NUMBER
TRANSLT:LHLD    DPH             ;GET ADDRESS OF XLT0
        XCHG
        CALL    SECTRAN
        MOV     C,L
        RET

;   THIS IS THE WORKING COPY OF THE BIOS JUMP TABLE
WBOOT   DS      3
CONST   DS      3
CONIN   DS      3
CONOUT  DS      3
LIST    DS      3
PUNCH   DS      3
READER  DS      3
HOME    DS      3
SELDSK  DS      3
SETTRK  DS      3
SETSEC  DS      3
SETDMA  DS      3
READ    DS      3
WRITE   DS      3
LISTST  DS      3
SECTRAN:JMP     STRAN

;  SECTOR TRANSLATION ROUTINE FOR
;  CP/M VERSIONS EARLIER THAN 2.0
;  REG DE CONTAINS ADDRESS OF XLT0
;  REG BC CONTAINS THE LOGICAL SECTOR NUMBER

;  RETURNS PHYSICAL SECTOR NUMBER IN REG HL
STRAN:  MVI     B,0
        XCHG
        DAD     B
        MOV     L,M
        RET

;  ADDRESS OF TRANSLATE TABLE
DPH     DW      XLT0
        DS      14

;  THIS IS THE STANDARD TRANSLATE TABLE
XLT0    DB      1,7,13,19,25,5,11,17,23,3,9,15,21
        DB      2,8,14,20,26,6,12,18,24,4,10,16,22

;  WORKING STORAGE FOLLOWS

DIRMAX  DB      16      ;NUMBER OF SECTORS IN DIRECTORY =
                        ;MAXIMUM NUMBER OF DIRECTORY ENTRIES
                        ; DIVIDED BY 4 (ENTRIES PER SECTOR)

TRACK   DB      2       ;TRACK NUMBER OF DIRECTORY
SECTOR  DB      0       ;CURRENT SECTOR NUMBER

FIXCNT  DB      0       ;NUMBER OF ENTRIES FIXED
REWRT   DB      0       ;REWRITE FLAG 0=NO, F=YES
AFN     DB      0       ;AMBIGUOUS FILE NAME

WMSG    DB      10,13
        DT      'ERROR OCCURED DURING FILE WRITE - ABORT$'
ILMSG   DB      10,13
        DT      'SPECIFIED AN ILLEGAL DISK DRIVE - ABORT$'
BMSG    DB      10,13
        DT      'RECOVERED - PLEASE DOUBLE CHECK BEFORE USING$'
NOFMSG  DB      10,13
        DT      'NO FILE NAME SPECIFIED - ABORT$'
NFMSG   DB      10,13
        DT      'FILE NOT FOUND$'
WARN    DB      13,10
        DT      '(Caution is required if recovering ambiguous file names!!)$'
