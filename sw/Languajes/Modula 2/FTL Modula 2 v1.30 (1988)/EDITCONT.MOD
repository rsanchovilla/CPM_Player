IMPLEMENTATION MODULE EditControl;

(*	Editor control - data areas for file and routines which actually
	perform edit functions by calling makeedit to edit the file and
	editdisp to change the screen*)

FROM MakeEdits IMPORT InsChars,DelChars,Retrline,BackOneChar,ForwardOneChar,
		GetCurrentChar,GetPosition,SetPosition,ReadNextChar,FindString,
		LabelOp;
FROM EditDisplay IMPORT DisplayFile,ErrorMessage,Windows,LinesPerWindow;
FROM ScreenIO IMPORT Edits,DelChar,DelLine,InsChar,InsLine,DelEol,MoveUp,
			MoveDown,MoveLeft,MoveRight,Gotoxy,ClearScreen,
			ScreenControl,ScrollWindowUp,ScrollWindowDown,
			ScreenWidth,ScreenDepth;
FROM IntLogic IMPORT IAND;	
FROM	SYSTEM IMPORT ADR;
CONST	CR=0dx;
	TAB=09x;
	LF=0ax;
	EOF=1ax;
(*	A remark on the use of LinePos and curx

	LinePos always points to the number of the character within the
	text line. It need not be the same as the position on the
	screen because of the use of tab characters*)
TYPE	PEditFile=POINTER TO EditFile;
VAR	i:INTEGER;
	c:CARDINAL;
	StartofWindow,EndofWindow:CARDINAL;
	ch:CHAR;
	CurrentLeftMargin:CARDINAL;
	FileLimit:BOOLEAN;
	ReDrawn:BOOLEAN;
	CurFilePtr:PEditFile;
PROCEDURE ChangePos;FORWARD;
PROCEDURE DoScreenChange(Code:Edits);
BEGIN
	ScreenControl(Code);
	END DoScreenChange;


VAR	linesmoved:INTEGER;
	p:Position;

PROCEDURE SetLinePos(move:INTEGER);
BEGIN
	Retrline(CurFilePtr^,LineLen,LinePos,p,linesmoved,move);
	END SetLinePos;
PROCEDURE MarkAsUpdated;
BEGIN
	Updated[CurrentFile]:=TRUE
	END MarkAsUpdated;
PROCEDURE DelToEOL;
BEGIN
	MarkAsUpdated;
	IF LinePos<=LineLen THEN 
		DelChars(CurFilePtr^,LineLen-LinePos) 
		END;
	LineLen:=LinePos;
	DoScreenChange(DelEol);
	END DelToEOL;
VAR	
	b:BOOLEAN;
PROCEDURE ResetPos;
BEGIN
	Gotoxy(Thisx,Thisy);
	END ResetPos;
PROCEDURE ReDisplayWindow;
BEGIN
	DisplayFile(CurFilePtr^,CurrentWindow,Thisx,Thisy);
	ResetPos;
	curx[CurrentWindow]:=Thisx;
	cury[CurrentWindow]:=Thisy;
	ReDrawn:=TRUE;
	END ReDisplayWindow;
PROCEDURE ReDisplay;
BEGIN
	ReDisplayWindow;
	SetLinePos(0);
	ChangePos;
	END ReDisplay;
PROCEDURE ChangeMargin(Inc:INTEGER);
BEGIN
	IF (Inc<0) AND  (CurrentLeftMargin<CARDINAL(-Inc)) THEN 
		Inc:=-INTEGER(CurrentLeftMargin) 
		END;
	IF (Inc>0) AND (Thisx<CARDINAL(Inc)) THEN Inc:=Thisx END;
	CurrentLeftMargin:=INTEGER(CurrentLeftMargin)+Inc;
	Thisx:=INTEGER(Thisx)-Inc;
	curx[CurrentWindow]:=Thisx;
	LeftMargin[CurrentWindow]:=CurrentLeftMargin;
	ReDisplayWindow;
	ResetPos;
	END ChangeMargin;

