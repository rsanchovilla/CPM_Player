
bdos equ $5

org $100

     jp Start

     NasSysRTLVersion: defb 1,0 ; Version de la emulacion de NasSys
     BlsPasRTLVersion: defb 1,2 ; Version de la emulacion de NasSys

; ********** INICIO del area de Parcheo ***************

     defb "PATCHZN", 0, 0
; Terminal VT52 screen sequences
VT52_TermName: defb "VT52", 0,0,0,0
               defb 0,0,0,0,0,0,0,0
VT52_CLS  defb 27, '*', 27, 'E', 27, 'H', 0, 0   ; el ESC * es una NAPA para el CPMPlayer que haya CLS con VT52/VT100
VT52_HOME defb 27, 'H', 0,0  ,0,0,0,0 ; Home
VT52_CURSOR_POS1 defb 27, 'Y', 0,0 ,0,0,0,0 ; At$(x, y) = esc$ + "y" + Chr$(31 + y) + Chr$(31 + x)
VT52_CURSOR_POS_YX defb 1; =1 -> orden es Y y luego X, =0 es X y luego Y,=2 es como el 1, pero se envian las coord como string ascii
VT52_CURSOR_POS_OFFSET defb 32; -> offset que se suma a la coord
VT52_CURSOR_POS2 defb 0,0,0,0 ,0,0,0,0 ; escape entre cada coord del cursor
VT52_CURSOR_POS3 defb 0,0,0,0 ,0,0,0,0; despues de las coord del cursor
VT52_CURSOR_ON defb 27, 'e', 0,0 ,0,0,0,0 ;
VT52_CURSOR_OFF defb 27, 'f', 0,0 ,0,0,0,0 ;

; Keyboard translation to NasSys keyboard codes
KBD_TranlationTable:    defb $7f, $08   ; Amstrad PCW: BackSpace key 7F translated to NasSys BackSpace 08
                        defb $01, $11   ; Left
                        defb $1F, $13   ; Up
                        defb $1E, $14   ; Down
                        defb $06, $12   ; Right
                        defb $02, $06   ; Ctrl-F (FIND) Como en PCW Ctrl-F es right, usar Ctrl-B para buscar

                        defb 0, 0, 0, 0, 0, 0; End of translation table

; Llamadas al servicio del Sistema Operativo

BDOS_ExitToOS:  jp WBOOT  ; end program, return to CP/M
BDOS_PrtChar:   jp CONOUT ; send to screen char in RegA to console
BDOS_ReadKey:   jp CONIN  ; read key from console keyboard, return it in RegA

; ********** FIN del area de Parcheo ***************

VT52_CRLF defb 13,10,0,0     ,0,0,0,0
CtrlBreak_Char          equ  $03;       ; Caracter para abortar la ejecucion del programa (03 = Control-C)

WBOOT:  ; end program, return to CP/M
        call 0
        ret
CONOUT:  ; send to screen char in RegA
        ld e,a
        ld c,2  ; Console Output
        call bdos
        ret
CONIN:  ; read key at keyboard, return it in RegA
        LD      C,6       ; Direct Console I/O
        LD      E,$FF
        Call bdos
        ret

; variables de control

SCAL_LogFlag equ 1
SCAL_LogFlag_Pause equ 1        ; 1=hay que pulsar una tecla despues del log de SCAL

; variables

cIn defb 0      ; char leido de teclado
cOut defb 0     ; char para imprimir
cAddr defw 0    ; addr del string a imprimir
RegHL defw 0 ; almacena copia de los registros
RegAF defw 0
RegBC defw 0
RegDE defw 0
RegIX defw 0
RegIY defw 0
CallAddr defw 0 ; addr desde la que se llama al SCAL
nSCAL defb 0 ; numero de funcion SCAL llamada
SCAL_Result defb 0; indica is scal llamado es no_impementado (=1) o desconocido (=2)
VideoRAMmode defb 0; =0 -> no se usa la video ram. =1 -> se vuelca la video ram a pantalla en cada lectura del teclado
IntoBLS: defb 1 ; flag to indicate it we are into BLS Pas running (=1) or
                ; as a Stand Alone .COM file (=0)

; ******************************************************
; ******************************************************
; Funciones de soporte
; ******************************************************
; ******************************************************

	; set hl to start of line
cpos:	ld	a,l
	and 	0c0h
	add	a,0ah
	ld	l,a
	ret


PrtLn:  ; print end of line
        ld a, $0D

PrtChar: ; imprime char en A.
         ;       Si A es 13 imprime 13 10 (CRLF de CP/M).
         ;       Si es 10 lo ignora
         ;       Si es 0C clear screen, desactiva VideoRAMmode
        ; print on CP/M screen via bdos

        ld (cOut), a

        PrtChar_IntoBLS_Check:
        ld a, (IntoBLS)
        or a
        jr z, PrtCPM ; Stand alone COM -> allways print with CP/M

        ; Now inside BLS environment. CLS allwarys disble videorammode
        ld a, (cOut)
        cp $0c
        jr nz, $+5
        call DisableVideoRAMmode

        ld a, (VideoRAMmode)
        or a
        jr z, PrtCPM
        ld a, (cOut)
        jp PrtVideoRAM

        PrtCPM:
        ld a, (cOut)
        cp $0A ; ignore LF
        ret z
        cp $0D
        jr z, PrtCPM_CRLF
        cp $0C ; Clear Screen
        jr z, PrtCPM_CLS
        cp $18 ; Cancel -> Cr if not at beggining of line
        jr z, PrtCPM_Cancel
        cp $19 ; Cursor ON
        jr z, PrtCPM_CursorON
        cp $1A ; Cursor OFF
        jr z, PrtCPM_CursorOFF
PrtCPM_Char:
        call BDOS_PrtChar;
        ld a, 1
        ld (CrtLineWithChars), a ; someting is written -> line is NOT empty
        ret

PrtCPM_StrZ: ; imprime strz apuntada por HL via BDOS
        ld a, (hl)
        inc hl
        or a
        ret z
        push hl
        call PrtCPM_Char
        pop hl
        jr PrtCPM_StrZ

PrtCPM_CLS:
        ld hl, VT52_CLS
        jr $+5
PrtCPM_CRLF:
        ld hl, VT52_CRLF
        call PrtCPM_StrZ
        ld a, 0
        ld (CrtLineWithChars), a ; new line is empty
        ret

PrtCPM_Cancel:
        ld a, (CrtLineWithChars) ; if line is empty return, else CR
        or a
        ret z
        jp PrtCPM_CRLF

        CrtLineWithChars: defb 0 ; flag que indica si la linea en pantalla esta vacia (0) o tiene algo impreso (1)

PrtCPM_CursorON:
        ld hl, VT52_CURSOR_ON
        jp PrtCPM_StrZ

PrtCPM_CursorOFF:
        ld hl, VT52_CURSOR_OFF
        jp PrtCPM_StrZ

PrtCPM_SET_CURSOR:
        ; Set cursor at CursorX, CursorY position
        ld hl, VT52_CURSOR_POS1
        call PrtCPM_StrZ  ; envia la primera parte de la secuencia de escape
        ld a, (VT52_CURSOR_POS_YX) ; comprueba orden de las coordenadas
        or a
        jr nz, OrderCoodCursorOk
        ; exchange cursor coordinates
        ld a, (CursorX)
        ld b, a
        ld a, (CursorY)
        ld (CursorX), a
        ld a, b
        ld (CursorY), a
        OrderCoodCursorOk:
        ; prepara coord Y
        ld a, (CursorY)
        call SendCoord;
        ; envia la secuencia de escape entre las coords
        ld hl, VT52_CURSOR_POS2
        call PrtCPM_StrZ
        ; envia coord X
        ld a, (CursorX)
        call SendCoord;
        ; envia la secuencia de escape de despues de las coords
        ld hl, VT52_CURSOR_POS3
        call PrtCPM_StrZ
        ret
        SendCoord:
        ; anade el offset
        ld b, a
        ld a, (VT52_CURSOR_POS_OFFSET)
        add a, b
        ; mira si el envio es binario o ascii
        ld b, a
        ld a, (VT52_CURSOR_POS_YX)
        cp 2
        jr z, SendCoordAsAscii
        ld a, b
        jp PrtCPM_Char ; la coord se envia como char unico binario
        ; la coord se envia como numero ascii
        SendCoordAsAscii:
        ld c, 0  ;decenas
        ld a, b  ;a=coor
        ld b, 10
        acLoop1:
        sub b
        jr c, acLoop2 ; less than 10 -> end of loop
        inc c
        jr acLoop1
        acLoop2:
        add a, b  ; restaura valor de a: -> a = unidades, c=decenas
        push af
        ld a, c
        or a
        jr z, acLoop3
        add a, '0'
        call PrtCPM_Char; envia char ascii con la decena
        acLoop3:
        pop af
        add a, '0'
        jp PrtCPM_Char; envia char ascii con la unidad

        CursorX defb 0; store cursor col
        CursorY defb 0; store cursor row

PrtIfA: ; Imprime Msg en pantalla apuntado por HL si A <> 0
        or a
        ret z

Prt:    ; print string pointed by HL until $0 found
        ld a, (hl)
        inc hl
        or a
        ret z
        push hl
        call PrtChar
        pop hl
        jr prt


PrtHex4:; print HL as 4 hex number
        Push hl
        LD      A,H
        call PrtHex2
        pop hl
        LD      A, L

PrtHex2:; print A as 2 hex number
        PUSH    AF
        RRA
        RRA
        RRA
        RRA
        call PrtHex1
        POP     AF

PrtHex1: ; print A as 1 hex digit
        AND     $0F
        ADD     A,$90
        DAA
        ADC     A,$40
        DAA
        jp PrtChar


; ******************************************************
; ******************************************************
; Funciones de CPM. Entran y salen del entorno CPM
; ******************************************************
; ******************************************************

SaveZ80Regs:
        LD      (RegHL),HL   ;     save HL register in RegHL var
        PUSH    AF
        POP     HL
        LD      (RegAF),HL   ;     save register in RegAF var
        PUSH    BC
        POP     HL
        LD      (RegBC),HL   ;     save register in RegBC var
        PUSH    DE
        POP     HL
        LD      (RegDE),HL   ;     save register in RegDE var
        PUSH    IX
        POP     HL
        LD      (RegIX),HL   ;     save register in RegIX var
        PUSH    IY
        POP     HL
        LD      (RegIY),HL   ;     save register in RegIY var
        ret

LoadZ80Regs:
        LD      HL,(RegIY)   ;        load HL register from RegIY var
        PUSH    HL
        POP     IY
        LD      HL,(RegIX)   ;        load register from RegIX var
        PUSH    HL
        POP     IX
        LD      HL,(RegDE)   ;        load register from RegDE var
        PUSH    HL
        POP     DE
        LD      HL,(RegBC)   ;        load register from RegBC var
        PUSH    HL
        POP     BC
        LD      HL,(RegAF)   ;        load register from RegAF var
        PUSH    HL
        POP     AF
        LD      HL,(RegHL)   ;        load register from RegHL var
        RET





ReadChar: ; Read keyboard and return a keypressed without echo on screen
                ; on enter,
                ;       if A=0, returns cIn=0 if no char available
                ;       if A=1, shows cursor and wait for keypress, returns cIn=key pressed, updates VT52 screen if no key pressed
                ;       if A=2, shows cursor and wait for SPACE, returns cIn=key pressed, updates VT52 screen
                ; se se pulsa ^C y CallAddr esta por encima de $5000 -> es ctrl-C desde input de un programa ejecutado
                ; desde el entorno de BLSPas -> ir al menu ppal
        LD      (ReadChar_Mode), A
        cp 2
        jr z, rdMode2
        cp 1
        jr z, rdMode1
        jr rdMode0
        ReadChar_End:
        ret

        ReadChar_Mode defb 0; var local. guarda el modo con el que se invoca ReadChar

        rdMode0:
        ; Mode0: returns cIn=0 if no char available - does not update VideoRAM. Not not shows cursor
        call ReadKey
        jr ReadChar_End

        rdMode1:
        ; Mode1: shows cursor and wait for keypress, returns cIn=key pressed, updates VT52 screen if no key pressed
        call ReadKey
        or a
        jr nz, ReadChar_End ; keypresses -> exit now
        ; no key pressed -> update VT52 screen and wait fow keypress
        call UpdateScreen
        call PrtCPM_CursorON
        call ReadKeyLoop
        call PrtCPM_CursorOFF
        jr ReadChar_End

        rdMode2:
        ; Mode2: shows cursor and wait for SPACE returns cIn=key pressed, updates VT52 screen
        call UpdateScreen
        call PrtCPM_CursorON
        rdWaitForSpaceKey:
        call ReadKeyLoop
        cp 32
        jr nz, rdWaitForSpaceKey
        call PrtCPM_CursorOFF
        jr ReadChar_End

        UpdateScreen:
        ; If VideoRam mode active, set cursor at current pos
        ld a, (VideoRAMMode)
        or a
        ret z ; No VideoRAMMode
        call NasSysVideoRAMtoVT52 ; VideoRAMMode -> copy VideoRAM to VT52
        call NasSysCursorToVT52
        ret

        ; readkey loop
        ReadKeyLoop:
        call ReadKey
        or a
        jr z, ReadKeyLoop
        ret

        ReadKey:
        call BDOS_ReadKey
        LD      (cIn), A
        or a
        ret z
        ; Conversion de caracteres para mapear el teclado
        ld hl, KBD_TranlationTable
        ld b, a
        TranslationTableLoop: ; busca RegA en tabla y devuelve char de sustitucion
        ld a, (hl)
        or a
        jr z, TranslationTableEnd
        cp b
        jr z, TranslationKeyFound
        inc hl
        inc hl
        jr TranslationTableLoop
        TranslationKeyFound:
        inc hl
        ld a, (hl) ; load translation char
        ld (cIn), a
        ret
        TranslationTableEnd:
        ld a, b
        ret


