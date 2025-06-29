program Head;
(*$I-*)
(* display n first lines of a file *)
var fn, s: string[255];
    n,i: integer; 
    f: text;
begin
   fn :=ParamStr(1);
   n := 0;
   if fn<>'' then begin
      s := ParamStr(2);
      if s<>'' then begin
         val(s, n, i);
         if i<>0 then n:=0;
      end; 
   end; 
   if (ParamStr(1)='') or (n<1) then begin
      writeln('Usage: HEAD file.ext num');
      writeln('       prints n first lines if file');
      writeln('       Example: HEAD HELLO.TXT 3');
      Halt;
   end; 
   assign(f,fn);
   reset(f);
   if IOResult<>0 then begin
      writeln('Cannot open file ', fn);
      Halt; 
   end; 
   for i:=1 to n do begin
      if not eof(f) then begin
         readln(f,s);
         if IOResult<>0 then begin
            writeln('Cannot read file ', fn);
            Halt; 
         end; 
         writeln(s);
      end; 
   end; 
   close(f);
end.
