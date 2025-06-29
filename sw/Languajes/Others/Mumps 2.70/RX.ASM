

;       ** *********************************************
;       *
;       *       FILE RECEIVE UTILITY VN 2.2 30 MAR 79
;       *
;       * THIS CODE IS ATTRIBUTED TO A UTILITY CREATED
;       * BY IMSAI. IT SEEMS A FITTING MEMORIAL  THAT 
;       * THIS CODE SHOULD LIVE ON EVEN AFTER THE UNTIMELY
;       * DEMISE OF IMSAI
;       *
;       ************************************************
;
;       *-----------------------------------------------
;       * IN ORDER TO CUSTOMIZE THIS UTILITY CHANGE THE
;       * EQUATES FOR :-
;       *        STAT,DATA,DRDY,TBE
;       *-----------------------------------------------
;
;       STANDARD CP/M ADRESSES

FALSE   EQU     0
TRUE    EQU     NOT FALSE
Z2      EQU     FALSE
C8000   EQU     FALSE
TRS80	EQU	TRUE		; TRS80 MOD II - PORT B
;
BOOT    EQU     0               ; WARM BOOT ENTRY
BDOS    EQU     5               ; BDOS ENTRY
PRINT   EQU     9               ; BDOS PRINT BUFE FUNCTION

TBASE   EQU     100H            ; TRANSIENT PROGRAM AREA
CCP$LN  EQU     80H             ; DEFAULT FILE BUFFER & COMMAND AREA

; [[[[[[[[[[[ CHANGE THESE EQUATES ]]]]]]]]]]]]]
;       I/O EQUATES
        IF      Z2
STAT    EQU     50H     ;STATUS PORT
DATA    EQU     51H     ;DATA PORT
DRDY    EQU     40H     ;DATA READY
TBE     EQU     80H     ;TRANSMITTER BUFFER EMPTY
        ENDIF
        IF      C8000
STAT	EQU	12H	;STATUS
DATA	EQU	10H	;DATA
DRDY	EQU	1	;DATA READY
TBE	EQU	4	;TRANSMITTER BUFFER EMPTY
        ENDIF
	IF	TRS80
STAT	EQU	0F7H	;STATUS PORT B
DATA	EQU	0F5H	;DATA PORT B
DRDY	EQU	1	;DATA READY (SIO)
TBE	EQU	4	;TRANS BUFFER EMPTY (SIO)
	ENDIF	
;

;       DISK RELATED RQUATES

OPEN    EQU     15              ; OPEN FILE
MAKE    EQU     22              ; CREATE FILE
SETBUF  EQU     26              ; SET DISK BUFFER
READ    EQU     20              ; READ DISK RECORD
WRITE   EQU     21              ; WRITE DISK RECORD
DELETE  EQU     19              ; DELETE FILE
CLOSE   EQU     16              ; SEARCH FOR FILE
SEARCH  EQU     17              ; SEARCH FOR FILE
FLLFCB  EQU     36              ; LOAD FILE CONTROL BLOCK
UNMOUNT EQU     13              ; REST DISK SYSTEM   
DRVIN   EQU     31              ; CONVERT ASCII DRIVE NAME TO INTERNAL

CR      EQU     0DH             ; CARRIAGE RETURN
LF      EQU     0AH             ; LINE FEED

        *************************************
        *       MAIN PROGRAM
        **************************************

        ORG     TBASE
	IF	C8000
	MVI	A,1	;DISABLE MODEM INTERRUPTS
	OUT	STAT
	MVI	A,0	;WRITE 0 TO WRITE REG 1
	OUT	STAT
	ENDIF

        CALL    SIGN            ; SIGNON
        CALL    NORM            ; SET UP STACK
        CALL    SYNC            ; ESTABLISH COMMUNICATION LINK

ANOTHER:        CALL    CLEAR   ; UNMOUNT ALL DISKS
MAIN:   CALL    RECEIVE  ; GET A COMMAND OFF THE DATA LINK
        STA     COMMAND  ; SAVE IT
        CPI     'S'             ; IS IT ANOTHER SYNC??
        JZ      RESYNC          ; YES
        CPI     'F'             ; TEST FOR FILE NAME
        JZ      FILENM          ; 
        CPI     'O'             ; TEST FOR OPEN COMMAND
        JZ      OPENFL          ; 
        CPI     'R'             ; TEST FOR DATA RECORD
        JZ      DATREC
        CPI     'W'             ; TEST FOR WRITE RECORD
        JZ      WRITER          ; 
        CPI     'X'             ; TEST FOR END OF FILE
        JZ      EOF
        CPI     'Z'             ; TEST FOR SIGN OFF
        JZ      EXIT
        JMP     MAIN            ; IGNORE, WAIT FOR VALID

        *******************************
        *       SIGNON MESSAGE  
        ********************************

