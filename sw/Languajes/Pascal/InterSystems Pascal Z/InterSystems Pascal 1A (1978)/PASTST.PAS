(*$I+*)
PROGRAM TRAFFIC;
   VAR
     CAR,SEC,INTERVAL,GREAT,DATA,ERROR:INTEGER;
     ERFLG:BOOLEAN;

   BEGIN
     CAR:=0;SEC:=0;INTERVAL:=0;GREAT:=0;ERROR:=0;
     READ(DATA);
    
     WHILE DATA <> 0 DO
    BEGIN
     WHILE DATA = 1 DO
       BEGIN
        CAR:=CAR+1;
        IF NOT(ERFLG) AND INTERVAL>GREAT THEN
          GREAT:=INTERVAL;
        INTERVAL:=0;
        ERFLG:=FALSE;
      READ (DATA);
       END;
     
     WHILE DATA=2 DO
       BEGIN
        SEC:=SEC+1;
        INTERVAL:=INTERVAL+1;
       READ (DATA);
       END;

    WHILE DATA<3 DO
       ERROR:=ERROR+1;
       ERFLG:=TRUE;
    READ (DATA);
      END;
   END;

     WRITELN(CAR,' CARS IN ',SEC,' SECONDS.');
     WRITELN('THE GREATEST INTERVAL WAS ',GREATEST);
     WRITELN('THERE WERE ',ERROR,' ERRORS.');
END.
