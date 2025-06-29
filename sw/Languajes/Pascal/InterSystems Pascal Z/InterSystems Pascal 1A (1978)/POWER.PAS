(*$I+ *)
PROGRAM TEST;
VAR A,B,V : INTEGER;

FUNCTION POWER (X,Y : INTEGER) : INTEGER;
	BEGIN
		IF Y=1 THEN
			POWER := X
	ELSE
		POWER := X * POWER(X,Y-1);
	END ; (* POWER *)

BEGIN
V := POWER(A,B);
END...
