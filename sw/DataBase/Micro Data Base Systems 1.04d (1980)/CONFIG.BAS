DEF FNA$(A%)
FA$=""
B3=1000H
B0=A% AND 7FFFH
IF A%<0 THEN B0=B0+32768
FOR B1% = 1 TO 4
B2%=INT(B0/B3)
B0=B0-FLOAT(B2%)*B3
IF B2%<10 THEN FA$=FA$+CHR$(B2%+30H)\
          ELSE FA$=FA$+CHR$(B2%+40H-9)
B3=B3/16
NEXT B1%
FNA$=FA$+"H"
RETURN
FEND
PRINT
REM =========
PRINT
PRINT "MDBS/CBASIC Interface Utility"
PRINT
PRINT
I0%=PEEK(7) : I1%=PEEK(6)
I1%=(I0% AND 127)*256 + I1%
IF I0%>127 THEN I1%=I1% OR 8000H
PRINT "In your operating environment the highest memory"
PRINT "  address for a user program is "; FNA$(I1%)
PRINT
PRINT "Enter the address at which you will ORG the"
INPUT "  MDBS.DMS system:"; LINE C$
PRINT
IF C$="" THEN C$="6000"
C$=UCASE$(C$)
B0=0
FOR I%=1 TO LEN(C$)
C%=ASC(MID$(C$,I%,1))
B0=B0*16
IF C%>20H THEN B0=B0+C%-30H
IF C%>40H THEN B0=B0-10H+9
NEXT I%
IF B0<32768.0 THEN I0%=B0 ELSE I0%=(B0-32768) OR 8000H
I2%=I1%-I0%
PRINT "To obtain a DMS origin of ";FNA$(I0%);",the"
PRINT "  CBASIC SAVEMEM statement should specify a"
PRINT "  value of ";FNA$(I2%)
PRINT
PRINT
PRINT "A skeletal program may be generated for your convenience."
PRINT "  If you wish to use this feature, enter a file"
PRINT "  name to which the program may be written."
PRINT
INPUT "File name? ";LINE C$
IF C$="" THEN STOP
IF MATCH(".",C$,1)=0 THEN C$=C$+".BAS"
FILE C$
PRINT USING "&";#1;"REM--Any DIM or COMMON statements "+\
            "should be placed after this line"
PRINT USING "&";#1;"DIM W0%(5)"
PRINT USING "&";#1;"A0%=" + FNA$(I0%)
PRINT USING "&";#1;"SAVEMEM " + FNA$(I2%) +\
            ",""DMS.COM"""
PRINT USING "&";#1;"IF PEEK(A0%)<>0C3H OR PEEK(A0%+3)" +\
            "<>0C3H THEN \"
PRINT USING "&";#1;"   PRINT ""DMS Load Error"": STOP"
PRINT USING "&";#1;"REM--Set up global variables"
PRINT USING "&";#1;"POKE A0%+6, VARPTR(E0%)"
PRINT USING "&";#1;"POKE A0%+7, VARPTR(E0%)/256"
PRINT USING "&";#1;"POKE A0%+8, VARPTR(C0$)"
PRINT USING "&";#1;"POKE A0%+9, VARPTR(C0$)/256"
PRINT USING "&";#1;"POKE A0%+10, VARPTR(W0%(1))"
PRINT USING "&";#1;"POKE A0%+11, VARPTR(W0%(1))/256"
PRINT USING "&";#1;"REM--Define Functions"
PRINT USING "&";#1;"DEF FN.DMS%(CMD$)"
PRINT USING "&";#1;"    C0$=CMD$"
PRINT USING "&";#1;"    CALL A0%"
PRINT USING "&";#1;"    FN.DMS%=E0%"
PRINT USING "&";#1;"    IF E0%<>0 AND E0%<>255 THEN\"
PRINT USING "&";#1;"       PRINT ""DMS error "";E0%;"" encountered: "";C0$:\"
PRINT USING "&";#1;"       C0$=""CLOSE"":\"
PRINT USING "&";#1;"       CALL A0% :\"
PRINT USING "&";#1;"       STOP"
PRINT USING "&";#1;"    RETURN"
PRINT USING "&";#1;"FEND"
PRINT USING "&";#1;"DEF FN.DMS.DEF%(CMD$)"
PRINT USING "&";#1;"    C0$=CMD$"
PRINT USING "&";#1;"    CALL A0%+3"
PRINT USING "&";#1;"    FN.DMS.DEF%=E0%"
PRINT USING "&";#1;"    IF E0%<>0 THEN\"
PRINT USING "&";#1;"       PRINT ""DMS error "";E0%;"" encountered: "";C0$:\"
PRINT USING "&";#1;"       C0$=""CLOSE"":\"
PRINT USING "&";#1;"       CALL A0% :\"
PRINT USING "&";#1;"       STOP"
PRINT USING "&";#1;"    RETURN"
PRINT USING "&";#1;"FEND"
PRINT USING "&";#1;"REM--Set up OPEN call"
PRINT USING "&";#1;"REM--(Variables 01$-04$ must be " +\
            "initialized prior to this section of code)"
PRINT USING "&";#1;"W0%(1)=4"
PRINT USING "&";#1;"W0%(2)=VARPTR(O1$)"
PRINT USING "&";#1;"W0%(3)=VARPTR(O2$)"
PRINT USING "&";#1;"W0%(4)=VARPTR(O3$)"
PRINT USING "&";#1;"W0%(5)=VARPTR(O4$)"
PRINT USING "&";#1;"E0%=FN.DMS.DEF%(""DEFINE,OPENBLK"")"
PRINT USING "&";#1;"E0%=FN.DMS%(""OPEN,OPENBLK"")"
PRINT
STOP
