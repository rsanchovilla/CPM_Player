MODULE TestOvl;
FROM Terminal IMPORT WriteString,WriteLn;
IMPORT	Ovl1,Ovl2;
BEGIN
	WriteString('overlay test ');WriteLn;
	WriteString(' calling ovl1 ');
	Ovl1.Fred;
	WriteString(' calling ovl2 ');
	Ovl2.Fred;
	WriteString(' done');WriteLn;
	END TestOvl.
                                                   *** STACK OVERFLOW ***
$               