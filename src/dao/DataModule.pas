unit DataModule;

interface

uses
  System.Classes,
  System.IniFiles,
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
  FireDAC.Phys.IBWrapper;

type
  TDataModuleUnit = class(TDataModule)
    DataSource: TDataSource;
    FDMemTable: TFDMemTable;
    FDMemTableAux: TFDMemTable;
    DataSourceAux: TDataSource;

  private

  public
    class function New: TDataModuleUnit;
  end;

var
  DataModuleUnit: TDataModuleUnit;

implementation

uses
  System.SysUtils, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

class function TDataModuleUnit.New: TDataModuleUnit;
begin
  Result := Self.Create(nil);
end;

end.
