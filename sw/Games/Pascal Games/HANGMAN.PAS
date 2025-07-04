program hangman;

(*
 * this program plays the game of hangman
 *)

const
   stringsize =  10;     (* must be the same as makehang *)
   maxturns   =   7;     (* number of turns to guess word *)
   backslash  = 220;     (* ascii code for backward slant *)

type
   word = string[stringsize];

var

   dict      : file of word;
   aword     : word;
   guesses, wordsletters : set of 'A'..'Z';
   numwords  : integer;
   turns     : integer;
   guessedit : boolean;

(*
 * convert
 * converts a string to the number that it represents. all non-numeric
 * characters are ignored.
 *)

function convert(number : word) : integer;

var
   result  : integer;
   strindex: integer;

begin
   result := 0;
   for strindex := 1 to length(aword) do
      if number[strindex] in ['0'..'9'] then
         result := result * 10 + ord(number[strindex]) - ord('0');
   convert := result;
end;

procedure initialize;

begin
   clrscr;
   assign(dict,'words.dat');
   reset(dict);
   read(dict,aword);
   numwords := convert(aword);
   randomize;
   guesses := [];
   wordsletters := [];
   turns := 0;
   guessedit := false;
end;

(*
 * this procedure randomly picks a word out of the hangman dictionary
 *)

procedure chooseword;

var
   nthword,i : integer;

begin
   nthword := 1 + random(numwords);
   seek(dict, nthword);
   read(dict,aword);
   for i := 1 to length(aword) do
      if not (aword[i] in wordsletters) then
         wordsletters := wordsletters + [aword[i]];
end;

(*
 * readguess :
 * asks for another letter that the player expects to be in the word.
 * a letter that already has been guessed is not accepted
 *)

procedure readguess;

var
   thisguess : char;
   invalid, erase : boolean;

begin
   invalid := true;
   erase := false;
   while invalid do
      begin
      gotoxy(1,10);
      write('Next guess? ');
      readln(thisguess);
      if eof(con) then
         halt
      else
         if thisguess in guesses then
            begin
            gotoxy(1,12);
            write('You have already used ''',thisguess,'''.');
            erase := true;
            end
         else
            begin
            guesses := guesses + [thisguess];
            invalid := false;
            end;
      end;
   if erase then
      begin
      gotoxy(1,12);
      write(' ':27);
      end;
   if not (thisguess in wordsletters) then
      turns := turns + 1;
end;

(*
 * printsofar
 * procedure that prints out the word being guessed. letters that aren't
 * known yet are printed as '-'. the letters that have been guessed are
 * printed underneath.
 *)

procedure printsofar;

var
   wordindex     : integer;
   guessindex    : char;
   correctcount  : integer;

begin
   correctcount := 0;
   gotoxy(10,5);
   for wordindex := 1 to length(aword) do
      begin
      if aword[wordindex] in guesses then
         begin
         write(aword[wordindex]);
         correctcount := correctcount + 1;
         end
      else
         write('-');
      write(' ');
      end;
   gotoxy(10,7);
   for guessindex := 'A' to 'Z' do
      if guessindex in guesses then
         write(guessindex);
   if correctcount = length(aword) then
      guessedit := true;
end;

(*
 * printhang
 * prints the hangman
 *)

procedure printhang;

begin
   case turns of
      1 : begin
             gotoxy(30,5);
             write('0');
             end;
      2 : begin
             gotoxy(29,6);
             write('---');
             end;
      3 : begin
             gotoxy(28,7);
             write('/');
             gotoxy(27,8);
             write('/');
             end;
      4 : begin
             gotoxy(32,7);
             write('\');
             gotoxy(33,8);
             write('\');
             end;
      5 : begin
             gotoxy(30,7);
             write('I');
             gotoxy(30,8);
             write('I');
             end;
      6 : begin
             gotoxy(29,9);
             write('/');
             gotoxy(28,10);
             write('/');
             end;
      7 : begin
             gotoxy(31,9);
             write('\');
             gotoxy(32,10);
             write('\');
             end;
   end;
end;

procedure printoutcome;

begin
   gotoxy(5,16);
   if guessedit then
      begin
      writeln('Rats!! You guessed it!!');
      end
   else
      begin
      writeln('The word was : ',aword);
      writeln;
      writeln('Due to the violent nature of your demise, the rest of the');
      writeln('scene has been censored.');
      end;
end;


begin
   initialize;
   chooseword;
   printsofar;
   while not guessedit and (turns < maxturns) do
      begin
      readguess;
      printsofar;
      printhang;
      end;
   printoutcome;
end.




