(************************************************************************)
(*                                                                      *)
(*        Grafikbibliotheksmodul fuer Joyce                             *)
(*           ( setzt KERNEL.INC voraus )                                *)
(*     Prozeduren:                                                      *)
(*       point_swap (VAR a, b : INTEGER);                               *)
(*       line (x1, y1, x2, y2 : INTEGER; modus : BYTE);                 *)
(*       box  (x_links, y_oben, x_rechts, y_unten : INTEGER;            *)
(*                       modus : BYTE);                                 *)
(*       square (x_oben, y_oben, breite : INTEGER; modus : BYTE);       *)
(*       ellipse (x_center, y_center, radius_x, radius_y : INTEGER;     *)
(*                         modus : BYTE);                               *)
(*       circle (x_center, y_center, radius: INTEGER; modus : BYTE);    *)
(*       plot_marker (x, y : INTEGER;  marker : marker_type;            *)
(*                           modus: BYTE );                             *)
(*       poly_plot (number_of_points : BYTE; koord : point_array;       *)
(*                                   modus : BYTE);                     *)
(*       poly_marker (number_of_points : BYTE; koord : point_array;     *)
(*                                marker : marker_type;  modus : BYTE); *)
(*       poly_line (number_of_points : BYTE; koord : point_array;       *)
(*                                   modus : BYTE);                     *)
(*       poly_fill (number_of_points : BYTE; koord : point_array;       *)
(*                                   modus : BYTE);                     *)
(*                                                                      *)
(************************************************************************)

(*        Grafikkonstanten f}r JOYCE               *)

CONST  aspect_ratio = 0.45;

(*        Typendeklarationen fuer Grafik           *)

TYPE   point_array = ARRAY(.0..250,0..1.) of INTEGER;
       marker_type = (kreis, quadrat, filled_quadr, dreieck, kreuz, plus, stern);


(***********         Prozeduren         ************)

procedure point_swap(VAR a, b : INTEGER);

(* vertauscht den Inhalt der Variablen a und b *)

BEGIN
   a:=(a xor b);
   b:=(b xor a);
   a:=(b xor a);
END;



procedure line(x1, y1, x2, y2 : INTEGER; modus : BYTE);

(* zieht Linie zwischen den Punkten x1/y1 und x2/y2
   im entsprechenden Modus                           *)

VAR  x, dx, dy, diff, i1 : INTEGER;
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
  plot(x,y,modus);
  IF (dx+dy)=0 THEN exit;
  IF dx>dy THEN
  BEGIN
   (*    horizontale Linie  *)
   IF dy=0 THEN
      FOR i1:=1 TO dx DO
      BEGIN
        x:=succ(x); plot(x, y, modus);
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
      plot (x, y, modus);
      END;
     END;
   END

  ELSE
  BEGIN
  (*   vertikale Linie   *)
  IF dx=0 THEN
     FOR i1:=1 TO dy DO
     BEGIN
       y:=y+z; plot(x, y, modus);
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
      plot (x, y, modus);
    END;
  END;
 END;
END;




procedure box(x_links, y_oben, x_rechts, y_unten : INTEGER; modus : BYTE);

(* Rechteck mit linker, oberer und rechter, unterer Ecke
   Seiten parallel zu den Bildschirmachsen
   im entsprechenden Modus                                *)

VAR  i : integer;

BEGIN
IF x_links > x_rechts THEN point_swap(x_links,x_rechts);
IF y_oben  > y_unten  THEN point_swap(y_oben,y_unten);

FOR i:=x_links TO x_rechts DO
    BEGIN
      plot(i,y_oben,modus);
      plot(i,y_unten,modus);
    END;

FOR i:=y_oben TO y_unten DO
    BEGIN
      plot(x_links,i,modus);
      plot(x_rechts,i,modus);
    END;

END;



procedure square(x_oben, y_oben, breite : INTEGER; modus : BYTE);

(* Quadrat mit linker, oberer Ecke und Breite in Pixeln
   mit Hilfe der Konstanten aspect_ratio aus p box()
   auf gleiche Seitenlaengen umgerechnet                 *)

VAR y_unten, x_unten : INTEGER;

BEGIN

x_unten:=breite + x_oben;
y_unten:=round(breite*aspect_ratio + y_oben);

box(x_oben,y_oben, x_unten,y_unten, modus);

END;




procedure ellipse(x_center, y_center, radius_x, radius_y : INTEGER; modus : BYTE);

(* Ellipse mit Mittelpunkt und x- bzw. y-Halbachse im entsprechenden Modus
   mit Hilfe der Konstanten aspect_ratio wird das Achsenverhaeltnis gewahrt
   Achsen parallel zu den Bildschirmachsen                                   *)

VAR  Diff, AspRX, AspRY, x, y : INTEGER;
     ax_ratio                 : REAL;

BEGIN
  x:=0; y:=radius_x; Diff:=pred(radius_x);
  ax_ratio:=aspect_ratio*radius_y/radius_x;
  REPEAT
   IF Diff < 0 THEN
   BEGIN
    y:=pred(y); Diff:=Diff+y+y;
   END;
    AspRX:=round(ax_ratio*x);
    AspRY:=round(ax_ratio*y);
    plot(x_center+x,y_center+AspRY,modus);
    plot(x_center-x,y_center+AspRY,modus);
    plot(x_center+x,y_center-AspRY,modus);
    plot(x_center-x,y_center-AspRY,modus);
    plot(x_center+y,y_center+AspRX,modus);
    plot(x_center-y,y_center+AspRX,modus);
    plot(x_center+y,y_center-AspRX,modus);
    plot(x_center-y,y_center-AspRX,modus);
    Diff:=Diff-x-x-1;
    x:=succ(x);
  UNTIL (x > y);
