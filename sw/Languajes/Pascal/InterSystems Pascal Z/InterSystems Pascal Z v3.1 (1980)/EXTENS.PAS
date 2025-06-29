program extens;
{ this program does not demonstractte file I/O since that is }
{ demonstrated in the fileio routine			   }

const tabtop = 52;
      tabtopp1 = tabtop+1;	{ notice expression of constants }
{ use this type to show i/o of enumeration types }

type color = ( red, yellow, blue, green, orange, violet );
     anstyp = string 20;

var  a,b: color;
     answer: anstyp;

procedure systemok; external;  { external routine to check the system }

begin
    systemok;		{ verify the system }
    repeat
	write( 'Enter a color (red, yellow, blue, green, orange, violet): ' );
	readln( a );
	{ show a case statement with an else clause }
	case a of
	    red, yellow, blue: writeln( a:1, ' is a primary color' );
	    orange: writeln( 'orange is made from yellow and red' );
	    violet: writeln( 'violet is made from blue and red' );
	    else:  writeln( 'green is made from blue and yellow' );
	    end;
	write( 'Again? ' );
	readln( answer );
    until answer = 'NO';
end.
