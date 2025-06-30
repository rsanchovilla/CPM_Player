Program GEMView;

(* Show GEM Metafile using GSX         *)
(* Compile:  set end address to  $A000 *)
(* Add GSX:  GENGRAF GEMView           *)

(* ----------------------------------- *)
Type
 String128 = String[128];
 String14  = String[14]; (* @:88888888.333 *)
 String3   = String[3];
(* ----------------------------------- *)
{$I gsx.inc}
(* ----------------------------------- *)
{$I redir.inc}
(* ----------------------------------- *)
Var
 DEBUG     : Integer;
 REDIR     : Integer;
 ID        : Integer;
 CmdLine   : String128;
 i,j       : Integer;
 dx,dy     : Integer;
 sx,sy     : Integer;
 ddx,ddy   : Integer;
 dsx,dsy   : Integer;
 idx       : Integer;
 FileName  : String14;
 Param     : String3;
 Argument  : String14;
 GEMFile   : File;
 GEMRecord : GEM_rec;
 GEMHeader : GEM_hdr;
 Buffer    : array[1..128] of Byte;
 Point     : array[1..2] of Integer;
(* ----------------------------------- *)
Label
 Done, ErrExit, NextParam;
(* ----------------------------------- *)
Procedure handlePolyline(nPoints : Integer);
Var
 i     : Integer;
 P0, P1 : GEM_pt;
Begin
 P0.x := dx + sx*ptsin[1];
 P0.y := dy + sy*ptsin[2];

 For i := 2 To nPoints Do
 Begin
  P1.x := dx + sx*ptsin[i*2-1];
  P1.y := dy + sy*ptsin[i*2  ];
  GSX_Line ( P0, P1 );
  P0 := P1;
 End;
End;
(* ----------------------------------- *)
Procedure handlePolymarker(nPoints : Integer);
Var
 i     : Integer;
 P : GEM_pt;
Begin
 For i := 1 To nPoints Do
 Begin
  P.x := dx + sx*ptsin[i*2-1];
  P.y := dy + sy*ptsin[i*2];
  GSX_Marker ( P );
 End;
End;
(* ----------------------------------- *)
Procedure handleText(nChars : Integer);
Var
 i     : Integer;
Begin

 If DEBUG > 0 Then
 Begin
  Write(' Text at ',ptsin[1],',',ptsin[2],': "');
  For i := 1 To nChars Do
  Begin
   Write(Char(intin[i]));
  End;
  WriteLn('"');
 End;

 ptsin[1] := dx + sx*ptsin[1];
 ptsin[2] := dy + sy*ptsin[2];

 contrl[1] := 8;
 contrl[2] := 1;
 contrl[4] := nChars;
 Bdos(115,Addr(pblock[1]));

End;
(* ----------------------------------- *)
Procedure handleArc( P0 : GEM_pt;
                     a, b, a0, a1 : Real;
                     Pie : Boolean );
Var
 i, n : Integer;
 c, d, da, sa, ca : Real;
 P1, P2 : GEM_pt;
Begin

  (* segment length: 500 *)
  a := Abs(a);
  b := Abs(b);

  (* WriteLn('a,b,a0,a1:',a,',',b,',',a0,',',a1); *)

  n := Trunc((a1-a0)*(a+b)/500);

  If n < 5 Then n := 5;
  (* angular step *)
  da := (a1-a0)/n;

  (* abbreviations *)
  c := a*b;
  a := a*a;
  b := b*b;

  For i := 0 To n Do
  Begin
   sa := Sin(a0);
   ca := Cos(a0);
   d := sa*sa;
   d := c / Sqrt((a-b)*d + b);

   (* point on arc *)
   P2.x := P0.x + Trunc(d*ca);
   P2.y := P0.y + Trunc(d*sa);

   If i = 0 Then
    Begin
     If Pie Then
      GSX_Line ( P0, P2 );
    End
   Else
    GSX_Line ( P1, P2 );

   P1 := P2;
   a0 := a0 + da;
  End;

  If Pie Then
   GSX_Line ( P2, P0 );

End;
(* ----------------------------------- *)
Procedure handleGDP(option : Integer);
Var
 P0, P1, P2, P3 : GEM_pt;
 a, b, a0, a1 : Real;
 n : Integer;
