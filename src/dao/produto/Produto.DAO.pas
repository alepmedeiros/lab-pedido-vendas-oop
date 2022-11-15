unit Produto.DAO;

interface

uses
  System.SysUtils,
  Produto.DAO.Interfaces,
  Model.Produto,
  DataModule,
  FireDAC.Comp.Client,
  Data.DB,
  Conexao.Banco.Control;

type
  TProdutoDAO = class(TInterfacedObject, iProdutoDAO)
    constructor Create;
    destructor Destroy; override;

    private
      FDM      : TDataModuleUnit;
      FProduto : TProdutoModel;
      FQuery   : TFDQuery;

    procedure RecuperaInstanciaQuery;

    public
      procedure Salvar( aValue : TProdutoModel );
      procedure Remover ( aValue : integer);
      procedure Editar( aValue : TProdutoModel );

      function RecuperaPorCodigo(aValue: integer; aColuna: string): Variant;
      function VerificaSeExiste(aValue : integer ) : Boolean;
      function RecuperaTodos : TFDMemTable ;
  end;

implementation

{ TProdutoDAO }

constructor TProdutoDAO.Create;
begin
  Self.FDM := TDataModuleUnit.New;
  Self.FProduto := TProdutoModel.Create;
end;

destructor TProdutoDAO.Destroy;
begin
  FProduto.Free;
  FDM.Free;

  inherited;
end;

procedure TProdutoDAO.RecuperaInstanciaQuery;
begin
  FQuery := TConexaoControl.getInstancia().Conexao.CriarQuery;
end;

procedure TProdutoDAO.Editar(aValue: TProdutoModel);
begin
  RecuperaInstanciaQuery;

  try
  FQuery.ExecSQL(
    'UPDATE produto SET descricao = :descricao, preco_venda = :preco_venda WHERE codigo = :codigo',
    [aValue.Descricao, aValue.PrecoProduto, aValue.Codigo]
  );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

function TProdutoDAO.RecuperaPorCodigo(aValue: integer; aColuna: string): Variant;
var
  LCodigo : Variant;
begin
  RecuperaInstanciaQuery;

  try
    try
      LCodigo := FQuery.Connection.ExecSQLScalar(
        'SELECT ' + aColuna + ' FROM produto p WHERE p.codigo = :codigo',
        [InttoStr(aValue)]
      );
    except
      on E: Exception do
        raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
    end;
  finally
    Result := LCodigo;
  end;
end;

function TProdutoDAO.RecuperaTodos: TFDMemTable;
begin
  RecuperaInstanciaQuery;

  try
    try
      FQuery.SQL.Clear;
      FQuery.Open(
        'SELECT p.codigo, p.descricao, PRINTF("R$ %.2f", preco_venda) as preco_venda FROM produto p ORDER BY codigo '
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

procedure TProdutoDAO.Remover(aValue: integer);
begin
  RecuperaInstanciaQuery;

  try
    if VerificaSeExiste(aValue) then
    begin
      FQuery.ExecSQL(
        'DELETE FROM produto WHERE codigo = :codigo',
        [aValue]
      );
    end
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

procedure TProdutoDAO.Salvar(aValue: TProdutoModel);
begin
  RecuperaInstanciaQuery;

  try
    FQuery.ExecSQL(
      'INSERT INTO produto (descricao, preco_venda) VALUES (:descricao, :precovenda)',
      [aValue.Descricao, aValue.PrecoProduto]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;
end;

function TProdutoDAO.VerificaSeExiste(aValue: integer): Boolean;
var
  LRetorno : Integer;
begin
  Result := false;

  RecuperaInstanciaQuery;

  try
    LRetorno := FQuery.Connection.ExecSQLScalar(
      'SELECT * FROM produto o WHERE o.codigo = :codigo',
      [InttoStr(aValue)]
    );
  except
    on E: Exception do
      raise Exception.Create('Ops! Algo aconteceu: ' + E.Message);
  end;

  if LRetorno > 0 then
    Result := True;
end;

end.
