30000 REM GSX-80 FUNCTION LIBRARY FOR MICROSOFT BASIC
30010 REM ORIGINAL CODE WAS WRITTEN FOR MALLARD BASIC, AUTHOR UNKNOWN
30020 REM
30030 REM MODIFIED FOR MIRCOSOFT BASIC AND IMPROVED,
30040 REM NOVEMBER 2014, UDO MUNK
30050 REM
30060 REM ADD GSX FUNCTIONS HERE AS NEEDED AND USE
30070 REM MERGE "GSXFUN" TO ADD IT TO THE MAIN PROGRAM
30080 REM
30090 REM
30990 REM ***** GSX INITIALIZATION *****
31000 DIM PB%(5),CONTRL%(10),INTIN%(100),PTSIN%(100),INTOUT%(100),PTSOUT%(100)
31010 REM
31050 GSX%=&H30		' ADDRESS OF RST 6
31060 POKE GSX%+0,&H54	' LD D,H	HL -> DE
31070 POKE GSX%+1,&H5D	' LD E,L
31080 POKE GSX%+2,&HE	' LD C,115	C = GSX BDOS FUNCTION
31090 POKE GSX%+3,115
31100 POKE GSX%+4,&HC3	' JP BDOS	CALL BDOS WITH GSX FUNCTION
31110 POKE GSX%+5,&H5
31120 POKE GSX%+6,&H0
31130 RETURN
31490 REM ***** GDOS CALL *****
31500 PB%(0)=VARPTR(CONTRL%(0))
31510 PB%(1)=VARPTR(INTIN%(0))
31520 PB%(2)=VARPTR(PTSIN%(0))
31530 PB%(3)=VARPTR(INTOUT%(0))
31540 PB%(4)=VARPTR(PTSOUT%(0))
31550 CALL GSX%(PB%(0))
31560 RETURN
31990 REM ***** OPEN WORKSTATION *****
32000 CONTRL%(0)=1 : CONTRL%(1)=0 : CONTRL%(3)=10
32010 INTIN%(0)=1 : INTIN%(1)=1 : INTIN%(2)=1 : INTIN%(3)=1 : INTIN%(4)=1
32020 INTIN%(5)=1 : INTIN%(6)=1 : INTIN%(7)=1 : INTIN%(8)=1 : INTIN%(9)=1
32030 GOSUB 31500
32040 RETURN
32990 REM ***** CLOSE WORKSTATION *****
33000 CONTRL%(0)=2 : CONTRL%(1)=0
33010 GOSUB 31500
33020 RETURN
33990 REM ***** DRAW LINE *****
34000 CONTRL%(0)=6 : CONTRL%(1)=2
34010 PTSIN%(0)=X1 : PTSIN%(1)=Y1 : PTSIN%(2)=X2 : PTSIN%(3)=Y2
34020 GOSUB 31500
34030 RETURN
34990 REM ***** CLEAR WORKSTATION *****
35000 CONTRL%(0)=3 : CONTRL%(1)=0
35010 GOSUB 31500
35020 RETURN
35990 REM ***** UPDATE WORKSTATION *****
36000 CONTRL%(0)=4 : CONTRL%(1)=0
36010 GOSUB 31500
36020 RETURN
