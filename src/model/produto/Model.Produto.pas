unit Model.Produto;

interface

uses
  Model.Interfaces.Produto;

type
  TProdutoModel = class(TInterfacedObject, iProduto)
  constructor Create;
  destructor Destroy; override;
  class function New: iProduto;

  private
    { private declarations }
    FCodigo       : integer;
    FDescricao    : string;
    FPrecoProduto : currency;

  public
    { public declarations }
    function Codigo (aValue : integer) : iProduto; overload;
    function Codigo : integer; overload;

    function Descricao (aValue : string) : iProduto; overload;
    function Descricao : string; overload;

    function PrecoProduto (aValue : currency) : iProduto; overload;
    function PrecoProduto : currency; overload;

  end;

implementation

{ TProdutoModel }

constructor TProdutoModel.Create;
begin

end;

destructor TProdutoModel.Destroy;
begin

  inherited;
end;

class function TProdutoModel.New: iProduto;
begin
  Result := Self.Create;
end;

function TProdutoModel.Codigo: integer;
begin
  Result := FCodigo;
end;

function TProdutoModel.Codigo(aValue: integer): iProduto;
begin
  Result := Self;
  FCodigo := aValue;
end;

function TProdutoModel.Descricao(aValue: string): iProduto;
begin
  Result := Self;
  FDescricao := aValue;
end;

function TProdutoModel.Descricao: string;
begin
  Result := FDescricao;
end;

function TProdutoModel.PrecoProduto: currency;
begin
  Result := FPrecoProduto;
end;

function TProdutoModel.PrecoProduto(aValue: currency): iProduto;
begin
  Result := Self;
  FPrecoProduto := aValue;
end;

end.
