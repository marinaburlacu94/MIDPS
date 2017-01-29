program Calculator;

uses
  Forms,
  MainUnit_v1 in 'MainUnit_v1.pas' {MainForm1},
  MainUnit_v2 in 'MainUnit_v2.pas' {MainForm2};

{$R *.RES}

begin
  Application.Initialize;
  MainForm1:=TMainForm1.Create(nil); MainForm1.ShowModal;
  MainForm2:=TMainForm2.Create(nil); MainForm2.ShowModal;
  Application.Run;
end.

