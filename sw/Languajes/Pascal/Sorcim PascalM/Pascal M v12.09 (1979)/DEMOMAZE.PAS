PROGRAM MAZE;

const
   m=9;                {rows in maze}
   m1=10;                {rows + 1}
   m2=11;                {rows + 2}
   n=12;                {columns in maze}
   n1=13;                {columns + 1}
   n2=14;                {columns + 2}
   
type
   stackptr = ^this_square;        {pointer to stack nodes}
   direction = (north,northeast,east,southeast,
                south,southwest,west,northwest);
   this_square = record
                   row : integer;
                   column : integer;
                   looking : direction;
                   string : stackptr
                 end;
   map = packed array[-1:m2,-1:n2] of char;
   vitality = (alive,dead);
   valid_move = -1:1;
   index = array[north:northwest] of valid_move;
   table = record
             hmove : index;
             vmove : index
             end;
   markers = set of char;
   
var
   maze : map;
   theseus : stackptr;
   minotaur : vitality;
   compass : table;
   done : boolean;

procedure ARRAY_START (var maze:map; var compass:table);

var
   i : integer;
   j : integer;
   d : direction;

begin {ARRAY_START}

{initialize the labyrinth}
   for i := -1 to m2 do
      begin
         for j := -1 to n2 do
            begin
               maze[i,j] := '.';
               if (i=-1) or (j=-1) or (i=m2) or (j=n2) then maze[i,j] := '*'
            end
      end;

{now set the compass}
with compass do
   begin
      for d := north to northwest do
         begin
            if (d=east) or (d=west) then vmove[d] := 0
            else if (d>east) and (d<west) then vmove[d] := 1
            else vmove[d] := -1;
            if (d=north) or (d=south) then hmove[d] := 0
            else if (d<south) then hmove[d] := 1
            else hmove[d] := -1
         end
      end
   end; {ARRAY_START}


procedure PRINT_MAZE (maze:map);

var
   i : integer;
   j : integer;

begin {PRINT_MAZE}
   for i := 1 to m do
      begin   
         for j := 1 to n do write (maze[i,j],' ');
         writeln
      end
end; {PRINT_MAZE}
   
procedure READ_MAZE (var maze:map);

var
   i : integer;
   j : integer;
   x : char;
   legals : markers;

procedure Make_Maze;
var
  i,j : integer;
begin
         writeln;
         writeln('Enter the maze as you wish it to be.');
         writeln('Enter "*" for walls, "." for passageways and ');
         writeln(' one "M" for the Minotaur.  The maze is 12 characters by');
         writeln('9 rows high.');
         writeln('Enter 12 characters as described above followed by pressing');
         writeln('the return key. Do this 9 times to complete the maze.');
         writeln('The game will then begin.');
         
         for i := 1 to m do
         begin
            for j := 1 to n do
            begin
               read (x);
               if x in legals then maze[i,j] := x
               else maze[i,j] := '.'
            end;
            readln
         end;
end {Make_Maze};

begin {READ_MAZE}
   legals := ['*','.','M','m'];
   writeln ('Enter 1 or 3 or any other character.');
   writeln ('1 or 3 selects figure 1 or 3 from Budge.');
   write('Other character for user-defined maze: ');
   read(x);
   case x of
      '1' : begin
         MoveLeft ( '************', Maze [1,1], n);
         MoveLeft ( '*.*.**....**', Maze [2,1], n);
         MoveLeft ( '*..*M*.**.**', Maze [3,1], n);
         MoveLeft ( '*.****.*.***', Maze [4,1], n);
         MoveLeft ( '***...*.*.**', Maze [5,1], n);
         MoveLeft ( '**.****..***', Maze [6,1], n);
         MoveLeft ( '..***..*****', Maze [7,1], n);
         MoveLeft ( '**.*.***...*', Maze [8,1], n);
         MoveLeft ( '******..****', Maze [9,1], n);
      end;
      '3' : begin
         MoveLeft ( '***.********', Maze [1,1], n);
         MoveLeft ( '....****.**.', Maze [2,1], n);
         MoveLeft ( '*****.***..*', Maze [3,1], n);
         MoveLeft ( '*..*.**.*.**', Maze [4,1], n);
         MoveLeft ( '.*.**..**..*', Maze [5,1], n);
         MoveLeft ( '*.**.***.***', Maze [6,1], n);
         MoveLeft ( '*...**.**.*.', Maze [7,1], n);
         MoveLeft ( '***..M**...*', Maze [8,1], n);
         MoveLeft ( '*******.****', Maze [9,1], n);
      end;
      otherwise begin
         Make_Maze;
      end;
   end;
end; {READ_MAZE}

procedure POP (var thesues:stackptr);

var
   p : stackptr;

begin {POP}
   if theseus = nil then writeln ('UNDERFLOW ON STACK')
   else 
      begin
         p := theseus;
         theseus := theseus^.string;
         dispose(p)
      end
end; {POP}

procedure PUSHON (var theseus:stackptr; var maze:map; compass:table);

var
   p : stackptr;

begin {PUSHON}
   new(p);
   with theseus^ do
      begin
         p^.row := row + compass.vmove[looking];
         p^.column := column + compass.hmove[looking];
      end;
   p^.looking := north;
   p^.string := theseus;
   theseus := p;
   maze[theseus^.row,theseus^.column] := '+';
end; {PUSHON}

procedure SEARCH (var theseus:stackptr; var maze:map; var minotaur:vitality;
                  compass:table);

var
   tr : integer;
   tc : integer;
   seewhat : char;
   legals : markers;

begin {SEARCH}
   legals := ['*','.','M','m','+'];
   with theseus^ do
      begin
         tr := compass.vmove[looking] + row;
         tc := compass.hmove[looking] + column;
      end;
   seewhat := maze[tr,tc];
   if seewhat in legals then
      begin
         if seewhat = '+' then seewhat := '*';
         
         case seewhat of
            '*' :  if theseus^.looking = northwest then POP(theseus)
                      else theseus^.looking := succ(theseus^.looking);
            
            '.' :  PUSHON(theseus,maze,compass);
            
            'M','m' :  begin
                      minotaur := dead;
                      maze[tr,tc] := 'W'
                   end
         end {case}
      end {if}
   else 
      begin
         writeln('what is that?');
         POP(theseus)
      end
end; {SEARCH}

begin {MAIN}
   {initialize}
   Minotaur := alive;
   done := false;
   ARRAY_START(maze,compass);
   new(theseus);
   with theseus^ do
      begin
         row := 0;
         column := -1;
         looking := east;
         string := nil
      end; {with}
   PUSHON(theseus,maze,compass);
   READ_MAZE(maze);
   writeln;
   writeln('Original maze: ');
   PRINT_MAZE(maze);

{now go chase minotaurs}
   repeat
      begin
         if minotaur = dead then
            with theseus^ do
               begin
                  if (row<1) or (row>m) or (column<1) or (column>n) then
                     done := true;
                  if not done then
                     begin
                        maze[row,column] := 'T'
                     end;
                  POP(theseus)
               end {with}
         else SEARCH(theseus,maze,minotaur,compass)
      end {repeat}
   until theseus^.string = nil;
   writeln;
   if minotaur = dead then writeln('Theseus has slain the Minotaur.')
   else writeln('Theseus is a jerk. The Minotaur lives.');
   writeln('Here is where he went: ');
   writeln;
   PRINT_MAZE(maze)
end. {MAIN}
