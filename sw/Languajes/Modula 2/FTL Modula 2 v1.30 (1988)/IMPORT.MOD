IMPLEMENTATION MODULE Import; 

(* 	A module to perform exports and imports for modula-2 
  	programs. This module will read SYM files created by the
	FTL Modula-2 compiler 

	This module does not contain all the code required to import
	multiple symbol tables. For this reason, if you use this
	module to import several symbol tables, they will not be linked
	together correctly. This means that you cannot do type checking
	using this module.

	Let me explain that more thoroughly. Each SYM Table comtains a 
	copy of every declaration which is used in the SYM table. For
	example, it you import BYTE from SYSTEM, there is a copy of the
	declaration for BYTE. A symbol like BYTE is likely to be imported
	by a number of different symbol tables and so several copies
	of the declaration will exist. In the compiler, all these are linked
	together so that BYTE only has one active definition. Otherwise, 
	variables of type BYTE imported from different modules would not
	be compatible.	

	Nor does it contain the code to process the import list
	*)
FROM	FastMove IMPORT Moveup;
FROM	Storage IMPORT ALLOCATE;
FROM	Terminal IMPORT WriteString,WriteLn;
FROM	SYSTEM IMPORT ADR;
FROM	Files IMPORT Lookup,SeqReadBlock,Close,FILE;
CONST	BiggestFile=8191;	(*biggest sym file readable*)  

VAR 
	COMPLINK:pname; 
	PLINK,LASTLINK,nlink:pname; 
	RELOFF,GLOBRELOFF,RELBASE:CARDINAL; 
	SID:alfa; 
	HIDEALL:BOOLEAN=FALSE; 
	HIDEOTHERS:BOOLEAN; 
	NEWMODNAME:pname; 
	MODULENAME:alfa; 
	MODULEPNT:pname; 
	DISPLAY : pname; 
	LASTNAME: pname;
	NAMEPNT:pname; 

(*	Symbol table entries consist of a NAME record preceded
	by a identifier length BYTE preceded by the identifier
	stored backwards. The top bit of the length is set to 'hide'
	the identifier. The second top bit is used to mark accessible 
	symbols though this is not done by this version of the 
	import module *)
	
PROCEDURE HIDE(p:ADDRESS);

(*	Hide an identifier

	An identifier is hidden by setting the top bit
	of the byte preceding the pointer *)
BEGIN
	p:=ADDRESS(CARDINAL(p)-1);
	IF p^<128 THEN p^:=p^+128 END;
	END HIDE;
PROCEDURE UNHIDE(p:ADDRESS);

(*	Hide an identifier

	An identifier is hidden by setting the top bit
	of the byte preceding the pointer *)
BEGIN
	p:=ADDRESS(CARDINAL(p)-1);
	IF p^>=128 THEN p^:=p^-128 END;
	END UNHIDE;
PROCEDURE RETRNAME(p:ADDRESS);
VAR	i:INTEGER;
	len:INTEGER;
BEGIN
	p:=ADDRESS(CARDINAL(p)-1);
	len:=ORD(p^);
	(*clear top two bits *)

	IF len>=128 THEN len:=len-128 END;
	IF len>=64 THEN len:=len-64 END;
	IF len>=32 THEN len:=len-32 END;

	FOR i:=1 TO len DO
		p:=ADDRESS(CARDINAL(p)-1);
		ID[i]:=CHR(p^);
		END;
	FOR i:=len+1 TO HIGH(ID) DO ID[i]:=' ' END;	
	END RETRNAME;

PROCEDURE LOOKUP(LID:alfa;TABLE:pname):pname;
BEGIN
	LASTNAME:=NIL;
	LOOP
		
		IF TABLE=NIL THEN EXIT END;
		LASTNAME:=TABLE;
		RETRNAME(TABLE);
		IF ID<LID THEN TABLE:=TABLE^.upper
		ELSIF ID>LID THEN TABLE:=TABLE^.lower
		ELSE EXIT END;
		END;
	RETURN TABLE
	END LOOKUP;
PROCEDURE RELPNTR(FIELDS:ADDRESS):ADDRESS; 

(*	Relocate a pointer 

	There are two areas which the pointer may need
	relocating relative to (see Churchill). The globals
	symbol table and the local symbols table.

	The global symbol table is assumed to be lower in memory*)
VAR	a:ADDRESS;
BEGIN
	IF FIELDS=NIL THEN 
	    	a:=NIL 
	ELSIF CARDINAL(FIELDS)<RELBASE THEN
		a:=ADDRESS(CARDINAL(FIELDS)-GLOBRELOFF)
	ELSE
		a:=ADDRESS(CARDINAL(FIELDS)-RELOFF)
	 	END;
	RETURN a
      	END RELPNTR; 

PROCEDURE RELOCATE; 
(* Relocate one of the entry lists just entered 
  
  Also, if any entry is a link, replace pointer by pointer to 
  linked object*)
