��Q/C Compiler  V3.0  (Z80)  (8080)         
QRESET customization program for %s%s CC.COM .COM CC.COM Error reading %s 
Your true CP/M system size is: %uK
 
Error writing %s 
%s has been changed %s
 %s
 
Can't tell whether this is for 8080 or Z80
 
This version of QRESET only works with Q/C %s
 
%s does not look like a Q/C Compiler -
  either the file is damaged, or you have changed
  the order of global variables in CGLBDEF.C
 
No changes made ^C 
Currently compiler will generate code for %s RMAC M80 
Enter A (RMAC), M (M80) or <CR> for no change:  ASM MAC 
Compiler changed to generate code for %s
 RMAC M80 
Compiler is currently in %s mode verbose terse 
Enter T (terse), V (verbose) or <CR> for no change:  
Compiler changed to %s mode
 verbose terse 
Compiler currently pauses after %d error%s
  s Enter new size or <CR> for no change:  New error pause count = %d
 
Compiler currently %s long arrays initializes does not initialize 
Enter I (initialize), N (do not initialize) or <CR> for no change:  
Compiler changed to %s long arrays
 initialize skip initialization of 
Compiler currently %s redirection includes excludes 
Enter R (redirect), N (do not redirect) or <CR> for no change:  
Compiler changed to %s redirection
 include exclude SYMBOL TABLE size entries TYPE TABLE size types LITERAL POOL size characters MACRO (#define) POOL size characters SWITCH/LOOP nesting depth levels SWITCH/CASE TABLE size cases 
%s is: %d %s
 Enter new size or <CR> for no change:  New %s is: %d %s
 * ��u�V(m�!& }2(!-�!�!�! ��u�! 9��!� 	ͫ& ��&ʇ!� 	�!� 	ͫ&##ͫ&���#��!� 	͝&: ��&�N!� 	͝&�L'�b!� 	�!T�͊#��Ä!� 	�!. ��6&���L'ʄ!� 	�![�͊#��Õ!� 	�!`���#��! 	�!� 	�!  ��g���ʹ&#�L'ʼ!� 	�͕�! 	ͫ&�! 	�!� �������L'��!g�!� 	�! ��u����c! 	ͫ&�����! 	�!� 	������ʹ&! ��y&�"+!x�*+�� �ͭ' �! ��u���ͩ&��A�ͩ&�ͧ�*'�L'�W�! 	�!� 	�! ��g���ʹ&#�L'! 	ͫ&�! 	�!� ������� ��&ʫ!��!� 	�! ��u����c!��!� 	�! ��u���! 	ͫ&����͙(� � (!  "�&!��$�"�&! 	ͫ&"�&!  "�&*�&� �9'�*�&��&�9	�	*�&#"�&*�&#"�&��*�&�!��4$���L'�6	! "�&�9	�		*�&�*�&#�"�&*�&�L'�[	*�&ͣ&!V ��&�j	! 	ͫ&���
�!��$�"�&*�&�!�*�&��:
���  ��&ʖ	ͳ
â	*�&�*�&�"�&*�&�!��4$���L'��	!��!�! ��u���!z "%*�&�!��$�#�"�&�2
*�&�!��4$���L'�"
!��!�! ��u���!8 "%*�&�!��$�#�"�&�2
!��! ��u���*�&|��e(� (! 	ͫ&"�&! 	ͫ&"�&! 	�ͫ&+�ʹ&  ��&�u
*�&͝&|��u
! ʝ
*�&�*�&ͣ&�͝&��&
*�&#"�&*�&#"�&�Q
*�&�*�&ͣ&�͝&��9'��e(!��!�! ��u������)(!)�! 	ͫ&�! ��u���!R�! ��u��!��! ��u�����!��! ��u���c�� (�����$�"�& ��&�9!��! ��u���c*�&|��e(�3(��! 	ͫ&"�&*%8 ��&�(*�& "�&!��*�&ͫ&a ��&�!�Â!��! ��u���!��! ��u���"�&*�&a ��&��*�&m ��&��*�&
 ��&*�&
 ��&�(*�&�*�&�ʹ&*�& �*�&a ��&��!-��!1���#��!5�*�&a ��&�!`�!e�! ��u���! "'*�& "�&!i�*�&ͫ&|��G!��J!��! ��u���!��! ��u���"�&*�&t ��&ʉ*�&v ��&ʉ*�&
 ��&�U*�&
 ��&��*�&�*�&v ��&�ʹ&!��*�&ͫ&|�ʾ!���!��! ��u���! "'*�& "�&!��*�&ͫ&�*�&ͫ&+�L'��!(��!)�! ��u�! 9��!+�! ��u����!����"�"�&|��N!R�*�&�! ��u���*�&�*�&�ʹ&! "'*�& "�&!n�*�&ͫ&|��m!��p!��! ��u���!��! ��u���"�&*�&i ��&ʯ*�&n ��&ʯ*�&
 ��&�{*�&
 ��&��*�&�*�&i ��&�ʹ&!��*�&ͫ&|���!��!&�! ��u���! "'*�& "�&!=�*�&ͫ&|��!`�!i�! ��u���!r�! ��u���"�&*�&r ��&�Y*�&n ��&�Y*�&
 ��&�%*�&
 ��&ʢ*�&�*�&r ��&�ʹ&!��*�&ͫ&|�ʎ!�Ñ!��! ��u���! "'�~( � (! 	ͫ&"�&"�&�!��*�&ͫ&�!��͆����ʹ&*�&##"�&�!�*�&ͫ&�!�͆����ʹ&*�& "�&�!�*�&ͫ&�!*�͆����ʹ&*�&
 "�&�!5�*�&ͫ&�!O�͆����ʹ&*�& "�&�!Z�*�&ͫ&�!t�͆����ʹ&*�& "�&�!{�*�&ͫ&�!��͆����ʹ&�e(�V(��!��! 	ͫ&�! 	ͫ&�! 	ͫ&�! ��u�!
 9��!��! ��u��! 	���!����"��ʹ&��!��! 	ͫ&�! 	ͫ&�! 	ͫ&�! ��u�!
 9��! "'! 	ͫ&�! 	ͫ&|�͙(	                                                 �     Too many command line args
$ �V(��*Q#"Q+͝&"Mi`"S6 *!#"!+)�!#�*S�ʹ&*M+"M#|��h*Q#"Q+͝&"O*K�H*O�ͦ%�¥*! ��&��!	 �!W��(���c*O"K*!#"!+)�!#�*S#�ʹ&*O" ��&�Wå*O" ��&�.!  "K"O�W*O�ͦ%��E!  "K"O�W��' "   �1*S#"S�*O�}å*S#"S6 *!�!#������c͙(� Can't open: %s �)(*��!��! 	ͫ&�! �͗�! 9��! ������A:$$$.SUB � (!�"�&!  "�&*�&
 ��&���*�&
 "�&*�&#"�&��*�&������! 	ͫ&|��!���d��c�e(�V(��! 	ͫ&�!Q �*���\����L'�H!  �n�! 	ͫ&�!
 ��6&���ʹ&��gͩ&6 ! 	ͫ&|�͙( �)(!��*��! 	ͫ&)�! 	��# ������ (! 	ͫ&)�! 	"�&!��*�&ͫ&�*�&++��# ����e(*��́��� (! 	ͫ&"�&	 ͝& ��&�*�&�͝& ��&�}!  �W*�&ͣ&! ��&��8*�&ͣ&! ��&�L'�0! �*�&�͈��*�&�͝�*�&�͝& ��&�}*�&	 ͝&����|��e(� (! 	ͫ&"�&! 	ͫ&+�L'�*�&�! 	ͫ&�}!
 �*�&��(��! �!
 ��(��*�&##"�&*�&#͝&"�&*�&+"�&#|���*�&#"�&+�*�&#"�&+͝&�}ñ*�&6
*�&#6 ! 	ͫ&͝& ��&��!  �! 	ͫ&�|! 	�ͫ&+�ʹ&  ��&�1! 	ͫ&�́�"�&����&�O*�&#"�&+�*�&�}
 ��&�O�*�&6 *�&#�L'�l*�&�! 	ͫ&��&�u!  �|! 	ͫ&|��e(� (! 	ͫ&"�&+�L'��* "�&����&ʭ!��" ��! �!  ��(��"�& ��&��! �!
 "�&��(��*�& ��&��!����*�&��*�&ͣ&! ��&�L'�*�&ͣ&!0��&��! �!����*�& ͫ&"�&����&�A*�& 6�#6��~*�&###�ͫ&+�ʹ&  ��&�s*�&#�ͫ&#�ʹ&+ͣ&!� ��&�{*�&����"�&*�&ͣ&! ��&�ʔ*�&��*�& ��&ʫ*�&�́�"�&*�& ��&¾*�&#�L'��*�&�͝& ͺ&�}!����*�& ��&|��e(� (! 	ͫ&"�&	 ͝&�*�& ͫ&"�&�! ������"�&  ��&�[*�&�L'�:*�&�͝& ͺ&�}�J*�&�͝&  ͺ&�}*�&###6 #6 !��Ã*�&###�*�&+�ʹ&*�&#�*�&#�ʹ&*�&ͣ&!� ��&|��e(� (! 	ͫ&"�&! 	ͫ&"�&*�& ��&��*�&
 ��&��! �*�&�͈��! �*�&��(��*�&Ø*�&ͣ&! ��&�L'��!��Ø*�&
 ��&�
*�&ͣ&! ��&�L'�'! �*�&�͈��#�L'�'!��Ø*�&	 ͝& ��&�M! �*�&��(��*�&Ø*�&###Ͱ&! ��&�t*�&�͝�#�L'�t!��Ø*�&###�ͫ&#�ʹ&*�&#�ͫ&#�ʹ&+�*�&�}|��e(� (! 	ͫ&"�&	 ͝& ��&��!  �b*�&ͣ&! ��&�L'��*�&ͣ&!  ��&���! ��!���b*�&###ͫ& � ��{'� �W'"�&*�&###6 #6 *�&	 ͝&�*�&#�*�& ͫ&�ʹ&�*�&�������*�&��&�_*�&�͝&  ͺ&�}!���b!  |��e(� (! 	ͫ&"�&  ��&*�& ��&ͩ"�&�L'ʛ!����*�&����"�&! 	ͫ&�*�&#��q��#�L'��! �*�&#��(��� ��&��!����*�&�*�&#�}*�&|��e(� (! 	ͫ&"�&�t ��&��c! 	ͫ&����"�&�L'�B*�&ͣ&! ��&�L'�B*�&� ��{'�|��E! �N!����*�&ͣ&! ��&��d!  ��*�&� ��{'"�&!  "�&*�&�*�&��&��Ñ*�&#"�&�w! �! 	ͫ&��(��! �*�&#��(����*�&�͝& ͺ&�}��! 	�ͫ&� �ʹ&Ç! �!� ��(��*�&� �W'|��e(� (! 	ͫ&"�&�t ��&��c! 	ͫ&����"�&�L'�W*�&ͣ&! ��&�L'�W*�&� ��{'�|��W*�&ͣ&!  ��&��Z! �c!����*�&� ��{'"�&!  "�&*�&�*�&��&��Ð*�&#"�&�v! �! 	ͫ&��(��! �*�&#��(����*�&�͝&  ͺ&�}��! 	�ͫ&� �ʹ&Æ! �!� ��(��*�&� �W'|��e(� (! 	ͫ&����"�&�L'�!���_*�&͝&"�&*�&6 *�&  ��&��2!���_*�& ��&��\! �*�&#��(��� ��&�\!���_!  |��e(�V(��!( 	ͫ&���q������&ʟ! ���(��� ��&ʙ!��Ü!  â!��|�͙($ �3(��! "�&�*�&�����ʹ&  ��&��ͩ&͝&�L'��*�&��*�&#"�&ô!��|��~( � (! 	ͫ&"�&��"�&  ��&�*�&
 ��&�[*�&)�!�ͫ&"�&�L'�U*�&)�!��!% ����ʹ&"�&  ��&�U*�&6 *�&�^!  |��e(!  �!  ��(���� (! 	ͫ&"�&! 	ͫ&"�&����"�&#ͣ&!: ��&ʪ*�&#"�&+6 ��*�&͝&��%��L'��!����*�&#"�&+�*�&͝&���}*�&##"�&!  "�&! "�&*�& ��&�\�*�&#"�&��*�&#"�&+͝&"�&�L'�!*�&. ��&�\*�&���$��5!����*�&* ��&�J!? "�&�\*�&#"�&+�*�&�}��*�& ��&ʇ�u*�&#"�&�\*�&#"�&+�*�&�}�k*�&  ��&ʜ*�&. ��&��*�&#"�&+͝&"�&  ��&ʿ*�&. ��&��!����*�&|���*�&#"�&+͝&"�&!  "�&*�& ��&�L��*�&#"�&��*�&�L'�L*�&���$��!����*�&* ��&�,!? "�&�L*�&#"�&+�*�&�}*�&#"�&+͝&"�&��*�&  ��&�a*�& ��&�m*�&* ��&�y*�&͝&"�&*�&  ��&ʋ!����*�& ��&ʶä*�&#"�&Ë*�&#"�&+�*�&�}Ú*�&$ ��&����*�&#"�&ö*�&#"�&+6 ��!  |��e(� (! 	ͫ&"�&*�&�*�&͝&�͙$��}��*�&#"�&��! 	ͫ&|��e(� (! 	ͫ&"�&�Y�*�&��&�=!  �T*�&�*�&�"�&*�&�*�&��9'|��e(�V(��i`�*�&�9'�*! �9'�͙( ! �!  ��(�� ��&�ʛ! �!  ��(��Þ!��|��                                                                                                                           ����3(��! 	ͫ&"�&++"�&##ͫ&"�&*�&#"�&+͝&"�&|�ʻ!*�&% ��&�~ ! 	ͫ&�*�&��! 	ͫ&��!y �����? *�&#"�&+͝&"�&Õ!û!! "�&ó ! "�&ó !
 "�&ó !��"�&*�&++"�&##ͫ&��*�&���!���"�&*�&͝&|��!! 	ͫ&�*�&#"�&+͝&��! 	ͫ&��!� ������ �? ! 	ͫ&�*�&++"�&##ͫ&��! 	ͫ&��!*!�����? *�&++"�&##ͫ&"�&*�&͝&|��r!! 	ͫ&�*�&#"�&+͝&��! 	ͫ&��!m!�����?!�? ! 	ͫ&�*�&��! 	ͫ&��!�!�����? ��' s /!c !d � u � x � o �   � u!�? �~( � (! 	ͫ&  ��&��!! 	ͫ&����&��!! "�&! 	ͫ&�@'"�&�	"!  "�&! 	ͫ&"�&! 	ͫ&����&�""! 	6
#6 ! 	ͫ&"�&"�&*�&�*�&�! 	ͫ&ͭ'�0 �}9 ��&�`"*�&�͝& �}*�&#"�&*�&�! 	ͫ&ͭ'"�&  ��&�/"*�&|�ʓ"*�&#"�&+6-*�&6 *�&+"�&�*�&��&��"*�&͝&"�&*�&#"�&+�*�&͝&�}*�&�*�&�}Ø"! 	ͫ&|��e(� (! 	ͫ&"�&*�&͝&�ͦ%��#*�&#"�&��"! "�&*�&͝&- ��&�##*�&͝&+ ��&�F#*�&#"�&+͝&+ ��&�@#! �C#!��"�&!  "�&*�&͝&�͂%��{#*�&
 �W'�*�&#"�&+͝&���"�&�L#*�&�*�&�W'|��e(� (! 	ͫ&"�&*�&͝&|�ʬ#*�&#"�&×#*�&�! 	ͫ&���#��! 	ͫ&|��e(� (! 	ͫ&"�&*�&#"�&+�! 	�ͫ&#�ʹ&+͝&�}���#! 	ͫ&|��e(� (!  "�&! 	�ͫ&#�ʹ&+͝&|��,$*�&#"�&�$*�&|��e(� (! 	ͫ&"�&! 	ͫ&"�&*�&�*�&ͣ&�͝&��&ʂ$*�&͝&�L'�q$!  Ô$*�&#"�&*�&#"�&�K$*�&�*�&ͣ&�͝&��9'|��e(� (! 	ͫ&"�&��^%�ʸ$*�&��û$*�&|��e(� (! 	ͫ&"�&��:%���$*�&  ��$*�&|��e(�)(! 	ͫ&���%��%! 	ͫ&��&��L'�%! |����)(! 	ͫ&��:%��3%! 	ͫ&��^%��6%! |����)(! 	ͫ&A ��&�Z%! 	ͫ&Z ��&|����)(! 	ͫ&a ��&�~%! 	ͫ&z ��&|����)(! 	ͫ&0 ��&ʢ%! 	ͫ&9 ��&|���� (! 	ͫ&"�&  ��&��%*�&	 ��&��%*�&
 ��&��%*�& ��&��%*�& ��&|��e(�)(! 	ͫ&  ��&�&! 	ͫ& ��&|����)(! 	ͫ&  ��&�2&! 	ͫ&~ ��&|���� (! 	ͫ&"�&*�&͝&|��q&*�&ͣ&! 	ͫ&��&�g&*�&�t&*�&#"�&�C&!  |��e(�)(! 	ͫ&ͣ&!� ��&���ANTOP�O  E�(i`~o�g�~_�W�i`~#fo�^#V�}|�}�o|�g�}�o|�g�}�o|�g��'�'���'�-���'�'����'�'����'�'����'�'��-�z�W|�gz��'{�! ���||g}o�'��)�&'��|�g}o�-'{�oz�g��E'#�|/g}/o�|��U'�go�,��DM!  y�c'�xGyO��y'�{_zW��]'��|�']T��|��|��'�@'z���'��@'�͵'��'��@'�����@'�|�µ']T��DM>��  ){_zW���'z���'��'{���'}�o{�_z�W�=��'�ÿ'�����N#�(#~�#�(~��(##��'#~#fo���! 9^#V#N� o` �����!  9�>(��!  9DM����~#T]fo9�DM*�&�*�&�*�&�*�&�*�&�����~#T]fo9�DM�����"�&�"�&�"�&�"�&�"�&������"�&�"�&�"�&�"�&�"�&`iÛ(��~#fo9���� 9�>(��!  9DM����~#T]fo9�DM*�&�*�&�*�&�*�&�*�&�����~#T]fo9�DM�����"�&�"�&�"�&�"�&�"�&�����