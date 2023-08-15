unit mvclive.model.connection.impl.configuracao;

interface

uses
  System.SysUtils,
  IniFiles,
  mvclive.model.connection.interfaces;

type
  TConfiguracao = class(TInterfacedObject, iConfiguracao)
  const
    SECTION = 'CONFIG';
    CAMINHO = 'CAMINHO';
    PORTA = 'PORTA';
    SERVIDOR = 'SERVIDOR';
    USUARIO = 'USERNAME';
    SENHA = 'PASSWORD';
    DRIVERNAME = 'DRIVERNAME';
  private
    FArquivo: TIniFile;

    constructor Create(FileName: String);
    destructor Destroy; override;
  public
    class function New(FileName: String): iConfiguracao;
    function GetProtocolo: String;
    function SetServidor(Value: String): iConfiguracao;
    function GetServidor: String;
    function SetPorta(Value: Integer): iConfiguracao;
    function GetPorta: Integer;
    function SetUsuario(Value: String): iConfiguracao;
    function GetUsuario: String;
    function SetSenha(Value: String): iConfiguracao;
    function GetSenha: String;
    function SetCaminho(Value: String): iConfiguracao;
    function GetCaminho: String;
    function SetDriverName(Value: String): iConfiguracao;
    function GetDriverName: String;
  end;

implementation

constructor TConfiguracao.Create(FileName: String);
begin
  FArquivo:= TIniFile.Create(FileName);
end;

destructor TConfiguracao.Destroy;
begin
  FArquivo.Free;
  inherited;
end;

function TConfiguracao.GetCaminho: String;
begin
  Result := FArquivo.ReadString(SECTION, CAMINHO, '');
end;

function TConfiguracao.GetDriverName: String;
begin
  Result := FArquivo.ReadString(SECTION, DRIVERNAME, '');
end;

function TConfiguracao.GetPorta: Integer;
begin
  Result := FArquivo.ReadInteger(SECTION, PORTA, 0);
end;

function TConfiguracao.GetProtocolo: String;
begin
  if FArquivo.ReadString(SECTION,SERVIDOR,'').Equals('LOCALHOST') or
    FArquivo.ReadString(SECTION,SERVIDOR,'').Equals('127.0.0.1') then
    Result := 'LOCAL'
  else
    Result := 'TCP';
end;

function TConfiguracao.GetSenha: String;
begin
  Result := FArquivo.ReadString(SECTION, SENHA, '');
end;

function TConfiguracao.GetServidor: String;
begin
  Result := FArquivo.ReadString(SECTION, SERVIDOR, '');
end;

function TConfiguracao.GetUsuario: String;
begin
  Result := FArquivo.ReadString(SECTION, USUARIO, '');
end;

class function TConfiguracao.New(FileName: String): iConfiguracao;
begin
  Result := Self.Create(FileName);
end;

function TConfiguracao.SetCaminho(Value: String): iConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECTION, CAMINHO, Value);
end;

function TConfiguracao.SetDriverName(Value: String): iConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECTION, DRIVERNAME, Value);
end;

function TConfiguracao.SetPorta(Value: Integer): iConfiguracao;
begin
  Result := Self;
  FArquivo.WriteInteger(SECTION, PORTA, Value);
end;

function TConfiguracao.SetSenha(Value: String): iConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECTION, SENHA, Value);
end;

function TConfiguracao.SetServidor(Value: String): iConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECTION, SERVIDOR, Value);
end;

function TConfiguracao.SetUsuario(Value: String): iConfiguracao;
begin
  Result := Self;
  FArquivo.WriteString(SECTION, USUARIO, Value);
end;

end.
