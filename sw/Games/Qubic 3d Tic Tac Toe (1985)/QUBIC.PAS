{               QUBIC.PAS  Vers 3.2  10Nov85

          (C) 1985  by  W. Brimhall
                        Phoenix, Az.  602-996-3201

   This program may be distributed free for non-commerical use.

         Qubic is a game of Tic Tac Toe in a 4x4x4 cube.
            This version is written in Turbo Pascal.
}

PROGRAM Qubic;

{ Patch in different values here to configure the game for different
  keyboard arrow codes. }

CONST
  left=^S;  { WordStar keyboard arrow codes }
  right=^D;
  up=^E;
  down=^X;
  abort=^C;  { ^C aborts game }
  empty=0;
  flagged=1;
  player=10;
  machine=100;

{ This table is used to convert from square # to screen
  position. It is organized as a 64x2 array. The square
  # is used as the index to look up the screen row &
  column positions. }

  scrn_pos : ARRAY[1..64,1..2] OF BYTE =
    ((3,36),(3,43),(3,50),(3,57),
     (4,31),(4,38),(4,45),(4,52),
     (5,26),(5,33),(5,40),(5,47),
     (6,21),(6,28),(6,35),(6,42),

     (8,36),(8,43),(8,50),(8,57),
     (9,31),(9,38),(9,45),(9,52),
     (10,26),(10,33),(10,40),(10,47),
     (11,21),(11,28),(11,35),(11,42),

     (13,36),(13,43),(13,50),(13,57),
     (14,31),(14,38),(14,45),(14,52),
     (15,26),(15,33),(15,40),(15,47),
     (16,21),(16,28),(16,35),(16,42),

     (18,36),(18,43),(18,50),(18,57),
     (19,31),(19,38),(19,45),(19,52),
     (20,26),(20,33),(20,40),(20,47),
     (21,21),(21,28),(21,35),(21,42));

{ Table of next non-winning, non-blocking machine moves.
  This is organized as a 16x1 array of square numbers.}

  mach_move : ARRAY[1..16] OF BYTE =
    (1,49,52,4,13,61,64,16,22,39,23,38,26,42,27,43);

{ Table of winning lines. This is organized as a
  76x4 array of square numbers.}

  win_line : ARRAY[1..76,1..4] OF BYTE =
      { left & right }
    (( 1,2,3,4   ),( 5,6,7,8   ),(9,10,11,12 ),(13,14,15,16),
     (17,18,19,20),(21,22,23,24),(25,26,27,28),(29,30,31,32),
     (33,34,35,36),(37,38,39,40),(41,42,43,44),(45,46,47,48),
     (49,50,51,52),(53,54,55,56),(57,58,59,60),(61,62,63,64),
       { up & down }
     (1,17,33,49 ),(5,21,37,53 ),(9,25,41,57 ),(13,29,45,61),
     (2,18,34,50 ),(6,22,38,54 ),(10,26,42,58),(14,30,46,62),
     (3,19,35,51 ),(7,23,39,55 ),(11,27,43,59),(15,31,47,63),
     (4,20,36,52 ),(8,24,40,56 ),(12,28,44,60),(16,32,48,64),
       { front & back }
     (1,5,9,13   ),(17,21,25,29),(33,37,41,45),(49,53,57,61),
     (2,6,10,14  ),(18,22,26,30),(34,38,42,46),(50,54,58,62),
     (3,7,11,15  ),(19,23,27,31),(35,39,43,47),(51,55,59,63),
     (4,8,12,16  ),(20,24,28,32),(36,40,44,48),(52,56,60,64),
       { left & right diagnals }
     (1,6,11,16  ),(17,22,27,32),(33,38,43,48),(49,54,59,64),
     (13,10,7,4  ),(29,26,23,20),(45,42,39,36),(61,58,55,52),
       { up & down diagnals }
     (1,21,41,61 ),(2,22,42,62 ),(3,23,43,63 ),(4,24,44,64 ),
     (49,37,25,13),(50,38,26,14),(51,39,27,15),(52,40,28,16),
       { front & back diagnals }
     (1,18,35,52 ),(5,22,39,56 ),(9,26,43,60 ),(13,30,47,64),
     (49,34,19,4 ),(53,38,23,8 ),(57,42,27,12),(61,46,31,16),
       { cross diagnals }
     (1,22,43,64 ),(16,27,38,49),(4,23,42,61 ),(13,26,39,52));

