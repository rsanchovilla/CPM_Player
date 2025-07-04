MODULE S9200;

FROM Windows IMPORT
  wiOpen, wiShow, wiWriteln, wiClose, wiErase,
  wiGethl, wiSethl, wiHlup , wiHldown, wst, y;

FROM TermAtt IMPORT
  CursorOn, CursorOff;

FROM Terminal IMPORT
  GotoXY, ClearScreen, ReadChar,
  WriteString, WriteLn;

CONST
  delay = 65500; (* 10000; *)

VAR
  t1,t2,t3,t4,t5,t6,t7,t8,t9: wst;
  ch: CHAR;
  i: CARDINAL;

BEGIN
  CursorOff;
  ClearScreen;
  t1 := "This is the windows demonstration program.";
  t2 := "The program is written in the Z80 version";
  t3 := "of Turbo Modula 2, release I.0.";
  t4 := "Written by Bob Catiller for:";
  t5 := "           Emerson Computer Power";
  wiOpen(1,10,5,46,7,4);
  wiShow(1);
  wiWriteln(1,t1);
  wiWriteln(1,t2);
  wiWriteln(1,t3);
  wiWriteln(1,t4);
  wiWriteln(1,t5);
  FOR i := 1 TO delay DO
  END; (* FOR *)
  wiErase(1);
  wiClose(1);
  t1 := "Up to 10 windows may be opened at one time.";
  t2 := "Memory used by windows is dynamically";
  t3 := "allocated as windows are opened.";
  wiOpen(1,10,5,47,5,4);
  wiShow(1);
  wiWriteln(1,t1);
  wiWriteln(1,t2);
  wiWriteln(1,t3);
  FOR i := 1 TO delay DO
  END; (* FOR *)
  wiErase(1);
  wiClose(1);
  t1 := "Memory space is de-allocated after a window";
  t2 := "is closed. Text may be written to a window,";
  t3 := "and a line of text may be highlighted. The";
  t4 := "highlighting may be moved, and the current";
  t5 := "row position of the highlighting may be";
  t6 := "read from the window. The window routines";
  t7 := "provide for building pop-up/pull-down menus";
  t8 := "with selection of highlighted items.";
  wiOpen(1,10,5,47,10,4);
  wiShow(1);
  wiWriteln(1,t1);
  wiWriteln(1,t2);
  wiWriteln(1,t3);
  wiWriteln(1,t4);
  wiWriteln(1,t5);
  wiWriteln(1,t6);
  wiWriteln(1,t7);
  wiWriteln(1,t8);
  GotoXY(0,0);
  WriteString("Press any key to Continue.");
  ReadChar(ch);
  wiErase(1);
  wiClose(1);
  ClearScreen;
  t1 := "Line 1 ";
  t2 := "Line 2 ";
  t3 := "Line 3 ";
  t4 := "Line 4 ";
  t5 := "Line 5 ";
  t6 := "Line 6 ";
  t7 := "Line 7 ";
  t8 := "Line 8 ";
  t9 := "Line 9 ";
  wiOpen(1,5,10,10,10,1);
  wiShow(1);
  t1 := "Line 1 ";
  t2 := "Line 2 ";
  t3 := "Line 3 ";
  t4 := "Line 4 ";
  t5 := "Line 5 ";
  t6 := "Line 6 ";
  t7 := "Line 7 ";
  t8 := "Line 8 ";
  t9 := "Line 9 ";
  wiOpen(1,5,10,10,10,1);
  wiShow(1);
  wiOpen(2,8,7,20,11,2);
  wiShow(2);
  wiOpen(3,11,6,20,11,3);
  wiShow(3);
  wiOpen(4,14,9,20,11,4);
  wiShow(4);
  wiOpen(5,17,11,20,11,5);
  wiShow(5);
  wiOpen(6,20,12,20,11,6);
  wiShow(6);
  wiOpen(7,40,1,20,11,7);
  wiShow(7);
  wiOpen(8,45,3,20,11,8);
  wiShow(8);
  wiOpen(9,50,6,20,11,9);
  wiShow(9);
  wiOpen(0,55,9,20,11,10);
  wiShow(0);
  wiWriteln(0,t1);
  wiWriteln(0,t2);
  wiWriteln(0,t3);
  wiWriteln(0,t4);
  wiWriteln(0,t5);
  wiWriteln(0,t6);
  wiWriteln(0,t7);
  wiWriteln(0,t8);
  wiWriteln(0,t9);
  wiSethl(0,1);
  GotoXY(0,0);
  WriteString("These are the ten window types.");
  WriteLn;
  WriteString("Cursor up key moves highlighting up.");
  WriteLn;
  WriteString("Cusor down key moves highlighting down.");
  WriteLn;
  WriteString("Carriage return key to continue.");
  ch := CHR(0);
  WHILE ch <> CHR(13) DO
    ReadChar(ch);
    IF (ch = CHR(10)) OR (ch = " ") THEN (* Cur down key *)
      wiHldown(0);
    ELSIF ch = CHR(11) THEN (* Cur up key *)
      wiHlup(0);
    END;(* IF *)
  END;(* WHILE *)
  GotoXY(0,23);
  wiGethl(0);(* Sets y to highlighted row *)
  CASE y OF
    | 1 : WriteString("Line 1 was selected.")
    | 2 : WriteString("Line 2 was selected.")
    | 3 : WriteString("Line 3 was selected.")
    | 4 : WriteString("Line 4 was selected.")
    | 5 : WriteString("Line 5 was selected.")
    | 6 : WriteString("Line 6 was selected.")
    | 7 : WriteString("Line 7 was selected.")
    | 8 : WriteString("Line 8 was selected.")
    | 9 : WriteString("Line 9 was selected.")
  END;(* CASE *)
  GotoXY(40,23);
  WriteString("Press any Key to continue.");
  ReadChar(ch);
  wiErase(0);
  wiClose(0);
  wiShow(9);
  wiErase(9);
  wiClose(9);
  wiShow(8);
  wiErase(8);
  wiClose(8);
  wiShow(7);
  wiErase(7);
  wiClose(7);
  wiShow(6);
  wiErase(6);
  wiClose(6);
  wiShow(5);
  wiErase(5);
  wiClose(5);
  wiShow(4);
  wiErase(4);
  wiClose(4);
  wiShow(3);
  wiErase(3);
  wiClose(3);
  wiShow(2);
  wiErase(2);
  wiClose(2);
  wiShow(1);
  wiErase(1);
  wiClose(1);
  ClearScreen;
  CursorOn;
END S9200.
                                                                 