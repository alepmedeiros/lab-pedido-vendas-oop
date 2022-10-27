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
    btnRecuperar: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
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
  ShowMessage('Erro');
end;

procedure TFormProduct.btnEditarClick(Sender: TObject);
begin
if (edtCodigo.Text <> '') and (edtDescricao.Text <> '') and (edtPrecoVenda.Value >0) then
  begin
    Fproduct
      .id(edtCodigo.Text)
      .Description(edtDescricao.Text)
      .SellPrice(edtPrecoVenda.Value);

    FProductDAO.Update(TProduct(Fproduct));
  end
  else
    ShowMessage('Informe o produto para editar; ');

end;

procedure TFormProduct.btnExcluirClick(Sender: TObject);
begin
  if edtCodigo.Text <> '' then
  begin
    if Application.MessageBox('deseja realmente excluir o produto?', 'Excluir Produto', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
    begin
      try
        FProductDAO.Delete(StrToInt(edtCodigo.Text));
      except
        on E : Exception do
        ShowMessage('erro');
      end;

    end;
  end;
end;

procedure TFormProduct.btnRecuperarClick(Sender: TObject);
begin
  if edtCodigo.Text <> '' then
  begin
   Fproduct := FProductDAO.RetrieveById(StrToInt(edtCodigo.Text));

   edtCodigo.Text := IntToStr( Fproduct.id);
   edtPrecoVenda.Value := Fproduct.SellPrice;
   edtDescricao.Text := (Fproduct.Description);
  end;
end;

procedure TFormProduct.FormCreate(Sender: TObject);
begin
  Fproduct := Tproduct.New;
  FProductDAO := TProductDAO.Create;

end;

end.
