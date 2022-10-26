unit PedidoItem.Controller.Interfaces;

interface

implementation

uses
  Model.PedidoItem,
  FireDac.Comp.Client;

type
  iPedidoItemController = interface
    procedure AdicionarItem( aValue : TPedidoItemModel );
    function RecuperaTodos : TFDMemTable ;
  end;

end.
