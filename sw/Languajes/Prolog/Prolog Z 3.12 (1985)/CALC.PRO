'/* CALC.PRO */'.

'/* "repeat" Praedikat aus Standard-Prolog */'.

repeat.
repeat:-
  repeat.

'/* Verarbeite einen Faktor */'.

factor(40,Cout,StructOut):-!,
  get0(C),
  put(C),
  expression(C,41,StructOut),
  get0(Cout),
  put(Cout).
factor(Cin,Cout,StructOut):-
  ge(Cin,97),
  ge(122,Cin),!,
  getName(Cin,Cout,Name),
  name(StructOut,Name).
factor(Cin,Cout,StructOut):-
  ge(Cin,48),
  ge(57,Cin),!,
  getNumber(Cin,Cout,0,StructOut).

'/* Verarbeite einen Bezeichner */'.

getName(Cin,Cin,[]):-
  ge(96,Cin),!.
getName(Cin,Cin,[]):-
  ge(Cin,123),!.
getName(Cin,Cout,[Cin|Out]):-
  get0(C),
  put(C),
  getName(C,Cout,Out).

'/* Verarbeite eine Zahl */'.

getNumber(Cin,Cin,Out,Out):-
  ge(47,Cin),!.
getNumber(Cin,Cin,Out,Out):-
  ge(Cin,58),!.
getNumber(Cin,Cout,In,Out):-
  sub(Cin,48,H1),
  mul(In,10,H2),
  add(H1,H2,H3),
  get0(C),
  put(C),
  getNumber(C,Cout,H3,Out).

'/* Verarbeite einen Term */'.

term(43,Cout,StructOut):-
  get0(C),
  put(C),!,
  factor(C,Co,Struct),
  factorList(Co,Cout,Struct,StructOut).
term(45,Cout,StructOut):-
  get0(C),
  put(C),!,
  factor(C,Co,Struct),
  factorList(Co,Cout,sub(0,Struct),StructOut).
term(Cin,Cout,StructOut):-
  factor(Cin,C,Struct),
  factorList(C,Cout,Struct,StructOut).

'/* "*", "/" und "%" (mod) */'.

mulOp(42,mul).
mulOp(47,div).
mulOp(37,mod).

'/* Verarbeite eine Liste von Faktoren */'.

factorList(Op,Cout,StructIn,StructOut):-
  mulOp(Op,Functor),!,
  get0(C),
  put(C),
  factor(C,Co,Struct),
  univ(StructI,[Functor,StructIn,Struct]),
  factorList(Co,Cout,StructI,StructOut).
factorList(Cin,Cin,StructIn,StructIn).

'/* Verarbeite einen Ausdruck */'.

expression(Cin,Cout,StructOut):-
  term(Cin,C,Struct),
  termList(C,Cout,Struct,StructOut).

'/* "+", "-" */'.

addOp(43,add).
addOp(45,sub).

'/* Verarbeite eine Liste von Termen */'.

termList(Op,Cout,StructIn,StructOut):-
  addOp(Op,Functor),!,
  get0(C),
  put(C),
  term(C,Co,Struct),
  univ(StructI,[Functor,StructIn,Struct]),
  termList(Co,Cout,StructI,StructOut).
termList(Cin,Cin,StructIn,StructIn).

'/* Verarbeite eine ganze Tastatur-Eingabe */'.

parse(X):-
  get0(C),
  put(C),
  expression(C,_,X).

'/* ueberpruefe auf Division (modulo) mit Null */'.

check(mod,0):-!,
  put(7).
check(div,0):-!,
  put(7).
check(_,_).

'/* berechne einen arithmetischen Operator */'.

eval(Functor,EArg1,EArg2,Y):-
  '=..'(Goal,[Functor,EArg1,EArg2,Y]),
  check(Functor,EArg2),
  Goal,!.
eval(Functor,EArg1,EArg2,Y):-
  '=..'(Y,[Functor,EArg1,EArg2]).

'/* berechne einen arithmetischen Ausdruck */'.

is(X,Y):-
  '=..'(X,[Functor,Arg1,Arg2]),!,
  is(Arg1,EArg1),
  is(Arg2,EArg2),
  eval(Functor,EArg1,EArg2,Y).
is(X,X).

'/* Haupt-Praedikat */'.

calc:-
  write('Formula: '),
  parse(X),
  is(X,Y),
  write(Y),
  write('   '),
  write(X),
  nl,
  fail.

