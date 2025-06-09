unit view.pedido.cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, utils.enum.tipocadastro, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroPedido = class(TForm)
    lblCidade: TLabel;
    edtNomeCliente: TEdit;
    btnBuscaCliente: TButton;
    ilimage: TImageList;
    dbgrdCliente: TDBGrid;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    gbProduto: TGroupBox;
    edtDescricaoProduto: TEdit;
    Button1: TButton;
    edtValorUnitario: TEdit;
    edtQuantidade: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnIncluirItem: TButton;
    btnSalvar: TButton;
    btnFechar: TButton;
    FDMemTable1codigo: TIntegerField;
    FDMemTable1numeropedido: TIntegerField;
    FDMemTable1codigoproduto: TIntegerField;
    FDMemTable1quantidade: TCurrencyField;
    FDMemTable1valorunitario: TCurrencyField;
    FDMemTable1valortotal: TCurrencyField;
    FDMemTable1descricao: TStringField;
    FDMemTable1valor: TCurrencyField;
    btnExcluir: TButton;
    Label1: TLabel;
    lblTotal: TLabel;
    procedure btnIncluirItemClick(Sender: TObject);
    procedure btnBuscaClienteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgrdClienteDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Fnomecliente: string;
    FtipoEdicao: TTipoCadastro;
    FvalorTotal: double;
    Fdataemissao: TDateTime;
    Fcodigocliente: Integer;
    Fnumeropedido: Integer;
    FcodigoItem: Integer;
    FvalorItem: double;
    procedure Setcodigocliente(const Value: Integer);
    procedure Setdataemissao(const Value: TDateTime);
    procedure Setnomecliente(const Value: string);
    procedure Setnumeropedido(const Value: Integer);
    procedure SettipoEdicao(const Value: TTipoCadastro);
    procedure SetvalorTotal(const Value: double);
    function gravarPedido(AtualizaTotal: Boolean = true): Boolean;
    procedure carregarItens;
    function incluirItem: Boolean;
    procedure limpaItem;
    procedure editarItem;
    function excluirItem(ACodigo: Integer): Boolean;
    procedure SetcodigoItem(const Value: Integer);
    procedure SetvalorItem(const Value: double);
    { Private declarations }
  public
    { Public declarations }
    property tipoEdicao: TTipoCadastro read FtipoEdicao write SettipoEdicao;
    property numeropedido: Integer read Fnumeropedido write Setnumeropedido;
    property codigocliente: Integer read Fcodigocliente write Setcodigocliente;
    property nomecliente: string read Fnomecliente write Setnomecliente;
    property dataemissao: TDateTime read Fdataemissao write Setdataemissao;
    property valorTotal: double read FvalorTotal write SetvalorTotal;
    property codigoItem: Integer read FcodigoItem write SetcodigoItem;
    property valorItem: double read FvalorItem write SetvalorItem;
  end;

var
  frmCadastroPedido: TfrmCadastroPedido;

implementation

uses
  interfaces.controller.item, controller.item, view.cliente.consulta, view.produto.consulta,
  entidade.item, interfaces.controller.pedido, controller.pedido, entidade.pedido,
  view.mensagem, view.item.editar;

{$R *.dfm}

{ TfrmCadastroVenda }

procedure TfrmCadastroPedido.btnBuscaClienteClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaCliente, frmConsultaCliente);
  try
    if frmConsultaCliente.ShowModal = mrOk then
    begin
      codigocliente := frmConsultaCliente.codigo;
      nomecliente := frmConsultaCliente.Nome;
    end;
  finally
    FreeAndNil(frmConsultaCliente);
  end;
end;

procedure TfrmCadastroPedido.btnExcluirClick(Sender: TObject);
begin
  if FDMemTable1codigo.AsInteger > 0 then
  begin
    Application.CreateForm(TfrmMensagem, frmMensagem);
    try
      if frmMensagem.ShowModal = MrYes then
        excluirItem(FDMemTable1codigo.AsInteger);

        codigoItem := 0;
    finally
      FreeAndNil(frmMensagem)
    end;
  end;
