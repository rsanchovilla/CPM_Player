(* --------------- PRINTAT.INC ---------------------- *)
(* Include-File fuer PRINTAT(x,y,font,heading,text)   *)
(* Benoetigt Include-File KERNEL.INC...               *)



procedure printat (x, y, font, heading: integer; text: Strg_90);

var    l       : integer;
       k, i, j : byte;
       Matrix  : array(.0..7.) of byte absolute $F477;
       Raster  : array(.0..7.) of byte;
       CStart  : integer absolute $F489;
       ZStart  : integer absolute $F472;
       Zeichen : char;


procedure Get_Matrix;
(* uebertraegt array Matrix in Raster und setzt Matrix auf Null *)
BEGIN
  for k:=0 to 7 do
  BEGIN
    Raster(.k.):=Matrix(.k.);
    Matrix(.k.):=0;
  END;
END;


BEGIN          (*  Hauptteil  *)
  for l:=1 to length(text) do   (* Text Zeichenweise umwandeln und Schreiben *)
  BEGIN                         (* Zeichen holen *)
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



  case heading of               (* Raster drehen und auf Matrix *)
                                (* zurueckschreiben             *)
       1 : BEGIN
             Get_Matrix;        (* Zeilen von oben nach unten   *)
             for i:=0 to 7 do   (* und von hinten nach vorne    *)
                 for j:=0 to 7 do
                 if (Raster(.j.) and (1 shl (7-i)))<>0 then
                                     Matrix(.i.):=Matrix(.i.) or (1 shl j);
           END;

       2 : BEGIN
             Get_Matrix;        (* Zeilen von unten nach oben   *)
             for i:=0 to 7 do   (* und von hinten nach vorne    *)
                 for j:=0 to 7 do
                 if (Raster(.7-i.) and (1 shl (7-j)))<>0 then
                                     Matrix(.i.):=Matrix(.i.) or (1 shl j);
           END;

       3 : BEGIN
             Get_Matrix;        (* Zeilen von unten nach oben   *)
             for i:=0 to 7 do   (* und von vorne nach hinten    *)
                 for j:=0 to 7 do
                 if (Raster(.7-j.) and (1 shl i))<>0 then
                                     Matrix(.i.):=Matrix(.i.) or (1 shl j);
           END;
   END;

ZStart:=$B800;
GX_Symb;
gotoxy(x,y); write(#27,#0);
  case heading of
       0 : x:=succ(x);
       1 : y:=succ(y);
       2 : x:=pred(x);
       3 : y:=pred(y);
  END;
 END;
END;


(* ---------------------- Ende von PRINTAT.INC ---------------------- *)

