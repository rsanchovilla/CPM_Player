                                                                               get INVOICE.DO update
..                 <<<<<     I N V O I C E   F O R M     >>>>>
..
..
..                                    ............
..      AFTER updating record, type:  |   DO     |  to  PRINT  Invoices
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
                         * *  I N V O I C E    F O R M   * *
 
     BUYER:   {LASTNAME}
   COMPANY:   {COMPANY                                                       }
      CITY:   {CITY                                                          }
            ...............                           ...............
   INVOICE: | {INVOICE}   |                  SHIPPED: | {#SMONTH}/{#SDAY}/{#SYEAR}    |
     TERMS: | {TERMS}     |                  SHIPVIA: | {SHIPVIA}   |
 PO NUMBER: | {PONUMBER}  |                  FREIGHT: |${FREIGHT#>}   |
            |.............|                           |.............|
   QTY    ITEM NO.          DESCRIPTION           UNIT COST    EXTENDED COST
...............................................................................
|{Q1>} |  {ITEM1<} |{DESCRIPTION1<         }  |${UNITCOST1>}|    ${EXTENDED1>}|
|{Q2>} |  {ITEM2<} |{DESCRIPTION2<         }  | {UNITCOST2>}|     {EXTENDED2>}|
|{Q3>} |  {ITEM3<} |{DESCRIPTION3<         }  | {UNITCOST3>}|     {EXTENDED3>}|
|{Q4>} |  {ITEM4<} |{DESCRIPTION4<         }  | {UNITCOST4>}|     {EXTENDED4>}|
|      |           |                          |             |TAX        {TAX }|
|      |           |                          |             |TOT.${TOTAL    >}|
|......|...........|..........................|.............|.................|
 
_______________________________________________________________________________
CTRL-Q     ESC '     ESC &     ESC >     ESC <     ESC up     ESC dn     ESC A
 exit     search     cont.      new     delete      prev       next      first
<END>
 
<Rules>
EXTENDED1 9,999.99 = (Q1 * UNITCOST1)  when  UNITCOST1 > 0
EXTENDED2 9,999.99 = (Q2 * UNITCOST2)  when  UNITCOST2 > 0
EXTENDED3 9,999.99 = (Q3 * UNITCOST3)  when  UNITCOST3 > 0
EXTENDED4 9,999.99 = (Q4 * UNITCOST4)  when  UNITCOST4 > 0
TAX 999.99 =  (EXTENDED1+ EXTENDED2+EXTENDED3+EXTENDED4)* 0.065 when STATE = CA
TOTAL 999,999.99 = (EXTENDED1+EXTENDED2+EXTENDED3+EXTENDED4) + TAX + FREIGHT
FREIGHT 999.99 = FREIGHT
<End>
 
<Record>
00 {INVOICE#>}
01 {LASTNAME#<}
02 {COMPANY                                                        }
03 {ADDRESS                                                        }
04 {CITY                                                           }
05 {#STATE} {ZIP}
06 {PONUMBER} {SHIPVIA} {#SMONTH}/{#SDAY}/{#SYEAR} {TERMS}
07 {Q1>} {ITEM1<} {DESCRIPTION1<         } {UNITCOST1>} {EXTENDED1>}
08 {Q2>} {ITEM2<} {DESCRIPTION2<         } {UNITCOST2>} {EXTENDED2>}
09 {Q3>} {ITEM3<} {DESCRIPTION3<         } {UNITCOST3>} {EXTENDED3>}
10 {Q4>} {ITEM4<} {DESCRIPTION4<         } {UNITCOST4>} {EXTENDED4>}
11 {TAX } {FREIGHT}
12 {TOTAL    >}
13 {PAYMENT}
14 {#PAYMONTH}/{#PAYDAY}/{#PAYYEAR}
<End>
00      7501
01 Flintstone
02 Precambrian Construction
03 14 Granite Block
04 BedRock
05 CA 94306
06 0075       UPS       10/21/85 Net 30
07  1000 1212     Ink Pens                         1.07     1,070.00
08     5 4322     Dinosaur Food                   39.99       199.95
09    10 3230     Canvass Paper                  129.95     1,299.50
10
11 167.01     10.00
12     2,746.46
13
14   /  /
00 7502
01 Jetson
02 Spacesly Sprokets
03 12345 Milkey Way
04 Astroville
05 NY 23200
06 2343       UPS       10/21/85 Net 30
07    25 1212     Ink Pens                         1.07        26.75
08     5 3230     Canvass Paper                  129.95       649.75
09
10
11            10.00
12       686.50
13
14   /  /
 ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööö