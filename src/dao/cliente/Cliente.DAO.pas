unit Cliente.DAO;

interface

uses
  vcl.Dialogs,
  System.SysUtils,
  Cliente.DAO.Interfaces,
  Model.Cliente,
  DataModule,
  FireDAC.Comp.Client,
  Data.DB,
  Conexao.Banco.Control;

type
  TClienteDAO = class(TInterfacedObject, iClienteDAO)
    FDMemTable: TFDMemTable;
    constructor Create;
    destructor Destroy; override;

    private
      FDM       : TDataModuleUnit;
      FCliente  : TClienteModel;
      FQuery    : TFDQuery;

      procedure RecuperaInstanciaQuery;

    public
      procedure Salvar( aValue : TClienteModel ); overload;
      procedure Salvar( aNome, aCidade, aUF : string ); overload;

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
  Self.FDM   := TDataModuleUnit.New;
  Self.FCliente   := TClienteModel.Create;
  Self.FDMemTable := TFDMemTable.Create(nil);
end;

destructor TClienteDAO.Destroy;
begin
  FDMemTable.Free;
  FCliente.Free;
  FDM.Free;
  inherited;
end;

procedure TClienteDAO.RecuperaInstanciaQuery;
begin
  FQuery := TConexaoControl.getInstancia().Conexao.CriarQuery;
end;

procedure TClienteDAO.Editar(aValue: TClienteModel);
begin
  try
  FQuery.ExecSQL(
    'UPDATE cliente SET nome = :nome, cidade = :cidade, uf = :uf WHERE codigo = :codigo',
    [aValue.Nome, aValue.Cidade, aValue.UF, aValue.Codigo]
  );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

function TClienteDAO.RecuperaPorCodigo(aValue: integer; aColuna: string): string;
var
  LColuna : string;
begin
  try
    try
      LColuna := FQuery.Connection.ExecSQLScalar(
        'SELECT ' + aColuna + ' FROM cliente o WHERE o.codigo = :codigo',
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

function TClienteDAO.RecuperaTodos: TFDMemTable;
begin
  RecuperaInstanciaQuery;
  try
    try
      FQuery.SQL.Clear;
      FQuery.Open(
        'SELECT * FROM cliente c ORDER BY c.codigo'
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

procedure TClienteDAO.Remover(aValue: integer);
begin
  try
    if VerificaSeExiste(aValue) then
    begin
      FQuery.Connection.ExecSQL(
        'DELETE FROM cliente WHERE codigo = :codigo',
        [aValue]
      );
    end
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TClienteDAO.Salvar(aNome, aCidade, aUF: string);
begin
  try
    FQuery.ExecSQL(
      'INSERT INTO cliente (nome, cidade, uf) VALUES (:nome, :cidade, :uf)',
      [aNome, aCidade, aUF]
    );
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message );
    end;
  end;
end;

procedure TClienteDAO.Salvar(aValue: TClienteModel);
begin
  try
    FQuery.ExecSQL(
      'INSERT INTO cliente (nome, cidade, uf) VALUES (:nome, :cidade, :uf)',
      [aValue.Nome, aValue.Cidade, aValue.UF]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

function TClienteDAO.VerificaSeExiste(aValue: integer): Boolean;
var
  LRetorno : Integer;
begin
  Result := False;

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
