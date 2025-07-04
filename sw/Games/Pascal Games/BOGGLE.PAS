program boggle(input,output);
const
   numdigits    = 4;           (* the number of digits in the number *)
var
   ch     : char;              (* used to answer questions *)
   number : array[1..numdigits] of char; (* the actual number *)
   numblack,                   (* number of correct digits *)
   numwhite: 0..numdigits;     (* number of correct and ordered digits *)
   numguess: integer;          (* number of guesses taken *)


(*
 * create
 * create a random number
 *)
procedure create;
var
   i : 1..numdigits;           (* index variable *)
begin
   for i := 1 to numdigits do
      number[i] := chr(ord('0') + random(10))
end; (* create *)


(*
 * play
 * gets a number from the player
 * then figures out how many white,
 * and black numbers he (she) has.
 *)

procedure play;
const
   indexlength  = 5;   (* length of the indices *)

var
   user   : string[4];           (* input from player *)
   notbad : boolean;          (* used to test for garbage *)
   i,j    : 1..indexlength;   (* index variables *)
   used   : set of 1..numdigits; (* whether the digit has been used *)

begin
   numwhite := 0;
   numblack := 0;
   write('Your guess? ');
   readln(user);

   notbad := length(user) = numdigits;

   i := 1;

   while notbad and (i<= numdigits) do
   begin
      notbad := user[i] in ['0'..'9'];
      i := i + 1
   end;

   if not notbad then
   begin
      writeln('Illegal input, try again');
      play
   end
   else
   begin
      used := [];
      for i := 1 to numdigits do
         if number[i] = user[i] then
            numwhite := numwhite + 1;

      for i := 1 to numdigits do
      begin
         j := 1;
         while j <= numdigits do
         begin
            if (user[i] = number [j]) and (i<>j) and not (j in used) then
            begin
               numblack := numblack + 1;
               used := used + [j];
               j := numdigits
            end;
            j := j + 1
         end
      end
   end
end;  (* play *)


(*
 * inst
 * print out the instructions
 *)

procedure inst;

begin
   writeln('Boggle');
   writeln;
   writeln('A version of mastermind.');
   writeln('I guess a number, then you attempt to');
   writeln('find out what the number is. When');
   writeln('you make a guess, I will tell you how');
   writeln('many digits were correct and in their');
   writeln('correct location (White numbers). I');
   writeln('will also tell you how many digits were');
   writeln('correct, but in the wrong place.');
   writeln;
   writeln('For example, is the number is 1234, and');
   writeln('you guess 1467, then you would have');
   writeln('1 white (the 1) and 1 black number (the 4),');
   writeln
end;  (* inst *)


begin
   write('Do you want instructions? ');
   readln(ch);
   if (ch='y') or (ch='Y') then
      inst;

   repeat
      randomize;
      create;
      numwhite := 0;
      numblack := 0;
      numguess := 0;
      while numwhite <> numdigits do
      begin
         play;
         writeln('White = ',numwhite,'  Black = ',numblack);
         numguess := numguess + 1
      end;
      writeln;
      writeln('Correct');
      writeln('It took you ',numguess,' guesses.');
      writeln;
      write('Care to try again? ');
      readln(ch);
   until (ch<>'Y') and (ch<>'y')
end.  (* boggle  *)
