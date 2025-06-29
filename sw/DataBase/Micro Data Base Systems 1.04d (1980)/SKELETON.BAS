REM--Any DIM or COMMON statements should be placed after this line
DIM W0%(5)
A0%=0100H
SAVEMEM C406H,"DMS.COM"
IF PEEK(A0%)<>0C3H OR PEEK(A0%+3)<>0C3H THEN \
   PRINT "DMS Load Error": STOP
REM--Set up global variables
POKE A0%+6, VARPTR(E0%)
POKE A0%+7, VARPTR(E0%)/256
POKE A0%+8, VARPTR(C0$)
POKE A0%+9, VARPTR(C0$)/256
POKE A0%+10, VARPTR(W0%(1))
POKE A0%+11, VARPTR(W0%(1))/256
REM--Define Functions
DEF FN.DMS%(CMD$)
    C0$=CMD$
    CALL A0%
    FN.DMS%=E0%
    IF E0%<>0 AND E0%<>255 THEN\
       PRINT "DMS error ";E0%;"encountered: ";C0$:\
       C0$="CLOSE":\
       CALL A0% :\
       STOP
    RETURN
FEND
DEF FN.DMS.DEF%(CMD$)
    C0$=CMD$
    CALL A0%+3
    FN.DMS.DEF%=E0%
    IF E0%<>0 THEN\
       PRINT "DMS error ";E0%;"encountered: ";C0$:\
       C0$="CLOSE":\
       CALL A0% :\
       STOP
    RETURN
FEND
REM--Set up OPEN call
REM--(Variables 01$-04$ must be initialized prior to this section of code)
W0%(1)=4
W0%(2)=VARPTR(O1$)
W0%(3)=VARPTR(O2$)
W0%(4)=VARPTR(O3$)
W0%(5)=VARPTR(O4$)
E0%=FN.DMS.DEF%("DEFINE,OPENBLK")
E0%=FN.DMS%("OPEN,OPENBLK")
