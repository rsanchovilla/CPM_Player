                                                                               get INVENTORY.RP select INVENTORY.EX end list help.rp print from 2 it MODELS
..         <<<<<     I N V E N T O R Y     M A N A G E M E N T     >>>>>
..
..
..                                    ............
..      AFTER updating record, type:  |   DO     |  to PRINT  Inventory List
..                                    |..........|
..
..
..                                    ............
..                                    |   SET    |  to calculate changes
..                                    |..........|
..                                    ............
..                                    |  UPDATE  |  to continue UPDATE
..                                    |..........|
..                                    ............
..                                    |  MODELS  |  to return to MODELS Menu
..                                    |..........|
..
..
..
<Form>
         * * *   T / M A K E R      I N V E N T O R Y     L I S T   * * *
 
 
 
 
 
     QUANTITY        ITEM            DESCRIPTION               STATUS
   .............  ..........  ..........................  ..................
   |{QUANTITY>}|  |{ITEM  }|  |{DESCRIPTION <         }|  |{STATUS       <}|
   |...........|  |........|  |........................|  |................|
 
 
 
 
 
 
 
 
 
_______________________________________________________________________________
CTRL-Q     ESC '     ESC &     ESC >     ESC <     ESC up     ESC dn     ESC A
 exit     search     cont.      new     delete      prev       next      first
<End>
 
<Rules>
STATUS = "              "
STATUS = "CHECK STOCK   "  when  QUANTITY < 200
STATUS = "RE-ORDER STOCK"  when  QUANTITY < 100
<End>
 
<Record>
+{QUANTITY>}  {ITEM  }  {DESCRIPTION <         }    {STATUS       <}
<End>
+         99      0001  Ink Pens                    RE-ORDER STOCK
+        990      0002  Canvass Paper
+        195      0003  Dinosaur Food               CHECK STOCK
+       1000      0004  Misc. Items
PO      EX            /!
F �  PROPERTYEX            �!
K �  BOOK    EX            �!
O �
  CHECK   EX            �!
R �  INVENTOREX            u3!        ������������������������������� ������������������������������� ������������������������������� ������������������������������� ������������������������������� ������������������������������� �������������������������������9� ��#�7� ��#��+�u ��#�5�5;�#|�	 3���#� ��#��#�L ��#��+�A ��#��+�6 �3 ��        
 	    ����������x�l�a�U�J�>�� ��]��q���+=  ~�� ��+=�� ����+�7=  ~�� �7;�+� 3��7�6�+��� ^��(��+=  |�� ��+=,� 3���+�5=  |�� �5=0u� 3��5��+=  |�� ��+=,� 3���+��+�u� ��+��" ��+= � ��+�� �� �: ���]��}���+� P� P�vX^��P�60X���  X�� P�vX^��P�60X��� ��+�� P�vX^��P�60X��� ��+�� P�vX^��P�60X��� 