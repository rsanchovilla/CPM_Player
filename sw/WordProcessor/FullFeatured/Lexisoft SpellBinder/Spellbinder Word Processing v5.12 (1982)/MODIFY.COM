1 0��ͨ�C!rANX��A�I0!o�E8!vf ���=� _!�^#V��!B�!AE��	�C0�=2�!2��[�|��D�	!���  * +++"���*�"�:�O ��:�O  ��:�O  ���K�! ��' ��!� �[�"�>�� ��  :�<2��$ ů2�:�<2�� ��* �> 2�>2�!� "��{$ ��:� �� :� ��(#!�4>
� �!���[!� ��  �e:��,2�o& ��R8	>2�}2��:�<�@�4�:�O ��
 ^#V�^#V�:�O ��:�O  ��:�O  ���K�! ���* +V+^! "o "v "s "z "m�>�4  �OP>_�4�
�OO>_�4�
 �7
O�7	�7	;�7!}�!��O�#�% ���O>|�4���*o�^ �V� ����*v�^ �V� ����*s�*z �~ �.!�w�~ �.!�w�~ �;� ���~  �;� ���~ �G� ���~ �G� ��*m~O�!<� y�!L� y�!\� y�!l� !|���� �_� ����!R#####{�(	##� �#z�# ����?�?_!7~��0�?�?_!G���!8 <= ��!"	��OP��	!W �=(� �[f��:l�6Ӌ:hO++~�y#~�y�	!
��OD��	 �_!6F*j~�ϰwG*iN>@�y�A>7�y�	!Q
��OE��	� _!2F*j~��wG*iN>@�y�A>7�y�	!�
��OD��	� _!9F*j~�?�wG*iN>@�y�A>7�y�	!�
��OE��	�=G*m~���w2 �	!@��OE��	�=G*m~��w2 �	!���OE��	�=G*m~�ϰw2 �	!���OE��	�=G*m~�?�w2 �	!^���!����	!���A�(��~� ��4#�A!���A�_�ȸ8��� 8��4>�4����_� ��������� ����>�4>=�4{� �4z� �4�           ��     ��  (="8k="Tk="lk="'j TERMINAL PORT ="Fj MODEM PORT ="`j I/O BYTE =$#[A]=%#[B]=&#[C]='#[D]=$@[E]=%@[F]=&@[G]='@[H]=$][I]  CON:-->=%][J]  RDR:-->=&][K]  PUN:-->='][L]  LST:-->=)#[M]  GENERAL INFORMATION=)@[X]  TO EXIT OR SAVE=,$YEnter the letter of your choice ? Enter the letter of your
   choice (or RETURN to leave the same) =2$YTHERE IS NOT A VALID SYSTEM ON DRIVE  
    EITHER INSERT ANOTHER DISK AND PRESS RETURN
    TO TRY AGAIN OR PRESS ESCAPE TO EXIT TO CP/M =2$YTHE SELECTED DRIVE MUST NOW CONTAIN A FORMATTED DISK WITH 
     A VALID COPY OF CP/M ON THE SYSTEM TRACKS

     IF THIS IS TRUE THEN PRESS "RETURN" TO DO IT OR "ESC" TO EXIT =,$YYour choices for BAUD RATE are :=..[A]  75=.>[F]  600=.N[K]  2400=/.[B]  110=/>[G]  1000=/N[L]  3600=0.[C]  134.5=0>[H]  1200=0N[M]  4800=1.[D]  150=1>[I]  1800=1N[N]  7200=2.[E]  300=2>[J]  2000=2N[O]  9600 =,$YYour choices for PARITY are :=..[A]  EVEN=/.[B]  ODD=0.[C]  NONE =,$YYour choices for BITS PER BYTE are :=..[A]  5=/.[B]  6=0.[C]  7=1.[D]  8 =,$YYour choice for STOP BITS are :=..[A]  1=/.[B]  1.5=0.[C]  2 =,$YYour choices for CON: are :=..[A]  TTY:=/.[B]  CRT:=0.[C]  BAT:=1.[D]  UC1: =,$YYour choices for RDR: are :=..[A]  TTY:=/.[B]  PTR:=0.[C]  UR1:=1.[D]  UR2: =,$YYour choices for PUN: are :=..[A]  TTY:=/.[B]  PTP:=0.[C]  UP1:=1.[D]  UP2: =,$YYour choices for LST: are :=..[A]  TTY:=/.[B]  CRT:=0.[C]  LPT:=1.[D]  UL1: =,$YYou now have the following options :=..[A]  Save the modified CP/M to drive <A>=/.[B]  Save the modified CP/M to drive <B>=0.[C]  Exit to CP/M without saving it=1.[D]  return to the main menu =3$Enter the letter of your choice ? =,$Y=12MODIFYING THE CP/M ON DRIVE < > =,"Y        The  purpose   of this program is to allow the user to  modify  the
  system  on  the drive of his/her choice so that the next time  it  is  cold
  booted it will set up the serial ports and the I/O byte as desired.
       The  values  that  you  see  above are what  your  CP/M  is  currently
  configured  for.  These values can be changed by selecting the  appropriate
  letter  and following the instructions.  When you change a value it is  not
  only  stored  ready to be saved with the new CP/M but it also  changes  the
  ports and I/O byte themselves, therefore this program can  be used just for
  setting the ports and I/O byte to any desired temporary configuration. =,$YCOMPATIBILITY NOTES:
        If  you plan to modify your CP/M by any means other   than this program
  and  you  want to maintain compatibility the only   requirement is  that  you
  dont change the first 35 bytes of the cold boot   routine in the cbios. Also,
  in order for "MODIFY" to work correctly there must   be a valid system on the
  disk  that is to be modifyed.  A valid system   here means that the CCP  must
  start between track 0/sector 2 and track 0/sector   12 and there must also be
  a DBOOT program starting on the first sector of track 0.
  If you have any further questions contact :
         MONTE BARKER at JONOS LTD.--> 714-871-1082 =7$    PRESS ANY KEY TO CONTINUE--> =,$YMODIFY EXITED +=7$CP/M ON DRIVE   HAS BEEN MODIFIED
      MODIFY EXITED  0 @��TTY:CRT:BAT:UC1:TTY:PTR:UR1:UR2:TTY:PTP:UP1:UP2:TTY:CRT:LPT:UL1:=$9     =%9 =&9   ='9    =$V     =%V =&V   ='V    =$j    =%j    =&j    ='j     W��W��Dj���ABAUD RATE------> BITS PER BYTE--> STOP BITS------> PARITY---------> 5678BAD1  1.52  NONEODD NONEEVEN�75   p110  �134.5A150  �300  � 600  } 1000 h 1200 E 1800 ? 2000 4 2400 # 3600  4800  7200  9600 ERROR                                                           