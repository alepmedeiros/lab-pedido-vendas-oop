unit Model.Interfaces.Cliente;

interface

type
  iCliente = interface

    function Codigo (aValue : integer) : iCliente; overload;
    function Codigo : integer; overload;

    function Nome (aValue : string) : iCliente; overload;
    function Nome : string; overload;

    function Cidade (aValue : string) : iCliente; overload;
    function Cidade : string; overload;

    function UF (aValue : string) : iCliente; overload;
    function UF : string; overload;

  end;

implementation

end.

