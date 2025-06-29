; Disassembly of the file "D:\xxx\dl\trs80\dZ80\PAS32K.BIN"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Thursday, 18 of February 2016 at 12:02 AM
; 

PAS32K.BIN se carga en $4090
Start #473A

;4090 21904D    LD      HL,#4D90 - initial bootstrap code
;4093 119040    LD      DE,#4090
;4096 010009    LD      BC,#0900
;4099 EDB0      LDIR    
409b C33A47    JP      #473A

409c db 0000; addr of next char form monitor command line (reuse the mem address)

409e db "FORMAT ERROR",0
40ab db 1C, 1F, 00
40ae db 1C, 1F, "TINY PASCAL V-1.0", 0
40c2 db "COMPILER", 0
40cb db "EDITOR", 0
40d2 db "SOURCE", 0
40d9 db "P-CODE"
40DF db " NOT IN MEMORY",0
40ee db 0D, 0E, 2E, 00

40f2 db 0 ; command line buffer
40fe db 0, 0        

; Entry point table for PCode

4100 db 4267
4102 db 42A7
4104 db 42A0
4106 db 42C0
4108 db 42B9
410a db 42DA
410d db 42D3
410e db 42F2
4111 db 42EB
4112 db 4318
4114 db 430E
4116 db 4271 ; INT=22
4118 db 423C ; JMP=24
411a db 422A ; JPC0=26
411d db 4236 ; JPC1=28
411e db 425F
4120 db 433D
4122 db 4347
4124 db 4353
4126 db 435E
4128 db 4366
412a db 429A
412c db 429D
412e db 442D; RET0=46
4130 db 44B7
4132 44A3
4134 44A9
4136 44CD
4139 44E2
413a 454A
413c 454B
413e 4557 
4140 4567 
4142 4591 
4144 456B 
4146 4597 
4148 459D 
414a 45A3 
414c 45AE 
414e 45B9 
4150 45C2
4153 45D6
4154 45EC
4157 45F6
4158 4600     
415a 436F     
415c db 4378; OUTCH=92; 
415e 438E     
4160 4402     
4162 460A     
4164 463D     
4166 db 4659  ; OUTSTR=102   
4168 4668     
416a 4671     
416c 467D     
416e db 4686 ; PLOT=110
4170 db 46A0 ; POINT=112
4172 46EE
4174 46FD
4177 4717

4178 00        NOP     
4179 00        NOP     
417a 00        NOP     
417b 00        NOP     
417c 00        NOP     
417d 00        NOP     
417e 00        NOP     
417f 00        NOP    

; System Control Block
 
4180 db 73F0 ; Start Of Pascal Source Text Code
4182 db 0000 ; End of source text
4184 db 0000 ; MADDR = Start of PCode program 
4186 db 0000 ; EADDR = End of PCode Program (points to last byte of PCode program)
4188 db 5690 ; Address of editor: Start of Editor PCode program
418a db 5FC0 ; Address of compiler: Start of Compiler PCode program

418c db 73F0  (Start Of Pascal Source Text Code used by editor)  
418e db 4990 ; Start of pcode runtime stack  
4190 db BFFF ; End of pcode runtime stack  
4192 db BFFF ; End of RAM
4194 db 4743 ; Monitor Entry Point

4196 db 0000 ; start addr of program currently in execution (KADDR)
4198 db 0000 ; on executing a PCode program, containd -End of runtime stack
419a 00        (Overflow flag?)    
419b 00        NOP     
419c 00        NOP     
419d 00        NOP     
419e 00        NOP     
419f 00        NOP     
41a0 C3B241    JP      #41B2 ; JMP to console in (wait for key press)
41a3 C3BC41    JP      #41BC ; JMP to counsole out (print one char)
41a6 C3C441    JP      #41C4 ; JMP to console in (nonblocking read key)

