program overunder(input, output);
const
   maxdie       =  6;           (* the maximum # on a die *)
   mindie       =  1;           (* the minimum # on a die *)

   maxsum       = 12;           (* maximum sum for two dice *)
   minsum       =  2;           (* minimum sum for two dice *)

   startmoney   = 500;          (* amount of money player starts with *)

type
   diesum       = mindie..maxsum; (* type for the sum of dice *)
   dietype      = mindie..maxdie; (* a die value *)
   str80        = string[80];     (* a string *)

var
   money        : integer;      (* how much money player has *)
   bet          : integer;      (* how much is being bet this time *)
   die          : dietype;      (* value of a die *)
   sum          : diesum;       (* sum of the 2 dice *)
   numnum       : diesum;       (* number picked by player *)
   ch           : char;         (* used to answer questions *)


(*
 * play
 * throws the dice, prints them out,
 * and keeps score
 *)

procedure play;

   (*
    * dieroll
    * returns a random die value
    *)
   function dieroll:dietype;
   begin
      dieroll := 1 + random(maxdie)
   end;   (* dieroll *)

begin
   writeln('Die#1    Die#2    Sum    Your#     Roll');
   die := dieroll;
   write(die:4,'     ');
   sum := die;
   die := dieroll;
   sum := sum + die;
   write(die:4,'    ',sum:4,'    ',numnum:4,'      ');
   if sum < 7 then
      writeln('Under')
   else
      if sum > 7 then
         writeln('Over')
      else
         writeln('Even');
   if sum = numnum then
   begin
      writeln('You matched!!!!');
      writeln('you get $',bet*4);
      money := money + (bet * 4)
   end
   else
      if ((sum < 7) and (numnum < 7)) or ((sum > 7) and (numnum > 7)) then
      begin
         writeln('You made even money.');
         writeln('you won $',bet);
         money := money + bet
      end
      else
      begin
         writeln('You lost $',bet);
         money := money - bet
      end;

   writeln('You new total is $',money)
end;   (* play  *)

(*
 * getnumbers
 * get the guess and the bet from the
 * player
 *)

procedure getnumbers;
   (*
    * legal
    * gets a number between min
    * and max from the player, with proper error
    * checking
    *)
   function legal(question: str80;min,max:integer):integer;
   var
      num : integer;        (* input number *)
   begin
      num := -1;
      while (num < min) or (num > max) do
      begin
         write(question);
         randomize;
         readln(num);
         if (num < min) or (num > max) then
            writeln('Sorry, only numbers between ',min,' and ',max)
      end;
      legal := num;
   end;   (* legal  *)

begin
   numnum := legal('What number do you want? ',minsum,maxsum);
   bet := legal('Your bet? ',1,money);
end;  (* getnumbers  *)


(*
 * inst
 * print out a list of instructions
 *)

procedure inst;
begin
   writeln;
   writeln('Overunder:');
   writeln('A simple dice game.');
   writeln('You choose a number between 2 and 12.');
   writeln('If the sum of two dice rolled is the same');
   writeln('as the number you picked, you win four');
   writeln('times your bet. If your number, and the');
   writeln('dice sum are either both under, or both');
   writeln('over 7, then you win the amount you bet.');
   writeln;
   writeln
end;  (* inst  *)


begin
   money := startmoney;
   write('Do you want instructions? ');
   readln(ch);
   if (ch = 'y') or (ch = 'Y') then
      inst;
   repeat
      writeln;
      getnumbers;
      writeln;
      play;
      writeln;
      write('Want to try again? ');
      readln(ch);
   until ((ch<>'y') and (ch<>'Y')) or (money <= 0);
   if money <= 0 then
      writeln('Sorry, you''re out of money.')
end.
