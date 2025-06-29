
{Calculate the distance between b1 and b2 and return it}
function distance(b1,b2: byte) : real;
  var dx, dy: real;
  begin
    dx := blist[b1].x-blist[b2].x;
    dy := blist[b1].y-blist[b2].y;
    dx := sqr(dx);
    dy := sqr(dy);
  distance := sqrt(dx+dy);
  end;

function sun_dist(b1 : byte) : real;
  begin
    sun_dist := sqrt( sqr(blist[b1].x)+sqr(blist[b1].y) );
  end;

{Calculate the distance between b1 and b2 and return it}
function pizza_check(b1,b2 : byte) : boolean;
  begin
     if(distance(b1,b2) < game.delivery_range) then pizza_check := True
     else pizza_check := False;
  end;

{read the keyboard}
procedure get_keys;
  begin
    while keyPressed do
    begin
      Read(Kbd,key_in);
      if(upcase(key_in) in ['A']) then a_pressed:=True;
      if(upcase(key_in) in ['S']) then b_pressed:=True;
      if(upcase(key_in) in ['K']) then up_pressed:=True;
      if(upcase(key_in) in ['L']) then down_pressed:=True;
      if(upcase(key_in) in ['Z']) then
        begin
          clrScr;
          write(#27,'B7');
          halt;
        end;
    end;
  end;

procedure calculate_force(b1: byte);
  var r,r2, f: real;
  begin
    {(fx,fy)=(G*M1*M2 / R^3)*(dx,dy), where G=gravitational constant}
    {calculate the scalar portion}
    r2 := sqr(blist[b1].x) + sqr(blist[b1].y);
    r := sqrt(r2);
    {calculate total force between the objects}
    f := blist[b1].m*blist[0].m/(r2*r);
    calculated_force.x := f*(-blist[b1].x);
    calculated_force.y := f*(-blist[b1].y);
  end;

procedure quick_force(b1: byte);
  begin
    calculated_force.x := blist[b1].sun_force*(-blist[b1].x);
    calculated_force.y := blist[b1].sun_force*(-blist[b1].y);
  end;
procedure draw_ship;
  var x_offset, y_offset, x0, y0, x1, y1, x2, y2, days: real;
      r, vx, vy : byte;
      fuel_level : integer;
  begin
    {Calculate where the centroid of the ship should go}
    x_offset := blist[SPACESHIP].x*scale_factor + 55.0;
    y_offset := blist[SPACESHIP].y*scale_factor + 50.0;

    if(first_iteration=True) then
      begin
        blist[SPACESHIP].px := trunc(x_offset);
        blist[SPACESHIP].py := trunc(y_offset);
        drawPixel(blist[SPACESHIP].px,blist[SPACESHIP].py);
      end
    else
      begin
        if( (trunc(x_offset)<>blist[SPACESHIP].px) or (trunc(y_offset)<>blist[SPACESHIP].py)) then
        begin
          clearPixel(blist[SPACESHIP].px,blist[SPACESHIP].py);
          blist[SPACESHIP].px := trunc(x_offset);
          blist[SPACESHIP].py := trunc(y_offset);
          drawPixel(blist[SPACESHIP].px,blist[SPACESHIP].py);
        end;
      end;

    {Draw exhaust if we're thrusting}
    if(a_pressed and (game.fuel>0)) then
      begin
        if (game.thrust_phase = True) then r:= 2
        else r:= 1;

        game.thrust_phase := not game.thrust_phase;
        drawCircle(blist[SPACESHIP].px,blist[SPACESHIP].py, r);
      end;
    {Draw bomb explosion if needed}

    {Draw Velocity lines}
    { 50 pixels = 0.000001 AU/sec}
    { Scale factor = (blist[SPACESHIP].vx/0.000001)*50.0}
    {vx := trunc(50.0 + ((blist[SPACESHIP].vx/0.000001)*50.0)); }  {Should be scaled 0-}
    {vy := trunc(50.0 + ((blist[SPACESHIP].vy/0.000001)*50.0));}
    {
    clearLine(5,3,95,3);
    drawLine(55,3,vx,3);
    drawCircle(55,3,1);
    clearLine(3,5,3,95);
    drawLine(3,50,3,vy);
    drawCircle(3,50,1);
    }
  end;



procedure draw_planet(b1 : byte; first : boolean);
  var scaled_x, scaled_y: real;
  begin
    {Let's draw our planet!}
    {Let's treat our screen as a 100-pixel diameter circle with center at 0,0
    {Scale our display units}
    scaled_x := blist[b1].x*scale_factor;
    scaled_y := blist[b1].y*scale_factor;
    if( (blist[b1].px<>(trunc(scaled_x)+55)) or (blist[b1].py<>(trunc(scaled_y)+50)) ) then
    begin
      {clear previous}
      if(first_iteration=False) then
      begin
        clearPixel(blist[b1].px+1,blist[b1].py);
        clearPixel(blist[b1].px-1,blist[b1].py);
        clearPixel(blist[b1].px,blist[b1].py+1);
        clearPixel(blist[b1].px,blist[b1].py-1);
        if(b1=target_planet) then clearPixel(blist[b1].px,blist[b1].py);
      end;
      blist[b1].px := trunc(scaled_x)+55;
      blist[b1].py := trunc(scaled_y)+50;
      drawPixel(blist[b1].px+1,blist[b1].py);
      drawPixel(blist[b1].px-1,blist[b1].py);
      drawPixel(blist[b1].px,blist[b1].py+1);
      drawPixel(blist[b1].px,blist[b1].py-1);
      if(b1=target_planet) then drawPixel(blist[b1].px,blist[b1].py);
    end;
  end;

procedure initialize_planet(mass, r, t:real; theta, planet:byte);
  var avg_v: real;
  begin
    blist[planet].m:=mass;
    avg_v:=(2*3.14159*r)/(t*86400.0); {calculate average velocity}
    {set initial location}
    blist[planet].x:=0.0;
    blist[planet].y:=0.0;
    blist[planet].vx:=0.0;
    blist[planet].vy:=0.0;
    if(theta=0) then
      begin
        blist[planet].y:=r;
        blist[planet].vx:=avg_v;
      end;
    if(theta=1) then
      begin
        blist[planet].x:=r;
        blist[planet].vy:=-avg_v;
      end;
    if(theta=2) then
      begin
        blist[planet].y:=-r;
        blist[planet].vx:=-avg_v;
      end;
    if(theta=3) then
      begin
        blist[planet].x:=-r;
        blist[planet].vy:=avg_v;
      end;
     blist[planet].rad:=0;
  end;

procedure initialize_system;
  var px, py: real;
  begin
    first_iteration:=True;
    seconds:=0;
    game.ship_angle:=0;
    game.fuel:=250;
    game.time_left:=game.time_limit / game.dt; {in units of dt}
    game.timesteps_left := trunc(game.time_left);
    game.thrust:= SHIP_THRUST;
    game.bombs:=100;
    game.bomb_state:=0;
    game.dt_sq_half:= game.dt*game.dt*0.5;

    {initialize_planet(real mass, real r, real t, byte theta, byte planet)}
    initialize_planet(0.85, 0.01111, 1.51087081, 2, PLANET_B);
    initialize_planet(1.38, 0.01522, 2.4218233,  3, PLANET_C);
    initialize_planet(0.41, 0.021,   4.049610,   1, PLANET_D);
    initialize_planet(0.62, 0.028,   6.099615,   0, PLANET_E);
    initialize_planet(0.68, 0.037,   9.206690,   3, PLANET_F);
    initialize_planet(1.34, 0.045,   12.34294,   2, PLANET_G);
    initialize_planet(1.00, 0.063,   20.0,       0, PLANET_H);
    initialize_planet(SHIP_MASS, 0.0245, 5.0,    3, SPACESHIP);

    blist[TRAPPIST1].m  :=26637*G;   {fold G into this to reduce later math}
    blist[TRAPPIST1].x  :=0;
    blist[TRAPPIST1].y  :=0;
    blist[TRAPPIST1].vx :=0;
    blist[TRAPPIST1].vy :=0;
    blist[TRAPPIST1].rad:=1;

    for i:=0 to NUM_BODIES-1 do
      begin
        blist[i].ax := 0.0;
        blist[i].ay := 0.0;
        blist[i].anx := 0.0;
        blist[i].any := 0.0;
      end;
    target_planet := Random(7) + 1;
    body_scale_factor := 0;
 end;

{game logic}
procedure do_state_logo;
  begin
    ClrScr;
    drawRect(0,0,160,100);
    drawRect(12,18,136,20);

    drawSlowXY(dd9_logo,16,20,128,16);
    setCursor(32,48);
    write('A Game of Pizza Delivery and Orbital Mechanics');
    repeat until KeyPressed;
    substate:=0;
    state:= S_WEB;
   end;

procedure do_state_web;
  begin
    clrscr;
    {Let's try to draw the FHI logo using lines}
    {F}
    fillRect(32,16,16,64,1);
    fillRect(48,16,16,16,1);
    fillRect(48,48,16,16,1);
    {I}
    fillRect(96,16,16,64,1);
    {H}
    drawLine(64,16,64,79); {inner vertical of left side}
    drawLine(48,79,64,79); {lower left horizontal}
    drawLine(64,48,79,48); {upper middle horizontal}
    drawLine(64,64,79,64); {lower middle horizontal}
    drawLine(80,64,80,79); {lower inner right verticle}
    drawLine(80,79,95,79); {lower right horizontal}
    drawLine(80,48,80,16); {upper inner right verticle}
    drawLine(80,16,95,16); {upper right horizontal}
    setCursor(60,90);
    writeln('www.chrisfenton.com');
    repeat until KeyPressed;
    substate:=0;
    state:=S_MENU;
  end;

procedure do_state_menu;
  var choice : char;
  begin
    clrscr;
    substate:= 0;
    setCursor(72,12);
    write(#27,'B3');
    write('Menu');
    write(#27,'C3');
    setCursor(40,32);
    write('1.    Start Game');
    setCursor(40,40);
    write('2.    About...');
    setCursor(40,48);
    write('3.    Quit');
    choice:='x';
    repeat
      if keyPressed then Read(kbd,choice);
      if (choice='1') then state:=S_MISSION;
      if (choice='2') then state:=S_ABOUT;
      if (choice='3') then begin
        clrScr;
        write(#27,'B7');
        halt;
      end;
   until choice in ['1','2','3','4'];
  end;

procedure do_state_about;
  begin
    clrScr;
    setCursor(72,12);
    write(#27,'B3');
    writeln('About');
    write(#27,'C3');
    {Why did I do this?}
    setCursor(24,24);
    write('This game was written in 2017 on a Kaypro 2/84 that');
    setCursor(24,28);
    write('is slightly older than the author. The game itself was');
    setCursor(24,32);
    write('adapted from an original creation for the Arduboy platform');
    setCursor(24,36);
    write('which, despite being 30 years newer, has only slightly');
    setCursor(24,40);
    write('better performance than this Kaypro. DD9 was written in');
    setCursor(24,44);
    write('TurboPascal 3.0, directly on the Kaypro, a suprisingly');
    setCursor(24,48);
    write('pleasant development environment. The game, much like the');
    setCursor(24,52);
    write('Kaypro, is slow-paced but surprisingly fun for the patient.');
    setCursor(24,56);
    write('Happy pizza delivery!');
    setCursor(24,60);
    write('-Chris Fenton');
    repeat until keyPressed;
    state := S_MENU;
    clrScr;
    substate:= 0;
  end;

procedure do_state_mission;
  var n,h,t,p : byte;
  begin
    Randomize;
    n := 3+Random(250); {num of pizzas}
    h := Random(8);  {destination}
    t := Random(8);  {type of pizza}
    clrScr;
    initialize_system;
    write(#27,'B3');
    setCursor(72,12);
    write('Mission');
    write(#27,'C3');
    setCursor(32,24);
    write('You have 90 days to deliver an order of');
    setCursor(32,28);
    write(n);
    write(' ');
    case t of
      0: write('Anchovy');
      1: write('Space Cheese');
      2: write('Moon Worm');
      3: write('Hawaiian');
      4: write('Spock-Flavored');
      5: write('Deep Crust');
      6: write('Poutine');
      7: write('Cheesy-crust');
    end;
    write(' pizzas to ');
    case h of
      0: write('Robot House');
      1: write('I.P. Freely');
      2: write('Hugh Jass');
      3: write('the Museum of Manilla Folders');
      4: write('123 Fake Street');
      5: write('your Moms house');
      6: write('the Home for Wayward Nematodes');
      7: write('the yellow house by the park');
    end;
    setCursor(32,32);
    write(' on the planet of TRAPPIST-');
    case target_planet of
      1: write('B');
      2: write('C');
      3: write('D');
      4: write('E');
      5: write('F');
      6: write('G');
      7: write('H');
    end;
    setCursor(72,44);
    write(#27,'B3');
    write('Controls');
    write(#27,'C3');
    setCursor(32,52);
    write('A key = Fire rocket thruster');
    setCursor(32,56);
    write('S key = Trigger Nuclear Bomb Propulsion');
    setCursor(32,60);
    write('K key = Rotate CCW');
    setCursor(32,64);
    write('L key = Rotate CW');
    setCursor(32,68);
    write('Z key = Quit');
    setCursor(60, 80);
    write('Press any key to begin...');
    repeat until keyPressed;
    state := S_PLAY;
    clrScr;
    substate:= 0;
  end;

procedure do_state_win;
  begin
    clrScr;
    drawRect(0,0,160,100);
    setCursor(72,32);
    write('You Win!');
    repeat until keyPressed;
    state := S_MENU;
    substate := 0;
  end;

procedure do_state_lose;
  begin
    clrScr;
    drawRect(0,0,160,100);
    setCursor(72,32);
    write('You Lose!');
    repeat until keyPressed;
    state := S_MENU;
    substate := 0;
  end;


{This holds all of the 'game' logic and runs when you're actually playing}





procedure do_state_play;
  var r1, r2, max_r, fx, fy : real; isf : integer; f : force;
      fuel_level : integer;
  begin
    get_keys;
    if(first_iteration=true) then
    begin
      body_scale_factor:=1;
      blist[TRAPPIST1].rad:=2;
      {max_r:=1.1*distance(0,7);}
      scale_factor:=50.0/0.075;

      {precompute all of the sun<->planet forces}
      for i:=1 to (NUM_BODIES-2) do
      begin
        blist[i].sun_dist :=distance(i,0);
        blist[i].sun_force:=(blist[i].m*blist[0].m)/sqr(blist[i].sun_dist);
        blist[i].sun_force:=blist[i].sun_force/blist[i].m;
        blist[i].sun_force:=blist[i].sun_force/blist[i].sun_dist;
      end;

      {Draw static screen elements}
      {Draw the TRAPPIST-1 star}
      drawPixel(55+2,50-2);
      drawPixel(55+0,50-2);
      drawPixel(55-2,50-2);
      drawPixel(55+1,50-1);
      drawPixel(55+0,50-1);
      drawPixel(55-1,50-1);
      drawPixel(55+1,50);
      drawPixel(55+2,50);
      drawPixel(55-1,50);
      drawPixel(55-2,50);
      drawPixel(55+1,50+1);
      drawPixel(55+0,50+1);
      drawPixel(55-1,50+1);
      drawPixel(55+2,50+2);
      drawPixel(55+0,50+2);
      drawPixel(55-2,50+2);
      {draw frames}
      drawRect(0,0,111,100);
      drawRect(110,0,50,100);

      {Draw fuel gauge}
      fuel_level := trunc((20.0*(game.fuel/250.0)));
      setCursor(116,36);
      write('Fuel');
      drawRect(130,32,22,3);
      drawLine(130,33,130+fuel_level,33);

      {Draw Bomb gauge}
      fuel_level := trunc((20.0*(game.bombs/100.0)));
      setCursor(116,40);
      write('Bombs');
      drawRect(130,36,22,3);
      drawLine(130,37,130+fuel_level,37);

      {draw direction vector}
      setCursor(128,48);
      write(#27,'B3');
      write('Direction');
      drawCircle(135,62,10);
      drawPixel(135,62);
      game.sha_x := trunc(-7.0*sin(dir_lut[game.ship_angle])+135.0);
      game.sha_y := trunc(62.0-7.0*cos(dir_lut[game.ship_angle]));
      drawLine(135,62,game.sha_x,game.sha_y);
      {Draw remaining time left}
      setCursor(128,8);
      write('Time Left');
      setCursor(128,84);
      write('Velocity');
      write(#27,'C3');
      setCursor(128,16);
      days := game.timesteps_left div 144;
      write('Days:',days);
      setCursor(128,20);
      hours:= (game.timesteps_left mod 144) div 6;
      write('Hours:',hours);
      drawLine(110,25,160,25);
      setCursor(120,92);
      write('Vx:');
      setCursor(120,96);
      write('Vy:');
    end;

    {update time}
    game.timesteps_left := game.timesteps_left - 1;
    if( days <> (game.timesteps_left div 144) ) then
    begin
      days := game.timesteps_left div 144;
      setCursor(138,16);
      write(days,' ');
    end;
    if( hours <> ( (game.timesteps_left mod 144) div 6) ) then
    begin
      hours := (game.timesteps_left mod 144) div 6;
      setCursor(140,20);
      write(hours,' ');
    end;
    {update velocity}
    setCursor(126,92);
    if(blist[SPACESHIP].vx > 0.0) then write(' ');
    write(blist[SPACESHIP].vx:4,'  ');
    setCursor(126,96);
    if(blist[SPACESHIP].vy > 0.0) then write(' ');
    write(blist[SPACESHIP].vy:4,'  ');

    {Process any button-related actions if needed}
    {Rotate}
    if (up_pressed = True)   then
      begin
        game.ship_angle:= (game.ship_angle + 1) mod 8;
        up_pressed := False;
        clearLine(135,62,game.sha_x,game.sha_y);
        game.sha_x := trunc(-7.0*sin(dir_lut[game.ship_angle])+135.0);
        game.sha_y := trunc(62.0-7.0*cos(dir_lut[game.ship_angle]));
        drawLine(135,62,game.sha_x,game.sha_y);
      end;
    if (down_pressed = True) then
      begin
        if (game.ship_angle = 0) then game.ship_angle:=7
        else game.ship_angle := game.ship_angle - 1;
        down_pressed := False;
        clearLine(135,62,game.sha_x,game.sha_y);
        game.sha_x := trunc(-7.0*sin(dir_lut[game.ship_angle])+135.0);
        game.sha_y := trunc(62.0-7.0*cos(dir_lut[game.ship_angle]));
        drawLine(135,62,game.sha_x,game.sha_y);
     end;
    {Use rocket thruster}
    if(a_pressed and (game.fuel>0)) then
      begin
        a_pressed := False;
        {Subtract 1 ton of fuel every time we fire our thruster.}
        game.fuel := game.fuel - 1;
        blist[SPACESHIP].m := blist[SPACESHIP].m - (1000.0/EARTH_MASS);
        {Calculate force on ship from angled thrust}
        fx := -(game.thrust/10.0)*sin(game.ship_angle);
        fy := -(game.thrust/10.0)*cos(game.ship_angle);
        blist[SPACESHIP].anx := blist[SPACESHIP].anx + ((fx/blist[SPACESHIP].m)/AU);
        blist[SPACESHIP].any := blist[SPACESHIP].any + ((fy/blist[SPACESHIP].m)/AU);
        fuel_level:=trunc((20.0*(game.fuel/250.0)));
        clearLine(130,33,150,33);
        drawLine(130,33,130+fuel_level,33);
      end;
   {Drop a nuclear bomb}
   if(b_pressed and (game.bombs>0)) then
     begin
       b_pressed:=False;
       game.bombs      := game.bombs - 1;
       blist[SPACESHIP].m := blist[SPACESHIP].m - (1000.0/EARTH_MASS);
       {Here we are modeling a Project-Orion style nuclear bomb thruster}
       fx := -(BOMB_THRUST/10.0)*sin(game.ship_angle);
       fy := -(BOMB_THRUST/10.0)*cos(game.ship_angle);
       blist[SPACESHIP].anx := blist[SPACESHIP].anx + ((fx/blist[SPACESHIP].m)/AU);
       blist[SPACESHIP].any := blist[SPACESHIP].any + ((fy/blist[SPACESHIP].m)/AU);
       fuel_level:=trunc((20.0*(game.bombs/100.0)));
       clearLine(130,37,150,37);
       drawLine(130,37,130+fuel_level,37);
     end;

    {Calculate: x(t+dt) = x(t) + v(t)*dt + .5*a(t)*dt^2}
    {Calculate: A(t+dt) from force on objects using x(t+dt)}
    {Calculate: v(t+dt) = v(t) + .5*(a(t) + a(t+dt))*dt}
    get_keys;
    {First, update a(t) based on current x(t)}
    if(first_iteration=true) then
      begin
        for i:=1 to (NUM_BODIES-1) do
          begin
            {A = F/M}
            if (i=SPACESHIP) then
            begin
              calculate_force(i);
              f:=calculated_force;
              blist[i].ax := blist[i].ax + (f.x/blist[i].m);
              blist[i].ay := blist[i].ay + (f.y/blist[i].m);
            end
            else
            begin
              quick_force(i);
              blist[i].ax := calculated_force.x;
              blist[i].ay := calculated_force.y;
            end;
          end;
      end;

    {Now update x(t):  x(t+dt) = x(t) + v(t)*dt + .5*a(t)*dt^2}
    for i:=1 to (NUM_BODIES-1) do
      begin
        blist[i].x := blist[i].x + blist[i].vx*game.dt + blist[i].ax*game.dt_sq_half;
        blist[i].y := blist[i].y + blist[i].vy*game.dt + blist[i].ay*game.dt_sq_half;
      end;
    get_keys;
    {Now calculate a(t+dt) based on the newly-updated x(t) values}
    {First, update a(t) based on current x(t)}
    calculate_force(SPACESHIP);
    blist[SPACESHIP].anx := blist[SPACESHIP].anx + (calculated_force.x/blist[SPACESHIP].m);
    blist[SPACESHIP].any := blist[SPACESHIP].any + (calculated_force.y/blist[SPACESHIP].m);
    for i:=1 to (NUM_BODIES-2) do
      begin
        quick_force(i);
        blist[i].anx := calculated_force.x;
        blist[i].any := calculated_force.y;
      end;

    get_keys;
    {now update v:  v(t+dt) = v(t) + .5*(a(t) + a(t+dt))*dt}
    for i:=1 to (NUM_BODIES-1) do
      begin
        blist[i].vx := blist[i].vx + (blist[i].ax + blist[i].anx)*game.dt_half;
        blist[i].vy := blist[i].vy + (blist[i].ay + blist[i].any)*game.dt_half;
        {Now shift in the new accelerations}
        blist[i].ax  := blist[i].anx;
        blist[i].ay  := blist[i].any;
      end;
    blist[SPACESHIP].anx := 0; {only zero out spaceship an*, others are set, not accumulated}
    blist[SPACESHIP].any := 0;
    get_keys;
    {Draw the planets}
    for i:=1 to (NUM_BODIES-2) do draw_planet(i, first_iteration);
    get_keys;
    {Draw ship-related stuff (Actual ship is drawn when planet list is drawn)}
    draw_ship;
    first_iteration := false;
    seconds         := seconds + trunc(game.dt);


    {Evaluate end conditions}
    {Did we win?}
    if (pizza_check(target_planet,SPACESHIP)=True) then
      begin
        state := S_WIN;
        substate := 0;
        ignore_buttons := true;
        ignore_buttons_timer := 120;
      end;
    {Did we lose?}
    if( (game.timesteps_left=0) or ((game.fuel = 0) and (game.bombs = 0)) ) then
      begin
        state := S_LOSE;
        substate := 0;
        ignore_buttons := true;
        ignore_buttons_timer := 120;
        {Reset player state}
        initialize_system;
      end;

    get_keys;
  end; {procedure}
