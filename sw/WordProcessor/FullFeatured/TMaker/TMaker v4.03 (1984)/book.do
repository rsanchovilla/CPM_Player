                                                                               set 57 do
..
..           <<<     T / M A K E R     F O R M    L E T T E R S     >>>
..
..
..
..
..
..                                                   ..........
..                   To  PRINT  Form  Letters, type  |   DO   |
..                                                   |........|
..
..                                                   ..........
..                   To return to MODELS Menu, type  | MODELS |
..                                                   |........|
..
..
..
..
..
..
<Form>
          <<<     T / M A K E R     F O R M    L E T T E R S     >>>
 
 
 
 
      To  PRINT  Form  Letters,   mark an  "X"  in the appropriate box.
 
 
 
                       ALL        CALIFORNIA     NEW YORK
                    CUSTOMERS        ONLY          ONLY
 
                      .....         .....         .....
                      | {##A1} |         | {##C1} |         | {##N1} |
                      |...|         |...|         |...|
 
 
 
 
______________________________________________________________________________
 CTRL-Q
  exit      ( Use  SPACE BAR  or  Cursor Arrows  to move  between boxes. )
<End>
 
<Rules>
S1 = "CA" WHEN  A1 <> " "
S2 = "NY" WHEN  A1 <> " "
S1 = "CA" WHEN  C1 <> " "
S1 = "NY" WHEN  N1 <> " "
S2 = "XX" WHEN  C1 <> " "  or  N1 <> " "
<End>
 
<Record>
get BOOK2.RP select BOOK.EX when  STATE = {S1}or  STATE = {S2} end list help.rp print from 3 it MODELS     {A1}{C1}{N1}
<End>
get BOOK2.RP select BOOK.EX when  STATE = CA  or  STATE = NY   end list help.rp print from 3 it MODELS     X
 ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö ööööööööööööööööööööööööööööööö