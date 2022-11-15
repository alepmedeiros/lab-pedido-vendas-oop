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
      function RecuperaTodos: TFDMemTable;
      function PedidoEmAndamento: Boolean;
      function VerificaSeExiste(aValue: integer): Boolean;

      procedure salvar( aValue : TPedidoModel);
      procedure Remover( aValue: integer ); overload;
      procedure Remover( aStatus: string ); overload;
      procedure Remover( aValue: integer; aStatus: string ); overload;
      procedure AtualizarTotalPedido( valorTotalPedido: Currency; NumeroPedido: integer );
      procedure ConfirmaPedido( NumeroPedido : Integer );
  end;

implementation

end.
