program LabPedidoOOP;

uses
  Vcl.Forms,
  View.Principal in 'src\view\View.Principal.pas' {frmPrincipal},
  Cliente.Controller in 'src\controller\cliente\Cliente.Controller.pas',
  Cliente.Controller.Interfaces in 'src\controller\cliente\Cliente.Controller.Interfaces.pas',
  Model.Cliente in 'src\model\cliente\Model.Cliente.pas',
  Model.Interfaces.Cliente in 'src\model\cliente\Model.Interfaces.Cliente.pas',
  Cliente.DAO.Interfaces in 'src\dao\cliente\Cliente.DAO.Interfaces.pas',
  Cliente.DAO in 'src\dao\cliente\Cliente.DAO.pas',
  Model.Interfaces.Operador in 'src\model\operador\Model.Interfaces.Operador.pas',
  Model.Operador in 'src\model\operador\Model.Operador.pas',
  Model.Interfaces.Pedido in 'src\model\pedido\Model.Interfaces.Pedido.pas',
  Model.Pedido in 'src\model\pedido\Model.Pedido.pas',
  Model.Interfaces.PedidoItem in 'src\model\pedido_item\Model.Interfaces.PedidoItem.pas',
  Model.PedidoItem in 'src\model\pedido_item\Model.PedidoItem.pas',
  Model.Interfaces.Produto in 'src\model\produto\Model.Interfaces.Produto.pas',
  Model.Produto in 'src\model\produto\Model.Produto.pas',
  Operador.Controller.Interfaces in 'src\controller\operador\Operador.Controller.Interfaces.pas',
  DataModule in 'src\dao\DataModule.pas' {DataModuleUnit: TDataModule},
  Operador.DAO in 'src\dao\operador\Operador.DAO.pas',
  Operador.DAO.Interfaces in 'src\dao\operador\Operador.DAO.Interfaces.pas',
  Operador.Controller in 'src\controller\operador\Operador.Controller.pas',
  Produto.DAO.Interfaces in 'src\dao\produto\Produto.DAO.Interfaces.pas',
  Produto.DAO in 'src\dao\produto\Produto.DAO.pas',
  Produto.Controller.Interfaces in 'src\controller\produto\Produto.Controller.Interfaces.pas',
  Produto.Controller in 'src\controller\produto\Produto.Controller.pas',
  Pedido.DAO.Interfaces in 'src\dao\pedido\Pedido.DAO.Interfaces.pas',
  Pedido.DAO in 'src\dao\pedido\Pedido.DAO.pas',
  Pedido.Controller.Interfaces in 'src\controller\pedido\Pedido.Controller.Interfaces.pas',
  Pedido.Controller in 'src\controller\pedido\Pedido.Controller.pas',
  PedidoItem.DAO.Interfaces in 'src\dao\pedido_item\PedidoItem.DAO.Interfaces.pas',
  PedidoItem.DAO in 'src\dao\pedido_item\PedidoItem.DAO.pas',
  PedidoItem.Controller.Interfaces in 'src\controller\pedido_item\PedidoItem.Controller.Interfaces.pas',
  PedidoItem.Controller in 'src\controller\pedido_item\PedidoItem.Controller.pas',
  Conexao.Banco in 'src\dao\Conexao.Banco.pas',
  Conexao.Banco.Control in 'src\dao\Conexao.Banco.Control.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
