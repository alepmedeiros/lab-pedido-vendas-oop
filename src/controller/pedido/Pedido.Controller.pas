unit Pedido.Controller;

interface

uses
  Pedido.Controller.Interfaces,
  Model.Pedido,
  DM.Conexao,
  Firedac.Comp.Client,
  Data.DB,
  Pedido.DAO;

type
  TPedidoController = class(TInterfacedObject, iPedidoController)
  constructor Create;
  destructor Destroy; override;

  private
    FDAOPedido : TPedidoDAO;

  public
    procedure Salvar( aValue: TPedidoModel );
    procedure Remover( aValue: integer );
  end;

implementation

uses
  System.SysUtils;

{ TPedidoController }

constructor TPedidoController.Create;
begin
  FDAOPedido := TPedidoDAO.Create;
end;

destructor TPedidoController.Destroy;
begin
  FDAOPedido.Free;

  inherited;
end;

procedure TPedidoController.Remover(aValue: integer);
begin
  { Paliativo pra testar a fucionalidade }
  if aValue > -1 then
    FDAOPedido.Remover(aValue)
  else
    raise Exception.Create('Operador não existe.');
end;

procedure TPedidoController.Salvar(aValue: TPedidoModel);
begin
  FDAOPedido.Salvar(aValue);
end;

end.
