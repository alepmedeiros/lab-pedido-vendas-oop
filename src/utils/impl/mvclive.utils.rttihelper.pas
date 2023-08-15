unit mvclive.utils.rttihelper;

interface

uses
  System.Rtti;

type
  TRttiTypeHelper = class helper for TRttiType
  public
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

  TRttiFieldHelper = class helper for TRttiField
  public
    function Tem<T: TCustomAttribute>: Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

implementation

{ TRttiTypeHelper }

function TRttiTypeHelper.GetAttribute<T>: T;
var
  lAtributo: TCustomAttribute;
begin
  Result := nil;
  for lAtributo in GetAttributes do
    if lAtributo is T then
      Exit((lAtributo as T));
end;

function TRttiTypeHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil;
end;

{ TRttiFieldHelper }

function TRttiFieldHelper.GetAttribute<T>: T;
var
  lAtributo: TCustomAttribute;
begin
  Result := nil;
  for lAtributo in GetAttributes do
    if lAtributo is T then
      Exit((lAtributo as T));
end;

function TRttiFieldHelper.Tem<T>: Boolean;
begin
  Result := GetAttribute<T> <> nil;
end;

end.
