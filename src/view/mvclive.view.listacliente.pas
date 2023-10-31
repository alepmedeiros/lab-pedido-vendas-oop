unit mvclive.view.listacliente;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  mvclive.controller.interfaces;

type
  TFormClienteLista = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtPesquisa: TEdit;
    pnlLupa: TPanel;
    ImageLupa: TImage;
    btnLupa: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnLupaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    FController: iController;

    FNome: String;
    FCodigo: Integer;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
  end;

implementation

uses
  mvclive.controller.impl.controller;

{$R *.dfm}

procedure TFormClienteLista.btnLupaClick(Sender: TObject);
begin
  if not DataSource1.DataSet.Locate('NOME', edtPesquisa.Text, [loCaseInsensitive, loPartialKey]) then
    ShowMessage('Usuário não encontrado');
end;

procedure TFormClienteLista.DBGrid1DblClick(Sender: TObject);
begin
  FCodigo := DataSource1.DataSet.FieldByName('CODIGO').AsInteger;
  FNome := DataSource1.DataSet.FieldByName('NOME').AsString;
  Self.Close;
end;

procedure TFormClienteLista.edtPesquisaChange(Sender: TObject);
begin
  DataSource1.DataSet.Filtered := False;
  DataSource1.DataSet.Filter := 'NOME LINK ' + QuotedStr(edtPesquisa.Text);
  DataSource1.DataSet.Filtered := True;
end;

procedure TFormClienteLista.FormCreate(Sender: TObject);
begin
  FController := TController.New;
//  FController.dao(FController.entity.Cliente).Listar.DataSource(DataSource1);
end;

end.
