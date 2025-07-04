MODULE CRCM;

FROM SYSTEM	IMPORT FILL, ADR, ADDRESS, BYTE, WORD;
FROM Strings	IMPORT Length;
FROM ComLine	IMPORT PromptFor;
FROM FILES	IMPORT FILE, Open, Close, ReadBytes, NoTrailer, FileSize, EOF;
FROM InOut	IMPORT WriteHex;
(*---*)
FROM CRC3216	IMPORT Pcrc32,Pcrc16, InitCRC,mkCRC, GPCRC32,GPCRC16, ExitY;

CONST
    Buffersize = 128 * 128;	(* Buffersize must be n * 128 !!! *)
    BufferTop  = Buffersize - 1;
    CR = 13; TAB = 9;

TYPE
    TFName = ARRAY [0..20] OF CHAR;

VAR crc32	: Pcrc32;	(* Pointer auf crc32 / crc16 *)
    crc16	: Pcrc16;
    fetched	: CARDINAL;
    buffer	: ARRAY [0..BufferTop] OF BYTE;
    f		: FILE;
    FName	: TFName;

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

PROCEDURE PrCRC16( crc16 : Pcrc16 );
BEGIN
  WITH crc16^ DO
    PrCRCByte((crc[1]));
    PrCRCByte((crc[0]));
  END;
END PrCRC16;

PROCEDURE GenCRC(FName : TFName);
BEGIN
  WRITE(FName,' ');
  IF (FName[0] # 0C) AND Open(f, FName) THEN
	NoTrailer(f);
	(* WRITELN("    FileSize(f): ",FileSize(f)); *)

	InitCRC;
	REPEAT
	  fetched := ReadBytes(f, ADR(buffer), Buffersize);
	  (* WRITELN("fetched: ",fetched);*)
	  WRITE(".");
	  mkCRC(ADR(buffer), fetched);
	UNTIL EOF(f) (* OR (fetched < Buffersize) *) ;

	WRITE(CHR(CR),FName);
	FOR fetched := 1 TO 17-Length(FName) DO WRITE(' ') END;
	PrCRC32(crc32);
	WRITE('  ');
	PrCRC16(crc16);
	WRITELN(FileSize(f));
	Close(f);
  ELSE
	WRITELN(" not found!")
  END;
END GenCRC;


BEGIN
  crc32 := GPCRC32();	(* Get the pointer to the crc32 *)
			(* This is nessasary only one time *)

  crc16 := GPCRC16();	(* Get the pointer to the crc16 *)
			(* This is nessasary only one time *)

  WRITELN("Buffersize: ",Buffersize); WRITELN;

  FILL(ADR(buffer), SIZE(buffer), 99H);

  WRITELN("Filename          CRC32         CRC16    Filelength");

  PromptFor("Filename: ", FName);
  GenCRC(FName);

(*
  FName := 'p:cpm3.sys'; GenCRC(FName);
  FName := 'p:bdos3.spr'; GenCRC(FName);
  FName := 'p:bios3.spr'; GenCRC(FName);
  FName := 'p:bnkbdos3.spr'; GenCRC(FName);
  FName := 'p:bnkbios3.spr'; GenCRC(FName);
  FName := 'p:resbdos3.spr'; GenCRC(FName);
  FName := 'a:z.ttt'; GenCRC(FName);
*)

(*  ExitY; /* exit yaze, nur fuer Testzwecke *)

END CRCM.
                                                                   