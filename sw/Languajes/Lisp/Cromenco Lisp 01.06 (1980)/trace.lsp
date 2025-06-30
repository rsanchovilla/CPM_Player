
;TRACE--a very minimal trace package, tracing only call-by-value
; functions (SUBRs and EXPRs). Disaster will occur if FSUBRs, FEXPRs,
; or MACROs are traced!
; Recursion level is indicated by indenting.

(DF TRACE (L) (PROG1 L
		(MAP (LAMBDA (L%) (TRACE1 (CAR L%) 
					  (IF (BOUNDP (CAR L%))
					      (PROCP (EVAL (CAR L%)))
					      NIL)))
			L)))

(DE TRACE1 (L TYPE)
	(IF (NULL TYPE) 
	    (PRINTL L "NOT A FUNCTION")
	    ((EVAL (INSERT (STRING "TR=" (PNAME TYPE)))) 
	     L)))  

(DE TR=SUBR (L) (TR=EXPR L))

(DE TR=LSUBR (L) (TR=EXPR L))

(DE TR=EXPR (L) (PUTPROP L 'TRACED (EVAL L))
		(EVAL (LIST 'DF 
			     L  
			    '(%%%L) 
			    (LIST 'TRACE-EXPR 
				  (LIST 'QUOTE L) 
				  '%%%L))))


(DE TRACE-EXPR (%%%NAME  %%%ARGS 
		&AUX %%%EARGS (LEFT-MARGIN (ADD1 LEFT-MARGIN)))
	(PRINTL "--> ENTERING " %%%NAME " WITH ...")
	(SETQ %%%EARGS (MAPLIST (LAMBDA (L%) (PRIN0 (EVAL (CAR L%))))
			        %%%ARGS))
	(TERPRI)
     	(SETQ %%%EARGS (APPLY (GETPROP  %%%NAME 'TRACED)
		               %%%EARGS))
	(PRINTL "<-- VALUE OF " %%%NAME " IS : " %%%EARGS)
	%%%EARGS)

(DE PRINTL (&REST L &AUX (TEM (TYPEPRINT CURRENT-SINK))) 
	   (TYPEPRINT CURRENT-SINK 3)
	   (MAP (LAMBDA (L%) (PRIN0 (CAR L%)))
		L)
	   (TYPEPRINT CURRENT-SINK TEM)
	   (TERPRI))


(DF UNTRACE (L) (PROG1 L
		       (MAP (LAMBDA (L%) (UNTRACE1 (CAR L%)))
			    L)))

(DE UNTRACE1 (L &AUX (TEM (GETPROP L 'TRACED)))
		(IF (NOT TEM)
		    NIL
		    (SET L TEM)
		    (REMPROP L 'TRACED)))
