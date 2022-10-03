unit Operador.Controller.Interfaces;

interface

uses
  Model.Operador;

type
  iOperadorController = interface
    procedure Salvar( aValue : TOperadorModel );
  end;

implementation

end.
