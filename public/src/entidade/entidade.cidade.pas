unit entidade.cidade;

interface

uses
  interfaces.cidade, System.SysUtils;

type
  TCidade = class(TInterfacedObject, ICidade)
  private
    FUF: string;
    Fcodigo: Integer;
    Fcidade: string;
    procedure Setcidade(const Value: string);
    procedure Setcodigo(const Value: Integer);
    procedure SetUF(const Value: string);
  public
    constructor create(ANome, AUF: string); overload;
    constructor create(ACodigo: Integer; ANome, AUF: string); overload;
    destructor destroy; override;
    property codigo: Integer read Fcodigo write Setcodigo;
    property cidade: string read Fcidade write Setcidade;
    property UF: string read FUF write SetUF;

  end;

implementation

{ TCidade }

constructor TCidade.create(ANome, AUF: string);
begin
  Cidade := ANome;
  UF := AUF;
end;

constructor TCidade.create(ACodigo: Integer; ANome, AUF: string);
begin
  Codigo := ACodigo;
  Cidade := ANome;
  UF := AUF;
end;

destructor TCidade.destroy;
begin

  inherited;
end;

procedure TCidade.Setcidade(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('Nome é obrigatório');

  Fcidade := Value;
end;

procedure TCidade.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TCidade.SetUF(const Value: string);
begin
  if Value = '' then
    raise Exception.Create('UF é obrigatória');

  FUF := Value;
end;

end.
