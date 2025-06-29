*    foobar.CMD  -MAIN PROGRAM
*  DATABASE NAME IS   foobar  
*  DATABASE IS NOT KEYED
SET TALK OFF
SET FORMAT TO SCREEN
SELECT PRIMARY
USE foobar  
STORE T TO MQ:MORE
DO WHILE MQ:MORE
 ERASE
@ 5,27 SAY '+--------------------+'
@ 6,27 SAY  '! SYSTEM:'
@ 6,37 SAY  'foobar'
@ 6,48 SAY  '!'
@ 7,27 SAY  '!  FILE:'
@ 7,36 SAY  'foobar  '
@ 7,48 SAY  '!'
@ 8,11 SAY  '+---------------+--------------------+---------------+'
@ 9,11 SAY  '!                 PLEASE CHOOSE ONE:'
@ 9,64 SAY  '!'
@ 10,11 SAY  '!'
@ 10,64 SAY  '!'
@ 11,11 SAY  '!'
@ 11,26 SAY  'A to ADD data'
@ 11,64 SAY  '!'
@ 12,11 SAY  '!'
@ 12,26 SAY  'G to GET/EDIT data'
@ 12,64 SAY  '!'
@ 13,11 SAY  '!'
@ 13,26 SAY  'R to RUN report'
@ 13,64 SAY  '!'
@ 14,11 SAY  '!'
@ 14,26 SAY  'W to make WordStar Connection'
@ 14,64 SAY  '!'
@ 15,11 SAY  '!'
@ 15,26 SAY  'L to print mailing LABELS/forms'
@ 15,64 SAY  '!'
@ 16,11 SAY  '!              Q to QUIT (exit to CP/M)'
@ 16,64 SAY  '!'
@ 17,11 SAY  '+----------------------------------------------------+'
 SET CONSOLE OFF
 WAIT TO MQ:COMMAND
 SET CONSOLE ON
 IF !(MQ:COMMAND)= 'A'
    DO foobar.ADD
 ELSE
 IF !(MQ:COMMAND)= 'G'
    DO foobar.GET
ELSE
 IF !(MQ:COMMAND)='R'
    DO foobar.RPT
ELSE
 IF !(MQ:COMMAND)='W'
    DO foobar.WS
ELSE
 IF !(MQ:COMMAND)='L'
    DO foobar.LBL
ELSE
 IF !(MQ:COMMAND)='Q'
    QUIT
    ENDIF QUIT
    ENDIF LABEL
    ENDIF WS
    ENDIF REPORT
    ENDIF GET
    ENDIF ADD
ENDDO
RELEASE MQ:MORE,MQ:COMMAND
  