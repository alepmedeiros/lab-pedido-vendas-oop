unit Pedido.DAO.Interfaces;

interface

uses
  Model.Pedido,
  FireDAC.Comp.Client,
  Data.DB;

type
  iPedidoDAO = interface
    function NovoCodigoPedido : Variant;

    procedure salvar( aValue: TPedidoModel);
    procedure Remover( aValue : integer);
  end;

implementation

end.
