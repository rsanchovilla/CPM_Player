program StripBit7;
(*$I-*)
(* remove bit 7 from file, display only ascii chars *)
var fn: string[255];
    i,c,n: integer; 
    f: file;
    buf: array[0..127] of byte;
begin
   fn :=ParamStr(1);
   if (fn='') then begin
      writeln('Usage: STRIP7B file.ext');
      writeln('       type file, remove bit7, replace chars < 32 by space');
      Halt;
   end; 
   assign(f,fn);
   reset(f);
   if IOResult<>0 then begin
      writeln('Cannot open file ', fn);
      Halt; 
   end; 
   repeat
     BlockRead(f,buf,1,n);
     if IOResult<>0 then begin
        writeln('Cannot read file ', fn);
        Halt; 
     end; 
     if n>0 then for i:=0 to 127 do begin
        c:=buf[i];
        if c>127 then c:=c-128;
        if c<32 then c:=32;
        write(chr(c));
     end; 
   until n=0;
   close(f);
end.
