!  9"�1�*  "? "B"E"H�sHTOC for CP/M 2.2 as of 17/12/82 - WWM/PWS

This utility allows the user to transfer files 
from a HDOS disk to a CP/M disk.
���sFUNCTIONS:

C - CP/M DISK DIRECTORY
H - HDOS DISK DIRECTORY
I - INSERT NEW DISKS
T - TRANSFER HDOS FILE TO CP/M DISK
X - RETURN TO CP/M VIA WARM BOOT

Enter function code:�� ��s
���_�C�J�Hʡ	�I��T���Xʪ�sxxx INVALID OPTION xxx�ì�sInsert CP/M system disk in drive A
Press RETURN to exit:�� ���� �  � �  �sEnter drive used for HDOS disk (B-F):�� ��s
���ʬ�_�B��G�20�A2��sEnter drive used for CP/M disk (A-F):�� ��s
���ʬ�_�A�T�G�TG:0��Tx2��A2��sInsert the CP/M disk in drive A,
and insert a CP/M disk of equal sides and density
to the HDOS disk you wish to read in drive B.

Press RETURN when ready:�� �ʬ��P� � � :�_� !\ 6?�� :02��s
Insert HDOS disk in drive B,
Press RETURN when ready:�� �ʬ����cìser�2�!�"��sEnter filename -->�� >P
� �s�:� <<!� �o6!�ͧ!� �~�*�>>?�/>2�#�'�?�M�>2���c͏��j�.�c#��'#�'�t���sxxx FILE NOT FOUND xxx��sDo you have more files to copy? (Y or N) <N>:�� ��s���_�Y��ì��,��<O2���ͨ�����~��_� �x��.�� ��#�����s  Is this file for HRUN? (Y or N) <Y>:�� ��s���ʬ�_�N�sDo you want ASCII file translation? (Y or N) <Y>:�� ��s���ʬ�_�N�%:�_� !��k� :�_� �� \ � ����sxxx TRANSFER ERROR xxx�� T� \ � ���Ü:�_� \ � � � :���jË  �2#2$�sIs this an MBASIC file? (Y or N) <N>:�� ��s���ʬ�_�Y�p2#�2�2�͚چʆ���w:��� >2�>�� :��̳�!�:� O	~!�4��:�_� !��k��:������@��:#���>
2$������
��>�:$����2$������>!� w#���:� O!� 	�w:�<2�����2�:�_� � � \ � ������!  "�}2�:�<2\ !] 6?#�`> 2h \ � <�J	�sxxx NO ENTRIES FOUND IN CP/M DIRECTORY xxx�ö\ � <�J	:�_� � ##~�###^#V�"�! ���)=���� �~���*�"�*�+"��|��	����#����*�DM>!>	��!>	�W�s
Free space on disk = \ �K
�ì=������!� �ow	~#�\	>.~�#�j	�s	�sxxx NO E     �:�<2��ª�2��s�ê�2�:�O >!�	���s
Volume: �  Label:�!�~���	#��_� ���
��	>��	�s

Name     Ext  Sec  K    Date
�!��� �~��&
 ��~���4
�s��ì���<
�
v
~��H
> #�A

~��[
> #�T
����
�� �
Ͳ
�s	�sxxx.NO       �:  <2��ª     �:�<2���
�2��s��
N#Fx���F�y��xy��O �>��>-w#�O >��>-w#�O >����,�MD!�
>��!�
�W� 	}��o|g}o�MD!�
>��!�
�W� ~�++~��o& ~��7i& ):���Q)�O 	�~�0�6 #�W�>!�͖ �!� ͯ:�2��ʫ�ʫ�s
Illegal HDOS disk size.���� ~<2A=�2�/<o&�"�*�|}!�͖�!� ͯ*�|}_ !�͖:����{<��!�~_!�͖!�:���{_~2��!�͘�o�sxxx DID NOT FIND DIRECT.SYS IN 42ND ENTRY xxx
    ABORTING.... xxx�ê:����:�2�:�2��2�2�!��k� Ë����o�g��x<	ڤ2�}�
�<2����D:�O�>:�O�A�G����!� 	DM�D�<�G����! 	DM�D�<�G����!�	DM�D�<�G������sxxx ABORTING DUE TO BAD HDOS READ xxx�ê:�<��K2��[>2�:�<2�O�>:�O�A�����)à:������:��ʬ�2�:�G:��:��җ��7��!�:� _~2�!�ÿ>�2�:��ʓ�!�͖��� ͯ�������:���N=2���3��:�G:����:������7��!�:� _~2�!��f:�G:���&:���&���:�o& )#��`:�G:���!��f:���f���>2�:�����o& )�!��c��� ͯ�����*��� �~� ��~���x���7��͘�x�"���� ~2��� ~2�� ~2��2�2���!\ !ͧ�!] ���> w#��:�_� \ � <�B�sxxx FILE EXISTS, TYPE Y TO ERASE:�� ��s���_�Y�:�ì\ � \ � <��sxxx ERROR ON CP/M FILE OPEN xxx�ì�~̀~#�t������_� �����a��{��_��?ʠ��#ɯw#¨�x��}�|���	��	�~+x����#�w#x���������
 �����>0�+w�=�����_ ��z/W{/_z��:�bk	�<bk)���=`i  ��(}�o|�gyOxG7zW{_�=��`i��  �  �  �  <��sxxx ERROR ON CP/M FILE OPEN xxx�ì�~̀~#�t������_� �����a��{��_��?ʠ��#ɯw#�  �x��}�|���DIRECT  SYS                                                            