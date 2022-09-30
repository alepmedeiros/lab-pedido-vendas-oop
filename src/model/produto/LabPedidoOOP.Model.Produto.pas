unit LabPedidoOOP.Model.Produto;

interface

uses
  LabPedidoOOP.Model.Interfaces.Produto;

type
  TProduto = class(TInterfacedObject, iProduto)
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

{ TProduto }

constructor TProduto.Create;
begin

end;

destructor TProduto.Destroy;
begin

  inherited;
end;

class function TProduto.New: iProduto;
begin
  Result := Self.Create;
end;

function TProduto.Codigo: integer;
begin
  Result := FCodigo;
end;

function TProduto.Codigo(aValue: integer): iProduto;
begin
  Result := Self;
  FCodigo := aValue;
end;

function TProduto.Descricao(aValue: string): iProduto;
begin
  Result := Self;
  FDescricao := aValue;
end;

function TProduto.Descricao: string;
begin
  Result := FDescricao;
end;

function TProduto.PrecoProduto: currency;
begin
  Result := FPrecoProduto;
end;

function TProduto.PrecoProduto(aValue: currency): iProduto;
begin
  Result := Self;
  FPrecoProduto := aValue;
end;

end.
