unit view.cidade.cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, utils.enum.tipocadastro;

type
  TfrmCadastroCidade = class(TForm)
    edtNome: TEdit;
    lblnome: TLabel;
    edtUFCidade: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    lblUF: TLabel;
    procedure btnSalvarClick(Sender: TObject);
  private
    Fuf: string;
    Fcodigo: integer;
    FtipoEdicao: TTipoCadastro;
    Fcidade: string;
    procedure Setcidade(const Value: string);
    procedure Setcodigo(const Value: integer);
    procedure SettipoEdicao(const Value: TTipoCadastro);
    procedure Setuf(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property tipoEdicao: TTipoCadastro read FtipoEdicao write SettipoEdicao;
    property codigo: integer read Fcodigo write Setcodigo;
    property cidade: string read Fcidade write Setcidade;
    property uf: string read Fuf write Setuf;
  end;

var
  frmCadastroCidade: TfrmCadastroCidade;

implementation

uses
  interfaces.controller.cidade, controller.cidade, entidade.cidade;

{$R *.dfm}

{ TfrmCadastroCidade }

procedure TfrmCadastroCidade.btnSalvarClick(Sender: TObject);
var
  controllerCidade: IControllerCidade;
  LCidade: TCidade;
begin
  controllerCidade := TControllerCidade.Create;

  case tipoEdicao of
    tpInserir:
      begin
        try
          LCidade := TCidade.Create(EdtNome.Text, edtUFCidade.Text);
          try
            controllerCidade.Cadastrar(LCidade);
          finally
            FreeAndNil(LCidade);
          end;
        except
          on e:exception do
          begin
            ModalResult := mrNone;
            ShowMessage(e.Message);
          end;
        end;
      end;
    tpEditar:
      begin
        try
          LCidade := TCidade.Create(codigo, EdtNome.Text, edtUFCidade.Text);
          try
            controllerCidade.Editar(LCidade);
          finally
            FreeAndNil(LCidade);
          end;
        except
          on e:exception do
          begin
            ModalResult := mrNone;
            ShowMessage(e.Message);
          end;
        end;
      end;
  end;
end;

procedure TfrmCadastroCidade.Setcidade(const Value: string);
begin
  Fcidade := Value;
  edtNome.Text := Value;
end;

procedure TfrmCadastroCidade.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TfrmCadastroCidade.SettipoEdicao(const Value: TTipoCadastro);
begin
  FtipoEdicao := Value;
end;

procedure TfrmCadastroCidade.Setuf(const Value: string);
begin
  Fuf := Value;
  edtUFCidade.Text := Value;
end;

end.
