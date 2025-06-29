program vocab ;
const symin0=';\(\)\=\+\-\*\/\.\,\:\$\@\<\>\[\]\^\#\\.';
      symin1='"\:=\<+\>+\*+\/+\begin\byte\word\class\\';
      symin2='procedure\function\variable\constant\\..';
      symin3='if\then\elsif\else\repeat\until\while\\.';
      symin4='counting\on\of\array\size\return\is\\...';
      symin5='record\type\or\and\not\end\\............';
      tabsize=100;
      q=2;
type symb=(semic,lpar,rpar,equal,plus,minus,star,slash,dot,
      comma,colon,dollar,acom,less,great,lbrak,rbrak,arrow,
      pownd,quote,assign,lessp,greatp,starp,slashp,beginy,bytey,
      wordy,classy,isy,procy,funy,vary,consty,ify,
      theny,elsify,elsy,repeaty,untily,whiley,county,ony,
      ofy,arrayy,sizey,returny,recordy,typey,ory,andy,noty,
      endy,symbol,nat);
    shortst=packed array[1..40] of char;
    ssss=packed array[1..4] of char;
var voc:array[0..100] of integer;
    strin:packed array[0..500] of char;
    lin:packed array[0..80] of char;
    ch:char;
    isadig,isalet:boolean;
    cs:symb;
    cv:integer;
    toptex,curlen,tvoc,tstr,plin,lnl:integer;
    indrif,val,punt:array[0..tabsize] of integer;
     sorta: array[0..tabsize] of char;
     tlp,tgp:integer;slevel:boolean;
