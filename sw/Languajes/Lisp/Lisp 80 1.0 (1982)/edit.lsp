PUTPROP(EDIT PROGRAMS (EDIT EDITEXP EditFND EditREP EditREP1 EditPRINT EditNTH 
EditPP Edit? SAVEFILE SaveI))
DEFINE((
(EDIT (LAMBDA (F)
      (DEFINE (LIST (LIST F (EDITEXP (OR (GETPROP F (QUOTE EXPR)) 
					 (GETPROP F (QUOTE FEXPR)) (PROGN 
		(PRIN1 (QUOTE New% fn)) (TERPRI) 
		(COPY (QUOTE (LAMBDA NIL NIL)))))))))))

(EDITEXP (LAMBDA (E)
      (PROG (CUR CMD NCMD CHAIN PDEPTH TEMP EditX)
	   (SETQ NCMD (QUOTE ^))
	   (SETQ PDEPTH 3)
	   MAIN
	   (COND (NCMD (SETQ CMD NCMD) (SETQ NCMD))
		 (T (PRINT (EditPRINT CUR PDEPTH)) (PRIN1 (QUOTE *)) 
		  (SETQ CMD (READ))))
	   DEWIT
	   (SELECTQ CMD
		(PP (EditPP CUR))
		(E (RETURN E))
		(0 (COND
		       (CHAIN (SETQ CUR (CAR CHAIN)) 
			(SETQ CHAIN (OR (CDR CHAIN) (LIST E))))
		       (T (SETQ CUR E))))
		((F B) (SETQ TEMP (PLUS (EditFND (CAR CHAIN)) (SELECTQ 
		    CMD (F 1)
			(B -1)
			NIL))) (COND
		       ((OR (ZEROP TEMP) 
			    (GREATERP TEMP (LENGTH (CAR CHAIN)))) 
			(Edit?))
		       (T (SETQ CMD 0) (SETQ NCMD TEMP) (GO DEWIT))))
		(^ (SETQ CHAIN (LIST (SETQ CUR E))))
		(COND ((LISTP CMD) (SELECTQ (CAR CMD)
			    (N (RPLACD (LAST CUR) (CDR CMD)))
			    (0 (Edit?))
			    (P (COND
				   ((AND (CDR CMD) 
		(NUMBERP (CADR CMD))) (SETQ PDEPTH (CADR CMD)))
				   (T (Edit?))))
			    (I (COND
				   ((CDR CMD) (COND
		((NUMBERP (CADR CMD)) (SETQ NCMD 
		  (LIST (DIFFERENCE 0 (CADR CMD)) EditX)))
		((EQ (CADR CMD) (QUOTE N)) 
		 (SETQ NCMD (LIST (QUOTE N) EditX)))
		(T (Edit?))))	   (T (Edit?))))
			    (COND ((NUMBERP (CAR CMD)) 
				   (EditREP CUR (CAR CMD)))
				  (T (Edit?)))))
		      ((AND (NUMBERP CMD) (GREATERP CMD 0)) 
		       (EditNTH CMD CUR))
		      (T (Edit?))))
	   (GO MAIN))))

(EditFND (LAMBDA (L)
      (COND ((ATOM L) 999)
	    ((EQ CUR (CAR L)) 1)
	    (T (PLUS 1 (EditFND (CDR L)))))))

(EditREP (LAMBDA (C N)
      (COND ((NOT (OR (EQ N 1) (EQ N -1))) 
	     (EditREP1 C (COND ((LESSP N 0) (DIFFERENCE 0 N)) (T N)) N))
	    ((ATOM CUR) (Edit?))
	    (T (SETQ N (NCONC (CDR CMD) (COND
		     ((EQ N -1) (CONS (CAR CUR) (CDR CUR)))
		     (T (CDR CUR))))) (RPLACA CUR (CAR N)) 
	     (RPLACD CUR (CDR N))))))

(EditREP1 (LAMBDA (C N F)
      (COND ((ATOM C) (Edit?))
	    ((EQ N 2) (RPLACD C (NCONC (CDR CMD) (COND
		     ((LESSP F 0) (CDR C))
		     ((ATOM (CDR C)) NIL)
		     (T (SETQ EditX (CADR C)) (CDDR C))))))
	    (T (EditREP1 (CDR C) (PLUS N -1) F)))))

(EditPRINT (LAMBDA (C N)
      (COND ((ATOM C) C)
	    ((ZEROP N) (QUOTE ?))
	    (T (SETQ N (PLUS N -1)) 
	     (SETQ N (MAPCAR C (QUOTE (LAMBDA (X) (EditPRINT X N))))) 
	     (RPLACD (LAST N) (CDR (LAST C))) N))))

(EditNTH (LAMBDA (N C)
      (COND ((ATOM C) (Edit?) NIL)
	    ((EQ N 1) (SETQ CHAIN (CONS CUR CHAIN)) (SETQ CUR (CAR C)))
	    (T (EditNTH (DIFFERENCE N 1) (CDR C))))))

(EditPP (LAMBDA (X FILE)
      (COND ((GETPROP (QUOTE PP) (QUOTE EXPR)) (PP X FILE))
	    (T (PRINT (QUOTE PP-not-loaded)) (PRIN2 X FILE) (TERPRI FILE)))))

(Edit? (LAMBDA NIL (PRINT (QUOTE ?))))

(SAVEFILE (LAMBDA (FILE PROGRAMS PPF)
      (PROG (F)
	   (SETQ PPF (COND ((NULL PPF) (QUOTE PRIN2)) (T (QUOTE EditPP))))
	   (SETQ PROGRAMS (SaveI (GETPROP FILE (QUOTE PROGRAMS)) PROGRAMS))
	   (SETQ F (OPENW FILE))
	   (PRIN1 (QUOTE PUTPROP) F)
	   (PRIN1 (LIST FILE (QUOTE PROGRAMS) PROGRAMS) F)
	   (TERPRI F)
	   (PRIN1 (QUOTE DEFINE%(%() F)
	   (TERPRI F)
	   (MAPCAR PROGRAMS (QUOTE (LAMBDA (X)
		  (APPLY PPF (LIST (LIST X (OR 
		(GETPROP X (QUOTE EXPR)) (GETPROP X (QUOTE FEXPR)))) F))
		  (TERPRI F))))
	   (PRIN1 (QUOTE %)%)) F)
	   (CLOSE F)
	   (PUTPROP FILE (QUOTE PROGRAMS) PROGRAMS)
	   (RETURN FILE))))

(SaveI (LAMBDA (A B)
      (COND ((NULL A) B)
	    ((MEMBER (CAR A) B) (SaveI (CDR A) B))
	    (T (CONS (CAR A) (SaveI (CDR A) B))))))

))
