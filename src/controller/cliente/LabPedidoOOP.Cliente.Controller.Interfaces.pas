unit LabPedidoOOP.Cliente.Controller.Interfaces;

interface

uses
  LabPedidoOOP.Model.Cliente;

type
  iClienteController = interface

    procedure DeleteAllClientes;
    procedure ListAllClientes;
    function FindByID(Assigned : Integer) : Boolean;
  end;

implementation

end.
