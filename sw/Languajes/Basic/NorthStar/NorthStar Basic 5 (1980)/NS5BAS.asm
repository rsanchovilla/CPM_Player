; Disassembly of the file "D:\xxx\dl\trs80\dZ80\NS5BAS.COM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Monday, 07 of March 2016 at 12:43 PM
; 
0100 C38035    JP      #3580

0103 013721    LD      BC,#2137
0106 		db	$3F80	; ????
0108 11
0109		db 7FFF 	; End of RAN (MEMSET)
010b C32101    JP      #0121
010e A5        AND     L
010f 01E883    LD      BC,#83E8
0112 2E18      LD      L,#18
0114 C3DF01    JP      #01DF
0117 5F        LD      E,A

0118 		db 00		; $0118=0-> check ^C, =1 -> no check ^C 

0119 70        LD      (HL),B
011a 34        INC     (HL)
011b 75        LD      (HL),L
011c 33        INC     SP
011d 8A        ADC     A,D
011e 323D31    LD      (#313D),A
0121 3E01      LD      A,#01
0123 322631    LD      (#3126),A
0126 23        INC     HL
0127 223931    LD      (#3139),HL
012a EB        EX      DE,HL
012b 223B31    LD      (#313B),HL
012e 3E00      LD      A,#00
0130 322C31    LD      (#312C),A
0133 217A2E    LD      HL,#2E7A
0136 F9        LD      SP,HL
0137 22ED2E    LD      (#2EED),HL
013a CDD92D    CALL    #2DD9
013d 3E01      LD      A,#01
013f 32EB2E    LD      (#2EEB),A
0142 3E00      LD      A,#00
0144 327A2E    LD      (#2E7A),A
0147 32E32E    LD      (#2EE3),A
014a D2A301    JP      NC,#01A3
014d 2A3931    LD      HL,(#3139)
0150 7E        LD      A,(HL)
0151 FE01      CP      #01
0153 CA8001    JP      Z,#0180
0156 B7        OR      A
0157 CA6801    JP      Z,#0168
015a CD9B29    CALL    #299B
015d EB        EX      DE,HL
015e 213B31    LD      HL,#313B
0161 CDCF1C    CALL    #1CCF
0164 EB        EX      DE,HL
0165 DA5001    JP      C,#0150
0168 2A3931    LD      HL,(#3139)
016b 3A2C31    LD      A,(#312C)
016e B7        OR      A
016f CA7501    JP      Z,#0175
0172 2A2F31    LD      HL,(#312F)
0175 3601      LD      (HL),#01
0177 CD0606    CALL    #0606
017a 011C04    LD      BC,#041C
017d C3F102    JP      #02F1
0180 223731    LD      (#3137),HL
0183 3A2C31    LD      A,(#312C)
0186 B7        OR      A
0187 CA9D01    JP      Z,#019D
018a 2A2F31    LD      HL,(#312F)
018d 23        INC     HL
018e CDB519    CALL    #19B5
0191 2A2D31    LD      HL,(#312D)
0194 CDCF1C    CALL    #1CCF
0197 DAC402    JP      C,#02C4
019a CAC402    JP      Z,#02C4
019d CD0606    CALL    #0606
01a0 C3C401    JP      #01C4
01a3 210F01    LD      HL,#010F
01a6 AF        XOR     A
01a7 B6        OR      (HL)
01a8 3601      LD      (HL),#01
01aa CAD901    JP      Z,#01D9
01ad CDFE05    CALL    #05FE
01b0 21832E    LD      HL,#2E83
01b3 117B2E    LD      DE,#2E7B
01b6 0E08      LD      C,#08
01b8 3A0E01    LD      A,(#010E)
01bb 3600      LD      (HL),#00
01bd 12        LD      (DE),A
01be 23        INC     HL
01bf 13        INC     DE
01c0 0D        DEC     C
01c1 C2BB01    JP      NZ,#01BB
01c4 CD2B1D    CALL    #1D2B
01c7 CD111D    CALL    #1D11
01ca CD8218    CALL    #1882
01cd 3E0D      LD      A,#0D
01cf 32022F    LD      (#2F02),A
01d2 CDCF2D    CALL    #2DCF
01d5 3A2631    LD      A,(#3126)
01d8 B7        OR      A
01d9 2A3931    LD      HL,(#3139)
01dc CCAA0A    CALL    Z,#0AAA

01df AF        XOR     A
01e0 327A2E    LD      (#2E7A),A
01e3 CDD92D    CALL    #2DD9
01e6 CD572D    CALL    #2D57
01e9 CDD521    CALL    #21D5
01ec 3E01      LD      A,#01
01ee 32EB2E    LD      (#2EEB),A
01f1 21BE12    LD      HL,#12BE
01f4 CDBD1C    CALL    #1CBD
01f7 CDDA21    CALL    #21DA
01fa 2AED2E    LD      HL,(#2EED)
01fd F9        LD      SP,HL
01fe 210000    LD      HL,#0000
0201 222F31    LD      (#312F),HL
0204 223131    LD      (#3131),HL
0207 AF        XOR     A
0208 322931    LD      (#3129),A
020b 3AE32E    LD      A,(#2EE3)
020e B7        OR      A
020f CA4E02    JP      Z,#024E
0212 2AE42E    LD      HL,(#2EE4)
0215 11FC2F    LD      DE,#2FFC
0218 CD0620    CALL    #2006
021b D5        PUSH    DE
021c 3E0D      LD      A,#0D
021e 12        LD      (DE),A
021f 21FC2F    LD      HL,#2FFC
0222 CDB81C    CALL    #1CB8
0225 2AE42E    LD      HL,(#2EE4)
0228 EB        EX      DE,HL
0229 2AE62E    LD      HL,(#2EE6)
022c 19        ADD     HL,DE
022d DC010A    CALL    C,#0A01
0230 22E42E    LD      (#2EE4),HL
0233 E1        POP     HL
0234 E5        PUSH    HL
0235 11FC2F    LD      DE,#2FFC
0238 CD8A1D    CALL    #1D8A
023b E5        PUSH    HL
023c CD1C22    CALL    #221C
023f E1        POP     HL
0240 95        SUB     L
0241 4F        LD      C,A
0242 11022F    LD      DE,#2F02
0245 19        ADD     HL,DE
0246 D1        POP     DE
0247 EB        EX      DE,HL
0248 CD6B20    CALL    #206B
024b C35102    JP      #0251
024e CD6520    CALL    #2065 	; read line at $2F02
0251 CDDA21    CALL    #21DA
0254 3AFC2F    LD      A,(#2FFC)
0257 FE0D      CP      #0D
0259 CC010A    CALL    Z,#0A01
025c CA0702    JP      Z,#0207
025f CDC404    CALL    #04C4	; Tokenize? C=1 -> is a token
0262 DA7302    JP      C,#0273
0265 3AA72F    LD      A,(#2FA7)
0268 FE04      CP      #04
026a CC010A    CALL    Z,#0A01
026d CDE228    CALL    #28E2
0270 C30702    JP      #0207

; Execute direct command

0273 CD010A    CALL    #0A01
0276 CD7C02    CALL    #027C	; Execute token
0279 C3DF01    JP      #01DF

; Execute token 

027c 21AA2F    LD      HL,#2FAA
027f 22F32E    LD      (#2EF3),HL
0282 CD8D1C    CALL    #1C8D
0285 E6F0      AND     #F0
0287 FEA0      CP      #A0
0289 11F312    LD      DE,#12F3
028c CA4F0B    JP      Z,#0B4F
028f CD340B    CALL    #0B34
0292 CD8D1C    CALL    #1C8D
0295 FE0D      CP      #0D
0297 C8        RET     Z

0298 21EA2E    LD      HL,#2EEA
029b BE        CP      (HL)
029c C2EE02    JP      NZ,#02EE
029f C9        RET     

02a0 01A703    LD      BC,#03A7
02a3 C3F102    JP      #02F1
02a6 01AC03    LD      BC,#03AC
02a9 C3F102    JP      #02F1
02ac 01B603    LD      BC,#03B6
02af C3F102    JP      #02F1
02b2 01C403    LD      BC,#03C4
02b5 C3F102    JP      #02F1
02b8 01D303    LD      BC,#03D3
02bb C3F102    JP      #02F1
02be 01D903    LD      BC,#03D9
02c1 C3F102    JP      #02F1
02c4 2A2F31    LD      HL,(#312F)
02c7 223731    LD      (#3137),HL
02ca 3601      LD      (HL),#01
02cc 01E103    LD      BC,#03E1
02cf C3F102    JP      #02F1
02d2 01F403    LD      BC,#03F4
02d5 C3F102    JP      #02F1
02d8 01EE03    LD      BC,#03EE
02db C3F102    JP      #02F1
02de 2A3731    LD      HL,(#3137)
02e1 2B        DEC     HL
02e2 22F32E    LD      (#2EF3),HL
02e5 C3F102    JP      #02F1
02e8 01FF03    LD      BC,#03FF
02eb C3F102    JP      #02F1
02ee 010C04    LD      BC,#040C
02f1 3AE92E    LD      A,(#2EE9)
02f4 B7        OR      A
02f5 CA0703    JP      Z,#0307
02f8 2AE730    LD      HL,(#30E7)
02fb 22F92E    LD      (#2EF9),HL
02fe 2AE530    LD      HL,(#30E5)
0301 110000    LD      DE,#0000
0304 CDB019    CALL    #19B0
0307 0B        DEC     BC
0308 0A        LD      A,(BC)
0309 03        INC     BC
030a 322631    LD      (#3126),A
030d E680      AND     #80
030f F21D03    JP      P,#031D
0312 3AEB2E    LD      A,(#2EEB)
0315 B7        OR      A
0316 C21D03    JP      NZ,#031D
0319 3AF730    LD      A,(#30F7)
031c B7        OR      A
031d F5        PUSH    AF
031e FA3303    JP      M,#0333
0321 AF        XOR     A
0322 327A2E    LD      (#2E7A),A
0325 C5        PUSH    BC
0326 CDD521    CALL    #21D5
0329 E1        POP     HL
032a CDBD1C    CALL    #1CBD
032d 21DD12    LD      HL,#12DD
0330 CDBD1C    CALL    #1CBD
0333 3AEB2E    LD      A,(#2EEB)
0336 B7        OR      A
0337 C2DF01    JP      NZ,#01DF
033a 2A3931    LD      HL,(#3139)
033d 44        LD      B,H
033e 4D        LD      C,L
033f 5E        LD      E,(HL)
0340 1600      LD      D,#00
0342 19        ADD     HL,DE
0343 EB        EX      DE,HL
0344 21F32E    LD      HL,#2EF3
0347 CDCF1C    CALL    #1CCF
034a EB        EX      DE,HL
034b DA3D03    JP      C,#033D
034e 03        INC     BC
034f 0A        LD      A,(BC)
0350 6F        LD      L,A
0351 03        INC     BC
0352 0A        LD      A,(BC)
0353 67        LD      H,A
0354 F1        POP     AF
0355 FA7203    JP      M,#0372
0358 E5        PUSH    HL
0359 21E412    LD      HL,#12E4
035c CDBD1C    CALL    #1CBD
035f E1        POP     HL
0360 11AA2F    LD      DE,#2FAA
0363 CD0620    CALL    #2006
0366 3E0D      LD      A,#0D
0368 12        LD      (DE),A
0369 21AA2F    LD      HL,#2FAA
036c CDB81C    CALL    #1CB8
036f C3DF01    JP      #01DF
0372 CDA11E    CALL    #1EA1
0375 2AF330    LD      HL,(#30F3)
0378 CD141C    CALL    #1C14
037b 3A2631    LD      A,(#3126)
037e E67F      AND     #7F
0380 6F        LD      L,A
0381 2600      LD      H,#00
0383 CDA11E    CALL    #1EA1
0386 2AF530    LD      HL,(#30F5)
0389 CD141C    CALL    #1C14
038c AF        XOR     A
038d 32F730    LD      (#30F7),A
0390 2AEF2E    LD      HL,(#2EEF)
0393 F9        LD      SP,HL
0394 2AF12E    LD      HL,(#2EF1)
0397 22DD30    LD      (#30DD),HL
039a 2AF130    LD      HL,(#30F1)
039d 23        INC     HL
039e 23        INC     HL
039f 23        INC     HL
03a0 22F32E    LD      (#2EF3),HL
03a3 C3180B    JP      #0B18

03a6 		db $81, "ARG", $22 		; 81, 41, 52, 47, 22
03ab 		db $82, "DIMENSION", $22
03b6 		db "FUNCTION DEF", $22
03c3 		db $83, "OUT OF BOUNDS", $22
03d2 		db $84, "TYPE", $22
03d8 		db $85, "FORMAT", $22
03e0 		db $86, "LINE NUMBER", $22
03ed 		db $87, "FILE",$22
03f3 		db $88, "HARD DISK", $22
03fe 		db $89, "DIVIDE ZERO", $22
040b 		db $8A, "SYNTAX", $22
0413 		db "CONTINUE", $22
041c 		db "TOO LARGE OR NO PROGRAM", $22
0434 		db "DOUBLE DEF", $22
043f 		db "CONTROL STACK", $22
044d 		db "MISSING NEXT", $22
045A 		db $8B, "READ",$22
0469 		db "INTERNAL STACK OV", $22
0472 		db $8C, "INPUT", $22
0479 		db "MEMORY FULL", $22
0485 		db $8D, "ARG MISMATCH", $22
0493 		db "ILLEGAL DIRECT",$22
04a2 		db $90, "LENGHT",$22
04aa 		db $8E, "NUMERIC OV",$22
04b6 		db $8F, "STOP", $22
04bc 		db " BLOCKS", $22

04c4 21FC2F    LD      HL, (#2FFC)
04c7 22F32E    LD      (#2EF3),HL
04ca CDBA1F    CALL    #1FBA
04cd 22A82F    LD      (#2FA8),HL
04d0 F5        PUSH    AF
04d1 2AF32E    LD      HL,(#2EF3)
04d4 0E04      LD      C,#04
04d6 11AA2F    LD      DE,#2FAA
04d9 CDB005    CALL    #05B0
04dc 7E        LD      A,(HL)
04dd FE5D      CP      #5D
04df C2E404    JP      NZ,#04E4
04e2 3629      LD      (HL),#29
04e4 FE3B      CP      #3B
04e6 C2EB04    JP      NZ,#04EB
04e9 362C      LD      (HL),#2C
04eb FE3A      CP      #3A
04ed C2F204    JP      NZ,#04F2
04f0 365C      LD      (HL),#5C
04f2 D5        PUSH    DE
04f3 115313    LD      DE,#1353
04f6 E5        PUSH    HL
04f7 1A        LD      A,(DE)
04f8 47        LD      B,A
04f9 13        INC     DE
04fa 1A        LD      A,(DE)
04fb BE        CP      (HL)
04fc C20305    JP      NZ,#0503
04ff 23        INC     HL
0500 C3F904    JP      #04F9
0503 B7        OR      A
0504 FA3505    JP      M,#0535
0507 13        INC     DE
0508 1A        LD      A,(DE)
0509 B7        OR      A
050a F20705    JP      P,#0507
050d E1        POP     HL
050e EEFF      XOR     #FF
0510 C2F604    JP      NZ,#04F6
0513 D1        POP     DE
0514 7E        LD      A,(HL)
0515 FE0D      CP      #0D
0517 CAA705    JP      Z,#05A7
051a 12        LD      (DE),A
051b 13        INC     DE
051c 0C        INC     C
051d 23        INC     HL
051e FE22      CP      #22
0520 C2D904    JP      NZ,#04D9
0523 7E        LD      A,(HL)
0524 FE0D      CP      #0D
0526 CAA705    JP      Z,#05A7
0529 12        LD      (DE),A
052a 13        INC     DE
052b 0C        INC     C
052c 23        INC     HL
052d FE22      CP      #22
052f CAD904    JP      Z,#04D9
0532 C32305    JP      #0523
0535 F1        POP     AF
0536 D1        POP     DE
0537 78        LD      A,B
0538 12        LD      (DE),A
0539 13        INC     DE
053a 0C        INC     C
053b FEAF      CP      #AF
053d CA2305    JP      Z,#0523
0540 FEAA      CP      #AA
0542 CA2305    JP      Z,#0523
0545 FEA5      CP      #A5
0547 CA2305    JP      Z,#0523
054a FEA7      CP      #A7
054c CA2305    JP      Z,#0523
054f FEA9      CP      #A9
0551 CA2305    JP      Z,#0523
0554 FE89      CP      #89
0556 CA7705    JP      Z,#0577
0559 FE88      CP      #88
055b CA7705    JP      Z,#0577
055e FE96      CP      #96
0560 CA7705    JP      Z,#0577
0563 FE8E      CP      #8E
0565 CA7705    JP      Z,#0577
0568 FEB4      CP      #B4
056a CA7705    JP      Z,#0577
056d FE9F      CP      #9F
056f CA7705    JP      Z,#0577
0572 FEB2      CP      #B2
0574 C2D904    JP      NZ,#04D9
0577 CDB005    CALL    #05B0
057a 22F32E    LD      (#2EF3),HL
057d C5        PUSH    BC
057e D5        PUSH    DE
057f CDBA1F    CALL    #1FBA
0582 D1        POP     DE
0583 C1        POP     BC
0584 3E9A      LD      A,#9A
0586 12        LD      (DE),A
0587 44        LD      B,H
0588 7D        LD      A,L
0589 2AF32E    LD      HL,(#2EF3)
058c DAD904    JP      C,#04D9
058f 13        INC     DE
0590 0C        INC     C
0591 12        LD      (DE),A
0592 13        INC     DE
0593 0C        INC     C
0594 78        LD      A,B
0595 12        LD      (DE),A
0596 13        INC     DE
0597 0C        INC     C
0598 CDB005    CALL    #05B0
059b FE2C      CP      #2C
059d C2D904    JP      NZ,#04D9
05a0 12        LD      (DE),A
05a1 13        INC     DE
05a2 23        INC     HL
05a3 0C        INC     C
05a4 C37705    JP      #0577
05a7 3E0D      LD      A,#0D
05a9 12        LD      (DE),A
05aa 21A72F    LD      HL,#2FA7
05ad 71        LD      (HL),C
05ae F1        POP     AF
05af C9        RET     

05b0 2B        DEC     HL
05b1 1B        DEC     DE
05b2 0D        DEC     C
05b3 23        INC     HL
05b4 13        INC     DE
05b5 0C        INC     C
05b6 7E        LD      A,(HL)
05b7 12        LD      (DE),A
05b8 FE20      CP      #20
05ba CAB305    JP      Z,#05B3
05bd C9        RET     

05be 23        INC     HL
05bf E5        PUSH    HL
05c0 CDD71C    CALL    #1CD7
05c3 CD0620    CALL    #2006
05c6 E1        POP     HL
05c7 23        INC     HL
05c8 23        INC     HL
05c9 7E        LD      A,(HL)
05ca FE9A      CP      #9A
05cc CAF305    JP      Z,#05F3
05cf B7        OR      A
05d0 FADB05    JP      M,#05DB
05d3 12        LD      (DE),A
05d4 FE0D      CP      #0D
05d6 C8        RET     Z

05d7 13        INC     DE
05d8 C3C805    JP      #05C8
05db E5        PUSH    HL
05dc 215313    LD      HL,#1353
05df BE        CP      (HL)
05e0 23        INC     HL
05e1 C2DF05    JP      NZ,#05DF
05e4 7E        LD      A,(HL)
05e5 B7        OR      A
05e6 FAEF05    JP      M,#05EF
05e9 12        LD      (DE),A
05ea 13        INC     DE
05eb 23        INC     HL
05ec C3E405    JP      #05E4
05ef E1        POP     HL
05f0 C3C805    JP      #05C8
05f3 23        INC     HL
05f4 E5        PUSH    HL
05f5 CDD71C    CALL    #1CD7
05f8 CD0620    CALL    #2006
05fb C3C605    JP      #05C6
05fe 2A3931    LD      HL,(#3139)
0601 3601      LD      (HL),#01
0603 223731    LD      (#3137),HL
0606 2A3B31    LD      HL,(#313B)
0609 3600      LD      (HL),#00
060b 2B        DEC     HL
060c 22DD30    LD      (#30DD),HL
060f CDD22B    CALL    #2BD2
0612 2A3731    LD      HL,(#3137)
0615 23        INC     HL
0616 22F92E    LD      (#2EF9),HL
0619 213400    LD      HL,#0034
061c CD401C    CALL    #1C40
061f AF        XOR     A
0620 32EC2E    LD      (#2EEC),A
0623 C9        RET     

0624 CDBA1F    CALL    #1FBA
0627 DAA002    JP      C,#02A0
062a 7E        LD      A,(HL)
062b 34        INC     (HL)
062c BE        CP      (HL)
062d 77        LD      (HL),A
062e CAA002    JP      Z,#02A0
0631 EB        EX      DE,HL
0632 D5        PUSH    DE
0633 CD0606    CALL    #0606
0636 D1        POP     DE
0637 21F92E    LD      HL,#2EF9
063a CDCF1C    CALL    #1CCF
063d DAB202    JP      C,#02B2
0640 EB        EX      DE,HL
0641 220901    LD      (#0109),HL
0644 37        SCF     
0645 C30501    JP      #0105
0648 CD0722    CALL    #2207
064b CDB71E    CALL    #1EB7
064e EB        EX      DE,HL
064f 7C        LD      A,H
0650 B7        OR      A
0651 C2B202    JP      NZ,#02B2
0654 7D        LD      A,L
0655 FEA6      CP      #A6
0657 D2B202    JP      NC,#02B2
065a FE0A      CP      #0A
065c DAB202    JP      C,#02B2
065f CD1C22    CALL    #221C
0662 7D        LD      A,L
0663 2A2631    LD      HL,(#3126)
0666 77        LD      (HL),A
0667 CDA31C    CALL    #1CA3
066a D8        RET     C

066b CDB71E    CALL    #1EB7
066e 7A        LD      A,D
066f B3        OR      E
0670 2E01      LD      L,#01
0672 CA7706    JP      Z,#0677
0675 2E00      LD      L,#00
0677 CDDB0F    CALL    #0FDB
067a E6FE      AND     #FE
067c B5        OR      L
067d 2A2631    LD      HL,(#3126)
0680 77        LD      (HL),A
0681 C9        RET     

0682 2A3931    LD      HL,(#3139)
0685 7E        LD      A,(HL)
0686 FE01      CP      #01
0688 CA9C06    JP      Z,#069C
068b 11FFFF    LD      DE,#FFFF
068e CD651E    CALL    #1E65
0691 2A3731    LD      HL,(#3137)
0694 222F31    LD      (#312F),HL
0697 3E01      LD      A,#01
0699 C3A006    JP      #06A0

; LOAD command

069c 2A3931    LD      HL,(#3139)
069f AF        XOR     A
06a0 E5        PUSH    HL
06a1 322C31    LD      (#312C),A
06a4 3E01      LD      A,#01
06a6 322631    LD      (#3126),A
06a9 CDD22B    CALL    #2BD2
06ac CD8D1C    CALL    #1C8D
06af 3E01      LD      A,#01
06b1 CDB437    CALL    #37B4
06b4 DAA002    JP      C,#02A0
06b7 4F        LD      C,A
06b8 CDB519    CALL    #19B5
06bb D5        PUSH    DE
06bc 23        INC     HL
06bd 23        INC     HL
06be 7E        LD      A,(HL)
06bf E67F      AND     #7F
06c1 FE02      CP      #02
06c3 C2B802    JP      NZ,#02B8
06c6 7E        LD      A,(HL)
06c7 E680      AND     #80
06c9 B1        OR      C
06ca 4F        LD      C,A
06cb 23        INC     HL
06cc 7E        LD      A,(HL)
06cd B7        OR      A
06ce CAD802    JP      Z,#02D8  ; salta a FILE ERROR
06d1 E1        POP     HL
06d2 D1        POP     DE
06d3 D5        PUSH    DE
06d4 E5        PUSH    HL
06d5 F5        PUSH    AF
06d6 2A3B31    LD      HL,(#313B)
06d9 CD290A    CALL    #0A29
06dc F1        POP     AF
06dd BC        CP      H
06de DAE206    JP      C,#06E2
06e1 7C        LD      A,H
06e2 0C        INC     C
06e3 0D        DEC     C
06e4 F2EA06    JP      P,#06EA
06e7 C601      ADD     A,#01
06e9 1F        RRA     
06ea E1        POP     HL
06eb D1        POP     DE
06ec 0601      LD      B,#01
06ee CD0E39    CALL    #390E
06f1 DAD802    JP      C,#02D8
06f4 37        SCF     
06f5 C33301    JP      #0133
06f8 C3693A    JP      #3A69
06fb E5        PUSH    HL
06fc E5        PUSH    HL
06fd 3E01      LD      A,#01
06ff CD1C40    CALL    #401C
0702 D2A002    JP      NC,#02A0
0705 E5        PUSH    HL
0706 F5        PUSH    AF
0707 CD220A    CALL    #0A22
070a C603      ADD     A,#03
070c 6F        LD      L,A
070d 2600      LD      H,#00
070f E5        PUSH    HL
0710 2AF32E    LD      HL,(#2EF3)
0713 23        INC     HL
0714 22F32E    LD      (#2EF3),HL
0717 7E        LD      A,(HL)
0718 FE0D      CP      #0D
071a CA2907    JP      Z,#0729
071d FE20      CP      #20
071f C21307    JP      NZ,#0713
0722 CDBA1F    CALL    #1FBA
0725 DAA002    JP      C,#02A0
0728 E3        EX      (SP),HL
0729 C1        POP     BC
072a 3E02      LD      A,#02
072c 322631    LD      (#3126),A
072f F1        POP     AF
0730 D1        POP     DE
0731 E1        POP     HL
0732 D5        PUSH    DE
0733 CD4E07    CALL    #074E
0736 3A2831    LD      A,(#3128)
0739 4F        LD      C,A
073a 0600      LD      B,#00
073c 3A3331    LD      A,(#3133)
073f 2A3931    LD      HL,(#3139)
0742 EB        EX      DE,HL
0743 E1        POP     HL
0744 CD2240    CALL    #4022
0747 E1        POP     HL
0748 22F32E    LD      (#2EF3),HL
074b C3BE07    JP      #07BE
074e E5        PUSH    HL
074f 00        NOP     
0750 00        NOP     
0751 00        NOP     
0752 00        NOP     
0753 322831    LD      (#3128),A
0756 F26207    JP      P,#0762
0759 F5        PUSH    AF
075a 03        INC     BC
075b 78        LD      A,B
075c 1F        RRA     
075d 47        LD      B,A
075e 79        LD      A,C
075f 1F        RRA     
0760 4F        LD      C,A
0761 F1        POP     AF
0762 E67F      AND     #7F
0764 C5        PUSH    BC
0765 21A1FE    LD      HL,#FEA1
0768 D5        PUSH    DE
0769 EB        EX      DE,HL
076a 09        ADD     HL,BC
076b 19        ADD     HL,DE
076c D28207    JP      NC,#0782
076f 13        INC     DE
0770 19        ADD     HL,DE
0771 DAD802    JP      C,#02D8
0774 57        LD      D,A
0775 5F        LD      E,A
0776 3A3440    LD      A,(#4034)
0779 1D        DEC     E
077a 07        RLCA    
077b C27907    JP      NZ,#0779
077e D2D802    JP      NC,#02D8
0781 7A        LD      A,D
0782 212411    LD      HL,#1124
0785 CD1C40    CALL    #401C
0788 DAD802    JP      C,#02D8
078b D1        POP     DE
078c CDB019    CALL    #19B0
078f D1        POP     DE
0790 EB        EX      DE,HL
0791 223331    LD      (#3133),HL
0794 EB        EX      DE,HL
0795 CDB019    CALL    #19B0
0798 3A2631    LD      A,(#3126)
079b E5        PUSH    HL
079c 00        NOP     
079d 00        NOP     
079e 00        NOP     
079f 00        NOP     
07a0 00        NOP     
07a1 E1        POP     HL
07a2 77        LD      (HL),A
07a3 11F4FF    LD      DE,#FFF4
07a6 19        ADD     HL,DE
07a7 D1        POP     DE
07a8 1A        LD      A,(DE)
07a9 FE20      CP      #20
07ab CA1F40    JP      Z,#401F
07ae FE2C      CP      #2C
07b0 CA1F40    JP      Z,#401F
07b3 FE0D      CP      #0D
07b5 CA1F40    JP      Z,#401F
07b8 77        LD      (HL),A
07b9 13        INC     DE
07ba 23        INC     HL
07bb C3A807    JP      #07A8
07be CD220A    CALL    #0A22
07c1 32A130    LD      (#30A1),A
07c4 CD8D1C    CALL    #1C8D
07c7 3E00      LD      A,#00
07c9 CDB437    CALL    #37B4
07cc DAA002    JP      C,#02A0
07cf 4F        LD      C,A
07d0 CDB519    CALL    #19B5
07d3 D5        PUSH    DE
07d4 CDB519    CALL    #19B5
07d7 7E        LD      A,(HL)
07d8 E680      AND     #80
07da B1        OR      C
07db 4F        LD      C,A
07dc 7E        LD      A,(HL)
07dd E67F      AND     #7F
07df FE02      CP      #02
07e1 C2B802    JP      NZ,#02B8
07e4 23        INC     HL
07e5 7A        LD      A,D
07e6 B7        OR      A
07e7 3AA130    LD      A,(#30A1)
07ea C2FC07    JP      NZ,#07FC
07ed 0C        INC     C
07ee 0D        DEC     C
07ef F5        PUSH    AF
07f0 F2F607    JP      P,#07F6
07f3 C601      ADD     A,#01
07f5 1F        RRA     
07f6 3D        DEC     A
07f7 BB        CP      E
07f8 D2B202    JP      NC,#02B2
07fb F1        POP     AF
07fc 77        LD      (HL),A
07fd F5        PUSH    AF
07fe C5        PUSH    BC
07ff CDF738    CALL    #38F7
0802 C1        POP     BC
0803 0C        INC     C
0804 0D        DEC     C
0805 F20D08    JP      P,#080D
0808 F1        POP     AF
0809 C601      ADD     A,#01
080b 1F        RRA     
080c F5        PUSH    AF
080d F1        POP     AF
080e 2A3931    LD      HL,(#3139)
0811 EB        EX      DE,HL
0812 E1        POP     HL
0813 0600      LD      B,#00
0815 CD0E39    CALL    #390E
0818 DAD802    JP      C,#02D8
081b C9        RET     

081c CD8D1C    CALL    #1C8D
081f FE0D      CP      #0D
0821 CAEE02    JP      Z,#02EE
0824 CDEF1F    CALL    #1FEF
0827 C2CC02    JP      NZ,#02CC
082a E5        PUSH    HL
082b CD8D1C    CALL    #1C8D
082e FE0D      CP      #0D
0830 C2EE02    JP      NZ,#02EE
0833 E1        POP     HL
0834 11022F    LD      DE,#2F02
0837 CDBE05    CALL    #05BE
083a C3FA01    JP      #01FA
083d CD8808    CALL    #0888
0840 C3823A    JP      #3A82
0843 1C        INC     E
0844 40        LD      B,B
0845 D2D802    JP      NC,#02D8
0848 E5        PUSH    HL
0849 F5        PUSH    AF
084a CD761C    CALL    #1C76
084d CDB71E    CALL    #1EB7
0850 D5        PUSH    DE
0851 CDA31C    CALL    #1CA3
0854 3E03      LD      A,#03
0856 DA6508    JP      C,#0865
0859 CDB71E    CALL    #1EB7
085c 7A        LD      A,D
085d B7        OR      A
085e C2B202    JP      NZ,#02B2
0861 B3        OR      E
0862 FAB202    JP      M,#02B2
0865 322631    LD      (#3126),A
0868 C1        POP     BC
0869 F1        POP     AF
086a D1        POP     DE
086b 21A130    LD      HL,#30A1
086e C34E07    JP      #074E
0871 CD8808    CALL    #0888
0874 C3573A    JP      #3A57
0877 1C        INC     E
0878 40        LD      B,B
0879 DAD802    JP      C,#02D8
087c 0E08      LD      C,#08
087e 2B        DEC     HL
087f 3620      LD      (HL),#20
0881 0D        DEC     C
0882 C27E08    JP      NZ,#087E
0885 C31F40    JP      #401F
0888 210E00    LD      HL,#000E
088b 22E330    LD      (#30E3),HL
088e 21763C    LD      HL,#3C76
0891 E5        PUSH    HL
0892 AF        XOR     A
0893 37        SCF     
0894 CD7019    CALL    #1970
0897 3E0D      LD      A,#0D
0899 02        LD      (BC),A
089a E1        POP     HL
089b C9        RET     

089c 210A00    LD      HL,#000A
089f 222F31    LD      (#312F),HL
08a2 223131    LD      (#3131),HL
08a5 CDBA1F    CALL    #1FBA
08a8 DAC208    JP      C,#08C2
08ab 222F31    LD      (#312F),HL
08ae CDA31C    CALL    #1CA3
08b1 C2C208    JP      NZ,#08C2
08b4 CDBA1F    CALL    #1FBA
08b7 DAA002    JP      C,#02A0
08ba 7C        LD      A,H
08bb B5        OR      L
08bc CAB202    JP      Z,#02B2
08bf 223131    LD      (#3131),HL
08c2 CD8D1C    CALL    #1C8D
08c5 FE0D      CP      #0D
08c7 C2A002    JP      NZ,#02A0
08ca 11FFFF    LD      DE,#FFFF
08cd CD651E    CALL    #1E65
08d0 2A3931    LD      HL,(#3139)
08d3 7E        LD      A,(HL)
08d4 FE01      CP      #01
08d6 CA0609    JP      Z,#0906
08d9 23        INC     HL
08da 23        INC     HL
08db 23        INC     HL
08dc 22F32E    LD      (#2EF3),HL
08df CD951C    CALL    #1C95
08e2 FE0D      CP      #0D
08e4 CAD308    JP      Z,#08D3
08e7 CDDD1F    CALL    #1FDD
08ea DADF08    JP      C,#08DF
08ed EB        EX      DE,HL
08ee CD651E    CALL    #1E65
08f1 DADF08    JP      C,#08DF
08f4 C2DF08    JP      NZ,#08DF
08f7 2A3331    LD      HL,(#3133)
08fa EB        EX      DE,HL
08fb 2AF32E    LD      HL,(#2EF3)
08fe 2B        DEC     HL
08ff 2B        DEC     HL
0900 CDB019    CALL    #19B0
0903 C3DF08    JP      #08DF
0906 2A3131    LD      HL,(#3131)
0909 44        LD      B,H
090a 4D        LD      C,L
090b 2A2F31    LD      HL,(#312F)
090e EB        EX      DE,HL
090f 2A3931    LD      HL,(#3139)
0912 7E        LD      A,(HL)
0913 FE01      CP      #01
0915 C8        RET     Z

0916 E5        PUSH    HL
0917 23        INC     HL
0918 CDB019    CALL    #19B0
091b E1        POP     HL
091c CD9B29    CALL    #299B
091f EB        EX      DE,HL
0920 09        ADD     HL,BC
0921 EB        EX      DE,HL
0922 C31209    JP      #0912
0925 CD0722    CALL    #2207
0928 CDBA1F    CALL    #1FBA
092b 3E01      LD      A,#01
092d DA3109    JP      C,#0931
0930 7D        LD      A,L
0931 21F20E    LD      HL,#0EF2
0934 222D40    LD      (#402D),HL
0937 2A7A2E    LD      HL,(#2E7A)
093a C32540    JP      #4025
093d CD0722    CALL    #2207
0940 3A1301    LD      A,(#0113)
0943 322831    LD      (#3128),A
0946 CD8D1C    CALL    #1C8D
0949 FE0D      CP      #0D
094b 2A3931    LD      HL,(#3139)
094e E5        PUSH    HL
094f 2A3731    LD      HL,(#3137)
0952 CA7009    JP      Z,#0970
0955 E1        POP     HL
0956 CDEF1F    CALL    #1FEF
0959 E5        PUSH    HL
095a CDA31C    CALL    #1CA3
095d E1        POP     HL
095e E5        PUSH    HL
095f C27009    JP      NZ,#0970
0962 CD8D1C    CALL    #1C8D
0965 FE0D      CP      #0D
0967 2A3731    LD      HL,(#3137)
096a CA7009    JP      Z,#0970
096d CDEF1F    CALL    #1FEF
0970 23        INC     HL
0971 22A130    LD      (#30A1),HL
0974 CD8D1C    CALL    #1C8D
0977 FE0D      CP      #0D
0979 C2A002    JP      NZ,#02A0
097c CDDA21    CALL    #21DA
097f E1        POP     HL
0980 E5        PUSH    HL
0981 CD8D09    CALL    #098D
0984 E1        POP     HL
0985 7E        LD      A,(HL)
0986 FE01      CP      #01
0988 C8        RET     Z

0989 E5        PUSH    HL
098a C3AF09    JP      #09AF
098d 3A7A2E    LD      A,(#2E7A)
0990 B7        OR      A
0991 C0        RET     NZ

0992 3A2831    LD      A,(#3128)
0995 B7        OR      A
0996 C8        RET     Z

0997 3D        DEC     A
0998 C2AB09    JP      NZ,#09AB
099b 21C412    LD      HL,#12C4
099e CDBD1C    CALL    #1CBD
09a1 CD6520    CALL    #2065
09a4 CDDA21    CALL    #21DA
09a7 3A1301    LD      A,(#0113)
09aa 3D        DEC     A
09ab 322831    LD      (#3128),A
09ae C9        RET     

09af E1        POP     HL
09b0 11AA2F    LD      DE,#2FAA
09b3 D5        PUSH    DE
09b4 CDBE05    CALL    #05BE
09b7 23        INC     HL
09b8 E3        EX      (SP),HL
09b9 CDB81C    CALL    #1CB8
09bc CDE421    CALL    #21E4
09bf CDDA21    CALL    #21DA
09c2 D1        POP     DE
09c3 21A130    LD      HL,#30A1
09c6 CDCF1C    CALL    #1CCF
09c9 EB        EX      DE,HL
09ca DA8009    JP      C,#0980
09cd C9        RET     

09ce 210A00    LD      HL,#000A
09d1 22E42E    LD      (#2EE4),HL
09d4 22E62E    LD      (#2EE6),HL
09d7 CDBA1F    CALL    #1FBA
09da DAF409    JP      C,#09F4
09dd 22E42E    LD      (#2EE4),HL
09e0 CDA31C    CALL    #1CA3
09e3 C2F409    JP      NZ,#09F4
09e6 CDBA1F    CALL    #1FBA
09e9 DAA002    JP      C,#02A0
09ec 7C        LD      A,H
09ed B5        OR      L
09ee CAA002    JP      Z,#02A0
09f1 22E62E    LD      (#2EE6),HL
09f4 060D      LD      B,#0D
09f6 CD851C    CALL    #1C85
09f9 3E01      LD      A,#01
09fb 32E32E    LD      (#2EE3),A
09fe C3FA01    JP      #01FA

0a01 F5        PUSH    AF
0a02 AF        XOR     A
0a03 32E32E    LD      (#2EE3),A
0a06 F1        POP     AF
0a07 C9        RET     

0a08 CD220A    CALL    #0A22
0a0b 6F        LD      L,A
0a0c 2600      LD      H,#00
0a0e 11AA2F    LD      DE,#2FAA
0a11 D5        PUSH    DE
0a12 CD0620    CALL    #2006
0a15 3E0D      LD      A,#0D
0a17 12        LD      (DE),A
0a18 E1        POP     HL
0a19 CDB81C    CALL    #1CB8
0a1c 21BC04    LD      HL,#04BC
0a1f C3BD1C    JP      #1CBD
0a22 2A3931    LD      HL,(#3139)
0a25 EB        EX      DE,HL
0a26 2A3731    LD      HL,(#3137)
0a29 CD8A1D    CALL    #1D8A
0a2c 23        INC     HL
0a2d 7D        LD      A,L
0a2e B7        OR      A
0a2f CA330A    JP      Z,#0A33
0a32 24        INC     H
0a33 7C        LD      A,H
0a34 C9        RET     

0a35 CDBA1F    CALL    #1FBA
0a38 DAA002    JP      C,#02A0
0a3b EB        EX      DE,HL
0a3c CD971E    CALL    #1E97
0a3f E5        PUSH    HL
0a40 CD761C    CALL    #1C76
0a43 CDBA1F    CALL    #1FBA
0a46 DAA002    JP      C,#02A0
0a49 EB        EX      DE,HL
0a4a CD971E    CALL    #1E97
0a4d 222631    LD      (#3126),HL
0a50 060D      LD      B,#0D
0a52 CD851C    CALL    #1C85
0a55 D1        POP     DE
0a56 212631    LD      HL,#3126
0a59 CDCF1C    CALL    #1CCF
0a5c D2A002    JP      NC,#02A0
0a5f D5        PUSH    DE
0a60 CD0606    CALL    #0606
0a63 D1        POP     DE
0a64 2A2631    LD      HL,(#3126)
0a67 7E        LD      A,(HL)
0a68 CD9B29    CALL    #299B
0a6b D5        PUSH    DE
0a6c EB        EX      DE,HL
0a6d 2A3731    LD      HL,(#3137)
0a70 CD8A1D    CALL    #1D8A
0a73 23        INC     HL
0a74 44        LD      B,H
0a75 4D        LD      C,L
0a76 E1        POP     HL
0a77 CD7E29    CALL    #297E
0a7a C30401    JP      #0104
0a7d 3AEC2E    LD      A,(#2EEC)
0a80 B7        OR      A
0a81 011304    LD      BC,#0413
0a84 CAF102    JP      Z,#02F1
0a87 AF        XOR     A
0a88 32EB2E    LD      (#2EEB),A
0a8b 32EC2E    LD      (#2EEC),A
0a8e E1        POP     HL
0a8f E1        POP     HL
0a90 22DD30    LD      (#30DD),HL
0a93 E1        POP     HL
0a94 22F32E    LD      (#2EF3),HL
0a97 C3180B    JP      #0B18
0a9a 217A2E    LD      HL,#2E7A
0a9d F9        LD      SP,HL
0a9e 22ED2E    LD      (#2EED),HL
0aa1 CDEF1F    CALL    #1FEF
0aa4 C2CC02    JP      NZ,#02CC
0aa7 CDDA21    CALL    #21DA
0aaa E5        PUSH    HL
0aab CD0606    CALL    #0606
0aae 2A3931    LD      HL,(#3139)
0ab1 7E        LD      A,(HL)
0ab2 FE01      CP      #01
0ab4 012904    LD      BC,#0429
0ab7 CAF102    JP      Z,#02F1
0aba 2B        DEC     HL
0abb 22F32E    LD      (#2EF3),HL
0abe 22F52E    LD      (#2EF5),HL
0ac1 360D      LD      (HL),#0D
0ac3 AF        XOR     A
0ac4 32EB2E    LD      (#2EEB),A
0ac7 32EC2E    LD      (#2EEC),A
0aca 32F730    LD      (#30F7),A
0acd CD8218    CALL    #1882
0ad0 CDD22B    CALL    #2BD2
0ad3 CDCF2D    CALL    #2DCF
0ad6 019091    LD      BC,#9190
0ad9 AF        XOR     A
0ada CD451B    CALL    #1B45
0add DA0B0B    JP      C,#0B0B
0ae0 FE90      CP      #90
0ae2 CAAC02    JP      Z,#02AC
0ae5 0690      LD      B,#90
0ae7 CD851C    CALL    #1C85
0aea CD3D1B    CALL    #1B3D
0aed CD891B    CALL    #1B89
0af0 013404    LD      BC,#0434
0af3 D2F102    JP      NC,#02F1
0af6 E5        PUSH    HL
0af7 210200    LD      HL,#0002
0afa CD401C    CALL    #1C40
0afd CD7E1C    CALL    #1C7E
0b00 EB        EX      DE,HL
0b01 E1        POP     HL
0b02 CDB019    CALL    #19B0
0b05 CD5C1B    CALL    #1B5C
0b08 C3D60A    JP      #0AD6
0b0b E1        POP     HL
0b0c 23        INC     HL
0b0d 23        INC     HL
0b0e 23        INC     HL
0b0f 22F32E    LD      (#2EF3),HL
0b12 CD2B1D    CALL    #1D2B
0b15 CD111D    CALL    #1D11
0b18 CDE421    CALL    #21E4
0b1b 210000    LD      HL,#0000
0b1e 39        ADD     HL,SP
0b1f 22EF2E    LD      (#2EEF),HL
0b22 2ADD30    LD      HL,(#30DD)
0b25 22F12E    LD      (#2EF1),HL
0b28 CD340B    CALL    #0B34
0b2b CDE31A    CALL    #1AE3
0b2e D2180B    JP      NC,#0B18
0b31 C3040F    JP      #0F04
0b34 3E0D      LD      A,#0D
0b36 32EA2E    LD      (#2EEA),A
0b39 AF        XOR     A
0b3a 32E92E    LD      (#2EE9),A
0b3d CD8D1C    CALL    #1C8D
0b40 22F72E    LD      (#2EF7),HL
0b43 B7        OR      A
0b44 F25D0B    JP      P,#0B5D
0b47 FEA0      CP      #A0
0b49 D2EE02    JP      NC,#02EE
0b4c 111313    LD      DE,#1313

; Execute Token in RegA (!=$92, OUT=$94, RUN=$A0, LOAD=$A5

0b4f CD951C    CALL    #1C95	; Get the token code
0b52 E61F      AND     #1F	
0b54 07        RLCA    
0b55 6F        LD      L,A
0b56 2600      LD      H,#00	; HL = (Token AND $1F) * 2
0b58 19        ADD     HL,DE	; HL = $1313 + HL (133B = addr del prg que ejecuta comando OUT)
0b59 CDD71C    CALL    #1CD7	; HL = (HL)
0b5c E9        JP      (HL)	; Execute token (0000 for BYE, 114B for OUT, 0A9A for RUN)

0b5d CDDC19    CALL    #19DC
0b60 E5        PUSH    HL
0b61 F5        PUSH    AF
0b62 C5        PUSH    BC
0b63 06F5      LD      B,#F5
0b65 CD851C    CALL    #1C85
0b68 C1        POP     BC
0b69 F1        POP     AF
0b6a E1        POP     HL
0b6b 3E00      LD      A,#00
0b6d CA7019    JP      Z,#1970
0b70 E5        PUSH    HL
0b71 CDC911    CALL    #11C9
0b74 E1        POP     HL
0b75 C3141C    JP      #1C14
0b78 CD7F1D    CALL    #1D7F
0b7b CDDC19    CALL    #19DC
0b7e CAB802    JP      Z,#02B8
0b81 E5        PUSH    HL
0b82 06F5      LD      B,#F5
0b84 CD851C    CALL    #1C85
0b87 CDC911    CALL    #11C9
0b8a E1        POP     HL
0b8b E5        PUSH    HL
0b8c CD141C    CALL    #1C14
0b8f 06B1      LD      B,#B1
0b91 CD851C    CALL    #1C85
0b94 CDC911    CALL    #11C9
0b97 3EB0      LD      A,#B0
0b99 CDA51C    CALL    #1CA5
0b9c D2A80B    JP      NC,#0BA8
0b9f 214717    LD      HL,#1747
0ba2 CDFF1B    CALL    #1BFF
0ba5 C3AB0B    JP      #0BAB
0ba8 CDC911    CALL    #11C9
0bab 11FBFF    LD      DE,#FFFB
0bae CD221C    CALL    #1C22
0bb1 EB        EX      DE,HL
0bb2 2AF32E    LD      HL,(#2EF3)
0bb5 E3        EX      (SP),HL
0bb6 E5        PUSH    HL
0bb7 CDE31A    CALL    #1AE3
0bba DA4511    JP      C,#1145
0bbd EB        EX      DE,HL
0bbe 72        LD      (HL),D
0bbf 2B        DEC     HL
0bc0 73        LD      (HL),E
0bc1 2B        DEC     HL
0bc2 D1        POP     DE
0bc3 72        LD      (HL),D
0bc4 2B        DEC     HL
0bc5 73        LD      (HL),E
0bc6 2B        DEC     HL
0bc7 3601      LD      (HL),#01
0bc9 E1        POP     HL
0bca 22F32E    LD      (#2EF3),HL
0bcd 222631    LD      (#3126),HL
0bd0 AF        XOR     A
0bd1 47        LD      B,A
0bd2 04        INC     B
0bd3 C5        PUSH    BC
0bd4 018381    LD      BC,#8183
0bd7 CD451B    CALL    #1B45
0bda 014D04    LD      BC,#044D
0bdd 2A2631    LD      HL,(#3126)
0be0 DAE202    JP      C,#02E2
0be3 FE81      CP      #81
0be5 C1        POP     BC
0be6 CAD20B    JP      Z,#0BD2
0be9 05        DEC     B
0bea C2D30B    JP      NZ,#0BD3
0bed C3F40B    JP      #0BF4
0bf0 CD7F1D    CALL    #1D7F
0bf3 AF        XOR     A
0bf4 32A130    LD      (#30A1),A
0bf7 2ADD30    LD      HL,(#30DD)
0bfa 23        INC     HL
0bfb 7E        LD      A,(HL)
0bfc FE01      CP      #01
0bfe C24511    JP      NZ,#1145
0c01 23        INC     HL
0c02 E5        PUSH    HL
0c03 CD1B1B    CALL    #1B1B
0c06 DA150C    JP      C,#0C15
0c09 CDE219    CALL    #19E2
0c0c EB        EX      DE,HL
0c0d E1        POP     HL
0c0e E5        PUSH    HL
0c0f CDCF1C    CALL    #1CCF
0c12 C24511    JP      NZ,#1145
0c15 E1        POP     HL
0c16 E5        PUSH    HL
0c17 E5        PUSH    HL
0c18 110800    LD      DE,#0008
0c1b 19        ADD     HL,DE
0c1c E3        EX      (SP),HL
0c1d 4E        LD      C,(HL)
0c1e 23        INC     HL
0c1f 46        LD      B,(HL)
0c20 D1        POP     DE
0c21 D5        PUSH    DE
0c22 3AA130    LD      A,(#30A1)
0c25 B7        OR      A
0c26 CC5523    CALL    Z,#2355
0c29 E1        POP     HL
0c2a 7E        LD      A,(HL)
0c2b 110500    LD      DE,#0005
0c2e 19        ADD     HL,DE
0c2f EB        EX      DE,HL
0c30 E1        POP     HL
0c31 D5        PUSH    DE
0c32 CDD71C    CALL    #1CD7
0c35 B7        OR      A
0c36 FA3A0C    JP      M,#0C3A
0c39 EB        EX      DE,HL
0c3a 44        LD      B,H
0c3b 4D        LD      C,L
0c3c CD9115    CALL    #1591
0c3f E1        POP     HL
0c40 D2470C    JP      NC,#0C47
0c43 22DD30    LD      (#30DD),HL
0c46 C9        RET     

0c47 11F5FF    LD      DE,#FFF5
0c4a 19        ADD     HL,DE
0c4b CDD71C    CALL    #1CD7
0c4e EB        EX      DE,HL
0c4f CDE31A    CALL    #1AE3
0c52 EB        EX      DE,HL
0c53 22F32E    LD      (#2EF3),HL
0c56 E1        POP     HL
0c57 C3180B    JP      #0B18
0c5a CDE91C    CALL    #1CE9
0c5d CA820C    JP      Z,#0C82
0c60 CDC911    CALL    #11C9
0c63 CD111C    CALL    #1C11
0c66 06B2      LD      B,#B2
0c68 CD851C    CALL    #1C85
0c6b 0601      LD      B,#01
0c6d 3AFF2E    LD      A,(#2EFF)
0c70 B7        OR      A
0c71 CAE90C    JP      Z,#0CE9
0c74 3EB4      LD      A,#B4
0c76 32EA2E    LD      (#2EEA),A
0c79 CDDD1F    CALL    #1FDD
0c7c D2730D    JP      NC,#0D73
0c7f C33D0B    JP      #0B3D
0c82 2ADD30    LD      HL,(#30DD)
0c85 E5        PUSH    HL
0c86 E5        PUSH    HL
0c87 CDB718    CALL    #18B7
0c8a E5        PUSH    HL
0c8b CD951C    CALL    #1C95
0c8e FEF7      CP      #F7
0c90 D2EE02    JP      NC,#02EE
0c93 FEEF      CP      #EF
0c95 DAEE02    JP      C,#02EE
0c98 CDB212    CALL    #12B2
0c9b 23        INC     HL
0c9c CDD71C    CALL    #1CD7
0c9f 23        INC     HL
0ca0 23        INC     HL
0ca1 23        INC     HL
0ca2 D1        POP     DE
0ca3 C1        POP     BC
0ca4 E5        PUSH    HL
0ca5 C5        PUSH    BC
0ca6 D5        PUSH    DE
0ca7 2ADD30    LD      HL,(#30DD)
0caa E5        PUSH    HL
0cab CDB718    CALL    #18B7
0cae EB        EX      DE,HL
0caf E1        POP     HL
0cb0 C1        POP     BC
0cb1 78        LD      A,B
0cb2 B1        OR      C
0cb3 CAC90C    JP      Z,#0CC9
0cb6 7A        LD      A,D
0cb7 B3        OR      E
0cb8 CAE40C    JP      Z,#0CE4
0cbb E3        EX      (SP),HL
0cbc 7E        LD      A,(HL)
0cbd 2B        DEC     HL
0cbe E3        EX      (SP),HL
0cbf BE        CP      (HL)
0cc0 2B        DEC     HL
0cc1 1B        DEC     DE
0cc2 0B        DEC     BC
0cc3 CAB10C    JP      Z,#0CB1
0cc6 C3CF0C    JP      #0CCF
0cc9 7A        LD      A,D
0cca B3        OR      E
0ccb CACF0C    JP      Z,#0CCF
0cce 37        SCF     
0ccf E1        POP     HL
0cd0 21DD0C    LD      HL,#0CDD
0cd3 E3        EX      (SP),HL
0cd4 E5        PUSH    HL
0cd5 21FF2E    LD      HL,#2EFF
0cd8 3641      LD      (HL),#41
0cda 3E00      LD      A,#00
0cdc C9        RET     

0cdd E1        POP     HL
0cde 22DD30    LD      (#30DD),HL
0ce1 C3660C    JP      #0C66
0ce4 3C        INC     A
0ce5 C3CF0C    JP      #0CCF
0ce8 04        INC     B
0ce9 CD8D1C    CALL    #1C8D
0cec FE22      CP      #22
0cee C2070D    JP      NZ,#0D07
0cf1 CD951C    CALL    #1C95
0cf4 CD8D1C    CALL    #1C8D
0cf7 FE0D      CP      #0D
0cf9 CAEE02    JP      Z,#02EE
0cfc FE22      CP      #22
0cfe CA070D    JP      Z,#0D07
0d01 CD951C    CALL    #1C95
0d04 C3F40C    JP      #0CF4
0d07 FE0D      CP      #0D
0d09 C8        RET     Z

0d0a FE5C      CP      #5C
0d0c C8        RET     Z

0d0d CDDD1F    CALL    #1FDD
0d10 D2E90C    JP      NC,#0CE9
0d13 CD951C    CALL    #1C95
0d16 FE84      CP      #84
0d18 CAE80C    JP      Z,#0CE8
0d1b FEB4      CP      #B4
0d1d C2E90C    JP      NZ,#0CE9
0d20 05        DEC     B
0d21 C2E90C    JP      NZ,#0CE9
0d24 3E84      LD      A,#84
0d26 32EA2E    LD      (#2EEA),A
0d29 C3790C    JP      #0C79
0d2c CD7F1D    CALL    #1D7F
0d2f 2ADD30    LD      HL,(#30DD)
0d32 23        INC     HL
0d33 7E        LD      A,(HL)
0d34 FE01      CP      #01
0d36 C24511    JP      NZ,#1145
0d39 110E00    LD      DE,#000E
0d3c 19        ADD     HL,DE
0d3d 22DD30    LD      (#30DD),HL
0d40 CDDD1F    CALL    #1FDD
0d43 DAEE02    JP      C,#02EE
0d46 CD7F1D    CALL    #1D7F
0d49 EB        EX      DE,HL
0d4a CD971E    CALL    #1E97
0d4d 23        INC     HL
0d4e 23        INC     HL
0d4f 23        INC     HL
0d50 C34E0C    JP      #0C4E
0d53 CDB71E    CALL    #1EB7
0d56 7A        LD      A,D
0d57 B7        OR      A
0d58 C2B202    JP      NZ,#02B2
0d5b 0688      LD      B,#88
0d5d CD851C    CALL    #1C85
0d60 D5        PUSH    DE
0d61 CDDD1F    CALL    #1FDD
0d64 DAEE02    JP      C,#02EE
0d67 C1        POP     BC
0d68 0D        DEC     C
0d69 CA730D    JP      Z,#0D73
0d6c CD761C    CALL    #1C76
0d6f C5        PUSH    BC
0d70 C3610D    JP      #0D61
0d73 EB        EX      DE,HL
0d74 CD7F1D    CALL    #1D7F
0d77 CD971E    CALL    #1E97
0d7a C39F0D    JP      #0D9F
0d7d CD7F1D    CALL    #1D7F
0d80 11FDFF    LD      DE,#FFFD
0d83 CD221C    CALL    #1C22
0d86 E5        PUSH    HL
0d87 CDDD1F    CALL    #1FDD
0d8a DAEE02    JP      C,#02EE
0d8d EB        EX      DE,HL
0d8e CD971E    CALL    #1E97
0d91 EB        EX      DE,HL
0d92 CDE31A    CALL    #1AE3
0d95 44        LD      B,H
0d96 4D        LD      C,L
0d97 E1        POP     HL
0d98 70        LD      (HL),B
0d99 2B        DEC     HL
0d9a 71        LD      (HL),C
0d9b 2B        DEC     HL
0d9c 3602      LD      (HL),#02
0d9e EB        EX      DE,HL
0d9f 23        INC     HL
0da0 23        INC     HL
0da1 23        INC     HL
0da2 C3530C    JP      #0C53
0da5 CD7F1D    CALL    #1D7F
0da8 2ADD30    LD      HL,(#30DD)
0dab 23        INC     HL
0dac 7E        LD      A,(HL)
0dad FE00      CP      #00
0daf CA4511    JP      Z,#1145
0db2 FE02      CP      #02
0db4 CAC30D    JP      Z,#0DC3
0db7 FE05      CP      #05
0db9 CAD40D    JP      Z,#0DD4
0dbc 110F00    LD      DE,#000F
0dbf 19        ADD     HL,DE
0dc0 C3AC0D    JP      #0DAC
0dc3 23        INC     HL
0dc4 5E        LD      E,(HL)
0dc5 23        INC     HL
0dc6 56        LD      D,(HL)
0dc7 22DD30    LD      (#30DD),HL
0dca EB        EX      DE,HL
0dcb 7E        LD      A,(HL)
0dcc FE01      CP      #01
0dce C24E0C    JP      NZ,#0C4E
0dd1 C3040F    JP      #0F04
0dd4 23        INC     HL
0dd5 7E        LD      A,(HL)
0dd6 47        LD      B,A
0dd7 C67A      ADD     A,#7A
0dd9 5F        LD      E,A
0dda 3E2E      LD      A,#2E
0ddc CEFF      ADC     A,#FF
0dde 57        LD      D,A
0ddf EB        EX      DE,HL
0de0 F9        LD      SP,HL
0de1 13        INC     DE
0de2 1A        LD      A,(DE)
0de3 77        LD      (HL),A
0de4 23        INC     HL
0de5 04        INC     B
0de6 C2E10D    JP      NZ,#0DE1
0de9 EB        EX      DE,HL
0dea 22DD30    LD      (#30DD),HL
0ded 23        INC     HL
0dee 7E        LD      A,(HL)
0def FE7F      CP      #7F
0df1 CA120E    JP      Z,#0E12
0df4 E5        PUSH    HL
0df5 CDB718    CALL    #18B7
0df8 D1        POP     DE
0df9 D5        PUSH    DE
0dfa E5        PUSH    HL
0dfb CDE31A    CALL    #1AE3
0dfe CD2A0E    CALL    #0E2A
0e01 C1        POP     BC
0e02 2ADD30    LD      HL,(#30DD)
0e05 D1        POP     DE
0e06 1B        DEC     DE
0e07 C5        PUSH    BC
0e08 CD8929    CALL    #2989
0e0b 22DD30    LD      (#30DD),HL
0e0e D1        POP     DE
0e0f C3240E    JP      #0E24
0e12 2B        DEC     HL
0e13 E5        PUSH    HL
0e14 23        INC     HL
0e15 E5        PUSH    HL
0e16 CDC911    CALL    #11C9
0e19 CDE31A    CALL    #1AE3
0e1c D1        POP     DE
0e1d CD2A0E    CALL    #0E2A
0e20 E1        POP     HL
0e21 CDFF1B    CALL    #1BFF
0e24 F1        POP     AF
0e25 32EA2E    LD      (#2EEA),A
0e28 B7        OR      A
0e29 C9        RET     

0e2a EB        EX      DE,HL
0e2b 23        INC     HL
0e2c 5E        LD      E,(HL)
0e2d 23        INC     HL
0e2e 56        LD      D,(HL)
0e2f EB        EX      DE,HL
0e30 22F32E    LD      (#2EF3),HL
0e33 EB        EX      DE,HL
0e34 23        INC     HL
0e35 7E        LD      A,(HL)
0e36 FE04      CP      #04
0e38 22DD30    LD      (#30DD),HL
0e3b C8        RET     Z

0e3c 23        INC     HL
0e3d 5E        LD      E,(HL)
0e3e 23        INC     HL
0e3f 56        LD      D,(HL)
0e40 22DD30    LD      (#30DD),HL
0e43 EB        EX      DE,HL
0e44 CD141C    CALL    #1C14
0e47 2ADD30    LD      HL,(#30DD)
0e4a C3340E    JP      #0E34
0e4d CD7F1D    CALL    #1D7F
0e50 AF        XOR     A
0e51 060D      LD      B,#0D
0e53 FE8F      CP      #8F
0e55 CA5A0E    JP      Z,#0E5A
0e58 065C      LD      B,#5C
0e5a CDDD1F    CALL    #1FDD
0e5d CD8D1C    CALL    #1C8D
0e60 FE0D      CP      #0D
0e62 C8        RET     Z

0e63 B8        CP      B
0e64 C8        RET     Z

0e65 CD951C    CALL    #1C95
0e68 C35A0E    JP      #0E5A
0e6b 3E8F      LD      A,#8F
0e6d C3510E    JP      #0E51
0e70 CD2B1B    CALL    #1B2B
0e73 DA920E    JP      C,#0E92
0e76 CD891B    CALL    #1B89
0e79 D2A602    JP      NC,#02A6
0e7c CD7E1C    CALL    #1C7E
0e7f CDB71E    CALL    #1EB7
0e82 CAA602    JP      Z,#02A6
0e85 CD831C    CALL    #1C83
0e88 CDA219    CALL    #19A2
0e8b CDA31C    CALL    #1CA3
0e8e D8        RET     C

0e8f C3700E    JP      #0E70
0e92 79        LD      A,C
0e93 F620      OR      #20
0e95 4F        LD      C,A
0e96 CD891B    CALL    #1B89
0e99 D2A602    JP      NC,#02A6
0e9c CD7E1C    CALL    #1C7E
0e9f 210200    LD      HL,#0002
0ea2 CD401C    CALL    #1C40
0ea5 E5        PUSH    HL
0ea6 CDB71E    CALL    #1EB7
0ea9 13        INC     DE
0eaa D5        PUSH    DE
0eab D5        PUSH    DE
0eac 210200    LD      HL,#0002
0eaf CD401C    CALL    #1C40
0eb2 D1        POP     DE
0eb3 CDB019    CALL    #19B0
0eb6 CDA31C    CALL    #1CA3
0eb9 DACA0E    JP      C,#0ECA
0ebc CDB71E    CALL    #1EB7
0ebf C1        POP     BC
0ec0 13        INC     DE
0ec1 D5        PUSH    DE
0ec2 CD821F    CALL    #1F82
0ec5 E3        EX      (SP),HL
0ec6 E5        PUSH    HL
0ec7 C3AC0E    JP      #0EAC
0eca CD831C    CALL    #1C83
0ecd D1        POP     DE
0ece E1        POP     HL
0ecf CDCA19    CALL    #19CA
0ed2 C38B0E    JP      #0E8B
0ed5 CD7F1D    CALL    #1D7F
0ed8 CDE31A    CALL    #1AE3
0edb DA040F    JP      C,#0F04
0ede 3E01      LD      A,#01
0ee0 32EC2E    LD      (#2EEC),A
0ee3 2AF32E    LD      HL,(#2EF3)
0ee6 E3        EX      (SP),HL
0ee7 2ADD30    LD      HL,(#30DD)
0eea E5        PUSH    HL
0eeb 210000    LD      HL,#0000
0eee 39        ADD     HL,SP
0eef 22ED2E    LD      (#2EED),HL
0ef2 AF        XOR     A
0ef3 327A2E    LD      (#2E7A),A
0ef6 CDD521    CALL    #21D5
0ef9 21B704    LD      HL,#04B7
0efc CDBD1C    CALL    #1CBD
0eff AF        XOR     A
0f00 F5        PUSH    AF
0f01 C33303    JP      #0333
0f04 CD7F1D    CALL    #1D7F
0f07 AF        XOR     A
0f08 32EC2E    LD      (#2EEC),A
0f0b C3DF01    JP      #01DF
0f0e 3E23      LD      A,#23
0f10 CDA51C    CALL    #1CA5
0f13 D2892A    JP      NC,#2A89
0f16 CD7F1D    CALL    #1D7F
0f19 CD2F1C    CALL    #1C2F
0f1c CDA31C    CALL    #1CA3
0f1f D2280F    JP      NC,#0F28
0f22 018787    LD      BC,#8787
0f25 CD451B    CALL    #1B45
0f28 CD2F1C    CALL    #1C2F
0f2b 015B04    LD      BC,#045B
0f2e DAF102    JP      C,#02F1
0f31 CDDC19    CALL    #19DC
0f34 CD2F1C    CALL    #1C2F
0f37 CA480F    JP      Z,#0F48
0f3a E5        PUSH    HL
0f3b CD321D    CALL    #1D32
0f3e DA2B0F    JP      C,#0F2B
0f41 E1        POP     HL
0f42 CD141C    CALL    #1C14
0f45 C34D0F    JP      #0F4D
0f48 3E22      LD      A,#22
0f4a CD7019    CALL    #1970
0f4d CD2F1C    CALL    #1C2F
0f50 CDA31C    CALL    #1CA3
0f53 D2190F    JP      NC,#0F19
0f56 C9        RET     

0f57 CDDD1F    CALL    #1FDD
0f5a EB        EX      DE,HL
0f5b 2A3931    LD      HL,(#3139)
0f5e D4971E    CALL    NC,#1E97
0f61 2B        DEC     HL
0f62 22F52E    LD      (#2EF5),HL
0f65 C9        RET     

0f66 CD1E1D    CALL    #1D1E
0f69 CD0722    CALL    #2207
0f6c D2750F    JP      NC,#0F75
0f6f CD0D1B    CALL    #1B0D
0f72 CADA21    JP      Z,#21DA
0f75 CD0D1B    CALL    #1B0D
0f78 C8        RET     Z

0f79 FEB3      CP      #B3
0f7b CA7110    JP      Z,#1071
0f7e FE25      CP      #25
0f80 CAE20F    JP      Z,#0FE2
0f83 CDE91C    CALL    #1CE9
0f86 CAAD0F    JP      Z,#0FAD
0f89 CDC911    CALL    #11C9
0f8c CD111C    CALL    #1C11
0f8f 2ADD30    LD      HL,(#30DD)
0f92 CD9E26    CALL    #269E
0f95 CD2C22    CALL    #222C
0f98 80        ADD     A,B
0f99 47        LD      B,A
0f9a CD1C22    CALL    #221C
0f9d B8        CP      B
0f9e DCD20F    CALL    C,#0FD2
0fa1 CDBD1C    CALL    #1CBD
0fa4 CDA31C    CALL    #1CA3
0fa7 CA750F    JP      Z,#0F75
0faa C3DA21    JP      #21DA
0fad 2ADD30    LD      HL,(#30DD)
0fb0 E5        PUSH    HL
0fb1 CDB718    CALL    #18B7
0fb4 D1        POP     DE
0fb5 EB        EX      DE,HL
0fb6 22DD30    LD      (#30DD),HL
0fb9 7A        LD      A,D
0fba B3        OR      E
0fbb CAA40F    JP      Z,#0FA4
0fbe CD1C22    CALL    #221C
0fc1 47        LD      B,A
0fc2 CD2C22    CALL    #222C
0fc5 B8        CP      B
0fc6 D4D20F    CALL    NC,#0FD2
0fc9 46        LD      B,(HL)
0fca CDB221    CALL    #21B2
0fcd 2B        DEC     HL
0fce 1B        DEC     DE
0fcf C3B90F    JP      #0FB9
0fd2 CDDB0F    CALL    #0FDB
0fd5 E601      AND     #01
0fd7 CCDA21    CALL    Z,#21DA
0fda C9        RET     

0fdb E5        PUSH    HL
0fdc 218B2E    LD      HL,#2E8B
0fdf C32022    JP      #2220
0fe2 CD2B1D    CALL    #1D2B
0fe5 CD951C    CALL    #1C95
0fe8 CDBA1F    CALL    #1FBA
0feb D22510    JP      NC,#1025
0fee FE44      CP      #44
0ff0 CA1F10    JP      Z,#101F
0ff3 21E930    LD      HL,#30E9
0ff6 0680      LD      B,#80
0ff8 FE5A      CP      #5A
0ffa CA1910    JP      Z,#1019
0ffd 0640      LD      B,#40
0fff FE43      CP      #43
1001 CA1910    JP      Z,#1019
1004 0620      LD      B,#20
1006 FEE3      CP      #E3
1008 CA1910    JP      Z,#1019
100b 0601      LD      B,#01
100d FE24      CP      #24
100f CA1910    JP      Z,#1019
1012 0602      LD      B,#02
1014 FE23      CP      #23
1016 C26010    JP      NZ,#1060
1019 7E        LD      A,(HL)
101a B0        OR      B
101b 77        LD      (HL),A
101c C3E50F    JP      #0FE5
101f CD1E1D    CALL    #1D1E
1022 C3E50F    JP      #0FE5
1025 7C        LD      A,H
1026 B7        OR      A
1027 C2BE02    JP      NZ,#02BE
102a 7D        LD      A,L
102b FE21      CP      #21
102d D2BE02    JP      NC,#02BE
1030 32EB30    LD      (#30EB),A
1033 CD951C    CALL    #1C95
1036 FE49      CP      #49
1038 CA5D10    JP      Z,#105D
103b FE45      CP      #45
103d CA4510    JP      Z,#1045
1040 FE46      CP      #46
1042 C2BE02    JP      NZ,#02BE
1045 F5        PUSH    AF
1046 CDBA1F    CALL    #1FBA
1049 DABE02    JP      C,#02BE
104c 7C        LD      A,H
104d B7        OR      A
104e C2BE02    JP      NZ,#02BE
1051 7D        LD      A,L
1052 21EB30    LD      HL,#30EB
1055 BE        CP      (HL)
1056 D2BE02    JP      NC,#02BE
1059 32EC30    LD      (#30EC),A
105c F1        POP     AF
105d 32EA30    LD      (#30EA),A
1060 21E930    LD      HL,#30E9
1063 46        LD      B,(HL)
1064 7E        LD      A,(HL)
1065 E6FD      AND     #FD
1067 77        LD      (HL),A
1068 78        LD      A,B
1069 E602      AND     #02
106b C4111D    CALL    NZ,#1D11
106e C3A40F    JP      #0FA4
1071 CD951C    CALL    #1C95
1074 CD7E1C    CALL    #1C7E
1077 CDB71E    CALL    #1EB7
107a CD831C    CALL    #1C83
107d 7A        LD      A,D
107e B7        OR      A
107f C2B202    JP      NZ,#02B2
1082 CD2C22    CALL    #222C
1085 BB        CP      E
1086 D2A40F    JP      NC,#0FA4
1089 0620      LD      B,#20
108b CDB221    CALL    #21B2
108e C38210    JP      #1082
1091 CD7F1D    CALL    #1D7F
1094 2AF32E    LD      HL,(#2EF3)
1097 E5        PUSH    HL
1098 3E31      LD      A,#31
109a CDA51C    CALL    #1CA5
109d F5        PUSH    AF
109e CD0722    CALL    #2207
10a1 3E22      LD      A,#22
10a3 CDA51C    CALL    #1CA5
10a6 D20E11    JP      NC,#110E
10a9 063F      LD      B,#3F
10ab CDB221    CALL    #21B2
10ae CD6520    CALL    #2065
10b1 AF        XOR     A
10b2 322931    LD      (#3129),A
10b5 F1        POP     AF
10b6 F5        PUSH    AF
10b7 C4DA21    CALL    NZ,#21DA
10ba 11FC2F    LD      DE,#2FFC
10bd D5        PUSH    DE
10be CDDC19    CALL    #19DC
10c1 CAE410    JP      Z,#10E4
10c4 D1        POP     DE
10c5 CDA027    CALL    #27A0
10c8 DAFD10    JP      C,#10FD
10cb CDA31C    CALL    #1CA3
10ce DAF510    JP      C,#10F5
10d1 78        LD      A,B
10d2 FE2C      CP      #2C
10d4 CABD10    JP      Z,#10BD
10d7 FE0D      CP      #0D
10d9 C2FD10    JP      NZ,#10FD
10dc 063F      LD      B,#3F
10de CDB221    CALL    #21B2
10e1 C3A910    JP      #10A9
10e4 CD4F1E    CALL    #1E4F
10e7 3E0D      LD      A,#0D
10e9 CD7019    CALL    #1970
10ec E1        POP     HL
10ed 22F32E    LD      (#2EF3),HL
10f0 060D      LD      B,#0D
10f2 C3CB10    JP      #10CB
10f5 78        LD      A,B
10f6 FE0D      CP      #0D
10f8 D1        POP     DE
10f9 E1        POP     HL
10fa C8        RET     Z

10fb E5        PUSH    HL
10fc D5        PUSH    DE
10fd 212411    LD      HL,#1124
1100 CDBD1C    CALL    #1CBD
1103 F1        POP     AF
1104 C4DA21    CALL    NZ,#21DA
1107 E1        POP     HL
1108 22F32E    LD      (#2EF3),HL
110b C39110    JP      #1091
110e 23        INC     HL
110f 222A31    LD      (#312A),HL
1112 CDBD1C    CALL    #1CBD
1115 23        INC     HL
1116 22F32E    LD      (#2EF3),HL
1119 CD761C    CALL    #1C76
111c 3E01      LD      A,#01
111e 322931    LD      (#3129),A
1121 C3AE10    JP      #10AE

1124 		db " INPUT ERROR-RETYPE ", $22

1139 CD771D    CALL    #1D77
113c CD5C1B    CALL    #1B5C
113f C34D0E    JP      #0E4D
1142 CD771D    CALL    #1D77
1145 013F04    LD      BC,#043F
1148 C3F102    JP      #02F1
114b CDB71E    CALL    #1EB7
114e D5        PUSH    DE
114f CDA31C    CALL    #1CA3
1152 CDB71E    CALL    #1EB7
1155 7A        LD      A,D
1156 B7        OR      A
1157 C2B202    JP      NZ,#02B2
115a 7B        LD      A,E
115b D1        POP     DE
115c F5        PUSH    AF
115d 3ED3      LD      A,#D3
115f CD6611    CALL    #1166
1162 F1        POP     AF
1163 C3A130    JP      #30A1
1166 21A130    LD      HL,#30A1
1169 77        LD      (HL),A
116a 7A        LD      A,D
116b B7        OR      A
116c C2B202    JP      NZ,#02B2
116f 23        INC     HL
1170 73        LD      (HL),E
1171 23        INC     HL
1172 36C9      LD      (HL),#C9
1174 C9        RET     

1175 CDB71E    CALL    #1EB7
1178 D5        PUSH    DE
1179 CDA31C    CALL    #1CA3
117c CDB71E    CALL    #1EB7
117f E1        POP     HL
1180 73        LD      (HL),E
1181 C9        RET     

1182 CD7F1D    CALL    #1D7F
1185 CD0D1B    CALL    #1B0D
1188 3E00      LD      A,#00
118a CAB411    JP      Z,#11B4
118d CDDD1F    CALL    #1FDD
1190 DAEE02    JP      C,#02EE
1193 EB        EX      DE,HL
1194 CD971E    CALL    #1E97
1197 22F130    LD      (#30F1),HL
119a CD761C    CALL    #1C76
119d CDDC19    CALL    #19DC
11a0 CAB802    JP      Z,#02B8
11a3 22F330    LD      (#30F3),HL
11a6 CD761C    CALL    #1C76
11a9 CDDC19    CALL    #19DC
11ac CAB802    JP      Z,#02B8
11af 22F530    LD      (#30F5),HL
11b2 3E80      LD      A,#80
11b4 32F730    LD      (#30F7),A
11b7 C9        RET     

11b8 AF        XOR     A
11b9 322631    LD      (#3126),A
11bc CDD22B    CALL    #2BD2
11bf 2A3931    LD      HL,(#3139)
11c2 E5        PUSH    HL
11c3 CD8808    CALL    #0888
11c6 C3AF06    JP      #06AF
11c9 212015    LD      HL,#1520
11cc E5        PUSH    HL
11cd 2107D2    LD      HL,#D207
11d0 39        ADD     HL,SP
11d1 016004    LD      BC,#0460
11d4 D2F102    JP      NC,#02F1
11d7 AF        XOR     A
11d8 32E82E    LD      (#2EE8),A
11db 3AE82E    LD      A,(#2EE8)
11de B7        OR      A
11df C23412    JP      NZ,#1234
11e2 CD1B1B    CALL    #1B1B
11e5 DAF411    JP      C,#11F4
11e8 CDE219    CALL    #19E2
11eb CAB802    JP      Z,#02B8
11ee CDFF1B    CALL    #1BFF
11f1 C33412    JP      #1234
11f4 FEE5      CP      #E5
11f6 CA4A12    JP      Z,#124A
11f9 CD321D    CALL    #1D32
11fc D23412    JP      NC,#1234
11ff AF        XOR     A
1200 CD911D    CALL    #1D91
1203 D23412    JP      NC,#1234
1206 CD8D1C    CALL    #1C8D
1209 FEBD      CP      #BD
120b CA872C    JP      Z,#2C87
120e FEBE      CP      #BE
1210 CA472C    JP      Z,#2C47
1213 FECC      CP      #CC
1215 CA2D16    JP      Z,#162D
1218 C39E37    JP      #379E
121b 00        NOP     
121c 00        NOP     
121d FEB6      CP      #B6
121f CA3A16    JP      Z,#163A
1222 FEB7      CP      #B7
1224 CABE16    JP      Z,#16BE
1227 FEBB      CP      #BB
1229 CAF016    JP      Z,#16F0
122c FEE0      CP      #E0
122e 210815    LD      HL,#1508
1231 CAA412    JP      Z,#12A4
1234 CD8D1C    CALL    #1C8D
1237 FEE1      CP      #E1
1239 D24A12    JP      NC,#124A
123c FEC0      CP      #C0
123e D29712    JP      NC,#1297
1241 E1        POP     HL
1242 3AE82E    LD      A,(#2EE8)
1245 B7        OR      A
1246 CAEE02    JP      Z,#02EE
1249 C9        RET     

124a E61F      AND     #1F
124c 2AE82E    LD      HL,(#2EE8)
124f 2D        DEC     L
1250 CA6A12    JP      Z,#126A
1253 FE05      CP      #05
1255 CA6812    JP      Z,#1268
1258 FE17      CP      #17
125a CA6A12    JP      Z,#126A
125d FE03      CP      #03
125f C2EE02    JP      NZ,#02EE
1262 CD951C    CALL    #1C95
1265 C3DB11    JP      #11DB
1268 3E09      LD      A,#09
126a CDB212    CALL    #12B2
126d D1        POP     DE
126e 1A        LD      A,(DE)
126f BE        CP      (HL)
1270 D0        RET     NC

1271 D5        PUSH    DE
1272 E5        PUSH    HL
1273 CD951C    CALL    #1C95
1276 E1        POP     HL
1277 E5        PUSH    HL
1278 0600      LD      B,#00
127a CDCC11    CALL    #11CC
127d E1        POP     HL
127e E5        PUSH    HL
127f 7E        LD      A,(HL)
1280 CDEF1B    CALL    #1BEF
1283 E601      AND     #01
1285 C28E12    JP      NZ,#128E
1288 22DD30    LD      (#30DD),HL
128b 09        ADD     HL,BC
128c 44        LD      B,H
128d 4D        LD      C,L
128e 21DB11    LD      HL,#11DB
1291 E3        EX      (SP),HL
1292 23        INC     HL
1293 CDD71C    CALL    #1CD7
1296 E9        JP      (HL)
1297 CD951C    CALL    #1C95
129a 2AE82E    LD      HL,(#2EE8)
129d 2D        DEC     L
129e CAEE02    JP      Z,#02EE
12a1 CDB212    CALL    #12B2
12a4 E5        PUSH    HL
12a5 CD7E1C    CALL    #1C7E
12a8 CDC911    CALL    #11C9
12ab CD831C    CALL    #1C83
12ae E1        POP     HL
12af C37E12    JP      #127E
12b2 E61F      AND     #1F
12b4 4F        LD      C,A
12b5 0600      LD      B,#00
12b7 210815    LD      HL,#1508
12ba 09        ADD     HL,BC
12bb 09        ADD     HL,BC
12bc 09        ADD     HL,BC
12bd C9        RET     

12be 		db "READY"PRESS RETURN TO CONTINUE" ERROR" IN LINE ", $22

12dd 2045      JR      NZ, #????
12df 52        LD      D,D
12e0 52        LD      D,D
12e1 4F        LD      C,A
12e2 52        LD      D,D
12e3 222049    LD      (#4920),HL
12e6 4E        LD      C,(HL)
12e7 204C      JR      NZ,#1335
12e9 49        LD      C,C
12ea 4E        LD      C,(HL)
12eb 45        LD      B,L
12ec 2022      JR      NZ,#1310
12ee 1000      DJNZ    #12F0
12f0 00        NOP     
12f1 00        NOP     
12f2 C1        POP     BC
12f3 9A        SBC     A,D
12f4 0A        LD      A,(BC)
12f5 3D        DEC     A
12f6 09        ADD     HL,BC
12f7 24        INC     H
12f8 06FE      LD      B,#FE
12fa 05        DEC     B
12fb CE09      ADC     A,#09
12fd 9C        SBC     A,H
12fe 067D      LD      B,#7D
1300 0A        LD      A,(BC)
1301 82        ADD     A,D
1302 069C      LD      B,#9C
1304 08        EX      AF,AF'
1305 F8        RET     M

1306 06BE      LD      B,#BE
1308 07        RLCA    
1309 00        NOP     
130a 00        NOP     
130b 1C        INC     E
130c 08        EX      AF,AF'
130d 35        DEC     (HL)
130e 0A        LD      A,(BC)
130f 08        EX      AF,AF'
1310 0A        LD      A,(BC)
1311 D63A      SUB     #3A

1313 5D        LD      E,L
1314 0B        DEC     BC
1315 78        LD      A,B
1316 0B        DEC     BC
1317 66        LD      H,(HL)
1318 0F        RRCA    
1319 F0        RET     P

131a 0B        DEC     BC
131b 5A        LD      E,D
131c 0C        INC     C
131d 0E0F      LD      C,#0F
131f 91        SUB     C
1320 104D      DJNZ    #136F
1322 0E40      LD      C,#40
1324 0D        DEC     C
1325 7D        LD      A,L
1326 0D        DEC     C
1327 A5        AND     L
1328 0D        DEC     C
1329 70        LD      (HL),B
132a 0ED5      LD      C,#D5
132c 0E04      LD      C,#04
132e 0F        RRCA    
132f 57        LD      D,A
1330 0F        RRCA    
1331 6B        LD      L,E
1332 0E42      LD      C,#42
1334 113911    LD      DE,#1139
1337 66        LD      H,(HL)
1338 0F        RRCA    
1339 53        LD      D,E
133a 0D        DEC     C
133b 4B        LD      C,E
133c 117511    LD      DE,#1175
133f 2C        INC     L
1340 0D        DEC     C
1341 39        ADD     HL,SP
1342 2B        DEC     HL
1343 E62B      AND     #2B
1345 BA        CP      D
1346 29        ADD     HL,HL
1347 EE02      XOR     #02
1349 B8        CP      B
134a 114806    LD      DE,#0648
134d 71        LD      (HL),C
134e 08        EX      AF,AF'
134f 3D        DEC     A
1350 08        EX      AF,AF'
1351 82        ADD     A,D
1352 11

1353 		db $80, "LET"
1357 		db $81, "FOR"
135b 		db $82, "PRINT"
1361 		db $83, "NEXT"
1366 		db $84, "IF"
1369 		db $85, "READ"
136e 		db $86, "INPUT"
1374 		db $87, "DATA"
1379 		db $88, "GOTO"
137e 		db $89, "GOSUB"
1384 		db $8A, "RETURN"
138b 		db $8B, "DIM"
138f 		db $8C, "STOP"
1394 		db $8D, "END"
1398 		db $8E, "RESTORE"
13a0 		db $8F, "REM"
13a4 		db $90, "FN
13a7 		db $91, "DEF
13ab 		db $92, "!
13ad 		db $93, "ON
13b0 		db $94, "OUT
13b4 		db $95, "FILL
13b9 		db $96, "EXIT
13be 		db $97, "OPEN
13c3 		db $98, "CLOSE
13c9 		db $99, "WRITE
13cf 		db $9B, "CHAIN
13d5 		db $9C, "LINE
13da 		db $9D, "DESTROY
13e2 		db $9E, "CREATE
13e9 		db $9F, "ERRSET
13f0 		db $A0, "RUN
13f4 		db $A1, "LIST
13f9 		db $A2, "MEMSET
1400 		db $A3, "SCR
1404 		db $A4, "AUTO
1409 		db $A5, "LOAD
140e 		db $A6, "CONT
1413 		db $A7, "APPEND
141a 		db $A8, "REN
141e 		db $A9, "RESET
1424 		db $AA, "SAVE
1429 		db $AB, "BYE
142d 		db $AC, "EDIT
1432 		db $AD, "DEL
1436 		db $AE, "PSIZE
143c 		db $AF, "CAT
1440 		db $B0, "STEP
1445 		db $B1, "TO
1448 		db $B2, "THEN
144d 		db $BC, "SIZE
1452 		db $B3, "TAB
1456 		db $B4, "ELSE
145b 		db $B5, "CHR$
1460 		db $B6, "ASC
1464 		db $B7, "VAL
1468 		db $B8, "STR$
146d 		db $B9, "NOENDMARK
1477 		db $BA, "INCHAR$
147f 		db $BD, "FILESIZE
1488 		db $BE, "FILEPTR
1490 		db $BB, "FILE
1495 		db $E0, "(
1497 		db $E0, "[
1499 		db $E2, "*
149B 		db $E3, "+
149d 		db $E5, "-
149f 		db $E7, "/
14a1 		db $EC, "AND
14a5 		db $ED, "OR
14a8 		db $EF, ">=
14ab 		db $F0, "<=
14ae 		db $F1, "<>
14b1 		db $EF, "=>
14b3 		db $F0, "=<
14b7 		db $F4, "<
14b9 		db $F5, "=
14bb 		db $F6, ">
14bd 		db $F7, "NOT
14c1 		db $E1, "^
14c3 		db $C6, "INT
14c7 		db $CC, "LEN
14cb 		db $CD, "CALL
14d0 		db $CE, "RND
14d4 		db $CA, "SGN
14d8 		db $CB, "SIN
14dc 		db $C4, "SQRT
14e1 		db $D2, "ATN
14e5 		db $D8, "FREE
14ea 		db $D9, "INP
14ee 		db $DA, "EXAM
14f3 		db $DB, "ABS
14f7 		db $DC, "COS
14fb 		db $DD, "LOG
14ff 		db $DE, "EXP
1503 		db $DF, "TYP
1507 		db $FF

1508 0F        RRCA   
1509 02        LD      (BC),A
150a 160C      LD      D,#0C
150c BD        CP      L
150d 17        RLA     
150e 0A        LD      A,(BC)
150f 33        INC     SP
1510 220855    LD      (#5508),HL
1513 23        INC     HL
1514 0F        RRCA    
1515 4D        LD      C,L
1516 17        RLA     
1517 08        EX      AF,AF'
1518 3E23      LD      A,#23
151a 0F        RRCA    
151b 55        LD      D,L
151c 160A      LD      D,#0A
151e 63        LD      H,E
151f 24        INC     H
1520 010000    LD      BC,#0000
1523 0D        DEC     C
1524 F7        RST     #30
1525 15        DEC     D
1526 0F        RRCA    
1527 03        INC     BC
1528 160F      LD      D,#0F
152a 7F        LD      A,A
152b 33        INC     SP
152c 04        INC     B
152d D615      SUB     #15
152f 02        LD      (BC),A
1530 E2150F    JP      PO,#0F15
1533 1F        RRA     
1534 1806      JR      #153C
1536 8B        ADC     A,E
1537 15        DEC     D
1538 0684      LD      B,#84
153a 15        DEC     D
153b 067E      LD      B,#7E
153d 15        DEC     D
153e 0F        RRCA    
153f 70        LD      (HL),B
1540 34        INC     (HL)
1541 0684      LD      B,#84
1543 15        DEC     D
1544 0668      LD      B,#68
1546 15        DEC     D
1547 0678      LD      B,#78
1549 15        DEC     D
154a 066E      LD      B,#6E
154c 15        DEC     D
154d 0D        DEC     C
154e ED15      DB      #ED, #15         ; Undocumented 8 T-State NOP
1550 0F        RRCA    
1551 A6        AND     (HL)
1552 160F      LD      D,#0F
1554 95        SUB     L
1555 160F      LD      D,#0F
1557 B6        OR      (HL)
1558 160F      LD      D,#0F
155a FE15      CP      #15
155c 0F        RRCA    
155d 75        LD      (HL),L
155e 33        INC     SP
155f 0F        RRCA    
1560 8A        ADC     A,D
1561 320F3D    LD      (#3D0F),A
1564 310F14    LD      SP,#140F
1567 17        RLA     
1568 CD9315    CALL    #1593
156b D8        RET     C

156c 77        LD      (HL),A
156d C9        RET     

156e CD9315    CALL    #1593
1571 77        LD      (HL),A
1572 3E41      LD      A,#41
1574 C8        RET     Z

1575 D8        RET     C

1576 77        LD      (HL),A
1577 C9        RET     

1578 CD9315    CALL    #1593
157b C8        RET     Z

157c 77        LD      (HL),A
157d C9        RET     

157e CD9315    CALL    #1593
1581 C0        RET     NZ

1582 77        LD      (HL),A
1583 C9        RET     

1584 CD9315    CALL    #1593
1587 C8        RET     Z

1588 D8        RET     C

1589 77        LD      (HL),A
158a C9        RET     

158b CD9315    CALL    #1593
158e D0        RET     NC

158f 77        LD      (HL),A
1590 C9        RET     

1591 3EFE      LD      A,#FE
1593 F5        PUSH    AF
1594 C5        PUSH    BC
1595 1A        LD      A,(DE)
1596 B7        OR      A
1597 F2A415    JP      P,#15A4
159a 0A        LD      A,(BC)
159b B7        OR      A
159c F2A415    JP      P,#15A4
159f EB        EX      DE,HL
15a0 50        LD      D,B
15a1 59        LD      E,C
15a2 44        LD      B,H
15a3 4D        LD      C,L
15a4 1A        LD      A,(DE)
15a5 EE80      XOR     #80
15a7 67        LD      H,A
15a8 0A        LD      A,(BC)
15a9 EE80      XOR     #80
15ab BC        CP      H
15ac C2C915    JP      NZ,#15C9
15af FE80      CP      #80
15b1 CAC915    JP      Z,#15C9
15b4 21FCFF    LD      HL,#FFFC
15b7 E5        PUSH    HL
15b8 EB        EX      DE,HL
15b9 19        ADD     HL,DE
15ba EB        EX      DE,HL
15bb 09        ADD     HL,BC
15bc C1        POP     BC
15bd EB        EX      DE,HL
15be 1A        LD      A,(DE)
15bf BE        CP      (HL)
15c0 C2C915    JP      NZ,#15C9
15c3 13        INC     DE
15c4 23        INC     HL
15c5 0C        INC     C
15c6 C2BE15    JP      NZ,#15BE
15c9 D1        POP     DE
15ca E1        POP     HL
15cb F5        PUSH    AF
15cc D5        PUSH    DE
15cd 24        INC     H
15ce F4E11B    CALL    P,#1BE1
15d1 E1        POP     HL
15d2 F1        POP     AF
15d3 3E00      LD      A,#00
15d5 C9        RET     

15d6 0A        LD      A,(BC)
15d7 B7        OR      A
15d8 C8        RET     Z

15d9 1A        LD      A,(DE)
15da 02        LD      (BC),A
15db B7        OR      A
15dc C8        RET     Z

15dd 50        LD      D,B
15de 59        LD      E,C
15df C3E11B    JP      #1BE1
15e2 0A        LD      A,(BC)
15e3 B7        OR      A
15e4 C2DD15    JP      NZ,#15DD
15e7 1A        LD      A,(DE)
15e8 B7        OR      A
15e9 C8        RET     Z

15ea C3DD15    JP      #15DD
15ed 1A        LD      A,(DE)
15ee 42        LD      B,D
15ef 4B        LD      C,E
15f0 B7        OR      A
15f1 CADD15    JP      Z,#15DD
15f4 AF        XOR     A
15f5 12        LD      (DE),A
15f6 C9        RET     

15f7 1A        LD      A,(DE)
15f8 B7        OR      A
15f9 C8        RET     Z

15fa EE80      XOR     #80
15fc 12        LD      (DE),A
15fd C9        RET     

15fe 1A        LD      A,(DE)
15ff E67F      AND     #7F
1601 12        LD      (DE),A
1602 C9        RET     

1603 1A        LD      A,(DE)
1604 B7        OR      A
1605 C8        RET     Z

1606 F2E11B    JP      P,#1BE1
1609 21F212    LD      HL,#12F2
160c C3E41B    JP      #1BE4
160f CD7B1C    CALL    #1C7B
1612 C30C37    JP      #370C
1615 D5        PUSH    DE
1616 CDA31C    CALL    #1CA3
1619 C21F16    JP      NZ,#161F
161c CDB71E    CALL    #1EB7
161f 212416    LD      HL,#1624
1622 E3        EX      (SP),HL
1623 E9        JP      (HL)
1624 CDA11E    CALL    #1EA1
1627 CD831C    CALL    #1C83
162a C33412    JP      #1234
162d CD7B1C    CALL    #1C7B
1630 CDDC19    CALL    #19DC
1633 C2B802    JP      NZ,#02B8
1636 EB        EX      DE,HL
1637 C32416    JP      #1624
163a CD7B1C    CALL    #1C7B
163d AF        XOR     A
163e CD481D    CALL    #1D48
1641 D24A16    JP      NC,#164A
1644 CDDC19    CALL    #19DC
1647 C2B802    JP      NZ,#02B8
164a 7A        LD      A,D
164b B3        OR      E
164c CAB202    JP      Z,#02B2
164f 6E        LD      L,(HL)
1650 2600      LD      H,#00
1652 C32416    JP      #1624
1655 1A        LD      A,(DE)
1656 E67F      AND     #7F
1658 D641      SUB     #41
165a F26516    JP      P,#1665
165d 1A        LD      A,(DE)
165e 47        LD      B,A
165f AF        XOR     A
1660 12        LD      (DE),A
1661 78        LD      A,B
1662 C38B16    JP      #168B
1665 D607      SUB     #07
1667 D0        RET     NC

1668 D5        PUSH    DE
1669 4F        LD      C,A
166a 2601      LD      H,#01
166c 1B        DEC     DE
166d 1A        LD      A,(DE)
166e E60F      AND     #0F
1670 CA7416    JP      Z,#1674
1673 24        INC     H
1674 1A        LD      A,(DE)
1675 E6F0      AND     #F0
1677 12        LD      (DE),A
1678 0C        INC     C
1679 CA8716    JP      Z,#1687
167c B7        OR      A
167d CA8316    JP      Z,#1683
1680 24        INC     H
1681 AF        XOR     A
1682 12        LD      (DE),A
1683 0C        INC     C
1684 C26C16    JP      NZ,#166C
1687 D1        POP     DE
1688 25        DEC     H
1689 C8        RET     Z

168a 1A        LD      A,(DE)
168b B7        OR      A
168c F0        RET     P

168d 42        LD      B,D
168e 4B        LD      C,E
168f 11F212    LD      DE,#12F2
1692 C35523    JP      #2355
1695 CDBA1E    CALL    #1EBA
1698 3EDB      LD      A,#DB
169a CD6611    CALL    #1166
169d CDA130    CALL    #30A1
16a0 6F        LD      L,A
16a1 2600      LD      H,#00
16a3 C3A11E    JP      #1EA1
16a6 CD111C    CALL    #1C11
16a9 2AF92E    LD      HL,(#2EF9)
16ac EB        EX      DE,HL
16ad 2ADD30    LD      HL,(#30DD)
16b0 CD8A1D    CALL    #1D8A
16b3 C3A11E    JP      #1EA1
16b6 CDBA1E    CALL    #1EBA
16b9 EB        EX      DE,HL
16ba 6E        LD      L,(HL)
16bb C3A116    JP      #16A1
16be CD7B1C    CALL    #1C7B
16c1 211F00    LD      HL,#001F
16c4 22E330    LD      (#30E3),HL
16c7 21A130    LD      HL,#30A1
16ca AF        XOR     A
16cb 37        SCF     
16cc CD7019    CALL    #1970
16cf AF        XOR     A
16d0 02        LD      (BC),A
16d1 21FF2E    LD      HL,#2EFF
16d4 11A030    LD      DE,#30A0
16d7 13        INC     DE
16d8 1A        LD      A,(DE)
16d9 FE20      CP      #20
16db CAD716    JP      Z,#16D7
16de CDA027    CALL    #27A0
16e1 017304    LD      BC,#0473
16e4 DAF102    JP      C,#02F1
16e7 21FF2E    LD      HL,#2EFF
16ea CDFF1B    CALL    #1BFF
16ed C32716    JP      #1627
16f0 CD7B1C    CALL    #1C7B
16f3 CD8808    CALL    #0888
16f6 3E01      LD      A,#01
16f8 CD3A3A    CALL    #3A3A
16fb D20717    JP      NC,#1707
16fe 21F212    LD      HL,#12F2
1701 CDFF1B    CALL    #1BFF
1704 C32716    JP      #1627
1707 110400    LD      DE,#0004
170a 19        ADD     HL,DE
170b 7E        LD      A,(HL)
170c E67F      AND     #7F
170e 6F        LD      L,A
170f 2600      LD      H,#00
1711 C32416    JP      #1624
1714 CDBA1E    CALL    #1EBA
1717 CDB52D    CALL    #2DB5
171a E608      AND     #08
171c CAD802    JP      Z,#02D8
171f CDC92C    CALL    #2CC9
1722 210000    LD      HL,#0000
1725 FE01      CP      #01
1727 CAA11E    JP      Z,#1EA1
172a 23        INC     HL
172b FE02      CP      #02
172d CAA11E    JP      Z,#1EA1
1730 FE03      CP      #03
1732 CAA11E    JP      Z,#1EA1
1735 23        INC     HL
1736 C3A11E    JP      #1EA1
1739 3000      JR      NC,#173B
173b 00        NOP     
173c 00        NOP     
173d 42        LD      B,D
173e 50        LD      D,B
173f 00        NOP     
1740 00        NOP     
1741 00        NOP     
1742 40        LD      B,B
1743 1000      DJNZ    #1745
1745 00        NOP     
1746 00        NOP     
1747 41        LD      B,C
1748 43        LD      B,E
1749 42        LD      B,D
174a 94        SUB     H
174b 48        LD      C,B
174c 40        LD      B,B
174d 1A        LD      A,(DE)
174e B7        OR      A
174f C8        RET     Z

1750 FAB202    JP      M,#02B2
1753 0640      LD      B,#40
1755 E601      AND     #01
1757 1A        LD      A,(DE)
1758 CA5D17    JP      Z,#175D
175b 05        DEC     B
175c 3C        INC     A
175d EB        EX      DE,HL
175e 70        LD      (HL),B
175f DE40      SBC     A,#40
1761 1F        RRA     
1762 F5        PUSH    AF
1763 E5        PUSH    HL
1764 44        LD      B,H
1765 4D        LD      C,L
1766 11CD30    LD      DE,#30CD
1769 21BC17    LD      HL,#17BC
176c 3E01      LD      A,#01
176e CD8E18    CALL    #188E
1771 3E04      LD      A,#04
1773 E1        POP     HL
1774 E5        PUSH    HL
1775 F5        PUSH    AF
1776 11D230    LD      DE,#30D2
1779 CDE41B    CALL    #1BE4
177c 01D230    LD      BC,#30D2
177f 11CD30    LD      DE,#30CD
1782 CD6324    CALL    #2463
1785 01D230    LD      BC,#30D2
1788 11CD30    LD      DE,#30CD
178b CD3E23    CALL    #233E
178e 114217    LD      DE,#1742
1791 01D230    LD      BC,#30D2
1794 CD3322    CALL    #2233
1797 01CD30    LD      BC,#30CD
179a 11D230    LD      DE,#30D2
179d CD5523    CALL    #2355
17a0 F1        POP     AF
17a1 E1        POP     HL
17a2 3D        DEC     A
17a3 C27417    JP      NZ,#1774
17a6 E5        PUSH    HL
17a7 EB        EX      DE,HL
17a8 21CD30    LD      HL,#30CD
17ab CDE41B    CALL    #1BE4
17ae E1        POP     HL
17af F1        POP     AF
17b0 86        ADD     A,(HL)
17b1 77        LD      (HL),A
17b2 C9        RET     

17b3 115442    LD      DE,#4254
17b6 00        NOP     
17b7 40        LD      B,B
17b8 115442    LD      DE,#4254
17bb 00        NOP     
17bc 41        LD      B,C
17bd 0A        LD      A,(BC)
17be B7        OR      A
17bf C8        RET     Z

17c0 1A        LD      A,(DE)
17c1 B7        OR      A
17c2 C2CD17    JP      NZ,#17CD
17c5 50        LD      D,B
17c6 59        LD      E,C
17c7 214717    LD      HL,#1747
17ca C3E41B    JP      #1BE4
17cd C5        PUSH    BC
17ce D5        PUSH    DE
17cf EB        EX      DE,HL
17d0 CD6D1F    CALL    #1F6D
17d3 C20518    JP      NZ,#1805
17d6 013D17    LD      BC,#173D
17d9 D1        POP     DE
17da D5        PUSH    DE
17db 1A        LD      A,(DE)
17dc B7        OR      A
17dd FA0518    JP      M,#1805
17e0 CD9115    CALL    #1591
17e3 DA0518    JP      C,#1805
17e6 E1        POP     HL
17e7 CDFF1B    CALL    #1BFF
17ea CDBA1E    CALL    #1EBA
17ed E1        POP     HL
17ee D5        PUSH    DE
17ef E5        PUSH    HL
17f0 11CD30    LD      DE,#30CD
17f3 CDE41B    CALL    #1BE4
17f6 C1        POP     BC
17f7 D1        POP     DE
17f8 1D        DEC     E
17f9 C8        RET     Z

17fa D5        PUSH    DE
17fb C5        PUSH    BC
17fc 11CD30    LD      DE,#30CD
17ff CD3322    CALL    #2233
1802 C3F617    JP      #17F6
1805 E1        POP     HL
1806 CDFF1B    CALL    #1BFF
1809 D1        POP     DE
180a D5        PUSH    DE
180b CD8A32    CALL    #328A
180e 21FF2E    LD      HL,#2EFF
1811 E5        PUSH    HL
1812 CD141C    CALL    #1C14
1815 D1        POP     DE
1816 C1        POP     BC
1817 C5        PUSH    BC
1818 CD3322    CALL    #2233
181b D1        POP     DE
181c C33D31    JP      #313D
181f 1A        LD      A,(DE)
1820 B7        OR      A
1821 CA5718    JP      Z,#1857
1824 FA3D18    JP      M,#183D
1827 CDEF1B    CALL    #1BEF
182a 42        LD      B,D
182b 4B        LD      C,E
182c 118D18    LD      DE,#188D
182f CD3322    CALL    #2233
1832 CDBA1E    CALL    #1EBA
1835 EB        EX      DE,HL
1836 2B        DEC     HL
1837 22C730    LD      (#30C7),HL
183a C35A18    JP      #185A
183d 3A1001    LD      A,(#0110)
1840 C603      ADD     A,#03
1842 57        LD      D,A
1843 1E30      LD      E,#30
1845 210000    LD      HL,#0000
1848 1A        LD      A,(DE)
1849 E60F      AND     #0F
184b 47        LD      B,A
184c 23        INC     HL
184d 1A        LD      A,(DE)
184e E60F      AND     #0F
1850 B8        CP      B
1851 CA4C18    JP      Z,#184C
1854 22C730    LD      (#30C7),HL
1857 CD111C    CALL    #1C11
185a 2AC730    LD      HL,(#30C7)
185d 0617      LD      B,#17
185f 7D        LD      A,L
1860 E62D      AND     #2D
1862 E26618    JP      PO,#1866
1865 3F        CCF     
1866 7C        LD      A,H
1867 1F        RRA     
1868 67        LD      H,A
1869 7D        LD      A,L
186a 1F        RRA     
186b 6F        LD      L,A
186c 05        DEC     B
186d C26018    JP      NZ,#1860
1870 22C730    LD      (#30C7),HL
1873 23        INC     HL
1874 CDA11E    CALL    #1EA1
1877 CDEF1B    CALL    #1BEF
187a 42        LD      B,D
187b 4B        LD      C,E
187c 118D18    LD      DE,#188D
187f C36324    JP      #2463
1882 210100    LD      HL,#0001
1885 22C730    LD      (#30C7),HL
1888 C9        RET     

1889 65        LD      H,L
188a 53        LD      D,E
188b 60        LD      H,B
188c 00        NOP     
188d 45        LD      B,L
188e 222631    LD      (#3126),HL
1891 F5        PUSH    AF
1892 C5        PUSH    BC
1893 D5        PUSH    DE
1894 CDE41B    CALL    #1BE4
1897 C1        POP     BC
1898 D1        POP     DE
1899 D5        PUSH    DE
189a C5        PUSH    BC
189b CD3322    CALL    #2233
189e 2A2631    LD      HL,(#3126)
18a1 11FBFF    LD      DE,#FFFB
18a4 19        ADD     HL,DE
18a5 222631    LD      (#3126),HL
18a8 EB        EX      DE,HL
18a9 C1        POP     BC
18aa C5        PUSH    BC
18ab CD5523    CALL    #2355
18ae C1        POP     BC
18af D1        POP     DE
18b0 F1        POP     AF
18b1 3D        DEC     A
18b2 C8        RET     Z

18b3 F5        PUSH    AF
18b4 C39918    JP      #1899
18b7 AF        XOR     A
18b8 010000    LD      BC,#0000
18bb C5        PUSH    BC
18bc B7        OR      A
18bd F5        PUSH    AF
18be F1        POP     AF
18bf F5        PUSH    AF
18c0 CD481D    CALL    #1D48
18c3 D2EB18    JP      NC,#18EB
18c6 F1        POP     AF
18c7 F5        PUSH    AF
18c8 C2EE02    JP      NZ,#02EE
18cb CD8D1C    CALL    #1C8D
18ce FEB5      CP      #B5
18d0 CA2019    JP      Z,#1920
18d3 FEBA      CP      #BA
18d5 CA3819    JP      Z,#1938
18d8 FEB8      CP      #B8
18da CA5219    JP      Z,#1952
18dd 3EFF      LD      A,#FF
18df CD911D    CALL    #1D91
18e2 D20D19    JP      NC,#190D
18e5 CDDC19    CALL    #19DC
18e8 C2B802    JP      NZ,#02B8
18eb 7A        LD      A,D
18ec B3        OR      E
18ed CA0D19    JP      Z,#190D
18f0 2ADD30    LD      HL,(#30DD)
18f3 44        LD      B,H
18f4 4D        LD      C,L
18f5 CD8A1D    CALL    #1D8A
18f8 CD551C    CALL    #1C55
18fb 22DD30    LD      (#30DD),HL
18fe D5        PUSH    DE
18ff 2ADF30    LD      HL,(#30DF)
1902 7E        LD      A,(HL)
1903 02        LD      (BC),A
1904 0B        DEC     BC
1905 23        INC     HL
1906 1B        DEC     DE
1907 7A        LD      A,D
1908 B3        OR      E
1909 C20219    JP      NZ,#1902
190c D1        POP     DE
190d F1        POP     AF
190e E1        POP     HL
190f 19        ADD     HL,DE
1910 E5        PUSH    HL
1911 C21E19    JP      NZ,#191E
1914 F5        PUSH    AF
1915 3EE3      LD      A,#E3
1917 CDA51C    CALL    #1CA5
191a D2BE18    JP      NC,#18BE
191d E1        POP     HL
191e E1        POP     HL
191f C9        RET     

1920 CD7B1C    CALL    #1C7B
1923 CDB71E    CALL    #1EB7
1926 D5        PUSH    DE
1927 11FFFF    LD      DE,#FFFF
192a CD221C    CALL    #1C22
192d D1        POP     DE
192e 73        LD      (HL),E
192f CD831C    CALL    #1C83
1932 110100    LD      DE,#0001
1935 C30D19    JP      #190D
1938 CD7B1C    CALL    #1C7B
193b CDB71E    CALL    #1EB7
193e 7B        LD      A,E
193f CD5236    CALL    #3652 	; Read char from keyboard
1942 5F        LD      E,A
1943 FE03      CP      #03
1945 C22619    JP      NZ,#1926
1948 3A1801    LD      A,(#0118)
194b B7        OR      A
194c CAE30E    JP      Z,#0EE3
194f C32619    JP      #1926
1952 CD7B1C    CALL    #1C7B
1955 CDC911    CALL    #11C9
1958 CD831C    CALL    #1C83
195b CD111C    CALL    #1C11
195e CD1E1D    CALL    #1D1E
1961 2ADD30    LD      HL,(#30DD)
1964 CD9E26    CALL    #269E
1967 58        LD      E,B
1968 1600      LD      D,#00
196a 22DF30    LD      (#30DF),HL
196d C3EB18    JP      #18EB
1970 E5        PUSH    HL
1971 F5        PUSH    AF
1972 C5        PUSH    BC
1973 2AE330    LD      HL,(#30E3)
1976 E5        PUSH    HL
1977 CDB818    CALL    #18B8
197a EB        EX      DE,HL
197b 2ADD30    LD      HL,(#30DD)
197e 19        ADD     HL,DE
197f 22DD30    LD      (#30DD),HL
1982 210000    LD      HL,#0000
1985 39        ADD     HL,SP
1986 CDCF1C    CALL    #1CCF
1989 E1        POP     HL
198a DA8E19    JP      C,#198E
198d EB        EX      DE,HL
198e E1        POP     HL
198f F1        POP     AF
1990 D4B019    CALL    NC,#19B0
1993 C1        POP     BC
1994 2ADD30    LD      HL,(#30DD)
1997 7A        LD      A,D
1998 B3        OR      E
1999 C8        RET     Z

199a 7E        LD      A,(HL)
199b 02        LD      (BC),A
199c 2B        DEC     HL
199d 03        INC     BC
199e 1B        DEC     DE
199f C39719    JP      #1997
19a2 210400    LD      HL,#0004
19a5 19        ADD     HL,DE
19a6 D5        PUSH    DE
19a7 0620      LD      B,#20
19a9 CD421C    CALL    #1C42
19ac D1        POP     DE
19ad CDB019    CALL    #19B0
19b0 73        LD      (HL),E
19b1 23        INC     HL
19b2 72        LD      (HL),D
19b3 23        INC     HL
19b4 C9        RET     

19b5 5E        LD      E,(HL)
19b6 23        INC     HL
19b7 56        LD      D,(HL)
19b8 23        INC     HL
19b9 C9        RET     

19ba 210400    LD      HL,#0004
19bd CD401C    CALL    #1C40
19c0 E5        PUSH    HL
19c1 23        INC     HL
19c2 23        INC     HL
19c3 110B00    LD      DE,#000B
19c6 CDB019    CALL    #19B0
19c9 E1        POP     HL
19ca E5        PUSH    HL
19cb 010500    LD      BC,#0005
19ce CD821F    CALL    #1F82
19d1 EB        EX      DE,HL
19d2 E1        POP     HL
19d3 CDB019    CALL    #19B0
19d6 EB        EX      DE,HL
19d7 23        INC     HL
19d8 23        INC     HL
19d9 C3401C    JP      #1C40
19dc CD1B1B    CALL    #1B1B
19df DAEE02    JP      C,#02EE
19e2 CD311B    CALL    #1B31
19e5 D24B1A    JP      NC,#1A4B
19e8 CD8D1C    CALL    #1C8D
19eb 3EE0      LD      A,#E0
19ed CDA51C    CALL    #1CA5
19f0 CA021A    JP      Z,#1A02
19f3 CD891B    CALL    #1B89
19f6 D2441A    JP      NC,#1A44
19f9 210500    LD      HL,#0005
19fc CD401C    CALL    #1C40
19ff C3441A    JP      #1A44
1a02 3E20      LD      A,#20
1a04 B1        OR      C
1a05 4F        LD      C,A
1a06 CD891B    CALL    #1B89
1a09 E5        PUSH    HL
1a0a DCBA19    CALL    C,#19BA
1a0d E1        POP     HL
1a0e 110000    LD      DE,#0000
1a11 D5        PUSH    DE
1a12 23        INC     HL
1a13 23        INC     HL
1a14 E5        PUSH    HL
1a15 CDB71E    CALL    #1EB7
1a18 E1        POP     HL
1a19 CDCF1C    CALL    #1CCF
1a1c D2B202    JP      NC,#02B2
1a1f E3        EX      (SP),HL
1a20 19        ADD     HL,DE
1a21 EB        EX      DE,HL
1a22 E1        POP     HL
1a23 23        INC     HL
1a24 23        INC     HL
1a25 4E        LD      C,(HL)
1a26 23        INC     HL
1a27 46        LD      B,(HL)
1a28 E5        PUSH    HL
1a29 78        LD      A,B
1a2a B1        OR      C
1a2b CA3A1A    JP      Z,#1A3A
1a2e CD821F    CALL    #1F82
1a31 E3        EX      (SP),HL
1a32 2B        DEC     HL
1a33 E5        PUSH    HL
1a34 CD761C    CALL    #1C76
1a37 C3151A    JP      #1A15
1a3a CD831C    CALL    #1C83
1a3d E1        POP     HL
1a3e 23        INC     HL
1a3f 0E05      LD      C,#05
1a41 CDB21C    CALL    #1CB2
1a44 F601      OR      #01
1a46 110400    LD      DE,#0004
1a49 19        ADD     HL,DE
1a4a C9        RET     

1a4b CD891B    CALL    #1B89
1a4e E5        PUSH    HL
1a4f 110A00    LD      DE,#000A
1a52 DCA219    CALL    C,#19A2
1a55 E1        POP     HL
1a56 CDB519    CALL    #19B5
1a59 EB        EX      DE,HL
1a5a 22E330    LD      (#30E3),HL
1a5d EB        EX      DE,HL
1a5e E5        PUSH    HL
1a5f CDB519    CALL    #19B5
1a62 22DF30    LD      (#30DF),HL
1a65 EB        EX      DE,HL
1a66 22E130    LD      (#30E1),HL
1a69 3EE0      LD      A,#E0
1a6b CDA51C    CALL    #1CA5
1a6e 3F        CCF     
1a6f D2B81A    JP      NC,#1AB8
1a72 CDC41A    CALL    #1AC4
1a75 21E130    LD      HL,#30E1
1a78 CDCF1C    CALL    #1CCF
1a7b DA811A    JP      C,#1A81
1a7e C2B202    JP      NZ,#02B2
1a81 2ADF30    LD      HL,(#30DF)
1a84 2B        DEC     HL
1a85 19        ADD     HL,DE
1a86 22DF30    LD      (#30DF),HL
1a89 D5        PUSH    DE
1a8a CDA31C    CALL    #1CA3
1a8d DAA31A    JP      C,#1AA3
1a90 CDC41A    CALL    #1AC4
1a93 21E130    LD      HL,#30E1
1a96 CDCF1C    CALL    #1CCF
1a99 DA9F1A    JP      C,#1A9F
1a9c C2B202    JP      NZ,#02B2
1a9f EB        EX      DE,HL
1aa0 22E130    LD      (#30E1),HL
1aa3 CD831C    CALL    #1C83
1aa6 D1        POP     DE
1aa7 2AE130    LD      HL,(#30E1)
1aaa CD8A1D    CALL    #1D8A
1aad FAB202    JP      M,#02B2
1ab0 23        INC     HL
1ab1 22E130    LD      (#30E1),HL
1ab4 22E330    LD      (#30E3),HL
1ab7 37        SCF     
1ab8 C1        POP     BC
1ab9 2AE130    LD      HL,(#30E1)
1abc EB        EX      DE,HL
1abd 2ADF30    LD      HL,(#30DF)
1ac0 3E01      LD      A,#01
1ac2 3D        DEC     A
1ac3 C9        RET     

1ac4 2AE330    LD      HL,(#30E3)
1ac7 E5        PUSH    HL
1ac8 2ADF30    LD      HL,(#30DF)
1acb E5        PUSH    HL
1acc 2AE130    LD      HL,(#30E1)
1acf E5        PUSH    HL
1ad0 CDB71E    CALL    #1EB7
1ad3 CAB202    JP      Z,#02B2
1ad6 E1        POP     HL
1ad7 22E130    LD      (#30E1),HL
1ada E1        POP     HL
1adb 22DF30    LD      (#30DF),HL
1ade E1        POP     HL
1adf 22E330    LD      (#30E3),HL
1ae2 C9        RET     

1ae3 CD951C    CALL    #1C95
1ae6 FE5C      CP      #5C
1ae8 C8        RET     Z

1ae9 FE0D      CP      #0D
1aeb CAFD1A    JP      Z,#1AFD
1aee 21EA2E    LD      HL,#2EEA
1af1 AE        XOR     (HL)
1af2 C2EE02    JP      NZ,#02EE
1af5 D5        PUSH    DE
1af6 CD500E    CALL    #0E50
1af9 D1        POP     DE
1afa C3E31A    JP      #1AE3
1afd 7E        LD      A,(HL)
1afe D601      SUB     #01
1b00 C6FF      ADD     A,#FF
1b02 3F        CCF     
1b03 DA091B    JP      C,#1B09
1b06 23        INC     HL
1b07 23        INC     HL
1b08 23        INC     HL
1b09 22F32E    LD      (#2EF3),HL
1b0c C9        RET     

1b0d CD8D1C    CALL    #1C8D
1b10 FE0D      CP      #0D
1b12 C8        RET     Z

1b13 FE5C      CP      #5C
1b15 C8        RET     Z

1b16 21EA2E    LD      HL,#2EEA
1b19 BE        CP      (HL)
1b1a C9        RET     

1b1b CDC51B    CALL    #1BC5
1b1e D8        RET     C

1b1f 47        LD      B,A
1b20 0E0F      LD      C,#0F
1b22 CDD21B    CALL    #1BD2
1b25 3F        CCF     
1b26 D0        RET     NC

1b27 E60F      AND     #0F
1b29 4F        LD      C,A
1b2a C9        RET     

1b2b CD1B1B    CALL    #1B1B
1b2e DAEE02    JP      C,#02EE
1b31 3E24      LD      A,#24
1b33 CDA51C    CALL    #1CA5
1b36 D8        RET     C

1b37 79        LD      A,C
1b38 F680      OR      #80
1b3a 4F        LD      C,A
1b3b AF        XOR     A
1b3c C9        RET     

1b3d CD2B1B    CALL    #1B2B
1b40 79        LD      A,C
1b41 F640      OR      #40
1b43 4F        LD      C,A
1b44 C9        RET     

1b45 C5        PUSH    BC
1b46 CD510E    CALL    #0E51
1b49 CDE31A    CALL    #1AE3
1b4c C1        POP     BC
1b4d D8        RET     C

1b4e CD951C    CALL    #1C95
1b51 FE0D      CP      #0D
1b53 37        SCF     
1b54 C8        RET     Z

1b55 B8        CP      B
1b56 C8        RET     Z

1b57 B9        CP      C
1b58 C2451B    JP      NZ,#1B45
1b5b C9        RET     

1b5c CD8D1C    CALL    #1C8D
1b5f FEF5      CP      #F5
1b61 C8        RET     Z

1b62 FE0D      CP      #0D
1b64 CA721B    JP      Z,#1B72
1b67 FE5C      CP      #5C
1b69 CA721B    JP      Z,#1B72
1b6c CD951C    CALL    #1C95
1b6f C35C1B    JP      #1B5C
1b72 019091    LD      BC,#9190
1b75 CD451B    CALL    #1B45
1b78 01B603    LD      BC,#03B6
1b7b DADE02    JP      C,#02DE
1b7e FE91      CP      #91
1b80 CAAC02    JP      Z,#02AC
1b83 068D      LD      B,#8D
1b85 CD851C    CALL    #1C85
1b88 C9        RET     

1b89 78        LD      A,B
1b8a D641      SUB     #41
1b8c 87        ADD     A,A
1b8d 2A3731    LD      HL,(#3137)
1b90 23        INC     HL
1b91 CD9B29    CALL    #299B
1b94 54        LD      D,H
1b95 5D        LD      E,L
1b96 CDD71C    CALL    #1CD7
1b99 7C        LD      A,H
1b9a B5        OR      L
1b9b CAA71B    JP      Z,#1BA7
1b9e 7E        LD      A,(HL)
1b9f 23        INC     HL
1ba0 B9        CP      C
1ba1 C2941B    JP      NZ,#1B94
1ba4 23        INC     HL
1ba5 23        INC     HL
1ba6 C9        RET     

1ba7 D5        PUSH    DE
1ba8 210300    LD      HL,#0003
1bab CD401C    CALL    #1C40
1bae 22E730    LD      (#30E7),HL
1bb1 EB        EX      DE,HL
1bb2 E1        POP     HL
1bb3 22E530    LD      (#30E5),HL
1bb6 CDB019    CALL    #19B0
1bb9 EB        EX      DE,HL
1bba 71        LD      (HL),C
1bbb 23        INC     HL
1bbc 23        INC     HL
1bbd 23        INC     HL
1bbe 3E01      LD      A,#01
1bc0 32E92E    LD      (#2EE9),A
1bc3 37        SCF     
1bc4 C9        RET     

1bc5 CD8D1C    CALL    #1C8D
1bc8 FE41      CP      #41
1bca D8        RET     C

1bcb FE5B      CP      #5B
1bcd 3F        CCF     
1bce D2DC1B    JP      NC,#1BDC
1bd1 C9        RET     

1bd2 CD8D1C    CALL    #1C8D
1bd5 FE30      CP      #30
1bd7 D8        RET     C

1bd8 FE3A      CP      #3A
1bda 3F        CCF     
1bdb D8        RET     C

1bdc 23        INC     HL
1bdd 22F32E    LD      (#2EF3),HL
1be0 C9        RET     

1be1 214717    LD      HL,#1747
1be4 0E05      LD      C,#05
1be6 7E        LD      A,(HL)
1be7 12        LD      (DE),A
1be8 2B        DEC     HL
1be9 1B        DEC     DE
1bea 0D        DEC     C
1beb C2E61B    JP      NZ,#1BE6
1bee C9        RET     

1bef 2ADD30    LD      HL,(#30DD)
1bf2 010500    LD      BC,#0005
1bf5 09        ADD     HL,BC
1bf6 54        LD      D,H
1bf7 5D        LD      E,L
1bf8 C9        RET     

1bf9 CDEF1B    CALL    #1BEF
1bfc 42        LD      B,D
1bfd 4B        LD      C,E
1bfe C9        RET     

1bff E5        PUSH    HL
1c00 11FBFF    LD      DE,#FFFB
1c03 CD221C    CALL    #1C22
1c06 D1        POP     DE
1c07 EB        EX      DE,HL
1c08 CDE41B    CALL    #1BE4
1c0b AF        XOR     A
1c0c 3C        INC     A
1c0d 32E82E    LD      (#2EE8),A
1c10 C9        RET     

1c11 21FF2E    LD      HL,#2EFF
1c14 EB        EX      DE,HL
1c15 2ADD30    LD      HL,(#30DD)
1c18 010500    LD      BC,#0005
1c1b 09        ADD     HL,BC
1c1c 22DD30    LD      (#30DD),HL
1c1f C3E41B    JP      #1BE4
1c22 2ADD30    LD      HL,(#30DD)
1c25 E5        PUSH    HL
1c26 19        ADD     HL,DE
1c27 CD551C    CALL    #1C55
1c2a 22DD30    LD      (#30DD),HL
1c2d E1        POP     HL
1c2e C9        RET     

1c2f E5        PUSH    HL
1c30 2AF32E    LD      HL,(#2EF3)
1c33 E5        PUSH    HL
1c34 2AF52E    LD      HL,(#2EF5)
1c37 22F32E    LD      (#2EF3),HL
1c3a E1        POP     HL
1c3b 22F52E    LD      (#2EF5),HL
1c3e E1        POP     HL
1c3f C9        RET     

1c40 0600      LD      B,#00
1c42 EB        EX      DE,HL
1c43 2AF92E    LD      HL,(#2EF9)
1c46 E5        PUSH    HL
1c47 19        ADD     HL,DE
1c48 CD551C    CALL    #1C55
1c4b 22F92E    LD      (#2EF9),HL
1c4e E1        POP     HL
1c4f E5        PUSH    HL
1c50 CDE01C    CALL    #1CE0
1c53 E1        POP     HL
1c54 C9        RET     

1c55 D5        PUSH    DE
1c56 EB        EX      DE,HL
1c57 21F92E    LD      HL,#2EF9
1c5a CDCF1C    CALL    #1CCF
1c5d DA691C    JP      C,#1C69
1c60 21DD30    LD      HL,#30DD
1c63 CDCF1C    CALL    #1CCF
1c66 EB        EX      DE,HL
1c67 D1        POP     DE
1c68 D8        RET     C

1c69 017904    LD      BC,#0479
1c6c 2A3B31    LD      HL,(#313B)
1c6f 2B        DEC     HL
1c70 22DD30    LD      (#30DD),HL
1c73 C3F102    JP      #02F1
1c76 062C      LD      B,#2C
1c78 C3851C    JP      #1C85
1c7b CD951C    CALL    #1C95
1c7e 06E0      LD      B,#E0
1c80 C3851C    JP      #1C85
1c83 0629      LD      B,#29
1c85 CD951C    CALL    #1C95
1c88 B8        CP      B
1c89 C8        RET     Z

1c8a C3EE02    JP      #02EE
1c8d CD951C    CALL    #1C95
1c90 2B        DEC     HL
1c91 22F32E    LD      (#2EF3),HL
1c94 C9        RET     

1c95 2AF32E    LD      HL,(#2EF3)
1c98 7E        LD      A,(HL)
1c99 23        INC     HL
1c9a FE20      CP      #20
1c9c CA981C    JP      Z,#1C98
1c9f 22F32E    LD      (#2EF3),HL
1ca2 C9        RET     

1ca3 3E2C      LD      A,#2C
1ca5 F5        PUSH    AF
1ca6 CD951C    CALL    #1C95
1ca9 F1        POP     AF
1caa 2B        DEC     HL
1cab BE        CP      (HL)
1cac C8        RET     Z

1cad 22F32E    LD      (#2EF3),HL
1cb0 37        SCF     
1cb1 C9        RET     

1cb2 19        ADD     HL,DE
1cb3 0D        DEC     C
1cb4 C2B21C    JP      NZ,#1CB2
1cb7 C9        RET     

1cb8 0E0D      LD      C,#0D
1cba C3BF1C    JP      #1CBF
1cbd 0E22      LD      C,#22
1cbf 7E        LD      A,(HL)
1cc0 47        LD      B,A
1cc1 B9        CP      C
1cc2 C8        RET     Z

1cc3 FE0D      CP      #0D
1cc5 CAEE02    JP      Z,#02EE
1cc8 CDB221    CALL    #21B2
1ccb 23        INC     HL
1ccc C3BF1C    JP      #1CBF
1ccf 23        INC     HL
1cd0 7A        LD      A,D
1cd1 BE        CP      (HL)
1cd2 2B        DEC     HL
1cd3 C0        RET     NZ

1cd4 7B        LD      A,E
1cd5 BE        CP      (HL)
1cd6 C9        RET     

1cd7 F5        PUSH    AF
1cd8 7E        LD      A,(HL)
1cd9 23        INC     HL
1cda 66        LD      H,(HL)
1cdb 6F        LD      L,A
1cdc F1        POP     AF
1cdd C9        RET     

1cde 0600      LD      B,#00
1ce0 70        LD      (HL),B
1ce1 23        INC     HL
1ce2 1B        DEC     DE
1ce3 7A        LD      A,D
1ce4 B3        OR      E
1ce5 C2E01C    JP      NZ,#1CE0
1ce8 C9        RET     

1ce9 CD8D1C    CALL    #1C8D
1cec EB        EX      DE,HL
1ced FE90      CP      #90
1cef CC951C    CALL    Z,#1C95
1cf2 CDC51B    CALL    #1BC5
1cf5 DAFE1C    JP      C,#1CFE
1cf8 CDD21B    CALL    #1BD2
1cfb D4951C    CALL    NC,#1C95
1cfe EB        EX      DE,HL
1cff 22F32E    LD      (#2EF3),HL
1d02 FE22      CP      #22
1d04 C8        RET     Z

1d05 FE24      CP      #24
1d07 C8        RET     Z

1d08 FEB5      CP      #B5
1d0a C8        RET     Z

1d0b FEB8      CP      #B8
1d0d C8        RET     Z

1d0e FEBA      CP      #BA
1d10 C9        RET     

1d11 2AE930    LD      HL,(#30E9)
1d14 22ED30    LD      (#30ED),HL
1d17 2AEB30    LD      HL,(#30EB)
1d1a 22EF30    LD      (#30EF),HL
1d1d C9        RET     

1d1e 2AED30    LD      HL,(#30ED)
1d21 22E930    LD      (#30E9),HL
1d24 2AEF30    LD      HL,(#30EF)
1d27 22EB30    LD      (#30EB),HL
1d2a C9        RET     

1d2b 210023    LD      HL,#2300
1d2e 22E930    LD      (#30E9),HL
1d31 C9        RET     

1d32 CD8D1C    CALL    #1C8D
1d35 EB        EX      DE,HL
1d36 21FF2E    LD      HL,#2EFF
1d39 CDA027    CALL    #27A0
1d3c D8        RET     C

1d3d 1B        DEC     DE
1d3e EB        EX      DE,HL
1d3f 22F32E    LD      (#2EF3),HL
1d42 21FF2E    LD      HL,#2EFF
1d45 C3FF1B    JP      #1BFF
1d48 B7        OR      A
1d49 C24E1D    JP      NZ,#1D4E
1d4c 3E22      LD      A,#22
1d4e FE22      CP      #22
1d50 C2571D    JP      NZ,#1D57
1d53 CDA51C    CALL    #1CA5
1d56 D8        RET     C

1d57 2AF32E    LD      HL,(#2EF3)
1d5a 22DF30    LD      (#30DF),HL
1d5d 110000    LD      DE,#0000
1d60 47        LD      B,A
1d61 7E        LD      A,(HL)
1d62 23        INC     HL
1d63 B8        CP      B
1d64 CA701D    JP      Z,#1D70
1d67 FE0D      CP      #0D
1d69 CAEE02    JP      Z,#02EE
1d6c 13        INC     DE
1d6d C3611D    JP      #1D61
1d70 22F32E    LD      (#2EF3),HL
1d73 2ADF30    LD      HL,(#30DF)
1d76 C9        RET     

1d77 3AEA2E    LD      A,(#2EEA)
1d7a FE0D      CP      #0D
1d7c C24511    JP      NZ,#1145
1d7f 3AEB2E    LD      A,(#2EEB)
1d82 B7        OR      A
1d83 C8        RET     Z

1d84 019304    LD      BC,#0493
1d87 C3F102    JP      #02F1
1d8a 7D        LD      A,L
1d8b 93        SUB     E
1d8c 6F        LD      L,A
1d8d 7C        LD      A,H
1d8e 9A        SBC     A,D
1d8f 67        LD      H,A
1d90 C9        RET     

1d91 F67F      OR      #7F
1d93 57        LD      D,A
1d94 3E90      LD      A,#90
1d96 CDA51C    CALL    #1CA5
1d99 D8        RET     C

1d9a CD7F1D    CALL    #1D7F
1d9d D5        PUSH    DE
1d9e CD3D1B    CALL    #1B3D
1da1 F1        POP     AF
1da2 F5        PUSH    AF
1da3 A9        XOR     C
1da4 FAB802    JP      M,#02B8
1da7 CD891B    CALL    #1B89
1daa DAAC02    JP      C,#02AC
1dad CDB519    CALL    #19B5
1db0 D5        PUSH    DE
1db1 CD7E1C    CALL    #1C7E
1db4 11FFFF    LD      DE,#FFFF
1db7 CD221C    CALL    #1C22
1dba 3604      LD      (HL),#04
1dbc CD4F1E    CALL    #1E4F
1dbf CDDC19    CALL    #19DC
1dc2 CD4F1E    CALL    #1E4F
1dc5 CAF51D    JP      Z,#1DF5
1dc8 E5        PUSH    HL
1dc9 CDFF1B    CALL    #1BFF
1dcc 11FDFF    LD      DE,#FFFD
1dcf CD221C    CALL    #1C22
1dd2 D1        POP     DE
1dd3 D5        PUSH    DE
1dd4 72        LD      (HL),D
1dd5 2B        DEC     HL
1dd6 73        LD      (HL),E
1dd7 2B        DEC     HL
1dd8 3603      LD      (HL),#03
1dda CDC911    CALL    #11C9
1ddd E1        POP     HL
1dde CD141C    CALL    #1C14
1de1 CD951C    CALL    #1C95
1de4 FE2C      CP      #2C
1de6 C2FD1D    JP      NZ,#1DFD
1de9 CD4F1E    CALL    #1E4F
1dec CDA31C    CALL    #1CA3
1def DA461E    JP      C,#1E46
1df2 C3BF1D    JP      #1DBF
1df5 3E00      LD      A,#00
1df7 CD7019    CALL    #1970
1dfa C3E11D    JP      #1DE1
1dfd FE29      CP      #29
1dff C2EE02    JP      NZ,#02EE
1e02 CD4F1E    CALL    #1E4F
1e05 3E29      LD      A,#29
1e07 CDA51C    CALL    #1CA5
1e0a DA461E    JP      C,#1E46
1e0d 11FDFF    LD      DE,#FFFD
1e10 CD221C    CALL    #1C22
1e13 D1        POP     DE
1e14 72        LD      (HL),D
1e15 2B        DEC     HL
1e16 73        LD      (HL),E
1e17 2B        DEC     HL
1e18 F1        POP     AF
1e19 77        LD      (HL),A
1e1a 3AEA2E    LD      A,(#2EEA)
1e1d F5        PUSH    AF
1e1e 2184D1    LD      HL,#D184
1e21 39        ADD     HL,SP
1e22 EB        EX      DE,HL
1e23 CD221C    CALL    #1C22
1e26 01792E    LD      BC,#2E79
1e29 1C        INC     E
1e2a 1C        INC     E
1e2b 53        LD      D,E
1e2c 0A        LD      A,(BC)
1e2d 77        LD      (HL),A
1e2e 0B        DEC     BC
1e2f 2B        DEC     HL
1e30 1C        INC     E
1e31 C22C1E    JP      NZ,#1E2C
1e34 72        LD      (HL),D
1e35 2B        DEC     HL
1e36 3605      LD      (HL),#05
1e38 317A2E    LD      SP,#2E7A
1e3b 3EF5      LD      A,#F5
1e3d CDA51C    CALL    #1CA5
1e40 C22B0B    JP      NZ,#0B2B
1e43 C3A50D    JP      #0DA5
1e46 CD4F1E    CALL    #1E4F
1e49 018604    LD      BC,#0486
1e4c C3F102    JP      #02F1
1e4f 22FB2E    LD      (#2EFB),HL
1e52 E1        POP     HL
1e53 22FD2E    LD      (#2EFD),HL
1e56 2AF32E    LD      HL,(#2EF3)
1e59 E3        EX      (SP),HL
1e5a 22F32E    LD      (#2EF3),HL
1e5d 2AFD2E    LD      HL,(#2EFD)
1e60 E5        PUSH    HL
1e61 2AFB2E    LD      HL,(#2EFB)
1e64 C9        RET     

1e65 2A2F31    LD      HL,(#312F)
1e68 223331    LD      (#3133),HL
1e6b 0600      LD      B,#00
1e6d 2A3931    LD      HL,(#3139)
1e70 4E        LD      C,(HL)
1e71 79        LD      A,C
1e72 FE01      CP      #01
1e74 37        SCF     
1e75 C8        RET     Z

1e76 23        INC     HL
1e77 222D31    LD      (#312D),HL
1e7a CDCF1C    CALL    #1CCF
1e7d 2B        DEC     HL
1e7e C8        RET     Z

1e7f 3F        CCF     
1e80 D0        RET     NC

1e81 E5        PUSH    HL
1e82 D5        PUSH    DE
1e83 2A3131    LD      HL,(#3131)
1e86 EB        EX      DE,HL
1e87 2A3331    LD      HL,(#3133)
1e8a 19        ADD     HL,DE
1e8b DAB202    JP      C,#02B2
1e8e 223331    LD      (#3133),HL
1e91 D1        POP     DE
1e92 E1        POP     HL
1e93 09        ADD     HL,BC
1e94 C3701E    JP      #1E70
1e97 CD651E    CALL    #1E65
1e9a DACC02    JP      C,#02CC
1e9d C2CC02    JP      NZ,#02CC
1ea0 C9        RET     

1ea1 11B530    LD      DE,#30B5
1ea4 D5        PUSH    DE
1ea5 CD0620    CALL    #2006
1ea8 3E0D      LD      A,#0D
1eaa 12        LD      (DE),A
1eab D1        POP     DE
1eac 21FF2E    LD      HL,#2EFF
1eaf E5        PUSH    HL
1eb0 CDA027    CALL    #27A0
1eb3 E1        POP     HL
1eb4 C3FF1B    JP      #1BFF
1eb7 CDC911    CALL    #11C9
1eba CDEF1B    CALL    #1BEF
1ebd E5        PUSH    HL
1ebe CD5516    CALL    #1655
1ec1 CD111C    CALL    #1C11
1ec4 E1        POP     HL
1ec5 7E        LD      A,(HL)
1ec6 11FBFF    LD      DE,#FFFB
1ec9 19        ADD     HL,DE
1eca 110000    LD      DE,#0000
1ecd B7        OR      A
1ece C8        RET     Z

1ecf FAB202    JP      M,#02B2
1ed2 EEC0      XOR     #C0
1ed4 4F        LD      C,A
1ed5 0D        DEC     C
1ed6 23        INC     HL
1ed7 7E        LD      A,(HL)
1ed8 0F        RRCA    
1ed9 0F        RRCA    
1eda 0F        RRCA    
1edb 0F        RRCA    
1edc CD531F    CALL    #1F53
1edf DAB202    JP      C,#02B2
1ee2 0D        DEC     C
1ee3 F2F11E    JP      P,#1EF1
1ee6 7E        LD      A,(HL)
1ee7 CD531F    CALL    #1F53
1eea DAB202    JP      C,#02B2
1eed 0D        DEC     C
1eee FAD61E    JP      M,#1ED6
1ef1 7A        LD      A,D
1ef2 B3        OR      E
1ef3 C9        RET     

1ef4 CDC911    CALL    #11C9
1ef7 CDEF1B    CALL    #1BEF
1efa 42        LD      B,D
1efb 4B        LD      C,E
1efc 118D18    LD      DE,#188D
1eff CD9115    CALL    #1591
1f02 D20D1F    JP      NC,#1F0D
1f05 CDBA1E    CALL    #1EBA
1f08 7B        LD      A,E
1f09 5A        LD      E,D
1f0a 1600      LD      D,#00
1f0c C9        RET     

1f0d 2ADD30    LD      HL,(#30DD)
1f10 E5        PUSH    HL
1f11 CDEF1B    CALL    #1BEF
1f14 CDFF1B    CALL    #1BFF
1f17 C1        POP     BC
1f18 11521F    LD      DE,#1F52
1f1b CD6324    CALL    #2463
1f1e CDEF1B    CALL    #1BEF
1f21 CD5516    CALL    #1655
1f24 CDEF1B    CALL    #1BEF
1f27 CDFF1B    CALL    #1BFF
1f2a CDBA1E    CALL    #1EBA
1f2d D5        PUSH    DE
1f2e CDEF1B    CALL    #1BEF
1f31 42        LD      B,D
1f32 4B        LD      C,E
1f33 11521F    LD      DE,#1F52
1f36 CD3322    CALL    #2233
1f39 CDEF1B    CALL    #1BEF
1f3c 010500    LD      BC,#0005
1f3f 09        ADD     HL,BC
1f40 44        LD      B,H
1f41 4D        LD      C,L
1f42 CD3E23    CALL    #233E
1f45 CD111C    CALL    #1C11
1f48 CDBA1E    CALL    #1EBA
1f4b 7B        LD      A,E
1f4c D1        POP     DE
1f4d C9        RET     

1f4e 25        DEC     H
1f4f 60        LD      H,B
1f50 00        NOP     
1f51 00        NOP     
1f52 43        LD      B,E
1f53 22DB30    LD      (#30DB),HL
1f56 62        LD      H,D
1f57 6B        LD      L,E
1f58 29        ADD     HL,HL
1f59 D8        RET     C

1f5a 29        ADD     HL,HL
1f5b D8        RET     C

1f5c 19        ADD     HL,DE
1f5d D8        RET     C

1f5e 29        ADD     HL,HL
1f5f D8        RET     C

1f60 EB        EX      DE,HL
1f61 2ADB30    LD      HL,(#30DB)
1f64 E60F      AND     #0F
1f66 83        ADD     A,E
1f67 5F        LD      E,A
1f68 7A        LD      A,D
1f69 CE00      ADC     A,#00
1f6b 57        LD      D,A
1f6c C9        RET     

1f6d E5        PUSH    HL
1f6e E5        PUSH    HL
1f6f 11FF2E    LD      DE,#2EFF
1f72 D5        PUSH    DE
1f73 D5        PUSH    DE
1f74 CDE41B    CALL    #1BE4
1f77 D1        POP     DE
1f78 CD5516    CALL    #1655
1f7b C1        POP     BC
1f7c D1        POP     DE
1f7d CD9115    CALL    #1591
1f80 E1        POP     HL
1f81 C9        RET     

1f82 78        LD      A,B
1f83 B7        OR      A
1f84 CAA31F    JP      Z,#1FA3
1f87 7A        LD      A,D
1f88 B7        OR      A
1f89 C2B202    JP      NZ,#02B2
1f8c 7B        LD      A,E
1f8d 59        LD      E,C
1f8e CDA81F    CALL    #1FA8
1f91 E5        PUSH    HL
1f92 58        LD      E,B
1f93 CDA81F    CALL    #1FA8
1f96 7C        LD      A,H
1f97 B7        OR      A
1f98 C2B202    JP      NZ,#02B2
1f9b 7D        LD      A,L
1f9c E1        POP     HL
1f9d 84        ADD     A,H
1f9e 67        LD      H,A
1f9f D0        RET     NC

1fa0 C3B202    JP      #02B2
1fa3 42        LD      B,D
1fa4 79        LD      A,C
1fa5 C38E1F    JP      #1F8E
1fa8 210000    LD      HL,#0000
1fab 54        LD      D,H
1fac 0E08      LD      C,#08
1fae 29        ADD     HL,HL
1faf B7        OR      A
1fb0 F2B41F    JP      P,#1FB4
1fb3 19        ADD     HL,DE
1fb4 07        RLCA    
1fb5 0D        DEC     C
1fb6 C2AE1F    JP      NZ,#1FAE
1fb9 C9        RET     

1fba CD8D1C    CALL    #1C8D
1fbd 220331    LD      (#3103),HL
1fc0 CD9C28    CALL    #289C
1fc3 3F        CCF     
1fc4 D8        RET     C

1fc5 110000    LD      DE,#0000
1fc8 CD531F    CALL    #1F53
1fcb DAB202    JP      C,#02B2
1fce CD9C28    CALL    #289C
1fd1 DAC81F    JP      C,#1FC8
1fd4 2A0331    LD      HL,(#3103)
1fd7 2B        DEC     HL
1fd8 22F32E    LD      (#2EF3),HL
1fdb EB        EX      DE,HL
1fdc C9        RET     

1fdd 3E9A      LD      A,#9A
1fdf CDA51C    CALL    #1CA5
1fe2 37        SCF     
1fe3 C0        RET     NZ

1fe4 23        INC     HL
1fe5 5E        LD      E,(HL)
1fe6 23        INC     HL
1fe7 56        LD      D,(HL)
1fe8 23        INC     HL
1fe9 22F32E    LD      (#2EF3),HL
1fec EB        EX      DE,HL
1fed B7        OR      A
1fee C9        RET     

1fef CD8D1C    CALL    #1C8D
1ff2 FE0D      CP      #0D
1ff4 2A3931    LD      HL,(#3139)
1ff7 C8        RET     Z

1ff8 CDBA1F    CALL    #1FBA
1ffb DAA002    JP      C,#02A0
1ffe EB        EX      DE,HL
1fff CD651E    CALL    #1E65
2002 DACC02    JP      C,#02CC
2005 C9        RET     

2006 AF        XOR     A
2007 01F0D8    LD      BC,#D8F0
200a CD2B20    CALL    #202B
200d 0118FC    LD      BC,#FC18
2010 CD2B20    CALL    #202B
2013 019CFF    LD      BC,#FF9C
2016 CD2B20    CALL    #202B
2019 01F6FF    LD      BC,#FFF6
201c CD2B20    CALL    #202B
201f 01FFFF    LD      BC,#FFFF
2022 CD2B20    CALL    #202B
2025 C0        RET     NZ

2026 3E30      LD      A,#30
2028 12        LD      (DE),A
2029 13        INC     DE
202a C9        RET     

202b D5        PUSH    DE
202c 16FF      LD      D,#FF
202e 22D830    LD      (#30D8),HL
2031 14        INC     D
2032 09        ADD     HL,BC
2033 DA2E20    JP      C,#202E
2036 2AD830    LD      HL,(#30D8)
2039 42        LD      B,D
203a D1        POP     DE
203b B0        OR      B
203c C8        RET     Z

203d 3E30      LD      A,#30
203f 80        ADD     A,B
2040 12        LD      (DE),A
2041 13        INC     DE
2042 C9        RET     

; Console In (blocking)

2043 3A7A2E    LD      A,(#2E7A)
2046 CD5236    CALL    #3652 	; Read char from keyboard
2049 47        LD      B,A
204a FE0A      CP      #0A
204c CA4320    JP      Z,#2043  ; Ignore <LF>
204f B7        OR      A
2050 CA4320    JP      Z,#2043  ; No Key -> read again
2053 FE03      CP      #03
2055 C0        RET     NZ	; ^C -> RET Z

2056 3A1801    LD      A,(#0118)
2059 B7        OR      A
205a 78        LD      A,B
205b C0        RET     NZ

205c 2AF72E    LD      HL,(#2EF7)
205f 22F32E    LD      (#2EF3),HL
2062 C3EC21    JP      #21EC
2065 11022F    LD      DE,#2F02
2068 21FC2F    LD      HL,#2FFC
206b 360D      LD      (HL),#0D
206d CD2C22    CALL    #222C
2070 4F        LD      C,A
2071 CD1C22    CALL    #221C
2074 91        SUB     C
2075 4F        LD      C,A
2076 32012F    LD      (#2F01),A
2079 AF        XOR     A
207a 32002F    LD      (#2F00),A
207d CD4320    CALL    #2043  	; Console In (blocking)
2080 FE0D      CP      #0D
2082 C29720    JP      NZ,#2097

; Direct Mode <Enter> pressed. Copy input line to bas buffer at $2F02

2085 360D      LD      (HL),#0D
2087 21FC2F    LD      HL,#2FFC
208a 11022F    LD      DE,#2F02
208d 7E        LD      A,(HL)
208e 12        LD      (DE),A
208f 23        INC     HL
2090 13        INC     DE
2091 FE0D      CP      #0D
2093 C28D20    JP      NZ,#208D
2096 C9        RET     

2097 E5        PUSH    HL
2098 217D20    LD      HL,#207D
209b E3        EX      (SP),HL
209c FE01      CP      #01
209e CA0E21    JP      Z,#210E
20a1 FE07      CP      #07
20a3 CA1721    JP      Z,#2117
20a6 FE11      CP      #11
20a8 CA5821    JP      Z,#2158
20ab FE08      CP      #08
20ad CA5321    JP      Z,#2153
20b0 FE1A      CP      #1A
20b2 CA4721    JP      Z,#2147
20b5 FE5F      CP      #5F
20b7 CA5821    JP      Z,#2158
20ba FE7F      CP      #7F
20bc CA5821    JP      Z,#2158
20bf FE04      CP      #04
20c1 CA2421    JP      Z,#2124
20c4 FE19      CP      #19
20c6 CA7821    JP      Z,#2178
20c9 FE0E      CP      #0E
20cb CA8A21    JP      Z,#218A
20ce FE40      CP      #40
20d0 CA8A21    JP      Z,#218A
20d3 FE20      CP      #20
20d5 DA3021    JP      C,#2130
20d8 F5        PUSH    AF
20d9 3A002F    LD      A,(#2F00)
20dc B7        OR      A
20dd C2E920    JP      NZ,#20E9
20e0 F1        POP     AF
20e1 F5        PUSH    AF
20e2 1A        LD      A,(DE)
20e3 FE0D      CP      #0D
20e5 CAE920    JP      Z,#20E9
20e8 13        INC     DE
20e9 F1        POP     AF
20ea 77        LD      (HL),A
20eb 23        INC     HL
20ec 360D      LD      (HL),#0D
20ee 47        LD      B,A
20ef CDB221    CALL    #21B2
20f2 0D        DEC     C
20f3 C0        RET     NZ

20f4 CD1C22    CALL    #221C
20f7 4F        LD      C,A
20f8 11FC2F    LD      DE,#2FFC
20fb 21022F    LD      HL,#2F02
20fe 1A        LD      A,(DE)
20ff 77        LD      (HL),A
2100 23        INC     HL
2101 13        INC     DE
2102 0D        DEC     C
2103 C2FE20    JP      NZ,#20FE
2106 360D      LD      (HL),#0D
2108 01A304    LD      BC,#04A3
210b C3F102    JP      #02F1
210e 1A        LD      A,(DE)
210f FE0D      CP      #0D
2111 CA3021    JP      Z,#2130
2114 C3E120    JP      #20E1
2117 CD0E21    CALL    #210E
211a 1A        LD      A,(DE)
211b FE0D      CP      #0D
211d C8        RET     Z

211e CDE120    CALL    #20E1
2121 C31A21    JP      #211A
2124 CD4320    CALL    #2043	; Console In (blocking)
2127 D5        PUSH    DE
2128 13        INC     DE
2129 1A        LD      A,(DE)
212a FE0D      CP      #0D
212c C23521    JP      NZ,#2135
212f D1        POP     DE
2130 0607      LD      B,#07
2132 C3B221    JP      #21B2
2135 B8        CP      B
2136 C22821    JP      NZ,#2128
2139 D1        POP     DE
213a F5        PUSH    AF
213b 1A        LD      A,(DE)
213c CDE120    CALL    #20E1
213f 1A        LD      A,(DE)
2140 47        LD      B,A
2141 F1        POP     AF
2142 B8        CP      B
2143 C23A21    JP      NZ,#213A
2146 C9        RET     

2147 1A        LD      A,(DE)
2148 FE0D      CP      #0D
214a CA3021    JP      Z,#2130
214d 13        INC     DE
214e 0625      LD      B,#25
2150 C3B221    JP      #21B2
2153 0608      LD      B,#08
2155 C35C21    JP      #215C
2158 3A1701    LD      A,(#0117)
215b 47        LD      B,A
215c 3A012F    LD      A,(#2F01)
215f B9        CP      C
2160 CA3021    JP      Z,#2130
2163 2B        DEC     HL
2164 360D      LD      (HL),#0D
2166 0C        INC     C
2167 3A002F    LD      A,(#2F00)
216a B7        OR      A
216b C2B221    JP      NZ,#21B2
216e 1A        LD      A,(DE)
216f FE0D      CP      #0D
2171 CAB221    JP      Z,#21B2
2174 1B        DEC     DE
2175 C3B221    JP      #21B2
2178 3A002F    LD      A,(#2F00)
217b 063C      LD      B,#3C
217d EE01      XOR     #01
217f 32002F    LD      (#2F00),A
2182 C2B221    JP      NZ,#21B2
2185 063E      LD      B,#3E
2187 C3B221    JP      #21B2
218a 21FB2F    LD      HL,#2FFB
218d 11012F    LD      DE,#2F01
2190 23        INC     HL
2191 13        INC     DE
2192 7E        LD      A,(HL)
2193 12        LD      (DE),A
2194 FE0D      CP      #0D
2196 C29021    JP      NZ,#2190
2199 0640      LD      B,#40
219b CDB221    CALL    #21B2
219e CDDA21    CALL    #21DA
21a1 C1        POP     BC
21a2 3A2931    LD      A,(#3129)
21a5 B7        OR      A
21a6 CA6520    JP      Z,#2065
21a9 2A2A31    LD      HL,(#312A)
21ac CDBD1C    CALL    #1CBD
21af C36520    JP      #2065
21b2 3A7A2E    LD      A,(#2E7A)
21b5 CD1F36    CALL    #361F
21b8 FE0D      CP      #0D
21ba CACA21    JP      Z,#21CA
21bd FE20      CP      #20
21bf D8        RET     C

21c0 CD2C22    CALL    #222C
21c3 E5        PUSH    HL
21c4 2A2631    LD      HL,(#3126)
21c7 34        INC     (HL)
21c8 E1        POP     HL
21c9 C9        RET     

21ca CD2C22    CALL    #222C
21cd E5        PUSH    HL
21ce 2A2631    LD      HL,(#3126)
21d1 3600      LD      (HL),#00
21d3 E1        POP     HL
21d4 C9        RET     

21d5 CD2C22    CALL    #222C
21d8 B7        OR      A
21d9 C8        RET     Z

21da 060D      LD      B,#0D
21dc CDB221    CALL    #21B2
21df 060A      LD      B,#0A
21e1 C3B221    JP      #21B2
21e4 3A1801    LD      A,(#0118) ; $0118=0-> check ^C, =1 -> no check ^C
21e7 B7        OR      A
21e8 CC8636    CALL    Z,#3686 	; Read Keyboard -> RET Z if ^C pressed
21eb C0        RET     NZ
21ec AF        XOR     A
21ed 32E32E    LD      (#2EE3),A
21f0 3AEB2E    LD      A,(#2EEB)
21f3 B7        OR      A
21f4 C2F20E    JP      NZ,#0EF2
21f7 3AB604    LD      A,(#04B6)
21fa 322631    LD      (#3126),A
21fd 3AF730    LD      A,(#30F7)
2200 B7        OR      A
2201 FA1D03    JP      M,#031D
2204 C3DE0E    JP      #0EDE
2207 3E23      LD      A,#23
2209 CDA51C    CALL    #1CA5
220c 3E00      LD      A,#00
220e DA1822    JP      C,#2218
2211 CDB71E    CALL    #1EB7
2214 CDA31C    CALL    #1CA3
2217 7B        LD      A,E
2218 327A2E    LD      (#2E7A),A
221b C9        RET     

221c E5        PUSH    HL
221d 217B2E    LD      HL,#2E7B
2220 3A7A2E    LD      A,(#2E7A)
2223 CD9B29    CALL    #299B
2226 222631    LD      (#3126),HL
2229 7E        LD      A,(HL)
222a E1        POP     HL
222b C9        RET     

222c E5        PUSH    HL
222d 21832E    LD      HL,#2E83
2230 C32022    JP      #2220
2233 0A        LD      A,(BC)
2234 B7        OR      A
2235 C8        RET     Z

2236 1A        LD      A,(DE)
2237 B7        OR      A
2238 C23D22    JP      NZ,#223D
223b 02        LD      (BC),A
223c C9        RET     

223d C5        PUSH    BC
223e D5        PUSH    DE
223f 211531    LD      HL,#3115
2242 3E08      LD      A,#08
2244 3600      LD      (HL),#00
2246 2B        DEC     HL
2247 3D        DEC     A
2248 C24422    JP      NZ,#2244
224b AF        XOR     A
224c 211D31    LD      HL,#311D
224f CDD122    CALL    #22D1
2252 3E04      LD      A,#04
2254 211531    LD      HL,#3115
2257 1B        DEC     DE
2258 F5        PUSH    AF
2259 0B        DEC     BC
225a C5        PUSH    BC
225b D5        PUSH    DE
225c 0A        LD      A,(BC)
225d F5        PUSH    AF
225e E60F      AND     #0F
2260 CA7322    JP      Z,#2273
2263 0604      LD      B,#04
2265 4F        LD      C,A
2266 E5        PUSH    HL
2267 CD2E23    CALL    #232E
226a 3E00      LD      A,#00
226c 8E        ADC     A,(HL)
226d 77        LD      (HL),A
226e E1        POP     HL
226f 0D        DEC     C
2270 C26622    JP      NZ,#2266
2273 F1        POP     AF
2274 1F        RRA     
2275 1F        RRA     
2276 1F        RRA     
2277 1F        RRA     
2278 E60F      AND     #0F
227a CA8C22    JP      Z,#228C
227d 0605      LD      B,#05
227f 111C31    LD      DE,#311C
2282 4F        LD      C,A
2283 E5        PUSH    HL
2284 CD2E23    CALL    #232E
2287 E1        POP     HL
2288 0D        DEC     C
2289 C28322    JP      NZ,#2283
228c D1        POP     DE
228d C1        POP     BC
228e F1        POP     AF
228f 2B        DEC     HL
2290 3D        DEC     A
2291 C25822    JP      NZ,#2258
2294 110E31    LD      DE,#310E
2297 CDF522    CALL    #22F5
229a 0E00      LD      C,#00
229c 110E31    LD      DE,#310E
229f CD2023    CALL    #2320
22a2 D1        POP     DE
22a3 E1        POP     HL
22a4 1A        LD      A,(DE)
22a5 E67F      AND     #7F
22a7 47        LD      B,A
22a8 7E        LD      A,(HL)
22a9 E67F      AND     #7F
22ab 80        ADD     A,B
22ac 81        ADD     A,C
22ad D640      SUB     #40
22af CAC822    JP      Z,#22C8
22b2 F2C222    JP      P,#22C2
22b5 17        RLA     
22b6 B7        OR      A
22b7 3E00      LD      A,#00
22b9 FAC822    JP      M,#22C8
22bc 01AB04    LD      BC,#04AB
22bf C3F102    JP      #02F1
22c2 47        LD      B,A
22c3 1A        LD      A,(DE)
22c4 AE        XOR     (HL)
22c5 E680      AND     #80
22c7 B0        OR      B
22c8 111231    LD      DE,#3112
22cb 12        LD      (DE),A
22cc EB        EX      DE,HL
22cd C3E41B    JP      #1BE4
22d0 1A        LD      A,(DE)
22d1 D5        PUSH    DE
22d2 C5        PUSH    BC
22d3 0604      LD      B,#04
22d5 E6F0      AND     #F0
22d7 4F        LD      C,A
22d8 1B        DEC     DE
22d9 1A        LD      A,(DE)
22da F5        PUSH    AF
22db E60F      AND     #0F
22dd B1        OR      C
22de 07        RLCA    
22df 07        RLCA    
22e0 07        RLCA    
22e1 07        RLCA    
22e2 2B        DEC     HL
22e3 77        LD      (HL),A
22e4 F1        POP     AF
22e5 05        DEC     B
22e6 C2D522    JP      NZ,#22D5
22e9 E6F0      AND     #F0
22eb C1        POP     BC
22ec D1        POP     DE
22ed C8        RET     Z

22ee 07        RLCA    
22ef 07        RLCA    
22f0 07        RLCA    
22f1 07        RLCA    
22f2 2B        DEC     HL
22f3 77        LD      (HL),A
22f4 C9        RET     

22f5 1A        LD      A,(DE)
22f6 E6F0      AND     #F0
22f8 210400    LD      HL,#0004
22fb 19        ADD     HL,DE
22fc 7E        LD      A,(HL)
22fd CA0B23    JP      Z,#230B
2300 FE50      CP      #50
2302 D8        RET     C

2303 2B        DEC     HL
2304 0E04      LD      C,#04
2306 3E01      LD      A,#01
2308 C31423    JP      #2314
230b E60F      AND     #0F
230d FE05      CP      #05
230f D8        RET     C

2310 0E05      LD      C,#05
2312 3E10      LD      A,#10
2314 86        ADD     A,(HL)
2315 27        DAA     
2316 77        LD      (HL),A
2317 D0        RET     NC

2318 2B        DEC     HL
2319 0D        DEC     C
231a 3E01      LD      A,#01
231c C21423    JP      NZ,#2314
231f C9        RET     

2320 1A        LD      A,(DE)
2321 E6F0      AND     #F0
2323 C0        RET     NZ

2324 0D        DEC     C
2325 210400    LD      HL,#0004
2328 19        ADD     HL,DE
2329 54        LD      D,H
232a 5D        LD      E,L
232b C3D022    JP      #22D0
232e C5        PUSH    BC
232f D5        PUSH    DE
2330 B7        OR      A
2331 1A        LD      A,(DE)
2332 8E        ADC     A,(HL)
2333 27        DAA     
2334 77        LD      (HL),A
2335 2B        DEC     HL
2336 1B        DEC     DE
2337 05        DEC     B
2338 C23123    JP      NZ,#2331
233b D1        POP     DE
233c C1        POP     BC
233d C9        RET     

233e 212031    LD      HL,#3120
2341 1A        LD      A,(DE)
2342 B7        OR      A
2343 C8        RET     Z

2344 EE80      XOR     #80
2346 C5        PUSH    BC
2347 0E05      LD      C,#05
2349 77        LD      (HL),A
234a 2B        DEC     HL
234b 1B        DEC     DE
234c 1A        LD      A,(DE)
234d 0D        DEC     C
234e C24923    JP      NZ,#2349
2351 C1        POP     BC
2352 112031    LD      DE,#3120
2355 1A        LD      A,(DE)
2356 B7        OR      A
2357 C8        RET     Z

2358 C5        PUSH    BC
2359 0A        LD      A,(BC)
235a B7        OR      A
235b CA7223    JP      Z,#2372
235e E67F      AND     #7F
2360 6F        LD      L,A
2361 1A        LD      A,(DE)
2362 E67F      AND     #7F
2364 95        SUB     L
2365 60        LD      H,B
2366 69        LD      L,C
2367 F26D23    JP      P,#236D
236a EB        EX      DE,HL
236b 2F        CPL     
236c 3C        INC     A
236d FE09      CP      #09
236f DA7723    JP      C,#2377
2372 EB        EX      DE,HL
2373 D1        POP     DE
2374 C3E41B    JP      #1BE4
2377 D5        PUSH    DE
2378 56        LD      D,(HL)
2379 D5        PUSH    DE
237a C601      ADD     A,#01
237c 1F        RRA     
237d F5        PUSH    AF
237e 111531    LD      DE,#3115
2381 0E04      LD      C,#04
2383 AF        XOR     A
2384 12        LD      (DE),A
2385 1B        DEC     DE
2386 2B        DEC     HL
2387 7E        LD      A,(HL)
2388 12        LD      (DE),A
2389 0D        DEC     C
238a C28523    JP      NZ,#2385
238d F1        POP     AF
238e F5        PUSH    AF
238f 211531    LD      HL,#3115
2392 B7        OR      A
2393 CA9F23    JP      Z,#239F
2396 4F        LD      C,A
2397 AF        XOR     A
2398 2B        DEC     HL
2399 1B        DEC     DE
239a 12        LD      (DE),A
239b 0D        DEC     C
239c C29823    JP      NZ,#2398
239f F1        POP     AF
23a0 DAAB23    JP      C,#23AB
23a3 23        INC     HL
23a4 54        LD      D,H
23a5 5D        LD      E,L
23a6 CDD122    CALL    #22D1
23a9 1B        DEC     DE
23aa EB        EX      DE,HL
23ab 7E        LD      A,(HL)
23ac FE50      CP      #50
23ae 2B        DEC     HL
23af E5        PUSH    HL
23b0 D40423    CALL    NC,#2304
23b3 D1        POP     DE
23b4 F1        POP     AF
23b5 E1        POP     HL
23b6 AE        XOR     (HL)
23b7 46        LD      B,(HL)
23b8 2B        DEC     HL
23b9 C5        PUSH    BC
23ba F23124    JP      P,#2431
23bd D5        PUSH    DE
23be 0E04      LD      C,#04
23c0 37        SCF     
23c1 0699      LD      B,#99
23c3 3E00      LD      A,#00
23c5 88        ADC     A,B
23c6 EB        EX      DE,HL
23c7 96        SUB     (HL)
23c8 EB        EX      DE,HL
23c9 86        ADD     A,(HL)
23ca 27        DAA     
23cb 12        LD      (DE),A
23cc 2B        DEC     HL
23cd 1B        DEC     DE
23ce 0D        DEC     C
23cf C2C323    JP      NZ,#23C3
23d2 E1        POP     HL
23d3 DAED23    JP      C,#23ED
23d6 F1        POP     AF
23d7 EE80      XOR     #80
23d9 F5        PUSH    AF
23da E5        PUSH    HL
23db 0E04      LD      C,#04
23dd 069A      LD      B,#9A
23df 78        LD      A,B
23e0 9E        SBC     A,(HL)
23e1 C600      ADD     A,#00
23e3 27        DAA     
23e4 77        LD      (HL),A
23e5 2B        DEC     HL
23e6 0D        DEC     C
23e7 3F        CCF     
23e8 C2DF23    JP      NZ,#23DF
23eb EB        EX      DE,HL
23ec E1        POP     HL
23ed D5        PUSH    DE
23ee 54        LD      D,H
23ef 5D        LD      E,L
23f0 0603      LD      B,#03
23f2 AF        XOR     A
23f3 23        INC     HL
23f4 77        LD      (HL),A
23f5 05        DEC     B
23f6 C2F323    JP      NZ,#23F3
23f9 E1        POP     HL
23fa C1        POP     BC
23fb 0E08      LD      C,#08
23fd 23        INC     HL
23fe 7E        LD      A,(HL)
23ff B7        OR      A
2400 C20C24    JP      NZ,#240C
2403 13        INC     DE
2404 0D        DEC     C
2405 0D        DEC     C
2406 C2FD23    JP      NZ,#23FD
2409 C1        POP     BC
240a 02        LD      (BC),A
240b C9        RET     

240c E1        POP     HL
240d E6F0      AND     #F0
240f F5        PUSH    AF
2410 C21424    JP      NZ,#2414
2413 0D        DEC     C
2414 78        LD      A,B
2415 81        ADD     A,C
2416 D608      SUB     #08
2418 77        LD      (HL),A
2419 A8        XOR     B
241a F22124    JP      P,#2421
241d F1        POP     AF
241e 3600      LD      (HL),#00
2420 C9        RET     

2421 F1        POP     AF
2422 C22A24    JP      NZ,#242A
2425 AF        XOR     A
2426 13        INC     DE
2427 C3D122    JP      #22D1
242a 2B        DEC     HL
242b EB        EX      DE,HL
242c 0E04      LD      C,#04
242e C3E61B    JP      #1BE6
2431 D5        PUSH    DE
2432 0604      LD      B,#04
2434 B7        OR      A
2435 1A        LD      A,(DE)
2436 8E        ADC     A,(HL)
2437 27        DAA     
2438 12        LD      (DE),A
2439 2B        DEC     HL
243a 1B        DEC     DE
243b 05        DEC     B
243c C23524    JP      NZ,#2435
243f DA4C24    JP      C,#244C
2442 E1        POP     HL
2443 F1        POP     AF
2444 D1        POP     DE
2445 12        LD      (DE),A
2446 1B        DEC     DE
2447 0E04      LD      C,#04
2449 C3E61B    JP      #1BE6
244c 3E01      LD      A,#01
244e 12        LD      (DE),A
244f E1        POP     HL
2450 C1        POP     BC
2451 7E        LD      A,(HL)
2452 E5        PUSH    HL
2453 CD0B23    CALL    #230B
2456 D1        POP     DE
2457 E1        POP     HL
2458 04        INC     B
2459 78        LD      A,B
245a E67F      AND     #7F
245c CABC22    JP      Z,#22BC
245f 70        LD      (HL),B
2460 C3D022    JP      #22D0
2463 1A        LD      A,(DE)
2464 B7        OR      A
2465 CAE802    JP      Z,#02E8
2468 0A        LD      A,(BC)
2469 B7        OR      A
246a C8        RET     Z

246b 21FCFF    LD      HL,#FFFC
246e 09        ADD     HL,BC
246f 22FF30    LD      (#30FF),HL
2472 C5        PUSH    BC
2473 F5        PUSH    AF
2474 D5        PUSH    DE
2475 E5        PUSH    HL
2476 C5        PUSH    BC
2477 D5        PUSH    DE
2478 212531    LD      HL,#3125
247b 0604      LD      B,#04
247d 1B        DEC     DE
247e 1A        LD      A,(DE)
247f 77        LD      (HL),A
2480 2B        DEC     HL
2481 05        DEC     B
2482 C27D24    JP      NZ,#247D
2485 3600      LD      (HL),#00
2487 D1        POP     DE
2488 C1        POP     BC
2489 AF        XOR     A
248a 211D31    LD      HL,#311D
248d CDD122    CALL    #22D1
2490 211631    LD      HL,#3116
2493 AF        XOR     A
2494 1605      LD      D,#05
2496 77        LD      (HL),A
2497 2B        DEC     HL
2498 15        DEC     D
2499 C29624    JP      NZ,#2496
249c 1604      LD      D,#04
249e 0B        DEC     BC
249f 0A        LD      A,(BC)
24a0 77        LD      (HL),A
24a1 2B        DEC     HL
24a2 15        DEC     D
24a3 C29E24    JP      NZ,#249E
24a6 3600      LD      (HL),#00
24a8 111131    LD      DE,#3111
24ab 0E05      LD      C,#05
24ad D5        PUSH    DE
24ae C5        PUSH    BC
24af 212531    LD      HL,#3125
24b2 CD0325    CALL    #2503
24b5 C1        POP     BC
24b6 07        RLCA    
24b7 07        RLCA    
24b8 07        RLCA    
24b9 07        RLCA    
24ba 47        LD      B,A
24bb D1        POP     DE
24bc 13        INC     DE
24bd D5        PUSH    DE
24be C5        PUSH    BC
24bf 211C31    LD      HL,#311C
24c2 CD0325    CALL    #2503
24c5 C1        POP     BC
24c6 B0        OR      B
24c7 2AFF30    LD      HL,(#30FF)
24ca 77        LD      (HL),A
24cb 23        INC     HL
24cc 22FF30    LD      (#30FF),HL
24cf D1        POP     DE
24d0 0D        DEC     C
24d1 C2AD24    JP      NZ,#24AD
24d4 D1        POP     DE
24d5 CDF522    CALL    #22F5
24d8 0E00      LD      C,#00
24da CD2023    CALL    #2320
24dd D1        POP     DE
24de 1A        LD      A,(DE)
24df E67F      AND     #7F
24e1 91        SUB     C
24e2 67        LD      H,A
24e3 F1        POP     AF
24e4 6F        LD      L,A
24e5 C1        POP     BC
24e6 E67F      AND     #7F
24e8 94        SUB     H
24e9 C641      ADD     A,#41
24eb CA0125    JP      Z,#2501
24ee F2FA24    JP      P,#24FA
24f1 87        ADD     A,A
24f2 3E00      LD      A,#00
24f4 FA0125    JP      M,#2501
24f7 C3BC22    JP      #22BC
24fa EB        EX      DE,HL
24fb 57        LD      D,A
24fc 7B        LD      A,E
24fd AE        XOR     (HL)
24fe E680      AND     #80
2500 B2        OR      D
2501 02        LD      (BC),A
2502 C9        RET     

2503 01FF05    LD      BC,#05FF
2506 0C        INC     C
2507 C5        PUSH    BC
2508 D5        PUSH    DE
2509 E5        PUSH    HL
250a 37        SCF     
250b 0E99      LD      C,#99
250d 3E00      LD      A,#00
250f 89        ADC     A,C
2510 96        SUB     (HL)
2511 EB        EX      DE,HL
2512 86        ADD     A,(HL)
2513 EB        EX      DE,HL
2514 27        DAA     
2515 12        LD      (DE),A
2516 2B        DEC     HL
2517 1B        DEC     DE
2518 05        DEC     B
2519 C20D25    JP      NZ,#250D
251c E1        POP     HL
251d D1        POP     DE
251e C1        POP     BC
251f DA0625    JP      C,#2506
2522 EB        EX      DE,HL
2523 CD2E23    CALL    #232E
2526 79        LD      A,C
2527 C9        RET     

2528 220A31    LD      (#310A),HL
252b 47        LD      B,A
252c 21C230    LD      HL,#30C2
252f 3622      LD      (HL),#22
2531 3AEC30    LD      A,(#30EC)
2534 B7        OR      A
2535 CA4325    JP      Z,#2543
2538 2B        DEC     HL
2539 3630      LD      (HL),#30
253b 05        DEC     B
253c CABE02    JP      Z,#02BE
253f 3D        DEC     A
2540 C33525    JP      #2535
2543 2B        DEC     HL
2544 362E      LD      (HL),#2E
2546 220531    LD      (#3105),HL
2549 220731    LD      (#3107),HL
254c 220131    LD      (#3101),HL
254f 05        DEC     B
2550 CA5925    JP      Z,#2559
2553 2B        DEC     HL
2554 3620      LD      (HL),#20
2556 C34F25    JP      #254F
2559 22FF30    LD      (#30FF),HL
255c 2B        DEC     HL
255d 3621      LD      (HL),#21
255f 2A0A31    LD      HL,(#310A)
2562 7E        LD      A,(HL)
2563 E67F      AND     #7F
2565 CAD125    JP      Z,#25D1
2568 D641      SUB     #41
256a FA2A26    JP      M,#262A
256d 3C        INC     A
256e 47        LD      B,A
256f 4F        LD      C,A
2570 D608      SUB     #08
2572 DA8525    JP      C,#2585
2575 CA8225    JP      Z,#2582
2578 4F        LD      C,A
2579 3E30      LD      A,#30
257b CD3B26    CALL    #263B
257e 0D        DEC     C
257f C27925    JP      NZ,#2579
2582 0608      LD      B,#08
2584 48        LD      C,B
2585 0C        INC     C
2586 CD7D26    CALL    #267D
2589 CD3B26    CALL    #263B
258c 05        DEC     B
258d C28625    JP      NZ,#2586
2590 41        LD      B,C
2591 CD7D26    CALL    #267D
2594 CD6326    CALL    #2663
2597 04        INC     B
2598 C39125    JP      #2591
259b 2B        DEC     HL
259c 7E        LD      A,(HL)
259d FE2E      CP      #2E
259f CA9B25    JP      Z,#259B
25a2 FE2C      CP      #2C
25a4 CA9B25    JP      Z,#259B
25a7 FE22      CP      #22
25a9 DAB825    JP      C,#25B8
25ac 3C        INC     A
25ad 77        LD      (HL),A
25ae FE3A      CP      #3A
25b0 C2D125    JP      NZ,#25D1
25b3 3630      LD      (HL),#30
25b5 C39B25    JP      #259B
25b8 11FC30    LD      DE,#30FC
25bb 1A        LD      A,(DE)
25bc FE80      CP      #80
25be CACC25    JP      Z,#25CC
25c1 23        INC     HL
25c2 3631      LD      (HL),#31
25c4 3C        INC     A
25c5 CABE02    JP      Z,#02BE
25c8 12        LD      (DE),A
25c9 C3D125    JP      #25D1
25cc 3E31      LD      A,#31
25ce CD3B26    CALL    #263B
25d1 21C130    LD      HL,#30C1
25d4 3AEA30    LD      A,(#30EA)
25d7 FE23      CP      #23
25d9 CAE325    JP      Z,#25E3
25dc 3AE930    LD      A,(#30E9)
25df B7        OR      A
25e0 F2FB25    JP      P,#25FB
25e3 7E        LD      A,(HL)
25e4 FE30      CP      #30
25e6 C2EF25    JP      NZ,#25EF
25e9 3620      LD      (HL),#20
25eb 2B        DEC     HL
25ec C3E325    JP      #25E3
25ef 3AEA30    LD      A,(#30EA)
25f2 FE23      CP      #23
25f4 C2FB25    JP      NZ,#25FB
25f7 23        INC     HL
25f8 3622      LD      (HL),#22
25fa 2B        DEC     HL
25fb 7E        LD      A,(HL)
25fc 220731    LD      (#3107),HL
25ff FE2E      CP      #2E
2601 C21C26    JP      NZ,#261C
2604 2B        DEC     HL
2605 7E        LD      A,(HL)
2606 FE20      CP      #20
2608 CA1726    JP      Z,#2617
260b FE21      CP      #21
260d C21C26    JP      NZ,#261C
2610 23        INC     HL
2611 23        INC     HL
2612 3630      LD      (HL),#30
2614 C31C26    JP      #261C
2617 3E30      LD      A,#30
2619 CD3B26    CALL    #263B
261c 2A0A31    LD      HL,(#310A)
261f 7E        LD      A,(HL)
2620 B7        OR      A
2621 3E2D      LD      A,#2D
2623 FC5326    CALL    M,#2653
2626 2AFF30    LD      HL,(#30FF)
2629 C9        RET     

262a 2F        CPL     
262b B7        OR      A
262c 47        LD      B,A
262d 0E01      LD      C,#01
262f CA9025    JP      Z,#2590
2632 3E30      LD      A,#30
2634 CD6326    CALL    #2663
2637 05        DEC     B
2638 C32F26    JP      #262F
263b F5        PUSH    AF
263c 3AE930    LD      A,(#30E9)
263f E640      AND     #40
2641 CA5226    JP      Z,#2652
2644 210931    LD      HL,#3109
2647 35        DEC     (HL)
2648 C25226    JP      NZ,#2652
264b 3603      LD      (HL),#03
264d 3E2C      LD      A,#2C
264f CD5326    CALL    #2653
2652 F1        POP     AF
2653 2A0131    LD      HL,(#3101)
2656 2B        DEC     HL
2657 57        LD      D,A
2658 7E        LD      A,(HL)
2659 FE21      CP      #21
265b CABE02    JP      Z,#02BE
265e 220131    LD      (#3101),HL
2661 72        LD      (HL),D
2662 C9        RET     

2663 2A0731    LD      HL,(#3107)
2666 23        INC     HL
2667 57        LD      D,A
2668 7E        LD      A,(HL)
2669 FE22      CP      #22
266b CA7326    JP      Z,#2673
266e 220731    LD      (#3107),HL
2671 72        LD      (HL),D
2672 C9        RET     

2673 F1        POP     AF
2674 7A        LD      A,D
2675 FE35      CP      #35
2677 DAD125    JP      C,#25D1
267a C39B25    JP      #259B
267d 3E08      LD      A,#08
267f 57        LD      D,A
2680 B8        CP      B
2681 3E30      LD      A,#30
2683 D8        RET     C

2684 78        LD      A,B
2685 3D        DEC     A
2686 92        SUB     D
2687 1F        RRA     
2688 5F        LD      E,A
2689 16FF      LD      D,#FF
268b F5        PUSH    AF
268c 2A0A31    LD      HL,(#310A)
268f 19        ADD     HL,DE
2690 F1        POP     AF
2691 7E        LD      A,(HL)
2692 DA9926    JP      C,#2699
2695 1F        RRA     
2696 1F        RRA     
2697 1F        RRA     
2698 1F        RRA     
2699 E60F      AND     #0F
269b C630      ADD     A,#30
269d C9        RET     

269e E5        PUSH    HL
269f 3E04      LD      A,#04
26a1 320931    LD      (#3109),A
26a4 3E80      LD      A,#80
26a6 32FC30    LD      (#30FC),A
26a9 3AEA30    LD      A,(#30EA)
26ac FE49      CP      #49
26ae CA2927    JP      Z,#2729
26b1 FE23      CP      #23
26b3 CAF926    JP      Z,#26F9
26b6 FE45      CP      #45
26b8 CA4227    JP      Z,#2742
26bb 3AEB30    LD      A,(#30EB)
26be CD2825    CALL    #2528
26c1 E1        POP     HL
26c2 3AE930    LD      A,(#30E9)
26c5 F5        PUSH    AF
26c6 E620      AND     #20
26c8 CAD226    JP      Z,#26D2
26cb 7E        LD      A,(HL)
26cc B7        OR      A
26cd 3E2B      LD      A,#2B
26cf F45326    CALL    P,#2653
26d2 F1        POP     AF
26d3 1F        RRA     
26d4 3E24      LD      A,#24
26d6 DC5326    CALL    C,#2653
26d9 2AFF30    LD      HL,(#30FF)
26dc 3AEA30    LD      A,(#30EA)
26df FE23      CP      #23
26e1 C2EC26    JP      NZ,#26EC
26e4 23        INC     HL
26e5 7E        LD      A,(HL)
26e6 FE20      CP      #20
26e8 CAE426    JP      Z,#26E4
26eb 2B        DEC     HL
26ec 0600      LD      B,#00
26ee 54        LD      D,H
26ef 5D        LD      E,L
26f0 1A        LD      A,(DE)
26f1 FE22      CP      #22
26f3 C8        RET     Z

26f4 04        INC     B
26f5 13        INC     DE
26f6 C3F026    JP      #26F0
26f9 E5        PUSH    HL
26fa 211308    LD      HL,#0813
26fd 22EB30    LD      (#30EB),HL
2700 E1        POP     HL
2701 7E        LD      A,(HL)
2702 E67F      AND     #7F
2704 CA2927    JP      Z,#2729
2707 FE49      CP      #49
2709 D24227    JP      NC,#2742
270c E5        PUSH    HL
270d 47        LD      B,A
270e 04        INC     B
270f 2B        DEC     HL
2710 7E        LD      A,(HL)
2711 E60F      AND     #0F
2713 C21C27    JP      NZ,#271C
2716 04        INC     B
2717 7E        LD      A,(HL)
2718 B7        OR      A
2719 CA0E27    JP      Z,#270E
271c E1        POP     HL
271d 78        LD      A,B
271e FE41      CP      #41
2720 DA4227    JP      C,#2742
2723 CD6D1F    CALL    #1F6D
2726 C2BB26    JP      NZ,#26BB
2729 CD6D1F    CALL    #1F6D
272c C2BE02    JP      NZ,#02BE
272f AF        XOR     A
2730 32EC30    LD      (#30EC),A
2733 3AEB30    LD      A,(#30EB)
2736 3C        INC     A
2737 CD2825    CALL    #2528
273a 3E22      LD      A,#22
273c 32C130    LD      (#30C1),A
273f C3C126    JP      #26C1
2742 7E        LD      A,(HL)
2743 32FC30    LD      (#30FC),A
2746 B7        OR      A
2747 CA4E27    JP      Z,#274E
274a E680      AND     #80
274c F641      OR      #41
274e 77        LD      (HL),A
274f 3AEB30    LD      A,(#30EB)
2752 D604      SUB     #04
2754 CD2825    CALL    #2528
2757 2A0731    LD      HL,(#3107)
275a 7E        LD      A,(HL)
275b FE2E      CP      #2E
275d CA6127    JP      Z,#2761
2760 23        INC     HL
2761 3645      LD      (HL),#45
2763 23        INC     HL
2764 3AFC30    LD      A,(#30FC)
2767 E67F      AND     #7F
2769 062B      LD      B,#2B
276b CA7727    JP      Z,#2777
276e D641      SUB     #41
2770 F27727    JP      P,#2777
2773 062D      LD      B,#2D
2775 2F        CPL     
2776 3C        INC     A
2777 70        LD      (HL),B
2778 23        INC     HL
2779 E5        PUSH    HL
277a 5F        LD      E,A
277b 1600      LD      D,#00
277d 2A0531    LD      HL,(#3105)
2780 2B        DEC     HL
2781 2B        DEC     HL
2782 7E        LD      A,(HL)
2783 FE31      CP      #31
2785 C29527    JP      NZ,#2795
2788 2B        DEC     HL
2789 7E        LD      A,(HL)
278a 3620      LD      (HL),#20
278c 23        INC     HL
278d 77        LD      (HL),A
278e 23        INC     HL
278f 220131    LD      (#3101),HL
2792 3631      LD      (HL),#31
2794 13        INC     DE
2795 EB        EX      DE,HL
2796 D1        POP     DE
2797 CD1920    CALL    #2019
279a 3E22      LD      A,#22
279c 12        LD      (DE),A
279d C3C126    JP      #26C1
27a0 AF        XOR     A
27a1 32FB30    LD      (#30FB),A
27a4 32FA30    LD      (#30FA),A
27a7 32FC30    LD      (#30FC),A
27aa 3EF7      LD      A,#F7
27ac 32FE30    LD      (#30FE),A
27af 1A        LD      A,(DE)
27b0 FE2B      CP      #2B
27b2 CAC927    JP      Z,#27C9
27b5 FEE3      CP      #E3
27b7 CAC927    JP      Z,#27C9
27ba FEE5      CP      #E5
27bc CAC427    JP      Z,#27C4
27bf FE2D      CP      #2D
27c1 C2CA27    JP      NZ,#27CA
27c4 3E80      LD      A,#80
27c6 32FB30    LD      (#30FB),A
27c9 13        INC     DE
27ca 22FF30    LD      (#30FF),HL
27cd 3E04      LD      A,#04
27cf 2B        DEC     HL
27d0 3600      LD      (HL),#00
27d2 3D        DEC     A
27d3 C2CF27    JP      NZ,#27CF
27d6 220131    LD      (#3101),HL
27d9 EB        EX      DE,HL
27da 220331    LD      (#3103),HL
27dd CD9C28    CALL    #289C
27e0 DA0928    JP      C,#2809
27e3 FE2E      CP      #2E
27e5 C2EE27    JP      NZ,#27EE
27e8 CD9C28    CALL    #289C
27eb DAF727    JP      C,#27F7
27ee 37        SCF     
27ef C9        RET     

27f0 21FC30    LD      HL,#30FC
27f3 35        DEC     (HL)
27f4 CD9C28    CALL    #289C
27f7 CAF027    JP      Z,#27F0
27fa DA4F28    JP      C,#284F
27fd FE45      CP      #45
27ff CA5D28    JP      Z,#285D
2802 AF        XOR     A
2803 C33C28    JP      #283C
2806 CD9C28    CALL    #289C
2809 CA0628    JP      Z,#2806
280c DA1728    JP      C,#2817
280f FE2E      CP      #2E
2811 CAF427    JP      Z,#27F4
2814 C30228    JP      #2802
2817 CDB228    CALL    #28B2
281a 21FC30    LD      HL,#30FC
281d 34        INC     (HL)
281e CD9C28    CALL    #289C
2821 DA1728    JP      C,#2817
2824 FE2E      CP      #2E
2826 CA4928    JP      Z,#2849
2829 FE45      CP      #45
282b CA5D28    JP      Z,#285D
282e AF        XOR     A
282f 21FC30    LD      HL,#30FC
2832 86        ADD     A,(HL)
2833 C640      ADD     A,#40
2835 FAEE27    JP      M,#27EE
2838 21FB30    LD      HL,#30FB
283b B6        OR      (HL)
283c 2AFF30    LD      HL,(#30FF)
283f 77        LD      (HL),A
2840 2A0331    LD      HL,(#3103)
2843 EB        EX      DE,HL
2844 3AFD30    LD      A,(#30FD)
2847 47        LD      B,A
2848 C9        RET     

2849 CD9C28    CALL    #289C
284c D25528    JP      NC,#2855
284f CDB228    CALL    #28B2
2852 C34928    JP      #2849
2855 FE45      CP      #45
2857 CA5D28    JP      Z,#285D
285a C32E28    JP      #282E
285d CD9C28    CALL    #289C
2860 DA8028    JP      C,#2880
2863 FE2B      CP      #2B
2865 CA7A28    JP      Z,#287A
2868 FEE3      CP      #E3
286a CA7A28    JP      Z,#287A
286d FE2D      CP      #2D
286f CA7728    JP      Z,#2877
2872 FEE5      CP      #E5
2874 C2EE27    JP      NZ,#27EE
2877 32FA30    LD      (#30FA),A
287a CD9C28    CALL    #289C
287d D2EE27    JP      NC,#27EE
2880 5F        LD      E,A
2881 1600      LD      D,#00
2883 CD9C28    CALL    #289C
2886 D28F28    JP      NC,#288F
2889 CD531F    CALL    #1F53
288c CD9C28    CALL    #289C
288f 3AFA30    LD      A,(#30FA)
2892 B7        OR      A
2893 7B        LD      A,E
2894 CA2F28    JP      Z,#282F
2897 2F        CPL     
2898 3C        INC     A
2899 C32F28    JP      #282F
289c 2A0331    LD      HL,(#3103)
289f 7E        LD      A,(HL)
28a0 32FD30    LD      (#30FD),A
28a3 23        INC     HL
28a4 220331    LD      (#3103),HL
28a7 FE3A      CP      #3A
28a9 D0        RET     NC

28aa FE30      CP      #30
28ac 3F        CCF     
28ad D0        RET     NC

28ae E60F      AND     #0F
28b0 37        SCF     
28b1 C9        RET     

28b2 47        LD      B,A
28b3 21FE30    LD      HL,#30FE
28b6 34        INC     (HL)
28b7 7E        LD      A,(HL)
28b8 2A0131    LD      HL,(#3101)
28bb CAD228    JP      Z,#28D2
28be F0        RET     P

28bf 0F        RRCA    
28c0 DACA28    JP      C,#28CA
28c3 78        LD      A,B
28c4 07        RLCA    
28c5 07        RLCA    
28c6 07        RLCA    
28c7 07        RLCA    
28c8 77        LD      (HL),A
28c9 C9        RET     

28ca 7E        LD      A,(HL)
28cb B0        OR      B
28cc 77        LD      (HL),A
28cd 23        INC     HL
28ce 220131    LD      (#3101),HL
28d1 C9        RET     

28d2 78        LD      A,B
28d3 FE05      CP      #05
28d5 D8        RET     C

28d6 CD0323    CALL    #2303
28d9 D0        RET     NC

28da 23        INC     HL
28db 3610      LD      (HL),#10
28dd 21FC30    LD      HL,#30FC
28e0 34        INC     (HL)
28e1 C9        RET     

28e2 CD0606    CALL    #0606
28e5 2AA82F    LD      HL,(#2FA8)
28e8 EB        EX      DE,HL
28e9 2A3931    LD      HL,(#3139)
28ec 7E        LD      A,(HL)
28ed FE01      CP      #01
28ef CA0829    JP      Z,#2908
28f2 23        INC     HL
28f3 CDCF1C    CALL    #1CCF
28f6 2B        DEC     HL
28f7 0E02      LD      C,#02
28f9 CA1D29    JP      Z,#291D
28fc 0E01      LD      C,#01
28fe DA1D29    JP      C,#291D
2901 7E        LD      A,(HL)
2902 CD9B29    CALL    #299B
2905 C3EC28    JP      #28EC
2908 3AA72F    LD      A,(#2FA7)
290b FE04      CP      #04
290d C8        RET     Z

290e CDA029    CALL    #29A0
2911 2A3731    LD      HL,(#3137)
2914 CD7229    CALL    #2972
2917 3601      LD      (HL),#01
2919 223731    LD      (#3137),HL
291c C9        RET     

291d 46        LD      B,(HL)
291e 22F830    LD      (#30F8),HL
2921 3AA72F    LD      A,(#2FA7)
2924 0D        DEC     C
2925 CA3629    JP      Z,#2936
2928 D604      SUB     #04
292a CA2F29    JP      Z,#292F
292d C604      ADD     A,#04
292f 90        SUB     B
2930 CA6929    JP      Z,#2969
2933 DA5529    JP      C,#2955
2936 47        LD      B,A
2937 3AA72F    LD      A,(#2FA7)
293a FE04      CP      #04
293c C8        RET     Z

293d 78        LD      A,B
293e CDA029    CALL    #29A0
2941 2AF830    LD      HL,(#30F8)
2944 CD8F29    CALL    #298F
2947 2A3731    LD      HL,(#3137)
294a EB        EX      DE,HL
294b 223731    LD      (#3137),HL
294e 03        INC     BC
294f CD8929    CALL    #2989
2952 C36929    JP      #2969
2955 2F        CPL     
2956 3C        INC     A
2957 CD9B29    CALL    #299B
295a CD8F29    CALL    #298F
295d EB        EX      DE,HL
295e 2AF830    LD      HL,(#30F8)
2961 C47E29    CALL    NZ,#297E
2964 3601      LD      (HL),#01
2966 223731    LD      (#3137),HL
2969 2AF830    LD      HL,(#30F8)
296c 3AA72F    LD      A,(#2FA7)
296f FE04      CP      #04
2971 C8        RET     Z

2972 11A72F    LD      DE,#2FA7
2975 1A        LD      A,(DE)
2976 4F        LD      C,A
2977 0600      LD      B,#00
2979 1A        LD      A,(DE)
297a 77        LD      (HL),A
297b 13        INC     DE
297c 23        INC     HL
297d 0B        DEC     BC
297e 78        LD      A,B
297f B1        OR      C
2980 C27929    JP      NZ,#2979
2983 C9        RET     

2984 1A        LD      A,(DE)
2985 77        LD      (HL),A
2986 2B        DEC     HL
2987 1B        DEC     DE
2988 0B        DEC     BC
2989 78        LD      A,B
298a B1        OR      C
298b C28429    JP      NZ,#2984
298e C9        RET     

298f 3A3731    LD      A,(#3137)
2992 95        SUB     L
2993 4F        LD      C,A
2994 3A3831    LD      A,(#3138)
2997 9C        SBC     A,H
2998 47        LD      B,A
2999 B1        OR      C
299a C9        RET     

299b 85        ADD     A,L
299c 6F        LD      L,A
299d D0        RET     NC

299e 24        INC     H
299f C9        RET     

29a0 2A3731    LD      HL,(#3137)
29a3 CD9B29    CALL    #299B
29a6 E5        PUSH    HL
29a7 113400    LD      DE,#0034
29aa 19        ADD     HL,DE
29ab EB        EX      DE,HL
29ac 213B31    LD      HL,#313B
29af CDCF1C    CALL    #1CCF
29b2 D1        POP     DE
29b3 D8        RET     C

29b4 CD0606    CALL    #0606
29b7 C3691C    JP      #1C69
29ba 3EBC      LD      A,#BC
29bc CDA51C    CALL    #1CA5
29bf D2A62C    JP      NC,#2CA6
29c2 0623      LD      B,#23
29c4 CD851C    CALL    #1C85
29c7 CDB71E    CALL    #1EB7
29ca CDB52D    CALL    #2DB5
29cd E608      AND     #08
29cf CAD802    JP      Z,#02D8
29d2 3E25      LD      A,#25
29d4 CDA51C    CALL    #1CA5
29d7 DAE029    JP      C,#29E0
29da CDF41E    CALL    #1EF4
29dd CD672D    CALL    #2D67
29e0 CD761C    CALL    #1C76
29e3 3EB9      LD      A,#B9
29e5 CDA51C    CALL    #1CA5
29e8 D0        RET     NC

29e9 3E26      LD      A,#26
29eb CDA51C    CALL    #1CA5
29ee D2742A    JP      NC,#2A74
29f1 CDE91C    CALL    #1CE9
29f4 CA2E2A    JP      Z,#2A2E
29f7 110500    LD      DE,#0005
29fa CD972D    CALL    #2D97
29fd CDC911    CALL    #11C9
2a00 CD111C    CALL    #1C11
2a03 21FB2E    LD      HL,#2EFB
2a06 7E        LD      A,(HL)
2a07 E6F0      AND     #F0
2a09 C20E2A    JP      NZ,#2A0E
2a0c 3610      LD      (HL),#10
2a0e 0605      LD      B,#05
2a10 C5        PUSH    BC
2a11 E5        PUSH    HL
2a12 7E        LD      A,(HL)
2a13 CD252C    CALL    #2C25
2a16 E1        POP     HL
2a17 C1        POP     BC
2a18 23        INC     HL
2a19 05        DEC     B
2a1a C2102A    JP      NZ,#2A10
2a1d CDA31C    CALL    #1CA3
2a20 D2E329    JP      NC,#29E3
2a23 110100    LD      DE,#0001
2a26 CD972D    CALL    #2D97
2a29 3E01      LD      A,#01
2a2b C3FB2B    JP      #2BFB
2a2e CDB718    CALL    #18B7
2a31 E5        PUSH    HL
2a32 7C        LD      A,H
2a33 23        INC     HL
2a34 23        INC     HL
2a35 B7        OR      A
2a36 EB        EX      DE,HL
2a37 CA4C2A    JP      Z,#2A4C
2a3a 13        INC     DE
2a3b CD972D    CALL    #2D97
2a3e 3E02      LD      A,#02
2a40 CD252C    CALL    #2C25
2a43 E1        POP     HL
2a44 E5        PUSH    HL
2a45 7C        LD      A,H
2a46 CD252C    CALL    #2C25
2a49 C3542A    JP      #2A54
2a4c CD972D    CALL    #2D97
2a4f 3E03      LD      A,#03
2a51 CD252C    CALL    #2C25
2a54 E1        POP     HL
2a55 E5        PUSH    HL
2a56 7D        LD      A,L
2a57 CD252C    CALL    #2C25
2a5a D1        POP     DE
2a5b 2ADD30    LD      HL,(#30DD)
2a5e 19        ADD     HL,DE
2a5f 22DD30    LD      (#30DD),HL
2a62 7A        LD      A,D
2a63 B3        OR      E
2a64 CA1D2A    JP      Z,#2A1D
2a67 E5        PUSH    HL
2a68 D5        PUSH    DE
2a69 7E        LD      A,(HL)
2a6a CD252C    CALL    #2C25
2a6d D1        POP     DE
2a6e E1        POP     HL
2a6f 2B        DEC     HL
2a70 1B        DEC     DE
2a71 C3622A    JP      #2A62
2a74 110100    LD      DE,#0001
2a77 CD972D    CALL    #2D97
2a7a CDB71E    CALL    #1EB7
2a7d 14        INC     D
2a7e 15        DEC     D
2a7f C2B202    JP      NZ,#02B2
2a82 7B        LD      A,E
2a83 CD252C    CALL    #2C25
2a86 C31D2A    JP      #2A1D
2a89 CDB71E    CALL    #1EB7
2a8c CDB52D    CALL    #2DB5
2a8f E608      AND     #08
2a91 CAD802    JP      Z,#02D8
2a94 3E25      LD      A,#25
2a96 CDA51C    CALL    #1CA5
2a99 DAA22A    JP      C,#2AA2
2a9c CDF41E    CALL    #1EF4
2a9f CD672D    CALL    #2D67
2aa2 CD761C    CALL    #1C76
2aa5 3E26      LD      A,#26
2aa7 CDA51C    CALL    #1CA5
2aaa D2222B    JP      NC,#2B22
2aad CDDC19    CALL    #19DC
2ab0 CAD72A    JP      Z,#2AD7
2ab3 11FCFF    LD      DE,#FFFC
2ab6 19        ADD     HL,DE
2ab7 E5        PUSH    HL
2ab8 CDC92C    CALL    #2CC9
2abb E6F0      AND     #F0
2abd CAB802    JP      Z,#02B8
2ac0 0605      LD      B,#05
2ac2 E1        POP     HL
2ac3 C5        PUSH    BC
2ac4 E5        PUSH    HL
2ac5 CDC02C    CALL    #2CC0
2ac8 E1        POP     HL
2ac9 77        LD      (HL),A
2aca 23        INC     HL
2acb C1        POP     BC
2acc 05        DEC     B
2acd C2C32A    JP      NZ,#2AC3
2ad0 CDA31C    CALL    #1CA3
2ad3 D2A52A    JP      NC,#2AA5
2ad6 C9        RET     

2ad7 11D02A    LD      DE,#2AD0
2ada D5        PUSH    DE
2adb E5        PUSH    HL
2adc F5        PUSH    AF
2add C5        PUSH    BC
2ade 2AE330    LD      HL,(#30E3)
2ae1 E5        PUSH    HL
2ae2 CDC02C    CALL    #2CC0
2ae5 FE02      CP      #02
2ae7 CAF42A    JP      Z,#2AF4
2aea FE03      CP      #03
2aec C2B802    JP      NZ,#02B8
2aef 1600      LD      D,#00
2af1 C3F82A    JP      #2AF8
2af4 CDC02C    CALL    #2CC0
2af7 57        LD      D,A
2af8 D5        PUSH    DE
2af9 CDC02C    CALL    #2CC0
2afc D1        POP     DE
2afd 5F        LD      E,A
2afe D5        PUSH    DE
2aff 2ADD30    LD      HL,(#30DD)
2b02 2B        DEC     HL
2b03 CD8A1D    CALL    #1D8A
2b06 CD551C    CALL    #1C55
2b09 2ADD30    LD      HL,(#30DD)
2b0c 7A        LD      A,D
2b0d B3        OR      E
2b0e CA1E2B    JP      Z,#2B1E
2b11 E5        PUSH    HL
2b12 D5        PUSH    DE
2b13 CDC02C    CALL    #2CC0
2b16 D1        POP     DE
2b17 E1        POP     HL
2b18 77        LD      (HL),A
2b19 2B        DEC     HL
2b1a 1B        DEC     DE
2b1b C30C2B    JP      #2B0C
2b1e D1        POP     DE
2b1f C38219    JP      #1982
2b22 CDDC19    CALL    #19DC
2b25 CAB802    JP      Z,#02B8
2b28 E5        PUSH    HL
2b29 CDC02C    CALL    #2CC0
2b2c 6F        LD      L,A
2b2d 2600      LD      H,#00
2b2f CDA11E    CALL    #1EA1
2b32 E1        POP     HL
2b33 CD141C    CALL    #1C14
2b36 C3D02A    JP      #2AD0
2b39 0623      LD      B,#23
2b3b CD851C    CALL    #1C85
2b3e CDB71E    CALL    #1EB7
2b41 CDB52D    CALL    #2DB5
2b44 E608      AND     #08
2b46 C2D802    JP      NZ,#02D8
2b49 7E        LD      A,(HL)
2b4a E610      AND     #10
2b4c E5        PUSH    HL
2b4d E5        PUSH    HL
2b4e C2692B    JP      NZ,#2B69
2b51 210001    LD      HL,#0100
2b54 00        NOP     
2b55 00        NOP     
2b56 00        NOP     
2b57 00        NOP     
2b58 00        NOP     
2b59 00        NOP     
2b5a 00        NOP     
2b5b 00        NOP     
2b5c 00        NOP     
2b5d CD401C    CALL    #1C40
2b60 EB        EX      DE,HL
2b61 E1        POP     HL
2b62 E5        PUSH    HL
2b63 3610      LD      (HL),#10
2b65 23        INC     HL
2b66 CDB019    CALL    #19B0
2b69 3E25      LD      A,#25
2b6b CDA51C    CALL    #1CA5
2b6e 3E03      LD      A,#03
2b70 DA772B    JP      C,#2B77
2b73 CDB71E    CALL    #1EB7
2b76 7B        LD      A,E
2b77 F5        PUSH    AF
2b78 CD761C    CALL    #1C76
2b7b CD8808    CALL    #0888
2b7e 3E02      LD      A,#02
2b80 CDB437    CALL    #37B4
2b83 DAD802    JP      C,#02D8
2b86 32A130    LD      (#30A1),A
2b89 CDB519    CALL    #19B5
2b8c C1        POP     BC
2b8d E3        EX      (SP),HL
2b8e 23        INC     HL
2b8f 23        INC     HL
2b90 23        INC     HL
2b91 CDB019    CALL    #19B0
2b94 E3        EX      (SP),HL
2b95 CDB519    CALL    #19B5
2b98 7E        LD      A,(HL)
2b99 E67F      AND     #7F
2b9b B8        CP      B
2b9c C2B802    JP      NZ,#02B8
2b9f 7E        LD      A,(HL)
2ba0 E680      AND     #80
2ba2 21A130    LD      HL,#30A1
2ba5 B6        OR      (HL)
2ba6 77        LD      (HL),A
2ba7 F2AD2B    JP      P,#2BAD
2baa EB        EX      DE,HL
2bab 29        ADD     HL,HL
2bac EB        EX      DE,HL
2bad E1        POP     HL
2bae CDB019    CALL    #19B0
2bb1 D5        PUSH    DE
2bb2 110000    LD      DE,#0000
2bb5 CDB019    CALL    #19B0
2bb8 72        LD      (HL),D
2bb9 D1        POP     DE
2bba E1        POP     HL
2bbb 3AA130    LD      A,(#30A1)
2bbe F618      OR      #18
2bc0 77        LD      (HL),A
2bc1 CDA31C    CALL    #1CA3
2bc4 D8        RET     C

2bc5 EB        EX      DE,HL
2bc6 CDA11E    CALL    #1EA1
2bc9 CDDC19    CALL    #19DC
2bcc CAB802    JP      Z,#02B8
2bcf C3141C    JP      #1C14
2bd2 110700    LD      DE,#0007
2bd5 D5        PUSH    DE
2bd6 CDB52D    CALL    #2DB5
2bd9 E5        PUSH    HL
2bda CD452D    CALL    #2D45
2bdd E1        POP     HL
2bde 3600      LD      (HL),#00
2be0 D1        POP     DE
2be1 1D        DEC     E
2be2 F2D52B    JP      P,#2BD5
2be5 C9        RET     

2be6 0623      LD      B,#23
2be8 CD851C    CALL    #1C85
2beb CDB71E    CALL    #1EB7
2bee CDB52D    CALL    #2DB5
2bf1 E5        PUSH    HL
2bf2 CD7C37    CALL    #377C
2bf5 E1        POP     HL
2bf6 7E        LD      A,(HL)
2bf7 E610      AND     #10
2bf9 77        LD      (HL),A
2bfa C9        RET     

2bfb F5        PUSH    AF
2bfc CD352D    CALL    #2D35
2bff 2A3531    LD      HL,(#3135)
2c02 7E        LD      A,(HL)
2c03 F620      OR      #20
2c05 77        LD      (HL),A
2c06 CD0C2C    CALL    #2C0C
2c09 F1        POP     AF
2c0a 77        LD      (HL),A
2c0b C9        RET     

2c0c 7E        LD      A,(HL)
2c0d 23        INC     HL
2c0e CDB519    CALL    #19B5
2c11 010600    LD      BC,#0006
2c14 09        ADD     HL,BC
2c15 4E        LD      C,(HL)
2c16 B7        OR      A
2c17 F2222C    JP      P,#2C22
2c1a E5        PUSH    HL
2c1b 2B        DEC     HL
2c1c 2B        DEC     HL
2c1d 7E        LD      A,(HL)
2c1e E601      AND     #01
2c20 47        LD      B,A
2c21 E1        POP     HL
2c22 EB        EX      DE,HL
2c23 09        ADD     HL,BC
2c24 C9        RET     

2c25 CDFB2B    CALL    #2BFB
2c28 0C        INC     C
2c29 EB        EX      DE,HL
2c2a 71        LD      (HL),C
2c2b C0        RET     NZ

2c2c 2A3531    LD      HL,(#3135)
2c2f E5        PUSH    HL
2c30 7E        LD      A,(HL)
2c31 E680      AND     #80
2c33 B0        OR      B
2c34 FE80      CP      #80
2c36 C4452D    CALL    NZ,#2D45
2c39 E1        POP     HL
2c3a 010700    LD      BC,#0007
2c3d 09        ADD     HL,BC
2c3e E5        PUSH    HL
2c3f CDB519    CALL    #19B5
2c42 13        INC     DE
2c43 E1        POP     HL
2c44 C3B019    JP      #19B0
2c47 CD7B1C    CALL    #1C7B
2c4a CDB71E    CALL    #1EB7
2c4d CD831C    CALL    #1C83
2c50 CDB52D    CALL    #2DB5
2c53 E608      AND     #08
2c55 CAD802    JP      Z,#02D8
2c58 110700    LD      DE,#0007
2c5b 19        ADD     HL,DE
2c5c CDB519    CALL    #19B5
2c5f EB        EX      DE,HL
2c60 CDA11E    CALL    #1EA1
2c63 CDF91B    CALL    #1BF9
2c66 C5        PUSH    BC
2c67 11521F    LD      DE,#1F52
2c6a CD3322    CALL    #2233
2c6d 2A3531    LD      HL,(#3135)
2c70 110900    LD      DE,#0009
2c73 19        ADD     HL,DE
2c74 6E        LD      L,(HL)
2c75 2600      LD      H,#00
2c77 CDA11E    CALL    #1EA1
2c7a CDEF1B    CALL    #1BEF
2c7d C1        POP     BC
2c7e CD5523    CALL    #2355
2c81 CD111C    CALL    #1C11
2c84 C33412    JP      #1234
2c87 CD7B1C    CALL    #1C7B
2c8a CDB71E    CALL    #1EB7
2c8d CD831C    CALL    #1C83
2c90 CDB52D    CALL    #2DB5
2c93 E608      AND     #08
2c95 CAD802    JP      Z,#02D8
2c98 110500    LD      DE,#0005
2c9b 19        ADD     HL,DE
2c9c CDB519    CALL    #19B5
2c9f EB        EX      DE,HL
2ca0 CDA11E    CALL    #1EA1
2ca3 C33412    JP      #1234
2ca6 0623      LD      B,#23
2ca8 CD851C    CALL    #1C85
2cab CDB71E    CALL    #1EB7
2cae CDB52D    CALL    #2DB5
2cb1 E608      AND     #08
2cb3 CAD802    JP      Z,#02D8
2cb6 E5        PUSH    HL
2cb7 CD761C    CALL    #1C76
2cba CDB71E    CALL    #1EB7
2cbd C3D802    JP      #02D8
2cc0 CDC92C    CALL    #2CC9
2cc3 F5        PUSH    AF
2cc4 CD282C    CALL    #2C28
2cc7 F1        POP     AF
2cc8 C9        RET     

2cc9 CD352D    CALL    #2D35
2ccc 2A3531    LD      HL,(#3135)
2ccf CD0C2C    CALL    #2C0C
2cd2 7E        LD      A,(HL)
2cd3 C9        RET     

2cd4 7E        LD      A,(HL)
2cd5 E687      AND     #87
2cd7 F5        PUSH    AF
2cd8 4F        LD      C,A
2cd9 23        INC     HL
2cda CDB519    CALL    #19B5
2cdd D5        PUSH    DE
2cde CDB519    CALL    #19B5
2ce1 D5        PUSH    DE
2ce2 CDB519    CALL    #19B5
2ce5 CDCF1C    CALL    #1CCF
2ce8 DAB202    JP      C,#02B2
2ceb CAB202    JP      Z,#02B2
2cee CDB519    CALL    #19B5
2cf1 00        NOP     
2cf2 00        NOP     
2cf3 00        NOP     
2cf4 00        NOP     
2cf5 00        NOP     
2cf6 00        NOP     
2cf7 79        LD      A,C
2cf8 B7        OR      A
2cf9 F2022D    JP      P,#2D02
2cfc 7A        LD      A,D
2cfd 1F        RRA     
2cfe 57        LD      D,A
2cff 7B        LD      A,E
2d00 1F        RRA     
2d01 5F        LD      E,A
2d02 E1        POP     HL
2d03 19        ADD     HL,DE
2d04 D1        POP     DE
2d05 3E01      LD      A,#01
2d07 D5        PUSH    DE
2d08 CD0E39    CALL    #390E
2d0b 00        NOP     
2d0c 00        NOP     
2d0d 00        NOP     
2d0e 00        NOP     
2d0f 00        NOP     
2d10 00        NOP     
2d11 DAD802    JP      C,#02D8
2d14 D1        POP     DE
2d15 D1        POP     DE
2d16 C9        RET     

2d17 E5        PUSH    HL
2d18 21D202    LD      HL,#02D2
2d1b 221A40    LD      (#401A),HL
2d1e E1        POP     HL
2d1f FE05      CP      #05
2d21 C2D202    JP      NZ,#02D2
2d24 E1        POP     HL
2d25 F1        POP     AF
2d26 E680      AND     #80
2d28 EE80      XOR     #80
2d2a 3620      LD      (HL),#20
2d2c 23        INC     HL
2d2d 3620      LD      (HL),#20
2d2f 23        INC     HL
2d30 3D        DEC     A
2d31 C22A2D    JP      NZ,#2D2A
2d34 C9        RET     

2d35 2A3531    LD      HL,(#3135)
2d38 7E        LD      A,(HL)
2d39 E640      AND     #40
2d3b C0        RET     NZ

2d3c 7E        LD      A,(HL)
2d3d F640      OR      #40
2d3f 77        LD      (HL),A
2d40 0601      LD      B,#01
2d42 C3D42C    JP      #2CD4
2d45 7E        LD      A,(HL)
2d46 E640      AND     #40
2d48 C8        RET     Z

2d49 7E        LD      A,(HL)
2d4a E69F      AND     #9F
2d4c 47        LD      B,A
2d4d 7E        LD      A,(HL)
2d4e 70        LD      (HL),B
2d4f E620      AND     #20
2d51 C8        RET     Z

2d52 0600      LD      B,#00
2d54 C3D42C    JP      #2CD4
2d57 110700    LD      DE,#0007
2d5a D5        PUSH    DE
2d5b CDB52D    CALL    #2DB5
2d5e CD452D    CALL    #2D45
2d61 D1        POP     DE
2d62 1D        DEC     E
2d63 F25A2D    JP      P,#2D5A
2d66 C9        RET     

2d67 F5        PUSH    AF
2d68 2A3531    LD      HL,(#3135)
2d6b E5        PUSH    HL
2d6c 7E        LD      A,(HL)
2d6d F5        PUSH    AF
2d6e 010700    LD      BC,#0007
2d71 09        ADD     HL,BC
2d72 CDCF1C    CALL    #1CCF
2d75 C1        POP     BC
2d76 CA8A2D    JP      Z,#2D8A
2d79 78        LD      A,B
2d7a E680      AND     #80
2d7c EE80      XOR     #80
2d7e C28A2D    JP      NZ,#2D8A
2d81 D5        PUSH    DE
2d82 7B        LD      A,E
2d83 EE01      XOR     #01
2d85 5F        LD      E,A
2d86 CDCF1C    CALL    #1CCF
2d89 D1        POP     DE
2d8a E3        EX      (SP),HL
2d8b D5        PUSH    DE
2d8c C4452D    CALL    NZ,#2D45
2d8f D1        POP     DE
2d90 E1        POP     HL
2d91 CDB019    CALL    #19B0
2d94 F1        POP     AF
2d95 77        LD      (HL),A
2d96 C9        RET     

2d97 2A3531    LD      HL,(#3135)
2d9a 010500    LD      BC,#0005
2d9d 09        ADD     HL,BC
2d9e E5        PUSH    HL
2d9f 23        INC     HL
2da0 23        INC     HL
2da1 46        LD      B,(HL)
2da2 23        INC     HL
2da3 7E        LD      A,(HL)
2da4 23        INC     HL
2da5 4E        LD      C,(HL)
2da6 EB        EX      DE,HL
2da7 2B        DEC     HL
2da8 09        ADD     HL,BC
2da9 CE00      ADC     A,#00
2dab 57        LD      D,A
2dac 5C        LD      E,H
2dad E1        POP     HL
2dae CDCF1C    CALL    #1CCF
2db1 D2B202    JP      NC,#02B2
2db4 C9        RET     

2db5 7A        LD      A,D
2db6 B7        OR      A
2db7 CD7437    CALL    #3774
2dba 7B        LD      A,E
2dbb E6F8      AND     #F8
2dbd C2B202    JP      NZ,#02B2
2dc0 010A00    LD      BC,#000A
2dc3 CD821F    CALL    #1F82
2dc6 11932E    LD      DE,#2E93
2dc9 19        ADD     HL,DE
2dca 7E        LD      A,(HL)
2dcb 223531    LD      (#3135),HL
2dce C9        RET     

2dcf 21932E    LD      HL,#2E93
2dd2 115000    LD      DE,#0050
2dd5 CDDE1C    CALL    #1CDE
2dd8 C9        RET     

2dd9 C9        RET     

2dda D8        RET     C

2ddb 02        LD      (BC),A
2ddc 222D40    LD      (#402D),HL
2ddf 21D202    LD      HL,#02D2
2de2 221A40    LD      (#401A),HL
2de5 C9        RET     

2de6 		db "COPYRIGHT NORTH STAR COMPUTERS, INC., 1978, 1980", 0
   
2e23 00        NOP     
2e24 00        NOP     
2e25 00        NOP     
2e26 00        NOP     
2e27 00        NOP    

...
 
3137 00        NOP     
3138 00        NOP     
3139 00        NOP     
313a 00        NOP     
313b 00        NOP     
313c 00        NOP     
313d 214717    LD      HL,#1747
3140 1A        LD      A,(DE)
3141 B7        OR      A
3142 CAE41B    JP      Z,#1BE4
3145 D5        PUSH    DE
3146 016132    LD      BC,#3261
3149 CD9115    CALL    #1591
314c 214617    LD      HL,#1746
314f D1        POP     DE
3150 D2E41B    JP      NC,#1BE4
3153 D5        PUSH    DE
3154 015C32    LD      BC,#325C
3157 CD9115    CALL    #1591
315a DAB202    JP      C,#02B2
315d E1        POP     HL
315e E5        PUSH    HL
315f CDFF1B    CALL    #1BFF
3162 CDF91B    CALL    #1BF9
3165 115133    LD      DE,#3351
3168 CD3322    CALL    #2233
316b CDF91B    CALL    #1BF9
316e 114217    LD      DE,#1742
3171 CD5523    CALL    #2355
3174 CDEF1B    CALL    #1BEF
3177 CD5516    CALL    #1655
317a CDEF1B    CALL    #1BEF
317d CDFF1B    CALL    #1BFF
3180 CDEF1B    CALL    #1BEF
3183 11CD30    LD      DE,#30CD
3186 CDE41B    CALL    #1BE4
3189 E1        POP     HL
318a E5        PUSH    HL
318b 11D230    LD      DE,#30D2
318e CDE41B    CALL    #1BE4
3191 11D230    LD      DE,#30D2
3194 CD5516    CALL    #1655
3197 C1        POP     BC
3198 C5        PUSH    BC
3199 11D230    LD      DE,#30D2
319c CD3E23    CALL    #233E
319f 01CD30    LD      BC,#30CD
31a2 116632    LD      DE,#3266
31a5 CD3322    CALL    #2233
31a8 01D230    LD      BC,#30D2
31ab 11CD30    LD      DE,#30CD
31ae CD3E23    CALL    #233E
31b1 C1        POP     BC
31b2 C5        PUSH    BC
31b3 11D230    LD      DE,#30D2
31b6 CD5523    CALL    #2355
31b9 CDF91B    CALL    #1BF9
31bc 116B32    LD      DE,#326B
31bf CD3322    CALL    #2233
31c2 CDEF1B    CALL    #1BEF
31c5 C1        POP     BC
31c6 C5        PUSH    BC
31c7 CD3E23    CALL    #233E
31ca CD111C    CALL    #1C11
31cd 11CD30    LD      DE,#30CD
31d0 E1        POP     HL
31d1 E5        PUSH    HL
31d2 CDE41B    CALL    #1BE4
31d5 01CD30    LD      BC,#30CD
31d8 D1        POP     DE
31d9 D5        PUSH    DE
31da CD3322    CALL    #2233
31dd 01CD30    LD      BC,#30CD
31e0 11D230    LD      DE,#30D2
31e3 217A32    LD      HL,#327A
31e6 3E01      LD      A,#01
31e8 CD8E18    CALL    #188E
31eb 01CD30    LD      BC,#30CD
31ee 11D730    LD      DE,#30D7
31f1 218932    LD      HL,#3289
31f4 3E02      LD      A,#02
31f6 CD8E18    CALL    #188E
31f9 C1        POP     BC
31fa C5        PUSH    BC
31fb 11D230    LD      DE,#30D2
31fe CD3322    CALL    #2233
3201 01D730    LD      BC,#30D7
3204 D1        POP     DE
3205 D5        PUSH    DE
3206 CD3E23    CALL    #233E
3209 C1        POP     BC
320a C5        PUSH    BC
320b 11D730    LD      DE,#30D7
320e CD6324    CALL    #2463
3211 C1        POP     BC
3212 C5        PUSH    BC
3213 114217    LD      DE,#1742
3216 CD5523    CALL    #2355
3219 C1        POP     BC
321a C5        PUSH    BC
321b 114217    LD      DE,#1742
321e CD6324    CALL    #2463
3221 CDEF1B    CALL    #1BEF
3224 7E        LD      A,(HL)
3225 F5        PUSH    AF
3226 E67F      AND     #7F
3228 77        LD      (HL),A
3229 CDBA1E    CALL    #1EBA
322c F1        POP     AF
322d B7        OR      A
322e 7B        LD      A,E
322f F23432    JP      P,#3234
3232 2F        CPL     
3233 3C        INC     A
3234 C1        POP     BC
3235 C5        PUSH    BC
3236 F5        PUSH    AF
3237 7B        LD      A,E
3238 E601      AND     #01
323a CA5032    JP      Z,#3250
323d 117032    LD      DE,#3270
3240 F1        POP     AF
3241 F5        PUSH    AF
3242 FC6324    CALL    M,#2463
3245 F1        POP     AF
3246 F5        PUSH    AF
3247 F43322    CALL    P,#2233
324a F1        POP     AF
324b F24F32    JP      P,#324F
324e 3C        INC     A
324f F5        PUSH    AF
3250 F1        POP     AF
3251 1F        RRA     
3252 E1        POP     HL
3253 86        ADD     A,(HL)
3254 E67F      AND     #7F
3256 77        LD      (HL),A
3257 C9        RET     

3258 14        INC     D
3259 50        LD      D,B
325a 62        LD      H,D
325b 00        NOP     
325c 43        LD      B,E
325d 14        INC     D
325e 73        LD      (HL),E
325f 65        LD      H,L
3260 00        NOP     
3261 C31151    JP      #5111
3264 00        NOP     
3265 00        NOP     
3266 41        LD      B,C
3267 29        ADD     HL,HL
3268 25        DEC     H
3269 46        LD      B,(HL)
326a 49        LD      C,C
326b 3D        DEC     A
326c 316227    LD      SP,#2762
326f 76        HALT    
3270 41        LD      B,C
3271 84        ADD     A,H
3272 24        INC     H
3273 90        SUB     B
3274 3843      JR      C,#32B9
3276 2004      JR      NZ,#327C
3278 14        INC     D
3279 324216    LD      (#1642),A
327c 84        ADD     A,H
327d 98        SBC     A,B
327e 07        RLCA    
327f 44        LD      B,H
3280 1804      JR      #3286
3282 97        SUB     A
3283 93        SUB     E
3284 43        LD      B,E
3285 1000      DJNZ    #3287
3287 00        NOP     
3288 00        NOP     
3289 41        LD      B,C
328a D5        PUSH    DE
328b CD9532    CALL    #3295
328e C1        POP     BC
328f 114C17    LD      DE,#174C
3292 C36324    JP      #2463
3295 1A        LD      A,(DE)
3296 B7        OR      A
3297 CAB202    JP      Z,#02B2
329a FAB202    JP      M,#02B2
329d F5        PUSH    AF
329e 3E40      LD      A,#40
32a0 12        LD      (DE),A
32a1 D5        PUSH    DE
32a2 42        LD      B,D
32a3 4B        LD      C,E
32a4 114C33    LD      DE,#334C
32a7 CD9115    CALL    #1591
32aa E1        POP     HL
32ab D2B532    JP      NC,#32B5
32ae F1        POP     AF
32af 3D        DEC     A
32b0 CAB202    JP      Z,#02B2
32b3 F5        PUSH    AF
32b4 34        INC     (HL)
32b5 E5        PUSH    HL
32b6 11CD30    LD      DE,#30CD
32b9 CDE41B    CALL    #1BE4
32bc C1        POP     BC
32bd C5        PUSH    BC
32be 114217    LD      DE,#1742
32c1 CD3E23    CALL    #233E
32c4 C1        POP     BC
32c5 C5        PUSH    BC
32c6 114217    LD      DE,#1742
32c9 CD3E23    CALL    #233E
32cc 01CD30    LD      BC,#30CD
32cf 114717    LD      DE,#1747
32d2 CD5523    CALL    #2355
32d5 C1        POP     BC
32d6 C5        PUSH    BC
32d7 11CD30    LD      DE,#30CD
32da CD6324    CALL    #2463
32dd E1        POP     HL
32de E5        PUSH    HL
32df 11CD30    LD      DE,#30CD
32e2 CDE41B    CALL    #1BE4
32e5 C1        POP     BC
32e6 C5        PUSH    BC
32e7 11CD30    LD      DE,#30CD
32ea CD3322    CALL    #2233
32ed 3E02      LD      A,#02
32ef C1        POP     BC
32f0 C5        PUSH    BC
32f1 11D230    LD      DE,#30D2
32f4 216033    LD      HL,#3360
32f7 CD8E18    CALL    #188E
32fa 3E03      LD      A,#03
32fc C1        POP     BC
32fd C5        PUSH    BC
32fe 11D730    LD      DE,#30D7
3301 217433    LD      HL,#3374
3304 CD8E18    CALL    #188E
3307 C1        POP     BC
3308 C5        PUSH    BC
3309 11D230    LD      DE,#30D2
330c CD3322    CALL    #2233
330f C1        POP     BC
3310 C5        PUSH    BC
3311 11D730    LD      DE,#30D7
3314 CD6324    CALL    #2463
3317 C1        POP     BC
3318 C5        PUSH    BC
3319 115133    LD      DE,#3351
331c CD5523    CALL    #2355
331f C1        POP     BC
3320 F1        POP     AF
3321 C5        PUSH    BC
3322 F5        PUSH    AF
3323 11CD30    LD      DE,#30CD
3326 CD3322    CALL    #2233
3329 F1        POP     AF
332a 6F        LD      L,A
332b 2600      LD      H,#00
332d CDA11E    CALL    #1EA1
3330 CDF91B    CALL    #1BF9
3333 114733    LD      DE,#3347
3336 CD3E23    CALL    #233E
3339 CDEF1B    CALL    #1BEF
333c C1        POP     BC
333d CD5523    CALL    #2355
3340 C3111C    JP      #1C11
3343 64        LD      H,H
3344 00        NOP     
3345 00        NOP     
3346 00        NOP     
3347 42        LD      B,D
3348 316227    LD      SP,#2762
334b 76        HALT    
334c 40        LD      B,B
334d 86        ADD     A,(HL)
334e 85        ADD     A,L
334f 88        ADC     A,B
3350 96        SUB     (HL)
3351 40        LD      B,B
3352 29        ADD     HL,HL
3353 15        DEC     D
3354 68        LD      L,B
3355 14        INC     D
3356 C1        POP     BC
3357 316303    LD      SP,#0363
335a 49        LD      C,C
335b 41        LD      B,C
335c 67        LD      H,A
335d 35        DEC     (HL)
335e 81        ADD     A,C
335f 60        LD      H,B
3360 C0        RET     NZ

3361 1007      DJNZ    #336A
3363 04        INC     B
3364 07        RLCA    
3365 C21696    JP      NZ,#9616
3368 69        LD      L,C
3369 81        ADD     A,C
336a 42        LD      B,D
336b 81        ADD     A,C
336c 90        SUB     B
336d 80        ADD     A,B
336e 05        DEC     B
336f C1        POP     BC
3370 1000      DJNZ    #3372
3372 00        NOP     
3373 00        NOP     
3374 41        LD      B,C
3375 D5        PUSH    DE
3376 42        LD      B,D
3377 4B        LD      C,E
3378 114C34    LD      DE,#344C
337b CD5523    CALL    #2355
337e D1        POP     DE
337f 1A        LD      A,(DE)
3380 E680      AND     #80
3382 32DA30    LD      (#30DA),A
3385 1A        LD      A,(DE)
3386 E67F      AND     #7F
3388 12        LD      (DE),A
3389 D5        PUSH    DE
338a EB        EX      DE,HL
338b CDFF1B    CALL    #1BFF
338e CDF91B    CALL    #1BF9
3391 115134    LD      DE,#3451
3394 CD6324    CALL    #2463
3397 CDF91B    CALL    #1BF9
339a 114217    LD      DE,#1742
339d CD5523    CALL    #2355
33a0 CDEF1B    CALL    #1BEF
33a3 CD5516    CALL    #1655
33a6 CDEF1B    CALL    #1BEF
33a9 CDFF1B    CALL    #1BFF
33ac CDBA1E    CALL    #1EBA
33af 7B        LD      A,E
33b0 E601      AND     #01
33b2 CABD33    JP      Z,#33BD
33b5 3ADA30    LD      A,(#30DA)
33b8 EE80      XOR     #80
33ba 32DA30    LD      (#30DA),A
33bd CDEF1B    CALL    #1BEF
33c0 11CD30    LD      DE,#30CD
33c3 CDE41B    CALL    #1BE4
33c6 E1        POP     HL
33c7 E5        PUSH    HL
33c8 11D230    LD      DE,#30D2
33cb CDE41B    CALL    #1BE4
33ce 11D230    LD      DE,#30D2
33d1 CD5516    CALL    #1655
33d4 C1        POP     BC
33d5 C5        PUSH    BC
33d6 11D230    LD      DE,#30D2
33d9 CD3E23    CALL    #233E
33dc 01CD30    LD      BC,#30CD
33df 115634    LD      DE,#3456
33e2 CD3322    CALL    #2233
33e5 01D230    LD      BC,#30D2
33e8 11CD30    LD      DE,#30CD
33eb CD3E23    CALL    #233E
33ee C1        POP     BC
33ef C5        PUSH    BC
33f0 11D230    LD      DE,#30D2
33f3 CD5523    CALL    #2355
33f6 CDF91B    CALL    #1BF9
33f9 115B34    LD      DE,#345B
33fc CD3322    CALL    #2233
33ff CDEF1B    CALL    #1BEF
3402 C1        POP     BC
3403 C5        PUSH    BC
3404 CD3E23    CALL    #233E
3407 CD111C    CALL    #1C11
340a E1        POP     HL
340b E5        PUSH    HL
340c CDFF1B    CALL    #1BFF
340f CDF91B    CALL    #1BF9
3412 D1        POP     DE
3413 D5        PUSH    DE
3414 CD3322    CALL    #2233
3417 CDF91B    CALL    #1BF9
341a 11CD30    LD      DE,#30CD
341d 216F34    LD      HL,#346F
3420 3E03      LD      A,#03
3422 CD8E18    CALL    #188E
3425 CDEF1B    CALL    #1BEF
3428 01CD30    LD      BC,#30CD
342b CD3322    CALL    #2233
342e D1        POP     DE
342f D5        PUSH    DE
3430 01CD30    LD      BC,#30CD
3433 CD3322    CALL    #2233
3436 C1        POP     BC
3437 C5        PUSH    BC
3438 11CD30    LD      DE,#30CD
343b CD5523    CALL    #2355
343e CD111C    CALL    #1C11
3441 E1        POP     HL
3442 3ADA30    LD      A,(#30DA)
3445 AE        XOR     (HL)
3446 77        LD      (HL),A
3447 C9        RET     

3448 15        DEC     D
3449 70        LD      (HL),B
344a 79        LD      A,C
344b 63        LD      H,E
344c 41        LD      B,C
344d 314159    LD      SP,#5941
3450 2641      LD      H,#41
3452 314100    LD      SP,#0041
3455 00        NOP     
3456 41        LD      B,C
3457 59        LD      E,C
3458 2653      LD      H,#53
345a 58        LD      E,B
345b 3D        DEC     A
345c 1666      LD      D,#66
345e 66        LD      H,(HL)
345f 57        LD      D,A
3460 C0        RET     NZ

3461 83        ADD     A,E
3462 33        INC     SP
3463 02        LD      (BC),A
3464 51        LD      D,C
3465 3E19      LD      A,#19
3467 80        ADD     A,B
3468 74        LD      (HL),H
3469 19        ADD     HL,DE
346a BD        CP      L
346b 2601      LD      H,#01
346d 90        SUB     B
346e 303B      JR      NC,#34AB
3470 1A        LD      A,(DE)
3471 B7        OR      A
3472 C8        RET     Z

3473 D5        PUSH    DE
3474 F5        PUSH    AF
3475 E67F      AND     #7F
3477 12        LD      (DE),A
3478 FE41      CP      #41
347a F5        PUSH    AF
347b DA9934    JP      C,#3499
347e D5        PUSH    DE
347f 214717    LD      HL,#1747
3482 11CD30    LD      DE,#30CD
3485 CDE41B    CALL    #1BE4
3488 01CD30    LD      BC,#30CD
348b D1        POP     DE
348c D5        PUSH    DE
348d CD6324    CALL    #2463
3490 21CD30    LD      HL,#30CD
3493 D1        POP     DE
3494 D5        PUSH    DE
3495 CDE41B    CALL    #1BE4
3498 D1        POP     DE
3499 D5        PUSH    DE
349a EB        EX      DE,HL
349b 11CD30    LD      DE,#30CD
349e CDE41B    CALL    #1BE4
34a1 01CD30    LD      BC,#30CD
34a4 D1        POP     DE
34a5 D5        PUSH    DE
34a6 CD3322    CALL    #2233
34a9 3E0A      LD      A,#0A
34ab 01CD30    LD      BC,#30CD
34ae 11D230    LD      DE,#30D2
34b1 211C35    LD      HL,#351C
34b4 CD8E18    CALL    #188E
34b7 01D230    LD      BC,#30D2
34ba D1        POP     DE
34bb CD3322    CALL    #2233
34be F1        POP     AF
34bf DAD334    JP      C,#34D3
34c2 01D230    LD      BC,#30D2
34c5 0A        LD      A,(BC)
34c6 B7        OR      A
34c7 CACD34    JP      Z,#34CD
34ca EE80      XOR     #80
34cc 02        LD      (BC),A
34cd 114C34    LD      DE,#344C
34d0 CD5523    CALL    #2355
34d3 F1        POP     AF
34d4 21D230    LD      HL,#30D2
34d7 F2E234    JP      P,#34E2
34da 7E        LD      A,(HL)
34db B7        OR      A
34dc CAE234    JP      Z,#34E2
34df EE80      XOR     #80
34e1 77        LD      (HL),A
34e2 D1        POP     DE
34e3 C3E41B    JP      #1BE4
34e6 99        SBC     A,C
34e7 99        SBC     A,C
34e8 99        SBC     A,C
34e9 99        SBC     A,C
34ea 40        LD      B,B
34eb 33        INC     SP
34ec 33        INC     SP
34ed 33        INC     SP
34ee 23        INC     HL
34ef C0        RET     NZ

34f0 19        ADD     HL,DE
34f1 99        SBC     A,C
34f2 96        SUB     (HL)
34f3 04        INC     B
34f4 40        LD      B,B
34f5 14        INC     D
34f6 27        DAA     
34f7 91        SUB     C
34f8 59        LD      E,C
34f9 C0        RET     NZ

34fa 110545    LD      DE,#4505
34fd 014087    LD      BC,#8740
3500 98        SBC     A,B
3501 77        LD      (HL),A
3502 26BF      LD      H,#BF
3504 67        LD      H,A
3505 1610      LD      D,#10
3507 95        SUB     L
3508 3F        CCF     
3509 44        LD      B,H
350a 35        DEC     (HL)
350b 75        LD      (HL),L
350c 33        INC     SP
350d BF        CP      A
350e 222743    LD      (#4327),HL
3511 94        SUB     H
3512 3F        CCF     
3513 71        LD      (HL),C
3514 99        SBC     A,C
3515 40        LD      B,B
3516 49        LD      C,C
3517 BE        CP      (HL)
3518 1091      DJNZ    #34AB
351a 11543E    LD      DE,#3E54
351d 00        NOP     
351e 00        NOP     
351f 00        NOP     

...

   
357d 00        NOP     
357e 00        NOP     
357f 00        NOP     
3580 2A0600    LD      HL,(#0006)
3583 2B        DEC     HL
3584 220901    LD      (#0109),HL
3587 21803F    LD      HL,#3F80
358a 220601    LD      (#0106),HL	
358d 11C935    LD      DE,#35C9		; DE = "NorthStar Basic Revision 5.2 for CP/M by InfoSoft  ( REV 00.08 )$"
3590 0E09      LD      C,#09		; OUTPUT String
3592 CD0500    CALL    #0005		; Call BDOS
3595 AF        XOR     A
3596 C30501    JP      #0105

3599 		db "(C) 1979 TSA SOFTWARE (C) 1980 INFOSOFT SYSTEMS "
35c9 		db "NorthStar Basic Revision 5.2 for CP/M by InfoSoft  ( REV 00.08 )$"

3610 7C        LD      A,H
3611 2F        CPL     
3612 67        LD      H,A
3613 7D        LD      A,L
3614 2F        CPL     
3615 6F        LD      L,A
3616 23        INC     HL
3617 C9        RET     

3618 3A7A2E    LD      A,(#2E7A)
361b C31F36    JP      #361F
361e AF        XOR     A
361f E5        PUSH    HL
3620 D5        PUSH    DE
3621 C5        PUSH    BC
3622 48        LD      C,B
3623 110C00    LD      DE,#000C ; BIOS PRINT - Send to printer char in RegC
3626 FE01      CP      #01
3628 CA4836    JP      Z,#3648
362b 110F00    LD      DE,#000F ; BIOS PUNCH - Send to paper punch char in RegC
362e FE02      CP      #02
3630 CA4836    JP      Z,#3648
3633 110900    LD      DE,#0009	; BIOS CONOUT - Send to console char in RegC
3636 C5        PUSH    BC
3637 CD8036    CALL    #3680	; JMP to BIOS func DE
363a C1        POP     BC
363b 110C00    LD      DE,#000C ; BIOS PRINT - Send to printer char in RegC
363e 3A5036    LD      A,(#3650)
3641 B7        OR      A
3642 C48036    CALL    NZ,#3680	; JMP to BIOS func DE
3645 C34B36    JP      #364B
3648 CD8036    CALL    #3680	; JMP to BIOS func DE
364b C1        POP     BC
364c D1        POP     DE
364d E1        POP     HL
364e 78        LD      A,B
364f C9        RET     


3650 00        NOP     

;Read char from Keyboard

3651 AF        XOR     A
3652 E5        PUSH    HL
3653 D5        PUSH    DE
3654 C5        PUSH    BC
3655 111200    LD      DE,#0012 ; BIOS PUNCH Reader - Read from paper punch char in RegA
3658 FE02      CP      #02
365a CA7736    JP      Z,#3677
365d 110600    LD      DE,#0006 ; BIOS CONIN - Console Input
3660 CD8036    CALL    #3680	; JMP to BIOS func DE
3663 E67F      AND     #7F
3665 FE10      CP      #10
3667 C27A36    JP      NZ,#367A
366a 215036    LD      HL,#3650
366d 7E        LD      A,(HL)
366e E601      AND     #01
3670 EE01      XOR     #01
3672 77        LD      (HL),A
3673 AF        XOR     A
3674 C37A36    JP      #367A
3677 CD8036    CALL    #3680	; JMP to BIOS func DE
367a C1        POP     BC
367b D1        POP     DE
367c E1        POP     HL
367d E67F      AND     #7F
367f C9        RET     

; JMP to BIOS func DE

3680 2A0100    LD      HL,(#0001)
3683 19        ADD     HL,DE
3684 E9        JP      (HL)
3685 C9        RET     

3686 110300    LD      DE,#0003 ; BIOS GetConsoleStatus
3689 CD8036    CALL    #3680	; JMP to BIOS func DE
368c E601      AND     #01
368e EE01      XOR     #01
3690 3E00      LD      A,#00
3692 C0        RET     NZ	; No char -> return A=0
3693 CD5136    CALL    #3651	;Read char from Keyboard
3696 FE03      CP      #03	; is ^C ?
3698 C8        RET     Z	; ^C -> RET Z
3699 FE13      CP      #13
369b C0        RET     NZ
369c CD5136    CALL    #3651	;Read char from Keyboard
369f FE03      CP      #03
36a1 C9        RET     

36a2 B7        OR      A
36a3 CAB536    JP      Z,#36B5  ; Read char from Keyboard in HL
36a6 7B        LD      A,E
36a7 B7        OR      A
36a8 CAB536    JP      Z,#36B5  ; Read char from Keyboard in HL
36ab CD8636    CALL    #3686 	; Read Keyboard
36ae 210000    LD      HL,#0000
36b1 B7        OR      A
36b2 C8        RET     Z
36b3 6F        LD      L,A
36b4 C9        RET     

; Read char from Keyboard in HL

36b5 CD5136    CALL    #3651	;Read char from Keyboard
36b8 6F        LD      L,A
36b9 2600      LD      H,#00
36bb C9        RET     

36bc 111200    LD      DE,#0012 ; BIOS PUNCH Reader - Read from paper punch char in RegA
36bf CD8036    CALL    #3680	; JMP to BIOS func DE
36c2 2600      LD      H,#00
36c4 6F        LD      L,A
36c5 C9        RET     

36c6 110F00    LD      DE,#000F ;printer out
36c9 4B        LD      C,E
36ca CD8036    CALL    #3680	; JMP to BIOS func DE
36cd C9        RET     

36ce 4B        LD      C,E
36cf 110C00    LD      DE,#000C ; paper out
36d2 CD8036    CALL    #3680	; JMP to BIOS func DE
36d5 C9        RET     

36d6 B7        OR      A
36d7 CAEA36    JP      Z,#36EA
36da 7A        LD      A,D
36db B7        OR      A
36dc C2B202    JP      NZ,#02B2
36df 7B        LD      A,E
36e0 E6F8      AND     #F8
36e2 C2B202    JP      NZ,#02B2
36e5 7B        LD      A,E
36e6 3D        DEC     A
36e7 F2EF36    JP      P,#36EF
36ea 0E19      LD      C,#19		; Return current drive
36ec CD0500    CALL    #0005		; Call BDOS
36ef F5        PUSH    AF
36f0 0E0D      LD      C,#0D		; Reset discs
36f2 CD0500    CALL    #0005		; Call BDOS
36f5 F1        POP     AF
36f6 B7        OR      A
36f7 C8        RET     Z

36f8 5F        LD      E,A
36f9 0E0E      LD      C,#0E		; Select Disk
36fb CD0500    CALL    #0005		; Call BDOS
36fe C9        RET     

36ff B7        OR      A
3700 C20637    JP      NZ,#3706
3703 110000    LD      DE,#0000
3706 0E8E      LD      C,#8E		; ?¿?¿¿?¿ MP/M - Call Dispatcher - yields cpu
3708 CD0500    CALL    #0005		; Call BDOS
370b C9        RET     

370c 212416    LD      HL,#1624
370f E5        PUSH    HL
3710 CDB71E    CALL    #1EB7
3713 D5        PUSH    DE
3714 CDA31C    CALL    #1CA3
3717 210000    LD      HL,#0000
371a 110000    LD      DE,#0000
371d 3E00      LD      A,#00
371f C23A37    JP      NZ,#373A
3722 CDB71E    CALL    #1EB7
3725 D5        PUSH    DE
3726 CDA31C    CALL    #1CA3
3729 D1        POP     DE
372a 3E01      LD      A,#01
372c 210000    LD      HL,#0000
372f C23A37    JP      NZ,#373A
3732 D5        PUSH    DE
3733 CDB71E    CALL    #1EB7
3736 E1        POP     HL
3737 EB        EX      DE,HL
3738 3E02      LD      A,#02
373a E3        EX      (SP),HL
373b D5        PUSH    DE
373c F5        PUSH    AF
373d 7C        LD      A,H
373e B5        OR      L
373f C24B37    JP      NZ,#374B
3742 D1        POP     DE
3743 E1        POP     HL
3744 F1        POP     AF
3745 214937    LD      HL,#3749
3748 C9        RET     

3749 80        ADD     A,B
374a 3EC3      LD      A,#C3
374c 5D        LD      E,L
374d 37        SCF     
374e 7C        LD      A,H
374f B7        OR      A
3750 C25937    JP      NZ,#3759
3753 7D        LD      A,L
3754 E680      AND     #80
3756 CA5D37    JP      Z,#375D
3759 F1        POP     AF
375a D1        POP     DE
375b E3        EX      (SP),HL
375c C9        RET     

375d EB        EX      DE,HL
375e 2A4937    LD      HL,(#3749)
3761 7A        LD      A,D
3762 B7        OR      A
3763 C2B202    JP      NZ,#02B2
3766 7E        LD      A,(HL)
3767 BB        CP      E
3768 DAB202    JP      C,#02B2
376b 1B        DEC     DE
376c 23        INC     HL
376d 19        ADD     HL,DE
376e 19        ADD     HL,DE
376f 19        ADD     HL,DE
3770 F1        POP     AF
3771 D1        POP     DE
3772 E3        EX      (SP),HL
3773 C9        RET     

3774 C2B202    JP      NZ,#02B2
3777 7B        LD      A,E
3778 32943C    LD      (#3C94),A
377b C9        RET     

377c CD452D    CALL    #2D45
377f CDF838    CALL    #38F8
3782 C9        RET     

; Print Disk Read Error and exit to CP/M

3783 118E37    LD      DE,#378E
3786 0E09      LD      C,#09		; Print String
3788 CD0500    CALL    #0005		; Call BDOS
378b C30000    JP      #0000		; WBOOT

378e 44        db "DISK READ ERROR$"

379e FECD      CP      #CD
37a0 CA0F16    JP      Z,#160F
37a3 FEE1      CP      #E1
37a5 C21D12    JP      NZ,#121D
37a8 CD951C    CALL    #1C95
37ab CDDC19    CALL    #19DC
37ae CDA11E    CALL    #1EA1
37b1 C33412    JP      #1234
37b4 CD2A38    CALL    #382A
37b7 D8        RET     C

37b8 E5        PUSH    HL
37b9 D5        PUSH    DE
37ba 0E1A      LD      C,#1A		; Set DMA Addr
37bc 118000    LD      DE,#0080
37bf CD0500    CALL    #0005		; Call BDOS
37c2 D1        POP     DE
37c3 D5        PUSH    DE
37c4 3A903C    LD      A,(#3C90)
37c7 B7        OR      A
37c8 C2DA37    JP      NZ,#37DA
37cb 0E13      LD      C,#13		; Delete File
37cd CD0500    CALL    #0005		; Call BDOS
37d0 D1        POP     DE
37d1 0E16      LD      C,#16		; Create File
37d3 CD0500    CALL    #0005		; Call BDOS
37d6 E1        POP     HL
37d7 C3EF37    JP      #37EF
37da 0E0F      LD      C,#0F
37dc CD0500    CALL    #
37df D1        POP     DE
37e0 E1        POP     HL
37e1 F5        PUSH    AF
37e2 7E        LD      A,(HL)
37e3 FE80      CP      #80
37e5 CCFB37    CALL    Z,#37FB
37e8 0F        RRCA    
37e9 E67F      AND     #7F
37eb 32053E    LD      (#3E05),A
37ee F1        POP     AF
37ef FEFF      CP      #FF
37f1 21003E    LD      HL,#3E00
37f4 3E00      LD      A,#00
37f6 3F        CCF     
37f7 D0        RET     NC

37f8 3E01      LD      A,#01
37fa C9        RET     

37fb 3A903C    LD      A,(#3C90)
37fe 3D        DEC     A
37ff 7E        LD      A,(HL)
3800 C0        RET     NZ

3801 E5        PUSH    HL
3802 D5        PUSH    DE
3803 C5        PUSH    BC
3804 E5        PUSH    HL
3805 210C00    LD      HL,#000C
3808 19        ADD     HL,DE
3809 3601      LD      (HL),#01
380b E5        PUSH    HL
380c D5        PUSH    DE
380d 0E0F      LD      C,#0F		; Open File
380f CD0500    CALL    #0005		; Call BDOS
3812 D1        POP     DE
3813 3C        INC     A
3814 CAD802    JP      Z,#02D8
3817 E1        POP     HL
3818 E3        EX      (SP),HL
3819 7E        LD      A,(HL)
381a F680      OR      #80
381c E1        POP     HL
381d 3600      LD      (HL),#00
381f F5        PUSH    AF
3820 0E0F      LD      C,#0F		; Open File
3822 CD0500    CALL    #0005		; Call BDOS
3825 F1        POP     AF
3826 C1        POP     BC
3827 D1        POP     DE
3828 E1        POP     HL
3829 C9        RET     

382a E5        PUSH    HL
382b 32903C    LD      (#3C90),A
382e FE02      CP      #02
3830 CA5B38    JP      Z,#385B
3833 3EFF      LD      A,#FF
3835 32943C    LD      (#3C94),A
3838 3E02      LD      A,#02
383a 11D73C    LD      DE,#3CD7
383d 01953C    LD      BC,#3C95
3840 E1        POP     HL
3841 32043E    LD      (#3E04),A
3844 D5        PUSH    DE
3845 CD7938    CALL    #3879
3848 D1        POP     DE
3849 210000    LD      HL,#0000
384c 22003E    LD      (#3E00),HL
384f 210C00    LD      HL,#000C
3852 19        ADD     HL,DE
3853 3600      LD      (HL),#00
3855 210F00    LD      HL,#000F
3858 19        ADD     HL,DE
3859 AF        XOR     A
385a C9        RET     

385b CD6638    CALL    #3866
385e 3E03      LD      A,#03
3860 01B63C    LD      BC,#3CB6
3863 C34038    JP      #3840
3866 3A943C    LD      A,(#3C94)
3869 3C        INC     A
386a 5F        LD      E,A
386b 1600      LD      D,#00
386d 012100    LD      BC,#0021
3870 CD821F    CALL    #1F82
3873 11D73C    LD      DE,#3CD7
3876 19        ADD     HL,DE
3877 EB        EX      DE,HL
3878 C9        RET     

3879 E5        PUSH    HL
387a D5        PUSH    DE
387b 2621      LD      H,#21
387d 0A        LD      A,(BC)
387e 12        LD      (DE),A
387f 13        INC     DE
3880 03        INC     BC
3881 25        DEC     H
3882 C27D38    JP      NZ,#387D
3885 D1        POP     DE
3886 E1        POP     HL
3887 D5        PUSH    DE
3888 23        INC     HL
3889 7E        LD      A,(HL)
388a 2B        DEC     HL
388b FE3A      CP      #3A
388d CA9538    JP      Z,#3895
3890 FE5C      CP      #5C
3892 C29B38    JP      NZ,#389B
3895 7E        LD      A,(HL)
3896 23        INC     HL
3897 23        INC     HL
3898 D640      SUB     #40
389a 12        LD      (DE),A
389b 13        INC     DE
389c 0608      LD      B,#08
389e CDCA38    CALL    #38CA
38a1 7E        LD      A,(HL)
38a2 FE2E      CP      #2E
38a4 C2AD38    JP      NZ,#38AD
38a7 23        INC     HL
38a8 0603      LD      B,#03
38aa CDCA38    CALL    #38CA
38ad 7E        LD      A,(HL)
38ae FE2C      CP      #2C
38b0 D1        POP     DE
38b1 C0        RET     NZ

38b2 23        INC     HL
38b3 7E        LD      A,(HL)
38b4 D630      SUB     #30
38b6 D8        RET     C

38b7 FE08      CP      #08
38b9 D0        RET     NC

38ba 12        LD      (DE),A
38bb C9        RET     

38bc FE2C      CP      #2C
38be C8        RET     Z

38bf FE2E      CP      #2E
38c1 C8        RET     Z

38c2 FE21      CP      #21
38c4 CAC838    JP      Z,#38C8
38c7 D0        RET     NC

38c8 BF        CP      A
38c9 C9        RET     

38ca 7E        LD      A,(HL)
38cb CDBC38    CALL    #38BC
38ce CAE038    JP      Z,#38E0
38d1 FE2A      CP      #2A
38d3 CAE538    JP      Z,#38E5
38d6 12        LD      (DE),A
38d7 13        INC     DE
38d8 23        INC     HL
38d9 05        DEC     B
38da C2CA38    JP      NZ,#38CA
38dd C3ED38    JP      #38ED
38e0 3E20      LD      A,#20
38e2 C3E738    JP      #38E7
38e5 3E3F      LD      A,#3F
38e7 12        LD      (DE),A
38e8 13        INC     DE
38e9 05        DEC     B
38ea C2E738    JP      NZ,#38E7
38ed 7E        LD      A,(HL)
38ee CDBC38    CALL    #38BC
38f1 23        INC     HL
38f2 C2ED38    JP      NZ,#38ED
38f5 2B        DEC     HL
38f6 C9        RET     

38f7 C9        RET     

38f8 118000    LD      DE,#0080
38fb 0E1A      LD      C,#1A		; Set DMA Addr
38fd CD0500    CALL    #0005		; Call BDOS
3900 CD6638    CALL    #3866
3903 0E10      LD      C,#10		; Close File
3905 CD0500    CALL    #0005		; Call BDOS
3908 FEFF      CP      #FF
390a CAD802    JP      Z,#02D8
390d C9        RET     

390e 32933C    LD      (#3C93),A
3911 78        LD      A,B
3912 FE02      CP      #02
3914 37        SCF     
3915 3F        CCF     
3916 C8        RET     Z

3917 32903C    LD      (#3C90),A
391a 29        ADD     HL,HL
391b 228E3C    LD      (#3C8E),HL
391e EB        EX      DE,HL
391f 228C3C    LD      (#3C8C),HL
3922 CD6638    CALL    #3866
3925 EB        EX      DE,HL
3926 22913C    LD      (#3C91),HL
3929 2A8C3C    LD      HL,(#3C8C)
392c E5        PUSH    HL
392d CD5039    CALL    #3950
3930 E1        POP     HL
3931 118000    LD      DE,#0080
3934 19        ADD     HL,DE
3935 E5        PUSH    HL
3936 CD5039    CALL    #3950
3939 D1        POP     DE
393a 218000    LD      HL,#0080
393d 19        ADD     HL,DE
393e EB        EX      DE,HL
393f 21933C    LD      HL,#3C93
3942 35        DEC     (HL)
3943 EB        EX      DE,HL
3944 C22C39    JP      NZ,#392C
3947 3A943C    LD      A,(#3C94)
394a B7        OR      A
394b FCF838    CALL    M,#38F8
394e AF        XOR     A
394f C9        RET     

3950 E5        PUSH    HL
3951 2A8E3C    LD      HL,(#3C8E)
3954 7D        LD      A,L
3955 E67F      AND     #7F
3957 4F        LD      C,A
3958 29        ADD     HL,HL
3959 7C        LD      A,H
395a 2A913C    LD      HL,(#3C91)
395d EB        EX      DE,HL
395e 212000    LD      HL,#0020
3961 19        ADD     HL,DE
3962 71        LD      (HL),C
3963 210C00    LD      HL,#000C
3966 19        ADD     HL,DE
3967 BE        CP      (HL)
3968 CAA239    JP      Z,#39A2
396b E5        PUSH    HL
396c F5        PUSH    AF
396d 118000    LD      DE,#0080
3970 0E1A      LD      C,#1A		; Set DMA Addr
3972 CD0500    CALL    #0005		; Call BDOS
3975 2A913C    LD      HL,(#3C91)
3978 EB        EX      DE,HL
3979 D5        PUSH    DE
397a 0E10      LD      C,#10		; Close File
397c CD0500    CALL    #0005		; Call BDOS
397f D1        POP     DE
3980 F1        POP     AF
3981 E1        POP     HL
3982 77        LD      (HL),A
3983 0E0F      LD      C,#0F		; Open File
3985 CD0500    CALL    #0005		; Call BDOS
3988 FEFF      CP      #FF
398a C2A239    JP      NZ,#39A2
398d 3A903C    LD      A,(#3C90)
3990 B7        OR      A
3991 C2D802    JP      NZ,#02D8
3994 2A913C    LD      HL,(#3C91)
3997 EB        EX      DE,HL
3998 0E16      LD      C,#16		; Create File
399a CD0500    CALL    #0005		; Call BDOS
399d FEFF      CP      #FF
399f CAD802    JP      Z,#02D8
39a2 D1        POP     DE
39a3 0E1A      LD      C,#1A		; Set DMA Addr
39a5 CD0500    CALL    #0005		; Call BDOS
39a8 2A913C    LD      HL,(#3C91)
39ab EB        EX      DE,HL
39ac 3A903C    LD      A,(#3C90)
39af B7        OR      A
39b0 CAC039    JP      Z,#39C0
39b3 0E14      LD      C,#14		; Read Next Record 
39b5 CD0500    CALL    #0005		; Call BDOS
39b8 FEFF      CP      #FF
39ba CAD802    JP      Z,#02D8
39bd C3323A    JP      #3A32
39c0 0E15      LD      C,#15		; Write next record
39c2 CD0500    CALL    #0005		; Call BDOS
39c5 FEFF      CP      #FF
39c7 11FC39    LD      DE,#39FC		; str "OUT OF DIRECTORY SPACE
39ca CADC39    JP      Z,#39DC
39cd FE02      CP      #02
39cf 11E439    LD      DE,#39E4		; str "OUT OF DISK SPACE
39d2 CADC39    JP      Z,#39DC
39d5 B7        OR      A
39d6 CA323A    JP      Z,#3A32
39d9 111A3A    LD      DE,#3A1A		; str "DISK WRITE ERROR"
39dc 0E09      LD      C,#09		; OutPut String
39de CD0500    CALL    #0005		; Call BDOS
39e1 C3D802    JP      #02D8

39e4 		db 0D, 0A, "OUT OF DISK SPACE    $"
39fc 		db 0D, 0A, "OUT OF DIRECTORY SPACE     $"
3a1a 		db 0D, 0A, "DISK WRITE ERROR     $"

3a32 2A8E3C    LD      HL,(#3C8E)
3a35 23        INC     HL
3a36 228E3C    LD      (#3C8E),HL
3a39 C9        RET     

3a3a 11553C    LD      DE,#3C55
3a3d 01343C    LD      BC,#3C34
3a40 CD7938    CALL    #3879
3a43 11553C    LD      DE,#3C55
3a46 0E11      LD      C,#11		; Search for firts
3a48 CD0500    CALL    #0005		; Call BDOS
3a4b 21843C    LD      HL,#3C84
3a4e FEFF      CP      #FF
3a50 C2553A    JP      NZ,#3A55
3a53 07        RLCA    
3a54 C9        RET     

3a55 AF        XOR     A
3a56 C9        RET     

3a57 11553C    LD      DE,#3C55
3a5a 01343C    LD      BC,#3C34
3a5d CD7938    CALL    #3879
3a60 0E13      LD      C,#13		; Delete file
3a62 11553C    LD      DE,#3C55		; FCB
3a65 CD0500    CALL    #0005		; Call BDOS
3a68 C9        RET     

3a69 CD951C    CALL    #1C95
3a6c 7E        LD      A,(HL)
3a6d FE3A      CP      #3A
3a6f C27E3A    JP      NZ,#3A7E
3a72 2B        DEC     HL
3a73 7E        LD      A,(HL)
3a74 D640      SUB     #40
3a76 5F        LD      E,A
3a77 1600      LD      D,#00
3a79 3E01      LD      A,#01
3a7b C3D636    JP      #36D6
3a7e AF        XOR     A
3a7f C3D636    JP      #36D6
3a82 F5        PUSH    AF
3a83 11553C    LD      DE,#3C55
3a86 01B63C    LD      BC,#3CB6
3a89 CD7938    CALL    #3879
3a8c F1        POP     AF
3a8d AF        XOR     A
3a8e 32613C    LD      (#3C61),A
3a91 CDA31C    CALL    #1CA3
3a94 C2C43A    JP      NZ,#3AC4
3a97 CDB71E    CALL    #1EB7
3a9a CDA31C    CALL    #1CA3
3a9d C2C43A    JP      NZ,#3AC4
3aa0 CDB71E    CALL    #1EB7
3aa3 7B        LD      A,E
3aa4 FE01      CP      #01
3aa6 C2AF3A    JP      NZ,#3AAF
3aa9 11CD3A    LD      DE,#3ACD
3aac C3B73A    JP      #3AB7
3aaf FE02      CP      #02
3ab1 C2C43A    JP      NZ,#3AC4
3ab4 11D03A    LD      DE,#3AD0 	; "NBP" extension
3ab7 0603      LD      B,#03
3ab9 215E3C    LD      HL,#3C5E
3abc 1A        LD      A,(DE)
3abd 77        LD      (HL),A
3abe 13        INC     DE
3abf 23        INC     HL
3ac0 05        DEC     B
3ac1 C2BC3A    JP      NZ,#3ABC
3ac4 11553C    LD      DE,#3C55
3ac7 0E16      LD      C,#16		; Create file
3ac9 CD0500    CALL    #0005		; Call BDOS
3acc C9        RET     

3acd 		db "ABS"
3ad0 		db "NBP"
3ad3  		db "NDT"

3ad6 0E1A      LD      C,#1A		: Ste DMA Addr
3ad8 118000    LD      DE,#0080
3adb CD0500    CALL    #0005		; Call BDOS
3ade CD0722    CALL    #2207
3ae1 CD951C    CALL    #1C95
3ae4 2B        DEC     HL
3ae5 11553C    LD      DE,#3C55
3ae8 01343C    LD      BC,#3C34
3aeb CD7938    CALL    #3879
3aee 3A563C    LD      A,(#3C56)
3af1 FE20      CP      #20
3af3 C20A3B    JP      NZ,#3B0A
3af6 3A553C    LD      A,(#3C55)
3af9 F5        PUSH    AF
3afa 21293C    LD      HL,#3C29		; "*.N??"
3afd 11553C    LD      DE,#3C55
3b00 01343C    LD      BC,#3C34
3b03 CD7938    CALL    #3879
3b06 F1        POP     AF
3b07 32553C    LD      (#3C55),A
3b0a AF        XOR     A
3b0b 320C3C    LD      (#3C0C),A
3b0e 21223C    LD      HL,#3C22		; str "DISK: "
3b11 CDDF3B    CALL    #3BDF
3b14 3A553C    LD      A,(#3C55)
3b17 B7        OR      A
3b18 C2213B    JP      NZ,#3B21
3b1b 0E19      LD      C,#19		; Return current drive
3b1d CD0500    CALL    #0005		; Call BDOS
3b20 3C        INC     A
3b21 C640      ADD     A,#40
3b23 47        LD      B,A
3b24 CD1836    CALL    #3618
3b27 CDD23B    CALL    #3BD2
3b2a 0E11      LD      C,#11		; Search for first
3b2c C5        PUSH    BC
3b2d 11553C    LD      DE,#3C55
3b30 CD0500    CALL    #0005		; Call BDOS
3b33 C1        POP     BC
3b34 FEFF      CP      #FF
3b36 CA5B3B    JP      Z,#3B5B
3b39 E603      AND     #03
3b3b 17        RLA     
3b3c 17        RLA     
3b3d 17        RLA     
3b3e 17        RLA     
3b3f 17        RLA     
3b40 5F        LD      E,A
3b41 1600      LD      D,#00
3b43 218000    LD      HL,#0080
3b46 19        ADD     HL,DE
3b47 E5        PUSH    HL
3b48 110F00    LD      DE,#000F
3b4b 19        ADD     HL,DE
3b4c 7E        LD      A,(HL)
3b4d E1        POP     HL
3b4e FE80      CP      #80
3b50 CA563B    JP      Z,#3B56
3b53 CD6B3B    CALL    #3B6B
3b56 0E12      LD      C,#12
3b58 C32C3B    JP      #3B2C
3b5b 78        LD      A,B
3b5c FE11      CP      #11
3b5e C2673B    JP      NZ,#3B67
3b61 21123C    LD      HL,#3C12		; str "FILE NOT FOUND"
3b64 CDDF3B    CALL    #3BDF
3b67 CDD23B    CALL    #3BD2
3b6a C9        RET     

3b6b F5        PUSH    AF
3b6c 23        INC     HL
3b6d 1608      LD      D,#08
3b6f CDC83B    CALL    #3BC8
3b72 062E      LD      B,#2E
3b74 CD1836    CALL    #3618
3b77 1603      LD      D,#03
3b79 CDC83B    CALL    #3BC8
3b7c F1        POP     AF
3b7d C607      ADD     A,#07
3b7f E6F8      AND     #F8
3b81 1F        RRA     
3b82 1F        RRA     
3b83 1F        RRA     
3b84 0600      LD      B,#00
3b86 4F        LD      C,A
3b87 C5        PUSH    BC
3b88 6E        LD      L,(HL)
3b89 2600      LD      H,#00
3b8b 29        ADD     HL,HL
3b8c 29        ADD     HL,HL
3b8d 29        ADD     HL,HL
3b8e 29        ADD     HL,HL
3b8f C1        POP     BC
3b90 09        ADD     HL,BC
3b91 112F3C    LD      DE,#3C2F
3b94 7B        LD      A,E
3b95 F5        PUSH    AF
3b96 CD0620    CALL    #2006
3b99 C1        POP     BC
3b9a 7B        LD      A,E
3b9b 90        SUB     B
3b9c F2A23B    JP      P,#3BA2
3b9f 47        LD      B,A
3ba0 AF        XOR     A
3ba1 90        SUB     B
3ba2 212F3C    LD      HL,#3C2F
3ba5 CDFA3B    CALL    #3BFA
3ba8 46        LD      B,(HL)
3ba9 F5        PUSH    AF
3baa CD1836    CALL    #3618
3bad F1        POP     AF
3bae 23        INC     HL
3baf 3D        DEC     A
3bb0 C2A83B    JP      NZ,#3BA8
3bb3 064B      LD      B,#4B
3bb5 CD1836    CALL    #3618
3bb8 3A0C3C    LD      A,(#3C0C)
3bbb FE02      CP      #02
3bbd C4EC3B    CALL    NZ,#3BEC
3bc0 CCD23B    CALL    Z,#3BD2
3bc3 3C        INC     A
3bc4 320C3C    LD      (#3C0C),A
3bc7 C9        RET     

3bc8 46        LD      B,(HL)
3bc9 CD1836    CALL    #3618
3bcc 23        INC     HL
3bcd 15        DEC     D
3bce C2C83B    JP      NZ,#3BC8
3bd1 C9        RET     

3bd2 060D      LD      B,#0D
3bd4 CD1836    CALL    #3618
3bd7 060A      LD      B,#0A
3bd9 CD1836    CALL    #3618
3bdc 3EFF      LD      A,#FF
3bde C9        RET     

3bdf 7E        LD      A,(HL)
3be0 B7        OR      A
3be1 C8        RET     Z

3be2 E5        PUSH    HL
3be3 47        LD      B,A
3be4 CD1836    CALL    #3618
3be7 E1        POP     HL
3be8 23        INC     HL
3be9 C3DF3B    JP      #3BDF
3bec F5        PUSH    AF
3bed 0E04      LD      C,#04
3bef 0620      LD      B,#20
3bf1 CD1836    CALL    #3618
3bf4 0D        DEC     C
3bf5 C2F13B    JP      NZ,#3BF1
3bf8 F1        POP     AF
3bf9 C9        RET     

3bfa 47        LD      B,A
3bfb F5        PUSH    AF
3bfc 3E06      LD      A,#06
3bfe 90        SUB     B
3bff 0620      LD      B,#20
3c01 F5        PUSH    AF
3c02 CD1836    CALL    #3618
3c05 F1        POP     AF
3c06 3D        DEC     A
3c07 C2013C    JP      NZ,#3C01
3c0a F1        POP     AF
3c0b C9        RET     


3c0c 00        NOP     
3c0d 		db "     $"
3c12 		db "FILE NOT FOUND ",0
3c22 		db "DISK: ", 0
3c29		db "*.N??", 0
3c2f 		db "; CLO", 0

3c37 2020      JR      NZ,#3C59
3c39 2020      JR      NZ,#3C5B
3c3b 2020      JR      NZ,#3C5D

...

4100 1A        LD      A,(DE)
4101 B7        OR      A
4102 C23D22    JP      NZ,#223D
4105 02        LD      (BC),A
4106 C9        RET     

4107 C5        PUSH    BC
4108 D5        PUSH    DE
4109 211531    LD      HL,#3115
410c 3E08      LD      A,#08
410e 3600      LD      (HL),#00
4110 2B        DEC     HL
4111 3D        DEC     A
4112 C24422    JP      NZ,#2244
4115 AF        XOR     A
4116 211D31    LD      HL,#311D
4119 CDD122    CALL    #22D1
411c 3E04      LD      A,#04
411e 211531    LD      HL,#3115
4121 1B        DEC     DE
4122 F5        PUSH    AF
4123 0B        DEC     BC
4124 C5        PUSH    BC
4125 D5        PUSH    DE
4126 0A        LD      A,(BC)
4127 F5        PUSH    AF
4128 E60F      AND     #0F
412a CA7322    JP      Z,#2273
412d 0604      LD      B,#04
412f 4F        LD      C,A
4130 E5        PUSH    HL
4131 CD2E23    CALL    #232E
4134 3E00      LD      A,#00
4136 8E        ADC     A,(HL)
4137 77        LD      (HL),A
4138 E1        POP     HL
4139 0D        DEC     C
413a C26622    JP      NZ,#2266
413d F1        POP     AF
413e 1F        RRA     
413f 1F        RRA     
4140 1F        RRA     
4141 1F        RRA     
4142 E60F      AND     #0F
4144 CA8C22    JP      Z,#228C
4147 0605      LD      B,#05
4149 111C31    LD      DE,#311C
414c 4F        LD      C,A
414d E5        PUSH    HL
414e CD2E23    CALL    #232E
4151 E1        POP     HL
4152 0D        DEC     C
4153 C28322    JP      NZ,#2283
4156 D1        POP     DE
4157 C1        POP     BC
4158 F1        POP     AF
4159 2B        DEC     HL
415a 3D        DEC     A
415b C25822    JP      NZ,#2258
415e 110E31    LD      DE,#310E
4161 CDF522    CALL    #22F5
4164 0E00      LD      C,#00
4166 110E31    LD      DE,#310E
4169 CD2023    CALL    #2320
416c D1        POP     DE
416d E1        POP     HL
416e 1A        LD      A,(DE)
416f E67F      AND     #7F
4171 47        LD      B,A
4172 7E        LD      A,(HL)
4173 E67F      AND     #7F
4175 80        ADD     A,B
4176 81        ADD     A,C
4177 D640      SUB     #40
4179 CAC822    JP      Z,#22C8
417c F2C222    JP      P,#22C2
417f 17        RLA     
4180 B7        OR      A
4181 3E00      LD      A,#00
4183 FAC822    JP      M,#22C8
4186 01AB04    LD      BC,#04AB
4189 C3F102    JP      #02F1
418c 47        LD      B,A
418d 1A        LD      A,(DE)
418e AE        XOR     (HL)
418f E680      AND     #80
4191 B0        OR      B
4192 111231    LD      DE,#3112
4195 12        LD      (DE),A
4196 EB        EX      DE,HL
4197 C3E41B    JP      #1BE4
419a 1A        LD      A,(DE)
419b D5        PUSH    DE
419c C5        PUSH    BC
419d 0604      LD      B,#04
419f E6F0      AND     #F0
41a1 4F        LD      C,A
41a2 1B        DEC     DE
41a3 1A        LD      A,(DE)
41a4 F5        PUSH    AF
41a5 E60F      AND     #0F
41a7 B1        OR      C
41a8 07        RLCA    
41a9 07        RLCA    
41aa 07        RLCA    
41ab 07        RLCA    
41ac 2B        DEC     HL
41ad 77        LD      (HL),A
41ae F1        POP     AF
41af 05        DEC     B
41b0 C2D522    JP      NZ,#22D5
41b3 E6F0      AND     #F0
41b5 C1        POP     BC
41b6 D1        POP     DE
41b7 C8        RET     Z

41b8 07        RLCA    
41b9 07        RLCA    
41ba 07        RLCA    
41bb 07        RLCA    
41bc 2B        DEC     HL
41bd 77        LD      (HL),A
41be C9        RET     

41bf 1A        LD      A,(DE)
41c0 E6F0      AND     #F0
41c2 210400    LD      HL,#0004
41c5 19        ADD     HL,DE
41c6 7E        LD      A,(HL)
41c7 CA0B23    JP      Z,#230B
41ca FE50      CP      #50
41cc D8        RET     C

41cd 2B        DEC     HL
41ce 0E04      LD      C,#04
41d0 3E01      LD      A,#01
41d2 C31423    JP      #2314
41d5 E60F      AND     #0F
41d7 FE05      CP      #05
41d9 D8        RET     C

41da 0E05      LD      C,#05
41dc 3E10      LD      A,#10
41de 86        ADD     A,(HL)
41df 27        DAA     
41e0 77        LD      (HL),A
41e1 D0        RET     NC

41e2 2B        DEC     HL
41e3 0D        DEC     C
41e4 3E01      LD      A,#01
41e6 C21423    JP      NZ,#2314
41e9 C9        RET     

41ea 1A        LD      A,(DE)
41eb E6F0      AND     #F0
41ed C0        RET     NZ

41ee 0D        DEC     C
41ef 210400    LD      HL,#0004
41f2 19        ADD     HL,DE
41f3 54        LD      D,H
41f4 5D        LD      E,L
41f5 C3D022    JP      #22D0
41f8 C5        PUSH    BC
41f9 D5        PUSH    DE
41fa B7        OR      A
41fb 1A        LD      A,(DE)
41fc 8E        ADC     A,(HL)
41fd 27        DAA     
41fe 77        LD      (HL),A
41ff 2B        DEC     HL
4200 00        NOP     
