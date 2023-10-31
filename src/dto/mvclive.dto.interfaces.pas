unit mvclive.dto.interfaces;

interface

uses
  mvclive.model.dao.interfaces;

type
  iUsuarios = interface
    function SetCodigo(const Value: Integer): iUsuarios;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iUsuarios;
    function GetNome: String;
    function SetSenha(const Value: String): iUsuarios;
    function GetSenha: String;
    function Build: iDAO;
  end;

  iCliente = interface
    function SetCodigo(const Value: Integer): iCliente;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iCliente;
    function GetNome: String;
    function SetCidade(const Value: String): iCliente;
    function GetCidade: String;
    function SetEstado(const Value: String): iCliente;
    function GetEstado: String;
    function Build: iDAO;
  end;

  iProdutos = interface
    function SetCodigo(const Value: Integer): iProdutos;
    function GetCodigo: Integer;
    function SetDescricao(const Value: String): iProdutos;
    function GetDescricao: String;
    function SetPrecoVenda(const Value: Currency): iProdutos;
    function GetPrecoVenda: Currency;
    function Build: iDAO;
  end;

  iPedidos = interface
    function SetNumeroPedido(const Value: Integer): iPedidos;
    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function SetCodigoCliente(const Value: Integer): iPedidos;
    function GetCodigoCliente: Integer;
    function SetValorTotal(const Value: Currency): iPedidos;
    function GetValorTotal: Currency;
    function Build: iDAO;
  end;

  iPedidoItens = interface
    function SetId(const Value: Integer): iPedidoItens;
    function GetId: Integer;
    function SetNumeroPedido(const Value: Integer): iPedidoItens;
    function GetNumeroPedido: Integer;
    function SetCodigoProduto(const Value: Integer): iPedidoItens;
    function GetCodigoProduto: Integer;
    function SetQuantidade(const Value: Integer): iPedidoItens;
    function GetQuantidade: Integer;
    function SetValorUnitario(const Value: Currency): iPedidoItens;
    function GetValorUnitario: Currency;
    function SetValorTotal(const Value: Currency): iPedidoItens;
    function GetValorTotal: Currency;
    function Build: iDAO;
  end;

implementation

end.
