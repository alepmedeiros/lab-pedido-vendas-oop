unit mvclive.view.cadastrarusuario;

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
  TFormCadastrarUsuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel3: TPanel;
    Button2: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FController: iController;
  public
    { Public declarations }
  end;

var
  FormCadastrarUsuario: TFormCadastrarUsuario;

implementation

uses
  mvclive.controller.impl.controller;

{$R *.dfm}

procedure TFormCadastrarUsuario.Button2Click(Sender: TObject);
begin
  try
    var lUsuario := FController.entity.Usuarios.SetNome(Edit1.Text).SetSenha(Edit2.Text);
    FController.dao(lUsuario).Inserir;
    Self.Close;
  except
    raise Exception.Create('Erro ao tentar cadastrar um usuário');
  end;
end;

procedure TFormCadastrarUsuario.FormCreate(Sender: TObject);
begin
  FController := TController.New;
end;

end.
