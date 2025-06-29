(*
 * baccarat
 * plays the card game of baccarat
 *)

program baccarat (input, output);

const
   decksize   = 416;     (* size of 8 decks *)
   start      = 10000;   (* the amount of money you start with *)

type
   suittype  = (hearts,clubs,diamonds,spades);
   card = record
      value : 1..13;
      suit  : suittype
   end;
   handvalue = 0..9;
   decktype = 1..decksize;
   stand    = set of handvalue;

var
   cardnum   : decktype;     (* current card we are playing *)
   deck      : array [decktype] of card; (* the deck *)
   bankhand  : handvalue;    (* the banker's hand *)
   playhand  : handvalue;    (* the player's hand *)
   comphand  : handvalue;    (*value of the computer's hand *)
   humhand   : handvalue;    (* the value of the human's hand *)
   compmoney : integer;      (* the computer's money *)
   hummoney  : integer;      (* the player's money *)
   bet       : integer;      (* the size of the bet *)
   ch        : char;         (* used to answer questions *)
   compbank  : boolean;      (* whether the computer is the banker *)

(*
 * makedeck
 * create the deck
 *)

procedure makedeck;

var
   decknum : decktype;
   suit    : suittype;
   value   : 1..13;

begin
   suit := hearts;
   for decknum := 1 to decksize do
   begin
      deck[decknum].value := decknum mod 13 + 1;
      deck[decknum].suit := suit;
      if deck[decknum].value = 13 then
         if suit <> spades then
            suit := succ(suit)
         else
            suit := hearts
   end
end;

(*
 * shuffle
 * go through the deck exchanging cards
 *)

procedure shuffle;

var
   tmp : card;
   decknum,
   newnum : decktype;

begin
   cardnum := 1;
   for decknum := 1 to decksize do
   begin
      newnum := random(decksize) + 1;
      tmp := deck[newnum];
      deck[newnum] := deck[decknum];
      deck[decknum] := tmp
   end
end;

(*
 * showcard
 * prints out a card in a readable format
 *)

procedure showcard (display:card);

begin
   case display.value of
      1: write('Ace  ');
      2,3,4,5,6,7,8,9: write(display.value:1,'    ');
      10: write('Ten  ');
      11: write('Jack ');
      12: write('Queen');
      13: write('King ')
   end;
   write(' of ');
   case display.suit of
      hearts   : write('Hearts  ');
      diamonds : write('Diamonds');
      clubs    : write('Clubs   ');
      spades   : write('Spades  ')
   end;
   write('     ')
end;

(*
 * play
 * deal the cards, then decide if we need to  ake any cards
 *)

procedure play;

var
   stood : boolean;   (* if the player stood *)

(*
 * cardeal
 * actually deals a card out
 *)

procedure cardeal(var addto:handvalue);

begin
   showcard(deck[cardnum]);
   if deck[cardnum].value <= 9 then
      addto := (addto + deck[cardnum].value) mod 10;
   cardnum := cardnum + 1
end;

(*
 * bankdeal
 * decide if the bank should have a card dealt to it
 *)

function bankdeal: boolean;

var
   lastval : 0..9;    (* the value of the last card *)

begin
   if deck[cardnum - 1].value >= 10 then
      lastval := 0
   else
      lastval := deck[cardnum-1].value;
   bankdeal := true;
   case lastval of
      0,9: if bankhand >= 4 then
              bankdeal := false;
      8:   if bankhand >= 3 then
              bankdeal := false;
      7,6: if bankhand = 7 then
              bankdeal := false;
      5,4: if bankhand >= 6 then
              bankdeal := false;
      3,2: if bankhand >= 5 then
              bankdeal := false;
      1:   if bankhand >= 4 then
              bankdeal := false
   end
end;

begin
   stood := true;
   bankhand := 0;
   playhand := 0;
   if cardnum > (decksize - 7) then
      shuffle;
   writeln('Player''s hand        Banker''s hand');
   cardeal(playhand);
   cardeal(bankhand);
   writeln;
   cardeal(playhand);
   cardeal(bankhand);
   writeln;
   if (bankhand >= 8) or (playhand >= 8) then
      writeln('Natural')
   else
   begin
      if playhand <= 5 then
      begin
         stood := false;
         writeln('The player must take a card');
         cardeal(playhand)
      end;
      writeln;
      if stood then
      begin
         if bankhand < 6 then
         begin
            writeln('The banker must take a card');
            cardeal(bankhand)
         end
      end
      else
         if bankdeal then
         begin
            writeln('The banker must take a card');
            cardeal(bankhand)
         end;
      writeln
   end;
   writeln('The player''s total is ',playhand);
   writeln('The banker''s total is ',bankhand)
end;

begin
   randomize;
   compmoney := start;
   hummoney := start;
   makedeck;
   cardnum := decksize;
   while (ch <> 'n') and (ch <> 'N') do
   begin
      while not (ch in ['p','P','b','B']) do
      begin
         write('Do you want to be the banker, or player? ');
         readln(ch)
      end;
      writeln;
      if (ch = 'p') or (ch = 'P') then
      begin
         write('Bet? ');
         readln(bet)
      end
      else
      begin
         (*
          * the computer is the player so it makes a random bet
          *)
         bet := random(start) + 10;
         bet := bet div 10;
         bet := bet * 10;
         writeln('The bet is ',bet)
      end;
      play;
      randomize;
      if (ch = 'b') or (ch = 'B') then
      begin
        comphand := playhand;
        humhand  := bankhand
      end
      else
      begin
         comphand := bankhand;
         humhand  := playhand
      end;
      if bankhand = playhand then
         writeln('Tie')
      else
      begin
         if comphand > humhand then
         begin
            writeln('The computer has won');
            compmoney := compmoney + bet;
            hummoney  := hummoney  - bet
         end
         else
         begin
            write('You won!!!');
            compmoney := compmoney - bet;
            hummoney  := hummoney  + bet
         end
      end;
      writeln;
      writeln('Totals are:');
      writeln('Computer has ',compmoney);
      writeln('You have ',hummoney);
      writeln;
      write('Wast to try again? ');
      readln(ch)
   end;
end.
