unit interfaces.DAO.item;

interface

uses
  entidade.item,
  FireDAC.Comp.Client;

type
  IDAOItem = interface
    ['{423FC201-495B-416C-A2FB-D91791B68FA7}']
    function carregarPorPedido(ATabela: TFDMemTable; APedido: Integer): Boolean;
    function Cadastrar(AItem: TItem): Boolean;
    function Editar(AItem: TItem): Boolean;
    function Excluir(ACodigo: Integer): Boolean;
  end;


implementation

end.
