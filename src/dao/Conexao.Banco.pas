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
  Data.DB;

type
  TConexao = class
  private
    FConexao: TFDConnection;
    procedure ConfigurarConexao;
    function CriarQuery: TFDQuery;

  public
    constructor Create;
    destructor Destroy; override;
    function getConexao: TFDConnection;

  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);

  self.ConfigurarConexao;
end;

destructor TConexao.Destroy;
begin
  FDFreeAndNil(FConexao);

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
    FConexao.DriverName      := 'SQLite';
    FConexao.Params.DriverID := 'SQLite';
    FConexao.Params.Database := 'Z:\Bruno\Documentos\Meus Projetos\lab-pedido-vendas-oop\db\lab_pedido_loja.db';
    FConexao.Params.UserName := 'silv4b';
    FConexao.Params.Password := '';
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

end.
