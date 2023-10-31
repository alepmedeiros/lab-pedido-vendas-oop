unit mvclive.dto.impl.usuarios;

interface

uses
  mvclive.dto.interfaces,
  mvclive.model.dao.interfaces,
  mvclive.model.entity.interfaces;

type
  TUsuarios = class(TInterfacedObject, iUsuarios)
  private
    FUsuarios: iUsuariosModel;

    constructor Create;
  public
    class function New: iUsuarios;

    function SetCodigo(const Value: Integer): iUsuarios;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iUsuarios;
    function GetNome: String;
    function SetSenha(const Value: String): iUsuarios;
    function GetSenha: String;
    function Build: iDAO;
  end;

implementation

uses
  mvclive.model.entity.impl.usuarios,
  mvclive.model.dao.impl.daogenerico;

{ TUsuarios }

function TUsuarios.Build: iDAO;
begin
  Result := TDAO.New(FUsuarios);
end;

constructor TUsuarios.Create;
begin
  FUsuarios := TUsuariosModel.New;
end;

function TUsuarios.GetCodigo: Integer;
begin
  Result := FUsuarios.GetCodigo;
end;

function TUsuarios.GetNome: String;
begin
  Result := FUsuarios.GetNome;
end;

function TUsuarios.GetSenha: String;
begin
  Result := FUsuarios.GetSenha;
end;

class function TUsuarios.New: iUsuarios;
begin
  Result := SElf.Create;
end;

function TUsuarios.SetCodigo(const Value: Integer): iUsuarios;
begin
  Result := Self;
  FUsuarios.SetCodigo(Value);
end;

function TUsuarios.SetNome(const Value: String): iUsuarios;
begin
  Result := Self;
  FUsuarios.SetNOme(Value);
end;

function TUsuarios.SetSenha(const Value: String): iUsuarios;
begin
  Result := Self;
  FUsuarios.SetSenha(Value);
end;

end.
