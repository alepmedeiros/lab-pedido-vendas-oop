unit View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.NumberBox,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtDlgs,
  Vcl.Mask,
  Vcl.DBCtrls,
  Model.Interfaces.Produto,
  Model.Interfaces.Operador,
  Model.Interfaces.Pedido,
  Model.Interfaces.PedidoItem,
  Model.Interfaces.Cliente,
  Model.Produto,
  Model.Operador,
  Model.Pedido,
  Model.PedidoItem,
  Model.Cliente,
  Operador.Controller,
  Cliente.Controller,
  Produto.Controller,
  Pedido.Controller,
  PedidoItem.Controller,
  DM.Conexao,
  Data.DB,
  RxToolEdit,
  RxCurrEdit;

type
  TfrmPrincipal = class(TForm)
    PageControlPrincipal: TPageControl;
    edtOperador: TEdit;
    lblNomeOperador: TLabel;
    btnCadOperador: TButton;
    lblCodigoOperador: TLabel;
    btnRecOperador: TButton;
    edtCodigoOperador: TEdit;
    btnRecTodosOperadores: TButton;
    dbgrdOperador: TDBGrid;
    btnEdtOperador: TButton;
    btnDelOperador: TButton;
    Clientes: TTabSheet;
    Label1: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    edtCliente: TEdit;
    btnCadCliente: TButton;
    btnRecCliente: TButton;
    edtCidadeCliente: TEdit;
    edtUfCliente: TEdit;
    dbgrdCliente: TDBGrid;
    btnEdtCliente: TButton;
    btnDelCliente: TButton;
    btnRecTodosCliente: TButton;
    lblCodCliente: TLabel;
    btnLimparCampos: TButton;
    Produtos: TTabSheet;
    lblCodigoProduto: TLabel;
    edtCodigoProduto: TEdit;
    lblNomeProduto: TLabel;
    edtDescricaoProduto: TEdit;
    lblPrecoProduto: TLabel;
    edtValorProduto: TCurrencyEdit;
    dbgrdProdutos: TDBGrid;
    btnCadProduto: TButton;
    btnRecTodosProdutos: TButton;
    btnEdtProduto: TButton;
    btnDelProduto: TButton;
    edtCodCliente: TEdit;
    Pedidos: TTabSheet;
    lblCodProdPesq: TLabel;
    edtCodProdutoPesq: TEdit;
    lblDescProdPesq: TLabel;
    edtDescProdutoPesq: TEdit;
    lblPrecoProdPesq: TLabel;
    edtValorProdutoPesq: TCurrencyEdit;
    btnRecuProdPesq: TButton;
    btnAddProdPesq: TButton;
    dbgrdPedido: TDBGrid;
    btnConfirmarPedido: TButton;
    lblCarrinho: TLabel;
    btnCancelarPedido: TButton;
    btnIniciarPedido: TButton;
    GerenciarPedidos: TTabSheet;
    edtClientePedido: TEdit;
    lblClientePedido: TLabel;
    edtCodClientePedido: TEdit;
    btnRecuperaItensPedido: TButton;

    procedure FormCreate(Sender: TObject);
    procedure btnCadOperadorClick(Sender: TObject);
    procedure btnRecOperadorClick(Sender: TObject);
    procedure btnRecTodosOperadoresClick(Sender: TObject);
    procedure btnEdtOperadorClick(Sender: TObject);
    procedure btnDelOperadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadClienteClick(Sender: TObject);
    procedure btnRecTodosClienteClick(Sender: TObject);
    procedure PageControlPrincipalChange(Sender: TObject);
    procedure btnRecClienteClick(Sender: TObject);
    procedure btnEdtClienteClick(Sender: TObject);
    procedure dbgrdClienteDblClick(Sender: TObject);
    procedure btnLimparCamposClick(Sender: TObject);
    procedure btnRecTodosProdutosClick(Sender: TObject);
    procedure btnCadProdutoClick(Sender: TObject);
    procedure btnEdtProdutoClick(Sender: TObject);
    procedure dbgrdProdutosDblClick(Sender: TObject);
    procedure btnDelProdutoClick(Sender: TObject);
    procedure dbgrdOperadorDblClick(Sender: TObject);
    procedure btnDelClienteClick(Sender: TObject);
    procedure btnAddProdPesqClick(Sender: TObject);
    procedure btnRecuProdPesqClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnConfirmarPedidoClick(Sender: TObject);
    procedure btnIniciarPedidoClick(Sender: TObject);
    procedure btnRecuperaItensPedidoClick(Sender: TObject);

  private
    FOperador   : iOperador;
    FCliente    : iCliente;
    FProduto    : iProduto;
    FPedido     : iPedido;
    FPedidoItem : iPedidoItem;

    FConexao: TDataModuleConexao;

    FOperadorController   : TOperadorController;
    FClienteController    : TClienteController;
    FProdutoController    : TProdutoController;
    FPedidoController     : TPedidoController;
    FPedidoItemController : TPedidoItemController;

  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FOperador   := TOperadorModel.New;
  FCliente    := TClienteModel.New;
  FProduto    := TProdutoModel.New;
  FPedido     := TPedidoModel.New;
  FPedidoItem := TPedidoItemModel.New;

  FConexao := TDataModuleConexao.New;

  FOperadorController   := TOperadorController.Create;
  FClienteController    := TClienteController.Create;
  FProdutoController    := TProdutoController.Create;
  FPedidoController     := TPedidoController.Create;
  FPedidoItemController := TPedidoItemController.Create;
