/*			Books/Keywords		*/
/*		A sample schema for MDBS 3a	*/
 
db SAMPLE
	file "SAMPLE.DB"
	size 20 pages, page size 512
	title "Books/Keywords sample schema"
 
/*			define users			*/
 
user "TESTUSER"	with "PASSWORD"
 
/*			define records			*/
 
record BOOK
	item TITLE	char 30
	item AUTHORS	str  60
	item PURDATE    date
	item PAGES	unsigned 2
	item VOLUMES	int   2
	item READTIME	time
	item COST	idec 7,2
	item RATING	real   4
 
record KEYWORD
	item KEYWORD	char 16
 
/*			define sets			*/
 
set BOOKS, type 1:n
	owner SYSTEM
	member BOOK, order sorted ascending TITLE
			insertion auto
 
set KEYWORDS, type 1:n
	owner SYSTEM
	member KEYWORD, order sorted ascending KEYWORD
			duplicates not allowed
 			insertion auto

set LINK, type n:m
	owner BOOK, order sorted ascending TITLE
	member KEYWORD, order sorted ascending KEYWORD
			duplicates not allowed
 
end
