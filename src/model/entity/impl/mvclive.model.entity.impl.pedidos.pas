unit mvclive.model.entity.impl.pedidos;

interface

uses
  System.SysUtils,
  mvclive.utils.impl.atributos,
  mvclive.model.entity.interfaces;

type
  [Tablea('PEDIDOS')]
  TPedidos = class(TInterfacedObject, iPedidos)
  private
    [Campo('NUMEROPEDIDO'), PK]
    FNumeroPedido: Integer;
    [Campo('DATAEMISSAO')]
    FDataEmissao: TDateTime;
    [Campo('CODIGO_CLIENTE'), FK]
    FCodigoCliente: Integer;
    [Campo('VALORTOTAL')]
    FValorTotal: Currency;
  public
    class function New: iPedidos;
    function SetNumeroPedido(const Value: Integer): iPedidos;
    function GetNumeroPedido: Integer;
    function SetDataEmissao(Value: TDateTime): iPedidos;
    function GetDataEmissao: TDateTime;
    function SetCodigoCliente(const Value: Integer): iPedidos;
    function GetCodigoCliente: Integer;
    function SetValorTotal(const Value: Currency): iPedidos;
    function GetValorTotal: Currency;
  end;

implementation

function TPedidos.GetCodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedidos.GetDataEmissao: TDateTime;
begin
  Result := FDataEmissao;
end;

function TPedidos.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidos.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

class function TPedidos.New: iPedidos;
begin
  Result := Self.Create;
end;

function TPedidos.SetCodigoCliente(const Value: Integer): iPedidos;
begin
  Result := Self;
  FCodigoCliente := Value;
end;

function TPedidos.SetDataEmissao(Value: TDateTime): iPedidos;
begin
  Result := Self;
  FDataEmissao := Value;
end;

function TPedidos.SetNumeroPedido(const Value: Integer): iPedidos;
begin
  Result := Self;
  FNumeroPedido := Value;
end;

function TPedidos.SetValorTotal(const Value: Currency): iPedidos;
begin
  Result := Self;
  FValorTotal := Value;
end;

end.
