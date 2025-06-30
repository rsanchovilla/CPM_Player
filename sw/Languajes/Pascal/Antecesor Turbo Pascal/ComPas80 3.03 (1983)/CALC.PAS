program calculate(input,output);

const
  txtlenght = 180;
  labellenght = 12;
  paramlenght = 18;
  exprlenght = 64;
  columnlenght = 25;
  maxfields = 30;
  maxlabels = 50;
  space = ' ';

type
  errortype = (ueof,nolab,colmis,exprerr,delmis,ligmis,fileerr,lablon,
               exprlon,collon,maxlab,maxfld,unpart);
  txttype = string(.txtlenght.);
  paramtype = string(.paramlenght.);
  spacetype = (skipspace,spaceok);
  filenames = (calcf,dataf,none);
  paramnames = (datafile,calcfile,listfile);
  labeltype = string(.labellenght.);
  columntype = string(.columnlenght.); 
  exprtype = string(.exprlenght.);
  fieldtype = record
                name: labeltype;
                expr: exprtype;
                index,lenght: integer;
                format,txt,unit: columntype;
              end;

var
  list,data,calc: text;
  txt1,txt2,txt3,lin1,lin2,lin3,lin4: txttype;
  fldarr: array(.1..maxfields.) of fieldtype;
  labeltab: array(.1..maxlabels.) of record
              name: labeltype;
              value: real;
            end;
  param: array(.paramnames.) of paramtype;
  labels,fields,p1,p2,p3,p4,m,fld,fldcount,tabul,datalin,calclin: integer;
  tempexpr: exprtype;
  tmcol: columntype;
  curfile: filenames;

procedure error(err: errortype);
var dummy: real;

procedure exit; begin code 195,0,0 end;

