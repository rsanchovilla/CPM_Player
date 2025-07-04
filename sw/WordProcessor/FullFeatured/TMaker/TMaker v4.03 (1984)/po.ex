                                                                               get PO.DO update
..           <<<<<     P U R C H A S E   O R D E R   F O R M     >>>>>
..
..
..                                    ............
..      AFTER updating record, type:  |   DO     |  to  PRINT  Purchase Orders
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
                   * *   P U R C H A S E   O R D E R   F O R M   * *
 
     Buyer:   {LASTNAME}
   Company:   {COMPANY                                                        }
      City:   {CITY                                                           }
            ...............                            ....................
 PO NUMBER: | {PONUMBER}  |                   SHIPVIA: | {SHIPVIA}        |
   PO DATE: | {#POMONTH}/{#PODAY}/{#POYEAR}    |                  REQUIRED: | {#RMONTH}/{#RDAY}/{#RYEAR}         |
     TERMS: | {TERMS}     |                    F.O.B.: | {FOB            }|
            |.............|                            |..................|
   QTY    ITEM      DESCRIPTION                    UNIT COST     EXTENDED COST
...............................................................................
|{Q1>}    {ITEM1<}  {DESCRIPTION1<         }   ${UNITCOST1>}     ${EXTENDED1>}|
|{Q2>}    {ITEM2<}  {DESCRIPTION2<         }    {UNITCOST2>}      {EXTENDED2>}|
|{Q3>}    {ITEM3<}  {DESCRIPTION3<         }    {UNITCOST3>}      {EXTENDED3>}|
|{Q4>}    {ITEM4<}  {DESCRIPTION4<         }    {UNITCOST4>}      {EXTENDED4>}|
|                                                          TAX          {TAX }|
|                                                          TOTAL ${TOTAL    >}|
|.............................................................................|
 
_______________________________________________________________________________
CTRL-Q     ESC '     ESC &     ESC >     ESC <     ESC up     ESC dn     ESC A
 exit     search     cont.      new     delete      prev       next      first
<End>
 
<Rules>
EXTENDED1 9,999.99 = (Q1 * UNITCOST1)  when  UNITCOST1 > 0
EXTENDED2 9,999.99 = (Q2 * UNITCOST2)  when  UNITCOST2 > 0
EXTENDED3 9,999.99 = (Q3 * UNITCOST3)  when  UNITCOST3 > 0
EXTENDED4 9,999.99 = (Q4 * UNITCOST4)  when  UNITCOST4 > 0
TAX 999.99 =  (EXTENDED1+ EXTENDED2+EXTENDED3+EXTENDED4)* 0.065 when STATE = CA
TOTAL 999,999.99 = (EXTENDED1 + EXTENDED2 + EXTENDED3 + EXTENDED4) + TAX
<End>
 
<Record>
01 {LASTNAME}
02 {COMPANY                                                        }
03 {ADDRESS                                                        }
04 {CITY                                                           }
05 {#STATE}, {ZIP}
06 {PONUMBER#>} {SHIPVIA#<}
07 {#POMONTH}/{#PODAY}/{#POYEAR}  {#RMONTH}/{#RDAY}/{#RYEAR}
08 {TERMS} {FOB            }
09 {Q1>}  {ITEM1<}  {DESCRIPTION1<         } {UNITCOST1>}  {EXTENDED1>}
10 {Q2>}  {ITEM2<}  {DESCRIPTION2<         } {UNITCOST2>}  {EXTENDED2>}
11 {Q3>}  {ITEM3<}  {DESCRIPTION3<         } {UNITCOST3>}  {EXTENDED3>}
12 {Q4>}  {ITEM4<}  {DESCRIPTION4<         } {UNITCOST4>}  {EXTENDED4>}
13 {TAX }
14 {TOTAL    >}
<End>
01 Flintstone
02 Precambrian Construction
03 14 Granite Block
04 BedRock
05 CA, 94306
06       0075 UPS
07 10/14/85  10/14/85
08 Net 30  BedRock
09  1000  1212      Ink Pens                         1.07      1,070.00
10     5  4322      Dinosaur Food                   39.99        199.95
11    10  3230      Canvass Paper                  129.95      1,299.50
12
13 167.01
14     2,736.46
01 Jetson
02 Spacesly Sprockets
03 12345 Milkey Way
04 Astroville
05 NY, 23200
06 0076       UPS
07 10/14/85  10/14/85
08 Net 30  BedRock
09    25  1212      Ink Pens                         1.07         26.75
10     5  3230      Canvass Paper                  129.95        649.75
11
12
13
14       676.50
 ������������������������������� ������������������������������� ������������������������������� �������������������������������ze Chars (12 pitch) | `e  |   �  |   SCREEN  BUT
211   27 30   128   |SUPERSCRIPT                 | `S  |  �   |   NOT IN YOUR
243   27 28   128   |subSCRIPT                   | `s  |   �  |   PRINTOUT.
205   27 77   128   |Microfont                   | `M  |  �   |
201   27 66   128   |Italics                     | `I  |   �  |   HIGH  BIT
208   27 17   128   |Proportional Spacing        | `P  |  �   |   CHARACTER
194   27 31   128   |Start BOLD                  | `B  |   �  |   is  a  ( ` )
226   2