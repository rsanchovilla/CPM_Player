                          SCHEDULE v1.0

                 Persona� Dail� Schedul� Handler

                               by

                         Noriak� Hosoya
                         
                         1600 W. Plum 23-D
                         Fort Collins, CO 80521
                         (303) 491-8825

                         July 20, 1986



INTRODUCTION

     SCHEDULŠ i� � simple�� light-dut� persona� schedul� handle� �
writte� i� Pascal�   Th� progra� wa� designe� t� ru� specificall� �
o� Kaypro� wit� graphics�   SCHEDUL� ha� bee� compile� wit� Turb� �
Pasca� 3.� t� fi� 48� RA� space�   I� thi� brie� document� � wil� �
describ� th� usag� o� SCHEDUL� althoug� i� wa� m�� intentio� t� �
mak� th� progra� eas� t� us� fo� firs� tim� users.

     I� th� librar�� fil� SCHEDULE.LBR��� yo�� wil� fin� th� �
followin� subfiles:

     SCHEDULE.W�    � Thi� documen� fil� fo� SCHEDULE.
     SCHEDULE.CO�   � Compile� progra� SCHEDULE.
     SCHEDULE.PA�   � Pasca� sourc� o� SCHEDULE.COM.
     SCH1.IN�       � INCLUD� fil� fo� SCHEDULE.PAS.

Firs�� yo� mus� extrac� thes� individua� file� fro�� SCHEDULE.LB� �
fil� usin� � librar� utilit� progra� suc� a� NULU��   A�� thi� �
poin�� ther� i� n� nee� t� modif� o� initializ� SCHEDULE.CO͠ t� �
ru� it��   However�� i� yo� wan� t� improv� SCHEDULŠ o� you� �
termina� use� graphi� characte� sequence� differen� fro�� thos� �
fo� newe� Kaypros�� yo�� ar� encourage� t� modif�� th� sourc� �
progra�� SCHEDULE.PAS��   Th� nex�� sectio� show� ho�� t� us� �
SCHEDUL� ste� b� step.


RUNNIN� SCHEDULE

1� Sign-On

     T� ru� SCHEDULE� type:

     A>SCHEDULE

     SCHEDUL� welcome� yo� wit� � sign-o� message�   I� yo� feel� �
a� � sometime� do� tha� th� sign-o� routin� i� rathe� lengthy� i� �
ca� b� suppresse� b� patchin� SCHEDULE.COM��   Thi� procedur� i� �
demonstrate� a� th� en� o� thi� document.�

2� Schedul� File

     Afte� signin� on�� SCHEDUL� ask� yo� th� nam� o� Schedul� �
Fil� yo� wan� t� wor� o� o� creat� o� disk��   Regula� CP/͠ fil� �
nam� conventio� applie� here��   Bot� lowe� an� uppe� character� �
ar� acceptabl� fo� th� fil� name��   Personall� � prefe� � nam� �
suc� a� JUL86.SC� t� indicat� � schedul� fil� fo� Jul�� 1986�   �
Yo�� ma� kee� dail� schedule� fo� a� entir� yea� i� � singl� fil� �
(i�� i� limite� b� availabl� spac� o� you� disk)��   Bu�� fo� �
convenienc� an� practicalit� � woul� recommen� tha�� yo�� creat� �
file� o� � monthl� base.



3� Enterin� � Date

     SCHEDULŠ need� t� kno� th� dat� yo� wan� t� d� schedulin� �
for��   SCHEDUL� ask� yo� Month(1-12)�� Da� an� Year(80-99�� wit� �
vali� input� i� parentheses��   I� SCHEDUL� doe� no�� understan� �
you� response�� i�� wil� bee� an� yo� mus� re-ente� th� correc� �
date.


4� Scree� Arrangement

     Onc� � vali� dat� i� entered�� SCHEDUL� display� � calenda� �
o� th� mont� wit� th� da� yo� specifie� highlighte� a� th� uppe� �
lef� corne� o� you� screen� � simulate� notepa� o� th� righ� hal� �
o� you� screen�� an� Comman� Summar� a� th� lowe� lef� corne� o� �
you� screen��   Th� 23r� lin� i� exclusivel� use� a� � comman� �
lin� b� SCHEDUL� fo� use� input.
   
     Th� notepa� ca� hol� � dail� schedul� fro� � a� t� �� pm�   �
Th� slo� a� � a� wil� b� initiall� highlighte� wit� � di� revers� �
video��   A�� eac� slot�� yo�� ca� ente� � tex� not� u� t� 4� �
character� long�      


5� Comman� Summary

     Thi� versio� o� SCHEDUL� support� 1� command� t� handl� you� �
schedules�   The� are:

     [^E�  � U� Hour
     [^X�  � Dow� Hour
     [ESC� � Ente� Note
     [^C�  � Cance� Note
     [^S�  � Save/Resume
     [^T�  � Delet� Record
     [^D�  � Displa� Dates
     [^P�  � Save/Print
     [^F�  � Save/Ope� File
     [^Q�  � Save/Quit�
Th� up-arrow� (^� indicat� � CTR� key��   An� o� thes� command� �
ca� b� issue� wheneve� th� statu� lin� show� "You� Comman� ?"�   �
Th� function� o� th� command� ar� a� follows� 

[^E� move� th� highlighte� slo� o� th� notepa� u� on� space�  

[^X� move� th� highlighte� slo� o� th� notepa� dow� on� space.

[ESC� move� th� curso� t� th� currentl� highlighte� schedul� slo� �
an� initialize� � not� entr� o� th� notepad��   Th� not� entr� �
mus� b� ende� b� � carriag� return.

[^C� delete� th� not� a� th� currentl� highlighte� slot.

[^Sݠ save� th� schedul� displaye� o� th� notepa� ont� th� �
schedul� fil� an� allow� yo� t� continu� scheduling.
 
[^Tݠ delete� th� schedul� displaye� o� th� notepa� fro�� th� �
schedul� file.

[^D� display� al� th� schedule� date� save� o� th� schedul� file.

[^Pݠ save� th� schedul� o� th� notepa� an� print� i�� o� � �
printer.

[^Fݠ save� th� schedul� o� th� notepa� o� th� schedul� fil� an� �
open� anothe� schedul� file.

[^Qݠ save� th� schedul� o� th� notepa� o� th� schedul� fil� an� �
terminate� SCHEDULE.



SUGGESTE� PATCH

     Th� sign-o� messag� o� SCHEDUL� ca� b� totall� eliminate� b� �
patchin� SCHEDULE.CO͠ usin� DDT��   I� yo� decid� t� d� thi� �
patch�� ɠ strongl�� sugges�� tha�� yo� mak� � backu� cop�� o� �
SCHEDULE.CO� befor� proceeding��   � sessio� wit� DD� shoul� loo� �
lik� this:

A>DD� SCHEDULE.COM
DD� VER� 2.2
NEX�  PC
3C8� 0100
-S221F
221� 0� 00
222� C� .
-G0

A>SAV� 6� SCHEDULE.COM


En� o� SCHEDULE.WS