VAR	OLDPAR:pparam;
BEGIN
	WHILE nlink<>NIL DO 
	    WITH nlink^ DO 
		RETRNAME(nlink);
		ntype:=RELPNTR(ntype); 
		lower:=RELPNTR(lower); 
		upper:=RELPNTR(upper); 

		exportlink:=RELPNTR(exportlink); 
		CASE nameclass OF 
			tipe:
			    CASE class OF 
				    arraytype:
					elemtype:=RELPNTR(elemtype); 
					indextype:=RELPNTR(indextype); 
					|
				    recordtype:
					subfields:=RELPNTR(subfields); 
					|
				    subrtype,enumtype:
					btype:=RELPNTR(btype); 
					|
				    pointtype,settype:
					reftype:=RELPNTR(reftype); 
					|
				    prtype:
					prpars:=RELPNTR(prpars); 
					OLDPAR:=prpars; 
					WHILE OLDPAR<>NIL DO 
					    WITH OLDPAR^ DO 
						vartype:=RELPNTR(vartype); 
						next:=RELPNTR(next); 
						OLDPAR:=next; 
						END;
					    END;
					 
					|
				    END;
				|(*case class*)
			    linkclass:
				link:=RELPNTR(link); 
				|
			    END; (*case nameclass*)
			nlink:=exportlink; 
			END;
		    END; (*while nlink<>nil*)
	END RELOCATE; (*relocate*)
PROCEDURE READFILE(fn:FileName):BOOLEAN;
TYPE	Block=ARRAY[0..127] OF BYTE;
	pBlock=POINTER TO Block;
VAR	f:FILE;
	reply:INTEGER;
	First:BOOLEAN;
	p:pBlock;
	b:ARRAY[0..BiggestFile] OF BYTE;
BEGIN
	reply:=1;
	WHILE (reply<HIGH(fn)) AND (fn[reply]<>'.') AND (fn[reply]<>' ')
		AND (fn[reply]<>0x) DO
		INC(reply);
		END;
	IF reply>HIGH(fn) THEN RETURN FALSE END;
	IF fn[reply]<>'.' THEN
		IF (reply+3)>HIGH(fn) THEN RETURN FALSE END;
		fn[reply]:='.';
		fn[reply+1]:='S';
		fn[reply+2]:='Y';
		fn[reply+3]:='M';
		fn[reply+4]:=' ';
		END;
	Lookup(f,fn,reply);
	IF reply<>0 THEN 
		WriteString(' File not found');WriteString(fn);WriteLn;
		RETURN FALSE 
		END;

	(*Read the data *)
	SeqReadBlock(f,ADR(b),SIZE(b),reply);
	IF reply=0 THEN 
		WriteString('SYM File Empty ');WriteLn;
		RETURN FALSE 
		END;
	IF reply=SIZE(b) THEN
		WriteString(' SYM file too large ');
		WriteLn;
		RETURN FALSE;
		END;
	ALLOCATE(p,reply);
	Moveup(ADR(b),p,reply);
	GLOBRELOFF:=0;
	NEWMODNAME:=pname(CARDINAL(p)+ORD(b[0])+2);
	RETRNAME(NEWMODNAME);
	RELOFF:=NEWMODNAME^.modbase-CARDINAL(p);
	RELBASE:=NEWMODNAME^.modbase;
	Close(f);
	RETURN TRUE;
	END READFILE;
PROCEDURE ENTERNAME; 
VAR	SID:alfa;
BEGIN
	RETRNAME(COMPLINK); 
	SID:=ID;
	NAMEPNT:=LOOKUP(ID,DISPLAY); 
	IF LASTNAME=NIL THEN DISPLAY:=COMPLINK
	ELSE
		RETRNAME(LASTNAME);
		IF ID<SID THEN LASTNAME^.upper:=COMPLINK
		ELSE LASTNAME^.lower:=COMPLINK END;
		END;
	COMPLINK^.upper:=NIL;
	COMPLINK^.lower:=NIL;
		
      END ENTERNAME; 

PROCEDURE MERGENAMES; 
(* 
  merge the names pointed to by complink into the table one below the 
  top of the display 
  
  Note that the heap is not cut back since that 
  has already been done by the compress routine, if required*)
VAR P:pname; 
BEGIN
	COMPLINK:=NEWMODNAME^.modlist; 
	WHILE (COMPLINK<>NIL) DO 
		ENTERNAME; 
		COMPLINK:=COMPLINK^.exportlink; 
		END;
	END MERGENAMES; 

PROCEDURE LOADFILE(fn:FileName):pname;
(* load a file to be imported   
  
  relocate the entries *)
  
VAR 	TID:alfa; 
	
BEGIN
	DISPLAY:=NIL;
	GLOBRELOFF:=0;
	IF NOT READFILE(fn) THEN 
	    RETURN NIL
	    END;
(*	newmodname points to entry for first module name 
    	which is the name of the module being loaded 
    	it is followed by a chain of names of modules 
   	imported by that module 
  
  	in the case of the first module, we must set the 
  	numbers of the variables to moduleno 
  	but this is irrelevant for the other 
  	modules as the variables cannot be accessed 
  	unless explicitly imported *)

	COMPLINK:=NEWMODNAME; 
	WHILE COMPLINK<>NIL DO 
	    WITH COMPLINK^ DO 
		RETRNAME(COMPLINK);
		modlist:=RELPNTR(modlist); 
		anonlist:=RELPNTR(anonlist); 
		nlink:=modlist; 
		RELOCATE;
		nlink:=anonlist; 
		RELOCATE;
		nextmodule:=RELPNTR(nextmodule); 
		COMPLINK:=nextmodule; 
		END;
	    END;
	MERGENAMES;
	NEWMODNAME^.modnames:=DISPLAY;	     
	RETURN NEWMODNAME; 
	 
	END LOADFILE; 
	END Import.
 
    BAK           wQ�"�   ANSI    SYS           `mg
� s  ASSIGN  COM           `mg
� �  ATTRIB  EXE           `mg
� �:  