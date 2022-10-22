unit Model.Pedido;

interface

uses
  Model.Interfaces.Pedido;

type
  TPedidoModel = class(TInterfacedObject, iPedido)
  constructor Create;
  destructor Destroy; overload;
  class function New: iPedido;

  private
    { private declarations }
    FNumeroPedido  : Integer;
    FDataEmissao   : TDateTime;
    FCodigoCliente : Integer;
    FValorTotal    : Currency;
    FStatus        : string;

  public
    { public declarations }
    function NumeroPedido (aValue : Integer) : iPedido; overload;
    function NumeroPedido : Integer; overload;

    function CodigoCliente (aValue : Integer) : iPedido; overload;
    function CodigoCliente : Integer; overload;

    function DataEmissao (aValue : TDateTime) : iPedido; overload;
    function DataEmissao : TDateTime; overload;

    function ValorTotal (aValue : currency) : iPedido; overload;
    function ValorTotal : currency; overload;

    function Status (aValue : string) : iPedido; overload;
    function Status : string; overload;

  end;

implementation

{ TPedido }

constructor TPedidoModel.Create;
begin

end;

destructor TPedidoModel.Destroy;
begin

  inherited;
end;

class function TPedidoModel.New: iPedido;
begin
  Result := Self.Create;
end;

function TPedidoModel.CodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedidoModel.CodigoCliente(aValue: Integer): iPedido;
begin
  Result := Self;
  FCodigoCliente := aValue;
end;

function TPedidoModel.DataEmissao(aValue: TDateTime): iPedido;
begin
  Result := Self;
  FDataEmissao := aValue;
end;

function TPedidoModel.DataEmissao: TDateTime;
begin
  Result := FDataEmissao;
end;

function TPedidoModel.NumeroPedido(aValue: Integer): iPedido;
begin
  Result := Self;
  FNumeroPedido := aValue;
end;

function TPedidoModel.NumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidoModel.Status: string;
begin
  Result := FStatus;
end;

function TPedidoModel.Status(aValue: string): iPedido;
begin
  Result  := Self;
  FStatus := aValue;
end;

function TPedidoModel.ValorTotal: currency;
begin
  Result := FValorTotal;
end;

function TPedidoModel.ValorTotal(aValue: currency): iPedido;
begin
  Result := Self;
  FValorTotal := aValue;
end;

end.
