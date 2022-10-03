unit Model.Interfaces.ItensPedido;

interface

type
  iItensPedido =  interface

    function NumeroItemPedido (aValue : integer) : iItensPedido; overload;
    function NumeroItemPedido : integer; overload;

    function NumeroPedido (aValue : integer) : iItensPedido; overload;
    function NumeroPedido : integer; overload;

    function CodigoProduto (aValue : integer) : iItensPedido; overload;
    function CodigoProduto : integer; overload;

    function Quantidade (aValue : integer) : iItensPedido; overload;
    function Quantidade : integer; overload;

    function ValorUnitario (aValue : Currency) : iItensPedido; overload;
    function ValorUnitario : Currency; overload;

    function ValorTotal (aValue : Currency) : iItensPedido; overload;
    function ValorTotal : Currency; overload;

  end;

implementation

end.
