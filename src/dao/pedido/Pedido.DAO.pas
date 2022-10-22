unit Pedido.DAO;

interface

uses
  System.SysUtils,
  Pedido.DAO.Interfaces,
  Model.Pedido,
  DM.Conexao,
  FireDAC.Comp.Client,
  Data.DB;

type
  TPedidoDAO = class (TInterfacedObject, iPedidoDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FConexao : TDataModuleConexao;
      FPedido  : TPedidoModel;

    public
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

procedure TPedidoDAO.Remover(aValue: integer);
begin
  FConexao.FDConexao.ExecSQL(
    'DELETE FROM pedido WHERE codigo_cliente = :codigo AND status = ''A''',
    [aValue]
  );
end;

procedure TPedidoDAO.salvar(aValue: TPedidoModel);
begin
  FConexao.FDConexao.ExecSQL(
    'INSERT INTO pedido (codigo_cliente, data_emissao, valor_total) VALUES (:codigo_cliente, :data_emissao, :valor_total)',
    [aValue.CodigoCliente, aValue.DataEmissao, aValue.ValorTotal], { valores do objeto }
    [ftInteger, ftDate, ftCurrency]                                { definição de tipo dos valores para cada coluna }
  );
end;

end.
