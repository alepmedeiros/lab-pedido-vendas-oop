unit Model.Product.Interfaces;

interface

type
  IProductInterface = interface
  function Id (Avalue : integer) : IProductInterface; overload;
  function id (aValue : String) : IProductInterface; overload;
  function id  : Integer; overload;
  function Description (Avalue : String) : IProductInterface; overload;
  function Description : string; overload;
  function SellPrice (Avalue : Float64) : IProductInterface; overload;
  function SellPrice (Avalue : String) : IProductInterface; overload;
  function SellPrice : Float64; overload;


 end;
implementation

end.