procedure errore(n:integer);
begin writeln; writeln('*****',n)
end;
procedure getch;
begin if plin=lnl then
       begin readln; write('|'); plin:=0;
      while not eoln do begin read(ch);
    if (ch='\')and not(plin=0) then
         begin plin:=pred(plin);  write(lin[plin]) end
     else begin
    lin[plin]:=ch; plin:=succ(plin) end
                    end;
       lnl:=plin;plin:=0
      end;
    ch:=lin[plin];plin:=succ(plin);
    isadig:=('0'<=ch)and(ch<='9');
    isalet:=(('a'<=ch)and(ch<='z'))or(('A'<=ch)and(ch<='Z'))
end;
function sevoc(n,m:integer):integer;
var i,j,k:integer;fl:boolean;
begin i:=0;
 fl:=false;
 while (i<m) and (not fl) do
 begin fl:=(voc[succ(i)]-voc[i]=curlen);
  if fl then begin j:=voc[i];k:=0;
   while (strin[j+k]=strin[tstr+k])and(k<curlen) do k:=succ(k);
  fl:=(k=curlen)
            end;
  i:=succ(i)
 end;
 if fl then i:=pred(i);
sevoc:=i
end;
function getw(n:integer):integer;
var i:integer;
begin i:=sevoc(n,tvoc);
 if i=tvoc then
 begin
   tvoc:=succ(tvoc);tstr:=tstr+curlen;voc[tvoc]:=tstr
 end;
getw:=i
end;
procedure putvoc;
var i,j,k:integer;
begin for i:=0 to tvoc-1 do
 begin write(i,'  ');k:=voc[i];
  for j:=0 to pred(voc[succ(i)]-voc[i]) do write(strin[k+j]) ;
  writeln
 end
end;
procedure gen(l:integer;op:ssss;ar:integer);
begin
end;
procedure instalsy(symin:shortst);
 var i,k:integer;
begin i:=1;
  repeat curlen:=0; 
 while not(symin[i]='\') do
 begin strin[tstr+curlen]:=symin[i]; curlen:=succ(curlen);
    i:=succ(i) end;
  k:=getw(0); i:=succ(i)
      until symin[i]='\'
end;
procedure storch;
begin
 strin[tstr+curlen]:=ch;
 curlen:=succ(curlen);getch
end;
procedure scanim;
var ok:boolean;
begin
  repeat ok:=true;
    while ch=' ' do getch;curlen:=0;
if isalet then
 begin while isalet or isadig do storch;
  cv:=sevoc(ord(beginy),succ(ord(endy)));
  if not(cv=succ(ord(endy))) then
    begin cs:=beginy; while not(ord(cs)=cv) do cs:=succ(cs)
    end
  else begin cs:=symbol; cv:=getw(ord(endy));
        tlp:=succ(tlp); sorta[tlp]:='u'; indrif[tlp]:=cv
       end
 end
else if isadig then
      begin cv:=0;
       repeat cv:=cv*10+(ord(ch)-ord('0')); getch
        until not isadig; cs:=nat
      end
    else begin storch;
       if not(isalet or isadig) then
        begin strin[tstr+1]:=ch;curlen:=2;
        cv:=sevoc(ord(assign),ord(beginy));
         if cv=ord(beginy) then curlen:=1 else getch 
        end;
        if curlen=1 then
          begin cv:=sevoc(0,ord(assign));
            if cv=ord(assign) then
                begin errore(6); ok:=false end;
            cs:=semic
          end
         else cs:=assign;
       while not(ord(cs)=cv) do cs:=succ(cs)
      end
 until ok
end;
function cexpr:integer;
var v:integer;
 function cterm:integer;
 var v:integer;
  function cfact:integer;
   begin if cs=nat then begin cfact:=cv; scanim end
    else if cs=symbol then begin
                           if not(sorta[cv]='k') then errore(228);
                           cfact:=val[cv]; scanim
                           end
     else if cs=lpar then
           begin scanim; cfact:=cexpr;
             if not(cs=rpar) then errore(7); scanim
           end
           else errore(8)
   end;
   begin v:=cfact;
    while (cs=star)or(cs=slash) do
     if cs=star then begin scanim; v:= v*cfact end
       else begin scanim; v:=v div cfact end;
   cterm:=v
  end;
 begin
 if cs=minus then begin scanim; v:=-cterm end
  else begin if cs=plus then scanim; v:=cterm end;
 while (cs=plus)or(cs=minus) do
  if cs=plus then begin scanim; v:=v+cterm end
    else begin scanim; v:=v-cterm end;
 cexpr:=v
end;
procedure constdef;
 procedure constde;
 var cosy:integer;
 begin if not(cs=symbol) then errore(225); cosy:=cv; scanim;
  if not(cs=equal) then errore(226); scanim;
  val[cosy]:=cexpr; sorta[cosy]:='k'
 end;
begin constde;
 while cs=comma do begin scanim; constde end
end;
function alz:integer;
 begin tlp:=succ(tlp); alz:=tlp
 end;
function typedescr(cosy:integer):integer;
var ris,com,i:integer;
begin
 if cs=arrayy then
  begin sorta[cosy]:='a'; scanim; 
    if not(cs=lbrak) then errore(245);
    scanim; ris:=cexpr; if not(cs=rbrak) then errore(246);
    scanim; if not(cs=ofy) then errore(247); scanim;
   punt[cosy]:=typedescr(alz); val[cosy]:=ris*val[punt[cosy]]
  end
 else if (cs=bytey)or(cs=wordy)or(cs=symbol) then
       begin if cs=bytey then cosy:=q
              else if cs=wordy then cosy:=2
                    else cosy:=cv;
        scanim; tlp:=pred(tlp)
      end
 else if cs=recordy then
       begin sorta[cosy]:='s'; scanim; com:=cosy;
        while not(cs=endy) do
         begin i:=alz; punt[cosy]:=i; sorta[i]:='c';
          if not(cs=symbol) then errore(240);
          indrif[i]:=indrif[cv]; scanim;
          if not(cs=isy) then errore(223); scanim;
          cosy:=i; val[i]:=typedescr(alz)
         end;
        scanim; if not(cs=recordy) then errore(283);
        scanim; punt[cosy]:=-1; i:=punt[com]; ris:=0;
        repeat ris:=ris+val[val[i]]; i:=punt[i]
         until i<0 ;
      end;
  typedescr:=cosy
end;
procedure typedef;
var cosy:integer;
 procedure typede;
 begin if not(cs=symbol) then errore(225); scanim;
  cosy:=cv; scanim;
  if not(cs=isy) then errore(223); scanim;
  cosy:=typedescr(cosy)
 end;
begin cosy:=0;
 typede;
 while cs=semic do begin scanim; typede end
end;
procedure litdef;
var cosi,n:integer;
begin if not(cs=symbol) then errore(233);
 sorta[cv]:='l'; cosi:=cv; scanim;
 if not(cs=equal) then errore(234); scanim;
 punt[cosi]:=alz; n:=0;
 if cs=wordy then
  begin scanim;
   gen(indrif[cosi],'FCW ',cexpr);
   val[punt[cosi]]:=q; punt[punt[cosi]]:=2;
   repeat n:=n+q; scanim; gen(0,'FCW ',cexpr);
    val[punt[cosi]]:=n; punt[punt[cosi]]:=2
   until not(cs=comma)
  end
end;
procedure expr;
var thisop:symb;
 procedure simexp;
 var thisop:symb;
  procedure term;
  var thisop:symb;
   procedure factor;
   var re:integer;
    begin
     if cs=pownd then
      begin scanim; if not(cs=lpar) then errore(236); scanim;
       gen(0,'PSQ ',cexpr); if not(cs=rpar) then errore(230);scanim
      end
     else if cs=noty then
      begin scanim; factor; gen(0,'NOTW',0)
      end
     else if cs=lpar then
      begin scanim; expr; if not(cs=rpar) then errore(206); scanim
      end
     else if cs=nat then
      begin gen(0,'PSQ ',cv); scanim
      end
     else if cs=symbol then
      begin if sorta[cv]='k' then
             begin gen(0,'PSQ ',val[cv]); scanim
             end
            else if sorta[cv]='v'then
             begin gen(0,'LOL ',cv); scanim
             end
      end
    end;
   begin factor;
    while cs in [star,slash,andy] do
    begin
     thisop:=cs; scanim; factor;
      if thisop=star then gen(0,'MUL ',0)
       else if thisop=slash then gen(0,'DIV ',0)
             else gen(0,'ANDW',0)
    end
   end;
  begin
   if cs in [plus,minus] then
    begin thisop:=cs; scanim; term; 
     if thisop=minus then gen(0,'NEGI',0)
    end
    else term;
   while cs in [plus,minus,ory] do
    begin thisop:=cs; scanim; term;
     if cs=plus then gen(0,'ADDI',0)
     else if thisop=minus then gen(0,'SUBI',0)
      else gen(0,'ORW ',0)
   end
  end;
 begin simexp;
 if cs in [equal,less,great] then
  begin thisop:=cs; scanim; simexp;
   if thisop=equal then gen(0,'EQ  ',0)
   else if thisop=less then gen(0,'LEQ ',0)
    else gen(0,'GEQ ',0)
 end
end;
procedure statem(labex:integer);
begin
 {.................}
end;
function declara(sall:integer):integer;
 function fieldlis(sall:integer):integer;
  begin
  {******************}
 end;
 begin 
  while cs=typey do begin scanim; typedef end;
  while cs=consty do begin scanim; constdef end;
  while cs=vary do begin scanim; sall:=fieldlis(sall) end
end;
procedure subr;
 var pk:symb; lcs:integer;
 procedure parlis;
 var dum:integer;
 function parentry(i:integer):integer;
  var cosi:integer;
  begin if not(cs=symbol) then errore(240);
  cosi:=cv; sorta[cosi]:='v'; punt[cosi]:=2; scanim;
  if cs=comma then begin scanim; i:=parentry(i)+q end;
  val[cosi]:=i; parentry:=i;
  gen(indrif[cosi],'SET ',i)
 end;
begin if cs=lpar then
  begin scanim; dum:=parentry(q);
   if not(cs=rpar) then errore(241); scanim
  end
 end;
 procedure subrbody(lcs:integer);
 var sall:integer;
 begin sall:=0;
  while cs in [vary,consty,typey] do sall:=declara(sall);
  gen(indrif[lcs],'ALLO',sall);
  if not(cs=beginy) then errore(291); scanim;
  statem(0);
  while cs=semic do begin scanim; statem(0) end;
  if not(cs=endy) then errore(221)
 end;
begin
 pk:=cs; scanim; if not(cs=symbol) then errore(242);
 if pk=funy then sorta[cv]:='f' else sorta[cv]:='p';
 lcs:=cv; scanim; parlis; 
 if not(cs=isy) then errore(223); scanim;
 subrbody(lcs);
 if not(cs=pk) then errore(245); scanim
end;
begin toptex:=0;tvoc:=0;tstr:=0;voc[0]:=0;plin:=0;lnl:=0;
  tlp:=-1;tgp:=0;slevel:=false;
  instalsy(symin0);instalsy(symin1);instalsy(symin2);      
  instalsy(symin3);instalsy(symin4);instalsy(symin5);
  getch;
repeat
  scanim;
  if cs=acom then putvoc;
  if cs=pownd then begin scanim; writeln(cexpr) end
until false
end.
