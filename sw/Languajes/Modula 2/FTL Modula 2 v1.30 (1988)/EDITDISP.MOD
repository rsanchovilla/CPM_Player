IMPLEMENTATION MODULE EditDisplay;
(*	Display part of a file being edited*)
FROM	SCREENIO IMPORT Gotoxy,ScreenControl,
			MadeChange,ScreenWidth,ScreenDepth;
FROM 	Terminal IMPORT WriteString,Write,WriteLn,Read;
FROM 	MakeEdits IMPORT Position,Retrline,ReadNextChar,ErrorList,ErrorCount,LabelOp;
FROM	EditCont IMPORT LeftMargin,Files,CurrentWindow,CurrentFile,Thisx,Thisy,
			curx,cury,ReDisplay;
FROM 	IntLogic IMPORT IAND;
FROM	Files IMPORT Lookup,Close,FILE,ReadBlock;
FROM	SYSTEM IMPORT ADR;
CONST	EOF=1ax;

PROCEDURE ErrorMessage(s1,s2:ARRAY OF CHAR);

(*	Display error message at bottom of screen*)
VAR i:INTEGER;
BEGIN
	Gotoxy(0,ScreenDepth-1);
	ScreenControl(RingBell);
	ScreenControl(DelEol);
	WriteString(s1);WriteString(s2);
	END ErrorMessage;
PROCEDURE SetWindows(i:INTEGER);

(*	set number of edit windows in use - you must refresh the entire
	screen with calls to DisplayFile after a call to this
	routine*)
VAR	j,k:CARDINAL;
	
BEGIN
	Windows:=i;
	ScreenControl(ClearScreen);
	IF Windows>1 THEN
		LinesPerWindow:=(ScreenDepth-Windows) DIV Windows;
	ELSE	LinesPerWindow:=ScreenDepth-1 END;
	FOR j:=2 TO Windows DO
		Gotoxy(0,(LinesPerWindow+1)*(j-1)-1);
		ScreenControl(StartGraph);
		FOR k:=1 TO ScreenWidth DO 
			ScreenControl(Horizontal);
			END;
		ScreenControl(EndGraph);
		END;
	END SetWindows;
	(*put a line between the windows*)

VAR	ch:CHAR;
	pos:Position;
	charsin,ic:INTEGER;
	len,moved:INTEGER;
	linepos,LeftMarg:CARDINAL;
PROCEDURE SetLeftMarg(f:EditFile;window:INTEGER;VAR curx,cury:CARDINAL);
BEGIN
	Retrline(f,len,charsin,pos,moved,0);
	linepos:=0;
	FOR ic:=0 TO charsin DO
		ReadNextChar(pos,ch);
		IF ch=09x THEN linepos:=IAND(linepos+8,0fff8h)
		ELSE INC(linepos) END;
		END;
	LeftMarg:=0;
	WHILE linepos>(LeftMarg+ScreenWidth) DO
		LeftMarg:=LeftMarg+32;
		END;
	LeftMargin[window]:=LeftMarg;
	END SetLeftMarg;
PROCEDURE DisplayFile(f:EditFile;window:INTEGER;VAR curx,cury:CARDINAL);

(*	redisplay as much text as will fit in the window
	for the given file starting at the current position in the file*)
VAR	i,j,k,linepos:CARDINAL;
	movedone:INTEGER;	
	startline:INTEGER; (*first line of window*)
BEGIN
	LeftMarg:=LeftMargin[window];
	startline:=(INTEGER(LinesPerWindow)+1)*(window-1);
	Gotoxy(0,startline);

	(*first line of this window*)
	i:=0;	(*line within window*)
	k:=LinesPerWindow DIV 2;
	Retrline(f,len,charsin,pos,moved,-k);
	
	LOOP

		(*check if this is the line we were positioned to upon entry*)

		linepos:=0;
		j:=0;
		LOOP
			IF (moved=0) AND (j<=CARDINAL(charsin)) THEN
				curx:=linepos-LeftMarg;
				cury:=i+CARDINAL(startline)
				END;
			INC(j);
			IF j>CARDINAL(len) THEN EXIT END;

			(*check for cursor line*)

			ReadNextChar(pos,ch);
			IF ch=09x THEN 
				REPEAT
					INC(linepos);
					IF (linepos>LeftMarg) 
					AND (linepos<(ScreenWidth+LeftMarg)) THEN 
						Write(' ') 
						END;
					UNTIL IAND(linepos,7)=0;
			ELSIF ch=EOF THEN EXIT
			ELSE 
				INC(linepos);
				IF (linepos>LeftMarg)
				AND (linepos<(ScreenWidth+LeftMarg)) THEN 
					Write(ch) 
					END;
				END;(*IF ch=various things*)
			END (*inner loop*);
		INC(i);
		IF linepos<(ScreenWidth+LeftMarg) THEN 
			ScreenControl(DelEol) 
			END;
		IF i=LinesPerWindow THEN EXIT
		ELSE 
			WriteLn;
			linepos:=0;
			END;
		INC(moved);	
		Retrline(f,len,ic,pos,movedone,1);
		IF movedone=0 THEN
			FOR i:=i+1 TO LinesPerWindow DO
				ScreenControl(DelEol);
				WriteLn;
				END;
			EXIT
			END
		END;(*LOOP*)
	END DisplayFile;
