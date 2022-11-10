unit Model.Connections;

interface

uses
  Model.Connections.Interfaces;

type
  TModelConnections = class (TinterfacedObject, iModelConnections)
  private
  FFiredac : iModelConnectionQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelConnections;
    function Firedac : iModelConnectionQuery;
  end;

implementation

uses
  Model.Connections.Firedac.Query;

{ TModelConnections }

constructor TModelConnections.Create;
begin

end;

destructor TModelConnections.Destroy;
begin

  inherited;
end;

function TModelConnections.Firedac: iModelConnectionQuery;
begin
  if not Assigned(FFiredac) then
    FFiredac := TModelConnectionsFiredacQuery.New;

  //Result := FFiredac;   qual seria o certo aqui?
  Result := TModelConnectionsFiredacQuery.New;
end;

class function TModelConnections.New: iModelConnections;
begin
  Result := Self.Create;
end;

end.
