

{Constants}
{------------------------}
const TRAPPIST1:  byte = 0;
      PLANET_B:   byte = 1;
      PLANET_C:   byte = 2;
      PLANET_D:   byte = 3;
      PLANET_E:   byte = 4;
      PLANET_F:   byte = 5;
      PLANET_G:   byte = 6;
      PLANET_H:   byte = 7;
      SPACESHIP:  byte = 8;
      MAX_BODIES: byte = 9;
      NUM_BODIES: byte = 9;
      NUM_STARS:  byte = 16;

      EARTH_MASS:   real = 5.97219E+24;
      SHIP_MASS:    real = 3.34885E-19;

      {VASIMR - tested=5.7N@200kW - call it 100N max
       Space-X Merlin-D - 934,000N   (RP1/LOX)
       Saturn V - 7,770,000 (RP1/LOX)
       Space-X Raptor  - 3,500,000N
       Orion - ballpark it at 100 MN}
       SHIP_THRUST: real = 5.86049674E-19;    {Raptor=3.5MN thrust}
       BOMB_THRUST: real = 1.67442764E-17;  {nuke is 100 MN of thrust}
       EARTH_R:     real = 149598023000.0;   {average earth orbit radius in meters}
       G:           real = 1.1904502E-19;  {gravitational constant}
       AU:          real = 1.4960E11;
       DAY:         real = 86400.0;
       dt:          real = 60.0;          {60 second timestep}

type bitmap = array [0..255] of byte;

const
       dd9_logo : bitmap =
       ($00,$00,$00,$00,$00,$00,$00,$00,
        $00,$00,$00,$00,$00,$00,$00,$00,
        $00,$00,$00,$00,$00,$00,$00,$00,
        $00,$00,$00,$00,$00,$00,$00,$00,
        $00,$DA,$03,$6C,$6D,$DA,$0D,$A1,
        $16,$D4,$18,$E1,$A6,$18,$6D,$80,
        $00,$FF,$8F,$F9,$FF,$7F,$0F,$F9,
        $BF,$EE,$18,$71,$B7,$19,$FF,$00,
        $00,$FF,$DF,$F3,$FE,$7F,$8F,$FD,
        $BA,$8C,$18,$FD,$B7,$9F,$FF,$00,
        $00,$E1,$DC,$03,$80,$67,$8E,$1F,
        $B8,$0E,$18,$7D,$B7,$FB,$80,$00,
        $00,$C0,$FF,$FB,$FF,$7F,$0C,$0F,
        $9F,$0F,$78,$FF,$B7,$FF,$FF,$00,
        $00,$E0,$FF,$F3,$FE,$7E,$0E,$0F,
        $0F,$CF,$F8,$6F,$B6,$FB,$FE,$00,
        $00,$E0,$FF,$E7,$FC,$78,$0E,$0F,
        $81,$FE,$B8,$E7,$B6,$7F,$FC,$00,
        $00,$C1,$FC,$03,$80,$70,$0C,$1D,
        $80,$7C,$18,$E3,$B6,$7B,$80,$00,
        $00,$FF,$DF,$6F,$EF,$F0,$0F,$FF,
        $80,$3E,$18,$63,$B6,$3F,$F7,$80,
        $00,$FF,$8F,$F9,$FF,$70,$0F,$F9,
        $BF,$FC,$18,$E1,$B4,$19,$FF,$00,
        $00,$FE,$07,$F0,$FE,$70,$0F,$E1,
        $BF,$FC,$18,$E1,$B6,$1C,$FE,$00,
        $00,$00,$00,$00,$00,$60,$00,$01,
        $00,$04,$10,$61,$B4,$38,$00,$00,
        $00,$00,$00,$00,$00,$00,$00,$00,
        $00,$00,$00,$00,$00,$00,$00,$00,
        $00,$00,$00,$00,$00,$00,$00,$00,
        $00,$00,$00,$00,$00,$00,$00,$00);
{Data Structures}
{------------------------------}
type
      state_var = (S_LOGO,S_WEB,S_MENU,S_ABOUT,S_MISSION,S_PLAY,S_WIN,S_LOSE);

     { bitmap = array[0..255] of byte; }

      body = record
                x:   real;
                y:   real;
                vx:  real;
                vy:  real;
                ax:  real;
                ay:  real;
                anx: real;
                any: real;
                m:   real;
                px:  byte;
                py:  byte;
                sun_force: real;
                sun_dist: real;
                rad: byte
            end;

      force = record
                x: real;
                y: real
            end;

      point = record
                x: byte;
                y: byte
            end;
      game_state = record
                fuel:           byte;
                bombs:          byte;
                ship_angle:     byte;
                sha_x:          byte;
                sha_y:          byte;
                time_left:      real;
                time_limit:     real;
                timesteps_left: integer;
                thrust_phase:   boolean;
                dt:             real;
                dt_sq_half:     real;
                dt_half:        real;
                pi_div_four:    real;
                thrust:         real;
                delivery_range: real;
                bomb_state:     byte
            end;

