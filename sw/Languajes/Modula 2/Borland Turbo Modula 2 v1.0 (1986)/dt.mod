MODULE DT;

FROM SYSTEM IMPORT ADR;
FROM STRINGS IMPORT String;
FROM DATUM IMPORT Datum;

VAR DAT,UHRZ : String;

BEGIN
  DAT := 'DATUM   ';  UHRZ := 'UHRZ    ';
  Datum( DAT, UHRZ );
  WRITE('Datum: ',DAT,'   Uhrzeit: ',UHRZ);
END DT.
      