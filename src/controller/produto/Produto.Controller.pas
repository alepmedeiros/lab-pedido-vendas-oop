unit Produto.Controller;

interface

uses
  Produto.Controller.Interfaces,
  Model.Interfaces.Produto,
  Model.Produto,
  Produto.DAO,
  DataModule,
  Data.DB,
  FireDAC.Comp.Client;

type
  TProdutoController = class (TInterfacedObject, iProdutoController)
    constructor Create;
    destructor Destroy; override;

    private
      FDAOProduto : TProdutoDAO;
      FProduto : iProduto;

    public
      procedure Salvar( aValue : TProdutoModel ); overload;
      procedure Salvar( aDescricao, aValor : string ); overload;

      procedure Remover ( aValue : integer);

      procedure Editar( aValue : TProdutoModel ); overload;
      procedure Editar( aCodigo, aDescricao, aValor : string ); overload;

      function RecuperaPorCodigo(aValue: integer; aColuna: string): Variant;
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

procedure TProdutoController.Editar(aCodigo, aDescricao, aValor: string);
begin
  FProduto := TProdutoModel.New;

  FProduto
    .Codigo( StrToInt(aCodigo) )
    .Descricao(aDescricao)
    .PrecoProduto( StrToCurr(aValor) );

  FDAOProduto.Editar( TProdutoModel(FProduto) );
end;

procedure TProdutoController.Editar(aValue: TProdutoModel);
begin
  if VerificaSeExiste(aValue.Codigo) then
    FDAOProduto.Editar(aValue)
  else
    raise Exception.Create('Produto não existe.');
end;

function TProdutoController.RecuperaPorCodigo(aValue: integer;
  aColuna: string): Variant;
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

procedure TProdutoController.Salvar(aDescricao, aValor: string);
begin
  FProduto := TProdutoModel.New;

  FProduto
    .Descricao(aDescricao)
    .PrecoProduto( StrToCurr(aValor) );

  FDAOProduto.Salvar( TProdutoModel(FProduto) );
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
