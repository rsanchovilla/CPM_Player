MODULE TESTC321;

FROM SYSTEM	IMPORT ADR, ADDRESS, BYTE, WORD;
FROM Files	IMPORT FILE, Create, Open, Close, WriteBytes, WriteByte;
FROM CRC3216	IMPORT Pcrc32, Pcrc16,
			InitCRC, mkCRC, GPCRC32, GPCRC16,
			ExitY;
FROM InOut	IMPORT WriteHex;

CONST
    LCount = 1;	(* counts for loops *)

    Fieldsize = 256;	(* no of bytestream 000 .. 255 *)
    Fieldtop = Fieldsize * 128 -1 ; (* 0.. Fieldtop *)

VAR crc32 : Pcrc32;	(* Pointer auf crc32 / crc16 *)
    crc16 : Pcrc16;
    i : CARDINAL;
    field  : ARRAY [0..Fieldtop] OF BYTE;
    f : FILE;

PROCEDURE PrintCRC32( crc32 : Pcrc32 );
BEGIN

  WITH crc32^ DO
    WRITE('crc32  [BYTES]  = ');
    WriteHex(CARD(INTEGER(crc[3])),2);
    WriteHex(CARD(INTEGER(crc[2])),3);
    WriteHex(CARD(INTEGER(crc[1])),3);
    WriteHex(CARD(INTEGER(crc[0])),3);
    WRITELN;
    WRITELN('crc32 (LONGINT) = ',Wert);
  END;
  WRITELN;

END PrintCRC32;

PROCEDURE PrintCRC16( crc16 : Pcrc16 );
BEGIN

  WITH crc16^ DO
    WRITE('crc16   [BYTES]  = ');
    WriteHex(CARD(INTEGER(crc[1])),2);
    WriteHex(CARD(INTEGER(crc[0])),3);
    WRITELN;
    WRITE('crc16   [HEX]    = ');
    WriteHex(Wert,4);
    WRITELN;
    WRITELN('crc16  (CARDINAL) = ',Wert);
  END;
  WRITELN;

END PrintCRC16;

BEGIN
  crc32 := GPCRC32();	(* Get the pointer to the crc32 *)
  			(* This is nessasary only one time *)

  crc16 := GPCRC16();	(* Get the pointer to the crc16 *)
  			(* This is nessasary only one time *)

(**  PrintCRC32(crc32);	/* Print crc32 bevor init *)

(**  InitCRC; **)
(**  PrintCRC32(crc32);	/* print crc32 after initCRC *)

  WRITELN('Fieldtop = ',Fieldtop);
  WRITE('initial Field ...');

(**  Create (f,'bytestre.bin'); **)

  FOR i := 0 TO Fieldtop DO
     field[i] := BYTE(i);
(*
     WRITELN('i = ',i,'  f[i-1]: ',INTEGER(field[i-1]),
                      '  f[i]: ',INTEGER(field[i]),
                      '  f[i+1]: ',INTEGER(field[i+1]));
     WriteByte(f, field[i]);
*)
  END;
(**  Close (f); **)


(* um eine File zu erzeugen, leider wird am Ende noch ein CP/M/Rekord
   (128 Bytes) noch dran gehaengt :-/ *)
(***
  Create (f,'bytestre.bin');
  WriteBytes(f, ADR(field), SIZE(field));
  Close (f);
***)

  WRITELN(' Field initialiced!  -->  Now calculate CRC32...');
  InitCRC;
  FOR i:=1 TO LCount DO
  	mkCRC(ADR(field), SIZE(field));
  	WRITE(i:4);
  END;
  WRITELN; WRITELN;

  PrintCRC32(crc32);	(* print crc32 after initCRC *)
  PrintCRC16(crc16);	(* print crc16  after initCRC *)

(*  ExitY; /* exit yaze, nur fuer Testzwecke *)

END TESTC321.
                                                                                 