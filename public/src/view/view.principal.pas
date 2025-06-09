unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnCLiente: TButton;
    btnProduto: TButton;
    btnPedido: TButton;
    Button1: TButton;
    procedure btnCLienteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  view.cliente.consulta,
  view.produto.consulta,
  view.pedido.consulta,
  interfaces.conexao,
  entidade.conexao;

{$R *.dfm}

procedure TfrmPrincipal.btnCLienteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaCliente, frmConsultaCliente);
  try
    frmConsultaCliente.ShowModal;
  finally
    FreeAndNil(frmConsultaCliente);
  end;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaProduto, frmConsultaProduto);
  try
    frmConsultaProduto.ShowModal;
  finally
    FreeAndNil(frmConsultaProduto);
  end;
end;

procedure TfrmPrincipal.btnPedidoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaPedido, frmConsultaPedido);
  try
    frmConsultaPedido.ShowModal;
  finally
    FreeAndNil(frmConsultaPedido);
  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  LConexao: IConexao;
begin
  LConexao := TConexao.Create;

  try
    if LConexao.Conectar then
      ShowMessage('Coneão realizada')
    else
      ShowMessage('Conexão não realizada');

  except
    on e:exception do
    begin
      ShowMessage('Erro: '+e.Message);
    end;
  end;
end;

end.
