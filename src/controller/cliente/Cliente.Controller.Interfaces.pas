unit Cliente.Controller.Interfaces;

interface

uses
  Model.Cliente,
  FireDAC.Comp.Client;

type
  iClienteController = interface
    procedure Salvar( aValue : TClienteModel );
    procedure Remover ( aValue : integer);
    procedure Editar( aValue : TClienteModel );

    function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;
  end;

implementation

end.
