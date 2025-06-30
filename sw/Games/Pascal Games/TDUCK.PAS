
PROGRAM DUCK;

CONST
   MAX_SHOTS = 4; (* MAXIMUM SHOTS IN ONE DIRECTION *)

VAR
   SCREEN : ARRAY[0..31,1..128] OF CHAR ABSOLUTE $0F000;
   ALL_DONE : BOOLEAN; (* ALL DONE PLAYING *)
   B_COUNT : INTEGER; (* REMAINING SHOTS *)
   CONCHAR : CHAR; (* Y OR N FOR DIRECTIONS *)
   CUR_DIR : BYTE; (* CURRENT DIRECTION *)
   DUCK_COL : INTEGER; (* CURRENT DUCK COLUMN *)
   DUCK_ROW : INTEGER; (* CURRENT DUCK ROW *)
   DIR_CTR : BYTE; (* NUMBER OF SHOTS IN CURRENT DIRECTION *)
   DUCK_DONE : BOOLEAN; (* DONE WITH CURRENT DUCK *)
   FWD : BOOLEAN; (* DUCK MOVING FORWARD *)
   FIRST : BOOLEAN; (* FIRST GAME *)
   GAME_END : BOOLEAN; (* END OF GAME *)
   OLD_WIDTH : BYTE; (* 0=52,3=80,1=104 *)
   POINTS : INTEGER; (* CURRENT SCORE *)
   I : INTEGER; (* LOOP INDEX *)
   TIME1 : INTEGER; (* FOR EXPLOSION *)
   TIME2 : INTEGER; (* FOR DUCKS *)
   TIME3 : INTEGER; (* FOR BOMBS AND BULLETS *)
   WIDTH : BYTE ABSOLUTE $E1A5;

PROCEDURE TREECOUNT(VAR TREECOUNT_L,TREECOUNT_R : INTEGER);

VAR
  I : INTEGER;

BEGIN (* TREECOUNT *)
TREECOUNT_L := 0;
TREECOUNT_R := 0;

(* COUNT TREES ON LEFT *)

FOR I := 1 TO 11 DO
   IF SCREEN[21,2*I-1] = CHAR(0) THEN
      TREECOUNT_L := TREECOUNT_L + 1;

(* COUNT TREES ON RIGHT *)

FOR I := 15 TO 26 DO
  IF SCREEN[21,2*I] = CHAR(0) THEN
     TREECOUNT_R := TREECOUNT_R + 1;

END;  (*  TREECOUNT *)

FUNCTION TREES : BOOLEAN;

VAR
   COUNT_L : INTEGER;
   COUNT_R : INTEGER;

BEGIN (* TREES *)

TREECOUNT(COUNT_L,COUNT_R);

TREES := TRUE;

(* IF TREECOUNT LOW SET DIRECTION OF DIVEBOMBER *)

IF (COUNT_R < 6) AND
   (COUNT_L >=6) THEN BEGIN
      FWD := FALSE;
      DUCK_COL := 52;
      TREES := FALSE
   END

ELSE IF (COUNT_L < 6) AND
   (COUNT_R >= 6) THEN BEGIN
      FWD := TRUE;
      DUCK_COL := 1;
      TREES := FALSE
   END

 ELSE IF (COUNT_L < 6) AND
   (COUNT_R < 6) THEN TREES := FALSE

END; (* TREES *)

PROCEDURE BLIND;

BEGIN (* BLIND *)

SCREEN[20,24] := CHAR(10);
SCREEN[20,25] := CHAR(150);
SCREEN[20,26] := CHAR(150);
SCREEN[20,27] := CHAR(8);
SCREEN[21,25] := CHAR(128);
SCREEN[21,26] := CHAR(128);
SCREEN[22,25] := CHAR(150);
SCREEN[22,26] := CHAR(150);
SCREEN[21,24] := CHAR(128);
SCREEN[21,27] := CHAR(128);
SCREEN[22,24] := CHAR(150);
SCREEN[22,27] := CHAR(150);

END; (* BLIND *)

PROCEDURE INIT;

VAR
   SPEED : BYTE; (* FOR DUCK SPEED *)

BEGIN

CLRSCR;
TIME1 := 50;
TIME3 := 10;

