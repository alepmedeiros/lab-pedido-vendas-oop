unit entidade.item;

interface

uses
  interfaces.item, System.SysUtils;

type
  TItem = class(TInterfacedObject, IItem)
  private
    FcodigoProduto: Integer;
    Fcodigo: Integer;
    FvalorUnitario: double;
    FvalorTotal: double;
    Fquantidade: double;
    FnumeroPedido: Integer;
    procedure Setcodigo(const Value: Integer);
    procedure SetcodigoProduto(const Value: Integer);
    procedure SetnumeroPedido(const Value: Integer);
    procedure Setquantidade(const Value: double);
    procedure SetvalorTotal(const Value: double);
    procedure SetvalorUnitario(const Value: double);
  public
    constructor create(ACodigo, ANumeroPedido, ACodigoProduto: Integer; AQuantidade, AValorUnitario, AValorTotal: double); overload;
    constructor create(ANumeroPedido, ACodigoProduto: Integer; AQuantidade, AValorUnitario, AValorTotal: double); overload;
    destructor destroy; override;
    property codigo: Integer read Fcodigo write Setcodigo;
    property numeroPedido: Integer read FnumeroPedido write SetnumeroPedido;
    property codigoProduto: Integer read FcodigoProduto write SetcodigoProduto;
    property quantidade: double read Fquantidade write Setquantidade;
    property valorUnitario: double read FvalorUnitario write SetvalorUnitario;
    property valorTotal: double read FvalorTotal write SetvalorTotal;
  end;

implementation

{ TItem }

constructor TItem.create(ACodigo, ANumeroPedido, ACodigoProduto: Integer;
  AQuantidade, AValorUnitario, AValorTotal: double);
begin
  codigo := ACodigo;
  numeroPedido := ANumeroPedido;
  codigoProduto := ACodigoProduto;
  quantidade := AQuantidade;
  valorUnitario := AValorUnitario;
  valorTotal := AValorTotal;
end;

constructor TItem.create(ANumeroPedido, ACodigoProduto: Integer; AQuantidade,
  AValorUnitario, AValorTotal: double);
begin
  numeroPedido := ANumeroPedido;
  codigoProduto := ACodigoProduto;
  quantidade := AQuantidade;
  valorUnitario := AValorUnitario;
  valorTotal := AValorTotal;
end;

destructor TItem.destroy;
begin

  inherited;
end;

procedure TItem.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TItem.SetcodigoProduto(const Value: Integer);
begin
  if Value < 0 then
    raise Exception.Create('informe o produto');
  FcodigoProduto := Value;
end;

procedure TItem.SetnumeroPedido(const Value: Integer);
begin
  FnumeroPedido := Value;
end;

procedure TItem.Setquantidade(const Value: double);
begin
  if Value <= 0 then
    raise Exception.Create('Quantidade deve ser informada');
  Fquantidade := Value;
end;

procedure TItem.SetvalorTotal(const Value: double);
begin
  FvalorTotal := Value;
end;

procedure TItem.SetvalorUnitario(const Value: double);
begin
  if Value < 0 then
    raise Exception.Create('Valor unitário não pode ser negativo');
  FvalorUnitario := Value;
end;

end.
