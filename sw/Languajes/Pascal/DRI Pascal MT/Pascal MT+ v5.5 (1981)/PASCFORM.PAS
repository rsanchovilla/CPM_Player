PROGRAM pascform;

(*$S+*)
(*$E-*)

LABEL
     9999;

(* Pascalformatierer von Bernhard Glavina und Peter Schorn *)

CONST
     copyright='Copyright (1983) by Peter Schorn and Bernhard Glavina';
     maxlaenge=200;
     (* maximale Laenge einer zusammengehoerenden Zeichenreihe *)
     maxzahl=255;
     (* groesster Wert des Typ zahl (passt in ein byte) *)
     symbolmaxlaenge=9;
     (* maximale Laenge eines Schluesselworts (PROCEDURE) *)
     minzeichenzahl=7;
     (* minimale Zeichenzahl einer Ausgabezeile, auch bei maximalem Einruecken
     *)
     minbreite=20;
     (* Mindestbreite einer Ausgabezeile *)
     textcon='CON:';
     textlst='LST:';
     texteingabe      ='Eingabe ';
     textschreibbreite='Schreibbreite: ';
     texteinruecktiefe='Einruecktiefe: ';
     textkommentar    ='Kommentar: ';
     textumwandlung   ='Umwandlung: ';
     ctrlz=26;
     cr=13;
     tab=9;
     (* ASCII Zeichen tab *)
     ff=12;
     (* ASCII Zeichen formfeed *)
     bs=8;
     (* backspace *)
     anzbacksp=4;

TYPE zahl=0..maxzahl;
     filestring=STRING[14];
     string255=STRING[255];
     strpointer=^string255;
     zeichenkette=ARRAY [1..symbolmaxlaenge] OF char;
     schluesselwort=
	  RECORD
	  zeichen:zeichenkette;
	  laenge:zahl
	  END;
     zeichenreihe=
	  RECORD
	  bezeichner:ARRAY [1..maxlaenge] OF char;
	  zeichenzahl:zahl
	  END;
     fehlerart=(eingabeerschoepft,elseohneif,untilohnerepeat,blockohnebegin,
     endohnebegin,keineprocoderfunc,falscheranfang,punkteingesetzt);

VAR  nameein,nameaus:filestring;
     zeilennr:integer;
     backspaces:ARRAY [1..anzbacksp] OF char;
     c:char;
     programmname,puffer,zeile:zeichenreihe;
     leerzeilen,tiefeeinruecken,tiefe,breite,position,tiefekommentar,maxtiefe,
     halbetiefe:zahl;
     platznichtausreichend,rueckflag,leerzeichenflag,stufeein,stufeaus,
     breiteueberschritten,zahloderbezeichner,punktflag,umwandlung,
     zuletztwarstrichpunkt,ersteingabe,eofflag:boolean;
     doppelpunkt,strichpunkt,gleichheitszeichen,punkt,klammerauf,klammerzu,
     sternklammerzu,schweifzu,
     (* Satzzeichen und Kommentarendezeichen *)
     sand,sabsolute,sarray,sbegin,scase,sconst,sdiv,sdo,sdownto,selse,send,
     sexternal,sfile,sfor,sforward,sfunction,sgoto,sif,sin,sinterrupt,slabel,
     smod,smodend,smodule,snil,snot,sof,sor,spacked,sprocedure,sprogram,srecord
     ,srepeat,sset,sstring,sthen,sto,stype,suntil,svar,swhile,swith:
     schluesselwort;
     (* Schluesselworte in Pascal *)
     eingabe:FILE OF PACKED ARRAY [1..128] OF char;
     ausgabe:text;
     kommentaranzeiger:(keinkommentar,klammer,schweifauf);
     ziffern,ziffernundbuchstaben,anfangszeichen,
     semikolonundziffernundbuchstaben:SET OF char;

EXTERNAL FUNCTION @cmd:strpointer;

PROCEDURE exitprogram;
     BEGIN
	GOTO 9999
     END;
     (* exitprogram *)

PROCEDURE segm(s:string255;a,e:integer;VAR ergeb:string255);
     BEGIN
	ergeb:=copy(s,a,e-a+1)
     END;
     (* segm *)

PROCEDURE conc(x:string255;y:string255;VAR ergeb:string255);
     BEGIN
	ergeb:=concat(x,y)
     END;
     (* conc *)

