Program Wator ;

{ Written by M. A. Stoodt  ( 28 Beach Street, W. Wareham MA 02576 )
  Nov 16 - 18, 1984

  Based on A. K. Dewdney's Computer Recreations column,
  Scientific American, December 1984 issue

  A "simulation" of sharks and fish in a (toroid-shaped) ocean
  ( See the article for more details )

  Written in Turbo Pascal

  On Osbornes, must be compiled to disk (not to memory)

  Does not use any Osborne-specific constructions -- with
  recompilation or re-installation (using GINST from the
  Turbo Toolbox -- to set the few cursor control sequences
  that are used), it should work on any Z-80 with sufficient
  memory (recompile if memory problems)

}

{$R+,U+,W1}

const Max_X = 78 ;
      Max_Y = 22 ;
      FishChar = 'o' ;
      SharkChar = 'X' ;
      EmptyChar = ' ' ;
      DefNFish = 300 ;
      DefNShark = 30 ;
      DefFBreed = 3 ;
      DefSBreed = 10 ;
      DefStarve = 3 ;
      DefFMove = 50 ;
      DefSMove = 80 ;


type Location_type = ( Empty, Fish, Shark ) ;

     Location = record
                Processed : Boolean ;
                case Contents : Location_type of
                     Empty : () ;
                     Fish : ( FAge : Byte ) ;
                     Shark : ( SAge ,
                               StarveCount : Byte ) ;
                     end ;

     An_Ocean = array [ 0 .. Max_X , 0 .. Max_Y ] of Location ;

var
    Ocean : An_Ocean ;
    NFish ,
    NSharks ,
    Time ,
    K       : Integer ;
    FBreed ,
    SBreed ,
    Starve ,
    FMove ,
    SMove ,
    I, J : Byte ;
    Endit ,
    Rand_Init_Ages ,
    FileP          : Boolean ;
    C : char ;
    FileName : String [ 14 ] ;
    PopFile : text ;

Function Modulo ( Num, Lim : Integer ) : Integer ;
{ Actually, a Mod ( Lim + 1 ) function, with Num between -1 and 2*Lim }
var Result : Integer ;
begin
if Num > Lim then Result := Num - Lim - 1
else if Num = -1 then Result := Lim
else Result := Num ;
Modulo := Result ;
end ;

Procedure Beep ;
begin
Write ( ^G ) ;
end ;

Procedure CheckEndit ;
begin
if KeyPressed then begin
  Endit := True ;
  Beep ;
  end ;
end ;


Procedure Advance ;

