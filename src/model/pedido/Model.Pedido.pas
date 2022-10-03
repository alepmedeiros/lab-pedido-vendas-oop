unit Model.Pedido;

interface

uses
  Model.Interfaces.Pedido;

type
  TPedido = class(TInterfacedObject, iPedido)
  constructor Create;
  destructor Destroy; overload;
  class function New: iPedido;

  private
    { private declarations }
    FNumeroPedido  : Integer;
    FDataEmissao   : TDateTime;
    FCodigoCliente : Integer;
    FValorTotal    : Currency;

  public
    { public declarations }
    function NumeroPedido (aValue : Integer) : iPedido; overload;
    function NumeroPedido : Integer; overload;

    function DataEmissao (aValue : TDateTime) : iPedido; overload;
    function DataEmissao : TDateTime; overload;

    function CodigoCliente (aValue : Integer) : iPedido; overload;
    function CodigoCliente : Integer; overload;

    function ValorTotal (aValue : currency) : iPedido; overload;
    function ValorTotal : currency; overload;

  end;

implementation

{ TPedido }

constructor TPedido.Create;
begin

end;

destructor TPedido.Destroy;
begin

  inherited;
end;

class function TPedido.New: iPedido;
begin
  Result := Self.Create;
end;

function TPedido.CodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedido.CodigoCliente(aValue: Integer): iPedido;
begin
  Result := Self;
  FCodigoCliente := aValue;
end;

function TPedido.DataEmissao(aValue: TDateTime): iPedido;
begin
  Result := Self;
  FDataEmissao := aValue;
end;

function TPedido.DataEmissao: TDateTime;
begin
  Result := FDataEmissao;
end;

function TPedido.NumeroPedido(aValue: Integer): iPedido;
begin
  Result := Self;
  FNumeroPedido := aValue;
end;

function TPedido.NumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedido.ValorTotal: currency;
begin
  Result := FValorTotal;
end;

function TPedido.ValorTotal(aValue: currency): iPedido;
begin
  Result := Self;
  FValorTotal := aValue;
end;

end.
