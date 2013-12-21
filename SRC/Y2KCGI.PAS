Program Dy2kcgi;
{
        Program to display the info until the year 2000
        in CGI format.
        July 10 1998
}
Uses
  Dos,
  WebCode;              {Pipe routines for CGI}

Const
  Version = '1.02';
  Compdate = '05/12/1999';
  {$IFDEF OS2}
  ostype = 'OS2';
  {$ENDIF}
  {$IFDEF WIN32}
  ostype = 'WIN32';
  {$ENDIF}
  {$IFDEF MSDOS}
  ostype = 'DOS';
  {$ENDIF}
  {$IFDEF LINUX}
  ostype = 'Linux';
  {$ENDIF}
Var
  Y2K: Longint;
  Days: Longint;
  Today: Longint;
  {$IFDEF MSDOS}
  Y, M, D, H, Min, Sec: Word;
  {$ENDIF}
  {$IFDEF LINUX}
  Y, M, D, H, Min, Sec: Word;
  {$ENDIF}
  {$IFDEF OS2}
  Y, M, D, H, Min, Sec: LongInt;
  {$ENDIF}
  {$IFDEF WIN32}
  Y, M, D, H, Min, Sec: LongInt;
  {$ENDIF}
  Ch: Char;

function itos(n: longint): string;
var s: string;
begin
  str(n, S);
  ItoS:=S;
end;

Procedure DoDays;
Const
  DaysPerMonth :
    Array[1..12] of ShortInt = (031,028,031,030,031,030,031,031,030,031,030,031);
var
  {$IFDEF OS2}
  Y, M, D, Dow, H, Min, Sec, Hund: LongInt;
  {$ENDIF}
  {$IFDEF WIN32}
  Y, M, D, Dow, H, Min, Sec, Hund: LongInt;
  {$ENDIF}
  {$IFDEF MSDOS}
  Y, M, D, Dow, H, Min, Sec, Hund: Word;
  {$ENDIF}
  {$IFDEF LINUX}
  Y, M, D, Dow, H, Min, Sec, Hund: Word;
  {$ENDIF}
begin
  GetDate(Y, M, D, Dow);
  GetTime(H, Min, Sec, Hund);
  if Y >= 2000 then
  begin
    WhatLn('<CENTER>|12PANIC|04!!!! |12I|04t''s |12a|04lready |12h|04ere|07! |12W|04e''re |12a|04ll |12DEAD|04!</CENTER>');
    WriteLn('<BR>');
    WhatLn('<CENTER>|15Just kidding :></CENTER>');
    WriteLn('<BR>');
    WhatLn('<CENTER>|12I|04f |12y|04ou''re |12r|04eading |12t|04his|07, |12y|04ou |12m|04ustn''t |12b|04e |12u|04sing |12a ' +
            '<BR> M|04icrosoft |12OS|07! </CENTER> <BR>');
    WhatLn('<CENTER>|12G|04ood |12f|04or |12y|04ou|07!</CENTER>');
    WriteLn('<BR>');
    Exit;
  end else
  begin
    WhatLn('         |12T|04here |12a|04re|07 |12c|04urrently|07: |07');
    WriteLn('<BR> <BR>');
    Write('         ');
    Write(ItoS(1999 - Y));
    What(' |12Y|04ears|07, |07');
    Write(ItoS((1999 - Y) * 12 + (12 - M)));
    What(' |12M|04onths|07, |07');
    Write(ItoS(DaysPerMonth[M] - D));
    What(' |12D|04ays|07, |07');
    Write(ItoS(23 - H));
    What(' |12H|04ours|07, |07');
    Write(ItoS(59 - Min));
    What(' |12M|04inutes|07, |12a|04nd |07');
    Write(ItoS(59 - Sec));
    WhatLn(' |12S|04econds <BR>');
    WriteLN('<BR>');
    WhatLn('<CENTER>|12u|04ntil |12J|04anuary |121|04st|07, |102000</CENTER>');
    WriteLN('<BR>');
  end;
end;

begin
  writeln('Content-type: text/html');
  writeln;
  WriteLn('<HTML>');
  WriteLn('<TITLE>Days until the year 2000 V' + Version + '/' + ostype + '</TITLE>');
  WriteLn('<BODY>');
  WriteLn('<BODY BGCOLOR="#000000" TEXT="#FFFFFF" LINK="#FF0000" VLINK="#0000FF" ALINK="#FF00FF">');
  WriteLn('<FONT COLOR="Cyan">');
  WriteLn('<BR>');
  DoDays;
  WriteLn('<BR><BR>');
  Write('<FONT COLOR="Yellow">Written by: Shawn ''<A HREF="');
  WriteLn('http://tinys.cx/cgi-bin/email.exe?tiny">Tiny</A>'' Highfield<BR>');
  WriteLn('<A HREF="http://move.to/tinys/">Other Tinysoft Programs</A>');
  WriteLn('</BODY> </HTML>');
end.
