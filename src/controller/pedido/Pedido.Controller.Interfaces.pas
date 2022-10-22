unit Pedido.Controller.Interfaces;

interface

uses
  Model.Pedido,
  Firedac.Comp.Client;

type
  iPedidoController = interface
    procedure Salvar( aValue: TPedidoModel );
    procedure Remover( aValue: integer );
  end;

implementation

end.
