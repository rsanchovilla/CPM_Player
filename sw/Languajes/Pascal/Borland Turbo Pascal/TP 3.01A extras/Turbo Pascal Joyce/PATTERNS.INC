(*********************************************************)
(*                                                       *)
(*  Erweiterte Prozeduren: Line_Pattern()                *)
(*                         Fill_Pattern()                *)
(*  Benutzen die vordefinierten Muster zum Zeichnen      *)
(*  der Linie (Line_Style als Konstanten), zum Fuellen   *)
(*  die umdefinierten Zeichen (Fill_Pattern als BYTE).   *)
(*  Fuellmuster muessen mit PatternInit initialisiert    *)
(*  werden.                                              *)
(*  Beide Prozeduren benoetigen das Include-File         *)
(*  KERNEL.INC und Teile von GRAPHLIB.INC                *)
(*                                                       *)
(*********************************************************)

(*  Linien mit verschiedenen Mustern  *)

CONST      Solid =  '****************';
          Dashed =  '****    ****    ';
        L_Dashed =  '********        ';
          Dotted =  '**  **  **  **  ';
   Dashed_Dotted =  '***    **    ***';

TYPE  line_style = String(.16.);


procedure pattern_line(x1, y1, x2, y2 : INTEGER; pattern : line_style; modus : BYTE);
(* zieht Linie zwischen den Punkten x1/y1 und x2/y2
   im entsprechenden Modus mit in Pattern angegebenem Line_Style                  *)

VAR  x, dx, dy, diff,
     i1, Raster       : INTEGER;
     y, z             : BYTE;
     m0,m1            : GX_String;

BEGIN
m0:=copy(pattern,1,8);
m1:=copy(pattern,9,8);
Raster:=GX_Convert(m1)+(GX_Convert(m0) shl 8);
  z:=1;
  dx := abs (x1 - x2);
  dy := abs (y1 - y2);
  IF x1<x2 THEN BEGIN
     x:=x1; y:=y1;
     IF y1>y2 THEN z:=-1;
                END
    ELSE BEGIN
     x:=x2; y:=y2;
     IF y2>y1 THEN z:=-1;
  END;
  plot(x,y,modus);
  IF (dx+dy)=0 THEN exit;
  IF dx>dy THEN
  BEGIN
   (*    horizontale Linie  *)
   IF dy=0 THEN
      FOR i1:=1 TO dx DO
      BEGIN
        x:=succ(x);
        IF (Raster and (1 shl (15-(i1 Mod 16))))<>0 THEN plot(x, y, modus);
      END
   ELSE
   (*   Steigung < 1        *)
   BEGIN
   diff:= dx shr 1;
     FOR i1:=1 TO dx DO BEGIN
               diff:=diff+dy;
      IF diff>=dx THEN
               BEGIN
               diff:=diff-dx; y:=y+z;
               END;
               x:=succ(x);
       IF (Raster and (1 shl (15-(i1 Mod 16))))<>0 THEN plot(x, y, modus);
      END;
     END;
   END

  ELSE
  BEGIN
  (*   vertikale Linie   *)
  IF dx=0 THEN
     FOR i1:=1 TO dy DO
     BEGIN
       y:=y+z;
       IF (Raster and (1 shl (15-(i1 Mod 16))))<>0 THEN plot(x, y, modus);
     END
  ELSE
  (*  Steigung >=1   *)
  BEGIN
  diff:= dy shr 1;
     FOR i1:=1 TO dy DO BEGIN
               diff:=diff+dx;
      IF diff>=dy THEN
               BEGIN
               diff:=diff-dy; x:=succ(x);
               END;
               y:=y+z;
      IF (Raster and (1 shl (15-(i1 Mod 16))))<>0 THEN plot(x, y, modus);
    END;
  END;
 END;
END;
(* Ende von procedure pattern_line() *)


(* Fuellen mit vordefiniertem Muster *)

procedure pattern_fill(number_of_points : BYTE; koord : point_array; fill_pattern : BYTE);

VAR  Status     : ARRAY (.0..247.) of BYTE;
     Fill_Array : ARRAY (.0..247,0..1.) of INTEGER;
     y_start,
     y_min,
     y_max      : BYTE;
     i, i1,
     x_start    : INTEGER;
     matrix     : ARRAY (.0..7.) of BYTE absolute $F477;
     CStart     : INTEGER absolute $F489;
     ZStart     : INTEGER absolute $F472;

procedure find_x(x1, y1, x2, y2 : INTEGER);

VAR  x, dx, dy, dz, i1 : INTEGER;
     y, z : BYTE;

