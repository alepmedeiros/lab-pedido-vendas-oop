unit controller.cliente;

interface

uses
  interfaces.controller.cliente, DAO.cliente,  interfaces.DAO.Cliente,
  entidade.cliente, FireDAC.Comp.Client;

type
  TControllerCliente = class(TInterfacedObject, IControllerCliente)
    function carregartodos(out ATabela: TFDMemTable): Boolean;
    function Cadastrar(ACliente: TCliente): Boolean;
    function Editar(ACliente: TCliente): Boolean;
  end;

implementation

{ TControllerCliente }

function TControllerCliente.Cadastrar(ACliente: TCliente): Boolean;
var
  LDAOCliente: IDAOCliente;
begin
  LDAOCliente := TDAOCliente.Create;

  result := LDAOCliente.cadastrar(ACliente);
end;

function TControllerCliente.carregartodos(out ATabela: TFDMemTable): Boolean;
var
  LDAOCliente: IDAOCliente;
begin
  LDAOCliente := TDAOCliente.Create;

  result := LDAOCliente.carregartodos(ATabela);
end;

function TControllerCliente.Editar(ACliente: TCliente): Boolean;
var
  LDAOCliente: IDAOCliente;
begin
  LDAOCliente := TDAOCliente.Create;

  result := LDAOCliente.editar(ACliente);
end;

end.
