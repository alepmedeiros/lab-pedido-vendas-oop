unit view.produto.consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, utils.enum.tipocadastro;

type
  TfrmConsultaProduto = class(TForm)
    dbgrdCliente: TDBGrid;
    btnEditar: TButton;
    btnInserir: TButton;
    btnPesquisa: TButton;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1descricao: TStringField;
    FDMemTable1valor: TCurrencyField;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgrdClienteDblClick(Sender: TObject);
  private
    Fvalor: double;
    Fdescricao: string;
    Fcodigo: Integer;
    procedure Setcodigo(const Value: Integer);
    procedure Setdescricao(const Value: string);
    procedure Setvalor(const Value: double);
    { Private declarations }
  public
    { Public declarations }
    property codigo: Integer read Fcodigo write Setcodigo;
    property descricao: string read Fdescricao write Setdescricao;
    property valor: double read Fvalor write Setvalor;
  end;

var
  frmConsultaProduto: TfrmConsultaProduto;

implementation

uses
  view.produto.cadastro,
  controller.produto, interfaces.controller.produto;

{$R *.dfm}

procedure TfrmConsultaProduto.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroproduto, frmCadastroproduto);
  try
    frmCadastroproduto.tipoEdicao := tpEditar;

    frmCadastroproduto.codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    frmCadastroproduto.descricao := FDMemTable1.FieldByName('descricao').AsString;
    frmCadastroproduto.valor := FDMemTable1.FieldByName('valor').AsFloat;

    frmCadastroproduto.ShowModal;
    btnPesquisa.Click;
  finally
    FreeAndNil(frmCadastroproduto);
  end;
end;

procedure TfrmConsultaProduto.btnInserirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  try
    frmCadastroProduto.tipoEdicao := tpInserir;
    frmCadastroProduto.ShowModal;
    btnPesquisa.Click;
  finally
    FreeAndNil(frmCadastroProduto);
  end;
end;

procedure TfrmConsultaProduto.btnPesquisaClick(Sender: TObject);
var
  controllerproduto: IControllerProduto;
begin
  controllerProduto := TControllerProduto.Create;
  controllerProduto.carregartodos(FDMemTable1);
end;

procedure TfrmConsultaProduto.dbgrdClienteDblClick(Sender: TObject);
begin
  Fcodigo := FDMemTable1codigo.AsInteger;
  Fdescricao :=  FDMemTable1descricao.AsString;
  FValor :=  FDMemTable1valor.AsCurrency;
  ModalResult := mrOk;
end;

procedure TfrmConsultaProduto.FormShow(Sender: TObject);
begin
  btnPesquisa.Click;
end;

procedure TfrmConsultaProduto.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TfrmConsultaProduto.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TfrmConsultaProduto.Setvalor(const Value: double);
begin
  Fvalor := Value;
end;

end.
