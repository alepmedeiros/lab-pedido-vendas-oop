program labVenda;

uses
  Vcl.Forms,
  entidade.produto in '..\src\entidade\entidade.produto.pas',
  entidade.cliente in '..\src\entidade\entidade.cliente.pas',
  entidade.cidade in '..\src\entidade\entidade.cidade.pas',
  entidade.pedido in '..\src\entidade\entidade.pedido.pas',
  entidade.item in '..\src\entidade\entidade.item.pas',
  view.principal in '..\src\view\view.principal.pas' {frmPrincipal},
  view.cliente.consulta in '..\src\view\cliente\view.cliente.consulta.pas' {frmConsultaCliente},
  view.cliente.cadastro in '..\src\view\cliente\view.cliente.cadastro.pas' {frmCadastrocliente},
  view.cidade.consulta in '..\src\view\cidade\view.cidade.consulta.pas' {frmConsultaCidade},
  view.cidade.cadastro in '..\src\view\cidade\view.cidade.cadastro.pas' {frmCadastroCidade},
  entidade.configuracao in '..\src\entidade\entidade.configuracao.pas',
  controller.cidade in '..\src\controller\controller.cidade.pas',
  controller.cliente in '..\src\controller\controller.cliente.pas',
  controller.item in '..\src\controller\controller.item.pas',
  controller.pedido in '..\src\controller\controller.pedido.pas',
  controller.produto in '..\src\controller\controller.produto.pas',
  DAO.cliente in '..\src\DAO\DAO.cliente.pas',
  entidade.conexao in '..\src\entidade\conexao\entidade.conexao.pas',
  entidade.query in '..\src\entidade\conexao\entidade.query.pas',
  DAO.cidade in '..\src\DAO\DAO.cidade.pas',
  utils.enum.tipocadastro in '..\src\utils\enum\utils.enum.tipocadastro.pas',
  view.produto.cadastro in '..\src\view\produto\view.produto.cadastro.pas' {frmCadastroProduto},
  view.produto.consulta in '..\src\view\produto\view.produto.consulta.pas' {frmConsultaProduto},
  interfaces.controller.produto in '..\src\interfaces\controller\interfaces.controller.produto.pas',
  DAO.produto in '..\src\DAO\DAO.produto.pas',
  interfaces.DAO.produto in '..\src\interfaces\DAO\interfaces.DAO.produto.pas',
  interfaces.DAO.cliente in '..\src\interfaces\DAO\interfaces.DAO.cliente.pas',
  interfaces.DAO.cidade in '..\src\interfaces\DAO\interfaces.DAO.cidade.pas',
  interfaces.controller.cliente in '..\src\interfaces\controller\interfaces.controller.cliente.pas',
  interfaces.controller.cidade in '..\src\interfaces\controller\interfaces.controller.cidade.pas',
  interfaces.conexao in '..\src\interfaces\entidade\conexao\interfaces.conexao.pas',
  interfaces.query in '..\src\interfaces\entidade\conexao\interfaces.query.pas',
  interfaces.cidade in '..\src\interfaces\entidade\interfaces.cidade.pas',
  interfaces.cliente in '..\src\interfaces\entidade\interfaces.cliente.pas',
  interfaces.configuracao in '..\src\interfaces\entidade\interfaces.configuracao.pas',
  interfaces.item in '..\src\interfaces\entidade\interfaces.item.pas',
  interfaces.pedido in '..\src\interfaces\entidade\interfaces.pedido.pas',
  interfaces.produto in '..\src\interfaces\entidade\interfaces.produto.pas',
  interfaces.controller.pedido in '..\src\interfaces\controller\interfaces.controller.pedido.pas',
  DAO.pedido in '..\src\DAO\DAO.pedido.pas',
  interfaces.DAO.pedido in '..\src\interfaces\DAO\interfaces.DAO.pedido.pas',
  view.pedido.cadastro in '..\src\view\pedido\view.pedido.cadastro.pas' {frmCadastroPedido},
  view.pedido.consulta in '..\src\view\pedido\view.pedido.consulta.pas' {frmConsultaPedido},
  interfaces.controller.item in '..\src\interfaces\controller\interfaces.controller.item.pas',
  DAO.item in '..\src\DAO\DAO.item.pas',
  interfaces.DAO.item in '..\src\interfaces\DAO\interfaces.DAO.item.pas',
  view.mensagem in '..\src\view\view.mensagem.pas' {frmMensagem},
  view.item.editar in '..\src\view\pedido\item\view.item.editar.pas' {FrmEditarItem};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConsultaCliente, frmConsultaCliente);
  Application.CreateForm(TfrmCadastrocliente, frmCadastrocliente);
  Application.CreateForm(TfrmConsultaCidade, frmConsultaCidade);
  Application.CreateForm(TfrmCadastroCidade, frmCadastroCidade);
  Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  Application.CreateForm(TfrmConsultaProduto, frmConsultaProduto);
  Application.CreateForm(TfrmCadastroPedido, frmCadastroPedido);
  Application.CreateForm(TfrmConsultaPedido, frmConsultaPedido);
  Application.CreateForm(TfrmMensagem, frmMensagem);
  Application.CreateForm(TFrmEditarItem, FrmEditarItem);
  Application.Run;
end.
