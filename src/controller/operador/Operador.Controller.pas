unit Operador.Controller;

interface

uses
  Operador.Controller.Interfaces,
  Model.Operador,
  DM.Conexao,
  FireDAC.Comp.Client,
  Data.DB,
  Operador.DAO;

type
  TOperadorController = class(TInterfacedObject, iOperadorController)
  constructor Create;
  destructor Destroy; override;

  private
    FDAOOperador : TOperadorDAO;

  public
    procedure salvar( aValue : TOperadorModel );
    procedure Remover ( aValue : integer);
    procedure Editar( aValue : TOperadorModel );

    function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;

    function RetornaOperador( aValue : Integer) : TOperadorModel;
  end;

implementation

uses
  System.SysUtils;

{ TOperadorController }

constructor TOperadorController.Create;
begin
  FDAOOperador := TOperadorDAO.Create;
end;

destructor TOperadorController.Destroy;
begin
  FDAOOperador.Free;

  inherited;
end;

procedure TOperadorController.Editar(aValue: TOperadorModel);
begin
  if VerificaSeExiste(aValue.Codigo) then
    FDAOOperador.Editar(aValue)
  else
    raise Exception.Create('Operador não existe.');
end;

function TOperadorController.RecuperaPorCodigo(aValue: integer;
  aColuna: string): string;
begin
  if VerificaSeExiste(aValue) then
    Result := FDAOOperador.RecuperaPorCodigo(aValue, aColuna)
  else
    raise Exception.Create('Operador não existe.');
end;

function TOperadorController.RecuperaTodos: TFDMemTable;
begin
  Result := FDAOOperador.RecuperaTodos;
end;

procedure TOperadorController.Remover(aValue: integer);
begin
  if VerificaSeExiste(aValue) then
    FDAOOperador.Remover(aValue)
  else
    raise Exception.Create('Operador não existe.');
end;

function TOperadorController.RetornaOperador(aValue: Integer): TOperadorModel;
begin
  Result := TOperadorModel(FDAOOperador.RetornaOperador(aValue));
end;

procedure TOperadorController.salvar(aValue: TOperadorModel);
begin
  FDAOOperador.Salvar(aValue);
end;

function TOperadorController.VerificaSeExiste(aValue: integer): Boolean;
begin
  Result := FDAOOperador.VerificaSeExiste(aValue);
end;

end.
