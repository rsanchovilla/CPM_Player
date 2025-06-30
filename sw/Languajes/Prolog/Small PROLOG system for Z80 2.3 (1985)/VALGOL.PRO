
[
   VALGOL.PRO
   Compiler for VALGOL I -- ver. 2.2

   Written in E-Prolog.
   Translates VALGOL I to ASM-compatible 8080 assembly language.
    (Requires about 3000 bytes of string space.)

	See the May, 1985, issue of Dr. Dobb's Journal for an
	explanation of this compiler.

    Written by: G. A. EDGAR    status: public domain

versions
   0.3     September 9, 1984       M80, Z80, Micro-PROLOG
   1.0     September 16, 1984      output for ASM
   1.1     November 1, 1984        display input
   1.2     November 10, 1984       version for DDJ
   2.0     April 10, 1985          converted to E-Prolog
   2.1     May 16, 1985            for E-Prolog ver. 2.0
   2.2     August 1, 1985	   version for SIG/M

   Usage:
	(compile FOO BAR)	FOO.VAL -> BAR.ASM
	(compile FOO)		FOO.VAL -> FOO.ASM
]


[ ---------- Language independent part ---------------]

[ compile: input ?X, output ?Y]
((compile ?X) (compile ?X ?X))
((compile ?A:?X ?Y)(comp (?A:?X.VAL)(?Y.ASM)))
((compile ?X ?B:?Y)(comp (?X.VAL)(?B:?Y.ASM)))
((compile ?A:?X) (comp (?A:?X.VAL) (?A:?X.ASM)))
((compile ?X ?Y) (comp (?X.VAL) (?Y.ASM)))
((compile ?A:?X ?B:?Y) (comp (?A:?X.VAL)(?B:?Y.ASM)))
((comp ?infile ?outfile)
    (message ?message) (WRITE ?message "^M^J")
    (WRITE | ?infile) (WRITE " -> " | ?outfile) (WRITE "^M^J")
    (open | ?infile)
    (CREATE | ?outfile)
    (readtoken ?token) (LESS ?dummy ?label)
    (syntax ?syntax) (/) (Q (?token | ?label) ?after ?syntax)
    (CLOSE) (OPEN CON)
    (WRITE "^M^J** Compilation complete **^M^J") (/))
((comp | ?rest)
    (CLOSE) (OPEN CON)
    (WRITE "** Error detected **^M^J")(FAIL))
((open  | ?file)
    (OPEN  | ?file))
((open  | ?file)
    (WRITE "OPEN FAILURE ON " | ?file) (WRITE "^M^J") (FAIL))
((C | ?X)
    (compile | ?X))

[ Q:  find it in the language-specific database]
((Q ?before ?after ?Z)
    (?Z | ?X1) 
    [ (WRITE "^M^J  Try " ?Z ?before) ]
    (sequential ?before ?after | ?X1)
    [ (WRITE "^M^J    Succeed " ?Z ?after) ]
    )
((sequential ?position ?position))
((sequential ?position1 ?position3 (?z|?Z)|?rest)
    (?z ?position1 ?position2|?Z) (/)
    (sequential ?position2 ?position3|?rest))

[ out: send to outfile]
((out ?position ?position | ?data)
    (WRITE | ?data))

[ readtoken: read a new token, watch for "."]
((readtoken ?token)
    (READ ?token1) (readtokenx ?token1 ?token))
((readtokenx . (. | ?token2))
    (READ ?token2))
((readtokenx ?token1 ?token1))

[ match: the input matches token]
((match ((. | ?token) | ?label) (?newtoken | ?label) . ?token)
    (readtoken ?newtoken))
((match (?token | ?label) (?newtoken | ?label) ?token)
    (readtoken ?newtoken))
((matchx ((. | ?token) | ?label) () . ?token))
((matchx (?token | ?label) () ?token))

[ empty: matches automatically]
((empty ?position ?position))

[ multiple: match the following zero or more times]
((multiple ?position1 ?position3|?Z)
    (sequential ?position1 ?position2|?Z) (/)
    (multiple ?position2 ?position3|?Z))
((multiple ?position ?position|?Z))

[ label: generate a new label]
((label (?token | ?label) (?token | ?newlabel) ?label)
    (LESS ?label ?newlabel) (/))

