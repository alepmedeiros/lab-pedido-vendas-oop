unit mvclive.controller.impl.controller;

interface

uses
  mvclive.controller.interfaces,
  mvclive.model.entity.interfaces,
  mvclive.model.dao.interfaces,
  mvclive.dto.interfaces;

type
  TController = class(TInterfacedObject, iController)
  private
    Fusuarios: iUsuarios;
    FCliente: iCliente;
    FProduto: iProdutos;
    FPedidos: iPedidos;
    FPedidoItens: iPedidoItens;
  public
    class function New: iController;
    function Usuairos: iUsuarios;
    function Cliente: iCliente;
    function Produto: iProdutos;
    function Pedidos: iPedidos;
    function PedidoItens: iPedidoItens;
  end;

implementation

uses
  mvclive.dto.impl.usuarios,
  mvclive.dto.impl.Cliente, mvclive.dto.impl.pedidoitens,
  mvclive.dto.impl.pedidos, mvclive.dto.impl.produtos;

function TController.Cliente: iCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TCliente.New;
  Result := FCliente;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.PedidoItens: iPedidoItens;
begin
  if not Assigned(FPedidoItens) then
    FPedidoItens := TPedidoItens.New;
  Result := FPedidoItens;
end;

function TController.Pedidos: iPedidos;
begin
  if not Assigned(FPedidos) then
    FPedidos := TPedidos.New;
  Result := FPedidos;
end;

function TController.Produto: iProdutos;
begin
  if not Assigned(FProduto) then
    FProduto := TProdutos.New;
  Result := FProduto;
end;

function TController.Usuairos: iUsuarios;
begin
  if not Assigned(Fusuarios) then
    Fusuarios := TUsuarios.New;
  Result := Fusuarios;
end;

end.
