      ���n>2 ��F\B ��
4
:LN 
sA����l�hHelp    L	Dir     u	Drive   �	User    �	Run     �	Search  �	Rename  #
Erase   F
Type    h
Print   �
Make    �
Quit    �
        �
        �
        �
        �
        �
        �
        �
        �
        �
        �
        �
        �
        �
 48       VISUAL COMMAND PROCESSOR Return Selects and executes.     Comma  Selects. Space  Moves to next item. Arrow  Keys move up,dwn,left,light. Ctrl-C Move between file window and command window. Ctrl-D Display help text. Ctrl-Q Deselect all files. The following commands are built in,  other 9 commands can be added in the VCCP.CFG file          Help,Dir,Drive,User,Run,Search          Rename,Erase,Type,Print,Make,Quit      << Press any key to continue.>> �( DIRECTORY COMMAND    This command allows you to      change the drive and user.      << Press any key to continue.>>  
- RUN COMMAND  This command allows you to run a file.      << Press any key to continue.>> 0@�
-	 SEARCH COMMAND    This command allows you to     change the directory search string    There by allowing you to display     a subset of the directory      << Press any key to continue.>> Pa# RENAME COMMAND    This command allows you to      rename one or more files. << Press any key to continue.>> `�# ERASE COMMAND    This command allows you to      erase one or more files. << Press any key to continue.>> pM# TYPE COMMAND    This command allows you to      type one or more files. << Press any key to continue.>> ��# PRINT COMMAND    This command allows you to      print one or more files. << Press any key to continue.>> �5$ MAKE COMMAND    This command allows you to      make an empty file. << Press any key to continue.>> ��& QUIT COMMAND    This command exits the vccp. << Press any key to continue.>> ��& DRIVE    Select a drive      from A,B,C,D,E(Memory disk)    << Press any key to continue.>> �  &   USER    Select a user (from 0 to 15)   << Press any key to continue.>> Command: Help, display command help text Command: Dir, change the drive and user Command: Drive, change the drive Command: User, change the user Command: Run, a file  Command: Search, change directory search string Command: Rename, one or more files Command: Erase, one or more files Command: Type, one or more files Command: Print, one or more files Command: Make, a file Command: Quit, VCCP Added Command [P1A [P1B [ [6n [2J [7m [0m [0J [1D A:          B:          C:          D:          E:          0:       1:       2:       3:       4:       5:       6:       7:       8:       9:       10:      11:      12:      13:      14:      15:      !�!�� ���1�S�  * �!#s#r#x�(��##�!ls#r��� � �J�
 � � � � � � � �" �% �( �+ �.  �k�ʕ�G:I�x�(�(���y�>��� !�
�,  2�!)�!� :=O�"!�!�
�!�

