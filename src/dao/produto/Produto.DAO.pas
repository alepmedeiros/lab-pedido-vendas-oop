unit Produto.DAO;

interface

uses
  System.SysUtils,
  Produto.DAO.Interfaces,
  Model.Produto,
  DM.Conexao,
  FireDAC.Comp.Client,
  Data.DB;

type
  TProdutoDAO = class(TInterfacedObject, iProdutoDAO)
  constructor Create;
  destructor Destroy; override;

  private
    FConexao : TDataModuleConexao;
    FProduto : TProdutoModel;

  public
    procedure Salvar( aValue : TProdutoModel );
    procedure Remover ( aValue : integer);
    procedure Editar( aValue : TProdutoModel );

    function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;
  end;

implementation

{ TProdutoDAO }

constructor TProdutoDAO.Create;
begin
  Self.FConexao := TDataModuleConexao.New;
  Self.FProduto := TProdutoModel.Create;
end;

destructor TProdutoDAO.Destroy;
begin
  FProduto.Free;
  FConexao.Free;

  inherited;
end;

procedure TProdutoDAO.Editar(aValue: TProdutoModel);
begin
  FConexao.FDConexao.ExecSQL(
    'UPDATE produto SET descricao = :descricao, preco_venda = :preco_venda WHERE codigo = :codigo',
    [aValue.Descricao, aValue.PrecoProduto, aValue.Codigo]
  );
end;

function TProdutoDAO.RecuperaPorCodigo(aValue: integer; aColuna: string): string;
begin
  Result := FConexao.FDConexao.ExecSQLScalar(
    'SELECT ' + aColuna + ' FROM produto p WHERE p.codigo = :codigo',
    [InttoStr(aValue)]
  );
end;

function TProdutoDAO.RecuperaTodos: TFDMemTable;
begin
  FConexao.FDConexao.ExecSQL(
    'SELECT * FROM produto ORDER BY codigo',
    TDataSet(FConexao.FDMemTable)
  );

  Result := FConexao.FDMemTable;
end;
procedure TProdutoDAO.Remover(aValue: integer);
begin
  FConexao.FDConexao.ExecSQL(
    'DELETE FROM produto WHERE codigo = :codigo',
    [aValue]
  );
end;

procedure TProdutoDAO.Salvar(aValue: TProdutoModel);
begin
  FConexao.FDConexao.ExecSQL(
    'INSERT INTO produto (descricao, preco_venda) VALUES (:descricao, :precovenda)',
    [aValue.Descricao, aValue.PrecoProduto]
  );
end;

function TProdutoDAO.VerificaSeExiste(aValue: integer): Boolean;
var
  LRetorno : Integer;
begin
  Result := false;
  LRetorno := FConexao.FDConexao.ExecSQLScalar(
    'SELECT * FROM produto o WHERE o.codigo = :codigo',
    [InttoStr(aValue)]
  );

  if LRetorno > 0 then
    Result := True;
end;

end.
