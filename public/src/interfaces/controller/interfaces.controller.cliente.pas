unit interfaces.controller.cliente;

interface

uses
  FireDAC.Comp.Client,
  entidade.cliente;

type
  IControllerCliente = interface
    ['{FEC0A4AF-E856-43AE-AFF7-1E46C070995A}']
    function carregartodos(out ATabela: TFDMemTable): Boolean;
    function Cadastrar(ACliente: TCliente): Boolean;
    function Editar(ACliente: TCliente): Boolean;
  end;

implementation

end.
