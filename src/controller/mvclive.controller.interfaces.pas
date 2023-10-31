unit mvclive.controller.interfaces;

interface

uses
  mvclive.dto.interfaces;

type
  iController = interface
    function Usuairos: iUsuarios;
    function Cliente: iCliente;
    function Produto: iProdutos;
    function Pedidos: iPedidos;
    function PedidoItens: iPedidoItens;
  end;

implementation

end.
