unit Model.Operador;

interface

uses
  Model.Interfaces.Operador;

type
  TOperadorModel = class(TInterfacedObject, iOperador)
  constructor Create;
  destructor Destroy; override;
  class function New: iOperador;

  private
    FCodigo : Integer;
    FNome   : string;

  public
    function Codigo (aValue : Integer) : iOperador; overload;
    function Codigo : integer; overload;

    function Nome (aValue : string) : iOperador; overload;
    function Nome : string; overload;
  end;

implementation

{ TOperador }

constructor TOperadorModel.Create;
begin
  
end;

destructor TOperadorModel.Destroy;
begin

  inherited;
end;

class function TOperadorModel.New: iOperador;
begin
  Result := Self.Create;
end;

function TOperadorModel.Codigo(aValue: Integer): iOperador;
begin
  Result  := Self;
  FCodigo := aValue;
end;

function TOperadorModel.Codigo: integer;
begin
  Result := FCodigo;
end;

function TOperadorModel.Nome(aValue: string): iOperador;
begin
  Result := Self;
  FNome  := aValue;
end;

function TOperadorModel.Nome: string;
begin
  Result := FNome;
end;

end.
