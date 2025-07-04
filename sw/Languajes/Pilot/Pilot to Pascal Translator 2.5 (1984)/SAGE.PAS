PROGRAM Sage;
{$iPILOT/P.HDR }
{ FILE: SAGE.PLT}
{ by ELLEN NOLD and SALLY CANNON;  STANFORD 7/73}
{ Rewritten for PILOT/P by Ray Penley, 01/11/84}
BEGIN initialize;
WRITELN(' Hi. What''s your name?');
READLN($n);
WRITELN(' O.K., ',$n,', this time we''re going to talk');
WRITELN(' about what you can and can''t see, hear, touch,');
WRITELN(' taste and feel. You just touched the computer');
WRITELN(' terminal. How does it feel?');
READLN($a);
1:
WRITELN(' Fine. Now say it again in a different way.');
WRITELN(' It feels like -');
READLN($b);
WRITELN(' Good.  Even more far out? It feels as if -');
READLN($c);
WRITELN(' You''ve just written a poem.  Here it is:');
WRITELN;
WRITELN;
WRITELN('      TERMINAL');
WRITELN;
WRITELN('     ',$a);
WRITELN('     Like ',$b);
WRITELN('     Just as if ',$c);
WRITELN;
WRITELN;
WRITELN;
WRITELN(' Do you want to change your poem?');
READLN(ans);
match('Y!y!OK!ok','!',ans,flag);
if flag then GOTO 1;
WRITELN(' I thought your poem was O.K., too.');
WRITELN(' Now think about the things you normally can''t');
WRITELN(' see, hear, touch, taste or feel--like love, or');
WRITELN(' hate, or joy or desperation. Can you point to');
WRITELN(' "desperation" the same way you can point to a');
WRITELN(' desperate man?');
READLN(ans);
WRITELN(' Well, you can describe desperation, but it would');
WRITELN(' be hard to point to. A poet can touch an abstract');
WRITELN(' idea like desperation with words.');
WRITELN(' Desperation feels like -');
READLN($d);
WRITELN(' Yeah.  And desperation tastes like -');
READLN($e);
WRITELN(' Oh?  Desperation looks and smells -');
READLN($j);
WRITELN(' That was harder, but now we can see, smell,');
WRITELN(' taste and touch desperation. Want to go on?');
READLN(ans);
match('N!n','!',ans,flag);
if flag then GOTO 2;
WRITELN(' Good.  Now, ',$n,', think of another abstract idea.');
READLN($d);
WRITELN(' What does ',$d,' smell like?');
READLN($e);
WRITELN(' It smells like ',$e,' ?');
WRITELN(' Neat. What does ',$d,' sound like?');
READLN($f);
WRITELN(' Sounds like ',$f,' ?  Interesting.');
WRITELN(' What does ',$d,' look like?');
READLN($g);
WRITELN(' You could make a poem out of that.');
WRITELN;
WRITELN('             ',$d);
WRITELN('     BY ',$n);
WRITELN;
WRITELN('             ',$e,'- ',$d);
WRITELN('             ',$f,'- OH, ',$d);
WRITELN('                ',$g);
WRITELN;
WRITELN(' Now, ',$n,', would you like to take an');
WRITELN(' imaginary walk in the woods?');
READLN(ans);
match('N!n','!',ans,flag);
if not flag then WRITELN(
'Good. It''s autumn, and as you''re walking through');
if not flag then WRITELN('the woods, what colors do you see?');
if flag then GOTO 3;
READLN($h);
WRITELN('What do ',$h,' remind you of?');
READLN(ans);
WRITELN('Uh huh. Walking in the woods can lead to thoughts');
WRITELN('of abstract ideas such as death, change, beauty');
WRITELN('or cycles. Think of some more abstracts and type');
WRITELN('them in.');
READLN($i);
WRITELN('How do you feel when you think about ',$i,'?');
READLN(ans);
WRITELN('O.K., would you like to write a short poem, ',$n,'?');
READLN(ans);
match('N!n','!',ans,flag);
if flag then GOTO 4;
WRITELN('O.K.  A suggestion is to type four lines');
WRITELN('using the ',$h,' colors, and ',$i,', your');
WRITELN('abstract ideas, and the feelings you have about ',$i,'.');
WRITELN;
WRITELN('         ',$n,'''S POEM');
WRITELN;
READLN(ans);
READLN(ans);
READLN(ans);
READLN($j);
WRITELN;
WRITELN('NICE, ',$n);
3:
WRITELN('Here''s something someone else wrote:');
WRITELN;
WRITELN('     One by one,');
WRITELN('     branch by branch');
WRITELN('     leaves topple,');
WRITELN('     zigzag');
WRITELN('     through motionless October');
WRITELN('     struggle,');
WRITELN('     founder--');
WRITELN('     golden birds');
WRITELN('     with broken wings.');
WRITELN;
WRITELN('This poet makes the abstraction of "October"');
WRITELN('touchable or more concrete by describing leaves.');
WRITELN('To what does he compare leaves?');
READLN(ans);
match('B!b!F!f','!',ans,flag);
if flag then WRITELN('Yes, birds.');
if not flag then WRITELN(' Not exactly. How about "birds"?');
WRITELN('How do you think this poet felt about October?');
READLN(ans);
match('s!d!c!h!m!p!t!S!D!C!H!M!P!T','!',ans,flag);
if flag then WRITELN('I agree.');
if not flag then WRITELN('Really? I didn''t pick that up.');
WRITELN('Were your feelings about the woods at all similar');
WRITELN('to this poet''s?');
READLN(ans);
match('N!n','!',ans,flag);
if not flag then WRITELN('You see that your feelings are touchable, too.');
if flag then WRITELN('No? Well, even so, you can see that');
if flag then WRITELN('your feelings are touchable, too.');
WRITELN;
WRITELN('Words can help us "touch" something abstract--');
WRITELN('like a feeling or a season--though we can''t');
WRITELN('hold it in our hands.');
WRITELN;
4:
WRITELN('Here, again are some of your words from this session:');
WRITELN;
WRITELN(' ',$d);
WRITELN(' ',$b);
WRITELN(' ',$a);
WRITELN(' ',$f);
WRITELN(' ',$j);
WRITELN;
WRITELN;
WRITELN('If you''d like to do more with the abstract and');
WRITELN('concrete, try CLOVE.  Bye for now, ',$n,'.');
WRITELN;
WRITELN;
GOTO 0;
2:
WRITELN(' O.K. ',$n);
WRITELN(' Try SAGE again if you like.');
GOTO 0;
0:END.