{ Table of one of many possible sets of winning moves. To prove
  that winning is possible the program will supply these moves if
  the player logs on with the name 'WINNER'.}

  win_move : ARRAY[1..8] OF BYTE =
    (10,11,41,27,26,25,9,57);

TYPE  square_status = empty..machine;
  position = 0..64;
  setofchar = SET OF CHAR;
  str80 = STRING[80]; {Turbo doesn't like STRING parameters}

VAR  cube : ARRAY[position] OF square_status;
  line_sum : ARRAY[1..76] OF INTEGER;
  row,column,i,j,square,move : INTEGER;
  name,reply : str80;
  response : CHAR;
  moved,game_over,hard_game,aborted : BOOLEAN;

(*********)
(* Space *)
(*********)

(* Output spaces to the CRT *)
PROCEDURE Space(count:INTEGER);
BEGIN
    WHILE count > 0 DO
  BEGIN
      WRITE(' ');
      count := count-1
  END;    (* WHILE count *)
END;    (* Space *)

(**********)
(* Center *)
(**********)

(* Center a String on the CRT *)
PROCEDURE Center(sentence:str80);
CONST    scrnwidth = 80;  (* screen width *)
   offset = 2;  (* offset to make screen look centered *)
VAR    len : INTEGER;
BEGIN
    len := LENGTH(Sentence);
    WRITELN(sentence:len-offset+(scrnwidth-len) DIV 2)
END;    (* Center *)

(*********)
(* Erase *)
(*********)

(* Erase a line on the CRT and place cursor at column 1 *)
PROCEDURE Erase(line:INTEGER);
BEGIN
    Gotoxy(1,line);
    ClrEol;
END;    (* Erase *)

(**************)
(* initialize *)
(**************)

(* Display instructions & initialize *)
PROCEDURE initialize;
VAR  i : INTEGER;
BEGIN
    move := 1;
    ClrScr;
    Gotoxy(1,22);
    Center('(C) 1985 by W. Brimhall Phoenix, Az.  602-996-3201');
    Center('This program may be distributed free for non-commerical use.');
    Gotoxy(1,1);
    Center('Welcome  to');
    Gotoxy(1,3);
    Center('+ +  Q  U  B  I  C  + +');
    Center('Vers  3.2');
    Gotoxy(1,6);
    Delay(2000);
    Center('The game is Tic Tac Toe in a 4x4x4 cube. To make your');
    Center('move use the arrows on the keyboard to position the cursor');
    Center('to your selected position in the cube, then press RETURN.');
    FOR i := 1  TO 64 DO
      cube[i] := 0;
    aborted := FALSE;
    Gotoxy(1,16);
    WRITE('Your name please? ');
    READLN(name);
    Gotoxy(1,18);
    Write('Do you want a hard game ',name,'? ');
    READLN(reply);
    IF reply[1] IN ['Y','y'] THEN
      hard_game := TRUE
    ELSE
      hard_game := FALSE;
END;    (* Initialize *)

(*************)
(* disp_cube *)
(*************)

(* Display the cube on the CRT screen *)
PROCEDURE disp_cube;
VAR  cube_line : str80;
  spaces, level : integer;
BEGIN
    cube_line := ':      :      :      :';
    ClrScr;
    LowVideo;
    WRITELN;
    FOR level := 1 TO 4 DO
  BEGIN
      WRITELN;
      spaces := 35;

    REPEAT
        Space(spaces);
        WRITELN(cube_line);
        spaces := spaces-5;
    UNTIL spaces = 15;

  END     (* FOR level *);
  NormVideo;
END;    (* Disp_cube *)

(***************)
(* Goto_square *)
(***************)

(* Position cursor to the current square on the crt screen *)

PROCEDURE Goto_square;
BEGIN
  Erase(12); Gotoxy(70,12);
  WRITE('Square ',square);
  row := scrn_pos[square,1];
  column := scrn_pos[square,2];
  Gotoxy(column,row);
END;  (* Goto_square *)

(*****************)
(* Select_square *)
(*****************)

{ Use the Keyboard arrows to select the players next
  move. When the cursor is positioned to the selected
  square press return. The current square will be
  returned in the global variable 'square'. If the
  position is undefined square will be equal to 0 }

PROCEDURE Select_square;
BEGIN
  Goto_square;
  WRITE(CHR(7));  { bel }

  IF name = 'WINNER' THEN  {get move from win_move array}
    BEGIN
      DELAY(1500);
      Erase(1);
      square := win_move[move];
      move := move + 1;
      Goto_square;
      DELAY(1500);
      WRITE('x');
      Goto_square;
      DELAY(1500);
    END
  ELSE
    REPEAT  {get move from player}
      READ(KBD,response);
      CASE response OF
        left  : square := square-1;
        right : square := square+1;
        down  : square := square+4;
        up    : square := square-4;
        abort : aborted := TRUE
      END;  { CASE }
      IF square < 1 THEN square := square+64;
      IF square > 64 THEN square := square-64;
      Erase(1);
      Goto_square;
    UNTIL (response=^M) OR aborted

END;  { Select_square }

(***************)
(* Player_move *)
(***************)

{ Make players move, if it is to an undefined or already
  taken square then tell him so and make him do it again.
  Store the player flag in the selected square of the
  cube array }

PROCEDURE Player_move;
VAR  first_try : BOOLEAN;
BEGIN
  first_try := TRUE;
  moved := FALSE;

  WHILE (moved=FALSE) AND (aborted=FALSE) DO
    BEGIN

    IF first_try THEN  { IF #1 }
      BEGIN
      Erase(24); Erase(23);
      Write('Your move ',name,': ');
      select_square;
      first_try := FALSE
      END;

    IF (cube[square]=machine) AND (aborted=FALSE) THEN  { IF #2 }
      BEGIN
      Erase(1); Erase(23);
      WRITE('Come on ',name,', can''t you see ');
      WRITE('that square is mine!');
      Erase(24);
      WRITE('It''s still your move: ');
      select_square
      END

    ELSE  { ELSE #2 }

      IF (cube[square]=player) AND (aborted=FALSE) THEN  { IF #3 }
        BEGIN
        Erase(1); Erase(23);
        WRITE('That''s already your square ',name,',');
        Erase(24);
        WRITE('move again: ');
        select_square
        END

      ELSE  { ELSE #3 }

        BEGIN  { Square must be empty, give it to player }
        cube[square] := player;
        Write('x');
        moved := TRUE
        END;

  END;    { WHILE }
END;    { Player_move }

(*************)
(* Show_move *)
(*************)

(* Position the cursor to the current square
   and write a 'o' for the machine *)

PROCEDURE Show_move;
BEGIN
  Goto_square;
  WRITE('o',#8)
END;  (* Show_move *)

(************)
(* Evaluate *)
(************)

(* This function evaluates a selected winning line by
   summing the value in each square *)

FUNCTION Evaluate(line:INTEGER):INTEGER;
VAR  sum,i : INTEGER;
BEGIN
  sum := 0;
  FOR i := 1 TO 4 DO
    sum := sum + cube[win_line[line,i]];
  Evaluate := sum
END;  (* Eval_pos *)

(***********)
(* Move_to *)
(***********)

(* Move to a square on selected line that contains sq_val *)

PROCEDURE Move_to(line,sq_val:INTEGER);
VAR  sqr : INTEGER;
BEGIN
  IF line MOD 4 < 2 THEN
    BEGIN  (* try moving to outside squares on exterior lines *)
      sqr := 1;
      REPEAT
        IF cube[win_line[line,sqr]]=sq_val THEN
          BEGIN
            square := win_line[line,sqr];
            cube[square] := machine;
            moved := TRUE
          END;
        sqr := sqr+3;
      UNTIL moved OR (sqr > 4);
    END  (* IF line *)
  ELSE
    BEGIN  (* try moving to inside squares on interior lines *)
      sqr := 2;
      REPEAT
        IF cube[win_line[line,sqr]]=sq_val THEN
          BEGIN
            square := win_line[line,sqr];
            cube[square] := machine;
            moved := TRUE
          END;
        sqr := sqr+1;
      UNTIL moved OR (sqr > 3)
    END;  (* ELSE line *)
END;  (* Move_to *)

(***************)
(* Pick_square *)
(***************)

(* Pick a square on winning line that could
   result in a future multi win *)

PROCEDURE Pick_square(line:INTEGER);
BEGIN  (* Pick_square *)
  Move_to(line,flagged);
  IF moved=FALSE THEN
    Move_to(line,empty);
  IF moved THEN
    BEGIN
      Erase(1);
      Write('Machine takes:');
      Show_move
   END
END;  (* Pick_square *)

(**********)
(* Unflag *)
(**********)

(* Restore all flagged squares to empty *)

PROCEDURE Unflag;
VAR  square : INTEGER;
BEGIN
  FOR square := 1 TO 64 DO
    IF cube[square]=flagged THEN
      cube[square]:=empty
END;  (* Unflag *)

(**************)
(* Multi_move *)
(**************)

(* Move to flagged square to take or block a multi win *)

PROCEDURE Multi_move(line:INTEGER);
VAR  sqr : INTEGER;
BEGIN
  sqr := 1;
  REPEAT
    IF cube[win_line[line,sqr]]=flagged THEN
      BEGIN
        square := win_line[line,sqr];
        cube[square]:=machine;
        moved := TRUE
      END;
    sqr := sqr+1
  UNTIL moved OR (sqr > 4);

  Erase(1);
  IF line_sum[line] < machine THEN
    BEGIN
      WRITE('Just in the nick of time! ');
      WRITE('Machine moves to:')
    END
  ELSE
    BEGIN
      WRITE('Let''s see you get out of this one! ');
      WRITE('Machine moves to:')
    END;
  Show_move
END;  (* Multi_move *)

(*************)
(* Multi_win *)
(*************)

(* Check for a move that could result in a win
   on more than one line *)

PROCEDURE Multi_win;
VAR  line,square : INTEGER;
BEGIN
  line := 1;
  REPEAT  (* Flag any possible machine multi win squares *)
    line_sum[line]:=Evaluate(line);
    IF line_sum[line] = machine + machine THEN
      FOR square := 1 TO 4 DO
        IF cube[win_line[line,square]]=empty THEN
          cube[win_line[line,square]]:=flagged;
  IF (line_sum[line] > machine + machine) AND
          (line_sum[line] < machine + machine + player) THEN
      Multi_move(line);  (* Move to multi win square *)
    line := line+1;
  UNTIL moved OR (line > 76);

  IF moved=FALSE THEN
    BEGIN
      FOR line := 1 to 76 DO  (* Evaluate new linesums *)
        line_sum[line] := Evaluate(line);
      line := 1;
      REPEAT  (* Check for possible future machine multi win *)
        IF (line_sum[line] = machine + flagged + flagged) OR
          (line_sum[line] = machine + flagged + flagged + flagged) THEN
            Pick_square(line);  (* Pick a square that could be a multi win *)
        line := line+1;
      UNTIL moved OR (line > 76);
    END;  (* IF moved *)

  Unflag;  (* restore flagged squares to empty *)

  IF moved=FALSE THEN
    BEGIN
      line := 1;
      REPEAT  (* Flag any possible player multi win squares *)
        line_sum[line]:=Evaluate(line);
        IF line_sum[line] = player + player THEN
          FOR square := 1 TO 4 DO
            IF cube[win_line[line,square]]=empty THEN
              cube[win_line[line,square]]:=flagged;
        IF (line_sum[line] > player + player) AND
            (line_sum[line] < player + player + player) THEN
              Multi_move(line);  (* Move to multi win square *)
        line := line+1;
      UNTIL moved OR (line > 76)
    END;  (* FOR line *)

  IF moved=FALSE THEN
    BEGIN
      FOR line := 1 to 76 DO  (* Evaluate new linesums *)
        line_sum[line] := Evaluate(line);
      line := 1;
      REPEAT  (* Check for possible future player multi win *)
        IF (line_sum[line] = player + flagged + flagged) OR
          (line_sum[line] = player + flagged + flagged + flagged) THEN
            Pick_square(line);  (* Pick a square that could be a multi win *)
        line := line+1;
      UNTIL moved OR (line > 76)
    END;  (* IF moved *)

END;  (* Multi_win *)

(**************)
(* Plane_move *)
(**************)

(* Move to flagged or empty square on selected plane *)

PROCEDURE Plane_move(plane:INTEGER);
VAR   line : INTEGER;
BEGIN
  line := 4*plane-3;
  REPEAT
    Move_to(line,flagged); (* try to move to flagged square *)
    IF moved=FALSE THEN
      Move_to(line,empty); (* try to move to an empty square *)
    line := line+1;
  UNTIL moved or (line=4*plane);

  IF moved THEN
    BEGIN
      Erase(1);
      Write('Machine will move to:');
      Show_move
    END
END;  (* Plane_move *)

(****************)
(* Check_planes *)
(****************)

(* Check for 4 player squares on a plane *)

PROCEDURE Check_planes;
VAR  line,sqr,plane,plane_sum : INTEGER;
BEGIN
  FOR plane := 1 to 18 DO  (* cube contains 18 planes *)
    BEGIN
      plane_sum:=0;
      FOR line := 4*plane-3 TO 4*plane DO
        FOR sqr := 1 TO 4 DO
          BEGIN
      plane_sum := plane_sum + cube[win_line[line,sqr]];
            IF moved=FALSE THEN
              IF (plane_sum > 4 * player) AND
                (plane_sum < 5 * player) THEN
                  Plane_move(plane)  (* move to square on plane *)
              ELSE
                IF (plane_sum > machine + 4 * player ) AND
                  (plane_sum < machine + 5 * player ) THEN
                    Plane_move(plane)  (* move to square on plane *)
          END  (* FOR sqr *)
    END  (* FOR plane *)
END;  (* Check_planes *)

(***************)
(* Take_square *)
(***************)

(* Locate the empty square on selected line and give
   it to the machine. Place square number in the
   global variable square *)

PROCEDURE Take_square(line:INTEGER);
VAR  sqr:INTEGER;
BEGIN
  FOR sqr := 1 to 4 DO
      IF cube[win_line[line,sqr]] = empty THEN
        square := win_line[line,sqr];
  cube[square] := machine;
END;  (* Take_square *)

(************)
(* Show_win *)
(************)

(* Move the cursor to each square on the selected winning line *)

PROCEDURE Show_win(line:INTEGER; winner:CHAR);
VAR  i,sqr:INTEGER;
BEGIN
  FOR i := 1 TO 4 DO
    BEGIN
      sqr := win_line[line,i];
      row := scrn_pos[sqr,1];
      column := scrn_pos[sqr,2];
      Gotoxy(column,row);
      WRITE(CHR(7));    (* bel *)
      Delay(1500);
      WRITE(winner)
    END
END;  (* Show_win *)

(****************)
(* Machine_move *)
(****************)

(* Process next machine move *)

PROCEDURE Machine_move;
VAR  line,move,sqr : INTEGER;
BEGIN
  moved := FALSE;  game_over := FALSE;
  line := 1;
  REPEAT  (* Check for player 4 in line *)
    line_sum[line] := Evaluate(line);
    IF line_sum[line] = 4 * player THEN
      BEGIN
        Gotoxy(1,1);
        WRITE('Congratulations! You win as follows:');
        Show_win(line,'X');
        game_over := TRUE
      END;
    line := line+1;
  UNTIL game_over OR (line > 76);

  IF game_over=FALSE THEN
    BEGIN
      line := 1;
      REPEAT  (* Check for machine 3 in line *)
        IF line_sum[line] = 3 * machine THEN
          BEGIN
            Take_square(line);
            Gotoxy(1,1);
            WRITE('Machine moves and Wins as follows:');
            Show_move;
            Delay(2000);
            Show_win(line,'O');
            game_over := TRUE
          END;
        line := line+1;
      UNTIL game_over OR (line > 76)
    END;

  IF game_over=FALSE THEN
    BEGIN
      line := 1;
      REPEAT  (* Check for player 3 in line *)
        IF line_sum[line] = 3 * player THEN
          BEGIN
            Take_square(line);
            Gotoxy(1,1);
            WRITE('Nice try. Machine moves to:');
            Show_move;
            moved := TRUE
          END;
        line := line+1;
      UNTIL moved OR (line > 76 )
    END;

  IF hard_game AND (moved = FALSE) AND (game_over = FALSE) THEN
    BEGIN
      Multi_win;  (* Check for multi line win *)
      IF moved=FALSE THEN
        Check_planes;  (* Check for 4 player squares on a plane *)
      Unflag  (* Restore flagged squares to empty *)
    END;  (* IF hard_game *)

  IF (moved = FALSE) AND (game_over = FALSE) THEN
    BEGIN  (* No priority moves are necessary, so pick the
        next empty square from mach_move table *)
      move := 1;
      REPEAT
        IF cube[mach_move[move]]=empty THEN
          BEGIN
            cube[mach_move[move]]:=machine;
            square := mach_move[move];
            gotoxy(1,1);
            WRITE('Machine moves to:');
            Show_move;
            moved := TRUE
          END;

        move := move+1
      UNTIL (move=17) OR (moved=TRUE);
    END;

  IF (moved = FALSE) AND (game_over = FALSE) THEN
        BEGIN  (* All the squares in the mach_move table are
                  full, so Pick any open square for machine *)
          sqr := 1;
          REPEAT
            IF cube[sqr]=empty THEN
              BEGIN
                cube[sqr]:=machine;
                square := sqr;
                Gotoxy(1,1);
                WRITE('Machine likes:');
                Show_move;
                moved:=TRUE
              END;

           sqr := sqr+1;
         UNTIL (sqr=65) OR (moved=TRUE);
       END;

  IF (moved = FALSE) AND (game_over = FALSE) THEN
    BEGIN  (* All squares are full, must be a tie game *)
    Gotoxy(1,1);
    WRITE('Tie game.')
    END

END;  (* Machine_move *)

(****************)
(* Main program *)
(****************)

LABEL End_of_game;
BEGIN    (* Main Program *)
  REPEAT
    Initialize;
    Disp_cube;
    square := 13;
    REPEAT
      Delay(1500);
      Player_move;
      Erase(23);
      Erase(24);
      Erase(1);
      IF aborted THEN GOTO End_of_game;
      Goto_square;
      Delay(1500);
      Machine_move;
    UNTIL game_over;

End_of_game:
    Erase(24); Erase(23);
    WRITE('Would you like to play again? ');
    READLN(reply);
  UNTIL reply[1] IN ['N','n'];

  Erase(24);
  Center('Good bye...')
END.    (* Qubic *)
