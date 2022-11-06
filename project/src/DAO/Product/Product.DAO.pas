unit Product.DAO;

interface

uses
  FireDAC.Comp.Client,
  DM.Connection,
  Model.Product,
  System.Generics.Collections;

type
 TProductDAO = class
   constructor Create;
   destructor Destroy; override;

   private
   FConnection : TDataModuleConnection;
   FProduct : TProduct;
   //FProductList : TObjectlist<TProduct>;

   public
   procedure Add    (aValue : TProduct);
   procedure Delete (avalue : Integer);
   procedure Update (aValue : TProduct);

   function RetrieveById (aValue : integer) : TProduct;
   function RetrieveAll : TFDMemTable;

 end;
implementation

uses
  Data.DB, Vcl.Dialogs, System.SysUtils;

{ TProductDAO }


procedure TProductDAO.Add(aValue: TProduct);
begin
  FConnection.FDMConnection.ExecSQL(
    'INSERT INTO produto (descricao, preco_de_venda) VALUES ( :nome, :preco  )',
    [aValue.Description, aValue.SellPrice],[ftString,ftFloat]
  );

  FConnection.FDMConnection.Close;
end;

constructor TProductDAO.Create;
begin
  Self.FConnection := TDataModuleConnection.New;
  Self.FProduct := TProduct.Create;
end;

procedure TProductDAO.Delete(avalue: Integer);
begin
  FConnection.FDMConnection.ExecSQL(
    'DELETE FROM produto WHERE codigo =:id',
    [aValue]
  );

  FConnection.FDMConnection.Close;
end;

destructor TProductDAO.Destroy;
begin

  inherited;
end;

function TProductDAO.RetrieveAll : TFDMemTable;
var
Lstring : String;
begin
  Lstring := 'SELECT * FROM produto';
  
  FConnection.FDMConnection.ExecSQL(Lstring,Tdataset(FConnection.FDMTable));
  Fconnection.FDataSource.DataSet := FConnection.FDMTable;
end;

function TProductDAO.RetrieveById(aValue: integer): TProduct;
var
  Lstring : String;

begin
  Lstring := 'SELECT * FROM produto WHERE codigo =  '+ IntToStr(avalue);
  
  FConnection.FDMConnection.ExecSQL(Lstring,Tdataset(FConnection.FDMTable));
  Fconnection.FDataSource.DataSet := FConnection.FDMTable;

  Result := FProduct;

end;

procedure TProductDAO.Update(aValue: TProduct);
begin
  FConnection.FDMConnection.ExecSQL(
    'UPDATE produto SET descricao = :descricao, preco_de_venda = :preco WHERE codigo = :codigo',
    [aValue.Description, aValue.SellPrice, aValue.id],[ftString,ftFloat,ftInteger]
  );

  FConnection.FDMConnection.Close;
end;

end.