PROCEDURE ChangePos;
VAR	i:CARDINAL;
BEGIN
	IF LineLen<LinePos THEN 
		LinePos:=LineLen;
		END;
	Thisx:=0;
	i:=0;	
	LOOP
		INC(i);
		ch:=GetCurrentChar(CurFilePtr^);
		IF (i>CARDINAL(LinePos)) OR (ch=EOF) THEN EXIT END;
		IF ch=TAB THEN Thisx:=IAND(Thisx+8,0fff8h) 
		ELSE  INC(Thisx) END;
		b:=ForwardOneChar(CurFilePtr^) 
		END;
	i:=Thisx;
	WHILE Thisx>=(ScreenWidth+CurrentLeftMargin) DO
		ChangeMargin(32);
		Thisx:=i;
		END;
	WHILE Thisx<CurrentLeftMargin DO
		ChangeMargin(-32);
		Thisx:=i;
		END;
	Thisx:=Thisx-CurrentLeftMargin;
	curx[CurrentWindow]:=Thisx;
	ResetPos;
	END ChangePos;

PROCEDURE LineMove(by:INTEGER);
VAR	i:INTEGER;
BEGIN
	ReDrawn:=FALSE;
	i:=LinePos;
	SetLinePos(by);
	LinePos:=i;
	ChangePos;
	IF ABS(by)>1 THEN
		ReDisplayWindow;
		END;
	END LineMove;
VAR	pw:Position;
PROCEDURE WritePartLine(c:CARDINAL);
BEGIN
	DoScreenChange(DelEol);
	GetPosition(CurFilePtr^,pw);
	LOOP
		ReadNextChar(pw,ch);
		IF (ch=0dx) OR (ch=1ax) OR (ch=0ax) THEN EXIT END;
		IF c>=(ScreenWidth+CurrentLeftMargin) THEN EXIT END;
		IF ch=TAB THEN 
			REPEAT
				IF c>CurrentLeftMargin THEN Write(' ') END; 
				INC(c);
				UNTIL IAND(c,7)=1;
		ELSE
			IF c>CurrentLeftMargin THEN Write(ch) END;
			INC(c);
			END;
		END(*LOOP*);
	END WritePartLine;
PROCEDURE WriteLine;
BEGIN
	WritePartLine(1);
	END WriteLine;
PROCEDURE RemoveLine;

(*	Remove a line from the screen and bring another line up at the bottom

	Thisy gives line to remove*)
VAR	p:Position;
BEGIN
	Gotoxy(0,Thisy);
	ScrollWindowDown(Thisy,EndofWindow);
	i:=EndofWindow-Thisy+1;
	GetPosition(CurFilePtr^,p);
	SetLinePos(i);
	IF linesmoved=i THEN
		MovedOK:=TRUE;
		Gotoxy(0,EndofWindow);
		WriteLine;
		END;
	SetPosition(CurFilePtr^,p);
	END RemoveLine;
PROCEDURE DelFullLine;
BEGIN
	MarkAsUpdated;
	RemoveLine;
	SetLinePos(0);
	DelChars(CurFilePtr^,LineLen+2);
	LinePos:=0;
	IF CurrentLeftMargin>0 THEN 
		ChangeMargin(-INTEGER(CurrentLeftMargin))
		END;
	Thisx:=0;
	ResetPos;
	LinePos:=0;
	SetLinePos(0);
	END DelFullLine;


PROCEDURE ScrollTextUp;

(*	Scroll up one line in the file
	(which means the text scrolls down - backwards to
	what you might think at first)*)

VAR	p:Position;	
	SaveLineLen,SaveLinePos:CARDINAL;
BEGIN
	SaveLineLen:=LineLen;
	SaveLinePos:=LinePos;
	i:=StartofWindow-Thisy-1;
	GetPosition(CurFilePtr^,p);
	SetLinePos(i);
	IF linesmoved=i THEN
		MovedOK:=TRUE;
		ScrollWindowUp(StartofWindow,EndofWindow);
		Gotoxy(0,StartofWindow);
		WriteLine;
	ELSE
		MovedOK:=FALSE;
		END;
	SetPosition(CurFilePtr^,p);
	ResetPos;
	LineLen:=SaveLineLen;
	LinePos:=SaveLinePos;
	END ScrollTextUp;
PROCEDURE ScrollUp;
BEGIN
	ScrollTextUp;
	IF MovedOK THEN
		IF Thisy<EndofWindow THEN 
			INC(Thisy);
			ResetPos;
		ELSE 	
			LineMove(-1);
			ResetPos;
			END;
		END;
	END ScrollUp;
PROCEDURE ScrollTextDown;
VAR	p:Position;	
	SaveLineLen,SaveLinePos:CARDINAL;
