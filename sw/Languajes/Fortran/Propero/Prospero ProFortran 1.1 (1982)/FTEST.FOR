C------!--!--!--!--!--!--!--!--!--!--!--!----------------------------R
C********************************************************************)
C*                                                                  *)
C*     Title         : Test program for Torch Library               *)
C*     Version       : 0.01                                         *)
C*                                                                  *)
C*     Written by    : Peter C. Headland                            *)
C*     Date written  : 21/04 1983                                   *)
C*                                                                  *)
C*     Last modified :       1983                                   *)
C*     Modifications :                                              *)
C*                                                                  *)
C*                                                                  *)
C*                                                                  *)
C*                                                                  *)
C*     Copyright (C) Cambridge Computer Consultants Limited         *)
C*                                                                  *)
C********************************************************************)

       PROGRAM TEST

       INTEGER*1 COMLIN (62)
       READ (1, 100) COMLIN
100    FORMAT (62A1)
       CALL OSCLI (COMLIN, 62)
       STOP
       END
