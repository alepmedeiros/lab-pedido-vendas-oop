unit PedidoItem.Controller;

interface

uses
  System.SysUtils,
  PedidoItem.DAO.Interfaces,
  Model.interfaces.PedidoItem,
  Model.PedidoItem,
  DataModule,
  FireDac.Comp.Client,
  Data.DB,
  PedidoItem.DAO;

type
  TPedidoItemController = class (TInterfacedObject, iPedidoIemDAO)
  constructor Create;
  destructor Destroy; override;

  private
    FDAOPedidoItem : TPedidoItemDAO;
    FPedidoItem : iPedidoItem;

  public
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

implementation

{ TPedidoItemController }

procedure TPedidoItemController.AtualizarEntrada(aValorUnitario: Currency; aQuantidade, aCodPedido, aCodEntrada: integer);
begin
  FDAOPedidoItem.AtualizarEntrada(aValorUnitario, aQuantidade, aCodPedido, aCodEntrada);
end;

procedure TPedidoItemController.ConfirmaPedidoItem(aNumeroPedido: Integer);
begin
  FDAOPedidoItem.ConfirmaPedidoItem(aNumeroPedido);
end;

constructor TPedidoItemController.Create;
begin
  FDAOPedidoItem := TPedidoItemDAO.Create;
end;

destructor TPedidoItemController.Destroy;
begin
  FDAOPedidoItem.Free;

  inherited;
end;

function TPedidoItemController.RecuperaItemPedidoPorCodigo(
  aValue: integer): TFDMemTable;
begin
  Result := FDAOPedidoItem.RecuperaItemPedidoPorCodigo(aValue);
end;

function TPedidoItemController.RecuperaPorCodigo(aValue: Integer;
  aColuna: string): Variant;
begin
  Result := FDAOPedidoItem.RecuperaPorCodigo(aValue, aColuna);
end;

function TPedidoItemController.RecuperaTodos: TFDMemTable;
begin
  Result := FDAOPedidoItem.RecuperaTodos;
end;

procedure TPedidoItemController.RemoverEntrada(aCodPedido,
  aCodEntrada: integer);
begin
  FDAOPedidoItem.RemoverEntrada(aCodPedido, aCodEntrada);
end;

procedure TPedidoItemController.RemoverPedidos(aValue: integer);
begin
  FDAOPedidoItem.RemoverPedidos(aValue);
end;

procedure TPedidoItemController.RemoverPedidos(aValue: string);
begin
  FDAOPedidoItem.RemoverPedidos(aValue);
end;

procedure TPedidoItemController.AdicionarItem(aValue: TPedidoItemModel);
begin
  FDAOPedidoItem.AdicionarItem( TPedidoItemModel(FPedidoItem) );
end;

procedure TPedidoItemController.AdicionarItem(aNumPedido, aNumItemPedido,
  aQuantidade, aValorUnitario, aValorTotal: string);
begin
   FPedidoItem := TPedidoItemModel.New;

   FPedidoItem
    .NumeroPedido( StrToInt( aNumPedido ) )
    .NumeroItemPedido( StrToInt( aNumItemPedido ) )
    .Quantidade( StrToInt( aQuantidade ) )
    .ValorUnitario( StrToCurr( aValorUnitario ) )
    .ValorTotal( StrToCurr( aValorUnitario ) * StrToInt( aQuantidade ) );

   FDAOPedidoItem.AdicionarItem( TPedidoItemModel( FPedidoItem) );
end;

end.
