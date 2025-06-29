[ This simple logic problem is found on p. 206 of the
September, 1984, Scientific American, in the article
"Computer Software for Intelligent Systems".  To find out
whether Marcus hates Caesar, use the query
   > (hates Marcus Caesar)				]

[ 1. Marcus was a man.]
((man Marcus))

[ 2. Marcus was a Pompeian.]
((pompeian Marcus))

[ 3. All Pompeians were Romans.]
((roman ?X)
  (pompeian ?X))

[ 4. Caesar was a ruler.]
((ruler Caesar))

[ 5. All romans were either loyal to Caesar or hated him.]
((hates ?X Caesar)
  (roman ?X)
  (not-loyal-to ?X Caesar))

[ 6. People only try to assasinate rulers they are not loyal to.]
((not-loyal-to ?X ?Y)
  (man ?X)
  (tries-to-assasinate ?X ?Y))

[ 7. Marcus tried to assasinate Caesar.]
((tries-to-assasinate Marcus Caesar))

[ 8. A person hates someone who steals his wife.]
((hates ?X ?Y)
  (steals-wife-of ?Y ?X))

[ 9. If the wife of a man who is alive marries a second man,
      then the second man stole the first man's wife.]
((steals-wife-of ?X ?Y)
  (wife-of ?Z ?Y)
  (alive ?Y)
  (marries ?X ?Z))

[10. Lucretia was Marcus's wife.]
((wife-of Lucretia Marcus))

[11. Marcus was alive.]
((alive Marcus))
