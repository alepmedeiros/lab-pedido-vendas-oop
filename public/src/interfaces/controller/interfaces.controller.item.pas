unit interfaces.controller.item;

interface

uses
  FireDAC.Comp.Client,
  entidade.item;

type
  IControllerItem = interface
    ['{68FC3536-6172-42F2-8852-8FCACD8BB16B}']
    function carregarPorPedido(out ATabela: TFDMemTable; APedido: Integer): Boolean;
    function Cadastrar(AItem: TItem): Boolean;
    function Editar(AItem: TItem): Boolean;
    function Excluir(ACodigo: Integer): Boolean;
  end;

implementation

end.
