
[Standard predicates for E-Prolog.		JULY 5, 1985 ]

[--  (EQ ?X ?Y)  means ?X and ?Y are equal expressions  ]
((EQ ?X ?X))

[--  (AND ?X1 ?X2 ?X3 ... )  means all succeed  ]
((AND ?X | ?rest) ?X (AND | ?rest))
((AND))

[--  (OR ?X1 ?X2 ?X3 ... )  means at least one succeeds
         (attempts stop upon the first success)  ]
((OR ?X | ?rest) ?X)
((OR ?X | ?rest) (OR | ?rest))

[--  (NOT ?X)  succeeds if and only if  ?X  fails  ]
((NOT ?X) ?X (/) (FAIL))
((NOT ?X))

[--  (IF ?X ?Y ?Z)  is executed as: if ?X then ?Y else ?Z
    ?Z  is optional  ]
((IF ?X ?Y | ?Z)
    ?X (/) ?Y)
((IF ?X ?Y ?Z)
    (/) ?Z)
((IF ?X ?Y))

[--  (IFF ?X ?Y)  succeeds if and only if both 
           ?X and ?Y succeed or both fail  ]
((IFF ?X ?Y)
    ?X (/) ?Y)
((IFF ?X ?Y)
    (NOT ?Y))
