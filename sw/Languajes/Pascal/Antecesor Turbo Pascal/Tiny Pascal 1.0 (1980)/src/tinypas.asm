

org $100
        call Patch
	jp $473A   

; Llamadas al servicio del Sistema Operativo

TPA    equ  006
PRT    equ  $4845   ; -> print strz at addr HL


BDOS:   ei
        call 005
        di
        ret

WBOOT:  ; end program, return to CP/M
        call 0
        ret
CONOUT:  ; send to screen char in RegA
        push bc
        push de
        push hl
        push af
        exx
        push bc
        push de
        push hl
        push af
        exx
        push af
        ld e,a
        ld c,2  ; Console Output
        call bdos
        pop af
        cp 13
        jp nz, conout_end
        ld e,10
        ld c,2  ; after a <CR> issue a <LF>
        call bdos
conout_end:
        exx
        pop af
        pop hl
        pop de
        pop bc
        exx
        pop af
        pop hl
        pop de
        pop bc
        ret

CONIN:  ; read key at keyboard, return it in RegA
        push bc
        push de
        push hl
        LD      C,6       ; Direct Console I/O, read nonblocking
        LD      E,$FF
        Call bdos
        or a
        jp z,conin_end
        cp 'a'
        jp c, conin_end
        cp 'z'+1
        jp nc, conin_end
        sub 'a'-'A'       ; convert tu uppercase
conin_end:
        pop hl
        pop de
        pop bc
        cp 03; return flag Z=1 if ^C pressed -> return to monitor
        ret

; CONIN COUNOUT, print 13 -> imprime 13 10
; Comando Q para salir
; L filename  LS filename -> load filename.PAS pascal source code (CPM format with CR LF)
; LP filename -> load filename.P (pascal p-code)
; W filename  WS filename -> save filename.PAS
; WP filename -> save filename.P
; Use TPA full avail mem (up tp end of TPA 45K free mem for Tiny Bas)
; al hacer load comprueba que fichero no es demasiado grande
; path interprete para que no lea el teclado durante la ejecucion
; mueve el pcode del editor + compilador para ganar de 32K -> 46K de ram disponible para programa -> new memory map
; stack pcode del editor/compilador pasa de 3,25 Kb a 6,8Kb, el stack del user program lleva al fin de la mem
; deshabilitar PLOT y POINT para que sea pLOT y pOINT y no se puedan usar


; Funciones de parcheo antes de ejehocutar

