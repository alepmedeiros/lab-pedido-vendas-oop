unit PedidoItem.Controller.Interfaces;

interface

implementation

uses
  Model.PedidoItem,
  FireDac.Comp.Client;

type
  iPedidoItemController = interface
    function RecuperaTodos : TFDMemTable ;
  end;

end.
