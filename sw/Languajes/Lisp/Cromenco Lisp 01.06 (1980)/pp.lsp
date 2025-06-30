;PP--function for typing EXPRs, FEXPRs, MACROs, and non-functional
; S-expressions in a "pretty" format, using indenting, etc.
; Use as follows:
;
;	(PP <sexpr (usually a function name)>)
;
; Output will go to CURRENT-SINK, whatever that is when PP is invoked
; (initial default SINK is the console).
; Returns NIL as value.

(df pp (f)
   (let
      ((pplen 6)
       (ppmarg 3)
       (typ (type (eval (first f))))
       (body (eval (first f)))
       )
      (sprin
	 (cond
	    ((or (eq typ 'fix) (eq typ 'float) (eq typ 'atom) (eq typ 'list))
	     body
	     )
	    (t
	       (list
		  (cond
		     ((eq typ 'expr) 'lambda)
		     ((eq typ 'fexpr) 'flambda)
		     (t 'mlambda)
		     )
		  (getfn body)
		  )
	       )
	    )
	 left-margin
	 nil
	 )
      )
   (terpri)
   )

;SPRIN--local workhorse function for PP

(de sprin (f left-margin lfp)
    (if lfp (terpri))
    (cond
	((le (len f) pplen) (prin0 f current-sink 1))
	(t  (prin0 \( current-sink 3)
	    (sprin (car f) (add1 left-margin) nil)
	    (do
		((f (cdr f) (cdr f)))
		(((null f)))
		(sprin (car f) (add left-margin ppmarg) t))
	    (prin0 \) current-sink 3))))

;LEN--local function for SPRIN

(de len (s)
    (cond
	((atom s) 1)
	(t (add
		(len (car s))
		(len (cdr s))))))
