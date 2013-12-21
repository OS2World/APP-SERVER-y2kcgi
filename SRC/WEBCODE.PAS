Unit Webcode;
{
Lord and Pipe color code unit for the WWW

Written by Stewart Honsberger

Originally Written: 1/6/1998

Last Modified: 11/10/1998
}
INTERFACE

Procedure What(Thestring: String);
Procedure WhatLn(Thestring: String);

IMPLEMENTATION

var
  S: String;
  IsOpen: Boolean;

Procedure Lord;
Var
  C: Char;
  Blah: String;
Begin
  while (Length(S) >= 1) AND (S[1] <> '|') do
  begin
    if S[1] = '`' then
    begin
      Blah := Copy(S,2,1);
      C := Blah[1];
      if IsOpen then Write('</FONT>') else IsOpen := TRUE;
      if Length(S) >= 1 Then
      begin
        case C Of
          '1': Write('<FONT COLOR="#0000AA">');
          '2': Write('<FONT COLOR="#00AA00">');
          '3': Write('<FONT COLOR="#00CCEE">');
          '4': Write('<FONT COLOR="#AA0000">');
          '5': Write('<FONT COLOR="#CC33CC">');
          '6': Write('<FONT COLOR="#AA6600">');
          '7': Write('<FONT COLOR="#CCCCCC">');
          '8': Write('<FONT COLOR="#666666">');
          '9': Write('<FONT COLOR="#0000FF">');
          '0': Write('<FONT COLOR="#00FF00">');
          '!': Write('<FONT COLOR="#00FFFF">');
          '@': Write('<FONT COLOR="#FF0000">');
          '#': Write('<FONT COLOR="#FF00FF">');
          '$': Write('<FONT COLOR="#FFFF00">');
          '%': Write('<FONT COLOR="#FFFFFF">');
          else
          begin
            Write(S[1] + S[2]);
            IsOpen := FALSE;
          end;
        end;
      end;
      Delete(S, 1, 2);
    end else
    begin
      Write(S[1]);
      Delete(S, 1, 1);
    end;
  end;
end;

Procedure Pipe;
Var
   B: Byte;
   C,
   {$IFDEF MSDOS}
   I: Integer;
   {$ELSE}
   I: Longint;
   {$ENDIF}
   Blah: String;
Begin
  B:=1;
  while (B <= Length(S)) AND ((S[B + 1] <> '`') AND (S[B] <> '`')) do
  begin
    if S[B] = '|' then
    begin
      Inc(B);
      Blah := Copy(S,B,2);
      Val(Blah, C, I);
      if IsOpen then Write('</FONT>') else IsOpen := TRUE;
      if B <= Length(S) Then
      begin
        case C Of
          1 : Write('<FONT COLOR="#0000AA">');
          2 : Write('<FONT COLOR="#00AA00">');
          3 : Write('<FONT COLOR="#00CCEE">');
          4 : Write('<FONT COLOR="#AA0000">');
          5 : Write('<FONT COLOR="#CC33CC">');
          6 : Write('<FONT COLOR="#AA6600">');
          7 : Write('<FONT COLOR="#CCCCCC">');
          8 : Write('<FONT COLOR="#666666">');
          9 : Write('<FONT COLOR="#0000FF">');
         10 : Write('<FONT COLOR="#00FF00">');
         11 : Write('<FONT COLOR="#00FFFF">');
         12 : Write('<FONT COLOR="#FF0000">');
         13 : Write('<FONT COLOR="#FF00FF">');
         14 : Write('<FONT COLOR="#FFFF00">');
         15 : Write('<FONT COLOR="#FFFFFF">');
         else
         begin
           Write(Copy(S, B - 1, 3));
           IsOpen := FALSE;
         end;
      end;
      Inc(B, 2);
      end;
    end else
    begin
      Write(S[B]);
      Inc(B);
    end;
  end;
  Delete(S, 1, B - 1);
end;

Procedure What(Thestring: String);
begin
  IsOpen := False;
  S := Thestring;
  While Length(S) > 0 do
  begin
    If S[1] = '|' then Pipe
    else if S[1] = '`' then Lord
    else
    begin
      Write(S[1]);
      Delete(S, 1, 1);
    end;
  end;
  if IsOpen then Write('</FONT>');
end;

Procedure WhatLn(Thestring: String);
begin
  What(Thestring);
  WriteLn('<BR>');
end;

begin
end.
