unit Pedido.DAO;

interface

uses
  System.SysUtils,
  Pedido.DAO.Interfaces,
  Model.Pedido,
  DataModule,
  FireDAC.Comp.Client,
  Data.DB,
  Variants ;

type
  TPedidoDAO = class (TInterfacedObject, iPedidoDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FDM     : TDataModuleUnit;
      FPedido : TPedidoModel;

    public
      function NovoCodigoPedido : Variant;
      function RetornaTotalPedido( aNumPedido : integer) : Currency;
      function RecuperaTodos: TFDMemTable;
      function PedidoEmAndamento: Boolean;

      procedure salvar( aValue : TPedidoModel);
      procedure Remover( aValue: integer ); overload;
      procedure Remover( aStatus: string ); overload;
      procedure Remover( aValue: integer; aStatus: string ); overload;
      procedure AtualizarTotalPedido( valorTotalPedido: Currency; NumeroPedido: integer );
      procedure ConfirmaPedido( NumeroPedido : Integer );
  end;

implementation

{ TPedidoDAO }

procedure TPedidoDAO.AtualizarTotalPedido(valorTotalPedido: Currency; NumeroPedido: integer);
begin
  FDM.FDConexao.ExecSQL(
    'UPDATE pedido SET valor_total = :valor_total_pedido WHERE codigo = :codido_pedido',
    [valorTotalPedido, NumeroPedido],
    [ftCurrency, ftInteger]
  );
end;

procedure TPedidoDAO.ConfirmaPedido(NumeroPedido: Integer);
begin
  FDM.FDConexao.ExecSQL(
    'UPDATE pedido SET status = ''C'' WHERE codigo = :codigo_pedido',
    [NumeroPedido]
  );
end;

constructor TPedidoDAO.Create;
begin
  Self.FDM := TDataModuleUnit.New;
  Self.FPedido := TPedidoModel.Create;
end;

destructor TPedidoDAO.Destroy;
begin
  FDM.Free;
  FPedido.Free;

  inherited;
end;

function TPedidoDAO.NovoCodigoPedido: Variant;
begin
  Result := FDM.FDConexao.ExecSQLScalar(
    'SELECT                        ' +
    '  COALESCE (                  ' +
    '    max(codigo) + 1,          ' +
    '    1) AS novo_codigo_pedido  ' +
    'FROM                          ' +
    '  pedido p                    '
  );

  if Result = Null then
    Result := 1;
end;

function TPedidoDAO.PedidoEmAndamento: Boolean;
var
  LExistePedido : Variant;
begin
  Result := False;

  LExistePedido := FDM.FDConexao.ExecSQLScalar(
    'SELECT COALESCE(count(*), 0) FROM pedido p WHERE p.status = ''A'' '
  );

  if LExistePedido > 0 then
    Result := True;
end;

function TPedidoDAO.RecuperaTodos: TFDMemTable;
begin
   FDM.FDConexao.ExecSQL(
    'SELECT                            ' +
    '  p.codigo,                       ' +
    '  c.nome,                         ' +
    '  p.data_emissao,                 ' +
    '  PRINTF("R$ %.2f",               ' +
    '    p.valor_total                 ' +
    ' ) AS valor_total                 ' +
    'FROM                              ' +
    '  pedido p                        ' +
    'LEFT JOIN cliente c ON            ' +
    '  ( c.codigo = p.codigo_cliente ) ' +
    'WHERE                             ' +
    '  p.status = ''C''                ' ,
    TDataSet(FDM.FDMemTable)
  );

  Result := FDM.FDMemTable;
end;

procedure TPedidoDAO.Remover(aValue: integer; aStatus: string);
begin
  FDM.FDConexao.ExecSQL(
    'DELETE FROM pedido WHERE codigo_cliente = :codigo AND status = ''' + aStatus + '''',
    [aValue]
  );
end;

procedure TPedidoDAO.Remover(aStatus: string);
begin
  FDM.FDConexao.ExecSQL(
    'DELETE FROM pedido WHERE status = :status_pedido ',
    [ aStatus ],
    [ ftString ]
  );
end;

procedure TPedidoDAO.Remover(aValue: integer);
begin
  FDM.FDConexao.ExecSQL(
    'DELETE FROM pedido_item WHERE codigo_pedido = :codigo_pedido',
    [aValue]
  );

  FDM.FDConexao.ExecSQL(
    'DELETE FROM pedido WHERE codigo = :codigo ',
    [aValue]
  );
end;

function TPedidoDAO.RetornaTotalPedido(aNumPedido : integer): Currency;
begin
  Result := FDM.FDConexao.ExecSQLScalar(
    'SELECT                                                     ' +
    '  COALESCE(                                                ' +
    '    SUM(pedido.total), 0                                   ' +
    '  ) AS total_pedido                                        ' +
    'FROM                                                       ' +
    '  (                                                        ' +
    '    SELECT                                                 ' +
    '      (pi.valor_unitario * pi.quantidade) AS total         ' +
    '    FROM pedido_item pi                                    ' +
    '    LEFT JOIN produto p ON (pi.codigo_produto = p.codigo)  ' +
    '    WHERE pi.codigo_pedido = :codigo_pedido                ' +
    ' ) AS pedido                                               ',
    [ aNumPedido ],
    [ ftCurrency ]
  );
end;

procedure TPedidoDAO.salvar(aValue: TPedidoModel);
begin
  FDM.FDConexao.ExecSQL(
    'INSERT INTO pedido (codigo, codigo_cliente, data_emissao, valor_total)' +
    'VALUES (:codigo, :codigo_cliente, :data_emissao, :valor_total)',
    [aValue.NumeroPedido,
     aValue.CodigoCliente,
     aValue.DataEmissao,
     aValue.ValorTotal],
    [ftInteger, ftInteger, ftDate, ftCurrency]
  );
end;

end.
