(*************************************************)
(* GSX-80 Demo for Turbo Pascal                  *)
(* Retyped from ancient german computer magazine *)
(* October 2014, Udo Munk                        *)
(*                                               *)
(* Set the Compiler Options to compile a COM     *)
(* and set the end address to 8000 or so, to     *)
(* leave enough memory to load the GSX modules.  *)
(* Then add the RSX with gengraf gsxdemo.com.    *)
(*************************************************)

Program GsxDemo;

Var i,j:   Integer;
    k:     Real;
    Dummy: Char;

(*$ITURBOGSX.LIB*)

Begin
  GraphInit;
  OpenWorkstation(1,Solid,Pixel,Full,XXX);

  For i := 1 To 1000 Do
    PlotPoint(Random(32000),Random(32000));
  UpdateWorkstation;
  Repeat Until Keypressed;
  Read(Kbd,Dummy);

  ClearWorkstation;
  k := 0.0;
  Repeat
    i := Round(k * 1500);
    j := Round(Sin(k) * 8000 + 12000);
    GraphText('GSX',i,j);
    k := k + 0.1;
  Until K > 20;
  Repeat Until Keypressed;
  Read(Kbd,Dummy);

  ClearWorkstation;
  For i := 1 To 64 Do DrawLine(i*500,0,32767,i*500);
  For i := 1 To 64 Do DrawLine(32767-1*500,0,0,i*500);
  For i := 1 To 5 Do
    GraphText('Turbo Pascal library for GSX',15000,i*800+25000);
  Repeat Until Keypressed;
  Read(Kbd,Dummy);

  CloseWorkstation;
End.
