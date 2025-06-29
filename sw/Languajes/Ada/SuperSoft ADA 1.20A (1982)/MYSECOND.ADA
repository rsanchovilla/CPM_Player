pragma print(on);
procedure mysecond is
 
 x,y : float;

 begin
x := 1.0;

while x/=0.0 loop

  put("x= ");
  get(x);
  newline;
 
   y := sinf(x);

   put("sine of ");
   put(x);
   put("  is ");
   put(y);
 end loop;

end mysecond;
