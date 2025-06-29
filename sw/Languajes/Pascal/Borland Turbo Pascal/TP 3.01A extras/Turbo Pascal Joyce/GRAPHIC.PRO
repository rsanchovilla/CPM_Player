(************************************************************************)
(*                                                                      *)
(*       Erweiterte Grafikprozedur  plot_point_array()                  *)
(*       ( benoetigt KERNEL.INC und GRAPHLIB.INC )                      *)
(*       Uebergeben wird ein Array mit Punkten und deren Anzahl         *)
(*       Die view_ -Parameter legen den Bildschirmausschnitt fest,      *)
(*       auf den das Koordinatensystem gezeichnet wird (0..719,0..247)  *)
(*       Die win_ -Parameter legen die Benutzerkoordinaten der Achsen   *)
(*       fest, x_Teil und y_Teil die Anzahl der Teilstriche der Achsen. *)
(*                                                                      *)
(************************************************************************)


procedure plot_point_array(Feld : point_array; Anz_Pkte, view_x_min,
                     view_x_max, view_y_min, view_y_max, win_x_min, win_x_max,
                     win_y_min, win_y_max : integer; x_Teil, y_Teil, modus : byte);

VAR  Diff_x, Diff_y,
     x_Start, y_Start, x, y,
     Zaehler, Breite, i       : INTEGER;
     Pxf, Pyf                 : REAL;


procedure koord_trans(VAR x_koord, y_koord : integer);

BEGIN
  x_koord:=round((x_koord - win_x_min)*((view_x_max - view_x_min)/(win_x_max - win_x_min)))
                    + view_x_min;
  y_koord:=view_y_max - ROUND((y_koord - win_y_min)*((view_y_max - view_y_min)/
                      (win_y_max - win_y_min)));
END;

BEGIN
(*   Koordinatensystem zeichnen *)
(*   x-Achse  *)
line(view_x_min, view_y_max+5, view_x_max, view_y_max+5, modus);
Breite:=Round((view_x_max - view_x_min)/x_Teil);
Zaehler:=0;
REPEAT
  Line(view_x_min+Zaehler, view_y_max+5, view_x_min+Zaehler, view_y_max+9, modus);
  zaehler:=Zaehler+Breite;
UNTIL Zaehler>(view_x_max - view_x_min);

(*   y-Achse  *)
line(view_x_min-9, view_y_min,  view_x_min-9, view_y_max, modus);
Breite:=Round((view_y_max - view_y_min)/y_Teil);
Zaehler:=0;
REPEAT
  Line(view_x_min-9, view_y_max-Zaehler, view_x_min-16, view_y_max-Zaehler, modus);
  zaehler:=Zaehler+Breite;
UNTIL Zaehler>(view_y_max - view_y_min);

(*   Array zeichnen   *)
  x_start:=Feld(.0,0.);
  y_start:=Feld(.0,1.);
  koord_trans(x_start,y_start);
  FOR i:=1 TO pred(Anz_Pkte) DO
      BEGIN
        x:=Feld(.i,0.); y:=Feld(.i,1.);
        koord_trans(x,y);
        line(x_start, y_start, x, y, modus);
        x_start:=x; y_start:=y;
      END;
END;

(*****************      Ende von GRAPH.PRO      *************************)

