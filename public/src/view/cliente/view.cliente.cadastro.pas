unit view.cliente.cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList,
  System.ImageList, utils.enum.TipoCadastro;

type
  TfrmCadastrocliente = class(TForm)
    edtNome: TEdit;
    lblnome: TLabel;
    lblCidade: TLabel;
    edtNomeCidade: TEdit;
    edtUFCidade: TEdit;
    btnBuscaCidade: TButton;
    ilimage: TImageList;
    btnSalvar: TButton;
    btnCancelar: TButton;
    lblIF: TLabel;
    procedure btnBuscaCidadeClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FcodigoCidade: integer;
    FtipoEdicao: TTipoCadastro;
    Fuf: string;
    Fcodigo: integer;
    Fnome: string;
    Fcidade: string;
    procedure SetcodigoCidade(const Value: integer);
    procedure SettipoEdicao(const Value: TTipoCadastro);
    procedure Setcidade(const Value: string);
    procedure Setcodigo(const Value: integer);
    procedure Setnome(const Value: string);
    procedure Setuf(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property tipoEdicao: TTipoCadastro read FtipoEdicao write SettipoEdicao;
    property codigo: integer read Fcodigo write Setcodigo;
    property nome: string read Fnome write Setnome;
    property cidade: string read Fcidade write Setcidade;
    property uf: string read Fuf write Setuf;
    property codigoCidade: integer read FcodigoCidade write SetcodigoCidade;
  end;

var
  frmCadastrocliente: TfrmCadastrocliente;

implementation

uses
  view.cidade.consulta, controller.cliente, interfaces.controller.cliente,
  interfaces.cliente, entidade.cliente;

{$R *.dfm}

procedure TfrmCadastrocliente.btnBuscaCidadeClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaCidade, frmConsultaCidade);
  try
    if frmConsultaCidade.ShowModal = mrOk then
    begin
      codigoCidade := frmConsultaCidade.codigoCidade;
      edtNomeCidade.Text := frmConsultaCidade.Cidade;
      edtUFCidade.Text := frmConsultaCidade.UF;
    end;
  finally
    FreeAndNil(frmConsultaCidade);
  end;
end;

procedure TfrmCadastrocliente.btnSalvarClick(Sender: TObject);
var
  controllerCLiente: IControllerCliente;
  LCliente: TCliente;
begin
  controllerCliente := TControllerCliente.Create;

  case tipoEdicao of
    tpInserir:
      begin
        try
          LCliente := TCliente.Create(EdtNome.Text, codigoCidade);
          try
            controllerCliente.Cadastrar(LCliente);
          finally
            FreeAndNil(LCliente);
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
          LCliente := TCliente.Create(codigo, EdtNome.Text, codigoCidade);
          try
            controllerCliente.Editar(LCliente);
          finally
            FreeAndNil(LCliente);
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

procedure TfrmCadastrocliente.Setcidade(const Value: string);
begin
  Fcidade := Value;
  edtNomeCidade.Text := Value;
end;

procedure TfrmCadastrocliente.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TfrmCadastrocliente.SetcodigoCidade(const Value: integer);
begin
  FcodigoCidade := Value;
end;

procedure TfrmCadastrocliente.Setnome(const Value: string);
begin
  Fnome := Value;
  edtNome.Text := Value;
end;

procedure TfrmCadastrocliente.SettipoEdicao(const Value: TTipoCadastro);
begin
  FtipoEdicao := Value;
end;

procedure TfrmCadastrocliente.Setuf(const Value: string);
begin
  Fuf := Value;
  edtUFCidade.Text := Value;
end;

end.
