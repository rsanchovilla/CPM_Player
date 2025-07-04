MODULE me;

(*	Modula  editor

	Dave Moore 1 Feb 85

	This is the main module for the editor

	I have added some comments at version 1.2 which should be 
	worth reading if you are trying to learn to write in Modula-2
*)

FROM EditControl IMPORT Files,FilesOpened,curx,cury,CurrentWindow,ChangeWindow,
			ResetScreenPos,CurrentFile;
FROM EditDisplay IMPORT ErrorMessage,SetWindows,DisplayFile,Windows,
		DisplayError,ErrorOrdinal;

FROM DoMenu IMPORT DoMenuOp,Open;

FROM KeyBoard IMPORT Interpret;
FROM	MakeEdit IMPORT DefineErrors,ErrorList,ErrorCount;
FROM	FastMove IMPORT Moveup;
(*
	The modules above are part of the editor
	The following modules are all general purpose modules
*)

FROM Command IMPORT Parclass,name,string,option,
		   Text,Parameter,GetParams;

(*	Command cracks the command line parameters which are set up
	by CP/M at address 80
*)

FROM Files IMPORT FileName,FILE,Lookup,ReadBlock,SetBlock;

(*	Files is the file oriented block level IO system*)

FROM SYSTEM IMPORT ADR;

FROM Storage IMPORT FullUp;

(*	Terminal is the standard terminal input-output module

	It is also possible to do Input-Output to the terminal
	through the modules Streams and InOut, but these
	increase the size of the program and are only required if 
	you want to do more powerful things, such as file
	redirection and number conversion. If all you want is number 
	conversion, SmallIO can be used *) 

VAR	Pars:ARRAY[0..3] OF Parameter;
	ParCount:INTEGER;

	(*	Pars is an array into which Command will place
		the parameters entered on the command line
		
		It need only be as large as the number of parameters
		you expect to be entered on the command line

		The editor expects up to four parameters: three
		file names and some options, although the options
		are currently only used by the compiler when it 
		links to the editor after an error and in that
		case, there is only one other parameter
	*)

	k:INTEGER;
	i,j:CARDINAL;
	reply:INTEGER;
	fn:FileName;
	ch:CHAR;

(*	Error display routine

	If the editor is entered as the result of a compilation error,
	the command line consists of the name of the file which was
	being compiled followed by an option. The option contains
	two integer values in binary (so you cannot enter same from
	the CP/M prompt - or at least not easily). Giving the position
	of the error in the file and the error number*)


(*	Work through the parameters opening the files to be edited
	Pars and ParCount have already been set up by a call to
	the Command module*)

PROCEDURE OpenFiles;
VAR	k:INTEGER;
	FilePosition:CARDINAL;
BEGIN

	(*	check for option giving error number and position*)
	ErrorCount:=0;
	ErrorOrdinal:=0;
	WITH Pars[ParCount-1]^ DO
		IF Class=option THEN
			ErrorCount:=FilePos;
			Moveup(ADR(Chars[2]),ADR(ErrorList),4*ErrorCount);
			DEC(ParCount);
		ELSE
			FilePosition:=65535
			END;(*IF*)
		END;	
	FOR k:=0 TO ParCount-1 DO
		WITH Pars[k]^ DO

		(* Note the extension below:

		  As of V1.2, The compiler allows you to type break with types
		  and variables more than two bytes in length, which simplifys
		  this code greately. What is happening is that Chars is really
		  of type ARRAY[something] OF CHAR, and is not the same as FileName
		
		  By putting the variable in FileName(), its type is changed to
		  be FileName. This isn't really a coercion since the data is not
		  altered in any way. It simply defeats the compiler's type
		  checking.  *)

	 		Open(FileName(Chars),FilePosition);
			END;
		END;
	IF ErrorCount>0 THEN DefineErrors(Files[CurrentFile]) END;
	END OpenFiles;				
PROCEDURE MemFull;
BEGIN
	ErrorMessage(' Memory is full - please save files now',' ');
	DoMenuOp;
	END MemFull;
VAR	ccc:CHAR;
BEGIN

	(*GetParams reads the parameters from the command line*)

	FullUp:=MemFull;
	GetParams(Pars,ParCount);
	FilesOpened:=0;
	IF ParCount>0 THEN OpenFiles END;
	IF ErrorCount<>0 THEN DisplayError END;
	IF FilesOpened>0 THEN ChangeWindow(1) END;
	LOOP

		(*this loop goes round for ever since there is an
		  explicit HALT in domenu to stop the program*)

		IF FilesOpened>0 THEN 
			Interpret;
			END;
		i:=CurrentWindow;	
		k:=CurrentFile;

		(*remember current window since DomenuOp may change it*)

		j:=FilesOpened;
		DoMenuOp;	(*explicit exit in this module*)
		IF (i=CurrentWindow) AND (Windows>0) THEN

			(*after menu, redisplay window in which the
			  window popped up*)

			DisplayFile(Files[k],i,curx[i],cury[i]);
			END;
		END; (*LOOP*)

	END me.
END; (*CharPos>BlockLen*)
	RETURN Working^.Chars[CharPos]<>EOF
	END Advance;

PROCEDURE CheckBlock(�e 15FEB87 DOC           �;PQ�e FIXES   DOC           �sPG%t  FIXES   BAK           �pP�!�  