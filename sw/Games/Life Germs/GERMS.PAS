PROGRAM Germs;  { This program is a variation on LIFE.  Two separate organ-
                  isms grow and interact according to the rules set out in
                  the ComputeArray procedure.  Two arrays ( NewScreen and
                  OldScreen ) represent the current and the most recent
                  generation.  By comparing these two arrays, only those
                  locations which have changed are redrawn on the screen.
                  The program should be compiled on TURBO Pascal vers. 2
                  ( copyright Borland International Inc. ) which has a bug
                  free KeyPressed function.

                  The rules are simple.  Any occupied position lives if it
                  has 2 or 3 nieghbors.  It dies of loneliness if it has 0 or
                  1 neighbor and dies of overcrowding if there are 4 or more.
                  An empty position experiences a birth if it has exactly 3
                  neighbors.  The types of neighbors determine the type of
                  birth.  ( Friendly neighborhood! )

                  When determining the value of NeighborCount, a "+" organism
                  counts as 10 and a "~" as 1.  So NeighborCount has the form
                            ab where:
                                  a = the number of + neighbors
                                  b = the number of ~ neighbors}



CONST
  Blank       = ' ';
  Ch0         = ' ';    { represents absence of any organism }
  Ch1         = '~';    { represents first organism }
  Ch2         = '+';    { represents second organism }

TYPE
  SA          = ARRAY [1..80,1..24] OF INTEGER;

VAR
  NewScreen,            { array of current generation }
  OldScreen   : SA;     { array of most recent generation }
  EndOfGame,
  Done        : Boolean;
  Ch          : Char;
  Generation  : Integer;



