Program Fileio;
{ this routine demonstrates how to use the Pascal/Z 		}
{ file conventions.  This is not a complete program, just 	}
{ some demonstration declarations and statements		}

type numbers = file of real;

var  english: text;
     data: numbers;
     i,j: integer;
     datum: real;
     datum2: real;
     line: array[ 1..80 ] of char;

begin
     reset( 'data.dat', data );
     read( data:i, datum );	{ get the ith datum }
     datum := datum + 3.14159;
     write( data:j, datum );	{ new jth datum }

     rewrite( 'data.dat', data );	{ create a new file }
     for i := 1 to 40 do write( data, i - 3.14159 );

     reset( 'book.txt', english );
     while not eof( english ) do begin
         readln( english, line );
         { correct for spelling errors and write to new file }
         end;

end.
