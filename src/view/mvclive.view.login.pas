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
  Vcl.ExtCtrls,
  mvclive.controller.interfaces;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FController: iController;
    FValido: Boolean;
    FTipoUsuario: Integer;
  public
    property TipoUsuario: Integer read FTipoUsuario write FTipoUsuario;
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses
  Data.DB,
  mvclive.controller.impl.controller,
  mvclive.view.cadastrarusuario;

procedure TFormLogin.Button1Click(Sender: TObject);
begin
  var lDataset := TDataSource.Create(nil);
  try
    FController
      .Usuairos
        .SetNome(Edit1.Text)
        .SetSenha(Edit2.Text)
      .Build.ListarPor.DataSource(lDataset);

    if not lDataset.DataSet.IsEmpty then
    begin
      FValido := True;
      FTipoUsuario := lDataset.DataSet.Fields[3].AsInteger;
      Self.Close;
      exit;
    end;

    raise Exception.Create('Usuário não encontrado');
  finally
    lDataset.Free;
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

procedure TFormLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not FValido then
    Application.Terminate;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  FController := TController.NEw;
end;

//procedure TFormLogin.ValidarUsuario(aUser, aSenha: String);
//var
//  AuthorizationManager: TAuthorizationManager;
//  AuthorizationStrategy: IAuthorizationStrategy;
//  CurrentUserType: TUserType;
//begin
//  // Aqui você deve implementar a lógica de autenticação e determinar o tipo de usuário (CurrentUserType).
//  // Por simplicidade, vou considerar um usuário "utAdmin" se o nome de usuário for "admin" e a senha for "admin".
//  var lDataset := TDataSource.Create(nil);
//  try
//  FController
//      .Usuairos
//        .SetNome(aUser)
//        .SetSenha(aSenha)
//      .Build.ListarPor.DataSource(lDataset);
//
//    if lDataset.DataSet.IsEmpty then
//      raise Exception.Create('Usuário não encontrado');
//
//    CurrentUserType := TUserType(lDataset.DataSet.Fields[3].AsInteger);
//  finally
//    lDataset.Free;
//  end;
//
//  AuthorizationManager := TAuthorizationManager.Create;
//
//  AuthorizationStrategy := AuthorizationManager.GetAuthorizationStrategy(CurrentUserType);
//
//  if Assigned(AuthorizationStrategy) and AuthorizationStrategy.IsAuthorized then
//  begin
//    ShowMessage('Login bem-sucedido e autorização concedida.');
//    // O usuário tem permissão para acessar a funcionalidade restrita, execute-a
//  end
//  else
//  begin
//    ShowMessage('Login bem-sucedido, mas você não tem permissão para acessar esta funcionalidade.');
//  end;
//end;

end.
