
DrDraw 1.0.1 is the flagship application from Digital Research for GSX

DrDraw is a CP/M-80 3.0 application, and needs a GSX driver that supports

	- XOR mode/Erase mode drawing
	- Bar Generalized Draw Primitive support (=Fill rectagular Area)
	- Graphic Input (GIN) in Request mode

DDXTEK and DDVRET drivers does not support Bar drawing, thus
it is hard to use DrDraw with them.

DDCPMPLY driver supports all needed primitives plus color, so 
it is possible to use DrDraw with CPM Player emulator


TeleVideo 803 provides bundled an application called TeleDraw.
This application seems to be a previous version of draw. 

	- TeleDraw Runs on CP/M-80 2.2 instead of CP/M 3.0
	- TeleDraw a bigger program (126K vs 100K)
	- has a different incompatible file format
	- has same fonts but separated in 5 files, intead of 3
	- The menu options layout is different
	- The menu aesthetics are different
	- DrDraw support working on low-res/40 cols devices, while
	  TeleDraw not

Roberto Sancho
Mar/2024