end;

procedure TfrmCadastroPedido.btnIncluirItemClick(Sender: TObject);
begin
  if codigoItem > 0 then
  begin
    if gravarPedido then
    begin
      if incluirItem then
      begin
        limpaItem;
        carregarItens;
      end;
      tipoEdicao := tpEditar;
    end;
  end;
end;

procedure TfrmCadastroPedido.btnSalvarClick(Sender: TObject);
begin
  gravarPedido(False);
end;

procedure TfrmCadastroPedido.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaProduto, frmConsultaProduto);
  try
    if frmConsultaProduto.ShowModal = mrOk then
    begin
      codigoItem := frmConsultaProduto.codigo;
      edtDescricaoProduto.Text := frmConsultaProduto.descricao;
      valorItem := frmConsultaProduto.valor;
    end;
  finally
    FreeAndNil(frmConsultaProduto);
  end;
end;

procedure TfrmCadastroPedido.carregarItens;
var
  controllerPedidoItem: IControllerItem;
begin
  controllerPedidoItem := TControllerItem.Create;
  controllerPedidoItem.carregarPorPedido(FDMemTable1, numeropedido);
end;

procedure TfrmCadastroPedido.dbgrdClienteDblClick(Sender: TObject);
begin
  EditarItem;
end;

procedure TfrmCadastroPedido.editarItem;
var
  controllerItem: IControllerItem;
  LItem: TItem;
  LValorTotal: double;
  LQuantidade: double;
begin
  if FDMemTable1codigo.AsInteger > 0 then
  begin
    Application.CreateForm(TFrmEditarItem, FrmEditarItem);
    try
      LValorTotal := FDMemTable1valortotal.AsFloat;
      codigoItem := FDMemTable1codigo.AsInteger;

      FrmEditarItem.codigo := FDMemTable1codigo.AsInteger;
      FrmEditarItem.quantidade := FDMemTable1quantidade.AsFloat;
      FrmEditarItem.valorunitario := FDMemTable1valorunitario.AsFloat;
      FrmEditarItem.valorTotal := FDMemTable1valortotal.AsFloat;
      FrmEditarItem.descricao := FDMemTable1descricao.AsString;

      if FrmEditarItem.ShowModal = MrOk then
      begin
        valorTotal := valorTotal - LValorTotal;

        valorTotal := valorTotal + FrmEditarItem.quantidade * FrmEditarItem.valorunitario;

        controllerItem := TControllerItem.Create;
        try
          LItem := TItem.Create(FrmEditarItem.codigo, numeroPedido, codigoItem, FrmEditarItem.quantidade, FrmEditarItem.valorunitario, FrmEditarItem.quantidade * FrmEditarItem.valorunitario);
          try
            controllerItem.Editar(LItem);
            carregarItens;
            codigoItem := 0;
          finally
            FreeAndNil(LItem);
          end;
        except
          on e:exception do
          begin
            ModalResult := mrNone;
            ShowMessage(e.Message);
          end;
        end;
      end;
    finally
      FreeAndNil(FrmEditarItem);
    end;
  end;
end;

function TfrmCadastroPedido.excluirItem(ACodigo: Integer): Boolean;
var
  controllerItem: IControllerItem;
  LValorTotal: double;
begin
  result := False;
  try
    LValorTotal := FDMemTable1valortotal.AsFloat;

    controllerItem := TControllerItem.Create;
    try
      result := controllerItem.Excluir(ACodigo);

      if result then
        valorTotal := valorTotal - LValorTotal;

      carregarItens;
    except
      on e:exception do
      begin
        ModalResult := mrNone;
        ShowMessage(e.Message);
      end;
    end;
  finally
    FreeAndNil(FrmEditarItem);
  end;
