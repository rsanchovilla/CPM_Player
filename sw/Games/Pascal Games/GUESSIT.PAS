(*
 *  GUESS IT
 *  A computer guessing game
 *)
program guessit (input,output);
const
   maxtrys        =  6;        (* user allowed 6 tries to guess number *)
   maxnum         = 100;       (* maximum number *)
   minnum         =  1;        (* minimum number *)

var
   ch : char;               (* used to answer questions *)
   guess : integer;         (* human's guess *)
   number: minnum..maxnum;  (* the number itself *)
   numtry: 0..maxtrys;      (* number od times human has guessed *)


  (*
   * instructions
   * prints out the instructions
   *)
  procedure instructions;
  begin
     writeln('This is match it');
     writeln;
     writeln('I will choose a number between 1 and 100.');
     writeln('You will try to guess that number.');
     writeln('If you guess wrong, I will tell you if you guessed');
     writeln('too high, or too low.');
     writeln('you have ',maxtrys,' tries to get the number.');
     writeln;
     writeln('Enjoy');
     writeln;
  end;   (* instructions *)


  (*
   * getnum
   * get a guess from the human,
   * with error checking
   *)
  procedure getnum;
  begin
     write('Your guess? ');

     (*
      * wait for a character
      *)

     begin

        readln(guess);
        if guess > maxnum then
        begin
           writeln('Illegal number');
           getnum
        end
        else
        begin
           if guess > number then
              writeln('too high')
           else
              if guess < number then
                 writeln('too low')
              else
                 writeln('correct!!!')
        end
     end
  end;   (* getnum *)

(*
 * main
 *)

begin
   instructions;
   randomize;
   while pos(ch,'nN')=0 do
   begin
      guess := 0;
      numtry := 0;
      number := random(maxnum)+1-minnum;   (* get number *)
      while (numtry < maxtrys) and (guess <> number) do
      begin
         getnum;
         numtry := numtry + 1
      end;
      writeln;
      if guess <> number then
         writeln('The number was ',number);
      writeln;
      write('want to try again? ');
      readln(ch)
   end
end.
