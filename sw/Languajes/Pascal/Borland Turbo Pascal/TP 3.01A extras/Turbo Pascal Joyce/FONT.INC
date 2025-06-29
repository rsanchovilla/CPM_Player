{ -------------------- FONT.INC --------------------

  Include-File zur Bearbeitung von Zeichensatzen.
  Stellt folgende Funktionen zur Verfuegung:

    procedure LoadFont() -> Zeichensatz laden
    procedure SaveFont() -> Zeichensatz speichern

  Benoetigt das Include-File KERNEL.INC...

  --------------------------------------------------- }


var GX_CharMat : array[0..2047] of byte;


procedure LoadFont (Dateiname: Strg_14);
var
 Datei   : file;
 Zeichen : byte;
 Start   : integer;
begin
  assign (Datei,Dateiname);
  reset(Datei);
  blockread(Datei,GX_CharMat,16);
  close(Datei);
  for Zeichen :=0 to 255 do
    begin
      Start:=Zeichen*8;
      Hex_Symbol (Zeichen,
                  GX_CharMat[Start+0],
                  GX_CharMat[Start+1],
                  GX_CharMat[Start+2],
                  GX_CharMat[Start+3],
                  GX_CharMat[Start+4],
                  GX_CharMat[Start+5],
                  GX_CharMat[Start+6],
                  GX_CharMat[Start+7]);
     end;
end;



procedure SaveFont (Dateiname: Strg_14);
var
 Datei   : file;
 Zeichen : byte;
 i, j    : integer;
 Start   : integer absolute $F489;
 Matrix  : array[0..7] of byte absolute $F477;
begin
  j:=0;
  for Zeichen:=0 to 255 do
    begin
      Start:=Zeichen*8+$B800;
      GX_Get;
      for i:=0 to 7 do
        begin
          GX_CharMat[j]:=Matrix[i];
          j:=succ(j);
        end;
     end;
  assign (Datei,Dateiname);
  rewrite (Datei);
  blockwrite(Datei,GX_CharMat,16);
  close (Datei);
end;


{ ---------------- Ende von FONT.INC ----------------- }


