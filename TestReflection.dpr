program TestReflection;

uses
  Forms,
  uTest in 'uTest.pas' {Form1},
  uReflection in 'uReflection.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
