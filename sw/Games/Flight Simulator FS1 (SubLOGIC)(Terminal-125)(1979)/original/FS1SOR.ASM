; Disassembly of the file "E:\Tmp\cpm\pcw\FS1d.COM"
; 
; CPU Type: Z80
; 
; Created with dZ80 2.0
; 
; on Sunday, 11 of February 2024 at 06:09 PM
; 

0100 210e01    ld hl,010e 
0103 110040    ld de,4000 
0106 01ff3a    ld bc,3aff 
0109 edb0      ldir       
010b c30075    jp 7500    

; Sorcerer: User Defined Chars at FC00
;           memory mapped screen F080..F7FF



4000 c3961c    jp      $1c96
4003 c3781d    jp      $1d78
4006 c3901c    jp      $1c90
4009 c3d925    jp      $25d9
400c c9        ret     

400d 00        nop     
400e 00        nop     
400f c9        ret     

4010 00        nop     
4011 00        nop     
4012 fb        ei      
4013 c9        ret     

4014 00        nop     
4015 01e303    ld      bc,$03e3
4018 00        nop     
4019 00        nop     
401a 00        nop     
401b 4b        ld      c,e
401c 49        ld      c,c
401d 07        rlca    
401e 58        ld      e,b
401f 04        inc     b
4020 c0        ret     nz

4021 f7        rst     $30
4022 00        nop     
4023 44        ld      b,h
4024 4f        ld      c,a
4025 068d      ld      b,$8d
4027 05        dec     b
4028 43        ld      b,e
4029 00        nop     
402a 00        nop     
402b 50        ld      d,b
402c 52        ld      d,d
402d c30050    jp      $5000
4030 c7        rst     $00
4031 00        nop     
4032 00        nop     
4033 3e00      ld      a,$00
4035 c9        ret     

4036 00        nop     
4037 00        nop     
4038 00        nop     
4039 00        nop     
403a 00        nop     
403b 00        nop     
403c 00        nop     
403d 00        nop     
403e 00        nop     
403f 00        nop     
4040 00        nop     
4041 00        nop     
4042 00        nop     
4043 00        nop     
4044 00        nop     
4045 00        nop     
4046 00        nop     
4047 00        nop     
4048 00        nop     
4049 00        nop     
404a 00        nop     
404b 00        nop     
404c 00        nop     
404d 00        nop     
404e 00        nop     
404f 00        nop     
4050 00        nop     
4051 00        nop     
4052 00        nop     
4053 00        nop     
4054 00        nop     
4055 00        nop     
4056 00        nop     
4057 00        nop     
4058 00        nop     
4059 00        nop     
405a 00        nop     
405b 00        nop     
405c 00        nop     
405d 00        nop     
405e ff        rst     $38
405f 00        nop     
4060 ff        rst     $38
4061 00        nop     
4062 ff        rst     $38
4063 00        nop     
4064 ff        rst     $38
4065 00        nop     
4066 ff        rst     $38
4067 00        nop     
4068 ff        rst     $38
4069 00        nop     
406a ff        rst     $38
406b 00        nop     
406c ff        rst     $38
406d 00        nop     
406e ff        rst     $38
406f 00        nop     
4070 ff        rst     $38
4071 00        nop     
4072 ff        rst     $38
4073 00        nop     
4074 ff        rst     $38
4075 00        nop     
4076 ff        rst     $38
4077 00        nop     
4078 ff        rst     $38
4079 00        nop     
407a ff        rst     $38
407b 00        nop     
407c ff        rst     $38
407d 00        nop     
407e ff        rst     $38
407f 00        nop     
4080 d600      sub     $00
4082 6f        ld      l,a
4083 7c        ld      a,h
4084 de00      sbc     a,$00
4086 67        ld      h,a
4087 78        ld      a,b
4088 de00      sbc     a,$00
408a 47        ld      b,a
408b 3e00      ld      a,$00
408d c9        ret     

408e 4a        ld      c,d
408f 1e40      ld      e,$40
4091 e64d      and     $4d
4093 db00      in      a,($00)
4095 c9        ret     

4096 d300      out     ($00),a
4098 c9        ret     

4099 00        nop     
409a 00        nop     
409b 00        nop     
409c 00        nop     
409d 40        ld      b,b
409e 3000      jr      nc,$40a0
40a0 cdbfff    call    $ffbf
40a3 ff        rst     $38
40a4 e9        jp      (hl)
40a5 42        ld      b,d
40a6 00        nop     
40a7 e8        ret     pe

40a8 41        ld      b,c
40a9 00        nop     
40aa ff        rst     $38
40ab 00        nop     
40ac ff        rst     $38
40ad 00        nop     
40ae ff        rst     $38
40af 03        inc     bc
40b0 00        nop     
40b1 ff        rst     $38
40b2 bf        cp      a
40b3 b5        or      l
40b4 40        ld      b,b
40b5 0629      ld      b,$29
40b7 19        add     hl,de
40b8 ff        rst     $38
40b9 00        nop     
40ba ff        rst     $38
40bb 00        nop     
40bc ff        rst     $38
40bd 00        nop     
40be ff        rst     $38
40bf 00        nop     
40c0 ff        rst     $38
40c1 00        nop     
40c2 ff        rst     $38
40c3 00        nop     
40c4 ff        rst     $38
40c5 00        nop     
40c6 ff        rst     $38
40c7 00        nop     
40c8 ff        rst     $38
40c9 00        nop     
40ca ff        rst     $38
40cb 00        nop     
40cc ff        rst     $38
40cd 00        nop     
40ce ff        rst     $38
40cf 00        nop     
40d0 ff        rst     $38
40d1 00        nop     
40d2 ff        rst     $38
40d3 0629      ld      b,$29
40d5 19        add     hl,de
40d6 ff        rst     $38
40d7 bf        cp      a
40d8 ff        rst     $38
40d9 00        nop     
40da ff        rst     $38
40db 00        nop     
40dc 00        nop     
40dd 00        nop     
40de ff        rst     $38
40df e8        ret     pe

40e0 42        ld      b,d
40e1 00        nop     
40e2 ff        rst     $38
40e3 00        nop     
40e4 ff        rst     $38
40e5 00        nop     
40e6 e5        push    hl
40e7 41        ld      b,c
40e8 cbbf      res     7,a
40ea ff        rst     $38
40eb 00        nop     
40ec ff        rst     $38
40ed 00        nop     
40ee ff        rst     $38
40ef 00        nop     
40f0 00        nop     
40f1 00        nop     
40f2 00        nop     
40f3 00        nop     
40f4 ff        rst     $38
40f5 00        nop     
40f6 ff        rst     $38
40f7 00        nop     
40f8 00        nop     
40f9 83        add     a,e
40fa 48        ld      c,b
40fb 83        add     a,e
40fc 48        ld      c,b
40fd 83        add     a,e
40fe 48        ld      c,b
40ff e8        ret     pe

4100 42        ld      b,d
4101 04        inc     b
4102 04        inc     b
4103 04        inc     b
4104 04        inc     b
4105 04        inc     b
4106 04        inc     b
4107 04        inc     b
4108 04        inc     b
4109 04        inc     b
410a 04        inc     b
410b 04        inc     b
410c 04        inc     b
410d 04        inc     b
410e 04        inc     b
410f 04        inc     b
4110 04        inc     b
4111 04        inc     b
4112 04        inc     b
4113 04        inc     b
4114 04        inc     b
4115 04        inc     b
4116 04        inc     b
4117 04        inc     b
4118 04        inc     b
4119 04        inc     b
411a 04        inc     b
411b 00        nop     
411c ff        rst     $38
411d 00        nop     
411e ff        rst     $38
411f 00        nop     
4120 ff        rst     $38
4121 b5        or      l
4122 40        ld      b,b
4123 00        nop     
4124 ff        rst     $38
4125 00        nop     
4126 ff        rst     $38
4127 00        nop     
4128 ff        rst     $38
4129 00        nop     
412a ff        rst     $38
412b 00        nop     
412c ff        rst     $38
412d 00        nop     
412e ff        rst     $38
412f 00        nop     
4130 ff        rst     $38
4131 00        nop     
4132 ff        rst     $38
4133 00        nop     
4134 ff        rst     $38
4135 00        nop     
4136 ff        rst     $38
4137 00        nop     
4138 ff        rst     $38
4139 00        nop     
413a ff        rst     $38
413b 00        nop     
413c ff        rst     $38
413d 00        nop     
413e ff        rst     $38
413f 00        nop     
4140 ff        rst     $38
4141 00        nop     
4142 ff        rst     $38
4143 00        nop     
4144 ff        rst     $38
4145 00        nop     
4146 ff        rst     $38
4147 00        nop     
4148 ff        rst     $38
4149 00        nop     
414a ff        rst     $38
414b 00        nop     
414c ff        rst     $38
414d 00        nop     
414e ff        rst     $38
414f 00        nop     
4150 ff        rst     $38
4151 00        nop     
4152 c32d01    jp      $012d
4155 c32d01    jp      $012d
4158 c32d01    jp      $012d
415b c32d01    jp      $012d
415e c32d01    jp      $012d
4161 c32d01    jp      $012d
4164 c32d01    jp      $012d
4167 c32d01    jp      $012d
416a c32d01    jp      $012d
416d c32d01    jp      $012d
4170 c32d01    jp      $012d
4173 c32d01    jp      $012d
4176 c32d01    jp      $012d
4179 c32d01    jp      $012d
417c c32d01    jp      $012d
417f c32d01    jp      $012d
4182 c32d01    jp      $012d
4185 c32d01    jp      $012d
4188 c32d01    jp      $012d
418b c32d01    jp      $012d
418e c32d01    jp      $012d
4191 c32d01    jp      $012d
4194 c38032    jp      $3280
4197 c32d01    jp      $012d
419a c32d01    jp      $012d
419d c32d01    jp      $012d
41a0 c32d01    jp      $012d
41a3 c32d01    jp      $012d
41a6 c9        ret     

41a7 00        nop     
41a8 ff        rst     $38
41a9 c9        ret     

41aa ff        rst     $38
41ab 00        nop     
41ac c9        ret     

41ad 00        nop     
41ae ff        rst     $38
41af c9        ret     

41b0 ff        rst     $38
41b1 00        nop     
41b2 c9        ret     

41b3 00        nop     
41b4 ff        rst     $38
41b5 c9        ret     

41b6 ff        rst     $38
41b7 00        nop     
41b8 c9        ret     

41b9 00        nop     
41ba ff        rst     $38
41bb c9        ret     

41bc ff        rst     $38
41bd 00        nop     
41be c9        ret     

41bf 00        nop     
41c0 ff        rst     $38
41c1 c9        ret     

41c2 ff        rst     $38
41c3 00        nop     
41c4 c9        ret     

41c5 00        nop     
41c6 ff        rst     $38
41c7 c9        ret     

41c8 ff        rst     $38
41c9 00        nop     
41ca c9        ret     

41cb 00        nop     
41cc ff        rst     $38
41cd c9        ret     

41ce ff        rst     $38
41cf 00        nop     
41d0 c9        ret     

41d1 00        nop     
41d2 ff        rst     $38
41d3 c9        ret     

41d4 ff        rst     $38
41d5 00        nop     
41d6 c9        ret     

41d7 00        nop     
41d8 ff        rst     $38
41d9 c9        ret     

41da ff        rst     $38
41db 00        nop     
41dc c9        ret     

41dd 00        nop     
41de ff        rst     $38
41df c9        ret     

41e0 ff        rst     $38
41e1 00        nop     
41e2 c9        ret     

41e3 00        nop     
41e4 ff        rst     $38
41e5 3aa400    ld      a,($00a4)
41e8 00        nop     
41e9 00        nop     
41ea 45        ld      b,l
41eb 00        nop     
41ec 00        nop     
41ed 4d        ld      c,l
41ee 00        nop     
41ef 00        nop     
41f0 ff        rst     $38
41f1 00        nop     
41f2 ff        rst     $38
41f3 00        nop     
41f4 ff        rst     $38
41f5 00        nop     
41f6 b2        or      d
41f7 00        nop     
41f8 ff        rst     $38
41f9 00        nop     
41fa ff        rst     $38
41fb 00        nop     
41fc ff        rst     $38
41fd 00        nop     
41fe ff        rst     $38
41ff 00        nop     
4200 ff        rst     $38
4201 00        nop     
4202 7f        ld      a,a
4203 00        nop     
4204 ff        rst     $38
4205 00        nop     
4206 ff        rst     $38
4207 00        nop     
4208 ff        rst     $38
4209 00        nop     
420a ff        rst     $38
420b 00        nop     
420c ff        rst     $38
420d 00        nop     
420e ff        rst     $38
420f 00        nop     
4210 ff        rst     $38
4211 00        nop     
4212 ff        rst     $38
4213 00        nop     
4214 ff        rst     $38
4215 00        nop     
4216 ff        rst     $38
4217 00        nop     
4218 ff        rst     $38
4219 00        nop     
421a ff        rst     $38
421b 00        nop     
421c ff        rst     $38
421d 00        nop     
421e ff        rst     $38
421f 00        nop     
4220 ff        rst     $38
4221 00        nop     
4222 ff        rst     $38
4223 00        nop     
4224 ff        rst     $38
4225 00        nop     
4226 ff        rst     $38
4227 00        nop     
4228 ff        rst     $38
4229 00        nop     
422a ff        rst     $38
422b 00        nop     
422c ff        rst     $38
422d 00        nop     
422e ff        rst     $38
422f 00        nop     
4230 ff        rst     $38
4231 00        nop     
4232 ff        rst     $38
4233 00        nop     
4234 ff        rst     $38
4235 00        nop     
4236 ff        rst     $38
4237 00        nop     
4238 ff        rst     $38
4239 00        nop     
423a ff        rst     $38
423b 00        nop     
423c ff        rst     $38
423d 00        nop     
423e ff        rst     $38
423f 00        nop     
4240 ff        rst     $38
4241 00        nop     
4242 ff        rst     $38
4243 00        nop     
4244 ff        rst     $38
4245 00        nop     
4246 ff        rst     $38
4247 00        nop     
4248 ff        rst     $38
4249 00        nop     
424a ff        rst     $38
424b 00        nop     
424c ff        rst     $38
424d 00        nop     
424e ff        rst     $38
424f 00        nop     
4250 ff        rst     $38
4251 00        nop     
4252 ff        rst     $38
4253 00        nop     
4254 ff        rst     $38
4255 00        nop     
4256 ff        rst     $38
4257 00        nop     
4258 56        ld      d,(hl)
4259 ec8000    call    pe,$0080
425c 08        ex      af,af'
425d 00        nop     
425e 4c        ld      c,h
425f e3        ex      (sp),hl
4260 1c        inc     e
4261 eb        ex      de,hl
4262 4b        ld      c,e
4263 00        nop     
4264 00        nop     
4265 00        nop     
4266 91        sub     c
4267 bf        cp      a
4268 41        ld      b,c
4269 e0        ret     po

426a 43        ld      b,e
426b f7        rst     $30
426c 2240e6    ld      ($e640),hl
426f 03        inc     bc
4270 5a        ld      e,d
4271 364b      ld      (hl),$4b
4273 00        nop     
4274 f0        ret     p

4275 f0        ret     p

4276 1d        dec     e
4277 40        ld      b,b
4278 e8        ret     pe

4279 41        ld      b,c
427a 91        sub     c
427b bf        cp      a
427c 4c        ld      c,h
427d 00        nop     
427e e3        ex      (sp),hl
427f 05        dec     b
4280 e8        ret     pe
4281 41        ld      b,c
4282 74        ld      (hl),h
4283 03        inc     bc
4284 60        ld      h,b
4285 00        nop     
4286 c302ff    jp      $ff02
4289 00        nop     
428a ff        rst     $38
428b 00        nop     
428c ff        rst     $38
428d 00        nop     
428e ff        rst     $38
428f 00        nop     
4290 ff        rst     $38
4291 00        nop     
4292 ff        rst     $38
4293 00        nop     
4294 ff        rst     $38
4295 00        nop     
4296 ff        rst     $38
4297 00        nop     
4298 ff        rst     $38
4299 00        nop     
429a ff        rst     $38
429b 00        nop     
429c ff        rst     $38
429d 00        nop     
429e ff        rst     $38
429f 00        nop     
42a0 ff        rst     $38
42a1 00        nop     
42a2 ff        rst     $38
42a3 00        nop     
42a4 ff        rst     $38
42a5 00        nop     
42a6 ff        rst     $38
42a7 00        nop     
42a8 ff        rst     $38
42a9 00        nop     
42aa ff        rst     $38
42ab 00        nop     
42ac ff        rst     $38
42ad 00        nop     
42ae ff        rst     $38
42af 00        nop     
42b0 ff        rst     $38
42b1 00        nop     
42b2 ff        rst     $38
42b3 00        nop     
42b4 ff        rst     $38
42b5 00        nop     
42b6 ff        rst     $38
42b7 00        nop     
42b8 ff        rst     $38
42b9 00        nop     
42ba ff        rst     $38
42bb 00        nop     
42bc ff        rst     $38
42bd 00        nop     
42be ff        rst     $38
42bf 00        nop     
42c0 ff        rst     $38
42c1 00        nop     
42c2 ff        rst     $38
42c3 00        nop     
42c4 ff        rst     $38
42c5 00        nop     
42c6 ff        rst     $38
42c7 00        nop     
42c8 ff        rst     $38
42c9 00        nop     
42ca ff        rst     $38
42cb 00        nop     
42cc ff        rst     $38
42cd 00        nop     
42ce ff        rst     $38
42cf 00        nop     
42d0 ff        rst     $38
42d1 00        nop     
42d2 ff        rst     $38
42d3 00        nop     
42d4 ff        rst     $38
42d5 00        nop     
42d6 ff        rst     $38
42d7 00        nop     
42d8 ff        rst     $38
42d9 00        nop     
42da ff        rst     $38
42db 00        nop     
42dc ff        rst     $38
42dd 00        nop     
42de ff        rst     $38
42df 00        nop     
42e0 ff        rst     $38
42e1 00        nop     
42e2 ff        rst     $38
42e3 00        nop     
42e4 ff        rst     $38
42e5 00        nop     
42e6 ff        rst     $38
42e7 00        nop     
42e8 00        nop     
42e9 00        nop     
42ea 00        nop     
42eb 00        nop     
42ec 00        nop     
42ed 00        nop     
42ee 00        nop     
42ef 00        nop     
42f0 00        nop     
42f1 00        nop     
42f2 00        nop     
42f3 00        nop     
42f4 00        nop     
42f5 00        nop     
42f6 00        nop     
42f7 00        nop     
42f8 00        nop     
42f9 00        nop     
42fa 00        nop     
42fb 00        nop     
42fc 00        nop     
42fd 00        nop     
42fe 00        nop     
42ff 00        nop     
4300 310062    ld      sp,$6200
4303 3e00      ld      a,$00
4305 323d40    ld      ($403d),a
4308 210058    ld      hl,$5800
430b 0100a8    ld      bc,$a800
430e 36a5      ld      (hl),$a5
4310 23        inc     hl
4311 0b        dec     bc
4312 78        ld      a,b
4313 b1        or      c
4314 20f8      jr      nz,$430e
4316 2104ff    ld      hl,$ff04
4319 cd9e43    call    $439e
431c cd4102    call    $0241
431f dd21a943  ld      ix,$43a9
4323 ddbe00    cp      (ix+$00)
4326 dd23      inc     ix
4328 dd23      inc     ix
432a 20f0      jr      nz,$431c
432c af        xor     a
432d ddbe00    cp      (ix+$00)
4330 2806      jr      z,$4338
4332 cd8f43    call    $438f
4335 c32343    jp      $4323
4338 0e00      ld      c,$00
433a 217f74    ld      hl,$747f
433d cd8f43    call    $438f
4340 77        ld      (hl),a
4341 323f3c    ld      ($3c3f),a	
4344 81        add     a,c
4345 4f        ld      c,a
4346 2b        dec     hl
4347 7d        ld      a,l
4348 3c        inc     a
4349 c25343    jp      nz,$4353
434c cd8f43    call    $438f
434f b9        cp      c
4350 c26643    jp      nz,$4366
4353 7c        ld      a,h
4354 323e3c    ld      ($3c3e),a	
4357 fe61      cp      $61
4359 2002      jr      nz,$435d
435b 2657      ld      h,$57
435d fe42      cp      $42
435f c23d43    jp      nz,$433d
4362 3c        inc     a

				on original trs80 code, start of prog = entry point = 435d
				435d f3        di      
				435e 310062    ld      sp,$6200
				4361 3e43      ld      a,$43
				4363 cd9c49    ... contiues the same



4363 cd9c49    call    $499c		never returns
4366 214552    ld      hl,$5245		HL="RE"
4369 223c3c    ld      ($3c3c),hl	
436c c36c43    jp      $436c		in original trs80 fs1: jp $4363 
436f c5        push    bc		dead code: trs80 tape loader
4370 f5        push    af
4371 dbff      in      a,($ff)
4373 17        rla     
4374 30fb      jr      nc,$4371
4376 0641      ld      b,$41
4378 10fe      djnz    $4378
437a cd9b43    call    $439b
437d 0676      ld      b,$76
437f 10fe      djnz    $437f
4381 dbff      in      a,($ff)
4383 47        ld      b,a
4384 f1        pop     af
4385 cb10      rl      b
4387 17        rla     
4388 f5        push    af
4389 cd9b43    call    $439b
438c f1        pop     af
438d c1        pop     bc
438e c9        ret     

438f c5        push    bc
4390 e5        push    hl
4391 0608      ld      b,$08
4393 cd4102    call    $0241	on original trs80 fs1: call $436f
4396 10fb      djnz    $4393
4398 e1        pop     hl
4399 c1        pop     bc
439a c9        ret     

439b 2100ff    ld      hl,$ff00
439e 3a3d40    ld      a,($403d)	on original trs80 fs1: ld a,($42fe)
43a1 a4        and     h
43a2 b5        or      l
43a3 d3ff      out     ($ff),a		trs80 cassete port
43a5 323d40    ld      ($403d),a  	on original trs80 fs1: ld ($42fe),a
43a8 c9        ret     

					end of dead code

43a9 b1        or      c
43aa 00        nop     
43ab 83        add     a,e
43ac 00        nop     
43ad 79        ld      a,c
43ae 00        nop     
43af 5a        ld      e,d
43b0 00        nop     
43b1 00        nop     
43b2 00        nop     
43b3 00        nop     
43b4 00        nop     
43b5 00        nop     
43b6 00        nop     
43b7 00        nop     
43b8 00        nop     
43b9 00        nop     
43ba 00        nop     
43bb eb        ex      de,hl
43bc 2a3d01    ld      hl,($013d)
43bf 7e        ld      a,(hl)
43c0 17        rla     
43c1 77        ld      (hl),a
43c2 213f01    ld      hl,$013f
43c5 1f        rra     
43c6 380b      jr      c,$43d3
43c8 79        ld      a,c
43c9 fe17      cp      $17
43cb 3806      jr      c,$43d3
43cd 35        dec     (hl)
43ce cde923    call    $23e9
43d1 1811      jr      $43e4
43d3 35        dec     (hl)
43d4 c2e423    jp      nz,$23e4
43d7 3608      ld      (hl),$08
43d9 eb        ex      de,hl
43da 23        inc     hl
43db 3600      ld      (hl),$00
43dd 223d01    ld      ($013d),hl
43e0 214001    ld      hl,$0140
43e3 34        inc     (hl)
43e4 f1        pop     af
43e5 c1        pop     bc
43e6 d1        pop     de
43e7 e1        pop     hl
43e8 c9        ret     

43e9 3a4001    ld      a,($0140)
43ec b7        or      a
43ed c8        ret     z

43ee 3a6401    ld      a,($0164)
43f1 fe03      cp      $03
43f3 d8        ret     c

43f4 cd5524    call    $2455
43f7 3a7105    ld      a,($0571)
43fa b7        or      a
43fb 2004      jr      nz,$4401
43fd 0e3a      ld      c,$3a
43ff 1801      jr      $4402
4401 59        ld      e,c
4402 59        ld      e,c
4403 01c35d    ld      bc,$5dc3
4406 20c3      jr      nz,$43cb
4408 5c        ld      e,h
4409 27        daa     
440a c38b27    jp      $278b
440d c30c29    jp      $290c
4410 c30029    jp      $2900
4413 c31729    jp      $2917
4416 c31829    jp      $2918
4419 c3d120    jp      $20d1
441c c3
441d 0000              airspeed
441f 00        
4420 00        
4421 00        
4422 00        
4423 ff        
4424 98        
4425 017000    
4428 80        
4429 00        
442a 00        
442b 20

			plane state
442c 99		
442d 9b22		y pos 	of=1  (+40 --> ir atrás)
442f 43		00
4430 4f		00
4431 69        
4432 9522     		x pos 	of=6  (+40 --> ir a la dcha)
4434 49ed    	00
4436 00        	00
4437 0300        	altitude	of=11
4439 89        	00
443a e9         00
443b 00         
443c 00        		speed y if=16 (+10 --> ir atras)
443d 00        
443e e9         00
443f e0         00
4440 0e
4441 71fe      		heading angle (+10 -> heading right)	of=21
4443 3e      
4444 24        
4445 00        
4446 00        
4447 00        
4448 e9        
4449 3b        
444a 00        
444b 12        
444c ff        
444d ff        
444e ff        
444f ff        
4450 ff        
4451 ff        
4452 ff        
4453 ff        
4454 ff        

4455 4f        ld      c,a
4456 7c        ld      a,h
4457 02        ld      (bc),a
4458 0a        ld      a,(bc)
4459 00        nop     
445a 1094      djnz    $43f0
445c 2031      jr      nz,$448f
445e 5d        ld      e,l
445f 203e      jr      nz,$449f
4461 05        dec     b
4462 010100    ld      bc,$0001
4465 110105    ld      de,$0501
4468 210021    ld      hl,$2100
446b cd1ee9    call    $e91e		
446e c25d20    jp      nz,$205d
4471 3e04      ld      a,$04
4473 010101    ld      bc,$0101
4476 110100    ld      de,$0001
4479 210026    ld      hl,$2600
447c cd1ee9    call    $e91e		
447f c25d20    jp      nz,$205d
4482 3e59      ld      a,$59
4484 324f7c    ld      ($7c4f),a
4487 320220    ld      ($2002),a
448a cd1320    call    $2013
448d 3ae528    ld      a,($28e5)
4490 00        nop     
4491 00        nop     
4492 af        xor     a
4493 2031      jr      nz,$44c6
4495 5d        ld      e,l
4496 2021      jr      nz,$44b9
4498 d1        pop     de
4499 2022      jr      nz,$44bd
449b 1a        ld      a,(de)
449c 2021      jr      nz,$44bf
449e c620      add     a,$20
44a0 222d20    ld      ($202d),hl
44a3 af        xor     a
44a4 32e428    ld      ($28e4),a
44a7 062a      ld      b,$2a
44a9 cd
44aa 3100    			x scale
44ac 2800			y scale. was 1400 on original sorcerer port. This allow to double the
44ae 46      			x offset
44af 29      		        y offset was 14 on original sorcerer port. Same as above
44b0 00
44b1 04        inc     b
44b2 ff        rst     $38
44b3 7f        ld      a,a
44b4 ff        rst     $38
44b5 7f        ld      a,a
44b6 00        nop     
44b7 2000      jr      nz,$44b9
44b9 00        nop     
44ba 27        daa     
44bb 23        inc     hl
44bc 23        inc     hl
44bd ca0021    jp      z,$2100
44c0 23        inc     hl
44c1 23        inc     hl
44c2 00        nop     
44c3 00        nop     
44c4 00        nop     
44c5 00        nop     			[44c5]=throttle
44c6 00        nop     
44c7 00        nop     
44c8 00        nop     
44c9 00        nop     
44ca 00        nop     
44cb 00        nop     
44cc 00        nop     
44cd 00        nop     
44ce c39420    jp      $2094
44d1 00        nop     
44d2 00        nop     
44d3 00        nop     			[44d3]=1->map view, =0->forward view
44d4 50        ld      d,b
44d5 04        inc     b
44d6 b8        cp      b
44d7 0b        dec     bc
44d8 00        nop     
44d9 00        nop     
44da 2823      jr      z,$44ff
44dc 89        adc     a,c
44dd 00        nop     
44de 00        nop     
44df 07        rlca    
44e0 27        daa     
44e1 17        rla     
44e2 17        rla     
44e3 25        dec     h
44e4 03        inc     bc
44e5 19        add     hl,de
44e6 00        nop     
44e7 00        nop     
44e8 010140    ld      bc,$4001
44eb 010a14    ld      bc,$140a
44ee 010000    ld      bc,$0000
44f1 b8        cp      b
44f2 0b        dec     bc
44f3 00        nop     
44f4 00        nop     
44f5 2823      jr      z,$451a
44f7 89        adc     a,c
44f8 00        nop     
44f9 00        nop     
44fa 0f        rrca    
44fb 1f        rra     
44fc 27        daa     
44fd 1f        rra     
44fe 19        add     hl,de
44ff 012000    ld      bc,$0020
4502 00        nop     
4503 00        nop     
4504 00        nop     
4505 f0        ret     p

4506 00        nop     
4507 0a        ld      a,(bc)
4508 14        inc     d
4509 010000    ld      bc,$0000
450c b8        cp      b
450d 0b        dec     bc
450e 00        nop     
450f 00        nop     
4510 2823      jr      z,$4535
4512 59        ld      e,c
4513 00        nop     
4514 00        nop     
4515 13        inc     de
4516 1f        rra     
4517 1f        rra     
4518 100a      djnz    $4524
451a 02        ld      (bc),a
451b 2000      jr      nz,$451d
451d 00        nop     
451e 00        nop     
451f 00        nop     
4520 f0        ret     p

4521 00        nop     
4522 0a        ld      a,(bc)
4523 1e01      ld      e,$01
4525 00        nop     
4526 00        nop     
4527 b8        cp      b
4528 0b        dec     bc
4529 00        nop     
452a 00        nop     
452b 2823      jr      z,$4550
452d 89        adc     a,c
452e 00        nop     
452f 00        nop     
4530 15        dec     d
4531 1f        rra     
4532 17        rla     
4533 00        nop     
4534 14        inc     d
4535 02        ld      (bc),a
4536 14        inc     d
4537 00        nop     
4538 00        nop     
4539 00        nop     
453a 00        nop     
453b a0        and     b
453c 00        nop     
453d 0a        ld      a,(bc)
453e 1e01      ld      e,$01
4540 00        nop     
4541 00        nop     
4542 b8        cp      b
4543 0b        dec     bc
4544 00        nop     
4545 00        nop     
4546 2823      jr      z,$456b
4548 89        adc     a,c
4549 00        nop     
454a 00        nop     
454b 17        rla     
454c 1f        rra     
454d 1f        rra     
454e 100a      djnz    $455a
4550 010f00    ld      bc,$000f
4553 00        nop     
4554 00        nop     
4555 00        nop     
4556 78        ld      a,b
4557 00        nop     
4558 0a        ld      a,(bc)
4559 1e01      ld      e,$01
455b 00        nop     
455c 00        nop     
455d 010000    ld      bc,$0000
4560 00        nop     
4561 00        nop     
4562 00        nop     
4563 00        nop     
4564 02        ld      (bc),a
4565 e0        ret     po

4566 2e00      ld      l,$00
4568 00        nop     
4569 00        nop     
456a 00        nop     
456b 02        ld      (bc),a
456c e0        ret     po

456d 2e00      ld      l,$00
456f 00        nop     
4570 e0        ret     po

4571 2e02      ld      l,$02
4573 00        nop     
4574 00        nop     
4575 00        nop     
4576 00        nop     
4577 e0        ret     po

4578 2e02      ld      l,$02
457a 00        nop     
457b 00        nop     
457c 00        nop     
457d 00        nop     
457e 00        nop     
457f 00        nop     
4580 010000    ld      bc,$0000
4583 00        nop     
4584 00        nop     
4585 d0        ret     nc

4586 07        rlca    
4587 02        ld      (bc),a
4588 e0        ret     po

4589 2e00      ld      l,$00
458b 00        nop     
458c d0        ret     nc

458d 07        rlca    
458e 010000    ld      bc,$0000
4591 00        nop     
4592 00        nop     
4593 a0        and     b
4594 0f        rrca    
4595 02        ld      (bc),a
4596 e0        ret     po

4597 2e00      ld      l,$00
4599 00        nop     
459a a0        and     b
459b 0f        rrca    
459c 010000    ld      bc,$0000
459f 00        nop     
45a0 00        nop     
45a1 70        ld      (hl),b
45a2 17        rla     
45a3 02        ld      (bc),a
45a4 e0        ret     po

45a5 2e00      ld      l,$00
45a7 00        nop     
45a8 70        ld      (hl),b
45a9 17        rla     
45aa 010000    ld      bc,$0000
45ad 00        nop     
45ae 00        nop     
45af 40        ld      b,b
45b0 1f        rra     
45b1 02        ld      (bc),a
45b2 e0        ret     po

45b3 2e00      ld      l,$00
45b5 00        nop     
45b6 40        ld      b,b
45b7 1f        rra     
45b8 010000    ld      bc,$0000
45bb 00        nop     
45bc 00        nop     
45bd 1027      djnz    $45e6
45bf 02        ld      (bc),a
45c0 e0        ret     po

45c1 2e00      ld      l,$00
45c3 00        nop     
45c4 1027      djnz    $45ed
45c6 01d007    ld      bc,$07d0
45c9 00        nop     
45ca 00        nop     
45cb 00        nop     
45cc 00        nop     
45cd 02        ld      (bc),a
45ce d0        ret     nc

45cf 07        rlca    
45d0 00        nop     
45d1 00        nop     
45d2 e0        ret     po

45d3 2e01      ld      l,$01
45d5 a0        and     b
45d6 0f        rrca    
45d7 00        nop     
45d8 00        nop     
45d9 00        nop     
45da 00        nop     
45db 02        ld      (bc),a
45dc a0        and     b
45dd 0f        rrca    
45de 00        nop     
45df 00        nop     
45e0 e0        ret     po

45e1 2e01      ld      l,$01
45e3 70        ld      (hl),b
45e4 17        rla     
45e5 00        nop     
45e6 00        nop     
45e7 00        nop     
45e8 00        nop     
45e9 02        ld      (bc),a
45ea 70        ld      (hl),b
45eb 17        rla     
45ec 00        nop     
45ed 00        nop     
45ee e0        ret     po

45ef 2e01      ld      l,$01
45f1 40        ld      b,b
45f2 1f        rra     
45f3 00        nop     
45f4 00        nop     
45f5 00        nop     
45f6 00        nop     
45f7 02        ld      (bc),a
45f8 40        ld      b,b
45f9 1f        rra     
45fa 00        nop     
45fb 00        nop     
45fc e0        ret     po

45fd 2e01      ld      l,$01
45ff 1027      djnz    $4628
4601 00        nop     
4602 00        nop     
4603 00        nop     
4604 00        nop     
4605 02        ld      (bc),a
4606 1027      djnz    $462f
4608 00        nop     
4609 00        nop     
460a e0        ret     po

460b 2e01      ld      l,$01
460d 00        nop     
460e 00        nop     
460f 00        nop     
4610 00        nop     
4611 e0        ret     po

4612 2e02      ld      l,$02
4614 e8        ret     pe

4615 03        inc     bc
4616 2003      jr      nz,$461b
4618 e0        ret     po

4619 2e02      ld      l,$02
461b d0        ret     nc

461c 07        rlca    
461d fa00e0    jp      m,$e000
4620 2e02      ld      l,$02
4622 f0        ret     p

4623 0a        ld      a,(bc)
4624 f401e0    call    p,$e001
4627 2e02      ld      l,$02
4629 74        ld      (hl),h
462a 0e40      ld      c,$40
462c 01e02e    ld      bc,$2ee0
462f 03        inc     bc
4630 88        adc     a,b
4631 13        inc     de
4632 00        nop     
4633 00        nop     
4634 e0        ret     po

4635 2e02      ld      l,$02
4637 50        ld      d,b
4638 14        inc     d
4639 58        ld      e,b
463a 02        ld      (bc),a
463b e0        ret     po

463c 2e02      ld      l,$02
463e d417c2    call    nc,$c217
4641 01e02e    ld      bc,$2ee0
4644 03        inc     bc
4645 14        inc     d
4646 1e00      ld      e,$00
4648 00        nop     
4649 e0        ret     po

464a 2e02      ld      l,$02
464c 201c      jr      nz,$466a
464e bc        cp      h
464f 02        ld      (bc),a
4650 e0        ret     po

4651 2e02      ld      l,$02
4653 40        ld      b,b
4654 1f        rra     
4655 f401e0    call    p,$e001
4658 2e03      ld      l,$03
465a 98        sbc     a,b
465b 21c800    ld      hl,$00c8
465e e0        ret     po

465f 2e02      ld      l,$02
4661 80        add     a,b
4662 25        dec     h
4663 e8        ret     pe

4664 03        inc     bc
4665 e0        ret     po

4666 2e02      ld      l,$02
4668 e0        ret     po

4669 2e00      ld      l,$00
466b 00        nop     
466c e0        ret     po

466d 2e01      ld      l,$01
466f fc2100    call    m,$0021
4672 00        nop     
4673 e0        ret     po

4674 2e02      ld      l,$02
4676 1c        inc     e
4677 25        dec     h
4678 90        sub     b
4679 01e02e    ld      bc,$2ee0
467c 02        ld      (bc),a
467d 68        ld      l,b
467e 29        add     hl,hl
467f 00        nop     
4680 00        nop     
4681 e0        ret     po

4682 2e01      ld      l,$01
4684 b0        or      b
4685 27        daa     
4686 00        nop     
4687 00        nop     
4688 64        ld      h,h
4689 2d        dec     l
468a 02        ld      (bc),a
468b a0        and     b
468c 2d        dec     l
468d 00        nop     
468e 00        nop     
468f 64        ld      h,h
4690 2d        dec     l
4691 02        ld      (bc),a
4692 a0        and     b
4693 2d        dec     l
4694 00        nop     
4695 00        nop     
4696 e8        ret     pe

4697 2b        dec     hl
4698 02        ld      (bc),a
4699 382c      jr      c,$46c7
469b 00        nop     
469c 00        nop     
469d e8        ret     pe

469e 2b        dec     hl
469f 02        ld      (bc),a
46a0 382c      jr      c,$46ce
46a2 00        nop     
46a3 00        nop     
46a4 00        nop     
46a5 2d        dec     l
46a6 02        ld      (bc),a
46a7 a0        and     b
46a8 2d        dec     l
46a9 00        nop     
46aa 00        nop     
46ab 00        nop     
46ac 2d        dec     l
46ad 01c80f    ld      bc,$0fc8
46b0 00        nop     
46b1 00        nop     
46b2 6c        ld      l,h
46b3 0c        inc     c
46b4 02        ld      (bc),a
46b5 e41600    call    po,$0016
46b8 00        nop     
46b9 6c        ld      l,h
46ba 0c        inc     c
46bb 011810    ld      bc,$1018
46be 00        nop     
46bf 00        nop     
46c0 3c        inc     a
46c1 0f        rrca    
46c2 02        ld      (bc),a
46c3 e41600    call    po,$0016
46c6 00        nop     
46c7 70        ld      (hl),b
46c8 08        ex      af,af'
46c9 01b810    ld      bc,$10b8
46cc 00        nop     
46cd 00        nop     
46ce e0        ret     po

46cf 0b        dec     bc
46d0 02        ld      (bc),a
46d1 2012      jr      nz,$46e5
46d3 00        nop     
46d4 00        nop     
46d5 e0        ret     po