IF FIRST THEN BEGIN
   GOTOXY(6,6);
   WRITE('Translated into Pascal by Charles Hansen');
   GOTOXY(6,8);
   WRITE('from the program by Peter H. Kelley');
   GOTOXY(6,10);
   WRITE('in The Portable Companion(April/May,1983)');
   GOTOXY(6,12);
   WRITE('Do you want directions(Y/N): ');
   READ(CONCHAR);
   IF UPCASE(CONCHAR)='Y' THEN BEGIN
      CLRSCR;
      GOTOXY(1,4);
      WRITE('Ducks will fly back and forth across');
      GOTOXY(1,6);
      WRITE('the screen at random heights.  You can');
      GOTOXY(1,8);
      WRITE('fire at the ducks by pressing number keys.');
      GOTOXY(1,10);
      WRITE('1 fires almost horizontally to the left');
      GOTOXY(1,12);
      WRITE('and 5 fires vertically.  9 fires almost');
      GOTOXY(1,14);
      WRITE('horizontally to the right.  Greater angles');
      GOTOXY(1,16);
      WRITE('score more points.');
      GOTOXY(1,19);
      WRITE('Press RETURN to continue.');
      READ(CONCHAR)
   END
END; (* IF FIRST GAME *)

CLRSCR;
GOTOXY(5,10);
WRITE('Enter a number to set DUCK speed');
GOTOXY(9,12);
WRITE('1 is slow  -  5 is fast');
GOTOXY(11,14);
WRITE('*****   Speed: ');
{$I-}
READLN(SPEED);
{$I+}
IF (SPEED IN [1..5]) AND (IORESULT=0) THEN
   TIME2 := 42 - 6*SPEED
ELSE
   TIME2 := 30;

CLRSCR; (* CLEAR SCREEN *)
GOTOXY(1,25); (* MOVE CURSOR OFF SCREEN *)

BLIND;

(* BUILD TREES *)

FOR I := 1 TO 11 DO
   SCREEN[21,2*I-1] := CHAR(0);

FOR I := 1 TO 11  DO
   SCREEN[22,2*I-1] :=  CHAR(11);

FOR I := 15 TO 26 DO
   SCREEN[21,2*I] := CHAR(0);

FOR I := 15 TO 26 DO
   SCREEN[22,2*I] := CHAR(11);

FOR I := 1 TO 52 DO
   SCREEN[23,I] := CHAR(150);

CUR_DIR := 5;
DIR_CTR := 0;
B_COUNT := 100;
DUCK_COL := 1;
POINTS := 0;
DUCK_DONE := FALSE;
FWD := TRUE;
GAME_END := FALSE;
DUCK_ROW := RANDOM(19)

END;

PROCEDURE EXPLOSION;

