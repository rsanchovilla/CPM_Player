�=FRINSTAL
 - installation program for FRONT.COM version 5.0
Copyright (c) 1984, 1985 Claude Ostyn
This program will automatically 
modify FRONT.COM to fit your needs.

All changes are reversible by running
FRINSTAL again.

 (Program will not run correctly if the
copyright notice has been altered)



A.  Computer or terminal installation
B.  Installation of file types to be listed/executed
C.  Functional features installation
S.  Save changes
?   More information
ESC Exit program without saving  Press the key of your choice   FRONT50 COM  FRONT   COM * |�g+"��N+!��+�(�t+

Enter name of file to install, or
just <RETURN> for  � <2#�@̀+�t+:FRONT50.COM
or ^C to exit FRINSTAL:  �d����#(���U��!#�(�#(�����t+

Maybe it exists under the name FRONT.COM,
AUTOST.COM or AUTOEXEC.COM.  You may have to
specify another drive.
 �U���� <\ 	> �r!e 6C#6O#6M��+!#?~���G��U!%?~+�:­~ͬ+�@2\ ##] +#~ͬ+�.��� ����³e #~ͬ+�������+:#?�:Y�C���t+
File found:  ͪ):P�(�:4P�0�7�t+
is not a matching version

 �U�N+�t+* File name used in this installation:   ͪ)�t+
* Terminal/computer:  Ͳ�t+
* File types listed/executed:
 ͕���t+*  ̈́$�A+!��+!6��+:�,� ���t+again �t+     �^+ͬ+���'�A�1�B���Cʃ�S�8�?�G�/�G��  
PRESS ANY KEY TO CONTINUE OR "M" TO RETURN TO MENU  �N+�t+WHAT IS FRINSTAL.COM?

This program is used to install FRONT.COM
(version 5.0).  FRONT and FRINSTAL are copyrighted
programs which may be distributed and copied by
CP/M users for personal use.  FRONT and FRINSTAL
may not be sold or included in a package for sale
under any name without written permission of the
author.  The copyright notices may not be altered.
  A lot of work went into this program package. If
it is useful to you, a contribution ($15 or more) 
will be appreciated as an encouragement to further
development and general morale booster.

    Claude Ostyn
    P.O. Box 2035
    Sitka, Alaska 99835
    U.S.A.

  Press any key for additional information on the
installation procedure, or M to return to the menu. 
 �^+ͬ+�M�7�N+�t+COMPUTER/TERMINAL INSTALLATION

  Terminal installation is necessary so FRONT can
position the cursor on your screen and turn 
highlighting on and off if it is available.
  At the terminal menu, just select the letter
corresponding to your terminal or computer.
  This version of FRONT.COM supports some
ANSI terminal video attributes.
  If your terminal is not on the menu or if the
installation does not work properly, please see
the file FRNT40PT.ASM or notify Claude Ostyn,
Box 2035, Sitka, AK 99835.
  Note that if FRONT cannot recognize arrow keys
on your terminal you can use ^H,^J,^K,^L instead.
 !��+�^+ͬ+�M�7�N+�t+FILE NAMES INSTALLATION

  File names installation allows you to determine
which types of files will be displayed on the menu.
FRONT will either show .COM files only, or show .COM
files as well as up to 8 other types such as .SUB,
.BAS, .CMD, .INT or types of your choice.

  You will also be able to change the name of the
.COM file required to execute automatically each 
one of the file types above (such as MBASIC.COM,
CRUN2.COM, SUBMIT.COM, etc.).

 !��+�^+ͬ+�M�7�N+�t+SPECIAL FEATURES

  When different types of files are to be shown on
the menu, it may be useful to know what they are.
  You will thus be able to set a switch in FRONT so
that file types will be shown as well as the names,
or set it to show the file names only. (the .COM
file type is never shown).

 You will also have to decide whether you want the
menu sorted alphabetically, or to keep it in the
same order as in the disk directory

 !��+�^+ͬ+�M�7�N+�t+More special features...

  Special features installation will allow you to
determine whether FRONT should always default to
a specific drive and whether it should show a disk
label if it finds one in the directory.

  Other features which you may modify are a
delay before the selected command is actually
executed (to give you a chance to stop it), and
the optional method to make FRONT run again
automatically after the command has been
executed.
 !��+�^+ͬ+�M�7�N+�t+SAVING

  The new FRONT.COM file will be saved under a
