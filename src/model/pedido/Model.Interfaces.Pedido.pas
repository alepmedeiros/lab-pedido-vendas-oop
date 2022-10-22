unit Model.Interfaces.Pedido;

interface

type
  iPedido = interface

    function NumeroPedido (aValue : Integer) : iPedido; overload;
    function NumeroPedido : Integer; overload;

    function CodigoCliente (aValue : Integer) : iPedido; overload;
    function CodigoCliente : Integer; overload;

    function DataEmissao (aValue : TDateTime) : iPedido; overload;
    function DataEmissao : TDateTime; overload;

    function ValorTotal (aValue : currency) : iPedido; overload;
    function ValorTotal : currency; overload;

    function Status (aValue : string) : iPedido; overload;
    function Status : string; overload;

  end;

implementation

end.
