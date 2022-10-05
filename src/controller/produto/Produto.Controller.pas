unit Produto.Controller;

interface

uses
  Produto.Controller.Interfaces,
  Model.Produto,
  Produto.DAO,
  DM.Conexao,
  Data.DB,
  FireDAC.Comp.Client;

type
  TProdutoController = class (TInterfacedObject, iProdutoController)
    constructor Create;
    destructor Destroy; override;

    private
      FDAOProduto : TProdutoDAO;

    public
      procedure Salvar( aValue : TProdutoModel );
      procedure Remover ( aValue : integer);
      procedure Editar( aValue : TProdutoModel  );

      function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
      function VerificaSeExiste(aValue : integer ) : Boolean;
      function RecuperaTodos : TFDMemTable ;
  end;

implementation

uses
  System.SysUtils;

{ TProdutoController }

constructor TProdutoController.Create;
begin
  FDAOProduto := TProdutoDAO.Create;
end;

destructor TProdutoController.Destroy;
begin
  FDAOProduto.Free;

  inherited;
end;

procedure TProdutoController.Editar(aValue: TProdutoModel);
begin
  if VerificaSeExiste(aValue.Codigo) then
    FDAOProduto.Editar(aValue)
  else
    raise Exception.Create('Produto não existe.');
end;

function TProdutoController.RecuperaPorCodigo(aValue: integer;
  aColuna: string): string;
begin
  if VerificaSeExiste(aValue) then
    Result := FDAOProduto.RecuperaPorCodigo(aValue, aColuna)
  else
    raise Exception.Create('Produto não existe.');
end;

function TProdutoController.RecuperaTodos: TFDMemTable;
begin
  Result := FDAOProduto.RecuperaTodos;
end;

procedure TProdutoController.Remover(aValue: integer);
begin
  if VerificaSeExiste(aValue) then
    FDAOProduto.Remover(aValue)
  else
    raise Exception.Create('Produto não existe.');
end;

procedure TProdutoController.Salvar(aValue: TProdutoModel);
begin
  FDAOProduto.Salvar(aValue);
end;

function TProdutoController.VerificaSeExiste(aValue: integer): Boolean;
begin
  Result := FDAOProduto.VerificaSeExiste(aValue);
end;

end.