46d6 0b        dec     bc
46d7 03        inc     bc
46d8 40        ld      b,b
46d9 15        dec     d
46da 00        nop     
46db 00        nop     
46dc 98        sbc     a,b
46dd 08        ex      af,af'
46de 01d80e    ld      bc,$0ed8
46e1 00        nop     
46e2 00        nop     
46e3 58        ld      e,b
46e4 2002      jr      nz,$46e8
46e6 180b      jr      $46f3
46e8 00        nop     
46e9 00        nop     
46ea 58        ld      e,b
46eb 2003      jr      nz,$46f0
46ed 100e      djnz    $46fd
46ef 00        nop     
46f0 00        nop     
46f1 78        ld      a,b
46f2 23        inc     hl
46f3 01e80d    ld      bc,$0de8
46f6 00        nop     
46f7 00        nop     
46f8 e0        ret     po

46f9 1f        rra     
46fa 02        ld      (bc),a
46fb 08        ex      af,af'
46fc 0c        inc     c
46fd 00        nop     
46fe 00        nop     
46ff f0        ret     p

4700 23        inc     hl
4701 00        nop     
4702 c0        ret     nz

4703 03        inc     bc
4704 00        nop     
4705 00        nop     
4706 c0        ret     nz

4707 2a8901    ld      hl,($0189)
470a e0        ret     po

470b b1        or      c
470c 00        nop     
470d 00        nop     
470e 1027      djnz    $4737
4710 02        ld      (bc),a
4711 204e      jr      nz,$4761
4713 00        nop     
4714 00        nop     
4715 1027      djnz    $473e
4717 01e0b1    ld      bc,$b1e0
471a 00        nop     
471b 00        nop     
471c 00        nop     
471d 00        nop     
471e 02        ld      (bc),a
471f 204e      jr      nz,$476f
4721 00        nop     
4722 00        nop     
4723 00        nop     
4724 00        nop     
4725 010000    ld      bc,$0000
4728 00        nop     
4729 00        nop     
472a f0        ret     p

472b d8        ret     c

472c 02        ld      (bc),a
472d 00        nop     
472e 00        nop     
472f 00        nop     
4730 00        nop     
4731 204e      jr      nz,$4781
4733 011027    ld      bc,$2710
4736 00        nop     
4737 00        nop     
4738 f0        ret     p

4739 d8        ret     c

473a 02        ld      (bc),a
473b 1027      djnz    $4764
473d 00        nop     
473e 00        nop     
473f 204e      jr      nz,$478f
4741 012003    ld      bc,$0320
4744 00        nop     
4745 00        nop     
4746 40        ld      b,b
4747 1f        rra     
4748 02        ld      (bc),a
4749 6c        ld      l,h
474a 2000      jr      nz,$474c
474c 00        nop     
474d 40        ld      b,b
474e 1f        rra     
474f 02        ld      (bc),a
4750 6c        ld      l,h
4751 2000      jr      nz,$4753
4753 00        nop     
4754 b0        or      b
4755 1d        dec     e
4756 02        ld      (bc),a
4757 c8        ret     z

4758 19        add     hl,de
4759 00        nop     
475a 00        nop     
475b b0        or      b
475c 1d        dec     e
475d 02        ld      (bc),a
475e c8        ret     z

475f 19        add     hl,de
4760 00        nop     
4761 00        nop     
4762 3818      jr      c,$477c
4764 02        ld      (bc),a
4765 d0        ret     nc

4766 2000      jr      nz,$4768
4768 00        nop     
4769 3818      jr      c,$4783
476b 02        ld      (bc),a
476c d0        ret     nc

476d 2000      jr      nz,$476f
476f 00        nop     
4770 08        ex      af,af'
4771 2002      jr      nz,$4775
4773 2003      jr      nz,$4778
4775 00        nop     
4776 00        nop     
4777 08        ex      af,af'
4778 2002      jr      nz,$477c
477a 2003      jr      nz,$477f
477c 00        nop     
477d 00        nop     
477e 40        ld      b,b
477f 1f        rra     
4780 01901a    ld      bc,$1a90
4783 00        nop     
4784 00        nop     
4785 00        nop     
4786 19        add     hl,de
4787 02        ld      (bc),a
4788 201c      jr      nz,$47a6
478a 00        nop     
478b 00        nop     
478c 00        nop     
478d 19        add     hl,de
478e 02        ld      (bc),a
478f 201c      jr      nz,$47ad
4791 00        nop     
4792 00        nop     
4793 90        sub     b
4794 1a        ld      a,(de)
4795 02        ld      (bc),a
4796 90        sub     b
4797 1a        ld      a,(de)
4798 00        nop     
4799 00        nop     
479a 90        sub     b
479b 1a        ld      a,(de)
479c 02        ld      (bc),a
479d 90        sub     b
479e 1a        ld      a,(de)
479f 00        nop     
47a0 00        nop     
47a1 00        nop     
47a2 19        add     hl,de
47a3 014803    ld      bc,$0348
47a6 00        nop     
47a7 00        nop     
47a8 a4        and     h
47a9 1f        rra     
47aa 02        ld      (bc),a
47ab 78        ld      a,b
47ac 05        dec     b
47ad 00        nop     
47ae 00        nop     
47af a4        and     h
47b0 1f        rra     
47b1 014006    ld      bc,$0640
47b4 00        nop     
47b5 00        nop     
47b6 a4        and     h
47b7 1f        rra     
47b8 02        ld      (bc),a
47b9 d0        ret     nc

47ba 07        rlca    
47bb 00        nop     
47bc 00        nop     
47bd a4        and     h
47be 1f        rra     
47bf 019808    ld      bc,$0898
47c2 00        nop     
47c3 00        nop     
47c4 a4        and     h
47c5 1f        rra     
47c6 02        ld      (bc),a
47c7 280a      jr      z,$47d3
47c9 00        nop     
47ca 00        nop     
47cb a4        and     h
47cc 1f        rra     
47cd 01f00a    ld      bc,$0af0
47d0 00        nop     
47d1 00        nop     
47d2 a4        and     h
47d3 1f        rra     
47d4 02        ld      (bc),a
47d5 80        add     a,b
47d6 0c        inc     c
47d7 00        nop     
47d8 00        nop     
47d9 a4        and     h
47da 1f        rra     
47db 01480d    ld      bc,$0d48
47de 00        nop     
47df 00        nop     
47e0 a4        and     h
47e1 1f        rra     
47e2 02        ld      (bc),a
47e3 d8        ret     c

47e4 0e00      ld      c,$00
47e6 00        nop     
47e7 a4        and     h
47e8 1f        rra     
47e9 01a00f    ld      bc,$0fa0
47ec 00        nop     
47ed 00        nop     
47ee a4        and     h
47ef 1f        rra     
47f0 02        ld      (bc),a
47f1 3011      jr      nc,$4804
47f3 00        nop     
47f4 00        nop     
47f5 a4        and     h
47f6 1f        rra     
47f7 01f811    ld      bc,$11f8
47fa 00        nop     
47fb 00        nop     
47fc a4        and     h
47fd 1f        rra     
47fe 02        ld      (bc),a
47ff 88        adc     a,b
4800 13        inc     de
4801 00        nop     
4802 00        nop     
4803 a4        and     h
4804 1f        rra     
4805 015014    ld      bc,$1450
4808 00        nop     
4809 00        nop     
480a a4        and     h
480b 1f        rra     
480c 02        ld      (bc),a
480d e0        ret     po

480e 15        dec     d
480f 00        nop     
4810 00        nop     
4811 a4        and     h
4812 1f        rra     
4813 01a816    ld      bc,$16a8
4816 00        nop     
4817 00        nop     
4818 a4        and     h
4819 1f        rra     
481a 02        ld      (bc),a
481b 3818      jr      c,$4835
481d 00        nop     
481e 00        nop     
481f a4        and     h
4820 1f        rra     
4821 010019    ld      bc,$1900
4824 00        nop     
4825 00        nop     
4826 a4        and     h
4827 1f        rra     
4828 02        ld      (bc),a
4829 90        sub     b
482a 1a        ld      a,(de)
482b 00        nop     
482c 00        nop     
482d a4        and     h
482e 1f        rra     
482f 01581b    ld      bc,$1b58
4832 00        nop     
4833 00        nop     
4834 a4        and     h
4835 1f        rra     
4836 02        ld      (bc),a
4837 e8        ret     pe

4838 1c        inc     e
4839 00        nop     
483a 00        nop     
483b a4        and     h
483c 1f        rra     
483d 01b01d    ld      bc,$1db0
4840 00        nop     
4841 00        nop     
4842 a4        and     h
4843 1f        rra     
4844 02        ld      (bc),a
4845 40        ld      b,b
4846 1f        rra     
4847 00        nop     
4848 00        nop     
4849 a4        and     h
484a 1f        rra     
484b 89        adc     a,c
484c ff        rst     $38
484d 7f        ld      a,a
484e f5        push    af
484f 7f        ld      a,a
4850 d7        rst     $10
4851 7f        ld      a,a
4852 a6        and     (hl)
4853 7f        ld      a,a
4854 61        ld      h,c
4855 7f        ld      a,a
4856 09        add     hl,bc
4857 7f        ld      a,a
4858 9c        sbc     a,h
4859 7e        ld      a,(hl)
485a 1c        inc     e
485b 7e        ld      a,(hl)
485c 89        adc     a,c
485d 7d        ld      a,l
485e e3        ex      (sp),hl
485f 7c        ld      a,h
4860 29        add     hl,hl
4861 7c        ld      a,h
4862 5c        ld      e,h
4863 7b        ld      a,e
4864 7c        ld      a,h
4865 7a        ld      a,d
4866 89        adc     a,c
4867 79        ld      a,c
4868 83        add     a,e
4869 78        ld      a,b
486a 6b        ld      l,e
486b 77        ld      (hl),a
486c 40        ld      b,b
486d 76        halt    
486e 03        inc     bc
486f 75        ld      (hl),l
4870 b5        or      l
4871 73        ld      (hl),e
4872 54        ld      d,h
4873 72        ld      (hl),d
4874 e1        pop     hl
4875 70        ld      (hl),b
4876 5e        ld      e,(hl)
4877 6f        ld      l,a
4878 c9        ret     

4879 6d        ld      l,l
487a 23        inc     hl
487b 6c        ld      l,h
487c 6c        ld      l,h
487d 6a        ld      l,d
487e 79        ld      a,c
487f 67        ld      h,a
4880 ce66      adc     a,$66
4882 e7        rst     $20
4883 64        ld      h,h
4884 f1        pop     af
4885 62        ld      h,d
4886 eb        ex      de,hl
4887 60        ld      h,b
4888 d65e      sub     $5e
488a b3        or      e
488b 5c        ld      e,h
488c 81        add     a,c
488d 5a        ld      e,d
488e 42        ld      b,d
488f 58        ld      e,b
4890 f4559a    call    p,$9a55
4893 53        ld      d,e
4894 33        inc     sp
4895 51        ld      d,c
4896 bf        cp      a
4897 4e        ld      c,(hl)
4898 3f        ccf     
4899 4c        ld      c,h
489a b3        or      e
489b 49        ld      c,c
489c 1c        inc     e
489d 47        ld      b,a
489e 7a        ld      a,d
489f 44        ld      b,h
48a0 cd4116    call    $1641
48a3 3f        ccf     
48a4 56        ld      d,(hl)
48a5 3c        inc     a
48a6 8c        adc     a,h
48a7 39        add     hl,sp
48a8 b9        cp      c
48a9 36de      ld      (hl),$de
48ab 33        inc     sp
48ac fb        ei      
48ad 3010      jr      nc,$48bf
48af 2e1f      ld      l,$1f
48b1 2b        dec     hl
48b2 2628      ld      h,$28
48b4 27        daa     
48b5 25        dec     h
48b6 23        inc     hl
48b7 22191f    ld      ($1f19),hl
48ba 0b        dec     bc
48bb 1c        inc     e
48bc f9        ld      sp,hl
48bd 18e1      jr      $48a0
48bf 15        dec     d
48c0 c7        rst     $00
48c1 12        ld      (de),a
48c2 ab        xor     e
48c3 0f        rrca    
48c4 8c        adc     a,h
48c5 0c        inc     c
48c6 6a        ld      l,d
48c7 09        add     hl,bc
48c8 47        ld      b,a
48c9 0624      ld      b,$24
48cb 03        inc     bc
48cc 00        nop     
48cd 00        nop     
48ce a8        xor     b
48cf 00        nop     
48d0 00        nop     
48d1 00        nop     
48d2 00        nop     
48d3 00        nop     
48d4 00        nop     
48d5 00        nop     
48d6 80        add     a,b
48d7 00        nop     
48d8 24        inc     h
48d9 00        nop     
48da 04        inc     b
48db 00        nop     
48dc 70        ld      (hl),b
48dd 2648      ld      h,$48
48df 03        inc     bc
48e0 7a        ld      a,d
48e1 c47ac4    call    nz,$c47a
48e4 00        nop     
48e5 00        nop     
48e6 54        ld      d,h
48e7 00        nop     
48e8 17        rla     
48e9 00        nop     
48ea 04        inc     b
48eb 00        nop     
48ec 7c        ld      a,h
48ed 19        add     hl,de
48ee 48        ld      c,b
48ef 03        inc     bc
48f0 7a        ld      a,d
48f1 c47ac4    call    nz,$c47a
48f4 00        nop     
48f5 00        nop     
48f6 54        ld      d,h
48f7 00        nop     
48f8 17        rla     
48f9 00        nop     
48fa 04        inc     b
48fb 00        nop     
48fc 70        ld      (hl),b
48fd 26b7      ld      h,$b7
48ff 20b8      jr      nz,$48b9
4901 0b        dec     bc
4902 00        nop     
4903 00        nop     
4904 2823      jr      z,$4929
4906 f0        ret     p

4907 28
4908 7df5      dw $f57d		video ram table done
490a b0
490b 00
490c 7df5
490e 8c   
490f 00   
4910 7df5 
4912 83  
4913 00  
4914 3df5
4916 b0
4917 00
4918 3df5
491a 8c  
491b 00  
491c 3df5
491e 83  
491f 00  
4920 fdf4
4922 b0
4923 00
4924 fdf4
4926 8c
4927 00
4928 fdf4
492a 83
492b 00
492c bdf4
492e b0
492f 00
4930 bdf4
     8c00 
4934 bdf4
     8300 
4938 7df4
     b000 
493c 7df4
     8c00 
4940 7df4
     8300 
4944 7df4
     8300 
4948 e1f7     
494a a8     
494b 82     
494c e3f7
494e 94  
494f 81  
4950 e4f7
     a8 
4953 82 
4954 e6f7
4956 94  
4957 81  
4958 e7f7
495a a8  
495b 82  
495c e9f7
495e 94  
495f 81  
4960 eaf7
     a8 
4963 82  
4964 ecf7
     94
4967 81 
4968 edf7  
496a a8    
496b 82    
496c eff7 
496e 94   
496f 81   
4970 f0f7
4972 a8  
4973 82  
4974 f2f7
     94
4977 81
4978 f3f7
497a a8
497b 82
497c f5f7
497e 94  
497f 81  
4980 f6f7
4982 a8  
4983 82  
4984 f8f7
4986 94  
4987 81  
4988 f9f7
498a a8  
498b 82  
498c fbf7
498e 94  
498f 81  
4990 fcf7
     a8    
4993 82        
4994 fef7      
4996 94        
4997 81        
4998 00        nop     
4999 00        nop     
499a 00        nop     
499b 20

			main program loop (never exists)

499c ed739949  ld      ($4999),sp
49a0 21f3c3    ld      hl,$c3f3
49a3 226243    ld      ($4362),hl
49a6 21b249    ld      hl,$49b2
49a9 226443    ld      ($4364),hl
49ac 320040    ld      ($4000),a
49af c3b749    jp      $49b7
49b2 219849    ld      hl,$4998
49b5 3620      ld      (hl),$20
49b7 cdf872    call    $72f8
49ba 21f872    ld      hl,$72f8		
49bd 229444    ld      ($4494),hl
49c0 210c44    ld      hl,$440c
49c3 34        inc     (hl)
49c4 cd0d4a    call    $4a0d
49c7 cd0a4b    call    $4b0a
49ca cdd04e    call    $4ed0
49cd cd9450    call    $5094
49d0 cd1b52    call    $521b
49d3 3a5444    ld      a,($4454)
49d6 b7        or      a
49d7 fae749    jp      m,$49e7
49da 3a2244    ld      a,($4422)
49dd b7        or      a
49de c46452    call    nz,$5264
49e1 215d45    ld      hl,$455d
49e4 c3ea49    jp      $49ea
49e7 210947    ld      hl,$4709
49ea 229244    ld      ($4492),hl
49ed cd046f    call    $6f04		
49f0 21f872    ld      hl,$72f8
49f3 229444    ld      ($4494),hl
49f6 cd0664    call    $6406		clear screen
49f9 cd6164    call    $6461		draw scenary proyected lines in screen
49fc 3a2244    ld      a,($4422)
49ff b7        or      a
4a00 c4ae51    call    nz,$51ae
4a03 3ad344    ld      a,($44d3)	[44d3]=1->map view, =0->forward view
4a06 b7        or      a
4a07 c44e54    call    nz,$544e
4a0a c3ba49    jp      $49ba

4a0d 210444    ld      hl,$4404
4a10 229d49    ld      ($499d),hl
4a13 c3174a    jp      $4a17		jump read keyboard
4a16 c9        ret     

4a17 dd210138  ld      ix,$3801
4a1b cd0078    call    $7800		read key from keyboard
4a1e b7        or      a
4a1f c8        ret     
4a20 fe20      cp      $20		space -> fire
4a22 2003      jr      nz,$4a27
4a24 c31e55    jp      $551e
4a27 fe39      cp      $39 		'9 throttle up
4a29 2009      jr      nz,$4a34
4a2b 3e10      ld      a,$10
4a2d 21c544    ld      hl,$44c5		[44c5]=throttle
4a30 86        add     a,(hl)
4a31 d8        ret     c
4a32 77        ld      (hl),a
4a33 c9        ret     
4a34 fe37      cp      $37 		'7 throttle down
4a36 2009      jr      nz,$4a41
4a38 3ef0      ld      a,$f0
4a3a 21c544    ld      hl,$44c5		[44c5]=throttle
4a3d 86        add     a,(hl)
4a3e d0        ret     nc
4a3f 77        ld      (hl),a
4a40 c9        ret     
4a41 fe2b      cp      $2b 		'+ map
4a43 2006      jr      nz,$4a4b
4a45 3e01      ld      a,$01
4a47 32d344    ld      ($44d3),a	[44d3]=1->map view, =0->forward view
4a4a c9        ret     
4a4b fe2a      cp      $2a 		'* forward view
4a4d 2005      jr      nz,$4a54
4a4f af        xor     a
4a50 32d344    ld      ($44d3),a	[44d3]=1->map view, =0->forward view
4a53 c9        ret     
4a54 fe30      cp      $30 		'0 break
4a56 2011      jr      nz,$4a69
4a58 3a2344    ld      a,($4423)	
4a5b b7        or      a
4a5c c8        ret     z
4a5d 211e44    ld      hl,$441e		[441e]=speed (16bit value)
4a60 35        dec     (hl)
4a61 f0        ret     p
4a62 210000    ld      hl,$0000
4a65 221d44    ld      ($441d),hl
4a68 c9        ret     
4a69 fe3d      cp      $3d 		'= bomb (war must be declared)
4a6b cadd54    jp      z,$54dd
4a6e fe36      cp      $36 		'6 turn right
4a70 2018      jr      nz,$4a8a
4a72 3e10      ld      a,$10
4a74 21c344    ld      hl,$44c3		[44c4]=rudder?
4a77 86        add     a,(hl)
4a78 e8        ret     pe
4a79 77        ld      (hl),a
4a7a 2a9949    ld      hl,($4999)
4a7d 7d        ld      a,l
4a7e fefe      cp      $fe
4a80 c4eb4a    call    nz,$4aeb
4a83 7c        ld      a,h
4a84 fe61      cp      $61 		
4a86 c4eb4a    call    nz,$4aeb
4a89 c9        ret     
4a8a fe35      cp      $35 		'5 center yoke
4a8c 2006      jr      nz,$4a94
4a8e 3e00      ld      a,$00
4a90 32c344    ld      ($44c3),a
4a93 c9        ret     
4a94 fe34      cp      $34 		'4 turn left
4a96 2004      jr      nz,$4a9c
4a98 3ef0      ld      a,$f0
4a9a 18d8      jr      $4a74
4a9c fe2f      cp      $2f		'/ down view
4a9e 2005      jr      nz,$4aa5
4aa0 3eff      ld      a,$ff
4aa2 00        nop     
4aa3 181e      jr      $4ac3
4aa5 fe32      cp      $32		'2 yoke down 
4aa7 280e      jr      z,$4ab7
4aa9 fe57      cp      $57 		'W declare war
4aab 2006      jr      nz,$4ab3
4aad 3e01      ld      a,$01
4aaf 322244    ld      ($4422),a	war?
4ab2 c9        ret     
4ab3 fe56      cp      $56 'V		'V yoke down 
4ab5 2007      jr      nz,$4abe
4ab7 3e10      ld      a,$10
4ab9 21c744    ld      hl,$44c7		yoke up/down?
4abc 18b9      jr      $4a77
4abe fe2d      cp      $2d '-		'- up view
4ac0 2007      jr      nz,$4ac9
4ac2 af        xor     a
4ac3 325444    ld      ($4454),a
4ac6 c30552    jp      $5205
4ac9 fe38      cp      $38 '8		'8 yoke up
4acb 2004      jr      nz,$4ad1
4acd 3ef0      ld      a,$f0
4acf 18e8      jr      $4ab9
4ad1 fe0d      cp      $0d		enter -> reset flight
4ad3 c0        ret     nz
4ad4 c36e55    jp      $556e
4ad7 00        nop     
4ad8 00        nop     
4ad9 00        nop     
4ada 00        nop     
4adb 00        nop     
4adc 00        nop     
4add 00        nop     
4ade 00        nop     
4adf 00        nop     
4ae0 00        nop     
4ae1 00        nop     
4ae2 00        nop     
4ae3 00        nop     
4ae4 00        nop     
4ae5 00        nop     
4ae6 00        nop     
4ae7 00        nop     
4ae8 00        nop     
4ae9 00        nop     
4aea 00        nop     
4aeb ed5bcb44  ld      de,($44cb)
4aef 217cfc    ld      hl,$fc7c
4af2 19        add     hl,de
4af3 d0        ret     nc

4af4 211f7a    ld      hl,$7a1f
4af7 29        add     hl,hl
4af8 3652      ld      (hl),$52
4afa 34        inc     (hl)
4afb 23        inc     hl
4afc 3642      ld      (hl),$42
4afe 35        dec     (hl)
4aff 210080    ld      hl,$8000
4b02 110040    ld      de,$4000
4b05 010080    ld      bc,$8000
4b08 edb0      ldir  


  
4b0a cdbc4c    call    $4cbc
4b0d dd213b44  ld      ix,$443b
4b11 cde555    call    $55e5
4b14 223b44    ld      ($443b),hl
4b17 323d44    ld      ($443d),a
4b1a fa5e4b    jp      m,$4b5e
4b1d cd234b    call    $4b23
4b20 c3674b    jp      $4b67
4b23 11e16d    ld      de,$6de1
4b26 19        add     hl,de
4b27 cefe      adc     a,$fe
4b29 d0        ret     nc

4b2a 2a3b44    ld      hl,($443b)
4b2d 3a3d44    ld      a,($443d)
4b30 cdf055    call    $55f0
4b33 cdfa55    call    $55fa
4b36 cd0256    call    $5602
4b39 223b44    ld      ($443b),hl
4b3c 323d44    ld      ($443d),a
4b3f 2a4544    ld      hl,($4445)
4b42 3a4744    ld      a,($4447)
4b45 cdfa55    call    $55fa
4b48 224544    ld      ($4445),hl
4b4b 324744    ld      ($4447),a
4b4e 2a4044    ld      hl,($4440)
4b51 3a4244    ld      a,($4442)
4b54 cdfa55    call    $55fa
4b57 224044    ld      ($4440),hl
4b5a 324244    ld      ($4442),a
4b5d c9        ret     

4b5e cdf055    call    $55f0
4b61 cd234b    call    $4b23
4b64 cdf055    call    $55f0
4b67 dd214044  ld      ix,$4440
4b6b cde555    call    $55e5
4b6e cd0256    call    $5602
4b71 224044    ld      ($4440),hl
4b74 324244    ld      ($4442),a
4b77 dd214544  ld      ix,$4445
4b7b cde555    call    $55e5
4b7e cd0256    call    $5602
4b81 224544    ld      ($4445),hl
4b84 324744    ld      ($4447),a
4b87 2a1d44    ld      hl,($441d)
4b8a ed5b1f44  ld      de,($441f)
4b8e 19        add     hl,de
4b8f 221d44    ld      ($441d),hl
4b92 2a4144    ld      hl,($4441)
4b95 cd2656    call    $5626
4b98 328f44    ld      ($448f),a
4b9b 2a3c44    ld      hl,($443c)
4b9e cd2e56    call    $562e
4ba1 221144    ld      ($4411),hl
4ba4 3a8f44    ld      a,($448f)
4ba7 cdd667    call    $67d6
4baa ed5b1144  ld      de,($4411)
4bae cdc155    call    $55c1
4bb1 ed5b1d44  ld      de,($441d)
4bb5 cdc155    call    $55c1
4bb8 220d44    ld      ($440d),hl
4bbb 2a3c44    ld      hl,($443c)
4bbe cd3556    call    $5635
4bc1 ed5b1d44  ld      de,($441d)
4bc5 cdc155    call    $55c1
4bc8 220f44    ld      ($440f),hl
4bcb 3a8f44    ld      a,($448f)
4bce cdd167    call    $67d1
4bd1 ed5b1144  ld      de,($4411)
4bd5 cdc155    call    $55c1
4bd8 ed5b1d44  ld      de,($441d)
4bdc cdc155    call    $55c1
4bdf 221144    ld      ($4411),hl
4be2 ed5bfc48  ld      de,($48fc)
4be6 cdc155    call    $55c1
4be9 223444    ld      ($4434),hl
4bec dd213144  ld      ix,$4431
4bf0 cdcb55    call    $55cb
4bf3 223144    ld      ($4431),hl
4bf6 323344    ld      ($4433),a
4bf9 2afc48    ld      hl,($48fc)
4bfc ed5b0d44  ld      de,($440d)
4c00 cdc155    call    $55c1
4c03 222f44    ld      ($442f),hl
4c06 dd212c44  ld      ix,$442c
4c0a cdcb55    call    $55cb
4c0d 222c44    ld      ($442c),hl
4c10 322e44    ld      ($442e),a
4c13 2afc48    ld      hl,($48fc)
4c16 ed5b0f44  ld      de,($440f)
4c1a cdc155    call    $55c1
4c1d 223944    ld      ($4439),hl
4c20 dd213644  ld      ix,$4436
4c24 cdcb55    call    $55cb
4c27 f22f4c    jp      p,$4c2f
4c2a 3e00      ld      a,$00
4c2c 210003    ld      hl,$0300
4c2f 223644    ld      ($4436),hl
4c32 323844    ld      ($4438),a
4c35 3a0b44    ld      a,($440b)
4c38 2a3c44    ld      hl,($443c)
4c3b 5f        ld      e,a
4c3c 1600      ld      d,$00
4c3e b7        or      a
4c3f f2434c    jp      p,$4c43
4c42 15        dec     d
4c43 19        add     hl,de
4c44 cd2656    call    $5626
4c47 67        ld      h,a
4c48 3e03      ld      a,$03
4c4a 94        sub     h
4c4b 328d44    ld      ($448d),a
4c4e 2a4644    ld      hl,($4446)
4c51 cd2656    call    $5626
4c54 ed44      neg     
4c56 328e44    ld      ($448e),a
4c59 2a1d44    ld      hl,($441d)
4c5c 115600    ld      de,$0056
4c5f cdc155    call    $55c1
4c62 22c844    ld      ($44c8),hl
4c65 2a3744    ld      hl,($4437)
4c68 117a00    ld      de,$007a
4c6b 19        add     hl,de
4c6c 114803    ld      de,$0348
4c6f cd5256    call    $5652
4c72 22cb44    ld      ($44cb),hl
4c75 3a1e44    ld      a,($441e)		[441e]=speed (16bit value)
4c78 b7        or      a
4c79 c2b94c    jp      nz,$4cb9
4c7c 3a8844    ld      a,($4488)
4c7f fe1a      cp      $1a
4c81 dab94c    jp      c,$4cb9
4c84 fe1d      cp      $1d
4c86 d2b94c    jp      nc,$4cb9
4c89 3a8c44    ld      a,($448c)
4c8c fe19      cp      $19
4c8e dab94c    jp      c,$4cb9
4c91 fe1b      cp      $1b
4c93 d2b94c    jp      nc,$4cb9
4c96 cd6d55    call    $556d
4c99 3e20      ld      a,$20
4c9b 32ff48    ld      ($48ff),a
4c9e 3e01      ld      a,$01
4ca0 32ee44    ld      ($44ee),a
4ca3 320945    ld      ($4509),a
4ca6 322445    ld      ($4524),a
4ca9 323f45    ld      ($453f),a
4cac 325a45    ld      ($455a),a
4caf 3e04      ld      a,$04
4cb1 32d544    ld      ($44d5),a
4cb4 21d444    ld      hl,$44d4
4cb7 3650      ld      (hl),$50
4cb9 c35668    jp      $6856
4cbc 3ac544    ld      a,($44c5)		[44c5]=throttle
4cbf b7        or      a
4cc0 cacf4c    jp      z,$4ccf
4cc3 3aff48    ld      a,($48ff)
4cc6 b7        or      a
4cc7 c2cf4c    jp      nz,$4ccf
4cca 3e10      ld      a,$10
4ccc 32c544    ld      ($44c5),a		[44c5]=throttle
4ccf 3ac544    ld      a,($44c5)		[44c5]=throttle
4cd2 1f        rra     
4cd3 57        ld      d,a
4cd4 0607      ld      b,$07
4cd6 1f        rra     
4cd7 5f        ld      e,a
4cd8 213e05    ld      hl,$053e
4cdb cdc155    call    $55c1
4cde 220444    ld      ($4404),hl
4ce1 2ac644    ld      hl,($44c6)
4ce4 ed5b1d44  ld      de,($441d)
4ce8 7a        ld      a,d
4ce9 fe23      cp      $23
4ceb faf14c    jp      m,$4cf1
4cee 110023    ld      de,$2300
4cf1 cdc155    call    $55c1
4cf4 ed5b2444  ld      de,($4424)
4cf8 cd5256    call    $5652
4cfb 220a44    ld      ($440a),hl
4cfe 110005    ld      de,$0500
4d01 2a0a44    ld      hl,($440a)
4d04 7c        ld      a,h
4d05 b7        or      a
4d06 fa264d    jp      m,$4d26
4d09 fe1c      cp      $1c
4d0b fa2b4d    jp      m,$4d2b
					put STALL message on screen

4d0e 215354    ld      hl,$5453		HL='TS'
4d11 225cf7    ld      ($f75c),hl	write on video mem done 
4d14 21414c    ld      hl,$4c41		HL='LA'
4d17 225ef7    ld      ($f75e),hl	write on video mem done 
4d1a 214c21    ld      hl,$214c		HL=!L
4d1d 2260f7    ld      ($f760),hl	write on video mem done 
4d20 210000    ld      hl,$0000
4d23 c3324d    jp      $4d32
4d26 fee4      cp      $e4
4d28 fa0e4d    jp      m,$4d0e
4d2b cdc155    call    $55c1
4d2e 115000    ld      de,$0050
4d31 19        add     hl,de
4d32 cd444d    call    $4d44
4d35 cdc155    call    $55c1
4d38 11df06    ld      de,$06df
4d3b cd5256    call    $5652
4d3e 221344    ld      ($4413),hl
4d41 c35a4d    jp      $4d5a
4d44 d9        exx     
4d45 ed5b3744  ld      de,($4437)
4d49 21ff7f    ld      hl,$7fff
4d4c ed52      sbc     hl,de
4d4e ed52      sbc     hl,de
4d50 ed52      sbc     hl,de
4d52 ed52      sbc     hl,de
4d54 ed52      sbc     hl,de
4d56 e5        push    hl
4d57 d9        exx     
4d58 d1        pop     de
4d59 c9        ret     

4d5a 2a1d44    ld      hl,($441d)
4d5d 54        ld      d,h
4d5e 5d        ld      e,l
4d5f cdc155    call    $55c1
4d62 cb2c      sra     h
4d64 cb1d      rr      l
4d66 221544    ld      ($4415),hl
4d69 ed5b1344  ld      de,($4413)
4d6d cd5256    call    $5652
4d70 220644    ld      ($4406),hl
4d73 ac        xor     h
4d74 f27b4d    jp      p,$4d7b
4d77 af        xor     a
4d78 320744    ld      ($4407),a
4d7b 2a1344    ld      hl,($4413)
4d7e 54        ld      d,h
4d7f 5d        ld      e,l
4d80 cdc155    call    $55c1
4d83 ed5b2844  ld      de,($4428)
4d87 cd5256    call    $5652
4d8a ed5b2644  ld      de,($4426)
4d8e 19        add     hl,de
4d8f ed5b1544  ld      de,($4415)
4d93 cd5256    call    $5652
4d96 220844    ld      ($4408),hl
4d99 2a3c44    ld      hl,($443c)
4d9c cd3556    call    $5635
4d9f ed5b4a44  ld      de,($444a)
4da3 cdc155    call    $55c1
4da6 eb        ex      de,hl
4da7 2a0444    ld      hl,($4404)
4daa ed52      sbc     hl,de
4dac ed5b0844  ld      de,($4408)
4db0 ed52      sbc     hl,de
4db2 221744    ld      ($4417),hl
4db5 2a3c44    ld      hl,($443c)
4db8 cd2e56    call    $562e
4dbb ed5b4a44  ld      de,($444a)
4dbf cdc155    call    $55c1
4dc2 221944    ld      ($4419),hl
4dc5 2a3c44    ld      hl,($443c)
4dc8 cd3556    call    $5635
4dcb ed5b0444  ld      de,($4404)
4dcf cdc155    call    $55c1
4dd2 ed5b1944  ld      de,($4419)
4dd6 b7        or      a
4dd7 ed52      sbc     hl,de
4dd9 221944    ld      ($4419),hl
4ddc 2a4644    ld      hl,($4446)
4ddf cd2e56    call    $562e
4de2 54        ld      d,h
4de3 5d        ld      e,l
4de4 24        inc     h
4de5 25        dec     h
4de6 f2f04d    jp      p,$4df0
4de9 af        xor     a
4dea 95        sub     l
4deb 6f        ld      l,a
4dec 3e00      ld      a,$00
4dee 9c        sbc     a,h
4def 67        ld      h,a
4df0 cdc155    call    $55c1
4df3 ed5b0644  ld      de,($4406)
4df7 cdc155    call    $55c1
4dfa ed5b1944  ld      de,($4419)
4dfe 19        add     hl,de
4dff 221944    ld      ($4419),hl
4e02 2a3644    ld      hl,($4436)
4e05 3a3844    ld      a,($4438)
4e08 110103    ld      de,$0301
4e0b b7        or      a
4e0c ed52      sbc     hl,de
4e0e de00      sbc     a,$00
4e10 3e00      ld      a,$00
4e12 d2164e    jp      nc,$4e16
4e15 3d        dec     a
4e16 322344    ld      ($4423),a
4e19 b7        or      a
4e1a ca464e    jp      z,$4e46
4e1d 3a1a44    ld      a,($441a)
4e20 fe01      cp      $01
4e22 f2464e    jp      p,$4e46
4e25 210000    ld      hl,$0000
4e28 221944    ld      ($4419),hl
4e2b 224844    ld      ($4448),hl
4e2e 223b44    ld      ($443b),hl
4e31 af        xor     a
4e32 323d44    ld      ($443d),a
4e35 323644    ld      ($4436),a
4e38 323844    ld      ($4438),a
4e3b 324744    ld      ($4447),a
4e3e 224544    ld      ($4445),hl
4e41 3e03      ld      a,$03
4e43 323744    ld      ($4437),a
4e46 2af648    ld      hl,($48f6)
4e49 ed5b1744  ld      de,($4417)
4e4d cd5256    call    $5652
4e50 221f44    ld      ($441f),hl
4e53 3a1e44    ld      a,($441e)		[441e]=speed (16bit value)
4e56 b7        or      a
4e57 ca5d4e    jp      z,$4e5d
4e5a f2634e    jp      p,$4e63
4e5d 210000    ld      hl,$0000
4e60 c36f4e    jp      $4e6f
4e63 ed5b1d44  ld      de,($441d)
4e67 06ff      ld      b,$ff
4e69 af        xor     a
4e6a cdcd65    call    $65cd
4e6d 67        ld      h,a
4e6e 68        ld      l,b
4e6f 221b44    ld      ($441b),hl
4e72 2afa48    ld      hl,($48fa)
4e75 ed5b1944  ld      de,($4419)
4e79 cd5256    call    $5652
4e7c ed5b1b44  ld      de,($441b)
4e80 cd5256    call    $5652
4e83 223e44    ld      ($443e),hl
4e86 2a4644    ld      hl,($4446)
4e89 cd3556    call    $5635
4e8c ed5b0644  ld      de,($4406)
4e90 cdc155    call    $55c1
4e93 ed5bf848  ld      de,($48f8)
4e97 cd5256    call    $5652
4e9a ed5b1b44  ld      de,($441b)
4e9e cd5256    call    $5652
4ea1 224344    ld      ($4443),hl
4ea4 3a2344    ld      a,($4423)
4ea7 b7        or      a
4ea8 cabe4e    jp      z,$4ebe
4eab 3a1e44    ld      a,($441e)		[441e]=speed (16bit value)
4eae b7        or      a
4eaf cabe4e    jp      z,$4ebe
4eb2 3ac344    ld      a,($44c3)
4eb5 cb2f      sra     a
4eb7 cb2f      sra     a
4eb9 cb2f      sra     a
4ebb 324444    ld      ($4444),a
4ebe 2ac244    ld      hl,($44c2)
4ec1 2e00      ld      l,$00
4ec3 ed5b2a44  ld      de,($442a)
4ec7 cd5256    call    $5652
4eca 6c        ld      l,h
4ecb 67        ld      h,a
4ecc 224844    ld      ($4448),hl
4ecf c9        ret     
					update indicators: power, speed, altitude, roll, etc
					
