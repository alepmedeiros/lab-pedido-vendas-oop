unit Pedido.Controller.Interfaces;

interface

uses
  Model.Pedido,
  Firedac.Comp.Client;

type
  iPedidoController = interface
    function NovoCodigoPedido : Variant;
    function RetornaTotalPedido(aNumPedido: integer): Currency;

    procedure Salvar( aValue: TPedidoModel );
    procedure Remover( aValue: integer );
    procedure AtualizarTotalPedido(valorTotalPedido: Currency; NumeroPedido: integer);
    procedure ConfirmaPedido(NumeroPedido: Integer);
  end;

implementation

end.
