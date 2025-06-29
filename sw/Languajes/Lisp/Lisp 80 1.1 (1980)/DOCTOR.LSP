QUOTE ((This scaled-down version of Joe Weizenbaum's ELIZA psychiatrist
program was adapted from Winston, "Artificial Intelligence", (c) 1977
Addison-Wesley Publishing Company, Inc, pages 332-334; Reprinted with
permission))
DEFINE ((
[DOCTOR (LAMBDA NIL (PROG (L MOTHER S)
	(PRINT '(HELLO; TELL ME YOUR PROBLEM))
	(GCGAG T)
	(TERPRI)
	LOOP
	(SETQ S (READ))
	(PRINT (COND
		((MATCH '(* MOTHER *= L) S)
		 (SETQ MOTHER (LIST (YOUME L)))
		 '(TELL ME MORE ABOUT YOUR FAMILY))
		((MATCH '(I AM *= L) S)
		 (APPEND '(HOW DID YOU COME TO BE)
				(YOUME L) '(?)))
		((OR (MATCH '(NO) S) (MATCH '(YES) S))
		 '(CAN YOU TELL ME WHY?))
		((MATCH '(* (RESTRICT ? BADWORD) *) S)
		 '(PLEASE DO NOT USE WORDS LIKE THAT!))
		((MATCH '(* I WANT *= L) S)
		 (APPEND '(WHAT WOULD IT MEAN TO YOU IF YOU GOT)
				(YOUME L) '(?)))
		((MATCH '(* I *= L) S)
		 (APPEND '(WHY DO YOU SUPPOSE YOU) (YOUME L)))
		((MATCH '(* YOU ARE *= L) S)
		 (APPEND '(PERHAPS IN YOUR FANTASIES YOU ARE) (YOUME L)))
		((MATCH '(* YOU *) S) '(LET'S DISCUSS YOU, NOT ME))
		((MATCH '(* GOODBYE *) S)
		 (RETURN '(GOODBYE - THAT WILL BE $75, PLEASE)))
		(MOTHER
		 (SETQ L (APPEND '(EARLIER YOU MENTIONED YOUR MOTHER)
				(CAR MOTHER)))
		 (SETQ MOTHER NIL)
		 L)
		(T '(I AM NOT SURE I UNDERSTAND YOU))
		))
	(TERPRI)
	(GO LOOP]
[BADWORD (LAMBDA (X) (MEMBER X '(HELL DAMN]
(YOUME (L) (SUBLIS '((YOU . ME) (I . YOU) (MY . YOUR) (YOUR . MY)
		     (ME . YOU) (ARE . AM) (AM . ARE)) L))
[MATCH (LAMBDA (P D)
	(COND	((NULL P) (NULL D))
		((NULL D) (EQUAL P '(*)))
		([AND	(NOT (ATOM (CAR P)))
			(EQ (CAAR P) 'RESTRICT)
			(EQ (CADAR P) '?)
			(APPLY 'AND (MAPCAR (CDDAR P) '(LAMBDA (PRED)
						(APPLY PRED (LIST (CAR D]
		 (MATCH (CDR P) (CDR D)))
		((OR (EQ (CAR P) '?) (EQ (CAR P) (CAR D)))
		 (MATCH (CDR P) (CDR D)))
		((AND	(EQ (CAR P) '>)
			(MATCH (CDDR P) (CDR D)))
		 (SET (CADR P) (CAR D))
		 T)
		((EQ (CAR P) '*)
		 (OR (MATCH (CDR P) D)
		     (MATCH (CDR P) (CDR D)) (MATCH P (CDR D))))
		((EQ (CAR P) '*=)
		 (COND ((MATCH (CDDR P) (CDR D))
			(SET (CADR P) (LIST (CAR D)))
			T)
		       ((MATCH P (CDR D))
			(SET (CADR P)
			     (CONS (CAR D) (EVAL (CADR P))))
		       T]
(ATOMCAR (LAMBDA (C) (CAR (UNPACK C))))
(ATOMCDR (LAMBDA (C) (CADR (UNPACK C))))
]
(PROGN (TERPRI)
       (PRIN1 '(To play, type (DOCTOR) %.
		Then type short sentences enclosed in parentheses%.))
       (TERPRI]
