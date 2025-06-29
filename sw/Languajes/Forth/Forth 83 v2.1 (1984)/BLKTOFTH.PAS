Program blktotext (input,output,infile,outfile);
{ this program converts f83 block files to text files }

Const
  Blksize = 1024;

Var
  infile : file of char;
  outfile : text;
  line : string[64];
  element : char;
  i,j,linenum,screenum : integer;
  notfound : boolean;

Begin { main program }
  if (paramcount > 2) then begin
    writeln ('Two many parameters');
    writeln ('blktofth <blkfile> <fthfile>');
    halt (1);
    end;
  if (paramcount = 2) then begin
    assign (infile,paramstr(1));
    reset (infile);
    assign (outfile,paramstr(2));
    rewrite (outfile);
    end;
  if (paramcount = 1) then begin
    assign (infile,paramstr(1));
    reset (infile);
    write ('Output file : ');
    readln (line);
    assign (outfile,line);
    rewrite (outfile);
    end;
  if (paramcount = 0) then begin
    write ('Input file : ');
    readln (line);
    assign (infile,line);
    reset (infile);
    write ('Output file : ');
    readln (line);
    assign (outfile,line);
    rewrite (outfile);
    end;
  linenum := 0;
  screenum := 0;
  while not eof(infile) do begin  { main loop }
      line := '';
      if (linenum = 0) then begin { two blank lines if beginning of screen }
        writeln (outfile);
        writeln (outfile);
        writeln (outfile,'Scr #',screenum);
        end;
      for i:= 1 to 64 do begin { read a line in }
        if not eof(infile) then
            read (infile,element)
        else
            element := ' ';
        line := concat (line,element);
        end;
{      writeln ('After reading in line ',line); }
      { find end of string }
      notfound := true; { true until space not found }
      for i := 1 to 64 do begin
        j := 65 - i;
        if ((line[j] = ' ') and (notfound)) then
           delete (line,j,1)
        else
           notfound := false;
        end; { for loop }
{        writeln ('Length of line and line ',length(line),line); }
      if (linenum < 10) then
        write (outfile,' ',linenum,': ')
      else
        write (outfile,linenum,': ');
      writeln (outfile,line); { write out the result }
      linenum := linenum + 1;
      if (linenum = 16) then begin
         linenum := 0;
         screenum := screenum + 1;
         end;
  end;
  close (outfile);
  close (infile);
  end.
