unit interfaces.DAO.produto;

interface

uses
  entidade.produto,
  FireDAC.Comp.Client;

type
  IDAOProduto = interface
    ['{104B0BD9-6B57-4263-BD71-4239E42A0825}']
    function carregarTodos(ATabela: TFDMemTable): Boolean;
    function Cadastrar(AProduto: TProduto): Boolean;
    function Editar(AProduto: TProduto): Boolean;
  end;

implementation

end.
