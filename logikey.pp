Program logikey;

// Uses CRT;

Var I: File;
    B: Byte;
    NR: Word;
    Buf: Array[0..63] Of Byte;
    LastVal: Byte;
    Found: Boolean;

Begin
{$I-}
  Assign(I, '/dev/logilink');
  FileMode := 0;
  Reset(I, 1);
  FileMode := 2;
{$I+}
  If IOResult <> 0 Then WriteLn('Could not open device');
  LastVal := 0;
  While True Do Begin
{$I-}
    BlockRead(I, Buf[0], 64, NR);
{$I+}
    If IOResult <> 0 Then WriteLn('Error reading');
    Found := False;
    If NR > 0 Then For B := 0 To (NR - 1) Do If Buf[B] > 0 Then Begin
      LastVal := (Buf[B]);
      Found := True;
    End;
    If Not Found Then Break;
  End;
  WriteLn(LastVal);
End.

