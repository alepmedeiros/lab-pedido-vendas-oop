unit LabPedidoOOP.Operador.DAO;

interface

uses
  System.SysUtils,
  LabPedidoOOP.Operador.DAO.Interfaces,
  LabPedidoOOP.Model.Operador,
  DM.Conexao, FireDAC.Comp.Client, Data.DB;

type
  TOperadorDAO = class(TInterfacedObject, iOperadorDAO)
  constructor Create;
  destructor Destroy; override;
  private
    FConexao  : TDataModuleConexao;
    FOperador : TOperadorModel;

  public
    procedure Salvar( aValue : TOperadorModel );
    procedure Remover ( aValue : integer);
    procedure EditaOperador( aValue : TOperadorModel );

    function RecuperaPorCodigo( aValue : integer ) : string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos(aValue : TDataSet) : TFDMemTable ;
  end;

implementation

{ TOperadorDAO }

constructor TOperadorDAO.Create;
begin
  Self.FConexao  := TDataModuleConexao.New;
  Self.FOperador := TOperadorModel.Create;
end;

destructor TOperadorDAO.Destroy;
begin
  FConexao.Free;

  inherited;
end;

procedure TOperadorDAO.EditaOperador(aValue: TOperadorModel);
begin
  FConexao.FDConexao.ExecSQL('UPDATE operador SET nome = :novoNome WHERE codigo = :codigoOperador',
    [aValue.Nome, aValue.Codigo]
  );
end;

function TOperadorDAO.RecuperaPorCodigo(aValue: integer): string;
begin
  Result := FConexao.FDConexao.ExecSQLScalar(
    'SELECT o.nome FROM operador o WHERE o.codigo = :codigoOperador',
    [InttoStr(aValue)]
  );
end;

function TOperadorDAO.RecuperaTodos(aValue : TDataSet) : TFDMemTable;
begin
  FConexao.FDConexao.ExecSQL(
    'SELECT * FROM operador o ORDER BY o.codigo',
    TDataSet(FConexao.FDMemTable)
  );

  Result := FConexao.FDMemTable;
end;

procedure TOperadorDAO.Remover(aValue: integer);
begin
  FConexao.FDConexao.ExecSQL(
    'DELETE FROM operador WHERE codigo = :codigoOperador',
    [aValue]
  );
end;

procedure TOperadorDAO.Salvar(aValue: TOperadorModel);
begin
  FConexao.FDConexao.ExecSQL(
    'INSERT INTO operador (nome) VALUES (:nomeOperador)',
    [aValue.Nome]
  );
end;

function TOperadorDAO.VerificaSeExiste(aValue: integer): Boolean;
var
  LRetorno : Integer;
begin
  Result := false;
  LRetorno := FConexao.FDConexao.ExecSQLScalar(
    'SELECT * FROM operador o WHERE o.codigo = :codigoOperador',
    [InttoStr(aValue)]
  );

  if LRetorno > 0 then
    Result := True;
end;

end.
