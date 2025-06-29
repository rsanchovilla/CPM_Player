program Bridge; (*written in TURBO PASCAL*)

type
  Suit= (sp,he,di,cl,no);
  Rank= 2..14; (*deuce to ace*)
  Players= (w,n,e,s);
  Card= record
    CardRank: Rank;
    CardSuit: Suit;
    end;
  CardSet= set of Rank;
  FistFull= record
    SuitCase: array[suit] of CardSet;
    Eval: 0..40; (*points*)
    end;
  Deck= array[1..52] of Card;
  HandArray= array[Players] of FistFull;

var
  cardDeck: Deck;
  hand: HandArray;
  cardPlayed: Card;
  player, winner: Players;
  ans, amt, sute: char;
  quit: boolean;
  j: integer;

procedure Shuffle (var pack: Deck);
  var
    tCard: Card;
    i: integer;
  begin
  for i:= 1 to 52 do
    begin
    Randomize;
    j:= trunc(random*(53-i)+i);
    tCard:= pack[i];
    pack[i]:= pack[j];
    pack[j]:= tCard;
    end;
  end;

procedure Deal (var cardDeck: Deck; var hand: HandArray);
  var
    tRank: Rank;
    tSuit: Suit;
    player: Players;
  begin
  tRank:= 2; tSuit:= sp;
  for j:= 1 to 52 do
    begin
      cardDeck[j].CardRank:= tRank;
      cardDeck[j].CardSuit:= tSuit;
      if tRank= 14 then
        begin
          tRank:= 2;
          if tSuit < cl then tSuit:= succ(tSuit);
        end
      else tRank:= tRank+1;
    end;
  Shuffle(cardDeck);
  for player:= w to s do
    for tSuit:= sp to cl do
      hand[player].suitCase[tSuit]:= [];
  (*now the new deal*)
  player:= s;
  for j:= 1 to 52 do
    begin
    if player= s then player:= w
      else player:= succ(player);
    tRank:= cardDeck[j].CardRank;
    tSuit:= cardDeck[j].CardSuit;
    hand[player].SuitCase[tSuit]:= hand[player].SuitCase[tSuit] + [tRank];
    end;
  end;

procedure Display (hand: HandArray);
  const (*'typed' constants*)
    suitName: array[Suit] of string[2]= ('SP','HE','DI','CL','NO');
    name: array[10..14] of char= 'TJQKA';
  var
    tSuit: Suit;
    tRank: Rank;
    tRankSet: CardSet;
  begin
  ClrScr;
  write ('(''Q'' to quit)'); write ('North':12);
  for tSuit:= sp to cl do
    begin
    GotoXY(16,ord(tSuit)+3);
    write (suitName[tSuit]:2);
    for tRank:= 14 downto 2 do
      if tRank in hand[n].SuitCase[tSuit] then
        if tRank > 9 then write (name[tRank]:3)
          else write (tRank:3);
    end;
  GotoXY(6,8); write ('West');
  for tSuit:= sp to cl do
    begin
    GotoXY(1,ord(tSuit)+10);
    write (suitName[tSuit]:2);
    for tRank:= 14 downto 2 do
      if tRank in hand[w].SuitCase[tSuit] then
        if tRank > 9 then write (name[tRank]:3)
          else write (tRank:3);
    end;
  GotoXY(35,8); write ('East');
  for tSuit:= sp to cl do
    begin
    GotoXY(30,ord(tSuit)+10);
    write (suitName[tSuit]:2);
    for tRank:= 14 downto 2 do
      if tRank in hand[e].SuitCase[tSuit] then
        if tRank > 9 then write (name[tRank]:3)
          else write (tRank:3);
      end;
  GotoXY(21,15); write ('South');
  for tSuit:= sp to cl do
    begin
    GotoXY(16,ord(tSuit)+17);
    write (suitName[tSuit]:2);
    for tRank:= 14 downto 2 do
      if tRank in hand[s].SuitCase[tSuit] then
        if tRank > 9 then write (name[tRank]:3)
          else write (tRank:3);
      end;
  end;


procedure Points (var hand: HandArray);
  var
    tRank: Rank;
    tSuit: Suit;
    player: Players;
    value: integer;
  begin
  for player:= w to s do
    begin
    value:= 0;
    for tSuit:= sp to cl do
      begin
      for tRank:= 11 to 14 do
        if tRank in hand[player].Suitcase[tSuit] then
          value:= value+(tRank-10);
      end;
    hand[player].Eval:= value;
    end;
  GotoXY(11,8); write ('(', hand[w].Eval:2,' points)');
  GotoXY(27,1); write ('(', hand[n].Eval:2,' points)');
  GotoXY(40,8); write ('(', hand[e].Eval:2,' points)');
  GotoXY(27,15); write ('(',hand[s].Eval:2,' points)');
  end;

procedure Contract (var amt, sute: char);
  label Q;
  begin
  GotoXY(1,22); write ('Contract: '); read (amt,sute);
  if (amt='Q') or (amt='q') then
    begin
    quit:= True;
    goto Q;
    end;
  sute:= UpCase(sute);
  while not (amt in ['1'..'7']) or
    not (sute in ['N','S','H','D','C'])do
      begin
      GotoXY(1,23);
      write ('Re-enter contract (e.g. 3N, or 4H)');
      GotoXY(11,22);
      read (amt,sute);
      GotoXY(1,23); ClrEol;
      if (amt= 'Q') or (amt= 'q') then
        begin
        quit:= True;
        goto Q;
        end;
      sute:= UpCase(sute);
      end;
Q:end;