41a9 4C        LD      C,H
41aa 45        LD      B,L
41ab 0D        DEC     C
41ac 2A764B    LD      HL,(#4B76)
41af CD0000    CALL    #0000

; console in (wait for key press)

41b2 CDA641    CALL    #41A6     ; console in (nonblocking read key)
41b5 CA4347    JP      Z,#4743   ; return to monitor main loop
41b8 B7        OR      A
41b9 28F7      JR      Z,#41B2
41bb C9        RET     

; counsole out (print one char)

41bc D5        PUSH    DE
41bd FE0A      CP      #0A
41bf C43300    CALL    NZ,#0033
41c2 D1        POP     DE
41c3 C9        RET     

; console in (nonblocking read key)

41c4 D5        PUSH    DE
41c5 CD2B00    CALL    #002B
41c8 FE01      CP      #01
41ca D1        POP     DE
41cb C9        RET     

41cc C8        RET     Z

41cd E5        PUSH    HL
41ce CD5C36    CALL    #365C
41d1 E1        POP     HL
41d2 0D        DEC     C
41d3 C2C341    JP      NZ,#41C3
41d6 E5        PUSH    HL
41d7 23        INC     HL
41d8 7E        LD      A,(HL)
41d9 FE27      CP      #27
41db C2E441    JP      NZ,#41E4
41de 23        INC     HL
41df 22D5ED    LD      (#EDD5),HL

; INTERPRETER - Run PCode at DE, free mem at HL

41e0 D5        PUSH    DE
41e1 ED539641  LD      (#4196),DE  ; Save start addr of program in execution - KADDR. Base addre for PCode Program
41e5 23        INC     HL
41e6 226546    LD      (#4665),HL  ; Save addr first frame = first free byte after pcode
41e9 2B        DEC     HL
41ea 2B        DEC     HL
41eb EB        EX      DE,HL
41ec 210500    LD      HL,#0005
41ef 19        ADD     HL,DE
41f0 AF        XOR     A
41f1 77        LD      (HL),A
41f2 23        INC     HL
41f3 77        LD      (HL),A      ; previous frame = 0 for first frame
41f4 D9        EXX     
41f5 2A9041    LD      HL,(#4190)  ; End addr of runtime stack
41f8 CD5E44    CALL    #445E       ; calc -HL, ret Z set if overflow
41fb 229841    LD      (#4198),HL  ; =-End of runtime stack
41fe E1        POP     HL	   ;HL=PCode program start
41ff 010942    LD      BC,#4209
4202 C5        PUSH    BC
4203 1807      JR      #420C	   ; start executing pcodes

;exit to monitor

4205 2A9441    LD      HL,(#4194)  ; Monitor entry point
4208 E9        JP      (HL)        ; jump to monitor

4209 3B        DEC     SP
420a 3B        DEC     SP

; Execute next PCode

420b D9        EXX     

; Execute PCode

420c 7E        LD      A,(HL)  ; HL=PCode program counter, A=PCode to execute
420d 23        INC     HL
420e FE18      CP      #18     ; $18=INT PCode
4210 300F      JR      NC,#4221; JP -> Only one opcode
4212 5E        LD      E,(HL)  ; read opcode param in DE
4213 23        INC     HL
4214 56        LD      D,(HL)
4215 23        INC     HL
4216 D5        PUSH    DE	;push param. Opcode reads it with pop
4217 1008      DJNZ    #4221
4219 4F        LD      C,A
421a CDA641    CALL    #41A6   ;read keyboard non-bloquing
421d CCA041    CALL    Z,#41A0 ; read blocking if ^C pressed -> ^C = pause
4220 79        LD      A,C
4221 D9        EXX     
4222 2641      LD      H,#41   ; JUMP Table for opcode
4224 6F        LD      L,A     ; at $41XX where XX is opcode
4225 7E        LD      A,(HL)
4226 23        INC     HL
4227 66        LD      H,(HL)
4228 6F        LD      L,A
4229 E9        JP      (HL)    ; execute opcode,DE=param

; OPCODE JPC0=26

422a 1A        LD      A,(DE)
422b 1B        DEC     DE
422c 1B        DEC     DE
422d 1F        RRA     
422e 300C      JR      NC,#423C ; goto JMP
4230 D9        EXX     
4231 23        INC     HL
4232 23        INC     HL
4233 C30C42    JP      #420C	   ; start executing pcodes

4236 1A        LD      A,(DE)
4237 1B        DEC     DE
4238 1B        DEC     DE
4239 1F        RRA     
423a 30F4      JR      NC,#4230

; OPCODE JMP = 24 =$18 
; Jump to param addr 

423c D9        EXX     
423d 5E        LD      E,(HL)      ; HL=PCode Program Counter 
423e 23        INC     HL     
423f 56        LD      D,(HL)      ; DE=param for JMP: displacement (DE'=free mem addr stack)
4240 2A9641    LD      HL,(#4196)  ; start addr of program currently in execution (KADDR)
4243 19        ADD     HL,DE       ; Update HL=HL+DE=jmp destination PCode 
4244 C30C42    JP      #420C	   ; start executing pcodes

4247 2A6546    LD      HL,(#4665) ; Current frame start addr in stack
424a D5        PUSH    DE
424b 50        LD      D,B
424c 78        LD      A,B
424d 07        RLCA    
424e 07        RLCA    
424f 07        RLCA    
4250 E607      AND     #07
4252 47        LD      B,A
4253 7A        LD      A,D
4254 E61F      AND     #1F
4256 5E        LD      E,(HL)
4257 2B        DEC     HL
4258 56        LD      D,(HL)
4259 EB        EX      DE,HL
425a 10FA      DJNZ    #4256
425c 47        LD      B,A
425d D1        POP     DE
425e C9        RET     

425f AF        XOR     A
4260 13        INC     DE
4261 12        LD      (DE),A
4262 13        INC     DE
4263 12        LD      (DE),A
4264 C30B42    JP      #420B   ; execute next pcode

4267 C1        POP     BC
4268 EB        EX      DE,HL
4269 23        INC     HL
426a 70        LD      (HL),B
426b 23        INC     HL
426c 71        LD      (HL),C
426d EB        EX      DE,HL
426e C30B42    JP      #420B   ; execute next pcode

; OPCODE INT = 22 =$16 
; reserve n words in stack
; DE=Low de last param en Stack

4271 E1        POP     HL	;read INT param in HL
4272 29        ADD     HL,HL
4273 19        ADD     HL,DE
4274 EB        EX      DE,HL	; DE=addr freen mem stack=DE+2*Param
4275 2A9841    LD      HL,(#4198)  ; =-End of runtime stack
4278 19        ADD     HL,DE      HL=DE-addr end of stack
4279 D0        RET     NC	; return if not overflow
427a 218342    LD      HL,#4283  ; Points to addr strinf " MEMORY FULL"
427d CD8444    CALL    #4484    ; Print str at HL until $0d (included)
4280 C30542    JP      #4205    ;exit to monitor

4283 db " MEMORY FULL", 0d
4290 db " OVERFLOW", 0d

429a 13        INC     DE
429b 13        INC     DE
429c C9        RET     

429d 1B        DEC     DE
429e 1B        DEC     DE
429f C9        RET     

42a0 C1        POP     BC
42a1 CD4742    CALL    #4247
42a4 C3AB42    JP      #42AB
42a7 C1        POP     BC
42a8 2A6546    LD      HL,(#4665) ; Current frame start addr in stack
42ab 13        INC     DE
42ac 09        ADD     HL,BC
42ad 09        ADD     HL,BC
42ae 01E0FF    LD      BC,#FFE0
42b1 09        ADD     HL,BC
42b2 2B        DEC     HL
42b3 EDA0      LDI     
42b5 EDA0      LDI     
42b7 1B        DEC     DE
42b8 C9        RET     

42b9 C1        POP     BC
42ba CD4742    CALL    #4247
42bd C3C442    JP      #42C4
42c0 C1        POP     BC
42c1 2A6546    LD      HL,(#4665) ; Current frame start addr in stack
42c4 09        ADD     HL,BC
42c5 09        ADD     HL,BC
42c6 01E0FF    LD      BC,#FFE0
42c9 09        ADD     HL,BC
42ca EB        EX      DE,HL
42cb 4E        LD      C,(HL)
42cc 2B        DEC     HL
42cd 46        LD      B,(HL)
42ce EB        EX      DE,HL
42cf 09        ADD     HL,BC
42d0 C3B142    JP      #42B1
42d3 C1        POP     BC
42d4 CD4742    CALL    #4247
42d7 C3DE42    JP      #42DE

;STO

42da C1        POP     BC
42db 2A6546    LD      HL,(#4665) ; Current frame start addr in stack
42de 09        ADD     HL,BC
42df 09        ADD     HL,BC
42e0 01E0FF    LD      BC,#FFE0
42e3 09        ADD     HL,BC
42e4 EB        EX      DE,HL
42e5 EDA8      LDD     
42e7 EDA8      LDD     
42e9 EB        EX      DE,HL
42ea C9        RET     

42eb C1        POP     BC
42ec CD4742    CALL    #4247
42ef C3F642    JP      #42F6
42f2 C1        POP     BC
42f3 2A6546    LD      HL,(#4665) ; Current frame start addr in stack
42f6 09        ADD     HL,BC
42f7 09        ADD     HL,BC
42f8 01E0FF    LD      BC,#FFE0
42fb 09        ADD     HL,BC
42fc EB        EX      DE,HL
42fd 4E        LD      C,(HL)
42fe 2B        DEC     HL
42ff 46        LD      B,(HL)
4300 2B        DEC     HL
4301 C5        PUSH    BC
4302 4E        LD      C,(HL)
4303 2B        DEC     HL
4304 46        LD      B,(HL)
4305 2B        DEC     HL
4306 EB        EX      DE,HL
4307 09        ADD     HL,BC
4308 09        ADD     HL,BC
4309 C1        POP     BC
430a 71        LD      (HL),C
430b 2B        DEC     HL
430c 70        LD      (HL),B
430d C9        RET     

430e C1        POP     BC
430f CD4742    CALL    #4247
4312 C5        PUSH    BC
4313 44        LD      B,H
4314 4D        LD      C,L
4315 C31C43    JP      #431C
4318 ED4B6546  LD      BC,(#4665) ; Current frame start addr in stack
431c 62        LD      H,D
431d 6B        LD      L,E
431e 23        INC     HL
431f 70        LD      (HL),B
4320 23        INC     HL
4321 71        LD      (HL),C
4322 ED4B6546  LD      BC,(#4665) ; Current frame start addr in stack
4326 226546    LD      (#4665),HL  ; Save Current frame start addr in stack
4329 23        INC     HL
432a 70        LD      (HL),B
432b 23        INC     HL
432c 71        LD      (HL),C
432d E5        PUSH    HL
432e D9        EXX     
432f D1        POP     DE
4330 EB        EX      DE,HL
4331 23        INC     HL
4332 72        LD      (HL),D
4333 23        INC     HL
4334 73        LD      (HL),E
4335 D1        POP     DE
4336 2A9641    LD      HL,(#4196)  ; start addr of program currently in execution (KADDR)
4339 19        ADD     HL,DE
433a C30C42    JP      #420C	   ; start executing pcodes
433d 62        LD      H,D
433e 6B        LD      L,E
433f 4E        LD      C,(HL)
4340 2B        DEC     HL
4341 46        LD      B,(HL)
4342 3600      LD      (HL),#00
4344 0A        LD      A,(BC)
4345 12        LD      (DE),A
4346 C9        RET     

4347 62        LD      H,D
4348 6B        LD      L,E
4349 4E        LD      C,(HL)
434a 2B        DEC     HL
434b 46        LD      B,(HL)
434c 03        INC     BC
434d 0A        LD      A,(BC)
434e 77        LD      (HL),A
434f 0B        DEC     BC
4350 0A        LD      A,(BC)
4351 12        LD      (DE),A
4352 C9        RET     

4353 1A        LD      A,(DE)
4354 1B        DEC     DE
4355 1B        DEC     DE
4356 EB        EX      DE,HL
4357 5E        LD      E,(HL)
4358 2B        DEC     HL
4359 56        LD      D,(HL)
435a 2B        DEC     HL
435b EB        EX      DE,HL
435c 77        LD      (HL),A
435d C9        RET     

435e CD4D44    CALL    #444D
4361 1B        DEC     DE
4362 71        LD      (HL),C
4363 23        INC     HL
4364 70        LD      (HL),B
4365 C9        RET     

4366 CD5744    CALL    #4457
4369 E9        JP      (HL)
436a CDA041    CALL    #41A0    ; read console key (blocking)
436d 180C      JR      #437B    ; Print Char (expand tabs)
436f 13        INC     DE
4370 AF        XOR     A
4371 12        LD      (DE),A
4372 13        INC     DE
4373 CD6A43    CALL    #436A
4376 12        LD      (DE),A
4377 C9        RET     


; OPCODE OUTCH = 92 =$5c 
; print char 

4378 1A        LD      A,(DE)
4379 1B        DEC     DE
437a 1B        DEC     DE

; Print Char (expand tabs)

437b FE09      CP      #09
437d C2A341    JP      NZ,#41A3 ; Print Char in A
4380 3E20      LD      A,#20
4382 CDA341    CALL    #41A3  ; Print Char in A
4385 CDA341    CALL    #41A3  ; Print Char in A
4388 CDA341    CALL    #41A3  ; Print Char in A
438b 3E09      LD      A,#09
438d C9        RET     

438e D5        PUSH    DE
438f 3E3F      LD      A,#3F
4391 CD7B43    CALL    #437B  ; Print Char (expand tabs)
4394 50        LD      D,B
4395 AF        XOR     A
4396 326746    LD      (#4667),A
4399 67        LD      H,A
439a 6F        LD      L,A
439b CD6A43    CALL    #436A
439e FE20      CP      #20
43a0 28F9      JR      Z,#439B
43a2 FE2B      CP      #2B
43a4 2807      JR      Z,#43AD
43a6 FE2D      CP      #2D
43a8 2006      JR      NZ,#43B0
43aa 326746    LD      (#4667),A
43ad CD6A43    CALL    #436A
43b0 D630      SUB     #30
43b2 381D      JR      C,#43D1
43b4 FE0A      CP      #0A
43b6 3019      JR      NC,#43D1
43b8 5F        LD      E,A
43b9 AF        XOR     A
43ba 57        LD      D,A
43bb 29        ADD     HL,HL
43bc 44        LD      B,H
43bd 4D        LD      C,L
43be 29        ADD     HL,HL
43bf 8F        ADC     A,A
43c0 29        ADD     HL,HL
43c1 8F        ADC     A,A
43c2 09        ADD     HL,BC
43c3 8F        ADC     A,A
43c4 19        ADD     HL,DE
43c5 8F        ADC     A,A
43c6 2004      JR      NZ,#43CC
43c8 B4        OR      H
43c9 F2AD43    JP      P,#43AD
43cc 21F643    LD      HL,#43F6
43cf 1813      JR      #43E4
43d1 AF        XOR     A
43d2 82        ADD     A,D
43d3 200C      JR      NZ,#43E1
43d5 3A6746    LD      A,(#4667)
43d8 B7        OR      A
43d9 C45E44    CALL    NZ,#445E   ; calc -HL, ret Z set if overflow
43dc D1        POP     DE
43dd 13        INC     DE
43de C39B44    JP      #449B
43e1 21E943    LD      HL,#43E9   ; str "INPUT ERROR"
43e4 CD8444    CALL    #4484      ; Print str at HL until $0d (included)
43e7 18A6      JR      #438F

43e9 db " INPUT ERROR", 0d
43f6 db " SIZE ERROR", 0d

4402 CD5744    CALL    #4457
4405 D5        PUSH    DE
4406 AF        XOR     A
4407 3D        DEC     A
4408 F5        PUSH    AF
4409 A4        AND     H
440a F21544    JP      P,#4415
440d 3E2D      LD      A,#2D
440f CD7B43    CALL    #437B    ; Print Char (expand tabs)
4412 CD5E44    CALL    #445E    ; calc -HL, ret Z set if overflow
4415 010A00    LD      BC,#000A
4418 CD0745    CALL    #4507
441b 3E30      LD      A,#30
441d 83        ADD     A,E
441e F5        PUSH    AF
441f 7C        LD      A,H
4420 B5        OR      L
4421 20F2      JR      NZ,#4415
4423 F1        POP     AF
4424 CD7B43    CALL    #437B   ; Print Char (expand tabs)
4427 F1        POP     AF
4428 F22444    JP      P,#4424
442b D1        POP     DE
442c C9        RET     

; OPCODE RET0 = 46 =$3E
; return from current frame

442d 2A6546    LD      HL,(#4665) ; Current frame start addr in stack
4430 23        INC     HL         ; LD DE,(HL)
4431 56        LD      D,(HL)
4432 23        INC     HL
4433 5E        LD      E,(HL)
4434 EB        EX      DE,HL	   ; get first param in frame -> previous stack frame
4435 226546    LD      (#4665),HL  ; Save previous frame as current
4438 EB        EX      DE,HL       ; LD DE,(HL)
4439 23        INC     HL
443a 56        LD      D,(HL)
443b 23        INC     HL
443c 5E        LD      E,(HL)
443d 01FAFF    LD      BC,#FFFA
4440 09        ADD     HL,BC       ; DE=DE-6
4441 EB        EX      DE,HL
4442 7C        LD      A,H
4443 B7        OR      A           ; 0-> first frame
4444 CA0542    JP      Z,#4205     ;if firts frame -> exit to monitor
4447 E5        PUSH    HL
4448 D9        EXX     
4449 E1        POP     HL
444a C30C42    JP      #420C	   ; start executing pcodes

444d EB        EX      DE,HL
444e 4E        LD      C,(HL)
444f 2B        DEC     HL
4450 46        LD      B,(HL)
4451 2B        DEC     HL
4452 5E        LD      E,(HL)
4453 2B        DEC     HL
4454 56        LD      D,(HL)
4455 EB        EX      DE,HL
4456 C9        RET     

4457 EB        EX      DE,HL
4458 5E        LD      E,(HL)
4459 2B        DEC     HL
445a 56        LD      D,(HL)
445b 2B        DEC     HL
445c EB        EX      DE,HL
445d C9        RET     

; calc -HL, ret Z set if overflow

445e AF        XOR     A
445f 95        SUB     L
4460 6F        LD      L,A
4461 9C        SBC     A,H
4462 95        SUB     L
4463 67        LD      H,A
4464 D680      SUB     #80
4466 B5        OR      L
4467 C0        RET     NZ
4468 180A      JR      #4474

; calc -BC, ret Z set if overflow

446a AF        XOR     A
446b 91        SUB     C
446c 4F        LD      C,A
446d 98        SBC     A,B
446e 91        SUB     C
446f 47        LD      B,A
4470 D680      SUB     #80
4472 B1        OR      C
4473 C0        RET     NZ

4474 3A9A41    LD      A,(#419A)
4477 B7        OR      A
4478 C8        RET     Z

4479 C5        PUSH    BC
447a E5        PUSH    HL
447b 219042    LD      HL,#4290  ; str "OVERFLOW"
447e CD8444    CALL    #4484     ; Print str at HL until $0d (included)
4481 E1        POP     HL
4482 C1        POP     BC
4483 C9        RET     

; Print str at HL until $0d (included)
4484 7E        LD      A,(HL)
4485 23        INC     HL
4486 CD7B43    CALL    #437B      ; Print Char (expand tabs)
4489 FE0D      CP      #0D
448b 20F7      JR      NZ,#4484
448d C9        RET     

448e CD6A44    CALL    #446A
4491 78        LD      A,B
4492 AC        XOR     H
4493 09        ADD     HL,BC
4494 4F        LD      C,A
4495 1F        RRA     
4496 A9        XOR     C
4497 AC        XOR     H
4498 FC7444    CALL    M,#4474
449b EB        EX      DE,HL
449c 72        LD      (HL),D
449d 23        INC     HL
449e 73        LD      (HL),E
449f EB        EX      DE,HL
44a0 C30B42    JP      #420B   ; execute next pcode
44a3 CD4D44    CALL    #444D
44a6 C39144    JP      #4491
44a9 CD4D44    CALL    #444D
44ac 78        LD      A,B
44ad D680      SUB     #80
44af B1        OR      C
44b0 C28E44    JP      NZ,#448E
44b3 79        LD      A,C
44b4 C39244    JP      #4492
44b7 EB        EX      DE,HL
44b8 AF        XOR     A
44b9 96        SUB     (HL)
44ba 77        LD      (HL),A
44bb 4F        LD      C,A
44bc 2B        DEC     HL
44bd 9E        SBC     A,(HL)
44be 91        SUB     C
44bf 77        LD      (HL),A
44c0 23        INC     HL
44c1 EB        EX      DE,HL
44c2 C9        RET     

44c3 0608      LD      B,#08
44c5 29        ADD     HL,HL
44c6 07        RLCA    
44c7 3001      JR      NC,#44CA
44c9 19        ADD     HL,DE
44ca 10F9      DJNZ    #44C5
44cc C9        RET     

44cd CD4D44    CALL    #444D
44d0 D5        PUSH    DE
44d1 EB        EX      DE,HL
44d2 78        LD      A,B
44d3 210000    LD      HL,#0000
44d6 B7        OR      A
44d7 C4C344    CALL    NZ,#44C3
44da 79        LD      A,C
44db CDC344    CALL    #44C3
44de D1        POP     DE
44df C39B44    JP      #449B
44e2 CD4D44    CALL    #444D
44e5 D5        PUSH    DE
44e6 CD0745    CALL    #4507
44e9 D1        POP     DE
44ea C39B44    JP      #449B
44ed 21F944    LD      HL,#44F9   ; str " DIVIDE CHECK"
44f0 CD8444    CALL    #4484      ; Print str at HL until $0d (included)
44f3 210000    LD      HL,#0000
44f6 54        LD      D,H
44f7 5D        LD      E,L
44f8 C9        RET     

44f9 db " DIVIDE CHECK", 0d

4507 78        LD      A,B
4508 B1        OR      C
4509 28E2      JR      Z,#44ED
450b AF        XOR     A
450c 80        ADD     A,B
450d F5        PUSH    AF
450e F46A44    CALL    P,#446A
4511 AF        XOR     A
4512 84        ADD     A,H
4513 F5        PUSH    AF
4514 FC5E44    CALL    M,#445E  ; calc -HL, ret Z set if overflow
4517 EB        EX      DE,HL
4518 210000    LD      HL,#0000
451b 3E10      LD      A,#10
451d CB23      SLA     E
451f CB12      RL      D
4521 CB15      RL      L
4523 CB14      RL      H
4525 E5        PUSH    HL
4526 09        ADD     HL,BC
4527 3009      JR      NC,#4532
4529 1C        INC     E
452a 33        INC     SP
452b 33        INC     SP
452c 3D        DEC     A
452d 20EE      JR      NZ,#451D
452f C33645    JP      #4536
4532 E1        POP     HL
4533 3D        DEC     A
4534 20E7      JR      NZ,#451D
4536 EB        EX      DE,HL
4537 C1        POP     BC
4538 F1        POP     AF
4539 A8        XOR     B
453a FC5E44    CALL    M,#445E   ; calc -HL, ret Z set if overflow
453d AF        XOR     A
453e 80        ADD     A,B
453f F0        RET     P

4540 7A        LD      A,D
4541 B3        OR      E
4542 C8        RET     Z

4543 AF        XOR     A
4544 93        SUB     E
4545 5F        LD      E,A
4546 9A        SBC     A,D
4547 93        SUB     E
4548 57        LD      D,A
4549 C9        RET     

454a C9        RET     

454b CD4D44    CALL    #444D
454e D5        PUSH    DE
454f CD0745    CALL    #4507
4552 EB        EX      DE,HL
4553 D1        POP     DE
4554 C39B44    JP      #449B
4557 3E01      LD      A,#01
4559 F5        PUSH    AF
455a CD4D44    CALL    #444D
455d AF        XOR     A
455e 12        LD      (DE),A
455f 13        INC     DE
4560 ED42      SBC     HL,BC
4562 201B      JR      NZ,#457F
4564 F1        POP     AF
4565 12        LD      (DE),A
4566 C9        RET     

4567 AF        XOR     A
4568 C35945    JP      #4559
456b 010000    LD      BC,#0000
456e C5        PUSH    BC
456f CD4D44    CALL    #444D
4572 AF        XOR     A
4573 12        LD      (DE),A
4574 13        INC     DE
4575 7C        LD      A,H
4576 B8        CP      B
4577 280B      JR      Z,#4584
4579 1F        RRA     
457a AC        XOR     H
457b A8        XOR     B
457c FA6445    JP      M,#4564
457f F1        POP     AF
4580 EE01      XOR     #01
4582 12        LD      (DE),A
4583 C9        RET     

4584 7D        LD      A,L
4585 B9        CP      C
4586 38DC      JR      C,#4564
4588 C1        POP     BC
4589 78        LD      A,B
458a 2001      JR      NZ,#458D
458c A9        XOR     C
458d EE01      XOR     #01
458f 12        LD      (DE),A
4590 C9        RET     

4591 010001    LD      BC,#0100
4594 C36E45    JP      #456E
4597 010100    LD      BC,#0001
459a C36E45    JP      #456E
459d 010101    LD      BC,#0101
45a0 C36E45    JP      #456E
45a3 CD4D44    CALL    #444D
45a6 7C        LD      A,H
45a7 B0        OR      B
45a8 12        LD      (DE),A
45a9 7D        LD      A,L
45aa B1        OR      C
45ab 13        INC     DE
45ac 12        LD      (DE),A
45ad C9        RET     

45ae CD4D44    CALL    #444D
45b1 7C        LD      A,H
45b2 A0        AND     B
45b3 12        LD      (DE),A
45b4 7D        LD      A,L
45b5 A1        AND     C
45b6 13        INC     DE
45b7 12        LD      (DE),A
45b8 C9        RET     

45b9 1A        LD      A,(DE)
45ba 2F        CPL     
45bb 12        LD      (DE),A
45bc 1B        DEC     DE
45bd 1A        LD      A,(DE)
45be 2F        CPL     
45bf 12        LD      (DE),A
45c0 13        INC     DE
45c1 C9        RET     

45c2 CD4D44    CALL    #444D
45c5 AF        XOR     A
45c6 81        ADD     A,C
45c7 FAE045    JP      M,#45E0
45ca C2CF45    JP      NZ,#45CF
45cd 13        INC     DE
45ce C9        RET     

45cf 47        LD      B,A
45d0 29        ADD     HL,HL
45d1 10FD      DJNZ    #45D0
45d3 C39B44    JP      #449B
45d6 CD4D44    CALL    #444D
45d9 AF        XOR     A
45da 91        SUB     C
45db 28F0      JR      Z,#45CD
45dd F2CF45    JP      P,#45CF
45e0 ED44      NEG     
45e2 47        LD      B,A
45e3 CB3C      SRL     H
45e5 CB1D      RR      L
45e7 10FA      DJNZ    #45E3
45e9 C39B44    JP      #449B
45ec 1A        LD      A,(DE)
45ed C601      ADD     A,#01
45ef 12        LD      (DE),A
45f0 D0        RET     NC

45f1 62        LD      H,D
45f2 6B        LD      L,E
45f3 2B        DEC     HL
45f4 34        INC     (HL)
45f5 C9        RET     

45f6 1A        LD      A,(DE)
45f7 D601      SUB     #01
45f9 12        LD      (DE),A
45fa D0        RET     NC

45fb 62        LD      H,D
45fc 6B        LD      L,E
45fd 2B        DEC     HL
45fe 35        DEC     (HL)
45ff C9        RET     

4600 62        LD      H,D
4601 6B        LD      L,E
4602 13        INC     DE
4603 2B        DEC     HL
4604 EDA0      LDI     
4606 EDA0      LDI     
4608 1B        DEC     DE
4609 C9        RET     

460a 13        INC     DE
460b CD1546    CALL    #4615
460e 12        LD      (DE),A
460f CD1546    CALL    #4615
4612 13        INC     DE
4613 12        LD      (DE),A
4614 C9        RET     

4615 CD2246    CALL    #4622
4618 07        RLCA    
4619 07        RLCA    
461a 07        RLCA    
461b 07        RLCA    
461c 4F        LD      C,A
461d CD2246    CALL    #4622
4620 81        ADD     A,C
4621 C9        RET     

4622 CD6A43    CALL    #436A
4625 D630      SUB     #30
4627 380A      JR      C,#4633
4629 FE0A      CP      #0A
462b F8        RET     M

462c D607      SUB     #07
462e 3803      JR      C,#4633
4630 FE10      CP      #10
4632 F8        RET     M

4633 21E943    LD      HL,#43E9   ; str "INPUT ERROR"
4636 CD8444    CALL    #4484      ; Print str at HL until $0d (included)
4639 E1        POP     HL
463a E1        POP     HL
463b 18CE      JR      #460B
463d 1B        DEC     DE
463e 62        LD      H,D
463f 6B        LD      L,E
4640 1B        DEC     DE
4641 CD4546    CALL    #4645
4644 23        INC     HL
4645 AF        XOR     A
4646 ED6F      RLD     
4648 CD4E46    CALL    #464E
464b AF        XOR     A
464c ED6F      RLD     
464e FE0A      CP      #0A
4650 3802      JR      C,#4654
4652 C607      ADD     A,#07
4654 C630      ADD     A,#30
4656 C37B43    JP      #437B       ; Print Char (expand tabs)


; OPCODE OUTSTR = 102 =$66 
; print pcodes that follows as char until 0

4659 D9        EXX     
465a 7E        LD      A,(HL) ; HL=PCode Program Counter -> get char to print
465b 23        INC     HL
465c B7        OR      A
465d CA0C42    JP      Z,#420C	   ; start executing pcodes
4660 CD7B43    CALL    #437B      ; Print Char (expand tabs)
4663 18F5      JR      #465A

4665 db 0000   ; Current frame start addr in stack

4667 00        NOP     
4668 AF        XOR     A
4669 1B        DEC     DE
466a 12        LD      (DE),A
466b 13        INC     DE
466c CDA641    CALL    #41A6     ; console in (nonblocking read key)
466f 12        LD      (DE),A
4670 C9        RET     

4671 62        LD      H,D
4672 6B        LD      L,E
4673 4E        LD      C,(HL)
4674 2B        DEC     HL
4675 2B        DEC     HL
4676 ED78      IN      A,(C)
4678 77        LD      (HL),A
4679 2B        DEC     HL
467a 3600      LD      (HL),#00
467c C9        RET     

467d 62        LD      H,D
467e 6B        LD      L,E
467f 7E        LD      A,(HL)
4680 2B        DEC     HL
4681 2B        DEC     HL
4682 4E        LD      C,(HL)
4683 ED79      OUT     (C),A
4685 C9        RET     

; OPCODE PLOT=110 ($6E)
; PLOT(1,2,3)
; Stack: 00 01 00 02 00 03 
;                        ^
;                       DE
; luego viene Opcode INT -3
;HL'=PCode Program Counter (points to pcode following plot), DE=Stack 

4686 D5        PUSH    DE     ; Push Stack addr
4687 1A        LD      A,(DE) ; Low Last param
4688 1B        DEC     DE
4689 1B        DEC     DE
468a 1F        RRA            ; Carry=Bit0 + shr
468b 08        EX      AF,AF'
468c CDB346    CALL    #46B3
468f 4F        LD      C,A
4690 3802      JR      C,#4694
4692 3600      LD      (HL),#00
4694 B6        OR      (HL)
4695 47        LD      B,A
4696 08        EX      AF,AF'
4697 78        LD      A,B
4698 3801      JR      C,#469B
469a A9        XOR     C
469b F680      OR      #80
469d 77        LD      (HL),A
469e D1        POP     DE     ; pop stack addr
469f C9        RET     

; OPCODE POINT=112 ($70)
; A:=POINT(1,2)
; Stack: RH RL 00 01 00 02 
;                        ^
;                       DE
; luego viene Opcode INT -2
;HL'=PCode Program Counter (points to pcode following point), DE=Stack 

46a0 D5        PUSH    DE    ; Push Stack addr
46a1 CDB346    CALL    #46B3
46a4 A6        AND     (HL)
46a5 3E00      LD      A,#00
46a7 1B        DEC     DE
46a8 1B        DEC     DE
46a9 1B        DEC     DE
46aa 12        LD      (DE),A  ; (DE) points to return value hight = 0
46ab 13        INC     DE
46ac 2802      JR      Z,#46B0
46ae 3C        INC     A
46af A1        AND     C
46b0 12        LD      (DE),A  ; (DE) points to return value low
46b1 D1        POP     DE    ; pop stack addr
46b2 C9        RET     

46b3 CD5744    CALL    #4457
46b6 D5        PUSH    DE
46b7 013000    LD      BC,#0030
46ba CD0745    CALL    #4507
46bd 7B        LD      A,E
46be 06FF      LD      B,#FF
46c0 B7        OR      A
46c1 F2C646    JP      P,#46C6
46c4 C630      ADD     A,#30
46c6 04        INC     B
46c7 4F        LD      C,A
46c8 D603      SUB     #03
46ca 30FA      JR      NC,#46C6
46cc 78        LD      A,B
46cd 87        ADD     A,A
46ce 87        ADD     A,A
46cf 87        ADD     A,A
46d0 87        ADD     A,A
46d1 6F        LD      L,A
46d2 260F      LD      H,#0F
46d4 29        ADD     HL,HL
46d5 29        ADD     HL,HL
46d6 D1        POP     DE
46d7 1A        LD      A,(DE)
46d8 E67F      AND     #7F
46da 47        LD      B,A
46db AF        XOR     A
46dc CB38      SRL     B
46de 89        ADC     A,C
46df 81        ADD     A,C
46e0 48        LD      C,B
46e1 47        LD      B,A
46e2 3E01      LD      A,#01
46e4 2803      JR      Z,#46E9
46e6 87        ADD     A,A
46e7 10FD      DJNZ    #46E6
46e9 09        ADD     HL,BC
46ea 4E        LD      C,(HL)
46eb CB01      RLC     C
46ed C9        RET     

46ee 62        LD      H,D
46ef 6B        LD      L,E
46f0 4E        LD      C,(HL)
46f1 2B        DEC     HL
46f2 46        LD      B,(HL)
46f3 2B        DEC     HL
46f4 78        LD      A,B
46f5 B7        OR      A
46f6 FC6A44    CALL    M,#446A
46f9 71        LD      (HL),C
46fa 2B        DEC     HL
46fb 70        LD      (HL),B
46fc C9        RET     

46fd D5        PUSH    DE
46fe CD5744    CALL    #4457
4701 D5        PUSH    DE
4702 EB        EX      DE,HL
4703 210000    LD      HL,#0000
4706 4B        LD      C,E
4707 7A        LD      A,D
4708 B7        OR      A
4709 C4C344    CALL    NZ,#44C3
470c 79        LD      A,C
470d CDC344    CALL    #44C3
4710 D1        POP     DE
4711 EB        EX      DE,HL
4712 73        LD      (HL),E
4713 2B        DEC     HL
4714 72        LD      (HL),D
4715 D1        POP     DE
4716 C9        RET     

4717 D5        PUSH    DE
4718 CD5744    CALL    #4457
471b E5        PUSH    HL
471c CD4D44    CALL    #444D
471f E5        PUSH    HL
4720 AF        XOR     A
4721 ED42      SBC     HL,BC
4723 3008      JR      NC,#472D
4725 60        LD      H,B
4726 69        LD      L,C
4727 D1        POP     DE
4728 C1        POP     BC
4729 EDB0      LDIR    
472b D1        POP     DE
472c C9        RET     

472d 50        LD      D,B
472e 59        LD      E,C
472f E1        POP     HL
4730 C1        POP     BC
4731 09        ADD     HL,BC
4732 EB        EX      DE,HL
4733 09        ADD     HL,BC
4734 2B        DEC     HL
4735 1B        DEC     DE
4736 EDB8      LDDR    
4738 D1        POP     DE
4739 C9        RET     

; Monitor Entry Point

473a 319840    LD      SP,#4098
473d 21AE40    LD      HL,#40AE -> str "TINY PASCAL V-1.0"
4740 CD4548    CALL    #4845   -> print 

; Momitor Main Loop

4743 319840    LD      SP,#4098 

; Momitor Main Loop (preserve sp)

4746 21EE40    LD      HL,#40EE 
4749 CD4548    CALL    #4845   -> print <cr>"."
474c CD4F48    CALL    #484F   -> read until <CR>
474f FE43      CP      #43     ; 'C' -> compile
4751 283E      JR      Z,#4791
4753 FE45      CP      #45     ; 'E' -> editor
4755 2870      JR      Z,#47C7
4757 FE4C      CP      #4C     ; 'L' -> load form tape
4759 CADF47    JP      Z,#47DF
475c FE57      CP      #57     ; 'W' -> save to tape
475e CA0548    JP      Z,#4805
4761 FE52      CP      #52     ; 'R' -> run
4763 C29548    JP      NZ,#4895 ; Print '?' and return to monitor main loop

; RUN PCode program

4766 ED5B8641  LD      DE,(#4186) ; EADDR = End of PCode Program (points to last byte of PCode program)
476a 7A        LD      A,D
476b B7        OR      A
476c 21D940    LD      HL,#40D9  ; Addr of string "P-CODE NOT IN MEMORY"
476f CA3F48    JP      Z,#483F   ; print HL str and return to monitor
4772 13        INC     DE
4773 CD9D48    CALL    #489D     ; Get compiler/run option  /-X
4776 2812      JR      Z,#478A   ; jmp if no compiler options
4778 FE43      CP      #43       ; 'C'
477a C29548    JP      NZ,#4895  ; Print '?' and return to monitor main loop
477d AF        XOR     A         ; Set to run overwriting compiler & editor
477e 328941    LD      (#4189),A ; -> set Hi=0 for editor addr 
4781 328B41    LD      (#418B),A ; -> set Hi=0 for compiler addr
4784 2A9241    LD      HL,(#4192) ; HL=end of ram
4787 229041    LD      (#4190),HL ; End of stack=HL=end of ram
478a 2A8441    LD      HL,(#4184) ; HL=start of pcode
478d EB        EX      DE,HL      ; DE=start of pcode to execute
478e C3E041    JP      #41E0	  ; Run PCode at DE=start of pcode, HL=firts byte available after end of pcode

: COMPILE Pascal source to PCode

4791 ED5B8A41  LD      DE,(#418A) ; Address of compiler: Start of Compiler PCode program
4795 7A        LD      A,D
4796 B7        OR      A
4797 21C240    LD      HL,#40C2  ; str "COMPILER"
479a CA3948    JP      Z,#4839   ; print string HL + NOT IN MEMORY
479d 3A8341    LD      A,(#4183) ; Hi de end of source text. 0-> no source
47a0 B7        OR      A
47a1 CA3648    JP      Z,#4836   ; print SOURCE NOT IN MEMORY
47a4 CD9D48    CALL    #489D      ; Get compiler/run option  /-X
47a7 2A8241    LD      HL,(#4182) ; End of source text
47aa 23        INC     HL
47ab 2815      JR      Z,#47C2   ; JP if no compiler options
47ad FE53      CP      #53       ; 'S'
47af 280A      JR      Z,#47BB
47b1 FE50      CP      #50       ; 'P'
47b3 C29548    JP      NZ,#4895 ; Print '?' and return to monitor main loop
47b6 210000    LD      HL,#0000
47b9 1807      JR      #47C2     ; if C/-P -> not generate pcode
47bb AF        XOR     A
47bc 328341    LD      (#4183),A  ; set 0 in hi MADDR to disable code pcode generation
47bf 2A8041    LD      HL,(#4180) ; Start Of Pascal Source Text Code
47c2 228441    LD      (#4184),HL ; MADDR = Start of PCode program 
47c5 180E      JR      #47D5 ; ClearPCode and run 

:EDITOR

47c7 CD8F48    CALL    #488F       ; get next char from command line (skip spaces)
47ca ED5B8841  LD      DE,(#4188)  ; DE=addr of editor PCode
47ce 7A        LD      A,D
47cf B7        OR      A
47d0 21CB40    LD      HL,#40CB    ; addr of str "EDITOR"
47d3 2864      JR      Z,#4839     ; Hi Addr of editor PCode = 0 -> print EDITOR NOT IN MEMORY and go to monitor

; ClearPCode and run 

47d5 AF        XOR     A
47d6 328741    LD      (#4187),A   ; Clear PCode -> Hi Addr of PCode compiled program = 0
47d9 2A8E41    LD      HL,(#418E)  ; Runtime Stack Addr
47dc C3E041    JP      #41E0       ; executr editor in DE, stack in HL

; LOAD

47df CD8248    CALL    #4882     ; get next char from command line (skip spaces)
47e2 FE50      CP      #50       ; 'P' -> load pcode
47e4 2812      JR      Z,#47F8
47e6 FE53      CP      #53       ; 'S' -> load source
47e8 C29548    JP      NZ,#4895 ; Print '?' and return to monitor main loop

; LOAD SOURCE

47eb CDBC48    CALL    #48BC       ; Load from tape
47ee 228041    LD      (#4180),HL  ; Start Of Pascal Source Text Code
47f1 ED538241  LD      (#4182),DE  ; End of source text
47f5 C34347    JP      #4743 ; go to monitor main loop

; LOAD PCODE

47f8 CDBC48    CALL    #48BC       ; Load from tape
47fb 228441    LD      (#4184),HL  ; MADDR = Start of PCode program 
47fe ED538641  LD      (#4186),DE  ; EADDR = End of PCode Program (points to last byte of PCode program)
4802 C34347    JP      #4743 ; go to monitor main loop

; SAVE

4805 CD8248    CALL    #4882     ; get next char from command line (skip spaces)
4808 FE50      CP      #50      ; 'P' -> save pcode
480a 2813      JR      Z,#481F
480c FE53      CP      #53      ; 'S' -> save source
480e C29548    JP      NZ,#4895 ; Print '?' and return to monitor main loop

; SAVE SOURCE 

4811 ED4B8241  LD      BC,(#4182) ; end of source text
4815 78        LD      A,B
4816 B7        OR      A
4817 281D      JR      Z,#4836    ; print SOURCE NOT IN MEMORY
4819 ED5B8041  LD      DE,(#4180) ; start of source text
481d 1811      JR      #4830

; SAVE PCODE

481f ED4B8641  LD      BC,(#4186) ; EADDR = End of PCode Program (points to last byte of PCode program)
4823 78        LD      A,B
4824 B7        OR      A
4825 2005      JR      NZ,#482C
4827 21D940    LD      HL,#40D9
482a 1813      JR      #483F      ; print HL str and return to monitor
482c ED5B8441  LD      DE,(#4184)  ; MADDR = Start of PCode program 

4830 CD3749    CALL    #4937
4833 C34347    JP      #4743 ; go to monitor main loop

; print SOURCE NOT IN MEMORY

4836 21D240    LD      HL,#40D2  ; addr of string "SOURCE"

; print string HL + NOT IN MEMORY

4839 CD4548    CALL    #4845     ; Print str. Addr in HL
483c 21DF40    LD      HL,#40DF  ; addr of string "NOT IN MEMORY"

; print HL str and return to monitor

483f CD4548    CALL    #4845  ; Print str. Addr in HL
4842 C34647    JP      #4746  ; go to Momitor Main Loop (preserve sp)

; Print str. Addr in HL

4845 7E        LD      A,(HL)
4846 CDA341    CALL    #41A3 ; Print Char in A
4849 23        INC     HL
484a 7E        LD      A,(HL)
484b B7        OR      A
484c 20F8      JR      NZ,#4846
484e C9        RET     

; read until <CR>

484f 21F240    LD      HL,#40F2  ; command line buffer
4852 0E01      LD      C,#01
4854 CDA041    CALL    #41A0  ; read console key (blocking)
4857 CDA341    CALL    #41A3  ; Print Char in A
485a FE08      CP      #08
485c 2006      JR      NZ,#4864
485e 0D        DEC     C
485f 2834      JR      Z,#4895 ; Print '?' and return to monitor main loop
4861 2B        DEC     HL
4862 18F0      JR      #4854
4864 FE0D      CP      #0D
4866 280A      JR      Z,#4872
4868 77        LD      (HL),A
4869 23        INC     HL
486a 0C        INC     C
486b 79        LD      A,C
486c FE0C      CP      #0C
486e 3025      JR      NC,#4895 ; Print '?' and return to monitor main loop
4870 18E2      JR      #4854
4872 3E0C      LD      A,#0C
4874 91        SUB     C
4875 47        LD      B,A
4876 3620      LD      (HL),#20
4878 23        INC     HL
4879 10FB      DJNZ    #4876
487b 360D      LD      (HL),#0D
487d 21F240    LD      HL,#40F2  ; command line buffer
4880 1803      JR      #4885

     ; get next char from command line (skip spaces)

4882 2A9C40    LD      HL,(#409C)
4885 7E        LD      A,(HL)
4886 23        INC     HL
4887 FE20      CP      #20
4889 28FA      JR      Z,#4885
488b 229C40    LD      (#409C),HL
488e C9        RET     

488f CD8248    CALL    #4882      ; get next char from command line (skip spaces)
4892 FE0D      CP      #0D
4894 C8        RET     Z

; Print '?' and return to monitor main loop

4895 3E3F      LD      A,#3F
4897 CDA341    CALL    #41A3  ; Print Char in A
489a C34347    JP      #4743  ; return to monitor main loop

; Get compiler/run option  /-X

489d CD8248    CALL    #4882  ; get next char from command line (skip spaces)
48a0 FE0D      CP      #0D
48a2 C8        RET     Z
48a3 FE2F      CP      #2F 	; '/'
48a5 20EE      JR      NZ,#4895 ; Print '?' and return to monitor main loop
48a7 CD8248    CALL    #4882    ; get next char from command line (skip spaces)
48aa FE2D      CP      #2D      ;'-'
48ac 20E7      JR      NZ,#4895 ; Print '?' and return to monitor main loop
48ae CD8248    CALL    #4882    ; get next char from command line (skip spaces)
48b1 FE0D      CP      #0D
48b3 28E0      JR      Z,#4895 ; Print '?' and return to monitor main loop
48b5 4F        LD      C,A
48b6 CD8F48    CALL    #488F
48b9 79        LD      A,C
48ba B7        OR      A
48bb C9        RET     

; Load from tape
       
48bc E5        PUSH    HL
48bd 21AB40    LD      HL,#40AB ; db 1f 1c
48c0 CD4548    CALL    #4845  ; Print str. Addr in HL
48c3 E1        POP     HL
48c4 AF        XOR     A
48c5 328341    LD      (#4183),A
48c8 328741    LD      (#4187),A
48cb 329A40    LD      (#409A),A
48ce CD1202    CALL    #0212
48d1 CD9602    CALL    #0296
48d4 CD3502    CALL    #0235
48d7 FE55      CP      #55
48d9 2045      JR      NZ,#4920
48db 0606      LD      B,#06
48dd 23        INC     HL
48de CD3502    CALL    #0235
48e1 BE        CP      (HL)
48e2 203C      JR      NZ,#4920
48e4 23        INC     HL
48e5 10F7      DJNZ    #48DE
48e7 CD2C02    CALL    #022C
48ea CD3502    CALL    #0235
48ed FE78      CP      #78
48ef 283E      JR      Z,#492F
48f1 FE3C      CP      #3C
48f3 202B      JR      NZ,#4920
48f5 CD3502    CALL    #0235
48f8 47        LD      B,A
48f9 CD1403    CALL    #0314
48fc 3A9A40    LD      A,(#409A)
48ff B7        OR      A
4900 2007      JR      NZ,#4909
4902 229840    LD      (#4098),HL
4905 3C        INC     A
4906 329A40    LD      (#409A),A
4909 7C        LD      A,H
490a 85        ADD     A,L
490b 4F        LD      C,A
490c CD3502    CALL    #0235
490f 77        LD      (HL),A
4910 23        INC     HL
4911 81        ADD     A,C
4912 4F        LD      C,A
4913 10F7      DJNZ    #490C
4915 CD3502    CALL    #0235
4918 B9        CP      C
4919 28CC      JR      Z,#48E7
491b 3E43      LD      A,#43
491d 323E3C    LD      (#3C3E),A
4920 219E40    LD      HL,#409E
4923 CD4548    CALL    #4845  ; Print str. Addr in HL
4926 2A8E49    LD      HL,(#498E)
4929 110000    LD      DE,#0000
492c C3F801    JP      #01F8
492f 2B        DEC     HL
4930 EB        EX      DE,HL
4931 2A9840    LD      HL,(#4098)
4934 C3F801    JP      #01F8
4937 AF        XOR     A
4938 329B40    LD      (#409B),A
493b CD1202    CALL    #0212
493e C5        PUSH    BC
493f CD8702    CALL    #0287
4942 3E55      LD      A,#55
4944 CD6402    CALL    #0264
4947 0606      LD      B,#06
4949 23        INC     HL
494a 7E        LD      A,(HL)
494b CD6402    CALL    #0264
494e 23        INC     HL
494f 10F9      DJNZ    #494A
4951 E1        POP     HL
4952 3E3C      LD      A,#3C
4954 CD6402    CALL    #0264
4957 E5        PUSH    HL
4958 AF        XOR     A
4959 ED52      SBC     HL,DE
495b BC        CP      H
495c 23        INC     HL
495d 3805      JR      C,#4964
495f 3C        INC     A
4960 329B40    LD      (#409B),A
4963 7D        LD      A,L
4964 E1        POP     HL
4965 47        LD      B,A
4966 CD6402    CALL    #0264
4969 7B        LD      A,E
496a CD6402    CALL    #0264
496d 82        ADD     A,D
496e 4F        LD      C,A
496f 7A        LD      A,D
4970 CD6402    CALL    #0264
4973 1A        LD      A,(DE)
4974 CD6402    CALL    #0264
4977 81        ADD     A,C
4978 4F        LD      C,A
4979 13        INC     DE
497a 10F7      DJNZ    #4973
497c 79        LD      A,C
497d CD6402    CALL    #0264
4980 3A9B40    LD      A,(#409B)
4983 B7        OR      A
4984 28CC      JR      Z,#4952
4986 3E78      LD      A,#78
4988 CD6402    CALL    #0264
498b C3F801    JP      #01F8
498e 00        NOP     
498f C9        RET     

