1��{

NEVADA FORTRAN CONFIGURATION PROGRAM (01OCT82)

 :] � ­�{

CREATE ERROR FILE (Y/N)?  
� �{

 :��C:��Nʭ�Y�C�{
+++ CREATING "FORT.ERR" +++

 b� b� ���d	>� ���0	!� 6 #z�����W�W��W�W*��*�s#r#"�͖�Z͖� 	͖� 	*�#"�!�6 #�͖�� 	��?w#�*�#"�!�4�� !�N#yͿ~#Ϳ�H͖� 	�����2���W�W��W�Wb� >� �{

+++ FILE "FORT.ERR" DONE +++
 �{

+++ CONFIGURING NEVADA FORTRAN COMPILER +++

 � � �� ���

�� ��R
!��':� 2O�{

CHARACTER TO BE USED TO SURROUND HEX CONSTANTS IN STRINGS [ ]  
� �{

 :��n:2� ��2�� �� �� ��ʛ	�� ���	�{

+++ CONFIGURING NEVADA FORTRAN RUNTIME PACKAGE +++

YOU CAN SPECIFY ONE OF 3 WAYS THAT THE RUNTIME
PACKAGE CAN DO CONSOLE I/O.  EACH HAS ITS ADVANTAGES.
CONSULT YOUR CP/M MANUALS FOR THE DIFFERENCES OF EACH
ENTER:
0 TO USE DIRECT BIOS I/O
2 TO USE CP/M FUNCTIONS 1 & 2
3 TO USE CP/M FUNCTION 6

 
� �{

 :�ʛ:�0ڛ������2� �{


DO YOU HAVE A NORTH STAR FLOATING POINT BOARD IN YOUR
SYSTEM? (Y/N)  
� �{

 :���:��N��Y���{
WHAT ADDRESS IS YOUR FLOATING POINT BOARD ADDRESSED
AT?  ENTER NUMBER CORRESPONDING TO THE ADDRESS OF YOUR BOARD

0) 0FF2/0FF1  1) 1FF2/1FF1  2) 2FF2/2FF1
3) 3FF2/3FF1  4) 4FF2/4FF1  5) 5FF2/5FF1
6) 6FF2/6FF1  7) 7FF2/7FF1  8) 8FF2/8FF1
9) 9FF2/9FF1  A) AFF2/AFF1  B) BFF2/BFF1
C) CFF2/CFF1  D) DFF2/DFF1  E) EFF2/EFF1
F) FFF2/FFF1

 
� �{

 :��q:��0�q�
����q��q���!� w��2�� �� �  �a��{�� �~��̀
~#2^#V#�!� �^ ��E#V�"<�^ͥ�s#:��Zr��'>[͊
:��y͊
��͒�͒��͒��͒��͒�{
]  ��/�33	ڕ;;�z�Ê

� �{

 :�*<��_ !6 !  ����0��
��MD))	)�O 	���z���{
+++ DEFAULT CANNOT BE ZERO - REENTER +++  å�{
+++ INVALID DECIMAL DIGIT IN INPUT - REENTER +++  å�*� �� b� ���{
+++ WRITE ERROR, DISK FULL +++
 �  �*�}�³�
� >� !�
~#"���7ȷ����*�w#}����� b� ��o*� !"�����>Ϳ:������{
+++ FORMAT ERROR IN INPUT TEXT FILE +++
 �  �{
+++ INPUT TEXT FILE: "ERRORS" NOT FOUND +++
 �  �{
+++ DIRECTORY FULL, CANNOT CREATE FORT.ERR +++
 �  �{
+++ FORTRAN RUNTIME "FRUN.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FRUN.COM" +++
 �  �{
+++ FORTRAN COMPILIER "FORT.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FORT.COM" +++
 �  �̀
�~#��͊
À
�_� ��++
 �  �{
+++ FORTRAN RUNTIME "FRUN.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FRUN.COM" +++
 �  �{
+++ FORTRAN COMPILIER "FORT.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FORT.COM" +++
 �  �̀
�~#��͊
À
�_� �� �  �{
+++ FORTRAN RUNTIME "FRUN.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FRUN.COM" +++
 �  �{
+++ FORTRAN COMPILIER "FORT.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FORT.COM" +++
 �  �̀
�~#��͊
À
�_� �� �  �{
+++ FORTRAN RUNTIME "FRUN.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FRUN.COM" +++
 �  �{
+++ FORTRAN COMPILIER "FORT.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FORT.COM" +++
 �  �̀
�~#��͊
À
�_� �� ��{
+++ FORTRAN RUNTIME "FRUN.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �{
+++ READ ERROR ON "FRUN.COM" +++
 �  �{
+++ FORTRAN COM LIER "FORT.COM" NOT FOUND, PROGR ERRORS                              FORT    ERR                         FORT    COM                         FRUN    COM                        

THE NUMBER IN [] IS THE CURRENT DEFAULT FOR EACH PARAMETER.
TO USE THE DEFAULT, JUST HIT RETURN/ENTER, TO CHANGE. ENTER
THE NEW VALUE IN DECIMAL


SYMBOL TABLE SIZE    LABEL TABLE SIZE    NUMBER OF ARRAYS   NUMBER OF NESTED DO LOOPS   IF-THEN-ELSE NESTING DEPTH   
THE FOLLOWING 3 PARAMETERS HAVE TO DO WITH EXPRESSION EVAULATION
THE MORE COMPLEX THE STATEMENT TO BE EVALUATED, THE LARGER THE
FOLLOWING 3 PARAMETERS MUST BE.  THE DEFAULTS SHOWN SHOULD BE
STATISFACTORY FOR MOST EXPRESSIONS


NUMBER OF TEMPORARIES USED DURING EXPRESSION EVALUATION   NUMBER OF OP-CODE STACK VARIABLES   NUMBER OF OPERAND STACK VARIABLES                                         