unit mvclive.view.cadastrocliente;

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
  Vcl.Mask,
  Vcl.ExtCtrls,
  mvclive.controller.interfaces;

type
  TFormCliente = class(TForm)
    Panel1: TPanel;
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtEstado: TLabeledEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FController: iController;
    FCodigo: Integer;
    FNome: String;
    FCidade: String;
    FEstado: String;

    procedure LimparCampos;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Cidade: String read FCidade write FCidade;
    property Estado: String read FEstado write FEstado;
  end;

implementation

uses
  Data.DB,
  mvclive.controller.impl.controller;

{$R *.dfm}

procedure TFormCliente.Button1Click(Sender: TObject);
begin
  var lCliente := FController.entity.Cliente.SetNome(edtNome.Text)
  .SetCidade(edtCidade.Text).SetEstado(edtEstado.Text);

  FController.dao(lCliente).Inserir;
end;

procedure TFormCliente.FormCreate(Sender: TObject);
begin
  FController := TController.New;
end;

procedure TFormCliente.LimparCampos;
begin
  edtCodigo.Clear;
  edtNome.Clear;
  edtCidade.Clear;
  edtEstado.Clear;
end;

end.
