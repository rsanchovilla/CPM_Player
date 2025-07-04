(*PLOT HILBERT CURVES OF ORDERS 1 TO N*)
CONST N=4; H0=32;
VAR I,H,X,Y,X0,Y0,U,V:INTEGER;

PROC PLOT(X,Y);
BEGIN
   IF (X >= 0) AND (Y >= 0) AND (X < 80) AND (Y < 25) THEN BEGIN
      WRITE(27,'Y', 32+Y, 32+X, '*');
   END;
END;

PROC MOVE;
VAR I,J:INTEGER;
	FUNC MIN(A,B);
		BEGIN IF A>B THEN MIN:=B ELSE MIN:=A END;
	FUNC MAX(A,B);
		BEGIN IF A<B THEN MAX:=B ELSE MAX:=A END;
	BEGIN FOR I:=MIN(X,U) TO MAX(X,U) DO
		FOR J:=MIN(Y,V) TO MAX(Y,V) DO
			PLOT(I,J);
		U:=X; V:=Y
	END;
 
PROC P(TYP,I);
	BEGIN IF I>0 THEN
		CASE TYP OF
1:		BEGIN P(4,I-1); X:=X-H; MOVE;
				P(1,I-1); Y:=Y-H; MOVE;
				P(1,I-1); X:=X+H; MOVE;
				P(2,I-1) END;
2:		BEGIN P(3,I-1); Y:=Y+H; MOVE;
				P(2,I-1); X:=X+H; MOVE;
				P(2,I-1); Y:=Y-H; MOVE;
				P(1,I-1) END;
3:		BEGIN P(2,I-1); X:=X+H; MOVE;
				P(3,I-1); Y:=Y+H; MOVE;
				P(3,I-1); X:=X-H; MOVE;
				P(4,I-1) END;
4:		BEGIN P(1,I-1); Y:=Y-H; MOVE;
				P(4,I-1); X:=X-H; MOVE;
				P(4,I-1); Y:=Y+H; MOVE;
				P(3,I-1) END
		END
	END;
 
BEGIN (*MAIN*)
	WRITE(27,'E','HILBERT CURVES');
	I:=0; H:=H0; X0:=H DIV 2; Y0:=X0;
	REPEAT I:=I+1; H:=H DIV 2;
		X0:=X0+H DIV 2; Y0:=Y0+H DIV 2;
		X:=X0+(I-1)*32; Y:=Y0+10; U:=X; V:=Y;
		P(1,I)
	UNTIL I=N
END.
