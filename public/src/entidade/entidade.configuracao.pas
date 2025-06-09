unit entidade.configuracao;

interface

uses
  System.SysUtils,
  IniFiles,
  interfaces.configuracao;

type
  TConfiguracao = class(TInterfacedObject, IConfiguracao)
    private
      FPath: string;
      FpathExe: string;
      FdriverID: string;
      procedure SetPath(const Value: string);
      procedure SetpathExe(const Value: string);
      procedure SetdriverID(const Value: string);
      constructor create;
      destructor destroy; override;
    public
      class function new: IConfiguracao;
      function carregarConfiguracoes : IConfiguracao;
      function getPathExe: string;
      function getPathDB: string;
      function getDriverID: string;

      property Path: string read FPath write SetPath;
      property pathExe: string read FpathExe write SetpathExe;
      property driveID: string read FdriverID write SetdriverID;
  end;

var
  FInstanciaConfiguracao : IConfiguracao;

implementation

{ TConfiguracao }

constructor TConfiguracao.create;
begin
  Self.FPath     := '';
  Self.FPathExe  := '';
  Self.FdriverID    := '';
end;

destructor TConfiguracao.destroy;
begin
end;

function TConfiguracao.getDriverID: string;
begin
  result := Self.FdriverID;
end;

function TConfiguracao.getPathDB: string;
begin
  result := self.Fpath;
end;

function TConfiguracao.getPathExe: string;
begin
  result := self.FpathExe;
end;

function TConfiguracao.carregarConfiguracoes: IConfiguracao;
var
  LArqIni    : TIniFile;
begin
  result := Self;
  try
    LArqIni        := TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
    Self.FPath     := LArqIni.ReadString('CONEXAO','Database',ExtractFilePath(ParamStr(0))+'labVenda.db');
    Self.FdriverID := LArqIni.ReadString('CONEXAO','DriverID','SQLite');
    Self.FpathExe  := ExtractFilePath(ParamStr(0));
  finally
    LArqIni.Free;
  end;
end;

class function TConfiguracao.new: IConfiguracao;
begin
  if not Assigned(FInstanciaConfiguracao) then
    FInstanciaConfiguracao := Self.create;

  result := FInstanciaConfiguracao;
end;

procedure TConfiguracao.SetDriverID(const Value: string);
begin
  FdriverID := Value;
end;

procedure TConfiguracao.SetPath(const Value: string);
begin
  FPath := Value;
end;

procedure TConfiguracao.SetpathExe(const Value: string);
begin
  FpathExe := Value;
end;

end.