�!�
�!�!����!�
�,{���;�"�z��H�"\<��
0��
_x��{�0O��"�����!�
� ���_��W���������0�(G��
�W����0�=������,�����N�����"�#����ͣ!"O!�"a͋���j�!�"�ͷ7���ͣ!"O!�"a����ͣ8���&*��j�!�"�ͺͨ��
	��q� ����q� 8���.�q� ���������!�����������    
o
g�V+���R"�
<<2�
<<���2��P ͐���ůw#��� ����   ͋!~͐!�"S>�2�*�:�2#�r�S$:�O �~!#5(	*$P �>�2���*�EL��� ���R @��        =!5Select a Command                VCCP V1.0A >!> 2*��[��&�S��[��@�S��[��@�[���	���&:���*� �}�(G�|�(	G�������&!��,########�:��j=�=(�j���j�:����	��j����|& �(G�� ������̈́��!O ����̈́���������>���>��� �� ��      .N��������������   ��  � ������� ��  ��    ���������m�!Y]  ��� �A2����(	����:CG:O�n� ! 0�g�1ڕ�:ҕ:C�0�2~�0#�g��:G>̈́ #���	�= �Õ~��#�!\���_x�( ������O~��(�(#����8͞�L!�L���L� ���2I͞�2��m�!�2���:U!C�0<+##= �^#V��!\G:_ �ò   �G2�:Q�ʪx2U��S��_:Q�ʪ��ͫ�~ !<�(#�(*#�(&#�(!#�(#�(�,(����O:��yʯ�(����*PD|=&�$�0�:U <� 1�. 
O�y %x=! �0\�'�8(�'�'�8 �2U��S��_�O�[R *S:QGyJ�(	�:U�y�����*����'O! 0Fx�y(#�(��(:I(��y�(���k����  O:PGy�8���(
G:RO���W�����:Pg:Ro {�(�� �Oz�(=�0�y����� 8���	 L�����͞�kä�:UG:R*S�qG͆��ĕ##��N����"���#�� �2�� ͫ�y�:�� �^#V+���,�:���Oë  ��*L|eo�ͫ��ɯ _�KPx��*S���:RG�͆##�W� :PO �  ë2 0��� ���� � ��>2�ʕ!�/w #T]~�	(#� (�
(�(�; �h(~� ���(�h �� � #x��* |�g. ��m###���a��{�� �   > !\ $6 #�!] "�2�����~�*(
�.(���#~�.(���x�0H#� *����:���A~�*����~:RO��  �> �>.�'(A> ������'��~�.�˿�a8�{0� #�����+� #�����          �� VCCP    CFG        >p2�͑����K:�� !� ��� ��>2��:�� Pͷ!���S�ͫ~��8�	�m�d�[�� ��
 ���U��#�����B}��� ��S�>2���2��[��:��(�:��(�:�W�2��:�W�"�!�>͖>��(	�,(� §ͷ*��!>͖>��(�ç:��ʧÕ:�<�(2�ɯ�O���"���:��/<G> �S�ͫ�d�[����2����2�2�2����> ͏���������ʧ�*"8U\*":{2��2�z�2��z�          Press return or space for next page: Press any key to quit: >�2�͑�C�ʧ!�>͖���§�!� ~�(]�	(BO��%��(�
(
�U#�ѯ2�����(���~��§���(��~��(�ç�:��/<G �%���2���%çPress any key to quit: �2U<!i͖��͗:UG���!��:UG:#�q!�L×!�0��� = ��ɯ2 0!�0"?� ��͗� <2I2�G�����(=y�2(��! 0Fx�:U#(�#(�w! 04���[?>�̈́�"?:��:U��R�>�2�>!�͖�(>Y�§�2 ���Quit VCCP (Y=yes)?  >�2�!�>͖��(���͍�($�3���'!] m  ��!u �6���'����ʸçEnter file name  ���G>*�ʸ#�����!\ �$ ������Y��������$ !�\ ���!e 6B#6A#6K�  >2��ͨ�Rê�2"!��"?�e����!��,͗���2"͙����> ���~�.��*(#��>?���0�> ��!��{!�>.�#(�
�0>.�{�0> ͏�Y�����@��Y����������!"4N!Qqƀo& #�[?���S?���L>�2�!&��#��L!{��W͗����:��AG���0��� �%� :UO�1|�(:U_! �O~��w{�A2���!&�L�E             Select a drive �!L4#44�� ͨ�L>�2��2�!/��#��L![��W͗�����TGx<!/��:UGy�(9�(5��:U����k���08��:0��0G!���x � �4�6 �0��
G��TG:U��_�! �O~��w{�V�!1 �
8�
�0g�0o"�!/�L�E� ��          Select a user �yç:�G!Vx�#^#V#�(|������#�####��W�k�E  ��> 2����>2���>!�͖�͍:��(!e 6C#6O#6M#�> ��m}�oTƀ_�"�s#r*�}|!] ~� (	�.(#��!�>͖>�(G�(	> >�̈́�*�^#V����# ��+p!e ~�C 
#~�O #~�M¸>2 ����ʸ���n�^D=Help, ^C=Commands, Space=Next file, Return=select and Execute   Enter parameters -->  >02�ç>@2�!�>͖��(� ���LEnter search string:  >P2�>  �2>`2�>2�: 0�ʧG �y���͍:�(d] !�� (� > w#x� 6.#��!� ��>!�͖��(���(Y�!\ %� ���͍� 7!\ l  ����!%��-!>�(w!͖�(>Y� :O���� !�>͖��y��"çRename, ��)�
��j�����  to  Command can't execute  ERASE, are you sure (Y=yes) ?  ����8 �����SO!8V#^ͫ�z�'�[Oͫð        2Q�(
:R��[S �[8�SS�*:"U�zS_ͫ��:Q��>�(N����"���:U�(#:Q�(��I#:Q�((?:S_:V� ���>!����2RͰ�z���Press return for next page  �SS>2R�!>͖��(Command end, Press return to quit  ���> �����(Gx2 �H���~�(��	(��
(���!<�(b#� �O: ��y�(�#�(U#�('#�(M#�(I�(E��� 0	�^�"��@O�"��� y�(������� > 0��D: ��(y�!��ç���� ����(!<�(#�(� O�(�������� �\ ���/�� �� "|�>�(�O|!_=('!o=(!!=(!�=(�� �/�����-� �����'>͖�(0� � %�� ç\ � Disk I/O error  Read/Only disk  Read/Only file  Invalid drive error  !��            Drive=A:   User=0   Search string=*.*                error  Read/Only disk  R