MODULE Birthday;

FROM Days IMPORT FAK, NewDate, Weekday;	(* Look to AGL.LIB *)
FROM CPM  IMPORT GetDateTime;		(* Look to AGL.LIB *)
FROM STRINGS IMPORT String, Length;	(* Look to SYSLIB.LIB *)

CONST
(*	BDay = 1;		/* birthday of Mr. Burner *)
(*	BMonth = 4;		/* please give here your birthday *)
(*	BYear = 1972;		/* then compile and run this little programm *)

(* If you use the constants then you have to delete the variables in the
   section VAR and the lines at the begin of the Programm, where I ask
   for the date! *)

VAR
	BDay, BMonth, BYear,

	d, DayToday,	Std,
	m, MonthToday,	Min,
	y, YearToday,	Sec	:INTEGER;

	WDay : String;
	Z    : LONGINT;

BEGIN

WRITELN;
WRITELN('This little Programm makes some calculations with Your birthday.');
WRITELN;
WRITELN('Now give firstly the Day then the Month and then the Year of your ',
        'birthday:');
WRITELN;
FOR y:=1 TO 46 DO WRITE(' ') END;
WRITE('(one or two digits)',CHR(13));
WRITE('Give the Day of your Birthday   (dd)  : '); READLN(BDay);
FOR y:=1 TO 46 DO WRITE(' ') END;
WRITE('(one or two digits)',CHR(13));
WRITE('Give the Month of your birthday (mm)  : '); READLN(BMonth);
FOR y:=1 TO 46 DO WRITE(' ') END;
WRITE('(four digits!)',CHR(13));
WRITE('Give the Year of your birthday (yyyy) : '); READLN(BYear);
WRITELN;

IF (BDay=0) OR (BMonth=0) OR (BYear=0) THEN

   WRITELN('Give a right date!');

ELSE

NewDate(BDay, BMonth, BYear, 0L, BDay, BMonth, BYear);
(* This calculate the right date if someone gives a wrong date *)
(* This calculation with NewDate makes a validity check (see DAYS.DEF) *)
(* If you give 29.2.1959 for example NewDate (with 0 count days) will
   calculate    1.3.1959 because 1959 is not a leap year!
   The same if you give 31.4.1959 for example. Then NewDate will calculate
   1.5.1959 because the April have only 30 days. *)

Weekday (BDay, BMonth, BYear, WDay);

WRITELN('               .-----------------------------------------------.');
WRITE  ('               |    Your Birthday (',BDay:2,'.',BMonth:2,'.',BYear:4,
				') was a ',WDay);
FOR y:=1 TO 10-INT(Length(WDay)) DO WRITE(' ') END;
WRITELN('|');

GetDateTime(WDay, DayToday, MonthToday, YearToday, Std,Min,Sec);
(* The Weekday (WDay) of GetDateTime is in German language *)
Weekday (DayToday, MonthToday, YearToday, WDay);

WRITE  ('               |    Today is ',WDay,' the ',DayToday:2,'.',
					MonthToday:2,'.',YearToday:4);
FOR y:=1 TO 19-INT(Length(WDay)) DO WRITE(' ') END;
WRITELN('|');

Z := FAK(DayToday, MonthToday, YearToday) - FAK(BDay, BMonth, BYear);

WRITELN('               |    Today is the ',Z:5,' day of your life        |');

Z := Z - (Z MOD 1000L);
NewDate(BDay, BMonth, BYear, Z, d,m,y);
WRITELN('               |    Your ',Z:5,' day was the ',d:2,'.',
						m:2,'.',y:4,'          |');
Z := Z + 1000L;
NewDate(BDay, BMonth, BYear, Z, d,m,y);
WRITELN('               |    Your ',Z:5,' day will be the ',d:2,'.',
						m:2,'.',y:4,'      |');
WRITELN("               `-----------------------------------------------'");
WRITELN;
WRITELN('The time is ',Std:1,':',Min:1,':',Sec:2);

END; (* of IF *)

END Birthday.
       