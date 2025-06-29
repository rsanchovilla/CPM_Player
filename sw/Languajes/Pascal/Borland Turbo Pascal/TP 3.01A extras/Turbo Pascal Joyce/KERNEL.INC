
{ ------------------------- KERNEL.INC ----------------------------
  Include-File fuer Grafikbefehle auf dem JOYCE unter Turbo Pascal.
  Hauptmodul, enthaelt MCode und elementare Routinen. Mu~ auf alle
  F{lle ins Hauptprogramm eingebinden werden.
  Es sind enthalten:

     procedure GraphInit       -> Initialisierung des MCode
     procedure Plot(x,y,m)     -> Pixel set/reset/invert
     procedure Screen_On       -> Bildschirm einschalten
     procedure Screen_Off      -> Bildschirm ausschalten
     procedure ShowCursor      -> Cursor ein
     procedure HideCursor      -> Cursor aus
     function  DotColor()      -> TRUE=Pixel gesetzt
     procedure Symbol(...)     -> Zeichensatz aendern
     procedure Hex_Symbol(...) ->      "         "

   Variablen & Prozeduren mit dem Namen GX_ sind zu vermeiden, um
   nicht mit Interna der Grafikerweiterungen zu kollidieren...

   Zum Compilieren die Endadresse auf $F3FF setzen, um nicht den
   MCode zu ueberschreiben!!!
--------------------------------------------------------------------- }


type GX_MCode  = array[0..202] of byte;
     GX_String = string[8];
     Strg_14   = string[14];
     Strg_90   = string[90];

var  GX_MProg : GX_MCode   absolute $F400;

const GX_Data:GX_MCode =
  ($ED,$5B,$10,$F4,$2A,$12,$F4,$01,$14,$F4,$CD,$5A,$FC,$E9,$00,$C9,
   $00,$00,$00,$00,$3E,$03,$A2,$57,$E5,$26,$00,$29,$01,$00,$B6,$09,
   $4E,$23,$46,$79,$E6,$F8,$6F,$60,$29,$19,$7D,$E6,$F8,$6F,$79,$E6,
   $07,$B5,$6F,$7B,$E6,$07,$3C,$47,$AF,$37,$1F,$10,$FD,$C1,$4F,$78,
   $FE,$00,$20,$04,$79,$B6,$77,$C9,$FE,$01,$20,$05,$79,$2F,$A6,$77,
   $C9,$FE,$02,$20,$04,$79,$AE,$77,$C9,$FE,$03,$C0,$79,$A6,$32,$13,
   $F4,$C9,$01,$6B,$F4,$CD,$5A,$FC,$E9,$00,$C9,$21,$77,$F4,$01,$08,
   $00,$11,$00,$00,$ED,$B0,$C9,$00,$00,$00,$00,$00,$00,$00,$00,$01,
   $88,$F4,$CD,$5A,$FC,$E9,$00,$C9,$21,$00,$00,$01,$08,$00,$11,$77,
   $F4,$ED,$B0,$C9,$01,$9D,$F4,$CD,$5A,$FC,$E9,$00,$C9,$1E,$00,$3E,
   $00,$16,$00,$07,$17,$17,$17,$6F,$7A,$CE,$B6,$67,$7E,$23,$66,$6F,
   $EB,$29,$29,$19,$29,$01,$08,$00,$3E,$00,$FE,$00,$20,$06,$11,$77,
   $F4,$ED,$B0,$C9,$EB,$21,$77,$F4,$ED,$B0,$C9);



procedure GX_Dot; external $F400;

procedure GX_Symb; external $F462;

procedure GX_Get; external $F47F;

procedure GX_ScrAcc; external $F494;


procedure GraphInit;
begin
  GX_MProg:=GX_Data;
end;


procedure Plot (x:integer; y,m:byte);
var  GX_X    : integer absolute $F410;
     GX_Y    : byte    absolute $F412;
     GX_M    : byte    absolute $F413;
begin
  GX_X:=x;
  GX_Y:=y;
  GX_M:=m;
  GX_Dot;
end;


function DotColor (x:integer; y:byte):boolean;
begin
  Plot(x,y,3);
  DotColor:=mem[$F413] <> 0;
end;


procedure Screen_On;
begin
  port[248]:=7;
end;

procedure Screen_Off;
begin
  port[248]:=8;
end;

procedure HideCursor;
begin
 write(#27,'f');
end;

procedure ShowCursor;
begin
  write(#27,'e');
end;


function GX_Convert(var rowpic:GX_String):byte;
var  i,j : byte;
begin
  if length(rowpic)<8 then
    for i:=succ(length(rowpic)) to 8 do rowpic:=rowpic+' ';
  j:=0;
  for i:=1 to 8 do begin
    j:=j shl 1;
    if rowpic[i]='*' then j:=succ(j)
  end;
  GX_Convert:=j
end;


procedure Symbol(Code:byte; rp0,rp1,rp2,rp3,rp4,rp5,rp6,rp7:GX_String);
var   matrix : array[0..7] of byte absolute $F477;
      CStart : integer absolute $F472;
begin
  matrix[0]:=GX_Convert(rp0);
  matrix[1]:=GX_Convert(rp1);
  matrix[2]:=GX_Convert(rp2);
  matrix[3]:=GX_Convert(rp3);
  matrix[4]:=GX_Convert(rp4);
  matrix[5]:=GX_Convert(rp5);
  matrix[6]:=GX_Convert(rp6);
  matrix[7]:=GX_Convert(rp7);
  CStart:=Code*8+$B800;
  GX_Symb;
end;


procedure Hex_Symbol(Code,r0,r1,r2,r3,r4,r5,r6,r7:byte);
var   matrix : array[0..7] of byte absolute $F477;
      CStart : integer absolute $F472;
begin
  matrix[0]:=r0;
  matrix[1]:=r1;
  matrix[2]:=r2;
  matrix[3]:=r3;
  matrix[4]:=r4;
  matrix[5]:=r5;
  matrix[6]:=r6;
  matrix[7]:=r7;
  CStart:=Code*8+$B800;
  GX_Symb;
end;


{ ------------------ Ende von KERNEL.INC ---------------------- }

