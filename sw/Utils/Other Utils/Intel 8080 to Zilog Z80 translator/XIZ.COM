ë   XIZ v1 01 May 86 - an 8080 to Z80 translator.  This version by Irv Hoff, heavily based on work previously done by Frank Zerilli in 1984 which was based on XLATE2.   !  9"D1DI�:] � ���?��:^ � �����T�� ��T��� ��k��� <2�q�,�i:��!�����e�A��b�22C!RWP�*�W�z���z{���z���W�� ��H�� �=�d>w� �z���K{���K���W�"�W�w�':/2~�w:�©~�;ʦ�©�2C:���:C���~�a���{���_w~����	����"���� �5x�P��~�*��6;2C#�5+�5#6
#6 �*i#"i*�W����!�:C�>!�:�>!�>�͓y�E�W�l��N*i ��w��  �W���@���]��"!RW����!, �$
��!U �$
�v!� �$
�:
!�
 �$
�! �$
��!; �$
�:
!
 �$
��
!e
 �$
�!� �$
ʾ!�
 �$
��
!b	
 �$
�!:!�	��!�	
 �$
��
*F�*M ~� �]�	�]����;�x��E�'�>�>�#�͖
#~�;ʀ~� �W6	���n�͖
������E�;~�x����>͖
):?�Ң=���	�ʢښ> Ü>	�Â:� ʴ�	ʴ> �~�;���#~� ��> �~�a���{���_��~#��I���������~� �(�	�(�����;� ~�:�8�	�k��k�;�k� �k���#�͖
��m
�:��ã#~�:�F��\+���Y���Y��\�}>:#�~�ʨÐ���}���}�y�ڣ> �è>:�y�ڣʨ>�>
�>	�͖
~���;½̀1D��"FH�w
͖
"M�<�����#͖
~�E��#~�Q��#~�U�����#͖
~�M��#~�A��#~�C��#~�R��#~�O���#͖
~�S��#~�E��#~�T��CC   CNC  CZ   CNZ  CP   CM   CPE  CPO   REQ  RNE  RLT  RGE  CEQ  CNE  CLT  CGE  JEQ  JNE  JLT  JGE   ELSE ELSE SENDIFENDIFSENDM ENDM SIF   IF   [IFC  IF   ;ICL  *INCLCLST  LIST KMACROMACRO[ ACI  ADC  ADI  ADD  SBI  SBC   JC   JNC  JZ   JNZ  JP   JM   JPE  JPO   ADC  ADC  �ADD  ADD  �DAD  ADD  �IN   IN   LDA  LD   LDAX LD   LHLD LD   9MOV  LD   MOUT  OUT  �RST  RST  �SBB  SBC  �SHLD LD   �SPHL LD   �STA  LD   �STAX LD   �XCHG EX   �XTHL EX   �PCHL JP   � ANI  AND  CALL CALL CPI  CP   JMP  JP   ORG  ORG  ORI  OR   SUI  SUB  XRI  XOR   ANA  AND  CMP  CP   DCR  DEC  INR  INC  MVI  LD   ORA  OR   SUB  SUB  XRA  XOR   RC   RNC  RZ   RNZ  RP   RM   RPE  RPO   RET  RET  CMA  CPL  CMC  CCF  HLT  HALT RAL  RLA  RAR  RRA  RLC  RLCA RRC  RRCA STC  SCF  DAA  DAA  NOP  NOP  DI   DI   EI   EI    DCX  DEC  INX  INC  LXI  LD   POP  POP  PUSH PUSH  DB   DEFB DS   DEFS DW   DEFW EQU  EQU  SET  DEFL  DB   DB   DS   DS   DW   DW   EQU  EQU  SET  DEFL  ENT  ENTRYNAM  NAME RAM  DATA ROG  REL   ~��8
�H��
��	�$
<��
 	N#F����M
