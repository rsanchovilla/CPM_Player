(*
 Redirects LIST, PUNCH and READER to
 the console.
 Optionally redirects CONOUT.
 Writes output to the file 'gsx.log'.

 Hook(True|False);
 ... program run
 ... periodically call FlushBuffer(False);
     to avoid overflow of 512 byte buffer
 Unhook;

 Martin Hepperle, 2020
 *)
(* ----------------------------------- *)
Const
 BUFSIZ = 512;

Var
 HookCONOUT  : Boolean;
 HookLIST    : Boolean;
 HookPUNRDR  : Boolean;
 SavedCONOUT : Integer;
 SavedPUNCH  : Integer;
 SavedREADER : Integer;
 SavedLIST   : Integer;

 idxBuffer   : Integer;
 ioBuffer    : array[1..BUFSIZ] of Char;
 ioFile      : File;
(* ----------------------------------- *)
Procedure AuxOut;
(* output character in C *)
Var
 Ch : Char;
Begin
 inline ( $21/Ch/ (* LD HL,Ch *)
          $71     (* LD (HL),C *)
        );

 If Not HookCONOUT Then
  Write(Con,Ch);

 If idxBuffer < BUFSIZ Then
 Begin
  ioBuffer[idxBuffer] := Ch;
  idxBuffer := idxBuffer + 1;
 End;
End;
(* ----------------------------------- *)
(* dummy input: CR *)
Procedure AuxIn;
Var
 Ch : Char;
Begin
 Ch := Char(6); (* ACK *)
 inline ( $21/Ch/ (* LD HL,Ch *)
          $7E     (* LD A,(HL) *)
        );
End;
(* ----------------------------------- *)
Procedure FlushBuffer( Force : Boolean );
Var
 retVal    : Integer;
 i         : Integer;
Begin
 If (idxBuffer > 128) Or
    (Force And (idxBuffer > 1)) Then
 Begin

  BlockWrite(ioFile,ioBuffer,1,retVal);

  For i := 1 To idxBuffer-128-1 Do
  Begin
   ioBuffer[i] := ioBuffer[128+i];
  End;

  idxBuffer := idxBuffer - 128;
 End;
End;
(* ----------------------------------- *)
Procedure Hook ( hookCON, hookLST, hookPUN : Boolean );
Var
 WSTART : Integer;
 CONOUT : Integer;
 PUNCH  : Integer;
 READER : Integer;
 LIST   : Integer;
Begin
 HookCONOUT := hookCON;
 HookLIST   := hookLST;
 HookPUNRDR := hookPUN;

 WSTART := Mem[0+1] + Mem[0+2]*256;
 CONOUT := Mem[WSTART+3*3+1] + Mem[WSTART+3*3+2]*256;
 LIST   := Mem[WSTART+4*3+1] + Mem[WSTART+4*3+2]*256;
 PUNCH  := Mem[WSTART+5*3+1] + Mem[WSTART+5*3+2]*256;
 READER := Mem[WSTART+6*3+1] + Mem[WSTART+6*3+2]*256;

 SavedCONOUT := CONOUT;
 SavedLIST   := LIST;
 SavedPUNCH  := PUNCH;
 SavedREADER := READER;

 (* optional *)
 If HookCONOUT Then
 Begin
  Mem[WSTART+3*3+1] := Lo(Addr(AuxOut));
  Mem[WSTART+3*3+2] := Hi(Addr(AuxOut));
 End;

 If HookLIST Then
 Begin
  Mem[WSTART+4*3+1] := Lo(Addr(AuxOut));
  Mem[WSTART+4*3+2] := Hi(Addr(AuxOut));
 End;

 If HookPUNRDR Then
 Begin
  Mem[WSTART+5*3+1] := Lo(Addr(AuxOut));
  Mem[WSTART+5*3+2] := Hi(Addr(AuxOut));

  Mem[WSTART+6*3+1] := Lo(Addr(AuxIn));
  Mem[WSTART+6*3+2] := Hi(Addr(AuxIn));
 End;

 idxBuffer := 1;

 Assign ( ioFile, 'gsx.log');
 Rewrite ( ioFile );
End;
(* ----------------------------------- *)
Procedure UnHook;
Var
 WSTART : Integer;
Begin
 FlushBuffer(True);
 Close ( ioFile );

 WSTART := Mem[0+1] + Mem[0+2]*256;

 If HookCONOUT Then
 Begin
  Mem[WSTART+3*3+1] := Lo(SavedCONOUT);
  Mem[WSTART+3*3+2] := Hi(SavedCONOUT);
 End;

 If HookLIST Then
 Begin
  Mem[WSTART+4*3+1] := Lo(SavedLIST);
  Mem[WSTART+4*3+2] := Hi(SavedLIST);
 End;

 If HookPUNRDR Then
 Begin
  Mem[WSTART+5*3+1] := Lo(SavedPUNCH);
  Mem[WSTART+5*3+2] := Hi(SavedPUNCH);

  Mem[WSTART+6*3+1] := Lo(SavedREADER);
  Mem[WSTART+6*3+2] := Hi(SavedREADER);
 End;

End;
(* ----------------------------------- *)
