IMPLEMENTATION MODULE CPM;

FROM SYSTEM IMPORT BDOS, ADR, IORESULT;
FROM Tage   IMPORT NDATUM, Wochentag;

PROCEDURE GetDateTime(VAR WT : String; VAR Tag,Monat,Jahr,
					   Std,Min,Sec : INTEGER);
CONST GetDT = 105; (* BDOS - FUNTION *)
VAR DAT : ARRAY [0..1] OF CARDINAL;
BEGIN
  BDOS(GetDT,ADR(DAT));  (* DATUM & TIME holen *)
  NDATUM(31,12,1977, LONG(DAT[0]), Tag,Monat,Jahr);
  Wochentag(Tag,Monat,Jahr, WT);
(*  BDOS(GetDT,ADR(DAT));  (* nochmal TIME holen *)  *)
  Sec := IORESULT;       Sec := Sec DIV 16 * 10 + Sec MOD 16;
  Std := DAT[1] MOD 256; Std := Std DIV 16 * 10 + Std MOD 16;
  Min := DAT[1] DIV 256; Min := Min DIV 16 * 10 + Min MOD 16;
END GetDateTime;


END CPM.
                                                             