begin
  write('Err # ',ord(err):2,' : ');   
  case err of
    ueof:     write('Unexpected end of file');
    nolab:    write('Label does not exist');
    colmis:   write('Column missing');
    exprerr:  write('Expression error');
    delmis:   write(''' expected');
    ligmis:   write('= expected');
    fileerr:  write('Fileerror');
    lablon:   write('Label too long');
    exprlon:  write('Expression too long');
    collon:   write('Column too long');
    maxlab:   write('Label overflow');
    maxfld:   write('Field overflow');
    unpart:   write('Unknown partdescriptor');
    others:   write('System error');
  end;
  writeln;
  if err=fileerr then
  begin txt1:=param(.calcfile.);txt2:=param(.datafile.) end;
  if curfile=calcf then writeln('Calcline # ',calclin:2,' : ',txt1);
  if curfile=dataf then writeln('Dataline # ',datalin:2,' : ',txt2);
  exit
end;
    
procedure readline(ifile: filenames;var txt: txttype; spacing: spacetype);
begin
  curfile:=ifile;
  repeat
    if ifile=calcf then
    begin
      if eof(calc) then error(ueof);
      calclin:=calclin+1; readln(calc,txt);
    end;
    if ifile=dataf then
    begin
      if eof(data) then error(ueof);
      datalin:=datalin+1; readln(data,txt);
    end;
  until (txt(.1.)<>'!') and ((spacing=spaceok) or (txt<>empty)); 
end;

procedure big(var txt: txttype);
var
  point: integer;
  temptxt: txttype;
begin
  temptxt:=txt; txt:='';
  for point:=1 to len(temptxt) do
  begin
    txt:=txt+chr(ord(temptxt(.point.))-(temptxt(.point.)>='a')*32);
  end;
end;

procedure allocate(labelname:labeltype; default: real);
var
  n: integer;
  found: boolean;
begin
  found:=false;
  for n:=1 to labels do if labelname=labeltab(.n.).name then
  begin
    labeltab(.n.).value:=default; found:=true;
  end;
  if not found then
  begin
    if succ(labels)>maxlabels then error(maxlab);
    labels:=labels+1;
    labeltab(.labels.).name:=labelname; labeltab(.labels.).value:=default;
  end;
end;

function labelvalue(labelname: labeltype): real;
var
  n: integer;
  found: boolean;
begin
  found:=false;
  for n:=1 to labels do if labelname=labeltab(.n.).name then
  begin
    labelvalue:=labeltab(.n.).value; found:=true;
  end;
  if not found then error(nolab);  
end;

procedure setlabel(labelname: labeltype;value: real);
var
  n: integer;
  found: boolean;
begin
  found:=false;
  for n:=1 to labels do if labelname=labeltab(.n.).name then
  begin
    labeltab(.n.).value:=value; found:=true;
  end;
  if not found then error(nolab);
end;

function realint(arg: real): integer;
var
  i: integer;
  n: real;
begin
  i:=0; n:=0; arg:=abs(round(arg));
  while arg<>n do
  begin
     i:=i+1; n:=n+1;
  end;
  realint:=i;
end;

function biground(arg: real): real;
var temp: real;
begin
  temp:=frac(arg); arg:=int(arg); if temp>=0.5 then arg:=arg+1; biground:=arg;
end;

function format(form: columntype;value: real): columntype;
var
  sign: (plus,minus);
  pointpos,n: integer;
  digit: real;
  tmpfrm: columntype;
begin
  pointpos:=len(form); tmpfrm:='';
  for n:=1 to len(form) do if form(.n.)='.' then pointpos:=n;
  if abs(value)=value then sign:=plus else sign:=minus; value:=abs(value);
  value:=biground(value*pwrten(len(form)-pointpos));
  for n:=len(form) downto 1 do
  begin
    if form(.n.)='.' then tmpfrm:='.'+tmpfrm else
    begin
      digit:=frac(value/10)*10; value:=int(value/10);
      tmpfrm:=chr(realint(digit)+48)+tmpfrm;
    end;
  end;
  if int(value)<>0 then tmpfrm:=tmpfrm(.1..len(tmpfrm)-1.)+'*';
  if sign=plus then tmpfrm:=space+tmpfrm else tmpfrm:='-'+tmpfrm;n:=2;
  while (tmpfrm(.n.)='0') and (tmpfrm(.n+1.)<>'.') do
  begin
    tmpfrm:=space+tmpfrm(.1..n-1.)+tmpfrm(.n+1..columnlenght.); n:=n+1;
  end;
  if len(tmpfrm)>len(form) then tmpfrm:=tmpfrm(.2..columnlenght.);
  format:=tmpfrm;
end;      
  
procedure colbegin(var txt: txttype;var pos: integer);
begin
  while (txt(.pos.)=space) and (pos<=txtlenght) do pos:=pos+1;
  if pos>txtlenght then error(colmis);
end;
    
procedure colend(var txt: txttype;var pos: integer);
begin
  while (txt(.pos.)<>space) and (txt(.pos.)<>empty) and (pos<=txtlenght) do
  pos:=pos+1;
end;    

procedure delimiter(var txt: txttype;var pos:integer);
begin
  repeat pos:=pos+1 until (txt(.pos.)='''') or (pos>txtlenght);
  if pos>txtlenght then error(delmis); 
end;   
        
function expression(var expr: exprtype): real;
type
  character = string(.1.);
var
  pos: integer;
  ch: character;

procedure nextchar;
begin
  pos:=pos+1; ch:=expr(.pos.);
end;

function semiexpression: real;
var
  e: real;
  opr: character;

function simexpr: real;
var
  s: real;
  opr: character;

function term: real;
var
  t: real;

function signedfactor: real;

function factor: real;
type
  stdf = (fabs,fsqrt,fsin,fcos,farctan,fln,fexp);
  stdflist = array(.stdf.) of string(.6.);
const
  stdfun = stdflist('ABS','SQRT','SIN','COS','ARCTAN','LN','EXP');
var
  f: real;
  e,ee,l: integer;
  decpoint,negexp,found: boolean;
  sf: stdf;
  labelname: labeltype;
begin
  if (ch>='0') and (ch<='9') then
  begin
    f:=0.0; e:=0; decpoint:=false;
    repeat
      f:=f*10.0+(ord(ch)-48);
      if decpoint then e:=e-1;
      nextchar;
      if (ch='.') and not decpoint then
      begin
        decpoint:=true; nextchar;
      end;
    until (ch<'0') or (ch>'9');
    if ch='E' then
    begin
      ee:=0; nextchar; negexp:=false;
      if (ch='-') or (ch='+') then
      begin
        negexp:=ch='-'; nextchar;
      end;
      while (ch>='0') and (ch<='9') do
      begin
        ee:=ee*10+ord(ch)-48;
        nextchar;
      end;
      if negexp then e:=e-ee else e:=e+ee;
    end;
    f:=f*pwrten(e);
  end else
  if ch='(' then
  begin
    nextchar;
    f:=semiexpression;
    if ch=')' then nextchar else error(exprerr);
  end else
  begin
    l:=pos; while ((expr(.l.)>='A') and (expr(.l.)<=']'))
               or ((expr(.l.)>='0') and (expr(.l.)<='9')) do l:=l+1;
    found:=false;
    for sf:=fabs to fexp do
    if not found then
    begin
      if expr(.pos..l-1.)=stdfun(.sf.) then
      begin
        pos:=l-1; nextchar;
        f:=factor;
        case sf of
          fabs:    f:=abs(f);
          fsqrt:   f:=sqrt(f);
          fsin:    f:=sin(f);
          fcos:    f:=cos(f);
          farctan: f:=arctan(f);
          fln:     f:=ln(f);
          fexp:    f:=exp(f);
        end;
        found:=true; pos:=l-1; nextchar;
      end;
    end;
    if not found then
    begin
      labelname:=expr(.pos..l-1.);
      f:=labelvalue(labelname); pos:=l-1; nextchar
    end; 
  end;
  factor:=f;
end (* of factor *);

begin (* signedfactor *)
  if ch='-' then
  begin
    nextchar; signedfactor:=-factor;
  end else
  signedfactor:=factor;
end (* of signedfactor *);

begin (* term *)
  t:=signedfactor;
  while ch='^' do
  begin
    nextchar; t:=exp(ln(t)*signedfactor);
  end;
  term:=t;
end (* of term *);

begin (* simexpr *)
  s:=term;
  while (ch='*') or (ch='/') do
  begin
    opr:=ch; nextchar;
    if opr='*' then s:=s*term else s:=s/term;
  end;
  simexpr:=s;
end (* of simexpr *);

begin (* semiexpression *)
  e:=simexpr;
  while (ch='+') or (ch='-') do
  begin
    opr:=ch; nextchar;
    if opr='+' then e:=e+simexpr else e:=e-simexpr;
  end;
  semiexpression:=e;
end (* of semiexpression *);

begin (* expression *)
  pos:=0; nextchar;
  expression:=semiexpression;
end (* of expression *);

procedure parameters;
var
  cmdline: txttype at $80;
  pos,colon,start: integer;
  paramtxt: paramtype;
  prefix: string(.7.);
begin
  param(.listfile.):='CON:'; param(.datafile.):='CALC';
  param(.calcfile.):='CALC'; pos:=1; big(cmdline);
  while pos<len(cmdline) do
  begin
    while cmdline(.pos.)=space do pos:=pos+1;
    start:=pos; repeat pos:=pos+1 until cmdline(.pos.)=':';
    colon:=pos;
    repeat pos:=pos+1 until (cmdline(.pos.)=space) or (cmdline(.pos.)=empty);
    paramtxt:=cmdline(.colon+1..pos-1.); prefix:=cmdline(.start..colon.);
    if prefix='CALC:' then param(.calcfile.):=paramtxt;
    if prefix='DATA:' then param(.datafile.):=paramtxt;
    if prefix='LIST:' then param(.listfile.):=paramtxt;
  end;
end;

procedure identpart(ifile: filenames;var txt: txttype;filename: paramtype); 
begin
  writeln; writeln('IDENT FOR: ',filename);
  readline(ifile,txt,spaceok);
  while txt(.1.)<>'/' do
  begin
    writeln(txt); readline(ifile,txt,spaceok);
  end;
  big(txt);
  writeln;
end;
            
procedure constpart(ifile: filenames;var txt: txttype);
var
  p1,p2: integer;
  expr: exprtype; labelname: labeltype;
begin
  readline(ifile,txt,skipspace); big(txt);
  while txt(.1.)<>'/' do
  begin
    p1:=1; colbegin(txt,p1);
    p2:=p1; repeat p2:=p2+1 until (txt(.p2.)='=') or (txt(.p2.)=empty);
    if txt(.p2.)=empty then error(ligmis);
    if p2-p1>labellenght then error(lablon);
    if len(txt)-p2>exprlenght then error(exprlon);
    labelname:=txt(.p1..p2-1.); expr:=txt(.p2+1..exprlenght.);
    allocate(labelname,expression(expr));
    readline(ifile,txt,skipspace); big(txt);
  end;
end;
        
procedure textpart(ifile: filenames;var txt: txttype);
var
  p1,p2,p3,p4: integer;
  fm: columntype; expr: exprtype;
begin
  readline(ifile,txt,spaceok); txt3:=txt; big(txt3);
  while txt(.1.)<>'/' do
  begin
   txt3:=' '+txt3; txt:=' '+txt;
   for p1:=1 to len(txt) do if txt(.p1.)='#' then
   begin
     p2:=p1; while (txt(.p2.)='#') or (txt(.p2.)='.') do p2:=p2+1;
     p3:=p2; delimiter(txt,p3);
     p4:=p3; delimiter(txt,p4);
     fm:=txt3(.p1..p2-1.); expr:=txt3(.p3+1..p4-1.);
     txt:=txt(.1..p1-1.)+format(fm,expression(expr))+txt(.p2..txtlenght.);           txt:=txt(.1..p3-1.)+txt(.p4+1..txtlenght.);
     p1:=p4+1; txt3:=txt; big(txt3)
   end else if txt(.p1.)='<' then
   begin
     p2:=p1; while (txt(.p2.)<>'>') and (txt(.p2.)<>empty) do p2:=p2+1;
     if txt(.p2.)='>' then
     begin
       expr:=txt3(.p1+1..p2-1.); p4:=realint(expression(expr));
       txt:=txt(.1..p1-1.)+chr(p4)+txt(.p2+1..txtlenght.);
       p1:=p2+1; txt3:=txt; big(txt3);
     end;
   end;
   if txt<>' ' then txt:=txt(.2..txtlenght.);
   writeln(list,txt);
   readline(ifile,txt,spaceok); txt3:=txt; big(txt3)
  end;
  big(txt);
end;

procedure fieldpart(ifile: filenames; var txt: txttype);
begin
  fields:=realint(labelvalue('FIELDNO'));
  readline(ifile,txt,skipspace); txt3:=txt; big(txt3);
  while txt(.1.)<>'/' do
  begin
    setlabel('FIELDNO',labelvalue('FIELDNO')+1);
    fields:=fields+1; if fields>maxfields then error(maxfld);
    p1:=1; colbegin(txt,p1); p3:=p1;p2:=p1; colend(txt,p3);
    repeat p2:=p2+1 until (txt(.p2.)='=') or (txt(.p2.)=empty);
    if txt(.p2.)=empty then error(ligmis);
    if p2-p1-1>labellenght then error(lablon);
    fldarr(.fields.).name:=txt3(.p1..p2-1.);
    if p2-p3-2>exprlenght then error(exprlon);
    fldarr(.fields.).expr:=txt3(.p2+1..p3-1.);
    allocate(fldarr(.fields.).name,0);
    p1:=p3; delimiter(txt,p1); p2:=p1; delimiter(txt,p2);
    if p2-p1-2>columnlenght then error(collon);
    fldarr(.fields.).format:=txt3(.p1+1..p2-1.);
    if fldarr(.fields.).format<>'BLIND' then
    begin
      p1:=p2; delimiter(txt,p1); p2:=p1; delimiter(txt,p2);
      if p2-p1-2>columnlenght then error(collon);
      fldarr(.fields.).txt:=txt(.p1+1..p2-1.);
      p1:=p2; delimiter(txt,p1); p2:=p1; delimiter(txt,p2);
      if p2-p1-2>columnlenght then error(collon);
      fldarr(.fields.).unit:=txt(.p1+1..p2-1.);
      m:=len(fldarr(.fields.).format);
      if len(fldarr(.fields.).txt)>m then m:=len(fldarr(.fields.).txt);
      if len(fldarr(.fields.).unit)>m then m:=len(fldarr(.fields.).unit);
      fldarr(.fields.).lenght:=m;
    end;
    readline(ifile,txt,skipspace); txt3:=txt; big(txt3);
  end;
  lin1:=chr(132)+chr(60); lin2:=chr(132)+chr(45); lin3:=chr(132)+chr(61);
  lin4:=chr(132)+chr(53)+chr(128); fldcount:=3;
  for fld:=1 to fields do if fldarr(.fld.).format<>'BLIND' then
  begin
    for m:=1 to fldarr(.fld.).lenght+2 do
    begin
      lin1:=lin1+chr(44); lin2:=lin2+chr(44); lin3:=lin3+chr(44);
    end;
    for m:=1 to fldarr(.fld.).lenght do lin4:=lin4+space;
    lin1:=lin1+chr(108); lin2:=lin2+chr(46); lin3:=lin3+chr(110);
    lin4:=lin4+chr(132)+chr(106)+chr(128);
    fldcount:=fldcount+fldarr(.fld.).lenght+3
  end;  
  lin1:=lin1+chr(128); lin2:=lin2+chr(128); lin3:=lin3+chr(128); 
  if labelvalue('ADJUST')=1 then
  begin
    tabul:=(realint(labelvalue('COL')) div 2)-(fldcount div 2);
  end else tabul:=0;
  fldcount:=tabul+4;
  for m:=1 to tabul do
  begin
    lin1:=space+lin1; lin2:=space+lin2; lin3:=space+lin3; lin4:=space+lin4;
  end;
  for fld:=1 to fields do if fldarr(.fld.).format<>'BLIND' then
  begin
    fldarr(.fld.).index:=fldcount;
    fldcount:=fldcount+fldarr(.fld.).lenght+3;
  end;
  big(txt);
end;   

procedure datapart(ifile: filenames;var txt: txttype);
begin
  setlabel('LINNO',0);
  writeln(list,lin1); txt3:=lin4;
  for fld:=1 to fields do if fldarr(.fld.).format<>'BLIND' then
  begin
    p1:=fldarr(.fld.).index+(fldarr(.fld.).lenght-
                                             len(fldarr(.fld.).txt)) div 2;
    p2:=p1+len(fldarr(.fld.).txt);
    txt3:=txt3(.1..p1-1.)+fldarr(.fld.).txt+txt3(.p2..txtlenght.);
  end;
  writeln(list,txt3); writeln(list,lin3); txt3:=lin4;
  for fld:=1 to fields do if fldarr(.fld.).format<>'BLIND' then
  begin
    p1:=fldarr(.fld.).index+(fldarr(.fld.).lenght-
                                               len(fldarr(.fld.).unit)) div 2;
    p2:=p1+len(fldarr(.fld.).unit);
    txt3:=txt3(.1..p1-1.)+fldarr(.fld.).unit+txt3(.p2..txtlenght.);
  end;
  writeln(list,txt3); writeln(list,lin3);
  readline(ifile,txt,skipspace); big(txt);
  while txt(.1.)<>'/' do
  begin
    txt3:=lin4; p3:=1; setlabel('LINNO',labelvalue('LINNO')+1);
    for fld:=1 to fields do
    begin
      tmcol:='';
      if fldarr(.fld.).format='BLIND' then
      begin
        setlabel(fldarr(.fld.).name,expression(fldarr(.fld.).expr));
      end else
      begin
        if fldarr(.fld.).expr='INPUT' then
        begin
          colbegin(txt,p3); p4:=p3; colend(txt,p4);
          if p4-p3>exprlenght then error(exprlon);
          tempexpr:=txt(.p3..p4.);
          setlabel(fldarr(.fld.).name,expression(tempexpr)); p3:=p4;
          tmcol:=format(fldarr(.fld.).format,labelvalue(fldarr(.fld.).name));
        end else if fldarr(.fld.).expr='EMPTY' then
        begin
          for m:=1 to len(fldarr(.fld.).format) do tmcol:=tmcol+space;
        end else if fldarr(.fld.).expr='UNDERLINE' then
        begin
          for m:=1 to len(fldarr(.fld.).format) do tmcol:=tmcol+'_';
        end else if fldarr(.fld.).expr='STRING' then
        begin
          for m:=1 to len(fldarr(.fld.).format) do tmcol:=tmcol+space;
          delimiter(txt,p3); p4:=p3; delimiter(txt,p4);
          if p4-p3-1>fldarr(.fld.).lenght then error(collon);
          tmcol:=txt2(.p3+1..p4-1.)+tmcol(.p4-p3..len(fldarr(.fld.).format).);
          p3:=p4+1;
        end else 
        begin
          setlabel(fldarr(.fld.).name,expression(fldarr(.fld.).expr));
          tmcol:=format(fldarr(.fld.).format,labelvalue(fldarr(.fld.).name)); 
        end;
        p1:=fldarr(.fld.).index+(fldarr(.fld.).lenght-
                                         len(fldarr(.fld.).format)) div 2;
        p2:=p1+len(fldarr(.fld.).format);
        txt3:=txt3(.1..p1-1.)+tmcol+txt3(.p2..txtlenght.);
      end;
    end;
    writeln(list,txt3);
    readline(ifile,txt,skipspace); big(txt);
  end;
  writeln(list,lin2); big(txt)
end;

procedure waitpart(ifile: filenames; var txt: txttype);
begin
  if (ifile=dataf) and (txt1='/WAIT:') then
  begin
    readline(calcf,txt1,skipspace); big(txt1)
  end else
  begin 
    readline(ifile,txt,skipspace); big(txt); 
  end
end;
        
begin
  labels:=0; datalin:=0; calclin:=0;
  allocate('LINNO',0); allocate('FIELDNO',0); allocate('TRUE',1);
  allocate('FALSE',0); allocate('ADJUST',1); allocate('COL',80); 
  writeln('MultiCalc vers 82.12.03');
  writeln('-----------------------'); writeln; parameters;
  (*$I-*)
  reset(calc,param(.calcfile.)+'.CAL');
  curfile:=calcf; if iores>0 then error(fileerr);
  reset(data,param(.datafile.)+'.DAT');
  curfile:=dataf; if iores>0 then error(fileerr);
  rewrite(list,param(.listfile.));
  curfile:=none; if iores>0 then error(fileerr);
  (*$I+*)
  readline(calcf,txt1,skipspace); big(txt1);
  readline(dataf,txt2,skipspace); big(txt2);
  repeat
    if txt1='/IDENT:' then identpart(calcf,txt1,param(.calcfile.)+'.CAL') else
    if txt2='/IDENT:' then identpart(dataf,txt2,param(.datafile.)+'.DAT') else
    if txt1='/CONST:' then constpart(calcf,txt1) else
    if txt2='/CONST:' then constpart(dataf,txt2) else
    if txt1='/TEXT:' then textpart(calcf,txt1) else
    if txt2='/TEXT:' then textpart(dataf,txt2) else
    if txt1='/FIELDS:' then fieldpart(calcf,txt1) else
    if txt2='/FIELDS:' then fieldpart(dataf,txt2) else
    if txt1='/DATA:' then datapart(calcf,txt1) else
    if txt2='/DATA:' then datapart(dataf,txt2) else
    if txt1='/WAIT:' then waitpart(calcf,txt1) else
    if txt2='/WAIT:' then waitpart(dataf,txt2) else
    if txt1<>'/END:' then begin curfile:=calcf; error(unpart) end else
    if txt2<>'/END:' then begin curfile:=dataf; error(unpart) end;
  until (txt1='/END:') and (txt2='/END:');      
  close(data); close(calc); close(list,lock);
end.
pos.);
end;

function semiexpression: real;
var