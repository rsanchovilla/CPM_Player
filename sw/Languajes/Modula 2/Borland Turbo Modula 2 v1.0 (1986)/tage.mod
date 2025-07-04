IMPLEMENTATION MODULE Tage;

(* This module is the same as Days.mod/Days.def, but uses german language *)

PROCEDURE FAK(Tag, Monat, Jahr : INTEGER) : LONGINT;
VAR T,M,J,M3,J3 : LONGINT;
BEGIN
  T := LONG(Tag);
  M := LONG(Monat);
  IF Jahr < 100 THEN  J := LONG(Jahr + 2000)
                ELSE  J := LONG(Jahr)        END;

  IF Monat > 2 THEN
	M3 := LONG(0.4 * FLOAT(M) + 2.3);
	J3 := J
  ELSE
	M3 := 0L;
	J3 := J-1L
  END;

  RETURN ( 365L*J + T + 31L*(M-1L) - M3 + J3 DIV 4L
		- LONG(FLOAT(J DIV 100L + 1L) * 0.75)  );
END FAK;


PROCEDURE NDATUM(IT,IM,IJ    :INTEGER;	(* Ausgangsdatum *)
		 IZ          :LONGINT;	(* Anzahl Tage zum dazuzaehlen *)
	     VAR IT2,IM2,IJ2 :INTEGER);	(* errechnetes Datum *)

VAR X : INTEGER;
    FE,F,F1,A,B,C,D,H,Z1 : LONGINT;
    T,M,J,Z,T2,M2,J2 : LONGINT;

BEGIN
  T := LONG(IT); M := LONG(IM); J := LONG(IJ); Z := IZ;
  Z1 := Z;
  F1 := FAK(IT,IM,IJ);
  X  := INT(1.0/FLOAT(IM+1)+0.7);
  FE := LONG(FLOAT(IM+1+X*12)*30.6001) + LONG(365.25*FLOAT(IJ-X)) + T;

  REPEAT
	(* ZERLEGEN DES NEUEN DATUMS IN T2,M2,J2 *)
	A := FE+Z;
	B := LONG( (FLOAT(A)-122.1) / 365.25);
	C := A-LONG( FLOAT(B) * 365.25 );
	D := LONG(FLOAT(C)/30.6001);
	T2 := C - LONG(FLOAT(D)*30.6001);
	H := D DIV 14L;
	J2:= B + H;
	M2 := D - 1L - H*12L;
	IF (T2 > 29L) AND (M2 = 2L) THEN T2 := 29L; END;

	IF (T2=29L) AND (M2=2L) AND (J2 MOD 4L <> 0L) THEN
		T2 := 1L;
		M2 := 3L;
	END;

	IT2 := INT(T2); IM2 := INT(M2); IJ2 := INT(J2); (* RETURN-Para. *)

	F := FAK(IT2,IM2,IJ2);
	Z := Z + (Z1-(F-F1));
  UNTIL F-F1 = Z1;
END NDATUM;


PROCEDURE Wochentag (Tag,Monat,Jahr: INTEGER;
		     VAR WT : String);
BEGIN
  CASE INT(FAK(Tag,Monat,Jahr) MOD 7L) OF
      0: WT := 'Samstag   ';
    | 1: WT := 'Sonntag   ';
    | 2: WT := 'Montag    ';
    | 3: WT := 'Dienstag  ';
    | 4: WT := 'Mittwoch  ';
    | 5: WT := 'Donnerstag';
    | 6: WT := 'Freitag   ';
  END
END Wochentag;

END Tage.
                                                                       