; ******************************************************
; ******************************************************
; Funciones de NASSYS.

; Mapa memoria de NasSys

;  0000-03ff   ROM (Nascom1 Monitor)
;  0400-07ff   ROM (Nascom2 Monitor extension)

;  0800-0bff   RAM (Screen)
;  0c00-0cff   RAM (BLS Pascal compiler variables)
;  0d00-0fff   RAM (Stack space)

; ******************************************************
; ******************************************************



NasSys_rcal:    ; Relative CALL
        EX      (SP),HL
        INC     HL              ; salta el byte de desplazamiento
        EX      (SP),HL
        PUSH    HL              ; salva regs
        PUSH    AF
        PUSH    DE
        LD      HL,#0006        ; 6 para saltar los 3 pushes que se acaban de hacer
        ADD     HL,SP
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        DEC     HL
        LD      E,(HL)        ; get rcall offset
        LD      A,E
        RLA
        SBC     A,A
        LD      D,A
        INC     HL
        ADD     HL,DE
        POP     DE
        POP     AF
        EX      (SP),HL
        RET

NasSys_rin:     ; read char de teclado. Si char no pulsado, espera. Devuelve char en A, Carry=1
        call SaveZ80Regs
        ld a, 1 ; read until key pressed
        call ReadChar
        call LoadZ80Regs
        LD      A, (cIn)
        SCF
        ret

NasSys_rout:    ; print char en A
        or a
        ret z ; char $0 not printed

        call SaveZ80Regs

        ld a, (RegAF+1)
        call PrtChar

        call LoadZ80Regs
        ret

NasSys_prs:     ; print string terminada en cero
        EX      (SP),HL
        LD      (cAddr),HL   ; save HL register in cAddr var -> string start addr
        NasSys_prs_Loop:
        LD      A,(HL)
        INC     HL
        OR      A
        JR      NZ,NasSys_prs_Loop
        EX      (SP),HL      ; string string following prs rst

        call SaveZ80Regs

        LD      HL, (cAddr)
        call Prt

        call LoadZ80Regs;
        ret

NasSys_scal:    ; SCAL NASSYS OS functions

        LD      (RegAF+1),A   ; Save A register
        EX      (SP),HL
        DEC     HL
        LD      (CallAddr),HL    ;   save caller addr
        INC     HL
        LD      A,(HL)           ;   get scal function number
        LD      (nSCAL),A        ;   store into var
        INC     HL
        EX      (SP),HL          ;   skip function number alfter calling rst

        ; A=nSCAL=called function
        ; original A register saved in RegAF
        ; rest of registers unchanged

        ld a, (IntoBLS)
        or a
        jr z, NasSys_scal_dispatch  ; Stand alone COM -> never logs SCAL

        ; chek if log flag
        ld a, SCAL_LogFlag
        or a
        jp z, NasSys_scal_dispatch  ; no log -> exec SCAL
        ; check if CallAddr is from Compiler/runtime or from running compiled program
        ld a, (CallAddr+1) ; High part form CallAddr
        cp $50
        jr nc, NasSys_scal_dispatch ; CallAddr > $5000 -> is a call issued outside compiler -> execute
        ; chek if CallAddr is in exclusion list
        push hl
        push bc
        call PrtSCALExclusionCheck ; (return A=1 if CallAddr is in exclusion list)
        pop bc
        pop hl
        or a
        jr nz, NasSys_scal_dispatch ; CallAddr excluded -> exec SCAL

        ; SCAL must be logged
        ld a, (RegAF+1)
        call SaveZ80Regs
        call PrtSCALInvoked ; print SCAL log
        call LoadZ80Regs
        ld a, 0
        ld (SCAL_Result), a ; init SCAL result
        call NasSys_scal_dispatch ; exec call
        ; now print result of scal
        call SaveZ80Regs
        ld a, (SCAL_Result)
        ld hl, NasSys_scal_ok_msg
        cp $01
        jr nz, $+5
        ld hl, NasSys_scal_unimplemented_msg
        cp $02
        jr nz, $+5
        ld hl, NasSys_scal_undefined_msg
        call Prt
        ld a, SCAL_LogFlag_Pause
        or a
        jr z, scalcr
        call ReadKeyLoop
        scalcr:
        ld a, 13
        call PrtChar
        call LoadZ80Regs
        ret
        NasSys_scal_ok_msg: defb ")", 0
        NasSys_scal_unimplemented_msg: defb "unimplemented)", 0
        NasSys_scal_undefined_msg: defb "undefined)", 0

        NasSys_scal_dispatch:
        ld a, (nSCAL)

        ; Secuencias especiales para parcheo
        cp $FD
        jr nz, $+5
        jp NasSys_New_CursorXY; CUR_XY sets the VT52 cursorat pos x,y on screen

        ; Llamadas normales de NasSys

        cp $49
        jr nz, $+5
        jp NasSys_scal_icopy; ICOPY - Copy from HL to DE BC bytes, handle overlaping regions

        cp $64
        jr nz, $+5
        jp NasSys_scal_num   ; NUM - Examine an input line and convert a hexadecimal value ascii to binary

        cp $6C
        jr nz, $+5
        jp NasSys_scal_tx1   ; TX1 - Output HL in ASCII, then a space, then DE, then another space

        cp $66
        jr nz, $+5
        jp NasSys_scal_tbcd3 ; TBCD3 - Output the hex value in the HL register in ASCII (4 hex digits), then space.

        cp $67
        jr nz, $+5
        jp NasSys_scal_tbcd2 ; TBCD2 - Output the value in the A register in ASCII (2 hex digits).

        cp $68
        jr nz, $+5
        jp NasSys_scal_tbcd2 ; B2HEX - igual que TBCD2 pero sin calcular chechsum en registro C }

        cp $7A
        jr nz, $+5
        jp NasSys_scal_tbcd1 ; B1HEX - Output the low order (right) half of the A registe in ASCII

        cp $6B
        jr nz, $+5
        jp NasSys_scal_errm ; ERRM - Output the "Error" message and CR

        cp $65
        jr nz, $+5
        jp NasSys_scal_crt ; CRT - Display on Nascom screen.

        cp $7E
        jr nz, $+5
        jp NasSys_scal_sp2 ;  SP2 - Output 2 spaces. The A register is set to a space

        cp $69
        jr nz, $+5
        jp NasSys_scal_space ;  SPACE - Output a space. The A register is set to a space

        cp $6A
        jr nz, $+5
        jp NasSys_scal_crlf ;  CRLF - Output a Carriage return/line feed. A is set to a CR

        cp $5C
        jr z, NasSys_scal_unimplemented
        cp $63
        jr z, NasSys_scal_unimplemented
        cp $7D
        jr z, NasSys_scal_unimplemented
        cp $7F
        jr z, NasSys_scal_unimplemented
        cp $6D   ; if (nSCAL >= $6D) and (nSCAL <= $79)  then unimplemented SCAL
        jr c, NasSys_scal_implem1
        cp $79
        jr c, NasSys_scal_unimplemented
        NasSys_scal_implem1:
        cp $5E   ; if (nSCAL >= $5E) and (nSCAL < $61)  then unimplemented SCAL
        jr c, NasSys_scal_implem2    ; jump end_if when nSCAL < $5E
        cp $61
        jr c, NasSys_scal_unimplemented ; jump to scal_unimpl if when nSCAL < $61
        NasSys_scal_implem2:

        cp $5B   ; if (nSCAL < $5B) or (nSCAL > $7F)  then unkown SCAL
        jr c, NasSys_scal_unknown ; jump to scal_unk when nSCAL < $5E
        cp $80
        jr nc, NasSys_scal_unknown  ; jump to scal_unk when nSCAL >= $80

        cp $5B  ; MRET - end a program and return control to NAS-SYS
        jr nz, $+5
        jp BDOS_ExitToOS

        cp $7B   ; BLINK - Obtain an input character in the A register. While waiting for the input, blink the cursor on the screen.
        jr nz, $+5
        jp NasSys_rin

        cp $5D   ; TDEL - Wait for about 1 second
        jr nz, $+5
        jp NasSys_tdel

        cp $62   ; RKBD - if keypresses A=key, C=1, if no keypressed, A=0, C=0
        jr nz, $+5
        jp NasSys_rkbd

        cp $61   ; SKBD - Scan Keyboard, if keypresses A=key, C=1, if no keypressed, A=0, C=0
        jr nz, $+5
        jp NasSys_rkbd

        cp $7C    ; CPOS - The HL register must be set to point to a position on the screen
        jr nz, $+5
        jp NasSys_cpos

        jp NasSys_scal_unknown

NasSys_scal_unimplemented:
    ; SCAL functions not implemented:
    ;           6D SOUT        Send a string of characters directly to the serial
    ;                          output port. HL must be set to point to the start of
    ;                          the string, and B must be set to the length. The C
    ;                          register is set to 0 and then all the characters are
    ;                          added into it. Registers HL, B and A are also modified
    ;           6E XOUT        Output to external ASCII device.
    ;           6F SRLX        Output to serial output port.
    ;           70 SRLIN       Scan serial input port.
    ;           71 NOM         Set the address of the new output table
    ;           72 NIM         Set the address of the new input table,
    ;           73 ATE         get start of address table execution
    ;           74 XKBD        Inpout from external ASCII device.
    ;           75 _UOUT       User jumps
    ;           76 _UIN        User jumps
    ;           77 NNOM        let the output table back to normal
    ;           78 NNIM        let the input table back to normal
    ;           79 RLIN        Examine an input line and convert up to ten hexadecimal values separated by spaces from ASCII to binary.
    ;           5C SCALJ       llama la rutina numero ($0c0a) (SCAL indirecto)
    ;           5E FFLP        Flip one or more bits of output port 0
    ;           5F MFLP        Alter the state of (turn on or off) the tape drive LED
    ;           60 ARGS        Load the contents of ARG1 into HL, ARG2 into DE and ARG3 into BC
    ;           63 INLIN       Obtain an input line. This is the routine used by NAS-SYS to get commands
    ;           7D RKBD        repeat keyboard routine
    ;           7F SCALI       Subroutine for call

        ld a, 1
        ld (SCAL_Result), a
        ret

NasSys_scal_unknown:
        ld a, 2
        ld (SCAL_Result), a
        ret


NasSys_cpos:       ; CPOS - The HL register must be set to point to a position on the screen
        jp cpos

NasSys_rkbd:     ; RKBD read char de teclado. Si char no pulsado, espera. Devuelve char en A, Carry=1
        call SaveZ80Regs
        ld a, 0 ; read key pressed or not pressed
        call ReadChar
        call LoadZ80Regs
        ccf
        LD      A, (cIn)
        or a
        ret z   ; exit with Carry = 0 if A =0 (no key pressed)
        SCF   ; A <> 0 -> key pressed -> carry set
        ret


NasSys_tdel: ; TDEL - Wait for about 1 second
        xor	a
	ld	b,a
        tdel2:
        call	rdel
	call	rdel
	djnz	tdel2
	ret
	; delay
        rdel:
        dec	a
	ret	z
	push 	af
	pop	af
	jr	rdel

NasSys_scal_num: ; NUM - Examine an input line (DE) and convert a hexadecimal value ascii to binary
                        ; SIDE EFFECTS: write at $0C21, $0C22, $0C20
        L387:
        LD      A,(DE)
        CP      $20  ; ignore blanks
        INC     DE
        JR      Z,L387
        DEC     DE
        LD      HL,$0000
        LD      ($0C21),HL   ; numv = value = 0
        XOR     A
        LD      HL,$0C20   ; numn = no of chars = 0
        LD      (HL),A
        L399:
        LD      A,(DE)   ; get char
        OR      A    ; check for end
        RET     Z
        CP      $20
        RET     Z
        SUB     $30  ; convert from ascii, if lt 0 invalid
        RET     C
        CP      $0A  ; if lt 10 then ok, so nn2
        JR      C,L3B1
        SUB     $07
        CP      $0A ; if lt 10 invalid
        RET     C
        CP      $10  ; if ge 16 invalid
        JR      C,L3B1
        SCF
        RET
        L3B1:
        INC     DE  ; valid char found, point to next char
        INC     (HL)
        INC     HL  ; put value in numv, rotating previous contents
        RLD
        INC     HL
        RLD
        DEC     HL
        DEC     HL
        JR      Z,L399
        DEC     DE
        SCF
        RET