Patch:
       di       ; TINYPAS is a mess because instead of using IX and iY registers, it uses
                ; AF' BC' DE' HL' and EEX all time during compile
                ; Amstrad PCW uses CP/M 3.0 that relies on interrupts and second register file
                ; So if interrupts are not disabled during operation, the interrupts corrupts the registers
                ; and TINYPAS crashes. The solution is to disable interruts except when calling BDOS

       ld hl, CONOUT
       ld ($41a4), hl

       ld hl, CONIN
       ld ($41c6), hl
       ld a, 3
       ld($41c9), a  ; breack con CTRL-C

       ld hl, (0006); adjunt top of mem to TPA
       dec hl
       dec hl
       dec hl
       dec hl
       dec hl
       dec hl ; dec 6 bytes
       ld ($4190), hl
       ld ($4192), hl

       ; No se puede ajustar end of memory con end of TPA. Hace que el compilador se cuelgue
       ; el final de la mem esta en BFFF

       ; comando Q del momitor para volver a CP/M
       ; 4757 FE4C      CP      #4C     ; 'L' -> load form tape
       ; 4759 CADF47    JP      Z,#47DF
       ; 475c FE57      CP      #57     ; 'W' -> save to tape
       ; 475e CA0548    JP      Z,#4805
       ; pasan a ser
       ; 4757 C3xxxx    JP      MainLoop
       ; 475A 00..      NOP
       ; 4760 00        NOP

       ld a, $c3
       ld ($4757), a
       ld hl, MainLoop
       ld ($4758), hl
       ld hl, 0
       ld ($475A), hl
       ld ($475C), hl
       ld ($475E), hl
       ld a, 0
       ld ($4760), a

       ; path interprete para que no lea el teclado durante la ejecuciÃƒÆ’Ã‚Â³n
       ; 4217 1008      DJNZ    #4221
       ; 4219 4F        LD      C,A
       ; 421a CDA641    CALL    #41A6   ;read keyboard non-bloquing
       ; 421d CCA041    CALL    Z,#41A0 ; read blocking if ^C pressed -> ^C = pause
       ; 4220 79        LD      A,C
       ; todo esto pasa a NOP
       ld hl,  $4217
       ld de,  $4218
       ld (hl), 0
       ld bc, 9
       ldir

       ; recoloca el PCode del editor y compilador en $5690 - $73F0 a $2280 - $3fe0
       ; Mapa memoria queda asi
       ; 0100 - 06B3: parches para CP/M
       ; 0800 - 227F: Stack del compilador/editor
       ; 2280 - 3FE0: Programa PCode del editor y compilador
       ; 4000 - 408F: stack del Z80
       ; 4090 - 498F: monitor + interprete pcode
       ; 4990 - TPA: codigo fuente + pcode + stack programa en ejecucion
       ;
       ; mover compilador
       ld hl, $5690
       ld de, $2280
       ld bc, $1d60
       ldir
       ld hl, $4990    ; 4990 - TPA: codigo fuente + pcode + stack programa en ejecucion
       ld ($4180), hl  ; Start Of Pascal Source Text Code
       ld ($418c), hl  ; Start Of Pascal Source Text Code
       ld hl, $2280    ; Addr inicio pcode editor = addr original ($5690) - $3410, $3410 es
       ld ($4188), hl  ; lo que se ha movido el compilador ($5690-$2280)
       ld hl, $2bb0    ; Addr inicio compilador = addr original ($5fc0) - $3410
       ld ($418a), hl  ;
       ld hl, $0800    ; Addr inicio stack pcode compilador
       ld ($418e), hl  ;
       ; deshabilitar PLOT y POINT para que sea pLOT y pOINT y no se puedan usar
       ld a, 'p'
       ld ($2b70), a
       ld ($2b78), a


       ; fix end of stack addr for edit/compiler

       ; Editor/compiler
       ; 47d9 2A8E41    LD      HL,(#418E)  ; Runtime Stack Addr
       ; 47dc C3E041    JP      #41E0       ; executr editor in DE, stack in HL
       ; queda asi:
       ; 47dc           JP  StartEditorCompilerPCode
       ld hl, StartEditorCompilerPCode
       ld ($47dd),hl
       ; use end of ram to set end of stack when running user pcode program
       ld a, $12-6
       ld ($4777),a

       ; patches escape seq to remove TRS80 ones
       ; 40ee db 0D, 0E, 2E, 00 -> 40ee db 0D, 2E, 00, 00
       ; 473d 21AE40 LD HL,#40AE -> str "TINY PASCAL V-1.0" -> LD HL, $40ae+2

       ld a, $2e
       ld ($40ef), a
       ld a, 0
       ld ($40f0), a
       ld  hl, $40ae+2 ; skip 1c 1f at beggining of TINY PASCAL V-1.0
       ld ($473e), hl

       ret


StartEditorCompilerPCode:
       push hl
       ld hl, $2280-1 ; end of Pcode stack just before start of editor/compiler
       ld ($4190), hl ; save in end of stack addr
       pop hl
       jp $41e0       ; jump to intepreter

MainLoop:
        CP      $4C     ; 'L' -> load form tape
        JP      Z,LoadCmd
        CP      $57     ; 'W' -> save to tape
        JP      Z,SaveCmd
        cp 'Q'          ;  -> volver a CP/M
        jp z, wboot
        jp $4760

	; Write/Load fichero fuente
	; Write/Load p-code
	; generar .COM
hola1:  push af
        push bc
        push de
        push hl
        ld (holareg), a
        ld hl, hola1msg
        call prt
        ld a, (holareg)
        call prthex2
        ld hl, holacr
        call prt
        pop hl
        pop de
        pop bc
        pop af
        ret
hola2:  push af
        push bc
        push de
        push hl
        ld (holareg), hl
        ld hl, hola2msg
        call prt
        ld hl, (holareg)
        call prthex4
        ld hl, holacr
        call prt
        pop hl
        pop de
        pop bc
        pop af
        ret

        hola1msg: db "Hola1: A=", 0
        hola2msg: db "Hola2: HL=", 0
        holacr: db 13, 0
        holareg: ds 2;

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
PrtChar:
        ld e,a
        ld c,2
        call bdos
        ret



LoadCmd:
        LD      HL,($409C)
        LD      A,(HL)
        inc hl
        ld ($409c), hl
        CP      32+1
        jp c, LoadSourcePas
        CP      $50       ; 'P' -> load pcode
        JP    LoadPCode
        CP      $53       ; 'S' -> load source
        jp z, LoadSourcePas
        JP      $4895     ; -> ? error

LoadSourcePas:
        call SetupFCB
        or a
        jp nz, $4895  ; -> ? error
        ; force PAS extension
        ld hl, FcbFileExt
        ld (hl), 'P'
        inc hl
        ld (hl), 'A'
        inc hl
        ld (hl), 'S'
        ; init tiny pas values
        XOR    A
        LD      ($4183),A
        LD      ($4187),A
        LD      ($409A),A
        ld hl, ($4180) ;  <-- first byte loaded <- start of text buffer
        ld (ReadAddr), hl
        call LoadFile
        or a
        jp nz, $4895  ; -> ? error
        ld hl, (ReadAddr)
        ld (hl), $FF  ; -> end of sourcefile mark
        LD ($4182),hl ;  <-- last byte loaded
        JP      $4743      ; --> jump main monitor loop

LoadFile:
        ; HL apunta al primer byte del filename
        call OpenReadFile
        or a
        ret nz
        LoadLoop:
        call CheckFreeMem
        or a
        jr nz, CloseLoadFile
        call ReadFile
        or a
        jr z, LoadLoop
        CloseLoadFile:
        call CloseFile
        ret

SetupFCB:
        ; clear fcb
        ; inpur HL points to filename (terminated by char <=32, skip leading spaces)
        ; Setup FCB with drive, filename and ext
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
        ; skip leading spaces in filename
        FileNameSkipLeadingBlanks:
        ld a, (hl)
        inc hl
        cp 32
        jp z, FileNameSkipLeadingBlanks
        dec hl
        ; check if missing filename
        cp '.'
        jp c, NoFileName
        cp 32
        jp c, NoFileName
        cp 'Z'+1
        jp nc, NoFileName
        FileNameOk:
        ; Filename exists. Now check if drive specified
        ld a, 0
        ld (FcbDrive), a ; use default drive
        ; copy filename to FCB
        ld de, FcbFileName
        ld b, 9
        copyfn:
        ld a, (hl)
        inc hl
        cp 32
        jr z, FileNameOk4
        jr c, FileNameOk4
        cp '.'
        jr z, FileNameOk4
        cp 'Z'+1
        jr nc, FileNameOk4
        ld (de), a
        inc de
        djnz copyfn
        ; filename is ok
        FileNameOk4:
        ; now set DMA addr for IO transfer
SetupFCB2: ; inicializacion del Buffer de DMA
        ld c, 26 ; SetDMA
        ld de, DmaBuf
        call bdos
        ; end of init
        ld a, 0; success
        ret

Fcb:        ds 36  ; FCB for filename operations
FcbDrive    equ Fcb;
FcbFileName equ Fcb+1
FcbFileExt  equ Fcb+9
FcbRc       equ Fcb+33
DmaBuf:     ds 128  ; Buffer for read/write
ReadAddr    dw 0    ; addr in mem for readed record
EndAddr     db 0,0  ; addr in mem for readed record
EofFlag     db 0

OpenReadFile:
        ld c, 15 ; Open
        ld de, Fcb
        call bdos
        cp $FF
        ld a, 0
        ret nz
        jp OpenError

CheckFreeMem:
        ; check enougth free space for 256 bytes
        ; return RegA=0 -> ok, $FF -> no free space
        ld hl, ($4192)   ; hight RAM the system can access
        ld bc, (ReadAddr)
        and a
        sbc hl, bc ; hl = free space remaining  = MTOP - EOFP + 1
        inc hl
        ld a, h
        or a
        jp z, NoRoomLeft  ; no room left for 256 bytes
        ld a, 0
        ret

ClearDmaBuf:
        ld a, 0
        ld b, 128
        ld de, DmaBuf
        cleardmabuf1:
        ld (de), a
        inc de
        djnz cleardmabuf1
        ret

ReadFile:
        ; normalize: 0D0A changed to 0D, 08 (Tab) to space, < 32 mark end of read readrecord
        ; return result in RegA: 0=Success, FF=error, 1=EndOfFile
        ; clear buf to avoid last record to get garbage
        call ClearDmaBuf
        ld c, 20 ; read next record
        ld de, Fcb
        call bdos
        or a  ; ok
        jr z, copybuf
        cp 1  ; EOF
        ret z
        ; else error
        jp ReadError
        copybuf:
        ; copy buffer to data area normalizing
        ld hl, DmaBuf
        ld de, (ReadAddr)
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
        jr z, charok
        ; non printable char -> end of file
        ld a, 1
        jp charloopend2
        charok:
        ld (de), a
        inc de
        charloop2:
        djnz charloop1
        charloopend:
        ; return everything ok
        ld a, 0
        charloopend2:
        ; DE = primer byte libre despues del sourcetext
        ld (ReadAddr), de
        ret

CloseFile:
        ld c, 16   ;close
        ld de, Fcb
        call bdos
        cp $FF
        ld a, 0
        ret nz
        jp CloseError

        NoFileName:
        ld hl, Err_NoFileName
        jr PrtErr
        OpenError:
        ld hl, Err_OpenError
        jr PrtErr
        CreateError:
        ld hl, Err_CreateError
        jr PrtErr
        ReadError:
        ld hl, Err_ReadError
        jr PrtErr
        WriteError:
        ld hl, Err_WriteError
        jr PrtErr
        CloseError:
        ld hl, Err_CloseError
        jr PrtErr
        NoRoomLeft:
        ld hl, Err_NoRoomLeft
        jr PrtErr
        NoSource:
        ld hl, Err_NoSource
        jr PrtErr
        NoPCode:
        ld hl, Err_NoPCode
        jr PrtErr

PrtErr:
        call Prt
        ld a, $FF
        ret

        Err_OutOfMem: defb "Out of memory", 13, 0
        Err_NoFileName: defb "Missing filename", 13, 0
        Err_OpenError: defb "File not found", 13, 0
        Err_ReadError: defb "Read error", 13, 0
        Err_WriteError: defb "Write error", 13, 0
        Err_CreateError: defb "Create file error", 13, 0
        Err_CloseError: defb "Close file error", 13, 0
        Err_NoRoomLeft: defb "File too big", 13, 0
        Err_NoSource: defb "No source program", 13, 0
        Err_NoPCode: defb "No P-Code to save", 13, 0

SaveCmd:
        LD      HL,($409C)
        LD      A,(HL)
        inc hl
        ld ($409c), hl
        CP      32+1
        jp c, SaveSourcePas
        CP      $50       ; 'P' -> load pcode
        jp z, SavePCode
        CP      $53       ; 'S' -> load source
        jp z, SaveSourcePas
        JP      $4895     ; -> ? error

SaveSourcePas:
        LD      BC,($4182) ; end of source text
        LD      A,B
        OR      A
        JP      nz,SourceOK
        call NoSource
        jp save_end
        SourceOk:
        call SetupFCB
        or a
        jp nz, $4895  ; -> ? error
        ; force PAS extension
        ld hl, FcbFileExt
        ld (hl), 'P'
        inc hl
        ld (hl), 'A'
        inc hl
        ld (hl), 'S'
        ; init tiny pas values
        ld hl, ($4180) ;  <-- first byte saved <- start of text buffer
        ld (ReadAddr), hl
        call SaveFile
        save_end:
        or a
        jp nz, $4895  ; -> ? error
        JP      $4743      ; --> jump main monitor loop

SaveFile:
        ; Salva el fichero a partir de ReadAddr y hasta hasta encontrar un $FF
        call OpenWriteFile
        or a
        ret nz
        SaveLoop:
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
        jp z, CreateError
        ld a, 0
        ret


WriteFile:
        ; write file pointed by ReadAddrm up to $FF
        ; normalize: 0D witten as 0D0A
        ; last record filled with 1A
        ; return result in RegA: 0=Success, FF=error, 1=EndOfFile

        ; copy buffer to data area normalizing
        ld hl, (ReadAddr)
        ld de, DmaBuf
        ld b, 128
        charloop3:
        ; check if end of sourcetext reached
        ld a,(hl)
        cp $FF
        jr nz, noeof
        ; end of sourcetext reached
        ; if Buf is empty -> exit without writing Buf
        ld a, b
        cp 128
        ld a, $1a
        jr nz, nolf ; Buf with data -> fill rest of Buf with $1a
        ld a, 1 ; buf empty -> exit with RegA=1 -> End Of File
        ret
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
        ; Buf filled. Now update ReadAddr
        ; HL=SourceText updated
        ld (ReadAddr), hl
        ; write buf to disk
        ld c, 21 ; write next record
        ld de, Fcb
        call bdos
        or a
        jp nz, WriteError
        ; return 1 for eof, 0 for ok
        ld a, (DmaBuf+127) ; last buf char
        cp $1a
        ld a, 1
        ret z ; return with RegA=1 if last buf char is $1a -> End of file
        ld a, 0
        ret

SavePCode:
        LD      a, ($4187)
        OR      A
        JP      nz,PCodeOK
        call NoPCode
        jp save_end2
        PCodeOk:
        call SetupFCB
        or a
        jp nz, $4895  ; -> ? error
        ; force P extension
        ld hl, FcbFileExt
        ld (hl), 'P'
        inc hl
        ld (hl), ' '
        inc hl
        ld (hl), ' '
        ; init tiny pas values
        ld hl, ($4184) ;  <-- first byte saved <-- start of pcode
        ld (ReadAddr), hl
        ld hl, ($4186) ;  <-- last byte saved <-- end of pcode
        inc hl
        ld (EndAddr), hl ; <-- first addr not saved
        call SaveFileBin
        save_end2:
        or a
        jp nz, $4895  ; -> ? error
        JP      $4743      ; --> jump main monitor loop

SaveFileBin:
        ; Salva el fichero a partir de ReadAddr y hasta hasta encontrar un $FF
        call OpenWriteFile
        or a
        ret nz
        ld a, 0
        ld (EofFlag), a
        SaveLoopBin:
        call WriteFileBin
        or a
        jr z, SaveLoopBin
        call CloseFile
        ret

WriteFileBin:
        ; write file pointed by ReadAddr up to EddAddr
        ; return result in RegA: 0=Success, 1=eof, FF=error

        ; copy buffer to data area normalizing
        ld hl, (ReadAddr)
        ld de, DmaBuf
        ld b, 128
        charloop4:
        ; check if end of sourcetext reached
        ld a, (EofFlag)
        or a
        jp z, checkeof
        ld a, 0
        jp savedata
        checkeof:
        ld a, (EndAddr+1)
        cp h
        jr nz, noeof2
        ld a, (EndAddr)
        cp l
        jr nz, noeof2
        ; end of pcodetext reached
        ld a, 1
        ld (EofFlag), a
        ; if Buf is empty -> exit without writing Buf
        ld a, b
        cp 128
        ld a, $00
        jr nz, savedata ; Buf with data -> fill rest of Buf with $00
        ld a, 1 ; buf empty -> exit with RegA=1 -> End Of File
        ret
        noeof2:
        ; end of sourcepcode not reached -> read char
        ld a, (hl)
        savedata:
        inc hl
        ld (de), a
        inc de
        djnz charloop4
        ; Buf filled. Now update ReadAddr
        ; HL=SourceText updated
        ld (ReadAddr), hl
        ; write buf to disk
        ld c, 21 ; write next record
        ld de, Fcb
        call bdos
        or a
        jp nz, WriteError
        ; return 1 for eof, 0 for ok
        ld a, (EofFlag)
        ret

LoadPCode:
        call SetupFCB
        or a
        jp nz, $4895  ; -> ? error
        ; force P extension
        ld hl, FcbFileExt
        ld (hl), 'P'
        inc hl
        ld (hl), ' '
        inc hl
        ld (hl), ' '
        ; init tiny pas values
        XOR A
        LD      ($4183), A
        LD      ($4187),A
        LD      ($409A),A
        ld hl, ($4180) ;  <-- load pcode at <- start of text buffer
        ld (ReadAddr), hl
        call LoadFileBin
        or a
        jp nz, $4895  ; -> ? error
        ld hl, ($4180) ;  <-- load pcode at <- start of text buffer
        LD ($4184),hl ;  <-- start of pcode
        ld hl, (ReadAddr) ; <-- first byte free
        dec hl
        LD ($4186),hl ;  <-- last pcode byte
        JP      $4743      ; --> jump main monitor loop

LoadFileBin:
        ; HL apunta al primer byte del filename
        call OpenReadFile
        or a
        ret nz
        LoadLoopBin:
        call CheckFreeMem
        or a
        jr nz, CloseLoadFileBin
        call ReadFileBin
        or a
        jr z, LoadLoopBin
        CloseLoadFileBin:
        call CloseFile
        ret

ReadFileBin:
        call ClearDmaBuf
        ld c, 20 ; read next record
        ld de, Fcb
        call bdos
        or a  ; ok
        jr z, copybuf2
        cp 1  ; EOF
        ret z
        ; else error
        jp ReadError
        copybuf2:
        ; copy buffer to data area normalizing
        ld hl, DmaBuf
        ld de, (ReadAddr)
        ld b, 128
        charloop5:
        ld a, (hl)
        inc hl
        ld (de), a
        inc de
        djnz charloop5
        ; DE = primer byte libre despues del sourcetext
        ld (ReadAddr), de
        ld a, 0
        ret


org $4090

        INCBIN pas32k.bin
        