Begin

 Case option Of
 1:  (* BAR outline: 0-1-2-3-0 *)
  Begin
   P0.x := dx + sx*ptsin[1];
   P0.y := dy + sy*ptsin[2];
   P2.x := dx + sx*ptsin[3];
   P2.y := dy + sy*ptsin[4];
   P1.x := P2.x;
   P1.y := P0.y;
   P3.x := P0.x;
   P3.y := P2.y;
   GSX_Line ( P0, P1 );
   GSX_Line ( P1, P2 );
   GSX_Line ( P2, P3 );
   GSX_Line ( P3, P0 );
  End;

 2, 3: (* circular ARC or PIE *)
  Begin
   (* center *)
   P0.x := dx + sx*ptsin[1];
   P0.y := dy + sy*ptsin[2];
   (* semi-axes *)
   a := sx*ptsin[7];
   b := sy*ptsin[7];
   (* to rad *)
   a0 := 0.00174532925199*intin[1];
   a1 := 0.00174532925199*intin[2];
   handleArc( P0, a, b, a0, a1, option = 3 );
  End;

 4, 5: (* full CIRCLE or ELLIPSE *)
  Begin
   (* center *)
   P0.x := dx + sx*ptsin[1];
   P0.y := dy + sy*ptsin[2];
   (* semi-axes *)
   If option = 5 Then
    Begin
     a := sx*ptsin[3];
     b := sy*ptsin[4];
    End
   Else
    Begin
     a := sx*ptsin[5];
     b := sy*ptsin[5];
    End;

   a0 := 0.0;
   a1 := 6.28318530718;

   handleArc( P0, a, b, a0, a1, False );
  End;

 (* removed by factor 10 to avoid duplicate drawing *)
 6, 7: (* elliptical ARC or PIE - used by DR Draw *)
  Begin
   (* elliptical ARC from a0 to a1 *)
   (* center *)
   P0.x := dx + sx*ptsin[1];
   P0.y := dy + sy*ptsin[2];
   (* semi-axes *)
   a := sx*ptsin[3];
   b := sy*ptsin[4];
   (* to rad *)
   a0 := 0.00174532925199*intin[1];
   a1 := 0.00174532925199*intin[2];
   handleArc( P0, a, b, a0, a1, option = 7 );
  End;
 End;

End;
(* ----------------------------------- *)
Function nextWord : Integer;
Var
 N : Integer;
Begin
 If idx > 128 Then
  Begin
   BlockRead ( GEMFile, Buffer, 1, N );
   If N < 1 Then
    idx := -1
   Else
    idx := 1;
  End;

 If idx < 0 Then
  Begin
   nextWord := -1;
  End
 Else
  Begin
   nextWord := Buffer[idx] or (Buffer[idx+1] shl 8);
   idx := idx+2;
  End;
End;
(* ----------------------------------- *)
Function readRecord : Boolean;
Begin

 GEMRecord.opcode  := nextWord;

 If (GEMRecord.opcode = -1) Or
    (GEMRecord.opcode = 0)  Then
  readRecord := False
 Else
  Begin
   GEMRecord.npoints := nextWord;
   GEMRecord.nints   := nextWord;
   GEMRecord.option  := nextWord;

   If DEBUG > 0 Then
    Begin
     Write ( 'opcode = ',GEMRecord.opcode:3 );
     Write ( ', npoints =',GEMRecord.npoints:3 );
     Write ( ', nints = ',GEMRecord.nints:3 );
     Write ( ', option = ',GEMRecord.option:3 );
     WriteLn;
    End;

   If GEMRecord.npoints > 0 Then
    Begin
     For i := 1 To GEMRecord.npoints Do
      Begin
       ptsin[i*2-1] := nextWord;
       ptsin[i*2  ] := nextWord;
       If DEBUG > 1 Then
        WriteLn(' ptsin[',i,'] = (',ptsin[i*2-1],',',
                                    ptsin[i*2],')');
      End;
    End;

    If GEMRecord.nints > 0 Then
     Begin
      For i := 1 To GEMRecord.nints Do
       Begin
        intin[i] := nextWord;
        If DEBUG > 1  Then
         WriteLn(' intin[',i,'] = ',intin[i]);
       End;
     End;

    readRecord := True;
  End;

