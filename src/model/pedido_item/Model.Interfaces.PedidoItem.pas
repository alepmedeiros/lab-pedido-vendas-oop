unit Model.Interfaces.PedidoItem;

interface

type
  iPedidoItem =  interface

    function NumeroItemPedido (aValue : integer) : iPedidoItem; overload;
    function NumeroItemPedido : integer; overload;

    function NumeroPedido (aValue : integer) : iPedidoItem; overload;
    function NumeroPedido : integer; overload;

    function CodigoProduto (aValue : integer) : iPedidoItem; overload;
    function CodigoProduto : integer; overload;

    function Quantidade (aValue : integer) : iPedidoItem; overload;
    function Quantidade : integer; overload;

    function ValorUnitario (aValue : Currency) : iPedidoItem; overload;
    function ValorUnitario : Currency; overload;

    function ValorTotal (aValue : Currency) : iPedidoItem; overload;
    function ValorTotal : Currency; overload;

    function StatusPedido (aValue : String) : iPedidoItem; overload;
    function StatusPedido : string; overload;

  end;

implementation

end.