BEGIN
	SaveLineLen:=LineLen;
	SaveLinePos:=LinePos;
	i:=EndofWindow-Thisy+1;
	GetPosition(CurFilePtr^,p);
	SetLinePos(i);
	IF linesmoved=i THEN
		MovedOK:=TRUE;
		ScrollWindowDown(StartofWindow,EndofWindow);
		Gotoxy(0,EndofWindow);
		WriteLine;
		ResetPos;
	ELSE
		MovedOK:=FALSE;
		END;
	SetPosition(CurFilePtr^,p);
	ResetPos;
	LineLen:=SaveLineLen;
	LinePos:=SaveLinePos;
	END ScrollTextDown;
PROCEDURE ScrollDown;
BEGIN
	ScrollTextDown;
	IF MovedOK THEN
		IF Thisy>StartofWindow THEN 
			DEC(Thisy);
			ResetPos;
		ELSE
			LineMove(1);
			ResetPos;
			END;
		END;
	END ScrollDown;
PROCEDURE Left;
VAR	ch:CHAR;
	SaveLineLen:CARDINAL;
	p:Position;
BEGIN
	MovedOK:=TRUE;
	ReDrawn:=FALSE;
	SaveLineLen:=LineLen;
	GetPosition(CurFilePtr^,p);
	IF LinePos>0 THEN
		b:=BackOneChar(CurFilePtr^);
		ch:=GetCurrentChar(CurFilePtr^);
		IF (CurrentLeftMargin>0) AND (Thisx=0) THEN
			ChangeMargin(-32);
			END;
		DEC(LinePos);
		IF NOT ReDrawn THEN
			IF ch<>TAB THEN
				DEC(Thisx);
				ResetPos;
			ELSE
				LineMove(0);
				END;
			END;

	ELSE
		Thisx:=1023;
		LinePos:=1023;
		Up;
		IF NOT MovedOK THEN
			LinePos:=0;
			LineLen:=SaveLineLen;
			SetPosition(CurFilePtr^,p);
			Thisx:=0;
			ResetPos;
			END;
		END;
	END Left;
PROCEDURE Right;
VAR	ch:CHAR;
	i:CARDINAL;
BEGIN
	ch:=GetCurrentChar(CurFilePtr^);
	IF ch=1ax (*on EOF char*) THEN RETURN END;
	IF LinePos>=LineLen THEN
		Thisx:=0;
		LinePos:=0;
		Down;

	ELSE

		IF ch=TAB THEN i:=9 ELSE i:=1 END;
		IF (Thisx+i)>=(ScreenWidth-1) THEN
			ChangeMargin(32);
			END;
		b:=ForwardOneChar(CurFilePtr^);
		INC(LinePos);
		IF ch<>TAB THEN
			INC(Thisx);
			ResetPos;
		ELSE

			(*if moves over tabs are slow, replace the
			  repeated moves right by a gotoxy*)
			Thisx:=IAND(Thisx+8,0fff8h);
			ResetPos;
			END;
		END;
	END Right;

PROCEDURE AlphaNum(ch:CHAR):BOOLEAN;
BEGIN
	ch:=CAP(ch);
	RETURN ((ch>='A') AND (ch<='Z')) OR ((ch>='0') AND (ch<='9'));
	END AlphaNum;

PROCEDURE FindWord(Backward:BOOLEAN;Delete:BOOLEAN);

(*	Find a word and optionally delete it

	A word is a string alphanumerics or a string of marks, tabs  or spoaces

	The cursor is repositioned*)
VAR	ch:CHAR;
	b1:BOOLEAN;
BEGIN
	FileLimit:=FALSE;
	IF Backward THEN 
		Left;
		IF NOT MovedOK THEN RETURN END;
		END;
	ch:=GetCurrentChar(CurFilePtr^);
	b1:=AlphaNum(ch);
	IF ch=EOF THEN RETURN END;
	REPEAT
		IF Delete THEN DelOneChar END;
		IF Backward   THEN Left;
		ELSIF NOT Delete THEN Right END;
		ch:=GetCurrentChar(CurFilePtr^);
		UNTIL  (b1<>AlphaNum(ch)) OR FileLimit OR (ch=EOF);
	IF Backward AND NOT FileLimit THEN Right END;
	END FindWord;
