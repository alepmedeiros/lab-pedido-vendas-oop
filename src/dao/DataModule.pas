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
    FDConexao: TFDConnection;
    DataSource: TDataSource;
    FDMemTable: TFDMemTable;
    FDMemTableAux: TFDMemTable;
    DataSourceAux: TDataSource;
    FDQuery: TFDQuery;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;

  private
    FBancoCaminho: string;
    FDriverName: string;
    FUserName: string;

  public
    class function New: TDataModuleUnit;
//    procedure ConfigurarConn;
    procedure GravarIni;

    function LerIni: Boolean;

    property DriverName   : string read FDriverName write FDriverName;
    property UserName     : string read FUserName write FUserName;
    property BancoCaminho : string read FBancoCaminho write FBancoCaminho;
  end;

var
  DataModuleUnit: TDataModuleUnit;

const
  CaminhoBanco = 'Z:\Bruno\Documentos\Meus Projetos\lab-pedido-vendas-oop\db\lab_pedido_loja.db';

implementation

uses
  System.SysUtils, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleUnit.GravarIni;
var
  LArquivoIni : string;
  LIni        : TIniFile;
begin
  LArquivoIni := ChangeFileExt(Application.ExeName, '.ini');
  LArquivoIni := StringReplace(LArquivoIni, 'Win32\Debug\', '', [rfReplaceAll, rfIgnoreCase]);
  LIni        := TIniFile.Create(LArquivoIni);

  try
    with LIni do
    begin
      WriteString('Configuracao','driverName', FDriverName);
      WriteString('Configuracao','dbFilePath', FBancoCaminho);
      WriteString('Acesso','userName',         FUserName);
    end;
  finally
    LIni.free;
  end;
end;

function TDataModuleUnit.LerIni: Boolean;
var
  LArquivoIni : string;
  LIni        : TIniFile;
begin
  LArquivoIni := ChangeFileExt(Application.ExeName, '.ini');
  LArquivoIni := StringReplace(LArquivoIni, 'Win32\Debug\', '', [rfReplaceAll, rfIgnoreCase]);
  LIni        := TIniFile.Create(LArquivoIni);

  if not FileExists(LArquivoIni) then
    Result := False
  else
  begin
    try
      with LIni do
      begin
        FDriverName   := LIni.ReadString('Configuracao','driverName', '');
        FBancoCaminho := LIni.ReadString('Configuracao','dbFilePath', '');
        FUserName     := LIni.ReadString('Acesso','userName',         '');
      end;
    finally
      LIni.free;
      Result := True;
    end;
  end;
end;

//procedure TDataModuleUnit.ConfigurarConn;
//begin
//  if not FDConexao.Connected then
//  begin
//    FDConexao.DriverName      := FDriverName;
//    FDConexao.Params.Database := FBancoCaminho;
//    FDConexao.Params.UserName := FUserName;
//    try
//      FDConexao.Connected := True;
//    except
//      on E:Exception do
//      begin
//        raise Exception.Create('Error: ' + sLineBreak + E.Message);
//      end;
//    end;
//  end;
//end;

class function TDataModuleUnit.New: TDataModuleUnit;
begin
  Result := Self.Create(nil);
end;

end.
