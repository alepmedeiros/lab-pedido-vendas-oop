unit mvclive.view.login;

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
  Vcl.ExtCtrls, mvclive.controller.interfaces;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    Panel3: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FController: iController;
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses
  Data.DB,
  mvclive.controller.impl.controller,
  mvclive.view.cadastrarusuario;

{ TFormLogin }

procedure TFormLogin.Button1Click(Sender: TObject);
begin
//  if not ((Edit1.Text = 'Alessandro') and (Edit2.Text = '123')) then
//    Application.Terminate;
  var lDataSet := TDataSource.Create(nil);
  FController.dao(FController.entity.Usuarios).Listar.DataSource(lDataSet);
  try
    if not lDataSet.DataSet.Locate('NOME;HASHCODE',VarArrayOf([Edit1.Text, FController.entity.Usuarios.SetSenha(Edit2.Text).GetHashCode]),[]) then
    begin
      ShowMessage('Usuário não encontrado');
      exit;
    end;
    Self.Close
  finally
    lDataSet.Free;
  end;
end;

procedure TFormLogin.Button2Click(Sender: TObject);
begin
  var lusuario := TFormCadastrarUsuario.Create(nil);
  try
    lusuario.ShowModal;
    Edit1.Text := lusuario.Edit1.Text;
    Edit2.Text := lusuario.Edit2.Text;
    Button1Click(Sender);
  finally
    lusuario.Free;
  end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  FController := TController.NEw;
end;

end.