procedure Rotate (var hand: HandArray);
  var
    tHand: FistFull;
    ans: char;
  begin
  quit:= False;
  GotoXY(1,23);
  write ('Do you want to be N, S, E, or W ? ');
  read (ans);
  while not (ans in ['N','n','S','s','E','e','W','w','Q','q']) do
    begin
    write ('   Try again: ');
    read (ans);
    end;
  GotoXY(1,23); ClrEol;
  case ans of
    'W','w': begin tHand:=Hand[w]; Hand[w]:=Hand[n]; Hand[n]:=Hand[e];
         Hand[e]:=Hand[s]; Hand[s]:=tHand; Display(hand); end;
    'N','n': begin tHand:=Hand[n]; Hand[n]:=Hand[s]; Hand[s]:=tHand;
         tHand:=Hand[w]; Hand[w]:=Hand[e]; Hand[e]:=tHand; Display(hand); end;
    'E','e': begin tHand:=Hand[e]; Hand[e]:=Hand[n]; Hand[n]:=Hand[w];
         Hand[w]:=Hand[s]; Hand[s]:=tHand; Display(hand); end;
    'S','s': Display(hand);
    'Q','q': quit:= True;
    end;
  end;

procedure ReadCard (var cardPlayed: Card);
  var
    tSuit, tRank: char;
  begin
  GotoXY(((j*7)+2),24);
  read (tSuit,tRank);
  tSuit:= UpCase(tSuit); tRank:= UpCase(tRank);
  case tSuit of
    'S': cardPlayed.CardSuit:= sp;
    'H': cardPlayed.CardSuit:= he;
    'D': cardPlayed.CardSuit:= di;
    'C': cardPlayed.CardSuit:= cl;
    'N': cardPlayed.CardSuit:= no;
    'Q': quit:= True;
  else begin
    GotoXY(1,23);
    write ('The suit can only be S,H,D,or C. Re-enter.');
    ReadCard (cardPlayed);
    end;
    end;
  cardPlayed.CardRank:= pos(tRank,' 23456789TJQKA');
  end;

procedure Lead (var winner:Players; var highCard:integer; var highSuit:Suit);
  begin
  highCard:= cardPlayed.CardRank;
  highSuit:= cardPlayed.CardSuit;
  winner:= player;
  end;

procedure Play (hand: HandArray);
  label Q;
  const
    individual: array[Players] of char= 'WNES';
  var
    trump, leadSuit, highSuit: Suit;
    highCard, tricksLost, plays: integer;
    error: boolean;
  begin
  tricksLost:= 0;
  plays:= 0;
  player:= w;
  GotoXY(1,22); write ('Contract: ',amt,sute);
  while plays < 13 do
    begin
    GotoXY(1,24); write ('Play: ');
    sute:= UpCase(sute);
    case sute of
      'S': trump:= sp;
      'H': trump:= he;
      'D': trump:= di;
      'C': trump:= cl;
      'N': trump:= no;
       end;
    for j:= 1 to 4 do
      begin
      GotoXY((j*7),24); ClrEol;
      write (individual[player]);
      with hand[player] do
        begin
        repeat
          error:= False;
          ReadCard (cardPlayed);
          GotoXY(1,23); ClrEol;
          if quit= True then goto Q;
          if (j <> 1) and (SuitCase[leadSuit] <> [])
            and (cardPlayed.CardSuit <> leadSuit) then
              begin
              GotoXY(1,23); ClrEol;
              write ('Follow suit!  Re-enter, please.');
              error:= True;
              end;
          if not (cardPlayed.CardRank
            in SuitCase[cardPlayed.CardSuit])
              or (cardPlayed.CardSuit= no) then
                begin
                GotoXY(1,23);
                write ('You don''t have that card. Re-enter (e.g. H2).');
                error:= True;
                end;
        until not error;
        SuitCase[cardPlayed.CardSuit]:=
        SuitCase[cardPlayed.CardSuit] - [cardPlayed.CardRank];
        end; (*of 'with'*)
      if j= 1 then
        begin
        leadSuit:= cardPlayed.CardSuit;
        Lead (winner,highCard,highSuit);
        end;
      if (highSuit= trump)
        and (cardPlayed.CardSuit= trump)
          and (cardPlayed.CardRank > highCard) then
            Lead (winner,highCard,highSuit);
      if (highSuit <> trump)
        and (cardPlayed.CardSuit= trump) then
          Lead (winner,highCard,highSuit);
      if (cardPlayed.CardSuit= highSuit)
        and (cardPlayed.CardRank > highCard) then
          Lead (winner,highCard,highSuit);
      if player= s then player:= w
        else player:= succ(player);
      end; (*of 'for'*)
    case winner of
      w: begin
         player:= w;
         tricksLost:= tricksLost+1;
         end;
      n: player:= n;
      e: begin
         player:= e;
         tricksLost:= tricksLost+1;
         end;
      s: player:= s;
      end;
    Display (hand);
    GotoXY(1,22); write ('Contract: ',amt,sute);
    plays:= plays+1;
    GotoXY(30,22); write ('Plays/TricksLost:',plays:2,'/',tricksLost);
    end; (*of 'while'*)
Q:end;

Begin (*MAIN PART*)
repeat
  quit:= False;
  ClrScr;
  Deal (cardDeck, hand);
  Display (hand);
  Points (hand);
  Contract (amt,sute);
  if quit= False then
    Rotate (hand);
  if quit= False then
    Play (hand);
  GotoXY(1,24); ClrEol;
  write ('Do you want to see another deal (Y/N)? ');
  read (ans);
until (ans = 'N') or (ans = 'n');
ClrScr;
End.