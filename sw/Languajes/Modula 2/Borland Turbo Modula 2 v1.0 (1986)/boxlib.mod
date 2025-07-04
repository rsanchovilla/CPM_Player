IMPLEMENTATION MODULE BoxLib;

TYPE
	graphics = (UR, LR, UL, LL, UH, LH, RV, LV);
	gchars = array [UR..LV] of char;
VAR
	wideset : gchars;
	narrowset : gchars;
	currentset : gchars;

(* Internal Support Routines *)
PROCEDURE DrawUpperHorizontal;
BEGIN
	writechar (currentset[UH]);
END DrawUpperHorizontal;

PROCEDURE DrawLowerHorizontal;
BEGIN
	writechar (currentset[LH]);
END DrawLowerHorizontal;

PROCEDURE DrawLeftVertical;
BEGIN
	writechar (currentset[LV]);
END DrawLeftVertical;

PROCEDURE DrawRightVertical;
BEGIN
	writechar (currentset[RV]);
END DrawRightVertical;

PROCEDURE DrawUR;
BEGIN
	writechar (currentset[UR]);
END DrawUR;

PROCEDURE DrawLR;
BEGIN
	writechar (currentset[LR]);
END DrawLR;

PROCEDURE DrawUL;
BEGIN
	writechar (currentset[UL]);
END DrawUL;

PROCEDURE DrawLL;
BEGIN
	writechar (currentset[LL]);
END DrawLL;

PROCEDURE GraphicsOn;
BEGIN
	writechar (33C);
	writechar ('$');
END GraphicsOn;

PROCEDURE GraphicsOff;
BEGIN
	writechar (33C);
	writechar ('%');
END GraphicsOff;

(* Externally-Accessed Routines *)
PROCEDURE InitBox;
var
	i : graphics;
	wide, narr : char;
BEGIN
	for i := UR to LV do
		case i of
		|	UR :	wide := ']';
				narr := 'G';
		|	LR :	wide := '^';
				narr := 'H';
		|	UL :	wide := '\';
				narr := 'F';
		|	LL :	wide := '[';
				narr := 'E';
		|	UH :	wide := 'Z';
				narr := 'K';
		|	LH :	wide := 'X';
				narr := 'K';
		|	RV :	wide := 'W';
				narr := 'J';
		|	LV :	wide := 'Y';
				narr := 'J';
		END;
		wideset[i] := wide;
		narrowset[i] := narr;
		currentset[i] := narr;
	END;
END InitBox;

PROCEDURE SetBox (selection : boxtype);
var
	i : graphics;
BEGIN
	for i := UR to LV do
		if selection = WIDE then
			currentset[i] := wideset[i];
		else
			currentset[i] := narrowset[i];
		END;
	END;
END SetBox;

PROCEDURE Clear;
BEGIN
	clearscreen;
END Clear;

PROCEDURE At (row, column : integer);
BEGIN
	gotoxy (column, row);
END At;

PROCEDURE DrawBox (length, width : integer; origin : coordinate);
var
	i : integer;
BEGIN
	GraphicsOn;
	gotoxy (origin.column, origin.row);
	DrawUL;
	for i := 2 to width-1 do DrawUpperHorizontal; END;
	DrawUR;
	for i := 2 to length-1 do
		gotoxy (origin.column, origin.row + i - 1);
		DrawLeftVertical;
		gotoxy (origin.column + width - 1, origin.row + i - 1);
		DrawRightVertical;
		END;
	gotoxy (origin.column, origin.row + length - 1);
	DrawLL;
	for i := 2 to width-1 do DrawLowerHorizontal; END;
	DrawLR;
	GraphicsOff;
END DrawBox;

END boxlib.

                                                                                                                  