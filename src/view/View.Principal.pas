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
  Model.Interfaces.Produto,
  Model.Interfaces.Operador,
  Model.Interfaces.Pedido,
  Model.Interfaces.ItensPedido,
  Operador.Controller,
  DM.Conexao,
  Operador.DAO,
  Vcl.ExtDlgs,
  Data.DB,
  Model.Interfaces.Cliente,
  Cliente.DAO;

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
    Cliente: TTabSheet;
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

  private
    { Private declarations }
    FOperador    : iOperador;
    FCliente     : iCliente;

    FConexao     : TDataModuleConexao;

    FDAOOperador : TOperadorDAO;
    FDAOCliente  : TClienteDAO;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Model.Operador, Model.Cliente;

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

procedure TfrmPrincipal.btnRecClienteClick(Sender: TObject);
begin
  if edtCodCliente.Text <> '' then
  begin
    try
      if FDAOCliente.VerificaSeExiste(StrToInt(edtCodCliente.Text)) then
      begin
        edtCliente.Text       := FDAOCliente.RecuperaPorCodigo(StrToInt(edtCodCliente.Text), 'nome');
        edtCidadeCliente.Text := FDAOCliente.RecuperaPorCodigo(StrToInt(edtCodCliente.Text), 'cidade');
        edtUfCliente.Text     := FDAOCliente.RecuperaPorCodigo(StrToInt(edtCodCliente.Text), 'uf');
      end
      else
      begin
        ShowMessage('Cliente não existe');
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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FOperador    := TOperadorModel.Create;
  FCliente     := TClienteModel.Create;

  FConexao     := TDataModuleConexao.New;

  FDAOOperador := TOperadorDAO.Create;
  FDAOCliente  := TClienteDAO.Create;
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