NasSys_scal_icopy:
	; icopy command - ICOPY - Copy from HL to DE BC bytes, handle overlaping regions
	; if arg1 ge arg2, goto
	;   ldir copy
        icopy:
        or	a
	sbc	hl,de
	add	hl,de
	jr	nc,copy
	; set to end not start
	dec	bc
	ex	de,hl
	add	hl,bc
	ex	de,hl
	add	hl,bc
	inc	bc
	lddr
	ret
	; copy command
        copy:
        ldir
	ret

NasSys_scal_tx1: ; TX1 - Output HL in ASCII, then a space, then DE, then another space
        call SaveZ80Regs
        ld hl, (RegHL)
        call PrtHex4
        ld a, ' '
        call PrtChar
        ld hl, (RegDE)
        call PrtHex4
        ld a, ' '
        call PrtChar
        call LoadZ80Regs
        ret

NasSys_scal_tbcd3: ; TBCD3 - Output the hex value in the HL register in ASCII (4 hex digits), then space.
        call SaveZ80Regs
        ld hl, (RegHL)
        call PrtHex4
        ld a, ' '
        call PrtChar
        call LoadZ80Regs
        ret

NasSys_scal_tbcd2: ; TBCD2 - Output the value in the A register in ASCII (2 hex digits).
        ld a, (RegAF+1)
        call SaveZ80Regs
        ld a, (RegAF+1)
        call PrtHex2
        call LoadZ80Regs
        ret

NasSys_scal_tbcd1: ; B1HEX - Output the low order (right) half of the A registe in ASCII
        ld a, (RegAF+1)
        call SaveZ80Regs
        ld a, (RegAF+1)
        call PrtHex1
        call LoadZ80Regs
        ret

NasSys_scal_errm: ; ERRM - Output the "Error" message and CR
        call SaveZ80Regs
        ld hl, NasSys_scal_errmsg
        call Prt
        call LoadZ80Regs
        ret
        NasSys_scal_errmsg: defb "Error\r", 0

NasSys_scal_space: ;  SPACE - Output a space. The A register is set to a space
        call SaveZ80Regs
        ld a, 32
        call PrtChar
        call LoadZ80Regs
        ld a, 32
        ret

NasSys_scal_sp2: ;  SP2 - Output 2 spaces. The A register is set to a space
        call SaveZ80Regs
        ld a, 32
        call PrtChar
        ld a, 32
        call PrtChar
        call LoadZ80Regs
        ld a, 32
        ret

NasSys_scal_crlf: ; CRLF - Output a Carriage return/line feed. A is set to a CR
        call SaveZ80Regs
        ld a, 13
        call PrtChar
        call LoadZ80Regs
        ld a, 13
        ret

NasSys_scal_crt: ;  CRT - Display on Nascom screen.
        ld a, (RegAF+1)
        call SaveZ80Regs
        ld a, (RegAF+1)
        call PrtChar
        call LoadZ80Regs
        ret

; Funciones de NasSys sintetizadas para parcheo


NasSys_New_CursorXY; CUR_XY sets the VT52 cursorat pos x,y on screen
        call SaveZ80Regs
        ld hl, (RegHL)
        ld a, l ; CursorX
        ld (CursorX), a
        ld a, h ; CursorY
        ld (CursorY), a
        call PrtCPM_SET_CURSOR
        call LoadZ80Regs
        ret


; END of NasSys - debe acabar antes de $0800. En $0800 empieza
; la video ram. El programa BLS Pas empieza en $1000

; START of emulation

tpa equ 6

BLSRAM_Start equ $5000  ; Start of available mem for BLSPAS compiler
BLSOBJ_Start equ $2180  ; Start of compiled pascal object code in standalone .COM file generated with BLSPAS

Start:
        call InitNasSys

        ; check if Stand alone COM file
        ld a, (IntoBLS)
        or a
        jr z, StartRunTimeEnv
        jp LoadandRunBLSPascal

StartRunTimeEnv:
        ; Init RUN-TIME environment to run .COM file compiled with BLS Pascal 1.2
        ; Memory map:
        ;       0100-07FF - NasSys emulation code
        ;       0800-0BFF - Video RAM (not used, bur reserved just in case)
        ;       0C00-0C7F - NasSys variables
        ;       0C80-0CFF - BLS Pas variables
        ;       0D00-0FFF - NasSys/BLS Stack
        ;       1000-2180 - BLS Pascal RunTime Library
        ;       2180-TPA  - BLS Pascal program object code


        ld hl, (tpa)
        ld (BLSOBJ_Start+5), hl    ;Set TPS HighAddress as higher ram addr the compiled program can use

        jp BLSOBJ_Start            ; Start BLS compiled program

; INIT NasSys environment


InitNasSys:
        ; Set The NASSYS RTS jump vectors
        ld a, $08
        ld de, NasSys_rin
        call SetRSTVector
        ld a, $10
        ld de, NasSys_rcal
        call SetRSTVector
        ld a, $18
        ld de, NasSys_scal
        call SetRSTVector
        ld a, $28
        ld de, NasSys_prs
        call SetRSTVector
        ld a, $30
        ld de, NasSys_rout
        call SetRSTVector
        ret

SetRSTVector:
        ; Set RTS jump vector A to addr in DE
        ld l, a
        ld h, 0
        ld (hl), $C3  ; JP opcode
        inc hl
        ld (hl), e
        inc hl
        ld (hl), d
        ret


        ; NOTA IMPORTANTE:
        ; Hasta aqui el codigo generado tiene que estar debajo de $0800
        ; si llega a $0800 se sobreescribe con la memoria video que empieza
        ; en 0800. OJO que ahora el codigo acaba en 07FD

org $1000

blspas_code:
        INCBIN blspas.rom
        
org $4000

; ************************************************************
; ************************************************************
; Funciones de soporte de NasSys, que se ejecutan en 4000-4800
; ************************************************************
; ************************************************************


SCAL_CallerAddr_NoLog: ; exclusion table for SCAL log
                       defw $219C ; SCAL 72 NIM - set input table (initialization)
                       defw $100B ; SCAL 7B BLINK - read key at read line for FIND
                       defw $201c ; SCAL 7B BLINK - read key at read line for main menu
                       defw $2295, $229b  ; SCAL 66 TBCD3 - print start/end of text addr for Main menu M command
                       defw $1b87         ; SCAL 69 SPACE - print space for Main menu M command
                       defw $22a2         ; SCAL 6A CRLF - print CRLF ending data printout for menu M command
                       defw $22bb         ; SCAL 78 NNIM - restore input table back to normal cahnged in BLS initialization
                       defw $22bd         ; SCAL 5B MRET - exit BLS
                       defw $223f         ; SCAL 6B ERRM - print error msg when unkmow main menu option
                       defw $245c  ; SCAL 7B BLINK - read key en Editor
                       defw $2858  ; SCAL 7C CPOS - ajusta pos cursor al pulsar Intro el el editor
                       defw $27c9  ; SCAL 49 ICOPY - copia al Hacer Ctrl-S (up), Ctrl-R (right) en el editor
                       defw $2b5e  ; SCAL 66 TBCD3 - print end addr when compiling with TAPE
                       defw $241e  ; SCAL 64 NUM - convert types num (hex ascii) in hex: param para FIND nnnn
                       defw $3db2  ; SCAL FE BLINK_SPACE - read key al compilar, cuando error y dice Press <SPACE>

                       defw $1b34, $1b87  ; SCAL 69 SPACE - padding con espacios salida formateada de WriteLn en la RUNTIME LIB
                       defw $1c30  ; SCAL 7B BLINK - read key de Read/ReadLn(string) en la RUNTIME LIB
                       defw $2131  ; SCAL 68 B2HEX - Print numero del error de RunTime en la RUNTIME LIB
                       defw $214a  ; SCAL 66 TBCD3 - Print addr del error de RunTime en la RUNTIME LIB
                       defw $214c  ; SCAL 6A CRLF - Print CR al final del error de RunTime en la RUNTIME LIB
                       defw $2155  ; SCAL 5B MRET - end a program and return control to NAS-SYS despues del mensaje de error de RunTime en la RUNTIME LIB
                       defw $20d2  ; SCAL 61 KBD - lee un char del teclado en la funcion Keyboard de RunTime en la RUNTIME LIB
                       defw $1c3d  ; SCAL FD CUR_XY - coloca cursor VT52 en pos x,y en el proc screen(x,y) en la RUNTIME LIB

                       defw 0      ; end of table

        rdlnCheckCtrlC: defb 0; var que indica si se comprueba Ctrl-C
        rdlnUpCase: defb 0; var que indica sise convierte lo tecleado a mayusculas


DisableVideoRAMmode
        ld a, 0
        ld (VideoRAMmode), a
        ret

EnableVideoRAMmode:
        call PrtCPM_CLS
        call ClearVideoRAM
        ld a, 1
        ld (VideoRAMmode), a
        ret

ClearVideoRAM:
        ; clear VideoRAM2 used to print in VT52 only changes in screen
        ld hl, VideoRAM2
        ld de, VideoRAM2+1
        ld bc, 48 * 16 - 1
        ld (hl), ' '
        ldir  ; fill videoRAM2 with spaces
        ret

NasSysVideoRAMtoVT52:
        ld hl, vl1-1
        ld de, VideoRAM2-1
        ld a, 1
        ld (CursorY), a

        examineline:
        ; init Col1 - addr of first char to be updated in VT52
        ld a, 0
        ld (Col1+1), a
        ld b, 48 ; D=remaining chars in line
        push hl  ; hl= start of line VideoRAM. pop hl is done in lineupdated label
        lineloop:
        inc hl
        inc de
        ld a, (hl)
        ; check if char printable
        cp 32
        jp nc, char_printable
        ld a, 32
        char_printable:
        ; set c=new char,a=char in
        ld c, a
        ld a, (de)
        ; check if same char
        cp c
        jr z, samechar
        ; update char c in videoram2
        ld a, c
        ld (de), a
        ; save char c addr as last update found (Col2)
        ld (Col2), de
        ; if Col1 = 0 save char c addr as first update found
        ld a, (Col1+1)
        or a
        jr nz, samechar
        ld (Col1), de
        ld a, b
        ld (CursorX), a
        samechar:
        djnz lineloop
        ; line check ended. Check if line need to be updated
        ld a, (Col1+1)
        or a
        jr z, lineupdated
        ; line must be updated. Save state
        push de
        ; Set VT52 cursor in the correct pos
        ld a, (CursorX)  ; CursorX = 48-CursorX
        ld b, a
        ld a, 48
        sub b
        ld (CursorX), a
        call PrtCPM_SET_CURSOR
        ; calc number of chars to be updated RegB = Col2-Col1+1, RegDE=Col1=Addr of chars to be updated
        ld hl, (Col2)
        ld de, (Col1)
        and a ; clear carry
        sbc hl, de
        inc hl
        ld b, l
        ;print on VT52 the chars to be updated
        updateloop:
        ld a, (de)
        inc de
        push de
        push bc
        call PrtCPM_Char
        pop bc
        pop de
        djnz updateloop
        ; update finished. Restore state
        pop de
        lineupdated:
        pop hl ; push is done just before lineloop label
        ld bc, $0040
        add hl, bc
        ; CursorY empieza en 1 hasta 15, y luego linea 0
        ld a, (CursorY)
        inc  a
        and $0f
        ld (CursorY), a
        cp 1
        jr nz, examineline
        ret

        Col1: defw 0; addr with start diferences between VideoRAM and VideoRAM2
        Col2: defw 0; addr with end diferences in the line between VideoRAM and VideoRAM2



NasSysCursorToVT52:
        ; Envia la secuencia de ESC de posicionamiento del cursor de VT52
        ; en funcion de la pos del cursor de NasSys en la Ram de video de NasSys
        ; VideoRAM mode -> set cursor at NasSYs cursor por ($0c29-$0c2a)
        ;                        Start of line          endof line
	;       Lin 16   0BC0     0BCA                  0BF9     0BFF
        ; 	Lin  1   0800     080A	  		0839     083F
        ;       Lin  2   0840     084A	  		0879     087F ...
        ld hl, ($0c29) ; cursor pos
        ld a, $3f
        and l
        ld b, $0A
        sub b
        ld (CursorX), a ; store cursor X pos (0-> n)
        ld hl, ($0c29) ; cursor pos
        ld a, h
        sub $08
        ld h, a
        sll l
        rl h
        sll l
        rl h
        ld a, h
        inc a
        and $0F
        ld (CursorY), a ; ; store cursor Y pos (0-> n)
        jp PrtCPM_SET_CURSOR

PrtVideoRAM:
	; crt routine from NasSys
	; video ram
vram	equ	0800h
vl1	equ	vram+10
vl2	equ	vl1+64
vl15	equ	vram+038ah
vend	equ	vram+0400h
cursor  equ     $0c29
	;  ignore null or lf
