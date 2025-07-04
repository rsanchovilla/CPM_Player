program bug;

{Pro Pascal program to demonstrate Pro Pascal 'forward' bug
when the procedure write_byte is called, an incorrect number is printed, and
the program then crashes in one of several ways, often with an 'S' (out of
heap) space error. The error hapens with any parameter in the forward procedure
that occupies one byte.

If the forward declaration is removed (and write_byte definition move to be
before main) or the parameter in write_byte changed to something occupying more
than one byte, then the bug disappears.
}

type
        byte = 0..255;

procedure write_byte (a:byte);                  forward;

procedure main;

BEGIN
  writeln ('Program to demonstrate a bug in Pro Pascal, associated with ',
                '"forward"');
  write(' the number 7 should now be printed ');
  write_byte (7);
END;

procedure write_byte {(a:byte)} ;
{entry : a is byte to write
 action: print the byte on the console
 exit  : -
}
BEGIN
  write (' number= ',a : 1);
END;

BEGIN
 main;
 writeln;
 writeln('finished');
END.

                                                                                     