1|�� <��	� � h	� �
� :���'��':��!�'O!�|~���G#~����#�'�G>$�	� � �2��		� � �ʢ�1�2�:�2�g. "�!	� ���� ��N	� �  �!� !|� ~#��:�2� *�"� �"� �� ��0��:��A��G��a��g�7����_�'���	� �  �	� �=	� Ä
You must enter a number between 1 and 9

Enter the number or RETURN > $
The string you entered does not have an even number
of digits greater than zero or more than 32 characters
were entered.  Please try again.

$'	� �
The string you entered contained a character other than
0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f   Please try again.

$
File WHM.COM not on the default disk.  Terminating
$Write-Hand-Man configuration program

You will be asked to enter one system dependent value
and two configuration options that represent preferences.
These values are used by Write-Hand-Man to control
its operation.  The first value is the control
string to HOME the CURSOR of your terminal.  The second
value is the character you wish to use to enter Write-Hand-Man.
This character will be a CONTROL character and should be chosen
So that it does not interfere with any application.
The third value is the amount of memory reserved for the
applications.  All the distributed applications load with the
default value

Type any character to continue$

Enter the character string that will cause your
terminal to home the cursor.  Enter each character as a pair
of Hexidecimal digits.  For example the sequence <ESC>H used
by some terminals would be entered as 1B48 .  The Televideo
Terminals use CONTROL ^ which is entered as 1E .

Enter the string followed by RETURN > $

Enter the character you wish to use to enter Write-Hand-Man
The CONTROL form of the character will be used.  Thus if you wish
to use CONTROL A to enter Write-Hand-Man, enter the letter A.
To use CONTROL B enter the letter B, and so forth.  The
suggested value is CONTROL @ (NULL) entered as @, but some
terminals will not generate a NULL when CONTROL @ is typed,
in this case CONTROL ] (GS) is suggested, this is selected
by typing a ], or CONTROL \ (FS) by typing a \

Enter the character  > $

Write-Hand-Man reserves memory to load its applications.  The
amount of memory reserved for this is selected as a 1 digit
number between 1 and 9.  n will reserve nK bytes of memory for
the applications.  The default value is 1.5K and is selected by
typing a RETURN (<CR>).  1.5K is sufficient for all the
distributed applications.

Enter the number or RETURN > $

Configuring Write-Hand-Man.  Please wait$

Configuration of Write-Hand-Man is complete.        
Enable Write-Hand-Man with the command "WHM ON"
After Write-Hand-Man is enabled, enter WHM by typing the
the control form of the trigger character you entered
in step 2 above
$Man.  Please wait$

Configuration of Write-Hand-Man is complet                $    te-Hand-Man with the command "WHM ON"
After Write-Hand-Man is e WHM     COM                                  