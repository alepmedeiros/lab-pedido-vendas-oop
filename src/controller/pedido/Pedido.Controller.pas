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
    function NovoCodigoPedido : Variant;

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

function TPedidoController.NovoCodigoPedido: Variant;
begin
  Result := FDAOPedido.NovoCodigoPedido;
end;

procedure TPedidoController.Remover(aValue: integer);
begin
  try
    FDAOPedido.Remover(aValue)
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TPedidoController.Salvar(aValue: TPedidoModel);
begin
  FDAOPedido.Salvar(aValue);
end;

end.