BEGIN

   SCREEN[20,24] := CHAR(10);
   SCREEN[21,25] := CHAR(150);
   SCREEN[21,26] := CHAR(150);
   SCREEN[20,27] := CHAR(8);
   SCREEN[23,25] := CHAR(32);
   SCREEN[23,26] := CHAR(32);
   SCREEN[22,24] := CHAR(32);
   SCREEN[22,27] := CHAR(32);
   SCREEN[23,27] := CHAR(10);
   SCREEN[23,24] := CHAR(8);

   DELAY(TIME1);

   SCREEN[19,23] := CHAR(10);
   SCREEN[20,24] := CHAR(150);
   SCREEN[20,27] := CHAR(150);
   SCREEN[19,28] := CHAR(8);
   SCREEN[22,25] := CHAR(32);
   SCREEN[22,26] := CHAR(32);

   DELAY(TIME1);

   SCREEN[18,22] := CHAR(10);
   SCREEN[19,23] := CHAR(150);
   SCREEN[19,28] := CHAR(150);
   SCREEN[18,29] := CHAR(8);
   SCREEN[21,25] := CHAR(32);
   SCREEN[21,26] := CHAR(32);
   SCREEN[21,24] := CHAR(32);
   SCREEN[21,27] := CHAR(32);

   DELAY(TIME1);

   SCREEN[16,20] := CHAR(10);
   SCREEN[18,22] := CHAR(150);
   SCREEN[16,30] := CHAR(8);
   SCREEN[18,28] := CHAR(150);
   SCREEN[19,27] := CHAR(150);
   SCREEN[20,24] := CHAR(32);
   SCREEN[20,27] := CHAR(32);
   SCREEN[19,28] := CHAR(32);
   SCREEN[18,29] := CHAR(32);


   DELAY(TIME1);

   SCREEN[14,18] := CHAR(10);
   SCREEN[16,20] := CHAR(150);
   SCREEN[16,30] := CHAR(150);
   SCREEN[14,32] := CHAR(8);
   SCREEN[19,23] := CHAR(32);
   SCREEN[19,27] := CHAR(32);
   SCREEN[20,25] := CHAR(32);


   DELAY(TIME1);


   SCREEN[15,17] := CHAR(21);
   SCREEN[17,19] := CHAR(150);
   SCREEN[19,21] := CHAR(150);
   SCREEN[15,33] := CHAR(25);
   SCREEN[17,31] := CHAR(150);
   SCREEN[19,29] := CHAR(150);
   SCREEN[14,18] := CHAR(32);
   SCREEN[16,20] := CHAR(32);
   SCREEN[18,22] := CHAR(32);
   SCREEN[18,28] := CHAR(32);
   SCREEN[16,30] := CHAR(32);
   SCREEN[14,32] := CHAR(32);


   DELAY(TIME1);

   SCREEN[16,16] := CHAR(25);
   SCREEN[18,18] := CHAR(150);
   SCREEN[20,20] := CHAR(150);
   SCREEN[20,30] := CHAR(150);
   SCREEN[18,32] := CHAR(150);
   SCREEN[16,34] := CHAR(21);
   SCREEN[15,17] := CHAR(32);
   SCREEN[17,19] := CHAR(32);
   SCREEN[19,21] := CHAR(32);
   SCREEN[15,33] := CHAR(32);
   SCREEN[17,31] := CHAR(32);
   SCREEN[19,29] := CHAR(32);


   DELAY(TIME1);

   SCREEN[17,15] := CHAR(8);
   SCREEN[19,17] := CHAR(150);
   SCREEN[21,19] := CHAR(150);
   SCREEN[21,31] := CHAR(150);
   SCREEN[19,33] := CHAR(150);
   SCREEN[17,35] := CHAR(10);
   SCREEN[16,16] := CHAR(32);
   SCREEN[18,18] := CHAR(32);
   SCREEN[20,20] := CHAR(32);
   SCREEN[20,30] := CHAR(32);
   SCREEN[18,32] := CHAR(32);
   SCREEN[16,34] := CHAR(32);


   DELAY(TIME1);

   SCREEN[18,14] := CHAR(10);
   SCREEN[22,18] := CHAR(150);
   SCREEN[20,16] := CHAR(150);
   SCREEN[22,31] := CHAR(150);
   SCREEN[20,34] := CHAR(150);
   SCREEN[18,36] := CHAR(8);
   SCREEN[17,15] := CHAR(32);
   SCREEN[19,17] := CHAR(32);
   SCREEN[21,19] := CHAR(32);
   SCREEN[21,31] := CHAR(32);
   SCREEN[19,33] := CHAR(32);
   SCREEN[17,35] := CHAR(32);

   DELAY(TIME1);

   SCREEN[18,14] := CHAR(32);
   SCREEN[19,13] := CHAR(21);
   SCREEN[20,16] := CHAR(32);
   SCREEN[21,15] := CHAR(150);
   SCREEN[22,18] := CHAR(32);
   SCREEN[20,34] := CHAR(32);
   SCREEN[21,35] := CHAR(150);
   SCREEN[18,36] := CHAR(32);
   SCREEN[19,37] := CHAR(25);


   DELAY(TIME1);

   SCREEN[19,13] := CHAR(32);
   SCREEN[20,12] := CHAR(25);
   SCREEN[21,15] := CHAR(32);
   SCREEN[22,14] := CHAR(150);
   SCREEN[21,35] := CHAR(32);
   SCREEN[22,35] := CHAR(150);
   SCREEN[19,37] := CHAR(32);
   SCREEN[20,38] := CHAR(21);

   DELAY(TIME1);

   SCREEN[21,12] := CHAR(8);
   SCREEN[20,12] := CHAR(32);
   SCREEN[20,38] := CHAR(32);
   SCREEN[21,39] := CHAR(10);

   DELAY(TIME1);

   SCREEN[22,12] := CHAR(8);
   SCREEN[21,12] := CHAR(32);
   SCREEN[22,39] := CHAR(10);
   SCREEN[21,39] := CHAR(32);

