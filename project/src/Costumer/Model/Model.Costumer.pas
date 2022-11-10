unit Model.Costumer;

interface

uses
  Model.Customer.Interfaces;

type
  Tcostumer = class(TInterfacedObject, ICustomerInterfaces)
    private
    FId : Integer;
    FName : string;
    FCity : string;
    FState : string;

    public

   function Id (aValue : integer) : ICustomerInterfaces; overload;
   function Id : Integer; overload;
   function Name (aValue : String) : ICustomerInterfaces; overload;
   function Name : String; overload;
   function City (aValue : String) : ICustomerInterfaces; overload;
   function City : String ; overload;
   function State (aValue : String) : ICustomerInterfaces; overload;
   function State : string; overload;
   class function New : ICustomerInterfaces;

  end;

implementation

{ Tcostumer }

function Tcostumer.City: String;
begin
  Result := FCity;
end;

function Tcostumer.City(aValue: String): ICustomerInterfaces;
begin
  Result := Self;
  FCity  := aValue;
end;

function Tcostumer.Id(aValue: integer): ICustomerInterfaces;
begin
  Result := Self;
  FId := aValue;
end;

function Tcostumer.Id: Integer;
begin
  Result := FId;
end;

function Tcostumer.Name: String;
begin
  Result := FName;
end;

class function Tcostumer.New: ICustomerInterfaces;
begin
  Result := Self.Create;
end;

function Tcostumer.Name(aValue: String): ICustomerInterfaces;
begin
  Result := Self;
  FName := aValue;
end;

function Tcostumer.State(aValue: String): ICustomerInterfaces;
begin
  Result := Self;
  FState := aValue;
end;

function Tcostumer.State: string;
begin
  Result := FState;
end;

end.
