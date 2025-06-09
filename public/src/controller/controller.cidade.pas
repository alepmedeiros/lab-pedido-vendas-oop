unit controller.cidade;

interface

uses
  interfaces.controller.cidade, Data.FireDACJSONReflect, DAO.cidade,  interfaces.DAO.cidade,
  entidade.cidade,
  FireDAC.Comp.Client;

type
  TControllerCidade = class(TInterfacedObject, IControllerCidade)
    function Load(out ATable: TFDMemTable): Boolean;
    function Cadastrar(ACidade: TCidade): Boolean;
    function Editar(ACidade: TCidade): Boolean;
  end;

implementation

{ TControllerCidade }

function TControllerCidade.Cadastrar(ACidade: TCidade): Boolean;
var
  LDAOCidade: IDAOCidade;
begin
  LDAOCidade := TDAOCidade.Create;

  result := LDAOCidade.cadastrar(ACidade);
end;

function TControllerCidade.Editar(ACidade: TCidade): Boolean;
var
  LDAOCidade: IDAOCidade;
begin
  LDAOCidade := TDAOCidade.Create;

  result := LDAOCidade.editar(ACidade);
end;

function TControllerCidade.Load(out ATable: TFDMemTable): Boolean;
var
  LDAOCidade: IDAOCidade;
begin
  LDAOCidade := TDAOCidade.Create;

  result := LDAOCidade.load(ATable);
end;

end.
