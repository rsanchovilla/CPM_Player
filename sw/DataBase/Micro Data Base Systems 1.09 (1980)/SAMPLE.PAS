program sample;
{
               MDBS Sample Program
               -------------------
This program is intended for use solely as a simple example
of the Micro Data Base Systems products. It is in no way
intended as an applications program and no claims are made for
its fitness for use. (Indeed, since it doesn't allow editing
of the data base information, it would not be of much use).

The program does illustrate some facets of  use of the MDBS
system. Note that two sets "BOOKS" and "KEYWORDS" are
"AUTO" sets. This causes the appropriate records to be
automatically added to these sets. The "LINK" set is a
many-to-many set which links each book with its keywords.

For this program, book names may be strings of up to 30
characters in length and keywords up to 10 characters.
Try entering various combinations of book names ("BOOK 1",
"BOOK 2","BOOK 3", etc.) and keywords ("KEY 1","KEY 2", etc.)
and then use the "K" and "B" commands to perform retrievals.

Note: To terminate the "Keyword?" prompt in the "A" function,
      enter a carriage return.

Don't forget to create a data base named "SAMPLEDB.DB" using
DDL.COM and SAMPLDDL.DDL.
}
const BLANK10 = '          ';
      BLANK20 = '                    ';
      BLANK30 = '                              ';
      BUFSIZE = 12000;  {This value should be made as large as feasible}
type  CMDSTR=string [30];
      PAC10=packed array [1:10] of char;
      PAC20=packed array [1:20] of char;
      PAC30=packed array [1:30] of char;
      BUFTYPE=packed array [1:BUFSIZE] of char;
      BUFPTR=^BUFTYPE;
      BOOKTYPE=record TITLE:PAC30;
                      AUTHOR:PAC20;
        end;
      OPENTYPE=record DBNAME:packed array [1:14] of char;
                      USERNAME:packed array [1:16] of char;
                      PASS:  packed array [1:12] of char;
                      RWSTAT:packed array  [1:4] of char
        end;
      STATTYPE=record PBIU:integer;
                      PREF:integer;
                      PFLT:integer;
                      DRD:integer;
                      DWR:integer
        end;

var     ERR:integer;
        FOUND:boolean;
        FINISHED:boolean;
        FCN:string [1];
        INP: string [30];
        KEYWORD:PAC10;
        OPENBLK:OPENTYPE;
        BOOK:BOOKTYPE;
        STATS:STATTYPE;
        BUFFER:BUFPTR;

external function DMS (A:CMDSTR):integer;
external function DMS1(A:CMDSTR; var B:OPENTYPE):integer;
external function DMS2(A:CMDSTR; var B:BOOKTYPE):integer;
external function DMS3(A:CMDSTR; var B:PAC30):integer;
external function DMS4(A:CMDSTR; var B:PAC10):integer;
external function DMS5(A:CMDSTR; var B:STATTYPE):integer;
external procedure SETPBF(A:BUFPTR; B:integer);

procedure S;
        {------
FUNCTION "S" -- STOP
         ------}
  begin
     ERR:=DMS('CLOSE');
     FINISHED:=true;
  end;

procedure DMSERR;
        {------
UNEXPECTED DATA MANAGEMENT SYSTEM ERROR RESPONSE DETECTED
         ------}
  begin
         writeln('DMS error',ERR:4,' encountered');
         S {Stop}
  end;
                {------
FUNCTION "A" -- ADD NEW BOOKS/KEYWORDS TO DATA BASE
                 ------}
