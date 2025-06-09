unit interfaces.controller.cliente;

interface

uses
  FireDAC.Comp.Client,
  entidade.cliente;

type
  IControllerCliente = interface
    ['{FEC0A4AF-E856-43AE-AFF7-1E46C070995A}']
    function LoadClientes(out ATable: TFDMemTable): Boolean;
    function CadastrarCliente(ACliente: TCliente): Boolean;
  end;

implementation

end.
