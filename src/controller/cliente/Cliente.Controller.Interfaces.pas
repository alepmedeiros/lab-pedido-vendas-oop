unit Cliente.Controller.Interfaces;

interface

uses
  Model.Cliente,
  FireDAC.Comp.Client;

type
  iClienteController = interface
    procedure Salvar( aValue : TClienteModel ); overload;
    procedure Salvar( aNome, aCidade, aUF : string ); overload;

    procedure Editar( aValue : TClienteModel ); overload;
    procedure Editar( aCodigo, aNome, aCidade, aUF : string ); overload;

    procedure Remover ( aValue : integer);

    function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;
  end;

implementation

end.
