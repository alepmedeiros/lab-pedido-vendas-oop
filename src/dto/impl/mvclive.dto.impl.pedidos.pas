unit mvclive.dto.impl.pedidos;

interface

uses
  mvclive.dto.interfaces, mvclive.model.dao.interfaces,
  mvclive.model.entity.interfaces;

type
  TPedidos = class(TInterfacedObject, iPedidos)
  private
    FPedidos: iPedidosModel;

    constructor Create;
  public
    class function New: iPedidos;

    function SetNumeroPedido(const Value: Integer): iPedidos;
    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function SetCodigoCliente(const Value: Integer): iPedidos;
    function GetCodigoCliente: Integer;
    function SetValorTotal(const Value: Currency): iPedidos;
    function GetValorTotal: Currency;
    function Build: iDAO;
  end;

implementation

uses
  mvclive.model.dao.impl.daogenerico, mvclive.model.entity.impl.pedidos;

{ TPedidos }

function TPedidos.Build: iDAO;
begin
  Result := TDAO.New(FPedidos);
end;

constructor TPedidos.Create;
begin
  FPedidos := TPedidosModel.NEw;
end;

function TPedidos.GetCodigoCliente: Integer;
begin
  Result := FPedidos.GetCodigoCliente;
end;

function TPedidos.GetDataEmissao: TDateTime;
begin
  Result := FPedidos.GetDataEmissao;
end;

function TPedidos.GetNumeroPedido: Integer;
begin
  Result := FPedidos.GetNumeroPedido;
end;

function TPedidos.GetValorTotal: Currency;
begin

end;

class function TPedidos.New: iPedidos;
begin
  Result := Self.Create;
end;

function TPedidos.SetCodigoCliente(const Value: Integer): iPedidos;
begin
  Result := Self;
  FPedidos.SetCodigoCliente(Value);
end;

function TPedidos.SetNumeroPedido(const Value: Integer): iPedidos;
begin
  Result := Self;
  FPedidos.SetNumeroPedido(Value);
end;

function TPedidos.SetValorTotal(const Value: Currency): iPedidos;
begin
  Result := Self;
  FPedidos.SetValorTotal(Value);
end;

end.
