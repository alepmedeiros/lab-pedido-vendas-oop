unit mvclive.model.entity.impl.produtos;

interface

uses
  mvclive.utils.impl.atributos,
  mvclive.model.entity.interfaces;

type
  [Tabela('PRODUTOS')]
  TProdutosModel = class(TInterfacedObject, iProdutosModel)
  private
    [Campo('CODIGO'), PK]
    FCodigo: Integer;
    [Campo('DESCRICAO')]
    FDescricao: String;
    [Campo('PRECOVENDA')]
    FPrecoVenda: Currency;
  public
    class function New: iProdutosModel;
    function SetCodigo(const Value: Integer): iProdutosModel;
    function GetCodigo: Integer;
    function SetDescricao(const Value: String): iProdutosModel;
    function GetDescricao: String;
    function SetPrecoVenda(const Value: Currency): iProdutosModel;
    function GetPrecoVenda: Currency;
  end;

implementation

function TProdutosModel.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TProdutosModel.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TProdutosModel.GetPrecoVenda: Currency;
begin
  Result := FPrecoVenda;
end;

class function TProdutosModel.New: iProdutosModel;
begin
  Result := Self.Create;
end;

function TProdutosModel.SetCodigo(const Value: Integer): iProdutosModel;
begin
  Result := Self;
  FCodigo := Value;
end;

function TProdutosModel.SetDescricao(const Value: String): iProdutosModel;
begin
  Result := Self;
  FDescricao := Value;
end;

function TProdutosModel.SetPrecoVenda(const Value: Currency): iProdutosModel;
begin
  Result := Self;
  FPrecoVenda := Value;
end;

end.
