unit mvclive.model.entity.impl.cliente;

interface

uses
  mvclive.utils.impl.atributos,
  mvclive.model.entity.interfaces;

type
  [Tabela('CLIENTE')]
  TClienteModel = class(TInterfacedObject, iClienteModel)
  private
    [Campo('CODIGO'), PK]
    FCodigo: Integer;
    [Campo('NOME')]
    FNome: String;
    [Campo('CIDADE')]
    FCidade: String;
    [Campo('UF')]
    FEstado: String;
  public
    class function New: iClienteModel;
    function SetCodigo(const Value: Integer): iClienteModel;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iClienteModel;
    function GetNome: String;
    function SetCidade(const Value: String): iClienteModel;
    function GetCidade: String;
    function SetEstado(const Value: String): iClienteModel;
    function GetEstado: String;
  end;

implementation

function TClienteModel.GetCidade: String;
begin
  Result := FCidade;
end;

function TClienteModel.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TClienteModel.GetEstado: String;
begin
  Result := FEstado;
end;

function TClienteModel.GetNome: String;
begin
  Result := FNome;
end;

class function TClienteModel.New: iClienteModel;
begin
  Result := Self.Create;
end;

function TClienteModel.SetCidade(const Value: String): iClienteModel;
begin
  Result := Self;
  FCidade := Value;
end;

function TClienteModel.SetCodigo(const Value: Integer): iClienteModel;
begin
  Result := Self;
  FCodigo := Value;
end;

function TClienteModel.SetEstado(const Value: String): iClienteModel;
begin
  Result := Self;
  FEstado := Value;
end;

function TClienteModel.SetNome(const Value: String): iClienteModel;
begin
  Result := Self;
  FNome := Value;
end;

end.
