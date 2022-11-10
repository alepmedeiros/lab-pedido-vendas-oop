unit Model.Product ;

interface

uses
 Model.Product.Interfaces,
 System.SysUtils;

type
  TProduct = class(TInterfacedObject, IProductInterface )
    constructor create;
    destructor destroy; override;
    private
    FId : Integer;
    FSellPrice : Float64;
    FDescription : string;

    public
    function id (aValue : integer) : IProductInterface; overload;
    function id (aValue : String) : IProductInterface; overload;
    function id  : Integer; overload;

    function Description (Avalue : String) : IProductInterface; overload;
    function Description : string; overload;

    function SellPrice (Avalue : Float64) : IProductInterface; overload;
    function SellPrice (Avalue : string) : IProductInterface; overload;
    function SellPrice : Float64; overload;

    class function New : IProductInterface;
  end;

implementation

{ TProduct }

function TProduct.Description(Avalue: String): IProductInterface;
begin
  Result := Self;
  FDescription := Avalue;
end;

constructor TProduct.create;
begin
  //FId := -1;
  //FDescription :='';
  //FSellPrice := 0;
end;

function TProduct.Description: string;
begin
  Result := FDescription;
end;

destructor TProduct.destroy;
begin

  inherited;
end;

function TProduct.id: Integer;
begin
  Result := FId;
end;

function TProduct.id(aValue: String): IProductInterface;
begin
  Result := Self;
  FId := StrToInt(aValue);
end;

class function TProduct.New: IProductInterface;
begin
  Result := Self.Create;
end;

function TProduct.SellPrice(Avalue: string): IProductInterface;
begin
  Result := Self;
  FSellPrice := StrToFloat(Avalue);
end;

function TProduct.SellPrice(Avalue: Float64): IProductInterface;
begin
  Result := Self;
  FSellPrice := Avalue;
end;

function TProduct.SellPrice: Float64;
begin
  Result := FSellPrice;
end;

function TProduct.id(aValue: integer): IProductInterface;
begin
  Result := Self;
  FId := aValue;
end;

end.
