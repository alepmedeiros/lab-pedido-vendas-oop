unit Pedido.Controller;

interface

uses
  Pedido.Controller.Interfaces,
  Model.Interfaces.Pedido,
  Model.Pedido,
  DataModule,
  Firedac.Comp.Client,
  Data.DB,
  Pedido.DAO;

type
  TPedidoController = class(TInterfacedObject, iPedidoController)
  constructor Create;
  destructor Destroy; override;

  private
    FDAOPedido : TPedidoDAO;
    FPedido : iPedido;

  public
    function NovoCodigoPedido : Variant;
    function RetornaTotalPedido(aNumPedido: integer): Currency;
    function RecuperaTodos: TFDMemTable;
    function PedidoEmAndamento: Boolean;

    procedure Salvar( aValue: TPedidoModel ); overload;
    procedure Salvar( aNumPedido, aCodCliente, aValorTotal: string; aDataEmissao: TDateTime ); overload;

    procedure Remover( aValue: integer ); overload;
    procedure Remover( aStatus: string ); overload;
    procedure Remover( aValue: integer; aStatus: string ); overload;
    procedure AtualizarTotalPedido(valorTotalPedido: Currency; NumeroPedido: integer);
    procedure ConfirmaPedido(NumeroPedido: Integer);
  end;

implementation

uses
  System.SysUtils;

{ TPedidoController }

procedure TPedidoController.AtualizarTotalPedido(valorTotalPedido: Currency;
  NumeroPedido: integer);
begin
  FDAOPedido.AtualizarTotalPedido(valorTotalPedido, NumeroPedido);
end;

procedure TPedidoController.ConfirmaPedido(NumeroPedido: Integer);
begin
  FDAOPedido.ConfirmaPedido(NumeroPedido);
end;

constructor TPedidoController.Create;
begin
  FDAOPedido := TPedidoDAO.Create;
end;

destructor TPedidoController.Destroy;
begin
  FDAOPedido.Free;

  inherited;
end;

function TPedidoController.NovoCodigoPedido: Variant;
begin
  Result := FDAOPedido.NovoCodigoPedido;
end;

function TPedidoController.PedidoEmAndamento: Boolean;
begin
  Result := FDAOPedido.PedidoEmAndamento;
end;

function TPedidoController.RecuperaTodos: TFDMemTable;
begin
  Result := FDAOPedido.RecuperaTodos;
end;

procedure TPedidoController.Remover(aValue: integer; aStatus: string);
begin
  try
    FDAOPedido.Remover(aValue, aStatus);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TPedidoController.Remover(aStatus: string);
begin
  try
    FDAOPedido.Remover(aStatus);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TPedidoController.Remover(aValue: integer);
begin
  try
    FDAOPedido.Remover(aValue)
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TPedidoController.RetornaTotalPedido(aNumPedido: integer): Currency;
begin
  Result := FDAOPedido.RetornaTotalPedido(aNumPedido);
end;

procedure TPedidoController.Salvar(aNumPedido, aCodCliente,
  aValorTotal: string; aDataEmissao: TDateTime);
begin
  FPedido := TPedidoModel.New;

  FPedido
    .NumeroPedido( strtoint( aNumPedido ) )
    .CodigoCliente( StrToInt( aCodCliente ) )
    .DataEmissao( aDataEmissao )
    .ValorTotal( StrToCurr( aValorTotal ) );

  FDAOPedido.Salvar( TPedidoModel(FPedido) );
end;

procedure TPedidoController.Salvar(aValue: TPedidoModel);
begin
  FDAOPedido.Salvar(aValue);
end;

end.