4ed0 3ac544    ld      a,($44c5)	[44c5]=throttle
4ed3 e6f0      and     $f0
4ed5 0f        rrca    
4ed6 0f        rrca    
4ed7 214c44    ld      hl,$444c
4eda be        cp      (hl)
4edb cafd4e    jp      z,$4efd
4ede 77        ld      (hl),a
4edf 6f        ld      l,a
4ee0 3e80      ld      a,$80
4ee2 327df4    ld      ($f47d),a	video ram done
4ee5 32bdf4    ld      ($f4bd),a	video ram done
4ee8 32fdf4    ld      ($f4fd),a	video ram done
4eeb 323df5    ld      ($f53d),a	video ram done
4eee 327df5    ld      ($f57d),a	video ram done
4ef1 2600      ld      h,$00
4ef3 110849    ld      de,$4908
4ef6 19        add     hl,de
4ef7 5e        ld      e,(hl)
4ef8 23        inc     hl
4ef9 56        ld      d,(hl)
4efa 23        inc     hl
4efb 7e        ld      a,(hl)
4efc 12        ld      (de),a
4efd 3ac744    ld      a,($44c7)	yoke up/down
4f00 fe80      cp      $80
4f02 2002      jr      nz,$4f06
4f04 3e90      ld      a,$90
4f06 c67f      add     a,$7f
4f08 e6f0      and     $f0
4f0a 0f        rrca    
4f0b 0f        rrca    
4f0c 214d44    ld      hl,$444d
4f0f be        cp      (hl)
4f10 ca364f    jp      z,$4f36
4f13 77        ld      (hl),a
4f14 6f        ld      l,a
4f15 3e80      ld      a,$80
4f17 32fdf5    ld      ($f5fd),a	video ram done 
4f1a 323df6    ld      ($f63d),a	video ram done
4f1d 327df6    ld      ($f67d),a	video ram done
4f20 32bdf6    ld      ($f6bd),a	video ram done
4f23 32fdf6    ld      ($f6fd),a	video ram done
4f26 2600      ld      h,$00
4f28 110849    ld      de,$4908
4f2b 19        add     hl,de
4f2c 5e        ld      e,(hl)
4f2d 23        inc     hl
4f2e 56        ld      d,(hl)
4f2f 23        inc     hl
4f30 7e        ld      a,(hl)
4f31 218001    ld      hl,$0180
4f34 19        add     hl,de
4f35 77        ld      (hl),a
4f36 3ac344    ld      a,($44c3)
4f39 214e44    ld      hl,$444e
4f3c be        cp      (hl)
4f3d c45350    call    nz,$5053
4f40 3ac844    ld      a,($44c8)
4f43 d606      sub     $06
4f45 da5c4f    jp      c,$4f5c
4f48 fe42      cp      $42
4f4a d2614f    jp      nc,$4f61
4f4d 6f        ld      l,a
4f4e 3a5344    ld      a,($4453)
4f51 bd        cp      l
4f52 caaf4f    jp      z,$4faf
4f55 7d        ld      a,l
4f56 325344    ld      ($4453),a
4f59 c3664f    jp      $4f66
4f5c 3e00      ld      a,$00
4f5e c34d4f    jp      $4f4d
4f61 3e42      ld      a,$42
4f63 c34d4f    jp      $4f4d
4f66 ed730649  ld      ($4906),sp
4f6a 31e1f7    ld      sp,$f7e1			video ram done (x=33, y=29)
4f6d 212020    ld      hl,$2020			clear speed indicator
4f70 e5        push    hl
4f71 e5        push    hl
4f72 e5        push    hl
4f73 e5        push    hl
4f74 e5        push    hl
4f75 114420    ld      de,$2044	' D
4f78 d5        push    de
4f79 114520    ld      de,$2045 ' E
4f7c d5        push    de
4f7d d5        push    de
4f7e 115020    ld      de,$2050 ' P
4f81 d5        push    de
4f82 115320    ld      de,$2053 ' S
4f85 d5        push    de
4f86 115220    ld      de,$2052 ' R
4f89 d5        push    de
4f8a 114920    ld      de,$2049 ' I
4f8d d5        push    de
4f8e 114120    ld      de,$2041 ' A
4f91 d5        push    de
4f92 e5        push    hl
4f93 e5        push    hl
4f94 e5        push    hl
4f95 e5        push    hl
4f96 ed7b0649  ld      sp,($4906)
4f9a b7        or      a
4f9b 1f        rra     
4f9c 6f        ld      l,a
4f9d 17        rla     
4f9e 2600      ld      h,$00
4fa0 11c0f7    ld      de,$f7c0		video ram done
4fa3 19        add     hl,de
4fa4 1f        rra     
4fa5 daad4f    jp      c,$4fad
4fa8 3695      ld      (hl),$95
4faa c3af4f    jp      $4faf
4fad 36aa      ld      (hl),$aa
4faf 2acb44    ld      hl,($44cb)
4fb2 111027    ld      de,$2710
4fb5 b7        or      a
4fb6 ed52      sbc     hl,de
4fb8 d2b54f    jp      nc,$4fb5
4fbb 19        add     hl,de
4fbc 01fcff    ld      bc,$fffc
4fbf 1118fc    ld      de,$fc18		
4fc2 04        inc     b
4fc3 19        add     hl,de
4fc4 dac24f    jp      c,$4fc2
4fc7 b7        or      a
4fc8 ed52      sbc     hl,de
4fca 1138ff    ld      de,$ff38
4fcd 79        ld      a,c
4fce c604      add     a,$04
4fd0 19        add     hl,de
4fd1 dace4f    jp      c,$4fce
4fd4 b7        or      a
4fd5 ed52      sbc     hl,de
4fd7 4f        ld      c,a
4fd8 0d        dec     c
4fd9 7d        ld      a,l
4fda 0c        inc     c
4fdb d632      sub     $32
4fdd d2da4f    jp      nc,$4fda
4fe0 79        ld      a,c
4fe1 fe0a      cp      $0a
4fe3 78        ld      a,b
4fe4 3f        ccf     
4fe5 17        rla     
4fe6 47        ld      b,a
4fe7 2a4f44    ld      hl,($444f)
4fea b7        or      a
4feb ed42      sbc     hl,bc
4fed c8        ret     z

4fee ed434f44  ld      ($444f),bc
4ff2 ed730649  ld      ($4906),sp
4ff6 3100f8    ld      sp,$f800		video ram done
4ff9 212020    ld      hl,$2020
4ffc e5        push    hl
4ffd e5        push    hl
4ffe e5        push    hl
4fff e5        push    hl
5000 114520    ld      de,$2045
5003 d5        push    de
5004 114420    ld      de,$2044
5007 d5        push    de
5008 115520    ld      de,$2055
500b d5        push    de
500c 115420    ld      de,$2054
500f d5        push    de
5010 114920    ld      de,$2049
5013 d5        push    de
5014 115420    ld      de,$2054
5017 d5        push    de
5018 114c20    ld      de,$204c
501b d5        push    de
501c 114120    ld      de,$2041
501f d5        push    de
5020 e5        push    hl
5021 e5        push    hl
5022 e5        push    hl
5023 e5        push    hl
5024 ed7b0649  ld      sp,($4906)
5028 2600      ld      h,$00
502a 68        ld      l,b
502b cb25      sla     l
502d cb25      sla     l
502f 114849    ld      de,$4948
5032 19        add     hl,de
5033 5e        ld      e,(hl)
5034 23        inc     hl
5035 56        ld      d,(hl)
5036 23        inc     hl
5037 7e        ld      a,(hl)
5038 eb        ex      de,hl
5039 77        ld      (hl),a
503a 0600      ld      b,$00
503c cb21      sla     c
503e cb21      sla     c
5040 214849    ld      hl,$4948
5043 09        add     hl,bc
5044 5e        ld      e,(hl)
5045 23        inc     hl
5046 56        ld      d,(hl)
5047 23        inc     hl
5048 23        inc     hl
5049 1a        ld      a,(de)
504a b7        or      a
504b 7e        ld      a,(hl)
504c eb        ex      de,hl
504d f25150    jp      p,$5051
5050 b6        or      (hl)
5051 77        ld      (hl),a
5052 c9        ret     

5053 77        ld      (hl),a
5054 217cf7    ld      hl,$f77c		video ram done
5057 3683      ld      (hl),$83
5059 23        inc     hl
505a 368b      ld      (hl),$8b
505c 23        inc     hl
505d 3683      ld      (hl),$83
505f 23        inc     hl
5060 3681      ld      (hl),$81
5062 c680      add     a,$80
5064 c630      add     a,$30
5066 3003      jr      nc,$506b
5068 3691      ld      (hl),$91
506a c9        ret     
506b 2b        dec     hl
506c c630      add     a,$30
506e 3003      jr      nc,$5073
5070 36a3      ld      (hl),$a3
5072 c9        ret     
5073 c61f      add     a,$1f
5075 3003      jr      nc,$507a
5077 3693      ld      (hl),$93
5079 c9        ret     
507a 2b        dec     hl
507b c601      add     a,$01
507d 3003      jr      nc,$5082
507f 36ab      ld      (hl),$ab
5081 c9        ret     
5082 c61f      add     a,$1f
5084 3003      jr      nc,$5089
5086 369b      ld      (hl),$9b
5088 c9        ret     
5089 2b        dec     hl
508a c630      add     a,$30
508c 3003      jr      nc,$5091
508e 36a3      ld      (hl),$a3
5090 c9        ret     
5091 3693      ld      (hl),$93
5093 c9        ret     

5094 2a4344    ld      hl,($4443)
5097 11d622    ld      de,$22d6
509a cdc155    call    $55c1
509d dd2141f7  ld      ix,$f741			video ram done
50a1 cdbb51    call    $51bb
50a4 2a4144    ld      hl,($4441)
50a7 11cc1c    ld      de,$1ccc
50aa cdc155    call    $55c1
50ad 7c        ld      a,h
50ae b7        or      a
50af f2b650    jp      p,$50b6
50b2 116801    ld      de,$0168
50b5 19        add     hl,de
50b6 dd21c1f6  ld      ix,$f6c1			video ram done
50ba cdbb51    call    $51bb
50bd 3a1044    ld      a,($4410)
50c0 cb2f      sra     a
50c2 67        ld      h,a
50c3 3a0f44    ld      a,($440f)
50c6 1f        rra     
50c7 6f        ld      l,a
50c8 dd2141f6  ld      ix,$f641			video ram done
50cc cdbb51    call    $51bb
50cf 3ac544    ld      a,($44c5)		[44c5]=throttle
50d2 b7        or      a
50d3 1f        rra     
50d4 1f        rra     
50d5 1f        rra     
50d6 c628      add     a,$28
50d8 6f        ld      l,a
50d9 2600      ld      h,$00
50db dd2105f4  ld      ix,$f405			video ram done
50df cdbb51    call    $51bb
50e2 3ac544    ld      a,($44c5)		[44c5]=throttle
50e5 b7        or      a
50e6 1f        rra     
50e7 c684      add     a,$84
50e9 6f        ld      l,a
50ea 2600      ld      h,$00
50ec d2f050    jp      nc,$50f0
50ef 24        inc     h
50f0 dd2145f4  ld      ix,$f445			video ram done
50f4 cdbb51    call    $51bb
50f7 2afe48    ld      hl,($48fe)
50fa 2b        dec     hl
50fb 7c        ld      a,h
50fc b7        or      a
50fd f20151    jp      p,$5101
5100 23        inc     hl
5101 22fe48    ld      ($48fe),hl
5104 119800    ld      de,$0098
5107 cdc155    call    $55c1
510a dd2185f4  ld      ix,$f485			video ram done
510e cdbb51    call    $51bb
5111 3ac544    ld      a,($44c5)		[44c5]=throttle
5114 6f        ld      l,a
5115 2600      ld      h,$00
5117 dd21c5f4  ld      ix,$f4c5			video ram done
511b cdbb51    call    $51bb
511e 3a2144    ld      a,($4421)
5121 6f        ld      l,a
5122 2600      ld      h,$00
5124 dd2105f5  ld      ix,$f505			video ram done
5128 cdbb51    call    $51bb
512b 3ad544    ld      a,($44d5)
512e 6f        ld      l,a
512f 2600      ld      h,$00
5131 dd2145f5  ld      ix,$f545			video ram done
5135 cdbb51    call    $51bb
5138 3ad444    ld      a,($44d4)
513b 6f        ld      l,a
513c 2600      ld      h,$00
513e dd2185f5  ld      ix,$f585			video ram done
5142 cdbb51    call    $51bb
5145 3a0040    ld      a,($4000)		RSV: check this!!??? yyy
5148 fe43      cp      $43
514a c48f51    call    nz,$518f			not present in trs80 fs1: goto sorcerer patch
514d ed5bcb44  ld      de,($44cb)
5151 2144fd    ld      hl,$fd44
5154 19        add     hl,de
5155 da6051    jp      c,$5160
5158 eb        ex      de,hl
5159 dd21f7f7  ld      ix,$f7f7			video ram done
515d cdbb51    call    $51bb
5160 dd21de44  ld      ix,$44de
5164 3ade44    ld      a,($44de)
5167 ddb61b    or      (ix+$1b)
516a ddb636    or      (ix+$36)
516d ddb651    or      (ix+$51)
5170 ddb66c    or      (ix+$6c)
5173 ca8e51    jp      z,$518e

						message 'IN RANGE'

5176 21494e    ld      hl,$4e49			HL='NI'
5179 226df7    ld      ($f76d),hl			video ram done
517c 212052    ld      hl,$5220			HL='R '
517f 226ff7    ld      ($f76f),hl			video ram done
5182 21414e    ld      hl,$4e41			HL='NA'
5185 2271f7    ld      ($f771),hl			video ram done
5188 214745    ld      hl,$4547			HL='EG'
518b 2273f7    ld      ($f773),hl			video ram done
518e c9        ret     

518f ed5bcb44  ld      de,($44cb)	sorcerer path not present in trs80 fs1
5193 2150fb    ld      hl,$fb50
5196 19        add     hl,de
5197 d0        ret     nc

5198 211f7a    ld      hl,$7a1f		
519b 29        add     hl,hl
519c 3652      ld      (hl),$52
519e 34        inc     (hl)
519f 23        inc     hl
51a0 3642      ld      (hl),$42
51a2 35        dec     (hl)
51a3 210080    ld      hl,$8000
51a6 110040    ld      de,$4000
51a9 010080    ld      bc,$8000
51ac edb0      ldir    			end of sorcerer path

 						message WAR!
51ae 215741    ld      hl,$4157			HL='AW'
51b1 2210f7    ld      ($f710),hl			video ram done
51b4 215221    ld      hl,$2152			HL='!R'
51b7 2212f7    ld      ($f712),hl			video ram done
51ba c9        ret     

51bb 7c        ld      a,h
51bc b7        or      a
51bd fac551    jp      m,$51c5
51c0 3e20      ld      a,$20
51c2 c3ce51    jp      $51ce
51c5 af        xor     a
51c6 95        sub     l
51c7 6f        ld      l,a
51c8 3e00      ld      a,$00
51ca 9c        sbc     a,h
51cb 67        ld      h,a
51cc 3e2d      ld      a,$2d
51ce dd7700    ld      (ix+$00),a
51d1 0119fc    ld      bc,$fc19
51d4 09        add     hl,bc
51d5 daff51    jp      c,$51ff
51d8 b7        or      a
51d9 ed42      sbc     hl,bc
51db 3e2f      ld      a,$2f
51dd 019cff    ld      bc,$ff9c
51e0 3c        inc     a
51e1 09        add     hl,bc
51e2 dae051    jp      c,$51e0
51e5 dd7701    ld      (ix+$01),a
51e8 b7        or      a
51e9 ed42      sbc     hl,bc
51eb 0e0a      ld      c,$0a
51ed 7d        ld      a,l
51ee 062f      ld      b,$2f
51f0 04        inc     b
51f1 91        sub     c
51f2 f2f051    jp      p,$51f0
51f5 81        add     a,c
51f6 dd7002    ld      (ix+$02),b
51f9 c630      add     a,$30
51fb dd7703    ld      (ix+$03),a
51fe c9        ret     

51ff 21e703    ld      hl,$03e7
5202 c3db51    jp      $51db
5205 b7        or      a
5206 ca0f52    jp      z,$520f
5209 21de48    ld      hl,$48de
520c c31252    jp      $5212
520f 21ce48    ld      hl,$48ce
5212 11ee48    ld      de,$48ee
5215 011000    ld      bc,$0010
5218 edb0      ldir    
521a c9        ret     

521b 3a2c44    ld      a,($442c)
521e 2a2d44    ld      hl,($442d)
5221 17        rla     
5222 ed6a      adc     hl,hl
5224 ed5bf048  ld      de,($48f0)
5228 19        add     hl,de
5229 ed5bee48  ld      de,($48ee)
522d cd5256    call    $5652
5230 228744    ld      ($4487),hl
5233 3a3644    ld      a,($4436)
5236 2a3744    ld      hl,($4437)
5239 17        rla     
523a ed6a      adc     hl,hl
523c ed5bf448  ld      de,($48f4)
5240 19        add     hl,de
5241 ed5bee48  ld      de,($48ee)
5245 cd5256    call    $5652
5248 228944    ld      ($4489),hl
524b 3a3144    ld      a,($4431)
524e 2a3244    ld      hl,($4432)
5251 17        rla     
5252 ed6a      adc     hl,hl
5254 ed5bf248  ld      de,($48f2)
5258 19        add     hl,de
5259 ed5bee48  ld      de,($48ee)
525d cd5256    call    $5652
5260 228b44    ld      ($448b),hl
5263 c9        ret     

5264 dd21d644  ld      ix,$44d6
5268 cd8852    call    $5288
526b dd21f144  ld      ix,$44f1
526f cd8852    call    $5288
5272 dd210c45  ld      ix,$450c
5276 cd8852    call    $5288
5279 dd212745  ld      ix,$4527
527d cd8852    call    $5288
5280 dd214245  ld      ix,$4542
5284 cd8852    call    $5288
5287 c9        ret     

5288 dd7e18    ld      a,(ix+$18)
528b b7        or      a
528c c8        ret     z

528d 3d        dec     a
528e c2b052    jp      nz,$52b0
5291 3a8844    ld      a,($4488)
5294 ddbe09    cp      (ix+$09)
5297 f2a752    jp      p,$52a7
529a 3a8c44    ld      a,($448c)
529d ddbe0a    cp      (ix+$0a)
52a0 faa752    jp      m,$52a7
52a3 dd361802  ld      (ix+$18),$02
52a7 110049    ld      de,$4900
52aa cdee53    call    $53ee
52ad c3ff52    jp      $52ff
52b0 3a8844    ld      a,($4488)
52b3 ddbe0b    cp      (ix+$0b)
52b6 fabe52    jp      m,$52be
52b9 dd361801  ld      (ix+$18),$01
52bd c9        ret     

52be 3a8c44    ld      a,($448c)
52c1 ddbe0c    cp      (ix+$0c)
52c4 fab952    jp      m,$52b9
52c7 118744    ld      de,$4487
52ca cdee53    call    $53ee
52cd cd1a54    call    $541a
52d0 eae052    jp      pe,$52e0
52d3 eb        ex      de,hl
52d4 dd6e14    ld      l,(ix+$14)
52d7 dd6615    ld      h,(ix+$15)
52da b7        or      a
52db ed52      sbc     hl,de
52dd d2e652    jp      nc,$52e6
52e0 dd7e17    ld      a,(ix+$17)
52e3 c3fc52    jp      $52fc
52e6 21d053    ld      hl,$53d0			HL="_S"
52e9 1150f7    ld      de,$f750			video ram done
52ec 010600    ld      bc,$0006
52ef edb0      ldir    
52f1 dd3516    dec     (ix+$16)
52f4 c2ff52    jp      nz,$52ff
52f7 cdd653    call    $53d6
52fa 3e01      ld      a,$01
52fc dd7716    ld      (ix+$16),a
52ff 3a5a44    ld      a,($445a)
5302 b7        or      a
5303 fa1853    jp      m,$5318
5306 dd7e02    ld      a,(ix+$02)
5309 dd860e    add     a,(ix+$0e)
530c dd7702    ld      (ix+$02),a
530f d22753    jp      nc,$5327
5312 dd3403    inc     (ix+$03)
5315 c32753    jp      $5327
5318 dd7e02    ld      a,(ix+$02)
531b dd960e    sub     (ix+$0e)
531e dd7702    ld      (ix+$02),a
5321 d22753    jp      nc,$5327
5324 dd3503    dec     (ix+$03)
5327 3a5844    ld      a,($4458)
532a b7        or      a
532b fa4053    jp      m,$5340
532e dd7e00    ld      a,(ix+$00)
5331 dd860d    add     a,(ix+$0d)
5334 dd7700    ld      (ix+$00),a
5337 d24f53    jp      nc,$534f
533a dd3401    inc     (ix+$01)
533d c34f53    jp      $534f
5340 dd7e00    ld      a,(ix+$00)
5343 dd960d    sub     (ix+$0d)
5346 dd7700    ld      (ix+$00),a
5349 d24f53    jp      nc,$534f
534c dd3501    dec     (ix+$01)
534f 3a5c44    ld      a,($445c)
5352 b7        or      a
5353 fa6853    jp      m,$5368
5356 dd7e04    ld      a,(ix+$04)
5359 dd860f    add     a,(ix+$0f)
535c dd7704    ld      (ix+$04),a
535f d27753    jp      nc,$5377
5362 dd3405    inc     (ix+$05)
5365 c37753    jp      $5377
5368 dd7e04    ld      a,(ix+$04)
536b dd960f    sub     (ix+$0f)
536e dd7704    ld      (ix+$04),a
5371 d27753    jp      nc,$5377
5374 dd3505    dec     (ix+$05)
5377 dd2b      dec     ix
5379 dd229244  ld      ($4492),ix
537d dd23      inc     ix
537f 3ad344    ld      a,($44d3)	[44d3]=1->map view, =0->forward view
5382 b7        or      a
5383 ca9053    jp      z,$5390
5386 dd7e03    ld      a,(ix+$03)
5389 32d044    ld      ($44d0),a
538c dd360300  ld      (ix+$03),$00
5390 cdb970    call    $70b9
5393 3ad344    ld      a,($44d3)	[44d3]=1->map view, =0->forward view
5396 b7        or      a
5397 caa353    jp      z,$53a3
539a 3ad044    ld      a,($44d0)
539d dd7703    ld      (ix+$03),a
53a0 c3c653    jp      $53c6
53a3 3a5d44    ld      a,($445d)
53a6 b7        or      a
53a7 c2c653    jp      nz,$53c6
53aa dd7e18    ld      a,(ix+$18)
53ad fe01      cp      $01
53af c2ba53    jp      nz,$53ba
53b2 dd7e03    ld      a,(ix+$03)
53b5 fe01      cp      $01
53b7 fac653    jp      m,$53c6
53ba cd1a54    call    $541a
53bd eb        ex      de,hl
53be 21f000    ld      hl,$00f0
53c1 ed52      sbc     hl,de
53c3 d2cb53    jp      nc,$53cb
53c6 dd360800  ld      (ix+$08),$00
53ca c9        ret     

53cb dd360801  ld      (ix+$08),$01
53cf c9        ret     

53d0 44        ld      b,h
53d1 41        ld      b,c
53d2 4e        ld      c,(hl)
53d3 47        ld      b,a
53d4 45        ld      b,l
53d5 52        ld      d,d
53d6 3a004d    ld      a,($4d00)
53d9 3d        dec     a
53da fae853    jp      m,$53e8
53dd 32004d    ld      ($4d00),a
53e0 3a2f4d    ld      a,($4d2f)
53e3 d610      sub     $10
53e5 322f4d    ld      ($4d2f),a
53e8 cd7c54    call    $547c
53eb c3a054    jp      $54a0
53ee dde5      push    ix
53f0 e1        pop     hl
53f1 1a        ld      a,(de)
53f2 96        sub     (hl)
53f3 325744    ld      ($4457),a
53f6 13        inc     de
53f7 23        inc     hl
53f8 1a        ld      a,(de)
53f9 9e        sbc     a,(hl)
53fa 325844    ld      ($4458),a
53fd 13        inc     de
53fe 23        inc     hl
53ff 1a        ld      a,(de)
5400 96        sub     (hl)
5401 325944    ld      ($4459),a
5404 13        inc     de
5405 23        inc     hl
5406 1a        ld      a,(de)
5407 9e        sbc     a,(hl)
5408 325a44    ld      ($445a),a
540b 13        inc     de
540c 23        inc     hl
540d 1a        ld      a,(de)
540e 96        sub     (hl)
540f 325b44    ld      ($445b),a
5412 13        inc     de
5413 23        inc     hl
5414 1a        ld      a,(de)
5415 9e        sbc     a,(hl)
5416 325c44    ld      ($445c),a
5419 c9        ret     

541a 210000    ld      hl,$0000
541d ed5b5744  ld      de,($4457)
5421 7a        ld      a,d
5422 b7        or      a
5423 f22b54    jp      p,$542b
5426 ed52      sbc     hl,de
5428 c32c54    jp      $542c
542b 19        add     hl,de
542c ed5b5944  ld      de,($4459)
5430 7a        ld      a,d
5431 b7        or      a
5432 f23a54    jp      p,$543a
5435 ed52      sbc     hl,de
5437 c33d54    jp      $543d
543a b7        or      a
543b ed5a      adc     hl,de
543d e8        ret     pe

543e ed5b5b44  ld      de,($445b)
5442 7a        ld      a,d
5443 b7        or      a
5444 f24a54    jp      p,$544a
5447 ed52      sbc     hl,de
5449 c9        ret     

544a b7        or      a
544b ed5a      adc     hl,de
544d c9        ret     
							top view of plate in map view
544e 21b0b0    ld      hl,$b0b0
5451 22e1f3    ld      ($f3e1),hl			video ram done
5454 21b4b0    ld      hl,$b0b4
5457 22e3f3    ld      ($f3e3),hl			video ram done
545a 3e90      ld      a,$90
545c 32e5f3    ld      ($f3e5),a			video ram done
545f 218c8d    ld      hl,$8d8c
5462 2222f4    ld      ($f422),hl			video ram done
5465 3e84      ld      a,$84
5467 3224f4    ld      ($f424),a			video ram done
546a 215241    ld      hl,$4152		HL="AR"
546d 221cf7    ld      ($f71c),hl			video ram done
5470 214441    ld      hl,$4144		HL="AD"
5473 221ef7    ld      ($f71e),hl			video ram done
5476 3e52      ld      a,$52		A="R"
5478 3220f7    ld      ($f720),a			video ram done
547b c9        ret     

547c 3a0c44    ld      a,($440c)
547f e607      and     $07
5481 87        add     a,a
5482 5f        ld      e,a
5483 1600      ld      d,$00
5485 219054    ld      hl,$5490
5488 19        add     hl,de
5489 5e        ld      e,(hl)
548a 23        inc     hl
548b 56        ld      d,(hl)
548c d5        push    de
548d fde1      pop     iy
548f c9        ret     

					video ram table done
5490 4ff4
5492 e5f4
5494 52f6
5496 70f6
5498 34f5
549a 98f5
549c e3f5
549e d9f6
     
					video ram table end
     
54a0 fd360099
54a4 fd36ff94  ld      (iy-$01),$94
54a8 fd3601a5  ld      (iy+$01),$a5
54ac fd360286  ld      (iy+$02),$86
54b0 fd36bfa1  ld      (iy-$41),$a1
54b4 fd36c092  ld      (iy-$40),$92
54b8 fd36c1a4  ld      (iy-$3f),$a4
54bc fd36c299  ld      (iy-$3e),$99
54c0 c9        ret     

54c1 cda054    call    $54a0
54c4 fd23      inc     iy
54c6 fd23      inc     iy
54c8 fd23      inc     iy
54ca fd23      inc     iy
54cc cda054    call    $54a0
54cf fde5      push    iy
54d1 e1        pop     hl
54d2 11beff    ld      de,$ffbe
54d5 19        add     hl,de
54d6 e5        push    hl
54d7 fde1      pop     iy
54d9 cda054    call    $54a0
54dc c9        ret     

54dd 21d544    ld      hl,$44d5
54e0 35        dec     (hl)
54e1 fa1c55    jp      m,$551c
54e4 3a2244    ld      a,($4422)
54e7 b7        or      a
54e8 c8        ret     z

54e9 3a8844    ld      a,($4488)
54ec fe03      cp      $03
54ee c21d55    jp      nz,$551d
54f1 3a8744    ld      a,($4487)
54f4 b7        or      a
54f5 f21d55    jp      p,$551d
54f8 3a0440    ld      a,($4004)	on original trs80 fs1: ld a,($448c) 
54fb 9c        sbc     a,h                                      cp $2a
54fc 2ac21d    ld      hl,($1dc2)				jp nz,$551d
54ff 55        ld      d,l					<instr not present>
5500 3a8b44    ld      a,($448b)				<instr not present>
5503 b7        or      a
5504 f21d55    jp      p,$551d
5507 3a2144    ld      a,($4421)
550a c601      add     a,$01
550c 322144    ld      ($4421),a
550f 3ad344    ld      a,($44d3)	[44d3]=1->map view, =0->forward view
5512 b7        or      a
5513 c8        ret     z

5514 fd21e3f3  ld      iy,$f3e3			video ram done
5518 cdc154    call    $54c1
551b c9        ret     

551c 34        inc     (hl)
551d c9        ret     

551e 21d444    ld      hl,$44d4
5521 35        dec     (hl)
5522 34        inc     (hl)
5523 ca5355    jp      z,$5553
5526 35        dec     (hl)
5527 3a0c44    ld      a,($440c)
552a e603      and     $03
552c ca3055    jp      z,$5530
552f c9        ret     

5530 11e5ff    ld      de,$ffe5
5533 215d45    ld      hl,$455d
5536 0605      ld      b,$05
5538 19        add     hl,de
5539 e5        push    hl
553a dde1      pop     ix
553c dd7e08    ld      a,(ix+$08)
553f b7        or      a
5540 c24655    jp      nz,$5546
5543 10f3      djnz    $5538
5545 c9        ret     

5546 212144    ld      hl,$4421
5549 34        inc     (hl)
554a dd361800  ld      (ix+$18),$00
554e dd360800  ld      (ix+$08),$00
5552 c9        ret     

5553 215f55    ld      hl,$555f		HL="U_"	
5556 112df7    ld      de,$f72d			video ram done
5559 010e00    ld      bc,$000e
555c edb0      ldir    
555e c9        ret     

555f 4f        ld      c,a
5560 55        ld      d,l
5561 54        ld      d,h
5562 204f      jr      nz,$55b3
5564 46        ld      b,(hl)
5565 2041      jr      nz,$55a8
5567 4d        ld      c,l
5568 4d        ld      c,l
5569 4f        ld      c,a
556a 212121    ld      hl,$2121
556d c9        ret     

					reset flight
556e 219855    ld      hl,$5598
5571 112c44    ld      de,$442c
5574 012900    ld      bc,$0029
5577 edb0      ldir    
5579 cd994c    call    $4c99
557c 3e05      ld      a,$05
557e 32004d    ld      ($4d00),a
5581 3e50      ld      a,$50
5583 322f4d    ld      ($4d2f),a
5586 af        xor     a
5587 322244    ld      ($4422),a
558a 322144    ld      ($4421),a
558d 3e00      ld      a,$00
558f cd0552    call    $5205
5592 3e01      ld      a,$01
5594 cd0552    call    $5205
5597 c9        ret     

5598 99        sbc     a,c
5599 9b        sbc     a,e
559a 220000    ld      ($0000),hl
559d 69        ld      l,c
559e 95        sub     l
559f 220000    ld      ($0000),hl
55a2 00        nop     
55a3 03        inc     bc
55a4 00        nop     
55a5 00        nop     
55a6 00        nop     
55a7 00        nop     
55a8 00        nop     
55a9 00        nop     
55aa 00        nop     
55ab 00        nop     
55ac 0e71      ld      c,$71
55ae fe00      cp      $00
55b0 00        nop     
55b1 00        nop     
55b2 00        nop     
55b3 00        nop     
55b4 00        nop     
55b5 00        nop     
55b6 00        nop     
55b7 12        ld      (de),a
55b8 ff        rst     $38
55b9 ff        rst     $38
55ba ff        rst     $38
55bb ff        rst     $38
55bc ff        rst     $38
55bd ff        rst     $38
55be ff        rst     $38
55bf ff        rst     $38
55c0 ff        rst     $38
55c1 0e00      ld      c,$00
55c3 cd9264    call    $6492
55c6 67        ld      h,a
55c7 68        ld      l,b
55c8 c9        ret     

55c9 00        nop     
55ca 00        nop     
55cb dd5604    ld      d,(ix+$04)
55ce dd5e03    ld      e,(ix+$03)
55d1 7a        ld      a,d
55d2 17        rla     
55d3 0e00      ld      c,$00
55d5 d2d955    jp      nc,$55d9
55d8 0d        dec     c
55d9 dd7e02    ld      a,(ix+$02)
55dc dd6601    ld      h,(ix+$01)
55df dd6e00    ld      l,(ix+$00)
55e2 19        add     hl,de
55e3 89        adc     a,c
55e4 c9        ret     

55e5 dd6e03    ld      l,(ix+$03)
55e8 dd6604    ld      h,(ix+$04)
55eb 29        add     hl,hl
55ec eb        ex      de,hl
55ed c3d355    jp      $55d3
55f0 eb        ex      de,hl
55f1 4f        ld      c,a
55f2 af        xor     a
55f3 210000    ld      hl,$0000
55f6 ed52      sbc     hl,de
55f8 99        sbc     a,c
55f9 c9        ret     

55fa 114024    ld      de,$2440
55fd 0e03      ld      c,$03
55ff 29        add     hl,hl
5600 89        adc     a,c
5601 c9        ret     

5602 b7        or      a
5603 fa1d56    jp      m,$561d
5606 4f        ld      c,a
5607 3e40      ld      a,$40
5609 95        sub     l
560a 3e24      ld      a,$24
560c 9c        sbc     a,h
560d 3e03      ld      a,$03
560f 99        sbc     a,c
5610 79        ld      a,c
5611 d0        ret     nc

5612 1181b7    ld      de,$b781
5615 19        add     hl,de
5616 cef9      adc     a,$f9
5618 b7        or      a
5619 f8        ret     m

561a c30656    jp      $5606
561d cdf055    call    $55f0
5620 cd0256    call    $5602
5623 c3f055    jp      $55f0
5626 115f14    ld      de,$145f
5629 cdc155    call    $55c1
562c 7d        ld      a,l
562d c9        ret     

562e cd2656    call    $5626
5631 cdd167    call    $67d1
5634 c9        ret     

5635 7c        ld      a,h
5636 feff      cp      $ff
5638 ca4a56    jp      z,$564a
563b b7        or      a
563c ca4a56    jp      z,$564a
563f fa4656    jp      m,$5646
5642 21ff7f    ld      hl,$7fff
5645 c9        ret     

5646 210180    ld      hl,$8001
5649 c9        ret     

564a 7c        ld      a,h
564b 1f        rra     
564c 7d        ld      a,l
564d 1f        rra     
564e 67        ld      h,a
564f 2e00      ld      l,$00
5651 c9        ret     

5652 7d        ld      a,l
5653 44        ld      b,h
5654 210000    ld      hl,$0000
5657 1b        dec     de
5658 1f        rra     
5659 d26656    jp      nc,$5666
565c ed5a      adc     hl,de
565e e26656    jp      po,$5666
5661 cb1c      rr      h
5663 c36856    jp      $5668
5666 cb2c      sra     h
5668 cb1d      rr      l
566a 1f        rra     
566b d27856    jp      nc,$5678
566e ed5a      adc     hl,de
5670 e27856    jp      po,$5678
5673 cb1c      rr      h
5675 c37a56    jp      $567a
5678 cb2c      sra     h
567a cb1d      rr      l
567c 1f        rra     
567d d28a56    jp      nc,$568a
5680 ed5a      adc     hl,de
5682 e28a56    jp      po,$568a
5685 cb1c      rr      h
5687 c38c56    jp      $568c
568a cb2c      sra     h
568c cb1d      rr      l
568e 1f        rra     
568f d29c56    jp      nc,$569c
5692 ed5a      adc     hl,de
5694 e29c56    jp      po,$569c
5697 cb1c      rr      h
5699 c39e56    jp      $569e
569c cb2c      sra     h
569e cb1d      rr      l
56a0 1f        rra     
56a1 d2ae56    jp      nc,$56ae
56a4 ed5a      adc     hl,de
56a6 e2ae56    jp      po,$56ae
56a9 cb1c      rr      h
56ab c3b056    jp      $56b0
56ae cb2c      sra     h
56b0 cb1d      rr      l
56b2 1f        rra     
56b3 d2c056    jp      nc,$56c0
56b6 ed5a      adc     hl,de
56b8 e2c056    jp      po,$56c0
56bb cb1c      rr      h
56bd c3c256    jp      $56c2
56c0 cb2c      sra     h
56c2 cb1d      rr      l
56c4 1f        rra     
56c5 d2d256    jp      nc,$56d2
56c8 ed5a      adc     hl,de
56ca e2d256    jp      po,$56d2
56cd cb1c      rr      h
56cf c3d456    jp      $56d4
56d2 cb2c      sra     h
56d4 cb1d      rr      l
56d6 1f        rra     
56d7 d2e456    jp      nc,$56e4
56da ed5a      adc     hl,de
56dc e2e456    jp      po,$56e4
56df cb1c      rr      h
56e1 c3e656    jp      $56e6
56e4 cb2c      sra     h
56e6 cb1d      rr      l
56e8 1f        rra     
56e9 4f        ld      c,a
56ea 78        ld      a,b
56eb 1f        rra     
56ec d2f956    jp      nc,$56f9
56ef ed5a      adc     hl,de
56f1 e2f956    jp      po,$56f9
56f4 cb1c      rr      h
56f6 c3fb56    jp      $56fb
56f9 cb2c      sra     h
56fb cb1d      rr      l
56fd 1f        rra     
56fe d20b57    jp      nc,$570b
5701 ed5a      adc     hl,de
5703 e20b57    jp      po,$570b
5706 cb1c      rr      h
5708 c30d57    jp      $570d
570b cb2c      sra     h
570d cb1d      rr      l
570f 1f        rra     
5710 d21d57    jp      nc,$571d
5713 ed5a      adc     hl,de
5715 e21d57    jp      po,$571d
5718 cb1c      rr      h
571a c31f57    jp      $571f
571d cb2c      sra     h
571f cb1d      rr      l
5721 1f        rra     
5722 d22f57    jp      nc,$572f
5725 ed5a      adc     hl,de
5727 e22f57    jp      po,$572f
572a cb1c      rr      h
572c c33157    jp      $5731
572f cb2c      sra     h
5731 cb1d      rr      l
5733 1f        rra     
5734 d24157    jp      nc,$5741
5737 ed5a      adc     hl,de
5739 e24157    jp      po,$5741
573c cb1c      rr      h
573e c34357    jp      $5743
5741 cb2c      sra     h
5743 cb1d      rr      l
5745 1f        rra     
5746 d25357    jp      nc,$5753
5749 ed5a      adc     hl,de
574b e25357    jp      po,$5753
574e cb1c      rr      h
5750 c35557    jp      $5755
5753 cb2c      sra     h
5755 cb1d      rr      l
5757 1f        rra     
5758 d26557    jp      nc,$5765
575b ed5a      adc     hl,de
575d e26557    jp      po,$5765
5760 cb1c      rr      h
5762 c36757    jp      $5767
5765 cb2c      sra     h
5767 cb1d      rr      l
5769 1f        rra     
576a d26f57    jp      nc,$576f
576d ed52      sbc     hl,de
576f cb2c      sra     h
5771 cb1d      rr      l
5773 1f        rra     
5774 59        ld      e,c
5775 57        ld      d,a
5776 7c        ld      a,h
5777 65        ld      h,l
5778 6a        ld      l,d
5779 c9        ret     

