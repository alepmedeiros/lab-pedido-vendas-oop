unit PedidoItem.Controller.Interfaces;

interface

implementation

uses
  Model.PedidoItem,
  FireDac.Comp.Client;

type
  iPedidoItemController = interface
    procedure AdicionarItem( aValue : TPedidoItemModel ); overload;
    procedure AdicionarItem( aNumPedido, aNumItemPedido, aQuantidade, aValorUnitario, aValorTotal : string ); overload;

    procedure RemoverPedidos( aValue: integer ); overload;
    procedure RemoverPedidos(aValue: string); overload;

    procedure RemoverEntrada( aCodPedido, aCodEntrada: integer);
    procedure ConfirmaPedidoItem(aNumeroPedido: Integer);
    procedure AtualizarEntrada(aValorUnitario: Currency; aQuantidade, aCodPedido, aCodEntrada: integer);

    function RecuperaTodos : TFDMemTable ;
    function RecuperaItemPedidoPorCodigo( aValue : integer ) : TFDMemTable;
    function RecuperaPorCodigo( aValue: Integer; aColuna : string ) : Variant;
  end;

end.
