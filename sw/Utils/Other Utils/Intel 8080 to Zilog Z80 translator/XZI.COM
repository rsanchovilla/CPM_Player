ê   XZI v1 01 May 86 - a Z80 to 8080 translator.  This version by Irv Hoff, heavily based on work previously done by Frank Zerilli in 1984 which was based on XLATE2.   !  9"f1f�;:] � ���?��:^ � ���;���;� �;����������� <2*�2ɛͺ�u͏��z����^�2�2!h[P�*���z�[�r{�h�r��h�� ��3�� �=�\>w� �z�[�C{�h�C��h�"���w�':�/2�~�w:��¡~�;ʞ�¡�2:��½:�½~�aڽ�{ҽ�_w~����	�������� �-x�P��~�*��6;2#�-+�-#6
#6 �*+#"+*������!�:�>!�:��>!�>�*/��&�g�w#wͪ�u�m�;��*+ �n;�  �S���;�þT;��þ!ɛ"/_;
*/^#V#"/�|�ʣ> ���0���{��
�{>
����!ɛ~��"/!�\
*/^#V#"/�|���> ���0�D�»��>;��
û>
�����>;��>��>
���!h[�4	�e!� ̈́
�! ̈́
�8! ̈́
ʈ!<
 ̈́
��!G
 ̈́
�	!\ ̈́
�'!{ ̈́
�@!y
 ̈́
�!f
 ̈́
�!�
 ̈́
��!�
 ̈́
��!� ̈́
�y
*śã*Ǜ ~� ���	����\�;�����'������#åͬ#~�;�~� ��6	����ͬ��t�����;~��å��ͬ):��.=���	��.�&> �(>	���:� �@�	�@> ��~�;�e��#~� �e> ��~�a�e�{�e�_�f~#��������e���\CPL  CMA  CCF  CMC  SCF  STC  HALT HLT  RLA  RAL  RRA  RAR  RLCA RLC  RRCA RRC  DAA  DAA  NOP  NOP  DI   DI   EI   EI    EXX  EXX  LDIR LDIR LDI  LDI  LDDR LDDR LDD  LDD  CPI  CPI  CPIR CPIR CPD  CPD  CPDR CPDR INI  INI  INIR INIR IND  IND  INDR INDR OUTI OUTI OTIR OTIR OUTD OUTD OTDR OTDR NEG  NEG  RLD  RLD  RRD  RRD  RETI RETI RETN RETN IM0  IM0  IM1  IM1  IM2  IM2   DJNZ DJNZ BIT  BIT  SET  SET  RES  RES  RLC  RCL  RL   RL   RRC  RRC  RR   RR   SLA  SLA  SRA  SRA  SRL  SRL  IM   IM    DB   DB   DW   DW   DS   DS   DEFB DB   DEFW DW   DEFS DS   EQU  EQU  DEFL SET  ORG  ORG   OR   ORI  ORA  AND  ANI  ANA  XOR  XRI  XRA  CP   CPI  CMP  SUB  SUI  SUB   ADD  ADI  ADD   ADC  ACI  ADC  SBC  SBI  SBB   EX   XCHG  PUSH PUSH POP  POP   INC  INX  INR  DEC  DCX  DCR   LD   MVI  MOV   IF   IF   ELSE ELSE �ENDIFENDIF�MEND ENDM �ENDM ENDM �IN   IN   �OUT  OUT  !RST  RST  �JP   JMP  xJR   JMP  xCALL CALL �ORG  ORG  �RET  RET  �MACROMACRO ~� �m	�	�m	�����;� ~� ʱ	�:�}	�;ʱ	�	ʱ	������#�J	ͬ��]�:��H	��	#~�:	��â	+�
ʞ	�4
ʞ	�Z
¢	#��	>:#��~���	��	�
��	�4
��	�Z
��	y���	> ����	>:��y���	��	>��>
��>	��ͬ~���;�
�1f��"ś��͍ͬ"Ǜ�<�����#ͬ~�E�2
#~�Q�2
#~�U�����#ͬ~�M�2
#~�A�2
#~�C�2
#~�R�2
#~�O���#ͬ~�D�2
#~�E�2
#~�F�2
#~�L���
 	N#F���~�ʘ
���ͮ
��	Ä
<��G~�ʫ
ͮ
x��	Ú
<������aڹ
�_���
#±
������
>	�� 	A~� ��	�~��#��
�~��~��#��
~��~��#��
x��~��#��
����@F6 ��\p���~� �#�	�> ��#�~��>�,�9#�*+~�)ɷ�~�;�O��O#�@+~� �O�	�O#���g��#�]~�:��+��-��/��*��)��!�~�,�� ��	��;���H ����������g��~#x��gÙ~� ʵ�	�#ì}�o|�g�> bk~#x�������!0�\*śã>22_*+�*/��s#r#"/�> ����
à> ����
à�*Ǜ�"ǛͲ�0�2�����
à�! �*�*Ǜ�"ǛͲ�0�2���g�b�I�)�,�)���,��#͒���P���!O��
��
����
��ã�*Ǜ�"ǛͲ�0�2���g���I�)�,�)��~�_�A���B���C���D���E���H���L��~�(���#�g�+��!�ͮ
���####�g��###>Mw"Ǜ�#~�~�_�A�#~�,#�++�~�_�A�#�g�+�~�_�I���R���~�(�#�I�?+��+��)�+++�~�_�I�#~�_�X�_�Y�_+�#�g�++�~�_�H�#~�_�L�_+�~�(�#�g�)#�g�++++��!�> ͚
��##�g�++��!> ͚
��####�g�++++��*Ǜ�!>
 ͚
! ��!#> ͚
*��! ��g������
��ã�*Ǜ͒���S��"Ǜ���
���
à�*ǛͲ�0͒���P����*ǛͲ�:͒��~�(���2���I���$��ͫʦ#��*����͹�##�gʞ�����!j��
��
���
��ã��!nÏ�,��#���"Ǜ!���
��
���
�à�,#���P���S��~�(��!a��
��
���
>,�����ã�I���g��"Ǜ!s��
�à�H��#��@�)���+�!\��
��
�6 ��\��ã�,��#~�(�UͲ�0�$���)�2��ͫʣ#�g�)��++++F+~###w"Ǜ#p#>Mw�0�*Ǜ~��_�A����@�)���+�!S�'�*Ǜ~��_�A���!W��
��
����
��ã��
*Ǜ�>/��>8��ã�*Ǜ���~�(��#����
���@�)��+6 ��ã~�(�#~�_�C�#~�)�#�g�+++��*Ǜ���~�(�2#�~�,�G�;�t��t#�3+~�)�U#"-�Y"-##��t"Ǜ����
*-6 ��\à����*Ǜ�x���2�������6��̈́�����
��
à�*ǛÈ�*Ǜ����]��͟�����
à�!e��
��ã#�*ś~����\�_�R��
��ã~�_�Z��C��P��M��~M#~�,�+�~�_�Z�*�C�*�P�*�M�*�~M#�}�+�~�_�N�~L#~�_�Z�Q�C�Q+�~2M#~�,�++�~�_�N�~L#~�_�Z�x�C�x+�~2M#�}�++�~�_�P�~L#~�_�E�Q�O�Q+�~�_�P�~L#~�_�E�x�O�x+�!\ 3	 ��~� ���?�� ��!\ x	 ��:l ���2x:m � � y!m ��:��>M2<>A2=>C2>:u � �+ �!u ���;!3�J�;!x�J;�~��R:*�@��>:��#�i>.��~#� ���i�3� ��ʉ!h["�����Mx� ����x� ��ʽx� >�2�[!�["Û���M�;����x� Ü�;*f������2*Ûw��
�
�
�	�:=���	�>�:<2#:�[=� >�2�[|���T}���T�[�� ��x�f� �z���2{���2!�["Û�����~����#�\�� ��1�M>��:�[���u�[*Û|�}�x� �� ��x�f� �:ě�:Û�Ò����þ����_� ������ �������Y�� ��� �þ�������* %�͹���'�,��,d �,
 �,}�0��/�͹�.x�0�?��0��'�b��bd �b
 �b}�0��/�͹�dx�0�u��0��:1=21�>.��>d21:2=22 > ��>
22:3=23���>223�

XZI translates Zilog Z80 assembly language source
code into Intel 8080 assembly language source code.
It is invoked by a command of the form:

    XZI B:Z80FILE.TYP B:8080FILE.TYP

All parameters are optional - if omitted, the 
following values are assumed:

    Z80 source filetype     - .Z80   (or .MAC)
    8080 output filetype    - .ASM
    8080 output filename    - same as source filename
    Drive                   - current drive



    Byte 0103H - 00 Defaults to .Z80 extent, FF to .MAC [more]  

Examples:

XZI PRGM1                (translates PRGM1.Z80 to PRGM1.ASM)
XZI PRGM1 PRGM2          (translates PRGM1.Z80 to PRGM2.ASM)
XZI PRGM1.MAC PRGM2.TXT  (translates PRGM1.MAC to PRGM2.TXT)

XZI also has the following feature:

  A dot '.' is displayed for each 100 lines processed. 
++ Aborting to CP/M ++
 (BC)B (DE)D   
 DE,HLXCHG  (SP),HLXTHL  #           Z80                     
*** Job cancelled ***
  lines processed
 
Ran out of memory for table of line numbers of intrinsic Z80 opcodes
 (HL)No directory space
 No source file found
 Output file exists, delete it and continue? (Y/N)  Output file write error
    DAD LDA LDAX LHLD LXI PCHL STA SHLD SPHL          ASM                     
Z80 source file:       8080 output file:   STAX  BCB   DED   HLH   SPSP  AFPSW  
XZI v1 - translates Z80 to 8080 source code
   ;
;
;
;
; Line numbers containing untranslated opcodes:
;
;  

Line numbers containing untranslated opcodes:

  
The following operands have been used in your source and have not
been fully translated.  You must complete the translation using an editor.

      ɛd
2                                                                            