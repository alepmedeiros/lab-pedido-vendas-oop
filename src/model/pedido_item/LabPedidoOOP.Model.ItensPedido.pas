unit LabPedidoOOP.Model.ItensPedido;

interface

uses
  LabPedidoOOP.Model.Interfaces.ItensPedido;

type
  TItensPedido = class(TInterfacedObject, iItensPedido)
    constructor Create;
    destructor Destroy; override;
    class function New : iItensPedido;

    private
      FNumeroItemPedido : Integer;
      FNUmeroPedido     : Integer;
      FCodigoProduto    : Integer;
      FQuantidade       : integer;
      FValorUnitario    : Currency;
      FValorTotal       : Currency;

    public
      function NumeroItemPedido (aValue : integer) : iItensPedido; overload;
      function NumeroItemPedido : integer; overload;

      function NumeroPedido (aValue : integer) : iItensPedido; overload;
      function NumeroPedido : integer; overload;

      function CodigoProduto (aValue : integer) : iItensPedido; overload;
      function CodigoProduto : integer; overload;

      function Quantidade (aValue : integer) : iItensPedido; overload;
      function Quantidade : integer; overload;

      function ValorUnitario (aValue : Currency) : iItensPedido; overload;
      function ValorUnitario : Currency; overload;

      function ValorTotal (aValue : Currency) : iItensPedido; overload;
      function ValorTotal : Currency; overload;
  end;

implementation

{ TItensPedido }

constructor TItensPedido.Create;
begin

end;

destructor TItensPedido.Destroy;
begin

  inherited;
end;

class function TItensPedido.New: iItensPedido;
begin
  Result := Self.Create;
end;

function TItensPedido.CodigoProduto(aValue: integer): iItensPedido;
begin
  Result := Self;
  FCodigoProduto := aValue;
end;

function TItensPedido.CodigoProduto: integer;
begin
  Result := FCodigoProduto;
end;

function TItensPedido.NumeroItemPedido: integer;
begin
  Result := FNumeroItemPedido;
end;

function TItensPedido.NumeroItemPedido(aValue: integer): iItensPedido;
begin
  Result := Self;
  FNumeroItemPedido := aValue;
end;

function TItensPedido.NumeroPedido: integer;
begin
  Result := FNUmeroPedido;
end;

function TItensPedido.NumeroPedido(aValue: integer): iItensPedido;
begin
  Result := Self;
  FNUmeroPedido := aValue;
end;

function TItensPedido.Quantidade: integer;
begin
  Result := FQuantidade;
end;

function TItensPedido.Quantidade(aValue: integer): iItensPedido;
begin
  Result := Self;
  FQuantidade := aValue;
end;

function TItensPedido.ValorTotal(aValue: Currency): iItensPedido;
begin
  Result := Self;
  FValorTotal := aValue;
end;

function TItensPedido.ValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TItensPedido.ValorUnitario(aValue: Currency): iItensPedido;
begin
  Result := Self;
  FValorUnitario := aValue;
end;

function TItensPedido.ValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

end.
