unit mvclive.model.entity.impl.usuarios;

interface

uses
  mvclive.utils.impl.atributos,
  mvclive.model.entity.interfaces;

type

  [Tabela('Usuarios')]
  TUsuariosModel = class(TInterfacedObject, iUsuariosModel)
  private
    [Campo('CODIGO'), PK]
    FCodigo: Integer;
    [Campo('NOME')]
    FNome: String;
    [Campo('SENHA')]
    FSenha: String;

    function GeraHasCode(Value: String): String;
  public
    class function New: iUsuariosModel;
    function SetCodigo(const Value: Integer): iUsuariosModel;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iUsuariosModel;
    function GetNome: String;
    function SetSenha(const Value: String): iUsuariosModel;
    function GetSenha: String;
  end;

implementation

uses
  IdGlobal,
  IdHash,
  IdHashMessageDigest;

function TUsuariosModel.GeraHasCode(Value: String): String;
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

function TUsuariosModel.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TUsuariosModel.GetNome: String;
begin
  Result := FNome;
end;

function TUsuariosModel.GetSenha: String;
begin
  Result := FSenha;
end;

class function TUsuariosModel.New: iUsuariosModel;
begin
  Result := Self.Create;
end;

function TUsuariosModel.SetCodigo(const Value: Integer): iUsuariosModel;
begin
  Result := Self;
  FCodigo := Value;
end;

function TUsuariosModel.SetNome(const Value: String): iUsuariosModel;
begin
  Result := Self;
  FNome := Value;
end;

function TUsuariosModel.SetSenha(const Value: String): iUsuariosModel;
begin
  Result := Self;
  FSenha := GeraHasCode(FSenha);
end;

end.
