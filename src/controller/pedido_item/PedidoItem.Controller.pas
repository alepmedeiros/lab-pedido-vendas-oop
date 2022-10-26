unit PedidoItem.Controller;

interface

uses
  PedidoItem.DAO.Interfaces,
  Model.PedidoItem,
  DM.Conexao,
  FireDac.Comp.Client,
  Data.DB,
  PedidoItem.DAO;

type
  TPedidoItemController = class (TInterfacedObject, iPedidoIemDAO)
  constructor Create;
  destructor Destroy; override;

  private
    FDAOPedidoItem : TPedidoItemDAO;

  public
    procedure AdicionarItem( aValue : TPedidoItemModel );
    function RecuperaTodos : TFDMemTable ;

  end;

implementation

{ TPedidoItemController }

constructor TPedidoItemController.Create;
begin
  FDAOPedidoItem := TPedidoItemDAO.Create;
end;

destructor TPedidoItemController.Destroy;
begin
  FDAOPedidoItem.Free;

  inherited;
end;

function TPedidoItemController.RecuperaTodos: TFDMemTable;
begin
  Result := FDAOPedidoItem.RecuperaTodos;
end;

procedure TPedidoItemController.AdicionarItem(aValue: TPedidoItemModel);
begin
  FDAOPedidoItem.AdicionarItem(aValue);
end;

end.
