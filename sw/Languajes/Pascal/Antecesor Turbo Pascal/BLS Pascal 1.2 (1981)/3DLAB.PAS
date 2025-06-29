program 3D-labyrinth;
  const waagdim=16;senkdim=8;hochdim=4;
        bufsize=250 {maximal waagdim*senkdim*hochdim*2, aber man muss probiern};
        waagdir=0;senkdir=1;hochdir=2;
  var wand:array[0..waagdim,0..senkdim,0..hochdim,waagdir..hochdir]
                     of integer;
      startx,endx,startz,endz:integer;
      cMan: string[1];
  procedure page;begin write(chr(12)) end;
  procedure getkey(var x:integer);
  begin 
     repeat x:=keyboard until x<>0;
     if (x >= ord('a')) and (x <= ord('z')) then x := x - ord('a') + ord('A');
  end;
  procedure cursor(b: boolean);
  begin
      if b then write(chr(25)) else write(chr(26));
  end;
  procedure plot(x,y:integer);
  begin
     screen(x,y);
     write('#');
     screen(x,y);
  end;
  procedure introduction;
    var c:string[1];
        x:integer;
  begin
    page; 
    writeln('3D-Labyrinth':19);
    writeln('Copyright (c) by MpdK-Soft');writeln;
    write('Instructions (Y/N)?');
    repeat read(c) until (c='Y')or(c='N')or(c='y')or(c='n');
    if (c='Y')or(c='y') then
    begin
      page;
       write ('The goal is to get through a maze of ', senkdim,'x', waagdim); 
       writeln (' and a height of ',hochdim );
       writeln ('To move use cursor keys:');
       writeln ('   Turn: Key Left=^Q');
       writeln ('   Turn: Key Right=^R');
       writeln ('   Step forward: Key Up=^S'); 
       writeln ('   Turn 180 deg: Key Down=^T');
       writeln ('U to go to level up');
       writeln ('D to go to level down');
       writeln ('H or M to show the maze map (100 penalty steps, exit with any key)'); 
      getkey(x)
    end;
    page; 
    write('Please wait ...')
  end;
  procedure golabyrinth;
    var index:array[0..3,-1..0,-1..0,-1..0,0..1] of string[4];
        rand :array[0..3,-1..0,-1..0,-1..0] of string[2];
        o,v,l:integer;
        dx,dy,xpos,ypos,zpos,i,j,x,y:integer;
        zuege:integer;
    procedure concate(b:string[3]);
      var i:integer;
    begin
      index[1,o,v,l,y]:=concat(index[1,o,v,l,y],left(b,1));
      for i:=2 to 3 do index[i,o,v,l,y]:=concat(mid(b,i,1),index[i,o,v,l,y])
    end;
    procedure bild(lev:integer);
      procedure ecke(oben,unten,vorne,links,rechts:integer);
        const maxlevel=3;
        var i:integer;
      begin
        if lev<=maxlevel then
        begin
          if lev=0 then
          begin
            screen(10,1);write(rand[0,oben,vorne,links]);
            screen(10,15);write(rand[1,unten,vorne,links]);
            screen(38,15);write(rand[2,unten,vorne,rechts]);
            screen(38,1);write(rand[3,oben,vorne,rechts]);
            if links=-1 then
            begin
              screen(1,1);write('---------');
              screen(1,15);write('---------')
            end;
            if rechts=-1 then
            begin
              screen(40,1);write('---------');
              screen(40,15);write('--------');
              mem[3001]:=ord('-')
            end;
          end else
          begin for y:=0 to 1 do
            begin
              screen(8+4*lev,2*lev+y);write(index[0,oben,vorne,links,y]);
              screen(8+4*lev,16-2*lev-y);write(index[1,unten,vorne,links,y]);
              screen(38-4*lev,16-2*lev-y);write(index[2,unten,vorne,rechts,y]);
              screen(38-4*lev,2*lev+y);write(index[3,oben,vorne,rechts,y])
            end;
            if oben=-1 then
            begin screen(12+4*lev,2*lev);write('--');
              for y:=1 to maxlevel-lev do write('--------')
            end;
            if unten=-1 then
            begin screen(12+4*lev,16-2*lev);write('--');
              for y:=1 to maxlevel-lev do write('--------')
            end;
            if links=-1 then
              for y:=lev*2+2 to 14-2*lev do
              begin screen(8+4*lev,y);write('!')
              end;
            if rechts=-1 then
              for y:=lev*2+2 to 14-2*lev do
              begin screen(41-4*lev,y);write('!')
              end
          end;
          if (vorne=0) exor (links=-1) then
            for y:=lev*2+2 to 14-2*lev do
            begin screen(11+4*lev,y);write('!')
            end;
          if (vorne=0) exor (rechts=-1) then
            for y:=lev*2+2 to 14-2*lev do
            begin screen(38-4*lev,y);write('!')
            end;
          if (vorne=0) exor (oben=-1) then
          begin screen(12+4*lev,2*lev+1);write('--');
            for y:=1 to maxlevel-lev do write('--------')
          end;
          if (vorne=0) exor (unten=-1) then
          begin screen(12+4*lev,15-2*lev);write('--');
            for y:=1 to maxlevel-lev do write('--------')
          end;
          if vorne=-1 then bild(lev+1)
        end
      end;
    begin
      case dx of
        -1:ecke(wand[xpos-lev,ypos,zpos-1,hochdir],
                wand[xpos-lev,ypos,zpos,hochdir],
                wand[xpos-lev-1,ypos,zpos,waagdir],
                wand[xpos-lev,ypos,zpos,senkdir],
                wand[xpos-lev,ypos-1,zpos,senkdir]);
         1:ecke(wand[xpos+lev,ypos,zpos-1,hochdir],
                wand[xpos+lev,ypos,zpos,hochdir],
                wand[xpos+lev,ypos,zpos,waagdir],
                wand[xpos+lev,ypos-1,zpos,senkdir],
                wand[xpos+lev,ypos,zpos,senkdir]);
         0:if dy=-1 then
           begin
             if ypos-lev>0 then
             ecke(wand[xpos,ypos-lev,zpos-1,hochdir],
                  wand[xpos,ypos-lev,zpos,hochdir],
                  wand[xpos,ypos-lev-1,zpos,senkdir],
                  wand[xpos-1,ypos-lev,zpos,waagdir],
                  wand[xpos,ypos-lev,zpos,waagdir])
           end else
             ecke(wand[xpos,ypos+lev,zpos-1,hochdir],
                  wand[xpos,ypos+lev,zpos,hochdir],
                  wand[xpos,ypos+lev,zpos,senkdir],
                  wand[xpos,ypos+lev,zpos,waagdir],
                  wand[xpos-1,ypos+lev,zpos,waagdir])
      end
    end;
  begin
    init rand to '\+','!\','\!',' !','-\','\\','--','\!',
                 '/+','!/','/!',' !','-/','//','--','/!',
                 '+\','\!','!\','! ','\-','\\','--','!\',
                 '+/','/!','!/','! ','/-','//','--','!/';
    init index to '!\-+','!-\+','\--+','   !',
                  '!\-+','!-\!','\--+','   !',
                  '!   ','!--\','\\  ','  \\',
                  '!   ','!---','\\  ','  \!';
    for o:=-1 to 0 do
      for v:=-1 to 0 do
        for l:=-1 to 0 do
          for y:=0 to 1 do
            for x:=1 to 4 do
              case mid(index[0,o,v,l,y],x,1) of
                ' ': concate('   ');
                '\': concate('/\/');
                '\': concate('/\/');
                '+': concate('+++');
                '!': concate('!!!');
                '!': concate('+!+');
                '+': concate('+++');
                '-': concate('---');
                '+': concate('+++')
              end;
    xpos:=startx;ypos:=senkdim;zpos:=startz;
    dx:=0;dy:=-1;
    repeat
      page; 
      bild(0);
      screen(0,0);
      getkey(i);
      case i of
        17:begin j:=-dx;dx:=dy;dy:=j end;
        18:begin j:=dx;dx:=-dy;dy:=j end;
        19:case dx of
              1:if wand[xpos,ypos,zpos,waagdir]=-1 then xpos:=xpos+1;
             -1:if wand[xpos-1,ypos,zpos,waagdir]=-1 then xpos:=xpos-1;
              0:if dy=1 then
                begin
                  if wand[xpos,ypos,zpos,senkdir]=-1 then ypos:=ypos+1
                end else
                  if wand[xpos,ypos-1,zpos,senkdir]=-1 then ypos:=ypos-1
           end;
        20:begin dy:=-dy;dx:=-dx end;
        85:if wand[xpos,ypos,zpos-1,hochdir]=-1 then zpos:=zpos-1;
        68:if wand[xpos,ypos,zpos,hochdir]=-1 then zpos:=zpos+1;
        72,77:begin page;
             for x:=0 to waagdim do
             begin
               for y:=0 to senkdim do plot(2*x,2*y  );
               for y:=1 to senkdim do
                 if wand[x,y,zpos,waagdir]=0 then
                    plot(2*x,2*y-1  );
             end;
             for x:=1 to waagdim do
               for y:=0 to senkdim do
                 if wand[x,y,zpos,senkdir]=0 then
                   plot(2*x-1,2*y  );
             screen(2*xpos-1,2*ypos-1);
             if dx = 1 then cMan := '>';
             if dx = -1 then cMan := '<';
             if dx = 0 then begin
                if dy = 1 then cMan := 'v' else cMan := '^';
             end;
             write(cMan);
             screen(2*xpos-1,2*ypos-1);
             cursor(true);
             getkey(j);
             cursor(false);
             zuege:=zuege+99
           end;
        others:zuege:=zuege-1
      end;
      zuege:=zuege+1
    until (ypos=0) or (i=27);
    page;
    writeln(zuege,' steps.')
  end;
  procedure createlabyrinth;
    var buffer.x:array[1..bufsize] of integer;
        buffer.y:array[1..bufsize] of integer;
        buffer.z:array[1..bufsize] of integer;
        buffer.dir:array[1..bufsize] of integer;
        buffer.lvo:array[1..bufsize] of boolean;
        buflen,i,x,y,z:integer;
    procedure kammerenter(x,y,z:integer);
      procedure insert(x,y,z,dir:integer;lvo:boolean);
        var i:integer;
      begin
        if wand[x,y,z,dir]<>0 then
        begin
          i:=wand[x,y,z,dir];
          buffer.x[i]:=buffer.x[buflen];
          buffer.y[i]:=buffer.y[buflen];
          buffer.z[i]:=buffer.z[buflen];
          buffer.dir[i]:=buffer.dir[buflen];
          buffer.lvo[i]:=buffer.lvo[buflen];
          wand[buffer.x[i],buffer.y[i],buffer.z[i],buffer.dir[i]]:=i;
          wand[x,y,z,dir]:=0;
          buflen:=buflen-1
        end else
        begin
          buflen:=buflen+1;
          buffer.x[buflen]:=x;buffer.y[buflen]:=y;
          buffer.z[buflen]:=z;buffer.dir[buflen]:=dir;
          buffer.lvo[buflen]:=lvo;
          wand[x,y,z,dir]:=buflen
        end
      end;
    begin
      if (x>0)and(x<=waagdim)and(y>0)and(y<=senkdim)and(z>0)and(z<=hochdim) then
      begin
        if x<waagdim then insert(x,y,z,waagdir,true);
        if x>1 then insert(x-1,y,z,waagdir,false);
        if y<senkdim then insert(x,y,z,senkdir,true);
        if y>1 then insert(x,y-1,z,senkdir,false);
        if z<hochdim then insert(x,y,z,hochdir,true);
        if z>1 then insert(x,y,z-1,hochdir,false)
      end
    end;
  begin
    startx:=random(waagdim)+1;startz:=random(hochdim)+1;
    endx  :=random(waagdim)+1;endz  :=random(hochdim)+1;
    buflen:=0;
    kammerenter(startx,senkdim,startz);
    repeat
      i:=random(buflen)+1;
      x:=buffer.x[i];y:=buffer.y[i];z:=buffer.z[i];
      case buffer.dir[i] of
        waagdir:begin
                  if buffer.lvo[i] then
                    kammerenter(x+1,y,z)
                  else kammerenter(x,y,z);
                  wand[x,y,z,waagdir]:=-1
                end;
        senkdir: begin
                   if buffer.lvo[i] then
                     kammerenter(x,y+1,z)
                   else kammerenter(x,y,z);
                   wand[x,y,z,senkdir]:=-1
                 end;
        hochdir: begin
                   if buffer.lvo[i] then
                     kammerenter(x,y,z+1)
                   else kammerenter(x,y,z);
                   wand[x,y,z,hochdir]:=-1
                 end
      end
    until buflen=0;
    wand[endx,0,endz,senkdir]:=-1;
  end;
begin
  introduction;
  cursor(false);
  createlabyrinth;
  golabyrinth;
  cursor(true);
end.