End;
(* ----------------------------------- *)
Function readHeader : Boolean;
Var
 dummy : Integer;
Begin

 readHeader := False;

 GEMHeader.magic  := nextWord;

 If GEMHeader.magic = -1 Then
 Begin
  GEMHeader.length  := nextWord;
  GEMHeader.version := nextWord;
  GEMHeader.NDCorRC := nextWord;
  GEMHeader.x0      := nextWord;
  GEMHeader.y0      := nextWord;
  GEMHeader.x1      := nextWord;
  GEMHeader.y1      := nextWord;
  GEMHeader.width   := nextWord;
  GEMHeader.height  := nextWord;
  GEMHeader.xb0     := nextWord;
  GEMHeader.yb0     := nextWord;
  GEMHeader.xb1     := nextWord;
  GEMHeader.yb1     := nextWord;
  GEMHeader.flags   := nextWord;

  If GEMHeader.NDCorRC = 0 Then
  Begin
   dx := -GEMHeader.x0;
   dy := -GEMHeader.y0;
   sx := 1;
   sy := 1;
  End
  Else
  Begin
   dx := -GEMHeader.x0;
   dy := (GEMHeader.y1 - GEMHeader.y0);
   sx := 1;
   sy := -1;
  End;

  If GEMHeader.length > 15 Then
  Begin
   (* swallow rest of header *)
   For i:=16 To GEMHeader.length Do
   Begin
    dummy := nextWord;
   End;
  End;
  readHeader := True;
 End;
End;
(* ----------------------------------- *)
Procedure ToUpper( Var s : String128);
Var
 i : Integer;
Begin
 For i :=1 To Length(s) Do
  s[i] := UpCase(s[i]);
End;
(* ----------------------------------- *)
Function Exists ( FileName : String128 ) : Boolean;
Var
 Fil : File;
Begin
 Assign(Fil, FileName);
 {$I-}
 Reset(Fil);
 Close(Fil);
 {$I+}
 Exists := (IOresult = 0);
End;
(* ----------------------------------- *)
Function skipTo ( i : Integer; Sep : Char ) : Integer;
(* return index of next Sep character in CmdLine *)
Label
 Found;
Begin
 While i <= Length(CmdLine) Do
 Begin
  If CmdLine[i] = Sep Then
   GoTo Found;
  i := i+1;
 End;

Found:
 skipTo := i;
End;
(* ----------------------------------- *)
Function parseArgument( i : Integer;
                        Var Param : String3;
                        Var Argument : String14 ) : Integer;
Var
 j : Integer;
 ParamString : String14;
Label
 ArgFound;
Begin

 j := skipTo (i,' ');
 parseArgument := j+1;

 (* length > 1 *)
 If j > i Then
 Begin
  ParamString := Copy(CmdLine,i,j-i);

  (* split parameter into Param and Argument *)
  j := Pos(':',ParamString);
  If j > 0 Then
  Begin
   Param := Copy(ParamString,1,j);
   j := j+1;
   Argument := Copy(ParamString,j,Length(ParamString));
  End
  Else
  Begin
   Param    := '';
   Argument := ParamString;
  End;
 End
 Else
 Begin
  Param    := '';
  Argument := '';
 End;