577a 00        nop     
577b 00        nop     
577c 00        nop     
577d 00        nop     
577e 00        nop     
577f 00        nop     
5780 00        nop     
5781 00        nop     
5782 00        nop     
5783 00        nop     
5784 00        nop     
5785 00        nop     
5786 00        nop     
5787 00        nop     
5788 00        nop     
5789 00        nop     
578a 00        nop     
578b 00        nop     
578c 00        nop     
578d 00        nop     
578e 00        nop     
578f 00        nop     
5790 00        nop     
5791 00        nop     
5792 00        nop     
5793 00        nop     
5794 00        nop     
5795 00        nop     
5796 00        nop     
5797 00        nop     
5798 00        nop     
5799 00        nop     
579a 00        nop     
579b 00        nop     
579c 00        nop     
579d 00        nop     
579e 00        nop     
579f 00        nop     
57a0 00        nop     
57a1 00        nop     
57a2 00        nop     
57a3 00        nop     
57a4 00        nop     
57a5 00        nop     
57a6 00        nop     
57a7 00        nop     
57a8 00        nop     
57a9 00        nop     
57aa 00        nop     
57ab 00        nop     
57ac 00        nop     
57ad 00        nop     
57ae 00        nop     
57af 00        nop     
57b0 00        nop     
57b1 00        nop     
57b2 00        nop     
57b3 00        nop     
57b4 00        nop     
57b5 00        nop     
57b6 00        nop     
57b7 00        nop     
57b8 00        nop     
57b9 00        nop     
57ba 00        nop     
57bb 00        nop     
57bc 00        nop     
57bd 00        nop     
57be 00        nop     
57bf 00        nop     
57c0 00        nop     
57c1 00        nop     
57c2 00        nop     
57c3 00        nop     
57c4 00        nop     
57c5 00        nop     
57c6 00        nop     
57c7 00        nop     
57c8 00        nop     
57c9 00        nop     
57ca 00        nop     
57cb 00        nop     
57cc 00        nop     
57cd 00        nop     
57ce 00        nop     
57cf 00        nop     
57d0 00        nop     
57d1 00        nop     
57d2 00        nop     
57d3 00        nop     
57d4 00        nop     
57d5 00        nop     
57d6 00        nop     
57d7 00        nop     
57d8 00        nop     
57d9 00        nop     
57da 00        nop     
57db 00        nop     
57dc 00        nop     
57dd 00        nop     
57de 00        nop     
57df 00        nop     
57e0 00        nop     
57e1 00        nop     
57e2 00        nop     
57e3 00        nop     
57e4 00        nop     
57e5 00        nop     
57e6 00        nop     
57e7 00        nop     
57e8 00        nop     
57e9 00        nop     
57ea 00        nop     
57eb 00        nop     
57ec 00        nop     
57ed 00        nop     
57ee 00        nop     
57ef 00        nop     
57f0 00        nop     
57f1 00        nop     
57f2 00        nop     
57f3 00        nop     
57f4 00        nop     
57f5 00        nop     
57f6 00        nop     
57f7 00        nop     
57f8 00        nop     
57f9 00        nop     
57fa 00        nop     
57fb 00        nop     
57fc 00        nop     
57fd 00        nop     
57fe 00        nop     
57ff 00        nop     
5800 a5        and     l
5801 a5        and     l
5802 a5        and     l
5803 a5        and     l
5804 a5        and     l
5805 a5        and     l
5806 a5        and     l
5807 a5        and     l
5808 a5        and     l
5809 a5        and     l
580a a5        and     l
580b a5        and     l
580c a5        and     l
580d a5        and     l
580e a5        and     l
580f a5        and     l
5810 a5        and     l
5811 a5        and     l
5812 a5        and     l
5813 a5        and     l
5814 a5        and     l
5815 a5        and     l
5816 a5        and     l
5817 a5        and     l
5818 a5        and     l
5819 a5        and     l
581a a5        and     l
581b a5        and     l
581c a5        and     l
581d a5        and     l
581e a5        and     l
581f a5        and     l
5820 a5        and     l
5821 a5        and     l
5822 a5        and     l
5823 a5        and     l
5824 a5        and     l
5825 a5        and     l
5826 a5        and     l
5827 a5        and     l
5828 a5        and     l
5829 a5        and     l
582a a5        and     l
582b a5        and     l
582c a5        and     l
582d a5        and     l
582e a5        and     l
582f a5        and     l
5830 a5        and     l
5831 a5        and     l
5832 a5        and     l
5833 a5        and     l
5834 a5        and     l
5835 a5        and     l
5836 a5        and     l
5837 a5        and     l
5838 a5        and     l
5839 a5        and     l
583a a5        and     l
583b a5        and     l
583c a5        and     l
583d a5        and     l
583e a5        and     l
583f a5        and     l
5840 a5        and     l
5841 a5        and     l
5842 a5        and     l
5843 a5        and     l
5844 a5        and     l
5845 a5        and     l
5846 a5        and     l
5847 a5        and     l
5848 a5        and     l
5849 a5        and     l
584a a5        and     l
584b a5        and     l
584c a5        and     l
584d a5        and     l
584e a5        and     l
584f a5        and     l
5850 a5        and     l
5851 a5        and     l
5852 a5        and     l
5853 a5        and     l
5854 a5        and     l
5855 a5        and     l
5856 a5        and     l
5857 a5        and     l
5858 a5        and     l
5859 a5        and     l
585a a5        and     l
585b a5        and     l
585c a5        and     l
585d a5        and     l
585e a5        and     l
585f a5        and     l
5860 a5        and     l
5861 a5        and     l
5862 a5        and     l
5863 a5        and     l
5864 a5        and     l
5865 a5        and     l
5866 a5        and     l
5867 a5        and     l
5868 a5        and     l
5869 a5        and     l
586a a5        and     l
586b a5        and     l
586c a5        and     l
586d a5        and     l
586e a5        and     l
586f a5        and     l
5870 a5        and     l
5871 a5        and     l
5872 a5        and     l
5873 a5        and     l
5874 a5        and     l
5875 a5        and     l
5876 a5        and     l
5877 a5        and     l
5878 a5        and     l
5879 a5        and     l
587a a5        and     l
587b a5        and     l
587c a5        and     l
587d a5        and     l
587e a5        and     l
587f a5        and     l
5880 a5        and     l
5881 a5        and     l
5882 a5        and     l
5883 a5        and     l
5884 a5        and     l
5885 a5        and     l
5886 a5        and     l
5887 a5        and     l
5888 a5        and     l
5889 a5        and     l
588a a5        and     l
588b a5        and     l
588c a5        and     l
588d a5        and     l
588e a5        and     l
588f a5        and     l
5890 a5        and     l
5891 a5        and     l
5892 a5        and     l
5893 a5        and     l
5894 a5        and     l
5895 a5        and     l
5896 a5        and     l
5897 a5        and     l
5898 a5        and     l
5899 a5        and     l
589a a5        and     l
589b a5        and     l
589c a5        and     l
589d a5        and     l
589e a5        and     l
589f a5        and     l
58a0 a5        and     l
58a1 a5        and     l
58a2 a5        and     l
58a3 a5        and     l
58a4 a5        and     l
58a5 a5        and     l
58a6 a5        and     l
58a7 a5        and     l
58a8 a5        and     l
58a9 a5        and     l
58aa a5        and     l
58ab a5        and     l
58ac a5        and     l
58ad a5        and     l
58ae a5        and     l
58af a5        and     l
58b0 a5        and     l
58b1 a5        and     l
58b2 a5        and     l
58b3 a5        and     l
58b4 a5        and     l
58b5 a5        and     l
58b6 a5        and     l
58b7 a5        and     l
58b8 a5        and     l
58b9 a5        and     l
58ba a5        and     l
58bb a5        and     l
58bc a5        and     l
58bd a5        and     l
58be a5        and     l
58bf a5        and     l
58c0 a5        and     l
58c1 a5        and     l
58c2 a5        and     l
58c3 a5        and     l
58c4 a5        and     l
58c5 a5        and     l
58c6 a5        and     l
58c7 a5        and     l
58c8 a5        and     l
58c9 a5        and     l
58ca a5        and     l
58cb a5        and     l
58cc a5        and     l
58cd a5        and     l
58ce a5        and     l
58cf a5        and     l
58d0 a5        and     l
58d1 a5        and     l
58d2 a5        and     l
58d3 a5        and     l
58d4 a5        and     l
58d5 a5        and     l
58d6 a5        and     l
58d7 a5        and     l
58d8 a5        and     l
58d9 a5        and     l
58da a5        and     l
58db a5        and     l
58dc a5        and     l
58dd a5        and     l
58de a5        and     l
58df a5        and     l
58e0 a5        and     l
58e1 a5        and     l
58e2 a5        and     l
58e3 a5        and     l
58e4 a5        and     l
58e5 a5        and     l
58e6 a5        and     l
58e7 a5        and     l
58e8 a5        and     l
58e9 a5        and     l
58ea a5        and     l
58eb a5        and     l
58ec a5        and     l
58ed a5        and     l
58ee a5        and     l
58ef a5        and     l
58f0 a5        and     l
58f1 a5        and     l
58f2 a5        and     l
58f3 a5        and     l
58f4 a5        and     l
58f5 a5        and     l
58f6 a5        and     l
58f7 a5        and     l
58f8 a5        and     l
58f9 a5        and     l
58fa a5        and     l
58fb a5        and     l
58fc a5        and     l
58fd a5        and     l
58fe a5        and     l
58ff a5        and     l
5900 a5        and     l
5901 a5        and     l
5902 a5        and     l
5903 a5        and     l
5904 a5        and     l
5905 a5        and     l
5906 a5        and     l
5907 a5        and     l
5908 a5        and     l
5909 a5        and     l
590a a5        and     l
590b a5        and     l
590c a5        and     l
590d a5        and     l
590e a5        and     l
590f a5        and     l
5910 a5        and     l
5911 a5        and     l
5912 a5        and     l
5913 a5        and     l
5914 a5        and     l
5915 a5        and     l
5916 a5        and     l
5917 a5        and     l
5918 a5        and     l
5919 a5        and     l
591a a5        and     l
591b a5        and     l
591c a5        and     l
591d a5        and     l
591e a5        and     l
591f a5        and     l
5920 a5        and     l
5921 a5        and     l
5922 a5        and     l
5923 a5        and     l
5924 a5        and     l
5925 a5        and     l
5926 a5        and     l
5927 a5        and     l
5928 a5        and     l
5929 a5        and     l
592a a5        and     l
592b a5        and     l
592c a5        and     l
592d a5        and     l
592e a5        and     l
592f a5        and     l
5930 a5        and     l
5931 a5        and     l
5932 a5        and     l
5933 a5        and     l
5934 a5        and     l
5935 a5        and     l
5936 a5        and     l
5937 a5        and     l
5938 a5        and     l
5939 a5        and     l
593a a5        and     l
593b a5        and     l
593c a5        and     l
593d a5        and     l
593e a5        and     l
593f a5        and     l
5940 a5        and     l
5941 a5        and     l
5942 a5        and     l
5943 a5        and     l
5944 a5        and     l
5945 a5        and     l
5946 a5        and     l
5947 a5        and     l
5948 a5        and     l
5949 a5        and     l
594a a5        and     l
594b a5        and     l
594c a5        and     l
594d a5        and     l
594e a5        and     l
594f a5        and     l
5950 a5        and     l
5951 a5        and     l
5952 a5        and     l
5953 a5        and     l
5954 a5        and     l
5955 a5        and     l
5956 a5        and     l
5957 a5        and     l
5958 a5        and     l
5959 a5        and     l
595a a5        and     l
595b a5        and     l
595c a5        and     l
595d a5        and     l
595e a5        and     l
595f a5        and     l
5960 a5        and     l
5961 a5        and     l
5962 a5        and     l
5963 a5        and     l
5964 a5        and     l
5965 a5        and     l
5966 a5        and     l
5967 a5        and     l
5968 a5        and     l
5969 a5        and     l
596a a5        and     l
596b a5        and     l
596c a5        and     l
596d a5        and     l
596e a5        and     l
596f a5        and     l
5970 a5        and     l
5971 a5        and     l
5972 a5        and     l
5973 a5        and     l
5974 a5        and     l
5975 a5        and     l
5976 a5        and     l
5977 a5        and     l
5978 a5        and     l
5979 a5        and     l
597a a5        and     l
597b a5        and     l
597c a5        and     l
597d a5        and     l
597e a5        and     l
597f a5        and     l
5980 a5        and     l
5981 a5        and     l
5982 a5        and     l
5983 a5        and     l
5984 a5        and     l
5985 a5        and     l
5986 a5        and     l
5987 a5        and     l
5988 a5        and     l
5989 a5        and     l
598a a5        and     l
598b a5        and     l
598c a5        and     l
598d a5        and     l
598e a5        and     l
598f a5        and     l
5990 a5        and     l
5991 a5        and     l
5992 a5        and     l
5993 a5        and     l
5994 a5        and     l
5995 a5        and     l
5996 a5        and     l
5997 a5        and     l
5998 a5        and     l
5999 a5        and     l
599a a5        and     l
599b a5        and     l
599c a5        and     l
599d a5        and     l
599e a5        and     l
599f a5        and     l
59a0 a5        and     l
59a1 a5        and     l
59a2 a5        and     l
59a3 a5        and     l
59a4 a5        and     l
59a5 a5        and     l
59a6 a5        and     l
59a7 a5        and     l
59a8 a5        and     l
59a9 a5        and     l
59aa a5        and     l
59ab a5        and     l
59ac a5        and     l
59ad a5        and     l
59ae a5        and     l
59af a5        and     l
59b0 a5        and     l
59b1 a5        and     l
59b2 a5        and     l
59b3 a5        and     l
59b4 a5        and     l
59b5 a5        and     l
59b6 a5        and     l
59b7 a5        and     l
59b8 a5        and     l
59b9 a5        and     l
59ba a5        and     l
59bb a5        and     l
59bc a5        and     l
59bd a5        and     l
59be a5        and     l
59bf a5        and     l
59c0 a5        and     l
59c1 a5        and     l
59c2 a5        and     l
59c3 a5        and     l
59c4 a5        and     l
59c5 a5        and     l
59c6 a5        and     l
59c7 a5        and     l
59c8 a5        and     l
59c9 a5        and     l
59ca a5        and     l
59cb a5        and     l
59cc a5        and     l
59cd a5        and     l
59ce a5        and     l
59cf a5        and     l
59d0 a5        and     l
59d1 a5        and     l
59d2 a5        and     l
59d3 a5        and     l
59d4 a5        and     l
59d5 a5        and     l
59d6 a5        and     l
59d7 a5        and     l
59d8 a5        and     l
59d9 a5        and     l
59da a5        and     l
59db a5        and     l
59dc a5        and     l
59dd a5        and     l
59de a5        and     l
59df a5        and     l
59e0 a5        and     l
59e1 a5        and     l
59e2 a5        and     l
59e3 a5        and     l
59e4 a5        and     l
59e5 a5        and     l
59e6 a5        and     l
59e7 a5        and     l
59e8 a5        and     l
59e9 a5        and     l
59ea a5        and     l
59eb a5        and     l
59ec a5        and     l
59ed a5        and     l
59ee a5        and     l
59ef a5        and     l
59f0 a5        and     l
59f1 a5        and     l
59f2 a5        and     l
59f3 a5        and     l
59f4 a5        and     l
59f5 a5        and     l
59f6 a5        and     l
59f7 a5        and     l
59f8 a5        and     l
59f9 a5        and     l
59fa a5        and     l
59fb a5        and     l
59fc a5        and     l
59fd a5        and     l
59fe a5        and     l
59ff a5        and     l
5a00 a5        and     l
5a01 a5        and     l
5a02 a5        and     l
5a03 a5        and     l
5a04 a5        and     l
5a05 a5        and     l
5a06 a5        and     l
5a07 a5        and     l
5a08 a5        and     l
5a09 a5        and     l
5a0a a5        and     l
5a0b a5        and     l
5a0c a5        and     l
5a0d a5        and     l
5a0e a5        and     l
5a0f a5        and     l
5a10 a5        and     l
5a11 a5        and     l
5a12 a5        and     l
5a13 a5        and     l
5a14 a5        and     l
5a15 a5        and     l
5a16 a5        and     l
5a17 a5        and     l
5a18 a5        and     l
5a19 a5        and     l
5a1a a5        and     l
5a1b a5        and     l
5a1c a5        and     l
5a1d a5        and     l
5a1e a5        and     l
5a1f a5        and     l
5a20 a5        and     l
5a21 a5        and     l
5a22 a5        and     l
5a23 a5        and     l
5a24 a5        and     l
5a25 a5        and     l
5a26 a5        and     l
5a27 a5        and     l
5a28 a5        and     l
5a29 a5        and     l
5a2a a5        and     l
5a2b a5        and     l
5a2c a5        and     l
5a2d a5        and     l
5a2e a5        and     l
5a2f a5        and     l
5a30 a5        and     l
5a31 a5        and     l
5a32 a5        and     l
5a33 a5        and     l
5a34 a5        and     l
5a35 a5        and     l
5a36 a5        and     l
5a37 a5        and     l
5a38 a5        and     l
5a39 a5        and     l
5a3a a5        and     l
5a3b a5        and     l
5a3c a5        and     l
5a3d a5        and     l
5a3e a5        and     l
5a3f a5        and     l
5a40 a5        and     l
5a41 a5        and     l
5a42 a5        and     l
5a43 a5        and     l
5a44 a5        and     l
5a45 a5        and     l
5a46 a5        and     l
5a47 a5        and     l
5a48 a5        and     l
5a49 a5        and     l
5a4a a5        and     l
5a4b a5        and     l
5a4c a5        and     l
5a4d a5        and     l
5a4e a5        and     l
5a4f a5        and     l
5a50 a5        and     l
5a51 a5        and     l
5a52 a5        and     l
5a53 a5        and     l
5a54 a5        and     l
5a55 a5        and     l
5a56 a5        and     l
5a57 a5        and     l
5a58 a5        and     l
5a59 a5        and     l
5a5a a5        and     l
5a5b a5        and     l
5a5c a5        and     l
5a5d a5        and     l
5a5e a5        and     l
5a5f a5        and     l
5a60 a5        and     l
5a61 a5        and     l
5a62 a5        and     l
5a63 a5        and     l
5a64 a5        and     l
5a65 a5        and     l
5a66 a5        and     l
5a67 a5        and     l
5a68 a5        and     l
5a69 a5        and     l
5a6a a5        and     l
5a6b a5        and     l
5a6c a5        and     l
5a6d a5        and     l
5a6e a5        and     l
5a6f a5        and     l
5a70 a5        and     l
5a71 a5        and     l
5a72 a5        and     l
5a73 a5        and     l
5a74 a5        and     l
5a75 a5        and     l
5a76 a5        and     l
5a77 a5        and     l
5a78 a5        and     l
5a79 a5        and     l
5a7a a5        and     l
5a7b a5        and     l
5a7c a5        and     l
5a7d a5        and     l
5a7e a5        and     l
5a7f a5        and     l
5a80 a5        and     l
5a81 a5        and     l
5a82 a5        and     l
5a83 a5        and     l
5a84 a5        and     l
5a85 a5        and     l
5a86 a5        and     l
5a87 a5        and     l
5a88 a5        and     l
5a89 a5        and     l
5a8a a5        and     l
5a8b a5        and     l
5a8c a5        and     l
5a8d a5        and     l
5a8e a5        and     l
5a8f a5        and     l
5a90 a5        and     l
5a91 a5        and     l
5a92 a5        and     l
5a93 a5        and     l
5a94 a5        and     l
5a95 a5        and     l
5a96 a5        and     l
5a97 a5        and     l
5a98 a5        and     l
5a99 a5        and     l
5a9a a5        and     l
5a9b a5        and     l
5a9c a5        and     l
5a9d a5        and     l
5a9e a5        and     l
5a9f a5        and     l
5aa0 a5        and     l
5aa1 a5        and     l
5aa2 a5        and     l
5aa3 a5        and     l
5aa4 a5        and     l
5aa5 a5        and     l
5aa6 a5        and     l
5aa7 a5        and     l
5aa8 a5        and     l
5aa9 a5        and     l
5aaa a5        and     l
5aab a5        and     l
5aac a5        and     l
5aad a5        and     l
5aae a5        and     l
5aaf a5        and     l
5ab0 a5        and     l
5ab1 a5        and     l
5ab2 a5        and     l
5ab3 a5        and     l
5ab4 a5        and     l
5ab5 a5        and     l
5ab6 a5        and     l
5ab7 a5        and     l
5ab8 a5        and     l
5ab9 a5        and     l
5aba a5        and     l
5abb a5        and     l
5abc a5        and     l
5abd a5        and     l
5abe a5        and     l
5abf a5        and     l
5ac0 a5        and     l
5ac1 a5        and     l
5ac2 a5        and     l
5ac3 a5        and     l
5ac4 a5        and     l
5ac5 a5        and     l
5ac6 a5        and     l
5ac7 a5        and     l
5ac8 a5        and     l
5ac9 a5        and     l
5aca a5        and     l
5acb a5        and     l
5acc a5        and     l
5acd a5        and     l
5ace a5        and     l
5acf a5        and     l
5ad0 a5        and     l
5ad1 a5        and     l
5ad2 a5        and     l
5ad3 a5        and     l
5ad4 a5        and     l
5ad5 a5        and     l
5ad6 a5        and     l
5ad7 a5        and     l
5ad8 a5        and     l
5ad9 a5        and     l
5ada a5        and     l
5adb a5        and     l
5adc a5        and     l
5add a5        and     l
5ade a5        and     l
5adf a5        and     l
5ae0 a5        and     l
5ae1 a5        and     l
5ae2 a5        and     l
5ae3 a5        and     l
5ae4 a5        and     l
5ae5 a5        and     l
5ae6 a5        and     l
5ae7 a5        and     l
5ae8 a5        and     l
5ae9 a5        and     l
5aea a5        and     l
5aeb a5        and     l
5aec a5        and     l
5aed a5        and     l
5aee a5        and     l
5aef a5        and     l
5af0 a5        and     l
5af1 a5        and     l
5af2 a5        and     l
5af3 a5        and     l
5af4 a5        and     l
5af5 a5        and     l
5af6 a5        and     l
5af7 a5        and     l
5af8 a5        and     l
5af9 a5        and     l
5afa a5        and     l
5afb a5        and     l
5afc a5        and     l
5afd a5        and     l
5afe a5        and     l
5aff a5        and     l
5b00 a5        and     l
5b01 a5        and     l
5b02 a5        and     l
5b03 a5        and     l
5b04 a5        and     l
5b05 a5        and     l
5b06 a5        and     l
5b07 a5        and     l
5b08 a5        and     l
5b09 a5        and     l
5b0a a5        and     l
5b0b a5        and     l
5b0c a5        and     l
5b0d a5        and     l
5b0e a5        and     l
5b0f a5        and     l
5b10 a5        and     l
5b11 a5        and     l
5b12 a5        and     l
5b13 a5        and     l
5b14 a5        and     l
5b15 a5        and     l
5b16 a5        and     l
5b17 a5        and     l
5b18 a5        and     l
5b19 a5        and     l
5b1a a5        and     l
5b1b a5        and     l
5b1c a5        and     l
5b1d a5        and     l
5b1e a5        and     l
5b1f a5        and     l
5b20 a5        and     l
5b21 a5        and     l
5b22 a5        and     l
5b23 a5        and     l
5b24 a5        and     l
5b25 a5        and     l
5b26 a5        and     l
5b27 a5        and     l
5b28 a5        and     l
5b29 a5        and     l
5b2a a5        and     l
5b2b a5        and     l
5b2c a5        and     l
5b2d a5        and     l
5b2e a5        and     l
5b2f a5        and     l
5b30 a5        and     l
5b31 a5        and     l
5b32 a5        and     l
5b33 a5        and     l
5b34 a5        and     l
5b35 a5        and     l
5b36 a5        and     l
5b37 a5        and     l
5b38 a5        and     l
5b39 a5        and     l
5b3a a5        and     l
5b3b a5        and     l
5b3c a5        and     l
5b3d a5        and     l
5b3e a5        and     l
5b3f a5        and     l
5b40 a5        and     l
5b41 a5        and     l
5b42 a5        and     l
5b43 a5        and     l
5b44 a5        and     l
5b45 a5        and     l
5b46 a5        and     l
5b47 a5        and     l
5b48 a5        and     l
5b49 a5        and     l
5b4a a5        and     l
5b4b a5        and     l
5b4c a5        and     l
5b4d a5        and     l
5b4e a5        and     l
5b4f a5        and     l
5b50 a5        and     l
5b51 a5        and     l
5b52 a5        and     l
5b53 a5        and     l
5b54 a5        and     l
5b55 a5        and     l
5b56 a5        and     l
5b57 a5        and     l
5b58 a5        and     l
5b59 a5        and     l
5b5a a5        and     l
5b5b a5        and     l
5b5c a5        and     l
5b5d a5        and     l
5b5e a5        and     l
5b5f a5        and     l
5b60 a5        and     l
5b61 a5        and     l
5b62 a5        and     l
5b63 a5        and     l
5b64 a5        and     l
5b65 a5        and     l
5b66 a5        and     l
5b67 a5        and     l
5b68 a5        and     l
5b69 a5        and     l
5b6a a5        and     l
5b6b a5        and     l
5b6c a5        and     l
5b6d a5        and     l
5b6e a5        and     l
5b6f a5        and     l
5b70 a5        and     l
5b71 a5        and     l
5b72 a5        and     l
5b73 a5        and     l
5b74 a5        and     l
5b75 a5        and     l
5b76 a5        and     l
5b77 a5        and     l
5b78 a5        and     l
5b79 a5        and     l
5b7a a5        and     l
5b7b a5        and     l
5b7c a5        and     l
5b7d a5        and     l
5b7e a5        and     l
5b7f a5        and     l
5b80 a5        and     l
5b81 a5        and     l
5b82 a5        and     l
5b83 a5        and     l
5b84 a5        and     l
5b85 a5        and     l
5b86 a5        and     l
5b87 a5        and     l
5b88 a5        and     l
5b89 a5        and     l
5b8a a5        and     l
5b8b a5        and     l
5b8c a5        and     l
5b8d a5        and     l
5b8e a5        and     l
5b8f a5        and     l
5b90 a5        and     l
5b91 a5        and     l
5b92 a5        and     l
5b93 a5        and     l
5b94 a5        and     l
5b95 a5        and     l
5b96 a5        and     l
5b97 a5        and     l
5b98 a5        and     l
5b99 a5        and     l
5b9a a5        and     l
5b9b a5        and     l
5b9c a5        and     l
5b9d a5        and     l
5b9e a5        and     l
5b9f a5        and     l
5ba0 a5        and     l
5ba1 a5        and     l
5ba2 a5        and     l
5ba3 a5        and     l
5ba4 a5        and     l
5ba5 a5        and     l
5ba6 a5        and     l
5ba7 a5        and     l
5ba8 a5        and     l
5ba9 a5        and     l
5baa a5        and     l
5bab a5        and     l
5bac a5        and     l
5bad a5        and     l
5bae a5        and     l
5baf a5        and     l
5bb0 a5        and     l
5bb1 a5        and     l
5bb2 a5        and     l
5bb3 a5        and     l
5bb4 a5        and     l
5bb5 a5        and     l
5bb6 a5        and     l
5bb7 a5        and     l
5bb8 a5        and     l
5bb9 a5        and     l
5bba a5        and     l
5bbb a5        and     l
5bbc a5        and     l
5bbd a5        and     l
5bbe a5        and     l
5bbf a5        and     l
5bc0 a5        and     l
5bc1 a5        and     l
5bc2 a5        and     l
5bc3 a5        and     l
5bc4 a5        and     l
5bc5 a5        and     l
5bc6 a5        and     l
5bc7 a5        and     l
5bc8 a5        and     l
5bc9 a5        and     l
5bca a5        and     l
5bcb a5        and     l
5bcc a5        and     l
5bcd a5        and     l
5bce a5        and     l
5bcf a5        and     l
5bd0 a5        and     l
5bd1 a5        and     l
5bd2 a5        and     l
5bd3 a5        and     l
5bd4 a5        and     l
5bd5 a5        and     l
5bd6 a5        and     l
5bd7 a5        and     l
5bd8 a5        and     l
5bd9 a5        and     l
5bda a5        and     l
5bdb a5        and     l
5bdc a5        and     l
5bdd a5        and     l
5bde a5        and     l
5bdf a5        and     l
5be0 a5        and     l
5be1 a5        and     l
5be2 a5        and     l
5be3 a5        and     l
5be4 a5        and     l
5be5 a5        and     l
5be6 a5        and     l
5be7 a5        and     l
5be8 a5        and     l
5be9 a5        and     l
5bea a5        and     l
5beb a5        and     l
5bec a5        and     l
5bed a5        and     l
5bee a5        and     l
5bef a5        and     l
5bf0 a5        and     l
5bf1 a5        and     l
5bf2 a5        and     l
5bf3 a5        and     l
5bf4 a5        and     l
5bf5 a5        and     l
5bf6 a5        and     l
5bf7 a5        and     l
5bf8 a5        and     l
5bf9 a5        and     l
5bfa a5        and     l
5bfb a5        and     l
5bfc a5        and     l
5bfd a5        and     l
5bfe a5        and     l
5bff a5        and     l
5c00 a5        and     l
5c01 a5        and     l
5c02 a5        and     l
5c03 a5        and     l
5c04 a5        and     l
5c05 a5        and     l
5c06 a5        and     l
5c07 a5        and     l
5c08 a5        and     l
5c09 a5        and     l
5c0a a5        and     l
5c0b a5        and     l
5c0c a5        and     l
5c0d a5        and     l
5c0e a5        and     l
5c0f a5        and     l
5c10 a5        and     l
5c11 a5        and     l
5c12 a5        and     l
5c13 a5        and     l
5c14 a5        and     l
5c15 a5        and     l
5c16 a5        and     l
5c17 a5        and     l
5c18 a5        and     l
5c19 a5        and     l
5c1a a5        and     l
5c1b a5        and     l
5c1c a5        and     l
5c1d a5        and     l
5c1e a5        and     l
5c1f a5        and     l
5c20 a5        and     l
5c21 a5        and     l
5c22 a5        and     l
5c23 a5        and     l
5c24 a5        and     l
5c25 a5        and     l
5c26 a5        and     l
5c27 a5        and     l
5c28 a5        and     l
5c29 a5        and     l
5c2a a5        and     l
5c2b a5        and     l
5c2c a5        and     l
5c2d a5        and     l
5c2e a5        and     l
5c2f a5        and     l
5c30 a5        and     l
5c31 a5        and     l
5c32 a5        and     l
5c33 a5        and     l
5c34 a5        and     l
5c35 a5        and     l
5c36 a5        and     l
5c37 a5        and     l
5c38 a5        and     l
5c39 a5        and     l
5c3a a5        and     l
5c3b a5        and     l
5c3c a5        and     l
5c3d a5        and     l
5c3e a5        and     l
5c3f a5        and     l
5c40 a5        and     l
5c41 a5        and     l
5c42 a5        and     l
5c43 a5        and     l
5c44 a5        and     l
5c45 a5        and     l
5c46 a5        and     l
5c47 a5        and     l
5c48 a5        and     l
5c49 a5        and     l
5c4a a5        and     l
5c4b a5        and     l
5c4c a5        and     l
5c4d a5        and     l
5c4e a5        and     l
5c4f a5        and     l
5c50 a5        and     l
5c51 a5        and     l
5c52 a5        and     l
5c53 a5        and     l
5c54 a5        and     l
5c55 a5        and     l
5c56 a5        and     l
5c57 a5        and     l
5c58 a5        and     l
5c59 a5        and     l
5c5a a5        and     l
5c5b a5        and     l
5c5c a5        and     l
5c5d a5        and     l
5c5e a5        and     l
5c5f a5        and     l
5c60 a5        and     l
5c61 a5        and     l
5c62 a5        and     l
5c63 a5        and     l
5c64 a5        and     l
5c65 a5        and     l
5c66 a5        and     l
5c67 a5        and     l
5c68 a5        and     l
5c69 a5        and     l
5c6a a5        and     l
5c6b a5        and     l
5c6c a5        and     l
5c6d a5        and     l
5c6e a5        and     l
5c6f a5        and     l
5c70 a5        and     l
5c71 a5        and     l
5c72 a5        and     l
5c73 a5        and     l
5c74 a5        and     l
5c75 a5        and     l
5c76 a5        and     l
5c77 a5        and     l
5c78 a5        and     l
5c79 a5        and     l
5c7a a5        and     l
5c7b a5        and     l
5c7c a5        and     l
5c7d a5        and     l
5c7e a5        and     l
5c7f a5        and     l
5c80 a5        and     l
5c81 a5        and     l
5c82 a5        and     l
5c83 a5        and     l
5c84 a5        and     l
5c85 a5        and     l
5c86 a5        and     l
5c87 a5        and     l
5c88 a5        and     l
5c89 a5        and     l
5c8a a5        and     l
5c8b a5        and     l
5c8c a5        and     l
5c8d a5        and     l
5c8e a5        and     l
5c8f a5        and     l
5c90 a5        and     l
5c91 a5        and     l
5c92 a5        and     l
5c93 a5        and     l
5c94 a5        and     l
5c95 a5        and     l
5c96 a5        and     l
5c97 a5        and     l
5c98 a5        and     l
5c99 a5        and     l
5c9a a5        and     l
5c9b a5        and     l
5c9c a5        and     l
5c9d a5        and     l
5c9e a5        and     l
5c9f a5        and     l
5ca0 a5        and     l
5ca1 a5        and     l
5ca2 a5        and     l
5ca3 a5        and     l
5ca4 a5        and     l
5ca5 a5        and     l
5ca6 a5        and     l
5ca7 a5        and     l
5ca8 a5        and     l
5ca9 a5        and     l
5caa a5        and     l
5cab a5        and     l
5cac a5        and     l
5cad a5        and     l
5cae a5        and     l
5caf a5        and     l
5cb0 a5        and     l
5cb1 a5        and     l
5cb2 a5        and     l
5cb3 a5        and     l
5cb4 a5        and     l
5cb5 a5        and     l
5cb6 a5        and     l
5cb7 a5        and     l
5cb8 a5        and     l
5cb9 a5        and     l
5cba a5        and     l
5cbb a5        and     l
5cbc a5        and     l
5cbd a5        and     l
5cbe a5        and     l
5cbf a5        and     l
5cc0 a5        and     l
5cc1 a5        and     l
5cc2 a5        and     l
5cc3 a5        and     l
5cc4 a5        and     l
5cc5 a5        and     l
5cc6 a5        and     l
5cc7 a5        and     l
5cc8 a5        and     l
5cc9 a5        and     l
5cca a5        and     l
5ccb a5        and     l
5ccc a5        and     l
5ccd a5        and     l
5cce a5        and     l
5ccf a5        and     l
5cd0 a5        and     l
5cd1 a5        and     l
5cd2 a5        and     l
5cd3 a5        and     l
5cd4 a5        and     l
5cd5 a5        and     l
5cd6 a5        and     l
5cd7 a5        and     l
5cd8 a5        and     l
5cd9 a5        and     l
5cda a5        and     l
5cdb a5        and     l
5cdc a5        and     l
5cdd a5        and     l
5cde a5        and     l
5cdf a5        and     l
5ce0 a5        and     l
5ce1 a5        and     l
5ce2 a5        and     l
5ce3 a5        and     l
5ce4 a5        and     l
5ce5 a5        and     l
5ce6 a5        and     l
5ce7 a5        and     l
5ce8 a5        and     l
5ce9 a5        and     l
5cea a5        and     l
5ceb a5        and     l
5cec a5        and     l
5ced a5        and     l
5cee a5        and     l
5cef a5        and     l
5cf0 a5        and     l
5cf1 a5        and     l
5cf2 a5        and     l
5cf3 a5        and     l
5cf4 a5        and     l
5cf5 a5        and     l
5cf6 a5        and     l
5cf7 a5        and     l
5cf8 a5        and     l
5cf9 a5        and     l
5cfa a5        and     l
5cfb a5        and     l
5cfc a5        and     l
5cfd a5        and     l
5cfe a5        and     l
5cff a5        and     l
5d00 a5        and     l
5d01 a5        and     l
5d02 a5        and     l
5d03 a5        and     l
5d04 a5        and     l
5d05 a5        and     l
5d06 a5        and     l
5d07 a5        and     l
5d08 a5        and     l
5d09 a5        and     l
5d0a a5        and     l
5d0b a5        and     l
5d0c a5        and     l
5d0d a5        and     l
5d0e a5        and     l
5d0f a5        and     l
5d10 a5        and     l
5d11 a5        and     l
5d12 a5        and     l
5d13 a5        and     l
5d14 a5        and     l
5d15 a5        and     l
5d16 a5        and     l
5d17 a5        and     l
5d18 a5        and     l
5d19 a5        and     l
5d1a a5        and     l
5d1b a5        and     l
5d1c a5        and     l
5d1d a5        and     l
5d1e a5        and     l
5d1f a5        and     l
5d20 a5        and     l
5d21 a5        and     l
5d22 a5        and     l
5d23 a5        and     l
5d24 a5        and     l
5d25 a5        and     l
5d26 a5        and     l
5d27 a5        and     l
5d28 a5        and     l
5d29 a5        and     l
5d2a a5        and     l
5d2b a5        and     l
5d2c a5        and     l
5d2d a5        and     l
5d2e a5        and     l
5d2f a5        and     l
5d30 a5        and     l
5d31 a5        and     l
5d32 a5        and     l
5d33 a5        and     l
5d34 a5        and     l
5d35 a5        and     l
5d36 a5        and     l
5d37 a5        and     l
5d38 a5        and     l
5d39 a5        and     l
5d3a a5        and     l
5d3b a5        and     l
5d3c a5        and     l
5d3d a5        and     l
5d3e a5        and     l
5d3f a5        and     l
5d40 a5        and     l
5d41 a5        and     l
5d42 a5        and     l
5d43 a5        and     l
5d44 a5        and     l
5d45 a5        and     l
5d46 a5        and     l
5d47 a5        and     l
5d48 a5        and     l
5d49 a5        and     l
5d4a a5        and     l
5d4b a5        and     l
5d4c a5        and     l
5d4d a5        and     l
5d4e a5        and     l
5d4f a5        and     l
5d50 a5        and     l
5d51 a5        and     l
5d52 a5        and     l
5d53 a5        and     l
5d54 a5        and     l
5d55 a5        and     l
5d56 a5        and     l
5d57 a5        and     l
5d58 a5        and     l
5d59 a5        and     l
5d5a a5        and     l
5d5b a5        and     l
5d5c a5        and     l
5d5d a5        and     l
5d5e a5        and     l
5d5f a5        and     l
5d60 a5        and     l
5d61 a5        and     l
5d62 a5        and     l
5d63 a5        and     l
5d64 a5        and     l
5d65 a5        and     l
5d66 a5        and     l
5d67 a5        and     l
5d68 a5        and     l
5d69 a5        and     l
5d6a a5        and     l
5d6b a5        and     l
5d6c a5        and     l
5d6d a5        and     l
5d6e a5        and     l
5d6f a5        and     l
5d70 a5        and     l
5d71 a5        and     l
5d72 a5        and     l
5d73 a5        and     l
5d74 a5        and     l
5d75 a5        and     l
5d76 a5        and     l
5d77 a5        and     l
5d78 a5        and     l
5d79 a5        and     l
5d7a a5        and     l
5d7b a5        and     l
5d7c a5        and     l
5d7d a5        and     l
5d7e a5        and     l
5d7f a5        and     l
5d80 a5        and     l
5d81 a5        and     l
5d82 a5        and     l
5d83 a5        and     l
5d84 a5        and     l
5d85 a5        and     l
5d86 a5        and     l
5d87 a5        and     l
5d88 a5        and     l
5d89 a5        and     l
5d8a a5        and     l
5d8b a5        and     l
5d8c a5        and     l
5d8d a5        and     l
5d8e a5        and     l
5d8f a5        and     l
5d90 a5        and     l
5d91 a5        and     l
5d92 a5        and     l
5d93 a5        and     l
5d94 a5        and     l
5d95 a5        and     l
5d96 a5        and     l
5d97 a5        and     l
5d98 a5        and     l
5d99 a5        and     l
5d9a a5        and     l
5d9b a5        and     l
5d9c a5        and     l
5d9d a5        and     l
5d9e a5        and     l
5d9f a5        and     l
5da0 a5        and     l
5da1 a5        and     l
5da2 a5        and     l
5da3 a5        and     l
5da4 a5        and     l
5da5 a5        and     l
5da6 a5        and     l
5da7 a5        and     l
5da8 a5        and     l
5da9 a5        and     l
5daa a5        and     l
5dab a5        and     l
5dac a5        and     l
5dad a5        and     l
5dae a5        and     l
5daf a5        and     l
5db0 a5        and     l
5db1 a5        and     l
5db2 a5        and     l
5db3 a5        and     l
5db4 a5        and     l
5db5 a5        and     l
5db6 a5        and     l
5db7 a5        and     l
5db8 a5        and     l
5db9 a5        and     l
5dba a5        and     l
5dbb a5        and     l
5dbc a5        and     l
5dbd a5        and     l
5dbe a5        and     l
5dbf a5        and     l
5dc0 a5        and     l
5dc1 a5        and     l
5dc2 a5        and     l
5dc3 a5        and     l
5dc4 a5        and     l
5dc5 a5        and     l
5dc6 a5        and     l
5dc7 a5        and     l
5dc8 a5        and     l
5dc9 a5        and     l
5dca a5        and     l
5dcb a5        and     l
5dcc a5        and     l
5dcd a5        and     l
5dce a5        and     l
5dcf a5        and     l
5dd0 a5        and     l
5dd1 a5        and     l
5dd2 a5        and     l
5dd3 a5        and     l
5dd4 a5        and     l
5dd5 a5        and     l
5dd6 a5        and     l
5dd7 a5        and     l
5dd8 a5        and     l
5dd9 a5        and     l
5dda a5        and     l
5ddb a5        and     l
5ddc a5        and     l
5ddd a5        and     l
5dde a5        and     l
5ddf a5        and     l
5de0 a5        and     l
5de1 a5        and     l
5de2 a5        and     l
5de3 a5        and     l
5de4 a5        and     l
5de5 a5        and     l
5de6 a5        and     l
5de7 a5        and     l
5de8 a5        and     l
5de9 a5        and     l
5dea a5        and     l
5deb a5        and     l
5dec a5        and     l
5ded a5        and     l
5dee a5        and     l
5def a5        and     l
5df0 a5        and     l
5df1 a5        and     l
5df2 a5        and     l
5df3 a5        and     l
5df4 a5        and     l
5df5 a5        and     l
5df6 a5        and     l
5df7 a5        and     l
5df8 a5        and     l
5df9 a5        and     l
5dfa a5        and     l
5dfb a5        and     l
5dfc a5        and     l
5dfd a5        and     l
5dfe a5        and     l
5dff a5        and     l
5e00 a5        and     l
5e01 a5        and     l
5e02 a5        and     l
5e03 a5        and     l
5e04 a5        and     l
5e05 a5        and     l
5e06 a5        and     l
5e07 a5        and     l
5e08 a5        and     l
5e09 a5        and     l
5e0a a5        and     l
5e0b a5        and     l
5e0c a5        and     l
5e0d a5        and     l
5e0e a5        and     l
5e0f a5        and     l
5e10 a5        and     l
5e11 a5        and     l
5e12 a5        and     l
5e13 a5        and     l
5e14 a5        and     l
5e15 a5        and     l
5e16 a5        and     l
5e17 a5        and     l
5e18 a5        and     l
5e19 a5        and     l
5e1a a5        and     l
5e1b a5        and     l
5e1c a5        and     l
5e1d a5        and     l
5e1e a5        and     l
5e1f a5        and     l
5e20 a5        and     l
5e21 a5        and     l
5e22 a5        and     l
5e23 a5        and     l
5e24 a5        and     l
5e25 a5        and     l
5e26 a5        and     l
5e27 a5        and     l
5e28 a5        and     l
5e29 a5        and     l
5e2a a5        and     l
5e2b a5        and     l
5e2c a5        and     l
5e2d a5        and     l
5e2e a5        and     l
5e2f a5        and     l
5e30 a5        and     l
5e31 a5        and     l
5e32 a5        and     l
5e33 a5        and     l
5e34 a5        and     l
5e35 a5        and     l
5e36 a5        and     l
5e37 a5        and     l
5e38 a5        and     l
5e39 a5        and     l
5e3a a5        and     l
5e3b a5        and     l
5e3c a5        and     l
5e3d a5        and     l
5e3e a5        and     l
5e3f a5        and     l
5e40 a5        and     l
5e41 a5        and     l
5e42 a5        and     l
5e43 a5        and     l
5e44 a5        and     l
5e45 a5        and     l
5e46 a5        and     l
5e47 a5        and     l
5e48 a5        and     l
5e49 a5        and     l
5e4a a5        and     l
5e4b a5        and     l
5e4c a5        and     l
5e4d a5        and     l
5e4e a5        and     l
5e4f a5        and     l
5e50 a5        and     l
5e51 a5        and     l
5e52 a5        and     l
5e53 a5        and     l
5e54 a5        and     l
5e55 a5        and     l
5e56 a5        and     l
5e57 a5        and     l
5e58 a5        and     l
5e59 a5        and     l
5e5a a5        and     l
5e5b a5        and     l
5e5c a5        and     l
5e5d a5        and     l
5e5e a5        and     l
5e5f a5        and     l
5e60 a5        and     l
5e61 a5        and     l
5e62 a5        and     l
5e63 a5        and     l
5e64 a5        and     l
5e65 a5        and     l
5e66 a5        and     l
5e67 a5        and     l
5e68 a5        and     l
5e69 a5        and     l
5e6a a5        and     l
5e6b a5        and     l
5e6c a5        and     l
5e6d a5        and     l
5e6e a5        and     l
5e6f a5        and     l
5e70 a5        and     l
5e71 a5        and     l
5e72 a5        and     l
5e73 a5        and     l
5e74 a5        and     l
5e75 a5        and     l
5e76 a5        and     l
5e77 a5        and     l
5e78 a5        and     l
5e79 a5        and     l
5e7a a5        and     l
5e7b a5        and     l
5e7c a5        and     l
5e7d a5        and     l
5e7e a5        and     l
5e7f a5        and     l
5e80 a5        and     l
5e81 a5        and     l
5e82 a5        and     l
5e83 a5        and     l
5e84 a5        and     l
5e85 a5        and     l
5e86 a5        and     l
5e87 a5        and     l
5e88 a5        and     l
5e89 a5        and     l
5e8a a5        and     l
5e8b a5        and     l
5e8c a5        and     l
5e8d a5        and     l
5e8e a5        and     l
5e8f a5        and     l
5e90 a5        and     l
5e91 a5        and     l
5e92 a5        and     l
5e93 a5        and     l
5e94 a5        and     l
5e95 a5        and     l
5e96 a5        and     l
5e97 a5        and     l
5e98 a5        and     l
5e99 a5        and     l
5e9a a5        and     l
5e9b a5        and     l
5e9c a5        and     l
5e9d a5        and     l
5e9e a5        and     l
5e9f a5        and     l
5ea0 a5        and     l
5ea1 a5        and     l
5ea2 a5        and     l
5ea3 a5        and     l
5ea4 a5        and     l
5ea5 a5        and     l
5ea6 a5        and     l
5ea7 a5        and     l
5ea8 a5        and     l
5ea9 a5        and     l
5eaa a5        and     l
5eab a5        and     l
5eac a5        and     l
5ead a5        and     l
5eae a5        and     l
5eaf a5        and     l
5eb0 a5        and     l
5eb1 a5        and     l
5eb2 a5        and     l
5eb3 a5        and     l
5eb4 a5        and     l
5eb5 a5        and     l
5eb6 a5        and     l
5eb7 a5        and     l
5eb8 a5        and     l
5eb9 a5        and     l
5eba a5        and     l
5ebb a5        and     l
5ebc a5        and     l
5ebd a5        and     l
5ebe a5        and     l
5ebf a5        and     l
5ec0 a5        and     l
5ec1 a5        and     l
5ec2 a5        and     l
5ec3 a5        and     l
5ec4 a5        and     l
5ec5 a5        and     l
5ec6 a5        and     l
5ec7 a5        and     l
5ec8 a5        and     l
5ec9 a5        and     l
5eca a5        and     l
5ecb a5        and     l
5ecc a5        and     l
5ecd a5        and     l
5ece a5        and     l
5ecf a5        and     l
5ed0 a5        and     l
5ed1 a5        and     l
5ed2 a5        and     l
5ed3 a5        and     l
5ed4 a5        and     l
5ed5 a5        and     l
5ed6 a5        and     l
5ed7 a5        and     l
5ed8 a5        and     l
5ed9 a5        and     l
5eda a5        and     l
5edb a5        and     l
5edc a5        and     l
5edd a5        and     l
5ede a5        and     l
5edf a5        and     l
5ee0 a5        and     l
5ee1 a5        and     l
5ee2 a5        and     l
5ee3 a5        and     l
5ee4 a5        and     l
5ee5 a5        and     l
5ee6 a5        and     l
5ee7 a5        and     l
5ee8 a5        and     l
5ee9 a5        and     l
5eea a5        and     l
5eeb a5        and     l
5eec a5        and     l
5eed a5        and     l
5eee a5        and     l
5eef a5        and     l
5ef0 a5        and     l
5ef1 a5        and     l
5ef2 a5        and     l
5ef3 a5        and     l
5ef4 a5        and     l
5ef5 a5        and     l
5ef6 a5        and     l
5ef7 a5        and     l
5ef8 a5        and     l
5ef9 a5        and     l
5efa a5        and     l
5efb a5        and     l
5efc a5        and     l
5efd a5        and     l
5efe a5        and     l
5eff a5        and     l
5f00 a5        and     l
5f01 a5        and     l
5f02 a5        and     l
5f03 a5        and     l
5f04 a5        and     l
5f05 a5        and     l
5f06 a5        and     l
5f07 a5        and     l
5f08 a5        and     l
5f09 a5        and     l
5f0a a5        and     l
5f0b a5        and     l
5f0c a5        and     l
5f0d a5        and     l
5f0e a5        and     l
5f0f a5        and     l
5f10 a5        and     l
5f11 a5        and     l
5f12 a5        and     l
5f13 a5        and     l
5f14 a5        and     l
5f15 a5        and     l
5f16 a5        and     l
5f17 a5        and     l
5f18 a5        and     l
5f19 a5        and     l
5f1a a5        and     l
5f1b a5        and     l
5f1c a5        and     l
5f1d a5        and     l
5f1e a5        and     l
5f1f a5        and     l
5f20 a5        and     l
5f21 a5        and     l
5f22 a5        and     l
5f23 a5        and     l
5f24 a5        and     l
5f25 a5        and     l
5f26 a5        and     l
5f27 a5        and     l
5f28 a5        and     l
5f29 a5        and     l
5f2a a5        and     l
5f2b a5        and     l
5f2c a5        and     l
5f2d a5        and     l
5f2e a5        and     l
5f2f a5        and     l
5f30 a5        and     l
5f31 a5        and     l
5f32 a5        and     l
5f33 a5        and     l
5f34 a5        and     l
5f35 a5        and     l
5f36 a5        and     l
5f37 a5        and     l
5f38 a5        and     l
5f39 a5        and     l
5f3a a5        and     l
5f3b a5        and     l
5f3c a5        and     l
5f3d a5        and     l
5f3e a5        and     l
5f3f a5        and     l
5f40 a5        and     l
5f41 a5        and     l
5f42 a5        and     l
5f43 a5        and     l
5f44 a5        and     l
5f45 a5        and     l
5f46 a5        and     l
5f47 a5        and     l
5f48 a5        and     l
5f49 a5        and     l
5f4a a5        and     l
5f4b a5        and     l
5f4c a5        and     l
5f4d a5        and     l
5f4e a5        and     l
5f4f a5        and     l
5f50 a5        and     l
5f51 a5        and     l
5f52 a5        and     l
5f53 a5        and     l
5f54 a5        and     l
5f55 a5        and     l
5f56 a5        and     l
5f57 a5        and     l
5f58 a5        and     l
5f59 a5        and     l
5f5a a5        and     l
5f5b a5        and     l
5f5c a5        and     l
5f5d a5        and     l
5f5e a5        and     l
5f5f a5        and     l
5f60 a5        and     l
5f61 a5        and     l
5f62 a5        and     l
5f63 a5        and     l
5f64 a5        and     l
5f65 a5        and     l
5f66 a5        and     l
5f67 a5        and     l
5f68 a5        and     l
5f69 a5        and     l
5f6a a5        and     l
5f6b a5        and     l
5f6c a5        and     l
5f6d a5        and     l
5f6e a5        and     l
5f6f a5        and     l
5f70 a5        and     l
5f71 a5        and     l
5f72 a5        and     l
5f73 a5        and     l
5f74 a5        and     l
5f75 a5        and     l
5f76 a5        and     l
5f77 a5        and     l
5f78 a5        and     l
5f79 a5        and     l
5f7a a5        and     l
5f7b a5        and     l
5f7c a5        and     l
5f7d a5        and     l
5f7e a5        and     l
5f7f a5        and     l
5f80 a5        and     l
5f81 a5        and     l
5f82 a5        and     l
5f83 a5        and     l
5f84 a5        and     l
5f85 a5        and     l
5f86 a5        and     l
5f87 a5        and     l
5f88 a5        and     l
5f89 a5        and     l
5f8a a5        and     l
5f8b a5        and     l
5f8c a5        and     l
5f8d a5        and     l
5f8e a5        and     l
5f8f a5        and     l
5f90 a5        and     l
5f91 a5        and     l
5f92 a5        and     l
5f93 a5        and     l
5f94 a5        and     l
5f95 a5        and     l
5f96 a5        and     l
5f97 a5        and     l
5f98 a5        and     l
5f99 a5        and     l
5f9a a5        and     l
5f9b a5        and     l
5f9c a5        and     l
5f9d a5        and     l
5f9e a5        and     l
5f9f a5        and     l
5fa0 a5        and     l
5fa1 a5        and     l
5fa2 a5        and     l
5fa3 a5        and     l
5fa4 a5        and     l
5fa5 a5        and     l
5fa6 a5        and     l
5fa7 a5        and     l
5fa8 a5        and     l
5fa9 a5        and     l
5faa a5        and     l
5fab a5        and     l
5fac a5        and     l
5fad a5        and     l
5fae a5        and     l
5faf a5        and     l
5fb0 a5        and     l
5fb1 a5        and     l
5fb2 a5        and     l
5fb3 a5        and     l
5fb4 a5        and     l
5fb5 a5        and     l
5fb6 a5        and     l
5fb7 a5        and     l
5fb8 a5        and     l
5fb9 a5        and     l
5fba a5        and     l
5fbb a5        and     l
5fbc a5        and     l
5fbd a5        and     l
5fbe a5        and     l
5fbf a5        and     l
5fc0 a5        and     l
5fc1 a5        and     l
5fc2 a5        and     l
5fc3 a5        and     l
5fc4 a5        and     l
5fc5 a5        and     l
5fc6 a5        and     l
5fc7 a5        and     l
5fc8 a5        and     l
5fc9 a5        and     l
5fca a5        and     l
5fcb a5        and     l
5fcc a5        and     l
5fcd cdcd65    call    $65cd
5fd0 cb14      rl      h
5fd2 37        scf     
5fd3 cb10      rl      b
5fd5 c9        ret     

