REM ****************************************
REM * GSX-80 DEMO FOR CBASIC               *
REM * RETYPED FROM ANCIENT GERMAN MAGAZINE *
REM * OCTOBER 2014, UDO MUNK               *
REM *                                      *
REM * BUILD WITH:                          *
REM *     CB80 DEMO1                       *
REM *     LK80 DEMO1                       *
REM *     GENGRAF DEMO1                    *
REM ****************************************

REM Instead of %INCLUDE GRAPHCOM.BAS
COMMON ?VIEW(2),?WIND(2),?P(2),?P1(2),?KAPU(2)
COMMON ?PTSI%(1),?PTSO%(1),?CONT%(1),?INTI%(1),?INTO%(1)
COMMON ?VWTX(2),?RVIW(2),?VX(1),?XN,?YN,?XW,?YW

GRAPHIC OPEN 1
SET BEAM "ON"
SET WINDOW 0,640,0,400
SET JUSTIFY 0,0

GRAPHIC PRINT AT(140,300): "FOR i=1 TO 640 STEP 10     FOR i=1 TO 640 STEP 10"
GRAPHIC PRINT AT(140,280): "    SET BEAM 'OFF'             SET BEAM 'OFF'"
GRAPHIC PRINT AT(140,260): "    SET POSITION i,0           SET POSITION 640-i,0"
GRAPHIC PRINT AT(140,240): "    SET BEAM 'ON'              SET BEAM 'ON'"
GRAPHIC PRINT AT(140,220): "    SET POSITION 640,i         SET POSITION 0,i"
GRAPHIC PRINT AT(140,200): "NEXT i                     NEXT i"

FOR i=1 TO 640 STEP 10
    SET BEAM "OFF"
    SET POSITION i,0
    SET BEAM "ON"
    SET POSITION 640,i
NEXT i

FOR i=1	TO 640 STEP 10
    SET BEAM "OFF"
    SET POSITION 640-i,0
    SET BEAM "ON"
    SET POSITION 0,i
NEXT i

GRAPHIC CLOSE
END