END; (* EXPLOSION *)


   PROCEDURE BOMB(B_ROW, B_COL : BYTE);

      VAR
         BDONE : BOOLEAN; (* DONE WITH THIS BOMB *)

      BEGIN (* BOMB *)

      B_ROW := B_ROW + 1;
      BDONE := FALSE;

      REPEAT (* UNTIL BOMB HITS *)

         DELAY(TIME3);
         SCREEN[B_ROW,B_COL] := CHAR(32);
         B_ROW := B_ROW + 1;
         SCREEN[B_ROW,B_COL] := CHAR(13);

         IF B_ROW = 22 THEN (* BOMB HIT *)
            IF B_COL = 26 THEN (* AMMO HIT *) BEGIN
               EXPLOSION;
               GAME_END := TRUE;
               DUCK_DONE := TRUE;
               BDONE := TRUE;
            END (* AMMO HIT *)

            ELSE (* TREE HIT *) BEGIN
               SCREEN[B_ROW,B_COL] := CHAR(32);
               BDONE := TRUE;
            END; (* TREE HIT *)
      UNTIL BDONE;
      END; (* BOMB *)

   PROCEDURE FIRE(DIR : BYTE);

   VAR
      BLT_COL : INTEGER; (* BULLET COLUMN *)
      BLT_ROW : INTEGER; (* BULLET COLUMN *)
      FACTOR : INTEGER; (* ADJUSTMENT FACTOR FOR COLUMN DIRECTION *)
      HIT : BOOLEAN; (* DUCK WAS HIT WHEN TRUE *)
      MISS : BOOLEAN; (* BECOMES TRUE IN TOP ROW *)

   BEGIN (* FIRE *)

   HIT := FALSE;
   MISS := FALSE;

   IF DIR = CUR_DIR THEN (* COUNT REPEAT SHOT *)
      DIR_CTR := DIR_CTR + 1
   ELSE BEGIN (* NEW DIRECTION *)
      DIR_CTR := 1;
      CUR_DIR := DIR
   END;

   IF DIR_CTR <= MAX_SHOTS THEN BEGIN
     B_COUNT := B_COUNT - 1;
     GOTOXY(1,24);
     WRITE(' ',B_COUNT,' SHOTS REMAINING ');
     FACTOR := 6 * DIR - 30;
     BLT_ROW := 19;
     BLT_COL := 26;

     REPEAT (* UNTIL HIT OR MISS *)

        (* MOVE BULLET *)

        DELAY(TIME3);
        SCREEN[BLT_ROW,BLT_COL] := CHAR(32);
        BLT_ROW := BLT_ROW - 1;
        BLT_COL := 26 + FACTOR*(19-BLT_ROW) DIV 10;
        IF (BLT_ROW > -1) AND (BLT_COL > 0) AND (BLT_COL < 53) THEN
           SCREEN[BLT_ROW,BLT_COL] := '*'
        ELSE
           MISS := TRUE;

        (* CHECK FOR HIT *)

        IF BLT_ROW = DUCK_ROW THEN BEGIN
           IF BLT_COL = DUCK_COL THEN BEGIN

           (* COUNT HIT - GET NEW DUCK *)

              POINTS := POINTS + ABS(DIR - 5)*10 + 10;
              GOTOXY(35,24);
              WRITE(' SCORE: ',POINTS,' ');
              HIT := TRUE;
              SCREEN[BLT_ROW,BLT_COL] := CHAR(32);
              DUCK_DONE := TRUE;
              IF FWD THEN
                 DUCK_COL := 52
              ELSE
                 DUCK_COL := 1;
              WRITE(CHAR(7));
              FWD := NOT FWD;
              DUCK_ROW := RANDOM(22)

           END (* IF BLT_COL *)

        END (* IF BLT_ROW *)


      UNTIL (HIT OR MISS);

   IF (MISS) AND (DUCK_ROW < 20) THEN
      BOMB(DUCK_ROW,DUCK_COL);

   END; (* IF DIR_CTR *)

   END; (* FIRE *)

PROCEDURE MOVEDUCK;

VAR
   DIR : INTEGER; (* DIRECTION FOR PROCEDURE FIRE *)

BEGIN (* MOVEDUCK *)

DIR := 0;
DELAY(TIME2);

SCREEN[DUCK_ROW,DUCK_COL] := CHAR(32);

IF ((FWD) AND (DUCK_COL >= 52)) OR ((NOT FWD) AND (DUCK_COL <= 1)) THEN BEGIN

