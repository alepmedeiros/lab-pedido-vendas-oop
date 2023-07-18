unit mvclive.model.connection.impl.query;

interface

uses
  Data.DB,
  mvclive.model.connection.interfaces,
  FireDAC.Comp.Client;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FQuery: TFDQuery;

    procedure PreencheQuery(Value: String);
    procedure PreencheParams(Value: Array of Variant);

    constructor Create(Conn: iConnection);
    destructor Destroy; override;
  public
    class function New(Conn: iConnection): iQuery;
    procedure Query(const Statement: String; Params: Array of Variant); overload;
    function Query(const Statement: Variant; Params: Array of Variant): TDataSet; overload;
  end;

implementation

constructor TQuery.Create(Conn: iConnection);
begin
  FQuery:= TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(Conn.Connection);
end;

destructor TQuery.Destroy;
begin
  FQuery.Free;
  inherited;
end;

class function TQuery.New(Conn: iConnection): iQuery;
begin
  Result := Self.Create(Conn);
end;

procedure TQuery.PreencheParams(Value: array of Variant);
begin
  for var I := Low(Value) to High(Value) do
  begin
    FQuery.Params.Add;
    FQuery.Params[I].Value := Value[I];
  end;
end;

procedure TQuery.PreencheQuery(Value: String);
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

function TQuery.Query(const Statement: Variant;
  Params: array of Variant): TDataSet;
begin
  PreencheQuery(Statement);
  PreencheParams(Params);

  FQuery.Open;
  Result := FQuery;
end;

procedure TQuery.Query(const Statement: String; Params: array of Variant);
begin
  PreencheQuery(Statement);
  PreencheParams(Params);

  FQuery.ExecSQL;
end;

end.
