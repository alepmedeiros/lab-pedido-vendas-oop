unit mvclive.utils.query;

interface

uses
  mvclive.utils.interfaces;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FParent: TObject;

    constructor Create(Parent: IInterface);
  public
    class function New(Parent: IInterface): iQuery;
    function Fields: String;
    function Params: String;
    function Update: String;
    function Where: String;
  end;

implementation

uses
  System.SysUtils,
  System.Rtti;

constructor TQuery.Create(Parent: IInterface);
begin
  FParent := TObject(Parent);
end;

function TQuery.Fields: String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  lContexto := TRttiContext.Create;
  try
    lTipo := lContexto.GetType(FParent);

    for var I in lTipo.GetFields do
      Result := Result + ', ';
  finally
    Result := Copy(Result, 0, Result.Length-2);
    lContexto.Free;
  end;
end;

class function TQuery.New(Parent: IInterface): iQuery;
begin
  Result := Self.Create(Parent);
end;

function TQuery.Params: String;
begin

end;

function TQuery.Update: String;
begin

end;

function TQuery.Where: String;
begin

end;

end.
