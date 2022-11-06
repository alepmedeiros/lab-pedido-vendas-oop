program PedidoVendasOOP;

uses
  Vcl.Forms,
  View.Main in '..\src\View\View.Main.pas' {FormMain},
  View.Product in '..\src\View\View.Product.pas' {FormProduct},
  Model.Product in '..\src\Model\Model.Product.pas',
  Model.Product.Interfaces in '..\src\Model\Model.Product.Interfaces.pas',
  Model.Customer.Interfaces in '..\src\Model\Model.Customer.Interfaces.pas',
  Model.Costumer in '..\src\Model\Model.Costumer.pas',
  DM.Connection in '..\src\DAO\Connection\DM.Connection.pas' {DataModuleConnection},
  Product.DAO in '..\src\DAO\Product\Product.DAO.pas',
  View.Customer in '..\src\View\View.Customer.pas' {Form2},
  product.DAO.interfaces in '..\src\DAO\Product\product.DAO.interfaces.pas',
  Product.Controller in '..\src\Controller\Product.Controller.pas',
  Product.Controller.Interfaces in '..\src\Controller\Product.Controller.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormProduct, FormProduct);
  Application.CreateForm(TDataModuleConnection, DataModuleConnection);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
