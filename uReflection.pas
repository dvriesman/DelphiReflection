unit uReflection;

interface

uses Sysutils;

 type TStringArray = array of string;
type
  TSmartMethod = class
  private
    FsMethodName : String;
  public
    constructor Create(psMethodName : String);
    function Execute(poObject: TObject; paParams : TStringArray) : variant;
  end;

implementation

{ TReflection }

constructor TSmartMethod.Create(psMethodName : String);
begin
  FsMethodName :=  psMethodName;
end;

function TSmartMethod.Execute(poObject: TObject;
  paParams: TStringArray) : variant;
var
  oMethod : Pointer;
  i : integer;
  nSize : Integer;
  oResult : string;
  valueAdress : Pointer;
begin

  oMethod := poObject.MethodAddress(FsMethodName);
  nSize := length(paParams);
  if nSize > 2 then
  begin
    for i := 2 to nSize-1 do
    begin
      valueAdress := Pointer(paParams[i]);
      asm
        push valueAdress
      end;
    end;
  end;
  asm
    lea eax, oResult
    push eax
  end;
  valueAdress := Pointer(paParams[1]);
  asm
    mov ecx, valueAdress;
  end;
  valueAdress := Pointer(paParams[0]);
  asm
    mov edx, valueAdress;
    mov eax, ebx
    call oMethod;
  end;
  result := oResult;
end;

end.
