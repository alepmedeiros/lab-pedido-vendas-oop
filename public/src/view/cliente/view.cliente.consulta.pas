unit view.cliente.consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FireDACJSONReflect,
  FireDAC.Stan.StorageBin, utils.enum.tipocadastro;

type
  TfrmConsultaCliente = class(TForm)
    dbgrdCliente: TDBGrid;
    btnEditar: TButton;
    btnInserir: TButton;
    btnPesquisa: TButton;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1nome: TStringField;
    FDMemTable1codigocidade: TIntegerField;
    FDMemTable1cidade: TStringField;
    FDMemTable1uf: TStringField;
    procedure btnInserirClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdClienteDblClick(Sender: TObject);
  private
    Fcodigo: Integer;
    FNome: string;
    procedure Setcodigo(const Value: Integer);
    procedure SetNome(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property codigo: Integer read Fcodigo write Setcodigo;
    property Nome: string read FNome write SetNome;
  end;

var
  frmConsultaCliente: TfrmConsultaCliente;

implementation

uses
  view.cliente.cadastro, controller.cliente, interfaces.controller.cliente;

{$R *.dfm}

procedure TfrmConsultaCliente.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrocliente, frmCadastrocliente);
  try
    frmCadastroCliente.tipoEdicao := tpEditar;

    frmCadastroCliente.codigo := FDMemTable1.FieldByName('codigo').AsInteger;
    frmCadastroCliente.codigoCidade := FDMemTable1.FieldByName('codigocidade').AsInteger;
    frmCadastroCliente.nome := FDMemTable1.FieldByName('nome').AsString;
    frmCadastroCliente.cidade := FDMemTable1.FieldByName('cidade').AsString;
    frmCadastroCliente.uf := FDMemTable1.FieldByName('uf').AsString;

    frmCadastrocliente.ShowModal;
    btnPesquisa.Click;
  finally
    FreeAndNil(frmCadastrocliente);
  end;
end;

procedure TfrmConsultaCliente.btnInserirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastrocliente, frmCadastrocliente);
  try
    frmCadastroCliente.tipoEdicao := tpInserir;
    frmCadastrocliente.ShowModal;
    btnPesquisa.Click;
  finally
    FreeAndNil(frmCadastrocliente);
  end;
end;

procedure TfrmConsultaCliente.btnPesquisaClick(Sender: TObject);
var
  controllerCLiente: IControllerCliente;
begin
  controllerCliente := TControllerCliente.Create;
  controllerCliente.carregartodos(FDMemTable1);
end;

procedure TfrmConsultaCliente.dbgrdClienteDblClick(Sender: TObject);
begin
  Fcodigo := FDMemTable1codigo.AsInteger;
  FNome :=  FDMemTable1nome.AsString;
  ModalResult := mrOk;
end;

procedure TfrmConsultaCliente.FormShow(Sender: TObject);
begin
  btnPesquisa.Click;
end;

procedure TfrmConsultaCliente.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TfrmConsultaCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
