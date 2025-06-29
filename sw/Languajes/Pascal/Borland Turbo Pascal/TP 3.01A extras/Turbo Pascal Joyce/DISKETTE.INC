{ ------------------- DISKETTE.INC --------------------

  Include-File fuer Diskettenoperationen.
  Stellt folgende Funktionen zur Verfuegung:

    procedure SaveScreen() -> Bild speichern
    procedure LoadScreen() -> Bild laden

  Benoetigt Include-File KERNEL.INC...

  ---------------------------------------------------- }


var GX_Buffer : array[0..22319] of byte;


procedure SaveScreen (Dateiname: Strg_14);
var
 i, j    : integer;
 Row     : byte absolute $F4A0;
 Col     : byte absolute $F49E;
 AccMode : byte absolute $F4B9;
 Matrix  : array[0..7] of byte absolute $F477;
 Datei   : file;
begin
  j:=0;
  AccMode:=0;
  for Row:=0 to 30 do
   begin
    for Col:=0 to 89 do
      begin
        GX_ScrAcc;
        for i:=0 to 7 do
          begin
            GX_Buffer[j]:=Matrix[i];
            j:=succ(j);
          end;
       end;
    end;
  assign(Datei,Dateiname);
  rewrite(Datei);
  blockwrite(Datei,GX_Buffer,175);
  close(Datei);
end;


procedure LoadScreen (Dateiname: Strg_14);
var
 i, j    : integer;
 Row     : byte absolute $F4A0;
 Col     : byte absolute $F49E;
 AccMode : byte absolute $F4B9;
 Matrix  : array[0..7] of byte absolute $F477;
 Datei   : file;
begin
  j:=0;
  AccMode:=1;
  assign(Datei,Dateiname);
  reset(Datei);
  blockread(Datei,GX_Buffer,175);
  close(Datei);
  for Row:=0 to 30 do
   begin
    for Col:=0 to 89 do
      begin
        for i:=0 to 7 do
          begin
            Matrix[i]:=GX_Buffer[j];
            j:=succ(j);
          end;
         GX_ScrAcc;
      end;
    end;
end;


{ --------------- Ende von DISKETTE.INC --------------- }

