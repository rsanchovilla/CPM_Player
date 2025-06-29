program graphik_demo;

(*$I KERNEL.INC*)
(*$I GRAPHLIB.INC*)
(*$I PATTERNS.INC*)
(*$I GRAPHIC.PRO*)


VAR ch : CHAR;


(************************************************)
procedure linedemo;

BEGIN
 pattern_line(20,40,700,40,solid,0);
 pattern_line(20,80,700,80,dashed,0);
 pattern_line(20,120,700,120,dotted,0);
 pattern_line(20,160,700,160,dashed_dotted,0);
 pattern_line(20,200,700,200,l_dashed,0);

 pattern_line(160,5,160,240,solid,0);
 pattern_line(260,5,260,240,dashed,0);
 pattern_line(360,5,360,240,dotted,0);
 pattern_line(460,5,460,240,dashed_dotted,0);
 pattern_line(560,5,560,240,l_dashed,0);
END;

(************************************************)
procedure xy_grafik;

VAR    i : INTEGER;
   Sinus : Point_array;

BEGIN
  FOR i:=0 TO 200 DO
   BEGIN
     Sinus(.i,0.):=i;
     Sinus(.i,1.):=Round(350*(sin(i))/SQRT(i+1));
   END;
  plot_point_array(Sinus,201,100,700,100,220,0,200,-200,200,10,10,0);
END;

(************************************************)
procedure Lissajous;

VAR
       xy_per      : REAL;
       x_per, y_per,
       i           : INTEGER;
       Mode        : CHAR;

procedure draw;

Var winkel,
    x1,y1,x2,y2 : real;
    i : INTEGER;

BEGIN
  winkel:=0; x2:=700; y2:=240;
  FOR i:=0 TO ROUND(60*xy_per) DO
  BEGIN
    CASE mode OF
  'N' : BEGIN
          x1:=x2; y1:=y2;
        END;
  'P' : BEGIN
          x1:=350; y1:=120;
        END;
  'L' : BEGIN
          x1:=(700/4)*cos(winkel)+360; y1:=120;
        END;
  'K' : BEGIN
          x1:=(700/4)*cos(winkel)+360;
          y1:=(240/4)*sin(winkel)+120;
        END;
    END;
   x2:=350*cos(winkel/x_per) + 350;
   y2:=120*sin(winkel/y_per) + 120;
   line(round(x1),round(y1),round(x2),round(y2),0);
   winkel:=winkel+(PI/30);
 END;
END;

BEGIN
gotoxy(30,10); WRITE(' X-Periode (1..10)? '); READ(x_per);
gotoxy(30,12); WRITE(' Y-Periode (1..10)? '); READ(y_per);
gotoxy(0,14); WRITE(' Ausf}hrung N(ormal), P(unkt), L(inie), K(reis)? '); READ(kbd,Mode);
Mode:=Upcase(Mode); WRITE(Mode);
i:=11;
  REPEAT
    i:=pred(i);
  UNTIL (INT(x_per/i)=x_per/i) and (INT(y_per/i)=y_per/i) ;
xy_per:=x_per*y_per/i;
ClrScr;
draw;
END;

(************************************************)
procedure MarkerDemo;

VAR  x,y : INTEGER;
     Mark: Marker_Type;

BEGIN
Mark:=Kreis;
  REPEAT
    x:=5+random(710);
    y:=3+random(242);
    plot_marker(x,y,Mark,0);
    IF Mark=Stern THEN Mark:=Kreis ELSE Mark:=succ(Mark);
  UNTIL keypressed;
END;

(************************************************)
procedure Musterdemo;


VAR    Viereckp : point_array;
            k,i : INTEGER;

procedure weiter;
BEGIN
FOR k:=0 TO 5 DO
        BEGIN
        Viereckp(.k,0.):=Viereckp(.k,0.)-20;
        Viereckp(.k,1.):=Viereckp(.k,1.)+20;
        END;
END;