5fd6 a5        and     l
5fd7 a5        and     l
5fd8 a5        and     l
5fd9 a5        and     l
5fda a5        and     l
5fdb a5        and     l
5fdc a5        and     l
5fdd a5        and     l
5fde a5        and     l
5fdf a5        and     l
5fe0 a5        and     l
5fe1 a5        and     l
5fe2 a5        and     l
5fe3 a5        and     l
5fe4 a5        and     l
5fe5 a5        and     l
5fe6 a5        and     l
5fe7 a5        and     l
5fe8 a5        and     l
5fe9 a5        and     l
5fea a5        and     l
5feb a5        and     l
5fec a5        and     l
5fed a5        and     l
5fee a5        and     l
5fef a5        and     l
5ff0 a5        and     l
5ff1 a5        and     l
5ff2 a5        and     l
5ff3 a5        and     l
5ff4 a5        and     l
5ff5 a5        and     l
5ff6 a5        and     l
5ff7 a5        and     l
5ff8 a5        and     l
5ff9 a5        and     l
5ffa a5        and     l
5ffb a5        and     l
5ffc a5        and     l
5ffd a5        and     l
5ffe a5        and     l
5fff a5        and     l

6000 80f0      DW $f080		video ram table
6002 00
6003 80f0 
6005 01
6006 80f0    
6008 02
6009 c0f0 
600b 00  
600c c0f0
600e 01
600f c0f0    
6011 02
6012 00f1        
6014 00
6015 00f1
6017 01
6018 00f1
601a 02  
601b 40f1
601d 00
601e 40f1
6020 01
6021 40f1
6023 02
6024 80f1 
6026 00
6027 80f1
6029 01
602a 80f1   
602c 02     
602d c0f1   
602f 00     
6030 c0f1   
6032 01
6033 c0f1   
6035 02     
6036 00f2
6038 00
6039 00f2
603b 01
603c 00f2
     02
     40f2
     00
     40f2
     01
     40f2
     02
     80f2
     00
     80f2
     01
     80f2
     02
     c0f2
     00
     c0f2
     01
6057 c0f2
     02
     00f3   
605c 00     
605d 00f3   
605f 01
     00f3   video ram
6062 02     
6063 40f3   
6065 00     
6066 40f3   
6068 01
     40f3   
606b 02     
606c 80f3   
606e 00     
606f 80f3   
6071 01
     80f3   
6074 02     
6075 c0f3   
6077 00     
6078 c0f3   
607a 01
     c0f3   
607d 02     
607e 00     
607f f40000 
6082 f40100 
6085 f40240 
6088 f40040 
608b f40140 
608e f40280 
6091 f40080 
6094 f40180 
6097 f402c0 
609a f400c0 
609d f401c0 
60a0 f40200 
60a3 f5     
60a4 00     
60a5 00     
60a6 f5     
60a7 0100f5 
60aa 02     
60ab 40     
60ac f5     
60ad 00     
60ae 40     
60af f5     
60b0 0140f5 
60b3 02     
60b4 80     
60b5 f5     
60b6 00     
60b7 80     
60b8 f5     
60b9 0180f5 
60bc 02     
60bd c0     

60be f5     
60bf 00     
60c0 c0     
60c1 f5     
60c2 01c0f5 
60c5 02     
60c6 00     
60c7 f600   
60c9 00     
60ca f601   
60cc 00     
60cd f602   
60cf 40     
60d0 f600   
60d2 40     
60d3 f601   
60d5 40     
60d6 f602   
60d8 80     
60d9 f600   
60db 80     
60dc f601   
60de 80     
60df f602   
60e1 c0     

60e2 f600   
60e4 c0     
60e5 f601   
60e7 c0     
60e8 f602   
60ea 00     
60eb f7     
60ec 00     
60ed 00     
60ee f7     
60ef 0100f7 
60f2 02     
60f3 40     
60f4 f7     
60f5 00     
60f6 40     
60f7 f7     
60f8 0140f7 
60fb 02     
60fc 80     
60fd f7     
60fe 00     
60ff 80     
6100 f7     
6101 0180f7 
6104 02     
6105 0180f0 
6108 02     
6109 c0     
610a f0     
610b 00     
610c c0     
610d f0     
610e 01c0f0 
6111 02     
6112 00     
6113 f1     
6114 00     
6115 00     
6116 f1     
6117 0100f1 
611a 02     
611b 40     
611c f1     
611d 00     
611e 40     
611f f1     
6120 0140f1 
6123 02     
6124 80     
6125 f1     
6126 00     
6127 80     
6128 f1     
6129 0180f1 
612c 02     
612d c0     
612e f1     
612f 00     
6130 c0     
6131 f1     
6132 01c0f1 
6135 02     
6136 00     
6137 f20000 
613a f20100 
613d f20240 
6140 f20040 
6143 f20140 
6146 f20280 
6149 f20080 
614c f20180 
614f f202c0 
6152 f200c0 
6155 f201c0 
6158 f20200 
615b f3     
615c 00     
615d 00     
615e f3     
615f 0100f3 
6162 02     
6163 40     
6164 f3     
6165 00     
6166 40     
6167 f3     
6168 0140f3 
616b 02     
616c 80     
616d f3     
616e 00     
616f 80     
6170 f3     
6171 0180f3 
6174 02     
6175 c0     
6176 f3     
6177 00     
6178 c0     

6179 f3     
617a 01c0f3 
617d 02     
617e 00     
617f f40000 
6182 f40100 
6185 f40240 
6188 f40040 
618b f40140 
618e f40280 
6191 f40080 
6194 f40180 
6197 f402c0 
619a f400c0 
619d f401c0 
61a0 f40200 
61a3 f5     
61a4 00     
61a5 00     
61a6 f5     
61a7 0100f5 
61aa 02     
61ab 40     
61ac f5     
61ad 00     
61ae 40     
61af f5     
61b0 0140f5 
61b3 02     
61b4 80     
61b5 f5     
61b6 00     
61b7 80     
61b8 f5     
61b9 0180f5 
61bc 02     
61bd c0     
61be f5     
61bf 00     
61c0 c0     
61c1 f5     
61c2 01c0f5 
61c5 02     
61c6 00     
61c7 f600   
61c9 00     
61ca f601   
61cc 00     
61cd f602   
61cf 40     
61d0 f600   
61d2 40     
61d3 f601   
61d5 40     
61d6 f602   
61d8 80     
61d9 f600   
61db 80     
61dc f601   
61de 80     
61df f602   
61e1 c0     
61e2 f600   
61e4 c0     
61e5 f601   
61e7 c0     
61e8 f602   
61ea 00     
61eb f7     
61ec 00     
61ed 00     
61ee f7     
61ef 0100f7 
61f2 02     
61f3 40     
61f4 f7     
61f5 00     
61f6 40     
61f7 f7     
61f8 0140f7 
61fb 02     
61fc 80     
61fd f7     
61fe 00     
61ff 80     
6200 f7     
6201 0180f7 
6204 02     
6205 c0     
6206 f7     
6207 00     
6208 c0     
6209 f7     
620a 01c0f7 
620d 02     
620e 0140f4 
6211 02     
6212 80     
6213 f40080 
6216 f40180 
6219 f402c0 
621c f400c0 
621f f401c0 
6222 f40200 
6225 f5     
6226 00     
6227 00     
6228 f5     
6229 0100f5 
622c 02     
622d 40     
622e f5     
622f 00     
6230 40     
6231 f5     
6232 0140f5 
6235 02     
6236 80     
6237 f5     
6238 00     
6239 80     
623a f5     
623b 7c     
623c 84     
623d 67     
623e c33b64 
6241 00     
6242 c0     
6243 f5     
6244 01c0f5 
6247 02     
6248 00     
6249 f600   
624b 00     
624c f601   
624e 00     
624f f602   
6251 40     
6252 f600   
6254 40     
6255 f601   
6257 40     
6258 f602   
625a 80     
625b f600   
625d 80     
625e f601   
6260 80     
6261 f602   
6263 c0     
6264 f600   
6266 c0     
6267 f601   
6269 c0     
626a f602   
626c 00     
626d f7     
626e 00     
626f 00     
6270 f7     
6271 0100f7 
6274 02     
6275 40     
6276 f7     
6277 00     
6278 40     
6279 f7     
627a 0140f7 
627d 02     
627e 80     
627f f7     
6280 00     
6281 80     
6282 f7     
6283 0180f7 
6286 02     
6287 c0     
6288 f7     
6289 00     
628a c0     
628b f7     
628c 01c0f7 
628f 02     
						end of table?

6290 2abc44    ld      hl,($44bc)
6293 eb        ex      de,hl
6294 2aba44    ld      hl,($44ba)
6297 7b        ld      a,e
6298 95        sub     l
6299 d29f62    jp      nc,$629f
629c eb        ex      de,hl
629d 2f        cpl     
629e 3c        inc     a
629f e5        push    hl
62a0 d9        exx     
62a1 08        ex      af,af'
62a2 e1        pop     hl
62a3 45        ld      b,l
62a4 7c        ld      a,h
62a5 84        add     a,h
62a6 84        add     a,h
62a7 2660      ld      h,$60	on original trs80 fs1 is ld h,$62
62a9 6f        ld      l,a
62aa 5e        ld      e,(hl)
62ab 23        inc     hl
62ac 56        ld      d,(hl)
62ad 23        inc     hl
62ae 78        ld      a,b
62af 1f        rra     
62b0 4e        ld      c,(hl)
62b1 6f        ld      l,a
62b2 79        ld      a,c
62b3 17        rla     
62b4 2600      ld      h,$00
62b6 19        add     hl,de
62b7 5f        ld      e,a
62b8 1664      ld      d,$64
62ba 1a        ld      a,(de)
62bb 57        ld      d,a
62bc 014000    ld      bc,$0040
62bf 7e        ld      a,(hl)
62c0 b2        or      d
62c1 77        ld      (hl),a
62c2 d9        exx     
62c3 08        ex      af,af'
62c4 47        ld      b,a
62c5 7a        ld      a,d
62c6 94        sub     h
62c7 dad562    jp      c,$62d5
62ca 4f        ld      c,a
62cb 90        sub     b
62cc dae062    jp      c,$62e0
62cf cae062    jp      z,$62e0
62d2 c31d63    jp      $631d
62d5 4f        ld      c,a
62d6 80        add     a,b
62d7 d25a63    jp      nc,$635a
62da ca9863    jp      z,$6398
62dd c39863    jp      $6398
62e0 50        ld      d,b
62e1 14        inc     d
62e2 af        xor     a
62e3 90        sub     b
62e4 1f        rra     
62e5 c3fe62    jp      $62fe
62e8 d9        exx     
62e9 08        ex      af,af'
62ea 7a        ld      a,d
62eb e615      and     $15
62ed caf562    jp      z,$62f5
62f0 17        rla     
62f1 57        ld      d,a
62f2 c3f962    jp      $62f9
62f5 7a        ld      a,d
62f6 0f        rrca    
62f7 57        ld      d,a
62f8 23        inc     hl
62f9 7e        ld      a,(hl)
62fa b2        or      d
62fb 77        ld      (hl),a
62fc d9        exx     
62fd 08        ex      af,af'
62fe 15        dec     d
62ff c8        ret     z

6300 81        add     a,c
6301 d2e862    jp      nc,$62e8
6304 90        sub     b
6305 d9        exx     
6306 08        ex      af,af'
6307 7a        ld      a,d
6308 e630      and     $30
630a c21463    jp      nz,$6314
630d 7a        ld      a,d
630e 07        rlca    
630f 07        rlca    
6310 57        ld      d,a
6311 c31a63    jp      $631a
6314 0f        rrca    
6315 0f        rrca    
6316 0f        rrca    
6317 0f        rrca    
6318 57        ld      d,a
6319 09        add     hl,bc
631a c3ea62    jp      $62ea
631d 51        ld      d,c
631e 14        inc     d
631f af        xor     a
6320 91        sub     c
6321 1f        rra     
6322 c33f63    jp      $633f
6325 d9        exx     
6326 08        ex      af,af'
6327 7a        ld      a,d
6328 e630      and     $30
632a c23463    jp      nz,$6334
632d 7a        ld      a,d
632e 07        rlca    
632f 07        rlca    
6330 57        ld      d,a
6331 c33a63    jp      $633a
6334 0f        rrca    
6335 0f        rrca    
6336 0f        rrca    
6337 0f        rrca    
6338 57        ld      d,a
6339 09        add     hl,bc
633a 7e        ld      a,(hl)
633b b2        or      d
633c 77        ld      (hl),a
633d d9        exx     
633e 08        ex      af,af'
633f 15        dec     d
6340 c8        ret     z

6341 80        add     a,b
6342 d22563    jp      nc,$6325
6345 91        sub     c
6346 d9        exx     
6347 08        ex      af,af'
6348 7a        ld      a,d
6349 e615      and     $15
634b ca5363    jp      z,$6353
634e 17        rla     
634f 57        ld      d,a
6350 c35763    jp      $6357
6353 7a        ld      a,d
6354 0f        rrca    
6355 57        ld      d,a
6356 23        inc     hl
6357 c32763    jp      $6327
635a 51        ld      d,c
635b 15        dec     d
635c 79        ld      a,c
635d 37        scf     
635e 1f        rra     
635f c37d63    jp      $637d
6362 d9        exx     
6363 08        ex      af,af'
6364 7a        ld      a,d
6365 e603      and     $03
6367 c27163    jp      nz,$6371
636a 7a        ld      a,d
636b 0f        rrca    
636c 0f        rrca    
636d 57        ld      d,a
636e c37863    jp      $6378
6371 07        rlca    
6372 07        rlca    
6373 07        rlca    
6374 07        rlca    
6375 57        ld      d,a
6376 ed42      sbc     hl,bc
6378 7e        ld      a,(hl)
6379 b2        or      d
637a 77        ld      (hl),a
637b d9        exx     
637c 08        ex      af,af'
637d 14        inc     d
637e c8        ret     z

637f 80        add     a,b
6380 d26263    jp      nc,$6362
6383 81        add     a,c
6384 d9        exx     
6385 08        ex      af,af'
6386 7a        ld      a,d
6387 e615      and     $15
6389 ca9163    jp      z,$6391
638c 17        rla     
638d 57        ld      d,a
638e c39563    jp      $6395
6391 7a        ld      a,d
6392 0f        rrca    
6393 57        ld      d,a
6394 23        inc     hl
6395 c36463    jp      $6364
6398 50        ld      d,b
6399 14        inc     d
639a af        xor     a
639b 90        sub     b
639c 1f        rra     
639d c3b663    jp      $63b6
63a0 d9        exx     
63a1 08        ex      af,af'
63a2 7a        ld      a,d
63a3 e615      and     $15
63a5 caad63    jp      z,$63ad
63a8 17        rla     
63a9 57        ld      d,a
63aa c3b163    jp      $63b1
63ad 7a        ld      a,d
63ae 0f        rrca    
63af 57        ld      d,a
63b0 23        inc     hl
63b1 7e        ld      a,(hl)
63b2 b2        or      d
63b3 77        ld      (hl),a
63b4 d9        exx     
63b5 08        ex      af,af'
63b6 15        dec     d
63b7 c8        ret     z

63b8 91        sub     c
63b9 daa063    jp      c,$63a0
63bc 90        sub     b
63bd d9        exx     
63be 08        ex      af,af'
63bf 7a        ld      a,d
63c0 e603      and     $03
63c2 c2cc63    jp      nz,$63cc
63c5 7a        ld      a,d
63c6 0f        rrca    
63c7 0f        rrca    
63c8 57        ld      d,a
63c9 c3d363    jp      $63d3
63cc 07        rlca    
63cd 07        rlca    
63ce 07        rlca    
63cf 07        rlca    
63d0 57        ld      d,a
63d1 ed42      sbc     hl,bc
63d3 c3a263    jp      $63a2
63d6 00        nop     
63d7 00        nop     
63d8 00        nop     
63d9 00        nop     
63da 00        nop     
63db 00        nop     
63dc 00        nop     
63dd 00        nop     
63de 00        nop     
63df 00        nop     
63e0 00        nop     
63e1 00        nop     
63e2 00        nop     
63e3 00        nop     
63e4 00        nop     
63e5 00        nop     
63e6 00        nop     
63e7 00        nop     
63e8 00        nop     
63e9 00        nop     
63ea 00        nop     
63eb 00        nop     
63ec 00        nop     
63ed 00        nop     
63ee 00        nop     
63ef 00        nop     
63f0 00        nop     
63f1 00        nop     
63f2 00        nop     
63f3 00        nop     
63f4 00        nop     
63f5 00        nop     
63f6 00        nop     
63f7 00        nop     
63f8 00        nop     
63f9 00        nop     
63fa 00        nop     
63fb 00        nop     
63fc 00        nop     
63fd 00        nop     
63fe 00        nop     
63ff 00        nop     
6400 010204    ld      bc,$0402
6403 08        ex      af,af'
6404 1020      djnz    $6426
6406 ed730649  ld      ($4906),sp		clear screen
640a 217cf7    ld      hl,$f77c			video ram done
640d 118080    ld      de,$8080
6410 061c      ld      b,$1c			on original trs80 fs1 is ld b,$0e
6412 f9        ld      sp,hl
6413 d5        push    de
6414 d5        push    de
6415 d5        push    de
6416 d5        push    de
6417 d5        push    de
6418 d5        push    de
6419 d5        push    de
641a d5        push    de
641b d5        push    de
641c d5        push    de
641d d5        push    de
641e d5        push    de
641f d5        push    de
6420 d5        push    de
6421 d5        push    de
6422 d5        push    de
6423 d5        push    de
6424 d5        push    de
6425 d5        push    de
6426 d5        push    de
6427 d5        push    de
6428 d5        push    de
6429 d5        push    de
642a d5        push    de
642b d5        push    de
642c 7d        ld      a,l
642d d640      sub     $40
642f 6f        ld      l,a
6430 d23464    jp      nc,$6434
6433 25        dec     h
6434 10dc      djnz    $6412
6436 ed7b0649  ld      sp,($4906)
643a c9        ret     

643b e5        push    hl
643c d9        exx     
643d 08        ex      af,af'
643e e1        pop     hl
643f 45        ld      b,l
6440 7c        ld      a,h
6441 84        add     a,h
6442 84        add     a,h
6443 2660      ld      h,$60	on orignal trs80 fs1 is ld h,$62
6445 6f        ld      l,a
6446 5e        ld      e,(hl)
6447 23        inc     hl
6448 56        ld      d,(hl)
6449 23        inc     hl
644a 78        ld      a,b
644b 1f        rra     
644c 4e        ld      c,(hl)
644d 6f        ld      l,a
644e 79        ld      a,c
644f 17        rla     
6450 2600      ld      h,$00
6452 19        add     hl,de
6453 5f        ld      e,a
6454 1664      ld      d,$64
6456 1a        ld      a,(de)
6457 57        ld      d,a
6458 014000    ld      bc,$0040
645b 7e        ld      a,(hl)
645c b2        or      d
645d 77        ld      (hl),a
645e d9        exx     
645f 08        ex      af,af'
6460 c9        ret     

6461 dd2a9444  ld      ix,($4494)
6465 dd7e00    ld      a,(ix+$00)
6468 fefe      cp      $fe
646a da7a64    jp      c,$647a
646d c8        ret     z
646e dd6e01    ld      l,(ix+$01)
6471 dd6602    ld      h,(ix+$02)
6474 cd3b64    call    $643b		draw point
6477 c38964    jp      $6489
647a 5f        ld      e,a
647b dd5601    ld      d,(ix+$01)
647e dd6e02    ld      l,(ix+$02)
6481 dd6603    ld      h,(ix+$03)
6484 cd9762    call    $6297		draw line
6487 dd23      inc     ix
6489 dd23      inc     ix
648b dd23      inc     ix
648d dd23      inc     ix
648f c36564    jp      $6465
6492 af        xor     a
6493 4f        ld      c,a
6494 b4        or      h
6495 f2
6496 2f
6497 65        ld      h,l
6498 af        xor     a
6499 b2        or      d
649a f22365    jp      p,$6523
649d af        xor     a
649e 93        sub     e
649f 5f        ld      e,a
64a0 9f        sbc     a,a
64a1 92        sub     d
64a2 57        ld      d,a
64a3 29        add     hl,hl
64a4 af        xor     a
64a5 95        sub     l
64a6 47        ld      b,a
64a7 9f        sbc     a,a
64a8 94        sub     h
64a9 ccc565    call    z,$65c5
64ac 210000    ld      hl,$0000
64af 87        add     a,a
64b0 d2b564    jp      nc,$64b5
64b3 19        add     hl,de
64b4 89        adc     a,c
64b5 29        add     hl,hl
64b6 8f        adc     a,a
64b7 d2bc64    jp      nc,$64bc
64ba 19        add     hl,de
64bb 89        adc     a,c
64bc 29        add     hl,hl
64bd 8f        adc     a,a
64be d2c364    jp      nc,$64c3
64c1 19        add     hl,de
64c2 89        adc     a,c
64c3 29        add     hl,hl
64c4 8f        adc     a,a
64c5 d2ca64    jp      nc,$64ca
64c8 19        add     hl,de
64c9 89        adc     a,c
64ca 29        add     hl,hl
64cb 8f        adc     a,a
64cc d2d164    jp      nc,$64d1
64cf 19        add     hl,de
64d0 89        adc     a,c
64d1 29        add     hl,hl
64d2 8f        adc     a,a
64d3 d2d864    jp      nc,$64d8
64d6 19        add     hl,de
64d7 89        adc     a,c
64d8 29        add     hl,hl
64d9 8f        adc     a,a
64da d2df64    jp      nc,$64df
64dd 19        add     hl,de
64de 89        adc     a,c
64df 29        add     hl,hl
64e0 8f        adc     a,a
64e1 d2e664    jp      nc,$64e6
64e4 19        add     hl,de
64e5 89        adc     a,c
64e6 4f        ld      c,a
64e7 78        ld      a,b
64e8 41        ld      b,c
64e9 0e00      ld      c,$00
64eb 29        add     hl,hl
64ec 8f        adc     a,a
64ed d2f264    jp      nc,$64f2
64f0 19        add     hl,de
64f1 89        adc     a,c
64f2 29        add     hl,hl
64f3 8f        adc     a,a
64f4 d2f964    jp      nc,$64f9
64f7 19        add     hl,de
64f8 89        adc     a,c
64f9 29        add     hl,hl
64fa 8f        adc     a,a
64fb d20065    jp      nc,$6500
64fe 19        add     hl,de
64ff 89        adc     a,c
6500 29        add     hl,hl
6501 8f        adc     a,a
6502 d20765    jp      nc,$6507
6505 19        add     hl,de
6506 89        adc     a,c
6507 29        add     hl,hl
6508 8f        adc     a,a
6509 d20e65    jp      nc,$650e
650c 19        add     hl,de
650d 89        adc     a,c
650e 29        add     hl,hl
650f 8f        adc     a,a
6510 d21565    jp      nc,$6515
6513 19        add     hl,de
6514 89        adc     a,c
6515 29        add     hl,hl
6516 8f        adc     a,a
6517 d21c65    jp      nc,$651c
651a 19        add     hl,de
651b 89        adc     a,c
651c 29        add     hl,hl
651d 8f        adc     a,a
651e 57        ld      d,a
651f 79        ld      a,c
6520 88        adc     a,b
6521 42        ld      b,d
6522 c9        ret     