crt:	or	a
	ret	z
	push	af
	cp	$0a ;lf
	jr	z,crt2

	; clear screen
	cp	$0c ;cs=clear screen
	jr	nz,crt6
	; clear top line
	ld	hl,vl1
	push	hl
	ld	b,48
cr1:	ld	(hl)," "
	inc	hl
	djnz	cr1
	; set margin
	ld	b,16
cr3:	ld	(hl),0
	inc	hl
	djnz	cr3
	; copy down screen
	ex	de,hl
	pop	hl
	push	hl
	ld	bc,vend-vram-64-10-6
	ldir
	; set to top left
	pop	hl

	; set hl left side
crt0:	call cpos

	; save cursor
crt1:	ld	(cursor),hl

	; return
crt2:	pop	af
	ret

	; set hl to cursor
crt6:	ld	hl,(cursor)

	; bs, cul
	cp	$08 ; bs=backspace
	jr	nz,crt14
crt8:	push	af
	; ignore margins
crt10:	dec hl
	ld	a,(hl)
	or	a
	jr	z,crt10
	pop	af
	cp	$11; cul=cursor left
	jr	z,crt12
	ld	(hl)," "
crt12:	call ctst
	jr	crt2
crt14:	cp	$11; cul=cursor left
	jr	z,crt8

	; cursor home, esc
	cp	$17; ch=cursor home=Move cursor to start of line
	jr	z,crt0
	cp	$1b; esc=Delete current line, and place cursor at start of line.
	jr	nz,crt20
	call cpos
	ld	b,48
crt18:	ld	(hl)," "
	inc	hl
	djnz	crt18
	jr	crt0

	; new line, ccr
crt20:	cp	$0d; cr=carriadge return
	jr	z,crt38
	cp	$18; ccr=If cursor at start of line, ignore. Otherwise do CR.
	jr	nz,crt25
	push	hl
	call cpos
	pop	de
	or	a
	sbc	hl,de
	add	hl,de
	jr	z,crt1
	jr	crt38

	; cuu, cud
crt25:	cp	$13; cuu=cursor up
	jr	nz,crt28
	ld	de,-64
crt26:	add	hl,de
	call ctst
	jr	crt2
crt28:	cp	$14; cud=cursor down
	jr	nz,crt29
	ld	de,64
	jr	crt26

	; csl, csr
crt29:	cp	$15; csl=Delete character at cursor, move rest of line to the left
	jr	nz,crt32
crt30:	inc	hl
	ld	a,(hl)
	dec	hl
	or	a
	jr	nz,crt31
	ld	(hl)," "
	jr	crt2
crt31:	ld	(hl),a
	inc	hl
	jr	crt30
crt32:	cp	$16; csr=Delete character at cursor, move rest of line to the right.
	jr	nz,crt34
	ld	b," "
crt33:	ld	a,(hl)
	or	a
	jr	z,crt2
	ld	(hl),b
	ld	b,a
	inc	hl
	jr	crt33

	; test foron screen
ctst:	ld	de,vl1
	or	a
	sbc	hl,de
	add	hl,de
	ret	c
	ld	de,vl15+48
	or	a
	sbc	hl,de
	add	hl,de
	ret	nc
	pop	af
ct8:	jp	crt1

	; cur, others
crt34:	cp	$12 ; cur=cursor right
	jr	z,crt36
	ld	(hl),a
	; ignore margins
crt36:	inc	hl
	ld	a,(hl)
	or	a
	jr	z,crt36

	; test need for cr
	ld	de,vl15+64
	or	a
	sbc	hl,de
	add	hl,de
	jr	nz,ct8

	; do new line
crt38:	call cpos
	ld	de,64
	add	hl,de
	call ctst

	; scroll up
crt40:	ld	de,vl1
	ld	hl,vl2
	ld	bc,vend-vram-64-64-16
	ldir
	; clear bottom line
	ld	b,48
crt50:	dec	hl
	ld	(hl)," "
	djnz	crt50
	jr	ct8

VideoRAM2: DS 48 * 16 ; Image of VideoRAM as printed in VT52:48 cols x 16 lins
                      ; Used to send to VT52 only updates on VideoRAM

PrtSCALExclusionCheck:
    ; check if excluded calling addr. Return
    ; A=1 if CallAddr IS in exclusion table
    ; A=0 if CallAddr not in exclusion table
    ld hl, SCAL_CallerAddr_NoLog
    PrtSCAL_ExclusionCheckLoop:
    ld b, (hl) ;get exclusion addr
    inc hl
    ld c, (hl) ;get exclusion addr
    inc hl
    ld a, b
    or c
    ret z ; is zero? end of exclusion table (return A=0)
    ld a, (CallAddr)
    cp b
    jr nz, PrtSCAL_ExclusionCheckLoop
    ld a, (CallAddr+1)
    cp c
    jr nz, PrtSCAL_ExclusionCheckLoop
    ld a, 1
    ret   ; calladdr is in the exclusion table

    ; at last, log the scal invokation (because calling addr not in exclusion list)
PrtSCALInvoked:
    ld hl, PrtSCALInvoked_msg1
    call Prt
    ld a, (nSCAL)
    call PrtHex2
    ld hl, PrtSCALInvoked_msg2
    call Prt
    ld hl, (CallAddr)
    call PrtHex4
    ld a, 32
    call PrtChar
    ret
    PrtSCALInvoked_msg1: defb "(Calling SCAL ", 0
    PrtSCALInvoked_msg2: defb " from ", 0



LoadFromDisk:
        ; Load file in addr pointed by ($0C82) up to ($0C80 - MTOP)
        CALL  $2242  ; clear object code
        LD      A,$52  ; "R"
        LD      ($0C2B),A	; no es necesario, pero para manter en lo posible el comportamiento original
        CALL    $22cd  ; set HL to point to start of filename
        call LoadFile
        JP      $2182	;	volver al menu ppal

LoadFile:
        ; Input: HL=addr del filename (terminado en $0d)
        ; carga el fichero a partir de $0c80 (MTOP - hight RAM the system can access)
        ; y como max hasta hasta $0C82 (EOFP - end address sourcetext)
        ; imprime progreso. imprime errores si los hay
        call SetupFCB
        or a
        ret nz
        call OpenReadFile
        or a
        ret nz
        LoadLoop:
        call CheckFreeMem
        or a
        jr nz, close
        call PrtLoadProgress
        call ReadFile
        or a
        jr z, LoadLoop
        call PrtLn
        close:
        call CloseFile
        ret

        LoadErrMsg_OutOfMem: defb $18, "Out of memory error\r", 0


SetupFCB:
        ; clear fcb
        ; inpur HL points to filename (terminated by 0D)
        ; Setup FCB with drive, filename and ext
        ; check Filename format and print error if any
        ; return result in RegA: 0=Success, FF=error
        push hl
        ; init FCB to 00
        ld hl, FcbDrive
        ld de, FcbDrive+1
        ld bc, 36 -1
        ld (hl), 0
        ldir  ; initialize fcb
        ; init filename and ext to 32 (space)
        ld hl, FcbFileName
        ld de, FcbFileName+1
        ld bc, 8+3 -1
        ld (hl), 32
        ldir  ; initialize fcb
        pop hl
        ; check if missing filename
        ld a, (hl)
        cp $0d
        jr nz, FileNameOk
        jp NoFileName
        FileNameOk:
        ; Filename exists. Now check if drive specified
        ld a, 0
        ld (FcbDrive), a ; use default drive
        inc hl
        ld a, (hl)
        dec hl
        cp ':'
        jp nz, FileNameOk2
        ; drive letter specificated
        ld a, (hl)
        sub 'A'-1
        ld (FcbDrive), a
        inc hl
        inc hl
        ld a, (hl)
        cp $0d
        jr nz, FileNameOk2
        jp NoFileName
        FileNameOk2:
        ; copy filename to FCB
        ld de, FcbFileName
        ld b, 9
        copyfn:
        ld a, (hl)
        inc hl
        call CheckFileNameInvalidChar
        jr nz, $+5
        jp InvalidFilename
        cp $0d
        jr z, FileNameOk4
        cp '.'
        jr z, FileNameOk3
        ld (de), a
        inc de
        djnz copyfn
        jp FileNameTooLong
        FileNameOk3:
        ; copy ext to fcb
        ld de, FcbFileExt
        ld b, 4
        copyext:
        ld a, (hl)
        inc hl
        call CheckFileNameInvalidChar2
        jr nz, $+5
        jp InvalidFilename
        cp $0d
        jr z, FileNameOk4
        ld (de), a
        inc de
        djnz copyext
        jp FileNameTooLong
        ; filename is ok
        FileNameOk4:
        ; now set DMA addr for IO transfer
SetupFCB2: ; inicializacion de las vars de Disk I/O ademas del FCB
        ld c, 26 ; SetDMA
        ld de, Buf
        call bdos
        ; now init vars
        ld hl, 0
        ld (FileLen), hl
        ld a, $FF
        ld (FileLenH), a ; init to -1 to print progress control
        ld a, 0;
        ld (PrtProgressN), a ; init to 0 to control print progress

        ; end of init
        ld a, 0; success
        ret

CheckFileNameInvalidChar2:
        ; return z if char in regA is invalid for filename, nz if char ok
        cp '.'
        ret z
CheckFileNameInvalidChar:
        cp 32
        ret z
        cp '*'
        ret z
        cp '?'
        ret

OpenReadFile:
        ld c, 15 ; Open
        ld de, Fcb
        call bdos
        cp $FF
        ld a, 0
        ret nz
        jp OpenError

CloseFile:
        ld c, 16   ;close
        ld de, Fcb
        call bdos
        cp $FF
        ld a, 0
        ret nz
        jp CloseError

ClearFcbBuf:
        ld a, 0
        ld b, 128
        ld de, Buf
        clearfcb:
        ld (de), a
        inc de
        djnz clearfcb
        ret

ReadFile:
        ; read file at (0c82) address and updates it. Updates FileLen
        ; normalize: 0D0A changed to 0D, 08 (Tab) to space, < 32 mark end of read readrecord
        ; return result in RegA: 0=Success, FF=error, 1=EndOfFile
        ; clear buf to avoid last record to get garbage
        call ClearFcbBuf
        ld c, 20 ; read next record
        ld de, Fcb
        call bdos
        or a  ; ok
        jr z, copybuf
        cp 1  ; EOF
        ret z
        ; else error
        ld hl, DiskIOMsg_ReadError
        jp PrtFcbErr
        copybuf:
        ; copy buffer to data area normalizing
        ld hl, Buf
        ld de, ($0C82)   ;  OC82-0c83   EOFP	end address sourcetext
        ld b, 128
        charloop1:
        ld a, (hl)
        inc hl
        cp 32
        jr nc, charok  ; printable char -> ok
        cp 09 ; tab
        jr nz, notab
        ld a, 32 ; replace tab by space
        jr charok
        notab:
        cp 10
        jr z, charloop2 ; ignore char $0A = LF
        cp 13
        jr nz, charloopend ; non printable char -> end of record
        charok:
        ld (de), a
        inc de
        charloop2:
        djnz charloop1
        charloopend:
        ; DE = primer byte libre despues del sourcetext
        ; calc Reg hl=DE - (0c82) = bytes de sourcetext usados
        push de
        pop hl
        ld bc, ($0C82)   ;  OC82-0c83   EOFP	end address sourcetext
        and a
        sbc hl, bc
        ; hl = number of bytes stored in sourcetext
        ; update filelen
        ld bc, (FileLen)
        add hl, bc
        ld (FileLen), hl
        ; update OC82-0c83   EOFP	end address sourcetext
        ld ($0C82), de
        ; fill 128 bytes with space after EOFP
        ld a, 13
        ld b, 128
        fillsp:
        ld (de), a
        inc de
        djnz fillsp
        ; return everything ok
        ld a, 0
        ret

        FileNameTooLong:
        ld hl, DiskIOMsg_FileNameTooLong
        jp PrtFcbErr
        NoFileName:
        ld hl, DiskIOMsg_NoFileName
        jr PrtFcbErr
        InvalidFilename:
        ld hl, DiskIOMsg_InvalidFileName
        jr PrtFcbErr
        OpenError:
        ld hl, DiskIOMsg_OpenError
        jr PrtFcbErr
        CreateError:
        ld hl, DiskIOMsg_CreateError
        jr PrtFcbErr
        CloseError:
        ld hl, DiskIOMsg_CloseError
        jr PrtFcbErr
        PrtFcbErr:
        call Prt
        ld a, 32                ; Put space in first letter of filename so TAPE command
        ld (FcbFileName), a     ; cannot reuse the FCB because if error -> file not ok
        ld a, $FF
        ret


        DiskIOMsg_NoFileName: defb "Missing Filename\r", 0
        DiskIOMsg_InvalidFileName: defb "Invalid Filename (must be [d:]filename[.ext])\r", 0
        DiskIOMsg_FileNameTooLong: defb "Filename too long (max 8.3)\r", 0
        DiskIOMsg_OpenError: defb "Open file error\r", 0
        DiskIOMsg_CreateError: defb "Create file error\r", 0
        DiskIOMsg_ReadError: defb $18, "Read file error\r", 0
        DiskIOMsg_WriteError: defb $18, "Write file error\r", 0
        DiskIOMsg_CloseError: defb $18, "Close file error\r", 0

        Fcb: ds 36  ; FCB for filename operations
        FcbDrive    equ Fcb;
        FcbFileName equ Fcb+1
        FcbFileExt  equ Fcb+9
        FcbRc       equ Fcb+33

        Buf: ds 128 ; read buffer
        FileLen: defw 0; file len read (byte precision)
        SourceText: defw 0; pointer to sourcetext to be written to file


