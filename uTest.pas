unit uTest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uReflection;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  published
    { Public declarations }
    function escreva(value : String; num : Integer; maisum : String; valor : integer) : String;

    function teste(value : String; outro : String) : String;
    function numero(value : String; outro : String) : Integer;

    function variosStrings(value : String; value1 : String; value2 : String; value3 : String; value4: string) : string;


    procedure testeProcedure();
    function semparametro(): string;

  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function TForm1.escreva(value: String; num: Integer; maisum : String; valor : integer) : String;
begin
  result := value + inttostr(num) + '- ' + maisum + '-' + inttostr(valor);
end;



procedure TForm1.Button2Click(Sender: TObject);
var
  oMethod : TSmartMethod;

  oParams : TStringArray;
  resultado : variant;

begin

  oMethod  := TSmartMethod.Create('teste');
  try

    setLength(oParams, 2);
    oParams[0] := 'abcadfcadsfadsfds';
    oParams[1] := 'xyz';

    resultado := oMethod .Execute(self, oParams);
    ShowMessage(resultado);

  finally
    FreeAndNil(oMethod );
  end;

  oMethod  := TSmartMethod.Create('variosStrings');
  try
    setLength(oParams, 5);
    oParams[0] := 'denny';
    oParams[1] := 'richard';
    oParams[2] := 'san';
    oParams[3] := 'vriesman';
    oParams[4] := 'xyzasdfasfsdfdf';
    resultado := oMethod.Execute(self, oParams);
    ShowMessage(resultado);
  finally
    FreeAndNil(oMethod);
  end;



end;

function TForm1.teste(value, outro: String): String;
begin
  result := value + outro;
end;

function TForm1.variosStrings(value, value1, value2, value3,
  value4: string): string;
begin
  result := value + value1 + value2 + value3 + value4;
end;

function TForm1.numero(value, outro: String): Integer;
begin
  result := 20;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  teste : array of variant;
begin
  setLength(teste, 4);
  teste[0] := 'teste';
  teste[1] := 100;
  teste[2] := 'ab';
  teste[3] := 8;
  escreva(teste[0], teste[1], teste[2], teste[3]);
end;

procedure TForm1.testeProcedure();
var
  teste : string;
begin
  teste := 'teste';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  semparametro();
end;

function TForm1.semparametro: string;
begin
  result := 'teste';
end;

end.
