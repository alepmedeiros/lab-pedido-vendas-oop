unit View.Principal;

interface

uses
  { Delphi }
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
  Vcl.Menus,

  { Controllers }
  Produto.Controller,
  Operador.Controller,
  Pedido.Controller,
  PedidoItem.Controller,
  Cliente.Controller,

  { Connection }
  DataModule,
  Conexao.Banco.Control,
  Data.DB;

type
  TAbas = (abaCliente, abaOperadores, abaProdutos, abaNovoPedido, abaGerenciarPedido);

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
    lblNome: TLabel;
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
    lblTotalPedido: TLabel;
    edtQuantidade: TEdit;
    lblQuantidade: TLabel;
    btnRemoverEntrada: TButton;
    dbgrdPedidosConcluidos: TDBGrid;
    dbgrdPedidoItemConcluidos: TDBGrid;
    lblPedidosConcluidos: TLabel;
    lblItensPedidos: TLabel;
    btnExcluirPedido: TButton;
    btnAttEntrada: TButton;
    edtValorProdutoPesq: TEdit;
    edtValorProduto: TEdit;
    edtTotalPedido: TEdit;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RemoverItem1Click(Sender: TObject);
    procedure edtCodProdutoPesqKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQuantidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtCodProdutoPesqExit(Sender: TObject);
    procedure btnRemoverEntradaClick(Sender: TObject);
    procedure dbgrdPedidoCellClick(Column: TColumn);
    procedure PageControlPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbgrdPedidosConcluidosCellClick(Column: TColumn);
    procedure dbgrdPedidosConcluidosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrdPedidosConcluidosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrdPedidoDblClick(Sender: TObject);
    procedure btnAttEntradaClick(Sender: TObject);
    procedure btnExcluirPedidoClick(Sender: TObject);
    procedure dbgrdPedidosConcluidosMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

  private
    FDM: TDataModuleUnit;
    FConexao: TConexaoControl;

    FOperadorController   : TOperadorController;
    FClienteController    : TClienteController;
    FProdutoController    : TProdutoController;
    FPedidoController     : TPedidoController;
    FPedidoItemController : TPedidoItemController;

    FNumPedido: Variant;
    FNumEntrada: Integer;

    procedure desabilitarAcoes;
    procedure AtualizaGridPedido;
    procedure AtualizaPedidoItemConcluidos;
    procedure ConfiguracaoInicial;
    procedure AtualizaGridCliente;
    procedure AtualizaGridOperador;
    procedure AtualizaGridProduto;
    procedure AtualizaGridPedidosConcluidos;
    procedure ConectandoBancoDeDados;

  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Conexao.Banco;

{$R *.dfm}

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FConexao.Destroy;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ConectandoBancoDeDados; { conexao nova, em classe }
  //ConfiguracaoInicial; { conexao antiga, no data moduloe }

  FNumPedido := 0;

  FOperadorController   := TOperadorController.Create;
  FClienteController    := TClienteController.Create;
  FProdutoController    := TProdutoController.Create;
  FPedidoController     := TPedidoController.Create;
  FPedidoItemController := TPedidoItemController.Create;
end;

procedure TfrmPrincipal.ConectandoBancoDeDados;
begin
  { exemplo que recuperar instância de conexão }
  FDM      := TDataModuleUnit.New;
  FConexao := TConexaoControl.getInstancia;

  with FConexao do
  begin
    ShowMessage(
      'Dados da conexão: ' + sLineBreak + sLineBreak +
      'Driver Name: ' + getInstancia.Conexao.getConexao.DriverName + sLineBreak +
      'Driver ID: ' + getInstancia.Conexao.getConexao.Params.DriverID + sLineBreak +
      'Database User: ' + getInstancia.Conexao.getConexao.Params.UserName + sLineBreak +
      'Database SQLite: ' + getInstancia.Conexao.getConexao.Params.Database
    );

    { Adicionar leitura e gravação do arquivo .INI. }
  end;
end;

procedure TfrmPrincipal.ConfiguracaoInicial;
begin
  FDM := TDataModuleUnit.New;

  with FDM do
  begin
    if not FDM.LerIni then
    begin
      showmessage('Nenhum arquivo .INI configurado.' + sLineBreak + 'Gravando .INI com dados padrão.');
      try
        GravarIni;
      finally
        ShowMessage('Arquivo .INI criado com sucesso. Verifique-o, configure-o e reinicie a aplicação.');
        Application.Terminate;
      end;
    end;

    try
      //ConfigurarConn;
    except
      on E: Exception do
        raise Exception.Create('Error: ' + E.Message);
    end;
  end;

end;

procedure TfrmPrincipal.btnCadClienteClick(Sender: TObject);
begin
  try
    FClienteController
      .Salvar(edtCliente.Text, edtCidadeCliente.Text, edtUfCliente.Text);
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
    FOperadorController
      .Salvar(edtOperador.Text);
  finally
    btnRecTodosOperadoresClick(self);
    edtCodigoOperador.Clear;
    edtOperador.Clear;
    edtOperador.SetFocus;
  end;
end;

procedure TfrmPrincipal.btnCadProdutoClick(Sender: TObject);
begin
  try
    FProdutoController
      .Salvar(edtDescricaoProduto.Text, edtValorProduto.Text);
  finally
    btnRecTodosProdutosClick(self);
    edtCodigoProduto.Clear;
    edtValorProduto.Clear;
    edtDescricaoProduto.Clear;
    edtDescricaoProduto.SetFocus;
  end;
end;

procedure TfrmPrincipal.btnEdtProdutoClick(Sender: TObject);
begin
  try
    FProdutoController
      .Editar(edtCodigoProduto.Text, edtDescricaoProduto.Text, edtValorProduto.Text);
  finally
    btnRecTodosProdutosClick(self);
    edtCodigoProduto.Clear;
    edtValorProduto.Clear;
    edtDescricaoProduto.Clear;
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
  { melhoria: fazer o controller retornar um objeto. }
  if edtCodigoOperador.Text <> '' then
  begin
    try
      edtOperador.Text := FOperadorController
        .RecuperaPorCodigo(StrToInt(edtCodigoOperador.Text), 'nome')
    finally
      edtCodigoOperador.SetFocus;
      edtCodigoOperador.SelectAll;
    end;
  end
  else
    ShowMessage('Código não pode ser vazio.');
end;

procedure TfrmPrincipal.btnRecTodosOperadoresClick(Sender: TObject);
begin
  FDM.DataSource.DataSet.Close;
  FDM.DataSource.DataSet := FOperadorController.RecuperaTodos;
  AtualizaGridOperador;
end;

procedure TfrmPrincipal.btnRecTodosProdutosClick(Sender: TObject);
begin
  FDM.DataSource.DataSet.Close;
  FDM.DataSource.DataSet := FProdutoController.RecuperaTodos;
  AtualizaGridProduto;
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

procedure TfrmPrincipal.dbgrdPedidoCellClick(Column: TColumn);
begin
  FNumEntrada := dbgrdPedido.Fields[0].AsInteger;
end;

procedure TfrmPrincipal.dbgrdPedidoDblClick(Sender: TObject);
begin
  btnAddProdPesq.Enabled := False;

  FNumEntrada := dbgrdPedido.Fields[0].AsInteger;
  { valores que precisam vir do banco }
  edtQuantidade.Text := IntToStr(FPedidoItemController.RecuperaPorCodigo(FNumEntrada, 'quantidade'));
  edtValorProdutoPesq.Text := FormatFloat('###,##0.00', FPedidoItemController.RecuperaPorCodigo(FNumEntrada, 'valor_unitario'));

  { dado que pode vir do dbgrid pois vai ser apenas visual }
  edtDescProdutoPesq.Text := dbgrdPedido.Fields[2].AsString;
end;

procedure TfrmPrincipal.dbgrdPedidosConcluidosCellClick(Column: TColumn);
begin
  FDM.DataSourceAux.DataSet.Close;
  FDM.DataSourceAux.DataSet := FPedidoItemController.RecuperaItemPedidoPorCodigo(dbgrdPedidosConcluidos.Fields[0].AsInteger);
  AtualizaPedidoItemConcluidos;
end;

procedure TfrmPrincipal.dbgrdPedidosConcluidosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FDM.DataSourceAux.DataSet.Close;
  FDM.DataSourceAux.DataSet := FPedidoItemController.RecuperaItemPedidoPorCodigo(dbgrdPedidosConcluidos.Fields[0].AsInteger);
  AtualizaPedidoItemConcluidos;
end;

procedure TfrmPrincipal.dbgrdPedidosConcluidosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FDM.DataSourceAux.DataSet.Close;
  FDM.DataSourceAux.DataSet := FPedidoItemController.RecuperaItemPedidoPorCodigo(dbgrdPedidosConcluidos.Fields[0].AsInteger);
  AtualizaPedidoItemConcluidos;
end;

procedure TfrmPrincipal.dbgrdPedidosConcluidosMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  FDM.DataSourceAux.DataSet.Close;
  FDM.DataSourceAux.DataSet := FPedidoItemController.RecuperaItemPedidoPorCodigo(dbgrdPedidosConcluidos.Fields[0].AsInteger);
  AtualizaPedidoItemConcluidos;
end;

procedure TfrmPrincipal.dbgrdProdutosDblClick(Sender: TObject);
var
  LCodProduto: Integer;
begin
  LCodProduto              := dbgrdProdutos.Fields[0].AsInteger;
  edtCodigoProduto.Text    := FProdutoController.RecuperaPorCodigo(LCodProduto, 'codigo');
  edtDescricaoProduto.Text := FProdutoController.RecuperaPorCodigo(LCodProduto, 'descricao');
  edtValorProduto.Text     := FormatFloat('###,##0.00', FProdutoController.RecuperaPorCodigo(LCodProduto, 'preco_venda'));
end;

procedure TfrmPrincipal.btnRecTodosClienteClick(Sender: TObject);
begin
  FDM.DataSource.DataSet.Close;
  FDM.DataSource.DataSet := FClienteController.RecuperaTodos;
  AtualizaGridCliente;
end;

procedure TfrmPrincipal.btnDelClienteClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir?', 'Atenção', 52) = mrYes then
    FClienteController
      .Remover(StrToInt(edtCodCliente.Text));

  edtCodCliente.Clear;
  edtCliente.Clear;
  edtCidadeCliente.Clear;
  edtUfCliente.Clear;

  btnRecTodosClienteClick(self);
end;

procedure TfrmPrincipal.btnDelOperadorClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir?', 'Atenção', 52) = mrYes then
    FOperadorController
      .Remover(StrToInt(edtCodigoOperador.Text));

  edtCodigoOperador.SetFocus;
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
  FClienteController
    .Editar(edtCodCliente.Text, edtCliente.Text, edtCidadeCliente.Text, edtUfCliente.Text);

  edtCliente.Clear;
  edtCodCliente.Clear;
  edtCidadeCliente.Clear;
  edtUfCliente.Clear;

  btnRecTodosClienteClick(self);
end;

procedure TfrmPrincipal.btnEdtOperadorClick(Sender: TObject);
begin
  FOperadorController
    .Editar(edtCodigoOperador.Text, edtOperador.Text);

  edtCodigoOperador.SetFocus;
  edtCodigoOperador.Clear;
  edtOperador.Clear;

  btnRecTodosOperadoresClick(self);
end;

procedure TfrmPrincipal.btnExcluirPedidoClick(Sender: TObject);
begin

  if dbgrdPedidosConcluidos.Fields[0].AsString = '' then
  begin
    ShowMessage('Escolha uma entrada!');
    Exit;
  end;

  if Application.MessageBox('Deseja exlcuir o pedido selecionado?', 'Atenção', 52) = mrYes then
  begin
    FPedidoController
      .Remover(dbgrdPedidosConcluidos.Fields[0].AsInteger);

    FDM.DataSource.DataSet.Close;
    FDM.DataSource.DataSet := FPedidoController.RecuperaTodos;
    AtualizaGridPedidosConcluidos;
    FDM.DataSourceAux.DataSet.Close;
  end;
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
//  if not FConexaoDM.FDConexao.Connected then
//  begin
//    ShowMessage('Não conectado!');
//    Application.Terminate;
//  end;

  PageControlPrincipal.ActivePageIndex := 0;

  if edtCodCliente.CanFocus then
    edtCodCliente.SetFocus;

  PageControlPrincipalChange(Self);
end;

procedure TfrmPrincipal.PageControlPrincipalChange(Sender: TObject);
begin
  FDM.DataSource.DataSet.Close; { limpa o dataset ao mudar de aba. }

  if PageControlPrincipal.TabIndex = Integer(abaCliente) then
  begin
    FDM.DataSource.DataSet := FClienteController.RecuperaTodos;
    AtualizaGridCliente;
  end
  else if PageControlPrincipal.TabIndex = Integer(abaOperadores) then
  begin
    FDM.DataSource.DataSet := FOperadorController.RecuperaTodos;
    AtualizaGridOperador;
  end
  else if PageControlPrincipal.TabIndex = Integer(abaProdutos) then
  begin
    FDM.DataSource.DataSet := FProdutoController.RecuperaTodos;
    AtualizaGridProduto;
  end
  else if PageControlPrincipal.TabIndex = Integer(abaNovoPedido) then
  begin
    btnConfirmarPedido.Enabled  := False;
    btnRecuProdPesq.Enabled     := False;
    btnAddProdPesq.Enabled      := False;
    btnCancelarPedido.Enabled   := False;
    btnRemoverEntrada.Enabled   := False;
    btnAttEntrada.Enabled       := False;
    edtValorProdutoPesq.Enabled := False;
    edtCodProdutoPesq.Enabled   := False;
    edtQuantidade.Enabled       := False;
  end
  else if PageControlPrincipal.TabIndex = Integer(abaGerenciarPedido) then
  begin
    FNumPedido := 0;
    FDM.DataSource.DataSet := FPedidoController.RecuperaTodos;
    AtualizaGridPedidosConcluidos;
  end;
end;

procedure TfrmPrincipal.PageControlPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if PageControlPrincipal.TabIndex = Integer(abaNovoPedido) then
  begin
    if FPedidoController.PedidoEmAndamento = True then
    begin
      if Application.MessageBox('Deseja cancelar o pedido?', 'Atenção', 52) = mrYes then
      begin
        FPedidoItemController
          .RemoverPedidos('A');
        FPedidoController
          .Remover('A');
        FDM.DataSource.DataSet.Close;
        desabilitarAcoes;
      end
      else
      begin
        AllowChange := False;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.RemoverItem1Click(Sender: TObject);
begin
  ShowMessage('Removerndo Item');
end;

procedure TfrmPrincipal.btnIniciarPedidoClick(Sender: TObject);
var
  lCodCliente: string;

  procedure habilitarCampos;
  begin
    btnConfirmarPedido.Enabled  := True;
    btnCancelarPedido.Enabled   := True;
    btnRecuProdPesq.Enabled     := True;
    btnAddProdPesq.Enabled      := True;
    btnRemoverEntrada.Enabled   := True;
    btnAttEntrada.Enabled       := True;
    btnIniciarPedido.Enabled    := False;
    edtCodProdutoPesq.Enabled   := True;
    edtQuantidade.Enabled       := True;
    edtValorProdutoPesq.Enabled := True;
  end;

begin
  InputQuery('Cliente', 'Cód. Cliente', lCodCliente);

  if lCodCliente <> '' then
  begin
    { Recupera dados do cliente cadastrado }
    edtCodClientePedido.Text := FClienteController.RecuperaPorCodigo(StrToInt(lCodCliente), 'codigo');
    edtClientePedido.Text    := FClienteController.RecuperaPorCodigo(StrToInt(lCodCliente), 'nome');

    { montar e inserir o pedido na tabela correspondente (pedido) }
    FNumPedido := FPedidoController.NovoCodigoPedido;

    FPedidoController.Salvar(FNumPedido, edtCodClientePedido.Text, '0', now);

    { habilitar os botões/edits de ação do pedido }
    habilitarCampos;
    edtCodProdutoPesq.SetFocus;
  end
  else
    ShowMessage('Pedido não pode ser efetuado sem um cliente válido.');
end;

procedure TfrmPrincipal.btnRecuProdPesqClick(Sender: TObject);
begin
  if Trim(edtCodProdutoPesq.Text) <> '' then
  begin
    try
      edtDescProdutoPesq.Text  := FProdutoController.RecuperaPorCodigo(StrToInt(edtCodProdutoPesq.Text), 'descricao');
      edtValorProdutoPesq.Text := FProdutoController.RecuperaPorCodigo(StrToInt(edtCodProdutoPesq.Text), 'preco_venda');
      edtQuantidade.SetFocus;
      edtQuantidade.SelectAll;
    except
      on E: Exception do
      begin
        edtQuantidade.Clear;
        edtCodProdutoPesq.SetFocus;
        edtCodProdutoPesq.SelectAll;

        raise Exception.Create(E.Message);
      end;
    end;
  end
  else
  begin
    ShowMessage('Campo código não pode ser vazio!');
    edtCodProdutoPesq.SetFocus;
  end
end;

procedure TfrmPrincipal.btnRemoverEntradaClick(Sender: TObject);
begin
  if FNumEntrada = 0 then
  begin
    ShowMessage('Selecione uma entrada no carrinho!');
    Exit;
  end;

  if Application.MessageBox(PWideChar('Deseja remover a entrada ' + inttostr(FNumEntrada) + '?'), 'Atenção', 52) = mrYes then
  begin
    FPedidoItemController
      .RemoverEntrada(FNumPedido, FNumEntrada);

    FPedidoController
      .AtualizarTotalPedido(
        FPedidoController
          .RetornaTotalPedido(FNumPedido),
          FNumPedido
        );

    FNumEntrada := 0;
    edtTotalPedido.Text := FormatFloat('R$ ###,##0.00', FPedidoController.RetornaTotalPedido(FNumPedido));
    FDM.DataSource.DataSet := FPedidoItemController.RecuperaItemPedidoPorCodigo(FNumPedido);
    AtualizaGridPedido;
  end;
end;

procedure TfrmPrincipal.desabilitarAcoes;
begin
  { rotina para desabilitar ações ao cancelar o pedido }
  edtCodClientePedido.Clear;
  edtClientePedido.Clear;
  edtCodProdutoPesq.Clear;
  edtDescProdutoPesq.Clear;
  edtValorProdutoPesq.Clear;
  edtTotalPedido.Clear;
  edtQuantidade.Clear;

  btnConfirmarPedido.Enabled  := False;
  btnRecuProdPesq.Enabled     := False;
  btnAddProdPesq.Enabled      := False;
  btnCancelarPedido.Enabled   := False;
  btnRemoverEntrada.Enabled   := False;
  btnAttEntrada.Enabled       := False;
  edtCodProdutoPesq.Enabled   := False;
  edtQuantidade.Enabled       := False;
  edtValorProdutoPesq.Enabled := False;

  btnIniciarPedido.Enabled := True;
end;

procedure TfrmPrincipal.edtCodProdutoPesqExit(Sender: TObject);
begin
  if Trim(edtCodProdutoPesq.Text) <> '' then
  begin
    try
      edtDescProdutoPesq.Text  := FProdutoController.RecuperaPorCodigo(StrToInt(edtCodProdutoPesq.Text), 'descricao');
      edtValorProdutoPesq.Text := FProdutoController.RecuperaPorCodigo(StrToInt(edtCodProdutoPesq.Text), 'preco_venda');
      edtQuantidade.SetFocus;
      edtQuantidade.SelectAll;
    except
      on E: Exception do
      begin
        edtQuantidade.Clear;
        edtCodProdutoPesq.SetFocus;
        edtCodProdutoPesq.SelectAll;

        raise Exception.Create(E.Message);
      end;
    end;
  end;
end;

procedure TfrmPrincipal.edtCodProdutoPesqKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    btnRecuProdPesqClick(self);
    edtQuantidade.SetFocus;
  end;

end;

procedure TfrmPrincipal.edtQuantidadeEnter(Sender: TObject);
begin
  edtQuantidade.Text := '1';
end;

procedure TfrmPrincipal.edtQuantidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnAddProdPesq.SetFocus;
end;

procedure TfrmPrincipal.btnCancelarPedidoClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar o pedido?', 'Atenção', 52) = mrYes then
  begin
    { lógica para remover os itens dos pedidos antes do pedido }
    FPedidoItemController.RemoverPedidos('A');
    FPedidoController.Remover({FPedido.CodigoCliente,} 'A');
    FDM.DataSource.DataSet.Close;
    FNumPedido := 0;
  end;

  desabilitarAcoes;
end;

procedure TfrmPrincipal.btnConfirmarPedidoClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja confirmar o pedido?', 'Atenção', 52) = mrYes then
  begin
    { lógica para alterar o status dos itens dos pedidos de depois do pedido }
    FPedidoItemController.ConfirmaPedidoItem(FNumPedido);

    FPedidoController.ConfirmaPedido(FNumPedido);

    FDM.DataSource.DataSet.Close;
    FNumPedido := 0;
  end;

  desabilitarAcoes;
end;

procedure TfrmPrincipal.btnAddProdPesqClick(Sender: TObject);
begin
  try
    { adicionar o pedido recuperado à tabela de pedido item com os dados do cliente }
    FPedidoItemController
      .AdicionarItem(FNumPedido, edtCodProdutoPesq.Text, edtQuantidade.Text, edtValorProdutoPesq.Text, '0');

    FPedidoController
      .AtualizarTotalPedido(FPedidoController.RetornaTotalPedido(FNumPedido), FNumPedido);

    edtQuantidade.Clear;
    edtTotalPedido.Text := FormatFloat('R$ ###,##0.00', FPedidoController.RetornaTotalPedido(FNumPedido));
    FDM.DataSource.DataSet.Close;
    FDM.DataSource.DataSet := FPedidoItemController.RecuperaItemPedidoPorCodigo(FNumPedido);

    AtualizaGridPedido;
  finally
    edtCodProdutoPesq.Clear;
    edtCodProdutoPesq.SetFocus;
    edtDescProdutoPesq.Clear;
    edtValorProdutoPesq.Clear;
  end;
end;

procedure TfrmPrincipal.btnAttEntradaClick(Sender: TObject);
begin
  if FNumEntrada = 0 then
  begin
    ShowMessage('Escola uma entrada no carrinho para atualizar!');
    Abort;
  end;

  FPedidoItemController.AtualizarEntrada(StrToCurr(edtValorProdutoPesq.Text), StrToInt(edtQuantidade.Text), FNumPedido, FNumEntrada);

  FPedidoController
    .AtualizarTotalPedido(
      FPedidoController
        .RetornaTotalPedido(
          FNumPedido
        ),
        FNumPedido
      );

  { apos atualizar a entrada }
  FDM.DataSource.DataSet := FPedidoItemController.RecuperaItemPedidoPorCodigo(FNumPedido);
  AtualizaGridPedido;
  btnAddProdPesq.Enabled := True;

  edtTotalPedido.Text := FormatFloat('R$ ###,##0.00', FPedidoController.RetornaTotalPedido(FNumPedido));

  edtCodProdutoPesq.Clear;
  edtCodProdutoPesq.SetFocus;
  edtDescProdutoPesq.Clear;
  edtValorProdutoPesq.Clear;
  edtQuantidade.Clear;
end;

procedure TfrmPrincipal.AtualizaGridCliente;
begin
  dbgrdCliente.Columns[0].Title.Caption := 'Código';
  dbgrdCliente.Columns[0].Width := 100;
  dbgrdCliente.Columns[1].Title.Caption := 'Cliente';
  dbgrdCliente.Columns[1].Width := 300;
  dbgrdCliente.Columns[2].Title.Caption := 'Cidade';
  dbgrdCliente.Columns[2].Width := 220;
  dbgrdCliente.Columns[3].Title.Caption := 'UF';
  dbgrdCliente.Columns[3].Width := 110;
end;

procedure TfrmPrincipal.AtualizaGridOperador;
begin
  dbgrdOperador.Columns[0].Title.Caption := 'Código';
  dbgrdOperador.Columns[0].Width := 100;
  dbgrdOperador.Columns[1].Title.Caption := 'Operador';
  dbgrdOperador.Columns[1].Width := 400;
end;

procedure TfrmPrincipal.AtualizaGridProduto;
begin
  dbgrdProdutos.Columns[0].Title.Caption := 'Código';
  dbgrdProdutos.Columns[0].Width := 100;
  dbgrdProdutos.Columns[1].Title.Caption := 'Descrição';
  dbgrdProdutos.Columns[1].Width := 400;
  dbgrdProdutos.Columns[2].Title.Caption := 'Valor Unitário';
  dbgrdProdutos.Columns[2].Width := 130;
end;

procedure TfrmPrincipal.AtualizaGridPedido;
begin
  dbgrdPedido.Columns[0].Title.Caption := 'Entrada';
  dbgrdPedido.Columns[0].Width := 060;
  dbgrdPedido.Columns[1].Title.Caption := 'Cod. Prod.';
  dbgrdPedido.Columns[1].Width := 060;
  dbgrdPedido.Columns[2].Title.Caption := 'Descrição';
  dbgrdPedido.Columns[2].Width := 300;
  dbgrdPedido.Columns[3].Title.Caption := 'Quantidade';
  dbgrdPedido.Columns[3].Width := 100;
  dbgrdPedido.Columns[4].Title.Caption := 'Val Uni.';
  dbgrdPedido.Columns[4].Width := 100;
  dbgrdPedido.Columns[5].Title.Caption := 'Total';
  dbgrdPedido.Columns[5].Width := 100;
end;

procedure TfrmPrincipal.AtualizaGridPedidosConcluidos;
begin
  dbgrdPedidosConcluidos.Columns[0].Title.Caption := 'Código';
  dbgrdPedidosConcluidos.Columns[0].Width := 100;
  dbgrdPedidosConcluidos.Columns[1].Title.Caption := 'Cliente';
  dbgrdPedidosConcluidos.Columns[1].Width := 350;
  dbgrdPedidosConcluidos.Columns[2].Title.Caption := 'Data';
  dbgrdPedidosConcluidos.Columns[2].Width := 130;
  dbgrdPedidosConcluidos.Columns[3].Title.Caption := 'Valor Total';
  dbgrdPedidosConcluidos.Columns[3].Width := 130;
end;

procedure TfrmPrincipal.AtualizaPedidoItemConcluidos;
begin
  dbgrdPedidoItemConcluidos.Columns[0].Title.Caption := '#';
  dbgrdPedidoItemConcluidos.Columns[0].Width := 100;
  dbgrdPedidoItemConcluidos.Columns[1].Title.Caption := 'Produto';
  dbgrdPedidoItemConcluidos.Columns[1].Width := 100;
  dbgrdPedidoItemConcluidos.Columns[2].Title.Caption := 'Descrição';
  dbgrdPedidoItemConcluidos.Columns[2].Width := 220;
  dbgrdPedidoItemConcluidos.Columns[3].Title.Caption := 'Quantidade';
  dbgrdPedidoItemConcluidos.Columns[3].Width := 100;
  dbgrdPedidoItemConcluidos.Columns[4].Title.Caption := 'Valor Uni.';
  dbgrdPedidoItemConcluidos.Columns[4].Width := 100;
  dbgrdPedidoItemConcluidos.Columns[5].Title.Caption := 'Valor Total';
  dbgrdPedidoItemConcluidos.Columns[5].Width := 100;
end;

end.

