unit entidade.cliente;

interface

uses
  interfaces.cliente, entidade.cidade, System.Generics.Collections,
  System.SysUtils;

type
  TCliente = class(TInterfacedObject, ICliente)
  private
    FCodigo: integer;
    FNome: String;
    FCidade: TCidade;
    procedure SetCidade(const Value: TCidade);
    procedure SetCodigo(const Value: integer);
    procedure SetNome(const Value: String);
  public

    constructor create(Anome: string; AcodigoCidade: Integer); overload;
    constructor create(Acodigo: Integer; Anome: string; AcodigoCidade: Integer); overload;
    destructor destroy; override;
    property Codigo: integer read FCodigo write SetCodigo;
    property Nome: String read FNome write SetNome;
    property Cidade: TCidade read FCidade write SetCidade;
  end;

implementation

{ TCliente }

constructor TCliente.create(Anome: string; AcodigoCidade: Integer);
begin
  Nome := Anome;
  Cidade := TCidade.Create;

  if AcodigoCidade = 0 then
    raise Exception.Create('Cidade é obrigatória');

  Cidade.codigo := AcodigoCidade;
end;

constructor TCliente.create(Acodigo: Integer; Anome: string;
  AcodigoCidade: Integer);
begin
  Codigo := Acodigo;
  Nome := Anome;
  Cidade := TCidade.Create;

  if AcodigoCidade = 0 then
    raise Exception.Create('Cidade é obrigatória');

  FCidade.codigo := AcodigoCidade;
end;

destructor TCliente.destroy;
begin
  FCidade.Free;
  inherited;
end;

procedure TCliente.SetCidade(const Value: TCidade);
begin
  FCidade := Value;
end;

procedure TCliente.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  if Value = '' then
    raise Exception.Create('Nome é obrigatório');

  FNome := Value;
end;

end.
