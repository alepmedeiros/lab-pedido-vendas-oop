unit mvclive.dto.impl.cliente;

interface

uses
  mvclive.dto.interfaces,
  mvclive.model.dao.interfaces,
  mvclive.model.entity.interfaces;

type
  TCliente = class(TInterfacedObject, iCliente)
  private
    FCliente: iClienteModel;

    constructor Create;
  public
    class function New: iCliente;

    function SetCodigo(const Value: Integer): iCliente;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iCliente;
    function GetNome: String;
    function SetCidade(const Value: String): iCliente;
    function GetCidade: String;
    function SetEstado(const Value: String): iCliente;
    function GetEstado: String;
    function Build: iDAO;
  end;

implementation

uses
  mvclive.model.entity.impl.cliente,
  mvclive.model.dao.impl.daogenerico;

function TCliente.Build: iDAO;
begin
  Result := TDAO.New(FCliente);
end;

constructor TCliente.Create;
begin
  FCliente := TClienteModel.New;
end;

function TCliente.GetCidade: String;
begin
  Result := FCliente.GetCidade;
end;

function TCliente.GetCodigo: Integer;
begin
  Result := FCliente.GetCodigo;
end;

function TCliente.GetEstado: String;
begin
  Result := FCliente.GetEstado;
end;

function TCliente.GetNome: String;
begin
  Result := FCliente.GetNome;
end;

class function TCliente.New: iCliente;
begin
  Result := Self.Create;
end;

function TCliente.SetCidade(const Value: String): iCliente;
begin
  Result := SElf;
  FCliente.SetCidade(Value);
end;

function TCliente.SetCodigo(const Value: Integer): iCliente;
begin
  Result := SElf;
  FCliente.SetCodigo(Value);
end;

function TCliente.SetEstado(const Value: String): iCliente;
begin
  Result := SElf;
  FCliente.SetEstado(Value);
end;

function TCliente.SetNome(const Value: String): iCliente;
begin
  Result := SElf;
  FCliente.SetNome(Value);
end;

end.
