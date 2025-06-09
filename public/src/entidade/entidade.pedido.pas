unit entidade.pedido;

interface

uses
  interfaces.pedido,
  entidade.cliente;

type
  TPedido = class(TInterfacedObject, IPedido)
  private
    Fcliente: TCliente;
    Fvalortotal: double;
    Fdataemissao: TDateTime;
    Fnumeropedido: Integer;
    procedure Setcliente(const Value: TCliente);
    procedure Setdataemissao(const Value: TDateTime);
    procedure Setnumeropedido(const Value: Integer);
    procedure Setvalortotal(const Value: double);
  public
    constructor create(ANumeropedido, ACodigoCliente: Integer; AValorTotal: double); overload;
    constructor create(ACodigoCliente: Integer; AValorTotal: double; ADataEmissao: TDateTime); overload;
    destructor destroy; override;
    property numeropedido: Integer read Fnumeropedido write Setnumeropedido;
    property cliente: TCliente read Fcliente write Setcliente;
    property dataemissao: TDateTime read Fdataemissao write Setdataemissao;
    property valortotal: double read Fvalortotal write Setvalortotal;

  end;

implementation

{ TPedido }

constructor TPedido.create(ANumeropedido, ACodigoCliente: Integer;
  AValorTotal: double);
begin
  numeroPedido := ANumeropedido;
  cliente := TCliente.create;
  cliente.Codigo := ACodigoCliente;
end;

constructor TPedido.create(ACodigoCliente: Integer; AValorTotal: double; ADataEmissao: TDateTime);
begin
  cliente := TCliente.Create;
  cliente.Codigo := ACodigoCliente;
  valortotal := AValorTotal;
  dataemissao := ADataEmissao;
end;

destructor TPedido.destroy;
begin
  cliente.Free;
  inherited;
end;

procedure TPedido.Setcliente(const Value: TCliente);
begin
  Fcliente := Value;
end;

procedure TPedido.Setdataemissao(const Value: TDateTime);
begin
  Fdataemissao := Value;
end;

procedure TPedido.Setnumeropedido(const Value: Integer);
begin
  Fnumeropedido := Value;
end;

procedure TPedido.Setvalortotal(const Value: double);
begin
  Fvalortotal := Value;
end;

end.
