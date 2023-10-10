unit mvclive.model.entity.impl.usuarios;

interface

uses
  mvclive.utils.impl.atributos,
  mvclive.model.entity.interfaces;

type

  [Tabela('Usuarios')]
  TUsuarios = class(TInterfacedObject, iUsuarios)
  private
    [Campo('CODIGO'), PK]
    FCodigo: Integer;
    [Campo('NOME')]
    FNome: String;
    [Campo('SENHA')]
    FSenha: String;
    [Campo('HASHCODE')]
    FHashCode: String;

    function GeraHasCode(Value: String): String;
  public
    class function New: iUsuarios;
    function SetCodigo(const Value: Integer): iUsuarios;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iUsuarios;
    function GetNome: String;
    function SetSenha(const Value: String): iUsuarios;
    function GetSenha: String;
    function GetHashCode: String;
  end;

implementation

uses
  IdGlobal,
  IdHash,
  IdHashMessageDigest;

function TUsuarios.GeraHasCode(Value: String): String;
var
  hashMessageDigest5: TIdHashMessageDigest5;
begin
  hashMessageDigest5 := nil;
  try
    hashMessageDigest5 := TIdHashMessageDigest5.Create;
    Result := IdGlobal.IndyLowerCase
      (hashMessageDigest5.HashStringAsHex(Value));
  finally
    hashMessageDigest5.Free;
  end;
end;

function TUsuarios.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TUsuarios.GetHashCode: String;
begin
  Result := FHashCode;
end;

function TUsuarios.GetNome: String;
begin
  Result := FNome;
end;

function TUsuarios.GetSenha: String;
begin
  Result := FSenha;
end;

class function TUsuarios.New: iUsuarios;
begin
  Result := Self.Create;
end;

function TUsuarios.SetCodigo(const Value: Integer): iUsuarios;
begin
  Result := Self;
  FCodigo := Value;
end;

function TUsuarios.SetNome(const Value: String): iUsuarios;
begin
  Result := Self;
  FNome := Value;
end;

function TUsuarios.SetSenha(const Value: String): iUsuarios;
begin
  Result := Self;
  FSenha := Value;
  FHashCode := GeraHasCode(FSenha);
end;

end.