CheckFreeMem:
        ; check enougth free space for 256 bytes
        ; return RegA=0 -> ok, $FF -> no free space
        ld hl, ($0C80)   ; 0c80-0c81 	MTOP	hight RAM the system can access
        ld bc, ($0C82)   ;  OC82-0c83   EOFP	end address sourcetext
        and a
        sbc hl, bc ; hl = free space remaining  = MTOP - EOFP + 1
        inc hl
        ld a, h
        or a
        jr nz, roomleft
        ; no room left for 256 bytes
        ld hl, LoadErrMsg_OutOfMem
        call Prt
        ld a, $FF
        ret
        roomleft:
        ld a, 0
        ret

PrtLoadProgress:
        ; input HL=free space
        ; print HHHH (bytes loaded) HHHH (free space) .
        ; prints progress only when bytes loaded high changes
        ; print CR before block 7 to avoid line wrap
        ld a, (FileLenH)
        ld b, a
        ld a, (FileLen+1)
        cp b
        ret z ;loaded less than 256 bytes from previous progress printed
        ld (FileLenH), a
        ; ok, now print progress
        push hl
        ; check if CR is needed to avoid line wrap
        ld a, (PrtProgressN)
        inc a
        ld (PrtProgressN), a
        cp 7
        jr nz, PrtData
        ; cr is needed
        ld a, 1
        ld (PrtProgressN), a
        call PrtLn
        PrtData:
        ; print HHHH = FileLen
        ld hl, (FileLen)
        call PrtHex4
        ld a, 32
        call PrtChar
        pop hl ; free space available
        ; print HHHH = free space remaining
        call PrtHex4
        ld a, 32
        call PrtChar
        ld a, '.'
        call PrtChar
        ld a, 32
        call PrtChar
        ret

        FileLenH defb 0; parte altade filelen. Se usa para controlar que solo se
                       ; imprime progreso cuando cambia la parte hi
                       ; es decir, cuando se han cargado 256 bytes o +
        PrtProgressN defb 0; numero de bloques HHHH HHHH . de progreso impresos
                        ; se usa para controlar que se ponga un CR antes de
                        ; sacar el bloque 7 y asi evitar el line wrap

CopyFcbFileName:
        ; copy filename in fcb, to (HL), terminated by 0D 00
        ex de, hl
        ld hl, FcbFileName
        ld b, 8
        ; copy filename
        cpfn:
        ld a, (hl)
        inc hl
        cp 32
        jr z, cpext
        ld (de), a
        inc de
        djnz cpfn
        cpext:
        ; check if any ext
        ld a, (FcbFileExt)
        cp 32
        jr z, cpext3 ; no ext
        ; add ext separator '.'
        ld a, '.'
        ld (de), a
        inc de
        ; copy ext
        ld hl, FcbFileExt
        ld b, 3
        cpext2:
        ld a, (hl)
        inc hl
        cp 32
        jr z, cpext3
        ld (de), a
        inc de
        djnz cpext2
        cpext3:
        ld a, $0d
        ld (de), a
        inc de
        ld a, $00
        ld (de), a
        ret

PrtWorkingFileName:
        ld a, (FcbFileName)
        cp 32
        jr nz, prtwf
        ; no hay working filename
        ld hl, NoWorkingFileMsg
        call Prt
        jp prtwf2
        prtwf:
        ; copy filename from fcb to cmd line
        ld hl, $0cc0+$10 ; cmdline
        call CopyFcbFileName
        ld hl, WorkingFileMsg
        call Prt
        ld hl, $0cc0+$10 ; cmdline
        call Prt
        prtwf2:
        ret

        WorkingFileMsg: defb "Working filename ", 0
        NoWorkingFileMsg: defb "No working filename\r", 0


SaveToDisk:
        ; Save file from $5000 to ($0C82)
        ld hl, BLSRAM_Start
        ld (SourceText), hl ; beginning of sourcetext
        CALL    $22cd  ; set HL to point to start of filename
        ld (SaveFileName), hl
        ; check if filename in the command line
        ld a, (hl)
        cp $0d
        jr nz, SaveFileNameOk
        ; no filename given, check if filename in fcb
        ld a, (FcbFileName)
        cp 32
        jr z, SaveFileNameOk ; no filename in fcb -> nothing to copy to cmd line
        ; copy filename from fcb to cmd line
        ld hl, (SaveFileName)
        call CopyFcbFileName
        ; print "Saving filename"
        ld hl, SavingMsg
        call Prt
        ld hl, (SaveFileName)
        call Prt
        SaveFileNameOk:
        ld hl, (SaveFileName)
        call SaveFile
        JP      $2182	;	volver al menu ppal

        SaveFileName: defw 0; pointer to filename to save
        SavingMsg: defb "Saving file ", 0

SaveFile:
        ; Input: HL=addr del filename (terminado en $0d)
        ; Salva el fichero a partir de $5000 y hasta hasta $0C82 (EOFP - end address sourcetext)
        ; imprime progreso. imprime errores si los hay
        call SetupFCB  ; read and check the filename and setup FCB with it.
        or a
        ret nz
        call OpenWriteFile
        or a
        ret nz
        SaveLoop:
        call PrtSaveProgress
        call WriteFile
        or a
        jr z, SaveLoop
        call CloseFile
        ret

OpenWriteFile:
        ; clear fcb pointers
        ld hl, FcbFileExt+3
        ld de, FcbFileExt+4
        ld (hl), 0
        ld bc, 23
        ldir
        ; delete file
        ld c, 19 ; Delete File
        ld de, Fcb
        call bdos
        ; ignore error (if file not exists, returns RegA=$FF)
        ; create File
        ld c, 22
        ld de, Fcb
        call bdos
        cp $FF
        jr z, OpenWriteFileErr
        ld a, 0
        ret
        OpenWriteFileErr:
        jp CreateError


WriteFile:
        ; write file pointed by FilePos. Updates FileLen
        ; normalize: 0D witten as 0D0A
        ; last record filled with 1A
        ; return result in RegA: 0=Success, FF=error, 1=EndOfFile

        ; copy buffer to data area normalizing
        ld hl, (SourceText)
        ld de, Buf
        ld b, 128
        charloop3:
        ; check if end of sourcetext reached
        push bc
        push hl
        ld bc, ($0C82)   ;  OC82-0c83   EOFP	end address sourcetext
        and a
        sbc hl, bc
        pop hl
        pop bc
        jr c, noeof
        ; end of sourcetext reached
        ; if Buf is empty -> exit without writing Buf
        ld a, b
        cp 128
        ld a, $1a
        jr nz, nolf ; Buf with data -> fill rest of Buf with $1a
        ld a, 1 ; buf empty -> exit with RegA=1 -> End Of File
        noeof:
        ; end of sourcetext not reached -> read char
        ld a, (hl)
        inc hl
        ; check if CRLF
        cp 13
        jr nz, nocr
        ; replace 13 by 10 and no increment read pointer. then save to disk 13
        ; this is the way to store on disk 1310 in plae of 13 is found in sourcetext
        dec hl
        ld a, 10
        ld (hl), a
        ld a, 13
        jr nolf
        nocr:
        cp 10
        jr nz, nolf
        ; replace back the 10 with the original 13. then save to disk 10
        ; this is the way to store on disk 1310 in plae of 13 is found in sourcetext
        dec hl
        ld a, 13
        ld (hl), a
        inc hl
        ld a, 10
        nolf:
        ; Ok, now save char in Buf to be written
        ld (de), a
        inc de
        djnz charloop3
        ; Buf filled. Now update FilePos and FileLen.
        ; HL=SourceText updated
        ; FileLen = FileLen + (SourceText Updated - SourceText)
        push hl
        ld bc, (SourceText)
        and a
        sbc hl, bc
        ld bc, (FileLen)
        add hl, bc
        ld (FileLen), hl
        pop hl
        ld (SourceText), hl
        ; write buf to disk
        ld c, 21 ; write next record
        ld de, Fcb
        call bdos
        or a
        jr z, $+5+3
        ld hl, DiskIOMsg_WriteError
        jp PrtFcbErr
        ; return 1 for eof, 0 for ok
        ld a, (Buf+127) ; last buf char
        cp $1a
        ld a, 1
        ret z ; return with RegA=1 if last buf char is $1a -> End of file
        ld a, 0
        ret

PrtSaveProgress:
        ; input HL=free space
        ; print HHHH (bytes saved) HHHH (bytes remaining) CR
        ; prints progress only when bytes saved high changes
        ld a, (FileLenH)
        ld b, a
        ld a, (FileLen+1)
        cp b
        ret z ;save less than 256 bytes from previous progress printed
        ld (FileLenH), a
        ; ok, now print progress
        ld hl, (FileLen)
        call PrtHex4  ; print file les = bytes saved
        ld a, 32
        call PrtChar
        ld hl, ($0C82)   ;  OC82-0c83   EOFP	end address sourcetext
        ld bc, (SourceText)
        and a
        sbc hl, bc
        ; print HHHH = bytes remaining to be saved
        call PrtHex4
        call PrtLn
        ret

ZapFileName: ; Parche para el comanfo ZAP para que borre el filename que se haya podido usar
        ; con anterioridad
        ld a, 32		; Put space in first letter of filename so TAPE command
        ld (FcbFileName), a     ; cannot reuse the FCB because source ZAPed
        jp $2232                ; Jump to normal ZAP processing

OpenCodeToDisk: ; abre para escritura el programa .COM/.BIN generado por el comando TAPE
        ; Get Num Param
        ld hl, $2180   ; addr por defecto en el que se genera el programa
        ld (TapeAddrStart), hl
        ld a, 1
        ld (CreateCOMfile), a
        CALL    $22cd  ; set HL to point to start of parameter
        CP      #0D
        jr z, TapeAddrOk
        ld a, 0
        ld (CreateCOMfile), a
        ex de, hl ; al llamar a scal_num, Reg DE debe contener el addr en la linea de comando
        call NasSys_scal_Num ; Examine an input line and convert a hexadecimal value ascii to binary
        LD  hl,($0C21)  ; 0C21-0c22   NUMV      Value returned by routine NUM.
        ld (TapeAddrStart), hl
        jr nc, TapeAddrOk
        ; Carry=1 -> no hay num. Ver si es que no se ha introducido ninguno
        ld a, (de)
        cp $0d
        jr z, TapeAddrOk ; no habia num -> seguir con addr por defecto
        ; habia num con error -> mostrar msg de error
        ld hl, TapeErrMsg_InvalidAddr
        jp PrtTapeErrMsg
        TapeAddrOk:
        ; check filename available
        ld a, (FcbFileName)
        cp 32
        jr nz, TapeFileNameOk
        ; falta filename -> mostrar error y salir
        ld hl, TapeErrMsg_NoFileName
        PrtTapeErrMsg:
        call Prt
        OpenCodeErrExit:
        ret
        TapeFileNameOk:
        ; salvar la extension
        ld hl, FcbFileExt
        ld de, ExtSave
        ld bc, 3
        ldir
        ; poner la extension en el FCB. .COM o .BIN
        ld hl, ExtCOM
        ld a, (CreateCOMfile)
        or a
        jr nz, $+5
        ld hl, ExtBIN
        ld de, FcbFileExt
        ld bc, 3
        ldir
        ; copy filename from fcb to cmd line
        ld hl, $0cc0+$10 ; cmdline
        call CopyFcbFileName
        ; print "Compiling filename"
        ld hl, GeneratingFileMsg
        call Prt
        ld hl, $0cc0+$10 ; cmdline
        call Prt
        ; abre el fichero en escritura y escribe la RTL
        call SetupFCB2
        call SaveRTLToDisk
        ld (RegAF+1), a
        ld a, (RegAF+1)
        or a
        jr nz, OpenCodeErrExit
        ld de, (TapeAddrStart)
        jp $2A80 ; jump to compiler

        TapeErrMsg_NoFileName: defb "No working filename to compile\r", 0
        TapeErrMsg_InvalidAddr: defb "Address invalid\r", 0
        GeneratingFileMsg: defb "Compiling to file ", 0
        ExtCOM: defb "COM"
        ExtBIN: defb "BIN"
        ExtSave: ds 3 ; espacio para salvar la extension del fichero

        TapeAddrStart: defw 0 ; TAPE address for code generation
        CreateCOMfile: defb 0 ; Flag que indica si se crea un fichero .COM (=1) o .BIN (=0)
        CreateBINLibFile: defb 0 ; indica si hay que generar una libreria (R) o (N)

