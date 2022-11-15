unit Conexao.Banco.Control;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  Conexao.Banco,
  Data.DB;

type
  TConexaoControl = class
    private
      FConexao : TConexao;
      class var FInstancia : TConexaoControl;

    public
      constructor Create;
      destructor Destroy; override;
      class function getInstancia : TConexaoControl;
      property Conexao : TConexao read FConexao write FConexao;
  end;

implementation

{ TConexaoControl }

constructor TConexaoControl.Create;
begin
  FConexao := TConexao.Create;
end;

destructor TConexaoControl.Destroy;
begin
  if Assigned(FConexao) then
    FreeAndNil(FConexao);

  inherited;
end;

class function TConexaoControl.getInstancia: TConexaoControl;
begin
  if not Assigned(Self.FInstancia) then
  begin
    Self.FInstancia := TConexaoControl.Create;
  end;

  Result := Self.FInstancia;
end;

end.
