{***************************************************************}
{* WINDOW.INC Ver 1.1 - A utility that allows easy creation of *}
{* windows for I/O purposes in a program.  Works with Turbo    *}
{* Pascal.                                                     *}
{* Writen by Orion Poplawski                                   *}
{* 07/11/88                                                    *}
{***************************************************************}

 procedure screen_init;                {Initializes pointer list}
  begin {SCREEN_INIT}
   ss:=nil;
   sl:=nil;
   s1:=nil;
   s2:=nil;
   wind_num:=0;
  end;  {SCREEN_INIT}

 procedure find(i:integer);            {Finds window i in list}
 var l:integer;
  begin {FIND}
   s1:=ss;
   repeat;
    if s1^.num<>i then s1:=s1^.next;
   until s1^.num=i;
  end;  {FIND}

 procedure update(i:integer);          {Draws data in window}
 var l:integer;
     s:string[78];
  begin {UPDATE}
   if i<>0 then find(i);
   with s1^ do
    begin {WITH}
     for l:=1 to yl-2 do
      begin {FOR}
       gotoxy(xs+1,ys+l);
       write(dta[l]);
      end;  {FOR}
    end;  {WITH}
  end;  {UPDATE}

procedure border(i:integer);           {Draws border of window}
var l:integer;
 begin {BORDER}
  find(i);
  with s1^ do
   begin {WITH}
    gotoxy(xs,ys);
    write('+');
    for l:=1 to xl-2 do
     write(io,'-');
    write('+');
    gotoxy(xs,ys+yl-1);
    write('+');
    for l:=1 to xl-2 do
     write('-');
    write('+');
    gotoxy(xs,ys+1);
    write('|');
    for l:=1 to yl-3 do
     write(#10#8'|');
    gotoxy(xs+xl-1,ys+1);
    write('|');
    for l:=1 to yl-3 do
      write(#10#8'|');
    gotoxy(xs+1,ys);
    write('[');
    write(num);
    write(']');
    if num<10 then
     write('-');
    write('<');
    write(title);
    write('>');
   end;  {WITH}
  end;  {BORDER}

 procedure draw(i:integer);            {Draws entire window}
  begin {DRAW}
   border(i);
   update(i);
  end;  {DRAW}

 function create(x,y,w,l:integer;t:str):integer; {Creates new window, no draw}
 var loop:integer;
  begin {CREATE}
   new(s1);
   wind_num:=wind_num+1;
   if ss=nil then
    begin {IF}
     ss:=s1;
     sl:=s1;
     s1^.num:=wind_num;
     s1^.next:=nil;
    end   {IF}
   else
    begin {ELSE}
     sl^.next:=s1;
     sl:=s1;
     s1^.num:=wind_num;
     s1^.next:=nil;
    end;  {ELSE}
   with s1^ do
    begin {WITH}
     title:=t;
     xs:=x;
     ys:=y;
     xl:=w;
     yl:=l;
     s:='';
     for loop:=1 to xl-2 do
      s:=s+' ';
     for loop:=1 to yl-2 do
      dta[loop]:=s;
    end;  {WITH}
   create:=wind_num;
  end;  {CREATE}

 procedure clear(i:integer);           {Erases window data in memory}
 var l:integer;
     s:string[80];
  begin {CLEAR}
   find(i);
   with s1^ do
    begin {WITH}
     s:='';
     for l:=1 to xl-2 do
      s:=s+' ';
     for l:=1 to yl-2 do
      dta[l]:=s;
    end;  {WITH}
  end;  {CLEAR}

procedure hide(i:integer);             {Hides the window from display}
 var l:integer;
     s:string[80];
  begin {HIDE}
   find(i);
   with s1^ do
    begin {WITH}
     s:='';
     for l:=1 to xl do
      s:=s+' ';
     for l:=1 to yl do
      begin {FOR}
       gotoxy(xs,ys+l-1);
       write(s);
      end;  {FOR}
    end;  {WITH}
  end;  {HIDE}

 procedure del(l:integer);             {Deletes window from list}
 var loop:integer;
     s:string[80];
  begin {DEL}
   if s1=ss then ss:=ss^.next
   else if s1=sl then
    begin {IF}
     sl:=s2;
     s2^.next:=nil;
    end   {IF}
   else s2^.next:=s1^.next;
   dispose(s1);
  end;  {DEL}

 procedure plot(i,x,y:integer;s:str);  {Plots data on window in memory}
 var l:integer;
  begin {PLOT}
   find(i);
   with s1^ do
    begin {WITH}
     dta[y]:='';
     if x<>1 then
      for l:=1 to x-1 do
       dta[y]:=dta[y]+' ';
     dta[y]:=dta[y]+s;
     if length(dta[y])<>xl-2 then
      for l:=1 to xl-length(dta[y])-2 do
       dta[y]:=dta[y]+' ';
    end;  {WITH}
  end;  {PLOT}

 procedure ret(i:integer);             {Prints message and awaits a <RETURN>}
  begin {RET}
   find(i);
   with s1^ do
    begin {WITH}
     gotoxy(xs+1,ys+yl-1);
     write('Press <RETURN>');
     gotoxy(1,1);
     readln;
     gotoxy(xs+1,ys+yl-1);
     write('--------------');
    end;  {WITH}
  end;  {RET}

procedure move(i,x,y:integer);         {Moves cursor to point in window}
 begin {MOVE}
  find(i);
  with s1^ do
   gotoxy(xs+x,ys+y);
 end;  {MOVE}

procedure write_str(i,x,y:integer; s:s40);       {Writes string at location}
 begin
  move(i,x,y);
  write(s);
 end;

procedure read_int(i,x,y:integer; var val:integer); {Reads integer at location}
const clear = '  '#8#8;
 begin
  repeat;
   write_str(i,x,y,clear);         {Optional - Use only to erase previous data}          
   {$I-}
   read(val);
   {$I+}
  until ioresult=0;
 end;

procedure in_ch(i,x,y:integer; var ch:char);   {Reads char at location}
const clear = ' '#8;
 begin
  write_str(i,x,y,clear);         {Optional - use only to erase previous data} 
  read(kbd,c);
 end;

Function rstr(n:integer):s40;          {Reads string of length n}
var s:string[40];
    l:integer;
    i,b:byte;
    c:char;

 begin
  l:=1;
  s:='';
  repeat;
   read(kbd,c);
   case c of
            #8:if l>1 then
                begin
                 write(#8);
                 l:=l-1;
                 delete(s,l,1);
                end;
      ' '..'~':if l-1=n then write(#7)
               else
                begin
                 s:=s+c;
                 l:=l+1;
                 write(c);
                end;
   end;
  until c=#13;
  rstr:=s;
 end;

procedure read_str(i,x,y,len:integer; var st:s40);
 begin
  move(i,x,y);
  st:=rstr(len);
 end;