END;

procedure circle(x_center, y_center, radius: INTEGER; modus : BYTE);

(* Kreis mit Mittelpunkt und Radius, berechnet als Ellipse mit gleich
   langen Halbachsen im entsprechenden Modus                          *)

BEGIN
  ellipse(x_center, y_center, radius, radius, modus);
END;


procedure plot_marker(x, y : INTEGER;  marker : marker_type; modus: BYTE );

(* setzt einen 'Marker' auf den Punkt mit den Koordinaten x und y
   der Marker muss in Marker_Type (Kreis, Quadrat, gefuelltes Quadr.,
   Dreieck, Kreuz, Plus, Stern) enthalten sein
   im jeweiligen Modus; die Groesse wird als Konstante marker_height
   festgelegt, bei Kreis, Kreuz und Stern wurden Korrekturen eingefuehrt,
   um das Aussehen zu verbessern                                         *)

CONST marker_height = 4;
VAR   hoehe, i      : BYTE;

BEGIN
  hoehe:=Round(aspect_ratio*marker_height);
  CASE marker of
             kreis :  circle(x, y, marker_height+1, modus);
           quadrat :  square(x-marker_height, y-hoehe, marker_height shl 1, modus);
      filled_quadr :  FOR i:=y-hoehe TO y+hoehe DO
                         line(x-marker_height, i, x+marker_height, i, modus);
           dreieck :  BEGIN
                        line(x-marker_height, y-hoehe, x+marker_height, y-hoehe, modus);
                        line(x-marker_height, y-hoehe, x, y+hoehe, modus);
                        line(x+marker_height, y-hoehe, x, y+hoehe, modus);
                      END;
             kreuz :  BEGIN
                        line(x-marker_height-1, y-hoehe,
                             x+marker_height, y+hoehe, modus);
                        line(x-marker_height-1, y+hoehe,
                             x+marker_height, y-hoehe, modus);
                      END;
              plus :  BEGIN
                        line(x-marker_height, y, x+marker_height, y, modus);
                        line(x, y+hoehe, x, y-hoehe, modus);
                      END;
             stern :  BEGIN
                        line(x-marker_height-1, y-hoehe,
                             x+marker_height, y+hoehe, modus);
                        line(x-marker_height-1, y+hoehe,
                             x+marker_height, y-hoehe, modus);
                        line(x-marker_height-1, y, x+marker_height, y, modus);
                        line(x, y+hoehe, x, y-hoehe, modus);
                      END;

          END;
END;


procedure poly_plot(number_of_points : BYTE; koord : point_array; modus : BYTE);

(* plottet ein zweidimensionales array mit 'number_of_points' x- und y-Werten
   im entsprechenden Modus                                                    *)

VAR i : BYTE;

BEGIN
FOR i:=0 TO pred(number_of_points) DO
    plot(koord(.i,0.),koord(.i,1.),modus);
END;


procedure poly_marker(number_of_points : BYTE; koord : point_array;
                                marker : marker_type;  modus : BYTE);

(* setzt auf die im zweidimensionalen array koord  x/y-Werte
   (Anzahl : number_of_points) die bezeichneten Marker
   im entsprechenden Modus                                            *)

VAR i : BYTE;

BEGIN
FOR i:=0 TO pred(number_of_points) DO
    plot_marker(koord(.i,0.),koord(.i,1.), marker, modus);
END;



procedure poly_line(number_of_points : BYTE; koord : point_array; modus : BYTE);

(* verbindet die im zweidimensionalen array koord enthaltenen x/y-Werte
   (Anzahl : number_of_points)
   in aufsteigender Reihenfolge mit Linien im entsprechenden Modus               *)

VAR i : BYTE;
    x_start, y_start :INTEGER;

BEGIN
x_start:=koord(.0,0.) ; y_start:=koord(.0,1.);

FOR i:=1 TO pred(number_of_points) DO
    BEGIN
    line(x_start,y_start,koord(.i,0.),koord(.i,1.),modus);
    x_start:=koord(.i,0.) ; y_start:=koord(.i,1.);
    END;
END;



procedure poly_fill(number_of_points : BYTE; koord : point_array; modus : BYTE);

(* fuellt die Flaeche, deren Eckpunkte im zweidimensionalen array koord
   uebergeben werden   (Anzahl : number_of_points), im entsprechenden Modus  *)

VAR  Status         : ARRAY (.0..247.) of BYTE;
     Fill_Array     : ARRAY (.0..247,0..1.) of INTEGER;
     y_start,
     y_min, y_max   : BYTE;
     i, i1, x_start : INTEGER;


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



(*      Fuellen               *)
FOR i:=succ(y_min) TO pred(y_max) DO
    BEGIN
    IF Status(.i.)=2 THEN
    BEGIN
      IF Fill_array(.i,0.)>Fill_array(.i,1.) THEN
                                point_swap(Fill_array(.i,0.),Fill_array(.i,1.));
      FOR i1:=Fill_array(.i,0.) TO Fill_array(.i,1.) DO plot(i1,i,modus);
    END;
  END;
END;



(*             Ende  von GRAPHLIB.INC               *)

