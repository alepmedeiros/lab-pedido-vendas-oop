unit Model.Connections.Firedac;

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
  TModelConnectionsFiredac = class (TinterfacedObject, iModelConnectionGeneric)
    private
    FDMConnection: TFDConnection;
      procedure ConnectionConfig;

    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelConnectionGeneric;
      function Component : TComponent;
  end;

const
  DBName    = '\OOP.db';
  BDPath = 'C:\cursosDev\lab-alex\lab-pedido-vendas-oop\project\DB' + DBName;

var
 vConnectionFiredac : iModelConnectionGeneric;

implementation

{ TModelConnectionsFiredac }

function TModelConnectionsFiredac.Component: TComponent;
begin
  Result := FDMConnection;
end;

procedure TModelConnectionsFiredac.ConnectionConfig;
begin
  if not FDMConnection.Connected then
    with FDMConnection do
    begin
      with Params do
      begin
        Clear;
        Add('DriverID=SQLite');
        Add('LockingMode=Normal');
        Add('Synchronous=Normal');
        Add('Database=' + BDPath);
      end;
      Open();

    end;
end;

constructor TModelConnectionsFiredac.Create;
begin
  FDMConnection := TFDConnection.Create(nil);
  ConnectionConfig;
end;

destructor TModelConnectionsFiredac.Destroy;
begin
  FDMConnection.Free;

  inherited;
end;

class function TModelConnectionsFiredac.New: iModelConnectionGeneric;
begin
  if not Assigned( vConnectionFiredac ) then
    vConnectionFiredac := Self.Create;

  Result := vConnectionFiredac;
end;

end.
