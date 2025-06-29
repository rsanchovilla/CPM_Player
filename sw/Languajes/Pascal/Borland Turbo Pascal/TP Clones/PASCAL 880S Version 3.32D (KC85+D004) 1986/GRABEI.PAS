Program Grabei;

(* Beispielprogramm fuer Arbeit mit Graphic unter Turbo-Pascal*)

Const PIOAD=$88; SelectIRM=4; AddressOfIRM=$8000;

Var X,X2,XK,Y,YD,R,Z : Real;
    N                : Byte;
    MaxY             : Array[0..319] Of Byte;

{$I GRAPHIC.BOX}

Procedure SavePicture;
Var OutFile : File;
    Buffer  : Array [0..$27FF] Of Byte;
    IRM     : Array [0..$27FF] Of Byte Absolute AddressOfIRM;
Begin Port[PIOAD]:=Port[PIOAD] Or SelectIRM;
      Move(IRM,Buffer,SizeOf(IRM));
      Port[PIOAD]:=Port[PIOAD] Xor SelectIRM;
      Assign(OutFile,'GRAPH.PIC'); Rewrite(OutFile);
      BlockWrite(OutFile,Buffer,80);
      Close(OutFile);
End;

Procedure Plot(XK,Y : Real);
Var I,J : Integer;
Begin I:=160+Round(20*(XK+Y)); J:=128+Round(50*(XK+Z));
      If J>MaxY[I] Then
      Begin MaxY[I]:=J; Pixel(I,255-J,0);
      End;
End;

Begin FillChar(MaxY,SizeOf(MaxY),0);
      ClrScr; X:=-5; N:=0;
      While X<=5 Do
      Begin X2:=X*X; XK:=X/Sqrt(8); Y:=0;
            If (N Mod 10=0) Or (X+0.03>5) Then YD:=0.03 Else YD:=0.5;
            While Y<=5 Do
            Begin R:=Sqrt(X2+Y*Y); Z:=Exp(-0.5*R)*Cos(R); Z:=Z+Z;
                  Plot(XK,-Y); Plot(XK,Y);
                  Y:=Y+YD;
            End;
            X:=X+0.03; N:=N+1;
      End;
      SavePicture;
End.