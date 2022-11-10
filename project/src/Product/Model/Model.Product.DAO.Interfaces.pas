unit Model.Product.DAO.Interfaces;

interface

uses
  FireDAC.Comp.Client,
  Model.Product;

type iProductDAO = interface
    ['{428FCC57-30D1-4512-BB10-98D7AD9B752E}']
  procedure Add (aValue : TProduct);
  procedure Delete (avalue : Integer);
  procedure Update (aValue : TProduct);

  function RetrieveById (aValue : integer) : TProduct;
  function RetrieveAll : TFDMemTable;
end;

implementation

end.
