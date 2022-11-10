unit View.Main;

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
  View.Product;

type
  TFormMain = class(TForm)
    btnProducts: TButton;
    btnCustomers: TButton;
    btnPurchaseOrder: TButton;
    procedure btnProductsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.btnCustomersClick(Sender: TObject);
begin
//
end;

procedure TFormMain.btnProductsClick(Sender: TObject);
begin
  FormMain.Visible := false;
  FormProduct.ShowModal;

end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
 //FormProduct.ShowModal;
end;

end.
