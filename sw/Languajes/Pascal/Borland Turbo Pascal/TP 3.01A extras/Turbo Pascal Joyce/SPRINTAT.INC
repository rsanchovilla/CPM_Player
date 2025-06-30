(* ---------------- SPRINTAT.INC --------------------- *)
(* Include-File fuer SPRINTAT(x,y,font,heading,text)   *)
(* schreibt in Spiegelschrift                          *)
(* Benoetigt das Include-File KERNEL.INC...            *)


procedure sprintat (x, y, font, heading: integer; text: Strg_90);

var    l       : integer;
       k, i, j : byte;
       Matrix  : array(.0..7.) of byte absolute $F477;
       Raster  : array(.0..7.) of byte;
       CStart  : integer absolute $F489;
       ZStart  : integer absolute $F472;
       Zeichen : char;

procedure Get_Matrix;

BEGIN
  for k:=0 to 7 do
  BEGIN
    Raster(.k.):=Matrix(.k.);
    Matrix(.k.):=0;
  END;
END;

BEGIN
  for l:=1 to length(text) do
  BEGIN
    Zeichen:=text(.l.);
    CStart:=(ord(Zeichen)*8)+$B800;
    GX_Get;


  case font of

    1 : for i:=0 to 7 do     (* schmal *)
         BEGIN
          Raster(.i.):=Matrix(.i.) shr 1;
          Matrix(.i.):=Matrix(.i.) and Raster(.i.);
         END;

    2 : for i:=0 to 7 do     (* fett *)
         BEGIN
          Raster(.i.):=Matrix(.i.) shr 1;
          Matrix(.i.):=Matrix(.i.) or Raster(.i.);
         END;

    3 : for i:=0 to 7 do Matrix(.i.):=not Matrix(.i.);  (* invers *)

    4 : BEGIN                              (* kursiv *)
         Matrix(.0.):=Matrix(.0.) shr 2;
         Matrix(.1.):=Matrix(.1.) shr 1;
         Matrix(.2.):=Matrix(.2.) shr 1;
         Matrix(.5.):=Matrix(.5.) shl 1;
         Matrix(.6.):=Matrix(.6.) shl 1;
         Matrix(.7.):=Matrix(.7.) shl 2;
        END;
  END;


  case heading of

       0 : BEGIN
             Get_Matrix;
             for i:=0 to 7 do
                 for j:=0 to 7 do
                 if (Raster(.i.) and (1 shl (7-j)))<>0 then
                                     Matrix(.i.):=Matrix(.i.) or (1 shl j);
           END;

       1 : BEGIN
             Get_Matrix;
             for i:=0 to 7 do
                 for j:=0 to 7 do
                 if (Raster(.j.) and (1 shl i))<>0 then
                                     Matrix(.i.):=Matrix(.i.) or (1 shl j);
           END;

       2 : BEGIN
             Get_Matrix;
             for i:=0 to 7 do
                 for j:=0 to 7 do
                 if (Raster(.7-i.) and (1 shl j))<>0 then
                                     Matrix(.i.):=Matrix(.i.) or (1 shl j);
           END;

       3 : BEGIN
             Get_Matrix;
             for i:=0 to 7 do
                 for j:=0 to 7 do
                 if (Raster(.7-j.) and (1 shl (7-i)))<>0 then
                                     Matrix(.i.):=Matrix(.i.) or (1 shl j);
           END;
   END;

ZStart:=$B800;
GX_Symb;

  case heading of
       0 : BEGIN
             gotoxy(x+(length(Text)-pred(l)),y); write(#27,#0);
           END;
       1 : BEGIN
             gotoxy(x,y+(length(Text)-pred(l))); write(#27,#0)
           END;
       2 : BEGIN
             gotoxy(x-(length(Text)-pred(l)),y); write(#27,#0)
           END;
       3 : BEGIN
             gotoxy(x,y-(length(Text)-pred(l))); write(#27,#0)
           END;
  END;
 END;
END;

(* ---------------------- Ende von SPRINTAT.INC ---------------------- *)