SaveRTLToDisk:
        ; inicializa vars de Record Count que indica tamano de la
        ; libreria en el fichero de salida
        ld hl, 0
        ld (Rc0), hl ; primer Registro de programa compilado
        ld (RcLast), hl ; primer registro libre
        ; abre el fichero de salida
        call OpenWriteFile
        or a
        ret nz
        ; ver si hay que generar una libreria .BIN
        ld a, (CreateBINLibFile)
        or a
        jr nz, svRtl1

        svRtl0:
        ; si es .COM, entonces concatenar la RunTile Library
        ld a, (CreateCOMfile)
        or a
        ret z ;no es .COM, es .BIN -> no carga RTL, solo abre el fichero de salida

        ; poner la RunTime Library en el fichero de codigo que se genera
        ; la RTL tiene dos partes:
        ;    $0100 - $0800: NasSys emulation code que se salva tal cual en el fichero .COM
        ;    $0800 - $1000: No es RTL pero se graba para simplificar
        ;    $1000 - $2180: BLS Pas RTL
        svRtl1:
        ld a, 0
        ld (IntoBLS), a ; para salvar el disco que el prg es stand-alone
        ; salva NASYS $0100-$0800
        ld hl, $0100
        ld bc, $2080
        call WriteMemToDisk
        or a
        ret nz
        ; ahora viene el codigo del programa
        ; que se cargara en addr $2180
        ; Inicializa variables de Rc0 y RcLast con el tamanio de la libreria
        ; cargada
        call WriteCodeToDiskInit
        or a
        ret nz
        ld a, 0 ; success
        ret

WriteMemToDisk:
        ; Guarda en disco BC bytes de memoria desde HL
        ld (WriteMemAddr), hl
        ld (WriteMemLen), bc
        ; Guarda valor de IntoBLS que hay que grabar en disco
        ld a, (IntoBLS) ; restuara valor de IntoBLS que hay que salvar en disco
        ld (svIntoBLS), a
        ld a, 1
        ld (IntoBLS), a ; vuelve a poner IntoBLS=1 una vez copiado su valor original a Buf
        WriteMemLoop:
        ; Mueve 128 bytes al buf de escritura
        ld bc, (WriteMemLen)
        ld a, b
        cp $ff
        jr z, WriteMemLoopEnd; WriteMemLen negativo!
        ld a, c
        or b
        jr z, WriteMemLoopEnd; 0 bytes remain to be written
        ; else, write a CPM record for 128 bytes
        ld a, (svIntoBLS) ; restuara valor de IntoBLS que hay que salvar en disco
        ld (IntoBLS), a
        ld hl, (WriteMemAddr)
        ld de, Buf
        ld bc, 128
        ldir
        ld (WriteMemAddr), hl
        ld a, 1
        ld (IntoBLS), a ; vuelve a poner IntoBLS=1 una vez copiado su valor original a Buf
        ; write buf to disk
        ld c, 21 ; write next record
        ld de, Fcb
        call bdos
        or a
        jr z, $+5+3
        ld hl, DiskIOMsg_WriteError
        jp PrtFcbErr
        ; decrementa 128 de los bytes pendientes de escribir
        ld hl, (WriteMemLen)
        ld bc, 128
        and a
        sbc hl, bc
        ld (WriteMemLen), hl
        jr WriteMemLoop
        WriteMemLoopEnd:
        ld a, 0 ; success
        ret

        WriteMemAddr: defw 0;
        WriteMemLen: defw 0;
        svIntoBLS: defb 0; salva estado de IntoBLS para que no interfiera con CPM


