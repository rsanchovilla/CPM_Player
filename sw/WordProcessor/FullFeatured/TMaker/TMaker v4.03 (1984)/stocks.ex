                                                                               get STOCKS.RP select STOCKS.EX end set compute list help.rp print from 2 IT MODELS
..            <<<<<     S T O C K     P O R T F O L I O     >>>>>
..
..
..                                    ............
..      AFTER updating record, type:  |   DO     |  to PRINT  Portfolio Summary
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
      * * *     T / M A K E R     S T O C K     P O R T F O L I O      * * *
 
                      ....................................
        Corporation:  | {CORPORATION                    }|
    Exchange Symbol:  | {SYMBOL}                         |
                      |..................................|
   Date of Purchase:  | {#MONTH}/{#DAY}/{#YEAR}                         |
                      |                                  |
   Number of Shares:  |{SHARES >}                        |
     Purchase Price:  |${PURCHASE     } (per share)      |
     Commission Fee:  |${COMMISSION  }                   |
                      |                                  |
        Total Price:  |${TOTAL       }                   |
                      |..................................|
                                        ..................
                        Current Price:  |${CURRENT      }|
              Current Portfolio Value:  |${VALUE       } |
                 Capital Gain or Loss:  |${CAPITAL     } |
                                        |................|
 
_______________________________________________________________________________
CTRL-Q     ESC '     ESC &     ESC >     ESC <     ESC up     ESC dn     ESC A
 exit     search     cont.      new     delete      prev       next      first
<End>
 
<Rules>      (* Use SET command to set these Rules in motion *)
 
COMMISSION = (SHARES * PURCHASE) * .02
TOTAL = (SHARES * PURCHASE) + COMMISSION
VALUE = CURRENT * SHARES
CAPITAL = VALUE - TOTAL
 
SHARES 999999 = SHARES
PURCHASE 9,999.999 = PURCHASE
COMMISSION 9,999.99 = COMMISSION
TOTAL 999,999,999.99 = TOTAL
CURRENT 9,999.999 = CURRENT
VALUE 999,999,999.99 = VALUE
CAPITAL 999,999.99 = CAPITAL
 
<End>
 
<Record>
01 {CORPORATION                     }
02 {SYMBOL}
03 {#MONTH}/{#DAY}/{#YEAR}
04 {SHARES >}
05 {PURCHASE     } (per share)
06 {COMMISSION  }
07 {TOTAL       }
08 {CURRENT      }
09 {VALUE       }
10 {CAPITAL     }
<End>
01 Jet Set Airlines
02 JSA
03 12/02/85
04       2000
05          23.500 (per share)
06         940.00
07      47,940.00
08          30.875
09      61,750.00
10      13,810.00
01 High Tech Computers
02 HTC
03 12/06/84
04       2000
05         118.000 (per share)
06       4,720.00
07     240,720.00
08         123.500
09     247,000.00
10       6,280.00
01 Squawk Communications
02 SQM
03 12/06/85
04      25000
05           1.250 (per share)
06         625.00
07      31,875.00
08          10.875
09     271,875.00
10     240,000.00
01 Munch America Food Inc.
02 MUN
03 12/07/85
04       1000
05          23.500 (per share)
06         470.00
07      23,970.00
08          22.750
09      22,750.00
10      -1,220.00
01 Precambrian Construction
02 PRC
03 12/20/84
04       1000
05           7.500 (per share)
06         150.00
07       7,650.00
08           3.750
09       3,750.00
10      -3,900.00
,