'/* KNAKE.PRO */'.

'/* logische Negation */'.

not(X):-
  X,!,
  fail.
not(_).

'/* logische Implikation */'.

'-->'(X,Y):-
  not(X).
'-->'(_,Y):-
  Y.

'/* logisches Oder */'.

or(X,_):-
  X.
or(_,Y):-
  Y.

'/* Ungleichheit */'.

'\='(X,X):-!,
  fail.
'\='(_,_).

'/* Zuordnung */'.

tut(X,X).

taetigkeit(papeln).
taetigkeit(dullen).
taetigkeit(kekeln).
taetigkeit(blunten).

loesung(Knake,Prisi,Blunt,Dila):-
  taetigkeit(Knake),
  taetigkeit(Prisi),
  '\='(Prisi,Knake),
  taetigkeit(Blunt),
  '\='(Blunt,Knake),
  '\='(Blunt,Prisi),
  taetigkeit(Dila),
  '\='(Dila,Knake),
  '\='(Dila,Prisi),
  '\='(Dila,Blunt),
  '-->'(not(tut(Knake,papeln)),not(tut(Prisi,dullen))),
  '-->'(or(tut(Blunt,dullen),tut(Blunt,blunten)),tut(Knake,papeln)),
  '-->'(not(tut(Prisi,kekeln)),tut(Blunt,blunten)),
  '-->'(tut(Dila,dullen),not(tut(Blunt,papeln))),
  '-->'(not(tut(Dila,papeln)),tut(Blunt,papeln)).

writeln(X):-
  write(X),
  nl.
writeln(X,Y,Z):-
  write(X),
  write(Y),
  write(Z),
  nl.

run:-
  nl,
  nl,
  writeln('(Logelei von Zweistein) Wenn das  Knake nicht papelt, dann dullt'),
  writeln('der  Prisi  nicht.  Wenn der Blunt  entweder dullt oder bluntet,'),
  writeln('dann papelt das Knake. Wenn der Prisi nicht kekelt, dann bluntet'),
  writeln('der Blunt. Wenn die Dila dullt, dann papelt der Blunt nicht. Und'),
  writeln('wenn die Dila nicht  papelt, dann  papelt  der  Blunt. Jeder tut'),
  writeln('etwas von dem,  was  hier  genannt ist,  und keine zwei tun das-'),
  writeln('selbe. Frage: Wer tut was?'),
  nl,
  nl,
  loesung(Knake,Prisi,Blunt,Dila),
  writeln('Das Knake tut ',Knake,'. '),
  writeln('Der Prisi tut ',Prisi,'. '),
  writeln('Der Blunt tut ',Blunt,'. '),
  writeln('Die Dila  tut ',Dila,'. '),
  nl,
  fail.
run:-
  writeln('Das waren alle Loesungen.'),
  nl,
  fail.

