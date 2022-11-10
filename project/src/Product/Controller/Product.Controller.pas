unit Product.Controller;

interface

uses
  Product.Controller.Interfaces,
  Model.Product,
  Model.Product.DAO,
  Model.Connections.Interfaces;

type
  TproductController = class(Tinterfacedobject, iProductController)
  constructor Create;
  destructor Destroy; override;
  class function New: iProductController;

  private
    FDAOProduct : TProductDAO;
    FConnection : iModelConnectionQuery;
  public

  function Add (aStrValue : string; aFloatValue : float64) : iProductController;
  procedure Delete (avalue : Integer);
  procedure Update (aValue : TProduct);

  function RetrieveById (aValue : integer) : TProduct;

  end;

implementation

uses
  Model.Connections.Firedac.Query;

{ TproductController }

function TproductController.Add( aStrValue : string; aFloatValue : float64) : iProductController;
var
  LProduct : TProduct;
begin
  try  // fazer funcionar
    LProduct.Create;
    LProduct.Description(aStrValue);
    LProduct.SellPrice(aFloatValue);

    FDAOProduct.Add(LProduct);
  finally
    LProduct.Free;
  end;

  Result := Self;
end;

constructor TproductController.Create;
begin
  FDAOProduct.Create;
  FConnection := TModelConnectionsFiredacQuery.New;
end;

procedure TproductController.Delete(avalue: Integer);
begin
  FDAOProduct.Delete(avalue);
end;

destructor TproductController.Destroy;
begin
  FDAOProduct.Free;

  inherited;
end;

class function TproductController.New: iProductController;
begin
  Result := Self.Create;
end;

function TproductController.RetrieveById(aValue: integer): TProduct;
begin
  FDAOProduct.RetrieveById(aValue);
end;

procedure TproductController.Update(aValue: TProduct);
begin
  FDAOProduct.Update(aValue);
end;

end.
