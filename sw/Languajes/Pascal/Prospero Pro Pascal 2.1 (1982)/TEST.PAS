program test;
var     f:text;
    select: integer;

procedure one;

begin
 assign(f,'test.1');
 rewrite(f);
 writeln(f,'sample to test1');
 close(f);
 rename(f,'test.2')
end;

procedure two;

begin
 assign(f,'test.1');
 rename(f,'test.2');
end;

procedure three;

begin
 assign(f,'test.1');
 reset(f);
 rename(f,'test.2');
end;

BEGIN   {selecting menu}
 writeln('1 : create file test.1 write to it, close and rename');
 writeln('2 : assign test.1 and rename');
 writeln('3 : assign, test.1, reset and rename');
 write('    select 1,2,3 :');
 readln(select);
 CASE select OF
  1 : one;
  2 : two;
  3 : three;
  OTHERWISE ;
 END; {case}
 END.
                                                                                  