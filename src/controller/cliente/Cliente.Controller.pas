unit Cliente.Controller;

interface

uses
  { Cliente }
  Cliente.Controller.Interfaces,
  Cliente.DAO,
  Model.Cliente,
  Model.Interfaces.Cliente,
  {  }
  DM.Conexao,
  Data.DB,
  FireDAC.Comp.Client;

type
  TClienteController = class( TInterfacedObject, iClienteController )
  constructor Create;
  destructor Destroy; override;

  private
    FDAOCliente : TClienteDAO;
    FCliente    : iCliente;

  public
    procedure Salvar( aValue : TClienteModel ); overload;
    procedure Salvar( aNome, aCidade, aUF : string ); overload;

    procedure Editar( aValue : TClienteModel ); overload;
    procedure Editar( aCodigo, aNome, aCidade, aUF : string ); overload;

    procedure Remover ( aValue : integer);

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

procedure TClienteController.Editar(aCodigo, aNome, aCidade, aUF: string);
begin
  FCliente := TClienteModel.New;

  FCliente
    .Codigo( StrToInt(aCodigo) )
    .Nome(aNome)
    .Cidade(aCidade)
    .UF(aUF);

  FDAOCliente.Editar( TClienteModel(FCliente) );
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

procedure TClienteController.Salvar(aNome, aCidade, aUF: string);
begin
  FCliente := TClienteModel.New;

  FCliente
    .Nome(aNome)
    .Cidade(aCidade)
    .UF(aUF);

  FDAOCliente.Salvar( TClienteModel(FCliente) );
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
