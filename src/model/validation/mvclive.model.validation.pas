unit mvclive.model.validation;

interface

uses
  mvclive.model.validation.manager;

type
  TAdminAuthorization = class(TInterfacedObject, IAuthorizationStrategy)
    function IsAuthorized: Boolean;
  end;

type
  TUserAuthorization = class(TInterfacedObject, IAuthorizationStrategy)
    function IsAuthorized: Boolean;
  end;

implementation

{ AdminAuthorization }

function TAdminAuthorization.IsAuthorized: Boolean;
begin
  // Lógica para verificar a autorização do usuário administrador
  Result := True; // Exemplo: administrador tem permissão
end;

{ TUserAuthorization }

function TUserAuthorization.IsAuthorized: Boolean;
begin
  // Lógica para verificar a autorização do usuário comum
  Result := True; // Exemplo: usuário comum não tem permissão
end;

end.
