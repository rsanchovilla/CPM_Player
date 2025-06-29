

org $100
        jp start1
IsStandAloneCOM: db 0 ; default load PCode. If 1-> execute
        db 0,0
Start1:
        call Patch

        ; if param -> Load PCode en $2100, interprete en $B000 y ejecuta
        ld a, (IsStandAloneCOM)
        or a
        jp z,RunPCode_File

        ; execute pcode translated to 8080
        ; move from $2100 to $B000-$E000
        ld hl,$2100
        ld de,$B000
        ld bc,$2F00
        ldir
        jp $b000

        ; interpreter

RunPCode_File:
        ;coloca inteprete PCode en su sitio en $B000
        ld hl,intepreter_8080
        ld de,$B000
        ld bc,intepreter_8080_end - intepreter_8080 + 1
        ldir
        ; Load PCode file
        call LoadPCode
        jp $b000

BDOS:   ei
        call 005
        di
        ret

WBOOT:  ; end program, return to CP/M
        jp 0

CONOUT:  ; send to screen char in RegB
        push bc
        push de
        push hl
        push af
        ld e,b
        ld c,2  ; Console Output
        call bdos
        pop af
        pop hl
        pop de
        pop bc
        ld a, b ; return char printed also in A
        ret

CONIN:  ; read key at keyboard, return it in RegA
        push bc
        push de
        push hl
conin_loop:
        LD      C,6       ; Direct Console I/O, read nonblocking
        LD      E,$FF
        Call bdos
        or a
        jp z, conin_loop
        cp 'a'
        jp c, conin_end
        cp 'z'+1
        jp nc, conin_end
        sub 'a'-'A'       ; convert tu uppercase
conin_end:
        pop hl
        pop de
        pop bc
        cp 03;
        jp z, WBOOT ; ^C -> exit to CP/M
        ret




; Funciones de parcheo antes de ejehocutar

Patch:
       di       ; TINYPAS RUNTIME is a mess because instead of using IX and iY registers, it uses
                ; AF' BC' DE' HL' and EEX all time during compile
                ; Amstrad PCW uses CP/M 3.0 that relies on interrupts and second register file
                ; So if interrupts are not disabled during operation, the interrupts corrupts the registers
                ; and TINYPAS crashes. The solution is to disable interruts except when calling BDOS

       ld hl, $200d
       ld (hl),$c3 ; JMP
       inc hl
       ld (hl), CONOUT and $ff
       inc hl
       ld (hl), CONOUT >> 8

       ld hl, $2010
       ld (hl),$c3 ; JMP
       inc hl
       ld (hl), CONIN and $ff
       inc hl
       ld (hl), CONIN >> 8

       ld hl, $2028
       ld (hl),$c3 ; JMP
       inc hl
       ld (hl), WBOOT and $ff
       inc hl
       ld (hl), WBOOT >> 8

       ld hl, $1a29
       ld (hl), $21 ; LD HL, $HHHHH
       inc hl
       ld (hl), 0
       inc hl
       ld (hl), $10 ; LD HL, $1000 -> F000 is the end of stack

       ret

intepreter_8080:
       INCBIN  pint.bin  ; no el .P,hay que usarel.BIN que es el tranlata a 8080 del .P

intepreter_8080_end:
       db 0, 0

org $1a00

        INCBIN tiny_pascal_run_1A00.bin

ErrMsg: db "Read Error$"
ReadAddr db 0,0

LoadPCode:
        ld hl, $2100 ;  <-- load pcode at <- start of text buffer
        ld (ReadAddr), hl
        call LoadFileBin
        or a
        ret z
PrtErrMsg:
        ld de, ErrMsg
        ld c,9 ; PrtStr ErrMsg
        call bdos
        jp wboot

OpenReadFile:
        ld c, 15 ; Open
        ld de, $005c ; default fcb
        call bdos
        cp $FF
        ld a, 0
        ret nz
        jp PrtErrMsg

LoadFileBin:
        ; HL apunta al primer byte del filename
        call OpenReadFile
        or a
        ret nz
        LoadLoopBin:
        call ReadFileBin
        or a
        jr z, LoadLoopBin
        CloseLoadFileBin:
        call CloseFile
        ret

ReadFileBin:
        ld c, 20 ; read next record
        ld de, $005c
        call bdos
        or a  ; ok
        jr z, copybuf2
        cp 1  ; EOF
        ret z
        ; else error
        jp PrtErrMsg
        copybuf2:
        ; copy buffer to data area
        ld hl, $0080 ; default DMA Buf
        ld de, (ReadAddr)
        ld bc, 128
        ldir
        ld (ReadAddr), de
        ld a, 0
        ret

CloseFile:
        ld c, 16   ;close
        ld de, $005c
        call bdos
        cp $FF
        ld a, 0
        ret nz
        jp PrtErrMsg

org $1F00
        db "LITOPRLODSTOCALINTJMPJPCCSP???" ; Opcodes for intepreter PINT.PAS
org $20FF
       db 0



