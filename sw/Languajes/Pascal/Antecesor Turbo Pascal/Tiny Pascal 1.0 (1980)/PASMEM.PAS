
VAR SRC1, SRC2, COD1, COD2, TOP: INTEGER; 

PROC WRTMEM(A1, A2);
VAR M: INTEGER;
BEGIN
   IF (A2 SHR 8) = 0 THEN BEGIN
      M := 0;
      A2 := 0;
   END ELSE BEGIN
      M:=A2-A1+1;
   END;
   WRITE('%', A1%, '-%', A2%, ', ');
   IF (M >= 0) AND (M < 10000) THEN BEGIN
      WRITE(M#, ' Bytes');
   END ELSE BEGIN
      M := M SHR 10;
      WRITE(M#, ' Kb');
   END;
   WRITE(13);
END;

BEGIN
   SRC1 := MEMW(%4180); (* START OF SOURCE TEXT *)
   SRC2 := MEMW(%4182);
   COD1 := MEMW(%4184); (* START OF PCODE *)
   COD2 := MEMW(%4186);
   TOP  := MEMW(%4190); (* END OF RAM *)
   WRITE('Tiny Pascal RAM usage', 13);
   WRITE('Source Program: ');
   WRTMEM(SRC1, SRC2);
   WRITE('P-Code Program: ');
   WRTMEM(COD1, COD2);
   WRITE('Free Memory: ');
   WRTMEM(COD2+1, TOP);
   WRITE('Available Memory: ');
   WRTMEM(SRC1, TOP);
END.

