                                                                               get EMPLOYEE.RP select EMPLOYEE.EX end list help.rp print from 3 it MODELS
..  <<<<<     E M P L O Y E E  /  P E R S O N N E L    R E C O R D S     >>>>>
..
..
..
..      AFTER updating record, type:
..
..                         ............
..                         |    DO    |  to PRINT  Personnel  Records
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
 * *  T / M A K E R     E M P L O Y E E / P E R S O N N E L    R E C O R D  * *
              ................................................................
       Name:  | {LASTNAME}, {FIRSTNAME}                Date:   {#MONTH}/{#DAY}/{#YEAR}      |
    Address:  | {ADDRESS                                                    }|
       City:  | {CITY                                                       }|
  State,Zip:  | {#STATE}   {ZIP}                                                   |
              |                                                              |
      Phone:  | ({A#C}) {H#OME}-{PH#ONE}                                               |
   Business:  | ({A#C2}) {B#USINESS}-{PH#ONE2}                                               |
        Age:  | ({#AGE})                                                         |
        SSN:  | {S#OCIAL>}-{#SOCIAL2}-{SO#CIAL3}                                                  |
              |..............................................................|
              ................................................................
   Position:  | {POSITION                <}   Effective Date:  {#EMONTH}/{#EDAY}/{#EYEAR}      |
 Department:  | {DEPARTMENT              <}                                  |
Current Pay:  | ${PAY   <}                                                   |
     Hourly:  | ( {##HOURLY} )    Salary:   ( {##SALARY} )                                     |
              |..............................................................|
   Comments:    {COMMENT <                                                   }
 
_______________________________________________________________________________
CTRL-Q     ESC '     ESC &     ESC >     ESC <     ESC up     ESC dn     ESC A
 exit     search     cont.      new     delete      prev       next      first
<End>
 
<Record>
01 {#MONTH}/{#DAY}/{#YEAR}
02 {LASTNAME     } {FIRSTNAME                         }
03 {ADDRESS                                                      }
04 {CITY                                                         }
05 {#STATE}  Zip: {ZIP}
06 ({A#C}) {H#OME}-{PH#ONE}
07 ({A#C2}) {B#USINESS}-{PH#ONE2}
08 {#AGE}
09 {S#OCIAL>}-{#SOCIAL2}-{SO#CIAL3}
10 {POSITION                <} {#EMONTH}/{#EDAY}/{#EYEAR}
11 {DEPARTMENT              <} {PAY   >}
12 {##HOURLY}
13 {##SALARY}
14 {COMMENT <                                                      }
<End>
01 10/16/85
02 Flintstone      Fred
03 14 Granite Block
04 BedRock
05 CA  Zip: 94306
06 (415) 325-3543
07 (415) 962-0197
08 44
09 342-13-4534
10 Foreman                     10/10/85
11 Wrecking Crew                   48000
12 X
13
14 Great sense of humor.
01 10/16/85
02 Rubble          Barney
03 16 Sand Stone St.
04 Dinosaur Heights
05 CA  Zip: 94304
06 (415) 325-3542
07 (415) 962-0194
08 44
09 557-34-1214
10 Contractor                  10/10/85
11 Plumbing                        47500
12 X
13
14 Hard Working and Good Bowler
01 10/16/85
02 Jetson          George
03 12345 Milkey Way
04 Astroville
05 NY  Zip: 23200
06 (212) 345-3412
07 (212) 932-4231
08 42
09 557-34-7546
10 Vice-President              10/02/83
11 Wrenches and Sprockets         150000
12
13 X
14
 