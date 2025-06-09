unit interfaces.DAO.cliente;

interface

uses
  entidade.cliente,
  FireDAC.Comp.Client;

type
  IDAOCliente = interface
    ['{104B0BD9-6B57-4263-BD71-4239E42A0825}']
    function carregarTodos(ATabela: TFDMemTable): Boolean;
    function Cadastrar(ACliente: TCliente): Boolean;
    function Editar(ACliente: TCliente): Boolean;
  end;

implementation

end.
