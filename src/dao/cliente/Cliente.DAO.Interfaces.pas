unit Cliente.DAO.Interfaces;

interface

uses
  Model.Cliente,
  FireDAC.Comp.Client,
  Data.DB;

type
  iClienteDAO = interface
    procedure Salvar( aValue : TClienteModel );
    procedure Remover ( aValue : integer);
    procedure Editar( aValue : TClienteModel );

    function RecuperaPorCodigo(aValue: integer; aColuna: string): string;
    function VerificaSeExiste(aValue : integer ) : Boolean;
    function RecuperaTodos : TFDMemTable ;

  end;

implementation

end.
