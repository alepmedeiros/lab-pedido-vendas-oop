unit DM.Conexao;

interface

uses
  System.SysUtils,
  System.Classes,
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
  TDataModuleConexao = class(TDataModule)
    FDConexao: TFDConnection;
    DataSource: TDataSource;
    FDMemTable: TFDMemTable;
    FDScriptCarregaTabelas: TFDScript;
    FDMemTableAux: TFDMemTable;
    DataSourceAux: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    procedure ConfigurarConn;

  public
    class function New: TDataModuleConexao;
  end;

var
  DataModuleConexao: TDataModuleConexao;

const
  NomeBanco    = '\lab_pedido_loja.db';
  CaminhoBanco = 'Z:\Bruno\Documentos\Meus Projetos\lab-pedido-vendas-oop\db' + NomeBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleConexao.ConfigurarConn;
begin
  if not FDConexao.Connected then
    with FDConexao do
    begin
      with Params do
      begin
        Clear;
        Add('DriverID=SQLite');
        Add('LockingMode=Normal');
        Add('Synchronous=Normal');
        Add('Database=' + CaminhoBanco);
      end;
      Open;
    end;
end;

procedure TDataModuleConexao.DataModuleCreate(Sender: TObject);
begin
  FDConexao.Create(self);
  ConfigurarConn;
end;

procedure TDataModuleConexao.DataModuleDestroy(Sender: TObject);
begin
  FDConexao.Free;
end;

class function TDataModuleConexao.New: TDataModuleConexao;
begin
  Result := Self.Create(nil);
end;

end.
