unit Model.Connections.Firedac.Query;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util,
  FireDAC.Comp.Script,
  FireDAC.Comp.DataSet,
  Datasnap.DBClient,
  Model.Connections.Interfaces,
  System.Classes;

type
  TModelConnectionsFiredacQuery = class(TInterfacedObject, iModelConnectionQuery)
    private

    //FDMTable: TFDMemTable;
    //FDataSource: TDataSource;
    FDQuery1: TFDQuery;

    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelConnectionQuery;
      function SQL : TStrings;
      function ExecSQl : iModelConnectionQuery;
      function Open : iModelConnectionQuery;
      function DataSource (aValue : TDataSource) : iModelConnectionQuery;
  end;

implementation

uses
  Model.Connections.Firedac;

{ TModelConnectionsFiredac }

constructor TModelConnectionsFiredacQuery.Create;
begin

    FDquery1 := TFDQuery.Create(nil);
    FDQuery1.Connection :=TFDConnection( TModelConnectionsFiredac.New.Component );
end;

function TModelConnectionsFiredacQuery.DataSource(
  aValue: TDataSource): iModelConnectionQuery;
begin
  Result := Self;
  aValue.DataSet := FDQuery1;
end;

destructor TModelConnectionsFiredacQuery.Destroy;
begin
  FDquery1.Free;
  inherited;
end;

function TModelConnectionsFiredacQuery.ExecSQl: iModelConnectionQuery;
begin
  Result := Self;
  FDQuery1.ExecSQL;
end;

function TModelConnectionsFiredacQuery.SQL: TStrings;
begin
  Result := FDQuery1.SQL;
end;

class function TModelConnectionsFiredacQuery.New: iModelConnectionQuery;
begin
  Result := Self.Create;
end;

function TModelConnectionsFiredacQuery.Open: iModelConnectionQuery;
begin
  Result := Self;
  FDQuery1.Open();
end;

end.
