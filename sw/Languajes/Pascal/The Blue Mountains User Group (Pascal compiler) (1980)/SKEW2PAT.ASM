;
; TITLE		PATCH FOR FAST.COM FOR READING WITH SKEW OF 2
; FILENAME	SKEW2PAT.ASM
; AUTHOR	Robert A. Van Valzah    9/3/79
;
;
	ORG	139H	;START OF SECTOR TABLE
	DB	26, 24, 22, 20
	DB	18, 16, 14, 12
	DB	10, 08, 06, 04
	DB	02, 25, 23, 21
	DB	19, 17, 15, 13
	DB	11, 09, 07, 05
	DB	03, 01
	DB	0	;END OF TABLE MARKER
;
	ORG	174H	;START OF DIRECTORY SECTOR TABLE
	DB	14, 08, 02, 25
	DB	23, 21, 19, 17
	DB	15, 13, 11, 09
	DB	07, 05, 03, 01
	DB	0	;END OF TABLE MARKER
;
	END
