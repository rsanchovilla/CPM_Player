program DEMO01 (input,output);
(* graphic representation of a function
  f(x) = exp(-x) * sin( 2*pi*x)                *)
  const
    d = 0.0625 ; 
    s = 32;
    h = 34;
    c = 6.28318 ; (* 2*pi *)
  var
    x,y : real;
    i,n : integer;
    done: boolean;
    ch  : char;
begin
  writeln;
  writeln( '  you are going to see a graphic representation of');
  writeln('     function f(x) = exp(-x) * sin(2*pi*x)     ');
  writeln(' Example from Jensen and Wirth (page 30) ');
    done := false;
  while NOT Done do begin
    for i := 1 to 28 do begin
      x := d*i;
      y := exp(-x)*sin(c*x);
      n := round(s*y) +h;
      repeat
        write(' ');
        n := n - 1;
      until n = 0;
      writeln('*')
    end;
    writeln(' ');
    writeln(' type Y to see the graph again ');
    read(ch);
    if ch IN ['Y','y'] then begin
       writeln( ' Here we go again ');
       end
    else
       Done := true;
  end
  end.
  
