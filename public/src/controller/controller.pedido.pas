unit controller.pedido;

interface

uses
  interfaces.controller.pedido,
  entidade.pedido,
  FireDAC.Comp.Client,
  entidade.query,
  interfaces.query,
  interfaces.DAO.pedido,
  DAO.pedido;

type
  TControllerPedido = class(TInterfacedObject, IControllerPedido)
    function carregar(out ATabela: TFDMemTable): Boolean; overload;
    function carregar(out ATabela: TFDMemTable; ATipoConsulta: Integer; AParametro: string): Boolean; overload;
    function Cadastrar(out APedido: TPedido): Boolean;
    function Editar(APedido: TPedido): Boolean;
  end;

implementation

{ TControllerPedido }

function TControllerPedido.Cadastrar(out APedido: TPedido): Boolean;
var
  LDAOPedido: IDAOPedido;
begin
  LDAOPedido := TDAOPedido.Create;

  result := LDAOPedido.cadastrar(APedido);
end;

function TControllerPedido.carregar(out ATabela: TFDMemTable;
  ATipoConsulta: Integer; AParametro: string): Boolean;
var
  LDAOPedido: IDAOPedido;
begin
  LDAOPedido := TDAOPedido.Create;

  result := LDAOPedido.carregar(ATabela, ATipoConsulta, AParametro);
end;

function TControllerPedido.carregar(out ATabela: TFDMemTable): Boolean;
var
  LDAOPedido: IDAOPedido;
begin
  LDAOPedido := TDAOPedido.Create;

  result := LDAOPedido.carregar(ATabela);
end;

function TControllerPedido.Editar(APedido: TPedido): Boolean;
var
  LDAOPedido: IDAOPedido;
begin
  LDAOPedido := TDAOPedido.Create;

  result := LDAOPedido.editar(APedido);
end;


end.