end;

procedure TfrmCadastroPedido.FormShow(Sender: TObject);
begin
  if tipoEdicao = tpVisualizar then
  begin
    gbProduto.Enabled := False;
    btnSalvar.Visible := False;
    btnBuscaCliente.Enabled := False;
    dbgrdCliente.Enabled := False;
  end;
end;

function TfrmCadastroPedido.gravarPedido(AtualizaTotal: Boolean): Boolean;
var
  controllerPedido: IControllerPedido;
  LPedido: TPedido;
begin
  controllerPedido := TControllerPedido.Create;
  result := false;

  if AtualizaTotal then
    valorTotal := valorTotal + StrToFloatDef(edtQuantidade.Text, 0) * StrToFloatDef(edtValorUnitario.Text, 0);

  case tipoEdicao of
    tpInserir:
      begin
        try
          LPedido := TPedido.Create(codigoCliente, valorTotal, now);
          try
            result := controllerPedido.Cadastrar(LPedido);
            numeropedido := LPedido.numeropedido;
          finally
            FreeAndNil(LPedido);
          end;
        except
          on e:exception do
          begin
            ModalResult := mrNone;
            ShowMessage(e.Message);
          end;
        end;
      end;
    tpEditar:
      begin
        try
          LPedido := TPedido.Create(numeroPedido, codigoCliente, valorTotal);
          try
            result := controllerPedido.Editar(LPedido);
          finally
            FreeAndNil(LPedido);
          end;
        except
          on e:exception do
          begin
            ModalResult := mrNone;
            ShowMessage(e.Message);
          end;
        end;
      end;
  end;
end;

function TfrmCadastroPedido.incluirItem: Boolean;
var
  controllerItem: IControllerItem;
  LItem: TItem;
  LValorTotal: double;
begin
  controllerItem := TControllerItem.Create;
  result := false;
  LValorTotal := StrToFloatDef(edtQuantidade.Text, 0) * StrToFloatDef(edtValorUnitario.Text, 0);

  try
    LItem := TItem.Create(numeroPedido, codigoItem, StrToFloatDef(edtQuantidade.Text, 0), StrToFloatDef(edtValorUnitario.Text, 0), LValorTotal);
    try
      result := controllerItem.Cadastrar(LItem);

    finally
      FreeAndNil(LItem);
    end;
  except
    on e:exception do
    begin
      ModalResult := mrNone;
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TfrmCadastroPedido.limpaItem;
begin
  codigoItem := 0;
  edtDescricaoProduto.Text := '';
  edtQuantidade.Text := '';
  edtValorUnitario.Text := '';
end;

procedure TfrmCadastroPedido.Setcodigocliente(const Value: Integer);
begin
  Fcodigocliente := Value;
end;

procedure TfrmCadastroPedido.SetcodigoItem(const Value: Integer);
begin
  FcodigoItem := Value;
end;

procedure TfrmCadastroPedido.Setdataemissao(const Value: TDateTime);
begin
  Fdataemissao := Value;
end;

procedure TfrmCadastroPedido.Setnomecliente(const Value: string);
begin
  Fnomecliente := Value;
  edtNomeCliente.Text := Value;
end;

procedure TfrmCadastroPedido.Setnumeropedido(const Value: Integer);
begin
  Fnumeropedido := Value;
  carregarItens;
end;

procedure TfrmCadastroPedido.SettipoEdicao(const Value: TTipoCadastro);
begin
  FtipoEdicao := Value;
end;

procedure TfrmCadastroPedido.SetvalorItem(const Value: double);
begin
  FvalorItem := Value;
  edtValorUnitario.Text := FormatFloat('#,##0.00', Value);
end;

procedure TfrmCadastroPedido.SetvalorTotal(const Value: double);
begin
  FvalorTotal := Value;
  lblTotal.Caption := FormatFloat('#,##0.00', Value);
end;

end.