procedure A;
var I:integer;
    begin
        write('Book Name?');
        readln(INP);
        for I:=1 to 30 do BOOK.TITLE[I]:=' ';
        for I:=1 to length(INP) do BOOK.TITLE[I]:=INP[I];
        if INP<>'' then begin
                ERR:=DMS3('FMSK,BOOKS',BOOK.TITLE);
                if ((ERR<>0) and (ERR<>255)) then  DMSERR;
                if ERR<>255 then
                        writeln('Book already in Data Base')
                else begin
                        write('Author?');
                        readln(INP);
                        BOOK.AUTHOR:=BLANK20;
                        for I:=1 to length(INP) do BOOK.AUTHOR[I]:=INP[I];
                        ERR:=DMS2('CRS,BOOK',BOOK);
                        if ERR<>0 then  DMSERR
                end;
                ERR:=DMS('SOC,LINK');
                        if ((ERR<>0)and(ERR<>255)) then  DMSERR;
        {------ LINK BOOK TO ITS KEYWORDS ------}
                write('Keyword?');
                readln(INP);
                KEYWORD:=BLANK10;
                for I:=1 to length(INP) do KEYWORD[I]:=INP[I];
                while INP<>'' do begin
        {------ CHECK FOR NEW KEYWORD ------}
                        ERR:=DMS4('FMSK,KEYWORDS',KEYWORD);
                        if ((ERR<>255)and(ERR<>0))then  DMSERR;
                        if ERR<>0 then begin
                                writeln('(new keyword)');
                                ERR:=DMS4('CRS,KEYWORD',KEYWORD);
                                if ERR<>0 then  DMSERR;
                        end;
                        ERR:=DMS('ACS,LINK');
                        if ERR<>0 then  DMSERR;
                        write('Keyword?');
                       readln(INP);
                       KEYWORD:=BLANK10;
                       for I:=1 to length(INP) do KEYWORD[I]:=INP[I];
                   end
              end
     end;
procedure B;
var I:integer;
        {------
FUNCTION "B" -- LIST KEYWORDS FOR A GIVEN BOOK
         ------}
    begin
        FOUND:=true;
        write('Book Name?');
        readln(INP);
        BOOK.TITLE:=BLANK30;
        for I:=1 to length(INP) do BOOK.TITLE[I]:=INP[I];
        if INP<>'' then begin
                 ERR:=DMS3('FMSK,BOOKS',BOOK.TITLE);
                if((ERR<>0)and(ERR<>255))then  DMSERR;
                if ERR<>0 then begin
                        writeln('Book not found in Data Base');
                        FOUND:=false;
                end
                else begin
                        ERR:=DMS('SOM,LINK,BOOKS');
                        if((ERR<>0)and(ERR<>255))then  DMSERR;
                        if ERR<>0 then begin
                                writeln('(none)');
                                FOUND:=false;
                        end
                end;
                {------ LIST ALL KEYWORDS FOR THIS BOOK ------}
                ERR:=0;
                while ((ERR<>255)and(FOUND)) do begin
                        ERR:=DMS4('GETM,LINK',KEYWORD);
                        if ERR<>0 then  DMSERR;
                        writeln(KEYWORD);
                        ERR:=DMS('FNM,LINK');
                        if((ERR<>0)and(ERR<>255)) then  DMSERR
                end
        end
   end;
procedure K;
var I:integer;
        {------
FUNCTION "K" -- LIST BOOKS FOR A GIVEN KEYWORD
         ------}
  begin
        write('Keyword?');
        readln(INP);
        KEYWORD:=BLANK10;
        for I:=1 to length(INP) do KEYWORD[I]:=INP[I];
        FOUND:=true;
        if INP<>'' then begin
                ERR:=DMS4('FMSK,KEYWORDS',KEYWORD);
                if((ERR<>0)and(ERR<>255)) then  DMSERR;
                if ERR<>0 then begin
                        writeln('Keyword not found in Data Base');
                        FOUND:=false
                end
                else begin
                        ERR:=DMS('SMM,LINK,KEYWORDS');
                        if((ERR<>0)and(ERR<>255)) then  DMSERR;
                        if ERR<>0 then begin
                                writeln;
                                FOUND:=false
                        end
                end;
        {------ LIST ALL BOOKS FOR THIS KEYWORD ------}
                ERR:=0;
                while ((ERR<>255)and(FOUND)) do begin
                        ERR:=DMS2('GETO,LINK',BOOK);
                        if ERR<>0 then  DMSERR;
                        with BOOK do begin
                                writeln('  ',TITLE,'  ',AUTHOR);
                             end;
                        ERR:=DMS('FNO,LINK');
                        if((ERR<>0)and(ERR<>255)) then  DMSERR
                end
                end
        end;
