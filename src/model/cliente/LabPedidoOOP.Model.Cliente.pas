unit LabPedidoOOP.Model.Cliente;

interface

uses
  LabPedidoOOP.Model.Interfaces.Cliente;

type
  TCliente = class(TInterfacedObject, iCliente)
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

{ TCliente }

// Generics/Injeção de Dependência: (27:00) https://youtu.be/UkRXFoQGYi0

constructor TCliente.Create;
begin

end;

destructor TCliente.Destroy;
begin

  inherited;
end;

class function TCliente.New: iCliente;
begin
  Result := Self.Create;
end;

function TCliente.Codigo(aValue: integer): iCliente;
begin
  Result  := Self;
  FCodigo := aValue;
end;

function TCliente.Cidade(aValue: string): iCliente;
begin
  Result  := Self;
  FCidade := aValue;
end;

function TCliente.Nome(aValue: string): iCliente;
begin
  Result := Self;
  FNome  := aValue;
end;

function TCliente.UF(aValue: string): iCliente;
begin
  Result := Self;
  FUF    := aValue;
end;

function TCliente.Codigo: integer;
begin
  Result := FCodigo;
end;

function TCliente.Cidade: string;
begin
  Result := FCidade;
end;

function TCliente.Nome: string;
begin
  Result := FNome;
end;

function TCliente.UF: string;
begin
  Result := FUF;
end;

end.
