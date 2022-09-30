unit LabPedidoOOP.Cliente.Controller;

interface

uses
  LabPedidoOOP.Cliente.Controller.Interfaces,
  LabPedidoOOP.Model.Cliente;

type
  TClienteController = class( TInterfacedObject, iClienteController )
  constructor Create;
  destructor Destroy; override;
  class function New : iClienteController;

  private
    { private declarations }

  public
    { private declarations }

    procedure DeleteAllClientes;
    procedure ListAllClientes;
    function FindByID(Assigned : Integer) : Boolean;

  end;

implementation

{ TClienteController }

constructor TClienteController.Create;
begin

end;

procedure TClienteController.DeleteAllClientes;
begin

end;

destructor TClienteController.Destroy;
begin

  inherited;
end;

function TClienteController.FindByID(Assigned: Integer): Boolean;
begin

end;

procedure TClienteController.ListAllClientes;
begin

end;

class function TClienteController.New: iClienteController;
begin

end;


end.