end;

procedure TfrmPrincipal.btnCadClienteClick(Sender: TObject);
begin
  try
    if (edtCliente.Text <> '') and (edtCidadeCliente.Text <> '') and (edtUfCliente.Text <> '') then
    begin
      FCliente
        .Nome(edtCliente.Text)
        .Cidade(edtCidadeCliente.Text)
        .UF(edtUfCliente.Text);

      FClienteController.Salvar(TClienteModel(FCliente));
    end
    else
      ShowMessage('Campos não podem estar vazios.');
  finally
    edtCodCliente.Clear;
    edtCliente.Clear;
    edtCidadeCliente.Clear;
    edtUfCliente.Clear;

    edtCliente.SetFocus;

    btnRecTodosClienteClick(self);
  end;
end;

procedure TfrmPrincipal.btnCadOperadorClick(Sender: TObject);
begin
  try
    if edtOperador.Text <> '' then
    begin
      FOperador.Nome(edtOperador.Text);

      FOperadorController.Salvar(TOperadorModel(FOperador));

      btnRecTodosOperadoresClick(self);
    end
    else
      ShowMessage('Campo nome não poder ser vazio.');
  finally
    edtOperador.Clear;
    edtOperador.SetFocus;
  end;
end;

procedure TfrmPrincipal.btnCadProdutoClick(Sender: TObject);
begin
  try
    if edtDescricaoProduto.Text <> '' then
    begin
      FProduto.Descricao(edtDescricaoProduto.Text).PrecoProduto(StrToCurr(edtValorProduto.Text));

      FProdutoController.Salvar(TProdutoModel(FProduto));

      btnRecTodosProdutosClick(self);
    end
    else
      ShowMessage('Campo nome não poder ser vazio.');
  finally
    edtDescricaoProduto.Clear;
    edtValorProduto.Clear;
    edtDescricaoProduto.SetFocus;
  end;
end;

procedure TfrmPrincipal.btnRecClienteClick(Sender: TObject);
var
  LCodCliente: Integer;
begin
  if edtCodCliente.Text <> '' then
  begin
    LCodCliente := StrToInt(edtCodCliente.Text);
    try
      if FClienteController.VerificaSeExiste(StrToInt(edtCodCliente.Text)) then
      begin
        edtCliente.Text       := FClienteController.RecuperaPorCodigo(LCodCliente, 'nome');
        edtCidadeCliente.Text := FClienteController.RecuperaPorCodigo(LCodCliente, 'cidade');
        edtUfCliente.Text     := FClienteController.RecuperaPorCodigo(LCodCliente, 'uf');
      end
      else
      begin
        ShowMessage('Cliente não existe');
        edtCliente.Clear;
        edtCidadeCliente.Clear;
        edtUfCliente.Clear;
        edtCodCliente.Clear;
      end
    finally
      edtCodCliente.SetFocus;
      edtCodCliente.SelectAll;
    end;
  end
  else
    ShowMessage('Código não pode ser vazio.');
end;

