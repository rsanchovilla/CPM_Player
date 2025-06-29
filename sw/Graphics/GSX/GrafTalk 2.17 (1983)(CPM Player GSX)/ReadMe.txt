
GrafTalk is available in \home\nathanael\DiskStation\web\cpm\cpm\Software\rlee
but this version is customized for Z100 Zenith computer.

The program runs on text mode, but as it relies on Z100 curstom graphic hardware,
it freezes when displaying anything.

There is no version indication on GrafTalk start-up message. 
Nevertheless, the installer INSTALL.COM shows version 2.17 dated 24/Oct/1983

To allow GrafTalk to work on any CP/M with GSX, some modifications
have beed done

1) Using the installer, change the SCREEN graphic device to HP7400 plotter
   and use the IOPACK named ILIST. This will cause GrafTalk to redirect 
   the drawings to printer port using BDOS function 5, sending HP-GL commands

2) Built-in HP7400 driver expects the user to manually change the plotter 
   pen when drawing different colors. the message "Select Pen # n" is showed 
   on screen. 

   GRAFTALK.OVL is patched to issue a "SPn" (select pen) command to plotter 
   instead

	Original code

	0a9e 32ce0a    ld      ($0ace),a	Store the ascii pen number n into user prompt string
	0aa1 21bf0a    ld      hl,$0abf		HL = addr of string "Select pen # n" 
	0aa4 cd1c78    call    $781c		print string$ at addr HL
	0aa7 cdaa77    call    $77aa		wait for enter key
	0aaa c9        ret     

	Patched code

	0a9e 32a60a    ld      (0aa6),a	        Store the ascii pen number n into HP-GL command string
	0aa1 cdf10a    call    $0af1	        send stringz to plotter placed after the call
	0aa4 535031    DB      "SP1;",0 	the change pen HP-GL command
	0aa7 3b00
	0aa9 00        nop    
	0aaa c9        ret     


3) Create a GTLOAD loader program that is to be executed just before launching 
   GrafTalk. The functions of this loader are:

	- GTLOAD includes embebbed the program GTPLTGSX. GTLOAD relocates 
	  GTPLTGSX on top of TPA
	- Then calls GTPLTGSX to hook BDOS call 5 (send to printer port)
        - loads regular GRAFTALK.COM program
        
   GTPLTGSX receives the HP 74XX HP-GL plotter commands sent by GrafTalk
   via the BDOS func 5 hook. Then translates these commands to GSX calls 
   to draw the image on screen.

3) GENGRAF the GTLOAD to enable it to use a GSX driver

In order to run, the following files must be present when GrafTalk 
is started:

	GSX.SYS
	ASSIGN.SYS	<- should state the DD*.PRL driver to be used
	DD*.PRL		<- The GSX driver to use

To start GrafTalk, just execute:

	GTLOAD

GrafTalk can run on DDCPMPLY.PRL, the driver for CPM Player simulator
but should run on any other GSX driver

Roberto Sancho
Mar/2024


	




