                                                                               get PROPERTY.RP select PROPERTY.EX end list help.rp print from 2 it MODELS
..           <<<<<     P R O P E R T Y     M A N A G E M E N T     >>>>>
..
..
..
..      AFTER updating record, type:
..
..                         ............
..                         |    DO    |  to PRINT  Availability  Listing
..                         |..........|
..
..
..                         ............
..                         |  UPDATE  |  to continue UPDATE
..                         |..........|
..                         ............
..                         |  MODELS  |  to return to MODELS Menu
..                         |..........|
..
..
..
<Form>
     * * *   T / M A K E R     P R O P E R T Y     M A N A G E M E N T   * * *
 
Date Listed:  {#MONTH}/{#DAY}/{#YEAR}                   Selling ( {##SELL} )  Renting ( {##RENTING} )
              ................................................................
  Last Name:  | {LASTNAME}, {FIRSTNAME}                                      |
    Address:  | {ADDRESS                                                    }|
       City:  | {CITY                                                       }|
 State, Zip:  | {#STATE}   {ZIP}                                                   |
      Phone:  |({A#C}) {H#OME}-{PH#ONE}                                                |
   Business:  |({A#C2}) {B#USINESS}-{PH#ONE2}                                                |
              |..............................................................|
Square Feet:  | {SQFEET >}                             .............         |
   Bedrooms:  | {#BEDROOMS <}                         Sale Price: |$ {SPRICE>}|         |
      Baths:  | {#BATHS <}                                     |...........|         |
 Fireplaces:  | {#FIREPLACES}                       Rental Price: |$ {RPRICE>}|         |
       Pets:  | {#PETS<}                                     |...........|         |
     Garage:  | {#GARAGE}                                                           |
   Features:  | {FEATURES  <                                                }|
              |..............................................................|
 
_______________________________________________________________________________
CTRL-Q     ESC '     ESC &     ESC >     ESC <     ESC up     ESC dn     ESC A
 exit     search     cont.      new     delete      prev       next      first
<End>
 
<Record>
01 {#MONTH}/{#DAY}/{#YEAR}   {##SELL} {##RENTING}
02 {LASTNAME}, {FIRSTNAME}
03 {ADDRESS                                                     }
04 {CITY                                                        }
05 {#STATE}   {ZIP}
06 ({A#C}) {H#OME}-{PH#ONE}
07 ({A#C2}) {B#USINESS}-{PH#ONE2}
08 {SQFEET >}
09 {#BEDROOMS <}  {SPRICE>}
10 {#BATHS <}
11 {#FIREPLACES}  {RPRICE>}
12 {#FAMILY <}
13 {#PETS}
14 {#GARAGE}
15 {FEATURES  <                                                 }
<End>
01 10/14/85   Y
02 Rubble    , Barney
03 16 Sand Stone St.
04 Dinosaur Heights
05 CA   94304
06 (415) 322-2432
07 (   )    -
08      11500
09 5      176000
10 3
11 3
12 2
13 N
14 Y
15 Swimming Pool
01 10/16/85   Y
02 Flintstone, Fred
03 14 Granite Block
04 BedRock
05 CA   94306
06 (415) 962-0193
07 (415) 322-2346
08      12000
09 5      175000
10 4
11 3
12 1
13 Y
14 Y
15
01 10/18/85   Y
02 Jetson    , George
03 12345 Milkey Way
04 Astroville
05 CA   94080
06 (415) 555-1212
07 (   )    -
08      24500
09 6      450000
10 3
11 2
12 2
13 Y
14 Y
15 Flight Landing Port
PO      EX            /!
F €  PROPERTYEX            m3!        ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö