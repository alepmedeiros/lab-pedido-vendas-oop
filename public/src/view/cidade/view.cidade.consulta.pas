unit view.cidade.consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaCidade = class(TForm)
    dbgrdCliente: TDBGrid;
    btnEditar: TButton;
    btnInserir: TButton;
    btnPesquisa: TButton;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1cidade: TStringField;
    FDMemTable1uf: TStringField;
    procedure dbgrdClienteDblClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    FCodigoCidade: Integer;
    FUF: string;
    FCidade: string;
    { Private declarations }
  public
    { Public declarations }
    property codigoCidade: Integer read FCodigoCidade write FCodigoCidade;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;
  end;

var
  frmConsultaCidade: TfrmConsultaCidade;

implementation

uses
  view.cidade.cadastro, controller.cidade, interfaces.controller.cidade, utils.enum.tipocadastro;

{$R *.dfm}

procedure TfrmConsultaCidade.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroCidade, frmCadastroCidade);
  try
    frmCadastroCidade.tipoEdicao := tpEditar;
    frmCadastroCidade.codigo := FDMemTable1codigo.AsInteger;
    frmCadastroCidade.cidade := FDMemTable1cidade.AsString;
    frmCadastroCidade.uf := FDMemTable1uf.AsString;
    frmCadastroCidade.showModal;
    btnPesquisa.Click;
  finally
    FreeAndNil(frmCadastroCidade);
  end;
end;

procedure TfrmConsultaCidade.btnInserirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroCidade, frmCadastroCidade);
  try
    frmCadastroCidade.tipoEdicao := tpInserir;
    frmCadastroCidade.showModal;
    btnPesquisa.Click;
  finally
    FreeAndNil(frmCadastroCidade);
  end;
end;

procedure TfrmConsultaCidade.btnPesquisaClick(Sender: TObject);
var
  controllerCidade: IControllerCidade;
begin
  controllerCidade := TControllerCidade.Create;
  controllerCidade.Load(FDMemTable1);
end;

procedure TfrmConsultaCidade.dbgrdClienteDblClick(Sender: TObject);
begin
  FcodigoCidade := FDMemTable1codigo.AsInteger;
  Fcidade :=  FDMemTable1cidade.AsString;
  FUF :=  FDMemTable1UF.AsString;
  ModalResult := mrOk;
end;

procedure TfrmConsultaCidade.FormShow(Sender: TObject);
begin
  btnPesquisa.Click;
end;

end.
