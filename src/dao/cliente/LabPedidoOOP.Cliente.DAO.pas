unit LabPedidoOOP.Cliente.DAO;

interface

uses
  LabPedidoOOP.Model.Cliente,
  LabPedidoOOP.Cliente.DAO.Interfaces,
  LabPedidoOOP.Model.Interfaces.Cliente;

type
  TClienteDAO = class(TInterfacedObject, iClienteDAO)
    constructor Create;
    destructor Destroy; override;
    private
      FCliente : iCliente;

    public
      procedure DeleteAll;
  end;

implementation

{ TClienteDAO }

constructor TClienteDAO.Create;
begin
  Self.FCliente := TCliente.New;
end;

procedure TClienteDAO.DeleteAll;
begin

end;

destructor TClienteDAO.Destroy;
begin

  inherited;
end;

end.
