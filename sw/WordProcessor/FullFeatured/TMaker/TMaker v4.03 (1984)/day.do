                                                                               set 55 do
..
..        <<<     T / M A K E R     D A I L Y   S C H E D U L E R     >>>
..
..
..
..
..
..                                                   ..........
..                       To  PRINT  schedule,  type  |   DO   |
..                                                   |........|
..
..                                                   ..........
..                  To return to MODELS menu,  type  | MODELS |
..                                                   |........|
..
..
..
..
..
..
<Form>
 
        <<<     T / M A K E R     D A I L Y   S C H E D U L E R     >>>
 
 
 
 
 
 
 
                                            .....              .....
          PRINT  Daily Schedule for:  MONTH |{M#1}|   AND   DATE |{#D1} |
                                            |...|              |...|
 
 
 
 
 
                      ( Use CAPITAL Letters for Month )
 
______________________________________________________________________________
 CTRL-Q
  exit        ( Example:  Try printing the schedule for  JAN  1  )
<End>
 
<Rules>
M1 = JAN  when  M1 = "   "
D1 = 1    when  D1 = "  "
<End>
 
 
<Record>
get DAY.RP select DAY.EX when MONTH = {M#1} and DATE = {#D1} end list help.rp print from 3 it MODELS
<End>
get DAY.RP select DAY.EX when MONTH = JAN and DATE = 1  end list help.rp print from 3 it MODELS
öööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööööö