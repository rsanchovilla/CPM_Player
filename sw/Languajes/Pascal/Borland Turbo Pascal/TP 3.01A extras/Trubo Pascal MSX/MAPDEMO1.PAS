program Jobs;

{$I MAPPER.MIC }

{ Dieses Programm ist dem Pointer-Beispiel aus dem Turbo-Handbuch  }
{ nachempfunden, benutzt aber die Mapper-Routinen und MapPointer.  }


{$C-}


type
  PersonPointer = MapPointer;

  PersonRecord  = record
                    Name: string[50];
                    Job:  string[50];
                    Next: PersonPointer;
                  end;

var
  HeapTop: MapPointer;
  FirstPerson, LastPerson, NewPerson: PersonPointer;
  Name:    string[50];

  buffer:  PersonRecord;             (* Die Puffervariable *)

  f: file;     (* fÅr Execute *)


begin
  MapInit;

  FirstPerson := MapNIL;
  HeapTop     := MapHeapPtr;         (* mark(HeapTop) *)

  repeat
    writeln (MapAvail:0:0, ' Bytes free');
    write ('Enter name:       ');
    readln (Name);
    if Name <> ''
    then begin
      MapGetMem (NewPerson, sizeof(PersonRecord));
      buffer.name := Name;

      write ('Enter profession: ');
      readln (buffer.Job);
      writeln;

      WriteMap (NewPerson, buffer, sizeof(buffer));

      if MapEqual (FirstPerson, MapNIL)
      then FirstPerson := NewPerson
      else begin
        ReadMap  (LastPerson, buffer, sizeof(buffer));
        buffer.next := NewPerson;
        WriteMap (LastPerson, buffer, sizeof(buffer));
        end;
      LastPerson  := NewPerson;
      ReadMap  (LastPerson, buffer, sizeof(buffer));
      buffer.next := MapNIL;
      WriteMap (LastPerson, buffer, sizeof(buffer));
    end;
  until Name = '';
  writeln;

  while MapNotEqual (FirstPerson, MapNIL) do
    with buffer do
      begin
      ReadMap (FirstPerson, buffer, sizeof(buffer));
      writeln (Name, ' is a ', Job);
      FirstPerson := Next;
      end;

  MapHeapPtr := HeapTop;           (*  release (HeapTop)  *)


  assign (f, 'DEMO.COM');
  execute (f);                      (* zurÅck zum MenÅ *)
end.

