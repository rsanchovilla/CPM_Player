MODULE GeburtsTag;

(* Dieses kleine Programm macht ein paar kleine Berechnungen mit Ihrem
   Geburtstag ;-) *)

FROM Tage IMPORT FAK, NDATUM, Wochentag;
FROM CPM  IMPORT GetDateTime;
FROM STRINGS IMPORT String, Length;

CONST
	GT = 1;		(* birthday of Mr. Burner *)
	GM = 4;		(* Bitte tragen Sie hier Ihr Geburtstag ein *)
	GJ = 1972;
VAR
	t, TagHeute,	Std,
	m, MonatHeute,	Min,
	j, JahrHeute,	Sec	:INTEGER;

	WTag: String;
	Z : LONGINT;

BEGIN
Wochentag(GT, GM, GJ, WTag);

WRITELN('               .--------------',
			'-------------------------------------.');
WRITELN('               |    Dein Geburtstag (',GT:2,'.',GM:2,'.',GJ:4,') war',
					' ein ',WTag,'|');

GetDateTime(WTag, TagHeute, MonatHeute, JahrHeute, Std,Min,Sec);

WRITELN('               |    Heute ist ',WTag,' der ',TagHeute:2,'.',
		        MonatHeute:2,'.',JahrHeute:4,'            |');

Z := FAK(TagHeute, MonatHeute, JahrHeute) - FAK(GT, GM, GJ);

WRITELN('               |    Heute ist dein ',Z:5,'. Lebenstag',
				'                |');

Z := Z - (Z MOD 1000L);
NDATUM(GT, GM, GJ, Z,t,m,j);
WRITELN('               |    Dein ',Z:5,'. Lebenstag war der ',t:2,'.',m:2,'.',
							j:4,'       |');
Z := Z + 1000L;
NDATUM(GT, GM, GJ, Z,t,m,j);
WRITELN('               |    Dein ',Z:5,'. Lebenstag ist der ',t:2,'.',m:2,'.',
							j:4,'       |');
WRITELN("               `------------------",
                        "---------------------------------'");

WRITELN('Es ist ',Std:1,':',Min:1,':',Sec:2,' Uhr');

END GeburtsTag.
                                                                                                            