unit view.item.editar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmEditarItem = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtDescricaoProduto: TEdit;
    edtValorUnitario: TEdit;
    edtQuantidade: TEdit;
    btnIncluirItem: TButton;
    btnExcluir: TButton;
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
  private
    Fdescricao: string;
    Fcodigo: Integer;
    Fvalorunitario: double;
    FvalorTotal: double;
    Fquantidade: double;
    procedure Setcodigo(const Value: Integer);
    procedure Setdescricao(const Value: string);
    procedure Setquantidade(const Value: double);
    procedure SetvalorTotal(const Value: double);
    procedure Setvalorunitario(const Value: double);
    { Private declarations }
  public
    { Public declarations }
    property codigo: Integer read Fcodigo write Setcodigo;
    property descricao: string read Fdescricao write Setdescricao;
    property quantidade: double read Fquantidade write Setquantidade;
    property valorunitario: double read Fvalorunitario write Setvalorunitario;
    property valorTotal: double read FvalorTotal write SetvalorTotal;
  end;

var
  FrmEditarItem: TFrmEditarItem;

implementation

{$R *.dfm}

{ TFrmEditarItem }

procedure TFrmEditarItem.edtQuantidadeExit(Sender: TObject);
begin
  quantidade := StrToFloat(edtQuantidade.Text);
end;

procedure TFrmEditarItem.edtValorUnitarioExit(Sender: TObject);
begin
  valorunitario := StrToFloat(edtValorUnitario.Text);
end;

procedure TFrmEditarItem.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TFrmEditarItem.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
  edtDescricaoProduto.Text := Value;
end;

procedure TFrmEditarItem.Setquantidade(const Value: double);
begin
  Fquantidade := Value;
  edtQuantidade.Text := FormatFloat('#,##0.00', Value);
end;

procedure TFrmEditarItem.SetvalorTotal(const Value: double);
begin
  FvalorTotal := Value;
end;

procedure TFrmEditarItem.Setvalorunitario(const Value: double);
begin
  Fvalorunitario := Value;
  edtValorUnitario.Text := FormatFloat('#,##0.00', Value);
end;

end.
