NAME ERROR
 BUFFER WRITTEN TO DISK
 FILE CLOSED
 FILE OPENED
 ~#���S�B>�S>
�� ��T���!� ͙��z�d+~�S�d��L�_�Sw�ʓ#�d>
�S�� �����ہ�ʦ�Ӏ�ہ�ʱۀ���L!�B�_!] 6 #��!�] 	~#�a��� ���.�����e ~#�a�� �����7?�7�FILENAME?  ���\ � !4�B�������\ � �������\ � !&�B�������\ � �������\ � �������\ � �����:�G�	�xʛ���2�ӂ��y��!/��
�K²:����ӂ2�!���> N���#��>��> 2�ӂ>Ӂ��j͛!��(�K��!�~��O��*�(�K�#�0�!>
����/��ͣ�K͛�K�=�/>
�K=�C�����	���ʪ� !  ���a���!��	��m�����m��  wO�����#��m++�m:���è:��2�ӂ���� �Kz�´!q~� ��O��#������ہ���yӀ�	��ͤ�
NUMBER ?
 
NO ANSWER--- 
CALL TERMINATED
 
DIALING- 
LOST CARRIER 
EOT 
80/103 CONTROL PROGRAM

WAITING FOR RING OR CONTROL B
 
THE STARK COMPUTER NETWORK
 
END OF SAVE AREA
 ���� �> �=�� �½y��                                                        # FILE 5 FROM SOFTWARE TOOLS OF LBL
 #---------------------------------------------------------------------
 # include symbol definitions
 #        include symbols
 #---------------------------------------------------------------------
##      echo -- main program


        call initr4
        call echo
        call endr4
        end

 ## echo - echo command line arguments
 subroutine echo
 integer getarg, i
 character buf(MAXLINE)

 for (i=1; getarg(i, buf, MAXLINE) ^= EOF; i=i+1)
        {
        if (buf(1) == QMARK & buf(2) == EOS)
                call error('usage:  echo  args !.')
        call putlin (buf, STDOUT)
        call putch (BLANK, STDOUT)
        }
 if (i ^= 1)
        call putch (NEWLINE, STDOUT)
 return
 end

n
 end

















 #--------------------------------------------------------------------
 #include symbols definitions
 #      include symbols
 #---------------------------------------------------------------------
##      cat # FILE 6 OF SOFTWARE TOOLS FROM LBL
 #--------------------------------------------------------------------
 #include symbols definitions
 #      include symbols
 #---------------------------------------------------------------------
##      cat -- mai