SaveCodeToDisk:
        call SaveZ80Regs
         ; al ejecutar el comando TAPE, se van grabando los bloques de codigo generado
         ; pero con ADDR de carga no consecutiva!.
        ; muestra en pantalla el progreso de la generacion del fichero en cinta:
        ; HHHH NNNN con HHHH=addr del codigo generado, NNNN = repetido len cod generado
        ld hl, ($0c92) ; Addr del codigo generado
        call PrtHex4
        ld a, ' '
        call PrtChar
        ld a, ($0c91) ; Len cod generado
        ld h, a
        ld l, a
        call PrtHex4
        ld a, ' '
        call PrtChar
        call PrtLn
         ; (#0C91)=numero de bytes a escribir en cinta
         ; (#0C92)=addr en la que ejecuta el codigo
         ; #0CC0=addr del codigo en mem para grabar
        call WriteCodeToDisk
        call LoadZ80Regs
        xor a
        ret

WriteCodeToDiskInit:
        ; Inicializa las vars Rc0 y RcLast que indicna el Record de CPM
        ; en el que se empieza a escribir el codigo compilado
        ld c, 36 ; set random record
        ld de, Fcb
        call bdos
        or a
        jr z, $+5+3
        ld hl, DiskIOMsg_ReadError
        jp PrtFcbErr
        ld hl, (FcbRc) ; lee el record count del fichero
        ld (Rc0), hl
        ld (RcLast), hl ; primer RC libre
        ret

WriteBuf:
        ; write buf to disk at record countFcbRc
        ld c, 34 ; write random
        ld de, Fcb
        call bdos
        or a
        ret z
        ld hl, DiskIOMsg_WriteError
        jp PrtFcbErr

ReadBuf:
        ; read buf from disk at record countFcbRc
        ld c, 33 ; read random
        ld de, Fcb
        call bdos
        or a
        ret z
        ld hl, DiskIOMsg_ReadError
        jp PrtFcbErr

WriteCodeToDisk:
        ; WriteMemLen=(#0C91)=numero de bytes a escribir en disco
        ; WriteMemAddr=(#0C92)=addr en la que ejecutara el codigo
        ; #0CC0=addr del codigo en mem para grabar
        ; calcular RecordCount que corresponde al addr del codigo generado
        ld a, ($0c91) ; generated code len
        ld (WriteMemLen), a
        ld hl, ($0c92) ; address for generated code
        ld (WriteMemAddr), hl
        ld hl, $0CC0
        ld (GeneratedCodeAddr), hl
        wcLoop:
        ld hl, (WriteMemAddr)
        ld bc, (TapeAddrStart) ; starting of code address
        and a
        sbc hl, bc ; CodeOffset = CodeAddr - CodeStart
        sla l
        rl h
        ld a, 0
        adc a, 0
        ld l, h
        ld h, a    ; HL = CodeOffset / 128 = RecordCountOffset
        ld bc, (Rc0)
        add hl, bc
        ld (RcCode), hl ; RcCode = Rc0 + RecordCountOffset
        ; ver si se escribe dentro del fichero o se pone al final
        call ClearFcbBuf
        wcFileSizeCheck:
        ld hl, (RcLast)
        ld de, (RcCode)
        and a
        sbc hl, de
        jr nc, wcFileSizeOk
        ; ir al final del fichero y coloar un nuevo registro
        ld hl, (RcLast)
        ld (FcbRc), hl
        call WriteBuf ; escribe un buf vacio
        or a
        ret nz
        ld hl, (RcLast)
        inc hl
        ld (RcLast), hl
        jp wcFileSizeCheck
        wcFileSizeOk:
        ; ver si el registro en el que se tiene que escribir ya existe
        ld hl, (RcLast)
        ld de, (RcCode)
        and a
        sbc hl, de
        ld a, l
        or h
        jr z, wcBufOk ; El registro en el que se tiene que escribir es uno nuevo al final del fichero
        ; el registro en el que escribir ya existe -> leerlo primero para modificarlo y luego grabarlo
        ld hl, (RcCode)
        ld (FcbRc), hl
        call ReadBuf ; lee el buf del fichero
        or a
        ret nz
        wcBufOk:
        ; calcular cuanto cabe en Buf
        ld a, (WriteMemAddr) ; low address for generated code
        and $7F
        ld b, a
        ld a, 128
        sub b
        ld (BufCount), a
        ; ver si en Buf hay sitio es suficiente para WriteMemLen bytes
        ld b, a
        ld a, (WriteMemLen)
        sub b  ; a = WriteMemLen - BufCount
        jr nc, wcBuf2 ; se escriben primero BufCount bytes porque WriteMemLen no cabe en el Buf
        ; si hay sitio suficines en Buf -> se puede escribir WriteMemLen de una vez
        ld a, (WriteMemLen)
        ld (BufCount), a
        wcBuf2:
        ; calcular pos en Buf en la que copiar el codigo generado
        ld a, (WriteMemAddr) ; low address for generated code
        and $7F
        ld h, 0
        ld l, a
        ld bc, Buf
        add hl, bc
        ex de, hl ; DE = pos del buf en la que escribir el codigo
        ; copiar el codigo generado en Buf
        ld a, (BufCount)
        ld c, a
        ld b, 0
        ld hl, (GeneratedCodeAddr) ; addr del codigo en mem para grabar
        ldir
        ld (GeneratedCodeAddr), hl ; salva pos del cod generado que se esta copiando
        ; escribir el Buf en el fichero
        ld hl, (RcCode)
        ld (FcbRc), hl
        call WriteBuf ; escribe el buf del fichero
        or a
        ret nz
        ; si ha escrito en el ultimo reg del fichero -> incrementar RcLast
        ld hl, (RcLast)
        ld de, (RcCode)
        and a
        sbc hl, de
        ld a, l
        or h
        jr nz, wcBuf3 ; NZ -> RcLast<>RcCode -> dejar RcLast como esta
        ; Se ha escrito al final del fichero (porque RcCode=RcLast) -> incrementar RcLast
        ld hl, (RcLast)
        inc hl
        ld (RcLast), hl
        wcBuf3:
        ; ver si queda algo que escribir
        ld a, (BufCount)
        ld c, a
        ld a, (WriteMemLen)
        sub c
        ret z ; Ya se ha escrito todo en disco
        ; recalcular WriteMemAddr y WriteMemLen en funcion de los bytes escritos en disco
        ld (WriteMemLen), a
        ld hl, (WriteMemAddr)
        ld b, 0
        add hl, bc
        ld (WriteMemAddr), hl
        ; bucle para escribir el resto en el siguiente record
        jp wcLoop

        Rc0: defw 0; Record CPM en el que empieza el programa compilado
        RcLast: defw 0; Ultimo Record CPM generado
        RcCode: defw 0; registro en el que va el cod generado
        BufCount: defb 0; numero de bytes a copiar al Buf
        GeneratedCodeAddr: defw 0; empieza en 0CC0 y va recorriendo lo que se va grabando en disco

CloseCodeToDisk:
        ; CloseFile
        call CloseFile
        ; restaura la extension
        ld hl, ExtSave
        ld de, FcbFileExt
        ld bc, 3
        ldir
        ret
        

LoadandRunBLSPascal:

        ; Memory map:
        ;       0100-07FF - NasSys emulation code
        ;       0800-0BFF - Video RAM
        ;       0C00-0C7F - NasSys variables
        ;       0C80-0CFF - BLS Pas variables
        ;       0D00-0FFF - NasSys/BLS Stack
        ;       1000-3FFF - BLS Pas compiler + runtime code 
        ;       4000-47FF - BLS Pas Disk I/O support routines
        ;       4800-TPA  - BLS RAM (BLSRAM_Start to end of CP/M memory

   ; Parse linea de comando

   ;    Si la linea de comandos tiene $HHHH, esta es el top of RAM
   ;       Si no se indica nada, se usa el final de la TPA
   ;    Si la linea de comandos tiene la inficacion RTL entonces genera el
   ;    fichero en disco la runtime library y el emulador de NasCom
   ;       RTL -> genera RTL.BIN.
   ;                Se carga en $0100, y se ejecuta como un .COM con JP $0100
   ;                Al ejecutarse carga en 0100-0800 el emulador NasCom,
   ;                en 1000-2180 la run time library, y ejecuta el programa
   ;                Pascal generado con TAPE. Uso
   ;                   1) con BLSPAS:
   ;                          L A.PAS -> carga programa fuente A.PAS
   ;                          TAPE 2180 -> genera A.BIN en addr 2180
   ;                          Q -> salir
   ;                   2) en CPM
   ;                          PIP A.COM=RTL.BIN,A.BIN
   ;                          A.COM -> ejecuta el programa


        ld hl, (tpa)
        ld (MTOP), hl           ; MTOP default = TPA

        ld a, ($0080) ; numero de chars en la linea de comandos
        or a
        jr z, EndCmdLine ; no hay linea de comandos
        ; coloca un $0d al final del texto de la linea de comands
        ld hl, $0081  ; inicio de la linea de comandos
        ld c, a
        ld b, 0
        add hl, bc
        ld a, 13
        ld (hl), a
        ; localiza el primer char no espacio de la linea de comandos
        ld hl, $0081-1  ; inicio de la linea de comandos
        cmdlin1:
        inc hl
        ld a, (hl)
        cp 13
        jr z, EndCmdLine
        cp 32
        jr z, cmdlin1
        ; ahora HL apunta al primer char de los params de la linea de comandos
        ; y A tiene el primer char de la linea de comandos
        cp 'R'
        jr z, cmdlinOptionWriteLib
        ; mira si es un numero hex
        ex de, hl ; scal num lee numero apuntado por DE
        call NasSys_scal_Num
        jr nc, cmdlinAddrOk ; no error -> set MTOP
        ld a, (de)
        cp $0d
        jr z, cmdlinAddrOk ; error cos CR -> set MTOP
        jp cmdlinAddrErr
        cmdlinAddrOk:
        LD  hl,($0C21)  ; 0C21-0c22   NUMV      Value returned by routine NUM.
        ld (MTOP), hl
        jp EndCmdLine

        cmdlinOptionWriteLib:
        ld (CreateBINLibFile), a
        jp EndCmdLine

        cmdlinAddrErr:
        ld hl, cmdlinAddrErrMsg
        call PrtCPM_StrZ
        ret

        cmdlinAddrErrMsg: defb "Invalid MTOP address\r", 0
        MTOP: defw 0 ; valor en de MTOP dado por la linea de comando

        EndCmdLine:

   ; Parcheo de BLSPAS

   ; 0) Lee la linea de comandos
   ;    Si es HHHH (hex) es el addr de MTOP -
   ;    Si es R genear RTL.BIN

   ; 1) Calculo de la RAM disponible para BLS Pascal

        ; en BLSPAS.ROM: rutina de deteccion del final de la ram !!!
        ; 2207 200D       ; JR      NZ,#2216
        ; 2209 21 00 40   ; LD      HL,#4000 ; detect end of RAM!!!
        ; 220c 7E        LD      A,(HL)
        ; 220d 35        DEC     (HL)
        ; 220e 3D        DEC     A
        ; 220f BE        CP      (HL)
        ; 2210 2004      JR      NZ,#2216
        ; 2212 34        INC     (HL)
        ; 2213 23        INC     HL
        ; 2214 18F6      JR      #220C
        ; 2216 22800C    LD      (#0C80),HL

        ; Parchearlo para que ponga el final de la mem asignada a BLSPAS a MTOP
        ; o bien el valor dado en la linea de comandos cuando se lanza BLSPAS
        ; desde CPM

        ld a, 0
        ld ($2207), a
        ld ($2208), a

        ld hl, (MTOP)
        ld ($220a), hl

        ld hl, $220c
        ld de, $2215
        call PatchWithNOP

        ; queda asi:
        ; 2209 21 00 C0   ; LD      HL,HHHH (MTOP of TPA)
        ; 220c .. 2215 00  ; NOP
        ; 2216 22 80 0C   ; LD      (#0C80),HL

   ; 2) Cambiar prompt de comando FIND de "->" (char semigrafico NasCom) a ">" (ascii standar)

        ld a, '>'
        ld ($267c), a

   ; 3) Activar copia de la VideoRAM al VT52. Solo funciona mientras se esta en el
   ;    editor. El resto del tiempo, lo que se imprime sale por CPM, aunque
   ;    los siguientes chars ASCII tiene un significado especial:
   ;    (en mayusculas las que funcionan igual que en NASSYS)
   ;    0A -> no se imprime
   ;    0D -> CR envia a la consola secuencia definida como VT52_CRLF (0D 0A)
   ;    0C -> CLS envia a la consola secuencia definida como VT52_CLS
   ;    18 -> CANCEL si el cursor no esta al principio de la linea envia un 0D 0A a la consola
   ;    19 -> Cursor On envia a la consola secuencia definida como VT52_CursorON
   ;    1A -> Cursor Off envia a la consola secuencia definida como VT52_CursorOFF


        ld a, $cd  ; CALL opcode
        ld ($286c), a
        ld hl, EnableVideoRAMmode
        ld ($286c +1), hl


   ; 4) Rutinas de disco en vez de cinta

        ;   225e 53         db "S"                                      
        ;   225f E322       db #22e3 ; addr for SAVE command (ok)       
        ;   2261 4C         db "L"                                      
        ;   2262 4823       db #2348 ; addr for LOAD command (ok)       
        ;   2264 56         db "V"                                      
        ;   2265 4F23       db #234f ; addr for VERIFY command (ok)     

        ld hl, LoadFromDisk
        ld ($2262), hl
                      ; comando Load:    L  [A:]filename[.ext]
                      ; el filename es obligatorio
                      ; Al cargar va mostrando HHHH RRRR . donde
                      ;    HHHH = bytes de source text loaded en hex
                      ;    RRRR = bytes de memoria libre que queda en hex
                      ; debe quedar minimo 256 bytes. Si queda menos da error de out of memory
        ld hl, SaveToDisk
        ld ($225f), hl
                      ; comando Save:    S  [[A:]filename[.ext]]
                      ; si no se indica el filename, se usa el del ultimo load (working filename)
                      ; Al cargar va mostrando HHHH RRRR donde
                      ;    HHHH = bytes de source text salvados en hex
                      ;    RRRR = bytes de source text que quedan por salvar en disco

        ld a, 'v'
        ld ($2264), a ; invalida el comando VERIFY ya que no se pueden meter comandos en
                      ; minusculas desde el menu (se pasan a mayusculas automaticamente)


   ; 5) Redefine el addr de origen del sourcecode de 4000 a 5000 para que haya
   ;    sitio para las funciones de E/S de disco

        ;   221b 210040    LD      HL,#4000   ; ZAP Commad
        ;   2276 210040    LD      HL,#4000   ; at Memory command
        ;   25e4 210040    LD      HL,#4000   ; editor?
        ;   26f5 210040    LD      HL,#4000   ; editor?
        ;   275d 210040    LD      HL,#4000   ; editor?
        ;   2801 110040    LD      DE,#4000   ; editor?
        ;   2824 110040    LD      DE,#4000
        ;   2ad3 DD210040  LD      IX,#4000   ; Start of source code for compilation
        ;   3d65 110040    LD      DE,#4000

        ld hl, BLSRAM_Start
        ld ($221b+1), hl
        ld ($2276+1), hl
        ld ($25e4+1), hl
        ld ($26f5+1), hl
        ld ($275d+1), hl
        ld ($2801+1), hl
        ld ($2824+1), hl
        ld ($2ad3+2), hl
        ld ($3d65+1), hl

   ; 6) Parchea TAPE command para que genere un fichero COM/.BIN con el nombre del fichero fuente cargado

        ; Si se usa TAPE -> genera .COM con el filename del working filename. El fichero .COM tiene
        ;                       la libreria runtime
        ;                       y se ejecuta como un programa normal
        ; Si se usa TAPE nnnn -> genera un fichero .BIN con solo el codigo generado en el addr nnnn
        ;                       para ejecutarlo, hay que cargar en memoria el fichero .BIN, las
        ;                       librerias runtime (PASRTL10.BIN), y hacer JP nnnn

         ; al ejecutar el comando TAPE, activa la cinta y se escribe la cabecera
         ; 2a96 DF5F     ; RST     #18; db #5F	SCAL MFLP        Alter the state of (turn an or off) the tape drive LED
         ; 2a98 DF5D     ; RST     #18; db #5D	TDEL        Wait for about 1 second (at 4 MHz)
         ; 2a9a AF       ; XOR     A
         ; 2a9b 32910C   ; LD      (#0C91),A
         ; 2a9e FD22920C ; LD      (#0C92),IY	IY=addr for code generation, 0C92=addr for code generation
         ; 2aa2 47       ; LD      B,A
         ; 2aa3 DF6F     ; RST     #18; db #6F	SCAL SRLX      Output to serial output port.
         ; 2aa5 10FC     ; DJNZ    #EA83		; escribe el la cinta 256 bytes 0
         ; 2aa7 182A     ; JR      #EAB3
         ; Se parchea para que no haga nada con la cinta
         ; Queda asi:
         ; 2a96 nop nop
         ; 2a98 nop nop
         ; 2a9a AF       ; XOR     A
         ; 2a9b 32910C   ; LD      (#0C91),A
         ; 2a9e FD22920C ; LD      (#0C92),IY	IY=addr for code generation, 0C92=addr for code generation
         ; 2aa2 47       ; LD      B,A
         ; 2aa3 nop nop nop nop
         ; 2aa7 182A     ; JR      #EAB3

        ld hl, $2a96
        ld de, $2a99
        call PatchWithNOP
        ld hl, $2aa3
        ld de, $2aa6
        call PatchWithNOP

         ; al ejecutar el comando TAPE, se van grabando los bloques de codigo generado
         ; pero con ADDR de carga no consecutiva!.
         ; 36c5 3A910C   ; LD      A,(#0C91)    ; graba bloque de codigo generado en cinta
         ; 36c8 B7       ; OR      A            ; A=bytes de codigo a grabar
         ; 36c9 C8       ; RET     Z            ; no hay cod que generar -> salir
         ; 36ca D9       ; EXX
         ; 36cb 57       ; LD      D,A
         ; 36cc AF       ; XOR     A
         ; 36cd 0605     ; LD      B,#05	; genera header de bloque de codigo generado con comando TAPE
         ; 36cf DF6F     ; RST     #18; db#6F	SCAL SRLX      Output to serial output port.
         ; 36c1 3EFF     ; LD      A,#FF        ; escribe en cinta 00 FF FF FF FF
         ; 36d3 10FA     ; DJNZ    #F6CC
         ; 36d5 48       ; LD      C,B		; B=C=0
         ; 36d6 42       ; LD      B,D		; B=D=(#0C91)=numero de bytes a escribir en cinta
         ; 36d7 2A920C   ; LD      HL,(#0C92)   ; HL=(#0C92)=addr del codigo
         ; 36da 7D       ; LD      A,L
         ; 36db DF6F     ; RST     #18; db#6F	SCAL SRLX      Output to serial output port.
         ; 36dd 7C       ; LD      A,H
         ; 36de DF6F     ; RST     #18; db#6F	SCAL SRLX      escribe en cinta (#0c92) = addr del cod generado
         ; 36e0 7A       ; LD      A,D
         ; 36e1 DF6F     ; RST     #18; db#6F	SCAL SRLX      escribe en cinta = len del bloque (00=256 bytes)
         ; 36e3 5F       ; LD      E,A
         ; 36e4 DF6F     ; RST     #18; db#6F	SCAL SRLX      repite el dato de len como numero de bloque (para que no sea 00 que es el fin de la carga de cinta)
         ; 36e6 DF6c     ; RST     #18; db#6c	SCAL TX1       muestra en pantalla HL=addr del cod generado DD=len cog generado
         ; 36e8 79       ; LD      A,C
         ; 36e9 DF6F     ; RST     #18; db#6F	SCAL SRLX      escribir en cinta el chechsum generado por TX1
         ; 36eb 21C00C   ; LD      HL,#0CC0
         ; 36ee DF6D     ; RST     #18 ; db #6D ; SOUT         escribir en cinta B bytes desde (HL)
         ; 36f0 79       ; LD      A,C
         ; 36f1 060B     ; LD      B,#0B
         ; 36f3 DF6F     ; RST     #18; db#6F	SCAL SRLX      escribe checksum de datos y luego 10 bytes 00
         ; 36f5 AF       ; XOR     A
         ; 36f6 10FB     ; DJNZ    #F6F0
         ; 36f8 32910C   ; LD      (#0C91),A	A=0
         ; 36fb FD22920C ; LD      (#0C92),IY
         ; 36ff DF6A     ; RST     #18 ; db #6A  ;    SCAL  CRLF       Output a Carriage return/line feed
         ; 3701 D9       ; EXX
         ; 3702 AF       ; XOR     A
         ; 3703 C9       ; RET
         ; Se parchea para que no haga nada con la cinta, y escriba en disco
         ; Queda asi:
         ; 36ca call SaveCodeGenBlockToDisk  ; y muestra en pantalla HL=addr del cod generado DD=len cog generado + CR
         ; 36cb .. f6f4 nop
         ; 36f8 32910C   ; LD      (#0C91),A	A=0
         ; 36fb FD22920C ; LD      (#0C92),IY
         ; 36ff nop nop

        ld hl, $36cd
        ld de, $36f7
        call PatchWithNOP
        ld a, $cd  ; CALL opcode
        ld ($36cd), a
        ld hl, SaveCodeToDisk
        ld ($36cd+1), hl
        ld a, 0
        ld ($36ff), a
        ld ($3700), a

         ; End of compilation. Stop tape, print Code generation Addr End.
         ; 2b50 AF       ; XOR     A		; stop tape
         ; 2b51 0605     ; LD      B,#05
         ; 2b53 DF6F     ; RST     #18 ; db #6F ; SCAL   SRLX      Output to serial output port
         ; 2b55 3E1B     ; LD      A,#1B		; write 00 00 00 00 00
         ; 2b57 10FA     ; DJNZ    #2B53
         ; 2b59 DF5F     ; RST     #18 ; db #5F ; SCAL   MFLP        Alter the state of (turn on or off) the tape drive LED
         ; 2b5b FDE5     ; PUSH    IY
         ; 2b5d E1       ; POP     HL
         ; 2b5e DF66     ; RST     #18 ; db #66       ; SCAL  TBCD3 Output the hex value in the HL register in ASCII, followed by a space
         ; 2b60 EF       ; RST     #28	; 	PRS print iY (next code generation addr + 1) then End
         ; 2b61 456E642E ;		db "End."
         ; 2b65 00       ; 	db #00
         ; 2b66 C9       ; RET
         ; Se parchea para que no haga nada con la cinta, y escriba en disco
         ; Queda asi:
         ; 2b50 AF       ; XOR     A
         ; 2b51 call CloseCodeToDisk		;
         ; 2b54 .. 2b5a nop
         ; 2b5b FDE5     ; PUSH    IY
         ; 2b5d E1       ; POP     HL
        ld a, $cd  ; CALL opcode
        ld ($2b51), a
        ld hl, CloseCodeToDisk
        ld ($2b51+1), hl
        ld hl, $2b54
        ld de, $2b5a
        call PatchWithNOP

         ; en el comando TAPE, parche para que abra el fichero .COM / .BIN en disco
	 ; 2255 54         db "T"                                      
	 ; 2256 3A24       db #243A ; addr for TAPE command            
         ; queda asi
         ; 2256  	   defw OpenCodeToDisk

        ld hl, OpenCodeToDisk
        ld ($2256), hl

         ; En el comando ZAP, parchea para que limpie el filename del fichero source que
         ; se haya podido cargar anteriormente
         ; 2267 5A         db "Z"                                      
         ; 2268 3222       db #2232 ; addr for ZAP command 
         ; queda asi
         ; 2268                 defw ZapFileName

        ld hl, ZapFileName
        ld ($2268), hl

   ; 7) Anula las funciones de la RunTimeLibrary que estan ligadas al
   ;    NasCom: load, save, plot, point. Si se usan da identificador
   ;    desconocido al compilar

   ld a, $1f ; char no imprimible
   ld ($3fc9), a ; LOAD
   ld ($3fc3), a ; SAVE
   ld ($3fbd), a ; PLOT
   ld ($3ed3), a ; POINT

   ; 8) Parchea la RunTime Library para que en procedimientos
   ;    Read/ReadLn y funcion keyboard, si se pulsa
   ;    Control-C se sale del programa (al entorno de Pascal o al Sistema
   ;    operativo, depende de desde donde se llamase al programa)
   ;    Parchea tambien para que en el menu ppal del compilador
   ;    lo que se teclee se pase a mayusculas automaticamente

   ; read con break:
   ; parchea RunTime Lib para que llame a la funcion de control de Ctrl-C

        ; parchea Read/readln)
        ld a, $cd  ; CALL opcode
        ld ($1c33), a
        ld hl, Check_CtrlBreak_ReadLn + $2003-CodeTo2003_Start
                   ; la func de control se coloca en $2003 sobreescribieno
                   ; lo que hay (func SAVE - LOAD)
        ld ($1c33+1), hl ; el codigo del proc SAVE y LOAD que se ha anulado
        ld hl, Check_CtrlBreak_ReadLine + $2003-CodeTo2003_Start
        ld ($1bda+1), hl  ; parchea Read/readln(numero)
        inc hl
        inc hl
        ld ($1c21+1), hl ; parchea Read/readln(string[2 o mas])
        ; parchea lectura de linea del menu ppal para que pase a mayusculas
        ld hl, Menu_ReadLine + $2003-CodeTo2003_Start
        ld ($21a2+1), hl  ; parchea Read/readln(numero)

        ; copia el codigo a $2003
        ld hl, CodeTo2003_Start
        ld de, $2003
        ld bc, CodeTo2003_End - CodeTo2003_Start + 1
          ldir

   ; keyboard con break:
   ; parchea RunTime Lib para que llame a SCAL para leer el teclado y
   ; luego compruebe Ctrl-C

         ; Funcion KEYBOARD en la RUNTIME LIBRARY
         ; 20d2 11020C   ; LD      DE,#0C02    ; Keborad map
         ; 20d5 21D9E0   ; LD      HL,#20CA    ; Keyboard table
         ; 20d8 0608     ; LD      B,#08
         ; 20da 1A       ; LD      A,(DE)
         ; 20db A6       ; AND     (HL)
         ; 20dc 12       ; LD      (DE),A
         ; 20dd 13       ; INC     DE
         ; 20de 23       ; INC     HL
         ; 20df 10F9     ; DJNZ    #20DA
         ; 20e1 DF61     ; RST     #18; db #61; SCAL  KBD  ;     Scan Nascom keyboard.
         ; 20e3 210000   ; LD      HL,#0000     ; HL=return value=false
         ; 20e6 D0       ; RET     NC
         ; 20e7 6F       ; LD      L,A          ; HL=A=return key pressed
         ; 20e8 C9       ; RET
         ; Queda asi:
         ; 20d2 RST #18; db #61; SCAL  KBD  ;     Scan Nascom keyboard.
         ; e0e3 cp 03
         ; e0e5 jr nz, e0ea
         ; e0e7 jr e15b
         ; e0ea ld hl, $0000
         ; e0ed or a
         ; e0ee ret z
         ; e0ef .. e0f5 nop

        ld hl, $20d2
        ld de, $20e6
        call PatchWithNOP
        ; copia el codigo
        ld hl, Check_CtrlBreak_Keyboard_func
        ld de, $20d2
        ld bc, Check_CtrlBreak_Keyboard_func_End - Check_CtrlBreak_Keyboard_func + 1
        ldir

   ; 9) Parchea la RunTime Library para que proc screen(x,y) mueva el cursor VT52 en vez
   ;    de mover el cursor de NasSys en la videoram. La esquina superior Izq es (0,0)
   ;    write(chr(12)); hacer clear screen

        ; copia el codigo
        ld hl, screen_proc
        ld de, $1c38
        ld bc, screen_proc_End - screen_proc + 1
        ldir

   ; 10) Comando W para mostrar el Working file

        ; crea el comando W = Working FileName. Es el filename del ultimo LOAD/SAVE.
        ; si hay error de Disco o se ejecuta el comando ZAP se borra el
        ; Working FileName. El working filename se usa con el comando SAVE cuando
        ; no tiene filename como parametro, y con TAPE para saber el nombre del fichero .COM
        ; a generar.
        ; EL comando W muestra en pantalla el working filame actual

        ld a, 'W'
        ld ($2264), a
        ld hl, PrtWorkingFileName
        ld ($2264+1), hl
        ; inicializa a que no haya working filename
        ld a, 32
        ld (FcbFileName), a

   ; FIN del parcheo.

        ; Mira si hay que generar una Libreria o se lanza el entorno BLS Pascal

        ld a, (CreateBINLibFile)
        or a
        jr nz, $+5
        ; No hay librerias que generar -> se ejecuta BLS Pascal
        jp $1000

        ; generar librerias
        ; seleccionar filename
        ld hl, LibRTLFileName        ; copiar filename al Fcb
        ld de, FcbFileName
        ld bc, 8+3
        ldir
        ; copiar libreria
        call SetupFCB2          ; Needed because do SetDMA
        call SaveRTLToDisk
        call CloseFile
        ; Imprimir mensaje
        ; copy filename from fcb to cmd line
        ld hl, $0cc0+$10 ; cmdline
        call CopyFcbFileName ; pone al final del filename 0D 00
        ld hl, GeneratingLibMsg1
        call Prt
        ld hl, $0cc0+$10 ; cmdline que tiene el filename y un retorno de carro
        call Prt
        ; Mensaje de version de BLS Pascal
        ld hl, GeneratingLibMsg2
        call Prt
        ld a, (BlsPasRTLVersion)
        add a, '0'
        call PrtChar
        ld a, '.'
        call PrtChar
        ld a, (BlsPasRTLVersion+1)
        add a, '0'
        call PrtChar
        call PrtLn
        ; Mensaje de version de NasCom NasSys Emulation Library
        cplib1:
        ld hl, GeneratingLibMsg3
        call Prt
        ld a, (NasSysRTLVersion)
        add a, '0'
        call PrtChar
        ld a, '.'
        call PrtChar
        ld a, (NasSysRTLVersion+1)
        add a, '0'
        call PrtChar
        call PrtLn
        ld hl, GeneratingLibMsg4
        call Prt
        ld hl, VT52_TermName
        call Prt
        call PrtLn
        ret

        GeneratingLibMsg1: defb "Save library file ", 0
        GeneratingLibMsg2: defb "BLS Pascal v", 0
        GeneratingLibMsg3: defb "NasSys Emulation v", 0
        GeneratingLibMsg4: defb "Terminal ", 0

        LibRTLFileName: defb "RTL     BIN"

PatchWithNOP:
        ; parchea con $00 (NOP) desde HL a DE
        ld a, e   ; BC = DE - HL
        sub l
        ld c, a
        ld a, d
        sbc a, h
        ld b, a   ; BC = Number of bytes to move

        push hl
        pop de
        inc de    ; DE = HL+1
        ld (hl), 0
        ldir
        ret

CodeTo2003_Start:
Check_CtrlBreak_ReadLn:
        ; se copia a $2003
        ; comprobacion de break con read(string[1])
        LD      (HL),$01
        INC     HL
        cp  CtrlBreak_Char
        ret nz
        jp $214c  ; jump to runtime error exit to OS/envieronment
        Check_CtrlBreak_ReadLn_End:
Check_CtrlBreak_ReadLine:
        LD      C,#3F    ; max len que puede leerse
        ; comprobacion de break con read(string[2 o +])/read(numero)
        xor a
        ld (rdlnUpCase), a ; Translate chars to Upper Case = false
        inc a
        ld (rdlnCheckCtrlC), a ; Check Ctrl-C = true
NewReadLine:
        rdlnReadCharLoopInit:
        LD      HL,$0CC0
        LD      B,$00
        rdlnReadCharLoop:
        PUSH    HL
        RST     $18
        defb    $7B ;   SCAL #7B = SCAL BLINK Obtain an input character in A. Blink cursor while waiting.
        POP     HL
        LD      (HL),A
        ld a, (rdlnUpCase) ; should UpCase?
        or a
        jr z, rdlnNoUpCase
        ld a, (hl)
        cp 'a'
        jr c, rdlnNoUpCase
        cp 'z'+1
        jr nc, rdlnNoUpCase
        sub 'a'-'A'
        ld (hl), a
        rdlnNoUpCase:
        ld a, (hl)
        CP      $0D		; check return key pressed
        RET     Z
        cp CtrlBreak_Char
        jr nz, rdlnNoCtrlC
        ld a, (rdlnCheckCtrlC); Check Ctrl-C allowed?
        or a
        jr z, rdlnReadCharLoop
        jp $214c              ; abort execution
        rdlnNoCtrlC:
        CP      $08		; check BackSpace key pressed
        JR      NZ, rdlnNoBackSpace
        DEC     B
        ld a, b
        cp $ff
        JR      z, rdlnReadCharLoopInit
        ld a, $08
        DEC     HL
        JR      rdlnCharOk
        rdlnNoBackSpace:
        CP      $1B		; check ESC key pressed
        JR      NZ,rdlnNoEsc
        rdlnEscClearLineLoop:
        DEC     B
        ld a, b
        cp $ff
        JR      z, rdlnReadCharLoopInit
        LD      A,$08
        RST     $30     ; Prt Backspace until line is erased
        JR      rdlnEscClearLineLoop
        rdlnNoEsc:
        CP      $20
        JR      C, rdlnReadCharLoop ; If char not printable, ignore it and continue reading kbd
        LD      A,B
        CP      C
        JR      Z,rdlnReadCharLoop ; If line full, ignore char and continue reading kbd
        LD      A,(HL)
        INC     B
        INC     HL
        rdlnCharOk:
        RST     $30    ; ROUT    Output the character typed in the A register.
        JR      rdlnReadCharLoop
Menu_ReadLine:
        ; lectura de la linea de comando dentro del menu del compilador
        LD      C,#3F    ; max len que puede leerse
        xor a
        ld (rdlnCheckCtrlC), a ; Check Ctrl-C = false
        inc a
        ld (rdlnUpCase), a ; Translate chars to Upper Case = true
        jr NewReadLine
CodeTo2003_end:

Check_CtrlBreak_Keyboard_func:
        RST     $18;
        defb    $61; SCAL  KBD       Scan Nascom keyboard.
        cp      CtrlBreak_Char
        jr nz, $+5
        jp $214c   ; RunTime error exit point
        ld hl, $0000
        or a
        ret z
        Check_CtrlBreak_Keyboard_func_end:
        nop

screen_proc:
        ; proc screen(x,y). Coloca cursor en pos x,y.
        ; la llamda desde el programa compliado es ase:
	; ld hl, x
	; push hl
	; ld hl, y
	; call dc3b
        ; Codigo para que use la funcion SCAL nueva FE que a su vez llama
        ; a la funcion que colocal el cursor VT52 en vez de mover el
        ; cursor en memoria de NasSys
        pop ix ; recupera la dir de retorno de la subrutina, para dejar a la vista los params
        ld a, l ; CurY
        pop hl  ; L=CurX
        ld h, a; H=CurY
        RST $18
        defb $FD ; SCAL  CUR_XY       Cursor VT52 en pos X,Y
        jp (ix)
        screen_proc_end:
        nop


;problemas
;        - en cpmplayer: se cuelga al rato
;

