
DrLogo is presented as a CP/M-3.0 application, but in fact the only CP/M 3.0 
specificity it has is the fact that LOGO.COM file adheres to CP/M 3.0 loader 
format intead of regular CP/M 2.2 (see http://www.seasip.info/Cpm/rsxrec.html). 

The purpose of this is that the operating system will to automatically load and 
start an RSX program embedded in LOGO.COM file. This RSX file is responsible 
of graphics/screen operations. 

There is an excelent explanation by John Elliott on how this works 
at http://www.seasip.info/Cpm/drlogo.html. 

So to construct a generic GSX LOGO, the modifications done are:

- remove the RSX from LOGO.COM, and make LOGO.COM a standard CP/M 2.2 .COM file
- rewrite the RSX to support GSX calls (this is LGGSX.ASM)
- create a loader program that loads LGGSX on top of mem (this is LGLOAD) and then
  loads regular (CP/M 2.2) LOGO.COM
- "GENGRAF" LDLOAD so it also loads defined GSX driver

To start generic GSX CP/M-80 2.2 logo, just run LGLOGO 

	A>lgload

LGLOGO will load LOGO.COM in mem, and start it

In A: unit also must be present GSX.SYS, ASSIGN.SYS and the DD*.PRL
driver stated in ASSIGN.SYS 

The GSX driver to be used needs to supports XOR mode/Erase mode drawing.
The text terminal must support VT100/ANSI escape sequences.

Roberto Sancho
Mar/2024


