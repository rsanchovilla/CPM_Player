�Maintain  (tm)
Copyright SORCIM Corp. 1982
Version 1.0
y�0����2͵��͖�Gͻ͋���͖��1ͻͯ���2ͯ��͖�(Ăy



























$                                                                      V6U#^6�+~�U��#~����+6�#6U+~��r��#~�Us��+z/w~/�w��#{/w~/�w�� +~���#~���#y�x���×   �`+
*** A memory test is being run, please wait a few seconds ***
$>2?* ++DM!=���`+*** Your memory passed the test with no errors ***
$�����+rrr#sss��`+
Memory error detected at byte (decimal) $��0�`+

This is a serious problem, call the person with overall
computer responsibility.  Then run MAINTAIN 15 times to
check for intermittent errors.  If this check of memory
gives another error,  call hardware  service and do not
run any programs.

$�",�  1�* ++"!1��1͚+�q(2
)2)�E2�2?͔2�?͚+�2�(�`+MENU FOR MAINTAIN (List of things you can do)$ ͺ+�`+PRESS  IN ORDER TO
-----  -----------
$�`+  V    VERIFY integrity of a computer program bought from SORCIM
  R    REVISE a progam (requires a Hard Copy Revision Sheet)
  S    SHOW instructions of remedies for damaged programs
  ?    HELP - show user instructions
  X    EXIT this program and return to CP/M
$    :?��@ͳ+�O,̓,�V��S��Rʏ�?��X�  �:�(���͚+���+:�(��?>2�(���<͚+�`+

This program is designed to help you maintain computer
programs purchased from SORCIM Corporation.  It performs
two functions: (1) It checks programs to determine whether
they are damaged (e.g., its lost because of power line
noise, wearing out of disks, turning power off the disk
drives before removing diskettes) and (2) it allows non-
programmers to make revisions (i.e., "patches") to the
SORCIM supplied programs using only a typed sheet of 
instructions.

$��%͚+�`+

You may VERIFY the integrity of programs by selecting the
first option in the MENU for this program and answering
the questions.  It is a good idea to do this upon first
receiving software to ensure that no damage has occurred
during transit. Any time the SORCIM software behaves abnor-
mally, VERIFY the program (files ending ".COM" or ".OVL")
with this function.  Please note that this does not re-
place  backup procedures,  since you will need a good
copy to refer back in case there are errors.

$��%͚+�`+

You may make SORCIM authorized revisions to programs purch-
ased from SORCIM by using the second option, REVISE.  To
do this, you need a Hard Copy Revision sheet from SORCIM.
One of these sheets has changes to the programs coded in a
fashion that a user can type the revision with no tech-
nical knowledge and no fear of making typographical mis-
takes. It allows SORCIM to maintain the software without
the inconvenience and delay of mailing disks.

$�",�<                                                                                                                                                  �AO�AG���O�AG����O�Gy�����A��_ �`+Line Number ${�
Ҩ> ͉)�0��d delay of mailing disks.

$�",�< �!��������!���a> ͉)�������Aw#���Aw#�  y�+�AG̵)�A�w#�"
�    �2)qG>���,��� ���0�P>O�1�W>I�_�A��   ��1:a͉�`+:  $!�1N#> ͎/�>^�1�^�`+

**  The marked character is not allowable here.
$>���X��>�2)>X���Q�^w# >���&�>:)<�y���`+
**  There are too few characters in this line.$>�ͺ+��`+
**  There are too many characters in this line.$� O�͉)�bW�G�~�WxC�yF��W#�tz�͚+�`+What is the NAME of the file for REVISION?

$�G͚+�`+You should have a SORCIM HARD COPY REVISION SHEET.  Please
type the revision carefully.  There are internal checks to
find possible typos, but take care.  MAINTAIN will only
revise a program when all revisions have been typed correctly.

$�`+-- Type the Revision Code or press Return Key to EXIT -->$�1͐)�
�¿!�1�e/�q/~��{�`+**  This input has the wrong number of characters.
**  Please re-type the Revision Code.

$ÿ�1�bg:�1����`+**  This is not a valid Revision Code.  Please re-type.

$ÿ :�1G:��ʏ�`+**  This Revision Code cannot be used in $�(��-�`+.
**  Please (1) be sure this revision applies to this file, and
**         (2) the revision code has been typed properly.

$ÿ:�1�AG:�1�A�G!D+w!�~��A#�¨�`+**  This revision has already been made to this $�(��-�`+.
**  Do you want to re-input this revision a second time?$Ͳ�Y�5+~�+�Aw##�36 p#~���S+6 !�#�3!D"-�2a:a<2a�`+Please type $:a͉�`+ or press Return Key to EXIT

$�O,:a͉�`+:  $�1͐)!��1���ͳ+�O,�`+**  Please re-type $�t�
�¿*-��X�b���*-"/ �"-�:a�lG��_�`+**  The internal checks indicate this line is incorrect.
$*/"-ÿ�]͚+�`+The revision is being processed.$*D:a=/_�D�*-��&ʘ�`+

The revision typed is internally inconsistent.  The likely
cause  is a coincidence of several mistakes made on one of
the lines you typed. The revision must be typed correctly.
Please redo the revision with the utmost care.

$��%Ï�	'*-�! Ͷ/�!D+��'�&� ��&¦!D##>�^#V�����)#���("-�J) B�w(�(�Y(�^ C#N�! B��#~#x������(*-�J) B�w(�(�_(<��**-�ͺ+���ͺ+�(!  �J)��`+REVISION IS COMPLETED.

$��%͚+�`+The copy of the program, $�(��-�`+ has the revision.

You should now do the following to your disks:

 (1) Save  one  copy  of the  program before the revision
     with a name ending in OLD, e.g., SP.COM --> SP.OLD

 (2) Carefully replace ALL copies of the old program 
     with the revised copy you have just made.  Do this
     now to prevent confusion.  Please note that if you
     become confused about which copies of a program have
     a revision, run MAINTAIN under the  OPTION  "VERIFY"
     and MAINTAIN tells you what revisions have been made.

 (3) After a couple of  weeks,  destroy  the  copy of the
     program with type OLD to prevent confusion.

$��%�<�`+
Your input: $�1�^�`+

-- Is this correct?  Press Y for Yes, N for No -->$�O,Ͷ,�Y�h���N�p>����+�`+-- Press C to continue or  X to EXIT -->$�O,Ͷ,�C�
�X�5+�p�`+

-- Press Y for Yes, N for No, or Return Key to EXIT -->$�O,Ͷ,�Y��N���5+��+ò�&�&!���/͖&�"�� �w(�(*��J)z�w(�(�_(<̵)�y-<̵)ͺ+��-�`+ has check values placed.$ͺ+�ISA valdtn REC  ISA valdtn REC                                                                                           �                                    ͚+�`+What is the NAME of the file for VALIDATION?

$�G�>+�<�O,�`+-- Type file name or press Return Key to EXIT -->$ͅ.��<<�G͚+�(!�1�0.�`+MAINTAIN is now checking  $��-�`+ for possible errors
$�A-<�_�`+**  This file  cannot be found.   Be sure the name was typed
**  correctly and that this file is on the correct diskette.
$�",�Gͳ+!  "�"���& B�w(ͱ&<ʡ��& B!iN#��& �t*�"� B!z���/�tͳ+*��*�|���"�0�`+ records have been read from $�(��-�`+
No validation record has been found.

SUGGESTED ACTION:  Be sure this is a program file
(suffix .COM) or overlay file (suffix .OVL) which
has automatic validation (dictionaries  and  text
files have no validation records).   If so,  this
file is lost and you must follow the damaged file
instructions.

$��%͚+�`+SUGGESTED ACTION FOR DAMAGED FILE:

  (1) Notify the person in charge of the computer.

  (2) Make a backup copy of the damaged file and 
      delete the file from the regular disk.  
                
  (3) VERIFY your best backup copy of the file   
      with this program.                  

$��%͚+�`+  (4) If it checks, carefully replace all  copies
      of the program with the good copy.  Be sure
      you have backup copies of the good program.

  (5) The damaged program may have produced other
      inconsistent files or indicate  that  hard-
      ware  errors  exist.  Watch  out  for other
      errors in computer results.

$��%͚+�`+

HOW TO AVOID DAMAGED FILES

There are 3 major causes of damaged files.

  (1) (MOST COMMON)  The diskette was worn out (old)
      or damaged by mishandling. All diskettes even-
      tually  wear out.   Their life is considerably
      longer if handled carefully.

  (2) The  file was damaged  by another  program, in
      particular, file manipulation programs such as
      PIP. Although it is rare, one must always note
      whether some  programs,  particularly new ones
      are responsible for damage to other programs.

$��%͚+�`+

  (3) There is a hardware error in the  system.  In
      most  cases,  system  operation simply halts.
      However, infrequent errors do sometimes occur
      and one must go to backup files and hope that
      the computer can be serviced.

$      ��%ͺ+�5+!����&�A$�`+The validation record appeared at record position $*���0�`+
rather than at the end of the file.  This is caused
by bad system software.  It will not effect correct
performance of SPELLGUARD  (if the file validates),
but other software in your system  may  be  damaged
and you should look into the problem.
$�",͖&x�ʉ$�`+
This file has ERRORS in the last (validation) record$ͳ+��%   �(͉-�&�!�&��&��$ͺ+�`+****  $�(��-�`+ has ERRORS.     

$��%�ͺ+:�2 �2)!�~��%�`+No revisions have been made to this file.$Ý%�`+Revisions have been made to this file in the following order:

$:)<2)��̳+~�O���A2y��A2 �a �b͉)�n,�#~��^%ͺ+�`+***  $�(��-�`+ has NO ERRORS ***
$�",��O,�`+-- Press X to EXIT or any other key to continue -->$�(�_�X��>+�5+  �	'*�"�!�"&!  "���&ͳ+ B�w(ͱ&<̵)��&*&^#V�*�Ͷ/z���&#�^ ! B����'�#^#"& ! B �#�! ����'Å&! B�8'!��!���&� �6&!z~~�_ҥ&#&N#F��/��(�Y(�ʾ&>��*�#"�� ><2�&�>*͉):�&=��&ͳ+><2�&����#��&�         �7���PL          !�&�&��/>2'!�&"'Ɉ�8'��� �� '<2'�@�>'� ���~#�G:�&�2�&!�& ~�Y'�T'zx�e'�G#�O'*'~�w#:'=�'!�&>2'"'xGҘ'!�&~w#'xG��':�&�O>2)!�&^�{�gz/��L�w#:)=2)­'zWҚ'��{�z��>'�        S�!�}(��#)        �`+ Disk $�A͉)>:͉)ͺ+>��  ��}(��'����-)��-)�	�-)�
�-)��#)��-)��}(��}(��}(��}(��)��)��}(��}(��#)��-)��� � ���)�   ~w#'xG��':�&�O>2)!�&^�{�gz/ �L�w#:)=2)­'zWҚ'��{�z��>'�        S�!�}(��#)        �`+ Disk $�A͉)>:͉)�  �G:)��#)�Xx2)�;(���� ���� ���� ����� ��:
)_2)�;(���	 ͚*���͘/Cͥ/��ͮ/HE�! ~� �)�y-��̵)͉-��̵)� !  p�    �_�(��ͨ)ͳ+���5+  Ͷ,�
��5+  �/(������� �`+
System or data error$�`+
CODE # $��0>-͉)��0>-͉):#1_ �0�`+
1) Run MAINTAIN to verify SP.COM & SP.OVL. 2) Copy files
to new diskette. 3) Look for abnormal file conditions.
$�",�                                       :I)�̵)�����!! �s#r#�w����'���*ɗ͎/�A-<��*!# �w+�yw+怰w��'���*���`+
System file error - serious only if repeats.$��)�`+
Control logic error.$��)�>+1��<�(�X+�(�X+�(�X+�9)�    ���y-����)(��>$�#�i+��� �対#�u+��:�'�ʔ+��$+���ʔ+��)(�  �:�'�Hʫ+��)(��ͺ+��   �`+
$�ͳ+ͳ+�  �`+** Your answer "$���+  �`+<RETURN>$��
��+͉)�`+" can't be used, please answer again **

$��O,�`+
-- Press any key to continue -->$ͨ,�:�'���5(���(�h,>
�p,�h,�>͉)�>O> �͉)�v,�     �`+-- Press Number or Letter -->$ ö,�(ͺ+�       �(� ʶ,ͺ+�a��,�{��,�_�
�>�  ��G~#���,͉)��,���   Ͷ/ �͘/�� y�x�> ���w(��Y(��-�� ���,>��   y�x�> ���w(��_(��� ��->��    �M(�   �:-<�X-�A(����+~��w����`+
**  $��-�`+ not found on$��'���)��G(�  �ŗ! :I)�ʼ*q#�͎/�A-<��*�!  p�� �e(������� ����`+File "$�!
)���-�A͉)>:͉)!�1��/� ��-6.#��/6"#6$�1�)(����                                       �����):
)�!	 "�(!.�$��/��O=�i.�:�i.�A+w##.��/*�(��/�� �S(��   �1�/(ͳ+  !�1~�.>� �e/�¥.<��q/!�1N#>�ҿ.#~+�:¿.##�W��/	~�.��.���/�/�!�/��!�.��
/#��.��.<>.,;:=?*][ ���/#��.����ͳ+�!�1N#~�_�(�6 �/�`+  is incorrectly formed file name
$�6^!�1N#~�_�(��P/ͳ+>��!� �N#T]��/�px�N����#~�aڅ/�{҅/�_w�v/��   �w#Ï/� �zW{_/� �)¦/�� {�oz�g� {�_z�W� z�W{_� y�Ox�G� �xGyO�  ���w#��/�   ������/w#��/��  �G��� �	0w#� 0x�  �30��2�)(�� �30��2� �0�&0   ����!�2��[0�! 6$�����  '�d 
  ��   6 #��!L0>�N�0���>0��|06 #�q0>��#~6,+Fw+p�  #F#���}�o|�gҔ0	>0����w#��c0   �`+
BAD EXIT.  Run program MAINTAIN to check for a bad disk
$�",�9)�      Ͷ/͘/�  >͉):�'�H�>
͉)�      N B pc ���!�2�6 #6 #~>͎/�2�w(��_(�� �    ��|g}o����f1�#�U1�h1>ɾ�>�          ��/   x��1 Ð1#    w11� ���/�*�1"�1�  ��y1�*�1�ͮ/"�1��        ���*�1�*!1Ͷ/��1*�1"!1�*1�ͮ/��`+Out of memory. SPELLGUARD needs $�0�`+ bytes (dec)
in Transient Program Area
$�",�  :H)�� !  � |��^2>2I)�}� �l2>�9)�Z2�0>�Z2�`+                            $��`+


$�s2�`+ Maintain (tm)
$�s2�`+  Version 1.0
$�s2�`+   CPU: 8080



$�s2�`+Copyright 1982
$�s2�`+ SORCIM CORP.
$�s2�`+Santa Clara, CA.









$�O,�`+
-- Press any key to start --->$ͨ,͚+�                                 ISA valdtn REC  C e   #��                  wA.���9�                                                     �                    