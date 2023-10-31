unit mvclive.dto.impl.pedidoitens;

interface

uses
  mvclive.dto.interfaces,
  mvclive.model.entity.interfaces,
  mvclive.model.dao.interfaces;

type
  TPedidoItens = class(TInterfacedObject, iPedidoItens)
  private
    FPedidoItens: iPedidoItensModel;

    constructor Create;
  public
    class function New: iPedidoItens;

    function SetId(const Value: Integer): iPedidoItens;
    function GetId: Integer;
    function SetNumeroPedido(const Value: Integer): iPedidoItens;
    function GetNumeroPedido: Integer;
    function SetCodigoProduto(const Value: Integer): iPedidoItens;
    function GetCodigoProduto: Integer;
    function SetQuantidade(const Value: Integer): iPedidoItens;
    function GetQuantidade: Integer;
    function SetValorUnitario(const Value: Currency): iPedidoItens;
    function GetValorUnitario: Currency;
    function SetValorTotal(const Value: Currency): iPedidoItens;
    function GetValorTotal: Currency;
    function Build: iDAO;
  end;

implementation

uses
  mvclive.model.dao.impl.daogenerico, mvclive.model.entity.impl.pedidoitens;

function TPedidoItens.Build: iDAO;
begin
  Result := TDAO.New(FPedidoItens);
end;

constructor TPedidoItens.Create;
begin
  FPedidoItens := TPedidoItensModel.NEw;
end;

function TPedidoItens.GetCodigoProduto: Integer;
begin
  Result := FPedidoItens.GetCodigoProduto;
end;

function TPedidoItens.GetId: Integer;
begin
  Result := FPedidoItens.GetId;
end;

function TPedidoItens.GetNumeroPedido: Integer;
begin
  Result := FPedidoItens.GetNumeroPedido;
end;

function TPedidoItens.GetQuantidade: Integer;
begin
  Result := FPedidoItens.GetQuantidade;
end;

function TPedidoItens.GetValorTotal: Currency;
begin
  Result := FPedidoItens.GetValorTotal;
end;

function TPedidoItens.GetValorUnitario: Currency;
begin
  Result := FPedidoItens.GetValorUnitario;
end;

class function TPedidoItens.New: iPedidoItens;
begin
  Result := Self.Create;
end;

function TPedidoItens.SetCodigoProduto(const Value: Integer): iPedidoItens;
begin
  Result := Self;
  FPedidoItens.SetCodigoProduto(Value);
end;

function TPedidoItens.SetId(const Value: Integer): iPedidoItens;
begin
  Result := Self;
  FPedidoItens.SetId(Value);
end;

function TPedidoItens.SetNumeroPedido(const Value: Integer): iPedidoItens;
begin
  Result := Self;
  FPedidoItens.SetNumeroPedido(Value);
end;

function TPedidoItens.SetQuantidade(const Value: Integer): iPedidoItens;
begin
  Result := Self;
  FPedidoItens.SetQuantidade(Value);
end;

function TPedidoItens.SetValorTotal(const Value: Currency): iPedidoItens;
begin
  Result := Self;
  FPedidoItens.SetValorTotal(Value);
end;

function TPedidoItens.SetValorUnitario(const Value: Currency): iPedidoItens;
begin
  Result := Self;
  FPedidoItens.SetValorUnitario(Value);
end;

end.
