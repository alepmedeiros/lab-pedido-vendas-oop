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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Model.Product.Interfaces,
  Product.DAO,
  Model.Product,
  DM.Connection;

type
  TFormProduct = class(TForm)
    pnlBG: TPanel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    lblValorProduto: TLabel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnRecuperar: TButton;
    dbgrdProdutos: TDBGrid;
    btnEncontrarTodos: TButton;
    edtPrecoVenda: TEdit;
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnRecuperarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnEncontrarTodosClick(Sender: TObject);
    procedure dbgrdProdutosDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses
  View.Main;

{$R *.dfm}

procedure TFormProduct.btnAdicionarClick(Sender: TObject);
begin
  edtCodigo.Clear;

  if (edtDescricao.Text <>'') AND (edtPrecoVenda.Text <> '') then
  begin
  try
    Fproduct
      .Description(edtDescricao.Text)
      .SellPrice(StrToFloat(edtPrecoVenda.Text));

    FProductDAO.Add(TProduct(Fproduct));
    ShowMessage('Produto incluido com sucesso!');
  except
    on E : Exception do
    ShowMessage('erro');

  end;
  end
  else
    ShowMessage('Preencha os campos descrição e preço venda para Adicionar o produto');
end;

procedure TFormProduct.btnEditarClick(Sender: TObject);
begin
if (edtCodigo.Text <> '') and (edtDescricao.Text <> '') and (edtPrecoVenda.Text <>'') then
  begin
  try
    Fproduct
      .id(edtCodigo.Text)
      .Description(edtDescricao.Text)
      .SellPrice(StrToFloat(edtPrecoVenda.Text));

    FProductDAO.Update(TProduct(Fproduct));
  except
    on E : Exception do
    ShowMessage('Erro!!!');
  end;
  end
  else
    ShowMessage('Informe o produto para editar ');
end;

procedure TFormProduct.btnEncontrarTodosClick(Sender: TObject);
begin
  FProductDAO.RetrieveAll();
  dbgrdProdutos.Columns[0].Width := 50; 
  dbgrdProdutos.Columns[1].Width := 350;
  dbgrdProdutos.Columns[2].Width := 100;
end;

procedure TFormProduct.btnExcluirClick(Sender: TObject);
begin
  if edtCodigo.Text <> '' then
  begin
    if Application.MessageBox(PwideChar('deseja realmente excluir o produto?'+sLineBreak +'==='+ edtDescricao.Text +'==='), 'Excluir Produto', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
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
  try
   Fproduct := FProductDAO.RetrieveById(StrToInt(edtCodigo.Text));

   edtCodigo.Text := IntToStr( Fproduct.id);
   edtPrecoVenda.Text := FloatToStr( Fproduct.SellPrice);
   edtDescricao.Text := (Fproduct.Description);
  except
    on E : Exception do
    ShowMessage('erro');
  end;

  end
  else
    ShowMessage('Informe o código do produto para resgatar o mesmo.');
end;

procedure TFormProduct.dbgrdProdutosDblClick(Sender: TObject);
begin
  // pegar o selecionado e jogar pra cima
  edtCodigo.Text := dbgrdProdutos.Fields[0].asString;
  edtDescricao.Text := dbgrdProdutos.Fields[1].asString;
  //edtPrecoVenda.Value := dbgrdProdutos.Fields[2].asFloat;
end;

procedure TFormProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormMain.Visible := true;
//  Form1.ShowModal;

  //inherited;
end;

procedure TFormProduct.FormCreate(Sender: TObject);
begin
  Fproduct := Tproduct.New;
  FProductDAO := TProductDAO.Create;

end;

end.
