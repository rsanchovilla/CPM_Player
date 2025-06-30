

program dd9;

{labels}
label setup, loop;

{types and constants}
{$I dd9types.pas}

{Declared Variables}
{-----------------------------}
var
   i, j, k:              byte; {variables to use with for loops}
   blist:        array[0..8] of body;
   hiscore_name: array[0..2] of byte;
   dir_lut:      array[0..7] of real;
   first_iteration:      boolean;
   ignore_buttons:       boolean;
   key_in:               char;
   a_pressed, b_pressed: boolean;
   up_pressed, down_pressed, left_pressed, right_pressed: boolean;
   ignore_buttons_timer: byte;
   seconds:              integer;
   days,hours:           byte;
   scale_factor:         real;
   body_scale_factor:    byte;
   calculated_force:     force;
   game:                 game_state;
   target_planet:        byte;
   state:                state_var;
   substate:             byte;
   mission_pizzas:       byte;
   mission_toppings:     byte;
   mission_house:        byte;

{Include functions Files}
{-----------------------------------------}
{$I graphics.pas}
{$I helper.pas}
{-----------------------------------------}

begin {program}

{initialize all of the program variables when we start}
setup:
   a_pressed:=False;
   b_pressed:=False;
   up_pressed:=False;
   down_pressed:=False;
   left_pressed:=False;
   right_pressed:=False;

   first_iteration:=True;
   state:=S_LOGO;
   substate:=0;

   game.time_limit:=90.0*86400.0;
   game.dt:=600.0;
   game.dt_half:=game.dt*0.5;
   game.delivery_range:=0.005;
   game.pi_div_four := 3.14159 / 4.0;
   write(#27,'C7'); {disable status line preservation}
   dir_lut[0]:=0.0;
   dir_lut[1]:=3.14159*0.25;
   dir_lut[2]:=3.14159*0.5;
   dir_lut[3]:=3.14159*0.75;
   dir_lut[4]:=3.14159*1.0;
   dir_lut[5]:=3.14159*1.25;
   dir_lut[6]:=3.14159*1.5;
   dir_lut[7]:=3.14159*1.75;
loop:

{Evaluate which key was pressed}

   case state of
      S_LOGO:    do_state_logo;
      S_WEB:     do_state_web;
      S_MENU:    do_state_menu;
      S_ABOUT:   do_state_about;
      S_MISSION: do_state_mission;
      S_PLAY:    do_state_play;
      S_WIN:     do_state_win;
      S_LOSE:    do_state_lose;
   end; {case}
   goto loop;
end. {program}