SIGN:
        LXI     D,SIGNON
        MVI     C,PRINT
        CALL    BDOS
        RET

        *******************************
        *       INITIAL SETUP
        ********************************

NORM:   
        POP     D               ; GET REURN ADDRESS OFF STACK
        LXI     H,0             ; LOAD OLD STACK-
        DAD     SP              ; POINTER INTO HL
        SHLD    OLDSTK          ; SAVE IT
        LXI     SP,STACK        ; SET NEW STACK POINTER
        XCHG                    ; HL    = RETURN ADDRESS
        PCHL                    ; RETURN

        **************************************
        *       SYNCRONIZE
        ***********************************

RESYNC:
        CALL    SYNC2
        JMP     ANOTHER         ; THIS MUST BE A NEW,

SYNC:   
        CALL    RECEIVE  ; WAIT FOR CHR.
        STA     COMMAND  ; SAVE FOR ACK
SYNC2:
        CALL    ACK             ; ACK BY SENDING BACK
        LDA     COMMAND
        CPI     'S'             ; IS IT SYNC COMMAND??
        JNZ     SYNC            ; IF NOT, TRY AGAIN
        RET                     ; YES, WAS

        **********************************
        *       FILE NAME
        *****************************

FILENM: 
        CALL    ACK             ; ACK COMMAND
        LXI     B,FCB           ; WHERE TO PUT FILE NAME
        MVI     D,16            ; NUMBER OF CHARS EXPECTED (REALLY ????)
        CALL    GET             ; GET RECORD & SEND ERR CHK
        JMP     MAIN            ; DONE

        *********************************
        *       OPEN FILE
        **********************************

OPENFL:
        CALL    SEARF           ; SEE IF IT ALREADY EXISTS
        CPI     0FFH
        JNZ     EXISTS          ; ERR IF SO
        CALL    KILL            ; EREASE ANY AND ALL EXTENTS
        CALL    CREATE          ; MAKE THE FILE
        CPI     0FFH
        JZ      DSKERR          ; BRANCH ON DISK ERROR
        CALL    ACK             ; ACK THE SUCCESSFULL OPEN
        JMP     MAIN


KILL:   
        MVI     C,DELETE
        LXI     D,FCB
        CALL    BDOS
        RET


        ************************************
        *       DATA RECORD COMING
        ******************************
DATREC:
        CALL    PRREC           ; FIRST INFORM
        CALL    ACK             ; SEND ACK
        LXI     B,SECTOR                ; POINTER TO BUFFER ADDRESS
        MVI     D,128                   ; NUMBER OF CHARS EXPECTED
        CALL    GET             ; LOAD RECORD
        JMP     MAIN

        **********************************
        *       WRITE   RECORD
        ******************************

WRITER: 
        CALL    WRREC           ; WRITE TO FILE
        JNZ     BADWR           ; BRANCH ON ERROR
        CALL    ACK             ; ACKNOWLEDGE
        JMP     MAIN

WRREC:
        MVI     C,WRITE
        LXI     D,FCB
        CALL    BDOS
        ORA     A               ; SET FLAGS
        RET


        **********************************
        *       CLOSE FILE
        **********************************

EOF:    
        LXI     D,EOFMSG        ; O/P MESSAGE
        MVI     C,PRINT
        CALL    BDOS
        MVI     A,0
        STA     COUNTR
        STA     COUNTR+1
        STA     COUNTR+2
        CALL    CLSFLE          ; ATTEMPT TO CLOSE
        JZ      CANTCL          ; ERROR
        CALL    ACK             ; ACK IT
        CALL    CLEAR           ; UNMOUNT ALL DISKS
        JMP     MAIN

        **************************************
        *       LOAD BUFFER FROM LINK
        **************************************

