��   
PINST V1.08 (31-May-04)  CINET

$
Copyright (c) 1985
by   Peter  Schorn
Prinz-Eugen-Str. 6
D-8000 Muenchen 40
Tel. 089/300 25 78
Serialnumber CINET

$PATCH AREA FOR FIRST RECORD OF PROLOGZ.COM                                                                                      Std1: cursor_position      = <ESC> '='
            send line first
            erase_to_end_of_line = <ESC> 'K'$P=                    K               Std2: cursor_position      = <ESC> '='
            send line first
            erase_to_end_of_line = <ESC> 'T'$P=                    T               Std3: cursor_position      = <ESC> '='
            send column first
            erase_to_end_of_line = <ESC> 'T'$P=                   T               Std4: cursor_position      = <ESC> 'Y'
            send line first
            erase_to_end_of_line = <ESC> 'K'$PY                    K               Std5: cursor_position      = <ESC> 'Y'
            send column first
            erase_to_end_of_line = <ESC> 'K'$PY                   K               Std6: ANSI$P[      ;   H    [K              ADDS 20/25/30/40/60$PY                   K   0P        ADDS Viewpoint-1A$PY                    K   0A        Ampex D80$(=                   T               Lear-Siegler ADM-20, Morrow MDT-20$P=                   T               Hazeltine Esprit$P                                   IBM PC CCP/M bw, Teleray series 10, Zenith$PY                    K               IBM PC CCP/M color$PY                    K   xc       Kaypro$P=                                    Lear-Siegler ADM-31, Liberty, Qume, Soroc, Apple CP/M
      Teletex 3000, Televideo 912/920/92$P=                    T               Philipps P2000C$PY                    K               NCR PC$P=                    T               NorthStar ADVANTAGE$P=                                    Otrona Attache$P=                    K   `    a   RC-855 (ITT)$P                                     SSM-UB3$P       ;          K               Tandberg TDV 2215$P                     [0K             Visual 200$PY                    x                ( $ ) $
(RET) Next frame
(ESC) Quit program

Selection: $None
$PROLOGZ.COM not found.
$I/O Error.
$
PROLOGZ.COM successfully initialised.
$Use DDT to initialize the patch area (0x$) 
$ PROLOGZ COM                                    ��n�f��n�f�Ͱ"�
�+�!	 ��n�f�͵
�&�! ��n�f�͵
�&�
 �n�f���!0 �^�V���
�(!7 �^�V���
�&� �n�f�����
�n�fg}�o����
�&��ng��+�ng��+�&og�[�
���}! 
���
���!
���
�og"�
*�
#"�
�~ *�
��8��*�
#"�
ng$ ��8��͡, *�
"�
�ͽ!���
!�
"�
og"�
*�
w#"�
*�
#"�
 ��8�! �!�
�͵
� *�
���!
���
í! �!��͵
! �!�
�͵
�g2�
!("�
͆og"�
*�
"�
*�
ngͽ�R *�
��ڄ!�	���
*�
A ���
!�	���
*�
���
�~ͳ*�
#"�
�!�	���
! �og�͵
*�
"�
 ��ڮ! 
���
ía *�
����!z �[�
������*�
"�
 *�
����A ����*�
@ �[�
��8�A *�
��ڐ*�
"�
!A �[�
���!ͳ*�
+"�
��~͡og"�
!�"�
*�
#"�
ng�*�
s*�
#"�
*�
#"�
+ *�
��8�! �!�
�͵
�g! �!�
�͵
� *�
�	ڃog"�
�g!-
���
í*�
ng�ڤ!("�
ê*�
"�
�0�����M��� ���}�7ȯ�����BK�og>�j�B0	?��j�= �������R��7���?��|������R�ɯB� ?ɯ|�ȯ7ɯ��R�?ȯ�_W��������9�������Dg9�hg���9����8080 detected - switching to Z80.
$Switching back to 8080.
$$$$     SUB                     ��ͧ���}� 	&� ͧ�  !�w=��4>���=�	?� !} 6��#w#u#^W#w�* +���:� 	c� >���   SPLRTLB V-1.00.16 (31-Jul-04) Z80 processor required.
$�w=��4>���=�	?� !} 6��#w#u#^W#w�* +���:� 	c� 