BEGIN
FillPatternInit;
Viereckp(.0,0.):= 400;
Viereckp(.1,0.):= 400;
Viereckp(.2,0.):= 600;
Viereckp(.3,0.):= 600;
Viereckp(.4,0.):= 400;
Viereckp(.0,1.):= 10;
Viereckp(.1,1.):= 50;
Viereckp(.2,1.):= 50;
Viereckp(.3,1.):= 10;
Viereckp(.4,1.):= 10;

FOR i:=248 TO 255 DO
    BEGIN
      pattern_fill(5,viereckp,i);
      poly_line(5,viereckp,0);
      weiter;
    END;
 pattern_fill(5,viereckp,32);
 poly_line(5,viereckp,0);
 weiter;
 pattern_fill(5,viereckp,149);
 poly_line(5,viereckp,0);
END;

(************************************************)
procedure Figurdemo;

VAR  dreieckp : point_array ;

BEGIN

dreieckp(.0,0.):=110; dreieckp(.0,1.):=140;
dreieckp(.1,0.):=250; dreieckp(.1,1.):=90;
dreieckp(.2,0.):=40; dreieckp(.2,1.):=90;
dreieckp(.3,0.):=110; dreieckp(.3,1.):=140;


line(0,0,719,0,0);
line(719,247,719,0,0);
line(0,247,719,247,0);
line(0,0,0,247,0);

box(30,30,700,200,0);
box(50,50,100,100,0);

circle(200,100,50,0);
circle(300,80,50,0);
circle(50,200,30,0);
circle(360,120,100,0);
circle(600,70,50,0);
circle(360,120,250,0);

square(100,100,50,0);
square(150,10,200,0);

ellipse(200,150,50,100,0);
ellipse(360,125,300,100,0);

poly_fill(4,dreieckp,1);
poly_line(4,dreieckp,0);

END;


(* Hauptprogramm *)

BEGIN
GraphInit;
ClrScr; HideCursor;

(* Lissajous-Figuren *)
WRITELN(' Lissajous-Figuren ');
WRITELN('  garantiert ohne GSX!!! ');
Lissajous;
GotoXY(2,31); WRITE('Weiter mit beliebiger Taste!');
READ(kbd,ch);
ClrScr;

(* Linienarten: Line_Muster() *)
GotoXY(10,10); WRITE('Es gibt 5 Linienmuster.');
GotoXY(12,12); WRITE('... man kann sich aber auch seine eigenen Muster definieren!');
Linedemo;
GotoXY(5,31); WRITE('Weiter mit beliebiger Taste!');
READ(kbd,ch);
ClrScr;

(* Box(),Square(),Ellipse(),Circle(),
   Poly_Line() und Poly_Fill()          *)
GotoXY(10,5); WRITE('Von Rechtecken bis zur Fl{chenf}llung ist einiges dabei');
Figurdemo;
GotoXY(5,30); WRITE('Weiter mit beliebiger Taste!');
READ(kbd,ch);
ClrScr;

(* Fuellmuster: Pattern_Fill *)
WRITELN;
WRITELN('F}llmuster k|nnen beliebig ');
WRITELN('im Zeichensatz eingef}gt werden');
WRITELN('oder die Grafikzeichen k|nnen verwendet werden');
Musterdemo;
GotoXY(60,28); WRITE('Weiter mit beliebiger Taste!');
READ(kbd,ch);
ClrScr;

(* Plot_Marker mit versch. Typen *)
GotoXY(10,15); WRITE('7 Markertypen sind bisher eingebaut');
GotoXY(20,20); WRITE('Ende mit beliebiger Taste!');
MarkerDemo;

ClrScr;

(* Beispiel fuer Darstellung von Point_arrays *)
GotoXY(10,5); WRITE(' Die Darstellung von Funktionen oder Me~werten ');
GotoXY(10,7); WRITE(' in Koordinatensystemen wird durch Festlegung  ');
GotoXY(10,9); WRITE(' von VIEWPORT und WINDOW-Koordinaten erleichtert.');
xy_grafik;
GotoXY(10,31); WRITE(' Ende des DEMOPROGRAMMS! Dr}cke RETURN');
READ(kbd,ch);

ShowCursor; ClrScr;
END.

