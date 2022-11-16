unit Operador.DAO;

interface

uses
  System.SysUtils,
  Operador.DAO.Interfaces,
  Model.Operador,
  DataModule,
  FireDAC.Comp.Client,
  Data.DB,
  Conexao.Banco.Control;

type
  TOperadorDAO = class(TInterfacedObject, iOperadorDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FDM       : TDataModuleUnit;
      FOperador : TOperadorModel;
      FQuery    : TFDQuery;

      procedure RecuperaInstanciaQuery;

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

procedure TOperadorDAO.RecuperaInstanciaQuery;
begin
  FQuery := TConexaoControl.getInstancia().Conexao.CriarQuery;
end;

procedure TOperadorDAO.Editar(aValue: TOperadorModel);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'UPDATE operador SET nome = :nome WHERE codigo = :codigo',
      [aValue.Nome, aValue.Codigo]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;;
end;

function TOperadorDAO.RecuperaPorCodigo(aValue: integer; aColuna: string): string;
var
  LColuna : string;
begin
  RecuperaInstanciaQuery;

  try
    try
      LColuna := FQuery.Connection.ExecSQLScalar(
        'SELECT ' + aColuna + ' FROM operador o WHERE o.codigo = :codigo',
        [InttoStr(aValue)]
      );
    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := LColuna;
  end;
end;

function TOperadorDAO.RecuperaTodos : TFDMemTable;
begin
  RecuperaInstanciaQuery;

  try
    try
      FQuery.SQL.Clear;
      FQuery.Open(
        'SELECT * FROM operador o ORDER BY o.codigo'
      );
      FDM.FDMemTable.Data := FQuery.Data;
    except
      on E:Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := FDM.FDMemTable;
  end;
end;

procedure TOperadorDAO.Remover(aValue: integer);
begin
  RecuperaInstanciaQuery;

  try
    if VerificaSeExiste(aValue) then
    begin
      FQuery.ExecSQL(
        'DELETE FROM operador WHERE codigo = :codigo',
        [aValue]
      );
    end;
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TOperadorDAO.Salvar(aValue: TOperadorModel);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'INSERT INTO operador (nome) VALUES (:nome)',
      [aValue.Nome]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

function TOperadorDAO.VerificaSeExiste(aValue: integer): Boolean;
var
  LRetorno : Integer;
begin
  Result := False;

  RecuperaInstanciaQuery;

  try
    LRetorno := FQuery.Connection.ExecSQLScalar(
      'SELECT * FROM operador o WHERE o.codigo = :codigo',
      [InttoStr(aValue)]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;

  if LRetorno > 0 then Result := True;
end;

{ Possibilidade }

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

end.
