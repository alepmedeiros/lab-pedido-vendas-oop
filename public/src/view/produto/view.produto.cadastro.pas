unit view.produto.cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, utils.enum.tipocadastro,
  Vcl.Mask;

type
  TfrmCadastroProduto = class(TForm)
    lblnome: TLabel;
    edtDescricao: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    edtValor: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    Fvalor: double;
    Fdescricao: string;
    Fcodigo: integer;
    FtipoEdicao: TTipoCadastro;
    procedure Setcodigo(const Value: integer);
    procedure Setdescricao(const Value: string);
    procedure SettipoEdicao(const Value: TTipoCadastro);
    procedure Setvalor(const Value: double);
    { Private declarations }
  public
    { Public declarations }
    property tipoEdicao: TTipoCadastro read FtipoEdicao write SettipoEdicao;
    property codigo: integer read Fcodigo write Setcodigo;
    property descricao: string read Fdescricao write Setdescricao;
    property valor: double read Fvalor write Setvalor;
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

uses
  entidade.produto, controller.produto, interfaces.controller.produto;

{$R *.dfm}

{ TfrmCadastroProduto }

procedure TfrmCadastroProduto.btnSalvarClick(Sender: TObject);
var
  controllerProduto: IControllerProduto;
  LProduto: TProduto;
begin
  controllerProduto := TControllerProduto.Create;

  case tipoEdicao of
    tpInserir:
      begin
        try
          LProduto := TProduto.Create(EdtDescricao.Text, StrToFloatDef(edtValor.Text, 0));
          try
            controllerProduto.Cadastrar(LProduto);
          finally
            FreeAndNil(LProduto);
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
          LProduto := TProduto.Create(codigo, EdtDescricao.Text, StrToFloatDef(edtValor.Text, 0));
          try
            controllerProduto.Editar(LProduto);
          finally
            FreeAndNil(LProduto);
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

procedure TfrmCadastroProduto.edtValorExit(Sender: TObject);
var
  Value: Currency;
begin
  if TryStrToCurr(edtValor.Text, Value) then
    edtValor.Text := FormatFloat('#,##0.00', Value)
  else
    edtValor.Text := '0,00';
end;

procedure TfrmCadastroProduto.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;

procedure TfrmCadastroProduto.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
  edtDescricao.Text := Value;
end;

procedure TfrmCadastroProduto.SettipoEdicao(const Value: TTipoCadastro);
begin
  FtipoEdicao := Value;
end;

procedure TfrmCadastroProduto.Setvalor(const Value: double);
begin
  Fvalor := Value;
  edtValor.Text := FloatToStr(Value);
end;

end.
