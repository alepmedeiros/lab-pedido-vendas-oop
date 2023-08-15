unit mvclive.model.connection.impl.conexaofiredac;

interface

uses
  System.SysUtils,
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
  TConexaoFiredac = class(TInterfacedObject, iConexao)
  private
    FDConnection: TFDConnection;
    FConfiguracao: iConfiguracao;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: iConexao;
    function Connection: TCustomConnection;
  end;

implementation

uses
  mvclive.model.connection.impl.configuracao;

function TConexaoFiredac.Connection: TCustomConnection;
begin
  Result := FDConnection;
end;

constructor TConexaoFiredac.Create;
begin
  FDConnection := TFDConnection.Create(nil);
  FConfiguracao:= TConfiguracao.New(ExtractFilePath(ParamStr(0))+'conf.ini');
  try
    FDConnection.Params.Clear;
    FDConnection.DriverName := FConfiguracao.GetDriverName;
    FDConnection.Params.Database := FConfiguracao.GetCaminho;
    FDConnection.Params.UserName := FConfiguracao.GetUsuario;
    FDConnection.Params.Password := FConfiguracao.GetSenha;

    if FConfiguracao.GetDriverName.Equals('SQLite') then
      FDConnection.Params.Add('LockingMode=Normal');
  except
    raise Exception.Create('Error ao tentar conectar com a base de dados, favor contatar o suporte!');
  end;
end;

destructor TConexaoFiredac.Destroy;
begin
  FDConnection.Free;
  inherited;
end;

class function TConexaoFiredac.New: iConexao;
begin
  Result := Self.Create;
end;

end.
