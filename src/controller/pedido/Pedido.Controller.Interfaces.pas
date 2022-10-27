unit Pedido.Controller.Interfaces;

interface

uses
  Model.Pedido,
  Firedac.Comp.Client;

type
  iPedidoController = interface
    function NovoCodigoPedido : Variant;

    procedure Salvar( aValue: TPedidoModel );
    procedure Remover( aValue: integer );
  end;

implementation

end.