GET:    
        LXI     H,ERRCD  ; CLEAR ERROR DETECTION CHR.
        MVI     M,0
        CALL    GETBUF          ; LOAD A BUFFER FULL CHARACTER
        CALL    SENDCK          ; SEND A CHECK CHARACTER
        RET

GETBUF:
        CALL    RECEIVE  ; LOAD A CHARACTER
        MOV     E,A
        STAX    B               ; STORE IN BUFFER POINTED TO BY B
        ADD     M               ; UPDATE ERROR CHECK CHARACTER
        MOV     M,A
        INX     B               ; UPDATE POINTER
        DCR     D               ; DECREMENT COUNTER
        JNZ     GETBUF
        RET


SENDCK: 
        MOV     E,M             ; GET ERROR CHECK CHARACTER
        CALL    SEND            ; TX IT
        RET


        ***********************************
        *       DISK ACCESS SUBROUTINES

SEARF:
        MVI     C,SEARCH        ; SEARC DIRECTORY FOR FILE
        LXI     D,FCB
        CALL    BDOS
        CPI     0FFH            ; CECKIF ERROR
        RET



CREATE:
        MVI     C,MAKE
        LXI     D,FCB
        CALL    BDOS
        CPI     0FFH
        RET



CLSFLE:
        MVI     C,CLOSE  ; CLOSE THE FILE
        LXI     D,FCB
        CALL    BDOS
        CPI     0FFH
        RET

        ***********************************************
        
        *       CLEAR STAUS OF ALL DISKS
        ***********************************************
EMPFCB:
        DB      0,'           '
        DW      0,0,0,0,0,0,0,0,0,0,0,0
;
CLEAR:
        
        MVI     C,UNMOUNT
        MVI     E,255           ; HAVE SYSTEM UNMOUNT ALL DISKS
        CALL    BDOS

        LXI     D,FCB           ;RESET FCB TO EMPTY IMAGE
        LXI     H,EMPFCB
        MVI     B,36
CLEARL:
        MOV     A,M
        STAX    D
        INX     H
        INX     D
        DCR     B
        JNZ     CLEARL
                                ; SET DISK WRITE BUFFER
        MVI     C,SETBUF
        LXI     D,SECTOR
        CALL    BDOS
        RET                     ; RETURN

        ******************************************
        *       ECHO LAST COMMAND DOWN THE LINE
        *******************************************

ACK:
        LDA     COMMAND  ; GET LAST COMMAND
        MOV     E,A             ; TX IT DOWN THE LINE
        CALL    SEND            ; AS THE ACK FOR EXECUTED
        RET                     ; COMMAND

        **********************************************
        *       SEND CHARACTER DOWN LINE
        **********************************************

SEND:   
        IN      STAT            ; GET STATUS
        ANI     TBE             ; MASK OUT TX READY BIT
        JZ      SEND            ; NOT READY
        MOV     A,E             ; GET CHARACTER TO TX
        OUT     DATA            ; OUTPUT CHARACTER
        RET

        *************************************************
        *       PRESENT RECORD NUMBER ON SCREEN         *
        *************************************************

PRREC:
        CALL    UPCUNT          ; FIRST UPDATE COUNT
        CALL    PRNMB           ; THEN PRESENT NUMBER
        LXI     D,RECNO         ; DISPLAY FOR OPERATOR
        MVI     C,PRINT
        CALL    BDOS
        RET

UPCUNT:
        LXI     H,COUNTR        ; POINT TO COUNTER FIELD
        MVI     C,3             ; SET TO DO 3*2=6 DIGITS
        CALL    NEXDEC
        RET

PRNMB:
        LXI     H,COUNTF        ; POINTER TO FIELD WHERE TO STORE
        LXI     D,COUNTR+2      ; ACTUAL COUNTER (LAST BYTE OF 3)
        MVI     B,3             ; SET TO DISPLAY 3*2=6 DECIMAL DIGITS
PRREN:
        LDAX    D               ; GET NUMBER
        PUSH    B               ; SAVE COUNTER
        CALL    CONASC          ; CONVERT TO ASCII
        MOV     A,B
        MOV     M,A
        INX     H
        MOV     A,C
        MOV     M,A
        POP     B
        DCX     D               ; POINT TO LESS SIGNIFICANT DIGIT
        INX     H               ; NEXT CHARACTER FIELD
        DCR     B               ; DECREMENT COUNTER
        JNZ     PRREN           ; DO NEXT
        RET

