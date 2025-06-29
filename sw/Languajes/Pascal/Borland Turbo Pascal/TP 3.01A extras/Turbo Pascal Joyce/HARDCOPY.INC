
{ ---------------------------- HARDCOPY.INC ----------------------------------
  Include-File fuer Hardcopies auf dem JOYCE unter Turbo Pascal.
  Ermoeglicht die Ausgabe von Bildschirmbereichen in vier Groesen
  und zwei Richtungen auf dem JOYCE-Drucker.

  Benoetigt das Include-File KERNEL.INC...

------------------------------------------------------------------------------ }


procedure Hardcopy (left, top, right, bottom, size : INTEGER; direction : CHAR);

const  breite = 719;  (* Bildschirmbreite *)
       hoehe  = 248;  (* Bildschirmhoehe  *)
       ptrres = 960;  (* Breite einer Druckzeile, doppelte Aufloesung *)

zweih1  : array (.0..7.) of INTEGER = (128,64,32,16,8,4,2,1);
zweih2  : array (.0..3.) of INTEGER = (192,48,12,3);
zweih4  : array (.0..1.) of INTEGER = (240,15);
zweih8  : array (.0..0.) of INTEGER = (255);

var   bitnumber, i, j, decrement, y, n, spalte  : INTEGER;


function params_ok: BOOLEAN;

BEGIN
  if (left < 0) or (right > breite) or (left > right)
  or (top < 0) or (bottom > hoehe) or (top > bottom)
  or not(size in (.1, 2, 4, 8.))
  or (bitnumber > ptrres) then
     params_ok:= false else params_ok:=true;
END;

BEGIN
if not (direction in (.'v','V'.))
       then direction := 'h';
case direction of

'H','h' :
BEGIN
  bitnumber := size * (right - left +1);
  if params_ok then
  BEGIN
    y:=top;
    decrement := 8 Div size;
    WRITE (Lst, chr(27), chr(65), chr(8));       (* Grafikzeilenabstand  8/72 *)
    while y <=bottom do
    BEGIN
      WRITE (Lst, chr(27), chr(76), chr(Lo(bitnumber)), chr(hi(bitnumber)));
            (* Anzahl der folgenden Grafikdaten, doppelte Aufloesung *)
      for i:= left to right do
      BEGIN
        spalte := 0;
        for n := y to pred(y+decrement) do
            if n <= bottom then
               if DotColor(i, n) then
                  case size of
                    1: spalte := spalte or zweih1(.n-y.);
                    2: spalte := spalte or zweih2(.n-y.);
                    4: spalte := spalte or zweih4(.n-y.);
                    8: spalte := spalte or zweih8(.n-y.);
                  END;
            for j := 1 to size do
              WRITE(Lst, chr(spalte));          (* bits senden *)
         END;
         WRITELN(Lst);
         y := y + decrement;
      END;
      WRITE(Lst, chr(27), chr(50));           (* normaler Zeilenabstand 1/6 *)
    END;
END;



'v','V':
BEGIN
  bitnumber := 2 * size * (bottom - top +1);
  if params_ok then
  BEGIN
    y:=left;
    decrement := 8 Div  size;
    WRITE (Lst, chr(27), chr(65), chr(8));       (* Grafikzeilenabstand  8/72 *)
    while y <=right do
    BEGIN
      WRITE (Lst, chr(27), chr(76), chr(Lo(bitnumber)), chr(hi(bitnumber)));
            (* Anzahl der folgenden Grafikdaten, doppelte Aufloesung *)
      for i:= bottom downto top do
      BEGIN
        spalte := 0;
        for n := y to pred(y+decrement) do
            if n <= right then
               if DotColor(n,i) then
                  case size of
                    1: spalte := spalte or zweih1(.n-y.);
                    2: spalte := spalte or zweih2(.n-y.);
                    4: spalte := spalte or zweih4(.n-y.);
                    8: spalte := spalte or zweih8(.n-y.);
                  END;
            for j := 1 to 2 * size do
              WRITE(Lst, chr(spalte));          (* bits senden *)
         END;
         WRITELN(Lst);
         y := y + decrement;
      END;
      WRITE(Lst, chr(27), chr(50));           (* normaler Zeilenabstand 1/6 *)
    END;
END; (* hgrcopy*)

end;
end;

{ ------------------------- Ende von HARDCOPY.INC ---------------------------- }

