unit Cliente.Controller.Interfaces;

interface

uses
  Model.Cliente;

type
  iClienteController = interface

    procedure DeleteAllClientes;
    procedure ListAllClientes;
    function FindByID(Assigned : Integer) : Boolean;
  end;

implementation

end.
