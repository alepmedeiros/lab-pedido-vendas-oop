unit Pedido.DAO;

interface

uses
  System.SysUtils,
  Pedido.DAO.Interfaces,
  Model.Pedido,
  DataModule,
  FireDAC.Comp.Client,
  Data.DB,
  Variants,
  Conexao.Banco.Control;

type
  TPedidoDAO = class (TInterfacedObject, iPedidoDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FDM     : TDataModuleUnit;
      FPedido : TPedidoModel;
      FQuery  : TFDQuery;

      procedure RecuperaInstanciaQuery;

    public
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

{ TPedidoDAO }

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

procedure TPedidoDAO.RecuperaInstanciaQuery;
begin
  FQuery := TConexaoControl.getInstancia().Conexao.CriarQuery;
end;

procedure TPedidoDAO.AtualizarTotalPedido(valorTotalPedido: Currency; NumeroPedido: integer);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'UPDATE pedido SET valor_total = :valor_total_pedido WHERE codigo = :codido_pedido',
      [valorTotalPedido, NumeroPedido],
      [ftCurrency, ftInteger]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TPedidoDAO.ConfirmaPedido(NumeroPedido: Integer);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'UPDATE pedido SET status = ''C'' WHERE codigo = :codigo_pedido',
      [NumeroPedido]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

function TPedidoDAO.NovoCodigoPedido: Variant;
var
  LNovoCodPedido : Variant;
begin
  RecuperaInstanciaQuery;

  try
    try
      LNovoCodPedido := FQuery.Connection.ExecSQLScalar(
        'SELECT                        ' +
        '  COALESCE (                  ' +
        '    max(codigo) + 1,          ' +
        '    1) AS novo_codigo_pedido  ' +
        'FROM                          ' +
        '  pedido p                    '
      );
    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := LNovoCodPedido;
  end;

  if Result = Null then Result := 1;
end;

function TPedidoDAO.PedidoEmAndamento: Boolean;
var
  LExistePedido : Variant;
begin
  Result := False;

  RecuperaInstanciaQuery;

  try
    try
      LExistePedido := FQuery.Connection.ExecSQLScalar(
        'SELECT COALESCE(count(*), 0) FROM pedido p WHERE p.status = ''A'' '
      );

    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    if LExistePedido > 0 then
      Result := True;
  end;
end;

function TPedidoDAO.RecuperaTodos: TFDMemTable;
begin
  RecuperaInstanciaQuery;

  try
    try
      FQuery.SQL.Clear;
      FQuery.Open(
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
        '  p.status = ''C''                '
      );

      FDM.FDMemTable.Data := FQuery.Data;
    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := FDM.FDMemTable;
  end;
end;

procedure TPedidoDAO.Remover(aValue: integer; aStatus: string);
begin
  RecuperaInstanciaQuery;

  try
    if VerificaSeExiste(aValue) then
    begin
      FQuery.ExecSQL(
        'DELETE FROM pedido WHERE codigo_cliente = :codigo AND status = ''' + aStatus + '''',
        [aValue]
      );
    end;
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TPedidoDAO.Remover(aStatus: string);
begin
  RecuperaInstanciaQuery;

  FQuery.Connection.ExecSQL(
    'DELETE FROM pedido WHERE status = :status_pedido ',
    [ aStatus ],
    [ ftString ]
  );
end;

procedure TPedidoDAO.Remover(aValue: integer);
begin
  RecuperaInstanciaQuery;

  FQuery.Connection.ExecSQL(
    'DELETE FROM pedido_item WHERE codigo_pedido = :codigo_pedido',
    [aValue]
  );

  FQuery.Connection.ExecSQL(
    'DELETE FROM pedido WHERE codigo = :codigo ',
    [aValue]
  );
end;

function TPedidoDAO.RetornaTotalPedido(aNumPedido : integer): Currency;
var
  LTotalPedido : Currency;
begin
  RecuperaInstanciaQuery;

  LTotalPedido := 0;

  try
    try
      LTotalPedido := FQuery.Connection.ExecSQLScalar(
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
    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := LTotalPedido;
  end;

end;

procedure TPedidoDAO.salvar(aValue: TPedidoModel);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'INSERT INTO pedido (codigo, codigo_cliente, data_emissao, valor_total)' +
      'VALUES (:codigo, :codigo_cliente, :data_emissao, :valor_total)',
      [aValue.NumeroPedido,
       aValue.CodigoCliente,
       aValue.DataEmissao,
       aValue.ValorTotal],
      [ftInteger, ftInteger, ftDate, ftCurrency]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

function TPedidoDAO.VerificaSeExiste(aValue: integer): Boolean;
var
  LRetorno : Integer;
begin
  Result := False;

  RecuperaInstanciaQuery;

  try
    LRetorno := FQuery.Connection.ExecSQLScalar(
      'SELECT * FROM cliente o WHERE o.codigo = :codigo',
      [InttoStr(aValue)]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;

  if LRetorno > 0 then Result := True;
end;

end.
