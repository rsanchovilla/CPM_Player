MODULE MutualRecursion;

PROCEDURE One; FORWARD;

PROCEDURE Two;
BEGIN
  WRITELN('Procedure Two'); READLN;
  One;
END Two;

PROCEDURE One;
BEGIN
  WRITELN('Procedure One'); READLN;
  Two;
END One;

BEGIN
 One;
END MutualRecursion.
     