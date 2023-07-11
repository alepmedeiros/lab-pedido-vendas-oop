unit mvclive.model.entity.impl.entity;

interface

uses
  mvclive.model.entity.interfaces;

type
  TEntity = class(TInterfacedObject, iEntity)
  private
    FCliente: iCliente;
    FProdutos: iProdutos;
    FPedidos: iPedidos;
    FPedidoItens: iPedidoItens;
  public
    class function New: iEntity;
    function Cliente: iCliente;
    function Produtos: iProdutos;
    function Pedidos: iPedidos;
    function PedidoItens: iPedidoItens;
  end;

implementation

uses
  mvclive.model.entity.impl.Cliente,
  mvclive.model.entity.impl.PedidoItens,
  mvclive.model.entity.impl.Pedidos,
  mvclive.model.entity.impl.Produtos;

function TEntity.Cliente: iCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TCliente.New;
  Result := FCliente;
end;

class function TEntity.New: iEntity;
begin
  Result := Self.Create;
end;

function TEntity.PedidoItens: iPedidoItens;
begin
  if not Assigned(FPedidoItens) then
    FPedidoItens := TPedidoItens.New;
  Result := FPedidoItens;
end;

function TEntity.Pedidos: iPedidos;
begin
  if not Assigned(FPedidos) then
    FPedidos := TPedidos.New;
  Result := FPedidos;
end;

function TEntity.Produtos: iProdutos;
begin
  if not Assigned(FProdutos) then
    FProdutos := TProdutos.New;
  Result := FProdutos;
end;

end.