[ string: match a string quoted within characters ']
((string (?token | ?label) (?newtoken | ?label) ?token)
    (readtoken ?newtoken))

[ id: match an identifier]
((id (?token | ?label) (?newtoken | ?label) ?token)
    (LESS @ ?token) (/) (readtoken ?newtoken))

[ number: match a number]
((number (0 | ?label) (?newtoken | ?label) 0)
    (/) (readtoken ?newtoken))
((number (?token | ?label) (?newtoken | ?label) ?token)
    (LESS 0 ?token) (/) (readtoken ?newtoken))


[ --- VALGOL specifics ------------------------------ ]

((message "VALGOL 1 compiler - translates VALGOL to ASM"))
((syntax PROGRAM))

((PROGRAM
    (match .begin)		(out
				"VCPM	EQU	0^M^J"
				"VBDOS	EQU	5^M^J"
				"VTPA	EQU	256^M^J"
				"VCR	EQU	13^M^J"
				"VLF	EQU	10^M^J"
				"	ORG	VTPA^M^J"
				"	LXI	SP,VSTACK^M^J")
    (Q OPT-DECLARATION)
    (Q STATEMENT)
    (multiple
        (match ;)
        (Q STATEMENT))
    (matchx .end)		(out
				"	JMP	VCPM^M^J"
				"VMULT:^M^J"
				"	MOV	B,H^M^J"
				"	MOV	C,L^M^J"
				"	XRA	A^M^J"
				"	MOV	H,A^M^J"
				"	MOV	L,A^M^J"
				"	MVI	A,16^M^J"
				"VMULT1:^M^J"
				"	PUSH	PSW^M^J"
				"	DAD	H^M^J"
				"	XRA	A^M^J"
				"	MOV	A,C^M^J"
				"	RAL^M^J"
				"	MOV	C,A^M^J"
				"	MOV	A,B^M^J"
				"	RAL^M^J"
				"	MOV	B,A^M^J"
				"	JNC	VMULT2^M^J"
				"	DAD	D^M^J"
				"VMULT2:^M^J"
				"	POP	PSW^M^J"
				"	DCR	A^M^J"
				"	ORA	A^M^J"
				"	JNZ	VMULT1^M^J"
				"	RET^M^J"
				"VEDIT:^M^J"
				"	MOV	A,H^M^J"
				"	ORA	L^M^J"
				"	JZ	VEDIT1^M^J"
				"	MVI	A,' '^M^J"
				"	CALL	VCPMOUT^M^J"
				"	DCX	H^M^J"
				"	JMP	VEDIT^M^J"
				"VEDIT1:^M^J"
				"	POP	H^M^J"
				"VEDIT2:^M^J"
				"	MOV	A,M^M^J"
				"	CPI	0^M^J"
				"	INX	H^M^J"
				"	JZ	VEDIT3^M^J"
				"	CALL	VCPMOUT^M^J"
				"	JMP	VEDIT2^M^J"
				"VEDIT3:^M^J"
				"	PUSH	H^M^J"
				"	RET^M^J"
				"VPRINT:^M^J"
				"	MVI	A,VCR^M^J"
				"	CALL	VCPMOUT^M^J"
				"	MVI	A,VLF^M^J"
				"	CALL	VCPMOUT^M^J"
				"	RET^M^J"
				"VCPMOUT:^M^J"
				"	PUSH	H^M^J"
				"	MOV	E,A^M^J"
				"	MVI	C,2^M^J"
				"	CALL	VBDOS^M^J"
				"	POP	H^M^J"
				"	RET^M^J"
				"	DS	60^M^J"
				"VSTACK:^M^J"
				"	END^M^J") ))

((OPT-DECLARATION
    (Q DECLARATION)
    (match ;)))
((OPT-DECLARATION
    (empty)))

((DECLARATION
    (match .integer)		(label ?label1)
				(out	"	JMP	V" ?label1 "^M^J")
    (Q ID-SEQUENCE)		(out	"V" ?label1 ":^M^J") ))

((ID-SEQUENCE
    (Q IDENTIFIER)
    (multiple
        (match ,)
        (Q IDENTIFIER) )))

((IDENTIFIER
    (id ?identifier)		(out   ?identifier "V:	DS	2^M^J") ))

((STATEMENT
    (Q BLOCK)))
((STATEMENT
    (Q UNTIL-STATEMENT)))
((STATEMENT
    (Q CONDITIONAL-STATEMENT)))
((STATEMENT
    (Q IO-STATEMENT)))
((STATEMENT
    (Q ASSIGNMENT-STATEMENT)))

((BLOCK
    (match .begin)
    (Q BLOCKBODY)))
((BLOCKBODY
    (Q DECL-OR-ST)
    (multiple
        (match ;)
        (Q STATEMENT) )
    (match .end) ))
((BLOCKBODY
    (match .end) ))

((DECL-OR-ST
    (Q DECLARATION)))
((DECL-OR-ST
    (Q STATEMENT)))

((IO-STATEMENT
    (match edit)
    (match "(")
    (Q EXPRESSION)
    (match ,)
    (string ?Z)			(out	"	CALL	VEDIT^M^J")
				(out	"	DB	'" ?Z "',0^M^J")
    (match ")") ))
((IO-STATEMENT
    (match print)		(out	"	CALL	VPRINT^M^J") ))

((CONDITIONAL-STATEMENT
    (match .if)			(label ?label1) (label ?label2)
    (Q EXPRESSION)
    (match .then)		(out	"	MOV	A,H^M^J")
				(out	"	ORA	L^M^J")
				(out	"	JZ	V" ?label1 "^M^J")
    (Q STATEMENT)
    (match .else)		(out	"	JMP	V" ?label2 "^M^J")
				(out	"V" ?label1 ":^M^J")
    (Q STATEMENT)		(out	"V" ?label2 ":^M^J") ))

((UNTIL-STATEMENT
    (match .until)		(label ?label1) (label ?label2)
				(out	"V" ?label1 ":^M^J")
    (Q EXPRESSION)
    (match .do)			(out	"	MOV	A,H^M^J")
				(out	"	ORA	L^M^J")
				(out	"	JNZ	V" ?label2 "^M^J")
    (Q STATEMENT)		(out	"	JMP	V" ?label1 "^M^J")
				(out	"V" ?label2 ":^M^J") ))

((ASSIGNMENT-STATEMENT
    (Q EXPRESSION)
    (match =)(match :)
    (id ?identifier)		(out	"	SHLD	" ?identifier "V^M^J") ))

((EXPRESSION
    (Q EXPRESSION1)
    (Q OPT-RIGHT-SIDE)))

((OPT-RIGHT-SIDE
    (match .=)			(label ?label1) (label ?label2)
				(out	"	PUSH	H^M^J")
    (Q EXPRESSION1)		(out
				"	POP	D^M^J"
				"	MOV	A,L^M^J"
				"	SUB	E^M^J"
				"	JNZ	V" ?label2 "^M^J"
				"	MOV	A,H^M^J"
				"	SBB	D^M^J"
				"	JNZ	V" ?label2 "^M^J"
				"	LXI	H,1^M^J"
				"	JMP	V" ?label1 "^M^J"
				"V" ?label2 ":^M^J"
				"	LXI	H,0^M^J"
				"V" ?label1 ":^M^J") ))
((OPT-RIGHT-SIDE
    (empty)))

((EXPRESSION1
    (Q TERM)
    (multiple
        (Q SIGNED-TERM))))

((SIGNED-TERM
    (match +)			(out	"	PUSH	H^M^J")
    (Q TERM)			(out	"	POP	D^M^J")
				(out	"	DAD	D^M^J")))
((SIGNED-TERM
    (match -)			(out	"	PUSH	H^M^J")
    (Q TERM)			(out
				"	POP	D^M^J"
				"	MOV	A,E^M^J"
				"	SUB	L^M^J"
				"	MOV	L,A^M^J"
				"	MOV	A,D^M^J"
				"	SBB	H^M^J"
				"	MOV	H,A^M^J")  ))

((TERM
    (Q PRIMARY)
    (multiple
        (match *)		(out	"	PUSH	H^M^J")
        (Q PRIMARY)		(out	"	POP	D^M^J")
				(out	"	CALL	VMULT^M^J") )))

((PRIMARY
    (id ?identifier)		(out	"	LHLD	" ?identifier "V^M^J")))
((PRIMARY
    (number ?number)		(out	"	LXI	H," ?number "^M^J")))
((PRIMARY
    (match "(")
    (Q EXPRESSION)
    (match ")") ))

