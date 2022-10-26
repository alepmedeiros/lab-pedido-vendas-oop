unit Product.Controller;

interface

uses
  Product.Controller.Interfaces,
  Model.Product,
  Product.DAO;

type
  TproductController = class(Tinterfacedobject, iProductController)
  constructor Create;
  destructor Destroy; override;

  private
    FDAOProduct :TProductDAO;
  public

  procedure Add (aValue : TProduct);
  procedure Delete (avalue : Integer);
  procedure Update (aValue : TProduct);

  function RetrieveById (aValue : integer) : TProduct;

  end;

implementation

{ TproductController }

procedure TproductController.Add(aValue: TProduct);
begin
  FDAOProduct.Add(aValue);
end;

constructor TproductController.Create;
begin
  FDAOProduct.Create;
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

function TproductController.RetrieveById(aValue: integer): TProduct;
begin
  FDAOProduct.RetrieveById(aValue);
end;

procedure TproductController.Update(aValue: TProduct);
begin
  FDAOProduct.Update(aValue);
end;

end.
