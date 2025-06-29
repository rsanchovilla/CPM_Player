(*$I+*)
PROGRAM READ$AND$WRITE$REVERSE;


	PROCEDURE READ$WRITE ;
		VAR	CH : CHAR;
		BEGIN
			READ (CH);
			IF EOLN(0) <> TRUE THEN
			READ$WRITE;
			WRITE (CH);
		END;


BEGIN
READ$WRITE;
WRITELN;
END...
