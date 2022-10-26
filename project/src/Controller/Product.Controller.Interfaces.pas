unit Product.Controller.Interfaces;

interface

uses
  Model.Product;

type
  iProductController = interface
    ['{FE437161-1587-4115-AE1D-BB552646584C}']
  procedure Add (aValue : TProduct);
  procedure Delete (avalue : Integer);
  procedure Update (aValue : TProduct);

  function RetrieveById (aValue : integer) : TProduct;
  //function RetrieveAll : TFDMemTable;

  end;
implementation

end.
