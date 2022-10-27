unit Pedido.DAO.Interfaces;

interface

uses
  Model.Pedido,
  FireDAC.Comp.Client,
  Data.DB;

type
  iPedidoDAO = interface
    function NovoCodigoPedido : Variant;
    function RetornaTotalPedido( aNumPedido : integer) : Currency;

    procedure salvar( aValue: TPedidoModel);
    procedure Remover( aValue : integer);
  end;

implementation

end.
