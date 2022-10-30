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
    procedure RemoverEntrada( aCodPedido, aCodEntrada: integer);
    procedure ConfirmaPedidoItem(NumeroPedido: Integer);
    procedure AtualizarEntrada(aValorUnitario: Currency; aQuantidade, aCodPedido, aCodEntrada: integer);

    function RecuperaTodos : TFDMemTable ;
    function RecuperaItemPedidoPorCodigo( aValue : integer ) : TFDMemTable;
    function RecuperaPorCodigo( aValue: Integer; aColuna : string ) : Variant;
  end;

end.