6523 29        add     hl,hl
6524 af        xor     a
6525 95        sub     l
6526 47        ld      b,a
6527 9f        sbc     a,a
6528 94        sub     h
6529 ccc565    call    z,$65c5
652c c33c65    jp      $653c
652f b2        or      d
6530 f2bf65    jp      p,$65bf
6533 af        xor     a
6534 93        sub     e
6535 5f        ld      e,a
6536 9f        sbc     a,a
6537 92        sub     d
6538 57        ld      d,a
6539 29        add     hl,hl
653a 45        ld      b,l
653b 7c        ld      a,h
653c 210000    ld      hl,$0000
653f 87        add     a,a
6540 d24565    jp      nc,$6545
6543 19        add     hl,de
6544 89        adc     a,c
6545 29        add     hl,hl
6546 8f        adc     a,a
6547 d24c65    jp      nc,$654c
654a 19        add     hl,de
654b 89        adc     a,c
654c 29        add     hl,hl
654d 8f        adc     a,a
654e d25365    jp      nc,$6553
6551 19        add     hl,de
6552 89        adc     a,c
6553 29        add     hl,hl
6554 8f        adc     a,a
6555 d25a65    jp      nc,$655a
6558 19        add     hl,de
6559 89        adc     a,c
655a 29        add     hl,hl
655b 8f        adc     a,a
655c d26165    jp      nc,$6561
655f 19        add     hl,de
6560 89        adc     a,c
6561 29        add     hl,hl
6562 8f        adc     a,a
6563 d26865    jp      nc,$6568
6566 19        add     hl,de
6567 89        adc     a,c
6568 29        add     hl,hl
6569 8f        adc     a,a
656a d26f65    jp      nc,$656f
656d 19        add     hl,de
656e 89        adc     a,c
656f 29        add     hl,hl
6570 8f        adc     a,a
6571 d27665    jp      nc,$6576
6574 19        add     hl,de
6575 89        adc     a,c
6576 4f        ld      c,a
6577 78        ld      a,b
6578 41        ld      b,c
6579 0e00      ld      c,$00
657b 29        add     hl,hl
657c 8f        adc     a,a
657d d28265    jp      nc,$6582
6580 19        add     hl,de
6581 89        adc     a,c
6582 29        add     hl,hl
6583 8f        adc     a,a
6584 d28965    jp      nc,$6589
6587 19        add     hl,de
6588 89        adc     a,c
6589 29        add     hl,hl
658a 8f        adc     a,a
658b d29065    jp      nc,$6590
658e 19        add     hl,de
658f 89        adc     a,c
6590 29        add     hl,hl
6591 8f        adc     a,a
6592 d29765    jp      nc,$6597
6595 19        add     hl,de
6596 89        adc     a,c
6597 29        add     hl,hl
6598 8f        adc     a,a
6599 d29e65    jp      nc,$659e
659c 19        add     hl,de
659d 89        adc     a,c
659e 29        add     hl,hl
659f 8f        adc     a,a
65a0 d2a565    jp      nc,$65a5
65a3 19        add     hl,de
65a4 89        adc     a,c
65a5 29        add     hl,hl
65a6 8f        adc     a,a
65a7 d2ac65    jp      nc,$65ac
65aa 19        add     hl,de
65ab 89        adc     a,c
65ac 29        add     hl,hl
65ad 8f        adc     a,a
65ae 5f        ld      e,a
65af 79        ld      a,c
65b0 88        adc     a,b
65b1 43        ld      b,e
65b2 57        ld      d,a
65b3 af        xor     a
65b4 95        sub     l
65b5 6f        ld      l,a
65b6 79        ld      a,c
65b7 9c        sbc     a,h
65b8 67        ld      h,a
65b9 79        ld      a,c
65ba 98        sbc     a,b
65bb 47        ld      b,a
65bc 79        ld      a,c
65bd 9a        sbc     a,d
65be c9        ret     

65bf 29        add     hl,hl
65c0 45        ld      b,l
65c1 7c        ld      a,h
65c2 c3ac64    jp      $64ac
65c5 04        inc     b
65c6 05        dec     b
65c7 c0        ret     nz

65c8 06fe      ld      b,$fe
65ca 3eff      ld      a,$ff
65cc c9        ret     

65cd b7        or      a
65ce faac67    jp      m,$67ac
65d1 d5        push    de
65d2 eb        ex      de,hl
65d3 67        ld      h,a
65d4 68        ld      l,b
65d5 7b        ld      a,e
65d6 329a44    ld      ($449a),a
65d9 7a        ld      a,d
65da d1        pop     de
65db f5        push    af
65dc af        xor     a
65dd 93        sub     e
65de 4f        ld      c,a
65df 3e00      ld      a,$00
65e1 9a        sbc     a,d
65e2 47        ld      b,a
65e3 f1        pop     af
65e4 09        add     hl,bc
65e5 dacc67    jp      c,$67cc
65e8 29        add     hl,hl
65e9 8f        adc     a,a
65ea d2ee65    jp      nc,$65ee
65ed 23        inc     hl
65ee 19        add     hl,de
65ef 29        add     hl,hl
65f0 da0066    jp      c,$6600
65f3 c30d66    jp      $660d
65f6 8f        adc     a,a
65f7 d2fb65    jp      nc,$65fb
65fa 23        inc     hl
65fb 09        add     hl,bc
65fc 29        add     hl,hl
65fd d20d66    jp      nc,$660d
6600 8f        adc     a,a
6601 d20566    jp      nc,$6605
6604 23        inc     hl
6605 19        add     hl,de
6606 29        add     hl,hl
6607 da1766    jp      c,$6617
660a c32466    jp      $6624
660d 8f        adc     a,a
660e d21266    jp      nc,$6612
6611 23        inc     hl
6612 09        add     hl,bc
6613 29        add     hl,hl
6614 d22466    jp      nc,$6624
6617 8f        adc     a,a
6618 d21c66    jp      nc,$661c
661b 23        inc     hl
661c 19        add     hl,de
661d 29        add     hl,hl
661e da2e66    jp      c,$662e
6621 c33b66    jp      $663b
6624 8f        adc     a,a
6625 d22966    jp      nc,$6629
6628 23        inc     hl
6629 09        add     hl,bc
662a 29        add     hl,hl
662b d23b66    jp      nc,$663b
662e 8f        adc     a,a
662f d23366    jp      nc,$6633
6632 23        inc     hl
6633 19        add     hl,de
6634 29        add     hl,hl
6635 da4566    jp      c,$6645
6638 c35266    jp      $6652
663b 8f        adc     a,a
663c d24066    jp      nc,$6640
663f 23        inc     hl
6640 09        add     hl,bc
6641 29        add     hl,hl
6642 d25266    jp      nc,$6652
6645 8f        adc     a,a
6646 d24a66    jp      nc,$664a
6649 23        inc     hl
664a 19        add     hl,de
664b 29        add     hl,hl
664c da5c66    jp      c,$665c
664f c36966    jp      $6669
6652 8f        adc     a,a
6653 d25766    jp      nc,$6657
6656 23        inc     hl
6657 09        add     hl,bc
6658 29        add     hl,hl
6659 d26966    jp      nc,$6669
665c 8f        adc     a,a
665d d26166    jp      nc,$6661
6660 23        inc     hl
6661 19        add     hl,de
6662 29        add     hl,hl
6663 da7366    jp      c,$6673
6666 c38066    jp      $6680
6669 8f        adc     a,a
666a d26e66    jp      nc,$666e
666d 23        inc     hl
666e 09        add     hl,bc
666f 29        add     hl,hl
6670 d28066    jp      nc,$6680
6673 8f        adc     a,a
6674 d27866    jp      nc,$6678
6677 23        inc     hl
6678 19        add     hl,de
6679 29        add     hl,hl
667a da8a66    jp      c,$668a
667d c39766    jp      $6697
6680 8f        adc     a,a
6681 d28566    jp      nc,$6685
6684 23        inc     hl
6685 09        add     hl,bc
6686 29        add     hl,hl
6687 d29766    jp      nc,$6697
668a 8f        adc     a,a
668b d28f66    jp      nc,$668f
668e 23        inc     hl
668f 19        add     hl,de
6690 29        add     hl,hl
6691 daa166    jp      c,$66a1
6694 c3ae66    jp      $66ae
6697 8f        adc     a,a
6698 d29c66    jp      nc,$669c
669b 23        inc     hl
669c 09        add     hl,bc
669d 29        add     hl,hl
669e d2ae66    jp      nc,$66ae
66a1 2f        cpl     
66a2 f5        push    af
66a3 3a9a44    ld      a,($449a)
66a6 c3b666    jp      $66b6
66a9 00        nop     
66aa 00        nop     
66ab 00        nop     
66ac 00        nop     
66ad 00        nop     
66ae 2f        cpl     
66af f5        push    af
66b0 3a9a44    ld      a,($449a)
66b3 c3c366    jp      $66c3
66b6 8f        adc     a,a
66b7 d2bb66    jp      nc,$66bb
66ba 23        inc     hl
66bb 19        add     hl,de
66bc 29        add     hl,hl
66bd dacd66    jp      c,$66cd
66c0 c3da66    jp      $66da
66c3 8f        adc     a,a
66c4 d2c866    jp      nc,$66c8
66c7 23        inc     hl
66c8 09        add     hl,bc
66c9 29        add     hl,hl
66ca d2da66    jp      nc,$66da
66cd 8f        adc     a,a
66ce d2d266    jp      nc,$66d2
66d1 23        inc     hl
66d2 19        add     hl,de
66d3 29        add     hl,hl
66d4 dae466    jp      c,$66e4
66d7 c3f166    jp      $66f1
66da 8f        adc     a,a
66db d2df66    jp      nc,$66df
66de 23        inc     hl
66df 09        add     hl,bc
66e0 29        add     hl,hl
66e1 d2f166    jp      nc,$66f1
66e4 8f        adc     a,a
66e5 d2e966    jp      nc,$66e9
66e8 23        inc     hl
66e9 19        add     hl,de
66ea 29        add     hl,hl
66eb dafb66    jp      c,$66fb
66ee c30867    jp      $6708
66f1 8f        adc     a,a
66f2 d2f666    jp      nc,$66f6
66f5 23        inc     hl
66f6 09        add     hl,bc
66f7 29        add     hl,hl
66f8 d20867    jp      nc,$6708
66fb 8f        adc     a,a
66fc d20067    jp      nc,$6700
66ff 23        inc     hl
6700 19        add     hl,de
6701 29        add     hl,hl
6702 da1267    jp      c,$6712
6705 c31f67    jp      $671f
6708 8f        adc     a,a
6709 d20d67    jp      nc,$670d
670c 23        inc     hl
670d 09        add     hl,bc
670e 29        add     hl,hl
670f d21f67    jp      nc,$671f
6712 8f        adc     a,a
6713 d21767    jp      nc,$6717
6716 23        inc     hl
6717 19        add     hl,de
6718 29        add     hl,hl
6719 da2967    jp      c,$6729
671c c33667    jp      $6736
671f 8f        adc     a,a
6720 d22467    jp      nc,$6724
6723 23        inc     hl
6724 09        add     hl,bc
6725 29        add     hl,hl
6726 d23667    jp      nc,$6736
6729 8f        adc     a,a
672a d22e67    jp      nc,$672e
672d 23        inc     hl
672e 19        add     hl,de
672f 29        add     hl,hl
6730 da4067    jp      c,$6740
6733 c34d67    jp      $674d
6736 8f        adc     a,a
6737 d23b67    jp      nc,$673b
673a 23        inc     hl
673b 09        add     hl,bc
673c 29        add     hl,hl
673d d24d67    jp      nc,$674d
6740 8f        adc     a,a
6741 d24567    jp      nc,$6745
6744 23        inc     hl
6745 19        add     hl,de
6746 29        add     hl,hl
6747 8f        adc     a,a
6748 c35567    jp      $6755
674b 00        nop     
674c 00        nop     
674d 8f        adc     a,a
674e d25267    jp      nc,$6752
6751 23        inc     hl
6752 09        add     hl,bc
6753 29        add     hl,hl
6754 8f        adc     a,a
6755 2f        cpl     
6756 47        ld      b,a
6757 f1        pop     af
6758 c9        ret     

6759 67        ld      h,a
675a 68        ld      l,b
675b af        xor     a
675c 329a44    ld      ($449a),a
675f b4        or      h
6760 fa7f67    jp      m,$677f
6763 b2        or      d
6764 fa6b67    jp      m,$676b
6767 af        xor     a
6768 c3db65    jp      $65db
676b eb        ex      de,hl
676c 42        ld      b,d
676d 4b        ld      c,e
676e af        xor     a
676f 93        sub     e
6770 5f        ld      e,a
6771 9f        sbc     a,a
6772 92        sub     d
6773 57        ld      d,a
6774 af        xor     a
6775 cde465    call    $65e4
6778 67        ld      h,a
6779 af        xor     a
677a 90        sub     b
677b 47        ld      b,a
677c 9f        sbc     a,a
677d 94        sub     h
677e c9        ret     

677f aa        xor     d
6780 f29a67    jp      p,$679a
6783 af        xor     a
6784 95        sub     l
6785 6f        ld      l,a
6786 9f        sbc     a,a
6787 94        sub     h
6788 67        ld      h,a
6789 af        xor     a
678a 93        sub     e
678b 4f        ld      c,a
678c 9f        sbc     a,a
678d 92        sub     d
678e 47        ld      b,a
678f af        xor     a
6790 cde465    call    $65e4
6793 67        ld      h,a
6794 af        xor     a
6795 90        sub     b
6796 47        ld      b,a
6797 9f        sbc     a,a
6798 94        sub     h
6799 c9        ret     

679a 4b        ld      c,e
679b 42        ld      b,d
679c af        xor     a
679d 93        sub     e
679e 5f        ld      e,a
679f 9f        sbc     a,a
67a0 92        sub     d
67a1 57        ld      d,a
67a2 af        xor     a
67a3 95        sub     l
67a4 6f        ld      l,a
67a5 9f        sbc     a,a
67a6 94        sub     h
67a7 67        ld      h,a
67a8 af        xor     a
67a9 c3e465    jp      $65e4
67ac d5        push    de
67ad eb        ex      de,hl
67ae 67        ld      h,a
67af af        xor     a
67b0 93        sub     e
67b1 329a44    ld      ($449a),a
67b4 3e00      ld      a,$00
67b6 9a        sbc     a,d
67b7 f5        push    af
67b8 3e00      ld      a,$00
67ba 98        sbc     a,b
67bb 6f        ld      l,a
67bc 3e00      ld      a,$00
67be 9c        sbc     a,h
67bf 67        ld      h,a
67c0 f1        pop     af
67c1 d1        pop     de
67c2 cddb65    call    $65db
67c5 67        ld      h,a
67c6 af        xor     a
67c7 90        sub     b
67c8 47        ld      b,a
67c9 9f        sbc     a,a
67ca 94        sub     h
67cb c9        ret     

67cc 3e7f      ld      a,$7f
67ce 06ff      ld      b,$ff
67d0 c9        ret     

67d1 cdd667    call    $67d6
67d4 eb        ex      de,hl
67d5 c9        ret     

67d6 67        ld      h,a
67d7 0e00      ld      c,$00
67d9 af        xor     a
67da 84        add     a,h
67db 214c48    ld      hl,$484c
67de fa1868    jp      m,$6818
67e1 fe40      cp      $40
67e3 fa0c68    jp      m,$680c
67e6 c680      add     a,$80
67e8 2f        cpl     
67e9 3c        inc     a
67ea 87        add     a,a
67eb 5f        ld      e,a
67ec 1600      ld      d,$00
67ee 19        add     hl,de
67ef 00        nop     
67f0 5e        ld      e,(hl)
67f1 23        inc     hl
67f2 56        ld      d,(hl)
67f3 af        xor     a
67f4 93        sub     e
67f5 5f        ld      e,a
67f6 9f        sbc     a,a
67f7 92        sub     d
67f8 57        ld      d,a
67f9 2b        dec     hl
67fa af        xor     a
67fb 95        sub     l
67fc 6f        ld      l,a
67fd 9f        sbc     a,a
67fe 94        sub     h
67ff 67        ld      h,a
6800 d5        push    de
6801 118c48    ld      de,$488c
6804 19        add     hl,de
6805 19        add     hl,de
6806 5e        ld      e,(hl)
6807 23        inc     hl
6808 56        ld      d,(hl)
6809 e1        pop     hl
680a eb        ex      de,hl
680b c9        ret     

680c 87        add     a,a
680d 5f        ld      e,a
680e 1600      ld      d,$00
6810 19        add     hl,de
6811 00        nop     
6812 5e        ld      e,(hl)
6813 23        inc     hl
6814 56        ld      d,(hl)
6815 c3f967    jp      $67f9
6818 2f        cpl     
6819 3c        inc     a
681a fe40      cp      $40
681c fa4a68    jp      m,$684a
681f c680      add     a,$80
6821 2f        cpl     
6822 3c        inc     a
6823 87        add     a,a
6824 5f        ld      e,a
6825 1600      ld      d,$00
6827 19        add     hl,de
6828 00        nop     
6829 5e        ld      e,(hl)
682a 23        inc     hl
682b 56        ld      d,(hl)
682c af        xor     a
682d 93        sub     e
682e 5f        ld      e,a
682f 9f        sbc     a,a
6830 92        sub     d
6831 57        ld      d,a
6832 2b        dec     hl
6833 af        xor     a
6834 95        sub     l
6835 6f        ld      l,a
6836 9f        sbc     a,a
6837 94        sub     h
6838 67        ld      h,a
6839 d5        push    de
683a 118c48    ld      de,$488c
683d 19        add     hl,de
683e 19        add     hl,de
683f 5e        ld      e,(hl)
6840 23        inc     hl
6841 56        ld      d,(hl)
6842 af        xor     a
6843 93        sub     e
6844 6f        ld      l,a
6845 9f        sbc     a,a
6846 92        sub     d
6847 67        ld      h,a
6848 d1        pop     de
6849 c9        ret     

684a 87        add     a,a
684b 5f        ld      e,a
684c 1600      ld      d,$00
684e 19        add     hl,de
684f 00        nop     
6850 5e        ld      e,(hl)
6851 23        inc     hl
6852 56        ld      d,(hl)
6853 c33268    jp      $6832
6856 2a8c44    ld      hl,($448c)
6859 3ad344    ld      a,($44d3)	[44d3]=1->map view, =0->forward view
685c b7        or      a
685d ca6568    jp      z,$6865
6860 2640      ld      h,$40
6862 c36a68    jp      $686a
6865 3ab144    ld      a,($44b1)
6868 84        add     a,h
6869 67        ld      h,a
686a cdd967    call    $67d9
686d 225d44    ld      ($445d),hl
6870 af        xor     a
6871 95        sub     l
6872 327d44    ld      ($447d),a
6875 9f        sbc     a,a
6876 94        sub     h
6877 327e44    ld      ($447e),a
687a eb        ex      de,hl
687b 225b44    ld      ($445b),hl
687e 2a8d44    ld      hl,($448d)
6881 3ad344    ld      a,($44d3)	[44d3]=1->map view, =0->forward view
6884 b7        or      a
6885 ca8a68    jp      z,$688a
6888 2600      ld      h,$00
688a 3ab044    ld      a,($44b0)
688d 84        add     a,h
688e 67        ld      h,a
688f cdd967    call    $67d9
6892 225744    ld      ($4457),hl
6895 eb        ex      de,hl
6896 226544    ld      ($4465),hl
6899 e5        push    hl
689a 2a5b44    ld      hl,($445b)
689d cd9264    call    $6492
68a0 327a44    ld      ($447a),a
68a3 78        ld      a,b
68a4 327944    ld      ($4479),a
68a7 2a5b44    ld      hl,($445b)
68aa d1        pop     de
68ab cd9264    call    $6492
68ae 327c44    ld      ($447c),a
68b1 78        ld      a,b
68b2 327b44    ld      ($447b),a
68b5 2a8e44    ld      hl,($448e)
68b8 cdd967    call    $67d9
68bb 225944    ld      ($4459),hl
68be eb        ex      de,hl
68bf 225f44    ld      ($445f),hl
68c2 e5        push    hl
68c3 2a5b44    ld      hl,($445b)
68c6 cd9264    call    $6492
68c9 327844    ld      ($4478),a
68cc 78        ld      a,b
68cd 327744    ld      ($4477),a
68d0 2a5b44    ld      hl,($445b)
68d3 d1        pop     de
68d4 cd9264    call    $6492
68d7 328444    ld      ($4484),a
68da 78        ld      a,b
68db 328344    ld      ($4483),a
68de 2a5f44    ld      hl,($445f)
68e1 eb        ex      de,hl
68e2 2a5744    ld      hl,($4457)
68e5 cd9264    call    $6492
68e8 68        ld      l,b
68e9 67        ld      h,a
68ea 226d44    ld      ($446d),hl
68ed 2a5f44    ld      hl,($445f)
68f0 eb        ex      de,hl
68f1 2a6544    ld      hl,($4465)
68f4 cd9264    call    $6492
68f7 68        ld      l,b
68f8 67        ld      h,a
68f9 226144    ld      ($4461),hl
68fc eb        ex      de,hl
68fd 2a5d44    ld      hl,($445d)
6900 cd9264    call    $6492
6903 68        ld      l,b
6904 67        ld      h,a
6905 e5        push    hl
6906 2a5944    ld      hl,($4459)
6909 eb        ex      de,hl
690a 2a5744    ld      hl,($4457)
690d cd9264    call    $6492
6910 68        ld      l,b
6911 67        ld      h,a
6912 e5        push    hl
6913 eb        ex      de,hl
6914 2a5d44    ld      hl,($445d)
6917 cd9264    call    $6492
691a 2a6144    ld      hl,($4461)
691d 57        ld      d,a
691e 58        ld      e,b
691f 19        add     hl,de
6920 227344    ld      ($4473),hl
6923 d1        pop     de
6924 e1        pop     hl
6925 19        add     hl,de
6926 228144    ld      ($4481),hl
6929 2a5944    ld      hl,($4459)
692c eb        ex      de,hl
692d 2a6544    ld      hl,($4465)
6930 cd9264    call    $6492
6933 57        ld      d,a
6934 58        ld      e,b
6935 d5        push    de
6936 2a5d44    ld      hl,($445d)
6939 cd9264    call    $6492
693c 57        ld      d,a
693d 78        ld      a,b
693e 2a6d44    ld      hl,($446d)
6941 95        sub     l
6942 327544    ld      ($4475),a
6945 7a        ld      a,d
6946 9c        sbc     a,h
6947 327644    ld      ($4476),a
694a 2a5d44    ld      hl,($445d)
694d eb        ex      de,hl
694e 2a6d44    ld      hl,($446d)
6951 cd9264    call    $6492
6954 57        ld      d,a
6955 78        ld      a,b
6956 e1        pop     hl
6957 95        sub     l
6958 327f44    ld      ($447f),a
695b 7a        ld      a,d
695c 9c        sbc     a,h
695d 328044    ld      ($4480),a
6960 2ab244    ld      hl,($44b2)
6963 eb        ex      de,hl
6964 2a7344    ld      hl,($4473)
6967 cd9264    call    $6492
696a 67        ld      h,a
696b 68        ld      l,b
696c 227344    ld      ($4473),hl
696f 2ab244    ld      hl,($44b2)
6972 eb        ex      de,hl
6973 2a7944    ld      hl,($4479)
6976 cd9264    call    $6492
6979 67        ld      h,a
697a 68        ld      l,b
697b 227944    ld      ($4479),hl
697e 2ab244    ld      hl,($44b2)
6981 eb        ex      de,hl
6982 2a7f44    ld      hl,($447f)
6985 cd9264    call    $6492
6988 67        ld      h,a
6989 68        ld      l,b
698a 227f44    ld      ($447f),hl
698d 2ab444    ld      hl,($44b4)
6990 eb        ex      de,hl
6991 2a7544    ld      hl,($4475)
6994 cd9264    call    $6492
6997 67        ld      h,a
6998 68        ld      l,b
6999 227544    ld      ($4475),hl
699c 2ab444    ld      hl,($44b4)
699f eb        ex      de,hl
69a0 2a7b44    ld      hl,($447b)
69a3 cd9264    call    $6492
69a6 67        ld      h,a
69a7 68        ld      l,b
69a8 227b44    ld      ($447b),hl
69ab 2ab444    ld      hl,($44b4)
69ae eb        ex      de,hl
69af 2a8144    ld      hl,($4481)
69b2 cd9264    call    $6492
69b5 67        ld      h,a
69b6 68        ld      l,b
69b7 228144    ld      ($4481),hl
69ba 2ab644    ld      hl,($44b6)
69bd eb        ex      de,hl
69be 2a7744    ld      hl,($4477)
69c1 cd9264    call    $6492
69c4 67        ld      h,a
69c5 68        ld      l,b
69c6 227744    ld      ($4477),hl
69c9 2ab644    ld      hl,($44b6)
69cc eb        ex      de,hl
69cd 2a7d44    ld      hl,($447d)
69d0 cd9264    call    $6492
69d3 67        ld      h,a
69d4 68        ld      l,b
69d5 227d44    ld      ($447d),hl
69d8 2ab644    ld      hl,($44b6)
69db eb        ex      de,hl
69dc 2a8344    ld      hl,($4483)
69df cd9264    call    $6492
69e2 67        ld      h,a
69e3 68        ld      l,b
69e4 228344    ld      ($4483),hl
69e7 c9        ret     

69e8 2a9244    ld      hl,($4492)
69eb eb        ex      de,hl
69ec 13        inc     de
69ed 2a8744    ld      hl,($4487)
69f0 1a        ld      a,(de)
69f1 95        sub     l
69f2 329a44    ld      ($449a),a
69f5 13        inc     de
69f6 1a        ld      a,(de)
69f7 9c        sbc     a,h
69f8 329b44    ld      ($449b),a
69fb 13        inc     de
69fc 2a8944    ld      hl,($4489)
69ff 1a        ld      a,(de)
6a00 95        sub     l
6a01 329c44    ld      ($449c),a
6a04 13        inc     de
6a05 1a        ld      a,(de)
6a06 9c        sbc     a,h
6a07 329d44    ld      ($449d),a
6a0a 13        inc     de
6a0b 2a8b44    ld      hl,($448b)
6a0e 1a        ld      a,(de)
6a0f 95        sub     l
6a10 329e44    ld      ($449e),a
6a13 13        inc     de
6a14 1a        ld      a,(de)
6a15 9c        sbc     a,h
6a16 329f44    ld      ($449f),a
6a19 13        inc     de
6a1a 3ad344    ld      a,($44d3)	[44d3]=1->map view, =0->forward view
6a1d b7        or      a
6a1e ca276a    jp      z,$6a27
6a21 2190e8    ld      hl,$e890
6a24 229c44    ld      ($449c),hl
6a27 eb        ex      de,hl
6a28 229244    ld      ($4492),hl
6a2b af        xor     a
6a2c 4f        ld      c,a
6a2d 2a9a44    ld      hl,($449a)
6a30 eb        ex      de,hl
6a31 2a7344    ld      hl,($4473)
6a34 cd9264    call    $6492
6a37 67        ld      h,a
6a38 68        ld      l,b
6a39 e5        push    hl
6a3a 2a9c44    ld      hl,($449c)
6a3d eb        ex      de,hl
6a3e 2a7944    ld      hl,($4479)
6a41 cd9264    call    $6492
6a44 67        ld      h,a
6a45 68        ld      l,b
6a46 d1        pop     de
6a47 19        add     hl,de
6a48 e5        push    hl
6a49 2a9e44    ld      hl,($449e)
6a4c eb        ex      de,hl
6a4d 2a7f44    ld      hl,($447f)
6a50 cd9264    call    $6492
6a53 67        ld      h,a
6a54 68        ld      l,b
6a55 d1        pop     de
6a56 19        add     hl,de
6a57 225744    ld      ($4457),hl
6a5a 2a9a44    ld      hl,($449a)
6a5d eb        ex      de,hl
6a5e 2a7544    ld      hl,($4475)
6a61 cd9264    call    $6492
6a64 67        ld      h,a
6a65 68        ld      l,b
6a66 e5        push    hl
6a67 2a9c44    ld      hl,($449c)
6a6a eb        ex      de,hl
6a6b 2a7b44    ld      hl,($447b)
6a6e cd9264    call    $6492
6a71 67        ld      h,a
6a72 68        ld      l,b
6a73 d1        pop     de
6a74 19        add     hl,de
6a75 e5        push    hl
6a76 2a9e44    ld      hl,($449e)
6a79 eb        ex      de,hl
6a7a 2a8144    ld      hl,($4481)
6a7d cd9264    call    $6492
6a80 67        ld      h,a
6a81 68        ld      l,b
6a82 d1        pop     de
6a83 19        add     hl,de
6a84 225944    ld      ($4459),hl
6a87 2a9a44    ld      hl,($449a)
6a8a eb        ex      de,hl
6a8b 2a7744    ld      hl,($4477)
6a8e cd9264    call    $6492
6a91 67        ld      h,a
6a92 68        ld      l,b
6a93 e5        push    hl
6a94 2a9c44    ld      hl,($449c)
6a97 eb        ex      de,hl
6a98 2a7d44    ld      hl,($447d)
6a9b cd9264    call    $6492
6a9e 67        ld      h,a
6a9f 68        ld      l,b
6aa0 d1        pop     de
6aa1 19        add     hl,de
6aa2 e5        push    hl
6aa3 2a9e44    ld      hl,($449e)
6aa6 eb        ex      de,hl
6aa7 2a8344    ld      hl,($4483)
6aaa cd9264    call    $6492
6aad 67        ld      h,a
6aae 68        ld      l,b
6aaf d1        pop     de
6ab0 19        add     hl,de
6ab1 225b44    ld      ($445b),hl
6ab4 c30771    jp      $7107
6ab7 2a9244    ld      hl,($4492)
6aba eb        ex      de,hl
6abb 13        inc     de
6abc 2a8744    ld      hl,($4487)
6abf 1a        ld      a,(de)
6ac0 95        sub     l
6ac1 329a44    ld      ($449a),a
6ac4 13        inc     de
6ac5 1a        ld      a,(de)
6ac6 9c        sbc     a,h
6ac7 329b44    ld      ($449b),a
6aca 13        inc     de
6acb 2a8944    ld      hl,($4489)
6ace 1a        ld      a,(de)
6acf 95        sub     l
6ad0 329c44    ld      ($449c),a
6ad3 13        inc     de
6ad4 1a        ld      a,(de)
6ad5 9c        sbc     a,h
6ad6 329d44    ld      ($449d),a
6ad9 13        inc     de
6ada 2a8b44    ld      hl,($448b)
6add 1a        ld      a,(de)
6ade 95        sub     l
6adf 329e44    ld      ($449e),a
6ae2 13        inc     de
6ae3 1a        ld      a,(de)
6ae4 9c        sbc     a,h
6ae5 329f44    ld      ($449f),a
6ae8 13        inc     de
6ae9 3ad344    ld      a,($44d3)	[44d3]=1->map view, =0->forward view
6aec b7        or      a
6aed caf66a    jp      z,$6af6
6af0 2190e8    ld      hl,$e890
6af3 229c44    ld      ($449c),hl
6af6 eb        ex      de,hl
6af7 229244    ld      ($4492),hl
6afa af        xor     a
6afb 4f        ld      c,a
6afc 2a9a44    ld      hl,($449a)
6aff eb        ex      de,hl
6b00 2a7344    ld      hl,($4473)
6b03 cd9264    call    $6492
6b06 67        ld      h,a
6b07 68        ld      l,b
6b08 e5        push    hl
6b09 2a9c44    ld      hl,($449c)
6b0c eb        ex      de,hl
6b0d 2a7944    ld      hl,($4479)
6b10 cd9264    call    $6492
6b13 67        ld      h,a
6b14 68        ld      l,b
6b15 d1        pop     de
6b16 19        add     hl,de
6b17 e5        push    hl
6b18 2a9e44    ld      hl,($449e)
6b1b eb        ex      de,hl
6b1c 2a7f44    ld      hl,($447f)
6b1f cd9264    call    $6492
6b22 67        ld      h,a
6b23 68        ld      l,b
6b24 d1        pop     de
6b25 19        add     hl,de
6b26 225f44    ld      ($445f),hl
6b29 226744    ld      ($4467),hl
6b2c 2a9a44    ld      hl,($449a)
6b2f eb        ex      de,hl
6b30 2a7544    ld      hl,($4475)
6b33 cd9264    call    $6492
6b36 67        ld      h,a
6b37 68        ld      l,b
6b38 e5        push    hl
6b39 2a9c44    ld      hl,($449c)
6b3c eb        ex      de,hl
6b3d 2a7b44    ld      hl,($447b)
6b40 cd9264    call    $6492
6b43 67        ld      h,a
6b44 68        ld      l,b
6b45 d1        pop     de
6b46 19        add     hl,de
6b47 e5        push    hl
6b48 2a9e44    ld      hl,($449e)
6b4b eb        ex      de,hl
6b4c 2a8144    ld      hl,($4481)
6b4f cd9264    call    $6492
6b52 67        ld      h,a
6b53 68        ld      l,b
6b54 d1        pop     de
6b55 19        add     hl,de
6b56 226144    ld      ($4461),hl
6b59 226944    ld      ($4469),hl
6b5c 2a9a44    ld      hl,($449a)
6b5f eb        ex      de,hl
6b60 2a7744    ld      hl,($4477)
6b63 cd9264    call    $6492
6b66 67        ld      h,a
6b67 68        ld      l,b
6b68 e5        push    hl
6b69 2a9c44    ld      hl,($449c)
6b6c eb        ex      de,hl
6b6d 2a7d44    ld      hl,($447d)
6b70 cd9264    call    $6492
6b73 67        ld      h,a
6b74 68        ld      l,b
6b75 d1        pop     de
6b76 19        add     hl,de
6b77 e5        push    hl
6b78 2a9e44    ld      hl,($449e)
6b7b eb        ex      de,hl
6b7c 2a8344    ld      hl,($4483)
6b7f cd9264    call    $6492
6b82 67        ld      h,a
6b83 68        ld      l,b
6b84 d1        pop     de
6b85 19        add     hl,de
6b86 226344    ld      ($4463),hl
6b89 226b44    ld      ($446b),hl
6b8c c31a71    jp      $711a
6b8f c9        ret     

