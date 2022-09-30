program LabPedidoOOP;

uses
  Vcl.Forms,
  LabPedidoOOP.View.Principal in 'src\view\LabPedidoOOP.View.Principal.pas' {frmPrincipal},
  LabPedidoOOP.Cliente.Controller in 'src\controller\cliente\LabPedidoOOP.Cliente.Controller.pas',
  LabPedidoOOP.Cliente.Controller.Interfaces in 'src\controller\cliente\LabPedidoOOP.Cliente.Controller.Interfaces.pas',
  LabPedidoOOP.Model.Cliente in 'src\model\cliente\LabPedidoOOP.Model.Cliente.pas',
  LabPedidoOOP.Model.Interfaces.Cliente in 'src\model\cliente\LabPedidoOOP.Model.Interfaces.Cliente.pas',
  LabPedidoOOP.Cliente.DAO.Interfaces in 'src\dao\cliente\LabPedidoOOP.Cliente.DAO.Interfaces.pas',
  LabPedidoOOP.Cliente.DAO in 'src\dao\cliente\LabPedidoOOP.Cliente.DAO.pas',
  LabPedidoOOP.Model.Interfaces.Operador in 'src\model\operador\LabPedidoOOP.Model.Interfaces.Operador.pas',
  LabPedidoOOP.Model.Operador in 'src\model\operador\LabPedidoOOP.Model.Operador.pas',
  LabPedidoOOP.Model.Interfaces.Pedido in 'src\model\pedido\LabPedidoOOP.Model.Interfaces.Pedido.pas',
  LabPedidoOOP.Model.Pedido in 'src\model\pedido\LabPedidoOOP.Model.Pedido.pas',
  LabPedidoOOP.Model.Interfaces.ItensPedido in 'src\model\pedido_item\LabPedidoOOP.Model.Interfaces.ItensPedido.pas',
  LabPedidoOOP.Model.ItensPedido in 'src\model\pedido_item\LabPedidoOOP.Model.ItensPedido.pas',
  LabPedidoOOP.Model.Interfaces.Produto in 'src\model\produto\LabPedidoOOP.Model.Interfaces.Produto.pas',
  LabPedidoOOP.Model.Produto in 'src\model\produto\LabPedidoOOP.Model.Produto.pas',
  LabPedidoOOP.Operador.Controller.Interfaces in 'src\controller\operador\LabPedidoOOP.Operador.Controller.Interfaces.pas',
  DM.Conexao in 'src\dao\DM.Conexao.pas' {DataModuleConexao: TDataModule},
  LabPedidoOOP.Operador.DAO in 'src\dao\operador\LabPedidoOOP.Operador.DAO.pas',
  LabPedidoOOP.Operador.DAO.Interfaces in 'src\dao\operador\LabPedidoOOP.Operador.DAO.Interfaces.pas',
  LabPedidoOOP.Operador.Controller in 'src\controller\operador\LabPedidoOOP.Operador.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModuleConexao, DataModuleConexao);
  Application.Run;
end.
