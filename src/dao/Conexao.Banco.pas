unit Conexao.Banco;

interface

uses
  System.SysUtils,
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
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util,
  FireDAC.Comp.Script,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.IBWrapper,
  Data.DB,
  Vcl.Forms;

type
  TConexao = class
  private
    FConexao: TFDConnection;

    FDriverConexao: string;
    FCaminhoBancoDeDados: string;
    FSenhaUsuario: string;
    FNomeUsuario: string;

    procedure ConfigurarConexao;
    procedure LerIni;
    procedure GravarIni;

  public
    constructor Create;
    destructor Destroy; override;

    function getConexao: TFDConnection;
    function CriarQuery: TFDQuery;

  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  LerIni;
  self.ConfigurarConexao;
end;

destructor TConexao.Destroy;
begin
  if Assigned(FConexao) then
  begin
    if FConexao.Connected then
    begin
      FConexao.Connected := False;
      FConexao.Close;
    end;

    FDFreeAndNil(FConexao);
  end;
  FConexao.Free;

  inherited;
end;

function TConexao.getConexao: TFDConnection;
begin
  Result := FConexao;
end;

procedure TConexao.ConfigurarConexao;
begin
  if not FConexao.Connected then
  begin
    FConexao.DriverName      := FDriverConexao;
    FConexao.Params.DriverID := FDriverConexao;
    FConexao.Params.Database := FCaminhoBancoDeDados;
    FConexao.Params.UserName := FNomeUsuario;
    FConexao.Params.Password := FSenhaUsuario;
    FConexao.LoginPrompt     := False;
    try
      FConexao.Connected := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('Error: ' + sLineBreak + E.Message);
      end;
    end;
  end;
end;

function TConexao.CriarQuery: TFDQuery;
var
  LQuery : TFDQuery;
begin
  LQuery            := TFDQuery.Create(nil);
  LQuery.Connection := FConexao;
  Result            := LQuery;
end;

procedure TConexao.LerIni;
var
  LArquivoIni : string;
  LIni        : TIniFile;
begin
  LArquivoIni := ChangeFileExt(Application.ExeName, '.ini');
  LArquivoIni := StringReplace(LArquivoIni, 'Win32\Debug\', '', [rfReplaceAll, rfIgnoreCase]);
  LIni        := TIniFile.Create(LArquivoIni);

  if not FileExists(LArquivoIni) then
  begin
    GravarIni;
    Application.Terminate;
  end
  else
  begin
    try
      with LIni do
      begin
        FDriverConexao       := LIni.ReadString('Configuracao','driverName', '');
        FCaminhoBancoDeDados := LIni.ReadString('Configuracao','dbFilePath', '');
        FNomeUsuario         := LIni.ReadString('Acesso','userName',         '');
      end;
    finally
      LIni.free;
    end;
  end;
end;

procedure TConexao.GravarIni;
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
      WriteString('Configuracao','driverName', '<driver de conexao>');
      WriteString('Configuracao','dbFilePath', '<caminho do banco de dados>');
      WriteString('Acesso','userName',         '<nome do user padrao>');
    end;
  finally
    LIni.free;
  end;
end;

end.
