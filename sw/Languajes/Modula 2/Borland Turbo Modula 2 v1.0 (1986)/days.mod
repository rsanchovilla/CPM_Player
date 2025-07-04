IMPLEMENTATION MODULE Days;

PROCEDURE FAK(Day, Month, Year : INTEGER) : LONGINT;

         (* calculate the Faktor of a date to calculate with it *)
         (* for example to calculate the days between two dates *)
         (* I extract the formula from a TI-58 pocket calculator *)

VAR D,M,Y,M3,Y3 : LONGINT;
BEGIN
  D := LONG(Day);
  M := LONG(Month);
  Y := LONG(Year);

  IF Month > 2 THEN
	M3 := LONG(0.4 * FLOAT(M) + 2.3);
	Y3 := Y
  ELSE
	M3 := 0L;
	Y3 := Y-1L
  END;

  RETURN ( 365L*Y + D + 31L*(M-1L) - M3 + Y3 DIV 4L
		- LONG(FLOAT(Y DIV 100L + 1L) * 0.75)  );
END FAK;


PROCEDURE NewDate(IT,IM,IJ    :INTEGER;	(* starting date *)
		  IZ          :LONGINT;	(* count days to add *)
	      VAR IT2,IM2,IJ2 :INTEGER);(* calculated date *)

         (* add to a starting date days and give back the new date *)
         (* I extract the formula from a HP-41 pocket calculator *)

VAR X : INTEGER;
    FE,F,F1,A,B,C,D,H,Z1 : LONGINT;
    T,M,J,Z,T2,M2,J2 : LONGINT;

BEGIN
  T := LONG(IT); M := LONG(IM); J := LONG(IJ); Z := LONG(IZ);
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
END NewDate;


PROCEDURE Weekday (Day,Month,Year: INTEGER;
		     VAR WD : String);

	(* give back the weekday of a date
	   INT(FAK(Tag,Monat,Jahr) MOD 7L) *)
	(* I extract the formula from a TI-58 pocket calculator *)

BEGIN
  CASE INT(FAK(Day,Month,Year) MOD 7L) OF
      0: WD := 'Saturday';
    | 1: WD := 'Sunday';
    | 2: WD := 'Monday';
    | 3: WD := 'Tuesday';
    | 4: WD := 'Wednesday';
    | 5: WD := 'Thursday';
    | 6: WD := 'Friday';
  END
END Weekday;

END Days.
                  