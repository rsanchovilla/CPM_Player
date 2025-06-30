;MKAUTO--Utility function for making files of AUTOLOAD LISP objects.  Produces
; two files:  <filename> and <filename>.ATO.  Once created, <filename>.ATO
; contains information regarding the location within <filename> of the named
; objects.  LOAD <filename>.ATO into LISP to tell LISP which objects
; are AUTOLOAD objects.  Use as follows:
;
;	(MKAUTO <str> ({(<atom> . <KEEP/NO-KEEP>)}))
;
; where <str> is a string that names a file on disk, and the second argument
; is a list of dotted pairs.  Within each pair, <atom> is the symbol of an
; object defined in memory, and <KEEP/NO-KEEP> is either the atom
; KEEP or the atom NO-KEEP, and specifies whether the corresponding object
; is to be defined as a KEEP AUTOLOAD object or a NO-KEEP AUTOLOAD object
; (see LISP manual).

   (DE MKAUTO (FILE NAMES  &AUX (XX (OPEN FILE 'NEW))
 				(YY (OPEN (STRING FILE ".ATO") 'NEW))
				TEM)
 	      (DO ((NAMES NAMES (CDR NAMES))
		   (REC (GRECNO XX) (GRECNO XX))
		   (POS (GRECPOS XX) (GRECPOS XX)))	   
 		  (((NULL NAMES) (CLOSE XX 'SAVE) (CLOSE YY 'SAVE)))
;keep position non-zero
		  (IF (NOT (ZEROP POS)) 
			   NIL
			   (SETQ POS 1)
			   (SETQ  FOO (TYPEPRINT XX))                
			   (PRIN0 \  XX 3)
			   (TYPEPRINT XX    FOO))
		
 		  (SETQ TEM (PRINT (LIST 'AUTO 
				     (LIST 'QUOTE (CDAR NAMES))
 				     (LIST 'QUOTE (CAAR NAMES)) 
				     FILE
 				     REC 
 				     POS) YY))
 		  (COND ((EQ (CDAR NAMES) 'NO-KEEP) 
						(PRINT (EVAL (CAAR NAMES))
 							     XX))
 		        ((SELECTQ (TYPE (EVAL (CAAR NAMES))) 
 				  (EXPR 
				      (PRINT (LIST 'SETQ
 						   (CAAR NAMES)
 						   (EVAL (CAAR NAMES)))
					     XX))
 				  (FEXPR 
				      (PRINT (LIST 'SETQ
 						   (CAAR NAMES)
 						   (EVAL (CAAR NAMES)))
					     XX))

 				  ((ATOM LIST)
				      (PRINT (LIST 'SETQ 
 						   (CAAR NAMES)
 						   (LIST 'QUOTE
							 (EVAL (CAAR NAMES))))
 					     XX))

 				  ((FLOAT FIX STRING)
					 (PRINT (LIST 'SETQ 
 						      (CAAR NAMES)
 						      (EVAL (CAAR NAMES)))
 						XX))

				   (OW (PRIN0 (CAAR NAMES))
					(ERROR "BAD ARG FOR MKAUTO"))
				)))
		   (EVAL TEM)))

)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

;MKAUTOFIL--reads a file of SETQ and DE expressions from disk and uses MKAUTO
; to generate an AUTOLOAD file system that defines ALL of the objects as KEEP
; AUTOLOAD objects, or ALL as NO-KEEP AUTOLOAD objects, depending on the second
; argument.  AUTOLOAD file systems consist of two files:
;
;	1) the input file of definitions, reformatted somewhat
;	2) a file <filename>.ATO that must be LOADed into LISP to let
;	   LISP know that the named objects are to be found on disk.
;
; Use as follows:
;
;	(MKAUTOFIL <str> <KEEP/NO-KEEP>)
;
; where <str> is a string that names a file of SETQ and/or DE expressions
; (comments are allowed in this file), and <KEEP/NO-KEEP> is either the
; atom KEEP or the atom NO-KEEP.

 (DE MKAUTOFIL (FILE KNKI &AUX NAME-LIST NAME XX)
 	   (SETQ XX (OPEN FILE 'OLD))
 	   (DO ((OBJ (READ XX) (READ XX))
 	        (NAME-LIST NIL (CONS (CONS NAME KNKI) NAME-LIST)))
 	       (((EQ OBJ 'END-OF-FILE) 
				 (EVAL  (LIST 'MKAUTO
					      FILE 
					      (LIST 'QUOTE
						    NAME-LIST)))))
       	       (SETQ NAME (CADR OBJ))
 	       (EVAL OBJ)))

)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

;UNKEEP--use when a KEEP-AUTOLOAD LISP object is no longer needed in memory
; (e.g.: when it will no longer be accessed often).  Replaces the value-cell
; of the object with the value of the object's AUTOLOAD property, thereby 
; freeing memory perhaps coveted by other data structures.  If called with
; an unbound variable, does nothing.
; Use as follows:
;
;	(UNKEEP <var>)
;
; where <var> is a variable.

(df UNKEEP (arg)
   (prog1
      nil
      (let
	 ((name (first arg)))
	 (cond
	    ((boundp name) (set name (getprop name '%%auto)))
	    (t nil)
	    )
	 )
      )
   )
