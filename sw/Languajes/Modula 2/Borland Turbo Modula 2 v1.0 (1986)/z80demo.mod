MODULE Z80demo;

FROM SYSTEM	IMPORT ADR, ADDRESS, MOVE;
FROM Z80Stuff	IMPORT MoveL;

TYPE
    SCardinal = RECORD
                   Wert : CARDINAL;
                 END;
VAR s,d : SCardinal;
    l   : CARDINAL;
    crcval : LONGCARDINAL;

BEGIN
  s.Wert := 500; d.Wert := 1; l:=SIZE(SCardinal);
  WRITELN('VOR DEM AUFRUF VON MOVEL');
  WRITELN('S: ',s.Wert,'   D: ',d.Wert,'   L: ',l);
  MoveL( ADR(s), ADR(d), l );
  WRITELN('NACH DEM AUFRUF VON MOVEL');
  WRITELN('S: ',s.Wert,'   D: ',d.Wert,'   L: ',l);
END Z80demo.
                                                                                                