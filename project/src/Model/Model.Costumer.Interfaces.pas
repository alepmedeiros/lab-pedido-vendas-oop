unit Model.Costumer.Interfaces;

interface

type
 ICustomerInterfaces = interface
   function Id (aValue : integer) : ICustomerInterfaces; overload;
   function Id : Integer; overload;
   function Name (aValue : String) : ICustomerInterfaces; overload;
   function Name : String; overload;
   function City (aValue : String) : ICustomerInterfaces; overload;
   function City : String ; overload;
   function State (aValue : String) : ICustomerInterfaces; overload;
   function State : string; overload;

 end;
implementation

end.