(* NEW DUCK *)

   BLIND;
   DUCK_DONE := TRUE;
   DUCK_ROW := RANDOM(22);
   FWD := NOT FWD
END
ELSE BEGIN

(* MOVE THE DUCK *)

   IF FWD THEN BEGIN
      DUCK_COL := DUCK_COL + 1;
      SCREEN[DUCK_ROW,DUCK_COL] := CHAR(8)
   END
   ELSE BEGIN
      DUCK_COL := DUCK_COL - 1;
      SCREEN[DUCK_ROW,DUCK_COL] := CHAR(10)
   END;

   IF KEYPRESSED THEN BEGIN
      DIR := BIOS(2) - INTEGER('0');
      IF (DIR IN [1..9]) AND (B_COUNT > 0) THEN
         FIRE(DIR)
   END

END(* ELSE - MOVEDUCK *)

END; (* PROCEDURE MOVEDUCK *)

PROCEDURE DBOMBER;

VAR
   DB_DONE : BOOLEAN; (* DONE WITH DIVE BOMBER *)

BEGIN (* DBOMBER *)

DB_DONE := FALSE;

REPEAT  (* UNTIL END OF GAME OR END OF DIVEBOMBER *)
   DELAY(TIME2);
   IF DUCK_COL = 26 THEN BEGIN
      IF DUCK_ROW = 21 THEN BEGIN
         EXPLOSION;
         GAME_END := TRUE
      END (* IF DUCK_ROW *)
      ELSE BEGIN
         DUCK_ROW := RANDOM (21);
         IF FWD THEN
            DUCK_COL := 52
         ELSE
            DUCK_COL := 1;
         FWD := NOT FWD;
         DB_DONE := TRUE
      END (* ELSE *)

   END (* IF DUCK_COL *)
   ELSE
      MOVEDUCK

UNTIL GAME_END OR DB_DONE;

END; (* DBOMBER *)


PROCEDURE FINISH;

VAR
   ACHAR : CHAR;
   COUNT_L : INTEGER;
   COUNT_R : INTEGER;

BEGIN

TREECOUNT(COUNT_L,COUNT_R);

GOTOXY(3,12);

IF POINTS > 0 THEN BEGIN
   WRITE('YOU HAD ',COUNT_L+COUNT_R,' TREES REMAINING WORTH ');
   WRITE((COUNT_L+COUNT_R)*5,' POINTS');
   GOTOXY(4,14);
   WRITE('*****  YOUR TOTAL SCORE WAS ',POINTS+5*(COUNT_L+COUNT_R),'  *****');
   GOTOXY(1,25)
END (* IF POINTS *)
ELSE BEGIN
   WRITELN('*****   SCORE ZERO - YOU BOMBED OUT !!!   *****');
   GOTOXY(1,25)
END;

FIRST := FALSE;
DELAY(3000);
CLRSCR;
GOTOXY(2,12);
WRITE(' *** PLAY ANOTHER GAME ??(Y/N): ');
READ(ACHAR);
IF (ACHAR = 'Y') OR (ACHAR = 'y') THEN
   ALL_DONE := FALSE
ELSE
   ALL_DONE := TRUE

END; (* FINISH *)

BEGIN (*DUCK*)

(* CHANGE TO 52 COLUMNS - SAVING OLD WIDTH *)

OLD_WIDTH := WIDTH;
WIDTH := 0;
INLINE
($CD/$E4E5); (* CALL BIOS AT THIS ADDRESS *)

FIRST := TRUE;

REPEAT

INIT;

WHILE (B_COUNT > 0) AND (NOT GAME_END) DO BEGIN
   DUCK_DONE := FALSE;

   (* IF DIVEBOMBER *)

   IF (DUCK_ROW >= 20) THEN BEGIN

      IF TREES THEN (* TREES OK *)
         DUCK_ROW := RANDOM(22)
      ELSE (* LOW ON TREES *)
         DBOMBER

   END (* IF DUCK_ROW *)
   ELSE (* NOT DIVE BOMBER *)

      WHILE NOT DUCK_DONE DO
         MOVEDUCK
END;(* WHILE *)

FINISH;

UNTIL ALL_DONE;

(* CHANGE TO OLD WIDTH *)

WIDTH := OLD_WIDTH;
INLINE
($CD/$E4E5); (* CALL BIOS AT THIS ADDRESS *)

CLRSCR;

END.