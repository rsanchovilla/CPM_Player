�� LOCATE  SYS                       ????????PRM                       PARM    SYS                      �@w��,��U���,+>2-=�>�2.=�Y+�2.=�@>2.=�Y+��}+>��}+:�@/o:�<��Y+}2�@2*=�Y+>2�<�Y+�2�<�Y+>�2�<��(�2�<z�:>� �{=�ʝ�ҝ<2�<�gk�4��(z�:�<��{���+�
ܝ:>� ��+{22=�+�?�p�U�:�=���+��>!�=w#"?=:�<�ĩ��,��+�:,=�����*F=+�qN��1,�4O��=2,=*F????????      <.  DDDSpySSS �
WWW LLLLD�4XXX N
MNT �
III ��NNN ��CCCP�DAD �k$$$B�AFDB��CMDB?�CTLB��DATBT �E  B%!�EFMB� �FD B�!�IDXB""�MD B~"�NEWB�"�PRNBg#�REJB�#�RD Bh$�SD B�$�SELBC%�SFLB�%�SRTB*&�SUBB?�SYSB�&�TRXBC'�        �  �?-�~#�~͢͆-O�ʜ����ͪ>
�*  �!y4* 	 ���Nͪ��#¶�͢�����	� >2,��,:,�Y��N7���!r~6����
�	� ���  �2r��
� ��� ���!{ ~�7��;�7�)"s����
��K#�@����*sͶ:ͪ�/*s ͧ-�	� �*s ͧ-�6	� �)J	� �p~�c>ʛ>�9:,���p~�cʸ!,ͧ*:�'2,�p:,#���45�{#þ#~*s w�*s ~��p�F#45�!#���x�c�+~� �!�N#�+�!�'�'6  �~�~2�'�C*!�'N#�!�'6?���Ͷͪ
ê2,��,!,~#�_�~��O 	#6 �N�!y��j��� ͪ���Y��/!y6��Y:z��<ڃ>2z�V*sͶ ͪ��Ͷ�:z��<ک>2z�V!,Ͷ�	� ��� �� �_� ��{ !�"�,!�"�,�
> 2q�	� ��҇!i& �~>�2q*w�!%��͹-���2�		� ��ڇ> 2qÇ&
	� >2y>�2z,�#.�S͝�D�/]
	� >�9!,& �~!%��*��!%��5+!%��**w"u6"�+!  "�+�
�
͸!��*ʻ4	� ���  �i!�5+� !i~�� ��'-ʻ��!���� ~2,�B� ��� � ,���>��+!��*�{ �
�	� >�9:,�?�N!,� �\-ʷ!,� �\-�g!,� �\-�s!,�!�n�
�	� ���q�8�!i"�+�!�:+> 2y��:y���t�~��+�*s��͇��#�!ij6 �~��͸:q���G� !G��*���	� ÷!G��:+!G��*!i"�+!y"�+6 � !��*!�"|ͥ*u~��#͙�͇i!�:+!��*�  �
�O�{�*s :,w�>�2z>2y!w"|ͥ�/�!8"|ͥ��	� >��,:,��s:,� ʙ�A�s�Q�s!B"|ͫ�!{��!���!�~6 !{����2��"s��{� ~����ALLDSKENDThis program will install PARM.SYS for you and also 
LOCATE.SYS.  If you want to skip PARM.SYS and just work on
LOCATE.SYS, answer "Y" to this question.
Do you want to skip PARM.SYS? $This is not the original FMS Installation Disk - 
I cannot find any ".PRM" files on it.  Do you want to
skip this and work on LOCATE.SYS? $These are the names of the PRM files on this disk:

$
Please enter the name of the file you want to use. 
$If you are modifying an existing LOCATE.SYS, 
put the disk containing LOCATE.SYS in the current
drive (the one you have this program in) and
enter RETURN: $
I cannot find LOCATE.SYS on this drive.  Do you want to
create a new one? $Take out this disk and put in your FMS System Disk.
Then, enter RETURN: $I cannot create PARM.SYS on this disk.
$
To look at the current entries and their values, 
      enter "?".
To go through all the entries and (possibly) change them, 
      enter "ALL".
To review or change a particular entry, 
      enter the name of the entry.
To change the disk letter for all file entries, 
      enter "DSK"
To create a new LOCATE.SYS from what you have done, 
      enter "END"
At any time, to quit immediately, enter CTL-C.
$
No entry by that name.
Please enter RETURN now: $(Y or N): $
This will change the disk letter for each file entry.
Enter SPACE or a disk letter (A-P): $Current choice is: $Enter RETURN to keep the value as it is.  Your choice: $Do you want to quit, leaving everything as it was
when you started? $(SPACE)You can decide to accept or reject records with duplicate
keys during the UPDATE process.
Do you want to accept records with duplicate keys? (Y or N)
$cYYN There are three recognized date formats.  You control
which one will be used by making this selection.
Using September 2, 1950 as an example, the choices are:
   S   (Standard)       09/02/50
   I   (International)  02/09/50
   Y   (Year first)     50/02/09
$cSSIIYY This entry determines whether the PRINT program will
skip a line after each record printed.
Do you want it to skip or not?  (Y or N)
$cYYN  This entry allows you to determine the page width used 
by all of the printing programs.  You can specify any
EVEN number from 80 through 132.
This is only used when printed output is going to the
printer.  If you select print-to-screen with the "CCC"
entry, this and the page length entries will be ignored.
$nP RATBVCXDZE\F^G`HbIdJfKhLjMlNnOpPrQtRvSxTzU|V~W�X�Y�Z This entry allows you to determine the page length used by all of the 
printing programs.  This is only used when output is going to the printer.
If you select print-to-screen with the "CCC" entry, this and the page width
entries will be ignored. The choices are in lines-per-page, which is the
total number of lines from the top edge to the bottom edge of
the paper.  The columns below labeled "INCHES(8)" and "INCHES(6)"
tell you the number of inches at 8 lines per inch and 6 lines
per inch, respectively, which will result from the associated choice.
For example, if you have 11-inch paper and your printer is
set for 8 lines per inch, look down the INCHES(8) column for
"11", then look left to "88" and enter "88".

CHOICE  INCHES(8)   INCHES(6)    ::   CHOICE  INCHES(8)  INCHES(6)
  33    (4.125)      5.5         ::      44     5.5        (7.33)
  51    (6.375)      8.5         ::      68     8.5       (11.33)
  60     7.5        10           ::      80    10         (13.33)
  66    (8.25)      11           ::      88    11         (14.66)
  72     9          12           ::      96    12          16
  84    10.5        14           ::     112    14         (18.66)
$n!A3B<CBDHETF,GDHPIXJ`KpL This entry controls printing of transactions after they
are sorted.  Do you want transactions to be printed?
Answer Y or N
$This entry controls whether FMS will stop and wait for
you to read the screen or mount a disk at various times.
If you say no to this question FMS will put messages on
the screen at those times but will not wait for you to
read them before going on.
Do you want FMS to wait? (Y or N)
$Normally, you will want to sort your INDEX files after
doing an UPDATE.  If you want to disable this for some
reason, answer "N" to this question.  If you are not sure
answer "Y".
Do you want the INDEX sorted after UPDATE? (Y or N)
$cY NN The SORT program tries to avoid destroying your files
in case of errors by creating a new file with the sorted
output.  It gives this new file an extension ".SRT".
(this does NOT apply to INDEXES or TRANSACTION files; only
data files.)  You have to delete the ".DAT" file and rename
the ".SRT" file to complete the sort process.  If you want
FMS to do that for you, answer "Y" to this question.
Do you want the SORT program to delete your data file and
rename the sorted file for you? (Y or N)
$You can use this entry if you have no printer, or if you
want to review printed output on the screen before sending
it to the printer.  Instead of the page length you have specified
in the LLL entry, FMS uses a length of 23 lines for the screen,
and will wait at the end of each screen full for you to enter
RETURN before it goes on.  The page width for screen output can
be set to 79 or 80.  These are your choices:
P	Printer: send printed output to the CP/M list device
W	Wide: use the screen, all 80 columns
N	Narrow: use the screen, 79 columns only
$cPPW NA This entry determines the disk SORT will use for scratch
space if it needs it.
Enter a drive letter from A-P, or SPACE for current drive
$c  AABBCCDDEEFFGGHHIIJJKKLLMMNNOOPP This extension is for Automatic FDs, created by SUBFILE.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Batch Files.  CMD is treated the
same as SUB. (Depends on how you name your Batch Files)
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Control Definitions.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Data Files.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for EFM Source Code. (FMS-80 only)
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for compiled EFM programs, output
from the EFM compiler.  (FMS-80 only)
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for File Definitions.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Indexes.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Menu Definitions.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for the new data file created by the UPDATE process.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for the file produced by PREPARE when
you have requested the listing to be placed in a file.
(FMS-80 only)
$This extension is for Reject files created by the
UPDATE process.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Report Definitions (FMS-80 only)
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Screen Definitions.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Selection Definitions.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for SUBFILES, created by the SUBFILE program.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for the sorted output file created by SORT
Enter a drive letter from A-P, or SPACE for current drive
$This entry should be set to the Current Drive unless
you have a really good reason to change it.
Enter a drive letter from A-P, or SPACE for current drive
$This extension is for Transaction Files.
Enter a drive letter from A-P, or SPACE for current drive
$   FREAD    @��  FCLOSEV   ��  FMAKE    @��  FWRITELS  �'!�' �K-ɿ*�'�*�'̀)"�'*�'�*�'̀)"�'ɿ*�'�*�'͇)"�'*�'�*�'͇)"�'ɿ*�'�*�'̀)"�'*�'�*�'̀)"�'ɿ*�'�*�'̀)"�'*�'�*�'̀)"�'ɿ*�'�*�'͇)"�'*�'�*�'͇)"�'ɿ*�'�y)"�'*�'�y)"�'*�'�y)"�'*�'�y)"�'ɿ*�'�r)"�'*�'�r)"�'*�'�r)"�'*�'�r)"�'ɿ*�'�r)"�'*�'�r)"�'ɿ*�'�y)"�'*�'�y)"�'���(!�'�' ����(��(��'�!�'�' ��!�'�' ��!�'>  w�����(!�'�' ���!�'�' ��!�'�' ���)!�'�' ��!�'�' ���}o|g�|g}o�}�o|�g�}�o|�g�:�'�O��):�'��G��B)�x�2�'�:�'��)�͎)ͻ)ê)!�'>  w����>!��=��:�'���)�.(͂(��)͎)��)ê)!�'>  w����>!��=��ͨ(!�'�' ���*�'�*�'͇)"�'*�'�*�'͇)"�'��)!�'�' ��:�'�2�'��)!�'�' ���2�'!a+"�+!�'"�+!�'>  w����!
 "�'��'ڇ*��):�'�0��+�s*:�'�0��+:�'O !�'	�!a+~#*�~#��!�'>  w�����~#��02�'��(�J(��=���ú*� � ��!! q#p����*��+��+���+����+��! 6 !  6 ���*����*��� ����#� �!! ^#V#~���N+��*!�N+��*"�N+��� ��� ���*��XXVAL    @��  MNTTXT    @��  MNTVAL(W  @��  IIITXT    @��  IIIVALjW  @��  NNNTXT    @��  NNNVAL    @��  CCCTXT        �*�+�E-��+w#"�+*�+�E-��+4��~#��+� ,�N#� ,���+> ��+<  TABLE    �    ENTSIZ    @(@		QANDW  �b�  FILES;[  @��  DLRTXT    @��  DLRVAL    @��  AFDTXT    @��  AFDVALY  @���  ��(�����O�  �����-�,
-�,�, �,,!,6 :,�8D͚,��!�,ã-��ͥ,���~�(�5>ͥ,> ͥ,>ͥ,���O:,�(�yͥ,4����
̥,�6 !,�|��}��|��}��z��{��z��{��x��y��x��y����$%�,-��?-���+�K-N #�?-���#�\-N #�?-�͆-��~͆-O���#�m-�a��{��_ɾʞ-45ʞ-###Ï-#ͧ-�͏-��~#fo��           �S�-�C�-�S�-�S�-�2�-"�-� � �[�-� ����[�-� �� > �������_ !� �*�- �B�"�-�#�[�-���S�-!�-4�!�-5�..6 7�*�- ��"�-��-�C�-�S�-�S�-�2�-"�-� � �[�-� ����[�-� �� > �������_ 