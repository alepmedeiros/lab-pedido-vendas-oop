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
  // L�gica para verificar a autoriza��o do usu�rio administrador
  Result := True; // Exemplo: administrador tem permiss�o
end;

{ TUserAuthorization }

function TUserAuthorization.IsAuthorized: Boolean;
begin
  // L�gica para verificar a autoriza��o do usu�rio comum
  Result := True; // Exemplo: usu�rio comum n�o tem permiss�o
end;

end.