PROCEDURE Down;
BEGIN
	LineMove(1);
	FileLimit:=linesmoved=0;
	IF linesmoved>0 THEN
		IF (Thisy>=EndofWindow) THEN
			INC(Thisy);
			ScrollTextDown;
			DEC(Thisy);
			ResetPos;
		ELSIF  NOT ReDrawn THEN 
			INC(Thisy);
			ResetPos;
			END;
		END; 
	END Down;

PROCEDURE RedoLine;
BEGIN
	Gotoxy(0,Thisy);
	SetLinePos(0);
	WriteLine;
	ChangePos;
	END RedoLine;

PROCEDURE InsOneChar(ch:CHAR);
VAR	CH1:ARRAY[0..0] OF CHAR;
BEGIN
	ReDrawn:=FALSE;
	MarkAsUpdated;
	CH1[0]:=ch;
	InsChars(CurFilePtr^,CH1,1);
	INC(LinePos);
	INC(LineLen);
	IF ch=CR THEN
		CH1[0]:=LF;
		InsChars(CurFilePtr^,CH1,1);
		ResetPos;
		DoScreenChange(DelEol);
		IF Thisy>=EndofWindow THEN
	(*		ScrollTextDown;*)
			ScrollWindowDown(StartofWindow,EndofWindow);
			DEC(Thisy);
			END;
		Gotoxy(0,EndofWindow);
		ScrollWindowUp(Thisy+1,EndofWindow);
		ResetPos;
		INC(Thisy);
		ResetPos;
		LinePos:=0;
		RedoLine;
	ELSIF ch=TAB THEN RedoLine	
	ELSE
		IF Thisx>=(ScreenWidth-1) THEN
			ChangeMargin(32);
			END;
		IF NOT ReDrawn THEN
			IF LinePos<LineLen THEN
				b:=BackOneChar(CurFilePtr^);
				WritePartLine(CurrentLeftMargin+Thisx+1);
				INC(Thisx);
				b:=ForwardOneChar(CurFilePtr^);				
			ELSE
				Write(ch);
				INC(Thisx);
				END;
			END;
		END;
	ResetPos;
	END InsOneChar;
PROCEDURE DelOneChar;
BEGIN
	MarkAsUpdated;
	ch:=GetCurrentChar(CurFilePtr^);
	IF LinePos=LineLen THEN i:=2
	ELSE i:=1 END;
	DelChars(CurFilePtr^,i);
	IF i=2 THEN
		IF Thisy<EndofWindow THEN 
			INC(Thisy);
			i:=LinePos;
			RemoveLine;
			LinePos:=i;
			DEC(Thisy);
			RedoLine;
			END;
	ELSE	
		DEC(LineLen);
		WritePartLine(CurrentLeftMargin+Thisx+1);
		END;
(*	ELSIF ch=TAB THEN
		RedoLine
	ELSE
		LineLen:=LineLen-1;
		DoScreenChange(DelChar);
		END;*)
	ResetPos;
	END DelOneChar;
PROCEDURE OverWrite(ch:CHAR);
VAR	CH1:ARRAY[0..0] OF CHAR;
BEGIN
	CH1[0]:=GetCurrentChar(CurFilePtr^);
	IF (CH1[0]<>CR) AND (ch<>CR) AND (CH1[0]<>1ax) THEN
		IF (CH1[0]<>TAB) AND (ch<>TAB) THEN
			DelChars(CurFilePtr^,1);
			CH1[0]:=ch;
			InsChars(CurFilePtr^,CH1,1);
			b:=BackOneChar(CurFilePtr^);
			Write(ch);
			ResetPos;
			Right;
			Updated[CurrentFile]:=TRUE;
		ELSE
			DelOneChar;
			InsOneChar(ch);
			END;
	ELSE
		InsOneChar(ch);
		END;
	END OverWrite;
PROCEDURE Up;
	
BEGIN
	IF Thisy<=StartofWindow THEN
		ScrollTextUp;
		END;
	LineMove(-1);
	FileLimit:=linesmoved=0;
	IF (linesmoved<>0) AND (Thisy>StartofWindow) AND NOT ReDrawn THEN 
		DEC(Thisy);
		ResetPos;
		END;
	END Up;
PROCEDURE UpScreen;
BEGIN
	LineMove(1-INTEGER(LinesPerWindow));
	END UpScreen;
PROCEDURE DownScreen;
BEGIN
	LineMove(LinesPerWindow-1);
	END DownScreen;
PROCEDURE Top;
BEGIN
	LinePos:=0;
	LineMove(-16736);
	END Top;
