��          Copyright (C) 1985, Computer Helper Industries Inc.
1!E�I	�!�	�+~x��S��_����BH !  ¨�!�#��²ConIX Installation Program V22.12 
Copyright (C) 1985, Computer Helper Industries Inc.
All rights reserved worldwide!
$

Enter input filename:

[The input filename refers to the unINSTALLed version
 of ConIX supplied on the Distribution Diskette.  If
 you do not specify the name of this file, CONIXR.COM
 will be assumed.  Entering only a disk code (D:) will
 reference the default input file on the given drive.
 Otherwise, enter the desired input filename.]
$
? $
Input file: $not found - retry.
$

Enter output filename:

[The output filename refers to the file which will be
 used to contain the INSTALLed version of ConIX.  If
 the name of this file is not specified, CONIX.COM
 will be assumed.  If only a disk code is specified,
 the default output file will be created on the given
 drive.  Otherwise, enter the desired output filename.]
$
Output file: $cannot create (disk full) - retry.
$exists.  Overwrite (y/n)? $

Enter hex relocation address:

[The relocation address is used to determine the area
 of system memory in which ConIX will reside.  This
 address corresponds to the ending location of ConIX,
 meaning that ConIX will not occupy memory past that
 point.  If no address is specified, the end location
 of the current TPA, 0000h, will be used.  Otherwise,
 enter the desired relocation address (in hex).]
$Invalid entry (not in hexadecimal) - retry.
$
Relocation address: 0000 ... $incorrect (not enough memory) - retry.
$

Select startup command sequence:

[The startup command sequence refers to the command(s)
 executed by ConIX when initially loaded into memory.
 The program(s) executed may be designed to perform
 initialization functions or any other operations.  If
 no command is specified, the default command PROFILE
 will be selected.  Otherwise, specify a command list
 in the format of a valid ConIX command line.]
 $PROFILE�
Startup command sequence:

$
Command list too large (maximum 80 characters) - retry.
$

Select BIOS patching:

[ConIX patches the in-memory BIOS jump table so that it
 can intercept I/O calls from executing programs.  This
 operation may not be compatible with systems that do not
 run standard CP/M 2.2.  If the object computer runs a
 standard implementation of CP/M 2.2, then hit <RETURN>.
 Otherwise, type "off" to disable BIOS patching.  This
 will have the effect of disabling the ExpanDisk feature
 and preventing programs which do I/O through direct BIOS
 calls from being redirected through ConIX.  All other
 features will remain intact.]
$
BIOS patching: $

Select ExpanDisk feature:

[ExpanDisk is a feature of ConIX which provides access
 to all logical CP/M drives in a "virtual" scheme.  It
 allows the user to reference a non-existant drive, as
 if there were a drive attached to it.  This operation
 may not be compatible with non-CP/M 2.2 systems, and
 can be disabled to prevent problems.  If the object
 computer runs CP/M 2.2, then hit <RETURN>, which will
 cause ExpanDisk to be enabled.  Otherwise, type "off",
 and the ExpanDisk feature will be disabled.]
$
ExpanDisk feature: $

Select BDOS Error Vector Patching:

[Location 0005h is the entry point to the BDOS syscall
 decoder.  At this location is a JUMP instruction to
 the top of the operating system code segment, which
 in turn contains another JUMP to the actual syscall
 decoder.  After the second JUMP is the error vector,
 which constits of four two-byte addresses that point
 to various routines that handle disk system errors.
 ConIX patches this vector to point to its own copy of
 the error vector.  This is done to retain compatibility
 with programs that patch the vector to catch errors.
 If the object computer supports the error vector, enter
 <RETURN>.  Otherwise type "off" and error patching will
 be disabled.]
$
BDOS Error Vector Patching: $enabled.
$disabled.
$ ... $ok
$1{��M��MX�M!�"�!��B͔��Y:����]�M�����M��e�k�M���l��M��M�2}X�M!1"�!F��B͔��Y:���&��MF�����M��eʆ�M͔���Y�,2}F�x�!��M�,:}���M* y��2�M* "nX�M͔�����"n������Mî*n����M!}��s��l��� ��*}�*���*"J#"v�*n�o�|�g2d"F�4�M1{î��M���"r~���G�*v+"v|���qx��f~� w#xG�N�I"t*r###^# ^#V"p+F#~��6�#�2z2|<2{:dW �^#V#"x���0��:|<2|��¬>2|:{<2{��¬�2{:z<2zì*x:zw#:{w#:|w#¢D�MX�M͔����� :��Q� 	�M�����M*p#^#V+� ���Cw#�@�3x�Q�P6 #�C�5F	���]�*p###w#w"p��ʆ����|�*pw�����ʐ�*p#w#"p��!B" �sF��*r����s�F��� �DM*t�!��Uõ�F͆��M�  
Installation complete.$�MX�M͔����M���M��M                                                                                ʆ           p!�éError: invalid format: $~# ���M���>�@�  Error: no disk space for: $͍�͆��M�  Error: disk full!$���: <�@�@>:�@��� �@�>.�@� �@�"���{��z������ �������_�6�����	�6���`�^x����{�z���6<��6���6�6<��6<��6<��6���
�6& o6�#6�� �5è� @�  Error: no disk space for: $͍�͆��M�  Error: disk full!$���: <�@�@>:�@��� �@�>.�@� �@�"���{��z��>�@>
�@���6 #6 �G#6 �P�ɯ2��:̻#���q�*��������.x�ʕx�ʐ#Æ����M>�2��
Bad filespec - retry.
$ ���@w���Õce����.���w#����a��{�� �|��}��Gyx���O���0�:���!  ����))))�o�$������0��:�<�A��G?���0����6 #6 �G#6 �P�ɯ2��:̻#���q�*��������     