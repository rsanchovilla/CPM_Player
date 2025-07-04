			LEAR SIEGLER ADM3 MODIFICATIONS

	ONE OF THE MORE POPULAR COMPUTER TERMINALS, WHICH IS BEING USED BY
THE COMPUTER HOBBYEST, IS THE LEAR SIEGLER ADM3 OR ADM3A. HOWEVER, THERE ARE 
SPECIAL PROBLEMS WHEN THEY ARE USED WITH CP/M, BUT THESE PROBLEMS CAN BE
VERY EASILY MODIFIED BY TWO SIMPLE MODS THAT I HAVE DEVELOPED. THESE MODS
CAN BE EASILY INSTALLED AND REMOVED, AND DO NOT REQUIRE SOLDERING. THEY TAKE
ABOUT 15 MINUTES TO INSTALL AND DON'T EVEN REQUIRE THE MOTHER BOARD TO BE
REMOVED. UNFORTUNATELY, MY MOD ONLY APPLIES TO THE ADM3, BUT I IMAGINE THAT
THE ADM3A CIRCUITRY IS SUFFICIENTLY SIMILAR THAT THE MODS CAN BE IMPLEMENTED.

MOD #1-----THE PROBLEM:THE CP/M EDITOR AND FDOS PREEMPTS THE CHARACTER
		CONTROL Z FOR VARIOUS PURPOSES. IMSAI RECOMMENDS THAT THE
		BLANK SCREEN CAPABILITY OF THE ADM3(WHICH USES CONTROL Z) BE
		DISABLED. THIS IS UNFORTUNATE BECAUSE THE BLANK SCREEN 
		CAPABILITY IS HANDY TO USE IN GAMES AND OTHER APPLICATIONS.

	    THE SOLUTION:CONVERT THE ADM3 'BLANK SCREEN' SIGNAL FROM CONTROL
		Z TO CONTROL Y. THIS ENABLES YOU TO USE THE BASIC STATEMENT
		'PRINT CHR$(25)' TO CLEAR THE SCREEN

	    PROCEDURE:  0.TURN OFF THE POWER
			1.PREPARE A 3 INCH STRAND OF INSULATED WIRE WRAP WIRE
			BY STRIPPING ONE END FOR 1/4 INCH AND THE OTHER 1/2 IN
			2.REMOVE THE I.C. #J2 FROM ITS SOCKET AND BEND PIN #10
			  90 DEGREES(SO IT WONT INSERT IN THE SOCKET). REPLACE
			  THIS I.C. IN ITS SOCKET.
			3.REMOVE I.C. #L3 AND PLACE THE 1/4 STRIPPED END IN
			  THE PIN #2 HOLE. REINSERT THIS I.C.
			4.TWIST THE 1/2 INCH END OF THE WIRE AROUND I.C. J2
			  PIN 10 SEVERAL TIMES USING NEEDLE NOSE PLIERS.
			5.REACTIVATE THE CLEAR SCREEN FUCTION USING THE DIP
			  SWITCH ON THE REAR OF THE MOTHER BOARD.

MOD#2-----THE PROBLEM: NOTHING IS MORE FRUSTRATING TO ME THAN TO GET COMPILER
		ERROR MESSAGES WHEN I HAVE INADVERTANTLY INSERTED A CONTROL
		CHARACTER IN A STATEMENT. THE DIFFICULTY IS THAT THESE CONTROL
		CHARACTERS DO NOT PRINT ON THE SCREEN AND I HAVE NO WAY OF
		KNOWING THAT THEY ARE THERE. A SIMILAR PROBLEM OCURRS WHEN
		SOMEONE HAS INSERTED CONTROL K (FOR FORMFEED), OR OTHER 
		CONTROL CHARACTERS, IN A TEXT AND I WANT TO MOVE OR REMOVE IT.

	THE SOLUTION: IF YOUR TERMINAL HAS LOWER CASE CAPABILITY, THEN YOUR
		ROM HAS THE CONTROL CHARACTERS BURNT INTO IT.

		PROCEDURE:	1.PREPARE A 1+1/2 INCH WIRE BY STRIPPING ONE
				  END FOR 1/2 INCH AND THE OTHER FOR 1/4 IN.
				2.REMOVE IC.#F3 AND BEND PIN 12 FOR 90 DEGREES.
				3.PLACE THE 1/4 INCH WIRE END IN THE HOLE FOR
				  PIN 7 AND REINSERT THE I.C. #F3.
				4.WRAP THE 1/2 INCH END AROUND PIN 12.
				5.SET THE DIP SWITCH ON THE REAR OF THE MOTHER
				  BOARD TO U/L DISPLAY

		DIFFICULTIES:	THE LINE FEED CHARACTER WILL DISPLAY AND
				THEREFORE EFFECTIVELY REDUCE THE LINE LENGTH
				FROM 80 TO 78 CHARACTERS.
				THE BACKSPACE (CONTROL H) NO LONGER WORKS
				PROPERLY SINCE THE TERMINAL NOW CONSIDERS
				CONTROL H AS A VALID CHARACTER AND ATTEMPTS
				TO ADVANCE THE CURSOR WHILE BACKSPACING IT.

		SUGGESTION:	USE A SPDT SWITCH FOR THIS MOD SO THAT YOU
				NEED ONLY DISPLAY CONTROL CHARACTERS WHEN YOU
				DESIRE.

SINCE MANY PEOPLE ARE USING THE ADM3A, I'LL DESCRIBE THESE MODS IN
TERMS OF CIRCUIT CHANGES.

MOD#1	BEFORE MODIFICATION THE 3 NEGATIVE INPUT 'AND' GATE #J2 (7427) SENSES
	THE THREE SIGNALS 'NOT COLUMN 1','NOT DATA 4',AND 'NOT XX2'. THIS MOD
	CHANGES THE LATTER SIGNAL TO 'NOT XX1'. 'NOT XX1' IS OBTAINED FROM
	THE 7442 DECODER #L3.

MOD#2	BEFORE MODIFICATION THE 4 NEGATIVE INPUT 'AND' GATE #F3 (7425) WHICH
	IS USED TO CREATE THE SIGNAL 'FORESPACE' AND WHICH IN TURN IS USED TO 
	CREATE THE INCREMENT CURSOR SIGNAL,USES THE FOLLOWING SIGNALS
	'NOT CC80','CTRL CHAR','DEL',AND 'DOIT'. THIS MOD SETS THE 'CTRL
	CHAR' INPUT TO LOW BY GROUNDING PIN #12. THIS RESULTS IN THE CONTROL
	CHARACTERS BEING PLACED IN MEMORY AND DISPLAYED JUST AS ANY OTHER
	OTHER CHARACTER (PROVIDING THE LOWER CASE PROM IS PRESENT).

CONTRIBUTED BY R.A.GREGOIRE, RD10,CARLISLE,PA
