The files contained within are for the Small-C/Plus compiler. It
was written on the Amstrad PCW 8256. This compiler runs on
CP/M-80, and generates code for CP/M-80. It requires a 61K TPA to
run, so good luck!

It generates ZMAC assembly language. ZMAC is an "almost" Zilog
compatible Z80 assembler. It has some weird syntaz. The
assembler, linker, and librarian are included in this
distribution.

This version of Small C has some interesting extensions;
structures, unions, and floating point, among others. The FP has
a funky format but all library source is included. The only real
drawback is that it uses the "undocumented" Z80 instructions to
access IXH, IXL, IYH, IYL and Z80MU doesn't like that. If you
leave out the FP stuff, everything is OK.

Source for the Small-C/Plus compiler:

     CC1.C                     Small-C/Plus compiler source
     CC2.C                            "         "      "
     CC3.C                            "         "      "
     CC4.C                            "         "      "
     CC5.C                            "         "      "
     CC6.C                            "         "      "
     CCDEFS.H                  Small-C/Plus compiler header file
     CCFLOAT.C                        "         "      "      "
     CCFLOAT.H                        "         "      "      "
     CCFUNC.H                         "         "      "      "
     CCLVALUE.H                       "         "      "      "
     CCSTR.C                   String handling for Small-C/Plus
     FPUTS.C                   fputs() for Small-C/Plus
     IOLIB.C                   Run-time routines for Small-C/Plus
     MAKE.SUB                  Submit file to build compiler
     READ.ME                   This file
     STDIO.H                   Small-C/Plus compiler header file
     STRING.H                         "         "      "      "

miscellaneous utilities for the Small-C/Plus compiler


      CC.SUB                  Submit file to compile and link
      CC-C.SUB                Submit file to compile
      MAP2SYM.C               Convert .MAP file to .SYM file
      MAP2SYM.COM
      PLOT.ASM                RSX to permit screen plotting
      PLOT.RSX
      READ.ME                 This file
      ZLIB.C                  Library manager
      ZLIB.COM
      ZLINK.COM
      ZMAC.COM                Linker
      ZOPT.COM                Assembler optimiser
      ZOPT.H
      ZOPT0.C
      ZOPT1.C
      ZOPT2.C
      ZOPT3.C
      ZOPT4.C
      ZOPT5.C
      ZRES.C                  Library reference resolver
      ZRES.COM

Small-C/Plus compiler and documentation

      CC0.COM              Small-C/Plus compiler
      CC0.DOC              Documentation on the compiler
      CTYPE.DOC            Documentation on classification routines
      FLOAT.DOC            Documentation on floating point routines
      GETOPT.DOC           Documentation on getopt()
      IOLIB.DOC            Documentation on miscellaneous routines
      MALLOC.C             Memory allocation program
      MAP2SYM.DOC          Documentation on .MAP to .SYM convertor
      MATH.DOC             Documentation on mathematical routines
      PLOT.DOC             Documentation on plotting routines
      PRINTF.DOC           Documentation on printf()
      READ.ME              This file
      SCANF.DOC            Documentation on scanf()
      STRING.DOC           Documentation on string functions
      TEST.C               Test program
      TRACE.DOC            Documentation on stack walk-back trace
      WILDCARD.DOC         Documentation on wildcard()
      ZLIB.DOC             Documentation on library manager
      ZLINK.DOC            Documentation on linker
      ZMAC.DOC             Documentation on assembler
      ZOPT.DOC             Documentation on optimiser
      ZRES.DOC             Documentation on library reference resolver

Enjoy!

