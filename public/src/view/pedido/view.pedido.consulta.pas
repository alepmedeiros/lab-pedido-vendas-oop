unit view.pedido.consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, utils.enum.tipocadastro;

type
  TfrmConsultaPedido = class(TForm)
    dbgrdCliente: TDBGrid;
    btnInserir: TButton;
    btnPesquisa: TButton;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1numeropedido: TIntegerField;
    FDMemTable1codigocliente: TIntegerField;
    FDMemTable1nome: TStringField;
    FDMemTable1dataemissao: TDateTimeField;
    FDMemTable1valortodal: TCurrencyField;
    edtConsulta: TEdit;
    btnVisualizar: TButton;
    cbbTipoConsulta: TComboBox;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPedido: TfrmConsultaPedido;

implementation

uses
  controller.pedido, interfaces.controller.pedido, view.pedido.cadastro;

{$R *.dfm}

procedure TfrmConsultaPedido.btnInserirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroPedido, frmCadastroPedido);
  try
    frmCadastroPedido.tipoEdicao := tpInserir;
    frmCadastroPedido.ShowModal;
    btnPesquisa.Click;
  finally
    FreeAndNil(frmCadastroPedido);
  end;
end;

procedure TfrmConsultaPedido.btnPesquisaClick(Sender: TObject);
var
  controllerPedido: IControllerPedido;
begin
  controllerPedido := TControllerPedido.Create;
  if edtConsulta.Text = '' then
    controllerPedido.carregar(FDMemTable1)
  else
    controllerPedido.carregar(FDMemTable1, cbbTipoConsulta.ItemIndex, edtConsulta.Text);
end;

procedure TfrmConsultaPedido.btnVisualizarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroPedido, frmCadastroPedido);
  try
    frmCadastroPedido.tipoEdicao := tpInserir;
    frmCadastroPedido.tipoEdicao := tpVisualizar;
    frmCadastroPedido.numeropedido := FDMemTable1numeropedido.AsInteger;
    frmCadastroPedido.codigocliente := FDMemTable1codigocliente.AsInteger;
    frmCadastroPedido.nomecliente := FDMemTable1nome.AsString;
    FrmCadastroPedido.lblTotal.Caption := FormatFloat('#,##0.00', FDMemTable1valortodal.AsFloat);
    frmCadastroPedido.ShowModal;
    btnPesquisa.Click;
  finally
    FreeAndNil(frmCadastroPedido);
  end;
end;

procedure TfrmConsultaPedido.FormShow(Sender: TObject);
begin
  btnPesquisa.Click;
end;

end.
