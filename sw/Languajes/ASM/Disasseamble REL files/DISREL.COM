!  9"�51�5�
�.Rel File Disassembler 10/8/84$�	� �
�XPierre Schwob - PRS Corp.  NY$�	� �
͂Based on RELDUMP by R. Fowler$�	� �
�
͚- Pass 1$�	� �
ͺEntry-Point search:$�	� �
�
:e � ��!RE"e >L2g �2| 2h \ � ��� ��	File not found.$�2j52k52l52m52n52o52p52q52s52t52u52v52w52x52y52r5>�2z5�M��͜�6��	
done.$�L��e!y56 �L��	��>�2y5�L����*n5##"n5��L2p5�L2q5:w5���*{5:s5w##:q5w+�
:p5w##"{5�
ͷ $�	� ��:w5����2w5*p5"n5���L2v5���2w5�����2w5:v5�7���H�M:v5��E��=========== ($�	� ��	�&)$�	� �
�
:s5<2s5!  "n5��q���	��U���L�}:v5��l�f     $�	� �L_W>�W*{5{�ʨ�L�:v5����5
:w5�ʟ��z�w#�5
�z:v5�����  <--- Program name$�	� �
:w5��6 #��"{5�2w5�
�\ � �2| 2h 2j52k52l52m52n52o52p52q52s52t52u52v52w52x52y5<2r5>�2z5*{5+"}5�
�C- Pass 2$�	� �
�\Disassembly:$�	� �
\ � ����	File not found.$ͮڑ͜҅��	
done.$� ��� �7�?��L�°ͼ!y5~6 ���:x5����
�
�2j52k5:m5����;$�	� �
�2m5��ABS:$�	� �2x5�L�:j5� �i:k5���7���+���C���O�[���
�Ͳä���
�͏ä���
���ä���
���ä:j5=2j5��
ä:m5҂�u;$�	� �
�2m5͇	$�	� ��	͕	$�	� ���
���:j5� �
���
�
>�2y5��REL: type $�	� �L��
��x=�=���, com rel, val=$�	� �6�, prg rel, val=$�	� �6�0, dat rel, val=$�	� �*n5##"n5��L2p5��L2q5�
��
> �5
��:w5��t�2w5*p5"n5ͼ���͒, (special), ctrl fld=$�	� �L2v5�¨2w5��
Ͳ, $�	� �o& )N
^#V	� :v5�7���
��     $�	� ���k�p:v5��h��
�
͋	�
�%================================$�	� �O================================$�	� :s5<2s5!  "n5��q���	��*��̀a fld type: $�	� �L��
͕, $�	� ��=��=����(common rel) value= $�	� �@��(data   rel) value= $�	� �@�(prog   rel) value= $�	� �@�!(absolute) value= $�	� �@�L_>"�5
{��F�L�5
�5>"�5
��կ�Z�O����G:t5��q=2t5:u52u5x���:z5��̐o& <2z5� ~2u5>2t5��\ � ��> ���	??? Unexpected end of file.$����!�5:s5Oy��� �*}5��R���Æ	�#:n5���#:o5����6�###�:y5��	�
�
	:j5����
�	;$�	� �
�4	;		**** ENTRY POINT: $�	� ��	�B	 $�	� �~�5
#�K	�]	 ****$�	� �
�k	;$�	� :y5��{	�
�2m52j5=2x5�����!�5:s5��̧	� �*}5��R�Ҏ	��6�ͯ	($�	� �##~�
+~�
##���	 $�	� �~�5
#��	��	)$�	� �
��	� *�5���*n5#"n5����*n5|�
}�
���>�A
>
�A
���	��&
���
�/
��0�5
�� �<
>.��:
���_� ����n
�
�
�
�
�
+Fa|����*      entry symbol      *$*      sel com blk       *$*      program name      *$* request library search *$*   extension link item  *$*       common size      *$*      chain external    *$*    define entry point  *$*    external - offset   *$*    external + offset   *$*    define data size    *$*     set loc counter    *$*      chain address     *$*      program size      *$*       end program      *$*       end of file      *$����2l5`o& )^#V2j5���H���H���H���S2k5>2j5�n�{	� :l5���s���s��s�����>�2m5�n����̈́	$�	� ����������o& )�{^#V	� �2j52k5����������"o& )�{^#V2j5	� �2k5���������5'o& )�{^#V2j5	� �2k5���������k/o& )�{^#V2j5	� �2k5����� NOP$LXI  B,$ STAX  B$ INX  B$ INR  B$ DCR  B$MVI  B,$ RLC$ ex af,af'$ DAD  B$ LDAX  B$ DCX  B$ INR  C$ DCR  C$MVI  C,$ RRC$djnz  $LXI  D,$ STAX  D$ INX  D$ INR  D$ DCR  D$MVI  D,$ RAL$jr  $ DAD  D$ LDAX  D$ DCX  D$ INR  E$ DCR  E$MVI  E,$ RAR$jrnz  $LXI  H,$SHLD  $ INX  H$ INR  H$ DCR  H$MVI  H,$ DAA$jrz  $ DAD  H$LHLD  $ DCX  H$ INR  L$ DCR  L$MVI  L,$ CMA$jrnc  $LXI  SP,$STA  $ INX  SP$ INR  M$ DCR  M$MVI  M,$ STC$jrc  $ DAD  SP$LDA  $ DCX  SP$ INR  A$ DCR  A$MVI  A,$ CMC$ MOV  B,B$ MOV  B,C$ MOV  B,D$ MOV  B,E$ MOV  B,H$ MOV  B,L$ MOV  B,M$ MOV  B,A$ MOV  C,B$ MOV  C,C$ MOV  C,D$ MOV  C,E$ MOV  C,H$ MOV  C,L$ MOV  C,M$ MOV  C,A$ MOV  D,B$ MOV  D,C$ MOV  D,D$ MOV  D,E$ MOV  D,H$ MOV  D,L$ MOV  D,M$ MOV  D,A$ MOV  E,B$ MOV  E,C$ MOV  E,D$ MOV  E,E$ MOV  E,H$ MOV  E,L$ MOV  E,M$ MOV  E,A$ MOV  H,B$ MOV  H,C$ MOV  H,D$ MOV  H,E$ MOV  H,H$ MOV  H,L$ MOV  H,M$ MOV  H,A$ MOV  L,B$ MOV  L,C$ MOV  L,D$ MOV  L,E$ MOV  L,H$ MOV  L,L$ MOV  L,M$ MOV  L,A$ MOV  M,B$ MOV  M,C$ MOV  M,D$ MOV  M,E$ MOV  M,H$ MOV  M,L$ HLT$ MOV  M,A$ MOV  A,B$ MOV  A,C$ MOV  A,D$ MOV  A,E$ MOV  A,H$ MOV  A,L$ MOV  A,M$ MOV  A,A$ ADD  B$ ADD  C$ ADD  D$ ADD  E$ ADD  H$ ADD  L$ ADD  M$ ADD  A$ ADC  B$ ADC  C$ ADC  D$ ADC  E$ ADC  H$ ADC  L$ ADC  M$ ADC  A$ SUB  B$ SUB  C$ SUB  D$ SUB  E$ SUB  H$ SUB  L$ SUB  M$ SUB  A$ SBB  B$ SBB  C$ SBB  D$ SBB  E$ SBB  H$ SBB  L$ SBB  M$ SBB  A$ ANA  B$ ANA  C$ ANA  D$ ANA  E$ ANA  H$ ANA  L$ ANA  M$ ANA  A$ XRA  B$ XRA  C$ XRA  D$ XRA  E$ XRA  H$ XRA  L$ XRA  M$ XRA  A$ ORA  B$ ORA  C$ ORA  D$ ORA  E$ ORA  H$ ORA  L$ ORA  M$ ORA  A$ CMP  B$ CMP  C$ CMP  D$ CMP  E$ CMP  H$ CMP  L$ CMP  M$ CMP  A$ RNZ$ POP  B$JNZ  $JMP  $CNZ  $ PUSH  B$ADI  $ RST  0$ RZ$ RET$JZ  $�(bit/opr) $CZ  $CALL  $ACI  $ RST  1$ RNC$ POP  D$JNC  $OUT  $CNC  $ PUSH  D$SUI  $ RST  2$ RC$ exx$JC  $IN  $CC  $�???-(ix+dis) $SBI  $ RST  3$ RPO$ POP  H$JPO  $ XTHL$CPO  $ PUSH  H$ANI  $ RST  4$ RPE$ PCHL$JPE  $ XCHG$CPE  $�???-(z80) $XRI  $ RST  5$ RP$ POP  PSW$JP  $ DI$CP  $ PUSH  PSW$ORI  $ RST  6$ RM$ SPHL$JM  $ EI$CM  $�???-(iy+dis) $CPI  $ RST  7$ ???$!&/8@HPY^iqz�����������������%.6>FNW\cks{����������������	!+5?IS]gq{�������������%/9CMWaku������������)38BLV`jt~���������������
"*2:BJRZbjrz����������������
"*2:BJRZbjrz������������������	&/6>BGMSYhow|������������������"&,26<KRrlc b$rlc c$rlc d$rlc e$rlc h$rlc l$rlc (hl)$rlc a$rrc b$rrc c$rrc d$rrc e$rrc h$rrc l$rrc (hl)$rrc a$rl b$rl c$rl d$rl e$rl h$rl l$rl (hl)$rl a$rr b$rr c$rr d$rr e$rr h$rr l$rr (hl)$rr a$sla b$sla c$sla d$sla e$sla h$sla l$sla (hl)$sla a$sra b$sra c$sra d$sra e$sra h$sra l$sra (hl)$sra a$srl b$srl c$srl d$srl e$srl h$srl l$srl (hl)$srl a$bit 0,b$bit 0,c$bit 0,d$bit 0,e$bit 0,h$bit 0,l$bit 0,(hl)$bit 0,a$bit 1,b$bit 1,c$bit 1,d$bit 1,e$bit 1,h$bit 1,l$bit 1,(hl)$bit 1,a$bit 2,b$bit 2,c$bit 2,d$bit 2,e$bit 2,h$bit 2,l$bit 2,(hl)$bit 2,a$bit 3,b$bit 3,c$bit 3,d$bit 3,e$bit 3,h$bit 3,l$bit 3,(hl)$bit 3,a$bit 4,b$bit 4,c$bit 4,d$bit 4,e$bit 4,h$bit 4,l$bit 4,(hl)$bit 4,a$bit 5,b$bit 5,c$bit 5,d$bit 5,e$bit 5,h$bit 5,l$bit 5,(hl)$bit 5,a$bit 6,b$bit 6,c$bit 6,d$bit 6,e$bit 6,h$bit 6,l$bit 6,(hl)$bit 6,a$bit 7,b$bit 7,c$bit 7,d$bit 7,e$bit 7,h$bit 7,l$bit 7,(hl)$bit 7,a$res 0,b$res 0,c$res 0,d$res 0,e$res 0,h$res 0,l$res 0,(hl)$res 0,a$res 1,b$res 1,c$res 1,d$res 1,e$res 1,h$res 1,l$res 1,(hl)$res 1,a$res 2,b$res 2,c$res 2,d$res 2,e$res 2,h$res 2,l$res 2,(hl)$res 2,a$res 3,b$res 3,c$res 3,d$res 3,e$res 3,h$res 3,l$res 3,(hl)$res 3,a$res 4,b$res 4,c$res 4,d$res 4,e$res 4,h$res 4,l$res 4,(hl)$res 4,a$res 5,b$res 5,c$res 5,d$res 5,e$res 5,h$res 5,l$res 5,(hl)$res 5,a$res 6,b$res 6,c$res 6,d$res 6,e$res 6,h$res 6,l$res 6,(hl)$res 6,a$res 7,b$res 7,c$res 7,d$res 7,e$res 7,h$res 7,l$res 7,(hl)$res 7,a$set 0,b$set 0,c$set 0,d$set 0,e$set 0,h$set 0,l$set 0,(hl)$set 0,a$set 1,b$set 1,c$set 1,d$set 1,e$set 1,h$set 1,l$set 1,(hl)$set 1,a$set 2,b$set 2,c$set 2,d$set 2,e$set 2,h$set 2,l$set 2,(hl)$set 2,a$set 3,b$set 3,c$set 3,d$set 3,e$set 3,h$set 3,l$set 3,(hl)$set 3,a$set 4,b$set 4,c$set 4,d$set 4,e$set 4,h$set 4,l$set 4,(hl)$set 4,a$set 5,b$set 5,c$set 5,d$set 5,e$set 5,h$set 5,l$set 5,(hl)$set 5,a$set 6,b$set 6,c$set 6,d$set 6,e$set 6,h$set 6,l$set 6,(hl)$set 6,a$set 7,b$set 7,c$set 7,d$set 7,e$set 7,h$set 7,l$set 7,(hl)$set 7,a$`flrx~��������������������� 
"(.4:@IOU[agms|ZZZZZZZZ�����������������  (3;CKS[ckv~���������������$,4?GOW_gow���������������� (08@KS[cks{���������������	$,4<DLW_gow��������������� (08@HPXcks{���������������	!,4<DLT\dow�������������� in b,(c)$ out (c),b$ sbc hl,bc$ld (addr),bc $ neg$ retn$ im 0$ ld i,a$ in c,(c)$ out (c),c$ adc hl,bc$ld bc,(addr) $ reti$ ld r,a$ in d,(c)$ out (c),d$ sbc hl,de$ld (addr),de $ im 1$ ld a,i$ in e,(c)$ out (c),e$ adc hl,de$ld de,(addr) $ im 2$ ld a,r$ in h,(c)$ out (c),h$ sbc hl,hl$ld (addr),hl $ rrd$ in l,(c)$ out (c),l$ adc hl,hl$ld hl,(addr) $ rld$ sbc hl,sp$ld (addr),sp $ in a,(c)$ out (c),a$ld sp,(addr) $ ldi$ cpi$ ini$ outi$ ldd$ cpd$ ind$ outd$ ldir$ cpir$ inir$ otir$ lddr$ cpdr$ indr$ otdr$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ� !!!,!1!7!=!E!O!Z!e!Zt!Zz!�!�!�!�!ZZ�!�!�!�!�!�!ZZ�!�!�!"""ZZZ+"0":"E"P"ZZZ_"ZZd"o"ZZZZ~"�"Z�"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ�"�"�"�"ZZZZ�"�"�"�"ZZZZ�"�"�"�"ZZZZ�"�"�"�"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ add ix,bc$ add ix,de$ld ix,dddd $ld (addr),ix $ inx ix$ add ix,ix$ld ix,(addr) $ dec ix$inc (ix+dis) $dec (ix+dis) $ld (ix+dis),dd $ add ix,sp$ld b,(ix+dis) $ld c,(ix+dis) $ld d,(ix+dis) $ld e,(ix+dis) $ld h,(ix+dis) $ld l,(ix+dis) $ld (ix+dis),b $ld (ix+dis),c $ld (ix+dis),d $ld (ix+dis),e $ld (ix+dis),h $ld (ix+dis),l $ld (ix+dis),a $ld a,(ix+dis) $add a,(ix+dis) $adc a,(ix+dis) $sub (ix+dis) $sbc a,(ix+dis) $and (ix+dis) $xor (ix+dis) $or (ix+dis) $cp (ix+dis) $[bit opr - (ix+dis)] $ pop ix$ ex (sp),ix$ push ix$ jp (ix)$ ld sp,ix$ZZZZZZZZZ�$ZZZZZZZZZZZZZZZ%ZZZZZZZ%%.%ZZZZZ6%A%P%ZZZZZZZZX%g%v%ZZ�%ZZZZZZZZZZZZ�%ZZZZZZZ�%ZZZZZZZ�%ZZZZZZZ�%ZZZZZZZ�%ZZZZZZZ�%Z�%&&"&2&B&ZR&ZZZZZZb&ZZZZZZZr&ZZZZZZZ�&ZZZZZZZ�&ZZZZZZZ�&ZZZZZZZ�&ZZZZZZZ�&ZZZZZZZ�&ZZZZZZZ�&ZZZZZZZZZZZZ�&ZZZZZZZZZZZZZZZZZZZZZ'Z'Z'ZZZ"'ZZZZZZZZZZZZZZZ+'ZZZZZZrlc (ix+dis) $rrc (ix+dis) $rl (ix+dis) $rr (ix+dis) $sla (ix+dis) $sra (ix+dis) $srl (ix+dis) $bit 0,(ix+dis) $bit 1,(ix+dis) $bit 2,(ix+dis) $bit 3,(ix+dis) $bit 4,(ix+dis) $bit 5,(ix+dis) $bit 6,(ix+dis) $bit 7,(ix+dis) $res 0,(ix+dis) $res 1,(ix+dis) $res 2,(ix+dis) $res 3,(ix+dis) $res 4,(ix+dis) $res 5,(ix+dis) $res 6,(ix+dis) $res 7,(ix+dis) $set 0,(ix+dis) $set 1,(ix+dis) $set 2,(ix+dis) $set 3,(ix+dis) $set 4,(ix+dis) $set 5,(ix+dis) $set 6,(ix+dis) $set 7,(ix+dis) $ZZZZZZ5)ZZZZZZZD)ZZZZZZZS)ZZZZZZZa)ZZZZZZZo)ZZZZZZZ~)ZZZZZZZZZZZZZZZ�)ZZZZZZZ�)ZZZZZZZ�)ZZZZZZZ�)ZZZZZZZ�)ZZZZZZZ�)ZZZZZZZ�)ZZZZZZZ*ZZZZZZZ*ZZZZZZZ$*ZZZZZZZ5*ZZZZZZZF*ZZZZZZZW*ZZZZZZZh*ZZZZZZZy*ZZZZZZZ�*ZZZZZZZ�*ZZZZZZZ�*ZZZZZZZ�*ZZZZZZZ�*ZZZZZZZ�*ZZZZZZZ�*ZZZZZZZ+ZZZZZZZ+ZZZZZZZ#+Z add iy,bc$ add iy,de$ld iy,dddd $ld (addr),iy $ inx iy$ add iy,iy$ld iy,(addr) $ dec iy$inc (iy+dis)$dec (iy+dis)$ld (iy+dis),dd $ add iy,sp$ld b,(iy+dis) $ld c,(iy+dis) $ld d,(iy+dis) $ld e,(iy+dis) $ld h,(iy+dis) $ld l,(iy+dis) $ld (iy+dis),b $ld (iy+dis),c $ld (iy+dis),d $ld (iy+dis),e $ld (iy+dis),h $ld (iy+dis),l $ld (iy+dis),a $ld a,(iy+dis) $add a,(iy+dis) $adc a,(iy+dis) $sub (iy+dis) $sbc a,(iy+dis) $and (iy+dis) $xor (iy+dis) $or (iy+dis) $cp (iy+dis) $[bit opr - (iy+dis)] $ pop iy$ ex (sp),iy$ push iy$ jp (iy)$ ld sp,iy$ZZZZZZZZZ4-ZZZZZZZZZZZZZZZ?-ZZZZZZZJ-W-f-ZZZZZn-y-�-ZZZZZZZZ�-�-�-ZZ�-ZZZZZZZZZZZZ�-ZZZZZZZ�-ZZZZZZZ�-ZZZZZZZ�-ZZZZZZZ.ZZZZZZZ.Z(.8.H.X.h.x.Z�.ZZZZZZ�.ZZZZZZZ�.ZZZZZZZ�.ZZZZZZZ�.ZZZZZZZ�.ZZZZZZZ�.ZZZZZZZ�.ZZZZZZZ/ZZZZZZZ/ZZZZZZZZZZZZ$/ZZZZZZZZZZZZZZZZZZZZZ;/ZC/ZO/ZZZX/ZZZZZZZZZZZZZZZa/ZZZZZZrlc (iy+dis) $rrc (iy+dis) $rl (iy+dis) $rr (iy+dis) $sla (iy+dis) $sra (iy+dis) $srl (iy+dis) $bit 0,(iy+dis) $bit 1,(iy+dis) $bit 2,(iy+dis) $bit 3,(iy+dis) $bit 4,(iy+dis) $bit 5,(iy+dis) $bit 6,(iy+dis) $bit 7,(iy+dis) $res 0,(iy+dis) $res 1,(iy+dis) $res 2,(iy+dis) $res 3,(iy+dis) $res 4,(iy+dis) $res 5,(iy+dis) $res 6,(iy+dis) $res 7,(iy+dis) $set 0,(iy+dis) $set 1,(iy+dis) $set 2,(iy+dis) $set 3,(iy+dis) $set 4,(iy+dis) $set 5,(iy+dis) $set 6,(iy+dis) $set 7,(iy+dis) $ZZZZZZk1ZZZZZZZz1ZZZZZZZ�1ZZZZZZZ�1ZZZZZZZ�1ZZZZZZZ�1ZZZZZZZZZZZZZZZ�1ZZZZZZZ�1ZZZZZZZ�1ZZZZZZZ�1ZZZZZZZ2ZZZZZZZ2ZZZZZZZ'2ZZZZZZZ82ZZZZZZZI2ZZZZZZZZ2ZZZZZZZk2ZZZZZZZ|2ZZZZZZZ�2ZZZZZZZ�2ZZZZZZZ�2ZZZZZZZ�2ZZZZZZZ�2ZZZZZZZ�2ZZZZZZZ�2ZZZZZZZ3ZZZZZZZ3ZZZZZZZ&3ZZZZZZZ73ZZZZZZZH3ZZZZZZZY3Z                ��5�5 ZZZk2ZZZZZZZ|2ZZZZZZZ�2ZZZZZ                                                                              