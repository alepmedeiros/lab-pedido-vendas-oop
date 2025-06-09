unit interfaces.DAO.cliente;

interface

uses
  entidade.cliente,
  FireDAC.Comp.Client;

type
  IDAOCliente = interface
    ['{104B0BD9-6B57-4263-BD71-4239E42A0825}']
    function loadClientes(ATable: TFDMemTable): Boolean;
    function CadastrarCliente(ACliente: TCliente): Boolean;
  end;

implementation

end.
