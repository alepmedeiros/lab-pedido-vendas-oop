unit PedidoItem.DAO.Interfaces;

interface

uses
  Model.PedidoItem,
  Firedac.Comp.Client;

type
  iPedidoIemDAO = interface
    procedure AdicionarItem( aValue : TPedidoItemModel ); overload;
    procedure AdicionarItem( aNumPedido, aNumItemPedido, aQuantidade, aValorUnitario, aValorTotal : string ); overload;

    procedure RemoverPedidos( aValue: integer ); overload;
    procedure RemoverPedidos( aValue: string ); overload;

    procedure RemoverEntrada( aCodPedido, aCodEntrada: integer);
    procedure ConfirmaPedidoItem(NumeroPedido: Integer);
    procedure AtualizarEntrada(aValorUnitario: Currency; aQuantidade, aCodPedido, aCodEntrada: integer);

    function RecuperaTodos : TFDMemTable ;
    function RecuperaItemPedidoPorCodigo( aValue : integer ) : TFDMemTable;
    function RecuperaPorCodigo( aValue: Integer; aColuna : string ) : Variant;
  end;

implementation

end.
