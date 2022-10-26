unit Model.PedidoItem;

interface

uses
  Model.Interfaces.PedidoItem;

type
  TPedidoItemModel = class(TInterfacedObject, iPedidoItem)
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

constructor TPedidoItemModel.Create;
begin

end;

destructor TPedidoItemModel.Destroy;
begin

  inherited;
end;

class function TPedidoItemModel.New: iPedidoItem;
begin
  Result := Self.Create;
end;

function TPedidoItemModel.CodigoProduto(aValue: integer): iPedidoItem;
begin
  Result := Self;
  FCodigoProduto := aValue;
end;

function TPedidoItemModel.CodigoProduto: integer;
begin
  Result := FCodigoProduto;
end;

function TPedidoItemModel.NumeroItemPedido: integer;
begin
  Result := FNumeroItemPedido;
end;

function TPedidoItemModel.NumeroItemPedido(aValue: integer): iPedidoItem;
begin
  Result := Self;
  FNumeroItemPedido := aValue;
end;

function TPedidoItemModel.NumeroPedido: integer;
begin
  Result := FNUmeroPedido;
end;

function TPedidoItemModel.NumeroPedido(aValue: integer): iPedidoItem;
begin
  Result := Self;
  FNUmeroPedido := aValue;
end;

function TPedidoItemModel.Quantidade: integer;
begin
  Result := FQuantidade;
end;

function TPedidoItemModel.StatusPedido: string;
begin
  Result := FStatusPedido;
end;

function TPedidoItemModel.StatusPedido(aValue: String): iPedidoItem;
begin
  Result := Self;
  FStatusPedido := aValue;
end;

function TPedidoItemModel.Quantidade(aValue: integer): iPedidoItem;
begin
  Result := Self;
  FQuantidade := aValue;
end;

function TPedidoItemModel.ValorTotal(aValue: Currency): iPedidoItem;
begin
  Result := Self;
  FValorTotal := aValue;
end;

function TPedidoItemModel.ValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TPedidoItemModel.ValorUnitario(aValue: Currency): iPedidoItem;
begin
  Result := Self;
  FValorUnitario := aValue;
end;

function TPedidoItemModel.ValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

end.
