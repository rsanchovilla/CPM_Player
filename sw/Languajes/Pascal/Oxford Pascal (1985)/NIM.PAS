 program nim (input, output);
const   nrows = 24;
        delay = 1000;
        coin = 128;
var     pile : array [1..3] of 0..nrows;
        move  : record
                ntaken, pileno : integer;
        end;
        i : integer;
        key : char;
function gameover : boolean;
begin gameover := (pile [1] + pile [2] + pile [3] = 0) end;
function asc (n : integer) : char;
begin asc := chr (n+ord ('0')) end;
procedure display;
        var     p, row, col, firstcol : integer;
        begin
                page;
                for p := 1 to 3 do
                    begin
                        firstcol := p*10;
                        for row := 0 to NROWS-1 do 
                                if pile [p] >= NROWS-row then 
                                    for col := firstcol+3 to firstcol+5 do
                                        vdu (row, col , chr (COIN));
                                if pile [p] >= 10 then 
                                vdu (NROWS-1, firstcol, asc (pile[p] div 10));
                                vdu (NROWS-1, firstcol+1,asc(pile[p] mod 10));
                    end;
        end; (* display *)
procedure signon;
        begin
                 page;
                writeln ('                  ***  NIM  ***');
                writeln;
                writeln;
                writeln ('  I will set up three piles of coins.');
                writeln ('To move, take any number of coins away');
                writeln ('from any pile.  The player who clears the');
                writeln ('screen wins. ');
                writeln;
                write ('  Now hit any key to start : ');
                while getkey = chr (0) do;
        end; (* signon *)
procedure hismove; 
        var     ok : boolean;
        begin
                writeln ('Now enter your move :');
                with move do repeat
                        writeln;
                        write ('Pile (1 to 3) ? ');
                        read (pileno);
                        ok := pileno in [1..3];
                        if ok then
                            begin
                                write ('Number to take away ? ');
                                read (ntaken);
                                ok := ntaken in [1..pile [pileno]];
                            end;
                        if not ok then writeln ('What ??');
                until ok;
                with move do pile [pileno] := pile [pileno]-ntaken;
END;
procedure  mymove;
var     bit:array[1..3,1..4]of boolean;
        parity  :array[1..4]of boolean;
        firstbit, x, i, j:integer;
        begin
                for i:=1 to 3 do
                        begin
                                x:=pile[i];
                                for j:=4 downto 1 do
                                        begin
                                                bit[i,j]:=odd(x);
                                                x:=x div 2;
                                        end;
                        end;
                for i:=1 to 4 do parity[i]:=
                        bit[1,i]<>(bit[2,i]<>bit[3,i]);
                move.pileno:=1;
                move.ntaken:=0;
                with move do
                if not(parity[1]or parity[2]or parity[3]or parity[4])then
                        begin
                                while pile[pileno]=0 do pileno
                                                :=pileno+1;
                        if pile[pileno]=1 then ntaken:=1
                        else
                        ntaken:=random mod(pile[pileno]-1)+1
                        end
                else    begin
                                firstbit:=1;
                                while not parity[firstbit] do
                                        firstbit:=firstbit+1;
                                while not bit[pileno,firstbit] do
                                        pileno:=pileno+1;
                                for i:=firstbit to 4 do
                                        begin
                                                x:=1;
                                                for j:=3 downto i
                                                        do x:=x*2;
                                                if parity[i] then
                                                if bit[pileno,i]
                                                then ntaken:=ntaken+x
                                                else ntaken:=ntaken-x;
                                        end
                        end;
                with move do pile[pileno]:=pile[pileno]-ntaken;
        end; (*of mymove*)
begin
        signon;
        repeat
                for i := 1 to 3 do pile [i] := random mod 10 + 6;
                display;
                repeat
                        hismove;
                        if gameover then writeln ('Congratulations...',
                                                ' you win !')
                        else begin
                                display;
                                mymove;
                                for i := 1 to delay do ;
                                display;
                                writeln ('My move was', move.ntaken : 3,
                                        ' from pile', move.pileno:2);
                                if gameover then writeln ('*** I win.');
                                writeln;
                                writeln;
                            end;
                        until gameover;
                write ('Another game ? ');
                        while input^ = ' ' do get (input);
                read (key);
                while not eoln do get (input);
        until (key = 'n') OR (key = 'N');
page;
end.
                                                                                                                                