unit entidade.conexao;

interface

uses
  System.SysUtils,
  FireDac.comp.Client,
//  FireDAC.Comp.UI,
//  FireDAC.Stan.Intf,
//  FireDAC.Phys.IBWrapper,
  FIreDAC.Stan.Def,
//  FireDAC.Phys.SQLiteDef,
//  FireDAC.Stan.Pool,
//  FireDAC.Stan.Async,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.SQLite,
  entidade.configuracao,
  interfaces.conexao,
  interfaces.configuracao;

type
  TConexao = class(TInterfacedObject, IConexao)
    private
      Fconexao: TFDConnection;
      function getConnectionDefName : string;
      procedure Desconectar;
      function Sessao: TFDConnection;
      procedure Setconexao(const Value: TFDConnection);
    public
      constructor create;
      destructor destroy; override;

      function Conectar: Boolean;
      function getConexao: TFDConnection;
      property conexao: TFDConnection read Fconexao write Setconexao;
  end;

implementation

{ TConexao }

function TConexao.Conectar: Boolean;
begin
  if not Assigned(Fconexao) then
    Fconexao := Sessao;

  result := FConexao.Connected;
end;

constructor TConexao.create;
begin

end;

procedure TConexao.Desconectar;
begin
  FConexao.Connected := False;
  FConexao.Free;
end;

destructor TConexao.destroy;
begin
  Desconectar;
end;

function TConexao.getConexao: TFDConnection;
begin
  if not Assigned(Fconexao) then
    Fconexao := Sessao;

  result := Fconexao;
end;

function TConexao.getConnectionDefName: string;
var
  FInstanciaConfiguracao: IConfiguracao;
begin

  FInstanciaConfiguracao := TConfiguracao.new;

  FInstanciaConfiguracao.carregarConfiguracoes;

  FConexao.Params.Database := FInstanciaConfiguracao.getPathDB;
  FConexao.Params.OwnsObjects := true;
//  FConexao.Params.Add('LockingMode=Normal');
  FConexao.DriverName :=  FInstanciaConfiguracao.getDriverID;
  FConexao.Connected := True;
end;

function TConexao.Sessao: TFDConnection;
begin
  if not Assigned(FConexao) then
  begin
    FConexao := TFDConnection.Create(nil);
    FConexao.ConnectionDefName := getConnectionDefName;
  end;

  result := FConexao;
end;

procedure TConexao.Setconexao(const Value: TFDConnection);
begin
  Fconexao := Value;
end;

end.
