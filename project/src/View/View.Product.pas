unit View.Product;

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
  Vcl.ExtCtrls,
  Vcl.Mask,
  RxToolEdit,
  RxCurrEdit,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Model.Product.Interfaces,
  Product.DAO,
  Model.Product;

type
  TFormProduct = class(TForm)
    pnlBG: TPanel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtPrecoVenda: TCurrencyEdit;
    lblValorProduto: TLabel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Fproduct : IProductInterface;
    FProductDAO : TProductDAO;
  public
    { Public declarations }
  end;

var
  FormProduct: TFormProduct;

implementation

{$R *.dfm}

procedure TFormProduct.btnAdicionarClick(Sender: TObject);
begin
//
  if (edtDescricao.Text <>'') AND (edtPrecoVenda.Value > 0) then
  begin
    Fproduct
      .Description(edtDescricao.Text)
      .SellPrice(edtPrecoVenda.Value);

    FProductDAO.Add(TProduct(Fproduct));
  end
  else
  ShowMessage('teste');
end;

procedure TFormProduct.FormCreate(Sender: TObject);
begin
  Fproduct := Tproduct.New;
  FProductDAO := TProductDAO.Create;

end;

end.
