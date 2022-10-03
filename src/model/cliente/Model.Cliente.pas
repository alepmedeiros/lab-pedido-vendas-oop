unit Model.Cliente;

interface

uses
  Model.Interfaces.Cliente;

type
  TClienteModel = class(TInterfacedObject, iCliente)
  constructor Create;
  destructor Destroy; override;
  class function New: iCliente;

  private
    { private declarations }
    FCodigo : integer;
    FNome   : string;
    FCidade : string;
    FUF     : string;

  public
    { public declarations }
    function Codigo (aValue : integer) : iCliente; overload;
    function Codigo : integer; overload;

    function Nome (aValue : string) : iCliente; overload;
    function Nome : string; overload;

    function Cidade (aValue : string) : iCliente; overload;
    function Cidade : string; overload;

    function UF (aValue : string) : iCliente; overload;
    function UF : string; overload;

  end;

implementation

{ TClienteModel }

// Generics/Injeção de Dependência: (27:00) https://youtu.be/UkRXFoQGYi0

constructor TClienteModel.Create;
begin

end;

destructor TClienteModel.Destroy;
begin

  inherited;
end;

class function TClienteModel.New: iCliente;
begin
  Result := Self.Create;
end;

function TClienteModel.Codigo(aValue: integer): iCliente;
begin
  Result  := Self;
  FCodigo := aValue;
end;

function TClienteModel.Cidade(aValue: string): iCliente;
begin
  Result  := Self;
  FCidade := aValue;
end;

function TClienteModel.Nome(aValue: string): iCliente;
begin
  Result := Self;
  FNome  := aValue;
end;

function TClienteModel.UF(aValue: string): iCliente;
begin
  Result := Self;
  FUF    := aValue;
end;

function TClienteModel.Codigo: integer;
begin
  Result := FCodigo;
end;

function TClienteModel.Cidade: string;
begin
  Result := FCidade;
end;

function TClienteModel.Nome: string;
begin
  Result := FNome;
end;

function TClienteModel.UF: string;
begin
  Result := FUF;
end;

end.
