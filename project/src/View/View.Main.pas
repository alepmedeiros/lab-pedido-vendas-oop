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
  TForm1 = class(TForm)
    btnProducts: TButton;
    btnCustomers: TButton;
    btnPurchaseOrder: TButton;
    procedure btnProductsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    constructor Create;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCustomersClick(Sender: TObject);
begin
//
end;

procedure TForm1.btnProductsClick(Sender: TObject);
begin
  Form1.Visible := false;
  FormProduct.ShowModal;

end;

constructor TForm1.Create;
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 //FormProduct.ShowModal;
end;

end.