BEGIN
  z:=1;
  dx := abs (x1 - x2);
  dy := abs (y1 - y2);
  IF x1<x2 THEN BEGIN
     x:=x1; y:=y1;
     IF y1>y2 THEN z:=-1;
                END
    ELSE BEGIN
     x:=x2; y:=y2;
     IF y2>y1 THEN z:=-1;
  END;
  IF Status(.y.)<2 THEN
    IF x<>Fill_array(.y,0.)  THEN
           BEGIN
             Fill_array(.y,Status(.y.).):=x;
             Status(.y.):=succ(Status(.y.));
           END;
  IF (dx+dy)=0 THEN exit;
  IF dx>dy THEN
  BEGIN
   (*    horizontale Linie  *)
   IF dy=0 THEN
      FOR i1:=1 TO dx DO
      BEGIN
        x:=succ(x);
      END
   ELSE
   (*   Steigung < 1        *)
   BEGIN
   dz:= dx shr 1;
     FOR i1:=1 TO dx DO BEGIN
               dz:=dz+dy;
      IF dz>=dx THEN
               BEGIN
               dz:=dz-dx; y:=y+z;
               IF Status(.y.)<2 THEN
                 IF succ(x)<>Fill_array(.y,0.)  THEN
                  BEGIN
                  Fill_array(.y,Status(.y.).):=succ(x);
                  Status(.y.):=succ(Status(.y.));
                  END;
               END;
               x:=succ(x);
      END;
     END;
   END

  ELSE
  BEGIN
  (*   vertikale Linie   *)
  IF dx=0 THEN
     FOR i1:=1 TO dy DO
     BEGIN
       y:=y+z;
       IF Status(.y.)<2 THEN
        IF x<>Fill_array(.y,0.)  THEN
                  BEGIN
                  Fill_array(.y,Status(.y.).):=x;
                  Status(.y.):=succ(Status(.y.));
                  END;
     END
  ELSE
  (*  Steigung >=1   *)
  BEGIN
  dz:= dy shr 1;
     FOR i1:=1 TO dy DO BEGIN
               dz:=dz+dx;
      IF dz>=dy THEN
               BEGIN
               dz:=dz-dy; x:=succ(x);
               END;
               y:=y+z;
               IF Status(.y.)<2 THEN
                IF x<>Fill_array(.y,0.)  THEN
                  BEGIN
                  Fill_array(.y,Status(.y.).):=x;
                  Status(.y.):=succ(Status(.y.));
                  END;
    END;
  END;
 END;
END;


BEGIN
(*       Max/Min  fuer y-Werte              *)
y_min:=koord(.0,1.); y_max:=koord(.0,1.);
FOR i:=0 TO pred(number_of_points) DO
    BEGIN
    IF Koord(.i,1.)<y_min THEN y_min:=koord(.i,1.);
    IF koord(.i,1.)>y_max THEN y_max:=koord(.i,1.);
    END;

(*       arrays auf Null setzen       *)
FOR i:=0 TO 247 DO
   BEGIN
    Status(.i.):=0;
    Fill_array(.i,0.):=0;
    Fill_array(.i,1.):=0;
   END;

(*       Grenzen ermitteln                  *)
x_start:=koord(.0,0.) ; y_start:=koord(.0,1.);

FOR i:=1 TO pred(number_of_points) DO
    BEGIN
    find_x(x_start,y_start,koord(.i,0.),koord(.i,1.));
    x_start:=koord(.i,0.) ; y_start:=koord(.i,1.);
    END;


(*       Muster holen              *)
    CStart:=(fill_pattern*8)+$B800;
    GX_Get;


(*      Fuellen mit Muster    *)
FOR i:=succ(y_min) TO pred(y_max) DO
    BEGIN
    IF Status(.i.)=2 THEN
    BEGIN
      IF Fill_array(.i,0.)>Fill_array(.i,1.) THEN
                                point_swap(Fill_array(.i,0.),Fill_array(.i,1.));
      FOR i1:=Fill_array(.i,0.) TO Fill_array(.i,1.) DO
          IF (matrix(.(i MOD 8).) and (1 shl (7- (i1 MOD 8)))) <> 0
             THEN plot(i1,i,0)
             ELSE plot(i1,i,1);
    END;
  END;
END;
(* Ende von procedure pattern_fill() *)


procedure FillPatternInit;

(* legt von 248 bis 255 neue Zeichen im Zeichensatz ab als Fuellmuster *)
BEGIN
  Symbol (248, '**  **  ',
               '**  **  ',
               '  **  **',
               '  **  **',
               '**  **  ',
               '**  **  ',
               '  **  **',
               '  **  **');
  Symbol (249, '*       ',
               ' *      ',
               '  *     ',
               '   *    ',
               '    *   ',
               '     *  ',
               '      * ',
               '       *');
  Symbol (250, '       *',
               '      * ',
               '     *  ',
               '    *   ',
               '   *    ',
               '  *     ',
               ' *      ',
               '*       ');

  Symbol (251, '*      *',
               ' *    * ',
               '  *  *  ',
               '   **   ',
               '   **   ',
               '  *  *  ',
               ' *    * ',
               '*      *');
  Symbol (252, '* * * * ',
               '        ',
               '* * * * ',
               '        ',
               '* * * * ',
               '        ',
               '* * * * ',
               '        ');
  Symbol (253, '* * * * ',
               ' * * * *',
               '* * * * ',
               ' * * * *',
               '* * * * ',
               ' * * * *',
               '* * * * ',
               ' * * * *');
  Symbol (254, '********',
               ' * * * *',
               '********',
               ' * * * *',
               '********',
               ' * * * *',
               '********',
               ' * * * *');
  Symbol (255, '********',
               '********',
               '********',
               '********',
               '********',
               '********',
               '********',
               '********');
END;

(*******************     Ende von PATTERNS.INC    ***********************)

