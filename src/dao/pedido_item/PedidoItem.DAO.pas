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
    FPedidoItem : TPedidoItem;

  public
    function RecuperaTodos : TFDMemTable;
  end;

implementation

{ TPedidoItemDAO }

constructor TPedidoItemDAO.Create;
begin
  Self.FConexao    := TDataModuleConexao.New;
  Self.FPedidoItem := TPedidoItem.Create;
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
    '  p.codigo    AS codigo_pedido,                      ' +
    '  p.descricao AS produto,                            ' +
    '  pi.quantidade,                                     ' +
    '  pi.valor_unitario,                                 ' +
    '  ( pi.quantidade * pi.valor_unitario ) AS total     ' +
    'FROM pedido_item pi                                  ' +
    'LEFT JOIN produto p ON (pi.codigo_produto = p.codigo)'
    ,TDataSet(FConexao.FDMemTable)
  );

  Result := FConexao.FDMemTable;
end;

end.
