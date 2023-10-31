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
    FUsuario: iUsuarios;
  public
    class function New: iEntity;
    function Cliente: iCliente;
    function Produtos: iProdutos;
    function Pedidos: iPedidos;
    function PedidoItens: iPedidoItens;
    function Usuarios: iUsuarios;
  end;

implementation

uses
  mvclive.model.entity.impl.Cliente,
  mvclive.model.entity.impl.PedidoItens,
  mvclive.model.entity.impl.Pedidos,
  mvclive.model.entity.impl.Produtos,
  mvclive.model.entity.impl.Usuarios;

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

function TEntity.Usuarios: iUsuarios;
begin
  if not Assigned(FUsuario) then
    FUsuario := TUsuarios.New;
  Result := FUsuario;
end;

end.