6b90 cd4b72    call    $724b
6b93 3a5d44    ld      a,($445d)
6b96 87        add     a,a
6b97 fadd6c    jp      m,$6cdd
6b9a 87        add     a,a
6b9b fa766c    jp      m,$6c76
6b9e 87        add     a,a
6b9f fa096c    jp      m,$6c09
6ba2 216344    ld      hl,$4463
6ba5 3a5944    ld      a,($4459)
6ba8 86        add     a,(hl)
6ba9 2f        cpl     
6baa 5f        ld      e,a
6bab 23        inc     hl
6bac 3a5a44    ld      a,($445a)
6baf 8e        adc     a,(hl)
6bb0 2f        cpl     
6bb1 57        ld      d,a
6bb2 13        inc     de
6bb3 2a5b44    ld      hl,($445b)
6bb6 19        add     hl,de
6bb7 eb        ex      de,hl
6bb8 2a6144    ld      hl,($4461)
6bbb 19        add     hl,de
6bbc eb        ex      de,hl
6bbd 215944    ld      hl,$4459
6bc0 3a5b44    ld      a,($445b)
6bc3 96        sub     (hl)
6bc4 23        inc     hl
6bc5 47        ld      b,a
6bc6 3a5c44    ld      a,($445c)
6bc9 9e        sbc     a,(hl)
6bca cd5967    call    $6759
6bcd 57        ld      d,a
6bce 58        ld      e,b
6bcf d5        push    de
6bd0 2a5744    ld      hl,($4457)
6bd3 3a5f44    ld      a,($445f)
6bd6 95        sub     l
6bd7 6f        ld      l,a
6bd8 3a6044    ld      a,($4460)
6bdb 9c        sbc     a,h
6bdc 67        ld      h,a
6bdd cd9264    call    $6492
6be0 57        ld      d,a
6be1 58        ld      e,b
6be2 2a5744    ld      hl,($4457)
6be5 19        add     hl,de
6be6 225744    ld      ($4457),hl
6be9 2a5b44    ld      hl,($445b)
6bec 3a6344    ld      a,($4463)
6bef 95        sub     l
6bf0 6f        ld      l,a
6bf1 3a6444    ld      a,($4464)
6bf4 9c        sbc     a,h
6bf5 67        ld      h,a
6bf6 d1        pop     de
6bf7 cd9264    call    $6492
6bfa 57        ld      d,a
6bfb 58        ld      e,b
6bfc 2a5b44    ld      hl,($445b)
6bff 19        add     hl,de
6c00 225b44    ld      ($445b),hl
6c03 225944    ld      ($4459),hl
6c06 c30771    jp      $7107
6c09 216344    ld      hl,$4463
6c0c 3a6144    ld      a,($4461)
6c0f 86        add     a,(hl)
6c10 2f        cpl     
6c11 5f        ld      e,a
6c12 23        inc     hl
6c13 3a6244    ld      a,($4462)
6c16 8e        adc     a,(hl)
6c17 2f        cpl     
6c18 57        ld      d,a
6c19 13        inc     de
6c1a 2a5b44    ld      hl,($445b)
6c1d 19        add     hl,de
6c1e eb        ex      de,hl
6c1f 2a5944    ld      hl,($4459)
6c22 19        add     hl,de
6c23 eb        ex      de,hl
6c24 215944    ld      hl,$4459
6c27 3a5b44    ld      a,($445b)
6c2a 86        add     a,(hl)
6c2b 23        inc     hl
6c2c 47        ld      b,a
6c2d 3a5c44    ld      a,($445c)
6c30 8e        adc     a,(hl)
6c31 cd5967    call    $6759
6c34 57        ld      d,a
6c35 58        ld      e,b
6c36 d5        push    de
6c37 2a5744    ld      hl,($4457)
6c3a 3a5f44    ld      a,($445f)
6c3d 95        sub     l
6c3e 6f        ld      l,a
6c3f 3a6044    ld      a,($4460)
6c42 9c        sbc     a,h
6c43 67        ld      h,a
6c44 cd9264    call    $6492
6c47 57        ld      d,a
6c48 58        ld      e,b
6c49 2a5744    ld      hl,($4457)
6c4c 19        add     hl,de
6c4d 225744    ld      ($4457),hl
6c50 2a5b44    ld      hl,($445b)
6c53 3a6344    ld      a,($4463)
6c56 95        sub     l
6c57 6f        ld      l,a
6c58 3a6444    ld      a,($4464)
6c5b 9c        sbc     a,h
6c5c 67        ld      h,a
6c5d d1        pop     de
6c5e cd9264    call    $6492
6c61 57        ld      d,a
6c62 58        ld      e,b
6c63 2a5b44    ld      hl,($445b)
6c66 19        add     hl,de
6c67 225b44    ld      ($445b),hl
6c6a af        xor     a
6c6b 95        sub     l
6c6c 6f        ld      l,a
6c6d 9f        sbc     a,a
6c6e 94        sub     h
6c6f 67        ld      h,a
6c70 225944    ld      ($4459),hl
6c73 c30771    jp      $7107
6c76 216344    ld      hl,$4463
6c79 3a5744    ld      a,($4457)
6c7c 86        add     a,(hl)
6c7d 2f        cpl     
6c7e 5f        ld      e,a
6c7f 23        inc     hl
6c80 3a5844    ld      a,($4458)
6c83 8e        adc     a,(hl)
6c84 2f        cpl     
6c85 57        ld      d,a
6c86 13        inc     de
6c87 2a5b44    ld      hl,($445b)
6c8a 19        add     hl,de
6c8b eb        ex      de,hl
6c8c 2a5f44    ld      hl,($445f)
6c8f 19        add     hl,de
6c90 eb        ex      de,hl
6c91 215744    ld      hl,$4457
6c94 3a5b44    ld      a,($445b)
6c97 96        sub     (hl)
6c98 23        inc     hl
6c99 47        ld      b,a
6c9a 3a5c44    ld      a,($445c)
6c9d 9e        sbc     a,(hl)
6c9e cd5967    call    $6759
6ca1 57        ld      d,a
6ca2 58        ld      e,b
6ca3 d5        push    de
6ca4 2a5944    ld      hl,($4459)
6ca7 3a6144    ld      a,($4461)
6caa 95        sub     l
6cab 6f        ld      l,a
6cac 3a6244    ld      a,($4462)
6caf 9c        sbc     a,h
6cb0 67        ld      h,a
6cb1 cd9264    call    $6492
6cb4 57        ld      d,a
6cb5 58        ld      e,b
6cb6 2a5944    ld      hl,($4459)
6cb9 19        add     hl,de
6cba 225944    ld      ($4459),hl
6cbd 2a5b44    ld      hl,($445b)
6cc0 3a6344    ld      a,($4463)
6cc3 95        sub     l
6cc4 6f        ld      l,a
6cc5 3a6444    ld      a,($4464)
6cc8 9c        sbc     a,h
6cc9 67        ld      h,a
6cca d1        pop     de
6ccb cd9264    call    $6492
6cce 57        ld      d,a
6ccf 58        ld      e,b
6cd0 2a5b44    ld      hl,($445b)
6cd3 19        add     hl,de
6cd4 225b44    ld      ($445b),hl
6cd7 225744    ld      ($4457),hl
6cda c30771    jp      $7107
6cdd 216344    ld      hl,$4463
6ce0 3a5f44    ld      a,($445f)
6ce3 86        add     a,(hl)
6ce4 2f        cpl     
6ce5 5f        ld      e,a
6ce6 23        inc     hl
6ce7 3a6044    ld      a,($4460)
6cea 8e        adc     a,(hl)
6ceb 2f        cpl     
6cec 57        ld      d,a
6ced 13        inc     de
6cee 2a5b44    ld      hl,($445b)
6cf1 19        add     hl,de
6cf2 eb        ex      de,hl
6cf3 2a5744    ld      hl,($4457)
6cf6 19        add     hl,de
6cf7 eb        ex      de,hl
6cf8 215744    ld      hl,$4457
6cfb 3a5b44    ld      a,($445b)
6cfe 86        add     a,(hl)
6cff 23        inc     hl
6d00 47        ld      b,a
6d01 3a5c44    ld      a,($445c)
6d04 8e        adc     a,(hl)
6d05 cd5967    call    $6759
6d08 57        ld      d,a
6d09 58        ld      e,b
6d0a d5        push    de
6d0b 2a5944    ld      hl,($4459)
6d0e 3a6144    ld      a,($4461)
6d11 95        sub     l
6d12 6f        ld      l,a
6d13 3a6244    ld      a,($4462)
6d16 9c        sbc     a,h
6d17 67        ld      h,a
6d18 cd9264    call    $6492
6d1b 57        ld      d,a
6d1c 58        ld      e,b
6d1d 2a5944    ld      hl,($4459)
6d20 19        add     hl,de
6d21 225944    ld      ($4459),hl
6d24 2a5b44    ld      hl,($445b)
6d27 3a6344    ld      a,($4463)
6d2a 95        sub     l
6d2b 6f        ld      l,a
6d2c 3a6444    ld      a,($4464)
6d2f 9c        sbc     a,h
6d30 67        ld      h,a
6d31 d1        pop     de
6d32 cd9264    call    $6492
6d35 57        ld      d,a
6d36 58        ld      e,b
6d37 2a5b44    ld      hl,($445b)
6d3a 19        add     hl,de
6d3b 225b44    ld      ($445b),hl
6d3e af        xor     a
6d3f 95        sub     l
6d40 6f        ld      l,a
6d41 9f        sbc     a,a
6d42 94        sub     h
6d43 67        ld      h,a
6d44 225744    ld      ($4457),hl
6d47 c30771    jp      $7107
6d4a cd4b72    call    $724b
6d4d 3a6544    ld      a,($4465)
6d50 87        add     a,a
6d51 fa976e    jp      m,$6e97
6d54 87        add     a,a
6d55 fa306e    jp      m,$6e30
6d58 87        add     a,a
6d59 fac36d    jp      m,$6dc3
6d5c 215b44    ld      hl,$445b
6d5f 3a6144    ld      a,($4461)
6d62 86        add     a,(hl)
6d63 2f        cpl     
6d64 5f        ld      e,a
6d65 23        inc     hl
6d66 3a6244    ld      a,($4462)
6d69 8e        adc     a,(hl)
6d6a 2f        cpl     
6d6b 57        ld      d,a
6d6c 13        inc     de
6d6d 2a6344    ld      hl,($4463)
6d70 19        add     hl,de
6d71 eb        ex      de,hl
6d72 2a5944    ld      hl,($4459)
6d75 19        add     hl,de
6d76 eb        ex      de,hl
6d77 216144    ld      hl,$4461
6d7a 3a6344    ld      a,($4463)
6d7d 96        sub     (hl)
6d7e 23        inc     hl
6d7f 47        ld      b,a
6d80 3a6444    ld      a,($4464)
6d83 9e        sbc     a,(hl)
6d84 cd5967    call    $6759
6d87 57        ld      d,a
6d88 58        ld      e,b
6d89 d5        push    de
6d8a 2a5f44    ld      hl,($445f)
6d8d 3a5744    ld      a,($4457)
6d90 95        sub     l
6d91 6f        ld      l,a
6d92 3a5844    ld      a,($4458)
6d95 9c        sbc     a,h
6d96 67        ld      h,a
6d97 cd9264    call    $6492
6d9a 57        ld      d,a
6d9b 58        ld      e,b
6d9c 2a5f44    ld      hl,($445f)
6d9f 19        add     hl,de
6da0 225f44    ld      ($445f),hl
6da3 2a6344    ld      hl,($4463)
6da6 3a5b44    ld      a,($445b)
6da9 95        sub     l
6daa 6f        ld      l,a
6dab 3a5c44    ld      a,($445c)
6dae 9c        sbc     a,h
6daf 67        ld      h,a
6db0 d1        pop     de
6db1 cd9264    call    $6492
6db4 57        ld      d,a
6db5 58        ld      e,b
6db6 2a6344    ld      hl,($4463)
6db9 19        add     hl,de
6dba 226344    ld      ($4463),hl
6dbd 226144    ld      ($4461),hl
6dc0 c31a71    jp      $711a
6dc3 215b44    ld      hl,$445b
6dc6 3a5944    ld      a,($4459)
6dc9 86        add     a,(hl)
6dca 2f        cpl     
6dcb 5f        ld      e,a
6dcc 23        inc     hl
6dcd 3a5a44    ld      a,($445a)
6dd0 8e        adc     a,(hl)
6dd1 2f        cpl     
6dd2 57        ld      d,a
6dd3 13        inc     de
6dd4 2a6344    ld      hl,($4463)
6dd7 19        add     hl,de
6dd8 eb        ex      de,hl
6dd9 2a6144    ld      hl,($4461)
6ddc 19        add     hl,de
6ddd eb        ex      de,hl
6dde 216144    ld      hl,$4461
6de1 3a6344    ld      a,($4463)
6de4 86        add     a,(hl)
6de5 23        inc     hl
6de6 47        ld      b,a
6de7 3a6444    ld      a,($4464)
6dea 8e        adc     a,(hl)
6deb cd5967    call    $6759
6dee 57        ld      d,a
6def 58        ld      e,b
6df0 d5        push    de
6df1 2a5f44    ld      hl,($445f)
6df4 3a5744    ld      a,($4457)
6df7 95        sub     l
6df8 6f        ld      l,a
6df9 3a5844    ld      a,($4458)
6dfc 9c        sbc     a,h
6dfd 67        ld      h,a
6dfe cd9264    call    $6492
6e01 57        ld      d,a
6e02 58        ld      e,b
6e03 2a5f44    ld      hl,($445f)
6e06 19        add     hl,de
6e07 225f44    ld      ($445f),hl
6e0a 2a6344    ld      hl,($4463)
6e0d 3a5b44    ld      a,($445b)
6e10 95        sub     l
6e11 6f        ld      l,a
6e12 3a5c44    ld      a,($445c)
6e15 9c        sbc     a,h
6e16 67        ld      h,a
6e17 d1        pop     de
6e18 cd9264    call    $6492
6e1b 57        ld      d,a
6e1c 58        ld      e,b
6e1d 2a6344    ld      hl,($4463)
6e20 19        add     hl,de
6e21 226344    ld      ($4463),hl
6e24 af        xor     a
6e25 95        sub     l
6e26 6f        ld      l,a
6e27 9f        sbc     a,a
6e28 94        sub     h
6e29 67        ld      h,a
6e2a 226144    ld      ($4461),hl
6e2d c31a71    jp      $711a
6e30 215b44    ld      hl,$445b
6e33 3a5f44    ld      a,($445f)
6e36 86        add     a,(hl)
6e37 2f        cpl     
6e38 5f        ld      e,a
6e39 23        inc     hl
6e3a 3a6044    ld      a,($4460)
6e3d 8e        adc     a,(hl)
6e3e 2f        cpl     
6e3f 57        ld      d,a
6e40 13        inc     de
6e41 2a6344    ld      hl,($4463)
6e44 19        add     hl,de
6e45 eb        ex      de,hl
6e46 2a5744    ld      hl,($4457)
6e49 19        add     hl,de
6e4a eb        ex      de,hl
6e4b 215f44    ld      hl,$445f
6e4e 3a6344    ld      a,($4463)
6e51 96        sub     (hl)
6e52 23        inc     hl
6e53 47        ld      b,a
6e54 3a6444    ld      a,($4464)
6e57 9e        sbc     a,(hl)
6e58 cd5967    call    $6759
6e5b 57        ld      d,a
6e5c 58        ld      e,b
6e5d d5        push    de
6e5e 2a6144    ld      hl,($4461)
6e61 3a5944    ld      a,($4459)
6e64 95        sub     l
6e65 6f        ld      l,a
6e66 3a5a44    ld      a,($445a)
6e69 9c        sbc     a,h
6e6a 67        ld      h,a
6e6b cd9264    call    $6492
6e6e 57        ld      d,a
6e6f 58        ld      e,b
6e70 2a6144    ld      hl,($4461)
6e73 19        add     hl,de
6e74 226144    ld      ($4461),hl
6e77 2a6344    ld      hl,($4463)
6e7a 3a5b44    ld      a,($445b)
6e7d 95        sub     l
6e7e 6f        ld      l,a
6e7f 3a5c44    ld      a,($445c)
6e82 9c        sbc     a,h
6e83 67        ld      h,a
6e84 d1        pop     de
6e85 cd9264    call    $6492
6e88 57        ld      d,a
6e89 58        ld      e,b
6e8a 2a6344    ld      hl,($4463)
6e8d 19        add     hl,de
6e8e 226344    ld      ($4463),hl
6e91 225f44    ld      ($445f),hl
6e94 c31a71    jp      $711a
6e97 215b44    ld      hl,$445b
6e9a 3a5744    ld      a,($4457)
6e9d 86        add     a,(hl)
6e9e 2f        cpl     
6e9f 5f        ld      e,a
6ea0 23        inc     hl
6ea1 3a5844    ld      a,($4458)
6ea4 8e        adc     a,(hl)
6ea5 2f        cpl     
6ea6 57        ld      d,a
6ea7 13        inc     de
6ea8 2a6344    ld      hl,($4463)
6eab 19        add     hl,de
6eac eb        ex      de,hl
6ead 2a5f44    ld      hl,($445f)
6eb0 19        add     hl,de
6eb1 eb        ex      de,hl
6eb2 215f44    ld      hl,$445f
6eb5 3a6344    ld      a,($4463)
6eb8 86        add     a,(hl)
6eb9 23        inc     hl
6eba 47        ld      b,a
6ebb 3a6444    ld      a,($4464)
6ebe 8e        adc     a,(hl)
6ebf cd5967    call    $6759
6ec2 57        ld      d,a
6ec3 58        ld      e,b
6ec4 d5        push    de
6ec5 2a6144    ld      hl,($4461)
6ec8 3a5944    ld      a,($4459)
6ecb 95        sub     l
6ecc 6f        ld      l,a
6ecd 3a5a44    ld      a,($445a)
6ed0 9c        sbc     a,h
6ed1 67        ld      h,a
6ed2 cd9264    call    $6492
6ed5 57        ld      d,a
6ed6 58        ld      e,b
6ed7 2a6144    ld      hl,($4461)
6eda 19        add     hl,de
6edb 226144    ld      ($4461),hl
6ede 2a6344    ld      hl,($4463)
6ee1 3a5b44    ld      a,($445b)
6ee4 95        sub     l
6ee5 6f        ld      l,a
6ee6 3a5c44    ld      a,($445c)
6ee9 9c        sbc     a,h
6eea 67        ld      h,a
6eeb d1        pop     de
6eec cd9264    call    $6492
6eef 57        ld      d,a
6ef0 58        ld      e,b
6ef1 2a6344    ld      hl,($4463)
6ef4 19        add     hl,de
6ef5 226344    ld      ($4463),hl
6ef8 af        xor     a
6ef9 95        sub     l
6efa 6f        ld      l,a
6efb 9f        sbc     a,a
6efc 94        sub     h
6efd 67        ld      h,a
6efe 225f44    ld      ($445f),hl
6f01 c31a71    jp      $711a

6f04 2a9244    ld      hl,($4492)
6f07 7e        ld      a,(hl)
6f08 b7        or      a
6f09 cab970    jp      z,$70b9
6f0c 3d        dec     a
6f0d ca216f    jp      z,$6f21
6f10 3d        dec     a
6f11 ca676f    jp      z,$6f67
6f14 3d        dec     a
6f15 caa66f    jp      z,$6fa6
6f18 2a9444    ld      hl,($4494)
6f1b 36fe      ld      (hl),$fe
6f1d 229444    ld      ($4494),hl
6f20 c9        ret     
6f21 cde869    call    $69e8
6f24 cdb76a    call    $6ab7
6f27 326d44    ld      ($446d),a
6f2a 215d44    ld      hl,$445d
6f2d a6        and     (hl)
6f2e c2046f    jp      nz,$6f04
6f31 b6        or      (hl)
6f32 c24a6f    jp      nz,$6f4a
6f35 1605      ld      d,$05
6f37 3a6544    ld      a,($4465)
6f3a b7        or      a
6f3b ca2f70    jp      z,$702f
6f3e d5        push    de
6f3f cd4a6d    call    $6d4a
6f42 d1        pop     de
6f43 15        dec     d
6f44 ca046f    jp      z,$6f04
6f47 c3376f    jp      $6f37
6f4a 1605      ld      d,$05
6f4c d5        push    de
6f4d cd906b    call    $6b90
6f50 d1        pop     de
6f51 15        dec     d
6f52 ca046f    jp      z,$6f04
6f55 3a5d44    ld      a,($445d)
6f58 47        ld      b,a
6f59 b7        or      a
6f5a ca356f    jp      z,$6f35
6f5d 3a6544    ld      a,($4465)
6f60 a0        and     b
6f61 c2046f    jp      nz,$6f04
6f64 c34c6f    jp      $6f4c
6f67 3a6d44    ld      a,($446d)
6f6a 325d44    ld      ($445d),a
6f6d 2a6744    ld      hl,($4467)
6f70 225744    ld      ($4457),hl
6f73 2a6944    ld      hl,($4469)
6f76 225944    ld      ($4459),hl
6f79 2a6b44    ld      hl,($446b)
6f7c 225b44    ld      ($445b),hl
6f7f cdb76a    call    $6ab7
6f82 326d44    ld      ($446d),a
6f85 215d44    ld      hl,$445d
6f88 a6        and     (hl)
6f89 c2046f    jp      nz,$6f04
6f8c af        xor     a
6f8d b6        or      (hl)
6f8e c24a6f    jp      nz,$6f4a
6f91 1605      ld      d,$05
6f93 3a6544    ld      a,($4465)
6f96 b7        or      a
6f97 ca6770    jp      z,$7067
6f9a d5        push    de
6f9b cd4a6d    call    $6d4a
6f9e d1        pop     de
6f9f 15        dec     d
6fa0 ca046f    jp      z,$6f04
6fa3 c3936f    jp      $6f93
6fa6 3a6d44    ld      a,($446d)
6fa9 326544    ld      ($4465),a
6fac 2a6744    ld      hl,($4467)
6faf 225f44    ld      ($445f),hl
6fb2 2a6944    ld      hl,($4469)
6fb5 226144    ld      ($4461),hl
6fb8 2a6b44    ld      hl,($446b)
6fbb 226344    ld      ($4463),hl
6fbe cde869    call    $69e8
6fc1 216544    ld      hl,$4465
6fc4 a6        and     (hl)
6fc5 c2046f    jp      nz,$6f04
6fc8 b6        or      (hl)
6fc9 215d44    ld      hl,$445d
6fcc 3e00      ld      a,$00
6fce c2316f    jp      nz,$6f31
6fd1 b6        or      (hl)
6fd2 cae76f    jp      z,$6fe7
6fd5 1605      ld      d,$05
6fd7 d5        push    de
6fd8 cd906b    call    $6b90
6fdb d1        pop     de
6fdc 15        dec     d
6fdd ca046f    jp      z,$6f04
6fe0 3a5d44    ld      a,($445d)
6fe3 b7        or      a
6fe4 c2d56f    jp      nz,$6fd5
6fe7 2a5744    ld      hl,($4457)
6fea eb        ex      de,hl
6feb 2aaa44    ld      hl,($44aa)
6fee cd9264    call    $6492
6ff1 eb        ex      de,hl
6ff2 2a5b44    ld      hl,($445b)
6ff5 eb        ex      de,hl
6ff6 cdcd65    call    $65cd
6ff9 2a9444    ld      hl,($4494)
6ffc c5        push    bc
6ffd 2a5944    ld      hl,($4459)
7000 eb        ex      de,hl
7001 2aac44    ld      hl,($44ac)
7004 cd9264    call    $6492
7007 eb        ex      de,hl
7008 2a5b44    ld      hl,($445b)
700b eb        ex      de,hl
700c cdcd65    call    $65cd
700f 2a9444    ld      hl,($4494)
7012 d1        pop     de
7013 3aae44    ld      a,($44ae)
7016 82        add     a,d
7017 77        ld      (hl),a
7018 23        inc     hl
7019 3aaf44    ld      a,($44af)
701c 90        sub     b
701d 77        ld      (hl),a
701e 23        inc     hl
701f 3ab844    ld      a,($44b8)
7022 77        ld      (hl),a
7023 23        inc     hl
7024 3ab944    ld      a,($44b9)
7027 77        ld      (hl),a
7028 23        inc     hl
7029 229444    ld      ($4494),hl
702c c3046f    jp      $6f04
702f 2a5744    ld      hl,($4457)
7032 eb        ex      de,hl
7033 2aaa44    ld      hl,($44aa)
7036 cd9264    call    $6492
7039 eb        ex      de,hl
703a 2a5b44    ld      hl,($445b)
703d eb        ex      de,hl
703e cdcd65    call    $65cd
7041 2a9444    ld      hl,($4494)
7044 3aae44    ld      a,($44ae)
7047 80        add     a,b
7048 77        ld      (hl),a
7049 2a5944    ld      hl,($4459)
704c eb        ex      de,hl
704d 2aac44    ld      hl,($44ac)
7050 cd9264    call    $6492
7053 eb        ex      de,hl
7054 2a5b44    ld      hl,($445b)
7057 eb        ex      de,hl
7058 cdcd65    call    $65cd
705b 2a9444    ld      hl,($4494)
705e 23        inc     hl
705f 3aaf44    ld      a,($44af)
7062 90        sub     b
7063 77        ld      (hl),a
7064 c37370    jp      $7073
7067 2a9444    ld      hl,($4494)
706a 3ab844    ld      a,($44b8)
706d 77        ld      (hl),a
706e 23        inc     hl
706f 3ab944    ld      a,($44b9)
7072 77        ld      (hl),a
7073 2a5f44    ld      hl,($445f)
7076 eb        ex      de,hl
7077 2aaa44    ld      hl,($44aa)
707a cd9264    call    $6492
707d eb        ex      de,hl
707e 2a6344    ld      hl,($4463)
7081 eb        ex      de,hl
7082 cdcd65    call    $65cd
7085 2a9444    ld      hl,($4494)
7088 23        inc     hl
7089 23        inc     hl
708a 3aae44    ld      a,($44ae)
708d 80        add     a,b
708e 77        ld      (hl),a
708f 32b844    ld      ($44b8),a
7092 2a6144    ld      hl,($4461)
7095 eb        ex      de,hl
7096 2aac44    ld      hl,($44ac)
7099 cd9264    call    $6492
709c eb        ex      de,hl
709d 2a6344    ld      hl,($4463)
70a0 eb        ex      de,hl
70a1 cdcd65    call    $65cd
70a4 2a9444    ld      hl,($4494)
70a7 23        inc     hl
70a8 23        inc     hl
70a9 23        inc     hl
70aa 3aaf44    ld      a,($44af)
70ad 90        sub     b
70ae 77        ld      (hl),a
70af 32b944    ld      ($44b9),a
70b2 23        inc     hl
70b3 229444    ld      ($4494),hl
70b6 c3046f    jp      $6f04
70b9 cde869    call    $69e8
70bc 3a5d44    ld      a,($445d)
70bf b7        or      a
70c0 c2046f    jp      nz,$6f04
70c3 2a5944    ld      hl,($4459)
70c6 eb        ex      de,hl
70c7 2aac44    ld      hl,($44ac)
70ca cd9264    call    $6492
70cd eb        ex      de,hl
70ce 2a5b44    ld      hl,($445b)
70d1 eb        ex      de,hl
70d2 cdcd65    call    $65cd
70d5 2a9444    ld      hl,($4494)
70d8 c5        push    bc
70d9 2a5744    ld      hl,($4457)
70dc eb        ex      de,hl
70dd 2aaa44    ld      hl,($44aa)
70e0 cd9264    call    $6492
70e3 eb        ex      de,hl
70e4 2a5b44    ld      hl,($445b)
70e7 eb        ex      de,hl
70e8 cdcd65    call    $65cd
70eb 2a9444    ld      hl,($4494)
70ee 2a9444    ld      hl,($4494)
70f1 36ff      ld      (hl),$ff
70f3 23        inc     hl
70f4 3aae44    ld      a,($44ae)
70f7 80        add     a,b
70f8 77        ld      (hl),a
70f9 23        inc     hl
70fa c1        pop     bc
70fb 3aaf44    ld      a,($44af)
70fe 90        sub     b
70ff 77        ld      (hl),a
7100 23        inc     hl
7101 229444    ld      ($4494),hl
7104 c3046f    jp      $6f04
7107 2a5744    ld      hl,($4457)
710a 4d        ld      c,l
710b 44        ld      b,h
710c 2a5944    ld      hl,($4459)
710f eb        ex      de,hl
7110 2a5b44    ld      hl,($445b)
7113 cd4271    call    $7142
7116 325d44    ld      ($445d),a
7119 c9        ret     

711a 2a5f44    ld      hl,($445f)
711d 4d        ld      c,l
711e 44        ld      b,h
711f 2a6144    ld      hl,($4461)
7122 eb        ex      de,hl
7123 2a6344    ld      hl,($4463)
7126 cd4271    call    $7142
7129 326544    ld      ($4465),a
712c c9        ret     

712d 23        inc     hl
712e 4e        ld      c,(hl)
712f 23        inc     hl
7130 46        ld      b,(hl)
7131 23        inc     hl
7132 5e        ld      e,(hl)
7133 23        inc     hl
7134 56        ld      d,(hl)
7135 23        inc     hl
7136 7e        ld      a,(hl)
7137 23        inc     hl
7138 23        inc     hl
7139 e5        push    hl
713a 2b        dec     hl
713b 66        ld      h,(hl)
713c 6f        ld      l,a
713d cd4271    call    $7142
7140 e1        pop     hl
7141 c9        ret     

7142 af        xor     a
7143 b4        or      h
7144 fac971    jp      m,$71c9
7147 b0        or      b
7148 fa8a71    jp      m,$718a
714b b2        or      d
714c 7d        ld      a,l
714d fa6f71    jp      m,$716f
7150 91        sub     c
7151 7c        ld      a,h
7152 98        sbc     a,b
7153 7d        ld      a,l
7154 fa6371    jp      m,$7163
7157 93        sub     e
7158 7c        ld      a,h
7159 9a        sbc     a,d
715a fa6071    jp      m,$7160
715d 3e00      ld      a,$00
715f c9        ret     

7160 3e08      ld      a,$08
7162 c9        ret     

7163 93        sub     e
7164 7c        ld      a,h
7165 9a        sbc     a,d
7166 fa6c71    jp      m,$716c
7169 3e20      ld      a,$20
716b c9        ret     

716c 3e28      ld      a,$28
716e c9        ret     

716f 91        sub     c
7170 7c        ld      a,h
7171 98        sbc     a,b
7172 19        add     hl,de
7173 fa8071    jp      m,$7180
7176 b4        or      h
7177 fa7d71    jp      m,$717d
717a 3e00      ld      a,$00
717c c9        ret     

717d 3e10      ld      a,$10
717f c9        ret     

7180 a4        and     h
7181 fa8771    jp      m,$7187
7184 3e20      ld      a,$20
7186 c9        ret     

7187 3e30      ld      a,$30
7189 c9        ret     

718a a2        and     d
718b 7d        ld      a,l
718c faae71    jp      m,$71ae
718f 81        add     a,c
7190 7c        ld      a,h
7191 88        adc     a,b
7192 7d        ld      a,l
7193 faa271    jp      m,$71a2
7196 93        sub     e
7197 7c        ld      a,h
7198 9a        sbc     a,d
7199 fa9f71    jp      m,$719f
719c 3e00      ld      a,$00
719e c9        ret     

719f 3e08      ld      a,$08
71a1 c9        ret     

71a2 93        sub     e
71a3 7c        ld      a,h
71a4 9a        sbc     a,d
71a5 faab71    jp      m,$71ab
71a8 3e40      ld      a,$40
71aa c9        ret     

71ab 3e48      ld      a,$48
71ad c9        ret     

71ae 81        add     a,c
71af 7c        ld      a,h
71b0 88        adc     a,b
71b1 19        add     hl,de
71b2 fabf71    jp      m,$71bf
71b5 b4        or      h
71b6 fabc71    jp      m,$71bc
71b9 3e00      ld      a,$00
71bb c9        ret     

71bc 3e10      ld      a,$10
71be c9        ret     

71bf a4        and     h
71c0 fac671    jp      m,$71c6
71c3 3e40      ld      a,$40
71c5 c9        ret     

71c6 3e50      ld      a,$50
71c8 c9        ret     

71c9 a0        and     b
71ca f20c72    jp      p,$720c
71cd a2        and     d
71ce 7d        ld      a,l
71cf faed71    jp      m,$71ed
71d2 91        sub     c
71d3 7c        ld      a,h
71d4 98        sbc     a,b
71d5 19        add     hl,de
71d6 fae371    jp      m,$71e3
71d9 b4        or      h
71da fae071    jp      m,$71e0
71dd 3e48      ld      a,$48
71df c9        ret     

71e0 3e58      ld      a,$58
71e2 c9        ret     

71e3 a4        and     h
71e4 faea71    jp      m,$71ea
71e7 3e68      ld      a,$68
71e9 c9        ret     

71ea 3e78      ld      a,$78
71ec c9        ret     

71ed 91        sub     c
71ee 7c        ld      a,h
71ef 98        sbc     a,b
71f0 7d        ld      a,l
71f1 fa0072    jp      m,$7200
71f4 93        sub     e
71f5 7c        ld      a,h
71f6 9a        sbc     a,d
71f7 fafd71    jp      m,$71fd
71fa 3e50      ld      a,$50
71fc c9        ret     

71fd 3e58      ld      a,$58
71ff c9        ret     

7200 93        sub     e
7201 7c        ld      a,h
7202 9a        sbc     a,d
7203 fa0972    jp      m,$7209
7206 3e70      ld      a,$70
7208 c9        ret     

7209 3e78      ld      a,$78
720b c9        ret     

720c b2        or      d
720d 7d        ld      a,l
720e fa2c72    jp      m,$722c
7211 81        add     a,c
7212 7c        ld      a,h
7213 88        adc     a,b
7214 19        add     hl,de
7215 fa2272    jp      m,$7222
7218 b4        or      h
7219 fa1f72    jp      m,$721f
721c 3e28      ld      a,$28
721e c9        ret     

721f 3e38      ld      a,$38
7221 c9        ret     

7222 a4        and     h
7223 fa2972    jp      m,$7229
7226 3e68      ld      a,$68
7228 c9        ret     

7229 3e78      ld      a,$78
722b c9        ret     

722c 81        add     a,c
722d 7c        ld      a,h
722e 88        adc     a,b
722f 7d        ld      a,l
7230 fa3f72    jp      m,$723f
7233 93        sub     e
7234 7c        ld      a,h
7235 9a        sbc     a,d
7236 fa3c72    jp      m,$723c
7239 3e30      ld      a,$30
723b c9        ret     

723c 3e38      ld      a,$38
723e c9        ret     

723f 93        sub     e
7240 7c        ld      a,h
7241 9a        sbc     a,d
7242 fa4872    jp      m,$7248
7245 3e70      ld      a,$70
7247 c9        ret     

7248 3e78      ld      a,$78
724a c9        ret     

724b 7a        ld      a,d
724c fe05      cp      $05
724e c0        ret     nz

724f 2a5744    ld      hl,($4457)
7252 44        ld      b,h
7253 4d        ld      c,l
7254 2a5944    ld      hl,($4459)
7257 eb        ex      de,hl
7258 2a5b44    ld      hl,($445b)
725b 3ee0      ld      a,$e0
725d a0        and     b
725e ca6672    jp      z,$7266
7261 eee0      xor     $e0
7263 c2aa72    jp      nz,$72aa
7266 3ee0      ld      a,$e0
7268 a2        and     d
7269 ca7172    jp      z,$7271
726c eee0      xor     $e0
726e c2aa72    jp      nz,$72aa
7271 3ee0      ld      a,$e0
7273 a4        and     h
7274 ca7c72    jp      z,$727c
7277 eee0      xor     $e0
7279 c2aa72    jp      nz,$72aa
727c 2a5f44    ld      hl,($445f)
727f 44        ld      b,h
7280 4d        ld      c,l
7281 2a6144    ld      hl,($4461)
7284 eb        ex      de,hl
7285 2a6344    ld      hl,($4463)
7288 3ee0      ld      a,$e0
728a a0        and     b
728b ca9372    jp      z,$7293
728e eee0      xor     $e0
7290 c2d172    jp      nz,$72d1
7293 3ee0      ld      a,$e0
7295 a2        and     d
7296 ca9e72    jp      z,$729e
7299 eee0      xor     $e0
729b c2d172    jp      nz,$72d1
729e 3ee0      ld      a,$e0
72a0 a4        and     h
72a1 caa972    jp      z,$72a9
72a4 eee0      xor     $e0
72a6 c2d172    jp      nz,$72d1
72a9 c9        ret     

72aa 7c        ld      a,h
72ab 07        rlca    
72ac 1f        rra     
72ad 1f        rra     
72ae 325c44    ld      ($445c),a
72b1 7d        ld      a,l
72b2 1f        rra     
72b3 325b44    ld      ($445b),a
72b6 78        ld      a,b
72b7 07        rlca    
72b8 1f        rra     
72b9 1f        rra     
72ba 325844    ld      ($4458),a
72bd 79        ld      a,c
72be 1f        rra     
72bf 325744    ld      ($4457),a
72c2 7a        ld      a,d
72c3 07        rlca    
72c4 1f        rra     
72c5 1f        rra     
72c6 325a44    ld      ($445a),a
72c9 7b        ld      a,e
72ca 1f        rra     
72cb 325944    ld      ($4459),a
72ce c34f72    jp      $724f
72d1 7c        ld      a,h
72d2 07        rlca    
72d3 1f        rra     
72d4 1f        rra     
72d5 326444    ld      ($4464),a
72d8 7d        ld      a,l
72d9 1f        rra     
72da 326344    ld      ($4463),a
72dd 78        ld      a,b
72de 07        rlca    
72df 1f        rra     
72e0 1f        rra     
72e1 326044    ld      ($4460),a
72e4 79        ld      a,c
72e5 1f        rra     
72e6 325f44    ld      ($445f),a
72e9 7a        ld      a,d
72ea 07        rlca    
72eb 1f        rra     
72ec 1f        rra     
72ed 326244    ld      ($4462),a
72f0 7b        ld      a,e
72f1 1f        rra     
72f2 326144    ld      ($4461),a
72f5 c37c72    jp      $727c

72f8 2100f4    ld      hl,$f400			video ram done
72fb 3680      ld      (hl),$80
72fd 23        inc     hl
72fe 3ef8      ld      a,$f8			video ram hi done
7300 bc        cp      h
7301 20f8      jr      nz,$72fb
7303 dd213873  ld      ix,$7338
7307 2100f4    ld      hl,$f400			video ram done
730a 0e0e      ld      c,$0e
730c cd2373    call    $7323			copy bc chars from [ix] to vram at [HL]
730f 0d        dec     c			copy main scren
7310 20fa      jr      nz,$730c
7312 0640      ld      b,$40
7314 cd2e73    call    $732e			copy bc chars from [ix] to vram at [HL]
7317 210078    ld      hl,$7800
731a 110140    ld      de,$4001
731d 01ef03    ld      bc,$03ef
7320 edb0      ldir    
7322 c9        ret     

7323 0609      ld      b,$09
7325 cd2e73    call    $732e
7328 113300    ld      de,$0033
732b 19        add     hl,de
732c 0604      ld      b,$04
732e dd7e00    ld      a,(ix+$00)
7331 77        ld      (hl),a
7332 dd23      inc     ix
7334 23        inc     hl
7335 10f7      djnz    $732e
7337 c9        ret     

7338 4f        ld      c,a
7339 49        ld      c,c
733a 4c        ld      c,h
733b 2050      jr      nz,$738d
733d 2020      jr      nz,$735f
733f 2020      jr      nz,$7361
7341 54        ld      d,h
7342 48        ld      c,b
7343 52        ld      d,d
7344 54        ld      d,h
7345 4f        ld      c,a
7346 49        ld      c,c
7347 4c        ld      c,h
7348 2054      jr      nz,$739e
734a 2020      jr      nz,$736c
734c 2020      jr      nz,$736e
734e 2020      jr      nz,$7370
7350 95        sub     l
7351 80        add     a,b
7352 46        ld      b,(hl)
7353 55        ld      d,l
7354 45        ld      b,l
7355 4c        ld      c,h
7356 2020      jr      nz,$7378
7358 2020      jr      nz,$737a
735a 2020      jr      nz,$737c
735c 2095      jr      nz,$72f3
735e 80        add     a,b
735f 54        ld      d,h
7360 41        ld      b,c
7361 43        ld      b,e
7362 48        ld      c,b
7363 2020      jr      nz,$7385
7365 2020      jr      nz,$7387
7367 2020      jr      nz,$7389
7369 2095      jr      nz,$7300
736b 80        add     a,b
736c 53        ld      d,e
736d 43        ld      b,e
736e 4f        ld      c,a
736f 52        ld      d,d
7370 45        ld      b,l
7371 2020      jr      nz,$7393
7373 2020      jr      nz,$7395
7375 2020      jr      nz,$7397
7377 95        sub     l
7378 80        add     a,b
7379 42        ld      b,d
737a 4f        ld      c,a
737b 4d        ld      c,l
737c 42        ld      b,d
737d 53        ld      d,e
737e 2020      jr      nz,$73a0
7380 2020      jr      nz,$73a2
7382 2020      jr      nz,$73a4
7384 95        sub     l
7385 80        add     a,b
7386 41        ld      b,c
7387 4d        ld      c,l
7388 4d        ld      c,l
7389 4f        ld      c,a
738a 2020      jr      nz,$73ac
738c 2020      jr      nz,$73ae
738e 2045      jr      nz,$73d5
7390 4c        ld      c,h
7391 45        ld      b,l
7392 56        ld      d,(hl)
7393 2020      jr      nz,$73b5
7395 2020      jr      nz,$73b7
7397 2020      jr      nz,$73b9
7399 2020      jr      nz,$73bb
739b 2020      jr      nz,$73bd
739d 2097      jr      nz,$7336
739f 80        add     a,b
73a0 43        ld      b,e
73a1 4c        ld      c,h
73a2 49        ld      c,c
73a3 4d        ld      c,l
73a4 42        ld      b,d
73a5 2020      jr      nz,$73c7
73a7 aa        xor     d
73a8 80        add     a,b
73a9 80        add     a,b
73aa 80        add     a,b
73ab 95        sub     l
73ac 80        add     a,b
73ad 2020      jr      nz,$73cf
73af 2020      jr      nz,$73d1
73b1 2020      jr      nz,$73d3
73b3 20aa      jr      nz,$735f
73b5 80        add     a,b
73b6 80        add     a,b
73b7 80        add     a,b
73b8 9d        sbc     a,l
73b9 80        add     a,b
73ba 48        ld      c,b
73bb 45        ld      b,l
73bc 41        ld      b,c
73bd 44        ld      b,h
73be 49        ld      c,c
73bf 4e        ld      c,(hl)
73c0 47        ld      b,a
73c1 aa        xor     d
73c2 80        add     a,b
73c3 80        add     a,b
73c4 80        add     a,b
73c5 95        sub     l
73c6 80        add     a,b
73c7 2020      jr      nz,$73e9
73c9 2020      jr      nz,$73eb
73cb 2020      jr      nz,$73ed
73cd 20aa      jr      nz,$7379
73cf 80        add     a,b
73d0 80        add     a,b
73d1 80        add     a,b
73d2 b5        or      l
73d3 80        add     a,b
73d4 54        ld      d,h
73d5 55        ld      d,l
73d6 52        ld      d,d
73d7 4e        ld      c,(hl)
73d8 2052      jr      nz,$742c
73da 54        ld      d,h
73db aa        xor     d
73dc 2052      jr      nz,$7430
73de 4f        ld      c,a
73df 4c        ld      c,h
73e0 4c        ld      c,h
73e1 2020      jr      nz,$7403
73e3 2020      jr      nz,$7405
73e5 2020      jr      nz,$7407
73e7 20aa      jr      nz,$7393
73e9 2020      jr      nz,$740b
73eb 2020      jr      nz,$740d
73ed 2032      jr      nz,$7421
73ef 2020      jr      nz,$7411
73f1 34        inc     (hl)
73f2 2020      jr      nz,$7414
73f4 3620      ld      (hl),$20
73f6 2038      jr      nz,$7430
73f8 2031      jr      nz,$742b
73fa 3020      jr      nc,$741c
73fc 313220    ld      sp,$2032
73ff 313420    ld      sp,$2034
7402 313620    ld      sp,$2036
7405 313820    ld      sp,$2038
7408 323020    ld      ($2030),a
740b 2020      jr      nz,$742d
740d 2020      jr      nz,$742f
740f 3020      jr      nc,$7431
7411 2031      jr      nz,$7444
7413 2020      jr      nz,$7435
7415 322020    ld      ($2020),a
7418 33        inc     sp
7419 2020      jr      nz,$743b
741b 34        inc     (hl)
741c 2020      jr      nz,$743e
741e 35        dec     (hl)
741f 2020      jr      nz,$7441
7421 3620      ld      (hl),$20
7423 2037      jr      nz,$745c
7425 2020      jr      nz,$7447
7427 3820      jr      c,$7449
7429 2039      jr      nz,$7464
742b 2020      jr      nz,$744d
742d 2079      jr      nz,$74a8
742f 79        ld      a,c
7430 79        ld      a,c
7431 79        ld      a,c
7432 79        ld      a,c
7433 79        ld      a,c
7434 79        ld      a,c
7435 79        ld      a,c
7436 ff        rst     $38
7437 ff        rst     $38
7438 ff        rst     $38
7439 ff        rst     $38
743a ff        rst     $38
743b ff        rst     $38
743c ff        rst     $38
743d ff        rst     $38
743e ff        rst     $38
743f ff        rst     $38
7440 00        nop     
7441 00        nop     
7442 00        nop     
7443 00        nop     
7444 00        nop     
7445 00        nop     
7446 00        nop     
7447 00        nop     
7448 00        nop     
7449 00        nop     
744a 00        nop     
744b 00        nop     
744c 00        nop     
744d 00        nop     
744e 00        nop     
744f 00        nop     
7450 00        nop     
7451 00        nop     
7452 00        nop     
7453 00        nop     
7454 00        nop     
7455 00        nop     
7456 00        nop     
7457 00        nop     
7458 00        nop     
7459 00        nop     
745a 00        nop     
745b 00        nop     
745c 00        nop     
745d 00        nop     
745e 00        nop     
745f 00        nop     
7460 00        nop     
7461 00        nop     
7462 00        nop     
7463 00        nop     
7464 00        nop     
7465 00        nop     
7466 00        nop     
7467 00        nop     
7468 00        nop     
7469 00        nop     
746a 00        nop     
746b 00        nop     
746c 00        nop     
746d 00        nop     
746e 00        nop     
746f 00        nop     
7470 00        nop     
7471 00        nop     
7472 00        nop     
7473 00        nop     
7474 00        nop     
7475 00        nop     
7476 00        nop     
7477 00        nop     
7478 00        nop     
7479 00        nop     
747a 00        nop     
747b 00        nop     
747c 00        nop     
747d 00        nop     
747e 00        nop     
747f 00        nop     
7480 a5        and     l
7481 a5        and     l
7482 a5        and     l
7483 a5        and     l
7484 a5        and     l
7485 a5        and     l
7486 a5        and     l
7487 a5        and     l
7488 a5        and     l
7489 a5        and     l
748a a5        and     l
748b a5        and     l
748c a5        and     l
748d a5        and     l
748e a5        and     l
748f a5        and     l
7490 a5        and     l
7491 a5        and     l
7492 a5        and     l
7493 a5        and     l
7494 a5        and     l
7495 a5        and     l
7496 a5        and     l
7497 a5        and     l
7498 a5        and     l
7499 a5        and     l
749a a5        and     l
749b a5        and     l
749c a5        and     l
749d a5        and     l
749e a5        and     l
749f a5        and     l
74a0 a5        and     l
74a1 a5        and     l
74a2 a5        and     l
74a3 a5        and     l
74a4 a5        and     l
74a5 a5        and     l
74a6 a5        and     l
74a7 a5        and     l
74a8 a5        and     l
74a9 a5        and     l
74aa a5        and     l
74ab a5        and     l
74ac a5        and     l
74ad a5        and     l
74ae a5        and     l
74af a5        and     l
74b0 a5        and     l
74b1 a5        and     l
74b2 a5        and     l
74b3 a5        and     l
74b4 a5        and     l
74b5 a5        and     l
74b6 a5        and     l
74b7 a5        and     l
74b8 a5        and     l
74b9 a5        and     l
74ba a5        and     l
74bb a5        and     l
74bc a5        and     l
74bd a5        and     l
74be a5        and     l
74bf a5        and     l
74c0 a5        and     l
74c1 a5        and     l
74c2 a5        and     l
74c3 a5        and     l
74c4 a5        and     l
74c5 a5        and     l
74c6 a5        and     l
74c7 a5        and     l
74c8 a5        and     l
74c9 a5        and     l
74ca a5        and     l
74cb a5        and     l
74cc a5        and     l
74cd a5        and     l
74ce a5        and     l
74cf a5        and     l
74d0 a5        and     l
74d1 a5        and     l
74d2 a5        and     l
74d3 a5        and     l
74d4 a5        and     l
74d5 a5        and     l
74d6 a5        and     l
74d7 a5        and     l
74d8 a5        and     l
74d9 a5        and     l
74da a5        and     l
74db a5        and     l
74dc a5        and     l
74dd a5        and     l
74de a5        and     l
74df a5        and     l
74e0 a5        and     l
74e1 a5        and     l
74e2 a5        and     l
74e3 a5        and     l
74e4 a5        and     l
74e5 a5        and     l
74e6 a5        and     l
74e7 a5        and     l
74e8 a5        and     l
74e9 a5        and     l
74ea a5        and     l
74eb a5        and     l
74ec a5        and     l
74ed a5        and     l
74ee a5        and     l
74ef a5        and     l
74f0 a5        and     l
74f1 a5        and     l
74f2 a5        and     l
74f3 a5        and     l
74f4 a5        and     l
74f5 a5        and     l
74f6 a5        and     l
74f7 a5        and     l
74f8 a5        and     l
74f9 a5        and     l
74fa a5        and     l
74fb a5        and     l
74fc a5        and     l
74fd a5        and     l
74fe a5        and     l
74ff a5        and     l

					Program Start

