unit mvclive.view.principal;

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
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask, mvclive.controller.interfaces;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    edtCodigoCliente: TLabeledEdit;
    edtNomeCliente: TLabeledEdit;
    pnlMais: TPanel;
    ImageMais: TImage;
    btnMais: TSpeedButton;
    pnlLupa: TPanel;
    ImageLupa: TImage;
    btnLupa: TSpeedButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Button3: TButton;
    Panel4: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    procedure btnMaisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FController: iController;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

uses
  mvclive.controller.impl.controller,
  mvclive.view.cadastrocliente;

procedure TForm1.btnMaisClick(Sender: TObject);
begin
  var lCliente := TFormCliente.Create(nil);
  try
    lCliente.ShowModal;
  finally
    lCliente.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FController.dao(FCOntroller.entity.Cliente).Listar.DataSource(DataSource1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TController.NEw;
end;

end.