FUNCTION wandle(x:char):char;
     (* macht Kleinbuchstaben zu Grossbuchstaben und { zu [ *)
     BEGIN
	IF   (x>='a') AND (x<='{')
	THEN wandle:=chr(ord(x)-32)
	ELSE wandle:=x
     END;
     (* wandle *)

FUNCTION puffergleich(VAR symbol:schluesselwort):boolean;
     (* vergleicht puffer mit symbol *)
     VAR  zaehler:zahl;
     BEGIN
	WITH symbol,puffer DO
	     IF   (laenge=zeichenzahl) OR ((laenge=zeichenzahl-1) AND (
		  bezeichner[zeichenzahl]=' '))
	     THEN BEGIN
		     zaehler:=1;
		     WHILE (wandle(bezeichner[zaehler])=zeichen[zaehler]) AND (
		     zaehler<laenge) DO
			  zaehler:=zaehler+1;
		     IF   zaehler=laenge
		     THEN puffergleich:=wandle(bezeichner[zaehler])=zeichen[
			  zaehler]
		     ELSE puffergleich:=false
		  END
	     ELSE puffergleich:=false
     END;
     (* puffergleich *)

PROCEDURE suche(VAR terminator:schluesselwort);
     BEGIN
	REPEAT
	   drucke ; liesreihe
	UNTIL puffergleich(terminator)
     END;
     (* suche *)

PROCEDURE finde(VAR symbol:schluesselwort);
     BEGIN
	REPEAT
	   drucke ; lies
	UNTIL puffergleich(symbol)
     END;
     (* finde *)

PROCEDURE neuzeile;
     (* druckt Zeile ohne Trennzeichen am Ende *)
     VAR  i:zahl;
     BEGIN
	IF   position<>0
	THEN BEGIN
		WITH zeile DO
		     BEGIN
			WHILE (bezeichner[zeichenzahl]=' ') OR (bezeichner[
			zeichenzahl]=chr(tab))OR (bezeichner[zeichenzahl]=chr(
			ff)) DO
			     zeichenzahl:=zeichenzahl-1;
			FOR i:=1 TO zeichenzahl DO
			     write(ausgabe,bezeichner[i]);
			zeichenzahl:=0
		     END;
		writeln(ausgabe) ; position:=0 ; rueckflag:=true
	     END
     END;
     (* neuzeile *)

PROCEDURE neutiefe;
     (* setzt Druckposition in der naechsten Zeile auf Einruecktiefe *)
     VAR  i:integer;
     BEGIN
	neuzeile;
	IF   tiefeeinruecken>0
	THEN BEGIN
		position:=tiefeeinruecken;
		FOR i:=1 TO tiefeeinruecken DIV 8 DO
		     write(ausgabe,chr(tab));
		FOR i:=1 TO tiefeeinruecken MOD 8 DO
		     write(ausgabe,' ')
	     END;
	rueckflag:=false
     END;
     (* neutiefe *)

PROCEDURE schreibe(x:char);
     (* bringt genau ein Zeichen ans Ende von Zeile *)
     BEGIN
	position:=position+1;
	IF   position>breite
	THEN IF   (x=' ') OR (x=chr(tab)) OR (x=chr(ff))
	     THEN
	     ELSE BEGIN
		     neutiefe;
		     WITH zeile DO
			  BEGIN
			     zeichenzahl:=zeichenzahl+1;
			     bezeichner[zeichenzahl]:=x
			  END;
		     position:=position+1
		  END
	ELSE WITH zeile DO
		  BEGIN
		     zeichenzahl:=zeichenzahl+1 ; bezeichner[zeichenzahl]:=x
		  END
     END;
     (* schreibe *)

PROCEDURE drucke;
     (* druckt eine zusammengehoerende Zeichenreihe *)
     VAR  i,zaehler:zahl;

     PROCEDURE fahre(einruecktiefe:integer);
	  (* faehrt auf Druckposition beim Ein- und Ausruecken *)
	  VAR  i:zahl;
	  BEGIN
	     IF   einruecktiefe<0
	     THEN einruecktiefe:=0;
	     IF   position>einruecktiefe
	     THEN neuzeile
	     ELSE IF   zeile.zeichenzahl>0
		  THEN WITH zeile DO
			    BEGIN
			       FOR i:=1 TO zeichenzahl DO
				    write(ausgabe,bezeichner[i]);
			       zeichenzahl:=0
			    END;
	     IF   position=0
	     THEN BEGIN
		     FOR i:=1 TO einruecktiefe DIV 8 DO
			  write(ausgabe,chr(tab));
		     FOR i:=1 TO einruecktiefe MOD 8 DO
			  write(ausgabe,' ')
		  END
	     ELSE FOR i:=position+1 TO einruecktiefe DO
		       write(ausgabe,' ');
	     position:=einruecktiefe ; rueckflag:=false
	  END;
	  (* fahre *)

     BEGIN
	(* drucke *)
	IF   stufeein<>stufeaus
	THEN BEGIN
		neuzeile ; platznichtausreichend:=true
	     END;
	stufeein:=false ; stufeaus:=false;
	WITH puffer DO
	     BEGIN
		IF   rueckflag
		THEN IF   zeichenzahl+tiefeeinruecken>breite
		     THEN BEGIN
			     WHILE (bezeichner[zeichenzahl]=' ') OR (bezeichner
			     [zeichenzahl]=chr(tab)) OR (bezeichner[zeichenzahl]
			     =chr(ff))DO
				  zeichenzahl:=zeichenzahl-1;
			     IF   zeichenzahl+tiefeeinruecken>breite
			     THEN fahre(breite-zeichenzahl)
			     ELSE fahre(tiefeeinruecken)
			  END
		     ELSE fahre(tiefeeinruecken);
		IF   zeichenzahl+position>breite
		THEN BEGIN
			zaehler:=0;
			IF   (bezeichner[1]=' ') OR (bezeichner[1]=chr(tab)) OR
			     (bezeichner[1]=chr(ff))
			THEN zeichenzahl:=0
			ELSE BEGIN
				WHILE (bezeichner[zeichenzahl]=' ') OR (
				bezeichner[zeichenzahl]=chr(tab)) OR(bezeichner
				[zeichenzahl]=chr(ff))DO
				     BEGIN
					zeichenzahl:=zeichenzahl-1;
					zaehler:=zaehler+1
				     END;
				IF   zeichenzahl+tiefeeinruecken>breite
				THEN BEGIN
					neuzeile;
					IF   zeichenzahl<=breite
					THEN BEGIN
						IF   breite<>zeichenzahl
						THEN write(ausgabe,' ':breite-
						     zeichenzahl);
						platznichtausreichend:=true
					     END
					ELSE breiteueberschritten:=true;
					FOR i:=1 TO zeichenzahl DO
					     write(ausgabe,bezeichner[i]);
					position:=zeichenzahl ; zeichenzahl:=0;
					neuzeile
				     END
				ELSE BEGIN
					neutiefe ; zeichenzahl:=zeichenzahl+
					zaehler
				     END
			     END
		     END;
		FOR i:=1 TO zeichenzahl DO
		     schreibe(bezeichner[i])
	     END;
	leerzeichenflag:=false
     END;
     (* drucke *)

PROCEDURE rueckein(tiefe:zahl);
     BEGIN
	tiefeeinruecken:=tiefeeinruecken+tiefe;
	IF   tiefeeinruecken>maxtiefe
	THEN BEGIN
		tiefeeinruecken:=0 ; stufeein:=true
	     END;
	rueckflag:=true
     END;
     (* rueckein *)

PROCEDURE rueckaus(tiefe:zahl);
     BEGIN
	IF   tiefeeinruecken>=tiefe
	THEN tiefeeinruecken:=tiefeeinruecken-tiefe
	ELSE BEGIN
		tiefeeinruecken:=maxtiefe ; stufeaus:=true
	     END;
	rueckflag:=true
     END;
     (* rueckaus *)

PROCEDURE einruecken;
     BEGIN
	rueckein(tiefe)
     END;
     (* einruecken *)

PROCEDURE ausruecken;
     BEGIN
	rueckaus(tiefe)
     END;
     (* ausruecken *)

PROCEDURE halbeinruecken;
     BEGIN
	rueckein(halbetiefe)
     END;
     (* halbeinruecken *)

PROCEDURE halbausruecken;
     BEGIN
	rueckaus(halbetiefe)
     END;
     (* halbausruecken *)

PROCEDURE druckleer(VAR symbol:schluesselwort);
     (* druckt Schluesselwort mit anschliessendem Leerzeichen *)
     BEGIN
	WITH puffer,symbol DO
	     BEGIN
		zeichenzahl:=laenge+1 ; bezeichner[zeichenzahl]:=' ' ; drucke
	     END
     END;
     (* druckleer *)

PROCEDURE liesreihe;
     (* liest zusammengehoerende Zeichenreihe nach puffer *)
     (* Vb: c enthaelt das erste unverarbeitete Zeichen *)
     (* Nb: c enthaelt das naechste unverarbeitete Zeichen *)
     VAR  aktiv,dummy:boolean;
	  i:zahl;

     PROCEDURE eintragen;
	  BEGIN
	     WITH puffer DO
		  BEGIN
		     zeichenzahl:=zeichenzahl+1 ; bezeichner[zeichenzahl]:=c
		  END
	  END;
	  (* eintragen *)

     PROCEDURE entferneziffer;
	  BEGIN
	     aktiv:=true;
	     WHILE aktiv AND (c IN ziffern) DO
		  BEGIN
		     eintragen ; aktiv:=holezeichen
		  END
	  END;
	  (* entferneziffer *)

     PROCEDURE einfuegeleerzeichen;
	  BEGIN
	     IF   c IN ziffernundbuchstaben
	     THEN WITH puffer DO
		       BEGIN
			  zeichenzahl:=zeichenzahl+1 ; bezeichner[zeichenzahl]
			  :=' '
		       END
	  END;
	  (* einfuegeleerzeichen *)

     PROCEDURE naechsteszeichen;
	  BEGIN
	     eintragen ; dummy:=holezeichen
	  END;
	  (* naechsteszeichen *)

     PROCEDURE grossklein;
	  (* schreibt Schluesselworte gross und Bezeichner klein *)

	  PROCEDURE grossschreiben;
	       VAR  i:zahl;
	       BEGIN
		  WITH puffer DO
		       FOR i:=1 TO zeichenzahl DO
			    bezeichner[i]:=wandle(bezeichner[i])
	       END;
	       (* grossschreiben *)

	  PROCEDURE kleinschreiben;
	       VAR  i:zahl;
	       BEGIN
		  WITH puffer DO
		       FOR i:=1 TO zeichenzahl DO
			    IF   (bezeichner[i]>='A')AND (bezeichner[i]<='Z')
			    THEN bezeichner[i]:=chr(ord(bezeichner[i])+32)
	       END;
	       (* kleinschreiben *)

	  BEGIN
	     (* grossklein *)
	     CASE ord(wandle(puffer.bezeichner[1]))-32 OF
	     33:  (* 'A' *)
		  IF   puffergleich(sand) OR puffergleich(sarray)OR
		       puffergleich(sabsolute)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     34:  (* 'B' *)
		  IF   puffergleich(sbegin)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     35:  (* 'C' *)
		  IF   puffergleich(scase) OR puffergleich(sconst)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     36:  (* 'D' *)
		  IF   puffergleich(sdiv) OR puffergleich(sdo) OR puffergleich(
		       sdownto)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     37:  (* 'E' *)
		  IF   puffergleich(selse) OR puffergleich(send) OR
		       puffergleich(sexternal)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     38:  (* 'F' *)
		  IF   puffergleich(sfile) OR puffergleich(sfor) OR
		       puffergleich(sforward) OR puffergleich(sfunction)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     39:  (* 'G' *)
		  IF   puffergleich(sgoto)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     41:  (* 'I' *)
		  IF   puffergleich(sif) OR puffergleich(sin) OR puffergleich(
		       sinterrupt)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     44:  (* 'L' *)
		  IF   puffergleich(slabel)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     45:  (* 'M' *)
		  IF   puffergleich(smod) OR puffergleich(smodend) OR
		       puffergleich(smodule)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     46:  (* 'N' *)
		  IF   puffergleich(snil) OR puffergleich(snot)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     47:  (* 'O' *)
		  IF   puffergleich(sof) OR puffergleich(sor)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     48:  (* 'P' *)
		  IF   puffergleich(spacked) OR puffergleich(sprocedure) OR
		       puffergleich(sprogram)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     50:  (* 'R' *)
		  IF   puffergleich(srecord) OR puffergleich(srepeat)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     51:  (* 'S' *)
		  IF   puffergleich(sset) OR puffergleich(sstring)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     52:  (* 'T' *)
		  IF   puffergleich(sthen) OR puffergleich(sto) OR puffergleich
		       (stype)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     53:  (* 'U' *)
		  IF   puffergleich(suntil)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     54:  (* 'V' *)
		  IF   puffergleich(svar)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     55:  (* 'W' *)
		  IF   puffergleich(swhile) OR puffergleich(swith)
		  THEN grossschreiben
		  ELSE kleinschreiben;
	     ELSE (* '$','#','_','H','J','K','Q','X','Y','Z' *)
		  kleinschreiben
	     END
	  END;

     BEGIN
	(* liesreihe *)
	WITH puffer DO
	     REPEAT
		IF   leerzeilen <> 0
		THEN BEGIN
			rueckflag:=true ; neuzeile;
			FOR i:=1 TO leerzeilen DO
			     writeln(ausgabe);
			leerzeilen:=0
		     END;
		zeichenzahl:=1 ; bezeichner[1]:=c;
		kommentaranzeiger:=keinkommentar;
		IF   (c=' ') OR (c=chr(tab)) OR (c=chr(ff))
		THEN BEGIN
			aktiv:=holezeichen;
			WHILE aktiv AND ((c=' ') OR (c=chr(tab)) OR (c=chr(ff))
			)DO
			     BEGIN
				eintragen ; aktiv:=holezeichen
			     END;
			IF   leerzeichenflag
			THEN zeichenzahl:=0
		     END
		ELSE IF   c IN anfangszeichen
		     THEN CASE ord(wandle(c))-32 OF
			  32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49
			  ,50,51,52,53,54,55,56,57,58,3,4,63:
			       (* '@','A','B','C','D','E','F','G','H','I','J',
			       'K','L','M','N','O','P','Q','R','S','T','U','V',
			       'W','X','Y','Z','#','$','_' *)
			       BEGIN
				  IF   holezeichen
				  THEN BEGIN
					  aktiv:=true;
					  WHILE aktiv AND (c IN
					  ziffernundbuchstaben)DO
					       BEGIN
						  eintragen ; aktiv:=
						  holezeichen
					       END
				       END;
				  IF   umwandlung
				  THEN grossklein;
				  einfuegeleerzeichen
			       END;
			  16,17,18,19,20,21,22,23,24,25:
			       (* '0','1','2','3','4','5','6','7','8','9' *)
			       BEGIN
				  IF   holezeichen
				  THEN BEGIN
					  entferneziffer;
					  IF   aktiv AND (c='.')
					  THEN BEGIN
						  naechsteszeichen;
						  IF   c='.'
						  THEN BEGIN
							  punktflag:=true;
							  zeichenzahl:=
							  zeichenzahl-1
						       END
						  ELSE entferneziffer
					       END;
					  IF   aktiv AND ((c='E') OR (c='e'))
					  THEN BEGIN
						  IF   umwandlung AND (c='e')
						  THEN c:='E';
						  naechsteszeichen;
						  IF   (c='+') OR (c='-')
						  THEN naechsteszeichen;
						  entferneziffer
					       END
				       END;
				  einfuegeleerzeichen
			       END;
			  7:   (* '''' *)
			       REPEAT
				  REPEAT
				     IF   NOT holezeichen
				     THEN BEGIN
					     drucke ; neuzeile;
					     zeichenzahl:=0
					  END;
				     eintragen
				  UNTIL c='''';
				  aktiv:=holezeichen AND (c='''');
				  IF   aktiv
				  THEN eintragen
			       UNTIL NOT aktiv;
			  28:  (* '<' *)
			       IF   holezeichen
			       THEN IF   (c='>') OR (c='=')
				    THEN naechsteszeichen;
			  10:  (* '*' *)
			       IF   holezeichen
			       THEN IF   c=')'
				    THEN naechsteszeichen;
			  26,30:
			       (* ':','>' *)
			       IF   holezeichen
			       THEN IF   c='='
				    THEN naechsteszeichen;
			  14:  (* '.' *)
			       IF   holezeichen
			       THEN IF   (c=')') OR (c='.')
				    THEN naechsteszeichen;
			  8:   (* '(' *)
			       IF   holezeichen
			       THEN IF   c='.'
				    THEN naechsteszeichen
				    ELSE IF   c='*'
					 THEN BEGIN
						 naechsteszeichen;
						 kommentaranzeiger:=klammer
					      END;
			  59:  (* '[', da { durch wandle zu [ wird *)
			       BEGIN
				  kommentaranzeiger:=schweifauf;
				  dummy:=holezeichen
			       END;
			  ELSE (* kann eigentlich nicht auftreten *)
			       dummy:=holezeichen
			  END
		     ELSE dummy:=holezeichen
	     UNTIL zeichenzahl>0;
	leerzeichenflag:=false
     END;
     (* liesreihe *)

FUNCTION holezeichen:boolean;
     (* holt ein Zeichen nach c und zaehlt Leerzeilen in der Eingabe *)
     (* false : Zeichen ist erstes Zeichen der Eingabezeile *)
     (*  true : sonst *)
     LABEL
	  1,2,3,4;

     PROCEDURE zeilenanzeige;
	  BEGIN
	     zeilennr:=zeilennr+1;
	     write(zeilennr:anzbacksp,backspaces)
	  END;
	  (* zeilenanzeige *)

     BEGIN
	(* holezeichen *)
	IF   eofflag
	THEN fehlmeld(eingabeerschoepft);
	IF   punktflag
	THEN BEGIN
		punktflag:=false ; holezeichen:=true ; c:='.'
	     END
	ELSE BEGIN
		c:=gnb(eingabe) ; holezeichen:=true;
		IF   c=chr(ctrlz)
		THEN GOTO 3;
		IF   c<>chr(cr)
		THEN GOTO 4;
		zeilenanzeige ; holezeichen:=false ; leerzeilen:=0;
	     1: c:=gnb(eingabe);
		IF   c=chr(ctrlz)
		THEN GOTO 3;
	     2: c:=gnb(eingabe);
		IF   c=chr(ctrlz)
		THEN GOTO 3;
		IF   c=chr(cr)
		THEN BEGIN
			zeilenanzeige ; leerzeilen:=leerzeilen+1;
			GOTO 1
		     END;
		IF   (c=' ') OR (c=chr(tab)) OR (c=chr(ff))
		THEN GOTO 2;
		GOTO 4;
	     3: eofflag:=true ; c:=' ';
	     4:
	     END
     END;
     (* holezeichen *)

PROCEDURE entfkommentar;

     PROCEDURE ueberspringe(VAR symbol:schluesselwort);
	  VAR  u:boolean;
	  BEGIN
	     u:=umwandlung ; umwandlung:=false ; suche(symbol);
	     umwandlung:=u ; drucke ; leerzeilen:=0 ; liesreihe
	  END;
	  (* ueberspringe *)

     BEGIN
	(* entfkommentar *)
	REPEAT
	   CASE kommentaranzeiger OF
	   klammer:
		ueberspringe(sternklammerzu);
	   schweifauf:
		ueberspringe(schweifzu)
	   END;
	   IF   (puffer.bezeichner[1]=' ') OR (puffer.bezeichner[1]=chr(tab))OR
		(puffer.bezeichner[1]=chr(ff))
	   THEN BEGIN
		   leerzeilen:=0 ; liesreihe
		END
	UNTIL kommentaranzeiger=keinkommentar;
	zahloderbezeichner:=false
     END;
     (* entfkommentar *)

PROCEDURE lies;
     (* die naechste zusammengehoerige Zeichenreihe, die kein Kommentar ist
     wird nach puffer gelesen *)

     PROCEDURE comment(VAR terminator:schluesselwort);
	  VAR  u:boolean;
	       h:zahl;
	  BEGIN
	     h:=tiefeeinruecken;
	     IF   tiefekommentar<>maxzahl
	     THEN tiefeeinruecken:=tiefekommentar;
	     rueckflag:=true ; u:=umwandlung ; umwandlung:=false;
	     suche(terminator) ; umwandlung:=u ; drucke ; tiefeeinruecken:=h;
	     leerzeichenflag:=true ; neuzeile
	  END;
	  (* comment *)

     BEGIN
	(* lies *)
	REPEAT
	   liesreihe;
	   CASE kommentaranzeiger OF
	   keinkommentar:
		;
	   klammer:
		comment(sternklammerzu);
	   schweifauf:
		comment(schweifzu)
	   END
	UNTIL NOT leerzeichenflag
     END;
     (* lies *)

PROCEDURE liesohneleerzeichen;
     (* liest die naechste zusammengehoerende Zeichenreihe nach puffer,
     fuehrende Trennzeichen werden verworfen *)
     BEGIN
	leerzeichenflag:=true ; lies
     END;
     (* liesohneleerzeichen *)

PROCEDURE lieskeinleerzeichen;
     (* liest die naechste zusammengehoerende Zeichenreihe nach puffer,
     fuehrende Trennzeichen werden gleich gedruckt *)
     BEGIN
	lies;
	IF   (puffer.bezeichner[1]=' ') OR (puffer.bezeichner[1]=chr(tab)) OR(
	     puffer.bezeichner[1]=chr(ff))
	THEN BEGIN
		drucke ; lies
	     END
     END;
     (* lieskeinleerzeichen *)

PROCEDURE dateiundparameter;
     CONST
	  stdschreibbreite=79;
	  stdeinruecktiefe=5;
	  stdkommentar=-1;
	  vschreibbreite=5;
	  veinruecktiefe=5;
	  vkommentar=5;
	  vumwandlung=5;
	  (* maximale Anzahl Abfragen ohne Wiederholen des ganzen Textes *)
	  maxlaufwerk='D:';
	  maxbreite=170;
	  textzeichenbetragen=' Zeichen betragen.';
     VAR  keineparameter:boolean;

     PROCEDURE getdateinamen(VAR keineparameter:boolean);
	  TYPE string4=STRING[4];
	       string8=STRING[8];
	       string14=STRING[14];
	  VAR  ein,rest:string255;
	       okay:boolean;
	       option:char;
	       dev,daus:string4;
	       name,naus:string8;
	       strp:strpointer;

	  FUNCTION isconorlst(x:string255):boolean;
	       BEGIN
		  isconorlst:=(x=textcon) OR (x=textlst)
	       END;
	       (* isconorlst *)

	  PROCEDURE getfilename(ein:string255;VAR rest:string255;frage:
	  string255;stddev:string4;stdname:string8;stdext:string4;VAR dev:
	  string4;VAR name:string8;VAR filename:string14;VAR option:char);
	       VAR  stdfilename:STRING[17];
		    ext:string4;

	       PROCEDURE verarbeite;
		    VAR  cpos:byte;
			 hilf:string255;

		    FUNCTION min(a,b:integer):integer;
			 BEGIN
			    IF   a<b
			    THEN min:=a
			    ELSE min:=b
			 END;
			 (* min *)

		    BEGIN
		       (* verarbeite *)
		       cpos:=1;
		       WHILE (cpos<=length(ein)) AND (ein[cpos]=' ') DO
			    cpos:=cpos+1;
		       segm(ein,cpos,length(ein),ein);
		       FOR cpos:=1 TO length(ein) DO
			    ein[cpos]:=wandle(ein[cpos]);
		       cpos:=pos('/',ein);
		       IF   (cpos=0) OR (cpos=length(ein))
		       THEN BEGIN
			       IF   cpos>0
			       THEN segm(ein,1,cpos-1,ein)
			    END
		       ELSE BEGIN
			       option:=ein[cpos+1] ; segm(ein,1,cpos-1,hilf);
			       segm(ein,cpos+2,length(ein),ein);
			       conc(hilf,ein,ein)
			    END;
		       conc(ein,' ',ein) ; cpos:=pos(' ',ein);
		       segm(ein,cpos+1,length(ein),rest);
		       segm(ein,1,cpos-1,ein) ; cpos:=pos(':',ein);
		       IF   cpos>0
		       THEN BEGIN
			       segm(ein,1,min(4,cpos),dev);
			       IF   NOT ((length(dev)=2) AND (dev>='A:') AND (
				    dev<=maxlaufwerk) OR isconorlst(dev))
			       THEN dev:=stddev;
			       segm(ein,cpos+1,length(ein),ein)
			    END
		       ELSE dev:=stddev;
		       cpos:=pos('.',ein);
		       IF   cpos>0
		       THEN BEGIN
			       segm(ein,cpos,min(length(ein),cpos+3),ext);
			       segm(ein,1,cpos-1,ein)
			    END
		       ELSE ext:=stdext;
		       IF   length(ein)>0
		       THEN segm(ein,1,min(length(ein),8),name)
		       ELSE name:=stdname
		    END;
		    (* verarbeite *)

	       BEGIN
		  (* getfilename *)
		  IF   length(stdname)>0
		  THEN BEGIN
			  conc('[',stddev,stdfilename);
			  conc(stdfilename,stdname,stdfilename);
			  conc(stdfilename,stdext,stdfilename);
			  conc(stdfilename,'] ',stdfilename);
		       END
		  ELSE stdfilename:='';
		  name:='' ; dev:='';
		  IF   length(ein)>0
		  THEN verarbeite;
		  WHILE (length(name)=0) AND NOT isconorlst(dev) DO
		       BEGIN
			  writeln;
			  write(frage,stdfilename);
			  readln(ein);
			  verarbeite;
			  rest:=''
		       END;
		  IF   isconorlst(dev)
		  THEN filename:=dev
		  ELSE BEGIN
			  conc(dev,name,filename);
			  conc(filename,ext,filename)
		       END
	       END;
	       (* getfilename *)

	  BEGIN
	     (* getdateinamen *)
	     strp:=@cmd;
	     ein:=strp^;
	     option:=' ';
	     REPEAT
		getfilename(ein,rest,
		'Dateiname des zu formatierenden Pascalprogramms: ','','',
		'.PAS',dev,name,nameein,option);
		okay:=false ; ein:='';
		IF   isconorlst(nameein)
		THEN BEGIN
			writeln;
			writeln('** Fehler: Eingabe darf nicht ',nameein,
			' sein.')
		     END
		ELSE BEGIN
			assign(eingabe,nameein);
			reset(eingabe);
			IF   ioresult=255
			THEN writeln('** Fehler: Eingabedatei ',nameein,
			     ' existiert nicht.')
			ELSE okay:=true
		     END
	     UNTIL okay;
	     REPEAT
		getfilename(rest,ein,'Datei auf die formatiert werden soll: ',
		dev,name,'.FRM',daus,naus,nameaus,option);
		okay:=false ; rest:='';
		IF   isconorlst(nameaus)
		THEN okay:=true
		ELSE IF   nameein=nameaus
		     THEN BEGIN
			     writeln;
			     writeln(
           '** Fehler: Eingabedatei und Ausgabedatei muessen verschieden sein.'
			     )
			  END
		     ELSE BEGIN
			     assign(ausgabe,nameaus);
			     reset(ausgabe);
			     IF   ioresult=255
			     THEN okay:=true
			     ELSE BEGIN
				     REPEAT
					writeln;
					write('Die Datei ',nameaus,
                    ' existiert bereits. Soll sie geloescht werden? (J/N) [J] '
					);
					readln(ein)
				     UNTIL (length(ein)=0) OR (wandle(ein[1])
				     IN ['J','Y','N']);
				     IF   (length(ein)=0) OR (wandle(ein[1]) IN
					  ['J','Y'])
				     THEN BEGIN
					     okay:=true;
					     writeln;
					     writeln('Die Datei ',nameaus,
					     ' wurde geloescht.');
					     purge(ausgabe)
					  END
				  END
			  END
	     UNTIL okay;
	     assign(ausgabe,nameaus);
	     rewrite(ausgabe);
	     keineparameter:=false;
	     CASE option OF
	     'K': BEGIN
		     breite:=stdschreibbreite;
		     tiefe:=maxzahl;
		     tiefekommentar:=0;
		     umwandlung:=false
		  END;
	     'C','S':
		  BEGIN
		     breite:=stdschreibbreite;
		     tiefe:=stdeinruecktiefe;
		     tiefekommentar:=maxzahl;
		     umwandlung:=true;
		     IF   option='C'
		     THEN BEGIN
			     writeln;
			     writeln(copyright);
			     writeln
			  END
		  END;
	     ELSE keineparameter:=true
	     END
	  END;
	  (* getdateiname *)

     PROCEDURE getparameter;

	  FUNCTION getnumber(ersatzwert:integer):integer;
	       VAR  vz,z,readp:integer;
		    c:char;
		    inp:string255;
		    leereingabe:boolean;
	       BEGIN
		  z:=0 ; vz:=1 ; leereingabe:=true;
		  readln(inp) ; readp:=1;
		  WHILE readp<=length(inp) DO
		       BEGIN
			  c:=inp[readp] ; readp:=readp+1;
			  IF   c='-'
			  THEN vz:=-1
			  ELSE IF   (c>='0') AND (c<='9') AND (z<=1000)
			       THEN BEGIN
				       z:=10*z+ord(c)-ord('0') ; leereingabe:=
				       false
				    END
		       END;
		  IF   leereingabe
		  THEN getnumber:=ersatzwert
		  ELSE getnumber:=z*vz
	       END;
	       (* getnumber *)

	  PROCEDURE getschreibbreite;
	       VAR  fertig:boolean;
		    h:integer;
		    zaehler:0..vschreibbreite;
	       BEGIN
		  zaehler:=0;
		  REPEAT
		     fertig:=false;
		     IF   zaehler=0
		     THEN BEGIN
			     writeln ; writeln ; writeln(textschreibbreite);
			     writeln('  maximale Laenge einer Ausgabezeile.');
			     write('  Sie muss zwischen',minbreite:3,' und',
			     maxbreite:4,'  Zeichen pro Zeile liegen.')
			  END;
		     IF   zaehler=vschreibbreite
		     THEN zaehler:=0
		     ELSE zaehler:=zaehler+1;
		     writeln;
		     write(texteingabe,textschreibbreite,'[',stdschreibbreite:2
		     ,'] ');
		     h:=getnumber(stdschreibbreite);
		     IF   h<minbreite
		     THEN BEGIN
			     write(
			     '** Fehler: Die Schreibbreite muss mindestens',
			     minbreite:3,textzeichenbetragen)
			  END
		     ELSE IF   h>maxbreite
			  THEN BEGIN
				  write(
                                 '** Fehler: Die Schreibbreite darf hoechstens'
				  ,maxbreite:4,textzeichenbetragen)
			       END
			  ELSE BEGIN
				  breite:=h ; fertig:=true
			       END
		  UNTIL fertig
	       END;
	       (* getschreibbreite *)

	  PROCEDURE geteinruecktiefe;
	       VAR  fertig:boolean;
		    h,lim:integer;
		    zaehler:0..veinruecktiefe;
	       BEGIN
		  zaehler:=0 ; lim:=breite-minzeichenzahl-1;
		  REPEAT
		     fertig:=false;
		     IF   zaehler=0
		     THEN BEGIN
			     writeln ; writeln ; writeln(texteinruecktiefe);
			     writeln(
			     '  falls >= 0: Anzahl der Leerzeichen pro Stufe.')
			     ;
			     writeln('  falls  < 0: Komprimieren der Quelle.');
			     write('  Sie darf hoechstens',lim:3,
			     textzeichenbetragen)
			  END;
		     IF   zaehler=veinruecktiefe
		     THEN zaehler:=0
		     ELSE zaehler:=zaehler+1;
		     writeln;
		     write(texteingabe,texteinruecktiefe,'[',stdeinruecktiefe:1
		     ,'] ');
		     h:=getnumber(stdeinruecktiefe);
		     IF   h>lim
		     THEN BEGIN
			     write(
			     '** Fehler: Die Einruecktiefe darf hoechstens',lim
			     :3,textzeichenbetragen)
			  END
		     ELSE BEGIN
			     IF   h<0
			     THEN tiefe:=maxzahl
			     ELSE tiefe:=h;
			     fertig:=true
			  END
		  UNTIL fertig
	       END;
	       (* geteinruecktiefe *)

	  PROCEDURE getkommentar;
	       VAR  fertig:boolean;
		    h,lim:integer;
		    zaehler:0..vkommentar;
	       BEGIN
		  zaehler:=0 ; lim:=breite-3;
		  REPEAT
		     fertig:=false;
		     IF   zaehler=0
		     THEN BEGIN
			     writeln ; writeln ; writeln(textkommentar);
			     writeln(
                          '  falls >= 0: Anzahl der Leerzeichen pro Kommentar.'
			     );
			     writeln('  falls  < 0: Gemaess Stufe einruecken.')
			     ;
			     write('  Kommentar darf hoechstens',lim:3,
			     textzeichenbetragen)
			  END;
		     IF   zaehler=vkommentar
		     THEN zaehler:=0
		     ELSE zaehler:=zaehler+1;
		     writeln;
		     write(texteingabe,textkommentar,'[',stdkommentar:2,'] ');
		     h:=getnumber(stdkommentar);
		     IF   h>lim
		     THEN BEGIN
			     write('** Fehler: Kommentar darf hoechstens',lim:3
			     ,textzeichenbetragen)
			  END
		     ELSE BEGIN
			     IF   h<0
			     THEN tiefekommentar:=maxzahl
			     ELSE tiefekommentar:=h;
			     fertig:=true
			  END
		  UNTIL fertig
	       END;
	       (* getkommentar *)

	  PROCEDURE getumwandlung;
	       VAR  fertig:boolean;
		    c:char;
		    inp:string255;
		    zaehler:0..vumwandlung;
	       BEGIN
		  zaehler:=0;
		  REPEAT
		     fertig:=false;
		     IF   zaehler=0
		     THEN BEGIN
			     writeln ; writeln ; writeln(textumwandlung);
			     writeln(
       '  falls J: Schluesselworte gross, sonstige Bezeichner klein schreiben.'
			     );
			     writeln(
			     '  falls N: keine Veraenderung der Schreibweise.')
			  END;
		     IF   zaehler=vumwandlung
		     THEN zaehler:=0
		     ELSE zaehler:=zaehler+1;
		     write(texteingabe,textumwandlung,'[J] ') ; readln(inp);
		     IF   inp=''
		     THEN c:=' '
		     ELSE c:=inp[1];
		     IF   c IN[' ','j','J','n','N','y','Y']
		     THEN fertig:=true
		     ELSE writeln('** Fehler: Bitte J oder N eingeben!')
		  UNTIL fertig;
		  umwandlung:=(c<>'N') AND (c<>'n')
	       END;
	       (* getumwandlung *)

	  BEGIN
	     (* getparameter *)
	     getschreibbreite ; geteinruecktiefe;
	     IF   tiefe=maxzahl
	     THEN tiefekommentar:=0
	     ELSE getkommentar;
	     getumwandlung
	  END;
	  (* getparameter *)

     BEGIN
	(* dateiundparameter *)
	keineparameter:=true ; getdateinamen(keineparameter);
	IF   keineparameter
	THEN getparameter
     END;
     (* dateiundparameter *)

PROCEDURE initialisieren;
     CONST
	  version='3.03      (23.03.1983)';

     PROCEDURE ueberschrift;
	  BEGIN
	     writeln ; writeln('PASCFORM    V-',version)
	  END;
	  (* ueberschrift *)

     PROCEDURE verwendeteparameter;

	  PROCEDURE wandeldruck(x:zahl);
	       BEGIN
		  IF   x=maxzahl
		  THEN writeln('   -1')
		  ELSE writeln(x:5)
	       END;
	       (* wandeldruck *)

	  BEGIN
	     writeln ; writeln ; writeln('Verwendete Parameter:');
	     writeln(textschreibbreite:23,breite:5);
	     write(texteinruecktiefe:23) ; wandeldruck(tiefe);
	     write(textkommentar:23) ; wandeldruck(tiefekommentar);
	     write(textumwandlung:23);
	     IF   umwandlung
	     THEN writeln('    J')
	     ELSE writeln('    N');
	     writeln;
	     IF   tiefe=maxzahl
	     THEN write('Komprimiere ')
	     ELSE write('Formatiere ');
	     writeln(nameein,' ---> ',nameaus);
	     writeln ; write('Zeilennummer: ',1:anzbacksp,backspaces)
	  END;
	  (* verwendeteparameter *)

     PROCEDURE vorbesetzen;
	  VAR  i,s:integer;
	       copy:STRING;

	  PROCEDURE vorbes1;
	       VAR  i:integer;
	       BEGIN
		  ziffern:=['0'..'9'];
		  ziffernundbuchstaben:=['a'..'z','A'..'Z','@','#','$','_']+
		  ziffern;
		  anfangszeichen:=['''','{','(',':','>','<','.','*']+
		  ziffernundbuchstaben;
		  semikolonundziffernundbuchstaben:=[';']+ziffernundbuchstaben;
		  zeile.zeichenzahl:=0 ; tiefeeinruecken:=0 ; leerzeilen:=0;
		  position:=0;
		  zeilennr:=1;
		  FOR i:=1 TO anzbacksp DO
		       backspaces[i]:=chr(bs);
		  IF   tiefe<>maxzahl
		  THEN maxtiefe:=((breite-minzeichenzahl) DIV tiefe)*tiefe
		  ELSE maxtiefe:=0;
		  halbetiefe:=(tiefe+1) DIV 2 ; rueckflag:=false;
		  leerzeichenflag:=false;
		  eofflag:=false;
		  platznichtausreichend:=false ; stufeein:=false ; stufeaus:=
		  false;
		  breiteueberschritten:=false ; punktflag:=false;
		  doppelpunkt       .zeichen:=':        ';
		  doppelpunkt       .laenge:=1;
		  gleichheitszeichen.zeichen:='=        ';
		  gleichheitszeichen.laenge:=1;
		  strichpunkt       .zeichen:=';        ';
		  strichpunkt       .laenge:=1;
		  klammerauf        .zeichen:='(        ';
		  klammerauf        .laenge:=1;
		  klammerzu         .zeichen:=')        ';
		  klammerzu         .laenge:=1;
		  punkt             .zeichen:='.        ';
		  punkt             .laenge:=1;
		  sternklammerzu    .zeichen:='*)       ';
		  sternklammerzu    .laenge:=2;
		  schweifzu         .zeichen:='}        ';
		  schweifzu         .laenge:=1;
		  sabsolute         .zeichen:='ABSOLUTE ';
		  sabsolute         .laenge:=8;
		  sand              .zeichen:='AND      ';
		  sand              .laenge:=3;
		  sarray            .zeichen:='ARRAY    ';
		  sarray            .laenge:=5;
		  sbegin            .zeichen:='BEGIN    ';
		  sbegin            .laenge:=5;
		  scase             .zeichen:='CASE     ';
		  scase             .laenge:=4;
		  sconst            .zeichen:='CONST    ';
		  sconst            .laenge:=5;
		  sdiv              .zeichen:='DIV      ';
		  sdiv              .laenge:=3;
		  sdo               .zeichen:='DO       ';
		  sdo               .laenge:=2;
		  sdownto           .zeichen:='DOWNTO   ';
		  sdownto           .laenge:=6;
		  selse             .zeichen:='ELSE     ';
		  selse             .laenge:=4
	       END;
	       (* vorbes1 *)

	  BEGIN
	     (* vorbesetzen *)
	     s:=0 ; copy:=copyright;
	     FOR i:=1 TO length(copy) DO
		  s:=s+i*ord(copy[i]);
	     IF   s=-2114
	     THEN vorbes1;
	     send              .zeichen:='END      ';
	     send              .laenge:=3;
	     sexternal         .zeichen:='EXTERNAL ';
	     sexternal         .laenge:=8;
	     sfile             .zeichen:='FILE     ';
	     sfile             .laenge:=4;
	     sfor              .zeichen:='FOR      ';
	     sfor              .laenge:=3;
	     sforward          .zeichen:='FORWARD  ';
	     sforward          .laenge:=7;
	     sfunction         .zeichen:='FUNCTION ';
	     sfunction         .laenge:=8;
	     sgoto             .zeichen:='GOTO     ';
	     sgoto             .laenge:=4;
	     sif               .zeichen:='IF       ';
	     sif               .laenge:=2;
	     sin               .zeichen:='IN       ';
	     sin               .laenge:=2;
	     sinterrupt        .zeichen:='INTERRUPT';
	     sinterrupt        .laenge:=9;
	     slabel            .zeichen:='LABEL    ';
	     slabel            .laenge:=5;
	     smod              .zeichen:='MOD      ';
	     smod              .laenge:=3;
	     smodend           .zeichen:='MODEND   ';
	     smodend           .laenge:=6;
	     smodule           .zeichen:='MODULE   ';
	     smodule           .laenge:=6;
	     snil              .zeichen:='NIL      ';
	     snil              .laenge:=3;
	     snot              .zeichen:='NOT      ';
	     snot              .laenge:=3;
	     sof               .zeichen:='OF       ';
	     sof               .laenge:=2;
	     sor               .zeichen:='OR       ';
	     sor               .laenge:=2;
	     spacked           .zeichen:='PACKED   ';
	     spacked           .laenge:=6;
	     sprocedure        .zeichen:='PROCEDURE';
	     sprocedure        .laenge:=9;
	     sprogram          .zeichen:='PROGRAM  ';
	     sprogram          .laenge:=7;
	     srecord           .zeichen:='RECORD   ';
	     srecord           .laenge:=6;
	     srepeat           .zeichen:='REPEAT   ';
	     srepeat           .laenge:=6;
	     sset              .zeichen:='SET      ';
	     sset              .laenge:=3;
	     sstring           .zeichen:='STRING   ';
	     sstring           .laenge:=6;
	     sthen             .zeichen:='THEN     ';
	     sthen             .laenge:=4;
	     sto               .zeichen:='TO       ';
	     sto               .laenge:=2;
	     stype             .zeichen:='TYPE     ';
	     stype             .laenge:=4;
	     suntil            .zeichen:='UNTIL    ';
	     suntil            .laenge:=5;
	     svar              .zeichen:='VAR      ';
	     svar              .laenge:=3;
	     swhile            .zeichen:='WHILE    ';
	     swhile            .laenge:=5;
	     swith             .zeichen:='WITH     ';
	     swith             .laenge:=4
	  END;
	  (* vorbesetzen *)

     BEGIN
	(* initialisieren *)
	ueberschrift ; dateiundparameter ; vorbesetzen ; verwendeteparameter;
	assign(ausgabe,nameaus) ; rewrite(ausgabe);
	IF   holezeichen
	THEN
     END;
     (* initialisieren *)

PROCEDURE foif;
     BEGIN
	rueckflag:=true ; druckleer(sif);
	(* 'IF' *)
	einruecken ; liesohneleerzeichen ; finde(sthen) ; ausruecken;
	druckleer(sthen);
	(* 'THEN' *)
	einruecken ; liesohneleerzeichen ; zuletztwarstrichpunkt:=false;
	IF   puffergleich(send)
	THEN neuzeile
	ELSE BEGIN
		foanweisung;
		IF   puffergleich(selse) AND NOT zuletztwarstrichpunkt
		THEN BEGIN
			ausruecken ; druckleer(selse);
			(* 'ELSE' *)
			einruecken ; liesohneleerzeichen ; foanweisung
		     END
	     END;
	ausruecken
     END;
     (* foif *)

PROCEDURE behandlestrichpunkt;
     BEGIN
	zuletztwarstrichpunkt:=puffergleich(strichpunkt);
	IF   zuletztwarstrichpunkt
	THEN BEGIN
		drucke;
		(* 'Strichpunkt' *)
		IF   (zeile.zeichenzahl=1) OR (zeile.bezeichner[zeile.
		     zeichenzahl-1]<>' ')
		THEN neuzeile
		ELSE (* hinter Strichpunkt einen Zwischenraum lassen *)
		     schreibe(' ');
		liesohneleerzeichen
	     END
	ELSE neuzeile
     END;
     (* behandlestrichpunkt *)

PROCEDURE foeinfacheanweisung;
     (* formatiert eine einfache unmarkierte Anweisung *)
     BEGIN
	WHILE NOT (puffergleich(strichpunkt) OR puffergleich(send) OR
	puffergleich(selse) OR puffergleich(suntil)) DO
	     BEGIN
		drucke ; lies
	     END;
	behandlestrichpunkt
     END;
     (* foeinfacheanweisung *)

PROCEDURE focase;
     BEGIN
	rueckflag:=true ; finde(sof) ; drucke;
	(* 'OF' *)
	neuzeile ; liesohneleerzeichen;
	WHILE NOT puffergleich(send) DO
	     IF   puffergleich(strichpunkt)
	     THEN BEGIN
		     einruecken ; drucke;
		     (* 'Strichpunkt' *)
		     neuzeile ; ausruecken ; liesohneleerzeichen
		  END
	     ELSE BEGIN
		     IF   puffergleich(selse)
		     THEN BEGIN
			     drucke;
			     (* 'ELSE' *)
			     einruecken ; liesohneleerzeichen
			  END
		     ELSE BEGIN
			     finde(doppelpunkt) ; drucke;
			     (* 'Doppelpunkt' *)
			     einruecken ; liesohneleerzeichen
			  END;
		     foanweisung ; ausruecken
		  END;
	drucke;
	(* 'END' *)
	lieskeinleerzeichen ; behandlestrichpunkt
     END;
     (* focase *)

PROCEDURE foanweisung;
     BEGIN
	IF   puffer.bezeichner[1] IN semikolonundziffernundbuchstaben
	THEN CASE ord(wandle(puffer.bezeichner[1]))-32 OF
	     27:  (* ';' *)
		  behandlestrichpunkt;
	     34:  (* 'B' *)
		  IF   puffergleich(sbegin)
		  THEN BEGIN
			  fosequenz;
			  (* Puffer enthaelt 'Strichpunkt' oder 'END' oder
			  'ELSE'oder'UNTIL' *)
			  behandlestrichpunkt
		       END
		  ELSE foeinfacheanweisung;
	     35:  (* 'C' *)
		  IF   puffergleich(scase)
		  THEN focase
		  ELSE foeinfacheanweisung;
	     37:  (* 'E' *)
		  IF   puffergleich(selse)
		  THEN neuzeile
		  ELSE foeinfacheanweisung;
	     38:  (* 'F' *)
		  IF   puffergleich(sfor)
		  THEN foforwhilewith
		  ELSE foeinfacheanweisung;
	     41:  (* 'I' *)
		  IF   puffergleich(sif)
		  THEN foif
		  ELSE foeinfacheanweisung;
	     50:  (* 'R' *)
		  IF   puffergleich(srepeat)
		  THEN forepeat
		  ELSE foeinfacheanweisung;
	     53:  (* 'U' *)
		  IF   puffergleich(suntil)
		  THEN neuzeile
		  ELSE foeinfacheanweisung;
	     55:  (* 'W' *)
		  IF   puffergleich(swhile) OR puffergleich(swith)
		  THEN foforwhilewith
		  ELSE foeinfacheanweisung;
	     16,17,18,19,20,21,22,23,24,25:
		  (* '0','1','2','3','4','5','6','7','8','9' *)
		  BEGIN
		     halbausruecken;
		     finde(doppelpunkt) ; drucke;
		     (* 'Doppelpunkt' *)
		     halbeinruecken ; liesohneleerzeichen;
		     IF   NOT (puffergleich(send) OR puffergleich(selse)OR
			  puffergleich(suntil))
		     THEN foanweisung
		  END;
	     ELSE (* 'A','D','G','H','J','K','L','M','N','O','P','Q','S','T',
		  'V','X','Y','Z','$','#','_' *)
		  foeinfacheanweisung
	     END
	ELSE fehlmeld(falscheranfang)
     END;
     (* foanweisung *)

PROCEDURE fosequenz;
     (* formatiert eine Anweisungssequenz *)
     BEGIN
	rueckflag:=true ; drucke;
	(* 'BEGIN' *)
	neuzeile ; halbeinruecken ; liesohneleerzeichen;
	WHILE NOT (puffergleich(send) OR puffergleich(suntil) OR puffergleich(
	selse))DO
	     foanweisung;
	IF   puffergleich(suntil)
	THEN fehlmeld(untilohnerepeat)
	ELSE IF   puffergleich(selse)
	     THEN fehlmeld(elseohneif);
	halbausruecken ; drucke;
	(* 'END' *)
	lieskeinleerzeichen
     END;
     (* fosequenz *)

PROCEDURE foforwhilewith;
     BEGIN
	rueckflag:=true ; finde(sdo) ; drucke;
	(* 'DO' *)
	neuzeile ; einruecken ; liesohneleerzeichen;
	IF   NOT puffergleich(send)
	THEN foanweisung;
	ausruecken
     END;
     (* foforwhilewith *)

PROCEDURE forepeat;
     BEGIN
	rueckflag:=true ; drucke;
	(* 'REPEAT' *)
	neuzeile ; halbeinruecken ; liesohneleerzeichen;
	WHILE NOT (puffergleich(suntil) OR puffergleich(send) OR puffergleich(
	selse)) DO
	     foanweisung;
	IF   puffergleich(send)
	THEN fehlmeld(endohnebegin)
	ELSE IF   puffergleich(selse)
	     THEN fehlmeld(elseohneif);
	halbausruecken ; drucke;
	(* 'UNTIL' *)
	lies ; foeinfacheanweisung
     END;
     (* forepeat *)

PROCEDURE fotyp;
     (* formatiert einen einzelnen Typ *)

     PROCEDURE entfernestrichpunkt;
	  BEGIN
	     IF   puffergleich(strichpunkt)
	     THEN BEGIN
		     drucke;
		     (* 'Strichpunkt' *)
		     neuzeile ; liesohneleerzeichen;
		     WHILE puffergleich(strichpunkt) DO
			  BEGIN
			     drucke;
			     (* 'Strichpunkt' *)
			     neuzeile ; liesohneleerzeichen
			  END
		  END
	  END;
	  (* entfernestrichpunkt *)

     PROCEDURE fofieldlist;

	  PROCEDURE focase;
	       BEGIN
		  finde(sof) ; drucke;
		  (* 'OF' *)
		  neuzeile ; liesohneleerzeichen ; entfernestrichpunkt;
		  WHILE NOT (puffergleich(klammerzu) OR puffergleich(send)) DO
		       BEGIN
			  finde(doppelpunkt) ; drucke;
			  (* 'Doppelpunkt' *)
			  einruecken ; liesohneleerzeichen ; drucke;
			  (* 'Klammerauf' *)
			  lieskeinleerzeichen ; fofieldlist;
			  rueckflag:=position=0;
			  drucke ; lieskeinleerzeichen;
			  entfernestrichpunkt ; ausruecken
		       END
	       END;
	       (* focase *)

	  BEGIN
	     (* fofieldlist *)
	     entfernestrichpunkt;
	     WHILE NOT (puffergleich(klammerzu) OR puffergleich(send) OR
	     puffergleich(scase)) DO
		  BEGIN
		     finde(doppelpunkt) ; drucke;
		     (* 'Doppelpunkt' *)
		     lieskeinleerzeichen ; fotyp
		  END;
	     IF   puffergleich(scase)
	     THEN focase
	  END;
	  (* fofieldlist *)

     PROCEDURE forecord;
	  BEGIN
	     liesohneleerzeichen ; fofieldlist;
	     IF   puffergleich(send)
	     THEN neuzeile;
	     drucke ; lieskeinleerzeichen;
	     IF   puffergleich(strichpunkt)
	     THEN BEGIN
		     entfernestrichpunkt ; ausruecken
		  END
	     ELSE BEGIN
		     ausruecken ; rueckflag:=false
		  END
	  END;
	  (* forecord *)

     PROCEDURE foeinftyp;
	  (* formatiert einen einfachen Typ *)
	  VAR  klammer:boolean;
	  BEGIN
	     IF   puffergleich(sfile) OR puffergleich(sarray)
	     THEN BEGIN
		     finde(sof) ; druckleer(sof);
		     (* 'OF' *)
		     liesohneleerzeichen ; fotyp
		  END
	     ELSE BEGIN
		     klammer:=puffergleich(klammerauf);
		     REPEAT
			drucke ; lies
		     UNTIL puffergleich(strichpunkt) OR puffergleich(send) OR (
		     puffergleich(klammerzu) AND NOT klammer);
		     entfernestrichpunkt
		  END
	  END;
	  (* foeinftyp *)

     BEGIN
	(* fotyp *)
	IF   puffergleich(spacked)
	THEN BEGIN
		druckleer(spacked);
		(* 'PACKED' *)
		liesohneleerzeichen
	     END;
	IF   puffergleich(srecord)
	THEN BEGIN
		einruecken ; drucke;
		(* 'RECORD' *)
		neuzeile ; forecord
	     END
	ELSE foeinftyp
     END;
     (* fotyp *)

PROCEDURE folabel;
     BEGIN
	IF   puffergleich(slabel)
	THEN BEGIN
		druckleer(slabel);
		(* 'LABEL' *)
		einruecken ; liesohneleerzeichen;
		finde(strichpunkt) ; drucke;
		(* 'Strichpunkt' *)
		neuzeile ; ausruecken ; liesohneleerzeichen
	     END
     END;
     (* folabel *)

PROCEDURE foconst;
     BEGIN
	IF   puffergleich(sconst)
	THEN BEGIN
		druckleer(sconst);
		(* 'CONST' *)
		einruecken ; liesohneleerzeichen;
		REPEAT
		   finde(strichpunkt) ; drucke;
		   (* 'Strichpunkt' *)
		   neuzeile ; liesohneleerzeichen
		UNTIL puffergleich(stype) OR puffergleich(svar) OR puffergleich
		(sprocedure) OR puffergleich(sfunction) OR puffergleich(sbegin)
		OR puffergleich(sexternal);
		ausruecken
	     END
     END;
     (* foconst *)

PROCEDURE fotype;
     BEGIN
	IF   puffergleich(stype)
	THEN BEGIN
		druckleer(stype);
		(* 'TYPE' *)
		einruecken ; liesohneleerzeichen;
		REPEAT
		   finde(gleichheitszeichen) ; drucke;
		   (* 'Gleichheitszeichen' *)
		   lieskeinleerzeichen ; fotyp
		UNTIL puffergleich(svar) OR puffergleich(sprocedure) OR
		puffergleich(sfunction) OR puffergleich(sbegin) OR puffergleich
		(sexternal);
		ausruecken
	     END
     END;
     (* fotype *)

PROCEDURE fovar;
     BEGIN
	IF   puffergleich(svar)
	THEN BEGIN
		druckleer(svar);
		(* 'VAR' *)
		einruecken ; liesohneleerzeichen;
		REPEAT
		   finde(doppelpunkt) ; drucke;
		   (* 'Doppelpunkt' *)
		   lieskeinleerzeichen ; fotyp
		UNTIL puffergleich(sprocedure) OR puffergleich(sfunction) OR
		puffergleich(sbegin) OR puffergleich(sexternal);
		ausruecken
	     END
     END;
     (* fovar *)

PROCEDURE foprofun;
     (* formatiert Prozedur- und Funktionsvereinbarungsteil eines Blocks *)
     VAR  zustand:zahl;
	  extflag:boolean;
     BEGIN
	WHILE puffergleich(sprocedure) OR puffergleich(sfunction) OR
	puffergleich(sexternal) DO
	     BEGIN
		extflag:=puffergleich(sexternal) ; drucke;
		(* 'PROCEDURE' oder 'FUNCTION' oder 'EXTERNAL' *)
		IF   extflag
		THEN BEGIN
			lieskeinleerzeichen ; drucke
		     END;
		lieskeinleerzeichen;
		IF   puffergleich(sinterrupt)
		THEN BEGIN
			finde(strichpunkt);
			programmname.zeichenzahl:=0
		     END
		ELSE BEGIN
			programmname:=puffer;
			drucke ; lieskeinleerzeichen;
			CASE puffer.bezeichner[1] OF
			';': ;
			'(': BEGIN
				zustand:=1;
				REPEAT
				   REPEAT
				      drucke ; lies
				   UNTIL puffergleich(klammerauf)OR
				   puffergleich(klammerzu);
				   IF   puffergleich(klammerzu)
				   THEN zustand:=zustand-1
				   ELSE zustand:=zustand+1
				UNTIL zustand=0;
				drucke ; lieskeinleerzeichen;
				IF   NOT puffergleich(strichpunkt)
				THEN finde(strichpunkt)
			     END;
			ELSE finde(strichpunkt)
			END
		     END;
		drucke;
		(* 'Strichpunkt' *)
		neuzeile ;
		IF   extflag
		THEN liesohneleerzeichen
		ELSE BEGIN
			einruecken ; liesohneleerzeichen;
			IF   puffergleich(sforward) OR puffergleich(sexternal)
			THEN finde(strichpunkt)
			ELSE foblock(programmname);
			drucke;
			(* 'Strichpunkt' *)
			neuzeile ; liesohneleerzeichen ; ausruecken
		     END
	     END
     END;
     (* foprofun *)

PROCEDURE foblock(name:zeichenreihe);
     VAR  i:zahl;
     BEGIN
	folabel ; foconst ; fotype ; fovar ; foprofun ;
	IF   puffergleich(sbegin)
	THEN fosequenz
	ELSE BEGIN
		write('** Fehler: ''BEGIN'' fehlt in Block ');
		FOR i:=1 TO name.zeichenzahl DO
		     write(name.bezeichner[i]);
		writeln(' **');
		fehlmeld(blockohnebegin)
	     END
     END;
     (* foblock *)

PROCEDURE fehlmeld(fehler:fehlerart);

     PROCEDURE druckerest;
	  (* druckt die letzten eingelesenen Zeichen aus *)
	  BEGIN
	     drucke ; neuzeile ; writeln(ausgabe) ; write(ausgabe,c);
	     writeln('** Meldung:  Formatierung abgebrochen **')
	  END;
	  (* druckerest *)

     BEGIN
	(* fehlmeld *)
	writeln ; writeln;
	CASE fehler OF
	eingabeerschoepft:
	     BEGIN
		writeln('**  Fehler:  Eingabe erschoepft **') ; drucke ;
		neuzeile
	     END;
	elseohneif:
	     BEGIN
		writeln('**  Fehler:  ELSE ohne IF **') ; druckerest
	     END;
	untilohnerepeat:
	     BEGIN
		writeln('**  Fehler:  UNTIL ohne REPEAT **') ; druckerest
	     END;
	endohnebegin:
	     BEGIN
		writeln('**  Fehler:  END ohne BEGIN **') ; druckerest
	     END;
	blockohnebegin:
	     druckerest;
	keineprocoderfunc:
	     BEGIN
		writeln(
            '**  Fehler:  PROGRAM, MODULE, PROCEDURE oder FUNCTION erwartet **'
		);
		druckerest
	     END;
	falscheranfang:
	     BEGIN
		write(
		'**  Fehler:  Falscher Anfang eines Statements. Zeichen: ''',
		puffer.bezeichner[1],''' **') ; druckerest
	     END;
	punkteingesetzt:
	     BEGIN
		neuzeile ; writeln(ausgabe,'.');
		writeln(
		'** Warnung:  Letztes Zeichen wurde durch ''.'' ersetzt **')
	     END
	END;
	meldeundwarne ; exitprogram
     END;
     (* fehlmeld *)

PROCEDURE meldeundwarne;
     VAR  result:integer;
     BEGIN
	IF   platznichtausreichend
	THEN BEGIN
		writeln(
            '** Meldung: Formatierung stellenweise inkorrekt, da Einruecktiefe'
		);
		writeln(
		'            zu gross und/oder Schreibbreite zu klein ist. **')
		;
		writeln
	     END;
	IF   breiteueberschritten
	THEN BEGIN
		writeln('** Warnung: Schreibbreite wurde ueberschritten **');
		writeln
	     END;
	close(ausgabe,result)
	(* Ausgabedatei schliessen *)
     END;
     (* meldeundwarne *)

PROCEDURE formatieren;
     BEGIN
	liesohneleerzeichen;
	IF   puffergleich(sprogram)
	THEN BEGIN
		drucke;
		(* 'PROGRAM' *)
		lieskeinleerzeichen ; programmname:=puffer;
		finde(strichpunkt) ; drucke;
		(* 'Strichpunkt' *)
		neuzeile ; liesohneleerzeichen ; foblock(programmname);
		IF   eofflag
		THEN IF   puffergleich(punkt)
		     THEN BEGIN
			     drucke ; neuzeile
			  END
		     ELSE fehlmeld(punkteingesetzt)
		ELSE BEGIN
			drucke ; neuzeile
		     END
	     END
	ELSE IF   puffergleich(sprocedure) OR puffergleich(sfunction)
	     THEN foprofun
	     ELSE IF   puffergleich(smodule)
		  THEN BEGIN
			  finde(strichpunkt) ; drucke ; neuzeile ;
			  liesohneleerzeichen ; folabel ; foconst ; fotype ;
			  fovar ; foprofun ; drucke ; liesohneleerzeichen;
			  IF   eofflag
			  THEN IF   puffergleich(punkt)
			       THEN BEGIN
				       drucke ; neuzeile
				    END
			       ELSE fehlmeld(punkteingesetzt)
			  ELSE BEGIN
				  drucke ; neuzeile
			       END
		       END
		  ELSE fehlmeld(keineprocoderfunc)
     END;
     (* formatieren *)

PROCEDURE komprimieren;
     BEGIN
	tiefe:=0 ; zahloderbezeichner:=false ; leerzeilen:=0 ; liesreihe;
	WHILE NOT eofflag DO
	     WITH puffer DO
		  IF   kommentaranzeiger=keinkommentar
		  THEN BEGIN
			  IF   (bezeichner[1]=' ') OR (bezeichner[1]=chr(tab))
			       OR(bezeichner[1]=chr(ff))
			  THEN BEGIN
				  IF   zahloderbezeichner AND (c IN
				       ziffernundbuchstaben)
				  THEN zeichenzahl:=1
				  ELSE zeichenzahl:=0;
				  zahloderbezeichner:=false
			       END
			  ELSE zahloderbezeichner:=bezeichner[1] IN
			       ziffernundbuchstaben;
			  drucke ; leerzeilen:=0 ; liesreihe
		       END
		  ELSE BEGIN
			  entfkommentar ; zahloderbezeichner:=false
		       END;
	drucke ; neuzeile
     END;
     (* komprimieren *)

BEGIN
   (* hauptprogramm *)
   initialisieren;
   IF   tiefe<>maxzahl
   THEN formatieren
   ELSE komprimieren;
   writeln ; writeln ; meldeundwarne;
9999:
END.
