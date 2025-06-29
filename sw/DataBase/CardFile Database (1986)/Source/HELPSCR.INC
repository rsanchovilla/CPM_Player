Procedure Help;
Var
   KKey: Char;
Begin
   Clrscr;
   GotoXY(32,1);
   Write('FILE CARD DATABASE');
   GotoXY(33,3);
   Write('Editing Commands');
   GotoXY(1,4);
   Write('--------------------------------------------------------------------------------');
   GotoXY(1,5);
   Write('^S or ^H = Cursor Left *                    ^Y = Delete Line');
   GotoXY(1,7);
   Write('^D or ^L = Cursor Right *                   ^Q = Delete to End of Line *');
   GotoXY(1,9);
   Write('^E or ^K = Cursor up *                      ^Z = Delete Entire Field');
   GotoXY(1,11);
   Write('^X or ^J = Cursor Down                      ^N = Insert Line');
   GotoXY(1,13);
   Write('^A = Left End of Line                       ^R = Beginning of field');
   GotoXY(1,15);
   Write('^F = Right End of Line                      ^C = End of Field');
   GotoXY(1,17);
   Write('^I or <TAB> = Insert Space at Cursor *      <ESC> = Quit *');
   GotoXY(1,19);
   Write('Items marked with an asterisk (*) are available when entering key words');
   GotoXY(1,20);
   Write('--------------------------------------------------------------------------------');
   GotoXY(1,22);
   Write('Type any key to continue... ');
   Read(Kbd,KKey);
   Clrscr;
   DisplayScr;
   DisplayRec;
   Gotoxy((X+XOffset),(Y+YOffset));
End;
