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
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.Mask,
  mvclive.controller.interfaces, Datasnap.DBClient;
type
  TFormPrincipal = class(TForm)
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
    edtCodigoProduto: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    edtValorUnitario: TLabeledEdit;
    Button3: TButton;
    Panel4: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Codigo: TIntegerField;
    ClientDataSet1Descricao: TStringField;
    ClientDataSet1Total: TCurrencyField;
    ClientDataSet1Unitario: TCurrencyField;
    ClientDataSet1quantidade: TIntegerField;
    procedure btnMaisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtCodigoClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure btnLupaClick(Sender: TObject);
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoProdutoExit(Sender: TObject);
  private
    FController: iController;
    procedure SomenteNumeros(var aKey: Char);
  public
    { Public declarations }
  end;
var
  FormPrincipal: TFormPrincipal;
implementation
{$R *.dfm}
uses
  mvclive.controller.impl.controller,
  mvclive.view.cadastrocliente,
  mvclive.view.listacliente, mvclive.view.login;
procedure TFormPrincipal.btnLupaClick(Sender: TObject);
begin
  var lPesquisa := TFormClienteLista.Create(nil);
  try
    lPesquisa.ShowModal;
    edtCodigoCliente.Text := lPesquisa.Codigo.ToString;
    edtNomeCliente.Text := lPesquisa.Nome;
  finally
    lPesquisa.Free;
  end;
end;
procedure TFormPrincipal.btnMaisClick(Sender: TObject);
begin
  var
  lCliente := TFormCliente.Create(nil);
  try
    lCliente.ShowModal;
    edtCodigoCliente.Text := lCliente.Codigo.ToString;
    edtNomeCliente.Text := lCliente.Nome
  finally
    lCliente.Free;
  end;
end;
procedure TFormPrincipal.Button2Click(Sender: TObject);
begin
  FController.dao(FController.entity.Cliente).Listar.DataSource(DataSource1);
end;
procedure TFormPrincipal.Button3Click(Sender: TObject);
begin
  var lDataSource := TDataSource.Create(nil);
  FController.dao(FController.entity.Produtos.SetCodigo(StrToInt(edtCodigoProduto.Text)))
    .ListarPorId.DataSource(lDataSource);
  try
    ClientDataSet1.Append;
    ClientDataSet1Codigo.AsInteger := StrToInt(edtCodigoProduto.Text);
    ClientDataSet1Descricao.AsString := lDataSource.DataSet.Fields[1].AsString;
    ClientDataSet1Unitario.AsCurrency := lDataSource.DataSet.Fields[2].AsCurrency;
    ClientDataSet1quantidade.AsInteger := StrToInt(edtQuantidade.Text);
    ClientDataSet1.Post;
    edtCodigoProduto.Clear;
    edtQuantidade.Clear;
    edtValorUnitario.Clear;
    edtCodigoProduto.SetFocus;
  finally
    lDataSource.Free;
  end;
end;
procedure TFormPrincipal.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  var lTotal := StrToCurrDef(String(Label1.Caption).Replace('R$',''),0) +
    ClientDataSet1Total.AsCurrency;
  Label1.Caption := FormatCurr('"R$ ",0.00', lTotal);
end;
procedure TFormPrincipal.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
  ClientDataSet1Total.AsCurrency := (ClientDataSet1Unitario.AsCurrency *
    ClientDataSet1quantidade.AsInteger);
end;
procedure TFormPrincipal.edtCodigoClienteExit(Sender: TObject);
begin
  if not(edtCodigoCliente.Text = '') then
  begin
    var
    lDataSource := TDataSource.Create(nil);
    try
      FController.dao(FController.entity.Cliente.SetCodigo
        (StrToInt(edtCodigoCliente.Text))).ListarPorId.DataSource(lDataSource);
      edtNomeCliente.Text := lDataSource.DataSet.FieldByName('NOME').AsString
    finally
      lDataSource.Free;
    end;
  end;
end;
procedure TFormPrincipal.edtCodigoClienteKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteNumeros(Key);
end;
procedure TFormPrincipal.edtCodigoProdutoExit(Sender: TObject);
begin
  if not (edtCodigoProduto.Text = '') then
  begin
    var lEntity := FController.entity.Produtos.SetCodigo(StrToInt(edtCodigoProduto.Text));
    var lDataSource := TDataSource.Create(nil);
    FController
      .dao(lEntity)
        .ListarPorId
        .DataSource(lDataSource);
    try
      if not lDataSource.DataSet.IsEmpty then
      begin
        edtQuantidade.SetFocus;
        edtValorUnitario.Text := FormatCurr('"R$ ",0.00', lDataSource.DataSet.Fields[2].AsCurrency);
        exit;
      end;
      raise Exception.Create('Produto não encontrado');
    finally
      lDataSource.Free;
    end;
  end;
end;
procedure TFormPrincipal.edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteNumeros(Key);
end;
procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  var lLogin := TFormLogin.Create(nil);
  try
    lLogin.ShowModal;
  finally
    lLogin.Free;
  end;
  FController := TController.NEw;
end;
procedure TFormPrincipal.SomenteNumeros(var aKey: Char);
begin
  if not(aKey in ['0' .. '9', #8]) then
    aKey := #0;
end;
end.