PROCEDURE Bottom;
BEGIN
	LinePos:=999;
	LineMove(16736);
	END Bottom;
PROCEDURE FarLeft;
BEGIN
	IF CurrentLeftMargin>0 THEN 
		ChangeMargin(-INTEGER(CurrentLeftMargin))
		END;
	SetLinePos(0);
	LinePos:=0;
	ChangePos;
	END FarLeft;
PROCEDURE FarRight;
BEGIN
	SetLinePos(0);
	LinePos:=LineLen;
	ChangePos;
	END FarRight;
PROCEDURE ChangeWindow(No:INTEGER);
VAR	b:BOOLEAN;
BEGIN
	IF CurrentWindow<>0 THEN
		curx[CurrentWindow]:=Thisx;
		cury[CurrentWindow]:=Thisy;
		b:=LabelOp(CurFilePtr^,TRUE,CHR(CurrentWindow));
		END;
	CurrentWindow:=No;
	
	IF CurrentWindow>Windows THEN CurrentWindow:=Windows END;
	IF CurrentWindow<>0 THEN
		(*set up a pointer to the current file to save index calculation
		  every time the file is referenced*)
		CurrentFile:=WindowFile[CurrentWindow];
		CurFilePtr:=PEditFile(ADR(Files[CurrentFile]));
		b:=LabelOp(CurFilePtr^,FALSE,CHR(CurrentWindow));
		Thisx:=curx[CurrentWindow];
		Thisy:=cury[CurrentWindow];
		CurrentLeftMargin:=LeftMargin[CurrentWindow];
		SetLinePos(0);
		ChangePos;
		i:=(ScreenDepth-Windows) DIV Windows;
		StartofWindow:=CARDINAL(i+1)*(CurrentWindow-1);
	ELSE 
		StartofWindow:=0;
		i:=0 
		END;
	IF CurrentWindow<Windows THEN
		EndofWindow:=StartofWindow+CARDINAL(i-1);
	ELSE
		EndofWindow:=ScreenDepth-2
		END;

	END ChangeWindow;
PROCEDURE ResetScreenPos;
BEGIN
	IF CurrentWindow<>0 THEN
		Thisx:=curx[CurrentWindow];
		Thisy:=cury[CurrentWindow];
		ResetPos;
		END;
	END ResetScreenPos;
PROCEDURE MoveWindow(from,to:CARDINAL);
VAR	b:BOOLEAN;
BEGIN
	curx[to]:=curx[from];
	cury[to]:=cury[from];
	LeftMargin[to]:=LeftMargin[from];
	WindowFile[to]:=WindowFile[from];
	b:=LabelOp(Files[WindowFile[to]],TRUE,CHR(to));
	END MoveWindow;
PROCEDURE ElideWindow(WindowNo:INTEGER);
BEGIN
	FOR i:=WindowNo+1 TO INTEGER(Windows) DO
		MoveWindow(i,i-1);
		END;
	DEC(Windows);
	CurrentWindow:=0;
	END ElideWindow;
PROCEDURE MakeWindow;
BEGIN
	INC(Windows);
	MoveWindow(CurrentWindow,Windows);
	END MakeWindow;
PROCEDURE Search(Replace:ARRAY OF CHAR;RLen:INTEGER;Len:CARDINAL):BOOLEAN;

(*	search for string and replace if found*)
VAR	b:BOOLEAN;
	Found:BOOLEAN;
BEGIN
	b:=Len>128;
	IF b THEN Len:=Len-128 END;
	Found:=FindString(CurFilePtr^,b);
	IF Found AND (RLen>=0) THEN
		MarkAsUpdated;
		DelChars(CurFilePtr^,Len) 
		InsChars(CurFilePtr^,Replace,RLen);
		b:=BackOneChar(CurFilePtr^);
		END;
	ReDisplay;
	RETURN Found;
	END Search;
PROCEDURE GoToLabel(ch:CHAR);
BEGIN
	IF LabelOp(CurFilePtr^,FALSE,ch) THEN
		ReDisplay;
	ELSE
		ErrorMessage(' Label not defined',' ');
		ResetPos;
		END;
	END GoToLabel;		
BEGIN
	CurrentWindow:=0;
	CurrentFile:=0;
	CurFilePtr:=PEditFile(ADR(Files[1]));
	END EditControl.

 !"#$%&'()*+��������0��23456789������=>?@