PROCEDURE DisplayError;

(*	The error message file contains the messages, 

	The first two blocks give the lengths of the error messages
	The remaining blocks give the text of the error messages *)
TYPE	Text=ARRAY[0..63] OF CHAR;

VAR	f:FILE;			(*FILE is a type exported from the module Files*)

	b:ARRAY [0..127] OF CHAR;
	i,j,k,Length:CARDINAL;
	t:Text;
	ErrorNumber:CARDINAL;
	reply:INTEGER;
	bl:BOOLEAN;
PROCEDURE Count(k:CARDINAL):CARDINAL;
VAR	i:CARDINAL;
BEGIN
	i:=0;
	IF k=0 THEN RETURN 0 END;
	FOR k:=k-1 TO 0 BY -1 DO
		i:=i+ORD(b[k]);
		END;
	RETURN i
	END Count;
PROCEDURE WriteCard(i:CARDINAL);
VAR	t:ARRAY[0..3] OF CHAR;
	j,k:CARDINAL;
BEGIN
	k:=HIGH(t);
	WHILE i<>0 DO
		j:=i DIV 10;
		t[k]:=CHR(ORD('0')+i-10*j);
		i:=j;
		DEC(k);
		END;
	FOR k:=k+1 TO HIGH(t) DO Write(t[k]) END;
	END WriteCard;
BEGIN
	IF ErrorOrdinal>=ErrorCount THEN RETURN END;
	Gotoxy(0,ScreenDepth-1);
	ErrorNumber:=ErrorList[ErrorOrdinal].ErrorNum;
	ScreenControl(DelEol);
	WriteString('Error ');
	WriteCard(ErrorNumber);
	WriteString('(');WriteCard(ErrorOrdinal+1);
	WriteString(' of ');WriteCard(ErrorCount);
	WriteString(') :');
	Lookup(f,'ERRMSG.DAT ',reply);

	(*Lookup opens the file for input/output
	  reply returns zero if no file is found
	  a device name can be used in front of the file name
	 In fact, you can use a non-disc file name (eg PUN: or CON:)
	 but if you do this, you must do your IO through the module
	 Streams (or InOut, which calls streams), as the IO to the
	 serial devices is performed by that module (it calls Files
	 to do IO to disc devices)
*)
	IF reply=0 THEN		(*OK - file found*)
		

		(*read the first 1 or two blocks of the error 
		  message file, countin the characters preceding the
		  error emssage we want *)
		ReadBlock(f,ADR(b),0,128,reply);
		j:=ErrorNumber;
		IF ErrorNumber>128 THEN
			i:=Count(128);
			ReadBlock(f,ADR(b),1,128,reply);
			j:=j-128
		ELSE
			i:=0;
			END;
		i:=i+Count(j-1);
		Length:=ORD(b[j-1]);
		j:=i DIV 128; (*block to read*)
		i:=i - 128*j; (*offset of first character in block*)
		ReadBlock(f,ADR(b),j+2,128,reply);
		FOR k:=0 TO Length-1 DO
			IF i=128 THEN 
				INC(j);
				ReadBlock(f,ADR(b),j+2,128,reply) 
				i:=0;
				END;
			t[k]:=b[i];
			INC(i);
			END;
		t[Length]:=0c;
		WriteString(t);
	ELSE
		WriteString(' Could not open error messages file');
		END;
	bl:=LabelOp(Files[CurrentFile],FALSE,CHR(ErrorOrdinal+0b0h));
	ReDisplay;
(*	DisplayFile(Files[CurrentFile],CurrentWindow,Thisx,Thisy);*)
	Gotoxy(Thisx,Thisy);
	curx[CurrentWindow]:=Thisx;
	cury[CurrentWindow]:=Thisy;
	END DisplayError;	
BEGIN
	Windows:=0;
	END EditDisplay.
                                                    