program PedidoVendasOOP;

uses
  Vcl.Forms,
  View.Main in '..\src\View.Main.pas' {FormMain},
  View.Product in '..\src\Product\View\View.Product.pas' {FormProduct},
  Model.Product in '..\src\Product\Model\Model.Product.pas',
  Model.Product.Interfaces in '..\src\Product\Model\Model.Product.Interfaces.pas',
  Model.Customer.Interfaces in '..\src\Costumer\Model\Model.Customer.Interfaces.pas',
  Model.Costumer in '..\src\Costumer\Model\Model.Costumer.pas',
  DM.Connection in '..\src\Datamodule\DM.Connection.pas' {DataModuleConnection},
  Model.Product.DAO in '..\src\Product\Model\Model.Product.DAO.pas',
  Model.Product.DAO.Interfaces in '..\src\Product\Model\Model.Product.DAO.Interfaces.pas',
  Product.Controller in '..\src\Product\Controller\Product.Controller.pas',
  Product.Controller.Interfaces in '..\src\Product\Controller\Product.Controller.Interfaces.pas',
  Model.Connections.Firedac.Query in '..\src\Connections\Model\Model.Connections.Firedac.Query.pas',
  Model.Connections.Interfaces in '..\src\Connections\Model\Model.Connections.Interfaces.pas',
  Model.Connections in '..\src\Connections\Model\Model.Connections.pas',
  Model.Connections.Firedac in '..\src\Connections\Model\Model.Connections.Firedac.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormProduct, FormProduct);
  Application.CreateForm(TDataModuleConnection, DataModuleConnection);
  Application.Run;
end.
