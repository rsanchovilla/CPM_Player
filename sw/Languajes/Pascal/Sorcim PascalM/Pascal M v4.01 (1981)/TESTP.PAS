program TESTP( OUTPUT, WRNFIL);
(*   Pascal/M installation test program.       *)
(* Provides simple confidence test that files  *)
(* have been copied correctly, so the Pascal/M *)
(* programming system is functional.           *)
(*      Sorcim Pascal/M                       *)
(*$P4*)
const
   WRNFILNAM='TPWARN.txt';
   VERSION='Testp: Version 4.0';
var
   CH: char;
   LINE: string;
   WRNFIL: text;
procedure Filetext;
begin
   Writeln( WRNFIL, 'Copyright (c) 1978, 1979, 1980, 1981 by SORCIM.');
   Writeln( WRNFIL, '       All rights reserved.');
   Write  ( WRNFIL, 'No part of the "PASCAL/M Software System"');
   Writeln( WRNFIL, ' covered by this License Agreement');
   Write  ( WRNFIL, 'may be reproduced, transmitted, transcribed,');
   Writeln( WRNFIL, ' stored in a retrieval system,');
   Write  ( WRNFIL, 'or translated into any language');
   Writeln( WRNFIL, ' or computer language, in any form,');
   Write  ( WRNFIL, 'or by any means, electronic, mechanical,');
   Writeln( WRNFIL, ' magnetic, optical, chemical,');
   Write  ( WRNFIL, 'manual, or otherwise, without the prior');
   Writeln( WRNFIL, ' written permission of');
   Writeln( WRNFIL, '  SORCIM Corporation');
   Writeln( WRNFIL, '  405 Aldo Ave.');
   Writeln( WRNFIL, '  Santa Clara, CA  95050');
   Writeln( WRNFIL);
   Writeln( WRNFIL, 'The files on this disk are as follows:');
   Writeln( WRNFIL, ' PASCAL.pco = Pascal¯M compiler.');
   Writeln( WRNFIL, '   PRUN.com = Pascal/M emulator for CP/M 2.0');
   Writeln( WRNFIL, ' PASLIB.pco = Pascal¯M library.');
   Writeln( WRNFIL, 'PASERRS.txt = Pascal/M error message text.');
   Writeln( WRNFIL, '  TESTP.pas = Pascal test program source code.');
   Writeln( WRNFIL, ' CONFIG.pco = Pascal configure program.');
   Writeln( WRNFIL, ' CONFIG.dat = Data for CONFIG.pco');
                    (*This file*)
end (*end Filetext*) ;

begin
   WRITELN (' ', VERSION);
      (*Write alphabetics*)
   for CH:='A' to 'Z' do
      Write( CH);
   Writeln;
   for CH:='a' to 'z' do
      Write( CH);
   Writeln; Writeln;
      (*Create TPWARN.txt*)
   Purge  ( WRNFILNAM);
   Rewrite( WRNFIL, WRNFILNAM);
   Filetext;
   Close  ( WRNFIL );
      (*Copy TPWARN.txt to the console*)
   Reset  ( WRNFIL, WRNFILNAM);
   while not Eof( WRNFIL) do begin
      Readln ( WRNFIL, LINE);
      Writeln( LINE);
   end;
   Writeln;
end.
s:');
   Wri