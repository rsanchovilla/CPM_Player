	;
	; Codeschnipsel CONOUT aus AC1-Color-BIOS von H. Poppe
	; korrigierte Version, 30.11.2011
	;
	; Vorbild: AC1-CBIOS aus FA 04/89 und 05/89
	;
	; Bitte die nachfolgenden Hinweise beachten:
	;
	; Die nachfolgenden Routinen muessen bei Bedarf an die
	; eigenen Gegebenheiten und Wuensche angepasst werden!
	;
	; Der Monitor von Ralph prueft beim Einschalten, ob ein
	; Color-BWS vorhanden ist. Wer diesen Monitor nicht
	; nutzt, muss die Pruefung beim BIOS-Kaltstart machen
	; und das Ergebnis in (colo2) eintragen.
	;
	; Das Testergebnis steht auf der Adresse 181Fh: 
	; 0 = kein Color-BWS, sonst der eingestellte Farbwert.
	;
	; Beim BIOS-Kaltstart muss dieser Wert nach (colo2)
	; kopiert werden:
	;
	; -> Monitor-Eprom und RAM sind aktiv
	ld a,(0181Fh)
	ld (colo2),a
	;
	; In der darauf folgenden Warmstart-Routine wird der
	; Wert nach (colo1) und (color) uebertragen. Das muss
	; bei jedem Warmstart erfolgen.
	;
	ld a,(colo2)
	ld (color),a	;Arbeitszelle Farbbyte
	and 77h		;Intensivdarstellung maskieren
	ld (colo1),a	;Arbeitszelle "Normaldarstellung"
	;
	; Danach kann CP/M gestartet werden.
	;
	; Die CONOUT-Routine ist in geeigneter Weise ins BIOS
	; einzubauen. Die Besonderheiten der Routine sind:
	;
	; 1. Komplette Bildschirmausgabe mit Behandlung der
	;    Steuerzeichen, wie im Vorbild AC1-CBIOS
	;
	; 2. Direkte Cursorpositionierung mit der Zeichenfolge
	;    <ESC> <Zeile+80h> <Spalte+80h> (wie SCP)
	;
	;3. Einstellung der Bildschirm- und Zeichenfarbe ueber
	;    <ESC> 5Dh <Farbbyte>, wenn ein Color-BWS vorhanden
	;    ist. Steht in (color) der Wert 00h, dann werden
	;    die Farbausgaben uebersprungen.
	;
	;    Bedeutung der Farbbits: (siehe auch im Schaltplan)
	;
	;	;Bit 7	   = Hintergrundfarbe Intensiv
	;	;Bit 4 - 6 = Hintergrundfarbe
	;	;Bit 3	   = Zeichenfarbe Intensiv
	;	;Bit 0 - 2 = Zeichenfarbe
	;
	;	;Bit 0 = rot; Bit 1 = gruen; Bit 2 = blau
	;
	; 4. Darstellung aller Grafikzeichen aus dem ZG ueber
	;    <ESC> 5Fh <Byte> Die Zeichen werden dabei nicht
	;    als Steuerzeichen interpretiert
	;
	; Beginn der Routine CONOUT:
	;
	; Ausgabe eines Zeichens
	; IN: Zeichen in C
	;
conout:	di
	; Stack bei MON-Aufruf retten
	ld (oldstk),sp
	ld sp,sysp2
	;
	push AF
	push BC
	push DE
	push HL
	;
	call monein
	;
	push hl
	ld hl,(curso)	;Cursorposition
	ld a,(char)	
	ld (hl),a	;altes Zeichen auf Position
	ld a,(stz00)	;Durchlauf bei Steuerzeichen?
	and a
	jp nz,konv10	;NZ= Steuerzeichen 2. oder 3. Durchlauf
	;
	ld a,c		;Byte
	cp 20h		;kleinstes Zeichen
	jr c,konvtb
	cp 7Fh		;groesstes Zeichen
	jr nc,konvtb
	;
	ld HL,(curso)
	jp cchar	;Ausgabe einzelnes Zeichen	
	;
konvt9:	ld hl,(curso)
	ld a,(hl)
	ld (char),a
	;
	call monaus
	;
	pop hl
	pop de
	pop bc
	pop af
	;
	ld sp,(oldstk)
	ei
	;
	ret
	;
	; Verzweigung bei Steuerzeichen
	; INPUT:  A=Zeichen
	;
konvtb:	cp esc			;Steuerzeichen?
	jr nz,konvt1
	ld a,2			;wenn ja
	ld (stz00),a		;Zeiger auf 2
	jp konvt9		;nichts ausgeben
	;
konvt1:	ld hl,(curso)
	cp 01h		;Cursor home
	jp z,chome
	cp 08h		;Cursor links
	jp z,cleft
	cp 0Ah		;Zeilenvorschub
	jp z,clf
	cp 0Ch		;Bildschirm loeschen
	jp z,bcls
	cp 0Dh		;Wagenruecklauf
	jp z,ccret
	cp 14h		;BS ab Cursor loeschen
	jp z,cbloe
	cp 15h		;Cursor nach rechts
	jp z,crigh
	cp 16h		;Zeile ab Cursor loeschen
	jp z,czloe
	cp 18h		;Zeile ab Cursor loeschen + CR
	jp z,czlcr
	cp 1Ah		;Cursor hoch
	jp z,choch
	ld b,a		;Zeichen merken
	ld a,(color)
	and a		;Test auf Color-BWS
	jp z,konvt9	;Z = monochrom
	ld a,b
	cp 84h		;normale Darstellung
	jp z,bnorm
	cp 85h		;invers
	jp z,binvn
	cp 86h		;intensiv
	jp z,binte
	cp 87h		;intensiv + invers
	jp z,bivin
	jp konvt9
	;
	; Behandlung der Bildschirm-Steuerzeichen
	;
chome:	ld hl,017FFh	;01h	Home-Position im BWS
	ld (curso),hl
	jp konvt9
	;
cleft:	inc hl		;08h	Cursor links
	jp choli
	;
clf:	ld DE,40h	;0Ah	Zeilenvorschub		
	and A
	sbc HL,DE
	jp scrol
	;
bcls:	ld a,20h		;0Ch	Bildschirm loeschen
	call bcl1		;Loeschroutine
	ld (curso),hl		;Cursorposition
	ld a,(color)		;Farbbyte
	and 77h			;Farb-BWS vorhanden?
	jp z, konvt9		;Z = nein, dann Ende
	;
	call bwscol		;Farbspeicher ein
	ld a,(color)
	call bcl1
	call bwszei		;Farbspeicher aus
	jp konvt9
	;
bcl1:	ld hl,1000h		;Anfang BWS
	ld (hl),a
	ld d,h
	ld e,l
	inc e
	push bc
	ld bc,07FFh		;Laenge BWS
	ldir
	pop bc
	ret
	;
ccret:	ld a,l		;0Dh	Wagenruecklauf
	or 3Fh
	ld l,a
	jp scrol
	;
cbloe:	push hl
	ld A,0Fh	;14h	BS ab Cursor loeschen
cblo0:	ld (HL),20h
	dec HL
	cp H
	jr nz,cblo0
	pop hl
	ld a,(color)
	ld b,a
	and 77h
	jp z,konvt9
	;
	call bwscol		;Farbspeicher ein
	ld A,0Fh
cblo1:	ld (HL),B
	dec HL
	cp H
	jr nz,cblo1
	call bwszei		;Farbspeicher aus
	jp konvt9
	;
crigh:	dec HL		;15h	Cursor nach rechts
	jp scrol
	;
czloe:	push HL		;16h	Zeile ab Cursor loeschen
	ld A,L
	and 3Fh
	ld B,A
	inc B
czlo0:	ld (HL),20h
	dec HL
	djnz czlo0
	pop HL
	ld A,(color)
	ld C,A
	and 77h
	jp z,konvt9
	;
	call bwscol		;Farbspeicher ein
	ld A,L
	and 3Fh
	ld B,A
	inc B
czlo1:	ld (HL),C
	dec HL
	djnz czlo1
	call bwszei		;Farbspeicher aus
	jp konvt9
	;
czlcr:	push HL		;18h	Zeile ab Cursor loeschen + CR
	ld A,L
	or 3Fh
	ld L,A
	ld (curso),HL
	push HL
	ld B,40h		;Zeilenlaenge
czlc0:	ld (HL),20h
	dec HL
	djnz czlc0
	pop HL
	ld A,(color)
	ld C,A
	and 77h
	jp z,konvt9
	;
	call bwscol		;Farbspeicher ein
	ld B,40h
czlc1:	ld (HL),C
	dec HL
	djnz czlc1
	call bwszei		;Farbspeicher aus
	jp konvt9
	;
choch:	ld DE,40h	;1Ah	Cursor hoch
	add HL,DE
	;
choli:	ld A,18h	;Begrenzung Cursor hoch und links
	cp H
	jp z,konvt9
	ld (curso),HL
	jp konvt9
	;
cchar:	ld (HL),A
	ld a,(color)
	ld c,a
	and 77h
	jr z,ccha0
	;
	call bwscol
	ld (hl),c
	call bwszei
ccha0:	dec HL
	;
scrol:	ld (curso),hl
	ex DE,HL		;Test ob Scrollen noetig
	ld HL,0FFFh
	and A
	sbc HL,DE		;DE = akt. Cursorpos.
	ex DE,HL
	jp c,konvt9		;CY = nicht scrollen
	;
	ld a,20h		;Leerzeichen
	call scr11		;Scrollen
	ld A,(color)
	and 77h
	jp z,konvt9		;Z = kein Farbspeicher
	;
	call bwscol		;Farbspeicher ein
	ld a,(color)		;Farbbyte
	call scr11
	call bwszei		;Farbspeicher aus
	jp konvt9
	;
scr11:	ld hl,17BFh		;Umladeroutine Scrollen
	ld DE,17FFh
	ld BC,07C0h
	lddr
	ex DE,HL
	ld (curso),HL
	inc HL
	ld b,40h		;eine Zeilenlaenge
scr12:	dec L
	ld (HL),A		;Leerzeile schreiben
	djnz scr12
	ret
	;
	; Aufruf nur bei Color-BWS
	; (color) = aktuelle Farbe
	; (colo1) = normale Farbe, ohne Intensiv
	;
bnorm:	ld a,(colo1)	;84h	normale Darstellung
	and 77h
	ld (color),a
	ld (colo1),a
	jp konvt9
	;
binvn:	ld a,(colo1)	;85h	invers EIN
	and 77h
	rrca
	rrca
	rrca
	rrca
	ld (color),a
	jp konvt9
	;
binte:	ld a,(colo1)	;86h	intensiv EIN
	and 77h
	or 08h
	ld (color),a
	jp konvt9
	;
bivin:	ld a,(colo1)	;87h	intensiv + invers
	and 77h
	or 08h
	rrca
	rrca
	rrca
	rrca
	ld (color),a
	jp konvt9
	;
	; Ende Steuerzeichenroutinen fuer Bildschirm
	;
	; Behandlung ESC-Sequenzen
	;
	; Input: ESC + 2 Steuerzeichen
	; wenn 1. Zeichen > 80h dann Cursorposition
	; sonst Auswertung Farbe / Grafikzeichen
	; (stz00) = Zaehler fuer Zeichenanzahl
	;
konv10:	ld a,(stz00)
	cp 2		;2 = 1. Steuerzeichen (Zeile)
	jr nz,konv20	;sonst 3. Durchlauf (Spalte)
	ld a,c
	ld (stz01),a	;erstes Zeichen merken
	ld a,1		;Zeiger fuer 3. Durchlauf
	ld (stz00),a
	jp konvt9	;nichts ausgeben
	;
	; Verzweigung Cursorposition / weitere Funktionen
	;
konv20:	ld a,c
	ld (stz02),a	;zweites Zeichen merken
	xor a
	ld (stz00),a	;Durchlaufzaehler ruecksetzen
	ld hl,stz01
	ld A,(HL)
	bit 7,a		;welche Funktion? NZ = Cursor
	jr z,konv22	;Z = weitere Funktionen
	;
	; Berechnung direkte Cursorposition
	; OUT:	HL = BWS-Adresse
	;
	push AF
	ld a,c
	and 3Fh		;max. Spaltenzahl
	ld L,A
	pop AF
	and 1Fh		;max. Zeilenzahl
	ld D,0
	ld H,D
	ld E,A
	ld B,6
konv21:	sla E
	rl D
	djnz konv21
	add HL,DE
	ex DE,HL
	ld hl,017FFh	;Ende BWS-RAM
	and a
	sbc HL,DE
	;
	; Cursor direkt positionieren
	; IN:	HL = Adresse Cursor
	;
	push hl
	ld hl,(curso)	;alte Position
	ld a,(char)	;Zeichen holen
	ld (hl),a	;auf BS schreiben
	pop hl
	ld (curso),hl	;neue Position setzen
	ld a,(hl)	;neues Zeichen holen
	ld (char),a	;und merken
	jp konvt9
	;
	; Auswertung weiterer ESC-Funktionen
	; IN:	A = 1. Steuerzeichen
	;
	; Ausgabe Grafikzeichen aus AC1-ZG ( > 80h )
	;
konv22:	cp 5Fh		;Grafikzeichen?
	jr nz,konv24	;NZ = nein
	inc hl	
	ld a,(hl)	;2. Zeichen holen
	ld hl,(curso)
	jp cchar	;Zeichen ausgeben
	;
	; Einstellen der Farbe (nur Color-BWS)
	;
konv24:	cp 5Dh		;Farbe?
	jp nz,konvt9	;NZ = nein
	ld a,(color)	;Color-BWS?
	and a
	jp z,konvt9	;Z = nein
	inc hl
	ld a,(hl)	;2. Zeichen holen
	and 77h		;intensiv maskieren
	ld b,a
	rrca
	rrca
	rrca
	rrca
	cp b		;Zeichen- und HG-Farbe gleich?
	jp z,konvt9	;Z = Ja, dann ignorieren
	ld a,b
	ld (color),a	;Farbe setzen
	and 77h		;intensiv maskieren
	ld (colo1),a	;Backup
	jp konvt9
	;
	; Monitor-ROM, RAM, und BWS einschalten
	;
monein:	ld a,0
	out (14h),a
	ret
	;
	; Monitor-ROM, RAM, und BWS aus, CP/M-Modus ein
	;
monaus:	ld a,4
	out (14h),a
	ret
	;
	; BWS Zeichenspeicher aktivieren
	;
bwszei:	in a,(bwsport)
	res 3,a
	out (bwsport),a
	ret
	;
	; BWS Farbspeicher aktivieren
	;
bwscol:	in a,(bwsport)
	set 3,a
	out (bwscr),a
	ret
	;
	; Merkzellen
	;
stz00:	defb 0		;Merkzelle Anz. BS-Steuerzeichen
stz01:	defb 0		;Merkzelle fuer 1. ESC-Steuerzeichen
stz02:	defb 0		;Merkzelle fuer 2. ESC-Steuerzeichen
	;
char:	defb 0		;Merkzelle Zeichen <> Cursor
	;
color:	defb 0	;Merkzelle BWS-Farbe (0=Monochrom-BWS)
	;	;Bit 7	   = Hintergrund Intensiv
	;	;Bit 4 - 6 = Hintergrundfarbe
	;	;Bit 3	   = Zeichen Intensiv
	;	;Bit 0 - 2 = Zeichenfarbe
	;
	;	;Bit 0 = rot; Bit 1 = gruen; Bit 2 = blau
	;
colo1:	defb 	0	; aktuelle Farbe ohne invers und intensiv
	;	;
colo2:	defb 0		; Farbe für Monitor und CP/M Warmstart
	;

