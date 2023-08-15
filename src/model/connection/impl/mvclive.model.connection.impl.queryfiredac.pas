unit mvclive.model.connection.impl.queryfiredac;

interface

uses
  System.Generics.Collections,
  Data.DB,
  Datasnap.DBClient,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  mvclive.model.connection.interfaces;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FDQuery: TFDQuery;

    procedure PreencheQuery(Value: String);
    procedure PreencheParams(Value: Array of Variant);

    constructor Create(Conn: iConexao);
    destructor Destroy; override;
  public
    class function New(Conn: iConexao): iQuery;
    procedure Query(const Statement: String; const Params: Array of Variant); overload;
    function OneAll(const Statement: Variant; const Params: Array of Variant): TDataSet; overload;
    procedure Query(const Statement: String; const Params: TDictionary<String, Variant>); overload;
    function OneAll(const Statement: String; const Params: TDictionary<String, Variant>): TDataSet; overload;
  end;

implementation

constructor TQuery.Create(Conn: iConexao);
begin
  FDQuery:= TFDQuery.Create(nil);
  FDQuery.Connection := TFDConnection(Conn.Connection);
end;

destructor TQuery.Destroy;
begin
  FDQuery.Free;
  inherited;
end;

class function TQuery.New(Conn: iConexao): iQuery;
begin
  Result := Self.Create(Conn);
end;

function TQuery.OneAll(const Statement: String;
  const Params: TDictionary<String, Variant>): TDataSet;
begin
  FDQuery.SQL.Add(Statement);
  for var I in Params.Keys do
    if not (FDQuery.Params.FindParam(I) = nil) then
      FDQuery.ParamByName(I).Value := Params.Items[I];

  FDQuery.Open();
  Result := FDQuery;
end;

procedure TQuery.PreencheParams(Value: array of Variant);
begin
  for var I := Low(Value) to High(Value) do
  begin
    FDQuery.Params.Add;
    FDQuery.Params[I].Value := Value[I];
  end;
end;

procedure TQuery.PreencheQuery(Value: String);
begin
  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(Value);
end;

procedure TQuery.Query(const Statement: String; const Params: TDictionary<String, Variant>);
begin
  FDQuery.SQL.Add(Statement);
  for var I in Params.Keys do
    if not (FDQuery.Params.FindParam(I) = nil) then
      FDQuery.ParamByName(I).Value := Params.Items[I];

  FDQuery.ExecSQL;
end;

function TQuery.OneAll(const Statement: Variant;
  const Params: array of Variant): TDataSet;
begin
  PreencheQuery(Statement);
  PreencheParams(Params);

  FDQuery.Open();
  Result := FDQuery;
end;

procedure TQuery.Query(const Statement: String; const Params: array of Variant);
begin
  PreencheQuery(Statement);
  PreencheParams(Params);
  FDQuery.ExecSQL;
end;

end.
