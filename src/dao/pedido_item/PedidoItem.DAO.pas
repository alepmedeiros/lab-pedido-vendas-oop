unit PedidoItem.DAO;

interface

uses
  System.SysUtils,
  PedidoItem.DAO.Interfaces,
  Model.PedidoItem,
  DataModule,
  Firedac.Comp.Client,
  Data.DB,
  Variants;

type
  TPedidoItemDAO = class(TInterfacedObject, iPedidoIemDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FDM         : TDataModuleUnit;
      FPedidoItem : TPedidoItemModel;

    public
      procedure AdicionarItem( aValue : TPedidoItemModel ); overload;
      procedure AdicionarItem( aNumPedido, aNumItemPedido, aQuantidade, aValorUnitario, aValorTotal : string ); overload;

      procedure RemoverPedidos( aValue: integer ); overload;
      procedure RemoverPedidos(aValue: string); overload;
      procedure RemoverPedidos; overload;

      procedure RemoverEntrada( aCodPedido, aCodEntrada: integer);
      procedure ConfirmaPedidoItem(NumeroPedido: Integer);
      procedure AtualizarEntrada(aValorUnitario: Currency; aQuantidade, aCodPedido, aCodEntrada: integer);

      function RecuperaTodos : TFDMemTable;
      function RecuperaItemPedidoPorCodigo( aValue : integer ) : TFDMemTable;
      function RecuperaPorCodigo( aValue: Integer; aColuna : string ) : Variant;
  end;

implementation

{ TPedidoItemDAO }

procedure TPedidoItemDAO.AdicionarItem(aValue: TPedidoItemModel);
begin
  FDM.FDConexao.ExecSQL(
    'INSERT INTO pedido_item                                                         ' +
    '(  codigo_pedido,  codigo_produto,  quantidade,  valor_unitario,  valor_total ) ' +
    'VALUES                                                                          ' +
    '( :codigo_pedido, :codigo_produto, :quantidade, :valor_unitario, :valor_total ) ',
    [ aValue.NumeroPedido,
      aValue.NumeroItemPedido,
      aValue.Quantidade,
      aValue.ValorUnitario,
      aValue.ValorTotal ],
    [ftInteger, ftInteger, ftInteger, ftCurrency, ftCurrency]
  )
end;

procedure TPedidoItemDAO.AdicionarItem(aNumPedido, aNumItemPedido,
  aQuantidade, aValorUnitario, aValorTotal: string);
begin
  FDM.FDConexao.ExecSQL(
    'INSERT INTO pedido_item                                                         ' +
    '(  codigo_pedido,  codigo_produto,  quantidade,  valor_unitario,  valor_total ) ' +
    'VALUES                                                                          ' +
    '( :codigo_pedido, :codigo_produto, :quantidade, :valor_unitario, :valor_total ) ',
    [ aNumPedido, aNumItemPedido, aQuantidade, aValorUnitario, aValorTotal ],
    [ ftInteger, ftInteger, ftInteger, ftCurrency, ftCurrency ]
  )
end;

procedure TPedidoItemDAO.AtualizarEntrada(aValorUnitario: Currency; aQuantidade, aCodPedido, aCodEntrada: integer);
begin
  FDM.FDConexao.ExecSQL(
    'UPDATE                                            ' +
    '  pedido_item                                     ' +
    'SET                                               ' +
    '  quantidade     = :quantidade,                   ' +
    '  valor_unitario = :valor_unitario                ' +
    'WHERE                                             ' +
    '  codigo_pedido  = :codigo_pedido                 ' +
    '  AND codigo     = :codigo_entrada                ',
    [aQuantidade, aValorUnitario, aCodPedido, aCodEntrada],
    [ftInteger,   ftCurrency,     ftInteger,  ftInteger  ]
  );

  FDM.FDConexao.ExecSQL(
    'UPDATE                                            ' +
    '  pedido_item                                     ' +
    'SET                                               ' +
    '  valor_total    = quantidade * valor_unitario    ' +
    'WHERE                                             ' +
    '  codigo_pedido  = :codigo_pedido                 ' +
    '  AND codigo     = :codigo_entrada                ',
    [aCodPedido, aCodEntrada],
    [ftInteger,  ftInteger  ]
  );
end;

procedure TPedidoItemDAO.ConfirmaPedidoItem(NumeroPedido: Integer);
begin
  FDM.FDConexao.ExecSQL(
    'UPDATE pedido_item SET status_pedido = ''C'' WHERE codigo_pedido = :codigo_pedido',
    [NumeroPedido]
  );
end;

constructor TPedidoItemDAO.Create;
begin
  Self.FDM    := TDataModuleUnit.New;
  Self.FPedidoItem := TPedidoItemModel.Create;
end;

destructor TPedidoItemDAO.Destroy;
begin
  FDM.Free;
  FPedidoItem.Free;

  inherited;
end;

function TPedidoItemDAO.RecuperaItemPedidoPorCodigo(
  aValue: integer): TFDMemTable;
var
  LCodigo : string;
begin
  LCodigo := IntToStr( aValue );
  FDM.FDConexao.ExecSQL(
    'SELECT                                   ' +
    '  pi.codigo     AS ''#'',                ' +
    '  p.codigo      AS produto,              ' +
    '  p.descricao   AS descricao,            ' +
    '  pi.quantidade AS quantidade,           ' +
    '  PRINTF("R$ %.2f",                      ' +
    '    pi.valor_unitario                    ' +
    '  ) AS valor ,                           ' +
    '  PRINTF("R$ %.2f",                      ' +
    '    (pi.valor_unitario * pi.quantidade)  ' +
    '  ) AS total                             ' +
    'FROM                                     ' +
    '  pedido_item pi                         ' +
    'LEFT JOIN produto p ON                   ' +
    '  ( p.codigo = pi.codigo_produto )       ' +
    'WHERE                                    ' +
    '  pi.codigo_pedido = ' + LCodigo + '     '
    ,TDataSet(FDM.FDMemTable)
  );

  Result := FDM.FDMemTable;
end;

function TPedidoItemDAO.RecuperaPorCodigo(aValue: Integer;
  aColuna: string): Variant;
begin
  Result := FDM.FDConexao.ExecSQLScalar(
    'SELECT ' + aColuna + ' FROM pedido_item pi WHERE pi.codigo = :codigo',
    [InttoStr(aValue)]
  );
end;

function TPedidoItemDAO.RecuperaTodos: TFDMemTable;
begin
  FDM.FDConexao.ExecSQL(
    'SELECT                                         ' +
    '  p.codigo               AS codigo_produto,    ' +
    '  p.descricao            AS descricao,         ' +
    '  sum(pi.quantidade)     AS quantidade,        ' +
    '  pi.valor_unitario      AS valor,             ' +
    '  sum(pi.valor_unitario) AS total              ' +
    'FROM                                           ' +
    '  pedido_item pi                               ' +
    'LEFT JOIN                                      ' +
    '  produto p ON (pi.codigo_produto = p.codigo)  ' +
    'GROUP BY                                       ' +
    '  pi.codigo_produto                            '
    ,TDataSet(FDM.FDMemTable)
  );

  Result := FDM.FDMemTable;
end;

procedure TPedidoItemDAO.RemoverEntrada(aCodPedido, aCodEntrada: integer);
begin
  FDM.FDConexao.ExecSQL(
    'DELETE FROM pedido_item WHERE codigo_pedido = :codigo_pedido AND codigo = :codigo_entrada ',
    [aCodPedido, aCodEntrada],
    [ftInteger, ftInteger]
  );
end;

procedure TPedidoItemDAO.RemoverPedidos(aValue: string);
begin
  FDM.FDConexao.ExecSQL(
    'DELETE FROM pedido_item  WHERE status_pedido = :status_pedido',
    [aValue]
  );
end;

procedure TPedidoItemDAO.RemoverPedidos(aValue: integer);
begin
  FDM.FDConexao.ExecSQL(
    'DELETE FROM pedido_item  WHERE codigo_pedido = :codigo_pedido AND status_pedido = ''A''',
    [aValue]
  );
end;

procedure TPedidoItemDAO.RemoverPedidos;
begin
  FDM.FDConexao.ExecSQL(
    'DELETE FROM pedido_item  WHERE status_pedido = ''A'''
  );
end;

end.
