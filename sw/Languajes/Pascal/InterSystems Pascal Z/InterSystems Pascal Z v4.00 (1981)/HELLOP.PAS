Program HelloP; {$i+ }
{ this program is to welcome a new Pascal/Z user }
var i: 1..10;
begin
    for i := 1 to 10 do
        writeln;

    writeln( 'Welcome to the land of Pascal/Z', chr( 7 ) );
    writeln( 'Don''t forget to look at the file ''INFO.NEW''' );
    writeln( 'to find out the latest and greatest about' );
    writeln( 'Pascal/Z' );

    for i := 1 to 10 do
        writeln;
end.
                                                                                                      