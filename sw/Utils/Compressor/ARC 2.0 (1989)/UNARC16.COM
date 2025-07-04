Í�   �COMCM�EXEOBJOV?REL?RLINTSYSBADLBRARCARK?Q??Z?                UNARC  1.6  27 Mar 87
CP/M Archive File Extractor

Usage:  [d:]arcfile[.typ] [d:][afn] [N|P|C]

Examples:
B>A:SAVE.ARK *.*  ; List all files in CP/M archive SAVE on drive A
B>A:SAVE.ARC *.*  ; List all files in MS-DOS archive SAVE on drive A
A>SAVE            ; Same as either of above
A>SAVE *.* N      ; Same as above (no screen pauses)
A>SAVE *.DOC      ; List just .DOC files
A>SAVE READ.ME    ; Typeout the file READ.ME
A>SAVE READ.ME N  ; Typeout the file READ.ME (no screen pauses)
A>SAVE A:         ; Extract all files to drive A
A>SAVE B:*.DOC    ; Extract .DOC files to drive B
A>SAVE C:READ.ME  ; Extract file READ.ME to drive C
A>SAVE PRN.DAT P  ; Print the file PRN.DAT (no formatting)
A>SAVE *.* C      ; Check validity of all files in archive

Copyright (C) 1986, 1987 by Robert A. Freed �	�� �s�71�!� ���nͫ! E���(	���� F���(!�L�k ���W�L !ͭ�!  �*�|� ��(i=�"̀:��  1  ��	��� ����=�	0�!�  �_6 q�|���	�د2�2�2�� � �8: !�2Z>� ��ͳ�ͳ͂�!� ^ +~�  #~�N(�P 2��C 2�:2�2�> !l ���� � bk6?��!e � 6A#6R#6K2�!] �(h��O (��! ���w=2�!\ :���`�͘ !��<(�6 !g 6C�2���|:��s :� � ###~<2���s�=(:�!����!H����(!���!�z��:�!�q��L�f�*
~� <ɯ�\ > ͍�> �� <��� <�� � ��� ��� ��(���c����!~5� #�+w�7���*�,��"�~����� ��͝\ �� ��U�`#|���x� �{ja��j8��!��w<�,z���w�\ $� *} �8�"} !��!| 4�	�� �����!���
!��!��(�!8� >$���. x�8�> w�~ �#�?(��#� ��:G!��s= Gw2�:O:�� �(\'�>�2�,=���`_��A2$�� ѻ�� ��_� ! |�Y�} �90y�O��q%w$, �ɱ�L�!��(�?(�(��#��=2��!� >?���:���G:	�
;�`o& �~�Y!%wO#:Zw $:��s(�8�0w:�� G!F-N���9(6 ͝͕(nͶ͢(�_͂{���Y�͕͕��`2�:	�0M���(��8�������0��	:�<ȷ�*�R,Ŀ!!ͭx���0Ŀ͈!�6 ���` ^�͇	��O���(z�W��� ����ٯo��? 
����8�7�&0$$~$F /����� �����! uT]���!t
6d�0��O!&�>U(=85!Q6(	6l�_> ��8���`�/>2�
!  "'�
!�
>	(�!��!��"�"}
�S
2)x�2�
͇	�C*ů����p
�< �����  �ڃ	�ͦ
 #~���~�� `iͦ
~�8
rW+~s_#��#�~�+���p
�#~������%($~rW+~s_#��� ��**�d�#"*���  �ͦ
��+s#r#�w�}-� |%*(
�(	� )�4�T])�!'5#~#F!��?(M����<�8�2(|=��!)N6	+w+~�(G�w���G������! �,͊	!"*��!��������������X 7�lgx�G ��  ob	���,�L}�Z8�90��)��))))lo& 	T])))))))))))|�g�ͦ
�~�� G����)	^#Vz� ��eˤ�ͦ
�~�(�#��r+s������_!)�8+~��g�������2(��g�j�j�j�j���  *$. �ckC�gggGwG� >�y�������(�O�o|&�$fo�:&���*$�o��R(�DM*!�B"!0*#+"#��0����:��(3bk	6#}� ��(
��S�S����!� �͝͕�=���`:���:�� C����<��!=8�Y�x� ���	(�8��0�͂�͢�!�4(�:	� ��s(���`�^��� ͢��#x� ��*�|�#"����!�͵!�!�͵!F� �����L��8���d:� ��͵���F3!F�[��@���L�[��1�����d���[��+�6 &� !���_=(� ��L� (��Y�͂Ͷ>�Y>
�Y!�5�> ��w�7Ͷ͢(��>Ͷ��� �<2��͂���Y��Ͷ��͂���= > �Y� ��͂�(�� (>=�Y�x�>.(�(w#���*!:#�� ���?lg:�=_ /�_T*�"���@6k#����!p:	� �8	(	�(		�	8	(	�����H���L���ͭ`i����)�j��J�)�j�)�j�)�j��J�)�j�)�j�ͭ���x���(>e=�R��B�0����F6%#�:��F6 #�*�)))|��8�O !I			���6 #��?�P0q�*|�a(
�8p� >�)))���_6:#��?���w#����[�*�"���/Sr�o�6z��'�`�w#�   	���^#V#~#f�_ ���W_
7�͉�0�w#�0����|��� �ٱ(�w#��z�(�͑� |�8�e. )�8�,��^#V#N#F���w#�� q#���a��{����Z80 required!$aborted! CP/M version 2 or higher required Not enough memory Ambiguous archive file name Cannot find archive file Invalid archive file format Warning: Bad archive file header, bytes skipped = 00000 No matching file(s) in archive Invalid archive file drive Invalid output drive Archive File = FILENAME.ARC Output Drive = A: Checking archive... Cannot extract file (need newer version of UNARC?) Replace existing output file (y/n)?  Disk full Directory full Cannot close output file Incompatible crunched file format Typeout line limit exceeded Warning: Extracted file has incorrect  CRC length [more]        	 ???JanFebMarAprMayJunJulAugSepOctNovDecUnpacked Packed SqueezedCrunchedSquashedUnknown!Name========  =Length  Disk  =Method= Ver =Stored Saved ===Date== =Time=  CRC=         ====  =======  ====               =======  ===                    ====
Total                                                            