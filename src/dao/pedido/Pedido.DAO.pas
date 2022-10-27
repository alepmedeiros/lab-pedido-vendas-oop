unit Pedido.DAO;

interface

uses
  System.SysUtils,
  Pedido.DAO.Interfaces,
  Model.Pedido,
  DM.Conexao,
  FireDAC.Comp.Client,
  Data.DB,
  Variants ;

type
  TPedidoDAO = class (TInterfacedObject, iPedidoDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FConexao : TDataModuleConexao;
      FPedido  : TPedidoModel;

    public
      function NovoCodigoPedido : Variant;
      function RetornaTotalPedido( aNumPedido : integer) : Currency;

      procedure salvar( aValue: TPedidoModel);
      procedure Remover( aValue : integer);
  end;

implementation

{ TPedidoDAO }

constructor TPedidoDAO.Create;
begin
  Self.FConexao := TDataModuleConexao.New;
  Self.FPedido := TPedidoModel.Create;
end;

destructor TPedidoDAO.Destroy;
begin
  FConexao.Free;
  FPedido.Free;

  inherited;
end;

function TPedidoDAO.NovoCodigoPedido: Variant;
begin
  Result := FConexao.FDConexao.ExecSQLScalar(
    'SELECT                       ' +
    '  COALESCE (                 ' +
    '    max(codigo) + 1,         ' +
    '    1) AS novo_codigo_pedido ' +
    'FROM                         ' +
    '  pedido p                   '
  );

  if Result = Null then
    Result := 1;
end;

procedure TPedidoDAO.Remover(aValue: integer);
begin
  FConexao.FDConexao.ExecSQL(
    'DELETE FROM pedido WHERE codigo_cliente = :codigo AND status = ''A''',
    [aValue]
  );
end;

function TPedidoDAO.RetornaTotalPedido(aNumPedido : integer): Currency;
begin
  Result := FConexao.FDConexao.ExecSQLScalar(
    'SELECT                                                     ' +
    '  COALESCE(                                                ' +
    '    SUM(total), 0                                          ' +
    '  ) AS total_pedido                                        ' +
    'FROM                                                       ' +
    '  (                                                        ' +
    '    SELECT                                                 ' +
    '      p.codigo               AS codigo_produto,            ' +
    '      p.descricao            AS descricao,                 ' +
    '      sum(pi.quantidade)     AS quantidade,                ' +
    '      pi.valor_unitario      AS valor,                     ' +
    '      sum(pi.valor_unitario) AS total                      ' +
    '    FROM pedido_item pi                                    ' +
    '    LEFT JOIN produto p ON (pi.codigo_produto = p.codigo)  ' +
    '    WHERE pi.codigo_pedido = :codigo_pedido                ' +
    '    GROUP BY pi.codigo_produto                             ' +
    ')                                                          ',
    [ aNumPedido ],
    [ ftCurrency ]
  );
end;

procedure TPedidoDAO.salvar(aValue: TPedidoModel);
begin
  FConexao.FDConexao.ExecSQL(
    'INSERT INTO pedido (codigo, codigo_cliente, data_emissao, valor_total)' +
    'VALUES (:codigo, :codigo_cliente, :data_emissao, :valor_total)',
    [aValue.NumeroPedido, aValue.CodigoCliente, aValue.DataEmissao, aValue.ValorTotal],
    [ftInteger, ftInteger, ftDate, ftCurrency]
  );
end;

end.