procedure L;
        {------
FUNCTION "L" -- LIST ENTIRE DATA BASE
         ------}
  begin
        writeln;
        writeln('Keywords:');
        ERR:=DMS('FFM,KEYWORDS');
        if ((ERR<>0)and(ERR<>255)) then  DMSERR;
        while ERR=0 do begin
                ERR:=DMS4('GETM,KEYWORDS',KEYWORD);
                if ERR<>0 then  DMSERR;
                writeln(KEYWORD);
                ERR:=DMS('FNM,KEYWORDS');
                if((ERR<>0)and(ERR<>255)) then  DMSERR
        end;
{------ LIST ALL BOOKS ------}
        writeln;
        writeln('Books:                          Authors:');
        ERR:=DMS('FFM,BOOKS');
        if ((ERR<>0)and(ERR<>255)) then  DMSERR;
        while ERR=0 do begin
                ERR:=DMS2('GETM,BOOKS',BOOK);
                if ERR<>0 then  DMSERR;
                with BOOK do begin
                        writeln('  ',TITLE,'  ',AUTHOR);
                     end;
                ERR:=DMS('FNM,BOOKS');
                if ((ERR<>0)and(ERR<>255))then  DMSERR
        end
  end;
procedure P;
        {------
FUNCTION "P" -- PRINT USAGE STATISTICS
         ------}
  begin
      ERR:=DMS5('STAT',STATS);
        if ERR<>0 then  DMSERR;
        writeln;
        writeln('Data Base Usage Statistics:');
        with STATS do begin
        writeln('Page Buffers in use:',PBIU);
        writeln('    Page References:',PREF);
        writeln('        Page Faults:',PFLT);
        writeln('         Disk Reads:',DRD);
        writeln('        Disk Writes:',DWR);
        end;
    end;


        {------
OPEN DATA BASE
         ------}
begin
        writeln;
        writeln;
        writeln('Book/Keyword Example Program');
        writeln;
        new(BUFFER);  {Allocating the DMS buffer dynamically keeps the
                        COM file size down....}
        SETPBF(BUFFER,BUFSIZE);
  {Set default parameters (Normally, these would be input by the user)}
        OPENBLK.DBNAME:='A:SAMPLEDB.DB ';
        OPENBLK.USERNAME:='USER            ';
        OPENBLK.PASS:='PASSWORD    ';
        OPENBLK.RWSTAT:='MOD ';
        ERR:=DMS1('OPEN',OPENBLK);
        if ERR<>0 then  DMSERR;
        FINISHED:=false;
        {------
DISPLAY OPTIONS TO USER
         ------}
        repeat
                writeln;
                writeln('  (A) Add new Books/Keywords to Data Base');
                writeln('  (B) List Keywords for a given Book');
                writeln('  (K) List Books for a given Keyword');
                writeln('  (L) List entire Data Base');
                writeln('  (P) Print Data Base Usage Statistics');
                writeln('  (S) Stop');
                {------
PROMPT USER FOR NEXT FUNCTION
                 ------}
                writeln;
                write('Function?');
                readln(FCN);
                if (FCN='a')or(FCN='A') then  A
                else if (FCN='b') or (FCN='B') then  B
                else if (FCN='k') or (FCN='K') then  K
                else if (FCN='l') or (FCN='L') then  L
                else if (FCN='p') or (FCN='P') then  P
                else if (FCN='s') or (FCN='S') then  S
                else if (FCN<>'') then
                writeln('*** Illegal function');
        until (FINISHED);
end.
