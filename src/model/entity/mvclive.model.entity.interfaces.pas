unit mvclive.model.entity.interfaces;

interface

type
  iUsuariosModel = interface
    function SetCodigo(const Value: Integer): iUsuariosModel;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iUsuariosModel;
    function GetNome: String;
    function SetSenha(const Value: String): iUsuariosModel;
    function GetSenha: String;
  end;

  iClienteModel = interface
    function SetCodigo(const Value: Integer): iClienteModel;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iClienteModel;
    function GetNome: String;
    function SetCidade(const Value: String): iClienteModel;
    function GetCidade: String;
    function SetEstado(const Value: String): iClienteModel;
    function GetEstado: String;
  end;

  iProdutosModel = interface
    function SetCodigo(const Value: Integer): iProdutosModel;
    function GetCodigo: Integer;
    function SetDescricao(const Value: String): iProdutosModel;
    function GetDescricao: String;
    function SetPrecoVenda(const Value: Currency): iProdutosModel;
    function GetPrecoVenda: Currency;
  end;

  iPedidosModel = interface
    function SetNumeroPedido(const Value: Integer): iPedidosModel;
    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function SetCodigoCliente(const Value: Integer): iPedidosModel;
    function GetCodigoCliente: Integer;
    function SetValorTotal(const Value: Currency): iPedidosModel;
    function GetValorTotal: Currency;
  end;

  iPedidoItensModel = interface
    function SetId(const Value: Integer): iPedidoItensModel;
    function GetId: Integer;
    function SetNumeroPedido(const Value: Integer): iPedidoItensModel;
    function GetNumeroPedido: Integer;
    function SetCodigoProduto(const Value: Integer): iPedidoItensModel;
    function GetCodigoProduto: Integer;
    function SetQuantidade(const Value: Integer): iPedidoItensModel;
    function GetQuantidade: Integer;
    function SetValorUnitario(const Value: Currency): iPedidoItensModel;
    function GetValorUnitario: Currency;
    function SetValorTotal(const Value: Currency): iPedidoItensModel;
    function GetValorTotal: Currency;
  end;

//  iEntity = interface
//    function Cliente: iCliente;
//    function Produtos: iProdutos;
//    function Pedidos: iPedidos;
//    function PedidoItens: iPedidoItens;
//    function Usuarios: iUsuarios;
//  end;

implementation

end.
