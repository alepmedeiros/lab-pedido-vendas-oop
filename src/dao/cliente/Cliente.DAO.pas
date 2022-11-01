unit Cliente.DAO;

interface

uses
  System.SysUtils,
  Cliente.DAO.Interfaces,
  Model.Cliente,
  DM.Conexao,
  FireDAC.Comp.Client,
  Data.DB;

type
  TClienteDAO = class(TInterfacedObject, iClienteDAO)
  constructor Create;
  destructor Destroy; override;
  private
    FConexao  : TDataModuleConexao;
    FCliente  : TClienteModel;

  public
    procedure Salvar( aValue : TClienteModel );
    procedure Remover ( aValue : integer);
    procedure Editar( aValue : TClienteModel );

    function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;
  end;

implementation

{ TClienteDAO }

constructor TClienteDAO.Create;
begin
  Self.FConexao := TDataModuleConexao.New;
  Self.FCliente := TClienteModel.Create;
end;

destructor TClienteDAO.Destroy;
begin
  FConexao.Free;
  FCliente.Free;
  inherited;
end;

procedure TClienteDAO.Editar(aValue: TClienteModel);
begin
  FConexao.FDConexao.ExecSQL(
    'UPDATE cliente SET nome = :nome, cidade = :cidade, uf = :uf WHERE codigo = :codigo',
    [aValue.Nome, aValue.Cidade, aValue.UF, aValue.Codigo]
  );
end;

function TClienteDAO.RecuperaPorCodigo(aValue: integer; aColuna: string): string;
begin
  Result := FConexao.FDConexao.ExecSQLScalar(
    'SELECT ' + aColuna + ' FROM cliente o WHERE o.codigo = :codigo',
    [InttoStr(aValue)]
  );
end;

function TClienteDAO.RecuperaTodos: TFDMemTable;
begin
  FConexao.FDQuery.SQL.Clear;
  FConexao.FDQuery.Open(
    'SELECT * FROM cliente ORDER BY codigo'
  );

  FConexao.FDMemTable.Data := FConexao.FDQuery.Data;
  Result := FConexao.FDMemTable;
end;

procedure TClienteDAO.Remover(aValue: integer);
begin
  FConexao.FDConexao.ExecSQL(
    'DELETE FROM cliente WHERE codigo = :codigo',
    [aValue]
  );
end;

procedure TClienteDAO.Salvar(aValue: TClienteModel);
begin
  FConexao.FDConexao.ExecSQL(
    'INSERT INTO cliente (nome, cidade, uf) VALUES (:nome, :cidade, :uf)',
    [aValue.Nome, aValue.Cidade, aValue.UF]
  );
end;

function TClienteDAO.VerificaSeExiste(aValue: integer): Boolean;
var
  LRetorno : Integer;
begin
  Result := false;
  LRetorno := FConexao.FDConexao.ExecSQLScalar(
    'SELECT * FROM cliente o WHERE o.codigo = :codigo',
    [InttoStr(aValue)]
  );

  if LRetorno > 0 then
    Result := True;
end;

end.
