0001 IDENTIFICATION DIVISION.
0002 PROGRAM-ID.
0003     CONFIG.
0004*  CONFIGUR THE CRT BY CHANGING THE RUN TIME PACKAGE.
0005 ENVIRONMENT DIVISION.
0006 CONFIGURATION SECTION.
0007 SOURCE-COMPUTER.
0008     8080-CPU.
0009 OBJECT-COMPUTER.
0010     8080-CPU.
0011 INPUT-OUTPUT SECTION.
0012 FILE-CONTROL.
0013     SELECT FILE1 ASSIGN TO DISK
0014       ORGANIZATION IS SEQUENTIAL
0015       ACCESS MODE IS SEQUENTIAL.
0016 DATA DIVISION.
0017 FILE SECTION.
0018 FD FILE1
0019     LABEL RECORDS ARE STANDARD
0020     VALUE OF FILE-ID IS "RUN.COM"
0021     BLOCK CONTAINS 1 RECORD
0022     DATA RECORDS ARE TESTA.
0023 01 TESTA.
0024     02 JMP PIC XXX.
0025     02 LINE-LENGTH PIC IS X.
0026     02 LINES-PER-PAGE PIC X.
0027     02 CR-LF-END-OF-LINE PIC X.
0028     02 DELETE-KEY-CODE PIC X.
0029     02 CPM-BACK-UP-1 PIC X.
0030     02 BACKSPACE-CODE PIC X.
0031     02 ESCAPE-CODE PIC X.
0032     02 NO-LF-TO-PRINTER PIC X.
0033     02 PRINTER-NULLS PIC X.
0034     02 TYPE-DISPLAY PIC X.
0035     02 ACCEPT-HEX PIC X.
0036 WORKING-STORAGE SECTION.
0037 01 H-BINARY PIC 99 COMP.
0038 01 W-BINARY REDEFINES H-BINARY.
0039     02 BYTE PIC 9.
0040     02 FILLER PIC X.
0041 01 ANS PIC X
0042         VALUE SPACE.
0043 01 ANS-2 PIC 99.
0044 01 ANSWER.
0045     02 IN-A PIC X
0046         VALUE "7".
0047     02 IN-B PIC X
0048         VALUE "F".
0049 01 BIN-A PIC 99 COMP.
0050 01 BIN-A1 REDEFINES BIN-A.
0051     02 LA PIC X.
0052     02 FILLER PIC X.
0053 01 BIN-B PIC 99 COMP.
0054 01 BIN-B1 REDEFINES BIN-B.
0055     02 LB PIC X.
0056     02 FILLER PIC X.
0057 PROCEDURE DIVISION.
0058 BEGIN.
0059     OPEN I-O FILE1.
0060     MOVE SPACE TO TESTA.
0061     READ FILE1
0062       AT END
0063       GO TO EOJ.
0064 A.
0065     MOVE ZERO TO BIN-A.
0066     MOVE ZERO TO BIN-B.
0067     MOVE "7F" TO ANSWER.
0068     DISPLAY "ENTER SCREEN INFORMATION".
0069     DISPLAY "ENTER 2-DIGIT HEXADECIMAL".
0070     DISPLAY " CODE FOR DELETE-KEY " WITH NO ADVANCING.
0071     ACCEPT ANSWER.
0072     PERFORM HEX-BIN THRU HEX-BIN-XT.
0073     IF IN-A = "X"
0074       GO TO A.
0075     MOVE LA TO DELETE-KEY-CODE.
0076 AA.
0077     MOVE ZERO TO BIN-A BIN-B.
0078     MOVE "01" TO ANSWER.
0079     DISPLAY "ENTER 2-DIGIT HEXADECIMAL CODE SENT ".
0080     DISPLAY "TO BACKSPACE CURSOR " NO.
0081     ACCEPT ANSWER.
0082     PERFORM HEX-BIN THRU HEX-BIN-XT.
0083     IF IN-A = "X"
0084       GO TO AA.
0085     MOVE LA TO BACKSPACE-CODE.
0086 AAA.
0087     MOVE SPACE TO ANS.
0088     DISPLAY "IS THE BACKSPACE PRECEEDED".
0089     DISPLAY " WITH AN ESCAPE CHARACTER (Y/N)? " NO.
0090     ACCEPT ANS.
0091     IF ANS = "N"
0092       MOVE "00" TO ANSWER
0093       GO TO AAA-XT.
0094     IF ANS NOT = "Y"
0095       GO TO AAA.
0096     DISPLAY "ENTER 2-DIGIT HEXADECIMAL ".
0097     DISPLAY "CODE FOR ESCAPE " NO.
0098     ACCEPT ANSWER.
0099 AAA-XT.
0100     PERFORM HEX-BIN THRU HEX-BIN-XT.
0101     IF IN-A = "X"
0102       GO TO AAA.
0103     MOVE LA TO ESCAPE-CODE.
0104 B.
0105     DISPLAY "ENTER # ".
0106     DISPLAY "OF CHARACTERS ACROSS SCREEN " WITH NO
0107     ADVANCING.
0108     MOVE "64" TO ANSWER.
0109     ACCEPT ANSWER.
0110     IF IN-A = SPACE
0111       GO TO B.
0112     IF IN-B = SPACE
0113       GO TO B.
0114     IF IN-A > 9
0115       GO TO B.
0116     IF IN-B > 9
0117       GO TO B.
0118     MOVE ANSWER TO ANS-2.
0119     MOVE ANS-2 TO H-BINARY.
0120     MOVE BYTE TO LINE-LENGTH.
0121 C.
0122     DISPLAY "ENTER # OF LINES ".
0123     DISPLAY "PER SCREEN PAGE " WITH NO ADVANCING.
0124     MOVE 16 TO ANSWER.
0125     ACCEPT ANSWER.
0126     IF IN-A = SPACE
0127       GO TO C.
0128     IF IN-B = SPACE
0129       GO TO C.
0130     IF IN-A > 9
0131       GO TO C.
0132     IF IN-B > 9
0133       GO TO C.
0134     MOVE ANSWER TO ANS-2.
0135     MOVE ANS-2 TO H-BINARY.
0136     MOVE BYTE TO LINES-PER-PAGE.
0137 D.
0138     DISPLAY "DOES YOUR BIOS ISSUE A CR/LF ".
0139     DISPLAY "AT THE END OF EACH LINE (Y/N)?".
0140     MOVE SPACE TO ANS.
0141     ACCEPT ANS.
0142     IF ANS = "Y"
0143       MOVE 1 TO H-BINARY
0144       GO TO DX.
0145     IF ANS = "N"
0146       MOVE 0 TO H-BINARY
0147       GO TO DX.
0148     GO TO D.
0149 DX.
0150     MOVE BYTE TO CR-LF-END-OF-LINE.
0151 F.
0152     MOVE SPACE TO ANS.
0153     DISPLAY "DOES YOUR PRINTER REQUIRE A LINE FEED (Y/N)?".
0154     ACCEPT ANS.
0155     IF ANS = "Y"
0156       MOVE 0 TO H-BINARY
0157       GO TO FX.
0158     IF ANS = "N"
0159       MOVE 1 TO H-BINARY
0160       GO TO FX.
0161     GO TO F.
0162 FX.
0163     MOVE BYTE TO NO-LF-TO-PRINTER.
0164 G.
0165     MOVE SPACE TO ANS.
0166     DISPLAY "DO YOU WANT TO USE THE CPM FUNCTION 1 & 2 ".
0167     DISPLAY "CONSOLE I-O (Y/N)?".
0168     ACCEPT ANS.
0169     IF ANS = "N"
0170       MOVE 1 TO H-BINARY
0171       MOVE BYTE TO CPM-BACK-UP-1
0172       GO TO EE.
0173 E.
0174     MOVE SPACE TO ANS.
0175     DISPLAY "DOES YOUR CPM BACKSPACE AND BLANK THE".
0176     DISPLAY "DELETED CHARACTER (Y/N)?".
0177     ACCEPT ANS.
0178     IF ANS = "Y"
0179       MOVE 1 TO H-BINARY
0180       GO TO EX.
0181     IF ANS = "N"
0182       MOVE 0 TO H-BINARY
0183       GO TO EX.
0184     GO TO E.
0185 EX.
0186     MOVE BYTE TO CPM-BACK-UP-1.
0187     MOVE 2 TO H-BINARY
0188     GO TO GX.
0189 EE.
0190     MOVE SPACE TO ANS.
0191     DISPLAY "DO YOU WANT TO USE THE CPM 2.X FUNCTION 6 ".
0192     DISPLAY "CONSOLE I-O (Y/N)?".
0193     ACCEPT ANS.
0194     IF ANS = "Y"
0195       MOVE 6 TO H-BINARY
0196       GO TO GX.
0197     MOVE SPACE TO ANS.
0198     DISPLAY "DO YOU WANT TO SKIP CPM AND USE THE BIOS".
0199     DISPLAY "CONSOLE I-O (Y/N)?".
0200     ACCEPT ANS.
0201     IF ANS = "Y"
0202       MOVE 0 TO H-BINARY
0203       GO TO GX.
0204     GO TO G.
0205 GX.
0206     MOVE BYTE TO TYPE-DISPLAY.
0207 H.
0208     MOVE SPACE TO ANS.
0209     DISPLAY "DO YOU WANT TO ACCEPT ANY HEX CHARACTER ".
0210     DISPLAY "OR ONLY DISPLAY ASCII (H/A)?".
0211     ACCEPT ANS.
0212     IF ANS = "H"
0213       MOVE "X" TO ACCEPT-HEX
0214       GO TO HX.
0215     IF ANS = "A"
0216       MOVE ""00"" TO ACCEPT-HEX
0217       GO TO HX.
0218     GO TO H.
0219 HX.
0220     REWRITE TESTA.
0221 EOJ.
0222     DISPLAY "EOJ CONFIG RETURNING TO CPM".
0223     CLOSE FILE1.
0224     STOP RUN.
0225 HEX-BIN.
0226     IF IN-A = "0"
0227       MOVE ""00"" TO LA
0228       GO TO CK-B.
0229     IF IN-A = "1"
0230       MOVE ""10"" TO LA
0231       GO TO CK-B.
0232     IF IN-A = "2"
0233       MOVE ""20"" TO LA
0234       GO TO CK-B.
0235     IF IN-A = "3"
0236       MOVE ""30"" TO LA
0237       GO TO CK-B.
0238     IF IN-A = "4"
0239       MOVE ""40"" TO LA
0240       GO TO CK-B.
0241     IF IN-A = "5"
0242       MOVE ""50"" TO LA
0243       GO TO CK-B.
0244     IF IN-A = "6"
0245       MOVE ""60"" TO LA
0246       GO TO CK-B.
0247     IF IN-A = "7"
0248       MOVE ""70"" TO LA
0249       GO TO CK-B.
0250     IF IN-A = "8"
0251       MOVE ""80"" TO LA
0252       GO TO CK-B.
0253     IF IN-A = "9"
0254       MOVE ""90"" TO LA
0255       GO TO CK-B.
0256     IF IN-A = "A"
0257       MOVE ""A0"" TO LA
0258       GO TO CK-B.
0259     IF IN-A = "B"
0260       MOVE ""B0"" TO LA
0261       GO TO CK-B.
0262     IF IN-A = "C"
0263       MOVE ""C0"" TO LA
0264       GO TO CK-B.
0265     IF IN-A = "D"
0266       MOVE ""D0"" TO LA
0267       GO TO CK-B.
0268     IF IN-A = "E"
0269       MOVE ""E0"" TO LA
0270       GO TO CK-B.
0271     IF IN-A = "F"
0272       MOVE ""F0"" TO LA
0273       GO TO CK-B.
0274     MOVE "X" TO IN-A.
0275     GO TO HEX-BIN-XT.
0276 CK-B.
0277     IF IN-B = "0"
0278       MOVE ""00"" TO LB
0279       GO TO DO-ADD.
0280     IF IN-B = "1"
0281       MOVE ""01"" TO LB
0282       GO TO DO-ADD.
0283     IF IN-B = "2"
0284       MOVE ""02"" TO LB
0285       GO TO DO-ADD.
0286     IF IN-B = "3"
0287       MOVE ""03"" TO LB
0288       GO TO DO-ADD.
0289     IF IN-B = "4"
0290       MOVE ""04"" TO LB
0291       GO TO DO-ADD.
0292     IF IN-B = "5"
0293       MOVE ""05"" TO LB
0294       GO TO DO-ADD.
0295     IF IN-B = "6"
0296       MOVE ""06"" TO LB
0297       GO TO DO-ADD.
0298     IF IN-B = "7"
0299       MOVE ""07"" TO LB
0300       GO TO DO-ADD.
0301     IF IN-B = "8"
0302       MOVE ""08"" TO LB
0303       GO TO DO-ADD.
0304     IF IN-B = "9"
0305       MOVE ""09"" TO LB
0306       GO TO DO-ADD.
0307     IF IN-B = "A"
0308       MOVE ""0A"" TO LB
0309       GO TO DO-ADD.
0310     IF IN-B = "B"
0311       MOVE ""0B"" TO LB
0312       GO TO DO-ADD.
0313     IF IN-B = "C"
0314       MOVE ""0C"" TO LB
0315       GO TO DO-ADD.
0316     IF IN-B = "D"
0317       MOVE ""0D"" TO LB
0318       GO TO DO-ADD.
0319     IF IN-B = "E"
0320       MOVE ""0E"" TO LB
0321       GO TO DO-ADD.
0322     IF IN-B = "F"
0323       MOVE ""0F"" TO LB
0324       GO TO DO-ADD.
0325     MOVE "X" TO IN-A.
0326     GO TO HEX-BIN-XT.
0327 DO-ADD.
0328     ADD BIN-B TO BIN-A.
0329 HEX-BIN-XT.
0330     EXIT.
0331 END PROGRAM CONFIG.
             