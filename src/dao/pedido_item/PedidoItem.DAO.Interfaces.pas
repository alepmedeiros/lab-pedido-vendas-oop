unit PedidoItem.DAO.Interfaces;

interface

uses
  Model.PedidoItem,
  Firedac.Comp.Client;

type
  iPedidoIemDAO = interface
    procedure AdicionarItem( aValue : TPedidoItemModel );
    procedure RemoverPedidos( aValue: integer );

    function RecuperaTodos : TFDMemTable ;
    function RecuperaItemPedidoPorCodigo( aValue : integer ) : TFDMemTable;
  end;

implementation

end.
