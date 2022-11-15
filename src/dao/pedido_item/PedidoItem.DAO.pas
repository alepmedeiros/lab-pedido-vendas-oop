unit PedidoItem.DAO;

interface

uses
  System.SysUtils,
  PedidoItem.DAO.Interfaces,
  Model.PedidoItem,
  DataModule,
  Firedac.Comp.Client,
  Data.DB,
  Variants,
  Conexao.Banco.Control;

type
  TPedidoItemDAO = class(TInterfacedObject, iPedidoIemDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FDM         : TDataModuleUnit;
      FPedidoItem : TPedidoItemModel;
      FQuery      : TFDQuery;

    procedure RecuperaInstanciaQuery;

    public
      procedure AdicionarItem( aValue : TPedidoItemModel ); overload;
      procedure AdicionarItem( aNumPedido, aNumItemPedido, aQuantidade, aValorUnitario, aValorTotal : string ); overload;

      procedure RemoverPedidos( aValue: integer ); overload;
      procedure RemoverPedidos( aValue: string ); overload;

      procedure RemoverEntrada( aCodPedido, aCodEntrada: integer);
      procedure ConfirmaPedidoItem(NumeroPedido: Integer);
      procedure AtualizarEntrada(aValorUnitario: Currency; aQuantidade, aCodPedido, aCodEntrada: integer);

      function RecuperaTodos : TFDMemTable;
      function RecuperaItemPedidoPorCodigo( aValue : integer ) : TFDMemTable;
      function RecuperaPorCodigo( aValue: Integer; aColuna : string ) : Variant;
  end;

implementation

{ TPedidoItemDAO }

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

procedure TPedidoItemDAO.RecuperaInstanciaQuery;
begin
  FQuery := TConexaoControl.getInstancia().Conexao.CriarQuery;
end;

procedure TPedidoItemDAO.AdicionarItem(aValue: TPedidoItemModel);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
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
    );
  except
    on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TPedidoItemDAO.AdicionarItem(aNumPedido, aNumItemPedido,
  aQuantidade, aValorUnitario, aValorTotal: string);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'INSERT INTO pedido_item                                                         ' +
      '(  codigo_pedido,  codigo_produto,  quantidade,  valor_unitario,  valor_total ) ' +
      'VALUES                                                                          ' +
      '( :codigo_pedido, :codigo_produto, :quantidade, :valor_unitario, :valor_total ) ',
      [ aNumPedido, aNumItemPedido, aQuantidade, aValorUnitario, aValorTotal ],
      [ ftInteger, ftInteger, ftInteger, ftCurrency, ftCurrency ]
    );
  except
    on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TPedidoItemDAO.AtualizarEntrada(aValorUnitario: Currency; aQuantidade, aCodPedido, aCodEntrada: integer);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'UPDATE                                              ' +
      '  pedido_item                                       ' +
      'SET                                                 ' +
      '  quantidade     = :quantidade,                     ' +
      '  valor_unitario = :valor_unitario                  ' +
      'WHERE                                               ' +
      '  codigo_pedido  = :codigo_pedido                   ' +
      '  AND codigo     = :codigo_entrada                  ',
      [aQuantidade, aValorUnitario, aCodPedido, aCodEntrada],
      [ftInteger,   ftCurrency,     ftInteger,  ftInteger  ]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;

  try
    FQuery.ExecSQL(
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
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TPedidoItemDAO.ConfirmaPedidoItem(NumeroPedido: Integer);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'UPDATE pedido_item SET status_pedido = ''C'' WHERE codigo_pedido = :codigo_pedido',
      [NumeroPedido]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

function TPedidoItemDAO.RecuperaItemPedidoPorCodigo(
  aValue: integer): TFDMemTable;
var
  LCodigo : string;
begin
  RecuperaInstanciaQuery;

  LCodigo := IntToStr( aValue );

  try
    try
      FQuery.SQL.Clear;
      FQuery.Open(
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
      );

      FDM.FDMemTable.Data := FQuery.data;
    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := FDM.FDMemTable;
  end;
end;

function TPedidoItemDAO.RecuperaPorCodigo(aValue: Integer;
  aColuna: string): Variant;
var
  LCodigo : Variant;
begin
  RecuperaInstanciaQuery;

  try
    try
      LCodigo := FQuery.Connection.ExecSQLScalar(
        'SELECT ' + aColuna + ' FROM pedido_item pi WHERE pi.codigo = :codigo',
        [InttoStr(aValue)]
      );
    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := LCodigo;
  end;
end;

function TPedidoItemDAO.RecuperaTodos: TFDMemTable;
begin
  RecuperaInstanciaQuery;

  try
    try
      FQuery.ExecSQL(
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
      );

      FDM.FDMemTable.Data := FQuery.data;
    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := FDM.FDMemTable;
  end;

  Result := FDM.FDMemTable;
end;

procedure TPedidoItemDAO.RemoverEntrada(aCodPedido, aCodEntrada: integer);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'DELETE FROM pedido_item WHERE codigo_pedido = :codigo_pedido AND codigo = :codigo_entrada ',
      [aCodPedido, aCodEntrada],
      [ftInteger, ftInteger]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TPedidoItemDAO.RemoverPedidos(aValue: string);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'DELETE FROM pedido_item  WHERE status_pedido = :status_pedido',
      [aValue]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TPedidoItemDAO.RemoverPedidos(aValue: integer);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
    'DELETE FROM pedido_item  WHERE codigo_pedido = :codigo_pedido AND status_pedido = ''A''',
    [aValue],
    [ftInteger]
  );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

end.