{===========================================================================}



  PROCEDURE InitScreen;  { draw screen borders }

  VAR
    I,
    J         : Integer;

  BEGIN
    ClrScr;
    FOR I:=1 TO 40 DO
      Write('. ');
    FOR I:=2 TO 22 DO
      BEGIN
        GOTOXY(1,I);
        Write('.');
        GOTOXY(79,I);
        Write('.')
      END;  { FOR }
    GOTOXY(1,23);
    FOR I:= 1 TO 40 DO
      Write('. ')
  END;  { InitScreen }


  PROCEDURE PrintCommands;

    BEGIN
      GOTOXY(1,24);
      Write(' ':11,'(L)eft (R)ight (U)p (D)own (~) (+) (B)lank (F)inished')
    END;  { PrintCommands }


  PROCEDURE PrintDirections;

  VAR
    I    : Integer;

    BEGIN
      ClrScr;
      GOTOXY(1,4);
      Writeln(' ':10,'  * *     * * * *    * * *     *       *      * *');
      Writeln(' ':10,'*     *   *          *     *   * *   * *    *     *');
      Writeln(' ':10,'*         * * *      * * * *   *   *   *      *');
      Writeln(' ':10,'*   * *   *          *   *     *       *        *');
      Writeln(' ':10,'*     *   *          *     *   *       *    *     *');
      Writeln(' ':10,'  * *     * * * *    *     *   *       *      * *');
      GOTOXY(7,14);
      Write('Welcome to germs.  This program simulates the interaction and');
      Writeln;
      Write(Blank:6, 'growth of two different micro-organisms, the ~ ');
      Writeln('and the +.  Use');
      Write(Blank:6, 'the "L", "R", "U", and "D" keys to move the ');
      Writeln('cursor.  The "+"');
      Write(Blank:6, 'and "~" keys will deposit germs under the ');
      Writeln('cursor.  the "B"');
      Write(Blank:6, 'key will allow you to blank the cell under ');
      Writeln('the cursor.  When');
      Write(Blank:6, 'the initial population is to your liking, ');
      Writeln('press "F" to begin.');
      GOTOXY(40,24);
      Write('< PRESS ANY KEY TO CONTINUE >  ');
      Read(Kbd, Ch)
    END;  { PrintDirections }


  PROCEDURE InitArray (VAR OldScr, NewScr: SA);  { initialize both arrays }

  VAR
    I,
    J    : Integer;

  BEGIN
    FOR I:=1 TO 80 DO  { initialize arrays to zero }
      FOR J:=1 TO 24 DO
        BEGIN
          OldScr[I,J]:=0;
          NewScr[I,J]:=0
        END;  { FOR }
    InitScreen;
  END;  { InitArray }


  PROCEDURE SetGerms (VAR OldScr, NewScr: SA);  { allow placement of germs }

  VAR
    I,
    J     : Integer;

  BEGIN
    PrintCommands;
    I:=40; J:=12;  { position cursor in center of screen }
    GOTOXY(I,J);
    REPEAT
      Read(Kbd, Ch);
      CASE UpCase(Ch) OF
        'L'      : IF I>2 THEN I:=I-1;   { accept cursor movements from    }
        'R'      : IF I<78 THEN I:=I+1;  { user.  conditionals prevent user}
        'U'      : IF J>2 THEN J:=J-1;   { from moving cursor off screen   }
        'D'      : IF J<22 THEN J:=J+1;
        '~', '`' : BEGIN                 { deposit "~" organism }
                     NewScr[I,J]:=1;     { allow upper or lower case }
                     Write(CH1)
                   END;
        '+', '=' : BEGIN                 { deposit "+" organism }
                     NewScr[I,J]:=2;
                     Write(CH2)
                   END;
        'B'      : BEGIN                 { remove organism under cursor }
                     NewScr[I,J]:=0;
                     Write(CH0)
                   END
      END;  { CASE }
      GOTOXY(I,J)
    UNTIL UpCase(Ch)='F';
    OldScr:=NewScr;
    GOTOXY(1,24);                        { erase command line }
    Write(Blank:79);
    GOTOXY(25,24);
    Write('(P)ause (R)esume (C)hange (Q)uit')
  END;  { SetGerms }


  PROCEDURE PrintScreen (VAR OldScr: SA;      { print new generation }
                         VAR Gen   : Integer; { generation counter }
                             NewScr: SA);

  VAR
    I,
    J    : Integer;

  BEGIN
    FOR I:= 2 TO 79 DO
      FOR J:= 2 TO 22 DO
        IF NewScr[I,J]<>OldScr[I,J] THEN   { redraw location I,J only if   }
          BEGIN                            { it's value has changed        }
            GOTOXY(I,J);
            CASE NewScr[I,J] OF
              0 : Write(Ch0);  { blank }
              1 : Write(Ch1);  { ~ }
              2 : Write(Ch2)   { + }
            END;  { CASE }
            OldScr[I,J]:=NewScr[I,J]       { update OldScreen }
          END;  { IF }
    Gen:=Gen+1; { update generation counter }
    GOTOXY(1,24);
    Write('GENERATION = ', Gen)
  END;  { PrintScreen }


  PROCEDURE ComputeArray(OldScr: SA; VAR NewScr: SA);

  VAR
    I,
    J,
    Column,
    Row,
    NeighborCount : Integer;  { reflects number of immediate neighbors }

  BEGIN
    FOR I:=2 TO 78 DO
      FOR J:=2 TO 22 DO
        BEGIN  { survival rules }
          NeighborCount:=0;
          FOR Column:=(I-1) TO (I+1) DO  { examine closest neighbors }
            FOR Row:=(J-1) TO (J+1) DO
              CASE OldScr[Column, Row] OF
                1 : NeighborCount:=NeighborCount+1;   { count ~ as 1 }
                2 : NeighborCount:=NeighborCount+10;  { count + as 10 }
              END;  { CASE }
          CASE OldScr[I,J] OF
            1 : NeighborCount:=NeighborCount-1;   { should not have counted }
            2 : NeighborCount:=NeighborCount-10;  { OldScr[I,J] as neighbor }
          END;  { CASE }
          IF OldScr[I,J] IN [1,2]    { check occupied positions for changes }
            THEN
              CASE NeighborCount OF
                0, 1, 10     : NewScr[I,J]:=0;  { zero or one neighbor }
                { 11         : no change - one neighbor of each type }
                2, 3, 12     : NewScr[I,J]:=1;  { majority of ~ neighbors }
                20, 21, 30   : NewScr[I,J]:=2;  { majority of + neighbors }
                4..8,
                13..17,
                22..26,
                31..80       : NewScr[I,J]:=0;  { overpopulation..position dies }
              END  { CASE }
            ELSE  { check empty positions for births }
              CASE NeighborCount OF
                3, 12        : NewScr[I,J]:=1;  { majority of ~ neighbors }
                21, 30       : NewScr[I,J]:=2;  { majority of + neighbors }
              END  { CASE }
        END  { survival rules }
  END;  { ComputeArray }


  PROCEDURE SeeIfDone (VAR Finished: Boolean);

  VAR
    Response  : Char;

  BEGIN
    GOTOXY(1,24);
    Write(Blank:27,'ANOTHER GAME?  (Y or N)',Blank:27);
    GOTOXY(1,23);
    Writeln;
    Read(Kbd, Response);
    CASE UpCase(Response) OF
      'N' : Finished:=True;
      'Y' : Finished:=False
    END  { CASE }
  END;  { SeeIfDone }




{===========================================================================}


BEGIN  { MAIN PROGRAM }
  PrintDirections;
  REPEAT
    Generation:=0; EndOfGame:=false;
    InitArray(OldScreen, NewScreen);
    SetGerms(OldScreen, NewScreen);
    PrintScreen(OldScreen, Generation, NewScreen);
    WHILE NOT EndOfGame DO
      BEGIN
        IF KeyPressed
          THEN
            BEGIN
              Read(Kbd, Ch);
              CASE UpCase(Ch) OF
                'P' : BEGIN
                        Read(Kbd, Ch);
                        CASE UpCase(Ch) OF
                          'C' : SetGerms(NewScreen, OldScreen);
                          'Q' : EndOfGame:=true;
                        END;  { CASE }
                      END;  { 'P' }
                'C' : SetGerms(NewScreen, OldScreen);
                'Q' : EndOfGame:=true;
              END  { CASE }
          END;  { IF-THEN }
        ComputeArray(OldScreen, NewScreen);
        PrintScreen(OldScreen, Generation, NewScreen);
      END;  { WHILE }
    SeeIfDone(Done);
  UNTIL Done;
  ClrScr
END.  { MAIN PROGRAM }
