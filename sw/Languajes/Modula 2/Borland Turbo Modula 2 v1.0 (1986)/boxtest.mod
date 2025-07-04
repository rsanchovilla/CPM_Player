MODULE boxtest;

from boxlib import coordinate, boxtype, InitBox, SetBox, DrawBox, Clear, At;
from terminal import writestring, writeln, readchar;

procedure Pause;
var
	dummy : char;
begin
	writestring ('Strike any key when ready');
	readchar (dummy);
	writeln;
end Pause;

procedure DrawBoxes;
const
	minlen = 22;
	minwidth = 62;
var
	i : integer;
	position : coordinate;
begin
	for i := 1 to 5 do
		position.column := 11 + 4*i;
		position.row := 2*i;
		DrawBox (minlen-4*i, minwidth-8*i, position);
		end;
end DrawBoxes;

BEGIN
	InitBox;		(* Initialize for Box Processing *)
	SetBox (NARROW);	(* Edges of Box are NARROW or WIDE *)
	Clear;			(* Clear Screen *)
	DrawBoxes;		(* Draw a Bunch of Boxes *)
	At (22,1);		(* Position Cursor for Little Finish *)
	Pause;			(* Wait for User Input *)
	Clear;			(* Clear Screen *)
	SetBox (WIDE);		(* Edges of Box are NARROW or WIDE *)
	DrawBoxes;		(* Draw a Bunch of Boxes *)
	At (22,1);		(* Position Cursor for Big Finish *)
	Pause;			(* Wait for User Input *)
	At (22,1);
END boxtest.
                                                                               