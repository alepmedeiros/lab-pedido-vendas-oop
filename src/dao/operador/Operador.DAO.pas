unit Operador.DAO;

interface

uses
  System.SysUtils,
  Operador.DAO.Interfaces,
  Model.Operador,
  DataModule,
  FireDAC.Comp.Client,
  Data.DB;

type
  TOperadorDAO = class(TInterfacedObject, iOperadorDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FDM       : TDataModuleUnit;
      FOperador : TOperadorModel;

    public
      procedure Salvar( aValue : TOperadorModel );
      procedure Remover ( aValue : integer);
      procedure Editar( aValue : TOperadorModel );

      function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
      function VerificaSeExiste(aValue : integer ) : Boolean;
      function RecuperaTodos : TFDMemTable ;

      function RetornaOperador( aValue : Integer) : TOperadorModel;
  end;

implementation

uses
  Model.Interfaces.Operador;

{ TOperadorDAO }

constructor TOperadorDAO.Create;
begin
  Self.FDM  := TDataModuleUnit.New;
  Self.FOperador := TOperadorModel.Create;
end;

destructor TOperadorDAO.Destroy;
begin
  FDM.Free;
  FOperador.Free;

  inherited;
end;

procedure TOperadorDAO.Editar(aValue: TOperadorModel);
begin
  FDM.FDConexao.ExecSQL(
    'UPDATE operador SET nome = :nome WHERE codigo = :codigo',
    [aValue.Nome, aValue.Codigo]
  );
end;

function TOperadorDAO.RecuperaPorCodigo(aValue: integer; aColuna: string): string;
begin
  Result := FDM.FDConexao.ExecSQLScalar(
    'SELECT ' + aColuna + ' FROM operador o WHERE o.codigo = :codigo',
    [InttoStr(aValue)]
  );
end;

function TOperadorDAO.RecuperaTodos : TFDMemTable;
begin
  FDM.FDConexao.ExecSQL(
    'SELECT * FROM operador o ORDER BY o.codigo',
    TDataSet(FDM.FDMemTable)
  );

  Result := FDM.FDMemTable;
end;

procedure TOperadorDAO.Remover(aValue: integer);
begin
  FDM.FDConexao.ExecSQL(
    'DELETE FROM operador WHERE codigo = :codigo',
    [aValue]
  );
end;

function TOperadorDAO.RetornaOperador(aValue: Integer): TOperadorModel;
var
  LOperador : iOperador;
begin
  LOperador := TOperadorModel.New;

  LOperador
    .Codigo(StrToInt(RecuperaPorCodigo(aValue, 'codigo')))
    .Nome(RecuperaPorCodigo(aValue, 'nome'));

  Result := TOperadorModel(LOperador);
end;

procedure TOperadorDAO.Salvar(aValue: TOperadorModel);
begin
  FDM.FDConexao.ExecSQL(
    'INSERT INTO operador (nome) VALUES (:nome)',
    [aValue.Nome]
  );
end;

function TOperadorDAO.VerificaSeExiste(aValue: integer): Boolean;
var
  LRetorno : Integer;
begin
  Result := false;
  LRetorno := FDM.FDConexao.ExecSQLScalar(
    'SELECT * FROM operador o WHERE o.codigo = :codigo',
    [InttoStr(aValue)]
  );

  if LRetorno > 0 then
    Result := True;
end;

end.