>	� 	A~� ��	�~�#�R
�~���#�c
�ͨ
��#�m
H �����
����ͨ
��~#x�ʨ
Ã
~� ʤ
�	ʤ
�:�#Ö
~�	�� ��,��;����:��+��-��/��*��)�������a��
�_���
#��
����> bk~#x���
��E
��M
��E
*M~�M��m�#�!������E
*M�5���c
��~�_�B�M�D�R�H�W�P�\��#��#��#�#~�_�S�t#~�_�W�s�#�++�:I!/�Eʴ!1�Nʴ!3�Lʴ!5�Gʴ!7�eʴ!9�nʴ!;�lʴ!=~2I#~2J�!����!���!���>,���E
:I�:J� ���E
!�����E
!����$�E
!����E
!��?�E
*M~�_�B�-�D�3�!���!����E
!����>)���E
*M~�M�^�m�o�!����#~�#�
��f�E
��!�þ�E
!����E
!����E
>(���!�þ�E
!����E
>(���!������E
*M~�_�B���D���!��!�c
*M#��E
!����E
!����*M~�;�����#�+~� ��	�#�*Mz��3{��~�#�+>	2E�f>	2W�f>	2l�f> ���
> ��E
��E
>2y�!\ H	 ��
~� ʎ�?ʎ ��
!\ �	 ��
:l �ʤ2�:m � ʸ �!m ��
:���>M2�>A2�>C2�:u � �� �!u ��
�!H�2�!��@��~��	:�@�#>:�##� >.�#~#� �#� �H� ���B>�!��"�W���Q         ASM                     �� ��¾�� ��ʗ�� >�2Q!R"O���Q         Z80                     ���2���� �vA�*D��~���#��~� ���	�> �#��>�>
�����2*O��>!w��2�
�2�	�7:?=���	�;>�;:?<2?#:Q=�H>�2Q|�W�|}�R�|R�� ���̈́� �z�W�Z{�R�Z!R"O������� ���Q>�:Q��R*O|�¸}�¸�� �� ���̈́� �:P�¸:O�¸ð'�����d ��
 ��}�0�#/����x�0���0�#���#�}�o|�g�����_� ������ ��N��_�Y�� ��� �@��N�T��a��{��_�:k=2k�>.�#>d2k:D=2D> �#>
2D:�=2���N>22��

XIZ translates Intel 8080 assembly language source
code into Zilog Z80 assembly language source code.
It is invoked by a command of the form:

    XIZ B:8080FILE.TYP B:Z80FILE.TYP

All parameters are optional - if omitted, the
following values are assumed:

    8080 source filetype    - ASM
    Z80  output filetype    - Z80
    Z80  output file name   - same as source file-name
    Drive                   - current drive


    Byte 0103H  - 00 defaults to .Z80 extent, FF to .MAC
    Byte 0104h  - 00 does not print .Z80 and ASEG for MAC
    Byte 0105H  - 00 normal Zilog DEFB, etc., FF to DB, etc. [more] 

Examples:

XIZ PRGM1                 (translates PRGM1.ASM to PRGM1.Z80)
XIZ PRGM1 PRGM2           (translates PRGM1.ASM to PRGM2.Z80)
XIZ PRGM1.TXT PRGM2.MAC   (translates PRGM1.TXT to PRGM2.MAC)

XIZ also has the following feature:

  A dot '.' is displayed for each 100 lines processed. 
++ Aborting to CP/M ++
 
*** Job cancelled ***
  lines processed
 

	.Z80
	ASEG

 No directory space
 No source file found
 Output file exists, delete it and continue? (Y/N)  Output file write error
 
8080 source file:       Z80 output file:   
XIZ v1 - translates 8080 to Z80 source code
  
The following operands have been used in your source and have not
been fully translated.  You must complete the translation using an editor.
	original:		must be translated to:
 Z NZC NCz nzc nc
  
 #ENDIF			ENDIF
  ICL			*INCLUDE
   d LST  <operands>		LIST  <valid ASMB operands>
 2CALL  JP    RET   A,( ),A ),HL DE,HL (SP),HL HL,( A,(BC) A,(DE) 8* A, AF BC ,A DE HL HL, (HL) SP,HL (BC),A (DE),A                                                                                                                  