procedure TfrmPrincipal.btnRecOperadorClick(Sender: TObject);
begin
  if edtCodigoOperador.Text <> '' then
  begin
    try
      edtOperador.Text := FOperadorController.RecuperaPorCodigo(StrToInt(edtCodigoOperador.Text), 'nome')
    finally
      edtCodigoOperador.SetFocus;
      edtCodigoOperador.SelectAll;
    end;
  end
  else
    ShowMessage('Código não pode ser vazio.'); // verificar depois validações no controller
end;

procedure TfrmPrincipal.btnRecTodosOperadoresClick(Sender: TObject);
begin
  FConexao.DataSource.DataSet := FOperadorController.RecuperaTodos;
  dbgrdOperador.Columns[0].Width := 100; // codigo
  dbgrdOperador.Columns[1].Width := 400; // nome
end;

procedure TfrmPrincipal.btnRecTodosProdutosClick(Sender: TObject);
begin
  FConexao.DataSource.DataSet := FProdutoController.RecuperaTodos;
  dbgrdProdutos.Columns[0].Width := 100; // codigo
  dbgrdProdutos.Columns[1].Width := 400; // descricao
  dbgrdProdutos.Columns[2].Width := 130; // preco
end;

procedure TfrmPrincipal.dbgrdClienteDblClick(Sender: TObject);
var
  LCodCliente: Integer;
begin
  LCodCliente           := dbgrdCliente.Fields[0].AsInteger;
  edtCodCliente.Text    := FClienteController.RecuperaPorCodigo(LCodCliente, 'codigo');
  edtCliente.Text       := FClienteController.RecuperaPorCodigo(LCodCliente, 'nome');
  edtCidadeCliente.Text := FClienteController.RecuperaPorCodigo(LCodCliente, 'cidade');
  edtUfCliente.Text     := FClienteController.RecuperaPorCodigo(LCodCliente, 'uf');
end;

procedure TfrmPrincipal.dbgrdOperadorDblClick(Sender: TObject);
var
  LCodOperador: Integer;
begin
  LCodOperador           := dbgrdProdutos.Fields[0].AsInteger;
  edtCodigoOperador.Text := FOperadorController.RecuperaPorCodigo(LCodOperador, 'codigo');
  edtOperador.Text       := FOperadorController.RecuperaPorCodigo(LCodOperador, 'nome');
end;

procedure TfrmPrincipal.dbgrdProdutosDblClick(Sender: TObject);
var
  LCodProduto: Integer;
begin
  LCodProduto              := dbgrdProdutos.Fields[0].AsInteger;
  edtCodigoProduto.Text    := FProdutoController.RecuperaPorCodigo(LCodProduto, 'codigo');
  edtDescricaoProduto.Text := FProdutoController.RecuperaPorCodigo(LCodProduto, 'descricao');
  edtValorProduto.Text     := FProdutoController.RecuperaPorCodigo(LCodProduto, 'preco_venda');
end;

procedure TfrmPrincipal.btnRecTodosClienteClick(Sender: TObject);
begin
  FConexao.DataSource.DataSet := FClienteController.RecuperaTodos;
  dbgrdCliente.Columns[0].Width := 100; // codigo
  dbgrdCliente.Columns[1].Width := 300; // nome
  dbgrdCliente.Columns[2].Width := 220; // cidade
  dbgrdCliente.Columns[3].Width := 110; // uf
end;

procedure TfrmPrincipal.btnDelClienteClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir?', 'Atenção', 52) = mrYes then
    FClienteController.Remover(StrToInt(edtCodCliente.Text));

  edtCodCliente.Clear;
  edtCliente.Clear;
  edtCidadeCliente.Clear;
  edtUfCliente.Clear;

  btnRecTodosClienteClick(self);
end;

procedure TfrmPrincipal.btnDelOperadorClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir?', 'Atenção', 52) = mrYes then
    FOperadorController.Remover(StrToInt(edtCodigoOperador.Text));

  edtCodigoOperador.Clear;
  edtOperador.Clear;
  btnRecTodosOperadoresClick(self);
end;

procedure TfrmPrincipal.btnDelProdutoClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir?', 'Atenção', 52) = mrYes then
    FProdutoController.Remover(StrToInt(edtCodigoProduto.Text));

  edtCodigoProduto.Clear;
  edtDescricaoProduto.Clear;
  edtValorProduto.Clear;
  btnRecTodosProdutosClick(self);
