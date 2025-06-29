{stub for now...need to figure out how to read a given pixel if I want to use this}
function getPixel(x,y:byte): boolean;
   begin
     getPixel:=FALSE;  {figure out how to read a pixel value}
   end;

{set a single pixel using the BIOS routine}
procedure drawPixel(x,y:byte);
   begin
      write(#27,'*',char(y+32),char(x+32));
   end;

procedure clearPixel(x,y:byte);
  begin
    write(#27,' ',char(y+32),char(x+32));
  end;

{draw a triangle using three draw-line calls}
procedure drawTriangle(x0,y0,x1,y1,x2,y2:byte);
   begin
      write(#27,'L',char(y0+32),char(x0+32),char(y1+32),char(x1+32));  {p0 to p1}
      write(#27,'L',char(y0+32),char(x0+32),char(y2+32),char(x2+32));  {p0 to p2}
      write(#27,'L',char(y1+32),char(x1+32),char(y2+32),char(x2+32));  {p1 to p2}
   end;

procedure clearTriangle(x0,y0,x1,y1,x2,y2:byte);
  begin
     write(#27,'D',char(y0+32),char(x0+32),char(y1+32),char(x1+32));
     write(#27,'D',char(y0+32),char(x0+32),char(y2+32),char(x2+32));
     write(#27,'D',char(y1+32),char(x1+32),char(y2+32),char(x2+32));
  end;

{draw a circle}
procedure drawCircle(x0,y0,radius:byte);
   var x, y, dx, dy, err: integer;
   begin
     case radius of
       0: drawPixel(x0,y0);
       1: begin
            drawPixel(x0+1,y0);
            drawPixel(x0-1,y0);
            drawPixel(x0,y0+1);
            drawPixel(x0,y0-1);
          end;
       else begin
              x:=radius-1;
              y:=0;
              dx:=1;
              dy:=1;
              err:=dx-(radius*2);
              while (x >= y) do
              begin
                drawPixel(x0+x,y0+y);
                drawPixel(x0+y,y0+x);
                drawPixel(x0-y,y0+x);
                drawPixel(x0-x,y0+y);
                drawPixel(x0-x,y0-y);
                drawPixel(x0-y,y0-x);
                drawPixel(x0+y,y0-x);
                drawPixel(x0+x,y0-y);

                if (err <= 0) then
                begin
                  y:=y+1;
                  err:=err+dy;
                  dy:=dy+2;
                end;
                if (err > 0) then
                begin
                  x:=x-1;
                  dx:=dx+2;
                  err:=err+(-radius*2)+dx;
                end;
              end;
            end;
       end; {case}
     end; {procedure}

procedure fillCircle(x,y,r,c:byte);
   begin
      {for now, just do a non-filled circle}
      drawCircle(x,y,r);
   end;

procedure drawRect(x,y,w,h:byte);
   begin
      write(#27,'L',char(y+32),char(x+32),char(y+32),char(x+w+32-1));     {top line}
      write(#27,'L',char(y+32),char(x+32),char(y+h+32-1),char(x+32));     {left line}
      write(#27,'L',char(y+32),char(x+w+32-1),char(y+h+32-1),char(x+w+32-1)); {right line}
      write(#27,'L',char(y+h+32-1),char(x+32),char(y+h+32-1),char(x+w+32-1)); {bottom line}
   end;

procedure drawRoundRect(x,y,w,h,r:byte);
   begin
      {just do a normal rect for now}
      drawRect(x,y,w,h);
   end;

procedure fillRoundRect(x,y,w,h,r,color:byte);
   var new_color : byte;
   begin
      {just do a normal filled rect for now}
      drawRect(x,y,w,h);
      {just clear the corner pixels for now}
      if (color = 0) then
        {set color to black}
        new_color:= ord(' ')
      else
        new_color := ord('*'); {set color to white}
      write(#27,new_color,char(y+32),char(x+32));     {top left}
      write(#27,new_color,char(y+32),char(x+w+32-1));   {top right}
      write(#27,new_color,char(y+h+32-1),char(x+32));   {bottom left}
      write(#27,new_color,char(y+h+32-1),char(x+w+32-1)); {bottom right}
   end;

procedure fillRect(x,y,w,h,color:byte);
   var i: integer;
   {Draw a solid rectangle by drawing a sequence of horizontal lines}
   begin
     for i:=0 to (h-1) do
       begin
         if(color = 0) then write(#27,'D',char(y+i+32),char(x+32),char(y+i+32),char(x+w+32))
         else write(#27,'L',char(y+i+32),char(x+32),char(y+i+32),char(x+w+32));
       end;
   end;

procedure drawLine(x0,y0,x1,y1:byte);
   begin
      write(#27,'L',char(y0+32),char(x0+32),char(y1+32),char(x1+32));
   end;

procedure clearLine(x0,y0,x1,y1:byte);
  begin
    write(#27,'D',char(y0+32),char(x0+32),char(y1+32),char(x1+32));
  end;

procedure drawFastHLine(x,y,length:byte);
   begin
      write(#27,'L',char(y+32),char(x+32),char(y+32),char(x+length+32-1));
   end;

procedure setCursor(x,y:byte);  {converts to nearest char loc}
   begin
      GotoXY(x div 2,y div 4);
   end;

{draw a bitmap starting at x,y of w width and h height. w is multiple of 8}
procedure drawSlowXY(var data: bitmap; x,y,w,h : byte);
  var px,tmp,x0,y0 : byte;
  begin
    x0:=0;
    y0:=0;
    for y0:=0 to (h-1) do
    begin
      for x0:=0 to ((w div 8)-1) do
      begin
        tmp:=data[y0*(w div 8)+x0];
        if( (tmp and 1)<>0 ) then drawPixel(x+x0*8+7,y+y0);
        if( (tmp and 2)<>0 ) then drawPixel(x+x0*8+6,y+y0);
        if( (tmp and 4)<>0 ) then drawPixel(x+x0*8+5,y+y0);
        if( (tmp and 8)<>0 ) then drawPixel(x+x0*8+4,y+y0);
        if( (tmp and 16)<>0) then drawPixel(x+x0*8+3,y+y0);
        if( (tmp and 32)<>0) then drawPixel(x+x0*8+2,y+y0);
        if( (tmp and 64)<>0) then drawPixel(x+x0*8+1,y+y0);
        if( (tmp and 128)<>0) then drawPixel(x+x0*8,y+y0);
      end;
    end;
  end;