type
  GX_MCode  = array[0..202] of byte;
  FARBE     = (BLACK,WHITE);
CONST
  GX_Data:GX_MCode =
  ($ED,$5B,$10,$F4,$2A,$12,$F4,$01,$14,$F4,$CD,$5A,$FC,$E9,$00,$C9,
   $00,$00,$00,$00,$3E,$03,$A2,$57,$E5,$26,$00,$29,$01,$00,$B6,$09,
   $4E,$23,$46,$79,$E6,$F8,$6F,$60,$29,$19,$7D,$E6,$F8,$6F,$79,$E6,
   $07,$B5,$6F,$7B,$E6,$07,$3C,$47,$AF,$37,$1F,$10,$FD,$C1,$4F,$78,
   $FE,$00,$20,$04,$79,$B6,$77,$C9,$FE,$01,$20,$05,$79,$2F,$A6,$77,
   $C9,$FE,$02,$20,$04,$79,$AE,$77,$C9,$FE,$03,$C0,$79,$A6,$32,$13,
   $F4,$C9,$01,$6B,$F4,$CD,$5A,$FC,$E9,$00,$C9,$21,$77,$F4,$01,$08,
   $00,$11,$00,$00,$ED,$B0,$C9,$00,$00,$00,$00,$00,$00,$00,$00,$01,
   $88,$F4,$CD,$5A,$FC,$E9,$00,$C9,$21,$00,$00,$01,$08,$00,$11,$77,
   $F4,$ED,$B0,$C9,$01,$9D,$F4,$CD,$5A,$FC,$E9,$00,$C9,$1E,$00,$3E,
   $00,$16,$00,$07,$17,$17,$17,$6F,$7A,$CE,$B6,$67,$7E,$23,$66,$6F,
   $EB,$29,$29,$19,$29,$01,$08,$00,$3E,$00,$FE,$00,$20,$06,$11,$77,
   $F4,$ED,$B0,$C9,$EB,$21,$77,$F4,$ED,$B0,$C9);

var  GX_MProg : GX_MCode   absolute $F400;

procedure GX_Dot; external $F400;

PROCEDURE PLOT ( X, Y : INTEGER );
var  GX_X    : integer absolute $F410;
     GX_Y    : byte    absolute $F412;
     GX_M    : byte    absolute $F413;
BEGIN
  GX_X:=x;
  GX_Y:=y;
  GX_M:=0;
  GX_Dot;
END;

procedure HideCursor;
begin
 write(#27,'f');
end;

procedure ShowCursor;
begin
  write(#27,'e');
end;

PROCEDURE COLOR ( VALUE : FARBE );
VAR MODE : CHAR;
BEGIN
  CASE VALUE OF
    BLACK : MODE:=#63;
    WHITE : MODE:=#0;
  END;
  WRITE(#27,'b',MODE);
  IF MODE=#63 THEN MODE:=#0 ELSE MODE:=#63;
  WRITE(#27,'c',MODE);
END;

PROCEDURE GRAPHIC;
BEGIN
  GX_MProg:=GX_Data;
  ClrScr;
  HideCursor;
END;

PROCEDURE TEXT;
BEGIN
  ShowCursor;
  GotoXY(0,29);
END;


