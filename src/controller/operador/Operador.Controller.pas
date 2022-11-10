unit Operador.Controller;

interface

uses
  Operador.Controller.Interfaces,
  Model.Operador,
  Model.Interfaces.Operador,
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
    FOperador : iOperador;

  public
    procedure salvar( aNome : string );
    procedure Remover ( aValue : integer);

    procedure Editar( aValue : TOperadorModel ); overload;
    procedure Editar( aCodigo, aNome : string ); overload;


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

procedure TOperadorController.Editar(aCodigo, aNome: string);
begin
  if VerificaSeExiste( StrToInt(aCodigo) ) then
  begin
    FOperador := TOperadorModel.New;

    FOperador
      .Codigo( StrToInt(aCodigo) )
      .Nome( aNome );

    FDAOOperador.Editar( TOperadorModel(FOperador) );
  end
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

procedure TOperadorController.salvar(aNome : string);
begin
  FOperador := TOperadorModel.New;

  FOperador
    .Nome(aNome);

  FDAOOperador.Salvar( TOperadorModel(FOperador) );
end;

function TOperadorController.VerificaSeExiste(aValue: integer): Boolean;
begin
  Result := FDAOOperador.VerificaSeExiste(aValue);
end;

end.
