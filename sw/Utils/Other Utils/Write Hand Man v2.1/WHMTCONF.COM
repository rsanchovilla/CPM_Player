1��� <��&	� � �	� � �a�0�_�Z�!�G~����G##�9#~2��	� � �2��	� � �ʄ�1�	�:�	�g. "�H	� ͥ�� ͥu	� �  �!� !�� ~#µ:�2� *�"� �"� �� ��0��:���A��G���a��g��7����_�'���	� �  �	� �f�	� �*	� �  
Write-Hand-Man cannot support the Automatic
Screen Refresh feature.  Use WHM instead.
$
Invalid Choice. Try again
$
You must enter a number between 1 and 9

Enter the number or RETURN > $
File WHMT.COM not on the default disk.  Terminating
$Write-Hand-Man configuration program

You will be asked to enter one terminal dependent value
and two configuration options that represent preferences.
These values are used by Write-Hand-Man to control
its operation.  The first value is the terminal
type selection letter for your terminal.  The second
value is the character you wish to use to enter Write-Hand-Man.
This character will be a CONTROL character and should be chosen
So that it does not interfere with any application.
The third value is the amount of memory reserved for the
applications.  All the distributed applications load with the
default value

Type any character to continue$

Enter the character you wish to use to enter Write-Hand-Man
The CONTROL form of the character will be used.  Thus if you wish
to use CONTROL A to enter Write-Hand-Man, enter the letter A.
To use CONTROL B enter the letter B, and so forth.  The
suggested value is CONTROL @ (NULL) entered as @, but some
terminals will not generate a NULL when CONTROL @ is typed,
in this case CONTROL ] (GS) is suggested, this is selected
by typing a ], or CONTROL \ (FS) by typing a \

Enter the character  > $

Select your Terminal from the following list.  If your terminal
is not listed, Write-Hand-Man will not support the Automatic
Screen Refresh feature.  Full attribute support (blinking,
underline, reverse video, etc) is not available for all
terminals.  If your terminal is not in this list you might
try the Televideo 910.  Many terminals behave like the 910.
Select your terminal by typing the appropriate letter
If your terminal is not listed and you know that the
Televideo 910 is inappropriate (you have a VT100 for instance)
then enter a Z as you may not use WHMT.

A - Televideo 920    B - Televideo 910   C - Televideo 950
D - Heath H19 (24 l) E - VT52            F - Osborne       
G - Freedom 50/100   H - Epson QX-10     I - ADM 3A        
J - Kaypro           K - Soroc           L - WYSE 50/100   
M - ADM 31           N - Televideo 925   O - Heath 25 line 
P - Hazeltine 1500   Q - ADDS Viewpoint  R - Sanyo 1250    
Y - CUSTOM PATCHED   Z - none of the above

Enter choice >$A BCDEFGH IJKLMNOPQR	Y  

Write-Hand-Man reserves memory to load its applications.  The
amount of memory reserved for this is selected as a 1 digit
number between 1 and 9.  n will reserve nK bytes of memory for
the applications.  The default value is 1.5K and is selected by
typing a RETURN (<CR>).  1.5K is sufficient for all the
distributed applications.

Enter the number or RETURN > $

Configuring Write-Hand-Man.  Please wait$

Configuration of Write-Hand-Man is complete.        
Enable Write-Hand-Man with the command "WHMT ON"
After Write-Hand-Man is enabled, enter WHM by typing the
the control form of the trigger character you entered
in step 2 above
$an.  Please wait$

Configuration of Write-Hand-Man is complete                $    e-Hand-Man with the command "WHMT ON"
After Write-Hand-Man is e WHMT    COM                                                                                                                          