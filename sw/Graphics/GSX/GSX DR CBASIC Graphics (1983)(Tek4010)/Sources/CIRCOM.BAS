REM	There are the circle drawing functions.
REM
REM	Use %INCLUDE CIRCOM.BAS to include the functions
REM	in your program.
REM
REM	CALL BEG.CIR  to initialize the circle arrays
REM	CALL PLOT.CIR to draw a circle without fill
REM	CALL FILL.CIR to draw a circle with fill
REM
REM	The circle is centered at .5,.5 with a radius
REM	of .5 in a coordinate system ranging from 0 to 1
REM	on the X and Y axes.
REM
REM	Initialize the circle drawing arrays X.ARRAY and
REM	Y.ARRAY by using CALL BRG.CIR in the beginning
REM	of your program. You only need to execute this
REM	statement once. There is a long delay while
REM	this CALL is completed; you might want to put
REM	a message in your program to assure the user
REM	that the machine is computing.
REM
REM	Use the SET VIEPORT and SET WINDOW statements
REM	to position the circle before calling the
REM	drawing functions.
REM
REM	You must adjust the aspect ratio of the device
REM	to proportion the circle. The following statements
REM	round the circle:
REM
REM		ASK DEVICE X.AXIS,Y.AXIS
REM		SET WINDOW 0,X.AXIS/Y.AXIS,0,1
REM
REM	These statements scale the window so that the X
REM	and Y axes use the same unit scaling regardless
REM	of the aspect ratio of the device. The circle
REM	is drawn with a shift to the left of the viewport
REM	because of the decreased scaling of the X axis.
REM	You can also use the BOUNDS statement to square
REM	the device or the VIEWPORT statement to rescale
REM	the viewport.
REM
REM	The functions use the variables L.CIR,
REM	X.ARRAY, Y.ARRAY, and I.ANGLE. Variable X.ARRAY
REM	is an array of the X coordinates of the points
REM	around the circle. Y.ARRAY contains the corresponding Y
REM	coordinates. L.CIR contains a count of the
REM	number of coordinate pairs. I.ANGLE is only
REM	used by the FOR loop in BEG.CIR.
REM

DEF BEG.CIR
	DIM X.ARRAY(64)
	DIM Y.ARRAY(64)
	L.CIR=0

REM	THIS FOR LOOP STEPS THROUGH 0 TO 360 DEGREES
REM	USING RADIANS. THERE ARE 2PI RADIANS IN 360 DEGREES.
REM	THE FORMULA FOR CALCULATING THE POINTS AROUND
REM	A CIRCLE IS:
REM		X.COORDINATE = CENTER.POINT + RADIUS * COS(I.ANGLE)
REM		Y.COORDINATE = CENTER.POINT + RADIUS * SIN(I.ANGLE)

	FOR I.ANGLE = 0 TO 6.28 STEP .1
		X.ARRAY(L.CIR) = .5 + (.5 * COS(I.ANGLE))
		Y.ARRAY(L.CIR) = .5 + (.5 * SIN(I.ANGLE))
		L.CIR = L.CIR + 1
		NEXT I.ANGLE
REM	THE CIRCLE MUST BE CLOSED FOR MAT PLOT

	X.ARRAY(L.CIR) = X.ARRAY(0)
	Y.ARRAY(L.CIR) = Y.ARRAY(0)
	RETURN
FEND

DEF PLOT.CIR
	MAT PLOT L.CIR: X.ARRAY,Y.ARRAY
	RETURN
FEND

DEF FILL.CIR
	MAT FILL L.CIR-1: X.ARRAY,Y.ARRAY
	RETURN
FEND
