!  9"�1��
FILTW - Wordstar file filter - 04/14/84
copyright (c) 1984 by Irvin M. Hoff
 :] � �C�   To use: B>FILTW A:HELLO.TXT              1)
           B>FILTW HELLO.TXT A:NAME.NEW     2)

   1) uses original name for new file, original now named .BAK
   2) original file stays intact, new file has new name$:m � �Y!\ c	�+�d!l c�+�2| 2�\ � <��
++ SOURCE FILE NOT FOUND ++$�*��*�}�|��	!  "��*�{�z���*��� c� ���� *�"�í	�� ��  
DISK FULL: OUTPUT$� � !  "��*���*�#"�ɯ2o2�! @"�!  "�c� c� <�b	K� �  
NO DIR SPACE: OUTPUT$�
 � � \ � �ʡ�����++ SOURCE FILE READ ERROR ++$!� ~����ʸ�*�#"��~��ʘ�:������
ʤ�.�A�:���@��*�#"�*�#"�>͘�>2�����_�:�<2�����0��P��>2�����A���*�#"��>����
���2�2����2�� ���ʸ�	�_�*�#"������r�*�#"��>����*�#"��> ����*�#"��>-���*�#"����:��
���*�#"�����*�#"���*�#"�>͘�2�>
2��͘�,¤�h*�}���"�>�͘���c� <�'	� �'
CANNOT CLOSE OUTPUT$*��A� input lines read
 *��A� output lines with:

	 *��A� tab characters retained
	 *��A� high-order bits zeroed
	 *��A� CTL-characters deleted
	 *��A� dot commands removed
	 *��A� form feeds retained
	 *��A� soft hyphens fixed
	 *��A� space breaks fixed
	 *��A� orphan line feeds  :l�$�!\ ��+!] ��+!\ �	�+�� �� !] t�+c� �*�}���"�>�͘���c� <�	�� �
CANNOT CLOSE OUTPUT$c� �	� �
 *����~�4#~����~#�+����_� �����������	�J
 	�|��A{�0�4����         $$$                                              BAK             BAK      	 @                                                                       