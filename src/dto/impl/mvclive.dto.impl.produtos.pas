unit mvclive.dto.impl.produtos;

interface

uses
  mvclive.dto.interfaces, mvclive.model.dao.interfaces,
  mvclive.model.entity.interfaces;

type
  TProdutos = class(TInterfacedObject, iProdutos)
  private
    FProdutos: iProdutosModel;

    constructor Create;
  public
    class function New: iProdutos;

    function SetCodigo(const Value: Integer): iProdutos;
    function GetCodigo: Integer;
    function SetDescricao(const Value: String): iProdutos;
    function GetDescricao: String;
    function SetPrecoVenda(const Value: Currency): iProdutos;
    function GetPrecoVenda: Currency;
    function Build: iDAO;
  end;

implementation

uses
  mvclive.model.entity.impl.produtos, mvclive.model.dao.impl.daogenerico;

{ TProdutos }

function TProdutos.Build: iDAO;
begin
  Result := TDAO.New(FProdutos);
end;

constructor TProdutos.Create;
begin
  FProdutos := TProdutosModel.New;
end;

function TProdutos.GetCodigo: Integer;
begin
  Result := FProdutos.GetCodigo;
end;

function TProdutos.GetDescricao: String;
begin
  Result := FProdutos.GetDescricao;
end;

function TProdutos.GetPrecoVenda: Currency;
begin
  Result := FProdutos.GetPrecoVenda;
end;

class function TProdutos.New: iProdutos;
begin
  Result := SElf.Create;
end;

function TProdutos.SetCodigo(const Value: Integer): iProdutos;
begin
  Result := SElf;
  FProdutos.SetCodigo(Value);
end;

function TProdutos.SetDescricao(const Value: String): iProdutos;
begin
  Result := SElf;
  FProdutos.SetDescricao(Value);
end;

function TProdutos.SetPrecoVenda(const Value: Currency): iProdutos;
begin
  Result := SElf;
  FProdutos.SetPrecoVenda(Value);
end;

end.