End;
(* ----------------------------------- *)
Begin

 (* defaults *)
 DEBUG    := 0;
 REDIR    := 0;
 FileName := 'GSX.GEM';
 ID  := 1;
 ddx := 0;  (* optional offset *)
 ddy := 0;
 dsx := 1;  (* optional scaling *)
 dsy := 1;

 If (ParamCount = 1) And
    (ParamStr(1) = '-C') Then
 Begin
  (* read command line *)
  Write('>');
  ReadLn(CmdLine);
  ToUpper(CmdLine);
 End
 Else
 Begin
  (* copy command line tail *)
  (*
  CmdLine[0] := Char(Mem[$80]);
  *)
  For i:=0 To Mem[$80] Do
  Begin
   CmdLine[i] := Char(Mem[$80+i]);
  End;
 End;

 i := 1;
 Repeat
 Begin
  i := parseArgument( i, Param, Argument );

  (* test parameters *)
  (* Param='-x:', Argument='2' *)
  (* Param='d:', Argument='file.gem' *)
  If Length(Param)>1 Then
  Begin
   If Param[1] = '-' Then
   Begin
    Case Param[2] Of
     'D':  Val(Argument,DEBUG,j);
     'O':  Val(Argument,ID,j);
     'R':  Val(Argument,REDIR,j);
     'S':  Val(Argument,dsx,j);
     'T':  Val(Argument,dsy,j);
     'X':  Val(Argument,ddx,j);
     'Y':  Val(Argument,ddy,j);
    End;
   End;
  End
  Else
  Begin
   FileName := Param + Argument;
  End;
 End;
 Until i > Length(CmdLine);


 If Exists(FileName) = False Then
 Begin
  If Exists(FileName+'.GEM') = False Then
  Begin
   WriteLn('Error: File "',FileName,'" does not exist.');
   Exit;
  End
  Else
  Begin
   FileName := FileName + '.GEM';
  End;
 End;

 If REDIR > 0 Then
  Hook(REDIR=2,REDIR=2,REDIR=2); (* redirect Aux, Lst and Con *)

 Assign ( GEMFile, FileName );
 Reset ( GEMFile );
 idx := 256; (* force first block read *)

 (* read header and setup offset (dx,dy) and scale (sx,sy) *)
 If readHeader = False Then
 Begin
  WriteLn('Error: not a GEM file.');
  goto ErrExit;
 End;

 (* translate, then scale *)
 dx := (dx + ddx)*dsx;
 dy := (dy + ddy)*dsy;
 (* scale scale *)
 sx := sx * dsx;
 sy := sy * dsy;

 WriteLn('Metafile size: ',(GEMHeader.width/10):6:1,' x ',
                           (GEMHeader.height/10):6:1,' mm');

 If DEBUG > 0 Then
 Begin
  WriteLn('Metafile range:  (',GEMHeader.x0,'...',GEMHeader.x1,')-',
                           '(',GEMHeader.y0,'...',GEMHeader.y1,')');
  WriteLn('Metafile bbox:   (',GEMHeader.xb0,'...',GEMHeader.xb1,')-',
                           '(',GEMHeader.yb0,'...',GEMHeader.yb1,')');
 End;

 GSX_OpenWS ( ID );
 GSX_Clear;
 GSX_SetLineType(1);
 GSX_SetMarkerType(1);
 GSX_SetMarkerScale(500);

 While True Do
 Begin

  If readRecord = False Then
  Begin
   If DEBUG > 0  Then WriteLn('Regular EOF.');
   GoTo Done;
  End;

  Case GEMRecord.opcode of
   6:    handlePolyLine( GEMRecord.npoints );
   7:    handlePolyMarker( GEMRecord.npoints );
   8:    handleText( GEMRecord.nints );
   9:    handlePolyLine( GEMRecord.npoints); (* fill *)
   11:   handleGDP( GEMRecord.option );
   12:   GSX_SetCharacterHeight( ptsin[2] );
   13:   GSX_SetTextDirection( intin[1] );
   15:   GSX_SetLineType( intin[1] );
   16:   GSX_SetLineWidth( intin[1] );
   17:   GSX_SetLineColor( intin[1] );
   18:   GSX_SetMarkerType( intin[1] );
   19:   GSX_SetMarkerScale( ptsin[2] );
   20:   GSX_SetMarkerColor( intin[1] );
   21:   GSX_SetTextFont( intin[1] );
   22:   GSX_SetTextColor( intin[1] );
   23:   GSX_SetFillStyle( intin[1] );
   24:   GSX_SetFillPattern( intin[1] );
   25:   GSX_SetFillColor( intin[1] );

   Else  (* Default *)
         If DEBUG > 0 Then WriteLn(' *** not handled yet.');
  End; (* Case *)

 (* avoid output buffer overflow *)
 If REDIR > 0 Then
  FlushBuffer(False);

 End;

Done:
 GSX_CloseWS;

ErrExit:
 Close ( GEMFile );

 If REDIR > 0 Then
  UnHook; (* restore Aux, Lst and Con *)

End.
