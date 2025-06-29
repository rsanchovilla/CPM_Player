{File: VARIABLE.LIB}

Type
   XInstallRecord = Record
                       XDrive:   String[2];
                    End;


   XKeyrec =   Record
                  XTagArray:   Array[1..4] of String[40];
                  XUsed:       Boolean;
               End;

   XCardrec =  Record
                  XCardArray:  Array[1..55,1..16] of Char;
               End;

Const
   MaxColumns:      Integer = 55;
   MaxRows:         Integer = 16;
   MaxKeys:         Integer = 4;
   PrimaryKeyLen:   Integer = 40;
   SecondaryKeyLen: Integer = 18;
   XOffset:         Integer = 12;
   YOffset:         Integer = 4;

Var
   Disk:  File;
   Disk1: File of XKeyrec;
   Disk2: File of XCardrec;
   DDisk: File of XInstallRecord;
   InstallRecord: XInstallRecord;
   Keyrec:        XKeyrec;
   Cardrec:       XCardrec;

   TagArray:      Array[1..4] of String[40];
   CardArray:     Array[1..55,1..16] of Char;

   Drive: String[2];
   Filename: String[10];
   Temporary:     String[80];

   X, Y,
   Row,
   Column,
   Keypointer,
   FileEndPointer,
   FilePointer:   Integer;

   Key:           Char;

   PrintInit,
   ExitFlag,
   Used:          Boolean;

   Procedure Help; Forward;