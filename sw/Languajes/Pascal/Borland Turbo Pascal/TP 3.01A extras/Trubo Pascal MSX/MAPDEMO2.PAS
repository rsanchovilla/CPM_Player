program mapdemo;               (* Beispiel fr Memory-Mapper-Einsatz *)

{$I MAPPER.MIC }

{$C-}

const
  MaxLines  = 5000;
  MaxLength = 255;

var
  p:    array [1..MaxLines] of MapPointer;
  i, j: integer;
  s:    string[MaxLength];
  f:    file;


begin
  MapInit;
  writeln ('Zus„tzlicher Speicher: ', MapAvail:0:0, ' Bytes');
  writeln;
  writeln ('Ende der Eingabe mit ''#'' am Zeilenanfang.');

  i := 1;
  repeat
    write (MapAvail:0:0, ' Bytes free >'#9);
    readln (s);                                  (* Eingabe              *)
    MapGetMem (p[i],    length(s) + 1);          (* Speicher reservieren *)
    writeMAP  (p[i], s, length(s) + 1);          (* String wegspeichern  *)
    i := succ(i);
  until (s[1] = '#') or (i > MaxLines);

  for j := 1 to pred(i) do
    begin
    ReadMAP (p[j], s, MaxLength + 1);            (* String zurckholen   *)
    writeln (MapAvail:0:0, ' Bytes free >'#9, s);(* String ausgeben      *)
    MapDispose (p[j]);                           (* Speicher freigeben   *)
    end;

  writeln ('Freier Speicher: ', MapAvail:0:0);

  assign (f, 'DEMO.COM');
  execute (f);               (* zurck zum Men *)
end.
