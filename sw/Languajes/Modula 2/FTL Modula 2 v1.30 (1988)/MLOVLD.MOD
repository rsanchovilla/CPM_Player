MODULE MLOverlayLoad;
(*	Load overlays created by the Advanced Programmer's Kit linker
	into the file from which they will be accessed when the 
	program is executed.

	Copyright (C) Dave Moore, FTL Modula-2 November 1986

*)

FROM	Files IMPORT FILE,Lookup,Create,ReadBlock,WriteBlock,FileName,
			Close,SetBlock,SeqReadBlock;
FROM	SmallIO IMPORT ReadCard,WriteHex,WriteCard;
FROM	Terminal IMPORT WriteString,WriteLn,Read,ReadBuffer,ReadString;
FROM	SYSTEM IMPORT BYTE,ADR;
FROM	Strings IMPORT Concat;


(*		Setting the Compact constant to FALSE will result in the
		overlay loader allowing overlays to span extents. This will
		save space but will slow down overlay loading for any overlay
		that spans an extent *)
 
CONST	Compact=FALSE;
TYPE	OverlayRec=RECORD
		Extent:BYTE;		(*number of extent containing overlay*)
		StartSector:BYTE;	(*Start sector within overlay *)
		Length:BYTE;		(*Number of sectors in overlay*)
		Filler:BYTE;		(*not used*)
		END;
VAR	OutFile:FILE;
	InFile:FILE;
	StartAddr:CARDINAL;
	reply:INTEGER;	
	Index:ARRAY [0..32] OF OverlayRec;
	NextBlock:CARDINAL;
	CurrentExtent:CARDINAL;
	i,j:INTEGER;
	BaseFileName,FileNameExt:FileName;
	OverlayCount:INTEGER;
	Extent:ARRAY [1..4] OF CHAR;
PROCEDURE Process;
VAR	
	Buffer,Zeroes:ARRAY[0..127] OF BYTE;
	SkippedBlocks:INTEGER;
	StartBlock:CARDINAL;
	StartExtent:CARDINAL;
PROCEDURE Check(reply:INTEGER);
BEGIN
	IF reply<>128 THEN
		WriteString(' Output disc full ');
		WriteLn;
		HALT
		END;
	END Check;
BEGIN
	WriteString(' Processing ');
	WriteString(FileNameExt);
	WriteString(' overlay number ');
	WriteCard(OverlayCount,6);
    
	FOR i:=0 TO HIGH(Zeroes) DO
		Zeroes[i]:=0
		END;
	LOOP
		StartExtent:=NextBlock DIV 128;
		SkippedBlocks:=0;
		StartBlock:=NextBlock;

		(*	set up the index entries. There are 128 blocks
			to an extent *)

		WITH Index[OverlayCount] DO
			StartSector:=NextBlock MOD 128;
			Extent:=NextBlock DIV 128;
			END;

		(*	transfer the overlay to the file. Blocks of zero are
			not transfered until a non-zero byte is found. 
			SkippedBlocks counts the number of zero blocks skipped
			 *)
		LOOP
			SeqReadBlock(InFile,ADR(Buffer),128,reply);
			IF reply=0 THEN EXIT END;

		(*	Check for a block of zeros *)

			i:=0;
			WHILE (i<reply) AND (Buffer[i]=0) DO INC(i) END; 
			IF i>=reply THEN
				INC(SkippedBlocks);
			ELSE
				FOR i:=1 TO SkippedBlocks DO
					WriteBlock(OutFile,ADR(Zeroes),NextBlock,
						128,reply);
					Check(reply);
					INC(NextBlock);
					END;
				SkippedBlocks:=0;
				WriteBlock(OutFile,ADR(Buffer),NextBlock,128,reply);
				Check(reply);
				INC(NextBlock);
				END;
			END; (*LOOP*)
		WITH Index[OverlayCount] DO
			Length:=NextBlock-StartBlock;
			WriteString(' Length ');
			WriteCard(ORD(Length),6);
			WriteLn;
			END;

		(* check that we did not span an extent, for otherwise CP/M
		   will do a directory access every time the overlay is loaded
		   which slows down overlay loads.
*)
		IF 	     NOT Compact 
			AND ((NextBlock DIV 128)<>StartExtent) 
			AND ((NextBlock-StartBlock)<128) THEN
			NextBlock:=(StartExtent+1)*128;
			WriteString(' Extent overflow  - re-reading file');
			WriteLn;
			SetBlock(InFile,0);
		ELSE	
			EXIT
			END;
	        END; (*LOOP*)
	END Process;
BEGIN
	NextBlock:=1;
	WriteString(' Overlay load program ');WriteLn;WriteLn;
	WriteString(' Copyright (C) Dave Moore, FTL Modula-2 November 1986 ');
	WriteLn;WriteLn;
	WriteString(' Enter name of file being overlayed :');
	ReadString(BaseFileName);
	WriteLn;
	Create(OutFile,'OVERLAYE.OVR',reply);
	IF reply<>0 THEN
		WriteString(' Could not create OVERLAYE.OVR');
		WriteLn;
		HALT;
		END;
	OverlayCount:=0;
	LOOP
		INC(OverlayCount);
		Extent:='.000';
		Extent[4]:=CHR(OverlayCount+ORD('0')-1);
		Concat(BaseFileName,Extent,FileNameExt);
		Lookup(InFile,FileNameExt,reply);
		IF reply<>0 THEN EXIT END;
		Process;
		Close(InFile);
		END;		

	
	(*	processing complete *)

	WriteBlock(OutFile,ADR(Index),0,128,reply);
	Close(OutFile);
	END MLOverlayLoad.
���� !"#$��                                                      