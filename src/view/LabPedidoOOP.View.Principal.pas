unit LabPedidoOOP.View.Principal;

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
  LabPedidoOOP.Model.Interfaces.Produto,
  LabPedidoOOP.Model.Interfaces.Operador,
  LabPedidoOOP.Model.Interfaces.Pedido,
  LabPedidoOOP.Model.Interfaces.ItensPedido,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, 
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  LabPedidoOOP.Operador.Controller,
  DM.Conexao,
  LabPedidoOOP.Operador.DAO, Vcl.ExtDlgs;

type
  TfrmPrincipal = class(TForm)
    PageControl: TPageControl;
    TabSheet4: TTabSheet;
    edtOperador: TEdit;
    lblNomeOperador: TLabel;
    btnCadastrar: TButton;
    lblCodigoOperador: TLabel;
    btnRecuperarOperadorCodigo: TButton;
    edtNomeOperadorRetornado: TEdit;
    lblNomeOperadorRetornado: TLabel;
    edtCodigoOperador: TEdit;
    btnRecuperarTodosOperadores: TButton;
    dbgrdOperador: TDBGrid;
    edtEditarOperador: TButton;
    btnRemoverOperador: TButton;

    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnRecuperarOperadorCodigoClick(Sender: TObject);
    procedure btnRecuperarTodosOperadoresClick(Sender: TObject);
    procedure edtEditarOperadorClick(Sender: TObject);
    procedure btnRemoverOperadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    FOperador    : iOperador;
    FConexao     : TDataModuleConexao;
    FDAOOperador : TOperadorDAO;      

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  LabPedidoOOP.Model.Operador;

{$R *.dfm}

procedure TfrmPrincipal.btnCadastrarClick(Sender: TObject);
begin
  try
    if edtOperador.Text <> '' then
    begin
      FOperador
        .Nome(edtOperador.Text);

      FDAOOperador.Salvar(TOperadorModel(FOperador));
      
      btnRecuperarTodosOperadoresClick(self);
    end
    else
      ShowMessage('Campo nome não poder ser vazio.');
  finally
    edtOperador.Clear;
    edtOperador.SetFocus;
  end;
end;

procedure TfrmPrincipal.btnRecuperarOperadorCodigoClick(Sender: TObject);
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

procedure TfrmPrincipal.btnRecuperarTodosOperadoresClick(Sender: TObject);
begin
  FConexao.DataSource.DataSet := FDAOOperador.RecuperaTodos;
end;

procedure TfrmPrincipal.btnRemoverOperadorClick(Sender: TObject);
begin
  If Application.MessageBox('Deseja realmente excluir?', 'Atenção', 52) = mrYes then
  begin
    if FDAOOperador.VerificaSeExiste(StrToInt(edtCodigoOperador.Text)) then
    begin
      FDAOOperador.Remover(StrToInt(edtCodigoOperador.Text));
      btnRecuperarTodosOperadoresClick(self);
    end
    else
      ShowMessage('Operador não cadastrado.');
  end;

  edtCodigoOperador.Clear;
  edtNomeOperadorRetornado.Clear;
  btnRecuperarTodosOperadoresClick(self);
end;

procedure TfrmPrincipal.edtEditarOperadorClick(Sender: TObject);
begin
  FOperador
    .Codigo(StrToInt(edtCodigoOperador.Text))
    .Nome(edtNomeOperadorRetornado.Text);
    
  if FDAOOperador.VerificaSeExiste(FOperador.Codigo) then
    FDAOOperador.EditaOperador(TOperadorModel(FOperador));
    
  edtCodigoOperador.Clear;
  edtNomeOperadorRetornado.Clear;
  btnRecuperarTodosOperadoresClick(self);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FOperador    := TOperadorModel.Create;
  FConexao     := TDataModuleConexao.New;
  FDAOOperador := TOperadorDAO.Create;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  btnRecuperarTodosOperadoresClick(Self);
end;

end.


