#d  � ��� � PCODE/8080 CODE TO RUN
n  � ���s  � L$�16)x  A���129)*�  � A�1 � ��\� ��� EXEC\ PAS�1A PROG.P5�  � A�2 � ��\� ��� EXEC\ PROG.COM�PAS�1A�PROG.BIN�  � "UNK A=",A�  �\�� � ��� EXEC\ PAS�1A PROG.P%V L$�"PASRUN1A.COM"\� ��� PROG � �#[ P$�"PROG.P"\      � ��� PARAMS
t � ��(� � ��� PIP\ PROG.COM�PAS�1A�PROG.BIN� � "LOAD PASRUN1A.COM"� � "PROG.COM"\� "PROG.COM"� �#1,"PROG.COM"D� �#2,"PASRUN1A.COM"\� PATCH WITH 1 IN BYTE 3 �ST�AL�E .COM MODE)� N�0\N0�0� � N�8192 � ��� N0�N0�1\� N0�16 � ��1� N0�0\���13)," ... ",N," BYTES LOADED",��13),� �#2,&C� N�N�1\� N�4 � C�1� �#1,&C,�\� ��� �#2'� � "LOAD PROG.BIN FILE (8080 CODE)" �#2,"PROG.BIN" N�0\N0�0 E�D\D�C  N�N�1\N0�N0�1\� N0�16 � �1 N0�0\���13)," ... ",N," BYTES LOADED",��13), �#2,&C\�#1,&C,� � E�195 � D�0 � C�0 � �
 � � �#2" �"GENERATE PROG.COM FILE    "  �#14 � ��� EXEC\ PROG.COM!> L$�"PROG.COM"\� ��� PROG � �"C P$�""\        � ��� NO PARAMS
\ � ��� � ��� � L$ P$ "� � "NOW EXECUTE: A>",L$," ",P$� �                                                A�0 � 255� �#1,&C\� M�A,C\�� �#1) M�48896\� L$�FCB PROGRAM � � AT BF00
& � ��0 M�M�128\� P$�PARAM AT BF80
: L$�P$
D � ���