name of your choice.

You may change disks without hitting ^C, (do NOT
hit ^C unless you want to exit FRNSTL50), and
you will be returned to the main menu after each
save.  This makes it easy to copy your installed
FRONT.COM onto as many disks as you like under as
many names as you like

  This is the last of the help screens.  Please
be sure to read FRONT50.DOC.

PRESS ANY KEY  �^+�7�N+��+�t+Put destination disk in any drive
and enter file name under which
the installed FRONT should be saved, or just
press <RETURN> for  ͪ)��+!\ $ ͏+�d� ��!\ $ ͏+�t+Saving  ͪ)!] �R ͏+Ͷ(�7o read FRONT50.DOC.

PRESS ANY KEY �N+�t+TERMINAL INSTALLATION

Now:  Ͳ!R-"�,>A2�,�2�,��+*�,~�ʳ!�,~4̀+>.̀+> ̀+*�,#��+0"�,!�,~<�ʫ6�>|̀+> ̀+�j6 ��+�j�t+
No other terminals are supported by this version
of FRINSTAL.  Please refer to FRONT.DOC for patch
information.

 �t+Select by letter, or X to exit to main menu

 �^+ͬ+G�X�7��7�0ʧ�A�_x!�,��_x�A!R-�ʔ0=È"�,% �P͏+�1> 2�R!�,Û:rQ���!fQ��+��t+No terminal/computer selected yet ��N+�t+Current selection will be shown between parentheses.

Press RETURN or ENTER to leave unchanged
or ESC to return to main menu �t+


FRONT can list and execute files of up to 8
different types in addition to .COM files.

The file types now selected are:

 ͕��+���t+

Change?  �^+�ʒ�_�Y�S&�b&:R!�,w�t+

List/Execute .COM files:  ��*�ʏ��m:�,!Rw� �j>Cw#>Ow#>Mw!R"�,! R"�,> 2�,��+�t+
Special type  :�,�1̀+�t+ of 8  =   *�,~� ʸ��+���t+none �t+    Change?  �^+��m��!ͬ+�Y�S&�b&�F��~*�,~� �M��~*�, "�,*�, "�,:�,<2�,��~Ò:�,� �m=2�,*�,+++"�,*�,+�;"�,�~*�,�H'�!C,��+*�,��+!d,��+*�,���+��t+
    Change?  �^+���_�Y�S&�b&ʴ&��r&�7!R~� ���t+   ��+�t+ -- executed directly ��t+COM - not listed/executed except with types below �!R"�,! R"�,  *�,~� �cx�����+x�1̀+> ̀+���+�t+ -- using  *�,��+��t+.COM    ����c�G> ̀+�Y�*�, "�,*�, "�,y����+��N+�t+
SPECIAL FEATURES
Press RETURN or ENTER to leave unchanged,
or ESC to return to main menu. �A+�t+


Display file type with names on menu:  !zR��*�ʒ����t+


Sort menu alphabetically:  !|R��*�ʒ��(�A+�t+


FRONT can automatically log to a specific drive
every time it is started, or it can stay with the
current drive (this is the normal setting)

Should FRONT log to a specific drive instead of
the current drive at the time it is invoked:   :�R!�,w��*��M#���:�,� ���t+
Which drive (A..P)?  :�R�ʜ�@̀+>̀+�^+ͬ+��Z���G�@�����2�Rx̀+���2�R�A+�t+


Many CP/M users identify their disks with
a "dummy" file name beginning with a "-" character
(such as -WORKDSK.005 or -LIB/UTL.048). 
CP/M 3.x uses a special directory label.

If such a file or label is found on the disk,
do you want FRONT to display it above the menu?   !�R��*��M#�A+�t+


There can be a delay between the time you select a
command and the time FRONT actually executes it.
This allows you to press ESC and cancel the command.
The actual delay time will vary with different
machines.  You may have to experiment to get the
delay value you want...
The allowable range for the delay value is
0 (no delay) to 99 (decimal values).

The delay setting is now:   :�RG�d�xÐ>c͓&�t+  ...Change ?  �^+��M#�_�Y�b&������N¥�S&Ë��+�t+Enter new value for delay:  __  >2"?��+�t+           !#?~��`��5���#~́&�����0� �5G��
�.G#~́&�����0�2�R�t+        New delay =  �x�t+No change:  delay =  :�R͓&�4545x��A+�t+

Depending on your CP/M implementation, several
methods can be used to run FRONT again after
executing a command.  See FRONT.DOC for more
information on these options:

0.  No special auto-repeat utility 
1.  Standard Osborne 1 implementation.  
    You must save installed FRONT as "AUTOST.COM"
2.  Standard CP/M implementation:
    Auto-repeat of FRONT by the standard CCP SUBMIT
    handler  (works with most systems).
    Your installed version of FRONT must be on
    drive A: at runtime, but SUBMIT.COM is not required.
 �t+
Now:   :�R�0̀+�t+     Change?  �^+��M#�_�Y�b&��!���!�N��!�S&�@"�t+

Press number for your choice (0-2):  �^+G�0� "x�3� "x̀+�02�R��P#î!:�R��P#�A+�t+

(In case of doubt, you might try to answer "Yes" to
the question below.  You can always run FRNSTL again
and change this option back to "No" if FRONT hangs
instead of executing commands).

Is your version of CP/M a truly standard version? 
 !�R��*�7�t+

Should FRONT display a "disk error" message
that tells the user what to do if FRONT fails to
create its temporary $$$.SUB file it because the
disk in drive A is write-protected?
(In case of doubt, answer "Yes" if your drive A
is a floppy drive, or "No" if your drive A is
a hard disk)   !�R��*�H"�t+Functional settings:          Standard CP/M:  :�R��S&�b&�t+
  Show file types in menu:  :zR��S&�b&�t+   Sorted menu:  :|R��S&�b&�t+
         Default to drive:  :�R��8%�@̀+�H%�t+No selection �t+
          Show disk label:  :�R��S&�b&�t+
          Execution delay:  :�R͓&�t+
 FRONT auto-repeat method:  :�R���%�t+None installed ����%�t+Osborne 1 AUTOST.COM ���;&�t+Standard CP/M "SUBMIT" utility :�R���t+, error trap message ON ��t+Custom installation ������t+No ����������t+Yes ��������:  x��v&����0��&�
�&�:�>��ͤ&�z�0̀+�{�0À+  ��
Ҩ&�
_����+�t+   New name (must include drive):  _:________ ��+!#?~��'��&!%?~�:·&*�,�!$? ͜+��t+                      Unchanged:     *�,��+�t+
    New type (enter exactly 3 characters and
    use spaces to pad if necessary),
    or press <RETURN> only for no entry:  ___ ��+!#?~� ��'��H'*�,�!$? ͜+�*�,w#w#w��t+

Bye...

 �  !\ "6 #�(�\  Ï+! P"�,\ � ���R(�t+
Can not find  ͪ)��+>�ɯ2�,*�,�� \ � � �w(�ʧ(�*�L(:�,<2�,*�,� "�,: =��V(��+�t+OUT OF MEMORY �L(\ � ��+��*�! P"�,:�,2�,� �2| !  "h "j \ � ���%)�t+OK to overwrite existing  ͪ)� ,�)�t+
CANCELLED

 ã)\ � \ � ���:)�+*>�ã)*�,�� *�,� "�,\ � � �b)�M*>�ã):�,=2�,�:)��*\ � :�,2�,>2�,>̀+ͪ)�t+ saved OK            ��+��*���:\ �����)�@̀+>:̀+��)� �2\ ÷)!] ~���)�� ��)̀+#��)!e ~�� �
*>.̀+!e ~�̀+#��)�����+�t+Permanent read error
 ���+�t+Cannot open for write 
 �t*��+�t+Permanent write error!
 \ � �t+Disk may be full; try another disk


(Press any key after reading this message)
 �^+�� � ���+:$?�_�@��*���*�ɯ�"�,~� ��*!m,� +!u,��+*�,�^+ͬ+�����Y�"+6!},��+>Y��N�1+6 !�,��+���� +!�,��+*�,~���+>=O�R+��+>
̀+�R+>À+����� � �a+2�,����㯆#��̀+�t+����_� ������~#x�+���~ͬ+#x�+�����a��+��+��_��+�����~� ��+̀+#��+x������+>̀+>
À+�~�� ��+�$��+̀+#��+�����!#?6 +6P�
� !#?^ #6 �,�����t+ (Y/N)?:  �^+���+�ͬ+�Y��N� ,� �
    .COM file used to run the   files:  (YES) ? (NO)  ? ==> YES ==> NO    
    Change  #x                        +� P       =                                                                                        �  �  �  �  no term sel.            Osborne 1                           $4       =           S      T    R    E    (l  )m  (    )    )      (      Å�  êåOsborne 1                !� @P ��� @x��* .�~��>P2��ì:�=�* .` #~�A��}֠���#~�U���:��++~�	�+~����¶p��� �2�: $G�>2��� Osborne 1 with Nuevo 80 col. board  $P       =                    T    R    E    (l  )m  (    )    )      (      �  �  êåOsborne 1-80             !� @P ��� @x��* .�~��>P2��ì:�=�* .` #~�A��}֠���#~�U���:��++~�	�+~����¶p��� �2�: $G�>2��� Osborne Executive or Vixen          $P       =                    T    R    E     j    k    j    k    k      k      �  �  �  �  O Exec/Vixen             ` #~�A��}֠���#~�U���:��++~�	�+~����¶p��� �2�: $G�>2��� Osborne Executive or Vixen          $P       Morrow or Liberty                   $P       =                    T    R    E     (    )    (    )    )      (      �  �  �  �  Morrow                   ¶p��� �2�: $G�>2��� Osborne Executive or Vixen          $P       Morrow or Liberty                   $P       Older Kaypro II                     $P       =                         R    E                                                   �  �  �  �  Older Kaypro             ixen          $P       Morrow or Liberty                   $P       Older Kaypro II                     $P       Newer Kaypros, using inverse video  $P       =                         R    E     B0C1C0B1B0   C0   C0B1  C0C1  �  �  �  �  Newer Kaypro                           $P       Older Kaypro II                     $P       Newer Kaypros, using inverse video  $P       Newer Kaypros, using highlighting   $P       =                         R    E     C1B0B1C0C1C1B1B1B1     C1C3  �  �  �  �  Newer Kaypro                           $P       Newer Kaypros, using inverse video  $P       Newer Kaypros, using highlighting   $P       ADM-3A                              $P       =                    T                   )    (    )    (    )      (      �  �  �  �  ADM-3A                   nverse video  $P       Newer Kaypros, using highlighting   $P       ADM-3A                              $P       Zenith                              $PE      Y                    K    M    L     p    q    p    q    q      q      �  �  �  �   Zenith      ?t ?x ?v ?r ighlighting   $P       ADM-3A                              $P       Zenith                              $PE      RS Model II/16 w/P&T ADM emulation  $P       =                    T                   )    (    )    (    (      (
    Å�  �  �  R-S II/16 PT             ��@         $P       Zenith                              $PE      RS Model II/16 w/P&T ADM emulation  $P       Apple CP/M or Soroc                 $P*      =                    T                   (    )    (    )    '*    (      �  �  �  �  Apple/Soroc                            $PE      RS Model II/16 w/P&T ADM emulation  $P       Apple CP/M or Soroc                 $P*      ANSI terminal (CP/M 2.2 or CP/M +)  $P[H[2J [      ;   H      [K                  [7m  [0m  [7m  [0m                    �  �  �  �  ANSI         [D [A [C [B DM emulation  $P       Apple CP/M or Soroc                 $P*      ANSI terminal (CP/M 2.2 or CP/M +)  $P[H[2J DEC VT52                            $PHJ    Y                    K                   p    q    [7m  [0m                    �  �  �  �  DEC VT52     t  x  v  r                $P*      ANSI terminal (CP/M 2.2 or CP/M +)  $P[H[2J DEC VT52                            $PHJ     XXXXX  SPARE1  XXXXXXXXXXXXXXXXXXXX$P*      =                    T                   )    (    )    (    (      (      �  �  �  �  xxxxxxxxxxxx             2 or CP/M +)  $P[H[2J DEC VT52                            $PHJ     XXXXX  SPARE1  XXXXXXXXXXXXXXXXXXXX$P*      XXXXXX  SPARE2 XXXXXXXXXXXXXXXXXXXX$P*      =                    T                   )    (    )    (    (      (      �  �  �  �  xxxxxxxxxxxx             