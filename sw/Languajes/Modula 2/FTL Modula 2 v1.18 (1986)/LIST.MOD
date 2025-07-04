MODULE List;

(*	List one of more files

	Dave Moore FTL Modula-2
	C/O Workman and Associates
	112 Marion Drive
	Pasadena California 91106
	(Ph) (818) 796 4401

	This is a module provided with the system. You may hack it
	and use it for whatever purposes you wish. 

	Call is LIST   <(wild card) file name>,.... (output file name[o) 

	Where the output file name is optional (defaults to printer device)

	Bugs:

		Overwrites output file without checking if OK

*)
IMPORT	Debug;
FROM SYSTEM IMPORT ADDRESS,ADR,TSIZE;
FROM Command IMPORT Parameter,Parclass,GetParams;
FROM Files IMPORT FileName,FILE,Lookup,Create;
FROM Streams IMPORT Connect,Disconnect,STREAM,input,output,WriteChar,
		ReadChar,EOS;
FROM GetFiles IMPORT GetNames;
FROM Terminal IMPORT WriteString,WriteLn;
FROM Sort IMPORT SortRecords;
CONST	FF=0cx;
	TAB=09x;
	LF=0ax;
	CR=0dx;
        TABS=20x; 
TYPE 	PFileName=POINTER TO FileName;
VAR	List:STREAM;
	ListF:FILE;
	reply:INTEGER;
	i,j:INTEGER;
	Ins:STREAM;
	Inf:FILE;
	ch:CHAR;

	buffer:ARRAY[0..4095] OF CHAR;
	bufflen:CARDINAL;	
(*	I buffer the characters on output since I have a printer which
	stops printing whenever anything appears on the interface. To
	get it to run at speed, you must hit it with a buffer full 'at
	a time'*)
PROCEDURE FlushBuffer;
VAR	i:CARDINAL;
BEGIN
	IF bufflen>0 THEN 
		FOR i:=0 TO bufflen-1 DO WriteChar(List,buffer[i]) END;
		END;
	bufflen:=0;
	END FlushBuffer;
PROCEDURE BufferOut(ch:CHAR);
BEGIN
	IF bufflen=HIGH(buffer) THEN FlushBuffer END;
	buffer[bufflen]:=ch;
	bufflen:=bufflen+1;
	END BufferOut;

PROCEDURE Compar(a,b:ADDRESS):BOOLEAN;
VAR	p,q:PFileName;
BEGIN
	p:=PFileName(a);
	q:=PFileName(b);
	RETURN p^>q^
	END Compar;
PROCEDURE Usage;
BEGIN
	WriteString('Usage is:   LIST file,file,...');WriteLn;
	WriteString('      or    LIST file,file,...,output file[o');WriteLn;
	WriteString(' where file is a file to list or a wild card for files to list');WriteLn;
	WriteLn;
	WriteString(' for example:  LIST *.DEF');WriteLn;
	HALT
	END Usage;
PROCEDURE Listit;

VAR	Param:ARRAY [0..10] OF Parameter;
	Count:INTEGER;
	Names:ARRAY [0..100] OF FileName;
	NameCount : INTEGER;
	Counter : INTEGER;
	Cnter : INTEGER;
BEGIN

	GetParams(Param,Count);
        Counter := 1
        IF Count=0 THEN Usage END;
	IF Param[Count-1]^.Class=option THEN
		DEC(Count);
		IF Count=0 THEN Usage END;
		GetNames(Param[Count-1]^.Chars,Names,NameCount);
		Create(ListF,Names[0],reply);
		IF reply<>0 THEN
			WriteString(' Could not create list file');
			WriteLn;
			HALT;
			END;
		DEC(Count);
		IF Count=0 THEN Usage END;
	ELSE
		Create(ListF,'LST:',reply);
		END;
	Connect(List,ListF,output);
	FOR i:=0 TO Count-1 DO
		GetNames(Param[i]^.Chars,Names,NameCount);
		IF NameCount>1 THEN
			SortRecords(ADR(Names),CARDINAL(NameCount),
				TSIZE(FileName),Compar);
			END;
		FOR j:=0 TO NameCount-1 DO
			Lookup(Inf,Names[j],reply);
			IF reply<0 THEN
				WriteString(' Could not open ');
				WriteString(Names[j]);
				WriteLn;
			ELSE
				WriteString(' Listing:');
				WriteString(Names[j]);
				WriteLn;
				Counter := 1;
				BufferOut(FF);
				Connect(Ins,Inf,input);
				WHILE NOT EOS(Ins) DO
					ReadChar(Ins,ch);
					IF ch>=80x THEN
						ch:=CHR(ORD(ch)-80h);
						END;
				(*output character if not control code*)
					IF ((ch>=' ') AND (ch<='~'))
					  OR (ch=TAB)
					  OR (ch=CR)
					  OR (ch=LF) THEN 
						BufferOut(ch) 
						END;
					
					END;
				Disconnect(Ins,TRUE);
				END;
			END;
		END;
	END Listit;			
BEGIN
	bufflen:=0;
	Listit;
	FlushBuffer;
	Disconnect(List,TRUE);
	END List.
       �mA|��  CUSTOMIZEXE           �mA�ބ  FINDP   COM           �5�� -  ARC     EXE           �f�
� l  