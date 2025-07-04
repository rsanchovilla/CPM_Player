MODULE CRC;

FROM SYSTEM	IMPORT FILL, ADR, ADDRESS, BYTE, WORD;
FROM Strings	IMPORT Length;
FROM ComLine	IMPORT PromptFor;
FROM FILES	IMPORT FILE, Open, Close, ReadBytes, NoTrailer, FileSize, EOF;
FROM InOut	IMPORT WriteHex;
(*---*)
FROM CRC32	IMPORT Pcrc32, InitCRC,mkCRC, GPCRC32, ExitY;

CONST
    Buffersize = 128 * 128;	(* Buffersize must be n * 128 !!! *)
    BufferTop  = Buffersize - 1;
    CR = 13; BS= 8;

VAR (* crc32	: Pcrc32;	(/* Pointer auf crc32 *)
    fetched	: CARDINAL;
(*    len		: LONGINT; *)
    buffer	: ARRAY [0..BufferTop] OF BYTE;
    f		: FILE;
    FName	: ARRAY [0..20] OF CHAR;

PROCEDURE PrCRCByte( crc : BYTE );
BEGIN
    IF INTEGER(crc) <= 0FH THEN
	WRITE(' 0');
	WriteHex(CARD(INTEGER(crc)),0);
    ELSE
	WriteHex(CARD(INTEGER(crc)),3);
    END;
END PrCRCByte;

PROCEDURE PrCRC32( crc32 : Pcrc32 );
BEGIN
  WITH crc32^ DO
    PrCRCByte((crc[3]));
    PrCRCByte((crc[2]));
    PrCRCByte((crc[1]));
    PrCRCByte((crc[0]));
  END;
END PrCRC32;

BEGIN

  (* crc32 := GPCRC32();	(/* Get the pointer to the crc32 *)
  			(* This is nessasary only one time *)

  WRITELN("Buffersize: ",Buffersize); WRITELN;

  (* FILL(ADR(buffer), SIZE(buffer), 99H); *)

  FName := 'a:z.ttt';
(*  PromptFor("Filename: ", FName); *)
  WRITELN("Filename          CRC32         Filelength");
  WRITE(FName,' ');
  IF (FName[0] # 0C) AND Open(f, FName) THEN
	NoTrailer(f);
	(* WRITELN("    FileSize(f): ",FileSize(f)); *)

	InitCRC;
	(* len := 0L; *)
	REPEAT
	  fetched := ReadBytes(f, ADR(buffer), Buffersize);
	  (* len := len + LONG(fetched); *)
	  (* WRITELN("fetched: ",fetched:2," (",len:1,")"); *)
	  WRITE('.');
	  mkCRC(ADR(buffer), fetched);
	UNTIL EOF(f) (* OR (fetched < Buffersize) *) ;

	WRITE(CHR(CR),FName);
	FOR fetched := 1 TO 17-Length(FName) DO WRITE(' ') END;
	(* PrCRC32(crc32);*)
	PrCRC32( GPCRC32() );
	WRITELN(FileSize(f));
	Close(f);
  ELSE
	WRITELN(" not found!")
  END;

(* ExitY; /* exit yaze, nur fuer Testzwecke *)

END CRC.
  