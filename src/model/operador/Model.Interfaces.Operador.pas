unit Model.Interfaces.Operador;

interface

type
  iOperador = interface

    function Codigo (aValue : Integer) : iOperador; overload;
    function Codigo : Integer; overload;

    function Nome (aValue : string) : iOperador; overload;
    function Nome : string; overload;

  end;

implementation

end.
