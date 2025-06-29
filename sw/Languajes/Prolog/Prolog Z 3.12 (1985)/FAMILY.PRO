/* Verwandtschaftsbeziehungen. Beispiel nach N. Wirth, Algorithmen und Daten-
   strukturen, Teubner Studienbuecher Informatik 1979, S. 232 */


/* ---------------- Anfang der Daten fuer das Beispiel --------------------- */

/* Ich (Albert) verheiratete mich mit einer Witwe (Berta), die eine erwachsene
   Tochter (Maria) hatte. */
ehefrau(albert,berta).
kind(maria,berta).

/* Mein Vater (Herbert), der uns oft besuchte, verliebte sich in meine Stief-
   tochter und heiratete sie; dadurch wurde mein Vater mein Schwiegersohn und
   meine Stieftochter meine Mutter. */
kind(albert,herbert).
ehefrau(herbert,maria).

/* Einige Zeit darauf schenkte mir meine Frau einen Sohn (Gustav), der der
   Schwager meines Vaters und mein Onkel wurde. */
kind(gustav,berta).
/* Geschlecht muss angegeben werden, da Gustav nicht verheiratet ist */
maennlich(gustav).

/* Die Frau meines Vaters, meine Stieftochter, bekam auch einen Sohn (Josef).
*/
kind(josef,maria).
/* Geschlecht muss angegeben werden, da Josef nicht verheiratet ist */
maennlich(josef).

/* Dadurch erhielt ich einen Bruder und gleichzeitig einen Enkel. Meine Frau
   ist meine Grossmutter, da sie ja die Mutter meiner Mutter ist. Ich bin also
   der Mann meiner Frau und gleichzeitig der Stiefenkel meiner Frau; mit
   anderen Worten, ich bin mein eigener Grossvater. */

/* ------------------ Ende der Daten fuer das Beispiel --------------------- */


nachkomme(X,Y):-kind(X,Y);(kind(X,Z),(ehefrau(Z,Y);ehefrau(Y,Z))).

maennlich(X):-ehefrau(X,_).
weiblich(X):-ehefrau(_,X).

?-op(40,xfx,\=).
X\=X:-!,fail.
_\=_.

/* X ist Vater von Y */
vater(X,Y):-maennlich(X),nachkomme(Y,X).
/* X ist Mutter von Y */
mutter(X,Y):-weiblich(X),nachkomme(Y,X).
/* X ist Bruder von Y */
bruder(X,Y):-maennlich(X),nachkomme(X,Z),nachkomme(Y,Z),X\=Y.
/* X ist Schwester von Y */
schwester(X,Y):-weiblich(X),nachkomme(X,Z),nachkomme(Y,Z),X\=Y.
/* X und Y sind Geschwister */
geschwister(X,Y):-nachkomme(X,Z),nachkomme(Y,Z),X\=Y.
/* X ist Grossvater von Y */
grossvater(X,Y):-maennlich(X),nachkomme(Y,Z),nachkomme(Z,X).
/* X ist Sohn von Y */
sohn(X,Y):-maennlich(X),nachkomme(X,Y).
/* X ist tochter von Y */
tochter(X,Y):-weiblich(X),nachkomme(X,Y).
