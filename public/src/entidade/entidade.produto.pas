unit entidade.produto;

interface

uses
  interfaces.produto, System.SysUtils;

type
  TProduto = class(TInterfacedObject, IProduto)
  private
    Fvalor: double;
    Fdescricao: string;
    Fcodigo: Integer;
    procedure Setcodigo(const Value: Integer);
    procedure Setdescricao(const Value: string);
    procedure Setvalor(const Value: double);
  public
    constructor create(ADescricao: string; AValor: double); overload;
    constructor create(ACodigo: integer; ADescricao: string; AValor: double); overload;
    destructor destroy; override;
    property codigo: Integer read Fcodigo write Setcodigo;
    property descricao: string read Fdescricao write Setdescricao;
    property valor: double read Fvalor write Setvalor;

  end;

implementation

{ TProduto }

constructor TProduto.create(ACodigo: integer; ADescricao: string;
  AValor: double);
begin
  codigo := ACodigo;
  descricao := ADescricao;
  valor := AValor;
end;

constructor TProduto.create(ADescricao: string; AValor: double);
begin
  descricao := ADescricao;
  valor := AValor;
end;

destructor TProduto.destroy;
begin

  inherited;
end;

procedure TProduto.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TProduto.Setdescricao(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('Descrição é obrigatória');
  Fdescricao := Value;
end;

procedure TProduto.Setvalor(const Value: double);
begin
  if Value < 0 then
    raise Exception.Create('Não é possível informar valor negativo');
  Fvalor := Value;
end;

end.
