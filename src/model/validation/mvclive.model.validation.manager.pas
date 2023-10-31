unit mvclive.model.validation.manager;

interface

uses
  System.Generics.Collections;

type
  TUserType = (utAdmin, utUser);

type
  IAuthorizationStrategy = interface
    function IsAuthorized: Boolean;
  end;

type
  TAuthorizationManager = class
  private
    FStrategyMap: TDictionary<TUserType, IAuthorizationStrategy>;
  public
    constructor Create;
    function GetAuthorizationStrategy(UserType: TUserType): IAuthorizationStrategy;
  end;

implementation

uses
  mvclive.model.validation;

constructor TAuthorizationManager.Create;
begin
  FStrategyMap := TDictionary<TUserType, IAuthorizationStrategy>.Create;
  FStrategyMap.Add(utAdmin, TAdminAuthorization.Create);
  FStrategyMap.Add(utUser, TUserAuthorization.Create);
  // Adicione outras estratégias, se necessário
end;

function TAuthorizationManager.GetAuthorizationStrategy(
  UserType: TUserType): IAuthorizationStrategy;
begin
  if FStrategyMap.TryGetValue(UserType, Result) then
    Exit;
end;

end.
