unit mvclive.model.connection.impl.firedac;

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
  TConnectionFiredac = class(TInterfacedObject, iConnection)
  private
    FConn: TFDConnection;
    FConf: iConfiguration;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: iConnection;
    function Connection: TCustomConnection;
  end;

implementation

uses
  mvclive.model.connection.impl.configuration;

function TConnectionFiredac.Connection: TCustomConnection;
begin
  Result := FConn;
end;

constructor TConnectionFiredac.Create;
begin
  FConn:= TFDConnection.Create(nil);
  FConf := TConfiguration.New(ExtractFilePath(ParamStr(0)));
  try
    FConn.Params.Clear;
    FConn.Params.DriverID := FConf.GetDriverName;
    FConn.Params.UserName := FConf.GetUsuario;
    FConn.Params.Password := FConf.GetSenha;

    if FConf.GetDriverName.Equals('SQLite') then
      FConn.Params.Add('LockingMode=Normal');
  except
    raise Exception.Create('Error ao tentar conectar com a base de dados, favor entrar em contato com o suporte');
  end;
end;

destructor TConnectionFiredac.Destroy;
begin
  FConn.Free;
  inherited;
end;

class function TConnectionFiredac.New: iConnection;
begin
  Result := Self.Create;
end;

end.