type Check_type = ( Right, Left, Up, Down, None ) ;

  Procedure Adjust ( var I, J : Byte ; D : Check_type ) ;
  begin
  CheckEndit ;
  case D of
    Right : I := modulo ( I + 1, Max_X ) ;
    Left  : I := modulo ( I - 1, Max_X ) ;
    Up    : J := modulo ( J - 1, Max_Y ) ;
    Down  : J := modulo ( J + 1, Max_Y ) ;
    end ;
  end { Adjust } ;


  Function Check ( I, J : Byte ; It : Location_type ) : Check_type ;

    Function Check1 ( Dir1, Dir2, Dir3, Dir4 : Check_type ) : Check_type ;

      Function Check2 ( Dir : Check_type ) : Boolean ;
      begin
      CheckEndit ;
      Case Dir of
        Right : Check2 := ( It = Ocean [ modulo (I+1, Max_X), J ].Contents ) ;
        Left  : Check2 := ( It = Ocean [ modulo (I-1, Max_X), J ].Contents ) ;
        Up    : Check2 := ( It = Ocean [ I, modulo (J-1, Max_Y) ].Contents ) ;
        Down  : Check2 := ( It = Ocean [ I, modulo (J+1, Max_Y) ].Contents ) ;
        end ;
      end { Check2 } ;

    begin { Check1 }
    if      Check2 ( Dir1 ) then Check1 := Dir1
    else if Check2 ( Dir2 ) then Check1 := Dir2
    else if Check2 ( Dir3 ) then Check1 := Dir3
    else if Check2 ( Dir4 ) then Check1 := Dir4
    else                         Check1 := None ;
    end { Check1 } ;

  begin { Check }
  case Random(24) of
    0  : Check := Check1 ( Up, Right, Down, Left ) ;
    1  : Check := Check1 ( Up, Right, Left, Down ) ;
    2  : Check := Check1 ( Up, Down, Right, Left ) ;
    3  : Check := Check1 ( Up, Down, Left, Right ) ;
    4  : Check := Check1 ( Up, Left, Right, Down ) ;
    5  : Check := Check1 ( Up, Left, Down, Right ) ;
    6  : Check := Check1 ( Right, Up, Down, Left ) ;
    7  : Check := Check1 ( Right, Up, Left, Down ) ;
    8  : Check := Check1 ( Right, Down, Up, Left ) ;
    9  : Check := Check1 ( Right, Down, Left, Up ) ;
    10 : Check := Check1 ( Right, Left, Up, Down ) ;
    11 : Check := Check1 ( Right, Left, Down, Up ) ;
    12 : Check := Check1 ( Down, Up, Right, Left ) ;
    13 : Check := Check1 ( Down, Up, Left, Right ) ;
    14 : Check := Check1 ( Down, Right, Up, Left ) ;
    15 : Check := Check1 ( Down, Right, Left, Up ) ;
    16 : Check := Check1 ( Down, Left, Up, Right ) ;
    17 : Check := Check1 ( Down, Left, Right, Up ) ;
    18 : Check := Check1 ( Left, Up, Right, Down ) ;
    19 : Check := Check1 ( Left, Up, Down, Right ) ;
    20 : Check := Check1 ( Left, Right, Up, Down ) ;
    21 : Check := Check1 ( Left, Right, Down, Up ) ;
    22 : Check := Check1 ( Left, Down, Up, Right ) ;
    23 : Check := Check1 ( Left, Down, Right, Up ) ;
    end ;
  end { Check } ;

  Procedure DoFish ( I, J : Byte ) ;
  var TempAge : Byte ;
      Chk : Check_type ;
  begin
  Ocean [ I, J ] . Processed := True ;
  Chk := Check ( I, J, Empty ) ;
  if Ocean [ I, J ] . FAge = FBreed then begin
    if Chk <> None then begin
      Ocean [ I, J ] . FAge := 1 ;
      Adjust ( I, J, Chk ) ;
      with Ocean [ I, J ] do begin
        Processed := True ;
        Contents := Fish ;
        FAge := 1 ;
        end ;
      end ;
    end
  else if ( Chk <> None ) and
          ( Random(100) < FMove ) then begin  { 50% chance of moving ?? }
    TempAge := Ocean [ I, J ] . FAge ;
    Ocean [ I, J ] . Contents := Empty ;
    Adjust ( I, J, Chk ) ;
    with Ocean [ I, J ] do begin
      Processed := True ;
      Contents := Fish ;
      FAge := TempAge + 1 ;
      end ;
    end
  else with Ocean [ I, J ] do
    FAge := FAge + 1 ;
  end { DoFish } ;

  Procedure DoShark ( I, J : Byte ) ;
  var ChkE, ChkF : Check_type ;
      TempAge, TempStarve : Byte ;
  begin
  Ocean [ I, J ] . Processed := True ;
  ChkF := Check ( I, J, Fish ) ;
  ChkE := Check ( I, J, Empty ) ;
  if Ocean [ I, J ] . SAge = SBreed then    { new shark ?  }
    if ChkF <> None then begin
      Ocean [ I, J ] . SAge := 1 ;
      Ocean [ I, J ] . StarveCount := 1 ;
      Adjust ( I, J, ChkF ) ;
      with Ocean [ I, J ] do begin
        Processed := True ;
        Contents := Shark ;
        SAge := 1 ;
        StarveCount := 1 ;
        end ;
      end
    else if ChkE <> None then begin
          { new shark here; old (starving) one in adjacent place }
      with Ocean [ I, J ] do begin
        CheckEndit ;
        TempStarve := StarveCount ;
        SAge := 1 ;
        StarveCount := 1 ;
        end ;
      if TempStarve <> Starve then begin
            { otherwise, starved to death while giving birth }
        Adjust ( I, J, ChkE ) ;
        With Ocean [ I, J ] do begin
          Processed := True ;
          Contents := Shark ;
          SAge := 1 ;
          StarveCount := TempStarve + 1 ;
          end ;
        end { if TempStarve } ;
      end { else if ChkE }
    else     { can't breed -- no room -- don't advance age, but starve }
      with Ocean [ I, J ] do begin
        CheckEndit ;
        if StarveCount = Starve then
          Contents := Empty
        else StarveCount := StarveCount + 1 ;
        end
  else if { SAge <> SBreed and } ChkF <> None then begin
    TempAge := Ocean [ I, J ] . SAge ;
    Ocean [ I, J ] . Contents := Empty ;
    Adjust ( I, J, ChkF ) ;
    with Ocean [ I, J ] do begin
      Processed := True ;
      Contents := Shark ;
      SAge := TempAge + 1 ;
      StarveCount := 1 ;
      end ;
    end
  else if Ocean [ I, J ] . StarveCount = Starve then begin
    CheckEndit ;
    Ocean [ I, J ] . Contents := Empty
    end
  else if ( ChkE <> None ) and
          ( Random(100) < SMove ) then begin
    with Ocean [ I, J ] do begin
      TempAge := SAge ;
      TempStarve := StarveCount ;
      Contents := Empty ;
      end ;
    Adjust ( I, J, ChkE ) ;
    with Ocean [ I, J ] do begin
      Processed := True ;
      Contents := Shark ;
      SAge := TempAge + 1 ;
      StarveCount := TempStarve + 1 ;
      end ;
    end
  else { can't move, can't breed, can't eat! }
    with Ocean [ I, J ] do begin
      CheckEndit ;
      SAge := SAge + 1 ;
      StarveCount := StarveCount + 1 ;
      end ;
  end { DoShark } ;

var I1, J1,
    Delta_I, Delta_J : Byte ;

begin { Advance }
I1 := Random ( Max_X + 1 ) ;
Delta_I := Random ( Max_X - 1 ) + 1 ;
J1 := Random ( Max_Y + 1 ) ;
Delta_J := Random ( Max_Y - 1 ) + 1 ;
  { since Max_X + 1 and Max_Y + 1 are both prime (and mutually prime),
    Delta_I, J will cycle through all the array positions }
I := I1 ;
J := J1 ;
repeat
  with Ocean [ I, J ] do
    if not Processed then
      case Contents of
        Fish  : DoFish ( I, J ) ;
        Shark : DoShark ( I, J ) ;
        Empty : CheckEndit ;
        end ;
  I := modulo ( I + Delta_I, Max_X ) ;
  J := modulo ( J + Delta_J, Max_Y ) ;
until ( I = I1 ) and ( J = J1 ) ;
end ;


Procedure Display ;

var F, S : Integer ;

begin
F := 0 ;
S := 0 ;
GotoXY ( 1, 1 ) ;
for J := 0 to Max_Y do begin
  for I := 0 to Max_X do
    with Ocean [ I, J ] do begin
      CheckEndit ;
      Processed := False ;      { reset this for Advance }
      if Contents = Shark then begin
        Write ( SharkChar ) ;
        S := S + 1 ;
        end
      else if Contents = Fish then begin
        Write ( FishChar ) ;
        F := F + 1 ;
        end
      else Write ( EmptyChar ) ;
      end ;
  WriteLn ;
  end { for J } ;
Write ( 'Time: ', Time : 5 , '   ' ,
        'Fish (', FishChar, ') :', F : 4 , '   ',
        'Sharks (', SharkChar, ') :', S : 4 ) ;
if FileP then
  WriteLn ( PopFile, Time:8, F:8, S:8 ) ;
Endit := Endit or KeyPressed or
           ( F = 0 ) or ( S = 0 ) or
           ( Time = MaxInt ) ;
Time := Time + 1 ;
end ;


begin  { main }
Randomize ;
ClrScr ;
WriteLn ( '                Welcome to Wator' ) ;
WriteLn ;
Write ( 'Initial number of Fish < ', DefNFish, ' > : ' ) ;
NFish := DefNFish ;
  { if just a Return is typed, the value of a
  variable is not changed, so this becomes a default }
ReadLn ( NFish ) ;
Write ( 'Initial number of Sharks < ', DefNShark, ' > : ' ) ;
NSharks := DefNShark ;
ReadLn ( NSharks ) ;
Write ( 'Breeding rate of Fish < ', DefFBreed, ' > : ' ) ;
FBreed := DefFBreed ;
ReadLn ( FBreed ) ;
Write ( 'Breeding rate of Sharks  < ', DefSBreed, ' > : ' ) ;
SBreed := DefSBreed ;
ReadLn ( SBreed ) ;
Write ( 'Starvation period of Sharks < ', DefStarve, ' > : ' ) ;
Starve := DefStarve ;
ReadLn ( Starve ) ;
Write ( 'Movement chance of Fish  < ', DefFMove, ' > : ' ) ;
FMove := DefFMove ;
ReadLn ( FMove ) ;
Write ( 'Movement chance of Sharks  < ', DefSMove, ' > : ' ) ;
SMove := DefSMove ;
ReadLn ( SMove ) ;
Write ( 'Random initial ages (Y or N) <Y>: ' ) ;
ReadLn ( C ) ;
Rand_Init_Ages := not ( ( C = 'n' ) or ( C = 'N' ) ) ;
Write ( 'Write population file (Y/N> <N> : ' ) ;
ReadLn ( C ) ;
FileP := ( C = 'Y' ) or ( C = 'y' ) ;
if FileP then begin
  Write ( 'File name : ' ) ;
  ReadLn ( FileName ) ;
  Assign ( PopFile, FileName ) ;
  Rewrite ( PopFile ) ;
  WriteLn ( PopFile, '    Time    Fish  Sharks' ) ;
  end ;
WriteLn ;
WriteLn ;
WriteLn ( 'To stop, hit any key and hold it down until you hear a beep' ) ;
Delay ( 1000 ) ;

ClrScr ;

for I := 0 to Max_X do
  for J := 0 to Max_Y do
    Ocean [ I, J ] . Contents := Empty ;
    { Processed is initialized/reset by Display }
for K := 1 to NFish do begin
  repeat
    I := Random ( Max_X + 1 ) ;
{ Random returns integer between 0, arg - 1 (inclusive) }
    J := Random ( Max_Y + 1 ) ;
  until Ocean [ I, J ] . Contents = Empty ;
  with Ocean [ I, J ] do begin
    Contents := Fish ;
    if Rand_Init_Ages then
      FAge := Random ( FBreed ) + 1
    else FAge := 1 ;
    end ;
  end ;
for K := 1 to NSharks do begin
  repeat
    I := Random ( Max_X + 1 ) ;
    J := Random ( Max_Y + 1 ) ;
  until Ocean [ I, J ] . Contents = Empty ;
  with Ocean [ I, J ] do begin
    Contents := Shark ;
    if Rand_Init_Ages then begin
      SAge := Random ( SBreed ) + 1 ;
      StarveCount := Random ( Starve ) + 1 ;
      end
    else begin
      SAge := 1 ;
      StarveCount := 1 ;
      end ;
    end ;
  end ;
Endit := False ;
Time := 0 ;
Display ;
Repeat
  Advance ;
  Display ;
until Endit ;
Close ( PopFile ) ;
end .