end;

procedure TfrmPrincipal.btnEdtClienteClick(Sender: TObject);
begin
  FCliente.Codigo(StrToInt(edtCodCliente.Text)).Nome(edtCliente.Text).Cidade(edtCidadeCliente.Text).UF(edtUfCliente.Text);

  FClienteController.Editar(TClienteModel(FCliente));

  edtCliente.Clear;
  edtCodCliente.Clear;
  edtCidadeCliente.Clear;
  edtUfCliente.Clear;

  btnRecTodosClienteClick(self);
end;

procedure TfrmPrincipal.btnEdtOperadorClick(Sender: TObject);
begin
  FOperador.Codigo(StrToInt(edtCodigoOperador.Text)).Nome(edtOperador.Text);

  FOperadorController.Editar(TOperadorModel(FOperador));

  edtCodigoOperador.Clear;
  edtOperador.Clear;

  btnRecTodosOperadoresClick(self);
end;

procedure TfrmPrincipal.btnEdtProdutoClick(Sender: TObject);
begin
  FProduto.Codigo(StrToInt(edtCodigoProduto.Text)).Descricao(edtDescricaoProduto.Text).PrecoProduto(edtValorProduto.Value);

  FProdutoController.Editar(TProdutoModel(FProduto));

  edtCodigoProduto.Clear;
  edtDescricaoProduto.Clear;
  edtCodigoProduto.Clear;

  btnRecTodosProdutosClick(self);
end;

procedure TfrmPrincipal.btnLimparCamposClick(Sender: TObject);
begin
  edtCodCliente.Clear;
  edtCliente.Clear;
  edtCidadeCliente.Clear;
  edtUfCliente.Clear;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if not FConexao.FDConexao.Connected = true then
    ShowMessage('Não conectado!');

  PageControlPrincipal.ActivePageIndex := 0;

  if edtCodCliente.CanFocus then
    edtCodCliente.SetFocus;
end;

procedure TfrmPrincipal.PageControlPrincipalChange(Sender: TObject);
begin
  FConexao.DataSource.DataSet.Close; { limpa o dataset ao mudar de aba. }

  if PageControlPrincipal.TabIndex = 3 then
  begin
    btnConfirmarPedido.Enabled := False;
    btnRecuProdPesq.Enabled    := False;
    btnAddProdPesq.Enabled     := False;
    edtCodProdutoPesq.Enabled  := False;
  end;

end;

procedure TfrmPrincipal.btnIniciarPedidoClick(Sender: TObject);
var
  lCodCliente: string;
  tstBool : Boolean;

  procedure habilitarBotoes;
  begin
    btnConfirmarPedido.Enabled := True;
    btnCancelarPedido.Enabled  := True;
    btnRecuProdPesq.Enabled    := True;
    btnAddProdPesq.Enabled     := True;
  end;

begin
  InputQuery('Cliente', 'Cód. Cliente', lCodCliente);

  if lCodCliente <> '' then
  begin
    edtCodClientePedido.Text := FClienteController.RecuperaPorCodigo(StrToInt(lCodCliente), 'codigo');
    edtClientePedido.Text    := FClienteController.RecuperaPorCodigo(StrToInt(lCodCliente), 'nome');

    { montar e inserir o pedido na tabela correspondente (pedido) }
    FPedido
      .NumeroPedido(FPedidoController.NovoCodigoPedido)
      .CodigoCliente(StrToInt(edtCodClientePedido.Text))
      .DataEmissao(now)
      .ValorTotal(0.0); { ao finalizar o pedido, fazer rotina para que o total do pedido do pedido seja a soma do itens do pedido item }
    { total zerado pois o pedido acabou de ser criado }
    { status 'A' pois está em andamento }

    FPedidoController.Salvar(TPedidoModel(FPedido));

    { habilitar os botões/edits de ação do pedido }
    habilitarBotoes;
    edtCodProdutoPesq.Enabled := True;
    btnIniciarPedido.Enabled  := False;
  end
  else
  begin
    ShowMessage('Pedido não pode ser efetuado sem um cliente válido.');
    btnCancelarPedidoClick(self);
  end;
