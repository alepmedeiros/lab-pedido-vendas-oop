unit controller.produto;

interface

uses
  interfaces.controller.produto,
  entidade.produto,
  FireDAC.Comp.Client,
  entidade.query,
  interfaces.query,
  interfaces.DAO.produto,
  DAO.produto;

type
  TControllerProduto = class(TInterfacedObject, IControllerProduto)
    function carregartodos(out ATabela: TFDMemTable): Boolean;
    function Cadastrar(AProduto: TProduto): Boolean;
    function Editar(AProduto: TProduto): Boolean;
  end;

implementation

{ TControllerProduto }

function TControllerProduto.Cadastrar(AProduto: TProduto): Boolean;
var
  LDAOproduto: IDAOProduto;
begin
  LDAOproduto := TDAOProduto.Create;

  result := LDAOproduto.cadastrar(AProduto);
end;

function TControllerProduto.carregartodos(out ATabela: TFDMemTable): Boolean;
var
  LDAOproduto: IDAOProduto;
begin
  LDAOproduto := TDAOProduto.Create;

  result := LDAOproduto.carregartodos(ATabela);
end;

function TControllerProduto.Editar(AProduto: TProduto): Boolean;
var
  LDAOproduto: IDAOProduto;
begin
  LDAOproduto := TDAOProduto.Create;

  result := LDAOproduto.editar(AProduto);
end;


end.
