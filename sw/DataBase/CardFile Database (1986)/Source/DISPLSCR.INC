{File: DISPLSCR.LIB}

Procedure DisplayRec;
Begin
   Gotoxy(55,3);
   Write('Record# ',FilePointer:4);
   Gotoxy(13,3);
   Write(TagArray[1]);
   Gotoxy(12,22);
   Write(TagArray[2]);
   Gotoxy(31,22);
   Write(TagArray[3]);
   Gotoxy(50,22);
   Write(TagArray[4]);
   For Row := 1 to MaxRows do
   Begin
      For Column := 1 to MaxColumns do
      Begin
         Gotoxy((Column+XOffset),(Row+YOffset));
         Write(CardArray[Column,Row]);
      End;
   End;
End;