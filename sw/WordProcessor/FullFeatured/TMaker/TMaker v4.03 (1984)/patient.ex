                                                                               get PATIENT.RP select PATIENT.EX end order NDAY order TIME order AMPM list help.rp 25 insert PATIENT.TP print from 2 it MODELS
..           <<<<<     P A T I E N T      R E C O R D S     >>>>>
..
..
..
..      AFTER updating record, type:
..
..                         ............
..                         |    DO    |  to PRINT  Appointment  Schedule
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
           * * *   T / M A K E R     P A T I E N T     R E C O R D   * * *
                 ...........................................................
          Name:  | {LASTNAME}, {FIRSTNAME}                                 |
      Birthday:  | {#BMONTH}/{#BDAY}/{#BYEAR}                                                |
                 |                                        am/pm            |
Last Treatment:  | {#LMONTH}/{#LDAY}/{#LYEAR}                         ...........            |
     Next Appt:  | {#NMONTH}/{#NDAY}/{#NYEAR}                  Time:  |{TIME}|{#AMPM}|            |
                 |                                  |......|..|            |
       Address:  | {ADDRESS                                               }|
          City:  | {CITY                                                  }|
     State,Zip:  | {#STATE}   {ZIP}                                              |
         Phone:  |({A#C}) {H#OME}-{PH#ONE}                                           |
                 |                                                         |
       Company:  | {COMPANY                                               }|
   Ins. Policy:  | {INSURANCE                                             }|
      Relative:  | {RELATIVE           }                                   |
       Address:  | {REL.ADDRESS            }                               |
       Comment:  | {COMMENT                                               }|
                 |.........................................................|
 
_______________________________________________________________________________
CTRL-Q     ESC '     ESC &     ESC >     ESC <     ESC up     ESC dn     ESC A
 exit     search     cont.      new     delete      prev       next      first
<End>
 
<Record>
01 {LASTNAME}, {FIRSTNAME}
02 {#BMONTH}/{#BDAY}/{#BYEAR}
03 {#LMONTH}/{#LDAY}/{#LYEAR}
04 {#NMONTH}/{#NDAY}/{#NYEAR}  {TIME}
05 {ADDRESS                                                }
06 {CITY                                                   }
07 {#STATE}   {ZIP}
08 ({A#C}) {H#OME}-{PH#ONE}
09 {COMPANY                                                }
10 {OCCUPATION               }
11 {INSURANCE                                              }
12 {RELATIVE           }
13 {REL.ADDRESS            }
14 {COMMENT                                                }
15 {#AMPM}
<End>
01 Flintstone, Fred
02 03/23/45
03 11/20/84
04 11/20/85  10
05 14 Granite Block
06 BedRock
07 CA   94306
08 (415) 325-3543
09 Precambrian Construction
10 Foreman
11 Minimal
12 Wilma
13 14 Granite Block, BedRock
14 Bowling wrist 11/20/84
15 am
01 Rubble    , Barney
02 06/12/45
03 11/20/84
04 11/20/85  12
05 16 Sand Stone St.
06 Dinosaur Heights
07 CA   94304
08 (415) 322-2432
09 Precambrian Construction
10 Contractor
11 Minimal
12 Betty
13 14 Granite Block, BedRock
14 Bowling ankle 11/20/84
15 am
01 Jetson    , George
02 07/07/49
03 11/20/84
04 11/20/85  11
05 12345 Milkey Way
06 Astroville
07 CA   94080
08 (408) 555-1212
09 Spacely Sprockets
10 Line Manager
11 Risk Plus
12 Jane (his wife)
13 Same
14 Sprocket Backfire
15 am
3