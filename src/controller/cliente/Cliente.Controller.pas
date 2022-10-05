unit Cliente.Controller;

interface

uses
  Cliente.Controller.Interfaces,
  Cliente.DAO,
  Model.Cliente,
  DM.Conexao,
  Data.DB,
  FireDAC.Comp.Client;

type
  TClienteController = class( TInterfacedObject, iClienteController )
  constructor Create;
  destructor Destroy; override;

  private
    FDAOCliente : TClienteDAO;

  public
    procedure Salvar( aValue : TClienteModel );
    procedure Remover ( aValue : integer);
    procedure Editar( aValue : TClienteModel );

    function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;

  end;

implementation

uses
  System.SysUtils;

{ TClienteController }

constructor TClienteController.Create;
begin
  FDAOCliente := TClienteDAO.Create;
end;

destructor TClienteController.Destroy;
begin
  FDAOCliente.Free;

  inherited;
end;

procedure TClienteController.Editar(aValue: TClienteModel);
begin
  if VerificaSeExiste(aValue.Codigo) then
    FDAOCliente.Editar(aValue)
  else
    raise Exception.Create('Cliente não existe.');
end;

function TClienteController.RecuperaPorCodigo(aValue: integer;
  aColuna: string): string;
begin
  if VerificaSeExiste(aValue) then
    Result := FDAOCliente.RecuperaPorCodigo(aValue, aColuna)
  else
    raise Exception.Create('Cliente não existe.');
end;

function TClienteController.RecuperaTodos: TFDMemTable;
begin
  Result := FDAOCliente.RecuperaTodos;
end;

procedure TClienteController.Remover(aValue: integer);
begin
  if VerificaSeExiste(aValue) then
    FDAOCliente.Remover(aValue)
  else
    raise Exception.Create('Cliente não existe.');
end;

procedure TClienteController.Salvar(aValue: TClienteModel);
begin
  FDAOCliente.Salvar(aValue);
end;

function TClienteController.VerificaSeExiste(aValue: integer): Boolean;
begin
  Result := FDAOCliente.VerificaSeExiste(aValue);
end;

end.
