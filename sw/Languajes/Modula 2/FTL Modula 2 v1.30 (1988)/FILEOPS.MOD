IMPLEMENTATION MODULE FileOps;

FROM	SYSTEM	IMPORT BYTE,ADR,ADDRESS;
FROM	STORAGE IMPORT FreeSpace,ALLOCATE,DEALLOCATE,RELEASE;
FROM	Files	IMPORT Lookup,Create,SeqReadBlock,SeqWriteBlock,Close,
			FILE,FileName;
FROM	Terminal IMPORT WriteString,WriteLn;

(*	Perform some file operations *)

TYPE	PBlock=POINTER TO Block;
	Block=ARRAY[0..127] OF BYTE;
VAR	b1,b2:PBlock;
	i,j:CARDINAL;
	BuffSize:CARDINAL;
	reply:INTEGER;
	f1,f2:FILE;
	reply1,reply2:INTEGER;
PROCEDURE SetUp(Count:CARDINAL);

(*	Set up 1 or 2 buffers using all available memory *)

BEGIN
	i:=(FreeSpace()-1024) DIV 128;
	IF i<Count THEN
		WriteString(' Out of Memory in FileOps');
		WriteLn;
		HALT;
		END;
	i:=i DIV Count;
	BuffSize:=128*i;
	ALLOCATE(b1,BuffSize);
	IF Count=2 THEN ALLOCATE(b2,BuffSize) END;
	END SetUp;
PROCEDURE FreeUp(i:CARDINAL);
(*	release buffers - used to dispose them but now
	does a release which is faster. As a result parameter is not required
 *)
BEGIN
	RELEASE(ADDRESS(b1));
	END FreeUp;

PROCEDURE FileComp(fn1,fn2:ARRAY OF CHAR):BOOLEAN;

(*	Compare two files - return TRUE if equal *)
VAR	i:INTEGER;
BEGIN
	SetUp(2);
	Lookup(f1,FileName(fn1),reply);
	IF reply<>0 THEN 
		FreeUp(2);
		RETURN FALSE 
		END;
	Lookup(f2,FileName(fn2),reply);
	IF reply<>0 THEN 
		FreeUp(2);
		RETURN FALSE 
		END;
	LOOP
		SeqReadBlock(f1,ADR(b1^),BuffSize,reply1);
		SeqReadBlock(f2,ADR(b2^),BuffSize,reply2);
		IF reply1<>reply2 THEN
			FreeUp(2);
			RETURN FALSE
			END;
		IF reply1<=0 THEN 
			FreeUp(2);
			RETURN TRUE 
			END;
		FOR i:=0 TO reply1-1 DO
			IF b1^[i]<>b2^[i] THEN 
				FreeUp(2);
				RETURN FALSE 
				END;
			END;
		END;(*LOOP*)
	END FileComp;
PROCEDURE FileMove(fn1,fn2:ARRAY OF CHAR):BOOLEAN;
BEGIN
	SetUp(1);
	Lookup(f1,FileName(fn1),reply);
	IF reply<>0 THEN
		WriteString(' Input file not found ');
		WriteLn;
		FreeUp(1);
		RETURN FALSE;
		END;
	Create(f2,FileName(fn2),reply);
	IF reply<>0 THEN
		WriteString(' Directory full ');
		WriteLn;
		FreeUp(1);
		RETURN FALSE;
		END;
	LOOP
		SeqReadBlock(f1,ADR(b1^),BuffSize,reply1);
		IF reply1<=0 THEN
			Close(f1);
			Close(f2);
			FreeUp(1);
			RETURN TRUE;
			END;
		SeqWriteBlock(f2,ADR(b2^),BuffSize,reply2);
		IF reply2<>reply1 THEN
			WriteString(' Disc full ');
			WriteLn;
			FreeUp(1);
			RETURN FALSE;
			END;
		END;
	END FileMove;

END FileOps.


     RB0  TESTNESTMOD           g>R[  SMALLIO REL           ¯B8 	  BUILDLIBBAT           y«   