7500 3e0c      ld      a,$0c
7502 cd1be0    call    $e01b		Video Char Out -> clear the screen
7505 210076    ld      hl,$7600		copy character definition to mimic the
7508 1100fc    ld      de,$fc00         ones for trs80 model-1
750b 010002    ld      bc,$0200
750e edb0      ldir    
7510 310062    ld      sp,$6200		same as start-up sequence in trs9' fs1
7513 3e00      ld      a,$00		with follwong additions:
7515 323d40    ld      ($403d),a	[$403d]=0
7518 3e43      ld      a,$43		this has same effect as original code:
751a 216643    ld      hl,$4366 		4361 3e43      ld      a,$43
751d e5        push    hl			4363 cd9c49    call    $499c
751e c39c49    jp      $499c			4366 ...
7521 a5        and     l
7522 a5        and     l
7523 a5        and     l
7524 a5        and     l
7525 a5        and     l
7526 a5        and     l
7527 a5        and     l
7528 a5        and     l
7529 a5        and     l
752a a5        and     l
752b a5        and     l
752c a5        and     l
752d a5        and     l
752e a5        and     l
752f a5        and     l
7530 a5        and     l
7531 a5        and     l
7532 a5        and     l
7533 a5        and     l
7534 a5        and     l
7535 a5        and     l
7536 a5        and     l
7537 a5        and     l
7538 a5        and     l
7539 a5        and     l
753a a5        and     l
753b a5        and     l
753c a5        and     l
753d a5        and     l
753e a5        and     l
753f a5        and     l
7540 a5        and     l
7541 a5        and     l
7542 a5        and     l
7543 a5        and     l
7544 a5        and     l
7545 a5        and     l
7546 a5        and     l
7547 a5        and     l
7548 a5        and     l
7549 a5        and     l
754a a5        and     l
754b a5        and     l
754c a5        and     l
754d a5        and     l
754e a5        and     l
754f a5        and     l
7550 a5        and     l
7551 a5        and     l
7552 a5        and     l
7553 a5        and     l
7554 a5        and     l
7555 a5        and     l
7556 a5        and     l
7557 a5        and     l
7558 a5        and     l
7559 a5        and     l
755a a5        and     l
755b a5        and     l
755c a5        and     l
755d a5        and     l
755e a5        and     l
755f a5        and     l
7560 a5        and     l
7561 a5        and     l
7562 a5        and     l
7563 a5        and     l
7564 a5        and     l
7565 a5        and     l
7566 a5        and     l
7567 a5        and     l
7568 a5        and     l
7569 a5        and     l
756a a5        and     l
756b a5        and     l
756c a5        and     l
756d a5        and     l
756e a5        and     l
756f a5        and     l
7570 a5        and     l
7571 a5        and     l
7572 a5        and     l
7573 a5        and     l
7574 a5        and     l
7575 a5        and     l
7576 a5        and     l
7577 a5        and     l
7578 a5        and     l
7579 a5        and     l
757a a5        and     l
757b a5        and     l
757c a5        and     l
757d a5        and     l
757e a5        and     l
757f a5        and     l
7580 a5        and     l
7581 a5        and     l
7582 a5        and     l
7583 a5        and     l
7584 a5        and     l
7585 a5        and     l
7586 a5        and     l
7587 a5        and     l
7588 a5        and     l
7589 a5        and     l
758a a5        and     l
758b a5        and     l
758c a5        and     l
758d a5        and     l
758e a5        and     l
758f a5        and     l
7590 a5        and     l
7591 a5        and     l
7592 a5        and     l
7593 a5        and     l
7594 a5        and     l
7595 a5        and     l
7596 a5        and     l
7597 a5        and     l
7598 a5        and     l
7599 a5        and     l
759a a5        and     l
759b a5        and     l
759c a5        and     l
759d a5        and     l
759e a5        and     l
759f a5        and     l
75a0 a5        and     l
75a1 a5        and     l
75a2 a5        and     l
75a3 a5        and     l
75a4 a5        and     l
75a5 a5        and     l
75a6 a5        and     l
75a7 a5        and     l
75a8 a5        and     l
75a9 a5        and     l
75aa a5        and     l
75ab a5        and     l
75ac a5        and     l
75ad a5        and     l
75ae a5        and     l
75af a5        and     l
75b0 a5        and     l
75b1 a5        and     l
75b2 a5        and     l
75b3 a5        and     l
75b4 a5        and     l
75b5 a5        and     l
75b6 a5        and     l
75b7 a5        and     l
75b8 a5        and     l
75b9 a5        and     l
75ba a5        and     l
75bb a5        and     l
75bc a5        and     l
75bd a5        and     l
75be a5        and     l
75bf a5        and     l
75c0 a5        and     l
75c1 a5        and     l
75c2 a5        and     l
75c3 a5        and     l
75c4 a5        and     l
75c5 a5        and     l
75c6 a5        and     l
75c7 a5        and     l
75c8 a5        and     l
75c9 a5        and     l
75ca a5        and     l
75cb a5        and     l
75cc a5        and     l
75cd a5        and     l
75ce a5        and     l
75cf a5        and     l
75d0 a5        and     l
75d1 a5        and     l
75d2 a5        and     l
75d3 a5        and     l
75d4 a5        and     l
75d5 a5        and     l
75d6 a5        and     l
75d7 a5        and     l
75d8 a5        and     l
75d9 a5        and     l
75da a5        and     l
75db a5        and     l
75dc a5        and     l
75dd a5        and     l
75de a5        and     l
75df a5        and     l
75e0 a5        and     l
75e1 a5        and     l
75e2 a5        and     l
75e3 a5        and     l
75e4 a5        and     l
75e5 a5        and     l
75e6 a5        and     l
75e7 a5        and     l
75e8 a5        and     l
75e9 a5        and     l
75ea a5        and     l
75eb a5        and     l
75ec a5        and     l
75ed a5        and     l
75ee a5        and     l
75ef a5        and     l
75f0 a5        and     l
75f1 a5        and     l
75f2 a5        and     l
75f3 a5        and     l
75f4 a5        and     l
75f5 a5        and     l
75f6 a5        and     l
75f7 a5        and     l
75f8 a5        and     l
75f9 a5        and     l
75fa a5        and     l
75fb a5        and     l
75fc a5        and     l
75fd a5        and     l
75fe a5        and     l
75ff a5        and     l
7600 00        nop     
7601 00        nop     
7602 00        nop     
7603 00        nop     
7604 00        nop     
7605 00        nop     
7606 00        nop     
7607 00        nop     
7608 f0        ret     p

7609 f0        ret     p

760a f0        ret     p

760b 00        nop     
760c 00        nop     
760d 00        nop     
760e 00        nop     
760f 00        nop     
7610 0f        rrca    
7611 0f        rrca    
7612 0f        rrca    
7613 00        nop     
7614 00        nop     
7615 00        nop     
7616 00        nop     
7617 00        nop     
7618 ff        rst     $38
7619 ff        rst     $38
761a ff        rst     $38
761b 00        nop     
761c 00        nop     
761d 00        nop     
761e 00        nop     
761f 00        nop     
7620 00        nop     
7621 00        nop     
7622 00        nop     
7623 f0        ret     p

7624 f0        ret     p

7625 00        nop     
7626 00        nop     
7627 00        nop     
7628 f0        ret     p

7629 f0        ret     p

762a f0        ret     p

762b f0        ret     p

762c f0        ret     p

762d 00        nop     
762e 00        nop     
762f 00        nop     
7630 0f        rrca    
7631 0f        rrca    
7632 0f        rrca    
7633 f0        ret     p

7634 f0        ret     p

7635 00        nop     
7636 00        nop     
7637 00        nop     
7638 ff        rst     $38
7639 ff        rst     $38
763a ff        rst     $38
763b f0        ret     p

763c f0        ret     p

763d 00        nop     
763e 00        nop     
763f 00        nop     
7640 00        nop     
7641 00        nop     
7642 00        nop     
7643 0f        rrca    
7644 0f        rrca    
7645 00        nop     
7646 00        nop     
7647 00        nop     
7648 f0        ret     p

7649 f0        ret     p

764a f0        ret     p

764b 0f        rrca    
764c 0f        rrca    
764d 00        nop     
764e 00        nop     
764f 00        nop     
7650 0f        rrca    
7651 0f        rrca    
7652 0f        rrca    
7653 0f        rrca    
7654 0f        rrca    
7655 00        nop     
7656 00        nop     
7657 00        nop     
7658 ff        rst     $38
7659 ff        rst     $38
765a ff        rst     $38
765b 0f        rrca    
765c 0f        rrca    
765d 00        nop     
765e 00        nop     
765f 00        nop     
7660 00        nop     
7661 00        nop     
7662 00        nop     
7663 ff        rst     $38
7664 ff        rst     $38
7665 00        nop     
7666 00        nop     
7667 00        nop     
7668 f0        ret     p

7669 f0        ret     p

766a f0        ret     p

766b ff        rst     $38
766c ff        rst     $38
766d 00        nop     
766e 00        nop     
766f 00        nop     
7670 0f        rrca    
7671 0f        rrca    
7672 0f        rrca    
7673 ff        rst     $38
7674 ff        rst     $38
7675 00        nop     
7676 00        nop     
7677 00        nop     
7678 ff        rst     $38
7679 ff        rst     $38
767a ff        rst     $38
767b ff        rst     $38
767c ff        rst     $38
767d 00        nop     
767e 00        nop     
767f 00        nop     
7680 00        nop     
7681 00        nop     
7682 00        nop     
7683 00        nop     
7684 00        nop     
7685 f0        ret     p

7686 f0        ret     p

7687 f0        ret     p

7688 f0        ret     p

7689 f0        ret     p

768a f0        ret     p

768b 00        nop     
768c 00        nop     
768d f0        ret     p

768e f0        ret     p

768f f0        ret     p

7690 0f        rrca    
7691 0f        rrca    
7692 0f        rrca    
7693 00        nop     
7694 00        nop     
7695 f0        ret     p

7696 f0        ret     p

7697 f0        ret     p

7698 ff        rst     $38
7699 ff        rst     $38
769a ff        rst     $38
769b 00        nop     
769c 00        nop     
769d f0        ret     p

769e f0        ret     p

769f f0        ret     p

76a0 00        nop     
76a1 00        nop     
76a2 00        nop     
76a3 f0        ret     p

76a4 f0        ret     p

76a5 f0        ret     p

76a6 f0        ret     p

76a7 f0        ret     p

76a8 f0        ret     p

76a9 f0        ret     p

76aa f0        ret     p

76ab f0        ret     p

76ac f0        ret     p

76ad f0        ret     p

76ae f0        ret     p

76af f0        ret     p

76b0 0f        rrca    
76b1 0f        rrca    
76b2 0f        rrca    
76b3 f0        ret     p

76b4 f0        ret     p

76b5 f0        ret     p

76b6 f0        ret     p

76b7 f0        ret     p

76b8 ff        rst     $38
76b9 ff        rst     $38
76ba ff        rst     $38
76bb f0        ret     p

76bc f0        ret     p

76bd f0        ret     p

76be f0        ret     p

76bf f0        ret     p

76c0 00        nop     
76c1 00        nop     
76c2 00        nop     
76c3 0f        rrca    
76c4 0f        rrca    
76c5 f0        ret     p

76c6 f0        ret     p

76c7 f0        ret     p

76c8 f0        ret     p

76c9 f0        ret     p

76ca f0        ret     p

76cb 0f        rrca    
76cc 0f        rrca    
76cd f0        ret     p

76ce f0        ret     p

76cf f0        ret     p

76d0 0f        rrca    
76d1 0f        rrca    
76d2 0f        rrca    
76d3 0f        rrca    
76d4 0f        rrca    
76d5 f0        ret     p

76d6 f0        ret     p

76d7 f0        ret     p

76d8 ff        rst     $38
76d9 ff        rst     $38
76da ff        rst     $38
76db 0f        rrca    
76dc 0f        rrca    
76dd f0        ret     p

76de f0        ret     p

76df f0        ret     p

76e0 00        nop     
76e1 00        nop     
76e2 00        nop     
76e3 ff        rst     $38
76e4 ff        rst     $38
76e5 f0        ret     p

76e6 f0        ret     p

76e7 f0        ret     p

76e8 f0        ret     p

76e9 f0        ret     p

76ea f0        ret     p

76eb ff        rst     $38
76ec ff        rst     $38
76ed f0        ret     p

76ee f0        ret     p

76ef f0        ret     p

76f0 0f        rrca    
76f1 0f        rrca    
76f2 0f        rrca    
76f3 ff        rst     $38
76f4 ff        rst     $38
76f5 f0        ret     p

76f6 f0        ret     p

76f7 f0        ret     p

76f8 ff        rst     $38
76f9 ff        rst     $38
76fa ff        rst     $38
76fb ff        rst     $38
76fc ff        rst     $38
76fd f0        ret     p

76fe f0        ret     p

76ff f0        ret     p

7700 00        nop     
7701 00        nop     
7702 00        nop     
7703 00        nop     
7704 00        nop     
7705 0f        rrca    
7706 0f        rrca    
7707 0f        rrca    
7708 f0        ret     p

7709 f0        ret     p

770a f0        ret     p

770b 00        nop     
770c 00        nop     
770d 0f        rrca    
770e 0f        rrca    
770f 0f        rrca    
7710 0f        rrca    
7711 0f        rrca    
7712 0f        rrca    
7713 00        nop     
7714 00        nop     
7715 0f        rrca    
7716 0f        rrca    
7717 0f        rrca    
7718 ff        rst     $38
7719 ff        rst     $38
771a ff        rst     $38
771b 00        nop     
771c 00        nop     
771d 0f        rrca    
771e 0f        rrca    
771f 0f        rrca    
7720 00        nop     
7721 00        nop     
7722 00        nop     
7723 f0        ret     p

7724 f0        ret     p

7725 0f        rrca    
7726 0f        rrca    
7727 0f        rrca    
7728 f0        ret     p

7729 f0        ret     p

772a f0        ret     p

772b f0        ret     p

772c f0        ret     p

772d 0f        rrca    
772e 0f        rrca    
772f 0f        rrca    
7730 0f        rrca    
7731 0f        rrca    
7732 0f        rrca    
7733 f0        ret     p

7734 f0        ret     p

7735 0f        rrca    
7736 0f        rrca    
7737 0f        rrca    
7738 ff        rst     $38
7739 ff        rst     $38
773a ff        rst     $38
773b f0        ret     p

773c f0        ret     p

773d 0f        rrca    
773e 0f        rrca    
773f 0f        rrca    
7740 00        nop     
7741 00        nop     
7742 00        nop     
7743 0f        rrca    
7744 0f        rrca    
7745 0f        rrca    
7746 0f        rrca    
7747 0f        rrca    
7748 f0        ret     p

7749 f0        ret     p

774a f0        ret     p

774b 0f        rrca    
774c 0f        rrca    
774d 0f        rrca    
774e 0f        rrca    
774f 0f        rrca    
7750 0f        rrca    
7751 0f        rrca    
7752 0f        rrca    
7753 0f        rrca    
7754 0f        rrca    
7755 0f        rrca    
7756 0f        rrca    
7757 0f        rrca    
7758 ff        rst     $38
7759 ff        rst     $38
775a ff        rst     $38
775b 0f        rrca    
775c 0f        rrca    
775d 0f        rrca    
775e 0f        rrca    
775f 0f        rrca    
7760 00        nop     
7761 00        nop     
7762 00        nop     
7763 ff        rst     $38
7764 ff        rst     $38
7765 0f        rrca    
7766 0f        rrca    
7767 0f        rrca    
7768 f0        ret     p

7769 f0        ret     p

776a f0        ret     p

776b ff        rst     $38
776c ff        rst     $38
776d 0f        rrca    
776e 0f        rrca    
776f 0f        rrca    
7770 0f        rrca    
7771 0f        rrca    
7772 0f        rrca    
7773 ff        rst     $38
7774 ff        rst     $38
7775 0f        rrca    
7776 0f        rrca    
7777 0f        rrca    
7778 ff        rst     $38
7779 ff        rst     $38
777a ff        rst     $38
777b ff        rst     $38
777c ff        rst     $38
777d 0f        rrca    
777e 0f        rrca    
777f 0f        rrca    
7780 00        nop     
7781 00        nop     
7782 00        nop     
7783 00        nop     
7784 00        nop     
7785 ff        rst     $38
7786 ff        rst     $38
7787 ff        rst     $38
7788 f0        ret     p

7789 f0        ret     p

778a f0        ret     p

778b 00        nop     
778c 00        nop     
778d ff        rst     $38
778e ff        rst     $38
778f ff        rst     $38
7790 0f        rrca    
7791 0f        rrca    
7792 0f        rrca    
7793 00        nop     
7794 00        nop     
7795 ff        rst     $38
7796 ff        rst     $38
7797 ff        rst     $38
7798 ff        rst     $38
7799 ff        rst     $38
779a ff        rst     $38
779b 00        nop     
779c 00        nop     
779d ff        rst     $38
779e ff        rst     $38
779f ff        rst     $38
77a0 00        nop     
77a1 00        nop     
77a2 00        nop     
77a3 f0        ret     p

77a4 f0        ret     p

77a5 ff        rst     $38
77a6 ff        rst     $38
77a7 ff        rst     $38
77a8 f0        ret     p

77a9 f0        ret     p

77aa f0        ret     p

77ab f0        ret     p

77ac f0        ret     p

77ad ff        rst     $38
77ae ff        rst     $38
77af ff        rst     $38
77b0 0f        rrca    
77b1 0f        rrca    
77b2 0f        rrca    
77b3 f0        ret     p

77b4 f0        ret     p

77b5 ff        rst     $38
77b6 ff        rst     $38
77b7 ff        rst     $38
77b8 ff        rst     $38
77b9 ff        rst     $38
77ba ff        rst     $38
77bb f0        ret     p

77bc f0        ret     p

77bd ff        rst     $38
77be ff        rst     $38
77bf ff        rst     $38
77c0 00        nop     
77c1 00        nop     
77c2 00        nop     
77c3 0f        rrca    
77c4 0f        rrca    
77c5 ff        rst     $38
77c6 ff        rst     $38
77c7 ff        rst     $38
77c8 f0        ret     p

77c9 f0        ret     p

77ca f0        ret     p

77cb 0f        rrca    
77cc 0f        rrca    
77cd ff        rst     $38
77ce ff        rst     $38
77cf ff        rst     $38
77d0 0f        rrca    
77d1 0f        rrca    
77d2 0f        rrca    
77d3 0f        rrca    
77d4 0f        rrca    
77d5 ff        rst     $38
77d6 ff        rst     $38
77d7 ff        rst     $38
77d8 ff        rst     $38
77d9 ff        rst     $38
77da ff        rst     $38
77db 0f        rrca    
77dc 0f        rrca    
77dd ff        rst     $38
77de ff        rst     $38
77df ff        rst     $38
77e0 00        nop     
77e1 00        nop     
77e2 00        nop     
77e3 ff        rst     $38
77e4 ff        rst     $38
77e5 ff        rst     $38
77e6 ff        rst     $38
77e7 ff        rst     $38
77e8 f0        ret     p

77e9 f0        ret     p

77ea f0        ret     p

77eb ff        rst     $38
77ec ff        rst     $38
77ed ff        rst     $38
77ee ff        rst     $38
77ef ff        rst     $38
77f0 0f        rrca    
77f1 0f        rrca    
77f2 0f        rrca    
77f3 ff        rst     $38
77f4 ff        rst     $38
77f5 ff        rst     $38
77f6 ff        rst     $38
77f7 ff        rst     $38
77f8 ff        rst     $38
77f9 ff        rst     $38
77fa ff        rst     $38
77fb ff        rst     $38
77fc ff        rst     $38
77fd ff        rst     $38
77fe ff        rst     $38
77ff ff        rst     $38
7800 e5        push    hl
7801 d5        push    de
7802 c5        push    bc
7803 060f      ld      b,$0f
7805 78        ld      a,b
7806 d3fe      out     ($fe),a		Keyboard port
7808 dbfe      in      a,($fe)		Keyboard port
780a f6e0      or      $e0
780c 2f        cpl     
780d b7        or      a
780e 2014      jr      nz,$7824
7810 10f3      djnz    $7805
7812 af        xor     a
7813 d3fe      out     ($fe),a
7815 dbfe      in      a,($fe)
7817 e607      and     $07
7819 fe07      cp      $07
781b 2003      jr      nz,$7820
781d af        xor     a
781e 1824      jr      $7844
7820 f6f8      or      $f8
7822 18e8      jr      $780c
7824 cb27      sla     a
7826 cb27      sla     a
7828 cb27      sla     a
782a c5        push    bc
782b 06ff      ld      b,$ff
782d cb27      sla     a
782f 04        inc     b
7830 30fb      jr      nc,$782d
7832 58        ld      e,b
7833 c1        pop     bc
7834 78        ld      a,b
7835 0604      ld      b,$04
7837 57        ld      d,a
7838 82        add     a,d
7839 10fd      djnz    $7838
783b 83        add     a,e
783c 4f        ld      c,a
783d 0600      ld      b,$00
783f 214978    ld      hl,$7849
7842 09        add     hl,bc
7843 7e        ld      a,(hl)
7844 b7        or      a
7845 c1        pop     bc
7846 d1        pop     de
7847 e1        pop     hl
7848 c9        ret     

7849 00        nop     
784a 00        nop     
784b 00        nop     
784c 00        nop     
784d 60        ld      h,b
784e 012020    ld      bc,$2020
7851 00        nop     
7852 1f        rra     
7853 315141    ld      sp,$4151
7856 5a        ld      e,d
7857 58        ld      e,b
7858 325753    ld      ($5357),a
785b 44        ld      b,h
785c 43        ld      b,e
785d 33        inc     sp
785e 34        inc     (hl)
785f 45        ld      b,l
7860 52        ld      d,d
7861 46        ld      b,(hl)
7862 35        dec     (hl)
7863 54        ld      d,h
7864 47        ld      b,a
7865 56        ld      d,(hl)
7866 42        ld      b,d
7867 3659      ld      (hl),$59
7869 48        ld      c,b
786a 4e        ld      c,(hl)
786b 4d        ld      c,l
786c 37        scf     
786d 55        ld      d,l
786e 4a        ld      c,d
786f 49        ld      c,c
7870 4b        ld      c,e
7871 3839      jr      c,$78ac
7873 4f        ld      c,a
7874 4c        ld      c,h
7875 2c        inc     l
7876 3050      jr      nc,$78c8
7878 3b        dec     sp
7879 2e2f      ld      l,$2f
787b 3a5b5d    ld      a,($5d5b)
787e 40        ld      b,b
787f 5c        ld      e,h
7880 2d        dec     l
7881 5e        ld      e,(hl)
7882 0a        ld      a,(bc)
7883 0d        dec     c
7884 5f        ld      e,a
7885 00        nop     
7886 2d        dec     l
7887 2f        cpl     
7888 2a2b37    ld      hl,($372b)
788b 3834      jr      c,$78c1
788d 313039    ld      sp,$3930
7890 3635      ld      (hl),$35
7892 322e33    ld      ($332e),a
7895 3d        dec     a
7896 00        nop     
7897 00        nop     
7898 00        nop     
7899 00        nop     
789a 00        nop     
789b 00        nop     
789c 00        nop     
789d 00        nop     
789e 00        nop     
789f 00        nop     
78a0 00        nop     
78a1 a5        and     l
78a2 a5        and     l
78a3 a5        and     l
78a4 a5        and     l
78a5 a5        and     l
78a6 a5        and     l
78a7 a5        and     l
78a8 a5        and     l
78a9 a5        and     l
78aa a5        and     l
78ab a5        and     l
78ac a5        and     l
78ad a5        and     l
78ae a5        and     l
78af a5        and     l
78b0 a5        and     l
78b1 a5        and     l
78b2 a5        and     l
78b3 a5        and     l
78b4 a5        and     l
78b5 a5        and     l
78b6 a5        and     l
78b7 a5        and     l
78b8 a5        and     l
78b9 a5        and     l
78ba a5        and     l
78bb a5        and     l
78bc a5        and     l
78bd a5        and     l
78be a5        and     l
78bf a5        and     l
78c0 a5        and     l
78c1 a5        and     l
78c2 a5        and     l
78c3 a5        and     l
78c4 a5        and     l
78c5 a5        and     l
78c6 a5        and     l
78c7 a5        and     l
78c8 a5        and     l
78c9 a5        and     l
78ca a5        and     l
78cb a5        and     l
78cc a5        and     l
78cd a5        and     l
78ce a5        and     l
78cf a5        and     l
78d0 a5        and     l
78d1 a5        and     l
78d2 a5        and     l
78d3 a5        and     l
78d4 a5        and     l
78d5 a5        and     l
78d6 a5        and     l
78d7 a5        and     l
78d8 a5        and     l
78d9 a5        and     l
78da a5        and     l
78db a5        and     l
78dc a5        and     l
78dd a5        and     l
78de a5        and     l
78df a5        and     l
78e0 a5        and     l
78e1 a5        and     l
78e2 a5        and     l
78e3 a5        and     l
78e4 a5        and     l
78e5 a5        and     l
78e6 a5        and     l
78e7 a5        and     l
78e8 a5        and     l
78e9 a5        and     l
78ea a5        and     l
78eb a5        and     l
78ec a5        and     l
78ed a5        and     l
78ee a5        and     l
78ef a5        and     l
78f0 a5        and     l
78f1 a5        and     l
78f2 a5        and     l
78f3 a5        and     l
78f4 a5        and     l
78f5 a5        and     l
78f6 a5        and     l
78f7 a5        and     l
78f8 a5        and     l
78f9 a5        and     l
78fa a5        and     l
78fb a5        and     l
78fc a5        and     l
78fd a5        and     l
78fe a5        and     l
78ff a5        and     l
7900 a5        and     l
7901 a5        and     l
7902 a5        and     l
7903 a5        and     l
7904 a5        and     l
7905 a5        and     l
7906 a5        and     l
7907 a5        and     l
7908 a5        and     l
7909 a5        and     l
790a a5        and     l
790b a5        and     l
790c a5        and     l
790d a5        and     l
790e a5        and     l
790f a5        and     l
7910 a5        and     l
7911 a5        and     l
7912 a5        and     l
7913 a5        and     l
7914 a5        and     l
7915 a5        and     l
7916 a5        and     l
7917 a5        and     l
7918 a5        and     l
7919 a5        and     l
791a a5        and     l
791b a5        and     l
791c a5        and     l
791d a5        and     l
791e a5        and     l
791f a5        and     l
7920 a5        and     l
7921 a5        and     l
7922 a5        and     l
7923 a5        and     l
7924 a5        and     l
7925 a5        and     l
7926 a5        and     l
7927 a5        and     l
7928 a5        and     l
7929 a5        and     l
792a a5        and     l
792b a5        and     l
792c a5        and     l
792d a5        and     l
792e a5        and     l
792f a5        and     l
7930 a5        and     l
7931 a5        and     l
7932 a5        and     l
7933 a5        and     l
7934 a5        and     l
7935 a5        and     l
7936 a5        and     l
7937 a5        and     l
7938 a5        and     l
7939 a5        and     l
793a a5        and     l
793b a5        and     l
793c a5        and     l
793d a5        and     l
793e a5        and     l
793f a5        and     l
7940 a5        and     l
7941 a5        and     l
7942 a5        and     l
7943 a5        and     l
7944 a5        and     l
7945 a5        and     l
7946 a5        and     l
7947 a5        and     l
7948 a5        and     l
7949 a5        and     l
794a a5        and     l
794b a5        and     l
794c a5        and     l
794d a5        and     l
794e a5        and     l
794f a5        and     l
7950 a5        and     l
7951 a5        and     l
7952 a5        and     l
7953 a5        and     l
7954 a5        and     l
7955 a5        and     l
7956 a5        and     l
7957 a5        and     l
7958 a5        and     l
7959 a5        and     l
795a a5        and     l
795b a5        and     l
795c a5        and     l
795d a5        and     l
795e a5        and     l
795f a5        and     l
7960 a5        and     l
7961 a5        and     l
7962 a5        and     l
7963 a5        and     l
7964 a5        and     l
7965 a5        and     l
7966 a5        and     l
7967 a5        and     l
7968 a5        and     l
7969 a5        and     l
796a a5        and     l
796b a5        and     l
796c a5        and     l
796d a5        and     l
796e a5        and     l
796f a5        and     l
7970 a5        and     l
7971 a5        and     l
7972 a5        and     l
7973 a5        and     l
7974 a5        and     l
7975 a5        and     l
7976 a5        and     l
7977 a5        and     l
7978 a5        and     l
7979 a5        and     l
797a a5        and     l
797b a5        and     l
797c a5        and     l
797d a5        and     l
797e a5        and     l
797f a5        and     l
7980 a5        and     l
7981 a5        and     l
7982 a5        and     l
7983 a5        and     l
7984 a5        and     l
7985 a5        and     l
7986 a5        and     l
7987 a5        and     l
7988 a5        and     l
7989 a5        and     l
798a a5        and     l
798b a5        and     l
798c a5        and     l
798d a5        and     l
798e a5        and     l
798f a5        and     l
7990 a5        and     l
7991 a5        and     l
7992 a5        and     l
7993 a5        and     l
7994 a5        and     l
7995 a5        and     l
7996 a5        and     l
7997 a5        and     l
7998 a5        and     l
7999 a5        and     l
799a a5        and     l
799b a5        and     l
799c a5        and     l
799d a5        and     l
799e a5        and     l
799f a5        and     l
79a0 a5        and     l
79a1 a5        and     l
79a2 a5        and     l
79a3 a5        and     l
79a4 a5        and     l
79a5 a5        and     l
79a6 a5        and     l
79a7 a5        and     l
79a8 a5        and     l
79a9 a5        and     l
79aa a5        and     l
79ab a5        and     l
79ac a5        and     l
79ad a5        and     l
79ae a5        and     l
79af a5        and     l
79b0 a5        and     l
79b1 a5        and     l
79b2 a5        and     l
79b3 a5        and     l
79b4 a5        and     l
79b5 a5        and     l
79b6 a5        and     l
79b7 a5        and     l
79b8 a5        and     l
79b9 a5        and     l
79ba a5        and     l
79bb a5        and     l
79bc a5        and     l
79bd a5        and     l
79be a5        and     l
79bf a5        and     l
79c0 a5        and     l
79c1 a5        and     l
79c2 a5        and     l
79c3 a5        and     l
79c4 a5        and     l
79c5 a5        and     l
79c6 a5        and     l
79c7 a5        and     l
79c8 a5        and     l
79c9 a5        and     l
79ca a5        and     l
79cb a5        and     l
79cc a5        and     l
79cd a5        and     l
79ce a5        and     l
79cf a5        and     l
79d0 a5        and     l
79d1 a5        and     l
79d2 a5        and     l
79d3 a5        and     l
79d4 a5        and     l
79d5 a5        and     l
79d6 a5        and     l
79d7 a5        and     l
79d8 a5        and     l
79d9 a5        and     l
79da a5        and     l
79db a5        and     l
79dc a5        and     l
79dd a5        and     l
79de a5        and     l
79df a5        and     l
79e0 a5        and     l
79e1 a5        and     l
79e2 a5        and     l
79e3 a5        and     l
79e4 a5        and     l
79e5 a5        and     l
79e6 a5        and     l
79e7 a5        and     l
79e8 a5        and     l
79e9 a5        and     l
79ea a5        and     l
79eb a5        and     l
79ec a5        and     l
79ed a5        and     l
79ee a5        and     l
79ef a5        and     l
79f0 a5        and     l
79f1 a5        and     l
79f2 00        nop     
79f3 a5        and     l
79f4 a5        and     l
79f5 a5        and     l
79f6 a5        and     l
79f7 a5        and     l
79f8 a5        and     l
79f9 a5        and     l
79fa a5        and     l
79fb a5        and     l
79fc a5        and     l
79fd a5        and     l
79fe a5        and     l
79ff a5        and     l
7a00 a5        and     l
7a01 a5        and     l
7a02 00        nop     
7a03 ff        rst     $38
7a04 211001    ld      hl,$0110
7a07 110001    ld      de,$0100
7a0a 01013a    ld      bc,$3a01
7a0d edb0      ldir    
7a0f c30001    jp      $0100
7a12 c3ff80    jp      $80ff
7a15 ff        rst     $38
7a16 80        add     a,b
7a17 ff        rst     $38
7a18 80        add     a,b
7a19 ff        rst     $38
7a1a 80        add     a,b
7a1b ff        rst     $38
7a1c 80        add     a,b
7a1d ff        rst     $38
7a1e 80        add     a,b
7a1f ff        rst     $38
7a20 80        add     a,b
7a21 ff        rst     $38
7a22 80        add     a,b
7a23 ff        rst     $38
7a24 80        add     a,b
7a25 ff        rst     $38
7a26 80        add     a,b
7a27 ff        rst     $38
7a28 80        add     a,b
7a29 ff        rst     $38
7a2a 80        add     a,b
7a2b ff        rst     $38
7a2c 80        add     a,b
7a2d ff        rst     $38
7a2e 80        add     a,b
7a2f ff        rst     $38
7a30 80        add     a,b
7a31 ff        rst     $38
7a32 80        add     a,b
7a33 ff        rst     $38
7a34 80        add     a,b
7a35 7f        ld      a,a
7a36 00        nop     
7a37 7f        ld      a,a
7a38 00        nop     
7a39 7f        ld      a,a
7a3a 00        nop     
7a3b 7f        ld      a,a
7a3c 00        nop     
7a3d 7f        ld      a,a
7a3e 00        nop     
7a3f 7f        ld      a,a
7a40 00        nop     
7a41 7f        ld      a,a
7a42 00        nop     
7a43 7f        ld      a,a
7a44 00        nop     
7a45 7f        ld      a,a
7a46 00        nop     
7a47 7f        ld      a,a
7a48 00        nop     
7a49 7f        ld      a,a
7a4a 00        nop     
7a4b 7f        ld      a,a
7a4c 00        nop     
7a4d 7f        ld      a,a
7a4e 00        nop     
7a4f 7f        ld      a,a
7a50 00        nop     
7a51 7f        ld      a,a
7a52 00        nop     
7a53 7f        ld      a,a
7a54 00        nop     
7a55 7f        ld      a,a
7a56 00        nop     
7a57 7f        ld      a,a
7a58 00        nop     
7a59 7f        ld      a,a
7a5a 00        nop     
7a5b 7f        ld      a,a
7a5c 00        nop     
7a5d 7f        ld      a,a
7a5e 00        nop     
7a5f 7f        ld      a,a
7a60 00        nop     
7a61 7f        ld      a,a
7a62 00        nop     
7a63 7f        ld      a,a
7a64 00        nop     
7a65 7f        ld      a,a
7a66 00        nop     
7a67 7f        ld      a,a
7a68 00        nop     
7a69 7f        ld      a,a
7a6a 00        nop     
7a6b 7f        ld      a,a
7a6c 00        nop     
7a6d 7f        ld      a,a
7a6e 00        nop     
7a6f 7f        ld      a,a
7a70 00        nop     
7a71 7f        ld      a,a
7a72 a5        and     l
7a73 a5        and     l
7a74 a5        and     l
7a75 a5        and     l
7a76 a5        and     l
7a77 a5        and     l
7a78 a5        and     l
7a79 a5        and     l
7a7a a5        and     l
7a7b a5        and     l
7a7c a5        and     l
7a7d a5        and     l
7a7e a5        and     l
7a7f a5        and     l
7a80 a5        and     l
7a81 a5        and     l
7a82 00        nop     
7a83 ff        rst     $38
7a84 211001    ld      hl,$0110
7a87 110001    ld      de,$0100
7a8a 01013a    ld      bc,$3a01
7a8d edb0      ldir    
7a8f c30001    jp      $0100
7a92 c3ff80    jp      $80ff
