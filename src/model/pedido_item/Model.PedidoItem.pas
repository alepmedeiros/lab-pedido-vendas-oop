unit Model.PedidoItem;

interface

uses
  Model.Interfaces.PedidoItem;

type
  TPedidoItem = class(TInterfacedObject, iPedidoItem)
    constructor Create;
    destructor Destroy; override;
    class function New : iPedidoItem;

    private
      FNumeroItemPedido : Integer;
      FNUmeroPedido     : Integer;
      FCodigoProduto    : Integer;
      FQuantidade       : integer;
      FValorUnitario    : Currency;
      FValorTotal       : Currency;
      FStatusPedido     : string;

    public
      function NumeroItemPedido (aValue : integer) : iPedidoItem; overload;
      function NumeroItemPedido : integer; overload;

      function NumeroPedido (aValue : integer) : iPedidoItem; overload;
      function NumeroPedido : integer; overload;

      function CodigoProduto (aValue : integer) : iPedidoItem; overload;
      function CodigoProduto : integer; overload;

      function Quantidade (aValue : integer) : iPedidoItem; overload;
      function Quantidade : integer; overload;

      function ValorUnitario (aValue : Currency) : iPedidoItem; overload;
      function ValorUnitario : Currency; overload;

      function ValorTotal (aValue : Currency) : iPedidoItem; overload;
      function ValorTotal : Currency; overload;

      function StatusPedido (aValue : String) : iPedidoItem; overload;
      function StatusPedido : string; overload;
  end;

implementation

{ TItensPedido }

constructor TPedidoItem.Create;
begin

end;

destructor TPedidoItem.Destroy;
begin

  inherited;
end;

class function TPedidoItem.New: iPedidoItem;
begin
  Result := Self.Create;
end;

function TPedidoItem.CodigoProduto(aValue: integer): iPedidoItem;
begin
  Result := Self;
  FCodigoProduto := aValue;
end;

function TPedidoItem.CodigoProduto: integer;
begin
  Result := FCodigoProduto;
end;

function TPedidoItem.NumeroItemPedido: integer;
begin
  Result := FNumeroItemPedido;
end;

function TPedidoItem.NumeroItemPedido(aValue: integer): iPedidoItem;
begin
  Result := Self;
  FNumeroItemPedido := aValue;
end;

function TPedidoItem.NumeroPedido: integer;
begin
  Result := FNUmeroPedido;
end;

function TPedidoItem.NumeroPedido(aValue: integer): iPedidoItem;
begin
  Result := Self;
  FNUmeroPedido := aValue;
end;

function TPedidoItem.Quantidade: integer;
begin
  Result := FQuantidade;
end;

function TPedidoItem.StatusPedido: string;
begin
  Result := FStatusPedido;
end;

function TPedidoItem.StatusPedido(aValue: String): iPedidoItem;
begin
  Result := Self;
  FStatusPedido := aValue;
end;

function TPedidoItem.Quantidade(aValue: integer): iPedidoItem;
begin
  Result := Self;
  FQuantidade := aValue;
end;

function TPedidoItem.ValorTotal(aValue: Currency): iPedidoItem;
begin
  Result := Self;
  FValorTotal := aValue;
end;

function TPedidoItem.ValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TPedidoItem.ValorUnitario(aValue: Currency): iPedidoItem;
begin
  Result := Self;
  FValorUnitario := aValue;
end;

function TPedidoItem.ValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

end.
