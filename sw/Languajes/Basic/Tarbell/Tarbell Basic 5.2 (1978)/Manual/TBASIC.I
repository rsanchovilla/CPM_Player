	Known Bugs, Limitations, and Peculiarities

Hopefully this section will remain small.  We have, however,
decided to not ignore the fact, like some manufacturers do,
that there will be forever bugs and other strange things in
the system.  To expect us to be perfect is asking too much,
but we will at least work toward that objective.  In that
direction, we have already spent several months searching
for these vermin, and exterminating them as quickly as
possible.  But we know that our customers will find some for
us, so we'd appreciate it if you would let us know, preferably
in writing, when you see any of these creatures creeping about.
This page of the manual will change from one release to the
next, with an effort to make the page match the release.


CTL STK ERROR message is somewhat obscure.

A space is required after all statements.

Assignments of values to variables are not allowed in command
mode unless the variable has been previously defined in a
program.

The expression  1/2  will evaluate to 0, since integer mode
is retained until a floating point value is seen.  Use the
expression  1./2  or  1/2.  to get the correct answer of .5 .

The LET statement name gets put in if you don't use it.

Parentheses may get rearranged to an equivalent sequence.
This is a product of the way expressions are represented internally.

Tabs are not allowed in the middle of a statement.

Random numbers evidently always end in the digit 5.

If an array is DIMensioned to size n, an attempt to print array(n+1)
will print garbage instead of giving an error message.

Two colons in a row in a statement line will cause a crash.

When entering a number in exponential (E) format, always put either
a space, minus sign, or plus sign after the E, then two digits.

The logical expression  NOT -1  produces an error message.

Sometimes goes into ENTRY mode at the wrong time.

After filling up memory with statements, error messages
are incorrect.

In EDIT, if you delete too many characters, it backs up.

Negative offset to line descriptor doesn't always work right.

HEX$ returns with leading zeroes.



				I




