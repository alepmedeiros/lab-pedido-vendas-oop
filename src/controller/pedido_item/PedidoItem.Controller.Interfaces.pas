unit PedidoItem.Controller.Interfaces;

interface

implementation

uses
  Model.PedidoItem,
  FireDac.Comp.Client;

type
  iPedidoItemController = interface
    procedure AdicionarItem( aValue : TPedidoItemModel );
    procedure RemoverPedidos( aValue: integer );

    function RecuperaTodos : TFDMemTable ;
    function RecuperaItemPedidoPorCodigo( aValue : integer ) : TFDMemTable;
  end;

end.
