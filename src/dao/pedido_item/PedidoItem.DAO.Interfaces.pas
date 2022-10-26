unit PedidoItem.DAO.Interfaces;

interface

uses
  Model.PedidoItem,
  Firedac.Comp.Client;

type
  iPedidoIemDAO = interface
    procedure AdicionarItem( aValue : TPedidoItemModel );

    function RecuperaTodos : TFDMemTable ;
  end;

implementation

end.
