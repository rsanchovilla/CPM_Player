ASSMAP v 1.3.1 fixes a problem in earlier optimizing versions.
The problem only occurs after generating a store of a SET, and
the optimizer could generate an erroneous following address.

If your program is not using sets, the situation does  not
arise.  Otherwise, see if v 1.3.1 generates the same code size
as 1.3.0 (you need only the TIC file for this, and need not
save the output .MAC file).  If the size is the same, the
situation did not arise.  Otherwise, regenerate the code file.

ASSMPCD and .PCD code modules are unaffected.
	cbf 87/01/16
‚ü