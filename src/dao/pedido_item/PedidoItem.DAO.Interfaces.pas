unit PedidoItem.DAO.Interfaces;

interface

uses
  Model.PedidoItem,
  Firedac.Comp.Client;

type
  iPedidoIemDAO = interface
    function RecuperaTodos : TFDMemTable ;
  end;

implementation

end.
