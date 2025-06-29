Program Record_Library ( Output );
type
  Music_kind     = ( Classical, Jazz, Rock, Folk, International );
  Class_period   = ( Baroque, Classic, Romantic, Modern );
  Music_form     = ( Symphony, Sonata, Trio, Quartet, Concerto );
  Record_co      = ( RCA, Columbia, Nonesuch, DGG, Angel );
  PieceP         = ^ Piece;
  
  Performer_record = record
                       Artist   : String[20];
                     end(*Performer_record*);
  Piece          = record
                     Composer : String[20];
                     Period   : Class_period;
                     Form     : Music_form;
                     Artists  : Performer_record;
                     Date     : 1100:1980;
                   end(*Piece*);
const
  Max_Entries = 200;
var
  Entries   : array [0:Max_Entries] of PieceP;
  Current_Entries : 0..Max_Entries;
  i   : integer;
procedure Sort ( l,r : integer );
var
  x,w   : PieceP;
  i,j   : Integer;
begin
  i:= L;
  j:= r;
  X := Entries[(L+r) div 2];
  repeat
     while Entries[i]^.Composer < X^.Composer    do i:= i+1;
     while X^.Composer    < Entries[j]^.Composer do j:= j-1;
     if i <= j then begin
        w:= Entries[i];
        Entries[i]:= Entries[j];
        Entries[j]:= w;
        i:= i+1;
        j:= j-1;
     end;
  untiL i>j;
  if L<j then Sort(L,j);
  if i<r then Sort(i,r);
end(*SORT*);
procedure Initialize;
var
  i : 0..Max_Entries;
begin
  for i := 1 to Max_Entries do begin
    Entries [i] := nil;
  end(*for*);
  Current_Entries := 0;
end(*Initialize*);
procedure Enter;
label
  999,
  998;
var
  S    : Char;
  Temp : PieceP;
begin
  repeat
    New ( Temp );
    with Temp^ do begin
999:
      writeln;
      write('Form: Symph.,sOnata,Trio,Quartet,Concerto,eXit? ');
      read(s);
      case s of
        'S','s' : Form := Symphony;
        'O','o' : Form := Sonata;
        'T','t' : Form := Trio;
        'Q','q' : Form := Quartet;
        'C','c' : Form := Concerto;
        'X','x' : exit(Enter);
        otherwise goto 999;
      end(*case*);
998:
      writeln;
      write('Period: Baroque,Classic,Romantic,Modern?');
      read(s);
      case s of
        'B','b' : Period := Baroque;
        'C','c' : Period := Classic;
        'R','r' : Period := Romantic;
        'M','m' : Period := Modern;
        otherwise goto 998;
      end(*case*);
      writeln;
      write('Composer: ? ');
      read(Composer);
    end(*with*);
    Entries[Current_Entries] := Temp;
    Current_Entries := Current_Entries + 1;
  until false;  (* input until 'X' *)
end(*Enter*);

begin
  Initialize;
  Enter;
  Sort ( 0, Current_entries-1);
  writeln (output);
  for i := 0 to (Current_entry-1) do writeln (output, Entries[i]^.Composer);
end.
