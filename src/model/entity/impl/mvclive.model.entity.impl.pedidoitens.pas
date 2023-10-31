unit mvclive.model.entity.impl.pedidoitens;

interface

uses
  mvclive.utils.impl.atributos,
  mvclive.model.entity.interfaces;

type
  [Tabela('ITENSPEDIDO')]
  TPedidoItensModel = class(TInterfacedObject, iPedidoItensModel)
  private
    [Campo('CODIGO'), PK]
    FId: Integer;
    [Campo('NUMERO_PEDIDO'), FK]
    FNumeroPedido: Integer;
    [Campo('CODIGO_PRODUTO'), FK]
    FCodigoProduto: Integer;
    [Campo('QUANTIDADE')]
    FQuantidade: Integer;
    [Campo('VALORUNITARIO')]
    FValorUnitario: Currency;
    [Campo('VALORTOTAL')]
    FValorTotal: Currency;
  public
    class function New: iPedidoItensModel;
    function SetId(const Value: Integer): iPedidoItensModel;
    function GetId: Integer;
    function SetNumeroPedido(const Value: Integer): iPedidoItensModel;
    function GetNumeroPedido: Integer;
    function SetCodigoProduto(const Value: Integer): iPedidoItensModel;
    function GetCodigoProduto: Integer;
    function SetQuantidade(const Value: Integer): iPedidoItensModel;
    function GetQuantidade: Integer;
    function SetValorUnitario(const Value: Currency): iPedidoItensModel;
    function GetValorUnitario: Currency;
    function SetValorTotal(const Value: Currency): iPedidoItensModel;
    function GetValorTotal: Currency;
  end;

implementation

function TPedidoItensModel.GetCodigoProduto: Integer;
begin
  Result := FCodigoProduto;
end;

function TPedidoItensModel.GetId: Integer;
begin
  Result := FId;
end;

function TPedidoItensModel.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidoItensModel.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

function TPedidoItensModel.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TPedidoItensModel.GetValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

class function TPedidoItensModel.New: iPedidoItensModel;
begin
  Result := Self.Create;
end;

function TPedidoItensModel.SetCodigoProduto(const Value: Integer): iPedidoItensModel;
begin
  Result := Self;
  FCodigoProduto := Value;
end;

function TPedidoItensModel.SetId(const Value: Integer): iPedidoItensModel;
begin
  Result := Self;
  FId := Value;
end;

function TPedidoItensModel.SetNumeroPedido(const Value: Integer): iPedidoItensModel;
begin
  Result := Self;
  FNumeroPedido := Value;
end;

function TPedidoItensModel.SetQuantidade(const Value: Integer): iPedidoItensModel;
begin
  Result := Self;
  FQuantidade := Value;
end;

function TPedidoItensModel.SetValorTotal(const Value: Currency): iPedidoItensModel;
begin
  Result := Self;
  FValorTotal := Value;
end;

function TPedidoItensModel.SetValorUnitario(const Value: Currency): iPedidoItensModel;
begin
  Result := Self;
  FValorUnitario := Value;
end;

end.
