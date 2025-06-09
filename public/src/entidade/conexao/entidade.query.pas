unit entidade.query;

interface

uses
  interfaces.query, FireDAC.Comp.Client, entidade.conexao, interfaces.conexao,
  FireDAC.DApt, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Stan.Async, Data.FireDACJSONReflect;

type
  TQuery = class(TInterfacedObject, IQuery)
  private
    FQuery: TFDQuery;
  published
    constructor create;
    destructor destroy; override;
    function getQuery : TFDQuery;
    function newquery: IQuery;
    procedure destroyQuery;
    function Open(ATable: TFDMemTable; Ascript: string): Boolean;
    function recuperarUltimoId(Ascript: string): Integer;
    function executar(Ascript: string): Boolean;

  property Query : TFDQuery  read FQuery write FQuery;

  end;

implementation

{ TQuery }

function TQuery.newquery: IQuery;
var
  LConexao: IConexao;
begin
  LConexao := TConexao.Create;

  if LConexao.Conectar then
  begin
    Self.Query := TFDQuery.Create(nil);
    Self.Query.Connection := LConexao.getConexao;
  end;

  result := Self;
end;

constructor TQuery.create;
begin

end;

destructor TQuery.destroy;
begin
  destroyQuery;
  inherited;
end;

procedure TQuery.destroyQuery;
begin
  Self.Query.Free;
end;

function TQuery.executar(Ascript: string): Boolean;
var
  LConexao: IConexao;
  LResult: Integer;
begin

  LConexao := TConexao.Create;

  if LConexao.Conectar then
  begin
    Self.Query := TFDQuery.Create(nil);
    Self.Query.Connection := LConexao.getConexao;

    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    LResult := Self.FQuery.ExecSQL(Ascript);
    result := LResult = 1;
  end;
end;

function TQuery.Open(ATable: TFDMemTable; Ascript: string): Boolean;
var
  LConexao: IConexao;
begin
  LConexao := TConexao.Create;

  if LConexao.Conectar then
  begin
    Self.Query := TFDQuery.Create(nil);
    Self.Query.Connection := LConexao.getConexao;

    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.Open(Ascript);
  end;

  result := Self.FQuery.RecordCount > 0;

  if result then
  begin
    ATable.Close;
    ATable.CopyDataSet(Self.FQuery);
  end;
end;

function TQuery.recuperarUltimoId(Ascript: string): Integer;
var
  LConexao: IConexao;
begin
  LConexao := TConexao.Create;

  if LConexao.Conectar then
  begin
    Self.Query := TFDQuery.Create(nil);
    Self.Query.Connection := LConexao.getConexao;

    Self.FQuery.Close;
    Self.FQuery.SQL.Clear;
    Self.FQuery.Open(Ascript);
  end;

  result := Self.FQuery.Fields[0].AsInteger;
end;

function TQuery.getQuery: TFDQuery;
begin
  Result := FQuery;
end;

end.
