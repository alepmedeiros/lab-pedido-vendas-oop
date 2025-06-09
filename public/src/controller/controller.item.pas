unit controller.item;

interface

uses
  interfaces.controller.item,
  entidade.item,
  FireDAC.Comp.Client,
  entidade.query,
  interfaces.query,
  interfaces.DAO.item,
  DAO.item;

type
  TControllerItem = class(TInterfacedObject, IControllerItem)
    function carregarPorPedido(out ATabela: TFDMemTable; APedido: Integer): Boolean;
    function Cadastrar(AItem: TItem): Boolean;
    function Editar(AItem: TItem): Boolean;
    function Excluir(ACodigo: Integer): Boolean;
  end;

implementation

{ TControllerItem }

function TControllerItem.Cadastrar(AItem: TItem): Boolean;
var
  LDAOItem: IDAOItem;
begin
  LDAOItem := TDAOItem.Create;

  result := LDAOItem.cadastrar(AItem);
end;

function TControllerItem.carregarPorPedido(out ATabela: TFDMemTable; APedido: Integer): Boolean;
var
  LDAOItem: IDAOItem;
begin
  LDAOItem := TDAOItem.Create;

  result := LDAOItem.carregarPorPedido(ATabela, APedido);
end;

function TControllerItem.Editar(AItem: TItem): Boolean;
var
  LDAOItem: IDAOItem;
begin
  LDAOItem := TDAOItem.Create;

  result := LDAOItem.editar(AItem);
end;

function TControllerItem.Excluir(ACodigo: Integer): Boolean;
var
  LDAOItem: IDAOItem;
begin
  LDAOItem := TDAOItem.Create;

  result := LDAOItem.Excluir(ACodigo);
end;

end.
