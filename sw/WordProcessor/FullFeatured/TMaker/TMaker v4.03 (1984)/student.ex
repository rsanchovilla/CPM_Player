                                                                               get STUDENT.RP select STUDENT.EX end order LASTNAME list help.rp 25 insert STUDENT.TP print from 2 it MODELS
..             <<<<<     S T U D E N T    R E C O R D S     >>>>>
..
..
..                                    ............
..      AFTER updating record, type:  |   DO     |  to PRINT  Student  Records
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
              .............................................
   Student :  | {LASTNAME  }| {FIRSTNAME  }               |
              |.............|.............................|
    Address:  | {ADDRESS                      }           |   * S T U D E N T *
       City:  | {CITY                         }           |
  State,Zip:  | {#STATE}  {ZIP}                                 |   * R E C O R D S *
      Phone:  | ({A#C}) {H#OME}-{PH#ONE}                            |
              |...........................................|
  Emergency:  | {EMERGENCY                    }           |
      Phone:  |({A#C3}) {E#MERGENCY3}-{PH#ONE3}                             |
              |...........................................|
 
                  Class    Units   Grade           Teacher:  {TEACHER         }
              ..................   .....              Term:  {TERM            }
           1. |{CLASS1    }| {##UNITS1} |   | {##GRADE1} |              Date:  {#MONTH}/{#DAY}/{#YEAR}
           2. |{CLASS2    }| {##UNITS2} |   | {##GRADE2} |
           3. |{CLASS3    }| {##UNITS3} |   | {##GRADE3} |               GPA:  {GPA>}
           4. |{CLASS4   <}| {##UNITS4} |   | {##GRADE4} |
              |............|...|   |...|           Comment:  {COMMENT         }
 
_______________________________________________________________________________
CTRL-Q     ESC '     ESC &     ESC >     ESC <     ESC up     ESC dn     ESC A
 exit     search     cont.      new     delete      prev       next      first
<End>
 
 
<Rules>
POINTS1 = 0
POINTS1 = 4 when GRADE1 contains "A"
POINTS1 = 3 when GRADE1 contains "B"
POINTS1 = 2 when GRADE1 contains "C"
POINTS1 = 1 when GRADE1 contains "D"
 
POINTS2 = 0
POINTS2 = 4 when GRADE2 contains "A"
POINTS2 = 3 when GRADE2 contains "B"
POINTS2 = 2 when GRADE2 contains "C"
POINTS2 = 1 when GRADE2 contains "D"
 
POINTS3 = 0
POINTS3 = 4 when GRADE3 contains "A"
POINTS3 = 3 when GRADE3 contains "B"
POINTS3 = 2 when GRADE3 contains "C"
POINTS3 = 1 when GRADE3 contains "D"
 
POINTS4 = 0
POINTS4 = 4 when GRADE4 contains "A"
POINTS4 = 3 when GRADE4 contains "B"
POINTS4 = 2 when GRADE4 contains "C"
POINTS4 = 1 when GRADE4 contains "D"
 
GPA = (POINTS1*UNITS1) + (POINTS2*UNITS2) + (POINTS3*UNITS3) + (POINTS4*UNITS4)
GPA = GPA / (UNITS1 + UNITS2 + UNITS3 + UNITS4 )
GPA 9.9 = GPA
<End>
 
<Record>
01 {LASTNAME  }  {FIRSTNAME  }
02 {ADDRESS                      }
03 {CITY                         }
04 {#STATE}  {ZIP}
05 ({A#C}) {H#OME}-{PH#ONE}
06 {EMERGENCY                    }
07 ({A#C3}) {E#MERGENCY3}-{PH#ONE3}
08 {TEACHER         }
09 {TERM            }
10 {CLASS1    }  {##UNITS1}  {##GRADE1}  {#MONTH}/{#DAY}/{#YEAR}
11 {CLASS2    }  {##UNITS2}  {##GRADE2}
12 {CLASS3    }  {##UNITS3}  {##GRADE3}  {GPA>}
13 {CLASS4   <}  {##UNITS4}  {##GRADE4}
14 {COMMENT         }
15 {POINTS1}  {POINTS2}  {POINTS3}  {POINTS4}
<End>
01 Rubble        Bam Bam
02 16 Sand Stone St.
03 Dinosaur Heights
04 CA  94304
05 (415) 961-0189
06 Fred or Wilma Flintstone
07 (213) 123-3535
08 Ann Margrock
09 Fall
10 History       5  B  10/16/85
11 Math          4  B
12 English       4  B     3.0
13 Tools         5  B
14
15 3          3          3          3
01 Flintstone    Pebbles
02 14 Granite Block
03 BedRock
04 CA  94306
05 (415) 322-2345
06 Barney or Betty Rubble
07 (415) 961-0189
08 Ann Margrock
09 Fall
10 History       5  A  10/16/85
11 Math          4  B
12 English       4  A     3.2
13 Tools         5  C
14
15 4          3          4          2
01 Jetson        Boy Elroy
02 12345 Milkey Way
03 Astroville
04 CA  94080
05 (408) 555-1212
06 George or Jane Jetson
07 (   )    -
08 Ann Margrock
09 Fall
10 History       5  B  10/16/85
11 Math          4  A
12 English       4  A     3.7
13 Tools         5  A
14
15 3          4          4          4
 ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö