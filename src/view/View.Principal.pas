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
  Model.Interfaces.Produto,
  Model.Interfaces.Operador,
  Model.Interfaces.Pedido,
  Model.Interfaces.ItensPedido,
  Model.Interfaces.Cliente,
  Model.Produto,
  Model.Operador,
  Model.Pedido,
  Model.ItensPedido,
  Model.Cliente,
  Operador.DAO,
  Cliente.DAO,
  Produto.DAO,
  DM.Conexao,
  Data.DB,
  RxToolEdit,
  RxCurrEdit;

type
  TfrmPrincipal = class(TForm)
    PageControlPrincipal: TPageControl;
    TabSheet4: TTabSheet;
    edtOperador: TEdit;
    lblNomeOperador: TLabel;
    btnCadOperador: TButton;
    lblCodigoOperador: TLabel;
    btnRecOperador: TButton;
    edtNomeOperadorRetornado: TEdit;
    lblNomeOperadorRetornado: TLabel;
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
    edtCodCliente: TEdit;
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

  private
    { Private declarations }
    FOperador    : iOperador;
    FCliente     : iCliente;
    FProduto     : iProduto;

    FConexao     : TDataModuleConexao;

    FDAOOperador : TOperadorDAO;
    FDAOCliente  : TClienteDAO;
    FDAOProduto  : TProdutoDAO;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCadClienteClick(Sender: TObject);
begin
  try
    if (edtCliente.Text <> '') and
       (edtCidadeCliente.Text <> '') and
       (edtUfCliente.Text <> '')
    then
    begin
      FCliente
        .Nome(edtCliente.Text)
        .Cidade(edtCidadeCliente.Text)
        .UF(edtUfCliente.Text);

      FDAOCliente.Salvar(TClienteModel(FCliente));
    end
    else
      ShowMessage('Campos não podem estar vazios.');
  finally
    edtCliente.Clear;
    edtCliente.SetFocus;

    btnRecTodosClienteClick(self);
  end;
end;

procedure TfrmPrincipal.btnCadOperadorClick(Sender: TObject);
begin
  try
    if edtOperador.Text <> '' then
    begin
      FOperador
        .Nome(edtOperador.Text);

      FDAOOperador.Salvar(TOperadorModel(FOperador));

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
      FProduto
        .Descricao(edtDescricaoProduto.Text)
        .PrecoProduto(StrToCurr(edtValorProduto.Text));

      FDAOProduto.Salvar(TProdutoModel(FProduto));

      btnRecTodosProdutosClick(self);
    end
    else
      ShowMessage('Campo nome não poder ser vazio.');
  finally
    edtDescricaoProduto.Clear;
    edtDescricaoProduto.SetFocus;
  end;
end;

procedure TfrmPrincipal.btnRecClienteClick(Sender: TObject);
var
  LCodCliente : Integer;
begin
  if edtCodCliente.Text <> '' then
  begin
    LCodCliente := StrToInt(edtCodCliente.Text);
    try
      if FDAOCliente.VerificaSeExiste(StrToInt(edtCodCliente.Text)) then
      begin
        edtCliente.Text       := FDAOCliente.RecuperaPorCodigo(LCodCliente, 'nome');
        edtCidadeCliente.Text := FDAOCliente.RecuperaPorCodigo(LCodCliente, 'cidade');
        edtUfCliente.Text     := FDAOCliente.RecuperaPorCodigo(LCodCliente, 'uf');
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
      if FDAOOperador.VerificaSeExiste(StrToInt(edtCodigoOperador.Text)) then
        edtNomeOperadorRetornado.Text := FDAOOperador.RecuperaPorCodigo(StrToInt(edtCodigoOperador.Text))
      else
      begin
        ShowMessage('Operador não existe');
        edtCodigoOperador.Clear;
      end
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
  FConexao.DataSource.DataSet := FDAOOperador.RecuperaTodos;
  dbgrdOperador.Columns[0].Width := 100; // codigo
  dbgrdOperador.Columns[1].Width := 400; // nome
end;

procedure TfrmPrincipal.btnRecTodosProdutosClick(Sender: TObject);
begin
  FConexao.DataSource.DataSet := FDAOProduto.RecuperaTodos;
  dbgrdProdutos.Columns[0].Width := 100; // codigo
  dbgrdProdutos.Columns[1].Width := 400; // descricao
  dbgrdProdutos.Columns[2].Width := 130; // preco
end;

procedure TfrmPrincipal.dbgrdClienteDblClick(Sender: TObject);
var
  LCodCliente : Integer;
begin
  LCodCliente := dbgrdCliente.Fields[0].AsInteger;
  edtCodCliente.Text    := FDAOCliente.RecuperaPorCodigo(LCodCliente, 'codigo');
  edtCliente.Text       := FDAOCliente.RecuperaPorCodigo(LCodCliente, 'nome');
  edtCidadeCliente.Text := FDAOCliente.RecuperaPorCodigo(LCodCliente, 'cidade');
  edtUfCliente.Text     := FDAOCliente.RecuperaPorCodigo(LCodCliente, 'uf');
end;

procedure TfrmPrincipal.dbgrdProdutosDblClick(Sender: TObject);
var
  LCodProduto : Integer;
begin
  LCodProduto := dbgrdProdutos.Fields[0].AsInteger;
  edtCodigoProduto.Text    := FDAOProduto.RecuperaPorCodigo(LCodProduto, 'codigo');
  edtDescricaoProduto.Text := FDAOProduto.RecuperaPorCodigo(LCodProduto, 'descricao');
  edtValorProduto.Text     := FDAOProduto.RecuperaPorCodigo(LCodProduto, 'preco_venda');
end;

procedure TfrmPrincipal.btnRecTodosClienteClick(Sender: TObject);
begin
  FConexao.DataSource.DataSet := FDAOCliente.RecuperaTodos;
  dbgrdCliente.Columns[0].Width := 100; // codigo
  dbgrdCliente.Columns[1].Width := 400; // nome
  dbgrdCliente.Columns[2].Width := 120; // cidade
  dbgrdCliente.Columns[3].Width := 110; // uf
end;

procedure TfrmPrincipal.btnDelOperadorClick(Sender: TObject);
begin
  If Application.MessageBox('Deseja realmente excluir?', 'Atenção', 52) = mrYes then
  begin
    if FDAOOperador.VerificaSeExiste(StrToInt(edtCodigoOperador.Text)) then
    begin
      FDAOOperador.Remover(StrToInt(edtCodigoOperador.Text));
      btnRecTodosOperadoresClick(self);
    end
    else
      ShowMessage('Operador não cadastrado.');
  end;

  edtCodigoOperador.Clear;
  edtNomeOperadorRetornado.Clear;
  btnRecTodosOperadoresClick(self);
end;

procedure TfrmPrincipal.btnDelProdutoClick(Sender: TObject);
begin
  If Application.MessageBox('Deseja realmente excluir?', 'Atenção', 52) = mrYes then
  begin
    if FDAOProduto.VerificaSeExiste(StrToInt(edtCodigoProduto.Text)) then
    begin
      FDAOProduto.Remover(StrToInt(edtCodigoProduto.Text));
    end
    else
      ShowMessage('Produto não existe/cadastrado.');
  end;

  edtCodigoProduto.Clear;
  edtDescricaoProduto.Clear;
  edtValorProduto.Clear;
  btnRecTodosProdutosClick(self);
end;

procedure TfrmPrincipal.btnEdtClienteClick(Sender: TObject);
begin
  FCliente
    .Codigo(StrToInt(edtCodCliente.Text))
    .Nome(edtCliente.Text)
    .Cidade(edtCidadeCliente.Text)
    .UF(edtUfCliente.Text);

  if FDAOCliente.VerificaSeExiste(FCliente.Codigo) then
    FDAOCliente.Editar(TClienteModel(FCliente));

  edtCliente.Clear;
  edtCodCliente.Clear;
  edtCidadeCliente.Clear;
  edtUfCliente.Clear;

  btnRecTodosClienteClick(self);
end;

procedure TfrmPrincipal.btnEdtOperadorClick(Sender: TObject);
begin
  FOperador
    .Codigo(StrToInt(edtCodigoOperador.Text))
    .Nome(edtNomeOperadorRetornado.Text);

  if FDAOOperador.VerificaSeExiste(FOperador.Codigo) then
    FDAOOperador.Editar(TOperadorModel(FOperador));

  edtCodigoOperador.Clear;
  edtNomeOperadorRetornado.Clear;

  btnRecTodosOperadoresClick(self);
end;

procedure TfrmPrincipal.btnEdtProdutoClick(Sender: TObject);
begin
  FProduto
    .Codigo(StrToInt(edtCodigoProduto.Text))
    .Descricao(edtDescricaoProduto.Text)
    .PrecoProduto(edtValorProduto.Value);

  if FDAOProduto.VerificaSeExiste(FProduto.Codigo) then
    FDAOProduto.Editar(TProdutoModel(FProduto));

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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FOperador    := TOperadorModel.Create;
  FCliente     := TClienteModel.Create;
  FProduto     := TProdutoModel.Create;

  FConexao     := TDataModuleConexao.New;

  FDAOOperador := TOperadorDAO.Create;
  FDAOCliente  := TClienteDAO.Create;
  FDAOProduto  := TProdutoDAO.Create;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if not FConexao.FDConexao.Connected = true then
    ShowMessage('Não conectado!');

  PageControlPrincipal.ActivePageIndex := 0;
end;

procedure TfrmPrincipal.PageControlPrincipalChange(Sender: TObject);
begin
  FConexao.DataSource.DataSet.Close; // limpa o dataset ao mudar de aba
end;

end.


