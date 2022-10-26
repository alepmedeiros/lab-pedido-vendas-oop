unit PedidoItem.DAO;

interface

uses
  System.SysUtils,
  PedidoItem.DAO.Interfaces,
  Model.PedidoItem,
  DM.Conexao,
  Firedac.Comp.Client,
  Data.DB;

type
  TPedidoItemDAO = class(TInterfacedObject, iPedidoIemDAO)
  constructor Create;
  destructor Destroy; override;
  private
    FConexao    : TDataModuleConexao;
    FPedidoItem : TPedidoItemModel;

  public
    procedure AdicionarItem( aValue : TPedidoItemModel );
    function RecuperaTodos : TFDMemTable;
  end;

implementation

{ TPedidoItemDAO }

procedure TPedidoItemDAO.AdicionarItem(aValue: TPedidoItemModel);
begin
  FConexao.FDConexao.ExecSQL(
    'INSERT INTO pedido_item                                                        ' +
    '( codigo_pedido, codigo_produto, quantidade, valor_unitario, valor_total )     ' +
    'VALUES                                                                         ' +
    '( :codigo_pedido, :codigo_produto, :quantidade, :valor_unitario, :valor_total )',
    [aValue.NumeroPedido, aValue.NumeroItemPedido, aValue.Quantidade, aValue.ValorUnitario, aValue.ValorTotal],
    [ftInteger, ftInteger, ftInteger, ftCurrency, ftCurrency]
  )
  
end;

constructor TPedidoItemDAO.Create;
begin
  Self.FConexao    := TDataModuleConexao.New;
  Self.FPedidoItem := TPedidoItemModel.Create;
end;

destructor TPedidoItemDAO.Destroy;
begin
  FConexao.Free;
  FPedidoItem.Free;

  inherited;
end;

function TPedidoItemDAO.RecuperaTodos: TFDMemTable;
begin
  FConexao.FDConexao.ExecSQL(
    'SELECT                                               ' +
    '  p.codigo               AS codigo_produto,          ' +
    '  p.descricao            AS descricao,               ' +
    '  sum(pi.quantidade)     AS quantidade,              ' +
    '  pi.valor_unitario      AS valor,                   ' +
    '  sum(pi.valor_unitario) AS total                    ' +
    'FROM                                                 ' +
    '  pedido_item pi                                     ' +
    'LEFT JOIN                                            ' +
    '  produto p ON (pi.codigo_produto = p.codigo)        ' +
    'GROUP BY                                             ' +
    '  pi.codigo_produto                                  '
    ,TDataSet(FConexao.FDMemTable)
  );

  Result := FConexao.FDMemTable;
end;



end.
