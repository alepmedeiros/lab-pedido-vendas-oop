unit DM.Connection;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
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
  FireDAC.Comp.DataSet;


type
 TDataModuleConnection = class(TDataModule)
    FDMConnection: TFDConnection;
    FDMTable: TFDMemTable;
    FDataSource: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure ConnectionConfig;
  public
    class function New: TDataModuleConnection;
  end;
var
  DataModuleConnection: TDataModuleConnection;
const
  DBName    = '\OOP';
  BDPath = 'C:\cursosDev\lab-alex\lab-pedido-vendas-oop\project\DB' + DBName;
implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
procedure TDataModuleConnection.ConnectionConfig;
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
      Open;
    end;
end;
procedure TDataModuleConnection.DataModuleCreate(Sender: TObject);
begin
  FDMConnection.Create(self);
  ConnectionConfig;
end;
procedure TDataModuleConnection.DataModuleDestroy(Sender: TObject);
begin
  FDMConnection.Free;
end;
class function TDataModuleConnection.New: TDataModuleConnection;
begin
  Result := Self.Create(nil);
end;

end.