end;

procedure TfrmPrincipal.btnRecuperaItensPedidoClick(Sender: TObject);
begin
  FConexao.DataSource.DataSet  := FPedidoItemController.RecuperaTodos;
  dbgrdPedido.Columns[0].Width := 100; // codigo_pedido
  dbgrdPedido.Columns[1].Width := 300; // produto
  dbgrdPedido.Columns[2].Width := 100; // quantidade
  dbgrdPedido.Columns[3].Width := 100; // valor_unitario
  dbgrdPedido.Columns[4].Width := 100; // total
end;

procedure TfrmPrincipal.btnRecuProdPesqClick(Sender: TObject);
begin
  if Trim(edtCodProdutoPesq.Text) <> '' then
  begin
    try
      edtDescProdutoPesq.Text  := FProdutoController.RecuperaPorCodigo(StrToInt(edtCodProdutoPesq.Text), 'descricao');
      edtValorProdutoPesq.Text := FProdutoController.RecuperaPorCodigo(StrToInt(edtCodProdutoPesq.Text), 'preco_venda');
    finally
      edtCodProdutoPesq.SetFocus;
      edtCodProdutoPesq.SelectAll;
    end;
  end
  else
  begin
    ShowMessage('Campo código não pode ser vazio!');
    edtCodProdutoPesq.SetFocus;
  end
end;

procedure TfrmPrincipal.btnCancelarPedidoClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar o pedido?', 'Atenção', 52) = mrYes then
  begin
    { lógica para remover os itens dos pedidos antes do pedido }
    FPedidoItemController.RemoverPedidos(FPedido.NumeroPedido);
    FPedidoController.Remover(FPedido.CodigoCliente);
    FConexao.DataSource.DataSet  := FPedidoItemController.RecuperaItemPedidoPorCodigo(FPedido.NumeroPedido);
  end;

  { rotina para desabilitar ações ao cancelar o pedido }
  btnConfirmarPedido.Enabled := False;
  btnRecuProdPesq.Enabled    := False;
  btnAddProdPesq.Enabled     := False;
  btnIniciarPedido.Enabled   := True;

  edtCodClientePedido.Clear;
  edtClientePedido.Clear;
  edtCodProdutoPesq.Clear;
  edtDescProdutoPesq.Clear;
  edtValorProdutoPesq.Clear;
end;

procedure TfrmPrincipal.btnConfirmarPedidoClick(Sender: TObject);
begin
  { Recuperar o total do pedido e adicinoar no pedido }
  { Trocar o status do pedido e dos itens do pedido para 'E'. }

  ShowMessage('Valor do pedido: ' + CurrToStr(FPedidoController.RetornaTotalPedido(FPedido.NumeroPedido)));
end;

procedure TfrmPrincipal.btnAddProdPesqClick(Sender: TObject);
begin
  try
    { adicionar o pedido recuperado à tabela de pedido item com os dados do cliente }

    FPedidoItem
      .NumeroPedido(FPedido.NumeroPedido)
      .NumeroItemPedido(StrToInt(edtCodProdutoPesq.Text))
      .Quantidade(1) { vai ser mudado para poder dizer quantas unidades irão ser }
      .ValorUnitario(StrToCurr(edtValorProdutoPesq.Text))
      .ValorTotal(StrToCurr(edtValorProdutoPesq.Text) * 1);

    FPedidoItemController.AdicionarItem(TPedidoItemModel(FPedidoItem));

    { Atualiza o DBGrid com os dado dos itens do pedido corrente }

    FConexao.DataSource.DataSet  := FPedidoItemController.RecuperaItemPedidoPorCodigo(FPedido.NumeroPedido);
    dbgrdPedido.Columns[0].Width := 100; // codigo_pedido
    dbgrdPedido.Columns[1].Width := 300; // produto
    dbgrdPedido.Columns[2].Width := 100; // quantidade
    dbgrdPedido.Columns[3].Width := 100; // valor_unitario
    dbgrdPedido.Columns[4].Width := 100; // total

  finally
    edtCodProdutoPesq.Clear;
    edtCodProdutoPesq.SetFocus;
    edtDescProdutoPesq.Clear;
    edtValorProdutoPesq.Clear;
  end;
end;

end.

