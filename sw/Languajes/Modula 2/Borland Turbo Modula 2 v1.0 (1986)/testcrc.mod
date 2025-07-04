MODULE TestCRC32;

FROM SYSTEM	IMPORT ADR, ADDRESS, BYTE, WORD;
FROM CRC32	IMPORT Pcrcval, InitCRC, mkCRC, GetPCRC, ExitY;
FROM InOut	IMPORT WriteHex;

CONST
    LCount = 1;	(* counts for loops *)

    Fieldsize = 127;	(* no of bytestream 000 .. 255 *)
    Fieldtop = Fieldsize * 256 -1 ; (* 0.. Fieldtop *)

VAR crcval : Pcrcval;	(* Pointer auf crcval *)
    i : INTEGER;
    field  : ARRAY [0..Fieldtop] OF BYTE;

PROCEDURE PrintCRCval( crcval : Pcrcval );
BEGIN

  WITH crcval^ DO
    WRITE('crcval  [BYTES]  = ');
    WriteHex(CARD(INTEGER(crc[0])),2);
    WriteHex(CARD(INTEGER(crc[1])),3);
    WriteHex(CARD(INTEGER(crc[2])),3);
    WriteHex(CARD(INTEGER(crc[3])),3);
    WRITELN;
    WRITELN('crcval (LONGINT) = ',Wert);
  END;
  WRITELN;

END PrintCRCval;

BEGIN
  crcval := GetPCRC();	(* Get the pointer to the crcval *)
  			(* This is nessasary only one time *)

  PrintCRCval(crcval);	(* Print crcval bevor init *)

  InitCRC;
  PrintCRCval(crcval);	(* print crcval after initCRC *)

  WRITELN('Fieldtop = ',Fieldtop);
  WRITE('initial Field ...');
  WRITELN('Fildsize = ', SIZE(field));
  FOR i := 0 TO Fieldtop DO
     field[i] := BYTE(i);
(*
     WRITELN('i = ',i,'  f[i-1]: ',INTEGER(field[i-1]),
                      '  f[i]: ',INTEGER(field[i]),
                      '  f[i+1]: ',INTEGER(field[i+1]));
*)
  END;

  WRITELN(' Field initialiced!  -->  Now calculate CRC32...');
  InitCRC;
  FOR i:=1 TO LCount DO
  	mkCRC(ADR(field), SIZE(field));
  	WRITE(i:4);
  END;
  WRITELN; WRITELN;

  PrintCRCval(crcval);	(* print crcval after initCRC *)

  ExitY; (* exit yaze, nur fuer Testzwecke *)

END TestCRC32.
                                                                                                 