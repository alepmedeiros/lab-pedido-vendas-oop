unit LabPedidoOOP.Model.Interfaces.Produto;

interface

type
  iProduto = interface

    function Codigo (aValue : Integer) : iProduto; overload;
    function Codigo : Integer; overload;

    function Descricao (aValue : string) : iProduto; overload;
    function Descricao : string; overload;

    function PrecoProduto (aValue : currency) : iProduto; overload;
    function PrecoProduto : currency; overload;

  end;

implementation

end.
