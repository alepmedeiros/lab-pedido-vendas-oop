unit Operador.Controller;

interface

uses
  Operador.Controller.Interfaces,
  Operador.DAO.Interfaces,
  Model.Operador;

type
  TOperadorController = class(TInterfacedObject, iOperadorController)
  constructor Create;
  destructor Destroy; override;
  class function New: iOperadorController;

  private
    FOperadorDAO : iOperadorDAO;

  public
    procedure salvar( aValue : TOperadorModel );

    function NovoOperador : TOperadorModel;

  end;

implementation

{ TOperadorController }

destructor TOperadorController.Destroy;
begin

  inherited;
end;

class function TOperadorController.New: iOperadorController;
begin
  Result := Self.Create;
end;

function TOperadorController.NovoOperador: TOperadorModel;
begin
  Result := NovoOperador;
end;

procedure TOperadorController.salvar(aValue: TOperadorModel);
begin

end;

constructor TOperadorController.Create;
begin
  Self.Create;
end;

end.
