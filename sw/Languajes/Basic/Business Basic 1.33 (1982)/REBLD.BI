o , 
 1"DIRECT FILE REBUILDER - 1982 SEPT 27"@  1"THIS PROGRAM READS A DIRECT FILE WHOSE B-TREE IS DAMAGED"?  1"AND WRITES IT TO A FILE CALLED 'NEWFIL', RECREATING THE"@ ( 1"B-TREE.  THE DIRECT FILE IS READ WITH THE 'IND=' OPTION,"& 2 1"SO THE B-TREE IS CIRCUMVENTED." < 1- F 1"PARTS OF THE PROGRAM YOU MUST CHANGE:"D P 1"CHANGE THE TEST IN LINES NNNN THRU NNNN TO CHECK FOR A VALID"E Z 1"DATA RECORD.  THIS TEST WILL BE UNNECESSARY IN VERSION 1.2 OF"@ d 1"BI-280, WHICH FILLS EMPTY AND DELETED RECORDS WITH NULLS" n 1 x /F(B7)=B7-INT(B7/16)*161 �  !"CLOSE ALL FILES IN CASE THIS IS A RESTART1 � M1$="####0"!"MASK TO RIGHT-JUSTIFY NUMBERS"% � V=0!"VERIFY FLAG, OFF TO START" � 1 � 'CS',% � "BI-280 DIRECT file re-builder" � : � "Control-C Software, Inc.   ---   1982 September 27" � 6 � "Reads a DIRECT file, checks for valid records,"; � "and writes the data to another DIRECT file called ", � $22$,"NEWFIL",$22$,"." �   / "Enter name of file to rebuild : ------",$ "$08$,$08$,$08$,$08$,$08$,$08$, ,F$ 6(1,ERR=330)F$	 @350 J"Can't find ",F$	 T280% ^X$=FID(1)!"GET FILE PARAMETERS"= hS0=ASC(X$(9,1))+256*(ASC(X$(10,1)))!"NUMBER OF RECORDS": rS1=ASC(X$(11,1))+256*(ASC(X$(12,1)))!"RECORD LENGTH"" |S2=ASC(X$(8,1))!"KEY LENGTH"8 �FNF(ASC(X$(7,1)))=1GOTO430!" IF DIRECT FILE, GO ON% �'CR',X$," not a DIRECT file..."	 �(1)	 �280 �'CS', �"Parameters for NEWFIL:" �+ �"        Number of Records = ",S0:M1$+ �"        Record Length     = ",S1:M1$+ �"        Keysize           = ",S2:M1$ �; �"Enter 'Y' to continue, anything else to restart : ", �!RECORD(0,SIZ=1)Q$ Q$<>"Y"ANDQ$<>"y"GOTO10 + "Creating ",$22$,"NEWFIL",$22$,"...",1 &
"NEWFIL",ERR=560!"REMOVE ANY EXISTING FILE"- 0"NEWFIL",S2,S0,S1,0!"CREATE THE NEWFIL" :(2)"NEWFIL"6 D'CR','CR',"Do you want to verify each record? ", N!RECORD(0,SIZ=1)Q$ XQ$="Y"ORQ$="y"V=1 b'CS',4 lN=0TOS0-1!"LOOP TO READ EVERY RECORD BY INDEX" v!RECORD(1,IND=N)A$6 �J=0!"FLAG TO IGNORE RECORDS (J=1 MEANS INVALID)"% �1"TEST 1ST FIELD FOR VALID DATA"7 �1"THIS TEST WILL VARY FROM DATA FILE TO DATA FILE": �1"DEPENDING ON THE FIELD LENGTH AND THE KIND OF DATA" �1"THAT IS IN IT." �1"AT THE BEGINNING J IS 0"- �1"TO MARK AN INVALID RECORD, MAKE J = 1" �1F �1"IN THIS EXAMPLE, THE FIRST S2 (KEY LENGTH) BYTES OF THE RECORD"< �1"ARE TESTED TO SEE IF THEY ARE VALID ASCII CHARACTERS" �I=1TOS2! �A$(I,1)<" "ORA$(I,1)>"Z"J=1 �J=1I=S2 I A$(1,1)=" "J=1 1"  1"END OF INVALID RECORD TEST") *J=0GOTO840!"IGNORE INVALID RECORDS") 4"  IND # ",N:M1$,"  INVALID RECORD"	 >930. H1"WRITE ENTIRE RECORD TO NEW DIRECT FILE"+ R"  IND # ",N:M1$,"  KEY = ",A$(1,S2), \V=0GOTO910 f" Accept (y/n/a):", p!RECORD(0,SIZ=1)Q$ zQ$="A"ORQ$="a"EXITTO940 �Q$<>"Y"ANDQ$<>"y"GOTO920 �.RECORD(2,KEY=A$(1,S2))A$ � �N	 �(1)	 �(2)" �'CS',"File rebuild complete" �@ �"Do you want to remove some of the records from NEWFIL? ", �!RECORD(0,SIZ=1)Q$ �Q$<>"Y"ANDQ$<>"y"GOTO1120 �(1)"NEWFIL" �K$=KEY(1,ERR=1110) !(1,KEY=K$)A$ ) "Remove ",$22$,A$,$22$," (y/n/a):", $!RECORD(0,SIZ=1)Q$ .Q$="A"ORQ$="a"GOTO1110 8Q$<>"Y"ANDQ$<>"y"GOTO1020 B#(1,KEY=K$)
 L1020	 V(1). `1"NOW RENAME NEWFIL BACK TO ORIGINAL FILE j0 t'CR',"Ready to rename newfil to ",F$,"? ", ~!RECORD(0,SIZ=1)Q$ �Q$<>"Y"ANDQ$<>"y"GOTO1210$ �
F$!" FIRST GET RID OF OLD FILE �$ �"RENAMING NEWFIL TO ",F$,"..." �7"NEWFIL"TOF$ � �"RENAME DONE." �	!"END OF REBLD" '	  �SAVE"REBLD"Yys_queue
	push	h		;save p
	lxi	h,sys$uqcb
	push	h
	call	getque		;read queue and rewrite
	pop	h
	pop	h		;restore p
	endif			;ANYMULTI

	lxi	b,time		;get address of time variable
stim0:
	save	b,h,DPTR	;point to value
	mvi	a,NUMERIC or PERMTYPE
	saveb	a,h,TYPE	;set type to NUMERIC|PERMTYPE
	pop	b	
	ret


;jump locations for errors called from functions in this file
err13:
	mvi	c,13
	db	021h

err14:
	mvi	c,14
	mvi	b,0
	push	b
	call	error

gtfile:
	lhld	funct2
	pchl

 ��XI�! 	n& �`i��<4���! 	s#r! 	n}�(ʱ1���1��1͐##�͐��s#r��1��1*�� n& �͐�*�� ~#fo�ͱF�����1! 	n}���2`i�! �!2�2remove.280 �!i����V�����^2! 	n}��12��12�42�?2! 	^#Vr+s͐�*��	 ~#fo����^2! ��XI�! 	n}�ʍ2! 	n}�(ʍ2*�� �͐��s#r!9�����! 	n}�§2͐�͐��؇��͐î2�! 9�����!��9�DMQ�`is#r`i^#Vr+s�6:! 	^#Vr+sz��3͐ �! 	^#Vr+s�n& ��o���s !  ��3`i^#Vr+s�3�3��2! �!)3�-3.BI �͐ �ͱF����`is#r͐ 6 �! 9�����!��9�DM͐ ~#fo�͐##~#fo�ͷ2��!���͝��`i6 `in&  �n}���,4`in& �n& � |�g}�o|��&4͘G`in&  �n}2P�! �!P���	���! 	s#r͐� ����3! 	�~#fo�`in&  �����s#r�,4�&4͐� |�g}�o� ���&4͐ ��|��&4�,4`i4�3͐�34�! 9�����!��9�DM͐ ~#fo�*�� nѯg�`is#r! 	n}�(ʎ4! 	n}�ʎ4*�� �͐~#fo��s#r͐ ~#foÙ4�! 9�����!  9�DM> 2B�>@2��͘G͐|���4>2B�*�� �w#w*c��*E������*c�+n}���4��5��5��5�5>2B��5>2B��5>2B��5>2B��5�5*c��*E����+�����!  9�DM! 	n&   ���u5*�& � ��]5!
 �̓5�!�~4o& ���! 	n��sÁ5! 	n& �̓5����!��9�DM��! 	s#r! 	6�#6 ! 	~#fo�͐�n}� ��5! 	^#Vr+sÞ5`i�w#w͐ �͐���6͐n& �! ��w ��! 	^#Vr+s�6 ͘G`i^#Vr+s��5> 2�!
 	n& �! ��w ��! �! ��w ���! 9�����+��L��O� 	Rw+�P#��~��R��+P���K��N�~�w�:KRO7�>�� ��'w+�9P�hPñF�!��9�DMQ�`is#r`i^#Vr+s�6:! 	^#Vr+sz���6͐ �! 	^#Vr+s�n& ��}6���s !  ���6`i^#Vr+s��6��6à6! �!�6��6.BI �͐ �̀6����`is#r͐ 6 �! 9�����)7�z6Ý�ØG�	�!��9�DM͐ ~#fo�͐##~#fo��7��!���� 7�`i6 `in&  �n}���8`in& �n& � |�g}�o|��8�#7`in&  �n}2P�! �!P���&7���! 	s#r͐� ����7! 	�~#fo�`in&  �����s#r�8�8͐� |�g}�o� ���8͐ ��|��8�8`i4�Z7͐�8�! 9�����!��9�DM͐ ~#fo�*�� nѯg�`is#r! 	n}�(�i8! 	n}��i8*�� �͐~#fo��s#r͐ ~#fo�t8�! 9����Ã8ØG�!  9�DM> 2B�>@2��̀8͐|�ʿ8>2B�*�� �w#w*c��*E������*c�+n}���8���8���8���8��8>2B���8>2B���8>2B���8>2B���8��8*c��*E����+�����9�j9�!  9�DM! 	n&   ���\9*�& � ��D9!
 ��9�!�~4o& ���! 	n��s�h9! 	n& ��9����s9�wØG�!��9�DM��! 	s#r! 	6�#6 ! 	~#fo�͐�n}� ²9! 	^#Vr+sÎ9`i�w#w͐ �͐����9͐n& �! ��m9��! 	^#Vr+s�6 �p9`i^#Vr+sø9> 2�!
 	n& �! ��m9��! �! ��m9���! 9����	��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������