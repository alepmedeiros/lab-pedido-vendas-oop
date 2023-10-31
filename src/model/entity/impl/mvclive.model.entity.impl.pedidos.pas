unit mvclive.model.entity.impl.pedidos;

interface

uses
  System.SysUtils,
  mvclive.utils.impl.atributos,
  mvclive.model.entity.interfaces;

type

  [Tablea('PEDIDOS')]
  TPedidosModel = class(TInterfacedObject, iPedidosModel)
  private
    [Campo('NUMEROPEDIDO'), PK]
    FNumeroPedido: Integer;
    [Campo('DATAEMISSAO')]
    FDataEmissao: TDateTime;
    [Campo('CODIGO_CLIENTE'), FK]
    FCodigoCliente: Integer;
    [Campo('VALORTOTAL')]
    FValorTotal: Currency;
  public
    class function New: iPedidosModel;
    function SetNumeroPedido(const Value: Integer): iPedidosModel;
    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function SetCodigoCliente(const Value: Integer): iPedidosModel;
    function GetCodigoCliente: Integer;
    function SetValorTotal(const Value: Currency): iPedidosModel;
    function GetValorTotal: Currency;
  end;

implementation

function TPedidosModel.GetCodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedidosModel.GetDataEmissao: TDateTime;
begin
  FDataEmissao := Now;
  Result := FDataEmissao;
end;

function TPedidosModel.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidosModel.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

class function TPedidosModel.New: iPedidosModel;
begin
  Result := Self.Create;
end;

function TPedidosModel.SetCodigoCliente(const Value: Integer): iPedidosModel;
begin
  Result := Self;

  if not(Value > 0) then
    raise Exception.Create
      ('Pedido não pode ser realizado sem um cliente vinculado');

  FCodigoCliente := Value;
end;

function TPedidosModel.SetNumeroPedido(const Value: Integer): iPedidosModel;
begin
  Result := Self;
  FNumeroPedido := Value;
end;

function TPedidosModel.SetValorTotal(const Value: Currency): iPedidosModel;
begin
  Result := Self;
  FValorTotal := Value;
end;

end.
