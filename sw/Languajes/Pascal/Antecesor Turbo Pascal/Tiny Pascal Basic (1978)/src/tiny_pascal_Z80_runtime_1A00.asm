; Disassembly of the file "D:\xxx\dl\trs80\dZ80\tiny_pascal_run_1A00.bin"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Saturday, 12 of March 2016 at 10:20 PM
; 

;  INIT INTERPRETER - free mem at HL

1a00 23        INC     HL
1a01 22F21D    LD      (#1DF2),HL  ; Start Of Stack 
1a04 2B        DEC     HL
1a05 2B        DEC     HL
1a06 EB        EX      DE,HL
1a07 22F41D    LD      (#1DF4),HL  ; 
1a0a 210500    LD      HL,#0005
1a0d 19        ADD     HL,DE
1a0e 012820    LD      BC,#2028
1a11 70        LD      (HL),B
1a12 23        INC     HL
1a13 71        LD      (HL),C	   ; Push on PCode Stack CPM Return addr (2028)
1a14 C9        RET     

1a15 D5        PUSH    DE
1a16 5E        LD      E,(HL)
1a17 2B        DEC     HL
1a18 56        LD      D,(HL)
1a19 EB        EX      DE,HL
1a1a 3D        DEC     A
1a1b C2161A    JP      NZ,#1A16
1a1e D1        POP     DE
1a1f C9        RET     

1a20 EB        EX      DE,HL 
1a21 23        INC     HL
1a22 70        LD      (HL),B
1a23 23        INC     HL
1a24 71        LD      (HL),C
1a25 EB        EX      DE,HL
1a26 C9        RET     

; PCODE INT nn

1a27 19        ADD     HL,DE       ; DE=stack, HL=space in stack to reserve 
1a28 EB        EX      DE,HL
1a29 2AF41D    LD      HL,(#1DF4)  ; Start of PCode
1a2c 19        ADD     HL,DE
1a2d D0        RET     NC
1a2e 21381A    LD      HL,#1A38
1a31 CDF31B    CALL    #1BF3
1a34 E1        POP     HL
1a35 C32820    JP      #2028	   ; Return to CPM

1A38:	DB	' STACK'
1A3E:	DB	' OVERFLOW',13,10

1a49 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1a4c CD151A    CALL    #1A15
1a4f C3551A    JP      #1A55
1a52 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1a55 13        INC     DE
1a56 09        ADD     HL,BC
1a57 2B        DEC     HL
1a58 7E        LD      A,(HL)
1a59 12        LD      (DE),A
1a5a 23        INC     HL
1a5b 7E        LD      A,(HL)
1a5c 13        INC     DE
1a5d 12        LD      (DE),A
1a5e C9        RET     

1a5f AF        XOR     A
1a60 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1a63 B7        OR      A
1a64 C4151A    CALL    NZ,#1A15
1a67 09        ADD     HL,BC
1a68 EB        EX      DE,HL
1a69 4E        LD      C,(HL)
1a6a 2B        DEC     HL
1a6b 46        LD      B,(HL)
1a6c EB        EX      DE,HL
1a6d 09        ADD     HL,BC
1a6e C3561A    JP      #1A56
1a71 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1a74 CD151A    CALL    #1A15
1a77 C37D1A    JP      #1A7D
1a7a 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1a7d 09        ADD     HL,BC
1a7e 1A        LD      A,(DE)
1a7f 77        LD      (HL),A
1a80 2B        DEC     HL
1a81 1B        DEC     DE
1a82 1A        LD      A,(DE)
1a83 77        LD      (HL),A
1a84 1B        DEC     DE
1a85 C9        RET     

1a86 AF        XOR     A
1a87 EB        EX      DE,HL
1a88 5E        LD      E,(HL)
1a89 2B        DEC     HL
1a8a 56        LD      D,(HL)
1a8b 2B        DEC     HL
1a8c D5        PUSH    DE
1a8d 5E        LD      E,(HL)
1a8e 2B        DEC     HL
1a8f 56        LD      D,(HL)
1a90 2B        DEC     HL
1a91 EB        EX      DE,HL
1a92 29        ADD     HL,HL
1a93 09        ADD     HL,BC
1a94 44        LD      B,H
1a95 4D        LD      C,L
1a96 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1a99 B7        OR      A
1a9a C4151A    CALL    NZ,#1A15
1a9d 09        ADD     HL,BC
1a9e C1        POP     BC
1a9f 71        LD      (HL),C
1aa0 2B        DEC     HL
1aa1 70        LD      (HL),B
1aa2 C9        RET     

1aa3 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1aa6 44        LD      B,H
1aa7 4D        LD      C,L
1aa8 CD151A    CALL    #1A15
1aab C3B31A    JP      #1AB3
1aae 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1ab1 44        LD      B,H
1ab2 4D        LD      C,L
1ab3 D5        PUSH    DE
1ab4 EB        EX      DE,HL
1ab5 23        INC     HL
1ab6 72        LD      (HL),D
1ab7 23        INC     HL
1ab8 73        LD      (HL),E
1ab9 22F21D    LD      (#1DF2),HL  ; Start Of Stack 
1abc D1        POP     DE
1abd 23        INC     HL
1abe 70        LD      (HL),B
1abf 23        INC     HL
1ac0 71        LD      (HL),C
1ac1 C1        POP     BC
1ac2 C5        PUSH    BC
1ac3 03        INC     BC
1ac4 03        INC     BC
1ac5 03        INC     BC
1ac6 23        INC     HL
1ac7 70        LD      (HL),B
1ac8 23        INC     HL
1ac9 71        LD      (HL),C
1aca C9        RET     

1acb EB        EX      DE,HL
1acc 5E        LD      E,(HL)
1acd 2B        DEC     HL
1ace 56        LD      D,(HL)
1acf 3600      LD      (HL),#00
1ad1 1A        LD      A,(DE)
1ad2 23        INC     HL
1ad3 77        LD      (HL),A
1ad4 EB        EX      DE,HL
1ad5 C9        RET     

1ad6 1A        LD      A,(DE)
1ad7 1B        DEC     DE
1ad8 1B        DEC     DE
1ad9 CDCC1B    CALL    #1BCC
1adc 77        LD      (HL),A
1add C9        RET     

1ade CDCC1B    CALL    #1BCC
1ae1 E9        JP      (HL)

1AE2:	CALL #2010  		;CALL DOS CHAR IN
	LB B, A
	JP #200D   		;ECHO TO DOS CHAR OUT

1ae9 13        INC     DE
1aea AF        XOR     A
1aeb 12        LD      (DE),A
1aec 13        INC     DE
1aed CDE21A    CALL    #1AE2	; Read key in RegA
1af0 12        LD      (DE),A
1af1 C9        RET     

1af2 1A        LD      A,(DE)
1af3 1B        DEC     DE
1af4 1B        DEC     DE
1af5 47        LD      B,A
1af6 C30D20    JP      #200D  ; Princ char in RegB
1af9 D5        PUSH    DE
1afa 063F      LD      B,#3F
1afc CD0D20    CALL    #200D  ; Princ char in RegB
1aff 50        LD      D,B
1b00 AF        XOR     A
1b01 32781B    LD      (#1B78),A
1b04 67        LD      H,A
1b05 6F        LD      L,A
1b06 CDE21A    CALL    #1AE2	; Read key in RegA
1b09 FE20      CP      #20
1b0b CA061B    JP      Z,#1B06
1b0e FE2B      CP      #2B
1b10 CA1B1B    JP      Z,#1B1B
1b13 FE2D      CP      #2D
1b15 C21E1B    JP      NZ,#1B1E
1b18 32781B    LD      (#1B78),A
1b1b CDE21A    CALL    #1AE2	; Read key in RegA
1b1e D630      SUB     #30
1b20 FA431B    JP      M,#1B43
1b23 FE0A      CP      #0A
1b25 F2431B    JP      P,#1B43
1b28 5F        LD      E,A
1b29 AF        XOR     A
1b2a 57        LD      D,A
1b2b 29        ADD     HL,HL
1b2c 44        LD      B,H
1b2d 4D        LD      C,L
1b2e 29        ADD     HL,HL
1b2f 8F        ADC     A,A
1b30 29        ADD     HL,HL
1b31 8F        ADC     A,A
1b32 09        ADD     HL,BC
1b33 8F        ADC     A,A
1b34 19        ADD     HL,DE
1b35 8F        ADC     A,A
1b36 C23D1B    JP      NZ,#1B3D  ;Prt "SIZE ERROR"
1b39 B4        OR      H
1b3a F21B1B    JP      P,#1B1B

1b3d 216B1B    LD      HL,#1B6B  ; Str "SIZE ERROR"
1b40 C3571B    JP      #1B57

1b43 AF        XOR     A
1b44 82        ADD     A,D
1b45 C2541B    JP      NZ,#1B54
1b48 3A781B    LD      A,(#1B78)
1b4b B7        OR      A
1b4c C4D31B    CALL    NZ,#1BD3
1b4f D1        POP     DE
1b50 13        INC     DE
1b51 C3C61B    JP      #1BC6
1b54 215D1B    LD      HL,#1B5D   ; Str "INPUT ERROR"
1b57 CDF31B    CALL    #1BF3
1b5a C3FA1A    JP      #1AFA

1B5D:	DB	' INPUT ERROR',13,10
1B6B:	DB	' SIZE ERROR',13,10

1b78 00        NOP     
1b79 CDCC1B    CALL    #1BCC
1b7c D5        PUSH    DE
1b7d AF        XOR     A
1b7e 3D        DEC     A
1b7f F5        PUSH    AF
1b80 A4        AND     H
1b81 F28C1B    JP      P,#1B8C
1b84 062D      LD      B,#2D
1b86 CD0D20    CALL    #200D  ; Princ char in RegB
1b89 CDD31B    CALL    #1BD3
1b8c 010A00    LD      BC,#000A
1b8f CD771C    CALL    #1C77
1b92 3E30      LD      A,#30
1b94 83        ADD     A,E
1b95 F5        PUSH    AF
1b96 7C        LD      A,H
1b97 B5        OR      L
1b98 C28C1B    JP      NZ,#1B8C
1b9b F1        POP     AF
1b9c 47        LD      B,A
1b9d CD0D20    CALL    #200D  ; Princ char in RegB
1ba0 F1        POP     AF
1ba1 F29C1B    JP      P,#1B9C
1ba4 D1        POP     DE
1ba5 C9        RET     

1ba6 2AF21D    LD      HL,(#1DF2)  ; Start Of Stack 
1ba9 23        INC     HL
1baa 56        LD      D,(HL)
1bab 23        INC     HL
1bac 5E        LD      E,(HL)
1bad EB        EX      DE,HL
1bae 22F21D    LD      (#1DF2),HL  ; Start Of Stack 
1bb1 EB        EX      DE,HL
1bb2 23        INC     HL
1bb3 56        LD      D,(HL)
1bb4 23        INC     HL
1bb5 5E        LD      E,(HL)
1bb6 01FAFF    LD      BC,#FFFA
1bb9 09        ADD     HL,BC
1bba EB        EX      DE,HL
1bbb E9        JP      (HL)
1bbc EB        EX      DE,HL
1bbd 4E        LD      C,(HL)
1bbe 2B        DEC     HL
1bbf 46        LD      B,(HL)
1bc0 2B        DEC     HL
1bc1 5E        LD      E,(HL)
1bc2 2B        DEC     HL
1bc3 56        LD      D,(HL)
1bc4 EB        EX      DE,HL
1bc5 C9        RET     

1bc6 EB        EX      DE,HL
1bc7 72        LD      (HL),D
1bc8 23        INC     HL
1bc9 73        LD      (HL),E
1bca EB        EX      DE,HL
1bcb C9        RET     

1bcc EB        EX      DE,HL
1bcd 5E        LD      E,(HL)
1bce 2B        DEC     HL
1bcf 56        LD      D,(HL)
1bd0 2B        DEC     HL
1bd1 EB        EX      DE,HL
1bd2 C9        RET     

1bd3 AF        XOR     A
1bd4 95        SUB     L
1bd5 6F        LD      L,A
1bd6 9C        SBC     A,H
1bd7 95        SUB     L
1bd8 67        LD      H,A
1bd9 D680      SUB     #80
1bdb B5        OR      L
1bdc C0        RET     NZ

1bdd C3EA1B    JP      #1BEA
1be0 AF        XOR     A
1be1 91        SUB     C
1be2 4F        LD      C,A
1be3 98        SBC     A,B
1be4 91        SUB     C
1be5 47        LD      B,A
1be6 D680      SUB     #80
1be8 B1        OR      C
1be9 C0        RET     NZ

1bea 213E1A    LD      HL,#1A3E
1bed CDF31B    CALL    #1BF3
1bf0 C3C61B    JP      #1BC6

; Print Str at (HL)

1bf3 0E0A      LD      C,#0A
1bf5 46        LD      B,(HL)
1bf6 23        INC     HL
1bf7 CD0D20    CALL    #200D  ; Princ char in RegB
1bfa B9        CP      C
1bfb C2F51B    JP      NZ,#1BF5
1bfe C9        RET     

1bff CDE01B    CALL    #1BE0
1c02 78        LD      A,B
1c03 AC        XOR     H
1c04 09        ADD     HL,BC
1c05 4F        LD      C,A
1c06 1F        RRA     
1c07 A9        XOR     C
1c08 AC        XOR     H
1c09 F2C61B    JP      P,#1BC6
1c0c C3EA1B    JP      #1BEA
1c0f CDBC1B    CALL    #1BBC
1c12 C3021C    JP      #1C02
1c15 CDBC1B    CALL    #1BBC
1c18 78        LD      A,B
1c19 D680      SUB     #80
1c1b B1        OR      C
1c1c C2FF1B    JP      NZ,#1BFF
1c1f 79        LD      A,C
1c20 C3031C    JP      #1C03
1c23 EB        EX      DE,HL
1c24 AF        XOR     A
1c25 96        SUB     (HL)
1c26 77        LD      (HL),A
1c27 4F        LD      C,A
1c28 2B        DEC     HL
1c29 9E        SBC     A,(HL)
1c2a 91        SUB     C
1c2b 77        LD      (HL),A
1c2c 23        INC     HL
1c2d EB        EX      DE,HL
1c2e C9        RET     

1c2f 1608      LD      D,#08
1c31 29        ADD     HL,HL
1c32 07        RLCA    
1c33 D2371C    JP      NC,#1C37
1c36 09        ADD     HL,BC
1c37 15        DEC     D
1c38 C2311C    JP      NZ,#1C31
1c3b C9        RET     

1c3c CDBC1B    CALL    #1BBC
1c3f D5        PUSH    DE
1c40 7C        LD      A,H
1c41 5D        LD      E,L
1c42 210000    LD      HL,#0000
1c45 B7        OR      A
1c46 C42F1C    CALL    NZ,#1C2F
1c49 7B        LD      A,E
1c4a CD2F1C    CALL    #1C2F
1c4d D1        POP     DE
1c4e C3C61B    JP      #1BC6
1c51 CDBC1B    CALL    #1BBC
1c54 D5        PUSH    DE
1c55 CD771C    CALL    #1C77
1c58 D1        POP     DE
1c59 C3C61B    JP      #1BC6
1c5c 21681C    LD      HL,#1C68
1c5f CDF31B    CALL    #1BF3
1c62 210000    LD      HL,#0000
1c65 54        LD      D,H
1c66 5D        LD      E,L
1c67 C9        RET     

1C68:	DB	' DIVIDE CHECK',13,10

1c77 78        LD      A,B
1c78 B1        OR      C
1c79 CA5C1C    JP      Z,#1C5C
1c7c AF        XOR     A
1c7d 80        ADD     A,B
1c7e F5        PUSH    AF
1c7f F4E01B    CALL    P,#1BE0
1c82 AF        XOR     A
1c83 84        ADD     A,H
1c84 F5        PUSH    AF
1c85 FCD31B    CALL    M,#1BD3
1c88 EB        EX      DE,HL
1c89 210000    LD      HL,#0000
1c8c 3E10      LD      A,#10
1c8e 29        ADD     HL,HL
1c8f EB        EX      DE,HL
1c90 29        ADD     HL,HL
1c91 EB        EX      DE,HL
1c92 D2961C    JP      NC,#1C96
1c95 23        INC     HL
1c96 E5        PUSH    HL
1c97 09        ADD     HL,BC
1c98 D2A51C    JP      NC,#1CA5
1c9b 1C        INC     E
1c9c 33        INC     SP
1c9d 33        INC     SP
1c9e 3D        DEC     A
1c9f C28E1C    JP      NZ,#1C8E
1ca2 C3AA1C    JP      #1CAA
1ca5 E1        POP     HL
1ca6 3D        DEC     A
1ca7 C28E1C    JP      NZ,#1C8E
1caa EB        EX      DE,HL
1cab C1        POP     BC
1cac F1        POP     AF
1cad A8        XOR     B
1cae FCD31B    CALL    M,#1BD3
1cb1 7A        LD      A,D
1cb2 B3        OR      E
1cb3 C8        RET     Z

1cb4 AF        XOR     A
1cb5 80        ADD     A,B
1cb6 F0        RET     P

1cb7 AF        XOR     A
1cb8 93        SUB     E
1cb9 5F        LD      E,A
1cba 9A        SBC     A,D
1cbb 93        SUB     E
1cbc 57        LD      D,A
1cbd C9        RET     

1cbe 1A        LD      A,(DE)
1cbf E601      AND     #01
1cc1 12        LD      (DE),A
1cc2 AF        XOR     A
1cc3 1B        DEC     DE
1cc4 12        LD      (DE),A
1cc5 13        INC     DE
1cc6 C9        RET     

1cc7 CDBC1B    CALL    #1BBC
1cca D5        PUSH    DE
1ccb CD771C    CALL    #1C77
1cce EB        EX      DE,HL
1ccf D1        POP     DE
1cd0 C3C61B    JP      #1BC6
1cd3 3E01      LD      A,#01
1cd5 F5        PUSH    AF
1cd6 CDBC1B    CALL    #1BBC
1cd9 AF        XOR     A
1cda 12        LD      (DE),A
1cdb 13        INC     DE
1cdc 7D        LD      A,L
1cdd B9        CP      C
1cde C2021D    JP      NZ,#1D02
1ce1 7C        LD      A,H
1ce2 B8        CP      B
1ce3 C2021D    JP      NZ,#1D02
1ce6 F1        POP     AF
1ce7 12        LD      (DE),A
1ce8 C9        RET     

1ce9 AF        XOR     A
1cea C3D51C    JP      #1CD5
1ced 0600      LD      B,#00
1cef 48        LD      C,B
1cf0 C5        PUSH    BC
1cf1 CDBC1B    CALL    #1BBC
1cf4 AF        XOR     A
1cf5 12        LD      (DE),A
1cf6 13        INC     DE
1cf7 7C        LD      A,H
1cf8 B8        CP      B
1cf9 CA071D    JP      Z,#1D07
1cfc 1F        RRA     
1cfd AC        XOR     H
1cfe A8        XOR     B
1cff FAE61C    JP      M,#1CE6
1d02 F1        POP     AF
1d03 EE01      XOR     #01
1d05 12        LD      (DE),A
1d06 C9        RET     

1d07 7D        LD      A,L
1d08 B9        CP      C
1d09 DAE61C    JP      C,#1CE6
1d0c C1        POP     BC
1d0d 78        LD      A,B
1d0e C2121D    JP      NZ,#1D12
1d11 A9        XOR     C
1d12 EE01      XOR     #01
1d14 12        LD      (DE),A
1d15 C9        RET     

1d16 0601      LD      B,#01
1d18 0E00      LD      C,#00
1d1a C3F01C    JP      #1CF0
1d1d 0600      LD      B,#00
1d1f 0E01      LD      C,#01
1d21 C3F01C    JP      #1CF0
1d24 0601      LD      B,#01
1d26 48        LD      C,B
1d27 C3F01C    JP      #1CF0
1d2a CDBC1B    CALL    #1BBC
1d2d 7C        LD      A,H
1d2e B0        OR      B
1d2f 12        LD      (DE),A
1d30 7D        LD      A,L
1d31 B1        OR      C
1d32 13        INC     DE
1d33 12        LD      (DE),A
1d34 C9        RET     

1d35 CDBC1B    CALL    #1BBC
1d38 7C        LD      A,H
1d39 A0        AND     B
1d3a 12        LD      (DE),A
1d3b 7D        LD      A,L
1d3c A1        AND     C
1d3d 13        INC     DE
1d3e 12        LD      (DE),A
1d3f C9        RET     

1d40 1A        LD      A,(DE)
1d41 2F        CPL     
1d42 12        LD      (DE),A
1d43 1B        DEC     DE
1d44 1A        LD      A,(DE)
1d45 2F        CPL     
1d46 12        LD      (DE),A
1d47 13        INC     DE
1d48 C9        RET     

1d49 CDBC1B    CALL    #1BBC
1d4c AF        XOR     A
1d4d 81        ADD     A,C
1d4e C8        RET     Z

1d4f FA641D    JP      M,#1D64
1d52 29        ADD     HL,HL
1d53 3D        DEC     A
1d54 C2521D    JP      NZ,#1D52
1d57 C3C61B    JP      #1BC6
1d5a CDBC1B    CALL    #1BBC
1d5d AF        XOR     A
1d5e 91        SUB     C
1d5f C8        RET     Z

1d60 F2521D    JP      P,#1D52
1d63 4F        LD      C,A
1d64 AF        XOR     A
1d65 B4        OR      H
1d66 1F        RRA     
1d67 67        LD      H,A
1d68 7D        LD      A,L
1d69 1F        RRA     
1d6a 6F        LD      L,A
1d6b 0C        INC     C
1d6c C2641D    JP      NZ,#1D64
1d6f C3C61B    JP      #1BC6
1d72 1A        LD      A,(DE)
1d73 C601      ADD     A,#01
1d75 12        LD      (DE),A
1d76 D0        RET     NC

1d77 62        LD      H,D
1d78 6B        LD      L,E
1d79 2B        DEC     HL
1d7a 34        INC     (HL)
1d7b C9        RET     

1d7c 1A        LD      A,(DE)
1d7d D601      SUB     #01
1d7f 12        LD      (DE),A
1d80 D0        RET     NC

1d81 62        LD      H,D
1d82 6B        LD      L,E
1d83 2B        DEC     HL
1d84 35        DEC     (HL)
1d85 C9        RET     

1d86 62        LD      H,D
1d87 6B        LD      L,E
1d88 13        INC     DE
1d89 2B        DEC     HL
1d8a 7E        LD      A,(HL)
1d8b 12        LD      (DE),A
1d8c 13        INC     DE
1d8d 23        INC     HL
1d8e 7E        LD      A,(HL)
1d8f 12        LD      (DE),A
1d90 C9        RET     

1d91 13        INC     DE
1d92 CD9E1D    CALL    #1D9E
1d95 81        ADD     A,C
1d96 12        LD      (DE),A
1d97 CD9E1D    CALL    #1D9E
1d9a 81        ADD     A,C
1d9b 13        INC     DE
1d9c 12        LD      (DE),A
1d9d C9        RET     

1d9e CDA61D    CALL    #1DA6
1da1 07        RLCA    
1da2 07        RLCA    
1da3 07        RLCA    
1da4 07        RLCA    
1da5 4F        LD      C,A
1da6 CDE21A    CALL    #1AE2	; Read key in RegA
1da9 D630      SUB     #30
1dab FAB91D    JP      M,#1DB9
1dae FE0A      CP      #0A
1db0 F8        RET     M

1db1 D607      SUB     #07
1db3 FAB91D    JP      M,#1DB9
1db6 FE10      CP      #10
1db8 F8        RET     M

1db9 215D1B    LD      HL,#1B5D   ; Str "INPUT ERROR"
1dbc CDF31B    CALL    #1BF3
1dbf E1        POP     HL
1dc0 E1        POP     HL
1dc1 C3921D    JP      #1D92
1dc4 1A        LD      A,(DE)
1dc5 6F        LD      L,A
1dc6 1B        DEC     DE
1dc7 1A        LD      A,(DE)
1dc8 1B        DEC     DE
1dc9 CDCD1D    CALL    #1DCD
1dcc 7D        LD      A,L
1dcd 4F        LD      C,A
1dce E6F0      AND     #F0
1dd0 0F        RRCA    
1dd1 0F        RRCA    
1dd2 0F        RRCA    
1dd3 0F        RRCA    
1dd4 CDDA1D    CALL    #1DDA
1dd7 79        LD      A,C
1dd8 E60F      AND     #0F
1dda FE0A      CP      #0A
1ddc FAE11D    JP      M,#1DE1
1ddf C607      ADD     A,#07
1de1 C630      ADD     A,#30
1de3 47        LD      B,A
1de4 C30D20    JP      #200D  ; Princ char in RegB

1de7 E1        POP     HL    ;PRINT A STRING
1de8 46        LD      B,(HL)
1de9 CD0D20    CALL    #200D  ; Princ char in RegB
1dec 23        INC     HL
1ded 0D        DEC     C
1dee C2E81D    JP      NZ,#1DE8
1df1 E9        JP      (HL)


1df2 db 00, 00   ; Start of Stack
1DF4 db 00, 00   