NEXDEC:
        MVI     B,1             ; UPDATE WITH ONE
        MOV     A,M             ; GET LEAST SIGNIFICANT DIGIT
        ADD     B
        MVI     B,0             ; PREPARE FOR FURTHER CARRY FLOW
CUNTUP:
        DAA                     ; DO DECIMAL ADJUST
        JNC     CUNT1           ; IF OVERFLOW (CARRY)
        MVI     A,0             ; RESET DIGIT
CUNT1:
        MOV     M,A             ; STORE RESULT
        INX     H               ; NEXT DIGITS
        MOV     A,M             ; GET MORE SIGNIFICANT DIGIT
        ADC     B               ; ADD IN CARRY
        DCR     C               ; GET COUNT, SEE IF LAST
        JNZ     CUNTUP          ; NO, DO ONE MORE
        RET
        
CONASC:
        CALL    CONAS1          ; SMART METHOD
        MOV     B,C
CONAS1:
        RRC
        RRC
        RRC
        RRC                     ; SHIFT 4 BITS AROUND (DECIMAL DIGITS)
        PUSH    PSW             ; SAVE A
        ANI     0FH             ; LOWER 4BITS
        ADI     030H            ; MAKE ASCII DIGIT
        MOV     C,A             ; RESULT IN C
        POP     PSW             ; RESTORE A
        RET


        **********************************************
        *       RECEIVE CHARACTER FROM LINE
        *********************************************

RECEIVE:
        IN      STAT            ; CHECK STATUS
        ANI     DRDY            ; CHECK RX READY BIT
        JZ      RECEIVE  ; NOT READY
        IN      DATA            ; GET CHARACTER
        RET                     ; AND RETURN



        *******************************
        *       ERROR ROUTINES
        *******************************

DSKERR: 
        MVI     E,'G'           ; BAD DISK WRITE
        JMP     ERROR

CANTCL: 
        MVI     E,'C'           ; ERROR IN CLOSING
        JMP     ERROR


BADWR:
        MVI     E,'G'           ; BAD WRITE
        JMP     ERROR


EXISTS:
        MVI     E,'H'           ; FILE ALREADY EXISTS
        JMP     ERROR


ERROR:
        CALL    SEND            ; TX THE ERROR CODE
        JMP     MAIN            ; RETURN TO MAIN LOOP


        ********************************
        *       EXIT ROUTINE
        **********************************

EXIT:   
	IF	C8000
	MVI	A,1	;RE-ENABLE INTERRUPTS
	OUT	STAT
	MVI	A,1CH
	OUT	STAT
	ENDIF

        LXI     D,TRMMSG
        MVI     C,PRINT
        CALL    BDOS            ; ISSUE A TERMINATION MESSAGE
        LHLD    OLDSTK          ; LOAD OLD STACK POINTER IN HL
        SPHL                    ; RESTORE STACK POINTER
        RET                     ; BACK TO CCP AGAIN


        *************************************
        *       VARIABLE STORAGE
        **************************************

SIGNON: DB      ' FILE RECEIVE UTILITY  VERS 2.2'
        IF      Z2
        DB      ' FOR CROMEMCO Z2'
        ENDIF
	IF	C8000
	DB	' FOR ONYX MU '
	ENDIF
        DB      CR,LF,'$'
COUNTR: DB      0,0,0           ; 3 BYTE COUNTER
RECNO:  DB      ' REC. NO: '
COUNTF: DB      '000000',CR,'$'
EOFMSG: DB      CR,LF,' END-OF-FILE RECEIVED',CR,LF,'$'
TRMMSG: DB      CR,LF,' LINK TERMINATED',CR,LF,'$'
COMMAND:        DS      1
ERRCD:          DS      1       ; ERROR DETECTION CODE
SECTOR:  DS     128     ; DISK BUFFER
PARAM:          DW      CCPLN+2 ; PARAMETER BLOCK FOR DRVIN.    POINT TO TEXT
                                ; CONTAINING NAME, BYTE 0 OF FCB WILL BE SET
FCB:            DS      36      ; FILE CONTROL BLOCK
OLDSTK:  DS     2       ; STACK POINTER ON ENTRY
STACK:  EQU     $+40            ; NEW STACK
        END
